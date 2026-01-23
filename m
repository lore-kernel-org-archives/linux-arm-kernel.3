Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C7DD72379
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rW+PAWZxGnF9Ct2ExEsv2LYHIZ9WUP+SeTviE1CEkbQ=; b=fuH8XqgmoEFV9T4sCiTpkjj3dL
	LLRv0j3K8Yi8VoTm7LC2E4J8qdNOOi6/iEzrirIoIHt0/h39IJWH2vhR/gU/xZVZWCVdCP36h6PqA
	Yv6bjApRf6RvQKV9VMfUwOqcYf3j3b/ehjPsUdEUqHOlWvJ+HVEK1HKd6aA6nmaJVUKukU5g+SCyB
	KGtQYPHRYczpukFyqkK7MsG76RF9d+ilI9jB+nNpT07Cc0QgFkpoXnQCy6/xJlgcXukFOYLNU4vwp
	06h+oz+P9bF7KfaRf0iwZ4wltVe+3CkFxx331WBnEG9E7va6uZjidxGHYoxTld7bzaCpxOB9l3/d0
	0xjzzKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFTd-00000008r9K-2hnE;
	Fri, 23 Jan 2026 11:37:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFTb-00000008r7i-45Xz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 11:37:21 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769168235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rW+PAWZxGnF9Ct2ExEsv2LYHIZ9WUP+SeTviE1CEkbQ=;
	b=zffOZK+MJrBMe4/16DzgMn02IFh1NGTwWSuZc3A6y3frjvDTWjkLG7VWunfUWnsDzia7as
	quCXNFgX3r3ZCD56XLbAgt0+UlDrojzHcbDdtg07HxtmeaKW+W/7sQnkbxdZoJPMSOkG4w
	Ap/boKIuWmq8x6qgjC13NgUIzCMx4FUroW4L7EVCoA8DmwDqehU+XNh9jUg5W3ioYKR+dl
	4rCtOnMEYh6SX8jk9Qhk3CaQWplcYCLzQWRAOdvuj0IBSXuU8iv7TI0REYHctVrHkFXQOb
	5fOhkjdvbLtkekvluCfiXgRogSQxnxOscQEf2ZXmZBYKge+TpZOsNGbRbCoCKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769168235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rW+PAWZxGnF9Ct2ExEsv2LYHIZ9WUP+SeTviE1CEkbQ=;
	b=KOYwv177IAVesLbfPWb2vMFuU+K1PnUs5QaCQ2xKmM+aoDfRPHS/+8jtMQwteTN2CPJiT0
	cM5NBEY7NonIRYAg==
To: linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/21] ARM: versatile: Remove IRQF_ONESHOT
Date: Fri, 23 Jan 2026 12:36:54 +0100
Message-ID: <20260123113708.416727-9-bigeasy@linutronix.de>
In-Reply-To: <20260123113708.416727-1-bigeasy@linutronix.de>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_033720_153629_2392318A 
X-CRM114-Status: GOOD (  10.05  )
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

Passing IRQF_ONESHOT ensures that the interrupt source is masked until
the secondary (threaded) handler is done. If only a primary handler is
used then the flag makes no sense because the interrupt can not fire
(again) while its handler is running.

Revert adding IRQF_ONESHOT to irqflags.

Cc: Linus Walleij <linusw@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/mach-versatile/spc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
index 812db32448fcd..2d27777a00d33 100644
--- a/arch/arm/mach-versatile/spc.c
+++ b/arch/arm/mach-versatile/spc.c
@@ -459,8 +459,8 @@ int __init ve_spc_init(void __iomem *baseaddr, u32 a15_=
clusid, int irq)
=20
 	readl_relaxed(info->baseaddr + PWC_STATUS);
=20
-	ret =3D request_irq(irq, ve_spc_irq_handler, IRQF_TRIGGER_HIGH
-				| IRQF_ONESHOT, "vexpress-spc", info);
+	ret =3D request_irq(irq, ve_spc_irq_handler, IRQF_TRIGGER_HIGH,
+			  "vexpress-spc", info);
 	if (ret) {
 		pr_err(SPCLOG "IRQ %d request failed\n", irq);
 		kfree(info);
--=20
2.51.0


