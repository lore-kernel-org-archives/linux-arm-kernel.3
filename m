Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253C5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SK4XvykyJ6Zn+vIxSK9vSx/zpAi4l4ILYAtxYCxqygE=; b=g7/P4g1QfOKzrpU++fXNbSyhy2
	5R4TVStMFsHkcpODO27PZ+w0mjd6/HvIOBPyiouU9Ht2blWQpXjvO95/SYAQ/BWvqdFNj0JsGr2co
	WdnKaAiIzzFU0CsG5QiQZUCSFaUsM5Nfs+z311uFFHuQshvrBuewpsWnBV7wtPPWQCVlNi9A8xtWZ
	4XtpnozBwcxLc6ZiU2KH0/2YHCPGXbSkylZMRg/tPBPoXYl2dO4H4DU9ePwHkUPzus6qijqteneD9
	SmpSx2A755DuiUTxxiCKGBj+RkukofD1xg50my1YN6jhmlS5Bfc+NpDJGXV6cjAkDxhLsfv/boXZW
	fd6eBgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBJa-00000007G7U-3wSS;
	Wed, 12 Feb 2025 11:54:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq2-000000079iu-148f
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SK4XvykyJ6Zn+vIxSK9vSx/zpAi4l4ILYAtxYCxqygE=; b=AaYDmye1PBa+Zo2pJhpPuzEoIN
	jKe6ytlZBhoLESNjXkWfW1joJhGWqnEI2mWHrpkThZh2lRselb+gp083HwNXwOhWu24OgxgYMo9EU
	m2fg429iW5mMzSj0kYa04HE5Agw/6tZ8L0WCZU02ItuSlZ9Ph37Oqg3m1WX7YVoWCp9mM75mdwiWV
	Ufl2QtiL4r5iuO3q8EhEN44rztKhBmwmJanC63+kLyZrc6SKadDukJo3j11sqZYKCZ7xunjt1u7dd
	UnkfHgD4/bKvhcNpP21qGYXDf+zcXum1xQOHAclUAWbWRWMEbFX/OvI4PXI+fbNuaBk3/BaLQRiSX
	/P5BiMyw==;
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApz-00000000npC-1HQJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:29 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30761be8fa7so60302561fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359406; x=1739964206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK4XvykyJ6Zn+vIxSK9vSx/zpAi4l4ILYAtxYCxqygE=;
        b=WblPLfXJezDuAeKQHnLXddAkSBbDlndbmbnPxDpR61AkCkG9Lv+cbiHzkG1bauPEJH
         9e//NZhDinAcmp8cNDnUlXDMWjD0nYQz9QvKBeRBMZdXmSrhvykNlApwLVU5QcHhOuXN
         OFDx372fJacOzPW495nA0ZD+bH8MD4ZOUOI+Gq8lULGywfi5WpZulNf+bkVsnXafFca8
         3y2FS+vngbRL1DPL9KY+OV9ufDX/3Gcz9Dm8lrFrqIZ+RKCGTJ1dBFIrFPvslpp8gnbe
         HJX81rlkIxjaGqQDJZ7XNBNXO0zswBDtBKdeX1YakC3PHg2COXT57Dpvkw7cI7uC8ze6
         4yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359406; x=1739964206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SK4XvykyJ6Zn+vIxSK9vSx/zpAi4l4ILYAtxYCxqygE=;
        b=A6usirTD7CopPsmWsRuZkMXRTymXrxJSduHPeKbv+3Dyz9fdzu6Qf0Pz36VC0W/xP9
         NI7ufzmucnORNLCrqqWBebEkCkTeBUQHlGDaY96PSli2sKsHzOMyfQHAwWK45cScc16e
         XaLnJc/YPXAEuSbiN46xa7stmd3BLvHSZTz8IDzkdmKoD/hSTawieIOXjgDGt4Bnb6DU
         RhMmgwOhD6QYyhvXBaQG0UJdlT47foTn8YqNkwvjRwx1ik/IAxmZLiUVxhsx4T9LKWq8
         qMCYqMGhDmpFiAFjDp9czDfarG1xi8OognchPcD5QIG45uc8n1pJb4TUSJmfH1/WaQSH
         /xxA==
X-Gm-Message-State: AOJu0YyB5pyrJtv9mP2L2qUMvFpwgIs8ojbxge9iyNQl8BJHro1assJ5
	EuhMytBG1eqmRUWDL898fE1PUCU58T9+q2sf4mbk2fffUtSUw+N112X3QXqumhM=
X-Gm-Gg: ASbGnctXstwlBfdpMVsPZyhgstYzfEPXahnV1VleCRKZeUN3amUAAj7r0bnGK0O3ZvZ
	MamNCj968Sqt97QpH6sMWQe5HEDcWBaOCoAgBC2SxxsRD/WNQ7S+1atwo+CvAfYEJ/mRbuAvKa9
	gcjFIuPSl7zBNppUR9qVp5i8fT/AIbwW1cDcUuX4aukCpr6g8HLF7CcjY/OyKSlKsRcJQ+VaXFb
	wLdOTRj9MyC8KZXqWokNGTjYe00DFxWxYRhLgsX7Mk6jC7zOsG03WA+WnKAes6ldnGMUQfM87i4
	Dviv2iNoXpMW7TSdM++B0y948Q==
X-Google-Smtp-Source: AGHT+IGZGX3RxfrWPejP/YO09nPgCO79pvl584D11RVURMnv/+ySzxg9C6vPdPm/xocAoi8IjTVcCQ==
X-Received: by 2002:a2e:be87:0:b0:308:f0c9:c4cf with SMTP id 38308e7fff4ca-309036f2cd8mr10642481fa.33.1739359405778;
        Wed, 12 Feb 2025 03:23:25 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:25 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:13 +0100
Subject: [PATCH v4 19/31] ARM: entry: Remove fast and offset register
 restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-19-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_112327_629250_C811998D 
X-CRM114-Status: GOOD (  13.78  )
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


