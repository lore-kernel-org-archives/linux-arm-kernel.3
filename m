Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6012CC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 22:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGj2mqpewSEqRb9t6DrzjDdnFip55vEOgyWPwRrWkco=; b=cHgi+A4jIJ/WKVQsiPEIcPe5Tz
	8XaDmTDEuOFnIsUiXdqS31++DuZXKryCFREaSS6kCWkYK59f0aLOPD+1clpyuD5VbALl3LC0zxR5e
	S+bl6udIGBmmCVuIoC9Nd+8My09X8pe3KaKdqIYApaJhdtPZZQTThVt87DBLT9WHLQL7RfLzVtsgO
	9TTngo3E248Ma0VrqOBUhR6BQTUhgrilDHCipzywUaZfia3e10FsFEvW4EcOrFn2Ac6P7gEqQefGH
	yrjaMgnBs9PDBeoyKdb683zE6gq7LwqjE6TqVUBZFO/H/6zGcvvP4h7oplvB2k/XRzqihHOqj4UEo
	C3uoBIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GwO-00000001uNK-1CU1;
	Sat, 19 Apr 2025 22:45:40 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gn5-00000001sh3-1uKx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:04 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so3101517e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102162; x=1745706962; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGj2mqpewSEqRb9t6DrzjDdnFip55vEOgyWPwRrWkco=;
        b=Bx+aflveqHsar13FTXlVRMYaQALidgq9djPAwV9/dbDRQO1On3slTJi4BfmAQJwSDr
         z1rM3uuYbj1g0Q3X19lyk/U9XXhjaK7LPtMwxBMV3k6gp2K/IrxFpq0sD2GVmKxFdHim
         iGqGsorH3ZoRDaV/VzkI7uWBnB+QlWIkjG779s+vSmV/JcJdtiDdgLl+AuZteC7aTfAV
         HlPay99tiaTJLS1oBu/6m4TX/3VKe+WtHh850+5DahLWSGUKiAJ4+EbPF5QzORUY1mR/
         RuIuGuA9QY0D/k6z+/yt43pLCLplNGtH2vhdOuL5ZuJFIsLWBxNd7RXO4ccbGOmMdtYB
         UW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102162; x=1745706962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGj2mqpewSEqRb9t6DrzjDdnFip55vEOgyWPwRrWkco=;
        b=SYjOXa6cB00qDO5AJfAINwhUwRs7DDHV1DYUk9gCIWYB/e3GwXu6aV+T2uxAvOZwHp
         foYYYMEzZBMbsZ/ILR+8M3Im2xqiyyA/sIQ0CIf2/Ypax3JwrNgRYO6/Zs/lmbnqUu2T
         8wuB3bVgaxGXt5oibCR+QEZFNpnM9+kGz0aSleeClwgUIXVn37rBgpxk+zNRhLt8bwvT
         zKMhm/6XrZWhFa8LSuFQMbZwj81rpGJ8A0/Xvp5+jxF2VxjTeKUTL5wO+82GpBwbt431
         +BE8YH9J/X8YlawkUT9b6p03+juGUDnHsEMQJxw0chkbB0RoNw92DI9fsxZz8J2SRVA8
         dDCQ==
X-Gm-Message-State: AOJu0YxWmVGh1gfbHQlzZ869FJVQ6Fo0da0yBwXNW+sFocq3uOoGiLCU
	oNrIUXRsVNHI/Xkdwq8XBl846QGpBF124BiVdfwVI0yLSg8ubiZhrRfKpkHpI3o=
X-Gm-Gg: ASbGnctUYWP0xkv9JLlxWW182aal4rKs3Ueh5uACpEP+lPpYrFkT/7YIgvq0jADPoZ9
	bGIaSi6mSa3v9ZIw6emiPSnpSUlPd7Uq03zsU4APupenyJVAPH9A6OfzJPMlex1ngwgI0M/uNgd
	ZpMGFd7MTflJHovQEDJLeQURquVrnhOFWYOHme1gzeUcErUXf0kGxhBCjQEEChGpO82kETwOUcJ
	LRAIFOiv9fMiOjyZ/+JINzygo0l6mg4NiIH1XmPiFIfjy2nspYJDRpoG6Lk+UERhf5IhKVBWy/1
	DYlo9W4h2xbe9UR3lC59uvmeRxBEtlyzISLBBaMKBAfQrO2DC+8=
X-Google-Smtp-Source: AGHT+IEgRdGrAKuD8P++6CqHoCvgvQ5QEk0YY5omU/4y6fTVMIpqUi+sqyaRus7zaV38Lo9BtOSCaA==
X-Received: by 2002:a05:6512:3e16:b0:549:8f15:db36 with SMTP id 2adb3069b0e04-54d6e675800mr2197914e87.51.1745102161596;
        Sat, 19 Apr 2025 15:36:01 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:51 +0200
Subject: [PATCH v6 04/31] ARM: process: Rewrite ret_from_fork i C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-4-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153603_518578_193C0604 
X-CRM114-Status: GOOD (  19.85  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


