Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BD9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA+LzTmhZnGJ5F/6+si6C2L1JDWL6V8/wsE3A9CcZck=; b=Xk1c1gszDFnZLpHktJlvg7SHbn
	zC95at4UTBz7z5/0Qtv1s2M+ZCAZYF0FHxkFK/2ZQhQV0oIv1Or94e8lX1DNxIzdTV03CEdR6C0DL
	TQnlxxAsnCJ/7hYhiixPThNUMyD+48UnH6sSXjRbLmzNI44BK3gMAsWkPRyrLS30B67Qw53Jjxe6o
	UKohp/QRNIgkhdvbIaJu8ChqYYrB21wD6Zvcpf1yOSaEZq16fqrn+426cJkcBAC+1ots+63AR1B8Y
	KzokLXENA5FDs6GuXSwdCTpkbbFP1hg2UEe9pfB+r1WGtwJkfqXtA3fs/MjSlR018JCC5eRbU4s4i
	WJ8iGH/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBTL-00000007Hli-0OnH;
	Wed, 12 Feb 2025 12:04:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq9-000000079lQ-0vPQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NA+LzTmhZnGJ5F/6+si6C2L1JDWL6V8/wsE3A9CcZck=; b=QiQPG5HLtNiOS88dCIMdhCfd4a
	K0m7f7Uguf2u9kiyBwg7jBA6x32eUob89JVCr0i3zoqm4HLsg4k4Qwd4udTF4zfwourL7S26yOMbX
	9RqcI2duP0SfbXfZtE9p+UapduMMMkxJT/VIGM4kICm8qepfSqWMZCPmjn3hyCxNr13lLGMReXXyx
	8qR9Us1UvigA41eguVkYdHmf9GiqLH61D0pVX0Us3GYzbEoMN6C0fad1ArDTwWiEOU1BcQfs6viri
	kpLd/3kTjoS5uLiiNxb6W/R3h5bwXADmhex9kHnDF8PZeglKRE7SPJE2kN8FVVUSATGOLMfNWAP7F
	sUERxHmQ==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq6-00000000nrb-1ipZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:36 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-308e92c3779so7143121fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359412; x=1739964212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NA+LzTmhZnGJ5F/6+si6C2L1JDWL6V8/wsE3A9CcZck=;
        b=ItjTaydWZbG+HsSx+N5DQHTkWamt8UN5ptm2DMuKm/Iytss4MvICVuzPuNSarMCp6l
         3zgdsceU76MNptxWps7h7Pej0IlWJYnenad9pALprrPV09B9kKdmxt2m+UlMXiHIvyqa
         GYPyAzGXvVNpH0la45g4iemG41+tw6h6CsyDf+SCS41FsPDAwbm/VKYT0O61lR8PQEnb
         gqOVGC0b5mFWOKoCggZFw6P+TMlzTPHmsysHspgISQNtLvbaZSMNOWktFEqWRHpFCkDX
         nfe2Ax2S9FT15iw5jH7YH5ajlfsBUvFoqS0c/u2h00tXdONBJhNpaJyA/BHE7ZSCZ4r3
         AS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359412; x=1739964212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NA+LzTmhZnGJ5F/6+si6C2L1JDWL6V8/wsE3A9CcZck=;
        b=pk4vf3IYbq44ZbjtqvmVUOusHexwZJPMel5s29LbFOUzzO5B4ss3rGdibQg+0DCzpA
         O9D+ISlie7QKykjyOSKypugZIpN2+elnvrUycLIacinJSJNj6hFYFJXjZtlesCces3WL
         bS0o3HJo85f57pZ/fTqDi3TLdv6bxNGPboZJooxRU2HbLeVlCLlXHtupABdYEOsuNQUp
         QKCMJ3ijDAGKQ+EoZxOyPcXZ+tHyXBps5XNSzfSjIRN5Ks9vgriGFTHbkZPO14F6/m7z
         WCuEBRX1qnk5ZMUBaKU4EnMIAKKcUyXTRMfDv9mqvxtA9TsxxzjEjhg9d+C4fmaNiE6y
         hsmw==
X-Gm-Message-State: AOJu0YzH+B7kFspLSfk+R7das8NMlA6WeppFo78OY01nM4C2s3VdJ7LN
	Jn4b83ZZTgMcZA/0zFFKoK7JkB3WTeXMM3oG+lM68OpOlBK5ftaDjnyiZIvjzmI=
X-Gm-Gg: ASbGncvHt95wMzTnc7ZvmiU/ncBaKJwnAnDNnz4GyKe/yfekkGyn/GBjxtzuPDRr+QI
	Nf6/ioAe9bbRRBZFhK9qQ8UeZO5VDevZnAw0kO4IOmET/lMV03o/4ozxMVC2WO86azIXTrici5h
	SDVKraRXycACjze5rN2L6kKgQdq0rNiZBxdBnYRY9AyooQD6383bFkykMPoHM1v9iQha6Mok5wI
	exWeQgEF722AasHoVvN0xYb3TiJsE6MM3s0e6lhLyCE8bK18mTqAe3EqnL5qoHNoClTid/l3JKu
	F8w8/0UBDIbJFN0ozzLrcCFEhg==
X-Google-Smtp-Source: AGHT+IEplwuuVF82kBeGhT/TWo/XqlzuKUbj10/w8fQqnJV4OOCk8n2PPTKgIfpGykjHMApLmTymWA==
X-Received: by 2002:a2e:be85:0:b0:300:182b:91a0 with SMTP id 38308e7fff4ca-309045927b9mr9380691fa.7.1739359411856;
        Wed, 12 Feb 2025 03:23:31 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:31 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:19 +0100
Subject: [PATCH v4 25/31] ARM: entry: Create irqentry calls from kernel
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-25-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_112334_663456_C86CBAB7 
X-CRM114-Status: GOOD (  14.11  )
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


