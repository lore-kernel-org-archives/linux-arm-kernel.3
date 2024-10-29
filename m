Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A0BD2AB1F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDl9iLJ9IcIQCUiDPdY7G7jOst94Sq4L5J+um8W/x4k=; b=sQLxQujrjpCPbjy++0VymxTlKU
	mXNJipT9s66vl2lJ8Z+3uN6nLbCYkLaW4dCO8sizQZHH0mB4z8LbAjutnh+0wAmzuthTP8b5Wbuxt
	lbnVRN4pg+ToXRjsdv7j77rd+7br5b4M4giFBG3ODaaN6/1C7ULwDMZB2uRLOn1ikwVcpPLdeplMF
	jEjEzj+sMiohkOsECltvhHwEN+dADcJ5d+51ZmRFlHaemFqanGj+Ia8cwmumUlvuz878RddXy2AsX
	4xbf+oXTQN9gplQFMv6JFlxn6WyxDnu5UnxDRksZY8aImnjUBBCFVL3AiKzSTtoeWfIKTBydkIGND
	enWUiPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kIP-0000000EDo4-3874;
	Tue, 29 Oct 2024 11:21:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqT-0000000E7JB-166N
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 10:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TDl9iLJ9IcIQCUiDPdY7G7jOst94Sq4L5J+um8W/x4k=; b=TcImbAd94WcaFyjyZoS8uXHqSE
	sbtjcmx5IMJ44OvKbjU2oUdt39iwGtUTSy7UzA6JMSELY3XBfGLDfWrOeC+QLXbAdLBq69wbgiR0P
	1Ry8fF1S1XpwW8gEsAeh1H5dMxQk7QzHXlY19dG3N/OI+WJb/RbmWo+w6EY6qjEzqaU3F5ObaLwEe
	F7O1sGxE4HBDgJZBO6z/j4VJhYr6+RBv/IfrrJZQeu8FQ9DGGOtvGi/TCB2rpku332PByeLwNzlOr
	asLwu2GS70Bq1kNl44Keh3kQj1eIIU+kvoEM0AoqzruCUL8cj7cZyd0+IjaUOvwLliF7t+dLuRN4J
	o9ssxDaw==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqP-00000009sXY-2FEQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:03 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539fe02c386so5766361e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199174; x=1730803974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDl9iLJ9IcIQCUiDPdY7G7jOst94Sq4L5J+um8W/x4k=;
        b=HS81v0x3E04bR41TYaIjqtYuPmX6ucDAYoDWUwWJu/2lBmn8/ZLJCF7HL7e8h1mjp+
         3T/57nNnuTZ+M/s5NmKbKWiojupxuWPwJFrRFoAv6EcOqSt27Sw9Rf2h0NzFCzMYb70d
         RdvVKApmhx4JzSIqGHV3p3Xu1r52WFkrO7WsENSJR8PegcY2lhX0D23UKtlfOs8Ylj90
         SynHFkue9HqnWyBHvwJDlMDe1U7+pJae/jbqoOMFTIp4VOgAtLaHV8VbHE3FZigdXhGo
         anC95HjoZT8WYhl9nX10eQ4ec0bqG1f9uH4e8zu/9K3ARUUY0ECbb02+fMXSz7DbqIYe
         SULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199174; x=1730803974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDl9iLJ9IcIQCUiDPdY7G7jOst94Sq4L5J+um8W/x4k=;
        b=Kcd5Etw4ugzvqzhKxbinKSAwOj1yj2FsWTgziaG+CrPjeBho5wQfTA3xYvsNXY88qN
         XqlJPNx4l2hgJs1FikEEO5Q+MujUGxFG+L1JIo1ObiqvgoSfPtUU/UA7gdbJ4h6ZkA9T
         nBTwnEEJv0yYqlnPQQ7Y7pgo7l5Z9NfKgU35Tp2Xwtjx3Il/tRN91md6w0aQRzpFdvcR
         hU+wnesMeKTUx2lkxpuULYo1vgUfZ/Qa0/OgzsZAP/5AZy1JZIoTSrsk8OHhsyZeU9xS
         arcTj3OP27US9MX/poecyYmi7+TGZEzRM+HhI5nYzIw3tIomwoa6cyClftH9Hi4YTXlK
         2MFA==
X-Gm-Message-State: AOJu0Yw+DXjqEbrQlvBAIC8ihpDWGTw+85qST/TIvmvaY6cY0m5m0IFi
	4vrJT8zSq8MKEbaY5BytZn12IO+p74rHRB4jy665uIs2K2KUeE/O87WcUqUalKc=
