Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B83C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QA9fXt6iW3iv41wst4sIpkLmpsfTQfiB6NSTaz4f3Lo=; b=orfLoC/SLywuA88+pYVAX99D2R
	6B3oymL9OHgDUBov2YJrSI7A+ZCL4KO/3t9Mqlv1bPVRFGzYPTO7en/6+70f1wIihjFl5uj2KstuE
	zzIvjXwcSlvWSB1RXqAPhQf+qii5nxwYeW8vKK0yI+zCQH+hJLaOyO5BD8ZKk90Dju21yhNpop7Ft
	GzXD2cs7bjgXJw3yy/umk3xZjvrrVtUoYM9xHLQz/V6zJ44YkdRQwB0Z3rrSPBU9kyqzI6Tpo4CdA
	6+vdsgazMjGmUPVWDXZYlHBkuycqjZoaahlBGKj3KbWhw+UUxA7jRcX/OCJbQNSzhtgvmSeaj7SiJ
	7ogToJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HQB-00000001wdA-18d4;
	Sat, 19 Apr 2025 23:16:27 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnQ-00000001sqW-2NsO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:25 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54b166fa41bso3305418e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102183; x=1745706983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QA9fXt6iW3iv41wst4sIpkLmpsfTQfiB6NSTaz4f3Lo=;
        b=nsAv27XY1rhKti2EthDzctMhzF/um1rqp7fIgZB+PR2Hv6V9rsqcr+Cn2mbcUS5QI7
         nbSEZfDTt607r1zmj8G/NiLfmuaovHXzSjp7aKfTRz8PYpwVILM0cYtTtznN83NHINEF
         +XQsMH7oQWwp/Ebff+nUilW/KrydMPJlKM3jBlrHZwZJOx05wA91NwRMm25Fc65DleUd
         JeSYMG+yD/prxf7XrQm9GRlbhX2y6MH17fSA36GaN4ziJDbfrLFGw4AJw5X5OeXaKzOt
         MEGL75Z7sQfAodIFKPsUfivAbofr78aNIB43kUdbJ88nI1/ikJcYyGU44ks3RqkPphAQ
         dx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102183; x=1745706983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA9fXt6iW3iv41wst4sIpkLmpsfTQfiB6NSTaz4f3Lo=;
        b=f6XE26yzvLqo48eQUtMU97LUEerRgcC0KjBqDwY9eHF0olaXF5mnv0bzl5TEhmUPv1
         td4IDlQonOyijijeJbCZ+rFBvAo3l22v2z1ZCsrWapKmWmdV6sY/o6aEoDqWJdQcm/Y6
         z3g6pDCa9bQnOwARLCzVJIG3xaADZX4AjQYtQHTYULd86HHlaONVFjw22jhIi8d2on97
         otYrEVrTocd+L097ReiulrMsYv8ixQX9Eb1vNsMnGDJIjdVf2HMy+8eYdG9MyvmMEhAF
         PNJuo+KqjiGvbYU8GZpTKbA3WR62FeVUdutLRNu25VSrPJhjkFBRAdHhwZRW482eedgU
         pciQ==
X-Gm-Message-State: AOJu0YzF8JNz1IAiRAwvH67O8ptABOjHmz9rQUcCAlpOHve1AoPRUdUY
	ZamA92azRE2LDpigZ216IQTMQ+wBkL11j3TxBDNwASo6DoCCvJJMfGXr3HWI3+c=
X-Gm-Gg: ASbGncucG3ys+zPBXYKoU3hWvLxFqcxHMjS8zy/iCIUqdjRz1LE3u4afvD4PNmGDNvL
	hCCIqcFVe6NTUKr81+J1ga9zwn4WBNAJU5DpX78c5oatH8bLkXyCPT5V3Dmq2VftyIw86xxGmgd
	8bUj7JYvK3WFlfQ2oZhmsXvERn/FPYVwHxnot7qpDBgQpZQbaOEPhTwMQRswSaMIhW/xuUUtPd+
	CvFFKxT3sOrMPlJ2PHawzJVmEj5KMHpKpbWdcst2YIDyxDoAwzdlEW0H3SKFT26uwL/1TQnSgRj
	2f9G5YMUM5sigkqg+gY0ykGrfuq1AIbs99KHMqEYyosejmnxuxg=
X-Google-Smtp-Source: AGHT+IF2zPQ/WKqF3wNtgpQmZ4+Rq+76q40tDwICNvok0//cFZwaJDMB36r2Jqc7UyoA/kUxnRmHQA==
X-Received: by 2002:a05:6512:b0f:b0:54d:65cb:6c28 with SMTP id 2adb3069b0e04-54d6e61a356mr1780325e87.9.1745102183076;
        Sat, 19 Apr 2025 15:36:23 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:22 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:07 +0200
Subject: [PATCH v6 20/31] ARM: entry: Untangle ret_fast_syscall/to_user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-20-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_153624_623078_939E66DC 
X-CRM114-Status: GOOD (  13.01  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The return to userspace is a bit hard to follow. To prepare
the ground for further refactorings we rewrite the functions
to ret_fast_syscall and ret_to_user are mostly stand-alone
symbols.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index d27e34d7e97a079d62e7b778cf7cf97c302e4763..ece9215717143427de7572a18a6dbe620a9193e9 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -44,20 +44,23 @@ ret_fast_syscall:
 	bl	syscall_exit_to_user_mode
 	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
 	movs	r1, r1, lsl #16
-	beq	no_work_pending
- UNWIND(.fnend		)
-ENDPROC(ret_fast_syscall)
-
-	/* Slower path - fall through to work_pending */
+	beq	2f
 
 	tst	r1, #_TIF_SYSCALL_WORK
-	beq	slow_work_pending
+	beq	1f
+
 	b	ret_to_user
 
-slow_work_pending:
-	mov	r0, sp				@ 'regs'
+1:	mov	r0, sp				@ 'regs'
 	bl	do_work_pending
-	b	no_work_pending
+
+2:	asm_irqentry_exit_to_user_mode
+
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs
+ UNWIND(.fnend		)
 ENDPROC(ret_fast_syscall)
 
 /*
@@ -74,7 +77,9 @@ ENTRY(ret_to_user)
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
-	bne	slow_work_pending
+	beq	no_work_pending
+	mov	r0, sp				@ 'regs'
+	bl	do_work_pending
 no_work_pending:
 	asm_irqentry_exit_to_user_mode
 

-- 
2.49.0


