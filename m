Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57577C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cx+9sB1KcBfjXfw9YO0MHYbVgVBIoUFxRPysD28QEy4=; b=uewxmeeboy2HkX4g2uuSwIOFS3
	zoV9t4+NtOQ5ka07uclXHIOvHK/iFD141xBKk745NmNWnw5JNADppimGVciaghnGrLoTPk2FQLKKr
	zRCKwDfC/cQTl5s/NZghfq2z7kKgC+mLzbTQSwNrPtgUfjqkHlZFcAlnlpiRZwE9I+a2fNdh6RxvT
	h5kTFcxVLBO8Fb0fkOI8rsXNLCf4wfJO1sPeQJy/5O2FZUsfMpq3zjDvDmce9DFeYpkuvaTQGBrE5
	nRen+7PFqvwscCQba8TWtjJGF7cuuGEuFH5HZjEdvWxoyO+IJIVeAYagki5q9ur5PBlUWxDFhr75/
	b2bd6pKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HIi-00000001w4O-2BVf;
	Sat, 19 Apr 2025 23:08:44 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnL-00000001snz-2KZZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:20 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54993c68ba0so3461058e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102178; x=1745706978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx+9sB1KcBfjXfw9YO0MHYbVgVBIoUFxRPysD28QEy4=;
        b=c7u3cAjhMKcl0McC10JvNPpBTEHRSYmmO3CqBUPHYWRdl/hvdvCeiTHLU3FHurEFUA
         8MgD3MAJoGGLs0djhGqg7guWUHLbbjpVyRj0JaDXmoOqXAVziA4ck1ioZzb6ZTxl9q2B
         W1FfW7zYUvQTEQf0Um1aZnSxTOHBnLuPCz7UllhiYQEKmEghVUrpug4igIFHNNTAXJpC
         AOMTZVEmIKX4qFZCe5pqhprjFmriLLjmCZLGk8WcrZ+sa4QnizUXnxwmv6L3AOLHGgKg
         q/MZKWxV6i/PxPhPeqOhqqqssbTSltNpRYvI0L81lb8yYRBIRDnl/+jshtkTEOJ6y+uB
         qbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102178; x=1745706978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx+9sB1KcBfjXfw9YO0MHYbVgVBIoUFxRPysD28QEy4=;
        b=JIwptkZ5fvw5QxkTRK1fzKY9XQT03HB2p9Mdatu5XmGdoHc575vcgrtQ+GP7U5R9zq
         D9XqrfoZkYA2rG6OBSHYs86JtTwVRdlXKE8tf8QuUqmG6QVIgbM8ErBi4hY3ZovTiiVN
         GqUdX81uJkAZy1nSFia+PK7KQ5FH3gsNm96LyQ0fB+ZiQs2hqmGouV7tR4XmKllEN/kT
         UltNm/hA9sP+H67nJPgzWA8auzSHHDTFxO+jRd+ENzYvfnvC/S0ChTXxLcxxz91PNLGK
         OPrVJ+62E2w4RXuXO/SLnxOXntaO8XO6kzWlE9FndYxiAIosGkHBxFMQ6OFwQTuUxVqQ
         fTbw==
X-Gm-Message-State: AOJu0YzE03MAzyTBj+gE8daQ9FlnaRNYaBsZaTJKxGCVZgNw/llYKshc
	5DIe7q9J8t4xuVxcfadynAORlYvt+yx9NWKJzgVY+wxo4FLu8sqGNAFcdYWRJWM=
X-Gm-Gg: ASbGncvnUGrtm91ddxvYNfOHdUwmoRezC7if4YSi3EMD9KZzfWJyujiDwaJ0+niAVHn
	UAbfsGCcrqX37dKOa1dd5YbeEwfA/inJPr5YyT8bAH8RHy6/X4eEeYvl64vJfOhSRfAMkeyqepn
	fFRJMZXLy789bdGRY+2jQ2F5FBp2UO3mGODZKPvDadFVp0fGhEOPfWw52cf5MGo6VptKPWkjfH1
	p0HRUS5ihDWJEV32RYSOoGkTEd1+Hy+LuDJl5O6NccTY9xBxlzlvRAJVIoZ6sapv7pk+8V5BVlm
	ouW/Qw7conAUZcvEVK/6jKFye/MQOU+BzZ16PeEbj3YL5/QOXd8=
X-Google-Smtp-Source: AGHT+IEVMKYD0E4jGirYdTdJ4UFmci4roeaF66kGKgMlacyKSm/VZhP9xKOdtongxwYEh++1VrWQXw==
X-Received: by 2002:a05:6512:2309:b0:549:8f49:3414 with SMTP id 2adb3069b0e04-54d6e61dcc1mr1908146e87.6.1745102178019;
        Sat, 19 Apr 2025 15:36:18 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:03 +0200
Subject: [PATCH v6 16/31] ARM: entry: Drop argument to asm_irqentry macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-16-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153619_600915_2788632D 
X-CRM114-Status: GOOD (  14.25  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


