Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BDFC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ditblTcZWn/hLq3noPG8h3VqVahq3cequ10qfherkGM=; b=cZp1hfGWCmYfn99R2Yc7caFmBD
	dvR7B271rnBoMKfa0KA5G+rGPmrdsl25RKbAizpZQ2NJFjG5aQqMs+m8U/q5jTz/6H3TnLmffXunu
	xzgeKxoD7BWVqk95on61QciOko5dpWp4qTngXIKG2qVyF5e/PNlUd1e9x4coBMJhiI3fr0pf4sSBg
	azD+2bnDpLIvn2s7Vri4qWrYoxjWam7qMhdsUqzHMnAR2AWFVx2lRuoKzPGX40RhaNiqXIjmtaqzl
	NriGZ+x9jC4IB2+zIyUCMUEcuR7uuAqlzE7D0uvfsWsyW7aZFj/BqIkNNAURjcCGm3cmMcVo24kay
	w5f9jbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUo15-0000000C15V-1eeB;
	Thu, 26 Jun 2025 14:55:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnu3-0000000BzUd-0GVo;
	Thu, 26 Jun 2025 14:48:40 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ditblTcZWn/hLq3noPG8h3VqVahq3cequ10qfherkGM=;
	b=Ohoigcr0rb5pIx6qw0y2lxsaVeMYasJkG7wk+QvCsLxMRJfBAaWb3cAZ/7c8tDoK4SDkDS
	8Je0WQcU77U+hwqrifMlEDpY9a2GOk/k9tlq8SImqU0h7Ml3Q3NKmW8M43v+X2X9NT1TL8
	d9EyC+Knu01unLHE0weQED2TeRC/ayeUHFVbq3z4EcjwmRcfKzcVT4RpsjoYOtf/R0VKmC
	Z2J2gwNf8f+nQpJkB1Zuj3kD6lasz12E7h+krIiHy9+ixJPWuJZwZywEteMCfkXBuWaMxR
	iYTmiGtGDAVHiflhzfyD4/olxsD9Qw6OhfCgtZjagG570GLFnicUpokwd8+LSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ditblTcZWn/hLq3noPG8h3VqVahq3cequ10qfherkGM=;
	b=nkf0SgABGViiBC0OgUJ6GiesPE6qRlOssUq/2xMsJRb5rWHbuFX2bGmaEXOFg0zU4ifu1j
	tvPVEy1w3HxMyeBA==
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
Subject: [PATCH 02/16] PCI: mobiveil: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:47:52 +0200
Message-Id: <af46c15c47a7716f7e0c50d0f7391509c95b49c2.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074839_239417_6B11A269 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 drivers/pci/controller/mobiveil/Kconfig       |  1 +
 .../controller/mobiveil/pcie-mobiveil-host.c  | 42 ++++++++++---------
 .../pci/controller/mobiveil/pcie-mobiveil.h   |  1 -
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/mobiveil/Kconfig b/drivers/pci/controll=
er/mobiveil/Kconfig
index 58ce034f701ab..c50c4625937f8 100644
--- a/drivers/pci/controller/mobiveil/Kconfig
+++ b/drivers/pci/controller/mobiveil/Kconfig
@@ -9,6 +9,7 @@ config PCIE_MOBIVEIL
 config PCIE_MOBIVEIL_HOST
 	bool
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	select PCIE_MOBIVEIL
=20
 config PCIE_LAYERSCAPE_GEN4
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers=
/pci/controller/mobiveil/pcie-mobiveil-host.c
index cd44ddb698ea2..d17e887b6b61d 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
@@ -353,16 +354,19 @@ static const struct irq_domain_ops intx_domain_ops =
=3D {
 	.map =3D mobiveil_pcie_intx_map,
 };
=20
-static struct irq_chip mobiveil_msi_irq_chip =3D {
-	.name =3D "Mobiveil PCIe MSI",
-	.irq_mask =3D pci_msi_mask_irq,
-	.irq_unmask =3D pci_msi_unmask_irq,
-};
+#define MOBIVEIL_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS		| \
+				     MSI_FLAG_USE_DEF_CHIP_OPS		| \
+				     MSI_FLAG_NO_AFFINITY)
+
+#define MOBIVEIL_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK		| \
+				      MSI_FLAG_PCI_MSIX)
=20
-static struct msi_domain_info mobiveil_msi_domain_info =3D {
-	.flags	=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX,
-	.chip	=3D &mobiveil_msi_irq_chip,
+static const struct msi_parent_ops mobiveil_msi_parent_ops =3D {
+	.required_flags		=3D MOBIVEIL_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D MOBIVEIL_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.prefix			=3D "Mobiveil-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
 static void mobiveil_compose_msi_msg(struct irq_data *data, struct msi_msg=
 *msg)
@@ -439,19 +443,17 @@ static int mobiveil_allocate_msi_domains(struct mobiv=
eil_pcie *pcie)
 	struct mobiveil_msi *msi =3D &pcie->rp.msi;
=20
 	mutex_init(&msi->lock);
-	msi->dev_domain =3D irq_domain_create_linear(NULL, msi->num_of_vectors,
-						   &msi_domain_ops, pcie);
-	if (!msi->dev_domain) {
-		dev_err(dev, "failed to create IRQ domain\n");
-		return -ENOMEM;
-	}
=20
-	msi->msi_domain =3D pci_msi_create_irq_domain(fwnode,
-						    &mobiveil_msi_domain_info,
-						    msi->dev_domain);
-	if (!msi->msi_domain) {
+	struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.ops		=3D &msi_domain_ops,
+		.host_data	=3D pcie,
+		.size		=3D msi->num_of_vectors,
+	};
+
+	msi->dev_domain =3D msi_create_parent_irq_domain(&info, &mobiveil_msi_par=
ent_ops);
+	if (!msi->dev_domain) {
 		dev_err(dev, "failed to create MSI domain\n");
-		irq_domain_remove(msi->dev_domain);
 		return -ENOMEM;
 	}
=20
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/=
controller/mobiveil/pcie-mobiveil.h
index 662f17f9bf65c..7246de6a71768 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
@@ -135,7 +135,6 @@
=20
 struct mobiveil_msi {			/* MSI information */
 	struct mutex lock;		/* protect bitmap variable */
-	struct irq_domain *msi_domain;
 	struct irq_domain *dev_domain;
 	phys_addr_t msi_pages_phys;
 	int num_of_vectors;
--=20
2.39.5


