Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F305D2AB1F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPx4kMCDrheeY8xWYJ0qE47ahtpfJ0dLdCDyA5qyaAo=; b=y/3PGdCg76wGdmuD3N7zkHHhXR
	i2QqZaxvndgMRPcLFX+276ZN90YJY7wRABTQDHGpIceD/22s/eGrNsDHhOsRFDIArJNKkMxDhCt0n
	ou0VeZVqP9N8l0iUuRWleaPEmF8lHiX8rc6QXv7GQ1qvEp0pUPP/yjORe138vnj4EiVN6mRyk74+S
	l7EnHJhJ5FQr9XdG/zcG0buZXkk8RMGrCNhyybwN8YNkJsgvLpZjQrwVGaqIP/oCwhU0f+EAeD3Vz
	m7ih8IINMF8/pici7hsffWH8k3UGKVbecCW0m7xR6regTrUw9GFLg9uw+LAm5Lbi2j5ek+w8OfNuu
	c+AU/O/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kSE-0000000EF9i-3XHR;
	Tue, 29 Oct 2024 11:32:07 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqd-0000000E7NK-16bH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:17 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso80044691fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199193; x=1730803993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPx4kMCDrheeY8xWYJ0qE47ahtpfJ0dLdCDyA5qyaAo=;
        b=HyPJumtxfxrAEnXUNvwegHoeH44nAc7EMwwDPveBMJ7bvIhKWQZPZw/aGKQf7yZXxG
         oj2NThVNX51wEA4RrWYnTgzhda0IJ6CKi2qISfx2+3vNUgTjtFKVVnWdknue72EtG1Uv
         1HedpX9HRq0ZCPa28IbktyGoN6XfSXygfPFhlzGdmJ06h9xNeguG+2+zI63OUb5mwDQq
         yn+do2iC9LpeYrhaP9vGDR0rRJ7bRviAZHCPKZqqsSu/xxUiYiZDQq0rNq4y+lgMIpV2
         CAYI9GpYpoyI6Y1/myQ6ZKMBWZrTCewiB7EItyvypA4kMAh7Q2K26LaFgLzmuvZI5Qbn
         unrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199193; x=1730803993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPx4kMCDrheeY8xWYJ0qE47ahtpfJ0dLdCDyA5qyaAo=;
        b=USQVQs5fDFSiqaKIU8eW7G2Oc3XFuTKYLGWz4H/hUFAlISZihTsqJYzAGZIO5HO6c+
         AE3fkZX+BTWxPcqdhEG01635aOSQx8Nvy91HS2lR8oJBoTbmip1H7o2RJeSLvEXbvuSW
         xEXWLi+DywhymV6TepOQzx+0Kd5EgDGPAyBLP606HFKjrVx+xOmnCRVA6plUAY0EzBzw
         Pi1srQj6gpu2KqKr1Rb1Wkn/70oXpFHftw9qlbNdO4HItaPGsyriwEI8EeWVe5j/xzud
         zPB1L1/z2CkPN9ZkZU2c46SGKbTmPiZVLwubeeXAnppsAMApH1z3Wk0f6d4l4/IcjAL7
         MAZw==
X-Gm-Message-State: AOJu0Yzy3SU6tR9245/J7JU8FmEMul9HgyZFfl23JtQioy0DwRLyPnxG
	6geqAXo2IpF/iSzDPIh7YP/0SYoCHSa/LpvcKqz1JAaX+qZW4prPIhqj2ccBTog=
X-Google-Smtp-Source: AGHT+IHn5Jo6MxlNJU5iIOZUqab7EQOi+XN5sQRY1pjOsF1gVhbe2i3K7M96BCHGCpFL++J60EFYIg==
X-Received: by 2002:a05:6512:a93:b0:535:6925:7a82 with SMTP id 2adb3069b0e04-53b3491e2c7mr8892647e87.41.1730199193203;
        Tue, 29 Oct 2024 03:53:13 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:55 +0100
Subject: [PATCH RFC v2 15/28] ARM: entry: Separate call path for syscall
 SWI entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-15-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035315_444943_81DFEE2C 
X-CRM114-Status: GOOD (  18.63  )
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

The syscalls (SWIs, software interrupts) are deviating from how
any other interrupts are handled as they enable the IRQs again
while processing the syscall, while "hard" IRQs disable all
interrupts until they are handled.

Break out syscall_enter_from_user_mode() into its own function
and call it instead of irqentry_enter_from_user_mode().

As we are moving toward generic entry, we use the signature
from the generic function.

As the generic function requires the syscall number to be
determined, we move the call down below the code that
figures out the syscall number, the only practical effect
should be that interrupts are re-enabled a few instructions
later.

