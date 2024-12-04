Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90832E7717E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZznuEa7SCLFAxLSvSAQAvTLbiQ5H+LIpJoAJqYI68o=; b=cuHgZaChwCoUZB3LBhRSfVe8gq
	ZtCHbn04JOtFy440XSoevZT9rpjgoKNgg3JAejm6BQEuyOn9SZJpbCQA56lQMMPyKilSOLGkt/o7U
	QTTS7NV0uT0eyg5a02U0Ypau1M+xUeaFkTduzh5gXvYzdJzCESA4z07tWK3UacfVMOQ4d+MgNMDku
	7Txd56RWvoAO397srS9ZNaoNNDOVo/iw48Zs44WKSnV4QI+tKn4nDsAwKSUGLFIliMLbhpX57k/+c
	OX9BuoaHGkdFBInKM1VMvoChucK9ZhrcVXdEEkvHtSlgQN7K03LB01BW4D/WYSnPkax1GGBGFHou1
	TeYK8VjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoxT-0000000Cb2w-3C7r;
	Wed, 04 Dec 2024 12:58:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIolf-0000000CYW2-0s2v;
	Wed, 04 Dec 2024 12:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF5B1A41514;
	Wed,  4 Dec 2024 12:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1725C4CED1;
	Wed,  4 Dec 2024 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733316369;
	bh=NPW6c3VDoAyeTY2GD72s1RHlrmv8mP4Sc8+nycqjNi0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oH0f2cxu4cUugaMlPmlrMOH4WJ9Txnq2Om4S/PUMZ7gqWsBpfd31BNo2+D5CQPQEy
	 dnTbWFfSmKjndLUMMfBStG1oIOjipJEk+6FHdC5prmrPjIyxsBIPJA6/PIXCx94QM9
	 CTQ1Nf63DOUSZyV1WuQWhgCQ06tgKDEueZ9Vqr9tUB7enSAtn1glTLM04gzGBRhJ8m
	 y9zngyF4C03gp/uBeYetGUxCSxHPeHtAghHNYT8S4byu3a/DrXzxCBHLOMpO2fNmN6
	 7CDZmMIX2CqYDE4H0PvXsy8tp1IRWatyHOUo9xT4OdTYKBG0OC4lkK8naVHBWy3Tnu
	 vkl/q66P9HunA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIolb-000RHy-Ns;
	Wed, 04 Dec 2024 12:46:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 10/11] PCI: apple: Convert to MSI parent infrastructure
Date: Wed,  4 Dec 2024 12:45:48 +0000
Message-Id: <20241204124549.607054-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241204124549.607054-1-maz@kernel.org>
References: <20241204124549.607054-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, joro@8bytes.org, suravee.suthikulpanit@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, tglx@linutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name, jiaxun.yang@flygoat.com, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_044611_385978_F9620FEC 
X-CRM114-Status: GOOD (  20.02  )
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
convert the apple PCIe driver to the MSI-parent infrastructure
and let each device have its own MSI domain.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/Kconfig      |  1 +
 drivers/pci/controller/pcie-apple.c | 57 ++++++++---------------------
 2 files changed, 17 insertions(+), 41 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 9800b76810540..98a62f4559dfd 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -40,6 +40,7 @@ config PCIE_APPLE
 	depends on OF
 	depends on PCI_MSI
 	select PCI_HOST_COMMON
+	select IRQ_MSI_LIB
 	help
 	  Say Y here if you want to enable PCIe controller support on Apple
 	  system-on-chips, like the Apple M1. This is required for the USB
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index fefab2758a064..945070ac31cf8 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -22,6 +22,7 @@
 #include <linux/kernel.h>
 #include <linux/iopoll.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -134,7 +135,6 @@ struct apple_pcie {
 	struct mutex		lock;
 	struct device		*dev;
 	void __iomem            *base;
-	struct irq_domain	*domain;
 	unsigned long		*bitmap;
 	struct list_head	ports;
 	struct completion	event;
@@ -163,27 +163,6 @@ static void rmw_clear(u32 clr, void __iomem *addr)
 	writel_relaxed(readl_relaxed(addr) & ~clr, addr);
 }
 
-static void apple_msi_top_irq_mask(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void apple_msi_top_irq_unmask(struct irq_data *d)
-{
-	pci_msi_unmask_irq(d);
-	irq_chip_unmask_parent(d);
-}
-
-static struct irq_chip apple_msi_top_chip = {
-	.name			= "PCIe MSI",
-	.irq_mask		= apple_msi_top_irq_mask,
-	.irq_unmask		= apple_msi_top_irq_unmask,
-	.irq_eoi		= irq_chip_eoi_parent,
-	.irq_set_affinity	= irq_chip_set_affinity_parent,
-	.irq_set_type		= irq_chip_set_type_parent,
-};
-
 static void apple_msi_compose_msg(struct irq_data *data, struct msi_msg *msg)
 {
 	msg->address_hi = upper_32_bits(DOORBELL_ADDR);
@@ -227,8 +206,7 @@ static int apple_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
 
 	for (i = 0; i < nr_irqs; i++) {
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &apple_msi_bottom_chip,
-					      domain->host_data);
+					      &apple_msi_bottom_chip, pcie);
 	}
 
 	return 0;
@@ -252,12 +230,6 @@ static const struct irq_domain_ops apple_msi_domain_ops = {
 	.free	= apple_msi_domain_free,
 };
 
-static struct msi_domain_info apple_msi_info = {
-	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		   MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX),
-	.chip	= &apple_msi_top_chip,
-};
-
 static void apple_port_irq_mask(struct irq_data *data)
 {
 	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
@@ -596,6 +568,17 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 	return 0;
 }
 
+static const struct msi_parent_ops apple_msi_parent_ops = {
+	.supported_flags	= (MSI_GENERIC_FLAGS_MASK	|
+				   MSI_FLAG_PCI_MSIX		|
+				   MSI_FLAG_MULTI_PCI_MSI),
+	.required_flags		= (MSI_FLAG_USE_DEF_DOM_OPS	|
+				   MSI_FLAG_USE_DEF_CHIP_OPS	|
+				   MSI_FLAG_PCI_MSI_MASK_PARENT),
+	.bus_select_token	= DOMAIN_BUS_PCI_MSI,
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+};
+
 static int apple_msi_init(struct apple_pcie *pcie)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(pcie->dev);
@@ -626,21 +609,13 @@ static int apple_msi_init(struct apple_pcie *pcie)
 		return -ENXIO;
 	}
 
-	parent = irq_domain_create_hierarchy(parent, 0, pcie->nvecs, fwnode,
-					     &apple_msi_domain_ops, pcie);
+	parent = msi_create_parent_irq_domain(fwnode, &apple_msi_parent_ops,
+					      &apple_msi_domain_ops, 0,
+					      pcie->nvecs, pcie, parent);
 	if (!parent) {
 		dev_err(pcie->dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
 	}
-	irq_domain_update_bus_token(parent, DOMAIN_BUS_NEXUS);
-
-	pcie->domain = pci_msi_create_irq_domain(fwnode, &apple_msi_info,
-						 parent);
-	if (!pcie->domain) {
-		dev_err(pcie->dev, "failed to create MSI domain\n");
-		irq_domain_remove(parent);
-		return -ENOMEM;
-	}
 
 	return 0;
 }
-- 
2.39.2


