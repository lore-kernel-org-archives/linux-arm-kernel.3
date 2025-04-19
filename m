Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D78C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smP6wtuEPxGQlG+yx8YbiPVrmm7vWSzlxcMcUy2wQgU=; b=3JyVlCrDAQbByak81AKTa+1KB4
	ntm0zO0UnKLhohUny90xsogQasLGNfwqjNbMv9jqyhJKfpJ6sePUhIVmcYUcqC/0iqoylGNWA7ngA
	pU0khSf63RHcC/ox0FUHp7VQmklqL5dGB6nthXodYHYw4VCVNWoLLWls4SC1y/bPOtGQCbDvNmk+D
	2UV8h1uMpwIEC1+CnTNwb751uPrEna7a8xM6z7eYUFdEJfzJeZI/sR2WPyZMBRcgv9Iqu6VGfWis/
	fogPUKeFNWBx2E/5Tx/uW7PAswW7RQe8IXYU2lxt0Phk9hGMQnkA7Pthw2dePlbH/Oi+jk64yX+H9
	uTbmF51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HOI-00000001wUI-2sg6;
	Sat, 19 Apr 2025 23:14:30 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnP-00000001spd-0H0C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:24 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54c090fc7adso3177117e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102181; x=1745706981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smP6wtuEPxGQlG+yx8YbiPVrmm7vWSzlxcMcUy2wQgU=;
        b=UgGUSWoZLVSrv4WKRfCKEF302N/0ulpRM9st8T5wD3rB0rJ/aY0tFXov+WbypiPRO1
         glq3fM3/xXafVOBgR3a8nXPxXKkqPDBrP/oAmceY3GhyJj2jvkD6cYKuj8gBODceGNGu
         3cWeYb5op4OPZwCIXQ/Q9REG3RbIyF0x+SKfaTq07jQHHsKnT6vFuPSnz+NydxlxNgPZ
         xLbRPmG8dh1X6JJ03FXixxgsE/WLdi/2lo+P9S0ftfgtPNc/eOYOsb2KpBFy8l1ijqX8
         bUeNaVFHI2v8Tv9rM4XbNmSy7WaMgkjyTQt6r9oOdX8PDnc6BMSofZn6MYoh27QS/su0
         BG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102181; x=1745706981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smP6wtuEPxGQlG+yx8YbiPVrmm7vWSzlxcMcUy2wQgU=;
        b=L79UApsqapBOcbvN81UEL3tzqiHD+eq7JZxbDX0zp3FO8XO+1inIs2bWGCG9dEzRKT
         zSMunEo7h1aEJ6w99qV61XAhPIoWYAtKQuediWO+GfTkjkh0TNWM0Vbr2rVy0gmtDmr6
         jG1H6ovSF4/2IaSQ77/500yYzpn7QW6q1nu1tBEkuC261ySE+dHgArsN5koliHLLJOUu
         KNkc1dl2QzDHtV6qdI6Rlo4wIuFKrM0iyz4japiqQ9f9z9Z+4udcrAk1VHrks4MUqeK5
         SPj/zK4KnR7zh3eEJGFzq+/PtlmajrfnGsJ63iKImBcifGQgqGIkOdccITw11SYHrMtx
         +TIQ==
X-Gm-Message-State: AOJu0YwbUJxcgeoSn19eonQm4IjmmtkpyqB5NTXZmxRnd5DUcIEFXNH/
	lbMuzBvVTS4zMFQI2bPgqnewmuzHuUlwuSTgRb6fyk6UeW8Lfg1TKBxzlJyXLIg=
X-Gm-Gg: ASbGncu3RpDrCBqbxEws0CBItTAz162C4u0dxe/tPI2+Ty2/4Z06Kqr47DgPMevC8Q/
	W8Dlr1n7Gl7lW3x0ye5QKo/GHsTqzRwgKZM0l9egtkITLtVyTP5i9ei+eW5NTq7Kn6jXoamg4Wt
	dMrWwm/oyBezQ6wt0dgOcq44M+JK/joz5uKYY7mPdN5EEJvbRfbjgnz0TdpJPmUGpHIxKXA2alK
	sB+a5dGbiXb4sOfl1BluYfTtT5TJ2cn8mg4XYvlpeY9oOSbueGyQd7vZWgKOSfSU4UthIW6kPbK
	CQyTp18LD1RfabOUi6c94IVLbljk1iuUgxGhhoowvuwXay++vPs=
X-Google-Smtp-Source: AGHT+IEXHVxk/ZPzizZxk/wtdsPQEkeFJ8rWxX8XwR/1XQy0SnPGf2l5NdkpLMSSJywv9IZRutxODg==
X-Received: by 2002:a05:6512:1106:b0:549:38d2:f630 with SMTP id 2adb3069b0e04-54d6e62b9damr2006675e87.24.1745102181592;
        Sat, 19 Apr 2025 15:36:21 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:06 +0200
Subject: [PATCH v6 19/31] ARM: entry: Remove fast and offset register
 restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-19-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153623_124643_E1BE6BE4 
