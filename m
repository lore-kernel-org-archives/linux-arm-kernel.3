Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA106C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkdF6/WXSmyR6CP6BJIFb/N9JSNeGtF+c34gsRTZKi8=; b=4nCSHgQfcI0ZgTUF+0vN0VgqJK
	7ABpePHDZXoUUCw6B5DCHxhHv/zwmi1e2o2YQGICd9J7y1A5hhsM90UhwVioLKrM7ZztHyElrXLI/
	bvS1W7ivWd0S2qlkNdl96bpy9Jyd2h6Xb0okc+qcrIK6fUG6TR1jGdRbWUBsE7wu7st3KRkFjgdcp
	sAsedWWYItcQgEz/mwN8kOOzQCN1jE3O4BZyDBu7nHCromNomyxMKB3Mor4+8bhPIbFkZyK1uaB8v
	YM1yAqYkeZWrdZgdhTzwKqcyrsa6Um9VRYcSK7c7vIMmJWh7fW+x64hReIdlXiQP2T6gjTspuicR7
	+FKi0XNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnyn-0000000C0gy-3KM2;
	Thu, 26 Jun 2025 14:53:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnu1-0000000BzTm-42RX;
	Thu, 26 Jun 2025 14:48:39 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TkdF6/WXSmyR6CP6BJIFb/N9JSNeGtF+c34gsRTZKi8=;
	b=gnteCw5zFdeHMYffbKs77Zh69GwMGsOSTdZ3KTKu9bnHHvg+UI8TTjsm1bM0viMJiDShza
	aHSj4YaO1m6v4p7i1grgwE7fBRLx4CCeQzmf6kbNyandbo4Zpgr9w3CjbswZG7THLUxxMU
	tHn47VGd8jdzENxHRsPOTUapQa1MzSs2OhJ/iX+WNW0T/hIzVFzypEYSMn3KyF4s4d2J2J
	9dzWuvnTDAxDp1AeJ0V8EdSG9guGrdSmpWYPNv+A7ZGvsMwlbntqFf4aYaYXiM1SpODFCB
	yTAYrXae2mcm/lgTtdI/H+hpVSPFsMfE8s8QwVjy+2Kc6uAwGToVodrJOPTXWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TkdF6/WXSmyR6CP6BJIFb/N9JSNeGtF+c34gsRTZKi8=;
	b=D0ZICz2jEObaXwCZyRm2f01Xzfxg6p3k/Gbe8jfG6SpDkTSuNsxPtcOUYG5dc4prMVSEf6
	Qh6SMuDMEIiXt6Dw==
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
Cc: Nam Cao <namcao@linutronix.de>,
	Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH 01/16] PCI: dwc: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:47:51 +0200
Message-Id: <04d4a96046490e50139826c16423954e033cdf89.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074838_158107_FD701C13 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/pci/controller/dwc/Kconfig            |  1 +
 .../pci/controller/dwc/pcie-designware-host.c | 68 +++++++------------
 drivers/pci/controller/dwc/pcie-designware.h  |  1 -
 3 files changed, 25 insertions(+), 45 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dw=
c/Kconfig
index bb95877b2c6c4..8a63e9bc0c039 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -19,6 +19,7 @@ config PCIE_DW_DEBUGFS
 config PCIE_DW_HOST
 	bool
 	select PCIE_DW
+	select IRQ_MSI_LIB
=20
 config PCIE_DW_EP
 	bool
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pc=
i/controller/dwc/pcie-designware-host.c
index 906277f9ffaf7..a953e07a68aff 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -10,6 +10,7 @@
=20
 #include <linux/iopoll.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
@@ -23,35 +24,21 @@
 static struct pci_ops dw_pcie_ops;
 static struct pci_ops dw_child_pcie_ops;
=20
-static void dw_msi_ack_irq(struct irq_data *d)
-{
-	irq_chip_ack_parent(d);
-}
-
-static void dw_msi_mask_irq(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void dw_msi_unmask_irq(struct irq_data *d)
-{
-	pci_msi_unmask_irq(d);
-	irq_chip_unmask_parent(d);
-}
-
-static struct irq_chip dw_pcie_msi_irq_chip =3D {
-	.name =3D "PCI-MSI",
-	.irq_ack =3D dw_msi_ack_irq,
-	.irq_mask =3D dw_msi_mask_irq,
-	.irq_unmask =3D dw_msi_unmask_irq,
-};
-
-static struct msi_domain_info dw_pcie_msi_domain_info =3D {
-	.flags	=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX |
-		  MSI_FLAG_MULTI_PCI_MSI,
-	.chip	=3D &dw_pcie_msi_irq_chip,
+#define DW_PCIE_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS		| \
+				    MSI_FLAG_USE_DEF_CHIP_OPS		| \
+				    MSI_FLAG_NO_AFFINITY		| \
+				    MSI_FLAG_PCI_MSI_MASK_PARENT)
+#define DW_PCIE_MSI_FLAGS_SUPPORTED (MSI_FLAG_MULTI_PCI_MSI		| \
+				     MSI_FLAG_PCI_MSIX			| \
+				     MSI_GENERIC_FLAGS_MASK)
+
+static const struct msi_parent_ops dw_pcie_msi_parent_ops =3D {
+	.required_flags		=3D DW_PCIE_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D DW_PCIE_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_ACK,
+	.prefix			=3D "DW-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
 /* MSI int handler */
@@ -228,25 +215,19 @@ int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
 	struct fwnode_handle *fwnode =3D of_fwnode_handle(pci->dev->of_node);
-
-	pp->irq_domain =3D irq_domain_create_linear(fwnode, pp->num_vectors,
-					       &dw_pcie_msi_domain_ops, pp);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.ops		=3D &dw_pcie_msi_domain_ops,
+		.size		=3D pp->num_vectors,
+		.host_data	=3D pp,
+	};
+
+	pp->irq_domain =3D msi_create_parent_irq_domain(&info, &dw_pcie_msi_paren=
t_ops);
 	if (!pp->irq_domain) {
 		dev_err(pci->dev, "Failed to create IRQ domain\n");
 		return -ENOMEM;
 	}
=20
-	irq_domain_update_bus_token(pp->irq_domain, DOMAIN_BUS_NEXUS);
-
-	pp->msi_domain =3D pci_msi_create_irq_domain(fwnode,
-						   &dw_pcie_msi_domain_info,
-						   pp->irq_domain);
-	if (!pp->msi_domain) {
-		dev_err(pci->dev, "Failed to create MSI domain\n");
-		irq_domain_remove(pp->irq_domain);
-		return -ENOMEM;
-	}
-
 	return 0;
 }
=20
@@ -260,7 +241,6 @@ static void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 							 NULL, NULL);
 	}
=20
-	irq_domain_remove(pp->msi_domain);
 	irq_domain_remove(pp->irq_domain);
 }
=20
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/con=
troller/dwc/pcie-designware.h
index ce9e18554e426..d9daee4ce220d 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -417,7 +417,6 @@ struct dw_pcie_rp {
 	const struct dw_pcie_host_ops *ops;
 	int			msi_irq[MAX_MSI_CTRLS];
 	struct irq_domain	*irq_domain;
-	struct irq_domain	*msi_domain;
 	dma_addr_t		msi_data;
 	struct irq_chip		*msi_irq_chip;
 	u32			num_vectors;
--=20
2.39.5


