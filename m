Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C863C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLyynCt450Utx2Z4sB12bYa6WPePLKZjdTj9AHDawWQ=; b=ViS0GgBIqeH/acTAjxxtmQTiKF
	H1Mw20VqFh7oYSjcFamY0wXgx2LRmLoL9Wm2+jySW0ODunOGFbpmxkyON5dRiQu2FtLfEboQVb1dE
	trqjWlfzq/QOCekKWaiA/dhhOJdWwbibfjruAKrJZcunKpp5uFF9+Qg15Xw6FGFGSCf5bhbkWPdmb
	zt37nULr0v46bsWMWaAL9pYdpUwkX2+f6qvjlRviCUWTcmvIDpGPFi/NpyxP1T/5Nr+7B/We926/a
	eWvoh26S1UvWHjLH/JQHrWAQzjt1qq93BRjqW2CpiXzokt40fAZ6Os7t8TfcGJfxZIpJw8kNj2Ksa
	adBMsaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsyi-0000000H0fF-3Ioh;
	Tue, 25 Feb 2025 11:19:56 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrf5-0000000Ghpa-3zds
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:37 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5461cb12e39so5193852e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477334; x=1741082134; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLyynCt450Utx2Z4sB12bYa6WPePLKZjdTj9AHDawWQ=;
        b=Mjsa+PHbFrIbqDYCVgaumbeIsLUnQqk0Uw+7PNmpTq7d/H6Y08PrZRrwmXS3+Q2/jT
         l22aJA66gWAH58+2qOHhlsM2+vVRBgQtcZv2Vf4DLINJJPWWQ4R9bHqUayi/vrr+mCFO
         B1puBek4Y390+oeeIiJ8Az08XP90xeH5vViJ6/5xIrP5eIa8X3NIl7c3Jr6IPBYaJdO+
         gFZcR+vHpYTn7AJf22h4DiNZhPVFZDv4N3EyA9+//RqmtOxWdbT/JRkthr2BDUgRuvr7
         1IcygF14UGl0SVAAaWxIHM7tCi0C179EqzzwHenOH/GL1W1GtbUFOlVrCmb+/TgnlU8w
         uH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477334; x=1741082134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLyynCt450Utx2Z4sB12bYa6WPePLKZjdTj9AHDawWQ=;
        b=Y0DTgQv9MQtBaO2hoea0MGTOcpFohxDFQrufubnx0+6+TidhE60DY4uVvveCZY3Vte
         LFEK8tWQcxd80bP0eS2jJty4lX8gnh7uTY7/da2r/HsDedgGQwFB08OWLq11XTXGu3iM
         xvgclWkTsVyb4YSoNw35qJGySeZrIa24uSgXANcOpnNMVY8FthhL8xjH/cWJQyaNwZ64
         6SLF5mQm83xCxuAyzga7VvRTR0iJuxobNRL608kCo4P16tjZ9C/kXIguChLURQJnsXGo
         +GRx5F2ooXpoMop15/4uVWHRkK8kYR0YY72GQdCDTlNPa6aV4vUpDFEo0dmTXn8tWqnk
         KjYg==
X-Gm-Message-State: AOJu0YzPd+uc62lg2dASx1xCHV8cNvVHNauFssSTmPMDZgZig2YAIE2Q
	yCzx7Wr0F8Upqv3kiO3K9d3Pfh2urxwTCcD+Fpab/xbLspnbGmW94CLai+NmFiY=
X-Gm-Gg: ASbGnculDi6WzcJDtCvvMPzipOnza9R7vAFMoLXVMT5mzC2vP3M5YK8lmfsyBFUJl90
	jngFZcsuDeuct1uzGh0GsFrbqKrgnxMaE0n5yFfHaRBR7Er7G9vSX8ZtWZMObjW6maFL5n5qZ1i
	0Lpy5aNG5pHDLaKcAHkpKRAjbGQXFoSXC3X5vHIHRTuWxgcqvlDtJO2k5Cc4BSp7XyXmY1SZI7r
	FkTu0rJoYDWFAqLcX1/sW8Drq1gdAQO+mP3Lwgy/43J+LM/9jetLlkah7BpZxMItHkTpiuJD8YK
	VZYRlqb/Og+5KarU5Oa1hNmYYm6DUMVqgk2E
