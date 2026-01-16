Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DA9C982D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qeDaJWkLpO3qxUyIpo4/TvFhIlWEjGwXwi9nucOmHE=; b=XLuBKczf59F7ZwqGQc3B9zFNij
	ntEB2YXCv4XvhyH1CwWiOzeyrBhWgeRAqsXqc+b5cKVcWmU4h2liaIIEfMcTM0F4kPdOOExZsgDL2
	SzOjrw0veGoH4iRixbaoGAVsUZeSWFGFJbJ/5qxieiyDn0o1WEsyGQJyTWabMXb+DOvNRJVRuYzQF
	HA2kYNoUBU7ZC+3VyvWjNfXqLrUxebzLWXLN8OPT/M72vqRdxqxRTxWqWwkuRYzooHNQBtDpHdRrV
	JWbTIx9hQSXxdlq5h70d4rjA/jARBzWjMPy0Me0dzDadHMJtdcQumvRhX9L2taX32m8oEU1zsGgV7
	AG9e3Hdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnC2-0000000EVTx-46RC;
	Fri, 16 Jan 2026 17:01:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnBu-0000000EVQL-2s6h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:00:56 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768582850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2qeDaJWkLpO3qxUyIpo4/TvFhIlWEjGwXwi9nucOmHE=;
	b=oWAoIzLiZo+HJLUBQ016q/kj04m9mFa3MDfAdyfTHmouC8+xvZkaS3cStpxyxjRQ89nIx0
	fC9cP5Cjnyn0VO39duLOcPvEvsLICjEti1k9XFplXxs8/CRf6DByVQtexQJecO54S8L7sv
	2NH0fS9Cur2xP2eRPtDRrstAR119Yv3mxIWjmwlOuvzaCLSaKUaXHANeFdm/5fM/zjwSVL
	JdliFT91X/YXw1GBPFl5VNYmVO1GKTn09g98kanV9l3RrZZHE4dm3srvjITrId++A1n2mH
	W7BKdkj86OJcOcLp4Rb0v2WuhvZTeP8/QwgAEb4KxcORl9mMaRm824GaSb/Rhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768582850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2qeDaJWkLpO3qxUyIpo4/TvFhIlWEjGwXwi9nucOmHE=;
	b=zaK9Yr/cS0PgEIdnPWdrsyb/hlLZUFei+vojpVVvndgS42BnNNNJrWvD/8D1fuz/0D94bJ
	4lrPHsFv8uKD0OBA==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>,
	Bryan Brattlof <bb@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v4 1/2] ARM: mm: fault: Enable interrupts before invoking __do_user_fault()
Date: Fri, 16 Jan 2026 18:00:40 +0100
Message-ID: <20260116170041.1059997-2-bigeasy@linutronix.de>
In-Reply-To: <20260116170041.1059997-1-bigeasy@linutronix.de>
References: <20260116170041.1059997-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_090054_863353_A2827CAF 
X-CRM114-Status: GOOD (  12.40  )
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
Acked-by: Bryan Brattlof <bb@ti.com>
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