As we move the trace_hardirqs_on/off() calls into C, we can
just get rid of the helper macro usr_entry_enter again and
call asm_irqentry_enter_from_user_mode directly.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   |  1 +
 arch/arm/kernel/entry-armv.S   | 16 ++++------------
 arch/arm/kernel/entry-common.S | 18 +++++++++++++-----
 arch/arm/kernel/entry.c        | 14 ++++++++++++++
 4 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index e26f369375ca..e259b074caef 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -8,6 +8,7 @@ struct pt_regs;
  * These are copies of generic entry headers so we can transition
  * to generic entry once they are semantically equivalent.
  */
+long syscall_enter_from_user_mode(struct pt_regs *regs, long);
 void irqentry_enter_from_user_mode(struct pt_regs *regs);
 void irqentry_exit_to_user_mode(struct pt_regs *regs);
 
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index be2df297ec0a..0328860475e1 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -402,14 +402,6 @@ ENDPROC(__fiq_abt)
 	zero_fp
 	.endm
 
-	/* Called after usr_entry for everything except FIQ */
-	.macro	usr_entry_enter
-#ifdef CONFIG_TRACE_IRQFLAGS
-	bl	trace_hardirqs_off
-#endif
-	asm_irqentry_enter_from_user_mode save = 0
-	.endm
-
 	.macro	kuser_cmpxchg_check
 #if !defined(CONFIG_CPU_32v6K) && defined(CONFIG_KUSER_HELPERS)
 #ifndef CONFIG_MMU
@@ -429,7 +421,7 @@ ENDPROC(__fiq_abt)
 	.align	5
 __dabt_usr:
 	usr_entry uaccess=0
-	usr_entry_enter
+	asm_irqentry_enter_from_user_mode save = 0
 	kuser_cmpxchg_check
 	mov	r2, sp
 	dabt_helper
@@ -440,7 +432,7 @@ ENDPROC(__dabt_usr)
 	.align	5
 __irq_usr:
 	usr_entry
-	usr_entry_enter
+	asm_irqentry_enter_from_user_mode save = 0
 	kuser_cmpxchg_check
 	irq_handler from_user=1
 	get_thread_info tsk
@@ -454,7 +446,7 @@ ENDPROC(__irq_usr)
 	.align	5
 __und_usr:
 	usr_entry uaccess=0
-	usr_entry_enter
+	asm_irqentry_enter_from_user_mode save = 0
 
 	@ IRQs must be enabled before attempting to read the instruction from
 	@ user space since that could cause a page/translation fault if the
@@ -479,7 +471,7 @@ ENDPROC(__und_usr)
 	.align	5
 __pabt_usr:
 	usr_entry
-	usr_entry_enter
+	asm_irqentry_enter_from_user_mode save = 0
 	mov	r2, sp				@ regs
 	pabt_helper
  UNWIND(.fnend		)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index ff1dd3169346..14b2495cae3c 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -109,8 +109,6 @@ ENTRY(ret_to_user_from_irq)
 	movs	r1, r1, lsl #16
 	bne	slow_work_pending
 no_work_pending:
-	asm_trace_hardirqs_on save = 0
-
 	asm_irqentry_exit_to_user_mode save = 0
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
@@ -189,9 +187,6 @@ ENTRY(vector_swi)
 	reload_current r10, ip
 	zero_fp
 	alignment_trap r10, ip, cr_alignment
-	asm_trace_hardirqs_on save=0
-	enable_irq_notrace
-	asm_irqentry_enter_from_user_mode save = 0
 
 	/*
 	 * Get the system call number.
@@ -256,6 +251,19 @@ ENTRY(vector_swi)
 #else
 	str	scno, [tsk, #TI_ABI_SYSCALL]
 #endif
+
+	/*
+	 * Calling out to C to be careful to save and restore registers.
+	 * This call could modify the syscall number. scno is r7 so we
+	 * do not save and restore r7.
+	 */
+	mov	r0, sp				@ regs
+	mov	r1, scno
+	push	{r4 - r6, r8 - r10, lr}
+	bl	syscall_enter_from_user_mode
+	pop	{r4 - r6, r8 - r10, lr}
+	mov	scno, r0
+
 	mov	r1, sp				@ put regs into r1
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 	mov	r0, tbl
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 8b2e8ea66c13..1973947c7ad7 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,15 +1,29 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/entry.h>
 #include <linux/context_tracking.h>
+#include <linux/irqflags.h>
+
+long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
+{
+	trace_hardirqs_on();
+	local_irq_enable();
+	/* This context tracking call has inverse naming */
+	user_exit_callable();
+
+	/* This will optionally be modified later */
+	return syscall;
+}
 
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 {
+	trace_hardirqs_off();
 	/* This context tracking call has inverse naming */
 	user_exit_callable();
 }
 
 noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 {
+	trace_hardirqs_on();
 	/* This context tracking call has inverse naming */
 	user_enter_callable();
 }

-- 
2.46.2


