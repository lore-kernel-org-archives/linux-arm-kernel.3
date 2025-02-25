Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAA7C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LU1Mx0M1JJLQ6X7nOndn1GNJ7UBsOKiHS90jS7YqHQ=; b=K+31ufQo/uDlhKSZfA8giFLjCv
	7z7eSkKgSG+IeeKM/ZNZgfu6yDJyscEz+vcwXFmQa7PEEWdRw2Rf5M9S4J85lc7Afv8Wt8VNa66E/
	05yT5os3KAb7PfMIkgWzCX1DDf4k09umDIsQh8JMJSAGcAsfH7gYV5ONNpeunu8B986N963q5ngWF
	S11/viHmEq3J6l/qLEnTJ+6eahwK2O6/xGjHR3tncK8IN4EWsjE9e5F2tLTXB0y4OYPd580lRzE5g
	3PlsQLHl3OKBl9A4xgXwggprbcAX+ob3gwS8kDAfrPHHAQGSKfw5GcDpvdDarvwQhrm4JGs814tgc
	ol/lYamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrxV-0000000GmQG-0DvR;
	Tue, 25 Feb 2025 10:14:37 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmreb-0000000Ghc6-3dmh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:07 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54524740032so5581490e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477304; x=1741082104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LU1Mx0M1JJLQ6X7nOndn1GNJ7UBsOKiHS90jS7YqHQ=;
        b=KtlNRyHq5d1xLgm80kUk9UNutJCYczAM6bS7MG02bJlcoLAqq1WhOr3aUsU05BW1FN
         Hg1ys9/rHfpjmTjJR4RzlhxSwdTvAJ7zPQBKvjq3e1+KEvlcSUZlVqpna6fbB4WJ0K/l
         EKjto9OXawVGfyFaikMHQMD5EoSgdF/r+RwhgqDXa9ISwo3HUV9BAld9cSYjxiPyQF+L
         xvVZI9NsQv/V56Zdt56iWMsg0Zxxy8yqwUCoipUyOk4+Q4N1LEvkbkeIiYK+xrAmCyQp
         mg2x7mSvRBecrWEqvxHAn5b9KTNyvDCn2S+nHBfuAkQCawFrywo3NdZKCQGTGHeZYKDU
         lSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477304; x=1741082104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LU1Mx0M1JJLQ6X7nOndn1GNJ7UBsOKiHS90jS7YqHQ=;
        b=bo3YL8/r6M5TAtkpByKWwYoCjpv1JzZi9XJVYrqpnJ0xbopIns5dEC5G2t2OL0m4od
         7avUn4JAIF+jIEd26aewaF1Q7BRgxcLAtuqxOymUfVcIoLe5qN4ntDN/2n2wnp1qslno
         9y9WOG3TF57RBBrZ9Hyd8eOk2uwvzYkwZd0YP7plk1QGMQNe5B/pqCG0wPPqRrOkjVqO
         5bDCf9z83Wct5BAVNZuK8NXgN+7XwjAeQB16NponvzP2MK+k/5t3JvYlDF7jw7Psez2I
         MGCCeM2LuF8MNSAV0+bqNmXN4tK4Jl4/iLTGkKJJz6CWW3i2FbBfW6SSU90yaRUEh1eb
         vjrA==
X-Gm-Message-State: AOJu0YxBWcZF2RqzNELaXtPrievzD+TNrfsfX1i6/yGw0y1c7sfCojNg
	mEeCqZYp3UTmWBe8QcWyU8CN/nfGd9UKP4F3WRfhv+bqCkzQjtL2EMpyMUFuSIQ=
X-Gm-Gg: ASbGnctp5GHLyqy6wrhukrurjEG/whXmgVUy5Ec75lbvLQbPhw54KXN1j2DlEJLgxUM
	3Z/5jV3cgw/kVUY2xO/3Lpb4ACxuNBoqgvoCJzExpbYT78gfBN4poYsOZP6rUnmE/N7KABG2hVG
	EXNaD3iyPeyWpLPefLUX2nr1FZ0mEJ7gKNXC8Jra/Kyfowz9XOA6PV5sRJV9zDWS6FvFU3ZIYNm
	j08DOLdisk2rRpvT3QOPNVMxguHgWNU5GkNLl/ABnDmkwLnbzaY1Wa1Z58Mm5VuEVIiExbg5c5I
	mAfshpOblW90sk5dLSsaK2u6Mu+k1LQq7Kpj
X-Google-Smtp-Source: AGHT+IFtzOWDVP2t0fNNEuMAk2DHjCVRvoPLmi06C6RBehYosOgRfNKzND5MSNgjwgco26/R488VhA==
X-Received: by 2002:a05:6512:104e:b0:546:2ff9:1542 with SMTP id 2adb3069b0e04-548510ef882mr775478e87.53.1740477304323;
        Tue, 25 Feb 2025 01:55:04 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:03 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:54:51 +0100
Subject: [PATCH v5 04/31] ARM: process: Rewrite ret_from_fork i C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-4-2f02313653e5@linaro.org>
References: <20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org>
In-Reply-To: <20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_015505_928508_CB7419F2 
X-CRM114-Status: GOOD (  19.11  )
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
index 9372348516ce9b80fa713966943d0bc622e86066..18d084aff5a4faa7cc5e40d48fbc4aa97a89b0c6 100644
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
index 2f93c2f6d5b8fdf6aaf3dda0192bde144fcf238d..df6961a1006b7a0f3522728812bf52ccb849e511 100644
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
index e16ed102960cb01d625e2ccc484f238b824b03b3..81c1c3f988344185917cf4e53d0d8ee47ae912f4 100644
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
2.48.1


