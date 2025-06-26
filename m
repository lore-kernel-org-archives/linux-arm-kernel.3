Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73F1C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIhKQ4RQQi3D5IJg+JFkYdGIygyIoXiLyEsOtUGkCjs=; b=FA232RXmon7e8TC/wpd6GHOJW4
	wHahBC42v7lC5BcZP7Uw/6PWr+Z3uxR2R4FCFXDdRh32/96EAFJp+X4KDNLOJJyNp4GsRIfgq09Q4
	liku1iyaP/+0akG8lgdr/6k1l/MwdfZEUW2YbN9f4ZJFdiSkRgyx3K609mlAAREjpQeU6JDDCEcKZ
	dkz99hEQDFgqTTMt2iQjzrLY5g3c5enif4BMkKIZ/vv26nhUwq1nzqTKjBimROChAQ2BfA5iFLoqh
	GGy3+PWM70XiDSAWLRSxg91sbOc7rlKfVtDlQBYBQbUKaljSqrvkiZgPOC4id+QwbiLF6B1b5XEw2
	ApZmCGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUov3-0000000CBvk-2anB;
	Thu, 26 Jun 2025 15:53:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnv3-0000000C020-1jBI;
	Thu, 26 Jun 2025 14:49:42 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIhKQ4RQQi3D5IJg+JFkYdGIygyIoXiLyEsOtUGkCjs=;
	b=RM5tpvvs+MbLl9f7SQ4Y4ZdLiJ6gkF0qGYmpFYd1vgciUYEome+/nKuo3y8YNQqaRl9zlG
	vK1suWMloNhESxrs+IfhZ0Ir0uq+WbbIHtZTJ2H8ZkutgRI3Yum3zAczYWNoJ3VR71Mex6
	fsgdiE+j3itHmBfek6RXeFNDcJE66HYbToqjerqVB4SG9GKNoyqLM6ubDDe3bIVCXzYX6C
	4Ix6zqpNBaIWk0L9nYtIJstz4x+qM9MLqKMPz+0eqHFX2bnBPOr8e8oaetpxb9aab4Myd+
	l22+2HQLy3/qGyN+ylhIfZaBxzJtN+2HcbXXw2XRaqbVdVinmwc752tr4tm6OQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIhKQ4RQQi3D5IJg+JFkYdGIygyIoXiLyEsOtUGkCjs=;
	b=3g8rK+mpfrVGe4Vw+aUfM9tHYiyJfZRoezDvLVA2kq5SNuyB89vV0NChva4wdm0ota7ehM
	z4hy2jp1szfWSsCw==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 12/12] irqchip/ls-scfg-msi: Switch to use msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:49:09 +0200
Message-Id: <6d23d93fa1f1e65526698f97c9888fa5d12abc7b.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074941_591389_509EFBE6 
X-CRM114-Status: GOOD (  12.54  )
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
 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-ls-scfg-msi.c | 49 ++++++++++++++-----------------
 2 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index afd7bae30a788..f1aaf3a0fcdb0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -436,6 +436,7 @@ config LS_SCFG_MSI
 	def_bool y if SOC_LS1021A || ARCH_LAYERSCAPE
 	select IRQ_MSI_IOMMU
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
=20
 config PARTITION_PERCPU
 	bool
diff --git a/drivers/irqchip/irq-ls-scfg-msi.c b/drivers/irqchip/irq-ls-scf=
g-msi.c
index 84bc5e4b47cf5..7eca751d6548b 100644
--- a/drivers/irqchip/irq-ls-scfg-msi.c
+++ b/drivers/irqchip/irq-ls-scfg-msi.c
@@ -14,6 +14,7 @@
 #include <linux/iommu.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/of_irq.h>
 #include <linux/of_pci.h>
