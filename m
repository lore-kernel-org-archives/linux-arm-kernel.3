Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E596D41149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKX9tKlLFd9yZ9qQhjwkPKYRIBNTll1YOBUjMA40ICw=; b=JFPuQzqDNLeCP6mN4bJWaKu4Uf
	n2S2b5WmctlIt7GHWUAqvCGb4uSnUZXH+VB1JKnuc2TiP8xpiE77J4EVWM2NUiHnf6M4+b1uhGVWA
	/isQvasKZCkU1X6+nXLl/9uSUkplw3IaSI+f17k57jkW4CDHLqsj76TOsW55nbZlEYD8A5RQ6iy8n
	KEApmElrrv866nw4gfDWamiV6dOMywmOmvcO+kHWNwdKuTD+b7X28UA4yk01rryJZCO7dUqsHjpBy
	SS4ygcyxArBtDqn7x+HHy80cAInD/pNWAwx11mfDrdeShuOORT6KlhBYI2OKUevkGw0tZ2p/tOkfy
	JrBPlKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgK0d-0000000C6Am-3pBN;
	Thu, 15 Jan 2026 09:51:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgK0b-0000000C69j-27qb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 09:51:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C138543BF0;
	Thu, 15 Jan 2026 09:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B51C116D0;
	Thu, 15 Jan 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768470676;
	bh=aTM+15MuMBWcKYpMkd2t27DnfiaoGuCnRx72X7ugcxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EuVCJ74vrP6Po2rDh46/ZydRo60pFY8Gpd13cGcWTBD2XMDvrqIkdbZzt1V7L26LN
	 BNC2WOLZxdEBp1kaG7vDtS9+ha+T4iaL4SwN+jPWz9bFP7n5WEuhLoqdykUfQiilxG
	 bDf8ihLDNuJ5vDrKEiLbQE+KIe4s8dwDNZ4lK2wrKbBkdwhsP0JZ8Y2Wo5bjoQFr0D
	 yRULNNzWN55GiW214LnBVTcTqmO51xV1YHeD9KftUqy0B6aUZ3JZ4bsj8q8ZGDbgRM
	 /F2xH7sIGV1JPK5BxiFPnOpNunl+Lot7IM+H863EC5Ea2FYx9qrhIgxrRJQPzMj9xN
	 Eb5GnJdvPWUrg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 15 Jan 2026 10:50:48 +0100
Subject: [PATCH v3 2/6] PCI/MSI: Make the pci_msi_map_rid_ctlr_node()
 interface firmware agnostic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-gicv5-host-acpi-v3-2-c13a9a150388@kernel.org>
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
In-Reply-To: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_015117_597059_AF423F89 
X-CRM114-Status: GOOD (  17.54  )
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-its-msi-parent.c |  8 ++++----
 drivers/pci/msi/irqdomain.c              | 21 ++++++++++++++++-----
 include/linux/msi.h                      |  3 ++-
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index 12f45228c867..4d1ad1ee005d 100644
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
index a329060287b5..3a4038640fda 100644
--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -376,23 +376,34 @@ u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
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
 	u32 rid = pci_dev_id(pdev);
 
 	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
 
-	return of_msi_xlate(&pdev->dev, node, rid);
+	/* Check whether the domain fwnode is an OF node */
+	if (irq_domain_get_of_node(domain)) {
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
index 8003e3218c46..8ddb05d5c96a 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -702,7 +702,8 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
 void pci_msi_mask_irq(struct irq_data *data);
 void pci_msi_unmask_irq(struct irq_data *data);
 u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
-u32 pci_msi_map_rid_ctlr_node(struct pci_dev *pdev, struct device_node **node);
+u32 pci_msi_map_rid_ctlr_node(struct irq_domain *domain, struct pci_dev *pdev,
+			      struct fwnode_handle **node);
 struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
 void pci_msix_prepare_desc(struct irq_domain *domain, msi_alloc_info_t *arg,
 			   struct msi_desc *desc);

-- 
2.50.1


