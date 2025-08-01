Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFD3C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuEGnSUm+D/1PDldIzj0UErlIzJLq1qCTltkfaJSlQE=; b=Nbfz5fSLRjEcwdjgf+KDw7lIbP
	hq6zCJ9XLw33hdVYfSFIZw2tqLD86aPONchVVqZ/Q+5w7v2dpNZ8B0ZZgTv8CpbkQ83aPvHG9VE2f
	y7M9UT3fc1LD9QxFL/kDCbtJuv1W2L1uvl5vYPGi8H5G0xXH30xNwHgt8CRaDVPFTdIcaHSKoNGkJ
	KRJ+ddzxhTRbGXmeKYZkmEmmcqXEGu+HbjopsmcBGuNnV5oFBdZMq8H5FHsv9F0PP6HSnuC64Gn5M
	Et2gnP3TQe28r4NaCYQ1/rm8ViW4uzveBZdHA48wDqKpz1KH1XERq8ldPfwns1j6sIepl0MiGuHDL
	mlw/A2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkpK-00000005DN6-08xS;
	Fri, 01 Aug 2025 08:09:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkfA-00000005BsV-4BkE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 07:58:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F79161142;
	Fri,  1 Aug 2025 07:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B706C4CEF8;
	Fri,  1 Aug 2025 07:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754035127;
	bh=hTPka0+81M201oPI7GZI6XuIue8ZoP/MzhVc+eZGACg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gVNXkKfPSVCJTbgWig5KIlQBcYWtKG/dz0HXi8RJz3eZKzie1Cstp/+pt/XVoLtws
	 vpecW5OF2dlDv5JxPC1DwggmQBLQXdD5OY5QsFVSdhdWk+G/nMPkA/6/51Whg4NviA
	 zQPNAAuePCRlplcnTiSMVqaqBL8xnEaUDU/rEp9Vg4lbKoFvlg28ma3n5p7FKBWmKg
	 UlLh5YR0SBz+1rClqyKaA3tLQ33h5EngqH72ZQ1d+Ek/b40pHG6cxPMGp4VnL5udIY
	 PHOz+akB45uPdJXNm4bGUO8V/2C+LJeV1oe4ZYpGlXmZUahumR0BlB5ZQgC8ch2lGM
	 JekxPyAUVloPA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 01 Aug 2025 09:58:20 +0200
Subject: [PATCH 3/3] irqchip/gic-v5: Remove IRQD_RESEND_WHEN_IN_PROGRESS
 for ITS IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-gic-v5-fixes-6-17-v1-3-4fcedaccf9e6@kernel.org>
References: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
In-Reply-To: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
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

GICv5 LPI interrupts have an active state hence they cannot retrigger
while the IRQ is being handled.

Therefore setting IRQD_RESEND_WHEN_IN_PROGRESS for GICv5 ITS
interrupts provides no benefit and it is useless (and confusing),
it solves an issue that cannot happen.

Remove it.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-its.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 340640fdbdf6..9290ac741949 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -973,7 +973,6 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
 		irqd = irq_get_irq_data(virq + i);
 		irqd_set_single_target(irqd);
 		irqd_set_affinity_on_activate(irqd);
-		irqd_set_resend_when_in_progress(irqd);
 	}
 
 	return 0;

-- 
2.48.0


