Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EACAE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMT4PCSSjbqf8W79ja5QYvNX8ZzwiayCa6wY1VSVH3k=; b=sxo5+slIFzEBjmFnwNjdN5wYBf
	SLUNEHAP4v9KdgSLDo+Y5c9UPZgXhkX0AaIMd4SPTtp3yhbJxjfU8fDMwOnx6+2tC9edWD50/w/Vw
	0MYzYDh40dMjdvbA1jn9jTABQK6dIiTqgjsWXqKT0i69YbuDt3V+efJBNe1MFEoTOzgx8XhHeRNIu
	SEwoHUi9VlPQLS9ioaJN/UXtb1NTHIQtPKIQ6/tjsRYNTIfDWQz2i80avaphiIHo5nzr3lnRFBUGW
	ZgSoXVMirsWpC0uQ6NyDIpAvc4RsBfwVQJGG0TACjgDrS+TkHePLpvDoz8di2wg79wsvhI9yen8F5
	i0zODh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6at-00000004HyC-0pu2;
	Tue, 07 Jan 2025 10:13:51 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV666-00000004Aaj-1AEZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:42:08 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso8521639a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242921; x=1736847721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMT4PCSSjbqf8W79ja5QYvNX8ZzwiayCa6wY1VSVH3k=;
        b=tfxeczEPukmpdl7JYSEqXS6r1MkRIMn1cLfMW8MrCVZeu2xXP8q8TaRsQE0VDjyY1G
         2X7uYCnyd2r0yiNMPJO98U9F6Tihq6OvMao1B57NEWydTlJrJnh2tYKwmgyTT1xz10IR
         hjPI6IrwS3zGfSU0Lbst3P/PGyqeDHMZTiqwAudQaw/hRnn6WLGOQvamX2PxEvAC5qAz
         uZMFUE42gdQ5nyR60LtO+sektg+ZEkrYKi+QDRx7oKepCBKFGPEpRwnv73N/k9n81Gl3
         qbwGBbmpoMMF+SSrXxmTerrBqfl2TZAYWXw/03b53jdg0YFzv/uYZrooVmspiFFtYTWk
         f88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242921; x=1736847721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMT4PCSSjbqf8W79ja5QYvNX8ZzwiayCa6wY1VSVH3k=;
        b=L88GqxAnaj8Y9xY4aTDBH5r9fmpFD+DT7wa3t8rRCeygJu33Qj45e/oNybsam5gUeY
         Jep5Ads2H92XFZMa+VDyQCcTwWnPpYteoyHH3k3Y313JyD3jFjGTRvVZtMpF38FkG4L+
         1G4Z+fmIB+idxAQxSx/TLgIurFFiu7U6cEe3e17tUPpzNwe9o+DuOXaeK9AAPv6cwUjQ
         amOFnuzXyPwWRQ5TgAi85EO4JxLapjjoO9dRbOqkC7Opv7HbqjMyNnavrnhs0bvp2Kqu
         n/huKRK4F36l0lsvx8LkvX30O84YKpkwZgDXbL1XuU8t1EUx9L9Jx8khkcILx/Vm0hES
         f5GA==
X-Gm-Message-State: AOJu0Yzi3kaWhQeN/c9BoD7lI/+er9N+WSkFsZ60Ja13U4cCR73QrVOi
	Uz+31/giCBHdUZvGjCt0hQr5dqYOZpYKW79B7/5B7/aYKO/bzP7gX3GFUojG2ZM=
X-Gm-Gg: ASbGncuR6ZfiyzyhRN2AjPb88puTNnIyzOPMbol48n1XmydlRXKblv9sAoTBFzMe7kS
	wJZ+NqzKkH7BSjpyxQUHmSymtIfO/qOlPoPbemXZvYLZNEGeOpqaOIMxWvfh/6OS1yVHrxnKmQY
	ihv8JPVxuEcd5Wp8iBCyMbypzwR9zrzFF0LrzX2kHchqs7FmiQworI+fWTwPjuUnsXy24vsLZho
	bb7OjeQPP67hpAK2HuCWf3NT6iArDIAra90FICKiFs7ms8QJXWw02P7m/ycsz9KJs8=
X-Google-Smtp-Source: AGHT+IGHMqa0/ZiWplVpsWLK3xTllHfRhzv23loJzX9+Mz5N8MCuV6AGOtz4HX0TG5tn5XTLx0fc0A==
X-Received: by 2002:a17:907:1c91:b0:aa6:5d30:d976 with SMTP id a640c23a62f3a-aac270278edmr6059701866b.10.1736242920686;
        Tue, 07 Jan 2025 01:42:00 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:59 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:42 +0100
Subject: [PATCH RFC v3 26/30] ARM: entry: Move in-kernel hardirq tracing to
 C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-26-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014202_333877_84826E13 
X-CRM114-Status: GOOD (  14.57  )
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
2.47.1


