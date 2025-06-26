Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4D9C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PL2qDWi3pt7sgP22kM6CYykFBDUpgVDZeges0uU0BWA=; b=GOq02ZeYAlgpjLRRSBqr0e5k4Q
	Qdm7o0b1YhqgLE9iu7dDKxsA/xie8cyqIA0tl1LHswZ/SNYQ/Q9AF3ptxGRjmd50NcQhbkilwgWw7
	DPvnL3XUjvRnkqLxDVUAI/SnHSZ9dp2MsHwgNA6RPA2r1jJeqPOnaW+IMg4bxijeaFeg5TR5V45/C
	JBfK7OVMkQxXmqF70IVHYKrBzXdZDtAYbhrbcuIWGU4MX6OgJneiXg1JWEiIuQKbKM50XJ8NGakLm
	7n94vgtyYnGNpzO3TT4IAB7f7vePHaArDOIvcvVn/ssJNVgTt4/AeCUd5Ux4LcUDcJrj+Fdk2RodW
	MLWW4xyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoFB-0000000C45U-3PZ7;
	Thu, 26 Jun 2025 15:10:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuA-0000000BzZR-0EAu;
	Thu, 26 Jun 2025 14:48:47 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PL2qDWi3pt7sgP22kM6CYykFBDUpgVDZeges0uU0BWA=;
	b=z/Jr2XO7BH0ySGAekOpV+Cf8qRhZAAawlGtbgTrrAiEou5jG0DZxpORVM92PSY3nSA2x7X
	5qjS/Z/Az1R9A34yKlykCxNry/5U+biU6CCaE7z6d2Qa/t4/8XGRa5RYqd1pVnZzg7FJ38
	En1TcwCIyakV1bTvGQw1CPdrAAX13vBRWMqPWlnLwMtqh6kgzAytcz9IvMODN7YgF5LTuq
	gneWVOXk9FFUakQzpksCsCCHwXypevrIhJekA7pkTLS8XfHHZUTQTXNvcQbAbKfeD0pnLR
	iDVOkIUngpMqjq99TyDMfB/Acc564mfiEWOK/274ghetLyXEMN8Q7LC4HcYeIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PL2qDWi3pt7sgP22kM6CYykFBDUpgVDZeges0uU0BWA=;
	b=vAY4S6QhgCs+vVJiGpYBNhIKc1zpRX32BQp9RA/DpPxZ5vdCkp90MV7E+IwFf8eTkSsO5K
	yKOfwPjryMkQQhAQ==
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
Subject: [PATCH 08/16] PCI: mediatek: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:47:58 +0200
Message-Id: <76f6e6ce6021607cd0fdfd79fef7d2eb69d9f361.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074846_231150_CC9CC545 
X-CRM114-Status: GOOD (  13.22  )
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
 drivers/pci/controller/Kconfig         |  1 +
 drivers/pci/controller/pcie-mediatek.c | 46 ++++++++++++--------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index ec32c343a751d..65289a171333c 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -195,6 +195,7 @@ config PCIE_MEDIATEK
 	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
 	depends on OF
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	help
 	  Say Y here if you want to enable PCIe controller support on
 	  MediaTek SoCs.
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controlle=
r/pcie-mediatek.c
index e1934aa06c8d5..3ac5d14dd543e 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -12,6 +12,7 @@
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -180,7 +181,6 @@ struct mtk_pcie_soc {
  * @irq: GIC irq
  * @irq_domain: legacy INTx IRQ domain
  * @inner_domain: inner IRQ domain
- * @msi_domain: MSI IRQ domain
  * @lock: protect the msi_irq_in_use bitmap
  * @msi_irq_in_use: bit map for assigned MSI IRQ
  */
@@ -200,7 +200,6 @@ struct mtk_pcie_port {
 	int irq;
 	struct irq_domain *irq_domain;
 	struct irq_domain *inner_domain;
-	struct irq_domain *msi_domain;
 	struct mutex lock;
 	DECLARE_BITMAP(msi_irq_in_use, MTK_MSI_IRQS_NUM);
 };
@@ -470,17 +469,20 @@ static const struct irq_domain_ops msi_domain_ops =3D=
 {
 	.free	=3D mtk_pcie_irq_domain_free,
 };
=20
-static struct irq_chip mtk_msi_irq_chip =3D {
-	.name		=3D "MTK PCIe MSI",
-	.irq_ack	=3D irq_chip_ack_parent,
-	.irq_mask	=3D pci_msi_mask_irq,
-	.irq_unmask	=3D pci_msi_unmask_irq,
-};
+#define MTK_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
+				MSI_FLAG_USE_DEF_CHIP_OPS	| \
+				MSI_FLAG_NO_AFFINITY)
+
+#define MTK_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK		| \
+				 MSI_FLAG_PCI_MSIX)
=20
-static struct msi_domain_info mtk_msi_domain_info =3D {
-	.flags	=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX,
-	.chip	=3D &mtk_msi_irq_chip,
+static const struct msi_parent_ops mtk_msi_parent_ops =3D {
+	.required_flags		=3D MTK_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D MTK_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_ACK,
+	.prefix			=3D "MTK-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
 static int mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
@@ -489,21 +491,19 @@ static int mtk_pcie_allocate_msi_domains(struct mtk_p=
cie_port *port)
=20
 	mutex_init(&port->lock);
=20
-	port->inner_domain =3D irq_domain_create_linear(fwnode, MTK_MSI_IRQS_NUM,
-						      &msi_domain_ops, port);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.ops		=3D &msi_domain_ops,
+		.host_data	=3D port,
+		.size		=3D MTK_MSI_IRQS_NUM,
+	};
+
+	port->inner_domain =3D msi_create_parent_irq_domain(&info, &mtk_msi_paren=
t_ops);
 	if (!port->inner_domain) {
 		dev_err(port->pcie->dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
 	}
=20
-	port->msi_domain =3D pci_msi_create_irq_domain(fwnode, &mtk_msi_domain_in=
fo,
-						     port->inner_domain);
-	if (!port->msi_domain) {
-		dev_err(port->pcie->dev, "failed to create MSI domain\n");
-		irq_domain_remove(port->inner_domain);
-		return -ENOMEM;
-	}
-
 	return 0;
 }
=20
@@ -532,8 +532,6 @@ static void mtk_pcie_irq_teardown(struct mtk_pcie *pcie)
 			irq_domain_remove(port->irq_domain);
=20
 		if (IS_ENABLED(CONFIG_PCI_MSI)) {
-			if (port->msi_domain)
-				irq_domain_remove(port->msi_domain);
 			if (port->inner_domain)
 				irq_domain_remove(port->inner_domain);
 		}
--=20
2.39.5


