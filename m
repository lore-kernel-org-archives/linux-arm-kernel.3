Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D37C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwVxsIaDgcFb+O8/af0/YU761G/v/g4E9Y+QGYc/05U=; b=uZIIcuZ/bXtDEFmt/KS1uePwV5
	ZcDPpjHqsDaDUKLIorjXdVgnPu0USI5dmj8vaJg6Lfx45Pez3FHHmzCSUi2/fcDWi8cj+m9GaITu3
	ZqtArIZiqTWhi3mDTOuO8UqvzyRa72f6QbMEbB2vLXRB/iFSg9RyunVaHsgxCoPjkU3X1bmp+asiJ
	TH0lUg/9jXUnPiuX7XVg+GXuu3XR/Zgh+Mdtg35w2rpm7oqtLbvqqoxLmg1WQIJK0/fs5YuqASEg/
	KWmEIDQcnNdomvKMPl57bA/oxzKZHIuDNMZvkw0DGij1wMMpx13bYBuyILi+TBSPZPY2NkIbaJUY8
	0SlWmxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoAa-0000000C39g-2IPd;
	Thu, 26 Jun 2025 15:05:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnu8-0000000BzYT-3tEU;
	Thu, 26 Jun 2025 14:48:46 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MwVxsIaDgcFb+O8/af0/YU761G/v/g4E9Y+QGYc/05U=;
	b=qb4mxWe3WWY08sLg1q5wCvmQqGknTCw6CVCGuomI60FtWYtsrD13i1SBsvhjDS+vdF70Iz
	t4BEILq9XogEB8X6qnKiZ+oME6d0NPDqMm2JiHj1CbV12UYEPqhDCWxWDfHjwHH4VHIvmh
	muimG5KiLq4qUj2r28VqdWFCdgASDnZ8ohbCAqdghuYNWm4AWnv0uu0KUXc5C7ssA1Gnup
	ry3Bgg5zD73qv/oaNCVmUQd7omyHEtYfn+3S3Dd3atDNhnzezlS9mwS1y6Reit2xXjjIJI
	2EzCJIhiAWzQ4K/XfkTOIeouSsyLnlmqZK69DAnA/ldV6R5C+Q5isfu0LRnZEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MwVxsIaDgcFb+O8/af0/YU761G/v/g4E9Y+QGYc/05U=;
	b=aGPLl3PxbrjaVlsRxncYQgHcAWiO2kv/pPWxTNJj/NXLkyLfMoDzOUoEdFGtiCiA9kmVOO
	paVWXxmki0g6fuDA==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 07/16] PCI: mediatek-gen3: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:47:57 +0200
Message-Id: <bfbd2e375269071b69e1aa85e629ee4b7c99518f.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074845_125841_00ADA284 
X-CRM114-Status: GOOD (  14.35  )
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

Move away from the legacy MSI domain setup, switch to use
msi_create_parent_irq_domain().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/Kconfig              |  1 +
 drivers/pci/controller/pcie-mediatek-gen3.c | 67 ++++++++-------------
 2 files changed, 26 insertions(+), 42 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 375a019f35bd9..ec32c343a751d 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -203,6 +203,7 @@ config PCIE_MEDIATEK_GEN3
 	tristate "MediaTek Gen3 PCIe controller"
 	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	help
 	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
 	  This PCIe controller is compatible with Gen3, Gen2 and Gen1 speed,
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/cont=
roller/pcie-mediatek-gen3.c
index 5464b4ae5c20c..97147f43e41c5 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
@@ -187,7 +188,6 @@ struct mtk_msi_set {
  * @saved_irq_state: IRQ enable state saved at suspend time
  * @irq_lock: lock protecting IRQ register access
  * @intx_domain: legacy INTx IRQ domain
- * @msi_domain: MSI IRQ domain
  * @msi_bottom_domain: MSI IRQ bottom domain
  * @msi_sets: MSI sets information
  * @lock: lock protecting IRQ bit map
@@ -210,7 +210,6 @@ struct mtk_gen3_pcie {
 	u32 saved_irq_state;
 	raw_spinlock_t irq_lock;
 	struct irq_domain *intx_domain;
-	struct irq_domain *msi_domain;
 	struct irq_domain *msi_bottom_domain;
 	struct mtk_msi_set msi_sets[PCIE_MSI_SET_NUM];
 	struct mutex lock;
@@ -526,30 +525,22 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie=
 *pcie)
 	return 0;
 }
