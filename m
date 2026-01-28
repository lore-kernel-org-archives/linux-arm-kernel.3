Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE46D3569B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aZDalOgS8NpQjE/IJRmLE79ou1FJAk2mHyWP980i80=; b=XzLcZf0sKw2t4OKzk14EekLDGd
	jVgYUzsF1B3e0ZdpXkh9WSEAHVOLS2/ZzpqFVG6bnVI8TUZ4aiudCLKo6bJkeIhXLVEM6g7IozWzH
	JPphWOGzSKKcipFDxZUK8vdJXpazBm1ISKDs9TFATB+ZFxW+Jg1FaG60oeFG4lBugsGMWBfRBPYPe
	f8F2W6CC3DH2xVLmLpECQ+P6f9pF8dFUPjJ2lmUp4LQ/trEk0Ft4XINYhzMZDoMjFOb+IC09dPeRO
	RtZSg1QLrjKb3cni+3I2MA2W90kZXmVkcXRETF6QYP7FLjA1WAfFHOo6I/bwSM5YmfpA8o67DdEeC
	u3crIl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2HR-0000000FnAz-0qLG;
	Wed, 28 Jan 2026 09:56:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2HN-0000000Fn7E-2Pxx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:56:07 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769594160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aZDalOgS8NpQjE/IJRmLE79ou1FJAk2mHyWP980i80=;
	b=LXHm6WBX3s9HSTJAXauINmjIAMguh9aTJb9iZRskoZhcOGrL6wOpymos0/qVMazJcpDzAT
	9FPOPWUONCUCPO1SUE5JujoH7FWpmSNreqrhPAYE/BbHBre5PQtWF4KtFaHzvzLjja7bA6
	Df086nyLjmd3WcmjEMYTd7CaDdA0SQ+bQH3PdiCoi7lKNAfN5nXdxIIrSA6v8Gfl9q71cz
	+Q6UlmHImxOfIzyl2CgEFXENrpT7vt7sKAFsJ0LsmvljrupsjjW7+cAsiCsDITsXFMCIDh
	LGPzOC0cnQfy31xqW7TbgEl9BtxfuvihzQoL1l/ftbVH8ERFAoGL2vA3ysVowA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769594160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aZDalOgS8NpQjE/IJRmLE79ou1FJAk2mHyWP980i80=;
	b=HnNCpmrf6IkhLERrTvKHehr2cK8ORyERltmrV/MUhWAhe2+q6hQJh2KgOIyqFDcC+wFUxA
	HqAwK0VSaP8JbCDg==
To: linux-kernel@vger.kernel.org
Cc: "Thomas Gleixner" <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/20] ARM: versatile: Remove IRQF_ONESHOT
Date: Wed, 28 Jan 2026 10:55:28 +0100
Message-ID: <20260128095540.863589-9-bigeasy@linutronix.de>
In-Reply-To: <20260128095540.863589-1-bigeasy@linutronix.de>
References: <20260128095540.863589-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015605_810992_9CA04D73 
X-CRM114-Status: GOOD (  10.01  )
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

Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Cc: Linus Walleij <linusw@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
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


