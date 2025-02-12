Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C33C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLyynCt450Utx2Z4sB12bYa6WPePLKZjdTj9AHDawWQ=; b=AB5iER/cCLVGRM5rAFA0JKbJxN
	86/ZcBsxFnijdxWYg5/5pVsXHRRPgP2tXrPXLx7tH/B2G1SvkNjglKP0tfm6ZBDPPhenwwPgKsql7
	ZSACCMGwv02hMh9nj6satsxjt/zxFYaPGMUlGZW67PYAaeYLcGf8b6Vq1Y0AwU48hGUKSc+HZ6bbR
	ifXvnlcUg3IPIVQt7XUzyqIc6R1IXsnMk/5HIcx2NdbK1ENMxyhvrd5yaFc/EangLCx7otuI/rCP1
	/wIYaBBVQrd+P+tdP1HTW6j7wzkwHUu0ApI5Ezo4saR+R/7nxNNFqXcJNOqvcz8YWdhTkiXUxrtCL
	iD/LdESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBXV-00000007ISD-1gLw;
	Wed, 12 Feb 2025 12:08:25 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAqB-000000079mS-237n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:41 +0000
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30615661f98so71117691fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359418; x=1739964218; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLyynCt450Utx2Z4sB12bYa6WPePLKZjdTj9AHDawWQ=;
        b=XqIM3N7dRWs/RCDXqausiARgL0lWjdFabaTCGFS0IE02mA0K6/XSlJl1T+1UK0ajqI
         qKwg6oN27GBpCveEyulPLarduDxzsCn+bkUXlm9OMICow+TqYudbQMOw5k0LYRKrpi5L
         PqonTY9eWfmDTuX8MpnTWEQZReDc0zBXh1bGTQ2H6WhXCElJu0zpo6RTUV2W4oeXoLjE
         k9qVacbjCDnzD05OOoS0wvg7hGfgxhv7O5biUKRf05IyFb6Onh7TMqjRMnQKzDPmW86q
         NmtN4H1fwFjl7KB4kIqETQ9/8E6ctfOi1irZJyybncD9ZPt0oLnDJUYn7niZHrRVOF9I
         Y9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359418; x=1739964218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLyynCt450Utx2Z4sB12bYa6WPePLKZjdTj9AHDawWQ=;
        b=d+HMbwITlpitLD3yd6RTVqwbFIRuMd9egaEO6d5FNypYuNbALk20ageYmQxr7jxx09
         IKPlIhXnxSB84dEu56+Mi4qM7qLY5LfpO60/zjUuDvLaNkSc/OMLF58vyYC7wVDIxfZZ
         2BPUUG00PLDEpOtbMTk6XCR3Uf6j0ToljiSx97FtkIrBvZn6nlCBM+zaUYiXuNyxyb5E
         HXlzWqR2125grjo7hmZ0n5b4Nuoy+fybNrjeFWaUPYaNdM+iBrgu+j23TYZ/XiZ4eVtt
         BAN/8B9LY9X8bDKP97lgJpCfVjyc9AbQ1Toc9j2DfjhM+DFfExEdBU3RVboFJLQ10g9V
         IB8w==
X-Gm-Message-State: AOJu0YyOiDgNA0el6ZIv0pbMUBOmQd6JdlCDy+M5M1r96KkAWbKjfhZb
	4A1bimgtR7z8lVEDvMZp0+sf8QhKjtjwy1Ak+NDehSEDzAKZPepR5L2aSUJqEnY=
X-Gm-Gg: ASbGncsYbrdygHbNGmgFyh/oQctzBzKmPsbvk9NS+FGuUVLsSfHPNqxIrc0SKT9q1VA
	zOJAsNqOC3gdfF1LOGFv2fnxA+kn+BaoH0mu/5HbaTRS3ktIpMYz2ygqJ9BwCBPVl8lFxL5QZaW
	E6WZIwpEURp4FD5kMy2UVwh5kP+Sdo8ThW2LxbJ4Fat0ARjyOvFdEukh/Uzi9j+rVIR+ZvgyBV/
	cE/ITGs5nl3vsCp2F2hbup5tk3/xmiqlWg+BfA3NYKFTDTbQ6KeFi3whBKLy30IECEkRcR5LBRs
	OAzqOux0UKIY4nuGFHlQaJCFcg==
X-Google-Smtp-Source: AGHT+IHK2ire6eSOXUjIyEB1DADW6wNdjzmfwgrMquJUSGQom2k6V3tykQc82oC2UKLm7kJWGSeVIQ==
X-Received: by 2002:a05:651c:1b06:b0:2fa:cdd1:4f16 with SMTP id 38308e7fff4ca-3090364236dmr12530571fa.14.1739359417574;
        Wed, 12 Feb 2025 03:23:37 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:24 +0100
Subject: [PATCH v4 30/31] ARM: entry: Block IRQs in early IRQ context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-30-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032339_536840_AE80BF56 
X-CRM114-Status: GOOD (  19.64  )
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