@@ -47,7 +48,6 @@ struct ls_scfg_msi {
 	spinlock_t		lock;
 	struct platform_device	*pdev;
 	struct irq_domain	*parent;
-	struct irq_domain	*msi_domain;
 	void __iomem		*regs;
 	phys_addr_t		msiir_addr;
 	struct ls_scfg_msi_cfg	*cfg;
@@ -57,17 +57,18 @@ struct ls_scfg_msi {
 	unsigned long		*used;
 };
=20
-static struct irq_chip ls_scfg_msi_irq_chip =3D {
-	.name =3D "MSI",
-	.irq_mask	=3D pci_msi_mask_irq,
-	.irq_unmask	=3D pci_msi_unmask_irq,
-};
-
-static struct msi_domain_info ls_scfg_msi_domain_info =3D {
-	.flags	=3D (MSI_FLAG_USE_DEF_DOM_OPS |
-		   MSI_FLAG_USE_DEF_CHIP_OPS |
-		   MSI_FLAG_PCI_MSIX),
-	.chip	=3D &ls_scfg_msi_irq_chip,
+#define MPIC_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS | \
+				 MSI_FLAG_USE_DEF_CHIP_OPS)
+#define MPIC_MSI_FLAGS_SUPPORTED (MSI_FLAG_PCI_MSIX       | \
+				  MSI_GENERIC_FLAGS_MASK)
+
+static const struct msi_parent_ops ls_scfg_msi_parent_ops =3D {
+	.required_flags		=3D MPIC_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D MPIC_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_NEXUS,
+	.bus_select_mask	=3D MATCH_PCI_MSI,
+	.prefix			=3D "MSI-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
 static int msi_affinity_flag =3D 1;
@@ -185,6 +186,7 @@ static void ls_scfg_msi_domain_irq_free(struct irq_doma=
in *domain,
 }
=20
 static const struct irq_domain_ops ls_scfg_msi_domain_ops =3D {
+	.select	=3D msi_lib_irq_domain_select,
 	.alloc	=3D ls_scfg_msi_domain_irq_alloc,
 	.free	=3D ls_scfg_msi_domain_irq_free,
 };
@@ -214,21 +216,15 @@ static void ls_scfg_msi_irq_handler(struct irq_desc *=
desc)
=20
 static int ls_scfg_msi_domains_init(struct ls_scfg_msi *msi_data)
 {
-	/* Initialize MSI domain parent */
-	msi_data->parent =3D irq_domain_create_linear(NULL,
-						    msi_data->irqs_num,
-						    &ls_scfg_msi_domain_ops,
-						    msi_data);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(msi_data->pdev->dev.of_node),
+		.ops		=3D &ls_scfg_msi_domain_ops,
+		.host_data	=3D msi_data,
+		.size		=3D msi_data->irqs_num,
+	};
+
+	msi_data->parent =3D msi_create_parent_irq_domain(&info, &ls_scfg_msi_par=
ent_ops);
 	if (!msi_data->parent) {
-		dev_err(&msi_data->pdev->dev, "failed to create IRQ domain\n");
-		return -ENOMEM;
-	}
-
-	msi_data->msi_domain =3D pci_msi_create_irq_domain(
-				of_fwnode_handle(msi_data->pdev->dev.of_node),
-				&ls_scfg_msi_domain_info,
-				msi_data->parent);
-	if (!msi_data->msi_domain) {
 		dev_err(&msi_data->pdev->dev, "failed to create MSI domain\n");
 		irq_domain_remove(msi_data->parent);
 		return -ENOMEM;
@@ -405,7 +401,6 @@ static void ls_scfg_msi_remove(struct platform_device *=
pdev)
 	for (i =3D 0; i < msi_data->msir_num; i++)
 		ls_scfg_msi_teardown_hwirq(&msi_data->msir[i]);
=20
-	irq_domain_remove(msi_data->msi_domain);
 	irq_domain_remove(msi_data->parent);
=20
 	platform_set_drvdata(pdev, NULL);
--=20
2.39.5


