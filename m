Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0F1E77173
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTlyoZd0Z8X3Ax+8OlWTkIefIPquaGyJJBQOFPH0lCo=; b=Lx081HhjDXoCbmK0nUTgVZg6xq
	oM5h0Ed35mhwY6vM3twQWwjXg02IcDyJUIRw7p1WR6fdc18dw8gkJ9U8CcUesFXQt1MKDE3Qz6HB+
	6ZEEJAWdPuY7ctG3tbR73D5yO0kXjmuA+SXQ6tSBkOFQmubIOuJBSGm3XU07MfW5ZjyDuVVyTUxo+
	+FG/Tl0prw6B1acTJjvV2FRsLMfnMLy1tXb2P/UwBe34s0WHyzooLrhXfUPerooMdDP+iRftQBwsR
	XE1nQwT1eP/n2lK3cZlw1MSd/M4iEXVE/5xCVlsCncQ0i1vauSvgvcnreSghku3kzMyFqvxJ7gOzx
	1BKiUaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoxa-0000000CbGs-36f9;
	Wed, 04 Dec 2024 12:58:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIolk-0000000CYab-2qXx;
	Wed, 04 Dec 2024 12:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KTlyoZd0Z8X3Ax+8OlWTkIefIPquaGyJJBQOFPH0lCo=; b=BiLilogvHdarUqJNzyyqKwPwMi
	aGFvMMjzpm0yDfXaXgrAh/464Ajo6ka+/LylWQ3wKtuAFi96U8GNOIn5ib61u2TcwjgPs51s/A2iA
	Kk1bkGQioSkqgFPA5Hvq7+xOEfAEr7XkOZA15JSCACRKcYGcvjrWdPu7ii1e1encl7krsdYTEPwrU
	09J9lsCwh7blpzOZkvYY3QLEBJIPsXfggR8B2rotrVEcqXr+2FYIL2dHOkEsfJMW94E8yQlCGamiD
	KajVUKr35nJbVnpsGlPNy2qTj+vziuvS9TRI3ugjkO23VwgfP1z7KUGGE6e9ITp++IYU0E2jn7ezr
	yJ8OpWag==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIolh-00000002b10-353m;
	Wed, 04 Dec 2024 12:46:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B9EEA416F5;
	Wed,  4 Dec 2024 12:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D740C4CEE4;
	Wed,  4 Dec 2024 12:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733316370;
	bh=WovDOhGvJI34dfRdwLOil5noAJ5CREZZX4oJMEsuV3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eUOAOGxDdJCpu9CKizY2dme6+QjXgFdhMgbIAtu+zIYKisA9lS0WvyerxS1fXCxPY
	 t3j55q66bUY9eCYymATDsBvYYd+IqYHPtn1e7vQx3RJyDLiWiiZcmWyYHYRa/Yb0Ln
	 MP23MO1U0GrTvYw679XpCjcEmsS67z6gvNhik4vdE+Epv3wWWPgKxGcKHztdtZTY8F
	 N9Gp8NbO7A3+t5/Kz0j7J765cEhdqVSHzFEjI6t+yuOY4AYcZ2dLyldBbRb0UGDIw9
	 fuFJc9P29p0HnKXgUxtCjZp6djxgFRjuSXkSuWYGjCHcqcKpWMnMXvvqIlIh5EjUI1
	 7fYhjW87yzjFQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIolc-000RHy-5S;
	Wed, 04 Dec 2024 12:46:08 +0000
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
Subject: [PATCH 11/11] PCI: xgene: Convert to MSI parent infrastructure
Date: Wed,  4 Dec 2024 12:45:49 +0000
Message-Id: <20241204124549.607054-12-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241204_124614_088860_CDFC33E4 
X-CRM114-Status: GOOD (  17.46  )
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
 drivers/pci/controller/pci-xgene-msi.c | 44 +++++++++-----------------
 2 files changed, 16 insertions(+), 29 deletions(-)

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
index 88c0977bc41a4..d9e4d1e136f77 100644
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
@@ -235,34 +221,34 @@ static void xgene_irq_domain_free(struct irq_domain *domain,
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
+	msi->inner_domain = msi_create_parent_irq_domain(of_node_to_fwnode(msi->node),
+							 &xgene_msi_parent_ops,
+							 &xgene_msi_domain_ops,
+							 0, NR_MSI_VEC, msi, NULL);
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


