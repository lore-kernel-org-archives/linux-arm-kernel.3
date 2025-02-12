Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC31BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LU1Mx0M1JJLQ6X7nOndn1GNJ7UBsOKiHS90jS7YqHQ=; b=BjJicqwK9nyr+ha4s4+jPv63iJ
	/wU4c10wUMlYH/lI3p4rY4B2vGErQ7dBqXMgn+nWureSOfJPZxQAnw5+5E8of3mFQ7IwxWhdktGJh
	bh9APoUJk73eNJyDwT5NUmrEcIGoEg/T5DDjo3u0sDJXLsps1oPnSYO3e+vjxQwZX3e3CD/Dj3nu/
	smuPnBltmtFLT4kMneH+QDSDpGLBs/vNvQ2f4iSYNUI1hkljGWK1bdrGDnUgnCWEJvwzXXOYZQA0A
	4FC5GZNA+vEdcqzuJzNivKEOsYmlsX58NXfnrww7IzyWUPIRT94pGSXQS9IPQQoZjwsvwxYPd+Mjs
	GIL3X7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiB1X-00000007CjE-3uJk;
	Wed, 12 Feb 2025 11:35:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApp-000000079eA-3Fan
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7LU1Mx0M1JJLQ6X7nOndn1GNJ7UBsOKiHS90jS7YqHQ=; b=fTe/hhd2ZlvB0CdJY9F1jwjJrU
	/XttdT5aSu+KljBQQajgYIkcTkzFCC8svsDhWMAEvEN5k4FJ0g8vOynFpHYIUA7qu6UBWxPM9TpTy
	9WVjJXvu352MP5r4LaoJGY0TdIOqge1D50/Fk4PohpUDoa3AmRwdTe92CAraUIj9cQSsshVPjvyhF
	xaFd0L3v2oXHrhU0PYs+HxT1UWRWRavCCMfg0oxupzBfBhEYIyFviwVAE9xMawWyB8slndmyjjXgx
	LyCnud8SoVgiAJ5McCNtbboXXu0ZoG0tuVnHH1ShJ9YhUEXs+1E5S9Udpz0X5c5c36lx81WnXxVH4
	fNbbfnzA==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApm-00000000nn7-2EF1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:16 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-308f04beb24so24630581fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359393; x=1739964193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LU1Mx0M1JJLQ6X7nOndn1GNJ7UBsOKiHS90jS7YqHQ=;
        b=SBQCUcG0XfiaOlx2vuYrtoiVcXhP51ovIVtMsZMGlFaRxtc8iWG2SMMeNq5j3tUUM1
         GFmzfWPW5Xt6OY+J4eZKmOwrDHEa5AU75Tk4L+22JkfUhrkuFmRb+emgccGzO5nq/99d
         vW4yEY/bzP5mLoKHMhu8YsV2jVHrpUBZ0qAxFWxwCFZvcJ1mueJJwozVDeV6UC5akAGQ
         pRvXk3f4Evl6OsyDC3qlzp9932CjOfxuPbW+v6++uyLErjbW4bk0uHzvxBK5wWV6BHoW
         48VpP0LdvetA8DthkAB7LsA6766QhR282DXfE5R8tc7+NZ4Wcnt2ivjQfPIhekvviUAw
         WVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359393; x=1739964193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LU1Mx0M1JJLQ6X7nOndn1GNJ7UBsOKiHS90jS7YqHQ=;
        b=euwZYsD5OZ9darOOj7EYzo4y8mcTVvFP/0m7TjNEWEvAEMvH+MO8aVLEULYL9uKn6g
         ZbFKCJQ/TNhkhnYoNqUfyUiKq9iTMw4LKoeN0PpSeTdvtr7Kf3ecB9u4NjbPJHkhAZln
         z0J1CGj6uFVC28K9ZeVz5GKhHrM2ZsrdM8KDj0U9wUy074MG0FZ3nNU07dbuzQVPafdl
         giUPsI6LYmkCAjU3qgT4OLDwfSUWp34vx/KD5wTCxPtq+j7m55701aoR+1ljm1KcARCq
         /vW4LjqcGRv+U8Us9Bpunfx5RLlXz6DND1vSCjkDOrnq+i17nVKGMG6J9GFLV2Z4IRak
         xumA==
X-Gm-Message-State: AOJu0Yw+R0YP24IoWOVyosKnR6aBkvY91qIQi517vI3rdNxAztSwwFqt
	ldIcEjpPTEfOGjh0VQ+cBiAYHkKbNH2XasAdEDMCDLPil7ETRTLyJiqTOyMXfZQ=
X-Gm-Gg: ASbGncs8EzdEHcnyfAbpvQiSfFsatgG71poymcCQpMHO6aa/9PlQUlH3CRUVfkjpsPZ
	355AEBDQ7UwZgb9VKLPI5Mf3pbZXijd0yefs8YsAymWW5VPc82QK2PTdT5lPnfroInRBeFPvu/x
	Zm3KKnyUraHmzPcVK9kOBoHJZux9CU3FgkA2xuVuJmlahspaTPJn54hdpjfRMBe9nBredwdmdx6
	4FFobrRnAhX3YDgzG99gnDsHFyFnJJGUdDfAbINzhWSNg0Zc2GcLd3V3XE73TJUGclLAm/2rfvB
	Ow3vzejKcYOjjsHc8/M5dxlgJg==
X-Google-Smtp-Source: AGHT+IFszoZ8SBA/9FJsuY6Uu27qPFJKW5beQGmqgaj/FjRsBLL1NiJEufHRTdvsslQRkUBHSfB1ow==
X-Received: by 2002:a05:651c:198d:b0:308:f01f:182c with SMTP id 38308e7fff4ca-309036b453emr11165271fa.12.1739359389988;
        Wed, 12 Feb 2025 03:23:09 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:09 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:22:58 +0100
Subject: [PATCH v4 04/31] ARM: process: Rewrite ret_from_fork i C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-4-a457ff0a61d6@linaro.org>
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
In-Reply-To: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_112314_979822_AA27A4A8 
X-CRM114-Status: GOOD (  19.00  )
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


