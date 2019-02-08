<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Chat</title>
    <style>
      .chat_log{ width: 95%; height: 200px; }
      .name{ width: 10%; }
      .message{ width: 70%; }
      .chat{ width: 10%; }
    </style>
  </head>
  <body>
    <div>
      <textarea id="chatLog" class="chat_log" readonly></textarea>
      <textarea id="login-info" class="login-info" readonly></textarea>

    </div>
    <form id="chat">
      <script>
      //var name=request.getParameter('id');

      console.log(name);
      </script>
      <input id="id" class='name' type="text" readonly>
      <input id="message" class="message" type="text">
      <input type="submit" class="chat" value="chat"/>
    </form>
    <div id="box" class="box">
    <script src="/socket.io/socket.io.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.js"></script>
    <script>
      var socket = io();
      $('#chat').on('submit', function(e){
        socket.emit('send message', $('#name').val()+": "+$('#message').val());
        $('#message').val("");
        $("#message").focus();
        e.preventDefault();
      });
      socket.on('receive message', function(msg){
        $('#chatLog').append(msg+'\n');
        $('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
      });

      socket.on('login-info',function(name){
        $('#login-info').append(name+'\n');
        $('#login-info').scrollTop($('#login-info')[0].scrollHeight);
      }
      //$('%name').on('login-info',function(e){
        //socket.emit('login-info',$('#name').val());
      //});
      //socket.on('change name', function(name){
      //  $('#name').val(name);
      //});

    </script>
  </body>
</html>