=20
-static void mtk_pcie_msi_irq_mask(struct irq_data *data)
-{
-	pci_msi_mask_irq(data);
-	irq_chip_mask_parent(data);
-}
-
-static void mtk_pcie_msi_irq_unmask(struct irq_data *data)
-{
-	pci_msi_unmask_irq(data);
-	irq_chip_unmask_parent(data);
-}
-
-static struct irq_chip mtk_msi_irq_chip =3D {
-	.irq_ack =3D irq_chip_ack_parent,
-	.irq_mask =3D mtk_pcie_msi_irq_mask,
-	.irq_unmask =3D mtk_pcie_msi_irq_unmask,
-	.name =3D "MSI",
-};
-
-static struct msi_domain_info mtk_msi_domain_info =3D {
-	.flags	=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX |
-		  MSI_FLAG_MULTI_PCI_MSI,
-	.chip	=3D &mtk_msi_irq_chip,
+#define MTK_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
+				MSI_FLAG_USE_DEF_CHIP_OPS	| \
+				MSI_FLAG_NO_AFFINITY		| \
+				MSI_FLAG_PCI_MSI_MASK_PARENT)
+
+#define MTK_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK		| \
+				 MSI_FLAG_PCI_MSIX		| \
+				 MSI_FLAG_MULTI_PCI_MSI)
+
+static const struct msi_parent_ops mtk_msi_parent_ops =3D {
+	.required_flags		=3D MTK_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D MTK_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_ACK,
+	.prefix			=3D "MTK3-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
 static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
@@ -756,28 +747,23 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_=
pcie *pcie)
 	/* Setup MSI */
 	mutex_init(&pcie->lock);
=20
-	pcie->msi_bottom_domain =3D irq_domain_create_linear(dev_fwnode(dev), PCI=
E_MSI_IRQS_NUM,
-							   &mtk_msi_bottom_domain_ops, pcie);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D dev_fwnode(dev),
+		.ops		=3D &mtk_msi_bottom_domain_ops,
+		.host_data	=3D pcie,
+		.size		=3D PCIE_MSI_IRQS_NUM,
+	};
+
+	pcie->msi_bottom_domain =3D msi_create_parent_irq_domain(&info, &mtk_msi_=
parent_ops);
 	if (!pcie->msi_bottom_domain) {
 		dev_err(dev, "failed to create MSI bottom domain\n");
 		ret =3D -ENODEV;
 		goto err_msi_bottom_domain;
 	}
=20
-	pcie->msi_domain =3D pci_msi_create_irq_domain(dev->fwnode,
-						     &mtk_msi_domain_info,
-						     pcie->msi_bottom_domain);
-	if (!pcie->msi_domain) {
-		dev_err(dev, "failed to create MSI domain\n");
-		ret =3D -ENODEV;
-		goto err_msi_domain;
-	}
-
 	of_node_put(intc_node);
 	return 0;
=20
-err_msi_domain:
-	irq_domain_remove(pcie->msi_bottom_domain);
 err_msi_bottom_domain:
 	irq_domain_remove(pcie->intx_domain);
 out_put_node:
@@ -792,9 +778,6 @@ static void mtk_pcie_irq_teardown(struct mtk_gen3_pcie =
*pcie)
 	if (pcie->intx_domain)
 		irq_domain_remove(pcie->intx_domain);
=20
-	if (pcie->msi_domain)
-		irq_domain_remove(pcie->msi_domain);
-
 	if (pcie->msi_bottom_domain)
 		irq_domain_remove(pcie->msi_bottom_domain);
=20
--=20
2.39.5


