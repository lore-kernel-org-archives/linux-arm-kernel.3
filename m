Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBBCC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RiH2QS4+1kCH8P95Q5VgmocNwT6Na4BdF5l0zDeYZM=; b=ZbKKgwjjVq7b4LFzmMDuJv/wCN
	D80vK7QDM/Md5QQhezph6biIOAlvM+9AvzPMru8/fRpyVwHDMfpKW3RwL+jtfQc0vvEfII+5/I5h2
	/31Nrxq9mHcpRphYFWjj+P5UUKYSEYZoyiUpwL2+NrZY4yqYmIKF+UlmbkKA2KjxjwQy1XrPpyjPV
	2SMcIQC9rshfDgNdVHJ7C9LFVgoVnQ+VbWHnmYsC9rdf3Qeosy1CDyaxQ5iEyvf0bQ7j+9CoeMZut
	efeQZFaLVqWwk1iZkWSHlSbcxr1TuS5PuubJJ05se1hG6iT8TqvYjEhT8xNNK2ZHFAdMlBTfp2RAI
	uFlarYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoCv-0000000C3ey-0UrD;
	Thu, 26 Jun 2025 15:08:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnu4-0000000BzVu-0jw9;
	Thu, 26 Jun 2025 14:48:41 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5RiH2QS4+1kCH8P95Q5VgmocNwT6Na4BdF5l0zDeYZM=;
	b=tDOj/lplDvXLQGSlcKSnXAtVHXB9przJdn05VEr4AodvNu6nn7G+m/LLtbdiTsXdtNO37V
	Hc0CO3zx7V+e2nBt5wrqARZDEJSVXe0d/8iGpdPKDf/zck8p7UirSpNcaztpYi4qwOUyqI
	9IZ2dR/ypgSsvEXBVhgbhaPpq/yIMu2CuThyjRJ1SKMSWhy4UvbUWajsMO6xmLX3Ff0BHS
	CWxZYxxYgRn1cRwMvl7oAdocIvKe4qHfiG1qVCxBEfhHwAuDKcfVaATY1eAh7znXVLVnaS
	DK/NhDhRduxobloFua8AFbqQcrAvLZlv1BvmtqNyPVz3dY7ijOk0YZ4+vjTo9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5RiH2QS4+1kCH8P95Q5VgmocNwT6Na4BdF5l0zDeYZM=;
	b=Fs1qyOFCKC/4WHcF4TxHZZsJqfAyeWlS6E7B7hehsQ7zY4wQA+CIjWqHRq49AU4OJACbTh
	Y2v2Jw5yalA0OiCg==
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
Subject: [PATCH 03/16] PCI: aardvark: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:47:53 +0200
Message-Id: <68b2f9387bbe4f08bcd428bfab83ad1219fb8d80.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074840_357577_79C5F043 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Pali Roh=C3=A1r" <pali@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/Kconfig        |  1 +
 drivers/pci/controller/pci-aardvark.c | 59 +++++++++++----------------
 2 files changed, 24 insertions(+), 36 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 886f6f43a895f..91a2d4ffc3ac4 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -13,6 +13,7 @@ config PCI_AARDVARK
 	depends on OF
 	depends on PCI_MSI
 	select PCI_BRIDGE_EMUL
+	select IRQ_MSI_LIB
 	help
 	 Add support for Aardvark 64bit PCIe Host Controller. This
 	 controller is part of the South Bridge of the Marvel Armada
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller=
/pci-aardvark.c
index 7bac64533b143..e34bea1ff0ac6 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -278,7 +279,6 @@ struct advk_pcie {
 	struct irq_domain *irq_domain;
 	struct irq_chip irq_chip;
 	raw_spinlock_t irq_lock;
-	struct irq_domain *msi_domain;
 	struct irq_domain *msi_inner_domain;
 	raw_spinlock_t msi_irq_lock;
 	DECLARE_BITMAP(msi_used, MSI_IRQ_NUM);
@@ -1332,18 +1332,6 @@ static void advk_msi_irq_unmask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&pcie->msi_irq_lock, flags);
 }
=20
-static void advk_msi_top_irq_mask(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void advk_msi_top_irq_unmask(struct irq_data *d)
-{
-	pci_msi_unmask_irq(d);
-	irq_chip_unmask_parent(d);
-}
-
 static struct irq_chip advk_msi_bottom_irq_chip =3D {
 	.name			=3D "MSI",
 	.irq_compose_msi_msg	=3D advk_msi_irq_compose_msi_msg,
@@ -1436,17 +1424,20 @@ static const struct irq_domain_ops advk_pcie_irq_do=
main_ops =3D {
 	.xlate =3D irq_domain_xlate_onecell,
 };
=20
-static struct irq_chip advk_msi_irq_chip =3D {
-	.name		=3D "advk-MSI",
-	.irq_mask	=3D advk_msi_top_irq_mask,
-	.irq_unmask	=3D advk_msi_top_irq_unmask,
-};
-
-static struct msi_domain_info advk_msi_domain_info =3D {
-	.flags	=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_MULTI_PCI_MSI |
-		  MSI_FLAG_PCI_MSIX,
-	.chip	=3D &advk_msi_irq_chip,
+#define ADVK_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
+				 MSI_FLAG_USE_DEF_CHIP_OPS	| \
+				 MSI_FLAG_PCI_MSI_MASK_PARENT	| \
+				 MSI_FLAG_NO_AFFINITY)
+#define ADVK_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK	| \
+				  MSI_FLAG_PCI_MSIX		| \
+				  MSI_FLAG_MULTI_PCI_MSI)
+
+static const struct msi_parent_ops advk_msi_parent_ops =3D {
+	.required_flags		=3D ADVK_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D ADVK_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.prefix			=3D "advk-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
 static int advk_pcie_init_msi_irq_domain(struct advk_pcie *pcie)
@@ -1456,26 +1447,22 @@ static int advk_pcie_init_msi_irq_domain(struct adv=
k_pcie *pcie)
 	raw_spin_lock_init(&pcie->msi_irq_lock);
 	mutex_init(&pcie->msi_used_lock);
=20
-	pcie->msi_inner_domain =3D irq_domain_create_linear(NULL, MSI_IRQ_NUM,
-							  &advk_msi_domain_ops, pcie);
-	if (!pcie->msi_inner_domain)
-		return -ENOMEM;
+	struct irq_domain_info info =3D {
+		.fwnode		=3D dev_fwnode(dev),
+		.ops		=3D &advk_msi_domain_ops,
+		.host_data	=3D pcie,
+		.size		=3D MSI_IRQ_NUM,
+	};
=20
-	pcie->msi_domain =3D
-		pci_msi_create_irq_domain(dev_fwnode(dev),
-					  &advk_msi_domain_info,
-					  pcie->msi_inner_domain);
-	if (!pcie->msi_domain) {
-		irq_domain_remove(pcie->msi_inner_domain);
+	pcie->msi_inner_domain =3D msi_create_parent_irq_domain(&info, &advk_msi_=
parent_ops);
+	if (!pcie->msi_inner_domain)
 		return -ENOMEM;
-	}
=20
 	return 0;
 }
=20
 static void advk_pcie_remove_msi_irq_domain(struct advk_pcie *pcie)
 {
-	irq_domain_remove(pcie->msi_domain);
 	irq_domain_remove(pcie->msi_inner_domain);
 }
=20
--=20
2.39.5


