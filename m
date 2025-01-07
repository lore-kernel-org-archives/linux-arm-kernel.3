Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF569E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVho6GNQ8sHkNW9UnhPXJ73x2YlFfkQj2Bi5lbl2ixw=; b=2K/1DMVwkP/VIpEwzSauIGn6ci
	ms66MqNFn9qbuZITxw4VURZWm+UmPzqDEjXpYa1AoWTOlkrowpV6X4T0Boub3eIQZ1KbKAHizgr0G
	JlJZwi2AXETjfZMkW6q+fqGzAnrqOtt0jgxqG7SU2Soz1kaw07hYA0RTrQhLG6DABxkydg3d+30pP
	LRo4lo1EViyb1hA18uW+j9xGlaVlClrlb4Xu28QWoz2UQy6id224dQERBPJHf58aNASjnmM08TLQq
	cTHlMKcQGlmEBUrHxdhS7fiw8smecebyRv7JeBHrna4oH/na7NiUoYS3ugBk0wRNs3fvUxkrZw99z
	1oQZQMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Lq-00000004EdY-1Gz6;
	Tue, 07 Jan 2025 09:58:18 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65o-00000004AQp-32Sd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:49 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaeec07b705so1750810066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242903; x=1736847703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVho6GNQ8sHkNW9UnhPXJ73x2YlFfkQj2Bi5lbl2ixw=;
        b=e/Rjy+VaGJy163M1fUXwiKtVnPfHYBWf4mBlx+BF4bRP/zyjWoBGuIEOrtBenEW/Df
         5K9rRLAj46913f4MaBA+774B3LjC1OKay2c1ZRXMLPxyW8cnsrcCIYHa8PcXvcGbBCk/
         8S1nPzKtfT8SR5DVMC8ZiivXQfC0mA2xK06g3MZ2+YPOwm49FCyJqS3Jc0+5lADfbgS1
         CkPWcpzj8sKiF9fuEm0qiaG/V/R0ji/lux+cflDMWpLR9UsL7D0e51/D/1NRyWe3zIKy
         smekNjYlRCssnlfgBY/O6ReLqH4YyLONkJ1SbyfMkJugo8IgIjaVErP0HpqdyC1AbanF
         9kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242903; x=1736847703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVho6GNQ8sHkNW9UnhPXJ73x2YlFfkQj2Bi5lbl2ixw=;
        b=QUBJflDRsE9vOjsS4Dq93fdt60vbOvODgWZFg2XXBzcaPjHnajFDpZgTQmdGjrFiGk
         q453BRkmmuhmiImqMD5b1lRUfA2J2FdFMlK9AXb5xAVw97sF0Si5N3kutFzh1n2pGBTQ
         D9wDBGdPaYhh2rPSg2w08oEmE/7mWeb1RxcF6t3454SZqI5N4Zi1jJy0vC+6Z/LKzRR8
         qUjZJUywFLsnVJzVTVM12Nv+LvML0dyIVeuBLCvGOD2CTmnnCY6Y0UDtra9Nw3T0JFhb
         bzAbyv3+aj3F3fVfFvvppA7mIAtmFhMBPtqrOlkIZYm6dvXXayrU5rvcjlkkLScvmzyh
         ivtg==
X-Gm-Message-State: AOJu0YyOUIY5rGpxAGKgLQ97vs5BFjYBwsx4cEpfhXBd+hEOygjj8lj3
	HmWKmQ06JbBMjwEl2mhbpVxaQIbFMxj46xEZXcvLYiQkM+P7HUODzj57eh6ODbg=
X-Gm-Gg: ASbGnct8WgUsyw1C62j2sE+TypqJ7Xlaq+kNuHGYJUVQyOzBu54Mdxjv6HY/sBaJhD+
	ei0z/hXMHOXazAlA4h0fDfNYlg1LvCgYYQetRzmEqc3L4Q8gvIIrql8yPA0d7vbugiX4Na0aQZ5
	IAKHhXZoVxbShcpq9Kbho7/p5k3r6xgnu2AO4JDY/bU7zHH8PJtghobkWOIJeoT93Z4/ucRDtQx
	jbNXrCmn3vqTSHnRRgqq2xG9iRBI4vhDvmSOCGTAyisj1zeZRDWRjVUNrMnuOTpS3g=
X-Google-Smtp-Source: AGHT+IFp0Na7duITz2atjHhj0nkqhhPB21aJ1mPJXyOxSwoqi11/ZptmlR7E7P65WAgLbQ1dpAuC3g==
X-Received: by 2002:a17:906:c142:b0:aa6:87e8:1d08 with SMTP id a640c23a62f3a-aac2703377cmr4389365066b.8.1736242903330;
        Tue, 07 Jan 2025 01:41:43 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:42 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:29 +0100
Subject: [PATCH RFC v3 13/30] ARM: entry: Create user_mode_enter/exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-13-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014144_789082_42B01DB2 
X-CRM114-Status: GOOD (  18.95  )
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
index d5a128a4228dbdf5825aca7385deb94b473716a8..9a6ac09741109367f1bc30ab7f556ea35b30e0f4 100644
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
2.47.1


