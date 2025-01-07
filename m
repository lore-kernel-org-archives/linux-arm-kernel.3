Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90547E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tm8Sr1+K14orzlSuTAQl0kAeE85JLIYVrwIxTxn0xos=; b=Wb/ClgQFzoSpPMrfBZiLLbpxU6
	f9gviTxqvKFCaxwJw05Yuxj0hOGaL3Qv/zoPGCSNJBV5W5PrkF9Z5cTqHuR8BJ3neVu4zl/ahdFj1
	tCyvsYZ20dYPa8nzHa4yjhwGqPtFhOr4qB1Q3q7vP2oIwQB+WlFnI54HX7SzdUSPVBz0MvhppIm7U
	Zg5uwhpj9O6kRjBzVEu9iChs1GtiX6V81lcp+yxAepRa21l3bwiaNiXjuZSC77eVP3b2ElSjlYs1k
	dkFApynwpkdX0NJjtuJi+app8zHVi0ZFtwKbcuYWev0u6UEqv7S0MAR1xuf2AHsJbuE1i3HZVu1wW
	T5FVjbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Sm-00000004GEL-0pVq;
	Tue, 07 Jan 2025 10:05:28 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65x-00000004AWB-3w4s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:54 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so20774719a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242912; x=1736847712; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tm8Sr1+K14orzlSuTAQl0kAeE85JLIYVrwIxTxn0xos=;
        b=Xo5iZtEgrMK5O91GEH9K0m0M/IlCVPBmBmhg1ZA+GdEKy3PnMnZXeEhuGk24S9/A5T
         RTKaoh/5ai83lX1VXe79b9OCC/7y6CxvH9x09hFMvazwUSS8JhzyXOj9ez/8j0P2IbU/
         o2G+fpIAH4W/VVY8lfw4JVHbNIQI2hxCee6pRiVKoJcTwTIhJ1Eh5J3ER+oQr/pwzPTC
         EgbDnR9j88GzWcQLVFmsN01D0TQ/wqB3NFZrSpG9CU0+6xvtwalzIP+wTXzvgLTV/GsL
         H4DMLi3KbSrWAHfuDYOGWMF0agOqv9eXeZD5OJ3UlvecZGzNmXGxLKZaT+VcJHlAMG24
         cveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242912; x=1736847712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tm8Sr1+K14orzlSuTAQl0kAeE85JLIYVrwIxTxn0xos=;
        b=wySZK6KxI2m48b6m+zgI3ZGI2YnrrVMoImka8L8mcJg7+f4s5gaYpixLpb3gKK3VIR
         b+sSCG+jzvaLI3zaTOeXz26bLhmuNpeJMQCzIBnl61LHT+2rA1e2xyG8IcgyVmaXZkMi
         UNrD5FwKMOp9rN5/W+cyuhgPqr4v4mwGXj97RfWVeGisku5HeMeIHo+MMQHPRuPvtWgn
         ybvD5xpXynW48Dpi3mfgZBd1U0draLB9z6zIUerFvOaV2rtlWvBU1oo5e/cJbxhsxyqv
         bS2faIL+asC/PbYxewyYk/Om3vXH7V153R5y7ikGUkc+SQ8Q+2wuXldf3HkbYmg3i4gn
         5YGA==
X-Gm-Message-State: AOJu0YzbTP71aBNnVZarJerGhetwb1XEyY5tGuHKJE/f+Wy88n9Z2Rpa
	i8qNNF0E13xP6kfJsDxYbFh4xWeOgDy+7uXC/0xdW3vOY4KkAWZhL8r2VG8uBd4=
X-Gm-Gg: ASbGncsMuBn5/XcJd343msY/ZJzFVAAkG2lKMqYAmG6kpcSvfN2s1S+66zSLhC8uqBX
	WT6ZDpxsglMUuFydzq1KUFi7yplWu37h8HFaSwGe1wDsTkikKuvXjcmJJr9ZX1wDZe+RkMwNzZa
	kFVLCN0b+UCJ+lDqXLXP0tbpVOFGo7WFVNP7JPpXVMYprRWAPGtcqESBT7f4qopzEVWiaDb5uNU
	Do1MmPdTQmHxMS8bFjhUoQUiSgNCkbpdExBxo4b5wwQnmaQVwtgAAUYEvEWhYsWlwo=
X-Google-Smtp-Source: AGHT+IEoUYCHmiu2LtqOgL3Sk5UkLCViigDDsF2BzL3K9BciTMZDokF+kh6Ppu7b80wGUY1bqQWgoQ==
X-Received: by 2002:a17:907:3e1c:b0:aa5:2575:e75d with SMTP id a640c23a62f3a-aac270369b4mr5485696266b.2.1736242912197;
        Tue, 07 Jan 2025 01:41:52 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:51 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:35 +0100
Subject: [PATCH RFC v3 19/30] ARM: entry: Remove fast and offset register
 restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-19-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014153_984405_882554AC 
X-CRM114-Status: GOOD (  13.74  )
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
2.47.1


