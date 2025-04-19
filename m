Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AABC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAvsOPeP+oswKyJJsbXrokIjvFxvOZNdow0lpkJuB2U=; b=JFvB3vqW79XdxmRSCu/efow9b0
	MPL59oe2VM2kqqu6DZIcZL73t5HFTkufpLZHpWo5C6X8HKI1EhWfe0sG3Zc4Y7tyu2IccJCQUncg0
	jxfnHA4wdIjSKK3Goq1/ZwV1+TFoKvuR2nZtpz5K2y6CEfAbQU9U98KIbVLULkjr36D8DfZUKE393
	gyZE+nJbSvmgtzIGvPLxk8eE2W43ur4GCXrdbJy7JbPnvgJuCgBRj8NWGi37LOvXyN5TEyYuPOx8F
	t7/bBK2lCyHMwWIbq0Y1lY/+4a4WT08QBjIHqspLOJBsLNo1ovaRwVUirVdQUaGLfG3+4d87qYbb/
	WESZOOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HbN-00000001xjl-2znK;
	Sat, 19 Apr 2025 23:28:01 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnY-00000001suR-1H6k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5499d2134e8so3211645e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102190; x=1745706990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAvsOPeP+oswKyJJsbXrokIjvFxvOZNdow0lpkJuB2U=;
        b=QW3ZQT5WOFFr3BuZNfMN7Llxi8s/++JTc77O/dMpse6IcgF8IzRO02Ydc58B7gogAF
         U9iMN+xdbbgsw5QHE4WhsINywZ30yRT/dQP0TAphwn4k3ckCGDIHOjD5mVPcefflTk86
         2VWT3/Z2jTeLjaK+HSJ1Gf2zCUjYpzVXWyqUpuK9jA0NwT5bjYXIOUgwxCejKLR2hwSp
         yfpxFKzZOOHvdehJL5pkLqfz09/zljJvm0r9ThEPrHfsSggGnzlA4/ziiYfiITb7xV9t
         qwl6HGqCloU2lt2aX5QT2R57R5qpXK8KgfcPZb/HOhV5836Ph5yjZHX7KdLXY0mtZEXH
         vdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102190; x=1745706990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAvsOPeP+oswKyJJsbXrokIjvFxvOZNdow0lpkJuB2U=;
        b=g9NJMlCTS8vhxP3Zs9U6ZUJItT99x6i6qV/tPxzgGVGS0HhQOOcPKSBw9E97FRXfdd
         v1AOGDzGNXyq/lvKNbDZyggNfhr4/ufdYyP102IwVTYqGEJ6z6isnUBYPoSX7JoRO6Pa
         z6o/LN+VbB6JRurkx+HW2LJBAIDcCgoLu5f5DnouB4FQrDu4jL+bqU1xwOQUjVbpWbQo
         ZkTafkG0pfWLx6qw8z5AmENo1Mp+a5SN9dNAdCibf0Qy6O4fdzCKpeqMYxZ4+kQwHCke
         oEIJh/btJd603UH9TTHOS6vsnOUS9J8oOUFWxbBTJmhRN1mW71WY4+lOpHyNT1ezfrFq
         LQlw==
X-Gm-Message-State: AOJu0YzD3/tg5x6nIXf2yyBTjQB+914/5TbsfB2NymD3gf1FQ26GWzuG
	XhPxHvzf8+0AQ9XG7uaXDal1pAUcrJI5F04RD7ThjTl5bTMHVtNM9JM21rbOYYI=
X-Gm-Gg: ASbGnctOKXQ1ulMNYDxmiffnDW8or0wnP4nXW5l5/QRTdU6L3Bj51n2iOY99V3XIvwZ
	/nUV1Ym3Mi0jBbtqC7MubfK0BEQeIOabdHDx5Kz2ZmErer8wmQJZ6+xmS3QGbn5Dumu+x2cj2+O
	KRDiE4JNV9a2zOtoEeLrziRGwSATZQG0BP3NIOfMXb7mGGqi24QI0Ka6NFkcsDI51HIspgndnqw
	pLGijyyIksTxqaqTyIoLl4l1uYpyZ0NraTvwCLISi2+r1zm26W8jIbVTmuIL5J6yCXalNqx9sq0
	HwyRWz3QmrOf4iJJnocy7MxRJglW5eeVJvgw9r6cTwNQWirq21SA1YouXcFO6w==
X-Google-Smtp-Source: AGHT+IH/THCTqweTbW4N/TTTzB4n2Pk1gT1TCe7h8Q6RxxoyRxUigVdyth6ikiAYh3mwUJu0bcl/Uw==
X-Received: by 2002:a05:6512:234f:b0:546:2f4c:7f4f with SMTP id 2adb3069b0e04-54d6e633de6mr1960703e87.28.1745102190459;
        Sat, 19 Apr 2025 15:36:30 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:13 +0200
Subject: [PATCH v6 26/31] ARM: entry: Move in-kernel hardirq tracing to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-26-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153632_350454_939B4511 
X-CRM114-Status: GOOD (  15.36  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


