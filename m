Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFA5C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggLp2N6nIh1N25l9qqVFGy2pp6+E0t6/i4rH9zHeAXo=; b=mHB8zRS3j/KYfDFGZJk4PQow25
	KbjNrG0UBBSqcSxe+xmEoMtBA3wLM7ZDJZ2+aQJ2Nm0GOXh02kDgrcX4lNtHf6+V0pAV6xispfKN2
	kJ/txto8N6o4kp2Y+bLmOQauFSJaGrXKPb3a4Ht2VKgE/r1YZushBbp6xP516Vk8bMukNQWIHbcPU
	2rlEqrfo+ibDF4ckQcC88T4+bPoM2uysvhmhtyFVISuImMTGPzwF9nsgDf1t6be110hj/jzHLEmM/
	f4US328LUp0c+XbkryXzQLvw2Bg0IMxvA28/p0/CzhzCppR7yGZqSnRi3O1jiAsKG3rIhfDhGYCKD
	W7bWO/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsFm-0000000GqSO-37f4;
	Tue, 25 Feb 2025 10:33:30 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmreq-0000000GhiQ-15bF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:21 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5462ea9691cso6000961e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477319; x=1741082119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggLp2N6nIh1N25l9qqVFGy2pp6+E0t6/i4rH9zHeAXo=;
        b=qCNQ1PFquHvQfpVDyvqYn+3UB4Hmg0rHCiQsAP7uLjUZC70TMFkglhoQTEtXAtrdoa
         yWWZwxnPfuzcSFIn79/ZLA4JcWjEZT4Kq+1v2R1NY0fHz58Ydhr+XEcV/6DRGo9a4KIc
         VH4UXvmG6a39b7fIzJTJGSzuvTxblJOldawEUrzkM6aE6L3gOvARl/b3a28p7XzhZUUr
         XZrpP+0b9pwEs67W0dp9Tsvk58olrhlhCguEL5nexY1kpYuW0MSI/+QtXspMVHMxQm1E
         ysc5yn5miGrCd1zeyn/4fZ0N3TpXqruyO7+N/KHWNtJ2tvx6LEF95nrOV+DS09prJLcV
         DSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477319; x=1741082119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggLp2N6nIh1N25l9qqVFGy2pp6+E0t6/i4rH9zHeAXo=;
        b=KfqPB8d1wNDG76qfz+U3tc6fwmvy82RL5F8uqFZCGrrSlq2d6IrjnklFT9ZF3LWPB8
         kP6UVT4Xkiaxi1KmqvAAUvvSVRueiYalL/DA6bzHRjiXbYGdww3RdSb9KKfvXRVaUpn1
         7ixh1vMwLQFWIJR2hDICtXY+uNPGssSPXCyudwcF1SQr4prMBf13fIpSqOIM+6C2qUXH
         MpWNs+N0bsISmzvBRxQAHgz3n58rQvGxQ/D4u1BjWHKh9n/OxI5SBiIPK8xqTrgKXbpu
         b3iGHo/CviJTJwudWp5gBVWICetV85wz2r1O6YuBAyj8hZ0PMcWC+tjOr5GXwrEoSlUA
         pW1g==
X-Gm-Message-State: AOJu0YzByhDCfDmiiLRF2dtpYJouugFMEqiROZ3NVIEiliwMyS1waD5H
	6WI6akLRxaWZ72mMb6ibiFmGZSeG3UFx6IWxKN70P6BlJIjMsY/Z7fSrA731UZo=
X-Gm-Gg: ASbGncsG2PTEQ7y50vk67hb+FYgorTZSAXSrku7Uai7THeiJTEfAy0ivOPydOGhORMD
	6Fg+GAJsgy9/7NWkMlus6WaUBYV6JOZvH68B78snK70z4Lp+v521+YZGxerHo3Y/EIqRu25nMHK
	3aXJluSsSeWlEZntjfLKctHwIeHVqmHAl4aqxd7xdM6922veUywQaON2eSANBmPS98sutb5/g27
	wJ4LqEOz8/NZiMjBMugo2Jb/6ZQdJmTzfs1fQeDZwecdwDPN8Y/XkiPhX7CuR3WgDEynJLJ1DeR
	DuqlIcj4nNghsFodahLAoPZPeOfVJ3eKJ/x7
X-Google-Smtp-Source: AGHT+IHX3+a18efpxx2qbHXAhs4U0wbk1ul7gmrkFn8LxyQ+grE1C90J+pJbcS1vktIQA6he1PGJqw==
X-Received: by 2002:a05:6512:3f19:b0:545:646:7519 with SMTP id 2adb3069b0e04-54838d3d9d5mr6616063e87.0.1740477318630;
        Tue, 25 Feb 2025 01:55:18 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:17 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:03 +0100
Subject: [PATCH v5 16/31] ARM: entry: Drop argument to asm_irqentry macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-16-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015520_304900_146151B5 
X-CRM114-Status: GOOD (  13.59  )
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


