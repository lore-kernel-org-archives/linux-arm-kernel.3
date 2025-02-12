Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC2C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggLp2N6nIh1N25l9qqVFGy2pp6+E0t6/i4rH9zHeAXo=; b=Yqfs7EyOcBBlxno5zXvqRyXKUc
	JQHwagMBDYOywhFAHix7AlzOovmKctsH58ce9GTv8phWhlvnDJ5e62OGaGmjzduJyZmf4xRZ6nYk1
	oBa1V2O63D2Gd86PA3tKdM4ZkuxQRy2uV59SZ5bpaJdmCutc0cDMYJJXEdozIScAfHeDLMBtcoG+h
	j8QXtV6OlAyI1zaSHocbtLNxNvYxLYoCkSBPNTk9saEgNhJx6TX/UK2H6AoriRsxiATQpvTWomgW6
	BauLiAuo0Crwo5sdy6HMfIyVeXpE5ogqcI9ny8gHdb33PdYyNqQl3coYNiv5SMNO8djqAGvz8fSeX
	EObltE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBFP-00000007F2M-2lTl;
	Wed, 12 Feb 2025 11:49:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq0-000000079iG-3jDA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ggLp2N6nIh1N25l9qqVFGy2pp6+E0t6/i4rH9zHeAXo=; b=LYAryLDxz9ag/+zTcPSuPxECiw
	ogblM7bFiaMCOyLQ+cwfP0duHGM57k5jt5+x8vIHdhUOnVNGPdBiPrEi4L+qte4I2ic3741bNiwPM
	95CuLmuCgykS4LA1sF4sH2OVlL3LJaIg4TIfIQqHAuNL+y3p9lo52qB3ltL7dbr0yWrdMZ0JZsiwi
	ujAevgh9ILF8S9wG5nynbvd8klSkb2Dsmhwp5vFxc7O0aXLEwFRLzwIFUinAZt19ISfnb+7MINZXC
	t248XY+m+h/3eYY0gV68ChcIpi7LyezpL4adGac0ZuJkOApVqJ5WsfRHyqwOnp64qxX6Nh/it+jtt
	XothSpAg==;
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApx-00000000no7-1Fk4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:27 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30797730cbdso65111621fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359403; x=1739964203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggLp2N6nIh1N25l9qqVFGy2pp6+E0t6/i4rH9zHeAXo=;
        b=mmDn3NhDayuNm3Q5B3sSrvv/yS5ePPoTCEhoR6DDlrhs5fPNLXVvTid/t53J/ScFh3
         V037b3K1yaqx5IOLCpHkdGi8+T8kMwVRxbV1ltrm91xPqp75XKOgO1irBGnhaGfayzTY
         /LNcS4t35wZfG8LSdJXFpebVKtWusYCjzLHS7iMPUx8WHqMrQLsyOXh/g+hfLUeQAAJO
         5AMWIGBSjTdxfhCXxeLj8g5m3LGC7bm6TjJDZttoon4LssSp7bkv8Td4dWe2OOP+7QBQ
         KZzlzbMM51wVIYdtciaapq5HBMp+wXXyz3fwS3JblX5Xzk6d8cmvoaIbaulaaJMMKxvt
         XQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359403; x=1739964203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggLp2N6nIh1N25l9qqVFGy2pp6+E0t6/i4rH9zHeAXo=;
        b=u2tBxGukKy0npamlsJN87mBBG57R1T/SfeEiqRWEkZulS8PRIaAGdEu2/Lbw3xMIxU
         sTBGMxtGXqgNTzSpTa0rmctukfJ+1+NaqCnvzuvYpcBGWtDWHyqFyFIEpJrOiKD5fyoH
         kCfU2W/MqQ6XFJqr+lqBi/FaLgpnqwiaaSgU3/wWBI/51b9akoEOUlu34/b/mU70Wu2o
         j8edNUcJ8nC823PyA0UMapk+NjnWJVRYfJdpvEVykBC1996vL+5CZU3VhCXGceOiLEpZ
         OiqxUwIgb//t/Ek/mP090rXcbm9tNpNJx7Bd3cpRWRRVSl4FRRgVWHfoZMfjxFpaFfOe
         rhNQ==
X-Gm-Message-State: AOJu0YwHZi653YP4kpzEswOKTYlBkHyiLqU3XcCx3gdVrR3oRczv1L8h
	yELyZRZtZQMjmZWu4Xj/c3CzHD/2br6bJRUpRu1sBEu7nDGeZ+ax6GTuQ1Auwak=