X-CRM114-Status: GOOD (  14.54  )
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

Now all remaining invocations of restore_user_regs has
fast = 0 and offset = 0 set, so drop these parameters
to the macro.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S   |  2 +-
 arch/arm/kernel/entry-common.S |  2 +-
 arch/arm/kernel/entry-header.S | 29 +++++++++--------------------
 3 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 460aa92c3c1f50de905550acf363c58f509bfe0a..3cd5a80b47758867d1db6c3971030370bca1551a 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -497,7 +497,7 @@ __fiq_usr:
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi
 	get_thread_info tsk
-	restore_user_regs fast = 0, offset = 0
+	restore_user_regs
  UNWIND(.fnend		)
 ENDPROC(__fiq_usr)
 
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index dddbd6ba1eb9fcbc2c0d81f24e1a9b3231558d7f..d27e34d7e97a079d62e7b778cf7cf97c302e4763 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -81,7 +81,7 @@ no_work_pending:
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
 #endif
-	restore_user_regs fast = 0, offset = 0
+	restore_user_regs
 ENDPROC(ret_to_user_from_irq)
 ENDPROC(ret_to_user)
 
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 50c0b55adc7421e7be123c9d00f94b1ebb93ff9e..51c7f93c1ded1db56f173c7aaed8094ef011ff5a 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -290,7 +290,7 @@
 	.endm
 
 
-	.macro	restore_user_regs, fast = 0, offset = 0
+	.macro	restore_user_regs
 #if defined(CONFIG_CPU_32v6K) && \
     (!defined(CONFIG_CPU_V6) || defined(CONFIG_SMP))
 #ifdef CONFIG_CPU_V6
@@ -309,8 +309,8 @@ ALT_UP_B(.L1_\@)
 #ifndef CONFIG_THUMB2_KERNEL
 	@ ARM mode restore
 	mov	r2, sp
-	ldr	r1, [r2, #\offset + S_PSR]	@ get calling cpsr
-	ldr	lr, [r2, #\offset + S_PC]!	@ get pc
+	ldr	r1, [r2, S_PSR]			@ get calling cpsr
+	ldr	lr, [r2, S_PC]!			@ get pc
 	tst	r1, #PSR_I_BIT | 0x0f
 	bne	1f
 	msr	spsr_cxsf, r1			@ save in spsr_svc
@@ -318,31 +318,24 @@ ALT_UP_B(.L1_\@)
 	@ We must avoid clrex due to Cortex-A15 erratum #830321
 	strex	r1, r2, [r2]			@ clear the exclusive monitor
 #endif
-	.if	\fast
-	ldmdb	r2, {r1 - lr}^			@ get calling r1 - lr
-	.else
 	ldmdb	r2, {r0 - lr}^			@ get calling r0 - lr
-	.endif
 	mov	r0, r0				@ ARMv5T and earlier require a nop
 						@ after ldm {}^
-	add	sp, sp, #\offset + PT_REGS_SIZE
+	add	sp, sp, #PT_REGS_SIZE
 	movs	pc, lr				@ return & move spsr_svc into cpsr
 1:	bug	"Returning to usermode but unexpected PSR bits set?", \@
 #elif defined(CONFIG_CPU_V7M)
 	@ V7M restore.
 	@ Note that we don't need to do clrex here as clearing the local
 	@ monitor is part of the exception entry and exit sequence.
-	.if	\offset
-	add	sp, #\offset
-	.endif
-	v7m_exception_slow_exit ret_r0 = \fast
+	v7m_exception_slow_exit ret_r0 = 0
 #else
 	@ Thumb mode restore
 	mov	r2, sp
-	load_user_sp_lr r2, r3, \offset + S_SP	@ calling sp, lr
-	ldr	r1, [sp, #\offset + S_PSR]	@ get calling cpsr
-	ldr	lr, [sp, #\offset + S_PC]	@ get pc
-	add	sp, sp, #\offset + S_SP
+	load_user_sp_lr r2, r3, S_SP		@ calling sp, lr
+	ldr	r1, [sp, S_PSR]			@ get calling cpsr
+	ldr	lr, [sp, S_PC]			@ get pc
+	add	sp, sp, S_SP
 	tst	r1, #PSR_I_BIT | 0x0f
 	bne	1f
 	msr	spsr_cxsf, r1			@ save in spsr_svc
@@ -350,11 +343,7 @@ ALT_UP_B(.L1_\@)
 	@ We must avoid clrex due to Cortex-A15 erratum #830321
 	strex	r1, r2, [sp]			@ clear the exclusive monitor
 
-	.if	\fast
-	ldmdb	sp, {r1 - r12}			@ get calling r1 - r12
-	.else
 	ldmdb	sp, {r0 - r12}			@ get calling r0 - r12
-	.endif
 	add	sp, sp, #PT_REGS_SIZE - S_SP
 	movs	pc, lr				@ return & move spsr_svc into cpsr
 1:	bug	"Returning to usermode but unexpected PSR bits set?", \@

-- 
2.49.0


