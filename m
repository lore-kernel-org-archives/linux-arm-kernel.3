Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE14C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haBpLM2DDViWHZC+WLr3EUnb76m+EmYlOZpo3tV17aw=; b=BXkS8VSrlF/PB+2RiedKaDQCNo
	1e84GHqIhJ6LFKeTte8LKzkjNtEcVijUDvvwp/R6NBDYWzokrYr7bgtD653kerXSl9mL/e1U3/Lii
	ozHhiDofMl7cByeVtlucv4WdhHaWJgeHAEicFCP7WbZNTHiOI2feYIUpnBWeaEQIP0Q59AAvldgWc
	O2Wo2NSgVZw4rOYi+HUdrZzRrq9DH+3GjLFNZa9fD82UbMveEP6jJPiOK8sOG4uzJTYVwVOXWJKFJ
	vsp2w1bCYYwxrSnfI+zF/Km450d5PdSQ3oDuAHyEzaJ2Fas29lWRDoC8ArclkKrlJblxhUonRih+5
	OsM90g7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HD8-00000001vbs-03b7;
	Sat, 19 Apr 2025 23:02:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnH-00000001slV-4ArW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:17 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-549967c72bcso3176183e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102174; x=1745706974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haBpLM2DDViWHZC+WLr3EUnb76m+EmYlOZpo3tV17aw=;
        b=uJWFWUlzXdOYfVyslJFPkIC1h/T1VGtN2GnwzgPPB6B6PDizwbvVlQiP8MrtaLgIf+
         FpafmM6SGItygaElTFALvIl6RszyFZnoIjYQDNBhUJlj+ZMZeXDdt8QJmzn2aT78+tHZ
         djbXPf86XV8aIHWibDXvTq8+aBYxUCv1F63gLQF5eBbJREnRZAorlXxwHwfMjxaSZhW+
         n5HLODvoercONnG5Io0Cv2Mx2dhSVmXTLdsDXukNGwV6KuKkKTa+HQppjBGzZHqEYdMl
         LYDDuMORP3P0qAX2rIr1qoCs0IVTlqP/8upFUI1zrM6MCG9HsZJBOLj1yllYVssgqfOa
         wQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102174; x=1745706974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haBpLM2DDViWHZC+WLr3EUnb76m+EmYlOZpo3tV17aw=;
        b=Wc5YOM3q8fCtwgKpIt6ERO+/wBNZ8sIVXOBwHDpEayzKaibhMVRjH5e2gR0ztH16te
         3voRpHf2Q1I1jJSH2KNAZIvJJAku9Ul73AsoLZ4E25uvFQ0WgMhGnHqQgIJXtTqqdvsA
         I+PvwMUwBR/88fa5c5QsLjk2Cj/HIx4No015FZf8P9fi2aaFD+4R3kcWx8NlqCyEwN9m
         Sef58TQX7Gy6wJoWt5kcxUxJOgsUBNvRWIylKSSOfGC7r3jzUK6rtMjvj0DuJBPib39n
         sx/wWkAYcCLXVOfPFASLKUjHG9lhyMSePzF15FcAURf1jvXCu7nKMXkl2iWJ3938IC8q
         SBkA==
X-Gm-Message-State: AOJu0Yz6kIScCks+ZM9A+5888Y5jtoCKOZjiVukcrPkXt0t6CGtHX+xt
	TRVdaVobi7zrAZwgC4PW0gBzoE4HeizCMmjDeqoqPCJrOLgS41BG4qf9cfs2YUU=
X-Gm-Gg: ASbGnctvGeB+elAXx1ycN1oFP9ARyFRxiAscdFqf9WDJo8sY8UYOxLupDkUWkzGEsaP
	mDYpOzyr9GkckeXOk6MvOqdEGf9GULbdKDSB9e0YLmCBgcD8iZKY+rfJL8VmAsQ1ISKLKKPSZm+
	+feqDXDrO4/in1dgR7LRhvSObTt9zHCDIyE9jN4E0OHcN39a9LBvwOD4/nguMRGx4GEhtSbvKGt
	HI7GORGe4gGJnBx9aHxHUy0p/nCGHDvXE7ZJz0AIlzwhQwg0ReHRp5Vuq927Jbu9PyBtp0vwUTT
	VLXsRBzAD3NUi3BUTPb3S5NIcwJRjqgFsh1OKqtjEyRo2AM9rgM=
X-Google-Smtp-Source: AGHT+IGVYEfxzTi9voc5pCztNpyTSQ7pQu8il04+sUvFiXGiIYsFbJz8etUwlaq/dGEklq0WmoUWOg==
X-Received: by 2002:a05:6512:12d4:b0:54b:117c:a3b7 with SMTP id 2adb3069b0e04-54d6e66da7amr1884687e87.57.1745102174033;
        Sat, 19 Apr 2025 15:36:14 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:00 +0200
Subject: [PATCH v6 13/31] ARM: entry: Create user_mode_enter/exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-13-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153616_041967_FC3FF103 
X-CRM114-Status: GOOD (  19.84  )
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

The callbacks to the context tracking will be repurposed
for several uses that are needed on the IRQ transition
to/from userspace.

Rename the macro, establish call sites in C calling into
the context tracking following the corresponding generic
entry function prototypes, despite the assembly macro
names become a bit long this makes it clear to readers
exactly what is going on and where this call will go.

