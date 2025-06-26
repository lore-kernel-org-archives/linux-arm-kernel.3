Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF79C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1q3Tm321i/YiQ6se2Mpi9k0xPo754ttwZNnI+BcgDcU=; b=zjo58ZtbEFYDCmI0c1grOKcoix
	EFcmfn5LEgXTHHPFxyPaybxk5ijiVVuBb/fdA619yUzYLv+ndPFCARXhg1LF8fju6dsAA91slBAYk
	7RDaJsA8Vo5gKJ0DJRPTnOOGrgNYayLzMo6STH3n3QypmGplTD3T7hUqW9z8uPz1Nlz2f3OKa4BUa
	ZNuBQI2v2j2oIbNxKMy9mLOlZcj4954uVEplWGZT5meqRvVzqQDOb/s9Afw1jcSuikSVSxt2/tw+j
	D35y0oq5BYymdIo7HRbJyXCYzzcvoj6QB4aoYSnW7Z/OuiwNjI7KHrj0kjHAoz0xmyvA/Jra/bIfG
	Mj96494g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUo5p-0000000C291-2Li2;
	Thu, 26 Jun 2025 15:00:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnu6-0000000BzXJ-2Uw9;
	Thu, 26 Jun 2025 14:48:43 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1q3Tm321i/YiQ6se2Mpi9k0xPo754ttwZNnI+BcgDcU=;
	b=zluBDTwt6+ishYDs9SSlZmcV9dCi6hA+fJ6WbNYmZiyxKbwjSaC9FqfUZ/NRDAq1qDUkLn
	UFKANEGPSr9E1lmOw70PXwdygjH4HnUBedZvByy25wneU2EJ7lU4samk0+M6aEADJ4mgCp
	0N0n2FF+ChUmszWYne6X9Ipp3eoAqOWOc0vO9sQjSiRMgVXgNc3RIAZpKnsGUeKQ/gPQ8j
	t5KxBjz1+n5AfPFJW4i6/88giRqx6l5+15ivX9cNcC2aozvdJA62zB3B/ujo90qoD0vr3U
	HtznROdQqzIGUSwJbdihXm1KcF+FvJVGh0Q7OMseF4tMg6cTi4NoQhgAi7XNfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1q3Tm321i/YiQ6se2Mpi9k0xPo754ttwZNnI+BcgDcU=;
	b=L3ryjEzHx3mCEBxmCpqToPKKpKrsbQ/NsR3iVqmuT/tsDIbKaDlWvRfjmaMLKpMKBv8sLt
	014YiGk1eHrZSHDg==
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
Subject: [PATCH 05/16] PCI: brcmstb: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:47:55 +0200
Message-Id: <fa72703e06c2ee2c7554082c7152913eb0dd294f.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074842_796055_3D87B3AB 
X-CRM114-Status: GOOD (  13.56  )
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
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom=
.com>
Cc: Jim Quinlan <jim2101024@gmail.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/Kconfig        |  1 +
 drivers/pci/controller/pcie-brcmstb.c | 44 +++++++++++++--------------
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 012c18c67d9c6..0f6cec244d4fa 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -64,6 +64,7 @@ config PCIE_BRCMSTB
 		   BMIPS_GENERIC || COMPILE_TEST
 	depends on OF
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	default ARCH_BRCMSTB || BMIPS_GENERIC
 	help
 	  Say Y here to enable PCIe host controller support for
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller=
/pcie-brcmstb.c
index 744df5bd39aea..8ea75aa13130e 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -12,6 +12,7 @@
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -269,7 +270,6 @@ struct brcm_msi {
 	struct device		*dev;
 	void __iomem		*base;
 	struct device_node	*np;
-	struct irq_domain	*msi_domain;
 	struct irq_domain	*inner_domain;
 	struct mutex		lock; /* guards the alloc/free operations */
 	u64			target_addr;
@@ -469,17 +469,20 @@ static void brcm_pcie_set_outbound_win(struct brcm_pc=
ie *pcie,
 	writel(tmp, pcie->base + PCIE_MEM_WIN0_LIMIT_HI(win));
 }
=20
-static struct irq_chip brcm_msi_irq_chip =3D {
-	.name            =3D "BRCM STB PCIe MSI",
-	.irq_ack         =3D irq_chip_ack_parent,
-	.irq_mask        =3D pci_msi_mask_irq,
-	.irq_unmask      =3D pci_msi_unmask_irq,
-};
+#define BRCM_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
+				 MSI_FLAG_USE_DEF_CHIP_OPS	| \
+				 MSI_FLAG_NO_AFFINITY)
+
+#define BRCM_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK	| \
+				  MSI_FLAG_MULTI_PCI_MSI)
=20
-static struct msi_domain_info brcm_msi_domain_info =3D {
-	.flags	=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_MULTI_PCI_MSI,
-	.chip	=3D &brcm_msi_irq_chip,
+static const struct msi_parent_ops brcm_msi_parent_ops =3D {
+	.required_flags		=3D BRCM_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D BRCM_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_ACK,
+	.prefix			=3D "BRCM-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
 static void brcm_pcie_msi_isr(struct irq_desc *desc)
@@ -588,18 +591,16 @@ static int brcm_allocate_domains(struct brcm_msi *msi)
 	struct fwnode_handle *fwnode =3D of_fwnode_handle(msi->np);
 	struct device *dev =3D msi->dev;
=20
-	msi->inner_domain =3D irq_domain_create_linear(NULL, msi->nr, &msi_domain=
_ops, msi);
-	if (!msi->inner_domain) {
-		dev_err(dev, "failed to create IRQ domain\n");
-		return -ENOMEM;
-	}
+	struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.ops		=3D &msi_domain_ops,
+		.host_data	=3D msi,
+		.size		=3D msi->nr,
+	};
=20
-	msi->msi_domain =3D pci_msi_create_irq_domain(fwnode,
-						    &brcm_msi_domain_info,
-						    msi->inner_domain);
-	if (!msi->msi_domain) {
+	msi->inner_domain =3D msi_create_parent_irq_domain(&info, &brcm_msi_paren=
t_ops);
+	if (!msi->inner_domain) {
 		dev_err(dev, "failed to create MSI domain\n");
-		irq_domain_remove(msi->inner_domain);
 		return -ENOMEM;
 	}
=20
@@ -608,7 +609,6 @@ static int brcm_allocate_domains(struct brcm_msi *msi)
=20
 static void brcm_free_domains(struct brcm_msi *msi)
 {
-	irq_domain_remove(msi->msi_domain);
 	irq_domain_remove(msi->inner_domain);
 }
=20
--=20
2.39.5


