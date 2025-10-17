Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4222FCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GacHh49C1SbypRouyni2sl2AqD2qs2cO+npG5dtb4n4=; b=L3LW9IDG2S7IiuQNfGKTNU4m0g
	UD1orTRhXZ9GF33sxBM/5QGTw2dM5xONKPsi66YMtVoMCRbrC3dCo790k+FKtYqlAKuraKPZmxY28
	/jcsZu6/Ze3ZyoPphjnFhnXpJ9aFuQiAHpHYRgzJIlMujZvqbL39BU9Ex3ZfPLWz4akSKuiKZsg68
	mLMBHhnuRIgg876BM0T4LqdaSQ14Z0vmDujZfrtV8X+qivXkZlRQa0w6nTFAAThHByYyuMwXVP4R2
	vLqp9Vnjg3+Tz8Xwsvl8UXoBNvRKlXTvu6zxT359p6LeYiYzFduIoEh249Wmgrh7a9xn1rH60xtfi
	GlTY4HMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g8M-000000077un-4BgV;
	Fri, 17 Oct 2025 08:48:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g8L-000000077tF-20Lt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 08:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E076B604F5;
	Fri, 17 Oct 2025 08:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC231C4CEE7;
	Fri, 17 Oct 2025 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760690900;
	bh=RVkyfa65ji+iVeG5m+BwMXCO2f+xUvygzZyer4ipAO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iwe0TBnpFzClt9Y20jsB2ePw+lmYNVEtgobf2uCd312bcIBSiTLvmqB/vK58wjCg7
	 Br8cEfkG6bbncGNfesJ5W91OmPOwRWmFvs04zN7PSjoqrvJsqXTJukcFan1g4IwhEZ
	 jidHTOVTykUEe5TYltVzRTC07oxAsXm7vVk05eo84HxModSdqO8TrNr7gvz6P7u2aO
	 CWEWQcvakcB4jIyvWtlrvBPrlZoCU6xTminoCCqSqphTFH83rFesouhB9DODt1Hfim
	 MYc/Kiq60SPXBrXU49Wte2OqeH9t0bIvd2nCiOJbqo+q1QnpNuopvT2nlhWkgCE0BI
	 BYIJrfhLwtHvQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Marc Zyngier <maz@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ray Jui <rjui@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [PATCH v3 5/5] irqchip/gic-its: Rework platform MSI deviceID detection
Date: Fri, 17 Oct 2025 10:47:52 +0200
Message-ID: <20251017084752.1590264-6-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017084752.1590264-1-lpieralisi@kernel.org>
References: <20251017084752.1590264-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Current code retrieving platform devices MSI devID in the GIC ITS MSI
parent helpers suffers from some minor issues:

- It leaks a struct device_node reference
- It is duplicated between GICv3 and GICv5 for no good reason
- It does not use the OF phandle iterator code that simplifies
  the msi-parent property parsing

Consolidate GIC v3 and v5 deviceID retrieval in a function that addresses
the full set of issues in one go by merging GIC v3 and v5 code and
converting the msi-parent parsing loop to the more modern OF phandle
iterator API, fixing the struct device_node reference leak in the process.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-its-msi-parent.c | 91 ++++++------------------
 1 file changed, 23 insertions(+), 68 deletions(-)

diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index eb1473f1448a..12f45228c867 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -142,83 +142,38 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 #define its_v5_pci_msi_prepare	NULL
 #endif /* !CONFIG_PCI_MSI */
 
-static int of_pmsi_get_dev_id(struct irq_domain *domain, struct device *dev,
-				  u32 *dev_id)
+static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u32 *dev_id,
+				phys_addr_t *pa)
 {
-	int ret, index = 0;
+	struct of_phandle_iterator it;
+	int ret;
 
 	/* Suck the DeviceID out of the msi-parent property */
-	do {
-		struct of_phandle_args args;
+	of_for_each_phandle(&it, ret, dev->of_node, "msi-parent", "#msi-cells", -1) {
+		/* GICv5 ITS domain matches the MSI controller node parent */
+		struct device_node *np __free(device_node) = pa ? of_get_parent(it.node)
+								: of_node_get(it.node);
 
-		ret = of_parse_phandle_with_args(dev->of_node,
-						 "msi-parent", "#msi-cells",
-						 index, &args);
-		if (args.np == irq_domain_get_of_node(domain)) {
-			if (WARN_ON(args.args_count != 1))
-				return -EINVAL;
-			*dev_id = args.args[0];
-			break;
-		}
-		index++;
-	} while (!ret);
+		if (np == irq_domain_get_of_node(domain)) {
+			u32 args;
 
-	if (ret) {
-		struct device_node *np = NULL;
+			if (WARN_ON(of_phandle_iterator_args(&it, &args, 1) != 1))
+				ret = -EINVAL;
 
-		ret = of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &np, dev_id);
-		if (np)
-			of_node_put(np);
-	}
+			if (!ret && pa)
+				ret = its_translate_frame_address(it.node, pa);
 
-	return ret;
-}
+			if (!ret)
+				*dev_id = args;
 
-static int of_v5_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev,
-				   u32 *dev_id, phys_addr_t *pa)
-{
-	int ret, index = 0;
-	/*
-	 * Retrieve the DeviceID and the ITS translate frame node pointer
-	 * out of the msi-parent property.
-	 */
-	do {
-		struct of_phandle_args args;
-
-		ret = of_parse_phandle_with_args(dev->of_node,
-						 "msi-parent", "#msi-cells",
-						 index, &args);
-		if (ret)
-			break;
-		/*
-		 * The IRQ domain fwnode is the msi controller parent
-		 * in GICv5 (where the msi controller nodes are the
-		 * ITS translate frames).
-		 */
-		if (args.np->parent == irq_domain_get_of_node(domain)) {
-			if (WARN_ON(args.args_count != 1))
-				return -EINVAL;
-			*dev_id = args.args[0];
-
-			ret = its_translate_frame_address(args.np, pa);
-			if (ret)
-				return -ENODEV;
-			break;
-		}
-		index++;
-	} while (!ret);
-
-	if (ret) {
-		struct device_node *np = NULL;
-
-		ret = of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &np, dev_id);
-		if (np) {
-			ret = its_translate_frame_address(np, pa);
-			of_node_put(np);
+			of_node_put(it.node);
+			return ret;
 		}
 	}
 
-	return ret;
+	struct device_node *msi_ctrl __free(device_node) = NULL;
+
+	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
 }
 
 int __weak iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id)
@@ -234,7 +189,7 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
 	int ret;
 
 	if (dev->of_node)
-		ret = of_pmsi_get_dev_id(domain->parent, dev, &dev_id);
+		ret = of_pmsi_get_msi_info(domain->parent, dev, &dev_id, NULL);
 	else
 		ret = iort_pmsi_get_dev_id(dev, &dev_id);
 	if (ret)
@@ -262,7 +217,7 @@ static int its_v5_pmsi_prepare(struct irq_domain *domain, struct device *dev,
 	if (!dev->of_node)
 		return -ENODEV;
 
-	ret = of_v5_pmsi_get_msi_info(domain->parent, dev, &dev_id, &pa);
+	ret = of_pmsi_get_msi_info(domain->parent, dev, &dev_id, &pa);
 	if (ret)
 		return ret;
 
-- 
2.50.1


