Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E835FC5931
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbh1MpTYM6hT6+hxx5B3RT1R6a3HmEw4rZDwEZ7mk8M=; b=mve4qGV+fyMrgYY9VMOiKSxc0a
	2bwLkm57BYXZJ6xjqEKX2QXhM7vsp+WslT/z1gMnT+vANTFK9PPwkXmmFq1QC2Scg2ksN+Mjgp/IH
	IOZ7lIc+yt2b84dxwpNSY0mCMV/HIj5B+HQqwEuf8h3ASud+8953lbMb4hwRKfUN5jBG01fq1F78y
	a6qfJPgpNMhZ5kG9g3LmdHr0GF8V+jbhUmX8mWTXjSJbwKEshaI/yk6ZshktmTfqSlthTlmmhm1Ch
	lG7tyro6zJoFBnAA5BTeLC8I+UEM0WiagkrU+n/EbwTZL4Bj7NUehW5XLiVNuEkJCeKqbQHr4x4cU
	OKf+dfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZNY-000000061N3-18Tf;
	Thu, 26 Feb 2026 11:18:00 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZNU-000000061K9-2YQZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 11:17:58 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772104672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbh1MpTYM6hT6+hxx5B3RT1R6a3HmEw4rZDwEZ7mk8M=;
	b=bCjSuYcn/+ZM1ceCTKV3Ga+muYNyIOwmEu9ixE9zpPGMUEP/WdYs84JikiNZYLiUV2xAeq
	2j+4RE1ANruUZdmFlWtuwmcfiM34D3iDZkYMYTWSuqDA6bUJ8wM4HIi6YzZWH+kOouvziL
	l0EOavi/LX+Q3peEu9++CpZxarC2PiNhy1Z/D8eWsLHslkxUYFivmz2np9EMMNRFxJU+n7
	19I29qKlEmXzEyNX/sg09nYWEpAQfyuYaxTfBcOVyqmbXuKipCzRSvIVRwrFZiqZ83XIq6
	AB4H1hoYPMDIdpaxbJpBPHN4ZVbUYAba132vqKWS+vUBdqIEsjpqQO9XXCz41g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772104672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbh1MpTYM6hT6+hxx5B3RT1R6a3HmEw4rZDwEZ7mk8M=;
	b=IaaLHdq8eaNC3lOvcLRaB9n0FA9t7MTAJqHT24znFXGfuhuv/vJsfIYoVqjET/stusudro
	LGInj8gai3OUITBw==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v5 1/2] ARM: mm: fault: Enable interrupts before invoking __do_user_fault()
Date: Thu, 26 Feb 2026 12:17:41 +0100
Message-ID: <20260226111742.3598421-2-bigeasy@linutronix.de>
In-Reply-To: <20260226111742.3598421-1-bigeasy@linutronix.de>
References: <20260226111742.3598421-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_031756_851102_A42B6E2A 
X-CRM114-Status: GOOD (  12.19  )
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

From: "Yadi.hu" <yadi.hu@windriver.com>

A page fault from userland for a kernel address originates from from
do_sect_fault() (!LPAE) or do_page_fault() and ends in __do_user_fault()
by sending a signal.

Sending a signal requires to acquire sighand_struct::siglock which is a
spinlock_t. On PREEMPT_RT spinlock_t becomes a sleeping spin lock which
requires interrupts to be enabled. Since the calling context is user
land, interrupts must have been enabled so it is fine to enable them in
this case.

Enable interrupts in do_kernel_address_page_fault() unconditional in the
user_mode case().
Enable interrupts in do_sect_fault() if they were previously enabled.

[bigeasy: Initial patch/ report by Yadi. Maintained the patch and redid
          the patch description since]

Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/mm/fault.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ed4330cc3f4e6..3f1c73269c126 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -270,6 +270,7 @@ do_kernel_address_page_fault(struct mm_struct *mm, unsi=
gned long addr,
 		 * while interrupts are still disabled, then send a SIGSEGV.
 		 */
 		harden_branch_predictor();
+		local_irq_enable();
 		__do_user_fault(addr, fsr, SIGSEGV, SEGV_MAPERR, regs);
 	} else {
 		/*
@@ -592,6 +593,9 @@ do_sect_fault(unsigned long addr, unsigned int fsr, str=
uct pt_regs *regs)
 	if (addr >=3D TASK_SIZE && user_mode(regs))
 		harden_branch_predictor();
=20
+	if (interrupts_enabled(regs))
+		local_irq_enable();
+
 	do_bad_area(addr, fsr, regs);
=20
 	return 0;
--=20
2.51.0


