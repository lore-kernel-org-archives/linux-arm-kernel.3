Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDD2C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rk3H9RFUvmNY5RjaBgBDpAsPmWU5zFd/wV/8KHcc9Jo=; b=jQ9VEk1BefPuUWZuQMVySDsPCt
	hP7rtY/oPXR+l3PHyiaUDlx2WsjsGZy+BmQF33XQKweRCRxF3gCO6hErSigqCvzMurSPHxW+tz49E
	Ip8qoozaNUytS93pxUWA8Pdp5iuZ1BDsQnNIhsdWgWWL789pcOkXznbtqy24wiZFT0Qrnepry/ei/
	8/bNO/2iSG/YVLZikMnqqsspzdH9G4DeEmysBUowrel0BAqX+yQUwzuqi/Kfzf+tXYzmP5YqzjCBo
	cbCRdyZZzgQ4HL+uNAUZgXCey2q4/yNVJKRFHLMepbCp4MU1+sIFZ7bPrM738OO2x3AqkNmeFCiCm
	/7kCu1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoXk-0000000C7LP-2kL6;
	Thu, 26 Jun 2025 15:29:40 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuK-0000000Bzhx-0i3Y;
	Thu, 26 Jun 2025 14:48:57 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rk3H9RFUvmNY5RjaBgBDpAsPmWU5zFd/wV/8KHcc9Jo=;
	b=RlTKpMxpW+z/7WVrkiJLnaoM+T8aKE7F9Fxvdo4ZiVh+UwdjxDnea2IT+M5+yQRLqIewev
	sJU/BI4rqcxBcntnPbX3PmMDEAWXWUiXdyyBrPdUsspyDfqvdfInE4/j7YOBc+Gza8VGAj
	d+nZhlc/U/9ekHNN3JyfP5c5meZ4eMZPsejf14KhqdDy6HlTLUyBBDP+NleBfX4yCwfbn8
	MjUJss2vs5mWkIlQDqn5qjKFyD27MeUVQGHuiS06M+wAzHqnRHmVYCp9LOM8cTUcJaYUK5
	FsqoQohWIApoUBswBwQ5NNi2Z7TLM+ss9v+5vJLu3OK5xF5o8VggDgM81qf1nQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rk3H9RFUvmNY5RjaBgBDpAsPmWU5zFd/wV/8KHcc9Jo=;
	b=PJDuAZfuBgWAnsvNtnV4iMVqFsZvxtIfRFTbFJ3+oao6m90FOulpO3WQMdJFoFhXE6NATR
	O57SQu4FvAsl51Bw==
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
Subject: [PATCH 16/16] PCI: vmd: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:48:06 +0200
Message-Id: <de3f1d737831b251e9cd2cbf9e4c732a5bbba13a.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074856_372188_F2A1E6C2 
X-CRM114-Status: GOOD (  18.92  )
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
Cc: Nirmal Patel <nirmal.patel@linux.intel.com>
Cc: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 drivers/pci/controller/Kconfig |   1 +
 drivers/pci/controller/vmd.c   | 160 +++++++++++++++++----------------
 2 files changed, 82 insertions(+), 79 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 8f56ffd029ba2..41748d083b933 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -156,6 +156,7 @@ config PCI_IXP4XX
 config VMD
 	depends on PCI_MSI && X86_64 && !UML
 	tristate "Intel Volume Management Device Driver"
+	select IRQ_MSI_LIB
 	help
 	  Adds support for the Intel Volume Management Device (VMD). VMD is a
 	  secondary PCI host bridge that allows PCI Express root ports,
diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index d9b893bf4e456..38693a9487d9b 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/msi.h>
@@ -174,9 +175,6 @@ static void vmd_compose_msi_msg(struct irq_data *data, =
struct msi_msg *msg)
 	msg->arch_addr_lo.destid_0_7 =3D index_from_irqs(vmd, irq);
 }
=20
-/*
- * We rely on MSI_FLAG_USE_DEF_CHIP_OPS to set the IRQ mask/unmask ops.
- */
 static void vmd_irq_enable(struct irq_data *data)
 {
 	struct vmd_irq *vmdirq =3D data->chip_data;
@@ -186,7 +184,11 @@ static void vmd_irq_enable(struct irq_data *data)
 		list_add_tail_rcu(&vmdirq->node, &vmdirq->irq->irq_list);
 		vmdirq->enabled =3D true;
 	}
+}
=20
+static void vmd_pci_msi_enable(struct irq_data *data)
+{
+	vmd_irq_enable(data->parent_data);
 	data->chip->irq_unmask(data);
 }
