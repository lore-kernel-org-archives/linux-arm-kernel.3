Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6DFE9A050
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwHvV3fUxmyryw/PpEJ1NHzmL5L4khyPBe01k0wMyW0=; b=t9rDjxo/t0nM9qJO81YNFch0qq
	YaWJN684inUdb0OTz3zNi4mRaXZuj/nbPtz3bNsPq4c/K3deneQQNuCLO+3LCfRRR3JnDysq/Ee2m
	oLt1cV0sdNPmXD0BEb6QeTNChIJxBqEupPy6SJ6ivEX5zx3VGEKE+EAWb5CJPdaTGFhMscZRlIo08
	2xMs4BcDCo+p+xQDQjQAr7HeaUKsB02y/fV38uopmBUIvR7Id9sHcTw+PDD44wL1vRr2cb+RCoBZe
	CyBwSHvuzt8pUYxBZ3LizssZwXMh6SQEmawjgdO8gLN35+1sUbuciGrMyl1gL8ccaOZfGnxUOoQo0
	XyKILkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyO-00000009u9n-0rYP;
	Wed, 18 Feb 2026 13:52:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyM-00000009u9G-0kO7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E75F6185D;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D15CC19425;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771422729;
	bh=jNsv6Mzm6JnU1v2Z2XpH/L+IpXDhwResrBm3y8osrzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sVJIlpnICiU7Ad7qofR6f5XPQE+PpaTiEs0XIw8Jn2T9r2arLJ2J/UeN5PyTiouJj
	 AQbpDgzS9YxXUP8zK8r7Yb/YXy6Ee2BeXiSReNWfI9NJgpkjzBXKxCBLAnI66Jby+W
	 6ehM8P7L2Q0tav/l0x4XZ4wIfdLswIiMgLKKZK0ti0BAdEESxl2CHzXm0ZAYb7VI15
	 J4xbIgxyGwEGbiFurdq+eOgRK8p/xOJmz7V5r3+uBVqL6a1lXN06eWB6zTAVO5/CWM
	 UmbCXRsD1o3lNdXfip80bs086uNcdUe+FWjxpIlmpnm78xOT6NPeuC273RK76w0875
	 g0LvWTvuRQQXw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vshyJ-0000000Bu02-189b;
	Wed, 18 Feb 2026 13:52:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent handling
Date: Wed, 18 Feb 2026 13:52:00 +0000
Message-ID: <20260218135203.2267907-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218135203.2267907-1-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Make the ITS code aware of fsl_mc devices by plumbing the devid
retrieval primitive.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-its-msi-parent.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index 12f45228c8674..532c0d626ca04 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -7,6 +7,7 @@
 #include <linux/acpi_iort.h>
 #include <linux/of_address.h>
 #include <linux/pci.h>
+#include <linux/fsl/mc.h>
 
 #include "irq-gic-its-msi-parent.h"
 #include <linux/irqchip/irq-msi-lib.h>
@@ -186,9 +187,11 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
 {
 	struct msi_domain_info *msi_info;
 	u32 dev_id;
-	int ret;
+	int ret = 0;
 
-	if (dev->of_node)
+	if (dev_is_fsl_mc(dev))
+		dev_id = fsl_mc_get_msi_id(dev);
+	else if (dev->of_node)
 		ret = of_pmsi_get_msi_info(domain->parent, dev, &dev_id, NULL);
 	else
 		ret = iort_pmsi_get_dev_id(dev, &dev_id);
-- 
2.47.3


