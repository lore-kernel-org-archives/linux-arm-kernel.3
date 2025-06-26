Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F708C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjHYyX3StyvYFxHeeqv/LYhiKdcq0Fz4Fnl5MOMRvT4=; b=SnI2ztr823nLnKI8HWp2cZ2jBy
	UnhtLyc1FXKYDvQZnh3LCFeZ7fpusfjuOJIsqy8Z2CaVggyalx4pnp7EOQnAaVwCPC6Mk8JqKfcCH
	QNm/SHQvq/zguw9aQye9JJmKGkaJ/koViW4jWn+1PHo9JEPLnukrMEOsLJHVc3nCiuwnVdiKScXtg
	7g3RajeDLv8JgcA6HzxDxNuqEqiU2WGFYVlJUJtc1FQHYGyFxbxEXkhm8b1hhe6/NpOawuGd+iuDp
	4dzgkg1Z2ghzs3nusWiZm96gnDmHQaHsytgfUY1xltKXuJVcpEtLgc0e3uer9+i4GB3Fib405c0It
	Lk5IRHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUo3X-0000000C1cP-2z4I;
	Thu, 26 Jun 2025 14:58:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnu5-0000000BzWq-2B5k;
	Thu, 26 Jun 2025 14:48:42 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjHYyX3StyvYFxHeeqv/LYhiKdcq0Fz4Fnl5MOMRvT4=;
	b=m9B/zQqoyh5OBIBfLP767Uycgc3B4wnxtGmVa6xloyiaZ+mfrE6gby4HFL52ljwLh4tDWm
	DuLAA2eczy5Far/kIBkR5EHqzsu8lj0MS76mWPOzmYu7rTfL3yunnYV2mckuK/3+luKPZt
	F6eTk+CEdC9fIF0MU/Os7QyArf7sWT5O6V3EZcPQeD8KtQD4W4urK/+ID3i93Gs+G0zKeg
	syVY60Q3PIK/N9DmWuvWiRtsoOlbEC0VELDvPmA7zWrIVfoQNJHjHP123T5K/SI0ILGT/f
	3J8cYj3Ph4CEmR7FQFaY4cV5CDlgjtj651hqzYpGRAAXylALFbcVPoWRcK7UHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjHYyX3StyvYFxHeeqv/LYhiKdcq0Fz4Fnl5MOMRvT4=;
	b=hAk5Bat7znOJgAYspbl3b19fM6NZsoIgSKXAdTlOLzvTuSu67AxxQv37acwFp+sYwpfb2W
	IfKyFmv+H5BVmLDw==
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
Subject: [PATCH 04/16] PCI: altera-msi: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:47:54 +0200
Message-Id: <0a88da04bb82bd588828a7889e9d58c515ea5dbb.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074841_699419_D05192E7 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: Joyce Ooi <joyce.ooi@intel.com>
---
 drivers/pci/controller/Kconfig           |  1 +
 drivers/pci/controller/pcie-altera-msi.c | 44 +++++++++++-------------
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 91a2d4ffc3ac4..012c18c67d9c6 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -30,6 +30,7 @@ config PCIE_ALTERA_MSI
 	tristate "Altera PCIe MSI feature"
 	depends on PCIE_ALTERA
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	help
 	  Say Y here if you want PCIe MSI support for the Altera FPGA.
 	  This MSI driver supports Altera MSI to GIC controller IP.
diff --git a/drivers/pci/controller/pcie-altera-msi.c b/drivers/pci/control=
ler/pcie-altera-msi.c
index a43f21eb8fbb9..2e48acd632c57 100644
--- a/drivers/pci/controller/pcie-altera-msi.c
+++ b/drivers/pci/controller/pcie-altera-msi.c
@@ -9,6 +9,7 @@
=20
 #include <linux/interrupt.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -29,7 +30,6 @@ struct altera_msi {
 	DECLARE_BITMAP(used, MAX_MSI_VECTORS);
 	struct mutex		lock;	/* protect "used" bitmap */
 	struct platform_device	*pdev;
-	struct irq_domain	*msi_domain;
 	struct irq_domain	*inner_domain;
 	void __iomem		*csr_base;
 	void __iomem		*vector_base;
@@ -74,18 +74,20 @@ static void altera_msi_isr(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
=20
-static struct irq_chip altera_msi_irq_chip =3D {
-	.name =3D "Altera PCIe MSI",
-	.irq_mask =3D pci_msi_mask_irq,
-	.irq_unmask =3D pci_msi_unmask_irq,
-};
+#define ALTERA_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS		| \
+				   MSI_FLAG_USE_DEF_CHIP_OPS		| \
+				   MSI_FLAG_NO_AFFINITY)
=20
-static struct msi_domain_info altera_msi_domain_info =3D {
-	.flags	=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX,
-	.chip	=3D &altera_msi_irq_chip,
-};
+#define ALTERA_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK		| \
+				    MSI_FLAG_PCI_MSIX)
=20
+static const struct msi_parent_ops altera_msi_parent_ops =3D {
+	.required_flags		=3D ALTERA_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D ALTERA_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.prefix			=3D "Altera-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
+};
 static void altera_compose_msi_msg(struct irq_data *data, struct msi_msg *=
msg)
 {
 	struct altera_msi *msi =3D irq_data_get_irq_chip_data(data);
@@ -165,19 +167,16 @@ static const struct irq_domain_ops msi_domain_ops =3D=
 {
 static int altera_allocate_domains(struct altera_msi *msi)
 {
 	struct fwnode_handle *fwnode =3D of_fwnode_handle(msi->pdev->dev.of_node);
-
-	msi->inner_domain =3D irq_domain_create_linear(NULL, msi->num_of_vectors,
-					     &msi_domain_ops, msi);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.ops		=3D &msi_domain_ops,
+		.host_data	=3D msi,
+		.size		=3D msi->num_of_vectors,
+	};
+
+	msi->inner_domain =3D msi_create_parent_irq_domain(&info, &altera_msi_par=
ent_ops);
 	if (!msi->inner_domain) {
-		dev_err(&msi->pdev->dev, "failed to create IRQ domain\n");
-		return -ENOMEM;
-	}
-
-	msi->msi_domain =3D pci_msi_create_irq_domain(fwnode,
-				&altera_msi_domain_info, msi->inner_domain);
-	if (!msi->msi_domain) {
 		dev_err(&msi->pdev->dev, "failed to create MSI domain\n");
-		irq_domain_remove(msi->inner_domain);
 		return -ENOMEM;
 	}
=20
@@ -186,7 +185,6 @@ static int altera_allocate_domains(struct altera_msi *m=
si)
=20
 static void altera_free_domains(struct altera_msi *msi)
 {
-	irq_domain_remove(msi->msi_domain);
 	irq_domain_remove(msi->inner_domain);
 }
=20
--=20
2.39.5