=20
@@ -194,8 +196,6 @@ static void vmd_irq_disable(struct irq_data *data)
 {
 	struct vmd_irq *vmdirq =3D data->chip_data;
=20
-	data->chip->irq_mask(data);
-
 	scoped_guard(raw_spinlock_irqsave, &list_lock) {
 		if (vmdirq->enabled) {
 			list_del_rcu(&vmdirq->node);
@@ -204,19 +204,17 @@ static void vmd_irq_disable(struct irq_data *data)
 	}
 }
=20
+static void vmd_pci_msi_disable(struct irq_data *data)
+{
+	data->chip->irq_mask(data);
+	vmd_irq_disable(data->parent_data);
+}
+
 static struct irq_chip vmd_msi_controller =3D {
 	.name			=3D "VMD-MSI",
-	.irq_enable		=3D vmd_irq_enable,
-	.irq_disable		=3D vmd_irq_disable,
 	.irq_compose_msi_msg	=3D vmd_compose_msi_msg,
 };
=20
-static irq_hw_number_t vmd_get_hwirq(struct msi_domain_info *info,
-				     msi_alloc_info_t *arg)
-{
-	return 0;
-}
-
 /*
  * XXX: We can be even smarter selecting the best IRQ once we solve the
  * affinity problem.
@@ -250,100 +248,110 @@ static struct vmd_irq_list *vmd_next_irq(struct vmd=
_dev *vmd, struct msi_desc *d
 	return &vmd->irqs[best];
 }
=20
-static int vmd_msi_init(struct irq_domain *domain, struct msi_domain_info =
*info,
-			unsigned int virq, irq_hw_number_t hwirq,
-			msi_alloc_info_t *arg)
+static void vmd_msi_free(struct irq_domain *domain, unsigned int virq, uns=
igned int nr_irqs);
+
+static int vmd_msi_alloc(struct irq_domain *domain, unsigned int virq, uns=
igned int nr_irqs,
+			 void *arg)
 {
-	struct msi_desc *desc =3D arg->desc;
-	struct vmd_dev *vmd =3D vmd_from_bus(msi_desc_to_pci_dev(desc)->bus);
-	struct vmd_irq *vmdirq =3D kzalloc(sizeof(*vmdirq), GFP_KERNEL);
+	struct msi_desc *desc =3D ((msi_alloc_info_t *)arg)->desc;
+	struct vmd_dev *vmd =3D domain->host_data;
+	struct vmd_irq *vmdirq;
=20
-	if (!vmdirq)
-		return -ENOMEM;
+	for (int i =3D 0; i < nr_irqs; ++i) {
+		vmdirq =3D kzalloc(sizeof(*vmdirq), GFP_KERNEL);
+		if (!vmdirq) {
+			vmd_msi_free(domain, virq, i);
+			return -ENOMEM;
+		}
=20
-	INIT_LIST_HEAD(&vmdirq->node);
-	vmdirq->irq =3D vmd_next_irq(vmd, desc);
-	vmdirq->virq =3D virq;
+		INIT_LIST_HEAD(&vmdirq->node);
+		vmdirq->irq =3D vmd_next_irq(vmd, desc);
+		vmdirq->virq =3D virq + i;
+
+		irq_domain_set_info(domain, virq + i, vmdirq->irq->virq, &vmd_msi_contro=
ller,
+				    vmdirq, handle_untracked_irq, vmd, NULL);
+	}
=20
-	irq_domain_set_info(domain, virq, vmdirq->irq->virq, info->chip, vmdirq,
-			    handle_untracked_irq, vmd, NULL);
 	return 0;
 }
=20
-static void vmd_msi_free(struct irq_domain *domain,
-			struct msi_domain_info *info, unsigned int virq)
+static void vmd_msi_free(struct irq_domain *domain, unsigned int virq, uns=
igned int nr_irqs)
 {
 	struct vmd_irq *vmdirq =3D irq_get_chip_data(virq);
=20
-	synchronize_srcu(&vmdirq->irq->srcu);
+	for (int i =3D 0; i < nr_irqs; ++i) {
+		synchronize_srcu(&vmdirq->irq->srcu);
=20
-	/* XXX: Potential optimization to rebalance */
-	scoped_guard(raw_spinlock_irq, &list_lock)
-		vmdirq->irq->count--;
+		/* XXX: Potential optimization to rebalance */
+		scoped_guard(raw_spinlock_irq, &list_lock)
+			vmdirq->irq->count--;
=20
-	kfree(vmdirq);
+		kfree(vmdirq);
+	}
 }
=20
-static int vmd_msi_prepare(struct irq_domain *domain, struct device *dev,
-			   int nvec, msi_alloc_info_t *arg)
+static const struct irq_domain_ops vmd_msi_domain_ops =3D {
+	.alloc		=3D vmd_msi_alloc,
+	.free		=3D vmd_msi_free,
+};
+
+static bool vmd_init_dev_msi_info(struct device *dev, struct irq_domain *d=
omain,
+				  struct irq_domain *real_parent, struct msi_domain_info *info)
 {
-	struct pci_dev *pdev =3D to_pci_dev(dev);
-	struct vmd_dev *vmd =3D vmd_from_bus(pdev->bus);
+	if (WARN_ON_ONCE(info->bus_token !=3D DOMAIN_BUS_PCI_DEVICE_MSIX))
+		return false;
=20
-	if (nvec > vmd->msix_count)
-		return vmd->msix_count;
+	if (!msi_lib_init_dev_msi_info(dev, domain, real_parent, info))
+		return false;
=20
-	memset(arg, 0, sizeof(*arg));
-	return 0;
+	info->chip->irq_enable		=3D vmd_pci_msi_enable;
+	info->chip->irq_disable		=3D vmd_pci_msi_disable;
+	return true;
 }
