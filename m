Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4271CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CT38J87NFs6Am5jkDqCsL+rli3BRZ71ZnBjPKJNTSSc=; b=unSM4HCF6d+Z+K/1zmUnuLqovp
	VPR3NNOc4xce5ammK3mt0pKitZPz+h56l+Zv3/l8mc/YULDnNrNhkKN6W7ICxiRv4U7vkeCwG9wns
	DUcrMTG4wcyJ+71q/pOAXcoYGS4X+7Pqb4jx8Tj32k0EzhibFCMjvs//K4y8Uh8nPvhfk6lBFoHEM
	iQYtJuaIx5YxzOdF5hdxFnPT+t1EeYMUQXqKWMvN7vf1mwwLPBh0XzlMfqQWz1kucSsvPeFXdC4S6
	4S+arxWSxcANWVdTuO18sxV0OmkZN/wsLpHNbLDi/9W/hY7w+W0k+hkXzgJMb/PdMgKXJTaPN+BmQ
	L/CSspwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgnf-0000000Fk7K-1fXc;
	Tue, 28 Oct 2025 10:19:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgnb-0000000Fk54-0Nsf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:19:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2A7248D38;
	Tue, 28 Oct 2025 10:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C70BC116B1;
	Tue, 28 Oct 2025 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761646770;
	bh=rD3Szlqc7Z0x3k0SP/scHjSXL5BaHqvTEadpp6jc/pU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xn24dFg5oBUGL/jI1D0BK6jlkG/Lqkt3g4h92UIzYCervftU3CSzfm+GCkE3iF65g
	 dCn5C3Uq4e52R+5j64h8QkpOU6R2+ZSmbzNwBMidibn9ww8RPAh/Dnh05S1nAgTlJD
	 iGCA0bK5nhsfNdwhews0PVvyYrJgg+o4lTlJfG/QwGYu9NZNOxGEmE12VFVtDpQvSW
	 1zPXKl16InDuVofp4mzb4i5GtUjcCWv0XnQJYSpYOtWz+IDdgaxZ3xDCE/UHTEZIN5
	 EscM72yqQdV1qWLO1dSkrbyipmC78Gl4QzbIkmaaxmGOOPq2I95M3qxVy7AROo+LH6
	 1srdGbPCgBLoQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 28 Oct 2025 11:19:02 +0100
Subject: [PATCH not for merging 4/7] PCI/MSI: Make the
 pci_msi_map_rid_ctlr_node() interface firmware agnostic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-gicv5-host-acpi-v1-4-01a862feb5ca@kernel.org>
References: <20251028-gicv5-host-acpi-v1-0-01a862feb5ca@kernel.org>
In-Reply-To: <20251028-gicv5-host-acpi-v1-0-01a862feb5ca@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_031931_223997_47DFD140 
X-CRM114-Status: GOOD (  16.83  )
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

To support booting with OF and ACPI seamlessly, GIC ITS parent code
requires the PCI/MSI irqdomain layer to implement a function to retrieve
an MSI controller fwnode and map an RID in a firmware agnostic way
(ie pci_msi_map_rid_ctlr_node()).

Convert pci_msi_map_rid_ctlr_node() to an OF agnostic interface
(fwnode_handle based) and update the GIC ITS MSI parent code to reflect
the pci_msi_map_rid_ctlr_node() change.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-its-msi-parent.c |  8 ++++----
 drivers/pci/msi/irqdomain.c              | 22 +++++++++++++++++-----
 include/linux/msi.h                      |  3 ++-
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index eb1473f1448a..87b0e33870da 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -104,7 +104,7 @@ static int its_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 				  int nvec, msi_alloc_info_t *info)
 {
-	struct device_node *msi_node = NULL;
+	struct fwnode_handle *msi_node = NULL;
 	struct msi_domain_info *msi_info;
 	struct pci_dev *pdev;
 	phys_addr_t pa;
@@ -116,15 +116,15 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 
 	pdev = to_pci_dev(dev);
 
-	rid = pci_msi_map_rid_ctlr_node(pdev, &msi_node);
+	rid = pci_msi_map_rid_ctlr_node(domain->parent, pdev, &msi_node);
 	if (!msi_node)
 		return -ENODEV;
 
-	ret = its_translate_frame_address(msi_node, &pa);
+	ret = its_translate_frame_address(to_of_node(msi_node), &pa);
 	if (ret)
 		return -ENODEV;
 
-	of_node_put(msi_node);
+	fwnode_handle_put(msi_node);
 
 	/* ITS specific DeviceID */
 	info->scratchpad[0].ul = rid;
diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
index ce741ed9dc3f..d10b72aff1ee 100644
--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -466,23 +466,35 @@ u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
 }
 
 /**
- * pci_msi_map_rid_ctlr_node - Get the MSI controller node and MSI requester id (RID)
+ * pci_msi_map_rid_ctlr_node - Get the MSI controller fwnode_handle and MSI requester id (RID)
+ * @domain:	The interrupt domain
  * @pdev:	The PCI device
- * @node:	Pointer to store the MSI controller device node
+ * @node:	Pointer to store the MSI controller fwnode_handle
  *
- * Use the firmware data to find the MSI controller node for @pdev.
+ * Use the firmware data to find the MSI controller fwnode_handle for @pdev.
  * If found map the RID and initialize @node with it. @node value must
  * be set to NULL on entry.
  *
  * Returns: The RID.
  */
-u32 pci_msi_map_rid_ctlr_node(struct pci_dev *pdev, struct device_node **node)
+u32 pci_msi_map_rid_ctlr_node(struct irq_domain *domain, struct pci_dev *pdev,
+			      struct fwnode_handle **node)
 {
+	struct device_node *of_node;
 	u32 rid = pci_dev_id(pdev);
 
 	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
 
-	return of_msi_xlate(&pdev->dev, node, rid);
+	of_node = irq_domain_get_of_node(domain);
+	if (of_node) {
+		struct device_node *msi_ctlr_node = NULL;
+
+		rid = of_msi_xlate(&pdev->dev, &msi_ctlr_node, rid);
+		if (msi_ctlr_node)
+			*node = of_fwnode_handle(msi_ctlr_node);
+	}
+
+	return rid;
 }
 
 /**
diff --git a/include/linux/msi.h b/include/linux/msi.h
index d415dd15a0a9..7513db929cbc 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -705,7 +705,8 @@ struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
 					     struct msi_domain_info *info,
 					     struct irq_domain *parent);
 u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
-u32 pci_msi_map_rid_ctlr_node(struct pci_dev *pdev, struct device_node **node);
+u32 pci_msi_map_rid_ctlr_node(struct irq_domain *domain, struct pci_dev *pdev,
+			      struct fwnode_handle **node);
 struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
 void pci_msix_prepare_desc(struct irq_domain *domain, msi_alloc_info_t *arg,
 			   struct msi_desc *desc);

-- 
2.50.1


