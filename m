Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4FCC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AJ7kQUPH9AYx8SFCEk/OR0xfB62ICgTs2tcpmfvSvA=; b=xiK2YcqwClYEXCo4fm7laE88C/
	8sY2kx9BQkENHv/GLhiHgC/W7AzLBP6Zd6cEj9jyP+zJAABbQdt7YTtPV+VgN6ai86Xx0fFyTorub
	97TQ7+67ndLls8mUiP/DYigN9fydV855Hd7SzQg/RuY6GKoq8qcURrpQF1kUy4EkIK4f5mLw/pBxk
	fnuzjG9r/ZjVCUZOyYAHVfaLQkyqjgkyaNxDUTKhSY16WtzRWzxgg/FkcphIqKt3JBPKFMteS55eF
	KocqRyLlYnrzQSaHU9b9Wcgfa80WrK7RWm1JF3T5yiO2pvulYVhitB0m3gzg418fjpgE/zV+QkRiM
	FQl9XXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtml-0000000D9rk-1gQR;
	Tue, 13 May 2025 17:51:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtQe-0000000D5dX-1GKY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C93E4ADDF;
	Tue, 13 May 2025 17:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761AEC4CEF5;
	Tue, 13 May 2025 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747157311;
	bh=oy5+g4474/lLrvJUb110/2URSF/aJXhYc5kqF6xIKtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UznpozAf4DUO/Ks0LKeyAxdx0MYz5WwUJyeksUIdGKa6FdtLkMGssOOT/m/p2zizm
	 w+aWJGVeyvd9URKDIhAVfuYR6QFJh+AtYBcDvMeWa4d6LS0ucVVFsc8/8592hxHqg0
	 19J6eB+M59DBT8wgv7BnNhb90UDIyQX1wwJXABsCr+S5SnDDAXn4sXRMuFaenTsazf
	 c1nKC2t2N9CiVOYwgJHfpJ9JH59YS36HyuKHqry93CNYhwwzZfd/vXW0Bsl5pRhSsk
	 UewLDTFrHtg1NrWYxKn3Nvoxhlunhe2jpvt+j7dfIwkOVAn/IlJa+LvLUTSw1fL0pj
	 eopGC/VKxe+8A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEtQb-00EbRz-MW;
	Tue, 13 May 2025 18:28:29 +0100
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
Subject: [PATCH v2 8/9] PCI: xgene: Convert to MSI parent infrastructure
Date: Tue, 13 May 2025 18:28:18 +0100
Message-Id: <20250513172819.2216709-9-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250513_102832_383266_36CD96E4 
X-CRM114-Status: GOOD (  18.03  )
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
convert the xgene PCIe driver to the MSI-parent infrastructure
and let each device have its own MSI domain.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/Kconfig         |  1 +
 drivers/pci/controller/pci-xgene-msi.c | 46 ++++++++++----------------
 2 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 98a62f4559dfd..205e0e365c6b1 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -304,6 +304,7 @@ config PCI_XGENE_MSI
 	bool "X-Gene v1 PCIe MSI feature"
 	depends on PCI_XGENE
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	default y
 	help
 	  Say Y here if you want PCIe MSI support for the APM X-Gene v1 SoC.
diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index 7bce327897c93..857177ab3d30f 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/of_pci.h>
@@ -32,7 +33,6 @@ struct xgene_msi_group {
 struct xgene_msi {
 	struct device_node	*node;
 	struct irq_domain	*inner_domain;
-	struct irq_domain	*msi_domain;
 	u64			msi_addr;
 	void __iomem		*msi_regs;
 	unsigned long		*bitmap;
@@ -44,20 +44,6 @@ struct xgene_msi {
 /* Global data */
 static struct xgene_msi xgene_msi_ctrl;
 
-static struct irq_chip xgene_msi_top_irq_chip = {
-	.name		= "X-Gene1 MSI",
-	.irq_enable	= pci_msi_unmask_irq,
-	.irq_disable	= pci_msi_mask_irq,
-	.irq_mask	= pci_msi_mask_irq,
-	.irq_unmask	= pci_msi_unmask_irq,
-};
-
-static struct  msi_domain_info xgene_msi_domain_info = {
-	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_PCI_MSIX),
-	.chip	= &xgene_msi_top_irq_chip,
-};
-
 /*
  * X-Gene v1 has 16 groups of MSI termination registers MSInIRx, where
  * n is group number (0..F), x is index of registers in each group (0..7)
@@ -235,34 +221,36 @@ static void xgene_irq_domain_free(struct irq_domain *domain,
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
 
-static const struct irq_domain_ops msi_domain_ops = {
+static const struct irq_domain_ops xgene_msi_domain_ops = {
 	.alloc  = xgene_irq_domain_alloc,
 	.free   = xgene_irq_domain_free,
 };
 
+static const struct msi_parent_ops xgene_msi_parent_ops = {
+	.supported_flags	= (MSI_GENERIC_FLAGS_MASK	|
+				   MSI_FLAG_PCI_MSIX),
+	.required_flags		= (MSI_FLAG_USE_DEF_DOM_OPS	|
+				   MSI_FLAG_USE_DEF_CHIP_OPS),
+	.bus_select_token	= DOMAIN_BUS_PCI_MSI,
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+};
+
 static int xgene_allocate_domains(struct xgene_msi *msi)
 {
-	msi->inner_domain = irq_domain_add_linear(NULL, NR_MSI_VEC,
-						  &msi_domain_ops, msi);
+	msi->inner_domain = msi_create_parent_irq_domain(&(struct irq_domain_info){
+			.fwnode		= of_node_to_fwnode(msi->node),
+			.ops		= &xgene_msi_domain_ops,
+			.size		= NR_MSI_VEC,
+			.host_data	= msi,
+		}, &xgene_msi_parent_ops);
 	if (!msi->inner_domain)
 		return -ENOMEM;
 
-	msi->msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(msi->node),
-						    &xgene_msi_domain_info,
-						    msi->inner_domain);
-
-	if (!msi->msi_domain) {
-		irq_domain_remove(msi->inner_domain);
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
 static void xgene_free_domains(struct xgene_msi *msi)
 {
-	if (msi->msi_domain)
-		irq_domain_remove(msi->msi_domain);
 	if (msi->inner_domain)
 		irq_domain_remove(msi->inner_domain);
 }
-- 
2.39.2


