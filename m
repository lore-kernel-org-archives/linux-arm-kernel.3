Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5382EC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+g8SPUov2wifU1QhFfv4IwPGImz+A+TfnYXt6pSi+Q=; b=yjQVC7SluS9Pi+KjPeWJuViH4e
	8za8N98g78n6Z9l2/7KFYRp/xiJ2Lfm5wbllPm2dIZw/O1YgHEPjoTpxaCuN3G5f6IB0FTEsb9aRh
	J4AKMTqW1vD94jikiL6ac6nFtIdL7sdxllRWB5us4ubVSGZGbnJT5RRPYGFIoSe/KrgFeltRCV2mf
	9iGt026juE08IHwU+JuG4fBR5S/Nnb0dh7+x2LwZWMw2PDcuSg3ssWKwp817WCQ3MSgCNjD+g/QxN
	mBG5qfck5wSgbkMY0GfOoQ6pULAE3sy7BIjLoSZ28uC4HoBWtVsjLCmRDLSP2erkegvwFBxleZQEt
	7dKMAIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoMF-0000000C5bK-3Qp9;
	Thu, 26 Jun 2025 15:17:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuE-0000000BzcP-225q;
	Thu, 26 Jun 2025 14:48:51 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+g8SPUov2wifU1QhFfv4IwPGImz+A+TfnYXt6pSi+Q=;
	b=H8giNEu/dcqnp89pk+8fjIcrbCfR5PNcRNovF1I3TknT+z0fyKYUMXgPDEnD03vcN7hUUJ
	8cBO9hqrZ4IcMgQ0u+58XIAV3INYBHGWy9IJSNCy7JcRsqLOsGE5e9ok8VHzRv4wdpwJQw
	ZQmGqlEdyD5P8LozMImg5hLyAdbDnMKeLc086e7oKSjgcg21Nw+HSgN8Qk5qNS9R+ACDX+
	/uy5rtXLLMNkb9X6ZKWFxK9CL53Pd+os9AFcja42aGs3QsrNYjGn/Rfuyg/PYNUjXakcER
	BUJ9UEdyGtPej3PA4Y4XDivzDkXKGwOvx4T9d+9aUZVHsDdeW7MuXrORPYqdfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+g8SPUov2wifU1QhFfv4IwPGImz+A+TfnYXt6pSi+Q=;
	b=ESyNPhNOvvh9/+CcFrVHIi30xlMa63Olqw/GhyrVxRyizpYy+LsueczDdIfbFTl2LDm0w2
	Nsp6eRGeYkOgjCDA==
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
Subject: [PATCH 11/16] PCI: xilinx-nwl: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:48:01 +0200
Message-Id: <5ac6e216bf2eaa438c8854baf2ff3e5cf0b2284f.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074850_679503_0AE075CE 
X-CRM114-Status: GOOD (  13.61  )
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
 drivers/pci/controller/Kconfig           |  1 +
 drivers/pci/controller/pcie-xilinx-nwl.c | 45 ++++++++++++------------
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index c9b6180239732..118ff622fa69e 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -342,6 +342,7 @@ config PCIE_XILINX_NWL
 	bool "Xilinx NWL PCIe controller"
 	depends on ARCH_ZYNQMP || COMPILE_TEST
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	help
 	 Say 'Y' here if you want kernel support for Xilinx
 	 NWL PCIe controller. The controller can act as Root Port
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/control=
ler/pcie-xilinx-nwl.c
index c8b05477b7198..de76c836915f0 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -145,7 +146,6 @@
 #define LINK_WAIT_USLEEP_MAX           100000
=20
 struct nwl_msi {			/* MSI information */
-	struct irq_domain *msi_domain;
 	DECLARE_BITMAP(bitmap, INT_PCI_MSI_NR);
 	struct irq_domain *dev_domain;
 	struct mutex lock;		/* protect bitmap variable */
@@ -418,19 +418,22 @@ static const struct irq_domain_ops intx_domain_ops =
=3D {
 };
=20
 #ifdef CONFIG_PCI_MSI
-static struct irq_chip nwl_msi_irq_chip =3D {
-	.name =3D "nwl_pcie:msi",
-	.irq_enable =3D pci_msi_unmask_irq,
-	.irq_disable =3D pci_msi_mask_irq,
-	.irq_mask =3D pci_msi_mask_irq,
-	.irq_unmask =3D pci_msi_unmask_irq,
-};
=20
-static struct msi_domain_info nwl_msi_domain_info =3D {
-	.flags =3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		 MSI_FLAG_NO_AFFINITY | MSI_FLAG_MULTI_PCI_MSI,
-	.chip =3D &nwl_msi_irq_chip,
+#define NWL_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
+				MSI_FLAG_USE_DEF_CHIP_OPS	| \
+				MSI_FLAG_NO_AFFINITY)
+
+#define NWL_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK		| \
+				 MSI_FLAG_MULTI_PCI_MSI)
+
+static const struct msi_parent_ops nwl_msi_parent_ops =3D {
+	.required_flags		=3D NWL_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D NWL_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.prefix			=3D "nwl-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
+
 #endif
=20
 static void nwl_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
@@ -497,20 +500,18 @@ static int nwl_pcie_init_msi_irq_domain(struct nwl_pc=
ie *pcie)
 	struct device *dev =3D pcie->dev;
 	struct fwnode_handle *fwnode =3D of_fwnode_handle(dev->of_node);
 	struct nwl_msi *msi =3D &pcie->msi;
-
-	msi->dev_domain =3D irq_domain_create_linear(NULL, INT_PCI_MSI_NR, &dev_m=
si_domain_ops, pcie);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.ops		=3D &dev_msi_domain_ops,
+		.host_data	=3D pcie,
+		.size		=3D INT_PCI_MSI_NR,
+	};
+
+	msi->dev_domain  =3D msi_create_parent_irq_domain(&info, &nwl_msi_parent_=
ops);
 	if (!msi->dev_domain) {
 		dev_err(dev, "failed to create dev IRQ domain\n");
 		return -ENOMEM;
 	}
-	msi->msi_domain =3D pci_msi_create_irq_domain(fwnode,
-						    &nwl_msi_domain_info,
-						    msi->dev_domain);
-	if (!msi->msi_domain) {
-		dev_err(dev, "failed to create msi IRQ domain\n");
-		irq_domain_remove(msi->dev_domain);
-		return -ENOMEM;
-	}
 #endif
 	return 0;
 }
--=20
2.39.5


