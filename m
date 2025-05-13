Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCE8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TG7x1mA4t7SPNBIGAypMsP8olj56VaRDxhRT0dA/JU=; b=YbmXyRYS9LGUyaxGrUo20op/2U
	jepiSShGCzF9TC90dVkGzd7ekXaehMTvyxomnNspM1FrTbBSAov9FPKSzBsZsNl6K+1KGybijtmBz
	C/uE+8dx5pMMbnJpWPMgsv348MK0X/x6C5pBkClKv/QhE9BiMDpF+JIyiWg77P3vfdkhZnHdcNTaj
	QrlPJMb56LZrr8+SXFzOXOmXujAsrcOpdZk2wzu9XYOY+TMRz63iV+EqXnRbr51NtED0dfbfxPCNh
	yqUZGAEdyrVMalZBLWpUC8vlKHlQKsmf+zqyMnZ+RalqJTlx0JExrhgzkQatGRhh03jIOGniDYU/h
	Jqp34qAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtor-0000000DAOy-0x8c;
	Tue, 13 May 2025 17:53:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtQe-0000000D5eG-3Uzf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B2B84AE05;
	Tue, 13 May 2025 17:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E326EC4CEED;
	Tue, 13 May 2025 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747157311;
	bh=Q8w46xAjeQAyJ+1XbNSXNwc3/sOPI9k8U7Sk79sgA1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YAAz9vqLVar8Bi7GoIsPRMiEYZBh+E7Hk/h5SKnVk5PzGKRyWQJb47apk/l73bRfN
	 RfQ5YBlEP2Kv7lsCq9JGQFLO7nqCG6e/V2Q0oER5IBM+NOLEEGc0AgNWGHCS0qnSQW
	 F+CMCNY9GdIdArhRtyJ2robA+puuAIiH2LcMoMmIySf2g+NhtctES3UxoMFUI14iF6
	 A3LaEmDYQknWLilov8UruLysplHSDNeiQQO/ejNwlCh0JCCe3AqFxOh1M8qwcQHCFL
	 PO5HivaWw56DgYNJH9RZQsNewu0SllaXSzOR4QHRgDpUTG/a9Yq3i0quoJ96mAovRo
	 li3jctX4uMlNw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEtQb-00EbRz-UG;
	Tue, 13 May 2025 18:28:30 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 9/9] PCI: tegra: Convert to MSI parent infrastructure
Date: Tue, 13 May 2025 18:28:19 +0100
Message-Id: <20250513172819.2216709-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513172819.2216709-1-maz@kernel.org>
References: <20250513172819.2216709-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, tglx@linutronix.de, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io, thierry.reding@gmail.com, jonathanh@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_102832_944605_4933D506 
X-CRM114-Status: GOOD (  16.99  )
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

In an effort to move arm64 away from the legacy MSI setup,
convert the tegra PCIe driver to the MSI-parent infrastructure
and let each device have its own MSI domain.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/Kconfig     |  1 +
 drivers/pci/controller/pci-tegra.c | 60 +++++++++---------------------
 2 files changed, 19 insertions(+), 42 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 205e0e365c6b1..eb3cc28d43f82 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -228,6 +228,7 @@ config PCI_TEGRA
 	bool "NVIDIA Tegra PCIe controller"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	help
 	  Say Y here if you want support for the PCIe host controller found
 	  on NVIDIA Tegra SoCs.
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index d2f88997283ae..def9384bd6ff0 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -22,6 +22,7 @@
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -1547,7 +1548,7 @@ static void tegra_pcie_msi_irq(struct irq_desc *desc)
 			unsigned int index = i * 32 + offset;
 			int ret;
 
-			ret = generic_handle_domain_irq(msi->domain->parent, index);
+			ret = generic_handle_domain_irq(msi->domain, index);
 			if (ret) {
 				/*
 				 * that's weird who triggered this?
@@ -1565,30 +1566,6 @@ static void tegra_pcie_msi_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static void tegra_msi_top_irq_ack(struct irq_data *d)
-{
-	irq_chip_ack_parent(d);
-}
-
-static void tegra_msi_top_irq_mask(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void tegra_msi_top_irq_unmask(struct irq_data *d)
-{
-	pci_msi_unmask_irq(d);
-	irq_chip_unmask_parent(d);
-}
-
-static struct irq_chip tegra_msi_top_chip = {
-	.name		= "Tegra PCIe MSI",
-	.irq_ack	= tegra_msi_top_irq_ack,
-	.irq_mask	= tegra_msi_top_irq_mask,
-	.irq_unmask	= tegra_msi_top_irq_unmask,
-};
-
 static void tegra_msi_irq_ack(struct irq_data *d)
 {
 	struct tegra_msi *msi = irq_data_get_irq_chip_data(d);
@@ -1690,30 +1667,32 @@ static const struct irq_domain_ops tegra_msi_domain_ops = {
 	.free = tegra_msi_domain_free,
 };
 
-static struct msi_domain_info tegra_msi_info = {
-	.flags	= MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX,
-	.chip	= &tegra_msi_top_chip,
+static const struct msi_parent_ops tegra_msi_parent_ops = {
+	.supported_flags	= (MSI_GENERIC_FLAGS_MASK	|
+				   MSI_FLAG_PCI_MSIX),
+	.required_flags		= (MSI_FLAG_USE_DEF_DOM_OPS	|
+				   MSI_FLAG_USE_DEF_CHIP_OPS	|
+				   MSI_FLAG_PCI_MSI_MASK_PARENT	|
+				   MSI_FLAG_NO_AFFINITY),
+	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
+	.bus_select_token	= DOMAIN_BUS_PCI_MSI,
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
 static int tegra_allocate_domains(struct tegra_msi *msi)
 {
 	struct tegra_pcie *pcie = msi_to_pcie(msi);
 	struct fwnode_handle *fwnode = dev_fwnode(pcie->dev);
-	struct irq_domain *parent;
 
-	parent = irq_domain_create_linear(fwnode, INT_PCI_MSI_NR,
-					  &tegra_msi_domain_ops, msi);
-	if (!parent) {
-		dev_err(pcie->dev, "failed to create IRQ domain\n");
-		return -ENOMEM;
-	}
-	irq_domain_update_bus_token(parent, DOMAIN_BUS_NEXUS);
+	msi->domain = msi_create_parent_irq_domain(&(struct irq_domain_info){
+			.fwnode		= fwnode,
+			.ops		= &tegra_msi_domain_ops,
+			.size		= INT_PCI_MSI_NR,
+			.host_data	= msi,
+		}, &tegra_msi_parent_ops);
 
-	msi->domain = pci_msi_create_irq_domain(fwnode, &tegra_msi_info, parent);
 	if (!msi->domain) {
 		dev_err(pcie->dev, "failed to create MSI domain\n");
-		irq_domain_remove(parent);
 		return -ENOMEM;
 	}
 
@@ -1722,10 +1701,7 @@ static int tegra_allocate_domains(struct tegra_msi *msi)
 
 static void tegra_free_domains(struct tegra_msi *msi)
 {
-	struct irq_domain *parent = msi->domain->parent;
-
 	irq_domain_remove(msi->domain);
-	irq_domain_remove(parent);
 }
 
 static int tegra_pcie_msi_setup(struct tegra_pcie *pcie)
-- 
2.39.2


