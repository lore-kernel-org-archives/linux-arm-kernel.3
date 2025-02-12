Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E2DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L1+xbNej+7+BbJW1uipXHwDEUpYT2HP3XoeW+FBwgo=; b=awHBGbpPwPAzkhi+Uve13RGkuD
	GmlLF+/CoCuKQEuChlIbnSk+UpPFIk8+STbDz+007ZRd1pjCCIfgBnIs5AEGZb7EfVAA3yHg28Sca
	JmHzdm8e5IZeweeQStr5hXEBgehZqYbdzdnIpi9Z5sE2ghl1yFY4N88AV2YY4cIp5N7hA0eq4njal
	/ghMhi45IMnW55QqoSf5dniYedCZV1b5yGav38tT4EvvjMR8q1ZE9/4ttVZKuHUglakwxml5smq+w
	wXe9w8lbQ13FLYTusrrNLbCz/QOggsBVLAq+H/IZXBINQwqsc1k7IVXU32OsLm1HqqW0zAyxF8y2R
	15EAhwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBQX-00000007HHn-2MOy;
	Wed, 12 Feb 2025 12:01:13 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq6-000000079kM-3YMV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:35 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30761be8fa7so60303531fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359413; x=1739964213; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8L1+xbNej+7+BbJW1uipXHwDEUpYT2HP3XoeW+FBwgo=;
        b=BkPAdvBNUUuPdAEH6cTXWH4c6ni1hwJiEYlpZmSYA0Z3RtMsVqzsnFuTBGgzpktzKm
         bkqOOmpiaI5cBvrvjuZacqR9wVSAT8749Ii9rpck0QCZWABZrpcFXixNemEgHqCGgehL
         QyOpKcd5kpjAAE5VIcxEvAWwmQ7JkyTSqeI7PME4gG3gXz4vhL4bOBVqQJ1eRwpCKuk8
         YkopfHmuugACnOsCkvf9AJbBChxi8QuRq9wQVwJ1MDmLoohpbVy/ej8yOeA9EF4tiXjP
         5gfoa7hZDHYcXRmFg34uj+fQ4EG3LnNe7393oHZLSuRQyfZ6Zmpu8qvw1dluQ/eIOjDG
         m9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359413; x=1739964213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8L1+xbNej+7+BbJW1uipXHwDEUpYT2HP3XoeW+FBwgo=;
        b=bQLERl8NG6WUYFleyAjLLfpiRGgsXlIqxrbD1a06YiHew7T7Iy1UyviSiWIe+XrXDl
         DTjQkiJMlc+Fw1xSWI2YdD1iv12BIwpXIYoomOu69C47GTC6MBntVj5cn40gVDFR1MWs
         IViFZX0dc2+SJ0lbA+2sUWYnRJ+lq1tgiY9TYK/vik59Zye2PpPFkpxUzvHkpopENcDX
         HGooNiMlRHes5jJvKI4+g5qBDxGH8/QeFtOOSgS7gdjwK2Xrf2Ebj+j7cTJBY7B942FO
         8ZZPkWc5h3qRdV01558y7XV4jW+BtEwli5u3HE8K3RN2LuFoRGlnusW3Cq02enHBfSQn
         qzlQ==
X-Gm-Message-State: AOJu0YzHDZPlPahvAQz2xILBOiQsJTujLOiHMNAppJS6jLHr6ALzUaqA
	Rr6Ru2QkRq/AUMRtgqd4Jle6BBBstic/IJF94bEkMoyU/R/iXSuEIyN6jiQrOFo=
X-Gm-Gg: ASbGncsaY5olHjH4GNywmToJojwQUcw+1prl+ntQfHShHe2yfZ95otPmqZvCTeA05QI
	Ugw2y/Rd05mB4V1HJQmGlfqUUgXyzpOdlwxWyV5pevZrFDdKY+VksN0lUs42q2jAiAezEAO0Gxp
	tksa+ocXIgc0jGxqBE/4PJg7u7dDvrRF4HqTnRZRnyQCGOm+VA0MLD3i5xyrtFmdJUyv3licyCB
	VAz89ZoR9cthxlVcogQFJm3uz61jZlLksfFRbHNEBLIQCzN0TKm7cezbKMX1/ynQDVZfnCZh4yZ
	DNf0qDMPw8gn1HD0cX9rWDpmoA==
X-Google-Smtp-Source: AGHT+IGztsILaaYaXNkeSXwRXUmkpO930r7CtwcGUJLwBA+MhfurzFmeCaR5cjXsMc204D4O1MAizg==
X-Received: by 2002:a2e:be22:0:b0:302:3003:97e with SMTP id 38308e7fff4ca-309036dbf25mr11765111fa.30.1739359412849;
        Wed, 12 Feb 2025 03:23:32 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:32 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:20 +0100
Subject: [PATCH v4 26/31] ARM: entry: Move in-kernel hardirq tracing to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-26-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032334_887742_D740DF51 
X-CRM114-Status: GOOD (  14.62  )
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


