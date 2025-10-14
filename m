Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5610DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHbOxRU2BJi930H5SNvBDj61NPlCXWvifwPorlZ5OgU=; b=xT9XuoNVHMykzgEI5mdVtQuJdq
	hE84I/4yetX7zFgqhU0Ssst3PGNtUeAfe1ohEph6mW9uQkiSzoNhuHw8fxjGBe0v031FHvZpTUwVD
	xKENdMwWojrn8eRqjCeoTVsCkUyI+zRUd0M/TAkVefG1f53YnuRq28OolmxlpkcqTMNf74H7UjcJY
	6Gnh3lQMIpghl0GBylV+UuP2Uv3ekdffFljwVsv+J1X2VoLa7hs5De3T1fCcVsjm0nTr6Rd0GOSBz
	5BNgPaQ7n0RqkHGrrw05o080cJUYNH4oa3XPdcxVGll+eUxoHGpG6apQvX0sPXnI43sEiPgxYeOV4
	f29om9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8boE-0000000FqUv-1TsL;
	Tue, 14 Oct 2025 09:59:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8boD-0000000FqUB-3l8m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DF3661415;
	Tue, 14 Oct 2025 09:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075D9C4CEE7;
	Tue, 14 Oct 2025 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435948;
	bh=Y0bEX5hkAWRJGif5UBaJSI/DJMYF6LpNlNLgCxXcdQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OgAAaxiVcgTmp+m3JLTe9FVIKnHuVzIyx7Zd6lxzOOsRxgW/1jR+2UWkpI+lcgQ6V
	 JlSRhEOKj6zTUaNJ5Kmqh6lGuXNMdrvEhycEn4LVjlCWPg6db+whgEjKao8qeDGPYE
	 7iETeBDpoqKAYQPqksB+k5aNRuOcrO08Uoz8inrI6l1rhq90hn0XotgXYPhRNpz7Ne
	 KqFbmn/fOWSGwzhT1ymEnGGg4+E5J2gnelPEofdRnhqOu+GD9J4GRyn07uHAJx+WIT
	 zBxnNaP2PB4gCZOJ0+vDCnv81jPJ2BanIy+TF93TE1s5Qps/gH+rbjufpGJT4GX6zy
	 H8EZYZg9jknmA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: [PATCH v2 4/4] irqchip/gic-its: Rework platform MSI deviceID detection
Date: Tue, 14 Oct 2025 11:58:45 +0200
Message-ID: <20251014095845.1310624-5-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014095845.1310624-1-lpieralisi@kernel.org>
References: <20251014095845.1310624-1-lpieralisi@kernel.org>
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
- It triggers an excessive WARN_ON on wrong of_phandle_args count detection
- It is duplicated between GICv3 and GICv5 for no good reason
- It does not use the OF phandle iterator code that simplifies
  the msi-parent property parsing

Implement a helper function that addresses the full set of issues in one go
by consolidating GIC v3 and v5 code and converting the msi-parent parsing
loop to the more modern OF phandle iterator API, fixing the
struct device_node reference leak in the process.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-its-msi-parent.c | 98 ++++++++----------------
 1 file changed, 33 insertions(+), 65 deletions(-)

diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index eb1473f1448a..a65f762b7dd4 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -142,83 +142,51 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 #define its_v5_pci_msi_prepare	NULL
 #endif /* !CONFIG_PCI_MSI */
 
-static int of_pmsi_get_dev_id(struct irq_domain *domain, struct device *dev,
-				  u32 *dev_id)
+static int __of_pmsi_get_dev_id(struct irq_domain *domain, struct device *dev, u32 *dev_id,
+				phys_addr_t *pa, bool is_v5)
 {
-	int ret, index = 0;
+	struct of_phandle_iterator it;
+	uint32_t args;
+	int ret;
 
 	/* Suck the DeviceID out of the msi-parent property */
-	do {
-		struct of_phandle_args args;
+	of_for_each_phandle(&it, ret, dev->of_node, "msi-parent", "#msi-cells", -1) {
+		/* GICv5 ITS domain matches the MSI controller node parent */
+		struct device_node *np __free(device_node) = is_v5 ? of_get_parent(it.node)
+							     : of_node_get(it.node);
 
-		ret = of_parse_phandle_with_args(dev->of_node,
-						 "msi-parent", "#msi-cells",
-						 index, &args);
-		if (args.np == irq_domain_get_of_node(domain)) {
-			if (WARN_ON(args.args_count != 1))
-				return -EINVAL;
-			*dev_id = args.args[0];
-			break;
+		if (np == irq_domain_get_of_node(domain)) {
+			if (of_phandle_iterator_args(&it, &args, 1) != 1) {
+				dev_warn(dev, "Bogus msi-parent property\n");
+				ret = -EINVAL;
+			}
+
+			if (!ret && is_v5)
+				ret = its_translate_frame_address(it.node, pa);
+
+			if (!ret)
+				*dev_id = args;
+
+			of_node_put(it.node);
+			return ret;
 		}
-		index++;
-	} while (!ret);
-
-	if (ret) {
-		struct device_node *np = NULL;
-
-		ret = of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &np, dev_id);
-		if (np)
-			of_node_put(np);
 	}
 
-	return ret;
+	struct device_node *msi_ctrl __free(device_node) = NULL;
+
+	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
+}
+
+static int of_pmsi_get_dev_id(struct irq_domain *domain, struct device *dev,
+			      u32 *dev_id)
+{
+	return __of_pmsi_get_dev_id(domain, dev, dev_id, NULL, false);
 }
 
 static int of_v5_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev,
 				   u32 *dev_id, phys_addr_t *pa)
 {
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
-		}
-	}
-
-	return ret;
+	return __of_pmsi_get_dev_id(domain, dev, dev_id, pa, true);
 }
 
 int __weak iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id)
-- 
2.50.1


