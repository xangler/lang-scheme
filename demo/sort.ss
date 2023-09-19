(define (println f)
    (begin
        (display f)
        (newline)
    )
)
(println (map (lambda (x) (* 2 x)) '(1 2 3)))
(println (filter (lambda (x) (< 2 x)) '(1 2 3)))
(println (append '(1 2) '(2 3) '(3 4)))

(define (list-size x)
    (if (or (null? x) (not (list? x))) 0
        (+ 1 (list-size (cdr x))))
)
(println (list-size '(1 3 6 2)))

(define (list-max x m)
    (if (or (null? x) (not (list? x))) m
        (let ([n (car x)])
            (if (> m n)
                (list-max (cdr x) m)
                (list-max (cdr x) n))))
)
(println (list-max '(1 4 2 8 3) 0))

(define (list-sort x)
    (if (or (null? x) (not (list? x))) '()
        (let ([m (car x)])
            (let ([e (filter (lambda (n) (eqv? m n)) x)]
                  [s (filter (lambda (n) (> m n)) x)]
                  [b (filter (lambda (n) (< m n)) x)])
                (append (list-sort s) e (list-sort b)))))
)
(println (list-sort '(3 2 8 5 9)))
(exit)