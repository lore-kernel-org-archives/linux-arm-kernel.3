Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C26C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8D88jB/ZLUR+u5sD/SlqiLgwtYZ6RyfN75LGR2wihE=; b=ZZwd/n8EGj9Q9domVAA8ryDAJH
	5fVoPuYVnic5nmhcXW76tbKfN/NuDwVoi9Vq/I+w6nc4PC3nvD+2KDc6AR2aOFVCLEo5J8n6ExqdZ
	mo4kkzER0AQRcMA2gWGg4ntVBgo8YWzR1L07+Csr/qbCzfg75U2Xa1clTH92aAiUWE1SD2a3NX9WS
	D23HSOSnhq8FPCUkqv6q9SVB4KTgh1pEYoGewTTuPVaAn5ynAW0izSx5n3Lvm2mQFfHBOBkr4X90L
	sxMyIfc4YJtzBEXTDk+BGa3Jrk7VsRExYt/U/jQlkBmVHMeTusfW7Z0XrQPCYePkpEZxpHzWKqzVM
	uEkDz/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6His-00000001yMP-3JJC;
	Sat, 19 Apr 2025 23:35:46 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gnd-00000001swb-1sv5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:38 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54d6f933152so1929025e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102196; x=1745706996; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8D88jB/ZLUR+u5sD/SlqiLgwtYZ6RyfN75LGR2wihE=;
        b=g9dyKMurGaEzjSo228EytNWyDGFItAvS77JSar95rLs1lJJ94ExMkoJ20mWQBSU6/C
         mKG2Qym27lm/jsxYb/GHh4PDLH2PFVJgfhYZQwFIM4gdsm1DkqoM3fVWRQjZduA92YM7
         WOCzs/X5Ef52w/IrGdcwwaUBz8wS+K1XBboIYFbbZoJU7tulurNC9nqLwQrn64CgysoZ
         Iwr6DKTLjsmW/lmMr6XjEmqD46F4y8MsXTi3NygWINaUJEYIHvg+zDPssihCtbFT3+Co
         gZax4MoUFLiq1w4HBysK/wmspr2nIRv90OF1FmT/4lJdUGAYCPQc8Ju+jnvxpZLDJ1GV
         EAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102196; x=1745706996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8D88jB/ZLUR+u5sD/SlqiLgwtYZ6RyfN75LGR2wihE=;
        b=QOkRRizqkVrSCDKYZpYyCzINY9wpAkv2/HRUoBoiRzCBJx8WRjjYO0L4OrX1vrmQWD
         bmXsIq0ETIMadweIUUvFHJdguU+IZztsBqMjKr+MTnSomXQOME7liU3bvJzAVngoO5Rl
         Jd2alOnAH6tMvi1kKO1o28tDAhpmdoyFwpAw3HUZaGZlHeEjflk5Rpcl5m6IcFN3ifTq
         w7iR/reO0ia4LUkXAT2/EA6HJdgK7FlXRRNCvAbowVdSY8/rey5wGu4DjdeapmerNkvo
         G8T4UmArKfE8paWKLnmq4fBsdkVremV0/XpLSHgfb6YzYALTQtfLFJqe2WeChAKiNgzh
         Wgrw==
X-Gm-Message-State: AOJu0Yzaecm3NuSaT78cd5KG6xFU8AcGRpjdqCDsSfqCUyDZnP9kosnz
	zEx0P64arlltwaYDtZHMRwVx9sxHPuQC6V8bvCWHkDubBk2BE9K7Wos3p7y84DQ=
X-Gm-Gg: ASbGncv9x7SMGUp2oPotYnKhVQakYE+ya5AN0aTGiCzf1ndWr4MH57+xzzkayKoSnyd
	vtQpEgMDMqs5xeQc7K7gx00Zw7ccNf16Jgh9vUjqzxgn+g6lBuvHI1218bf1mKYxAQ0u7sNSEU7
	44EbGy/bRqd7FKYnwLdoo415+AYHBeJRWrsuilLIcmsxrME3rMFzfWFpcg7ugVqE4Et4l2PptEV
	R6bpZuoLIPrELWtZn5eq9LpNkaG7UGGF53HhIlMJ8poZ/c9kieIDOfg0Ack8YJILZ1bDAHZiaQA
	X9scdwYqZr191tBMlUlPEf0IK+y3ggsskDxMZ8a2tdRVGUqRzc0=
X-Google-Smtp-Source: AGHT+IHBK8ZZfAXfhtWw4iocc/9sst0szqHvSr6OfamFmJ2B5DuDtCYQs8hP/2Z2Lqta1P1S3o2oQw==
X-Received: by 2002:a05:6512:124c:b0:54d:6574:faf1 with SMTP id 2adb3069b0e04-54d6e62be76mr2063101e87.16.1745102195926;
        Sat, 19 Apr 2025 15:36:35 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:17 +0200
Subject: [PATCH v6 30/31] ARM: entry: Block IRQs in early IRQ context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-30-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153637_494920_18C51DA3 
X-CRM114-Status: GOOD (  20.33  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
index 934708b9eb6f4d615000c0d667d1c7cfcd0d2820..7d557339490e3e6056ad772690f340f127f51c51 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -508,7 +508,6 @@ asmlinkage void bad_mode(struct pt_regs *regs, int reason)
 	pr_crit("Bad mode in %s handler detected\n", handler[reason]);
 
 	die("Oops - bad mode", regs, 0);
-	local_irq_disable();
 	panic("bad mode");
 }
 

-- 
2.49.0


