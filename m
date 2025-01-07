Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5910E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YE0gSDhwSaFrDMzYlVMvfGElRXcDHBg9PKYpzyMYroQ=; b=roF3GDaDCVg/Qn1oWXyaQvjNN2
	ZByz9YBagaLEGc+P8/XwXEozjtXWMt2ITj4A29upBbt2sMtU/WH9RSJyumPotghKkT8gGePUCyLPN
	lJxh3eCKo8EyDji6xJydQQ7K4gfc5tYtMVSi+mNdvl/Ecf0UHlBvU7rZJc3a91r0XQIgtZ1r9VaLj
	TnWqzZZ/hdYLjQN6X8OfRX6RxKMcfuvJXWvihg8CiDulu/SrKxNipXTT5Uvo90gXin5lIWobokLNN
	wrx1Gq7QonGyJXhs21NvmD62bHHlWPiG7ilkV1Tr2nmMQSseqzQfFokpfzBpOZL1Doer7YLqfW3fm
	lXORZJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6fX-00000004Ivv-3kVJ;
	Tue, 07 Jan 2025 10:18:39 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV66C-00000004AeK-3Hzn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:42:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso866317866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242927; x=1736847727; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YE0gSDhwSaFrDMzYlVMvfGElRXcDHBg9PKYpzyMYroQ=;
        b=Qq4r3cQae1eOp0vdtsp7TH4ZP6n3rZ5p6ReFatij+HXzkIfsEnvmSuEOIjTU6UzApY
         n0amNbQtG5y8pJjU1XlOm+oMsKrTwI1AB+oUIz02OtpHHfvdXlkDiBH21qWDLGUf+BT1
         4yOsIUGUV2q3ecggeW04Ow5IN1JM0xnoDsfYh76Sy4nlPqDriBh9ByXmnIWxhWL1aDiN
         4JiyNeVTkflL+LObVrwlKU4vteUzPhLGPy8pdFPpk1RN9jXO4SYHL3EN9u2963OcDip6
         4+aN8BFZrbFk6F6/fGRfB96LVowSHVkOrGMSiXXm9L978A0UW1vN1Sc+hJQUdRJcoO24
         o/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242927; x=1736847727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YE0gSDhwSaFrDMzYlVMvfGElRXcDHBg9PKYpzyMYroQ=;
        b=PQx869Wlt39nSernWJdF9SwhDLrXL3DPsgKklJS2VFfiLfRCW2rteWKEwHa0CrAALT
         B6ScZ7QqtxOLrSdJtfM0tHAAVMVw8rNt9YhfMcHgk0bsRo5/+RX95qqpvmHUgvxuPnyb
         H2CVwVk+DItmWhUmBAH0Uq5yGfxJ23WBvFPmuvNHkMoNd910Gnb1jyZcw0oC8CSnTnnW
         1jf7JqmIlwhbdevAp1eI2eb4IyyWgc7RUxMKkrKT6+1kgEtu4VmOla2wQe8XuLr/iBMX
         UGenbYb8ah/gH8welALZ6cFieNlML24TSEFagICLpyuJsfeU8KG59LG+j8hAhQKOfW8G
         xlWA==
X-Gm-Message-State: AOJu0YzAh+GIHu5rnbk701S+JgPy+IKIkkiTWXmnveTfmb+qjkU4D4xL
	o+NrzujjWo5qFDgJtatSKTz+I0UmHzMXsOMvrqNu2zDrigaUq5/IAMR1CTw9A80=
X-Gm-Gg: ASbGncv+MjArXyP68dQDLLrF8THsF8P0sup+QdFHHMyc6l6fubUwnlR00f78S/rfpgx
	ayEwZow1D5b1lHv+UEmP5i0bk6uVlc+1TDRSQIwDbI92TxxvjciO6QkGWjjoyS7vO6x7veZ4SlI
	N5WK/L2Q0DwdrMIA9ukI/vON8BGnahVozL2rH0IVHU4Gd8VR762hZxHQFYxPIlcBWxxLV0olxB/
	K6492KKWphoGov/83YN9JdXausOamr7+lfDoNtSjtlTGN7K4YI/vXv3gGr3Qzsp70s=
X-Google-Smtp-Source: AGHT+IFTHzUi4Nr/92cQuZP3zFtg0euFy+Bj/7m2UCAv98WxZqhGhnbcyH+vkfzUSa4ZKvGr627g5A==
X-Received: by 2002:a17:907:724f:b0:aae:ebfe:cedb with SMTP id a640c23a62f3a-aaeebfecfc4mr3327387766b.51.1736242926410;
        Tue, 07 Jan 2025 01:42:06 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:42:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:46 +0100
Subject: [PATCH RFC v3 30/30] RFC: ARM: entry: Block IRQs in early IRQ
 context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-30-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014208_837801_0BA6CF4A 
X-CRM114-Status: GOOD (  18.58  )
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

This workaround blocks interrupts in the pabt, dabt and
und exception paths until after context has been established
with irqentry_enter() and before it is exited with
irqentry_exit().

This seems like far from perfect: it seems an interrupt
could still occur right before the first disable_irq_notrace
or right after the userspace registers are restored in
ret_from_exception. I would like to know if there is some
way to set up these exceptions to inherently block IRQs
when handled, until we explicitly allow them between
irqentry_enter() and irqentry_exit() or if this is simply
the best we can do on ARM for these exceptions to make the
context tracker happy.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S |  7 ++-----
 arch/arm/kernel/entry.c      | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index ae2f952beea7611f0abc7bd299fc944335a21219..10f59b2864a43dc4e1b141513f39eb9404ae9fd0 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -389,6 +389,7 @@ ENDPROC(__fiq_abt)
 
 	.align	5
 __dabt_usr:
+	disable_irq_notrace
 	usr_entry uaccess=0
 	kuser_cmpxchg_check
 	mov	r2, sp
@@ -416,11 +417,6 @@ ENDPROC(__irq_usr)
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
@@ -438,6 +434,7 @@ ENDPROC(__und_usr)
 
 	.align	5
 __pabt_usr:
+	disable_irq_notrace
 	usr_entry
 	mov	r2, sp				@ regs
 	pabt_helper
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 10714dda5753684c7a2b8960562748525de774a8..852e03fac6ce8956415e464a69d41328593d2cc6 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -16,8 +16,18 @@ noinstr asmlinkage void arm_und_handler(struct pt_regs *regs)
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
 
@@ -25,8 +35,12 @@ noinstr asmlinkage void arm_dabt_handler(unsigned long addr, unsigned int fsr, s
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
+	local_irq_enable();
+
 	do_DataAbort(addr, fsr, regs);
 
+	local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 
@@ -34,8 +48,12 @@ noinstr asmlinkage void arm_pabt_handler(unsigned long addr, unsigned int ifsr,
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
+	local_irq_enable();
+
 	do_PrefetchAbort(addr, ifsr, regs);
 
+	local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 

-- 
2.47.1


