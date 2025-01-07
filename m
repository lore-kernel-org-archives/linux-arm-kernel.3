Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F96E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jhFjCJGceq+XYGHJk3Ezf5jn0OXzICEZi9KxOGra7k=; b=V2/ZfEJmDzHQ5zGhlmnmzJWmoI
	do33oQWRvuLRNDURuqprtuFGkiwJzvL0MN5Z8/BNOzo6/27l/db+bkH5cdhdpMAkBGK9Czp8avpQs
	x+rDeK58w2bQntYCnl1Abnj3DZHRawxQtU22gJBGOSGAJ3mguELqqIZGiQzaS7VTL4EkQJVMowXe5
	ZaNnjM2aZ1KpXmgAeAwjS2w7o8XIpcaaGeiW2K/66lr8PoLK2K9MAxJNTSHQ32Zb4RaWRhEzoqglB
	W2sJwOajcOaiRoP07K//keshPnawYVq0uGd/ZuPhtTYwTf8btoxasJo6RyoIB3L76SUDCN+bon0jR
	bx0glqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6PJ-00000004Fc3-113u;
	Tue, 07 Jan 2025 10:01:53 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65t-00000004ATj-1vZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:54 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so27459999a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242908; x=1736847708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jhFjCJGceq+XYGHJk3Ezf5jn0OXzICEZi9KxOGra7k=;
        b=psFKgz7/BEyZKucHMGnfBILVDQHmtnIU7sgfAunQ9nIJPwvFGFnpva/4o9UFZzWgrd
         f2CFqMXtPN4xkjLEIILRz8l7XDVUFYBRcHXHhz3OfVugCEugzgb7e1SE+Q55kKcQLZNh
         DjLT63MROPSaTzi5Fq5kcY6wHfv2SeNOfvEpnIKgCdmAEw2j+6ZEC5e74LiYfgCMA9yn
         SNWVXb8WpYAlet0tCa5hGb6gm9wc632kCCw+fwOS6Ia5faVQd0jd6wx1wnxcI1asPuLX
         kYInv64wqOin6ji8S39k/iBQ7FurF0Ymh5caw3dSXt2RKf/HMxeA2/c3uDlbFoQALe6h
         f8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242908; x=1736847708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jhFjCJGceq+XYGHJk3Ezf5jn0OXzICEZi9KxOGra7k=;
        b=okCY5eoEba3GFClZmc626FI3aY+ma3/5+Dw+un9IerM8wCvos4W3eFEi18C/VdMYSg
         JBQDYI00sLGcim5K2yPESPQs9Tv5pAPidVkRw0p0q16lLKyAy2fjh8SN3zWmOqbbArPK
         TRT4UF1R/rs7RQ+6HiVYrgwHw+x8tzT3Fulk49WQwGpPxKBWRUvK196rICaF+CJOiEJJ
         VTBTRKU44Id0jtEI2T+fHALrwTk9lve5yCKHFLKcAiaJfYhx1VNwOXc5WLVqFaw4L0IA
         ZDPF73mz3bgFUISgeobxDH3sUu5omMt7PoBYYFDgf9GM2wR7vuoiajhw/kmwb8hdrgJJ
         F8hg==
X-Gm-Message-State: AOJu0YxxP+Av5HzjCFORjEmY2zDn9d/JSmLj5XXLu8MvDWLrczPuQ1/6
	yWANIkMgT0+HN+nPsolPLYzrLp2H1RF8eEbooxPQrvndgy7uSdBvTqO0bkWDDsA=
X-Gm-Gg: ASbGncumbjHaOYNdCDd84ZQYEV0tjL+OfYM4alQq0rkbLrcOdH3T8eHKDkS+3vQ65uU
	Ynq52c2rv+WaBWdgZ1uXGcEYj6wNNO/HTn7oMyRMq9r6fCTv7CM8Y1Olr3KETJ2CX0wFk+NoU6/
	aL45byqpOsww5vmb51sKZfHgZj5JbrvQaybvDEWqRZpKqXyhIMkpVEskH66PfwZ0/NL7kNkXx+R
	Z53eRLFDwfc0HiTliBkGOG9OsZ29jDXQP3xaASklvuNxtc3sy04ZgnYIJEHhS5ggW4=
X-Google-Smtp-Source: AGHT+IHEH6FJmLL0RIoAIXjSeV1vLr7n0yRDVVeIb2gZ9Zszi7jKVQgNpS1AgWJqppfe+0vNlaJ+NA==
X-Received: by 2002:a17:907:a708:b0:aae:8495:e064 with SMTP id a640c23a62f3a-aae8495e124mr5041199166b.40.1736242907918;
        Tue, 07 Jan 2025 01:41:47 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:47 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:32 +0100
Subject: [PATCH RFC v3 16/30] ARM: entry: Drop argument to asm_irqentry
 macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-16-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014149_723117_4EDE0661 
X-CRM114-Status: GOOD (  13.44  )
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
2.47.1


