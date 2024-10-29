Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82999D2AB23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1Hv1gsrpr1we4HbxlxxqJW/y8rgdVZEtXO9KHxWDAg=; b=VgGatiZ3o13IdndNFcfjxCCbOs
	fYiGHdpljgskRYLesSdhGPApcm20ioUQuznsGpP8Y9bWMtMn4sMS9eQ/koOBWgfpK/zjD+8VW/Yj9
	1cgX2ihJzfC5p4Qe17muVlDksD9OBLhw4XGjr/Gsky/3hGtvYjivOqGSRX7K12of03Pe9zXTJgu6I
	+FQusA85ta/MjTt8HFQF3IxiCaJ80RtYMQhcLRqlvero3oE1Azt9EjMVpSP1rpVaYiwXoIxiUzfBL
	7wbvfYcnpX55TrcSteHAvZgVqlJ1WHDP/3VA08FJl6KYKznJone2m9NJP5jnFbMiupKC87l7lhMdU
	lisi1H5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kgZ-0000000EHPU-2HjY;
	Tue, 29 Oct 2024 11:46:55 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqt-0000000E7UX-0fi7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:32 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53a0c160b94so5892774e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199210; x=1730804010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1Hv1gsrpr1we4HbxlxxqJW/y8rgdVZEtXO9KHxWDAg=;
        b=IyJD3HwpWEsKix0YsRaIg60s4wq+tXxL0t8WdWHZSRiW5lA2635E2Qfojha0VRXOKO
         QDDx+31xHtcHCa5izpOgTQuZr+c6MSenf8OHof1gJwch7tODE7wMgBeyH8yiehFYrhrJ
         gYMEHHmnNnSoOt/g9od5l1gmdPhoRBgo3tTNerPcBz1raTin/97SiKH2I+n5WrLmYWNL
         lkmNKcIeqbBJDKSQ0qTjxgtuuTnkzZ7l1fSE+6XCA4LYtg48q7dPSffXhV1Pqf8yRgi6
         +F/mEZchG2jdsRlSOO+t+6qOMhCopP+cOLc1TXPbeXo016zdibjjlQmqN50UDfEAin0z
         OqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199210; x=1730804010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1Hv1gsrpr1we4HbxlxxqJW/y8rgdVZEtXO9KHxWDAg=;
        b=B0FwjM4PYbWnOJsD1HJ7kaDtepaKrjKRoqrMC63nUjqGqOv4+GPqyTNSHsHkkdQx3q
         kvHOksDmFjvZ6dIEtL/AfZqAW01IeqarOgeHNA+N6w79W4km0bpnM2gyNIj8xVha3egb
         ANjURGvG0eTRpw6Ws12qaUC7Elc9rb5DHcT/Cmmpj5//m+roM9/K5hGm5tW4JUXpgnww
         AF5I9tuFIjbUVWI7/iHvqnb45jfVnBbVErGWPdFH4uqXYO9KMNXDY/dV651sMWtSPP1G
         SPzzuPXqDZMO2NXDJuAqh/8K4P4LnpbJy1iWIRkjGItt1nrHj09dIHmwp0VLQLvTmPOa
         V/Ww==
X-Gm-Message-State: AOJu0YxnlQWkHLDqqhAC/03ZrTgowk2F+ONQ08nuZdczhTcITAMcj9us
	K+J1lID86d1zlS3J5WfTWzdgfTRMk54YLxcT3vaIP3YvHn/s6L9uZjlIXkFkQU8=
X-Google-Smtp-Source: AGHT+IESV034VK8PKLncc0cgi0pz3sqYxwxxzlGeXGgL9emDXp4QopwrVEL+WsUUoIebBL3YXi7/Ow==
X-Received: by 2002:a05:6512:1252:b0:53b:1fc6:3cef with SMTP id 2adb3069b0e04-53b3491ccfamr4773281e87.37.1730199209505;
        Tue, 29 Oct 2024 03:53:29 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:53:04 +0100
Subject: [PATCH RFC v2 24/28] ARM: entry: Complete syscall and IRQ
 transition to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-24-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035331_237553_D2FCB617 
X-CRM114-Status: GOOD (  17.32  )
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

This moves over the last few lines of assembly to C. The
subtle change is that in return to userspace from syscall
(SWI) or interrupt, we need to call do_work_pending()
as soon as the thread flags are != 0, just checking for
work with _TIF_SYSCALL_WORK is not enough (the machine will
freeze if we do that).

This is because do_work_pending() does not just handle
work: it handles _TIF_NEED_RESCHED, _TIF_SIGPENDING,
_TIF_NOTIFY_SIGNAL and _TIF_UPROBE as well.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 13 +------------
 arch/arm/kernel/entry.c        | 19 +++++++++++++------
 arch/arm/kernel/signal.c       |  3 +--
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index e2ac6d3216b6..6b0f86786a7d 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -61,12 +61,7 @@ ENTRY(ret_to_user)
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
-	ldr	r1, [tsk, #TI_FLAGS]
-	movs	r1, r1, lsl #16
-	beq	1f
-	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-1:
+
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
 #endif
@@ -74,12 +69,6 @@ ENTRY(ret_to_user)
 ENDPROC(ret_to_user)
 
 ENTRY(ret_to_user_from_irq)
-	ldr	r1, [tsk, #TI_FLAGS]
-	movs	r1, r1, lsl #16
-	beq	no_work_pending
-	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-no_work_pending:
 	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 88a7a699306a..d7fdb9df3331 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -6,11 +6,6 @@
 #include <linux/irqflags.h>
 #include <linux/rseq.h>
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 {
 	trace_hardirqs_on();
@@ -28,7 +23,11 @@ void syscall_exit_to_user_mode(struct pt_regs *regs)
 
 	rseq_syscall(regs);
 	local_irq_disable();
-	if (has_syscall_work(flags))
+	/*
+	 * It really matters that we check for flags != 0 and not
+	 * just for pending work here!
+	 */
+	if (flags)
 		do_work_pending(regs, flags);
 
 	trace_hardirqs_on();
@@ -45,6 +44,14 @@ noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 
 noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 {
+	unsigned long flags = read_thread_flags();
+
+	/*
+	 * It really matters that we check for flags != 0 and not
+	 * just for pending work here!
+	 */
+	if (flags)
+		do_work_pending(regs, flags);
 	trace_hardirqs_on();
 	/* This context tracking call has inverse naming */
 	user_enter_callable();
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 03b20637a2e1..a39ee14ec5b7 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -598,8 +598,7 @@ static void arch_do_signal_or_restart(struct pt_regs *regs)
 	return;
 }
 
-asmlinkage void
-do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
+void do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
 {
 	/*
 	 * The assembly code enters us with IRQs off, but it hasn't

-- 
2.46.2