X-Google-Smtp-Source: AGHT+IHp3UDsNY1OdXjOXmJRnD8oRCpL6CgaUimOK/pVgJHgRaGWijdZG0cBnNzC1r8eEV5WV+PGEA==
X-Received: by 2002:a05:6512:68b:b0:545:cd5:84d9 with SMTP id 2adb3069b0e04-54838ee7b55mr6011950e87.12.1740477334328;
        Tue, 25 Feb 2025 01:55:34 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:33 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:17 +0100
Subject: [PATCH v5 30/31] ARM: entry: Block IRQs in early IRQ context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-30-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015536_007833_F91B8BF1 
X-CRM114-Status: GOOD (  19.83  )
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

When dabt, pabt or und exceptions occur on ARM, ordinary
interrupts (IRQs) can still happen. This isn't nice for the
kernels context tracker, which expect (when using generic
entry at least) that any nested IRQs happens
between irqentry_enter() and irqentry_exit(), else it
thinks something is fishy.

This change blocks interrupts in the pabt, dabt, und and
abt exception paths (all of them really) by unconditionally
setting PSR_I_BIT in the early exception handler, until
after context has been established with irqentry_enter()
and before it is exited with irqentry_exit(). Inside the
context-tracked exception handler we enable IRQs again,
and once we leave it we disable them while exiting the
exception.

The local_irq_disable() in bad_mode() can be dropped
since we are now disabling IRQs in the early assembly
exception handler for all exceptions.

This seems like not perfect: it seems an interrupt
could still occur right before CPSR is set, or right after
the userspace registers are restored in ret_from_exception.
I would like to know if there is some
way to set up these exceptions to inherently block IRQs
when handled, until we explicitly allow them between
irqentry_enter() and irqentry_exit() or if this is simply
the best we can do on ARM for these exceptions to make the
context tracker happy.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S |  6 +-----
 arch/arm/kernel/entry.c      | 18 ++++++++++++++++++
 arch/arm/kernel/traps.c      |  1 -
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index ae2f952beea7611f0abc7bd299fc944335a21219..3dae35b0bb3f440ecaf157a45687bf4690fb8f88 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -416,11 +416,6 @@ ENDPROC(__irq_usr)
 __und_usr:
 	usr_entry uaccess=0
 
-	@ IRQs must be enabled before attempting to read the instruction from
-	@ user space since that could cause a page/translation fault if the
-	@ page table was modified by another CPU.
-	enable_irq
-
 	tst	r5, #PSR_T_BIT			@ Thumb mode?
 	mov	r1, #2				@ set insn size to 2 for Thumb
 	bne	0f				@ handle as Thumb undef exception
@@ -847,6 +842,7 @@ vector_\name:
 	@
 	mrs	r0, cpsr
 	eor	r0, r0, #(\mode ^ SVC_MODE | PSR_ISETSTATE)
+	orr	r0, r0, #PSR_I_BIT
 	msr	spsr_cxsf, r0
 
 	@
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 01e4339ccdb4951e04a89fb91ad7c6e1991e09af..3881670e0987ee40be6fff32f412edcf4f3ec80a 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -17,8 +17,18 @@ noinstr asmlinkage void arm_und_handler(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
+	/*
+	 * IRQs must be enabled before attempting to read the instruction from
+	 * user space since that could cause a page/translation fault if the
+	 * page table was modified by another CPU.
+	 */
+
+	local_irq_enable();
+
 	do_undefinstr(regs);
 
+	local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 
@@ -27,8 +37,12 @@ noinstr asmlinkage void arm_dabt_handler(unsigned long addr, unsigned int fsr,
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
+	local_irq_enable();
+
 	do_DataAbort(addr, fsr, regs);
 
+	local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 
@@ -37,8 +51,12 @@ noinstr asmlinkage void arm_pabt_handler(unsigned long addr, unsigned int ifsr,
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
+	local_irq_enable();
+
 	do_PrefetchAbort(addr, ifsr, regs);
 
+	local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 
diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index d3a689bd05955f1ae46a6341e456bb097e831311..b2eaab9cc4977c448f77faa4e6bc22a0749d1f9c 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -515,7 +515,6 @@ asmlinkage void bad_mode(struct pt_regs *regs, int reason)
 	pr_crit("Bad mode in %s handler detected\n", handler[reason]);
 
 	die("Oops - bad mode", regs, 0);
-	local_irq_disable();
 	panic("bad mode");
 }
 

-- 
2.48.1