=20
-static void vmd_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
-{
-	arg->desc =3D desc;
-}
+#define VMD_MSI_FLAGS_SUPPORTED		(MSI_GENERIC_FLAGS_MASK | MSI_FLAG_PCI_MS=
IX)
+#define VMD_MSI_FLAGS_REQUIRED		(MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_NO_AF=
FINITY)
=20
-static struct msi_domain_ops vmd_msi_domain_ops =3D {
-	.get_hwirq	=3D vmd_get_hwirq,
-	.msi_init	=3D vmd_msi_init,
-	.msi_free	=3D vmd_msi_free,
-	.msi_prepare	=3D vmd_msi_prepare,
-	.set_desc	=3D vmd_set_desc,
+static const struct msi_parent_ops vmd_msi_parent_ops =3D {
+	.supported_flags	=3D VMD_MSI_FLAGS_SUPPORTED,
+	.required_flags		=3D VMD_MSI_FLAGS_REQUIRED,
+	.bus_select_token	=3D DOMAIN_BUS_VMD_MSI,
+	.bus_select_mask	=3D MATCH_PCI_MSI,
+	.prefix			=3D "VMD-",
+	.init_dev_msi_info	=3D vmd_init_dev_msi_info,
 };
=20
-static struct msi_domain_info vmd_msi_domain_info =3D {
-	.flags		=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-			  MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX,
-	.ops		=3D &vmd_msi_domain_ops,
-	.chip		=3D &vmd_msi_controller,
-};
-
-static void vmd_set_msi_remapping(struct vmd_dev *vmd, bool enable)
-{
-	u16 reg;
-
-	pci_read_config_word(vmd->dev, PCI_REG_VMCONFIG, &reg);
-	reg =3D enable ? (reg & ~VMCONFIG_MSI_REMAP) :
-		       (reg | VMCONFIG_MSI_REMAP);
-	pci_write_config_word(vmd->dev, PCI_REG_VMCONFIG, reg);
-}
-
 static int vmd_create_irq_domain(struct vmd_dev *vmd)
 {
-	struct fwnode_handle *fn;
+	struct irq_domain_info info =3D {
+		.size		=3D vmd->msix_count,
+		.ops		=3D &vmd_msi_domain_ops,
+		.host_data	=3D vmd,
+	};
=20
-	fn =3D irq_domain_alloc_named_id_fwnode("VMD-MSI", vmd->sysdata.domain);
-	if (!fn)
+	info.fwnode =3D irq_domain_alloc_named_id_fwnode("VMD-MSI", vmd->sysdata.=
domain);
+	if (!info.fwnode)
 		return -ENODEV;
=20
-	vmd->irq_domain =3D pci_msi_create_irq_domain(fn, &vmd_msi_domain_info, N=
ULL);
+	vmd->irq_domain =3D msi_create_parent_irq_domain(&info, &vmd_msi_parent_o=
ps);
 	if (!vmd->irq_domain) {
-		irq_domain_free_fwnode(fn);
+		irq_domain_free_fwnode(info.fwnode);
 		return -ENODEV;
 	}
=20
 	return 0;
 }
=20
+static void vmd_set_msi_remapping(struct vmd_dev *vmd, bool enable)
+{
+	u16 reg;
+
+	pci_read_config_word(vmd->dev, PCI_REG_VMCONFIG, &reg);
+	reg =3D enable ? (reg & ~VMCONFIG_MSI_REMAP) :
+		       (reg | VMCONFIG_MSI_REMAP);
+	pci_write_config_word(vmd->dev, PCI_REG_VMCONFIG, reg);
+}
+
 static void vmd_remove_irq_domain(struct vmd_dev *vmd)
 {
 	/*
@@ -874,12 +882,6 @@ static int vmd_enable_domain(struct vmd_dev *vmd, unsi=
gned long features)
 		ret =3D vmd_create_irq_domain(vmd);
 		if (ret)
 			return ret;
-
-		/*
-		 * Override the IRQ domain bus token so the domain can be
-		 * distinguished from a regular PCI/MSI domain.
-		 */
-		irq_domain_update_bus_token(vmd->irq_domain, DOMAIN_BUS_VMD_MSI);
 	} else {
 		vmd_set_msi_remapping(vmd, false);
 	}
--=20
2.39.5


