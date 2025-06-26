Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA97C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuMVdg23Oax31eHAYNJWO0f1sJw7nfFbv3FXtJpw6XA=; b=lAH0yDVbzX8bZV5pMvWflJZH8e
	OlUPcIk4/rYAVMP9Vby8DMuqJZQm+bf5EmvM//W/YgG7UA3u9p0SsQx1x9d3Xg+zonuQB16FeSJJ2
	s87OcU+qt1JDxVUPkiXjLiOUlshO6RbEW847BOv549SJ/nctTIZEOZziS+LsnJ10Od30ZARu8IO04
	/ay5G8mO6ZGmpKZCCRDhNMTuZJu6hYBLxVN0Ae1pWxeyBlfaf/kmLFN074pTL7OQ/TFbPXaDTFiCp
	yjz+TlNKzQqBnYcdEg3RilAdWmcTbRxiMc67wxfr2tMdc+rVFLDLa6EqRGttg/Yqsf2f/EmZEMx3K
	2hhhydDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoQw-0000000C6Ii-33GM;
	Thu, 26 Jun 2025 15:22:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuG-0000000Bzea-2pbP;
	Thu, 26 Jun 2025 14:48:54 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HuMVdg23Oax31eHAYNJWO0f1sJw7nfFbv3FXtJpw6XA=;
	b=jS5Tbfifv93Qru5YKGT/U+gezPnJHb1x+nNDHqcQfHTx3E/Xs61fNnDux7/ZZvlY7RMI0w
	uSo5MV5Kk0A3HCyKQYX1WCTKHGXa0h7wHSPkD3gTavvst3umEuyw1ni092MhQv+kgEC2jL
	fJzng7LspGRbHG0/1suxZndjLQeQT+rqEnz3YDXjwfDoL9L1uauLkeobqTRmo8qUV7SJV+
	K5TlYR111v8aRuzsyBUUUgmp0qXQaE6IEbdRgwRc4tRR8PQ+pqrfYDt9AwXMEZMxCeEktA
	W5OmIJC31+aMKNDFXn56e10TjCREXKxQYgylCo7spE9BSemzEw22Nw/Hyv4ylg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HuMVdg23Oax31eHAYNJWO0f1sJw7nfFbv3FXtJpw6XA=;
	b=J5+6Hx4DqMJtrLH7epLeuB/YrIrxmarnZbHXYwq68x+t+NWfBllEiTdEWkArCOxQZpkf2B
	ft3Uj6iPbReoL6CA==
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
Subject: [PATCH 13/16] PCI: plda: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:48:03 +0200
Message-Id: <1279fe6500a1d8135d8f5feb2f055df008746c88.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074852_865785_DD237B29 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: Daire McNamara <daire.mcnamara@microchip.com>
---
 drivers/pci/controller/plda/Kconfig          |  1 +
 drivers/pci/controller/plda/pcie-plda-host.c | 44 ++++++++++----------
 drivers/pci/controller/plda/pcie-plda.h      |  1 -
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/plda/Kconfig b/drivers/pci/controller/p=
lda/Kconfig
index c0e14146d7e45..62120101139cb 100644
--- a/drivers/pci/controller/plda/Kconfig
+++ b/drivers/pci/controller/plda/Kconfig
@@ -5,6 +5,7 @@ menu "PLDA-based PCIe controllers"
=20
 config PCIE_PLDA_HOST
 	bool
+	select IRQ_MSI_LIB
=20
 config PCIE_MICROCHIP_HOST
 	tristate "Microchip AXI PCIe controller"
diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/con=
troller/plda/pcie-plda-host.c
index 3abedf723215c..92866840875e3 100644
--- a/drivers/pci/controller/plda/pcie-plda-host.c
+++ b/drivers/pci/controller/plda/pcie-plda-host.c
@@ -11,6 +11,7 @@
 #include <linux/align.h>
 #include <linux/bitfield.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <linux/pci_regs.h>
@@ -134,17 +135,19 @@ static const struct irq_domain_ops msi_domain_ops =3D=
 {
 	.free	=3D plda_irq_msi_domain_free,
 };
=20
-static struct irq_chip plda_msi_irq_chip =3D {
-	.name =3D "PLDA PCIe MSI",
-	.irq_ack =3D irq_chip_ack_parent,
-	.irq_mask =3D pci_msi_mask_irq,
-	.irq_unmask =3D pci_msi_unmask_irq,
-};
-
-static struct msi_domain_info plda_msi_domain_info =3D {
-	.flags =3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		 MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX,
-	.chip =3D &plda_msi_irq_chip,
+#define PLDA_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
+				 MSI_FLAG_USE_DEF_CHIP_OPS	| \
+				 MSI_FLAG_NO_AFFINITY)
+#define PLDA_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK	| \
+				  MSI_FLAG_PCI_MSIX)
+
+static const struct msi_parent_ops plda_msi_parent_ops =3D {
+	.required_flags		=3D PLDA_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D PLDA_MSI_FLAGS_SUPPORTED,
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_ACK,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.prefix			=3D "PLDA-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
 static int plda_allocate_msi_domains(struct plda_pcie_rp *port)
@@ -155,21 +158,19 @@ static int plda_allocate_msi_domains(struct plda_pcie=
_rp *port)
=20
 	mutex_init(&port->msi.lock);
=20
-	msi->dev_domain =3D irq_domain_create_linear(NULL, msi->num_vectors, &msi=
_domain_ops, port);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.ops		=3D &msi_domain_ops,
+		.host_data	=3D port,
+		.size		=3D msi->num_vectors,
+	};
+
+	msi->dev_domain =3D msi_create_parent_irq_domain(&info, &plda_msi_parent_=
ops);
 	if (!msi->dev_domain) {
 		dev_err(dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
 	}
=20
-	msi->msi_domain =3D pci_msi_create_irq_domain(fwnode,
-						    &plda_msi_domain_info,
-						    msi->dev_domain);
-	if (!msi->msi_domain) {
-		dev_err(dev, "failed to create MSI domain\n");
-		irq_domain_remove(msi->dev_domain);
-		return -ENOMEM;
-	}
-
 	return 0;
 }
=20
@@ -563,7 +564,6 @@ static void plda_pcie_irq_domain_deinit(struct plda_pci=
e_rp *pcie)
 	irq_set_chained_handler_and_data(pcie->msi_irq, NULL, NULL);
 	irq_set_chained_handler_and_data(pcie->intx_irq, NULL, NULL);
=20
-	irq_domain_remove(pcie->msi.msi_domain);
 	irq_domain_remove(pcie->msi.dev_domain);
=20
 	irq_domain_remove(pcie->intx_domain);
diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controll=
er/plda/pcie-plda.h
index 61ece26065ea0..6b8665df7bf0f 100644
--- a/drivers/pci/controller/plda/pcie-plda.h
+++ b/drivers/pci/controller/plda/pcie-plda.h
@@ -164,7 +164,6 @@ struct plda_pcie_host_ops {
=20
 struct plda_msi {
 	struct mutex lock;		/* Protect used bitmap */
-	struct irq_domain *msi_domain;
 	struct irq_domain *dev_domain;
 	u32 num_vectors;
 	u64 vector_phy;
--=20
2.39.5


