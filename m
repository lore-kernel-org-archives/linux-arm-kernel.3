Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2675FC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkqInNS16zeJf8CcWY1BaWW47QjVQI4uQdGTKZE1Zd0=; b=c02zlPLGeBtbg+8stTRYAOJ0tR
	PpXR2C0f5uJDveUrD9XsdcDsQJyO72FTldSUt6fK4IcytpCKcRfxq/USF0C6xOQxG8kTAE4s7Ydhz
	Envt3AysEnIXjFd44vyna8Uhm55O8eeZMTpfDR6xtEtU5+EFXzePn30KvyTAluzwwjFgneDBk9XFI
	gAnus9p/dNIJ0uT5nvuq3ukGtrgE5nbkWEnmJHNBCnwcQXW4/XNlc40E9d3DoddZl74WFmEOB6RiS
	JqbHxkr3KvnetpY+fKcshTz2tq4OrNUCGmkAQGm5FDjEKix9sEdjoQTsWabr+R+yXJ0CAX5OsLSWT
	656CBrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkzN-0000000BRhb-0gow;
	Thu, 26 Jun 2025 11:41:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjqR-0000000BHRG-2Qsg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:28:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 491F943ED2;
	Thu, 26 Jun 2025 10:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F58C4CEEB;
	Thu, 26 Jun 2025 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750933719;
	bh=2t+pbHLPg+ls2EtXz7TcnOFKUGN7yrK1ryOvzqY4j+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E9DMcGLRe97AIBUEkLyvRsSZdH5ltK5qKq0GeqGGUOf1+MZ2PhDIqxCjDq8zH7MKX
	 52Od10YyqdnvPiT+RE2PwYUerdwZ0f+Fxrh7EWhi6mDjcW7MdRPyfg+Rrv4hzEu2XX
	 xKeAxuHAzoxWhJU2ktRdAoZoV4yuHExQDUXY0JWOrEQb1hGbkUwJcsA0zB+pvaV8oj
	 d5pjMjK6ygeiXKkU9p/12auaZ+MtrA2klTgi6cUitHyF2yCJuq9nWJI+ABRuwxSjgG
	 Z4wYCgq2oBAP3s9sfj+ydGemfHKK3qmP40Zk8DDJRbjpuGcs35JG5f6j7ClvL1dc4J
	 s3CZZiokzg0RA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 26 Jun 2025 12:26:16 +0200
Subject: [PATCH v6 25/31] PCI/MSI: Add pci_msi_map_rid_ctlr_node() helper
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-gicv5-host-v6-25-48e046af4642@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
In-Reply-To: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_032839_675686_21EA5F45 
X-CRM114-Status: GOOD (  12.40  )
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


