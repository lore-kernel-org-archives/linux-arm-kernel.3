Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F740C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16TnONRAwq+ZTzIoYzgI3ljlt/3ZiyC24F9lJVwBPYM=; b=rlDBDaxBXqnv8+wKdD+yFalIk2
	NHpeG+LocqWDXCZUYKLNi440z9ps5IdLn5T+/dt/8Rs9wRXbRTh5h6PD8fKvLWE63Nd782+Gwobnu
	+g4LoWERgT6zydVKhrjEaICK/saKpa8ziS/OHc0Npt3bBVr6H3ctZ2v2KA1RTDmJagJ/gjZP2PnSD
	3sHUoKd9HQ5C5W7zNc2utt3bxRJ+oXemGp1vN9ertuL+r+QDvohQ3UD8JbzbHm2POuwNBdcnNjvui
	WF0Rpky7mxz2UVMelJ7KZWfRyd1S2R7AN7rGrhiee6snHjLnXmUaVmQRVIQbhfm4UtG/ypft0eWIs
	k7szo32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXI5r-0000000B9Ub-1dus;
	Thu, 03 Jul 2025 11:27:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHAD-0000000AzId-2M11
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:27:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 032E8613AD;
	Thu,  3 Jul 2025 10:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0268C4CEE3;
	Thu,  3 Jul 2025 10:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538452;
	bh=kcQzsER7QdASrb9daMHpXtsDHIwhK/zyXrrP1v57pPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LDiIwa/ApQJbdkfprm22n+4WcQLTw0PmULQUgVooIItke6uzDx6Ah/iZdwqiZ7nr1
	 Wjs7LgJ1ApCZT01xDU8lBh/DmFdM2BixPYAHNw31pDkBsX9C7ESIktnM7Po37jbZ4/
	 B+gEFmuepvcllGOF5Wuhjh96QGwWJsXeLj9sBvEWm1YqN9zIqy4+KBrLBSiHo3nBEC
	 Q/oJauRvHzdIrWigLwPbIMRqiuoNSEdcBosNKfioan6MDwsFkerl2GVkSgIpFw9/r6
	 7S0xiV4sP/xT7t/p0dlEDUZr15MhQqwF5vfJPlgN6tb2ckGhNLpVoT06++MzI4Y2kV
	 sdqBVjBZk26+w==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:25:15 +0200
Subject: [PATCH v7 25/31] PCI/MSI: Add pci_msi_map_rid_ctlr_node() helper
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-25-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
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

IRQchip drivers need a PCI/MSI function to map a RID to a MSI
controller deviceID namespace and at the same time retrieve the
struct device_node pointer of the MSI controller the RID is mapped
to.

Add pci_msi_map_rid_ctlr_node() to achieve this purpose.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc  Bjorn Helgaas <bhelgaas@google.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/msi/irqdomain.c | 20 ++++++++++++++++++++
 include/linux/msi.h         |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
index c05152733993..8a6e80d3963a 100644
--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -427,6 +427,26 @@ u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
 	return rid;
 }
 
+/**
+ * pci_msi_map_rid_ctlr_node - Get the MSI controller node and MSI requester id (RID)
+ * @pdev:	The PCI device
+ * @node:	Pointer to store the MSI controller device node
+ *
+ * Use the firmware data to find the MSI controller node for @pdev.
+ * If found map the RID and initialize @node with it. @node value must
+ * be set to NULL on entry.
+ *
+ * Returns: The RID.
+ */
+u32 pci_msi_map_rid_ctlr_node(struct pci_dev *pdev, struct device_node **node)
+{
+	u32 rid = pci_dev_id(pdev);
+
+	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
+
+	return of_msi_xlate(&pdev->dev, node, rid);
+}
+
 /**
  * pci_msi_get_device_domain - Get the MSI domain for a given PCI device
  * @pdev:	The PCI device
diff --git a/include/linux/msi.h b/include/linux/msi.h
index 6863540f4b71..a418e2695b05 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -705,6 +705,7 @@ struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
 					     struct msi_domain_info *info,
 					     struct irq_domain *parent);
 u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
+u32 pci_msi_map_rid_ctlr_node(struct pci_dev *pdev, struct device_node **node);
 struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
 #else /* CONFIG_PCI_MSI */
 static inline struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev)

-- 
2.48.0


