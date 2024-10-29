Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B66D2AB20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4s7yTStZNPQghs61B8MN+wTLfopUv2dudvbP9oK+hzk=; b=tLG0af4RqYbk3HcOFNVKqdS3/g
	IZJH04Bou5NdVjjKEPm2BzNGyeQZHN+bN5PwOZ82tz5ts0AiH7w59veRXZtBhwX50wbF/5StIOZlm
	UHXXoxIqphAOXJgEb22rPZNP6twoJ/WVNgs/dZDnAixRyiNJjPT7bUhh6t3ogzBl/Cxu4mHYstow+
	N4iuSPfvLvetDtEWXIAmwx/6C3aFmRXKM88IyAYqbvaOGTjyj2Kxxw/a50HK2eQj9U1gBpqeVAtoR
	zrYDx2cz8ibp9EhSLC4iGGYadKRHI0lrxZBQ1IrnY8bhieaag1BcTmgCtj2gy04yjgvGuNmWuV4Ge
	pOdhPOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kYe-0000000EG5d-0idP;
	Tue, 29 Oct 2024 11:38:44 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jql-0000000E7RF-2hwk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:24 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e6c754bdso4744389e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199201; x=1730804001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4s7yTStZNPQghs61B8MN+wTLfopUv2dudvbP9oK+hzk=;
        b=A1gBg48LuUDDQ4HBNaABQFOpgITE0tv56VDbSB4WXWpSy2JzCbByfPneWY+eR3cqAr
         3EDS8bj86b2640hYDD/ehCRFWKtMHLyBKWlVcN0n5/SSJ7UOJWGlm8heJjXbNwGqzAhh
         r6oDYeuT2mGb3ljIVZhEGsQ7tds1UI2lQw+jOpjgI4ozZXqn+UJGiPjVs5vZ2Pw9d/vd
         5iwXH5Y/DGcHJnazJzAcQDexKOfDwXKteS7oDpsViUx+kPJyVDocRwbLGMAsO2TXNzeJ
         7sQ8JixOpTrUmuDRVQPWsoXdplu0Qk8LxgeWWfspTlQwwEmIwp7Nx3Trj1o/lSVA7lU1
         rwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199201; x=1730804001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4s7yTStZNPQghs61B8MN+wTLfopUv2dudvbP9oK+hzk=;
        b=Hcz35vwnlYNZz4PPY3oK6a9vMaQUTi1g/NZGIhFTlgEnK6i+OFN5iZvRGL2FsLngNg
         hwl1huzgDVD3VKYKYI85F8c7jmgSMtvYJ3Zci6J2PmFaVToQtmjaath4oYSezNzYvPpc
         L0ATpaESAMb9MWY5YYzNcfAGLyoKmS3s2urUbTUC4Y3qsp0o9xKMkP23x+To7HqlLGPn
         Xi/NKrE8TKCiftRSXb7OR2H/1juAaJk7na06idm0edcisFTzWwEZutVZKbWYiOJFVSHr
         qPfJVt/aRNlwobbT1yDioi0fLl2Dv/cRuFEt1CmcDiDIh1n/1nBZPt6f1YEp3z+gMDSI
         uJCg==
X-Gm-Message-State: AOJu0YxBMlioaBX/JtQ/K542EVo4ShC4NESznj8DXQ2A+VDuJ6u6Cs5H
	jcPt2STj+y6e8Sf4s7ipm+rft1a+3X0owwVGYsu1JpKhPM6YZPB6io/MpFKH9cw=
X-Google-Smtp-Source: AGHT+IElXNTIUEjBzs2hSzfFmPti763QWvOuxnOHRmGwE5++Rd45XLgtaXunwBM8zueTxRgHduPWMA==
X-Received: by 2002:a05:6512:104a:b0:539:f4ab:5638 with SMTP id 2adb3069b0e04-53b34c466d0mr4122591e87.60.1730199201347;
        Tue, 29 Oct 2024 03:53:21 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:59 +0100
Subject: [PATCH RFC v2 19/28] ARM: entry: Remove fast and offset register
 restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-19-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035323_734990_DD27B1DE 
X-CRM114-Status: GOOD (  13.85  )
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
index 09ce1be1f677..bd468d58dc02 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -496,7 +496,7 @@ __fiq_usr:
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi
 	get_thread_info tsk
-	restore_user_regs fast = 0, offset = 0
+	restore_user_regs
  UNWIND(.fnend		)
 ENDPROC(__fiq_usr)
 
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index dddbd6ba1eb9..d27e34d7e97a 100644
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
index 50c0b55adc74..51c7f93c1ded 100644
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
2.46.2