X-Google-Smtp-Source: AGHT+IGfHm6faFqK8jdHk5n5plXPyzGC/TcHbEJEFWbtB3+ViWXDca9EpWy+Qw2QzBfYVVQTkU/ogQ==
X-Received: by 2002:a05:6512:2346:b0:539:e873:6d4 with SMTP id 2adb3069b0e04-53b4947e476mr663973e87.22.1730199173807;
        Tue, 29 Oct 2024 03:52:53 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:52:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:44 +0100
Subject: [PATCH RFC v2 04/28] ARM: process: Rewrite ret_from_fork i C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-4-573519abef38@linaro.org>
References: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
In-Reply-To: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
To: Oleg Nesterov <oleg@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_105302_095538_F154EB53 
X-CRM114-Status: GOOD (  19.02  )
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

Move the direct assembly call to schedule_tail() and the
call starting a kernel thread into a C version of ret_from_fork()
in process.c and rename the old ret_from_fork to ret_from_fork_asm
following the pattern in x86.

Leave a comment on what we will do when we get to switching to
generic entry with this as a base.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/switch_to.h |  4 ++++
 arch/arm/kernel/entry-common.S   | 22 +++++++++++++++-------
 arch/arm/kernel/process.c        | 24 ++++++++++++++++++++++--
 3 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/arch/arm/include/asm/switch_to.h b/arch/arm/include/asm/switch_to.h
index 9372348516ce..18d084aff5a4 100644
--- a/arch/arm/include/asm/switch_to.h
+++ b/arch/arm/include/asm/switch_to.h
@@ -17,6 +17,10 @@
 #define __complete_pending_tlbi()
 #endif
 
+asmlinkage void ret_from_fork_asm(void);
+__visible void ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
+			     int (*fn)(void *), void *fn_arg);
+
 /*
  * switch_to(prev, next) should switch from task `prev' to `next'
  * `prev' will never be the same as `next'.  schedule() itself
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 2f93c2f6d5b8..df6961a1006b 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -5,6 +5,7 @@
  *  Copyright (C) 2000 Russell King
  */
 
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/unistd.h>
 #include <asm/ftrace.h>
@@ -128,15 +129,22 @@ ENDPROC(ret_to_user)
 /*
  * This is how we return from a fork.
  */
-ENTRY(ret_from_fork)
-	bl	schedule_tail
-	cmp	r5, #0
-	movne	r0, r4
-	badrne	lr, 1f
-	retne	r5
+SYM_TYPED_FUNC_START(ret_from_fork_asm)
+	/*
+	 * ret_from_fork() expects:
+	 * r0: prev
+	 * r1: regs
+	 * r2: fn() for kernel process or NULL
+	 * r3: fn_arg for kernel process or N/A
+	 */
+	mov	r1, sp
+	mov	r2, r5
+	mov	r3, r4
+	bl	ret_from_fork
+	mov	r0, #0
 1:	get_thread_info tsk
 	b	ret_to_user
-ENDPROC(ret_from_fork)
+SYM_FUNC_END(ret_from_fork_asm)
 
 /*=============================================================================
  * SWI handler
diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index e16ed102960c..81c1c3f98834 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -29,6 +29,7 @@
 #include <asm/processor.h>
 #include <asm/thread_notify.h>
 #include <asm/stacktrace.h>
+#include <asm/switch_to.h>
 #include <asm/system_misc.h>
 #include <asm/mach/time.h>
 #include <asm/tls.h>
@@ -230,7 +231,26 @@ void flush_thread(void)
 	thread_notify(THREAD_NOTIFY_FLUSH, thread);
 }
 
-asmlinkage void ret_from_fork(void) __asm__("ret_from_fork");
+/* The assembly stub sets up the parameters and calls ret_from_fork() */
+asmlinkage void ret_from_fork_asm(void) __asm__("ret_from_fork_asm");
+
+__visible void ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
+				     int (*fn)(void *), void *fn_arg)
+{
+	schedule_tail(prev);
+
+	/* Is this a kernel thread? */
+	if (unlikely(fn)) {
+		fn(fn_arg);
+		/*
+		 * A kernel thread is allowed to return here after successfully
+		 * calling kernel_execve().  Exit to userspace to complete the
+		 * execve() syscall.
+		 */
+	}
+
+	/* syscall_exit_to_user_mode(regs); here once we switch to generic entry */
+}
 
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
@@ -263,7 +283,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		thread->cpu_context.r5 = (unsigned long)args->fn;
 		childregs->ARM_cpsr = SVC_MODE;
 	}
-	thread->cpu_context.pc = (unsigned long)ret_from_fork;
+	thread->cpu_context.pc = (unsigned long)ret_from_fork_asm;
 	thread->cpu_context.sp = (unsigned long)childregs;
 
 	clear_ptrace_hw_breakpoint(p);

-- 
2.46.2


