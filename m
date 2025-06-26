Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE64C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1HFdhwqd5DC6x8p3yCFzDP+yibNrfGuiCrnn0yz6t0=; b=LcTLN3cwZXzSLqwMUIgepdV7BR
	4ldRGXNqLKKj9e6vkL495fd/m4UkuQqymEP10kyDv6a4BzDsm0phVzYUkzdVBzneXOdWTqQIiAdxI
	a9QSe/DAaM0zf2ws5jOYhL+hSqEYLnSyK8RMzZG3OrpIzFDs7jDy6tSP6Rf28b5hZs/cDBgAJhSBo
	Hq+qtFx4900TvuVRtnnm7y+J42ooXFxxeMmYYGq5GCas+TGzcjAMaPiuWIvT85KLPwAifm2DIUhlB
	mHUWTmQUFaaii3IfQNSLejDBP0CkCLYnwqVJyhhha9Kalnbgug3w1taqH+yog7HX4vuxc5spMpSEU
	WlhLVMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUo8F-0000000C2eT-1RsV;
	Thu, 26 Jun 2025 15:03:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnu8-0000000BzYG-0FeO;
	Thu, 26 Jun 2025 14:48:45 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1HFdhwqd5DC6x8p3yCFzDP+yibNrfGuiCrnn0yz6t0=;
	b=nAcwHyaSN7nhBtD3lVXi6SlAK9Z0rKWn5zhGfVT6S7Fh3m9j14eeUWihriCspaY4jFk61c
	kn2ZAhYqva6qMParMQynIJrLB2fkyzHpeXgrxriK8hgkbK85MyZluRYhI35cnh8jrdwKVc
	qKBzPkZTPzC+/hylZc6YzsCqO/3QzRfrotYTHjFvN/wkt0LyLIlwu9fBn+kkk/M670es88
	z/ioGfJnxur6VKZie0ILYugjqvJwWjho3FvrVQl7eIR7m72HpnC8L7mjToCscML0VrfezZ
	7EnDbFFvMCw44S649jKQzgxjvpQ0j0dJ934nzEUrCeA0BH41DCPMl859e+wwaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1HFdhwqd5DC6x8p3yCFzDP+yibNrfGuiCrnn0yz6t0=;
	b=jTJGcSNKw/2f2IkZrgSgkpUrKrbs8MVtkmvUc2qvgUskXQRgX2dhgD0FYSNtv0hr+TOjO+
	PkkQUPYCny+aD2Ag==
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
Subject: [PATCH 06/16] PCI: iproc: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:47:56 +0200
Message-Id: <53946d74caf1fd134a1820eac82c3cf64d48779f.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074844_238308_15DB4ED8 
X-CRM114-Status: GOOD (  12.99  )
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
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom=
.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/Kconfig          |  1 +
 drivers/pci/controller/pcie-iproc-msi.c | 45 ++++++++++++-------------
 2 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 0f6cec244d4fa..375a019f35bd9 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -101,6 +101,7 @@ config PCIE_IPROC_MSI
 	bool "Broadcom iProc PCIe MSI support"
 	depends on PCIE_IPROC_PLATFORM || PCIE_IPROC_BCMA
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	default ARCH_BCM_IPROC
 	help
 	  Say Y here if you want to enable MSI support for Broadcom's iProc
diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controll=
er/pcie-iproc-msi.c
index d2cb4c4f821af..d0c7f004217fb 100644
--- a/drivers/pci/controller/pcie-iproc-msi.c
+++ b/drivers/pci/controller/pcie-iproc-msi.c
@@ -5,6 +5,7 @@
=20
 #include <linux/interrupt.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <linux/of_irq.h>
@@ -101,7 +102,6 @@ struct iproc_msi {
 	struct mutex bitmap_lock;
 	unsigned int nr_msi_vecs;
 	struct irq_domain *inner_domain;
-	struct irq_domain *msi_domain;
 	unsigned int nr_eq_region;
 	unsigned int nr_msi_region;
 	void *eq_cpu;
@@ -165,16 +165,18 @@ static inline unsigned int iproc_msi_eq_offset(struct=
 iproc_msi *msi, u32 eq)
 		return eq * EQ_LEN * sizeof(u32);
 }
=20
-static struct irq_chip iproc_msi_irq_chip =3D {
-	.name =3D "iProc-MSI",
+#define IPROC_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
+				  MSI_FLAG_USE_DEF_CHIP_OPS)
+#define IPROC_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK	| \
+				   MSI_FLAG_PCI_MSIX)
+
+static struct msi_parent_ops iproc_msi_parent_ops =3D {
+	.required_flags		=3D IPROC_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D IPROC_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.prefix			=3D "iProc-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
-
-static struct msi_domain_info iproc_msi_domain_info =3D {
-	.flags =3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		MSI_FLAG_PCI_MSIX,
-	.chip =3D &iproc_msi_irq_chip,
-};
-
 /*
  * In iProc PCIe core, each MSI group is serviced by a GIC interrupt and a
  * dedicated event queue.  Each MSI group can support up to 64 MSI vectors.
@@ -446,27 +448,22 @@ static void iproc_msi_disable(struct iproc_msi *msi)
 static int iproc_msi_alloc_domains(struct device_node *node,
 				   struct iproc_msi *msi)
 {
-	msi->inner_domain =3D irq_domain_create_linear(NULL, msi->nr_msi_vecs,
-						     &msi_domain_ops, msi);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(node),
+		.ops		=3D &msi_domain_ops,
+		.host_data	=3D msi,
+		.size		=3D msi->nr_msi_vecs,
+	};
+
+	msi->inner_domain =3D msi_create_parent_irq_domain(&info, &iproc_msi_pare=
nt_ops);
 	if (!msi->inner_domain)
 		return -ENOMEM;
=20
-	msi->msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(node),
-						    &iproc_msi_domain_info,
-						    msi->inner_domain);
-	if (!msi->msi_domain) {
-		irq_domain_remove(msi->inner_domain);
-		return -ENOMEM;
-	}
-
 	return 0;
 }
=20
 static void iproc_msi_free_domains(struct iproc_msi *msi)
 {
-	if (msi->msi_domain)
-		irq_domain_remove(msi->msi_domain);
-
 	if (msi->inner_domain)
 		irq_domain_remove(msi->inner_domain);
 }
@@ -542,7 +539,7 @@ int iproc_msi_init(struct iproc_pcie *pcie, struct devi=
ce_node *node)
 	msi->nr_cpus =3D num_possible_cpus();
=20
 	if (msi->nr_cpus =3D=3D 1)
-		iproc_msi_domain_info.flags |=3D  MSI_FLAG_MULTI_PCI_MSI;
+		iproc_msi_parent_ops.supported_flags |=3D MSI_FLAG_MULTI_PCI_MSI;
=20
 	msi->nr_irqs =3D of_irq_count(node);
 	if (!msi->nr_irqs) {
--=20
2.39.5


