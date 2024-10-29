Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC793D2AB29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZScZ0+O1z+KD5ly1wGwp6XJNh1QIX+DiUm/Qzjn1DDQ=; b=aghFBhwda4E4F1Y4kxhcp4i4Bt
	5GVmdFI+FwLBBGRTcgSAFQyKLDLFKnFeZvOVrPsBQx3r0LT/OW+SVEES4A0+uRaTGvrglmU1AbT7g
	9oQOQ2BBgqCF5BYjeNUxYfoUanr9YNxXPCyIuApS96BDBnzJAwTwUAi1ZUQs5JpPly4tEaY2j+EZB
	AUxuL6uVnzNVWRKRB8B3uQCOQJJWDBqbyiIhjUFFeorO4aaN2D/xxYq/59q8VPTIkz4/7Asf0vY3h
	+pOOd5dR2ESC2r1z7DWsKdMPQk5MdQC7OXK3bbJhg28LVDv+FReXTuLhbiUQnC7yhpFliE9LMQOsV
	8kpHza/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kwe-0000000EKWr-0d3I;
	Tue, 29 Oct 2024 12:03:32 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqy-0000000E7XJ-3ARD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:38 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539f72c913aso6808096e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199215; x=1730804015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZScZ0+O1z+KD5ly1wGwp6XJNh1QIX+DiUm/Qzjn1DDQ=;
        b=H4Amsxa054rWEs19mf/EyC+1bVRRBOxwhHOpRYMchL1WNnPQcOLmHCzHmQUchrlhMG
         RWN95Y5NvTVJBUshyfN6vZnos/07mtqFbOaHE3JELKj68j7B/tkzJMjvXSGIm9p7kncC
         DWJ/1yrMBOfvgKdBGfHW8JHvsh2MuVEHEITza3sS8uOgD7rhL6Gj6LN8BhJ94s2K0CVB
         O0mb2QSuUrwzel/Sotj3C9wwIVf3QEdL7qJbJazxHxaZBYCGL78kKiWIlRmt3RLQsLom
         jncbj0G0rXPho0cTAqTPlRmN/zgKYclVXpEiXtt3Wny5LJwRkgD0xJxR1V0Os4w4jNzS
         7Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199215; x=1730804015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZScZ0+O1z+KD5ly1wGwp6XJNh1QIX+DiUm/Qzjn1DDQ=;
        b=SupHQtKGpBoVUeBtRPtyQIYkOpg550E8bg2ydAj6LZ4B/C6SBCu/hisrArga1b2UWe
         pY8TDC6jVwU/uuCUFpPygUbAIo6Qf1gUT1BbXn6j6MtcUHCoPZ1zb6N+Py7GXkWb94jx
         EkEJf32nx+ZE3kOHHcJBv4AnMg7RFfz80s6XD6Hk0w4CM4q8HUeUGNMbPBZFiaYRb7Hn
         153wcP3/55OBWRHifYHQvF99TdoMF2mNCta30Ohhknqdh3NgL4sPSiUT6s2vFjVRJ1XH
         F/TRBU0T6+m2re+aB059grHHNYD1uCtDiU1R9zw0R/2nYwBeN1Rd8UjB9P/IaMFdQ4sM
         yeMA==
X-Gm-Message-State: AOJu0YxaFxoGgIMPp3/BpJ2CVaACutEvN0OXkUKj/Gsrf2PBpOit/aeZ
	/eGDD6Limn3L4VG+t1KYHmkckr+NuQL8+yFWY2hzyg3N562tFz/c6ryJcIvxayk=
X-Google-Smtp-Source: AGHT+IFuQtccSquVaHeIkt6pIsoMJv+xdK5WssF0bBYkK4KjihYMKnkM5Ythh/2t9kCbB2W6mYSllQ==
X-Received: by 2002:a05:6512:a92:b0:539:fd10:f07b with SMTP id 2adb3069b0e04-53b34b39774mr5544494e87.55.1730199215170;
        Tue, 29 Oct 2024 03:53:35 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:53:06 +0100
Subject: [PATCH RFC v2 26/28] ARM: entry: Move in-kernel hardirq tracing to
 C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-26-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035336_840424_DC9DE154 
X-CRM114-Status: GOOD (  14.76  )
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
index 21b11fe199cb..600375f6f5d8 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -157,7 +157,7 @@ ENDPROC(__und_invalid)
 #define SPFIX(code...)
 #endif
 
-	.macro	svc_entry, stack_hole=0, trace=1, uaccess=1, overflow_check=1
+	.macro	svc_entry, stack_hole=0 uaccess=1, overflow_check=1
  UNWIND(.fnstart		)
 	sub	sp, sp, #(SVC_REGS_SIZE + \stack_hole)
  THUMB(	add	sp, r1		)	@ get SP in a GPR without
@@ -207,11 +207,6 @@ ENDPROC(__und_invalid)
 	mov	r0, sp				@ 'regs'
 	bl	irqentry_enter_from_kernel_mode
 
-	.if \trace
-#ifdef CONFIG_TRACE_IRQFLAGS
-	bl	trace_hardirqs_off
-#endif
-	.endif
 	.endm
 
 	.align	5
@@ -238,7 +233,7 @@ __irq_svc:
 	blne	svc_preempt
 #endif
 
-	svc_exit r5, irq = 1			@ return from exception
+	svc_exit r5				@ return from exception
  UNWIND(.fnend		)
 ENDPROC(__irq_svc)
 
@@ -302,7 +297,7 @@ ENDPROC(__pabt_svc)
 
 	.align	5
 __fiq_svc:
-	svc_entry trace=0
+	svc_entry
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi
 	svc_exit_via_fiq
@@ -320,7 +315,7 @@ ENDPROC(__fiq_svc)
 @
 	.align 5
 __fiq_abt:
-	svc_entry trace=0
+	svc_entry
 
  ARM(	msr	cpsr_c, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
  THUMB( mov	r0, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 49a9c5cf6fd5..cfaf14d71378 100644
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
index 674b5adcec00..1e1284cc4cae 100644
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
2.46.2