X-Gm-Gg: ASbGncs//uvQrRgl/aOu0eHBL3GO7UXLM/Kxt4c1eWBjl0ILXytdzqhbKOeqw2me+lC
	RIyRkIvoWCDseY6bEXdVlZgKC2bxRZai//SmKxfJrOf5wYz/2TVE/TvWMeaQw+Xhhpa4cA17Emu
	eHNB1ohX5h/DuheHVhWT2COk9i9KZ6EZSZoApNuBiQ6DWPgeXXsQPWq6HuWTyDxortd1fGZE6DV
	RF9DzZYH9VPoTauX8Y8/gH2l2rhVo/lGdpjmDXh6AeCinrUFWdrOjZNle4zASp3aeTcKobIK4yF
	iEED1GmOMIdGUAWu9RqGw5gOWA==
X-Google-Smtp-Source: AGHT+IE++2ckcXtWyXX7JU0MwX+37DcqZEVj69OKEYC5Hko3s34PTk0ej3SG2in6uu2FQAzgMWO6uA==
X-Received: by 2002:a05:651c:503:b0:308:f4cc:952e with SMTP id 38308e7fff4ca-309036b51c0mr12255951fa.11.1739359402652;
        Wed, 12 Feb 2025 03:23:22 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:22 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:10 +0100
Subject: [PATCH v4 16/31] ARM: entry: Drop argument to asm_irqentry macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-16-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_112325_528668_D0E362E5 
X-CRM114-Status: GOOD (  13.48  )
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

asm_irqentry_enter_from_user_mode and asm_irqentry_exit_to_user_mode
have a "save" argument that will save and restore registers before
the call to the C function.

Now all invocations set this argument to 0 so drop the surplus
code.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S   |  8 ++++----
 arch/arm/kernel/entry-common.S |  2 +-
 arch/arm/kernel/entry-header.S | 18 ++----------------
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 6edf362ab1e1035dafebf6fb7c55db71462c1eae..460aa92c3c1f50de905550acf363c58f509bfe0a 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -422,7 +422,7 @@ ENDPROC(__fiq_abt)
 	.align	5
 __dabt_usr:
 	usr_entry uaccess=0
-	asm_irqentry_enter_from_user_mode save = 0
+	asm_irqentry_enter_from_user_mode
 	kuser_cmpxchg_check
 	mov	r2, sp
 	dabt_helper
@@ -433,7 +433,7 @@ ENDPROC(__dabt_usr)
 	.align	5
 __irq_usr:
 	usr_entry
-	asm_irqentry_enter_from_user_mode save = 0
+	asm_irqentry_enter_from_user_mode
 	kuser_cmpxchg_check
 	irq_handler from_user=1
 	get_thread_info tsk
@@ -447,7 +447,7 @@ ENDPROC(__irq_usr)
 	.align	5
 __und_usr:
 	usr_entry uaccess=0
-	asm_irqentry_enter_from_user_mode save = 0
+	asm_irqentry_enter_from_user_mode
 
 	@ IRQs must be enabled before attempting to read the instruction from
 	@ user space since that could cause a page/translation fault if the
@@ -472,7 +472,7 @@ ENDPROC(__und_usr)
 	.align	5
 __pabt_usr:
 	usr_entry
-	asm_irqentry_enter_from_user_mode save = 0
+	asm_irqentry_enter_from_user_mode
 	mov	r2, sp				@ regs
 	pabt_helper
  UNWIND(.fnend		)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 14b2495cae3c2f95b0dfecd849b4e16ec143dbe9..df564388905ee019cd5553f8b37e678da59e3222 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -109,7 +109,7 @@ ENTRY(ret_to_user_from_irq)
 	movs	r1, r1, lsl #16
 	bne	slow_work_pending
 no_work_pending:
-	asm_irqentry_exit_to_user_mode save = 0
+	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index fb5bb019199b2871e29e306a29bea8fdf47dd7f3..50c0b55adc7421e7be123c9d00f94b1ebb93ff9e 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -365,28 +365,14 @@ ALT_UP_B(.L1_\@)
  * Context tracking and other mode transitions. Used to instrument transitions
  * between user and kernel mode.
 */
-	.macro asm_irqentry_enter_from_user_mode, save = 1
-	.if	\save
-	stmdb   sp!, {r0-r3, ip, lr}
+	.macro asm_irqentry_enter_from_user_mode
 	mov	r0, sp				@ regs
 	bl	irqentry_enter_from_user_mode
-	ldmia	sp!, {r0-r3, ip, lr}
-	.else
-	mov	r0, sp				@ regs
-	bl	irqentry_enter_from_user_mode
-	.endif
 	.endm
 
-	.macro asm_irqentry_exit_to_user_mode, save = 1
-	.if	\save
-	stmdb   sp!, {r0-r3, ip, lr}
+	.macro asm_irqentry_exit_to_user_mode
 	mov	r0, sp				@ regs
 	bl	irqentry_exit_to_user_mode
-	ldmia	sp!, {r0-r3, ip, lr}
-	.else
-	mov	r0, sp				@ regs
-	bl	irqentry_exit_to_user_mode
-	.endif
 	.endm
 
 /*

-- 
2.48.1


