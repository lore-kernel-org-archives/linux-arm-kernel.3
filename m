Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123F7D2AB29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/3IXPLtEzkdPxakYsKtSl6x7P98QonT1kDDJ6tUink=; b=HhU0JzyTQZc2NyMaOqGL5KjpsZ
	E1MrkFryR1BgkZ7bY3TER/RBcvMM9hrHqR3aZl2OHZR+HddTt5QtzEDF7oT5IJeoUNtqd9sHep675
	ZqagFWt8aHC9+xJ4+N45Ryfj00PMfNT/D3bWZX5c/sx4vyoesUDEzv7agl5sIH8CgqGUUt3AFFb4g
	FUHXncWCiZNMaTrWGp092AIynodjS3L+Qvqf92YegmP2wJX3lUUpE4WbAWoUbswZ9LUCUy7P3UiH3
	f3rR9cm323smrzDbH8vaGt1Fn2cY1E0jXYoD2AYmD5vBYKpyagYH7eSnX1ApcdNYiTVLeREwToXre
	UJixNwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kv1-0000000EKC3-2IIl;
	Tue, 29 Oct 2024 12:01:51 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqx-0000000E7Wu-0qct
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:36 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53b34ed38easo2587824e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199214; x=1730804014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/3IXPLtEzkdPxakYsKtSl6x7P98QonT1kDDJ6tUink=;
        b=rV6VXuOTZ5nUJtQwimH9+DfTUkLG8xq9XX2NYlk0y8NDWqNPvixGAzDE46XPGaCF4t
         2/JWkgpS4Wl1QK+HkETnxoWGRRo38PnycWB3g4s40VXlK3p7M82fmuPVbiFoUMKvxS24
         YWYvBV8PAPXN/p8pM4X/8p5KJV41zPp9q7Yp3eR+RVB3vmZ6AQ40s6RCaJcmrWkj7RUY
         z+HgF5NBJNW10NBjO97QCF9BrfSAS2+/d7epIMmac4aujhGOA7WYHEKsc5qnmlOtkKIr
         zKxKLiUdzhO66Xl5zBknr8MbGl4wB7dPz5ntdO9vu20Zq7aOHrHRLDgPEL0+71W35eaa
         1K4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199214; x=1730804014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/3IXPLtEzkdPxakYsKtSl6x7P98QonT1kDDJ6tUink=;
        b=bKzA1rfQQOciobGVu1ljZXASh24C6aIZGfEz+cVhaKUNppUWi68DU3zMLNgBA3bNlF
         wy0Q1ILF9RU6FOfRu218yNNBUmhO6m9nKMVluflTicN5G6hJQPLPWRoOoNwAFURm97Zi
         o4aN6MKpBMQVvneZQIKQhck/ARBw1m2QpSbfslRryCn1E2jFcg1JX6gSWFFDG4RvsRQa
         NjDRWTKLKE2Fgt9OOKWVV7V8UF08jIc1MctrMbjbgkR85eEnuwFa7YhkpGF6Esgoqy4I
         ZjGv6BI/fWzRx/wkze2YWmvnViIqW5ssbCaUKbvIC9Mzkv6xiCiCbK8Z22FRioxfKXzB
         adXA==
X-Gm-Message-State: AOJu0YyGBOJn8T+NZxh88cR9IDiiM6woSyJcyIXxQMSrzcrGaWWaFfjk
	dZH3g74NGclrNfkBbNYdAigfN3c1M3ui+VNojXIy3NW+T0ar25N69EtB7SU9QVk=
X-Google-Smtp-Source: AGHT+IEv5OXz88Rah8wOjpkuPKbULq5MyD1fSlWtEkl9G05R3LmA9cdfp5t7ybciPjtapRrrDr8Jpw==
X-Received: by 2002:a05:6512:3084:b0:539:fed8:321 with SMTP id 2adb3069b0e04-53b34a31cdbmr4939966e87.51.1730199213675;
        Tue, 29 Oct 2024 03:53:33 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:53:05 +0100
Subject: [PATCH RFC v2 25/28] ARM: entry: Create irqentry calls from kernel
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-25-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035335_281795_C414C4BE 
X-CRM114-Status: GOOD (  14.16  )
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
index 8b8cc9a1eefb..a78bc5054b09 100644
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
index bd468d58dc02..21b11fe199cb 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -204,6 +204,9 @@ ENDPROC(__und_invalid)
 	get_thread_info tsk
 	uaccess_entry tsk, r0, r1, r2, \uaccess
 
+	mov	r0, sp				@ 'regs'
+	bl	irqentry_enter_from_kernel_mode
+
 	.if \trace
 #ifdef CONFIG_TRACE_IRQFLAGS
 	bl	trace_hardirqs_off
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 51c7f93c1ded..49a9c5cf6fd5 100644
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
index d7fdb9df3331..674b5adcec00 100644
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
2.46.2


