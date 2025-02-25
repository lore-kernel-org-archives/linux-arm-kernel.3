Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5A8C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L1+xbNej+7+BbJW1uipXHwDEUpYT2HP3XoeW+FBwgo=; b=w1r91g/2uyH+MAKVJIq1dv7Y0U
	ssT7d8saqX0IJZ6SbP9tf7tL524AzpsEPR2Q8nDjmd7MXqlK4Q3l1d4mcV4IMlxIjcAhvuR7IzwBM
	yucze+zOCTUCpE+8fVNnx1RdX7/qS0lgtgQc5u04F0tuJIeGeFOJ1TOfSgrswrRcSjcfJkodBmhXw
	9a4U5KKO7sjIIYHBxdTMd+VWjuqO8AV9dD1vOlCPx7Bo18ATOsOc62kGJv+6a7eycXzaC1Kd5bgzh
	tXNmCVEOPfY+vgMn9oaV51ydmQCiXX/bpk4TDWWDqCrqDQfgvKgR24bSGuaeveCvXm6QcHfdid3qS
	9R31u3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsUz-0000000Gte8-2yA1;
	Tue, 25 Feb 2025 10:49:13 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrf1-0000000GhnS-0d1h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:32 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5462a2b9dedso6456200e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477330; x=1741082130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8L1+xbNej+7+BbJW1uipXHwDEUpYT2HP3XoeW+FBwgo=;
        b=Wv2nNif+G2HlXR3ZELkDFFclGr2a4y14S0BLMa0O/O+sM0MzT2BMB+f8uAD/OUeQ98
         deYfY8rMWczD1ZgXRsMceHqvXknLANzJ0/Bkl2DmvJQ4mVvcgSAiJGKU1ZAldLjxGzGh
         vejBWwBLpwGRUj9uvnE42A1lfwx7aQKO/kJT2oWdzvKVM20JX12xDdoPATfx9uToYUUp
         R8EskTvb3eYE2b1xqv7dLJb5De7DdndkwULBlnNcrF4ozGYCfBf7EYnt0O2yyqG/mrCW
         nO9Xy6TlOjnQgkVK4PdiplLAgUBXizVQ1V1n13J/sIcgGcJ/gyj6luVrzn0Mwcde79qS
         VoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477330; x=1741082130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8L1+xbNej+7+BbJW1uipXHwDEUpYT2HP3XoeW+FBwgo=;
        b=LGJx7tD55sQJm3ixVuUsDZdt1edeQ7TNCkLgyiMB4PecKaPYtjGea31KJYQXzDAiGP
         PdXLpcWf+X85v/dhqB8B86jixpacE48ZHK8w0zteFlHdUMUG96OCEnT3pL+8/HaZqshR
         l4reC1ir/5l/GSlOmR1V9SWlgYzOoCiCA/jhSSJpmIZoAZyG1GuENdxT9vGnVBGNyq25
         hnGXYpi9O9ViZoqVxQdGSNgwoFAbv1hTTSKzdxnvasV88S3xj6oOHqpyLE7NjK0or7Hw
         HkAVrpkv2idfyY65wHk4Ch8mJ5Zr6wgAJRGImRt2tT6c9MKh0Pwr+tBZ8JBPyzYMP+30
         vzWw==
X-Gm-Message-State: AOJu0YyTitRnQRCeuJH9k+w/eBw2beeX/+Jd4OSxDzW9rIQD6F0WkNP1
	ObG1Ub3cTj/+sGa3/Skzf/QrXIBu9qsfnIfwLCrNydN8JncrvP0q99QEt5SsnsY=
X-Gm-Gg: ASbGnct1HjGezbPCvivrlkCqXKZM9iPxl4VGQMbwjvPNkY3ToQy/bxcV0AsinTkcVzY
	BtvFL49Lmf/X5Af8L++eX9L8xVqSslUZPWVnLOt1nEIMTJ/KJgc2xdH+2MLXVa05jaYj8S72x2M
	KVwJJ69JsWLrOHoi2Lm5yZfmol0OLS5svcPRq0dNqgrXyI67uX/2cSNO6wdllsxElWQIP/Up9+E
	RTIEOnFxPID2rlICkApfTsUPuUDCuCivhvRpJAthxlH+VzqUCZc6CMmso1yt0LVEArW+RK+1zNx
	ttSflt3AUnVmVM9uu1Ou+nZCGu2KMywTU5C1
