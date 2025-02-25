Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB8EC021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA+LzTmhZnGJ5F/6+si6C2L1JDWL6V8/wsE3A9CcZck=; b=xzMpDONZqMiYg9hBX+UGLbcBan
	qsmSQ0Ov/vmVeyP0Bt2xbjpxS0zKp2LZz/oLdjRlOdbnFzof/kRgEGgT0b2LsKq69DF0hoRSRGwur
	XfHqbBon8aLMw1z+56AElPWQUYG2F4OuN+FnJapqssqq3fAMqSjvxea9AOYQYCNnMIJTg+xur0rAd
	4N5rrS6T2COiksDejZqcvtBq606Puvhs4h1XNnqNEtN840uliuFvkBNjgXZxiP57WA6FgVm8uA/Q7
	8LwlF3ISkr8A1Kw+wMiIhS1Wk72owJ2uVLvPZlHi4QFXCMnrsC5/cHTfO/3qIwvYv9hDn3anlbtFS
	K5yTuN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsTT-0000000GtNk-0KXb;
	Tue, 25 Feb 2025 10:47:39 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrf0-0000000GhnH-23Ks
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:31 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5439a6179a7so5997864e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477329; x=1741082129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NA+LzTmhZnGJ5F/6+si6C2L1JDWL6V8/wsE3A9CcZck=;
        b=WeSMfFGNoFBkRM8Db61iTYCHL/MXoXicjrZoAU8+uhYrgHGxWqeYrP/INSieoIhwsC
         EtkQOb5KjLS2Pdxsi0PNKLUeJBIkWGBvOK7yzo8A7rzPemZJNnR4Uf3B0Lwkh+9Xmff2
         6dsB05HrHabKHqCp+uwsdoMJyTBCASYjAuJ0oKSBUSsUSp0VkBNWZshtbgjsFatGKJ37
         LGQgYLhtWtrVhiRiBsFN5ygsf1yVCbzuQc2uqvazWJT8uuF3N5asTUaDsoo5N7v2v0vP
         lrcHIqYx3COKHJLoR5NfDc4VhngwYN5f1dz02wiNFnpUWqiHsaEjMyrqNq6jhIMHWNrC
         0lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477329; x=1741082129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NA+LzTmhZnGJ5F/6+si6C2L1JDWL6V8/wsE3A9CcZck=;
        b=JCXUreC7L68ojeJewPc4Nw+fsy9niYEM3WyXnAS6Ffa3ROQxHWKmqnfSD2aEw87GgP
         GL5afydfkagvveqSpMOT9IBvJf7i28W9lW84X3+ucqLkcpXPTRmBVow0QMitbEnnFjEY
         7aALp64VNda7yGm60RgQ0x2k1XweJ24W4TKLFC9zIRCAzoHtLbjQYvJ3XHZb6gssmBsb
         iblPZEkffdUbKCdqqQu9Pdj9kPPpp4dRuW+xgy25d183wUkQi9yItXmCJ3Fl5BrVL2DB
         yAA5xgrLLdqpZ9Qtuidr4cLM6EJTZKrb/ep6YL3a/1MJanYdwa4sd8B0rJrjoRthkkpQ
         HYLw==
X-Gm-Message-State: AOJu0Ywe2Vs1TQSK3PFosLn+yEKM96lnO6rpjBehshw7q64qvZXs3Q9L
	s7EnjsO19uclk96apUerLIU8Rm+sD9j8YaLMEIcnRw3YclEINa7CLgHxj1Zp6Co=
X-Gm-Gg: ASbGncv1iMQsPiRp1GpZUdFLlJEvFK8fbs6dpZUhprdD4waXZktfDqyiAauJPa+6wO0
	vXzT97mYPehhgbngKQ1hMtAHmZWJaW8GNIv4fa8AHmpKtbokCAXurWXnWCov+baWns72i2TXRMx
	76qTtSAVFjUIYiz37vzN0ve6y77s6hXjm01PK4DaBblagW9547Omy6+205qgw6uIXfJZrHbYRfQ
	XdT01BHLIz+XsTcsCoodmBHUsN20EIYMCBPuxmJRh9bKoHbZaPXiF2hmYG5FKRxDQ2XnsFrejYs
	L2bcHomd/ZxSzkl8lt2NofW3p6XGJCsXWwLE
