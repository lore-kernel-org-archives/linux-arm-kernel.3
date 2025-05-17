Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BB6C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 10:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mQdwWi65d9aKkwsUGkrgiBkbc1TnM4y7Oi68u+FsO4Y=; b=LBEgHymmUlx/0M72bfKzINzJ9C
	lT9ZTrriu63Mbn6pusumX7ahYaLs8a39sd/QzRdjZnoN3YWAuan0bY4qzU5hNFg9jiTblqwgBZCMu
	OBamRzvheh9uKHrtylJr1jXQIuwpa03S/UoAExF4Ml2x1B92SHolKvGEBmimMdEtfo3uzNwTd3Bjy
	cx0pMXcBZzOVHzOThhnYr1qD/RXUIWNfjRzcQaqR0GmOYfB0GM6JuX2iUjD4ksDTKkwgXZRn8QzM9
	sYOcFOPCI5/Up64RMEx30c5ZmYApkG6NmylyvBLbxJz0lnL6r4fbtUTx3t0hKiTNnqk7gexjus+MW
	S9dRNvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGEqH-00000005YMD-41tM;
	Sat, 17 May 2025 10:32:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGEoA-00000005YE6-2nYV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 May 2025 10:30:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64BC2437BF;
	Sat, 17 May 2025 10:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E04C4CEE3;
	Sat, 17 May 2025 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747477821;
	bh=NBLuObZypd7FUQ4RdXCGShJPwkbjl+7jqVZyIFp1z0E=;
	h=From:To:Cc:Subject:Date:From;
	b=DkRCu/h7I2WHU4dS2WlSghrYRvnB8JHkuQX9J8+7/4WFH/BhP3xPEBUAgGWe6Uj/5
	 rvnmEBORJY/Uriw0QRh3c9YErEer/VlibqrQoBQHMzyvNGXYbcJe1MfuFMcXmxDtWh
	 ecqi48zUxZXkDm/ROMIvoKbGhU4mEjE4TqlpqYo1eDwx0Gw7kVfPAHdc4CVu72gNEb
	 YuQhM6E+2yBuFpPhvybz3fOrlGY3psq3MIhTO/yyyHMHvkC+JaFKQTRzvsTkt5zgUb
	 pl0eCI64BsBYAmXhU6mSvzZvv/Uczwlxdgri/FWfSEsdZzEym+BPjobnKw7iH+VV3x
	 QnfQJHyYYwZkg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uGEo6-00Fmrq-MV;
	Sat, 17 May 2025 11:30:19 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] irqchip/msi-lib: Honor the MSI_FLAG_PCI_MSI_MASK_PARENT flag
Date: Sat, 17 May 2025 11:30:11 +0100
Message-Id: <20250517103011.2573288-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_033022_730520_E9731A02 
X-CRM114-Status: GOOD (  16.24  )
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

For systems that implement interrupt masking at the interrupt
controller level, the MSI library offers MSI_FLAG_PCI_MSI_MASK_PARENT.
It indicates that it isn't enough to only unmask the interrupt at the PCI
device level, but that the interrupt controller must also be involved.

However, the way this is currently done is less than optimal, as the
masking/unmasking is done on both side, always. It would be far cheaper
to unmask both at the start of times, and then only deal with the
interrupt controller mask, which is likely to be cheaper than a round-trip
to the endpoint.

Implement this by patching up the irq_chip structure associated with
the MSIs to perform the full unmask on .irq_enable(), and the full mask
on .irq_shutdown(). This asymmetry allows the preservation of the
"lazy disable" feature, which relies on the top-level irq_chip not
implementing the .irq_disable() callback. Yes, this is a terrible hack.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-msi-lib.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 246c30205af40..8c62034ab8d92 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -112,6 +112,21 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	 */
 	if (!chip->irq_set_affinity && !(info->flags & MSI_FLAG_NO_AFFINITY))
 		chip->irq_set_affinity = msi_domain_set_affinity;
+
+	/*
+	 * If the parent domain insists on being in charge of masking, obey
+	 * blindly. The default mask/unmask become the shutdown/enable
+	 * callbacks, ensuring that we correctly start/stop the interrupt.
+ 	 * We make a point in not using the irq_disable() in order to
+	 * preserve the "lazy disable" behaviour.
+	 */
+	if (info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT) {
+		chip->irq_shutdown	= chip->irq_mask;
+		chip->irq_enable	= chip->irq_unmask;
+		chip->irq_mask		= irq_chip_mask_parent;
+		chip->irq_unmask	= irq_chip_unmask_parent;
+	}
+
 	return true;
 }
 EXPORT_SYMBOL_GPL(msi_lib_init_dev_msi_info);
-- 
2.39.2