X-Google-Smtp-Source: AGHT+IF7xfl9B7/xJ8k+iPG9dONRxwPTx8ewhI6YDPJcZwPMf++LnRv+shbC0/r1nL1MG22ob6N9GA==
X-Received: by 2002:a05:6512:3d8a:b0:545:ea9:1a11 with SMTP id 2adb3069b0e04-54839129bc3mr6152301e87.5.1740477329613;
        Tue, 25 Feb 2025 01:55:29 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:29 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:13 +0100
Subject: [PATCH v5 26/31] ARM: entry: Move in-kernel hardirq tracing to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-26-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015531_201572_8217EC37 
X-CRM114-Status: GOOD (  14.72  )
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

Move the code tracing hardirqs on/off into the C callbacks
for irqentry_enter_from_kernel_mode() and
irqentry_exit_to_kernel_mode().

The semantic difference occurred is that we alsways check
the PSR_I_BIT to determine if (hard) interrupts were enabled
or not. The assembly has a tweak to avoid this if we are
exiting an IRQ since it is obvious that IRQs must have been
enabled to get there, but for simplicity we just check it
for all exceptions.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S   | 13 ++++---------
 arch/arm/kernel/entry-header.S | 19 ++-----------------
 arch/arm/kernel/entry.c        |  5 +++++
 3 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index f64c4cc8beda6bcd469e6ff1a1f337d52dbbaf9c..2a789c8834b93475c32dcb6ba5854e24ddd8d6e9 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -158,7 +158,7 @@ ENDPROC(__und_invalid)
 #define SPFIX(code...)
 #endif
 
-	.macro	svc_entry, stack_hole=0, trace=1, uaccess=1, overflow_check=1
+	.macro	svc_entry, stack_hole=0 uaccess=1, overflow_check=1
  UNWIND(.fnstart		)
 	sub	sp, sp, #(SVC_REGS_SIZE + \stack_hole)
  THUMB(	add	sp, r1		)	@ get SP in a GPR without
@@ -208,11 +208,6 @@ ENDPROC(__und_invalid)
 	mov	r0, sp				@ 'regs'
 	bl	irqentry_enter_from_kernel_mode
 
-	.if \trace
-#ifdef CONFIG_TRACE_IRQFLAGS
-	bl	trace_hardirqs_off
-#endif
-	.endif
 	.endm
 
 	.align	5
@@ -239,7 +234,7 @@ __irq_svc:
 	blne	svc_preempt
 #endif
 
-	svc_exit r5, irq = 1			@ return from exception
+	svc_exit r5				@ return from exception
  UNWIND(.fnend		)
 ENDPROC(__irq_svc)
 
@@ -303,7 +298,7 @@ ENDPROC(__pabt_svc)
 
 	.align	5
 __fiq_svc:
-	svc_entry trace=0
+	svc_entry
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi
 	svc_exit_via_fiq
@@ -321,7 +316,7 @@ ENDPROC(__fiq_svc)
 @
 	.align 5
 __fiq_abt:
-	svc_entry trace=0
+	svc_entry
 
  ARM(	msr	cpsr_c, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
  THUMB( mov	r0, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 49a9c5cf6fd5fbb917f2ada6c0d6cc400b7d3fb3..cfaf14d71378ba14bbb2a42cd36d48a23838eee1 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -199,26 +199,11 @@
 	.endm
 
 
-	.macro	svc_exit, rpsr, irq = 0
-	.if	\irq != 0
-	@ IRQs already off
-#ifdef CONFIG_TRACE_IRQFLAGS
-	@ The parent context IRQs must have been enabled to get here in
-	@ the first place, so there's no point checking the PSR I bit.
-	bl	trace_hardirqs_on
-#endif
-	.else
+	.macro	svc_exit, rpsr
+
 	@ IRQs off again before pulling preserved data off the stack
 	disable_irq_notrace
 
-#ifdef CONFIG_TRACE_IRQFLAGS
-	tst	\rpsr, #PSR_I_BIT
-	bleq	trace_hardirqs_on
-	tst	\rpsr, #PSR_I_BIT
-	blne	trace_hardirqs_off
-#endif
-	.endif
-
 	mov	r0, sp				@ 'regs'
 	bl	irqentry_exit_to_kernel_mode
 
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 674b5adcec0001b7d075d6936bfb4e318cb7ce74..1e1284cc4caed6e602ce36e812d535e6fe324f34 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -59,8 +59,13 @@ noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 
 noinstr void irqentry_enter_from_kernel_mode(struct pt_regs *regs)
 {
+	trace_hardirqs_off();
 }
 
 noinstr void irqentry_exit_to_kernel_mode(struct pt_regs *regs)
 {
+	if (interrupts_enabled(regs))
+		trace_hardirqs_on();
+	else
+		trace_hardirqs_off();
 }

-- 
2.48.1