X-Google-Smtp-Source: AGHT+IHoExRUiD3Ptt8xtogX36HpctNeFu9+M3wDkC7ot0V3ilLsDYUXt+l8IOflXZFx+RQVrnavqw==
X-Received: by 2002:a05:6512:6c5:b0:546:2ff7:530d with SMTP id 2adb3069b0e04-546e5f76a64mr6495854e87.25.1740477328590;
        Tue, 25 Feb 2025 01:55:28 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:28 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:12 +0100
Subject: [PATCH v5 25/31] ARM: entry: Create irqentry calls from kernel
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-25-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015530_533690_583A3E27 
X-CRM114-Status: GOOD (  14.30  )
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

This adds a few calls to C when exceptions enter/exit from
the kernel itself, so these can be used for generic entry.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   | 2 ++
 arch/arm/kernel/entry-armv.S   | 3 +++
 arch/arm/kernel/entry-header.S | 5 +++++
 arch/arm/kernel/entry.c        | 8 ++++++++
 4 files changed, 18 insertions(+)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index 8b8cc9a1eefbd00dd75d4e344576fc184a413768..a78bc5054b093120e903f08369fb8b1a9feb7f81 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -12,5 +12,7 @@ long syscall_enter_from_user_mode(struct pt_regs *regs, long);
 void syscall_exit_to_user_mode(struct pt_regs *regs);
 void irqentry_enter_from_user_mode(struct pt_regs *regs);
 void irqentry_exit_to_user_mode(struct pt_regs *regs);
+void irqentry_enter_from_kernel_mode(struct pt_regs *regs);
+void irqentry_exit_to_kernel_mode(struct pt_regs *regs);
 
 #endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 3cd5a80b47758867d1db6c3971030370bca1551a..f64c4cc8beda6bcd469e6ff1a1f337d52dbbaf9c 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -205,6 +205,9 @@ ENDPROC(__und_invalid)
 	get_thread_info tsk
 	uaccess_entry tsk, r0, r1, r2, \uaccess
 
+	mov	r0, sp				@ 'regs'
+	bl	irqentry_enter_from_kernel_mode
+
 	.if \trace
 #ifdef CONFIG_TRACE_IRQFLAGS
 	bl	trace_hardirqs_off
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 51c7f93c1ded1db56f173c7aaed8094ef011ff5a..49a9c5cf6fd5fbb917f2ada6c0d6cc400b7d3fb3 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -210,6 +210,7 @@
 	.else
 	@ IRQs off again before pulling preserved data off the stack
 	disable_irq_notrace
+
 #ifdef CONFIG_TRACE_IRQFLAGS
 	tst	\rpsr, #PSR_I_BIT
 	bleq	trace_hardirqs_on
@@ -217,6 +218,10 @@
 	blne	trace_hardirqs_off
 #endif
 	.endif
+
+	mov	r0, sp				@ 'regs'
+	bl	irqentry_exit_to_kernel_mode
+
 	uaccess_exit tsk, r0, r1
 
 #ifndef CONFIG_THUMB2_KERNEL
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index d7fdb9df33312dd2a914b59512b701748f33b597..674b5adcec0001b7d075d6936bfb4e318cb7ce74 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -56,3 +56,11 @@ noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 	/* This context tracking call has inverse naming */
 	user_enter_callable();
 }
+
+noinstr void irqentry_enter_from_kernel_mode(struct pt_regs *regs)
+{
+}
+
+noinstr void irqentry_exit_to_kernel_mode(struct pt_regs *regs)
+{
+}

-- 
2.48.1


