<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <title>Gestsol</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>

    <!--  <link rel="stylesheet" href="assets/css/style.css"> -->
    <link rel="stylesheet" href="assets/css/loader-style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/signin.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/minus.png">
</head>

<body >
    <!--div id="awwwards" class="right black"><a href="http://www.awwwards.com/best-websites/apricot-navigation-admin-dashboard-template" target="_blank">best websites of the world</a-->
    </div>

    <!-- Preloader -->
    <div id="preloader">
        <div id="status">&nbsp;</div>
    </div>

    <div class="container">
        <div class="" id="login-wrapper">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 text-center">
                    <div id="logo-login">
                        <h1><img src="assets/img/logo900x310.png" width="200"></h1>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                <p style="text-align:center; color:#fff;" id="txt1">Ingrese sus credenciales para iniciar sesión</p>
                    <div class="account-box">

                        <form role="form" action="return false;">
                            <div class="form-group" id="fuser">
                                <input type="text" id="inputUsernameEmail" class="form-control" placeholder="Ingrese usuario">
                            </div>
                            <div class="form-group" id="fpass">
                                <input type="password" id="inputPassword" class="form-control" placeholder="Ingrese contraseña">
                            </div>
 
                            <button id="doLogin" class="btn btn btn-primary btn-block pull-right">
                                Ingresar
                            </button>
                        </form>

                        <a class="forgotLnk" href="dashboard.html"></a>

                        <div class="row-block">
                            <div class="row">
                                <div class="col-md-12 row-block">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>





        <div style="text-align:center;margin:0 auto;">
            <h5 style="color:#76838f; font-weight:300;">Esta plataforma está desarrollada, para trabajar de manera óptima con:<br> 
            
                            <img src="assets/img/chrome.png" width="20" />
                            Google Chrome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img src="assets/img/safari.png" width="20" />
                            Safari
            
            </h5>
            <h6 style="color:#76838f; font-weight:300;">&copy; Gestsol 2016 - Todos los derehos reservados.</h6>
        </div>
    </div>
    <div background="black" id="test1" class="gmap3"></div>



    <!--  END OF PAPER WRAP -->




    <!-- MAIN EFFECT -->
    <script type="text/javascript" src="assets/js/preloader.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="assets/js/app2.js"></script>
    <script type="text/javascript" src="assets/js/load.js"></script>
    <script type="text/javascript" src="assets/js/main.js"></script>

<script src="http://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script>
<script type="text/javascript" src="assets/js/map/gmap3.js"></script>
   

    <script type="text/javascript">

        $(function () {
        
            $('form').submit(false);

            $('#doLogin').on('click', function () {
                var user = $('#inputUsernameEmail').val().toLowerCase();
                var pass = $('#inputPassword').val().toLowerCase();
                $.post('classes/login.php', {
                    op: 'Login',
                    user: user,
                    pass: pass
                }, function (data) {
                    if(data[0].estado){
                        $('#fuser').removeClass('has-error');
                        $('#fpass').removeClass('has-error')
                        $('#fuser').addClass('has-success');
                        $('#fpass').addClass('has-success');
                        location.href="./dashboard.html";
                    }
                    else {
                        var user = $('#inputUsernameEmail').val('');
                        var pass = $('#inputPassword').val('');
                        $('#inputUsernameEmail').focus();
                        $('#fuser').addClass('has-error');
                        $('#fpass').addClass('has-error');
                         
                    }
                    
                },'json');

            });

            //temas del mapa background

            $("#test1").gmap3({
                marker: {
                    latLng: [-33.4163492,-70.6124916],
                    options: {
                        draggable: true
                    },
                    events: {
                        dragend: function (marker) {
                            $(this).gmap3({
                                getaddress: {
                                    latLng: marker.getPosition(),
                                    callback: function (results) {
                                        var map = $(this).gmap3("get"),
                                            infowindow = $(this).gmap3({
                                                get: "infowindow"
                                            }),
                                            content = results && results[1] ? results && results[1].formatted_address : "no address";
                                        if (infowindow) {
                                            infowindow.open(map, marker);
                                            infowindow.setContent(content);
                                        } else {
                                            $(this).gmap3({
                                                infowindow: {
                                                    anchor: marker,
                                                    options: {
                                                        content: content
                                                    }
                                                }
                                            });
                                        }
                                    }
                                }
                            });
                        }
                    }
                },
                map: {
                    options: {
                        zoom: 15,
                        disableDefaultUI: true
                    }
                }
            });
 });
    </script>




</body>

</html>