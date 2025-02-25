Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2E5C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ugjh5wDawxRKPKlBJt/tVpltkHg0eR7Bu8LyZ1i/cWo=; b=2gcKHJrWw3u7Cj9k7doPhfEm75
	flT5xd7z0aoICxH8X1aThJ6hD7XJvdzaH8yeME8iB2334nTSqMdfCPqpS9aNYnI9VSYH1bUy+1nWm
	Vcxgj4ayd7efFwMUbtRuSH/AUB8u+WACrEbbvzCkB8dzWroQ+L8he4NMcMaK11ebCS3GnyERGpHz9
	cog36eF6WpstdN25U4b5lkFS9mKKIRd3vhTMV5FweW0FttgpgD/RFYkIOX1+ZcxIWUlsfa8HiSXmi
	IpcPPGYdPurt5s5BRpdMLHiB+Dez+aUjijVLLhE2Pogm+JG/4ds+WObZOFpdgOl2knH3olMXFPaXC
	gn6BrI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsBC-0000000GpPj-2dyR;
	Tue, 25 Feb 2025 10:28:46 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrem-0000000Ghg6-3mHi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:18 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30613802a6bso56328831fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477315; x=1741082115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ugjh5wDawxRKPKlBJt/tVpltkHg0eR7Bu8LyZ1i/cWo=;
        b=i/XrIB6RaMuKeomijbAoCcxvAOJg4LZnjHfXNuCWxybgF2tuNtjYZKKDJaRdDT9pf8
         S3RmjZPVolneb09C3KvmdG0g1J5AHtxVUug17k+JqT6kqzINQDVRDdnrVx60aEZ9OId7
         eHEvJ8CP+DxSjBkLEOmvhPiiBL0yREzcT0LPcOVRUAY1tbSE7ZHHgpF7jPQMuI/0uZck
         T/EEuBKKa5PcgVzXyTWWD5rOQKasjH4Ql4/wQo8DjB96QbwEM3FPX3kJg7qvfrQu/oDF
         zo3Rv+yJf/P5t2vzSxkrwToHtepijgmC4EjEhJdoit3CLwY2RKNTHMHsZ19+1O1+Pr7k
         fz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477315; x=1741082115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ugjh5wDawxRKPKlBJt/tVpltkHg0eR7Bu8LyZ1i/cWo=;
        b=ty5wt40mhn3VcD8ciXUW5Pll2cH94hB1QPaQp+rynEdhb2Gb9UR+1+AcjOzjUF9N2C
         YOXWW2vZdRGKYJ3izNV3jREbaX7WI3YuTwSyFd/jNaa3dSs4iLU95NgNga4PtsZZYuB3
         y6y6FL/7uBks5T5/QWmFpebG2IcqvLNPtf8Bej7UZ3Mrh0tcR+uFzHPW8Rv/oNj3kGBq
         bgkKhWANE9dN+bSvmwAgtXK3hBjQyY4/QQUZOcsozy107wgWBsIhq/Z44dnyBcjc2YuQ
         ZBbZKtoUjzj3mhqGxwdgjFHA1BH5bS+HAZpL5oBMnaIbA9ElKiyQpQTnS/OnEL6J2pRa
         CmWQ==
X-Gm-Message-State: AOJu0YzI3sHTigFycscxcNQziApspKds0PjHBbgzV9kEqyFxMBC45Bu6
	GeOpOLrjsVWndijnln3+5FctgDbdSUX2ieyS+nY763yKMSAz3VAa+RtlveD07XQ=
X-Gm-Gg: ASbGncuFkrW1k4wVmRUoTBBOurjkhzD/V0dsALkKEimp+x8mALjROL4M2bYh6Ihed2W
	qIx+C7hGpIcLFpVIjpZ0w/ZBPJQn/K9MzwgIo5a6pgsSlIz6r0n0WFzSSv5KOWWk/k0KsBbN0bA
	JJ2YOLKLLl0eSsha54U/dfmw6180HjyZUSDayXiTcGPUfAOvmFUoEnu8Ju9Jfvr9f0GSbmhLpgd
	UOSq/zGvV5qofAqwMyGK3ufjf9OHpiUepVUfs9+9dFQjuneKFSWQUwdTQdSZNd5d6lqwh4w5vIW
	D1al9SFTFf2Cnkr6BOz5HMQ1yhn6z4N1TRCr
X-Google-Smtp-Source: AGHT+IGqkcF8DuM2/ZHDNxMpAtKrMC3XCNpt2RI/Sl+BYKODnNKv6ouUbi026+ezhu+8diXjeteQjw==
X-Received: by 2002:a05:6512:10c8:b0:545:17b:3cf9 with SMTP id 2adb3069b0e04-548510ed5f5mr1084027e87.48.1740477314909;
        Tue, 25 Feb 2025 01:55:14 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:00 +0100
Subject: [PATCH v5 13/31] ARM: entry: Create user_mode_enter/exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-13-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015516_953198_3B704FB7 
X-CRM114-Status: GOOD (  19.20  )
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
2.48.1


