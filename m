Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63630C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SK4XvykyJ6Zn+vIxSK9vSx/zpAi4l4ILYAtxYCxqygE=; b=dALFm9T1euU9J77mZnOBbTkeP4
	CbBFOGYD4xSy3pTej7IvWrA37VN2mEKvUNwRwPdtwOAKtdIH/NmX1aprQnPhZFQm2ABHGV7maEer+
	jZ8mDfDvofoFKc1A/oyOvEEESF2ftm6+9tmA8Y1J4tUzoEV56A8Ury7G9KjXJY1dkgsW7ZbfBGg0K
	hgKOUiduj4fCBiwmGyt/tTAl782xMTETcYTD4ixbDJhjTBev1HjFvvi3QVFaNDhsoaOWGRgaRgqp9
	MrTIy2jlIP1+zJ6y7zx1gUlCjpsTMIBzHO9EDaBDLFad4l4M3zLx5DdIeRQzWb0GiGRSw7LtFVNnl
	iUke3ckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsKK-0000000GrIL-3fU9;
	Tue, 25 Feb 2025 10:38:12 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmret-0000000GhkG-3WbE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:24 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-548878c6a5aso293991e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477322; x=1741082122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK4XvykyJ6Zn+vIxSK9vSx/zpAi4l4ILYAtxYCxqygE=;
        b=FPcXIfODQwlfwoOet4GZJS1RnG7nEgajEmxMTqg4JDrVdBPpGOOLQoBABmsrxTtcG0
         umCE50fP7kocSbuPBo0OeSTbJOQ5kCDV0ey0RBCaq317m7zVUkWWlusYXAwAVJHAuwhu
         VcPWoCGoi/E2+MLnOoZ2PVjM9mNv06HirWcPCQhJe/btLJ9uE2qWqdAF3dBB/KlI9Mdt
         y7a8oCTBKYTiqN/4rKp1cfFjM7v8+7bwMC/DQABcQK3Ty7gpJrnW9iUibqMEgb4hlMHL
         9S/mRmzoyu5+IC36UpjRBEG+tFnEV11O164pPd59iI2OqGvAmYrRqmleHN4zaQYjJQT9
         Dwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477322; x=1741082122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SK4XvykyJ6Zn+vIxSK9vSx/zpAi4l4ILYAtxYCxqygE=;
        b=RZKe9DPfWBaLpIKNvaT+9t8i5o4H7y2k0KIZoymN1h9aAH6uN3Q6ugKuyd3d142ARK
         xMv5E4tSRrkbqvcLURBv96nxfaq1fV+AJawZwVN+/I4g1K0WX3ZZ+u5X0WBja5FjvaLV
         jRi2fYQgFXRt4evft7nYqEChjAoji5qOeVTS7rJBXYJhdtqZki9uRQWi+1wmbiLOuC+6
         x/dJL06aNwd7OYUuUDiIkQZG3Re6gBLdTVdPnwllvjcC1MIK/4gdgt0+h3r3FgTSpZEn
         5oNI66RkVqZeFk0EqgyjpiCvP/mnOYzULX0tVSH7hVOYLgLaMrBBHcwcw4b8fVbnJSa8
         9nCw==
X-Gm-Message-State: AOJu0YziVRDn/ZU4kgFNe/5Lmonr0zhxxs3rF/5mq2i8AhwXSBdy6bJJ
	QRcaVVfLbSzRT1bhTJCg5N+HOQwiG7n18anIXt1JOt9Zj9cHPukH1SCDuFSVNRY=
X-Gm-Gg: ASbGnctnKILjBds4f47D+jl/i73LRyc9l0nenjtyLydz4NE/MSivhxxIx/IvMrOWsY0
	CwOr+gmcJPIAlxNdQdmUFkKEecsZ+weF2CNq7n4zrthZzG4E+CFlGWY9JfQQ6cDylePJ6mt2r09
	9idZM+E/YE6Rd2/+qOmgGp8dBVsKY3cKr1e8Bo4SXIzXblKJuJ7tAxyXXp6t5GPtsi+fdrVb5Dd
	/FZnKFE3Gh99IWc9ZBUYCtKw0ldsj+M94D7WtQgoI+mx2jpVA8Dq1kJxZr11hBzn33+3feZwttc
	VZSZ9XaJ9PQGsWhu0/PqsQ11uEhGAXo3HgLO
X-Google-Smtp-Source: AGHT+IHCtJvTxVRz26fQjj6kCjgqj3b1/2GhW8qtHYMwDMQCiPhoAVv8hPhhcX8Zp/SFXBZFx0kpow==
X-Received: by 2002:a05:6512:3f17:b0:545:2ddf:1189 with SMTP id 2adb3069b0e04-5483912fc63mr6223975e87.6.1740477321934;
        Tue, 25 Feb 2025 01:55:21 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:21 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:06 +0100
Subject: [PATCH v5 19/31] ARM: entry: Remove fast and offset register
 restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-19-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015523_886622_DBE1F827 
X-CRM114-Status: GOOD (  13.89  )
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
2.48.1


