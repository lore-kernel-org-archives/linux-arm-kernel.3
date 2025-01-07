Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE33E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcwyQnV8bm55i5QCWMqzeBKQ01GSNdA6efjZ9lsGDLQ=; b=jYmZpCYwD7vt0U73Wlx7yz5GY+
	QrHoJqQ3SA6RJaC3T/d0arcOSpPFKo32jgC1zN/fuVW/VGozQz0z8QGpEiq2qCDLYG68U6gUaKL8g
	+sqM4gA1b6JGatdCycr1611/UJTo7leOMLOyVxUjTZMZyyA9Onede3WlEPoW2OoKjCi9cJT7sdgoG
	+TmlVLM67MDa62o8MQz6M/wjPQRpfAopIolvzScGGgtx/CCdzck5U0knaCoDPYC6941klNYyBk4Zz
	W580svNPqzBBiunErSBM8hmsLtq27/QIOGrGCJVt4MpLnmVbrSzGCsKaQVyMuRWJYImi4Hu4dII9Y
	+QnPkKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6BR-00000004Cbx-35H7;
	Tue, 07 Jan 2025 09:47:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65c-00000004ALF-34B2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:36 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aabfb33aff8so2739304066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242891; x=1736847691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XcwyQnV8bm55i5QCWMqzeBKQ01GSNdA6efjZ9lsGDLQ=;
        b=KlXqTNPcZf8M+LF8rmVJIio3hbIhOklxNd6tuiU19zKxhTz0pX3v3lXo0Khw+PeHFq
         FkD90a8n6iT/8SxcV1pWpOpRG+529fssA+pAzEJokjb9XjeBU9V8Xc+v6ZniNUlyyvQL
         CX5caENtF+9xTRRnikaTGBIW0iI3PSSIV/7Vw1f5FaR0ih6nEZmnwMVE53xemxMA3PXE
         LvJSpdDMFenQshIdGVJ5N1jiqj0H9YDMka7Je9WO/JJ9okb7lCVMqYXp2RvqN5mOtXxw
         gvvE+VMLhSRYaTV4G+6e6kXetcnKNa1o9exoRbDJiB+2po0NPR8ptQvPWwPLdHW1b4mf
         f5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242891; x=1736847691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcwyQnV8bm55i5QCWMqzeBKQ01GSNdA6efjZ9lsGDLQ=;
        b=Sfxv19qacoOrljyRDeU3T+mnN1lrnVXihb8B7UzzmSpEPR0igiqs6Vzjquw99ed3Zw
         yBsvBlrAzZTb8vmnIJ/u8DM+ez8RnQJopQd7qPOCHcH6ZEB1yXOFUd9GIUkwcer4Eb+d
         WhleVkxgJMY2OZJwnkz02MuZPjAoTiOa71ZtjtEmNeinbphbxBJXmC/91OCRtfy1AmRm
         Rzq3s+ulaVqTjGH6E4UPenqBIJqpzqGEMaHu+kasV/HEWjJasrKBULi5OeKe4cHlxhCq
         SUSabRtJwwPZV/8Un0+kNMZ2UTYxhRm+MpeL60Mtv3ybEOduldJXq4T75QhZQPwzrHCb
         0YTQ==
X-Gm-Message-State: AOJu0YxiuiUsggU6zIyjmAPbt/Eg4/bW9Awg/Sco3rI3WL38sCafVCPI
	0gb0ZKlj2Y5ET8WYjv6lvsopkqi0oGi6GGUfpRVWcR46vENYEL+ArKHtD3F7BWQ=
X-Gm-Gg: ASbGncuouj0089CAkZAEAeXLFDGyo2CBEumFPN5TyIwMCrwVs1AR/UoGxuSCqpSIow3
	wlvErmCS055YFxiLFlQLW/QGfqRyzcQLJ5/XWHzg934CBRdyCYbee0JiqRCagL7He+QWL2kE5cr
	pc8m1SME92T2ja3bn4ykOrlNk5LEMfMOY0E1s7BxRxHWKpouTqLJ94uwDEdIW99NwEneSf5cQep
	5+n3qqaZLHPHWqgfyzSfa9oy/4G5B3b+xbVtf0CURJlWMsRTMhjIoluCvwKCsq+Yow=
X-Google-Smtp-Source: AGHT+IEjUOoCAFXZRMy0I9gsQuvhr/I63Fh4EkcJ8plhvbLKJ7YnsQGNvkDK0foSGl9cEXw6e8AViQ==
X-Received: by 2002:a17:907:3d8f:b0:aae:83c7:6ce7 with SMTP id a640c23a62f3a-ab28d07ba93mr230343166b.0.1736242891330;
        Tue, 07 Jan 2025 01:41:31 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:30 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:20 +0100
Subject: [PATCH RFC v3 04/30] ARM: process: Rewrite ret_from_fork i C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-4-4e5f3c15db2d@linaro.org>
References: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
In-Reply-To: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014132_786026_1EA1CD39 
X-CRM114-Status: GOOD (  18.96  )
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
2.47.1


