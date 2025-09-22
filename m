Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5876CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DVixwa8StKEloXMjU0KxbhQhClJAOsdGBORDJu9TiAo=; b=S8DW6T1T2+IX0k/zBjr4ziRAfH
	h5J9FBOxYMntftDmlIw25yFXukTCEN83pPFClQHLcFI/aQZfvyDOnoer4Pf4RmQa82So3lC5zNjQ5
	A6GtkWqpQAYXItSNu4fgWDMU+cd9rPRAvTPsyc4m8Tb2OIc+E24lSQ5JH+0Ua4tCFjeLcjumjxzhC
	AX9S1mhXXIszIYEALJRrz8Uccv3v8XpH9UKcpOy4NaTF008J8kG33vXLdkmdY+aiDMa8yhNYvZJl5
	saCDnJLJWvqbhvO5meWYTYfbGWy7CFwAH+vBoVnAvAS78O7ut/IhXG6Irjyc0gawDOU+LsKgv4JiI
	VV/bKQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hUg-0000000Af0N-13PE;
	Mon, 22 Sep 2025 14:26:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hUe-0000000Af0B-43oi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 14:26:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CCDC601B5;
	Mon, 22 Sep 2025 14:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFC1C4CEF0;
	Mon, 22 Sep 2025 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758551176;
	bh=CEK8yHPxJKhWjl3RH+TVpm29Wny+6IBKlzfazln71jo=;
	h=From:To:Cc:Subject:Date:From;
	b=n+6J3YlkzS+dsKSUT5df0ZjUzucjalYcUGdQcyRUwxogpDUpe+d7y7RjK6MQCMNNB
	 nwUgfy4ceEHu/0znn+stF8hwdhzHL3e3MXSUnHwq4Dv1h9jz0+Dq8G2R+5Z5+ZO1CN
	 0P4cpIqGlRbttm/xNQK0AIUT89fC7Qo6q06CfBTQk7enmhONfPKq14A1WmPgKXYNC5
	 p7HTBnd4+KMvUdPG4WN78zOXUzrzeNeLasVDPAqLfuFUdR5LQd6cITHaeILLsIYUEn
	 lO+RjtVNYV6MJZWh87KxH5Uxk/E4vKe87ohb5Im1wW+Ot1TSvRD14PbxUms4bge3y0
	 LWoXby9vxGUkg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] irqchip/gic-v5: Add PCI bus msi-parent property handling
Date: Mon, 22 Sep 2025 16:26:10 +0200
Message-ID: <20250922142610.80200-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
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

In some legacy platforms the MSI controller for a PCI host bridge is
identified by an msi-parent property whose phandle points at an MSI
controller node with no #msi-cells property, that implicitly
means #msi-cells == 0.

For such platforms, mapping a device ID and retrieving the MSI controller
node becomes simply a matter of checking whether in the device hierarchy
there is an msi-parent property pointing at an MSI controller node with
such characteristics.

Add a helper function to its_v5_pci_msi_prepare() to check the msi-parent
property in addition to msi-map and retrieve the MSI controller node (with
a 1:1 ID deviceID-IN<->deviceID-OUT mapping) to provide support for
deviceID mapping and MSI controller node retrieval for such platforms.

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
Follow-up to [1] in that it is a fix and too risky to fix generic OF code at
this stage of development since it might affect other platforms.

Apply a fix to GIC ITS v5 MSI parent code - follow-up will clean up
the msi-parent parsing in the kernel tree.

[1] https://lore.kernel.org/lkml/20250916091858.257868-1-lpieralisi@kernel.org/

 drivers/irqchip/irq-gic-its-msi-parent.c | 34 ++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index eb1473f1448a..198fb4e9a22d 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -101,6 +101,33 @@ static int its_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 	return msi_info->ops->msi_prepare(domain->parent, dev, nvec, info);
 }
 
+static int its_v5_get_msi_parent(struct device *dev, struct device_node **msi_np)
+{
+	struct of_phandle_args out_msi;
+	struct device *parent_dev;
+	int ret;
+
+	/*
+	 * Walk up the device parent links looking for one with a
+	 *  "msi-parent" property.
+	 */
+	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
+		ret = of_parse_phandle_with_optional_args(parent_dev->of_node, "msi-parent",
+							  "#msi-cells",
+							  0, &out_msi);
+		if (!ret) {
+			if (!out_msi.args_count) {
+				/* Return with a node reference held */
+				*msi_np = out_msi.np;
+				return 0;
+			}
+			of_node_put(out_msi.np);
+		}
+	}
+
+	return -ENODEV;
+}
+
 static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 				  int nvec, msi_alloc_info_t *info)
 {
@@ -117,8 +144,11 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 	pdev = to_pci_dev(dev);
 
 	rid = pci_msi_map_rid_ctlr_node(pdev, &msi_node);
-	if (!msi_node)
-		return -ENODEV;
+	if (!msi_node) {
+		ret = its_v5_get_msi_parent(&pdev->dev, &msi_node);
+		if (ret)
+			return ret;
+	}
 
 	ret = its_translate_frame_address(msi_node, &pa);
 	if (ret)
-- 
2.48.0


