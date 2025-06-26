Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738DCC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YvHDwNtH7JCA3yTrFzmAWls6d21ROaLNNWeeQE+7RU=; b=XNQxZ/ipUg+GjGHIUjZpCRK1U3
	htDx7UageTkmcrQ2HWoC56Dv/yJWbsKAC7UQkQN5t2LzgDPlOjGi4OqCy9cbsxtAXtUfHY79u5H01
	yvxgZolZObE5EjVICQcLs8qy3K1T/WS20riwHE1IJBhdoY3dp2sFaFF9ZNVWKOVvR66Avjb4IhHR7
	OlgfkHX9TLbJasWyZsFdGkkGk5kva9nC+a/7pZDjsSWaGdOAlLA5gfXHm5QkWDwMdfAsKzO2hBmul
	dGNzyzb/1SLRKhcCJpIRqPJOFIG1b6UCg/D4mXgumlySrqgxoZaxGNXJln7/ibio41JNfzicv3CIF
	hNImqd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoJu-0000000C59P-17c7;
	Thu, 26 Jun 2025 15:15:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuC-0000000Bzan-20PY;
	Thu, 26 Jun 2025 14:48:49 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YvHDwNtH7JCA3yTrFzmAWls6d21ROaLNNWeeQE+7RU=;
	b=MBG2XPkqXhhV2bLEtvA59slqHsgL7Z6rDDVkc2MF41m6pMdBsalBsUVGypGVk6xk0oeHKE
	/UlgPT+GhSsHHaPCLSnDknWCIwbYyhh0D/e1TNgXuYj9gG+0RddQiPTLg158aREKPzD9ag
	+Qh8B8eqiWYkaASefNKq5P3fIcu/CgNoy787GdV8ED3KxVMSd4DplKL7kTzL3TDciQ96bD
	mo4VCR/IwN8gePoeCi9P34lMKwB6EN1MHDyz4lUqzGFVjBJSiKUgKCeOOzxOPBRZNfSbuG
	ylBTTDuKMse1QgFOYm+3IKrLZWZf3IZqo1YEREKnI9DnLhf6doM9oIQFSPaCaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YvHDwNtH7JCA3yTrFzmAWls6d21ROaLNNWeeQE+7RU=;
	b=ywRcYRgi4BovomyW3re9LbWaX7/U7UaVTaE37xI22kuAvFl70TGmO4KI3Xcfns1A6RMaJX
	7yCNwbjRBJSEP+CQ==
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
Subject: [PATCH 10/16] PCI: xilinx-xdma: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:48:00 +0200
Message-Id: <b4620dc1808f217a69d0ae50700ffa12ffd657eb.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074848_678194_9BA34984 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/Kconfig              |  1 +
 drivers/pci/controller/pcie-xilinx-dma-pl.c | 48 +++++++++------------
 2 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 8b9492e9ae693..c9b6180239732 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -331,6 +331,7 @@ config PCIE_XILINX_DMA_PL
 	depends on ARCH_ZYNQMP || COMPILE_TEST
 	depends on PCI_MSI
 	select PCI_HOST_COMMON
+	select IRQ_MSI_LIB
 	help
 	  Say 'Y' here if you want kernel support for the Xilinx PL DMA
 	  PCIe host bridge. The controller is a Soft IP which can act as
diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/cont=
roller/pcie-xilinx-dma-pl.c
index dc9690a535e16..fbc379fd118b4 100644
--- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
+++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
@@ -7,6 +7,7 @@
 #include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -90,7 +91,6 @@ struct xilinx_pl_dma_variant {
 };
=20
 struct xilinx_msi {
-	struct irq_domain	*msi_domain;
 	unsigned long		*bitmap;
 	struct irq_domain	*dev_domain;
 	struct mutex		lock;		/* Protect bitmap variable */
@@ -373,20 +373,20 @@ static irqreturn_t xilinx_pl_dma_pcie_intr_handler(in=
t irq, void *dev_id)
 	return IRQ_HANDLED;
 }
=20
-static struct irq_chip xilinx_msi_irq_chip =3D {
-	.name =3D "pl_dma:PCIe MSI",
-	.irq_enable =3D pci_msi_unmask_irq,
-	.irq_disable =3D pci_msi_mask_irq,
-	.irq_mask =3D pci_msi_mask_irq,
-	.irq_unmask =3D pci_msi_unmask_irq,
-};
+#define XILINX_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
+				   MSI_FLAG_USE_DEF_CHIP_OPS	| \
+				   MSI_FLAG_NO_AFFINITY)
=20
-static struct msi_domain_info xilinx_msi_domain_info =3D {
-	.flags =3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		 MSI_FLAG_NO_AFFINITY | MSI_FLAG_MULTI_PCI_MSI,
-	.chip =3D &xilinx_msi_irq_chip,
-};
+#define XILINX_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK	| \
+				    MSI_FLAG_MULTI_PCI_MSI)
=20
+static const struct msi_parent_ops xilinx_msi_parent_ops =3D {
+	.required_flags		=3D XILINX_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D XILINX_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.prefix			=3D "pl_dma-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
+};
 static void xilinx_compose_msi_msg(struct irq_data *data, struct msi_msg *=
msg)
 {
 	struct pl_dma_pcie *pcie =3D irq_data_get_irq_chip_data(data);
@@ -458,11 +458,6 @@ static void xilinx_pl_dma_pcie_free_irq_domains(struct=
 pl_dma_pcie *port)
 		irq_domain_remove(msi->dev_domain);
 		msi->dev_domain =3D NULL;
 	}
-
-	if (msi->msi_domain) {
-		irq_domain_remove(msi->msi_domain);
-		msi->msi_domain =3D NULL;
-	}
 }
=20
 static int xilinx_pl_dma_pcie_init_msi_irq_domain(struct pl_dma_pcie *port)
@@ -471,18 +466,17 @@ static int xilinx_pl_dma_pcie_init_msi_irq_domain(str=
uct pl_dma_pcie *port)
 	struct xilinx_msi *msi =3D &port->msi;
 	int size =3D BITS_TO_LONGS(XILINX_NUM_MSI_IRQS) * sizeof(long);
 	struct fwnode_handle *fwnode =3D of_fwnode_handle(port->dev->of_node);
-
-	msi->dev_domain =3D irq_domain_create_linear(NULL, XILINX_NUM_MSI_IRQS,
-						   &dev_msi_domain_ops, port);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.ops		=3D &dev_msi_domain_ops,
+		.host_data	=3D port,
+		.size		=3D XILINX_NUM_MSI_IRQS,
+	};
+
+	msi->dev_domain  =3D msi_create_parent_irq_domain(&info, &xilinx_msi_pare=
nt_ops);
 	if (!msi->dev_domain)
 		goto out;
=20
-	msi->msi_domain =3D pci_msi_create_irq_domain(fwnode,
-						    &xilinx_msi_domain_info,
-						    msi->dev_domain);
-	if (!msi->msi_domain)
-		goto out;
-
 	mutex_init(&msi->lock);
 	msi->bitmap =3D kzalloc(size, GFP_KERNEL);
 	if (!msi->bitmap)
--=20
2.39.5


