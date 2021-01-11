extends KinematicBody2D

const MAX_SPEED = 100;
const ACCELERATION = 25;
const FRICTION = 20;
var velocity = Vector2.ZERO;

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	var input_vector = Vector2.ZERO;
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
	
	input_vector = input_vector.normalized();
	
	if input_vector != Vector2.ZERO: 
		velocity += input_vector * ACCELERATION * delta;
		velocity = velocity.clamped(MAX_SPEED * delta);
	else: velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta);
	
#	if Input.is_action_pressed("ui_right"):
#		velocity.x = speed;
#	elif Input.is_action_pressed("ui_left"): 
#		velocity.x = -speed;
#	else:
#		velocity.x = 0;
#
#	if Input.is_action_pressed("ui_up"):
#		velocity.y = -speed;
#	elif Input.is_action_pressed("ui_down"): 
#		velocity.y = speed;
#	else:
#		velocity.y = 0;
#	pass
	
	move_and_collide(velocity)
