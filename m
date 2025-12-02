Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43911D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqWhd7pgLu3TuaNPiJjtSv9NJ0oz7uW4FlhXV6xN5Rs=; b=cPEijSyJMJi12YDfIpLL80rrx1
	Pg4yOuF7XRdjeCLg9EYXmIWo3cCbHeGGYONI0Yxsdx6e/k62T3EvidLwQ42XoTHgcFRP8uVpnL52w
	4kLPnKWQpwdnquvwyThQuT2cv7UFG+VTxNE5X6XRqwdHg8yxTPak5nlEu+vVhtfdED6Lj/nDy7Kn+
	m2SFBqW7/NdagjgU6tvB3trg8lw3kHop7iAgiD+kfqcP3d7OBhwf/WFG9U/v4dA2byPtCm/KgWFMc
	w6sk/1ikBwwMR0LaKVSxkX0PLBVMw9nnLcHpP3VUb59zW1oJoIM3SczJTSE4DigbMSiY0Acov0uGV
	55/7qYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRD0-00000005Ufd-2AvM;
	Tue, 02 Dec 2025 14:18:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRCx-00000005UfA-0n6p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 14:18:25 +0000
Date: Tue, 2 Dec 2025 15:18:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764685097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqWhd7pgLu3TuaNPiJjtSv9NJ0oz7uW4FlhXV6xN5Rs=;
	b=Ej1/maXk1+OVOKSqGfGnIKB2lCd51saxgMtGGH4yetKbvQGaRAyAQ7AONQqd7Abqt5gT0p
	nplBYemfht2enMcDbHaiz73l3hQRxlkZxfwgC+OO6V/UpG2pIDr4yaPnikGFtPQsvRYb39
	aniWaTXZAPynxtvIinWsZ4zjfxidYB0ZdkEV7Y3X6XQlCOlPq/0dHfAAauktKXcNzP0JA0
	3VT6zipY1gW4qO6L4D37px3jNHVSIWpR/hAGsuFgGjVsk87nb9vKN2YS5rdTXO0oHcV895
	dXfMZgCwpsOIjJajhhJBC79hGxdJD25mrYnFuJuNPKC+MdEACJ+s+47tH3Tz5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764685097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqWhd7pgLu3TuaNPiJjtSv9NJ0oz7uW4FlhXV6xN5Rs=;
	b=itBlWujI2YRSHbmdJFL3jsgZvkv/LDqYUy63ulGGFJJBuQjBgtB9XxEBLrFSYMdlAoC8N4
	yY9mL6J2Nkv+mmDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Xie Yuanbin <xieyuanbin1@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>
Subject: Re: [PATCH v3 2/5] ARM: mm: fault: Enable interrupts before invoking
 __do_user_fault()
Message-ID: <20251202141816.wfHNUMFK@linutronix.de>
References: <20251110145555.2555055-1-bigeasy@linutronix.de>
 <20251110145555.2555055-3-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251110145555.2555055-3-bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_061823_369309_58BBF292 
X-CRM114-Status: GOOD (  12.33  )
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

On 2025-11-10 15:55:52 [+0100], To linux-arm-kernel@lists.infradead.org wrote:
|
|   https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9460/1
|
| Moved to Discarded.
|
| This makes the issues with the branch predictor hardening worse if this
| patch is merged on its own - since this adds another path where
| interrupts are enabled before calling harden_branch_predictor() in
| __do_user_fault(). It would be sensible to move the interrupt enable
| into __do_user_fault().
|
|    *** PLEASE DO NOT REPLY TO THIS MESSAGE ***

I thought that we apply both.
In 9462/1 I am moving harden_branch_predictor() out of __do_user_fault()
because do_page_fault() needs the hardening before the interrupts are
enabled. Do mean something like

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 2bc828a1940c0..f70b98fb562b3 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -186,6 +186,7 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 	if (addr > TASK_SIZE)
 		harden_branch_predictor();
 
+	local_irq_enable();
 #ifdef CONFIG_DEBUG_USER
 	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
 	    ((user_debug & UDBG_BUS)  && (sig == SIGBUS))) {
@@ -274,8 +275,13 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 
 
 	/* Enable interrupts if they were enabled in the parent context. */
-	if (interrupts_enabled(regs))
+	if (interrupts_enabled(regs)) {
+		if (addr >= TASK_SIZE && user_mode(regs)) {
+			__do_user_fault(addr, fsr, SIGSEGV, SEGV_MAPERR, regs);
+			return 0;
+		}
 		local_irq_enable();
+	}
 
 	/*
 	 * If we're in an interrupt or have no user

instead both patches? So now we end up in __do_user_fault() via
do_page_fault() with enabled interrupts but only for addr < TASK_SIZE
which does not involve harden_branch_predictor().

Sebastian