Drop the ifdefs pertaining to context tracking from
the macro. The C calls we will use have stubs that will
compile these out anyway.

The inversion of the signature of the context tracking
calls are especially confusing since the generic entry
uses the reverse semantics: *enter from* user mode (to
kernel mode) and *exit to* user mode (from kernel mode)
instead of the other way around as the old context tracker
code user_exit_callable() and user_enter_callable()
which have inverted semantics.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   | 14 ++++++++++++++
 arch/arm/kernel/Makefile       |  2 +-
 arch/arm/kernel/entry-armv.S   |  2 +-
 arch/arm/kernel/entry-common.S |  4 ++--
 arch/arm/kernel/entry-header.S | 24 ++++++++++++------------
 arch/arm/kernel/entry.c        | 15 +++++++++++++++
 6 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
new file mode 100644
index 0000000000000000000000000000000000000000..e26f369375ca3cf762f92fb499657a666b223ca2
--- /dev/null
+++ b/arch/arm/include/asm/entry.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_ENTRY_H__
+#define __ASM_ENTRY_H__
+
+struct pt_regs;
+
+/*
+ * These are copies of generic entry headers so we can transition
+ * to generic entry once they are semantically equivalent.
+ */
+void irqentry_enter_from_user_mode(struct pt_regs *regs);
+void irqentry_exit_to_user_mode(struct pt_regs *regs);
+
+#endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index 69ddf51081f4791982518d37df60c11211b8955a..dd45c6eb8cbdd2595edc4f26026c12b25dd49717 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -17,7 +17,7 @@ CFLAGS_REMOVE_return_address.o = -pg
 
 # Object file lists.
 
-obj-y		:= elf.o entry-common.o irq.o opcodes.o \
+obj-y		:= elf.o entry.o entry-common.o irq.o opcodes.o \
 		   process.o ptrace.o reboot.o io.o \
 		   setup.o signal.o sigreturn_codes.o \
 		   stacktrace.o sys_arm.o time.o traps.o \
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index ef6a657c8d130663e68acd07226815ce8a3fff7d..93a37437a9520118eff411f009e8f6bd729412fc 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -406,7 +406,7 @@ ENDPROC(__fiq_abt)
 #ifdef CONFIG_TRACE_IRQFLAGS
 	bl	trace_hardirqs_off
 #endif
-	ct_user_exit save = 0
+	asm_irqentry_enter_from_user_mode save = 0
 	.endif
 	.endm
 
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index f1e48002bd3075ea67b5883178583127fa0055c6..ff1dd3169346f3770cad6b7e218f5d74ffc646fe 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -111,7 +111,7 @@ ENTRY(ret_to_user_from_irq)
 no_work_pending:
 	asm_trace_hardirqs_on save = 0
 
-	ct_user_enter save = 0
+	asm_irqentry_exit_to_user_mode save = 0
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
@@ -191,7 +191,7 @@ ENTRY(vector_swi)
 	alignment_trap r10, ip, cr_alignment
 	asm_trace_hardirqs_on save=0
 	enable_irq_notrace
-	ct_user_exit save=0
+	asm_irqentry_enter_from_user_mode save = 0
 
 	/*
 	 * Get the system call number.
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 52b4fa97226dbfa4b55aca8eaf74ae24e1e220f8..fb5bb019199b2871e29e306a29bea8fdf47dd7f3 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -362,31 +362,31 @@ ALT_UP_B(.L1_\@)
 	.endm
 
 /*
- * Context tracking subsystem.  Used to instrument transitions
+ * Context tracking and other mode transitions. Used to instrument transitions
  * between user and kernel mode.
- */
-	.macro ct_user_exit, save = 1
-#ifdef CONFIG_CONTEXT_TRACKING_USER
+*/
+	.macro asm_irqentry_enter_from_user_mode, save = 1
 	.if	\save
 	stmdb   sp!, {r0-r3, ip, lr}
-	bl	user_exit_callable
+	mov	r0, sp				@ regs
+	bl	irqentry_enter_from_user_mode
 	ldmia	sp!, {r0-r3, ip, lr}
 	.else
-	bl	user_exit_callable
+	mov	r0, sp				@ regs
+	bl	irqentry_enter_from_user_mode
 	.endif
-#endif
 	.endm
 
-	.macro ct_user_enter, save = 1
-#ifdef CONFIG_CONTEXT_TRACKING_USER
+	.macro asm_irqentry_exit_to_user_mode, save = 1
 	.if	\save
 	stmdb   sp!, {r0-r3, ip, lr}
-	bl	user_enter_callable
+	mov	r0, sp				@ regs
+	bl	irqentry_exit_to_user_mode
 	ldmia	sp!, {r0-r3, ip, lr}
 	.else
-	bl	user_enter_callable
+	mov	r0, sp				@ regs
+	bl	irqentry_exit_to_user_mode
 	.endif
-#endif
 	.endm
 
 /*
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
new file mode 100644
index 0000000000000000000000000000000000000000..8b2e8ea66c1376759d6c0c14aad8728895b3ff1e
--- /dev/null
+++ b/arch/arm/kernel/entry.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <asm/entry.h>
+#include <linux/context_tracking.h>
+
+noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
+{
+	/* This context tracking call has inverse naming */
+	user_exit_callable();
+}
+
+noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
+{
+	/* This context tracking call has inverse naming */
+	user_enter_callable();
+}

-- 
2.49.0


