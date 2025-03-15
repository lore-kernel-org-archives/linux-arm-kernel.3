Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11421C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 00:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoiV8JEcZx816GDjfYuKFeROgwdDGoW/daTWcBtz3rM=; b=hbjqSzYQYO1lVfZqFtlO8eg+h8
	1yb1HGhGST84/mluIoA/8AP9LJdT/3lyXtI0/GXjotPrnO0cfrXA8aEJ97rlyBbHGgxpjdmBTFs+O
	BflDvdCqTOEKQwIOOOlEN/VgcDPofcJ1x0L4ilFDjLWju2Itrj3lYDubp2aD9De4A6FB1MJox/WHl
	K60X3mrl9wUPa50Q1WbulILDvvucJNaUmifTcytt49Zu5S6bskJ4K/ZFqJn14lBp1lI/DAhW66m69
	6lxy2ML6h+ex2lrJBiJi/25XjBDlpl90iILCN7P7AnmVigt4ZyL/Iaq0QAHnWiptTcvqZE0xRXFzo
	IGp8Ry6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFZJ-0000000Fc5k-3PRw;
	Sat, 15 Mar 2025 00:40:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFFr-0000000FZZp-0RKs
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 15 Mar 2025 00:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qoiV8JEcZx816GDjfYuKFeROgwdDGoW/daTWcBtz3rM=; b=TAPSmMHg8wbKwAegMCoRJ4n8Xv
	gVKWV8zN5SQLnN6duRdz5Y58XOaBCfw5fnA8oRuJtoxbK4yY4iHor2aYlaLQ+LAr52l59aSTj5lVJ
	HZPT1yJ0za87okyLO1oISIbvM3R4+ihiCJOCi+qIgg71XNPzkLS97DYdTsc7v14rBZ9qJ+a0LCj8P
	Y/gHyLSUO/w+R1/uV2rqN2LvqqebRf0voiSMcx5NkkGQoD4Jgp2vP4vd9CIe7rsJBEoxGPcFj0nM7
	rsQD7wpsouGrHsW3wCsYv66kSDR6Qt0OxPtDetHujr22K0sIiKcLq6dHdVgC5/PZQVbXTxmzARl7r
	c/lu7ZXA==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFFc-000000031L3-2gdD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 00:19:53 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2D77D203345A;
	Fri, 14 Mar 2025 17:19:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2D77D203345A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741997977;
	bh=qoiV8JEcZx816GDjfYuKFeROgwdDGoW/daTWcBtz3rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3YWiohiBFjX3mZopbBO+f7LIiod0cqcd08GA0nHnb92b2qf1cVESeIgVzRnJtICE
	 TWJRaKv+tXXKU2ELcaDoYzJPOLN4ldq74OV/UhrH7XHink0C1I04iurLsaZtuaS48p
	 dcto7CfDsuIy5AW4P/A10jkAPEzHzzdbum3hIyXk=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lenb@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	mingo@redhat.com,
	oliver.upton@linux.dev,
	rafael@kernel.org,
	robh@kernel.org,
	ssengar@linux.microsoft.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	yuzenghui@huawei.com,
	devicetree@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v6 11/11] PCI: hv: Get vPCI MSI IRQ domain from DeviceTree
Date: Fri, 14 Mar 2025 17:19:31 -0700
Message-ID: <20250315001931.631210-12-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250315001931.631210-1-romank@linux.microsoft.com>
References: <20250315001931.631210-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_001941_027841_65A9E79F 
X-CRM114-Status: GOOD (  16.39  )
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

The hyperv-pci driver uses ACPI for MSI IRQ domain configuration on
arm64. It won't be able to do that in the VTL mode where only DeviceTree
can be used.

Update the hyperv-pci driver to get vPCI MSI IRQ domain in the DeviceTree
case, too.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 drivers/pci/controller/pci-hyperv.c | 73 ++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index 6084b38bdda1..cbff19e8a07c 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -50,6 +50,7 @@
 #include <linux/irqdomain.h>
 #include <linux/acpi.h>
 #include <linux/sizes.h>
+#include <linux/of_irq.h>
 #include <asm/mshyperv.h>
 
 /*
@@ -817,9 +818,17 @@ static int hv_pci_vec_irq_gic_domain_alloc(struct irq_domain *domain,
 	int ret;
 
 	fwspec.fwnode = domain->parent->fwnode;
-	fwspec.param_count = 2;
-	fwspec.param[0] = hwirq;
-	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+	if (is_of_node(fwspec.fwnode)) {
+		/* SPI lines for OF translations start at offset 32 */
+		fwspec.param_count = 3;
+		fwspec.param[0] = 0;
+		fwspec.param[1] = hwirq - 32;
+		fwspec.param[2] = IRQ_TYPE_EDGE_RISING;
+	} else {
+		fwspec.param_count = 2;
+		fwspec.param[0] = hwirq;
+		fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+	}
 
 	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
 	if (ret)
@@ -887,10 +896,47 @@ static const struct irq_domain_ops hv_pci_domain_ops = {
 	.activate = hv_pci_vec_irq_domain_activate,
 };
 
+#ifdef CONFIG_OF
+
+static struct irq_domain *hv_pci_of_irq_domain_parent(void)
+{
+	struct device_node *parent;
+	struct irq_domain *domain;
+
+	parent = of_irq_find_parent(hv_get_vmbus_root_device()->of_node);
+	if (!parent)
+		return NULL;
+	domain = irq_find_host(parent);
+	of_node_put(parent);
+
+	return domain;
+}
+
+#endif
+
+#ifdef CONFIG_ACPI
+
+static struct irq_domain *hv_pci_acpi_irq_domain_parent(void)
+{
+	struct irq_domain *domain;
+	acpi_gsi_domain_disp_fn gsi_domain_disp_fn;
+
+	if (acpi_irq_model != ACPI_IRQ_MODEL_GIC)
+		return NULL;
+	gsi_domain_disp_fn = acpi_get_gsi_dispatcher();
+	if (!gsi_domain_disp_fn)
+		return NULL;
+	return irq_find_matching_fwnode(gsi_domain_disp_fn(0),
+				     DOMAIN_BUS_ANY);
+}
+
+#endif
+
 static int hv_pci_irqchip_init(void)
 {
 	static struct hv_pci_chip_data *chip_data;
 	struct fwnode_handle *fn = NULL;
+	struct irq_domain *irq_domain_parent = NULL;
 	int ret = -ENOMEM;
 
 	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
@@ -907,9 +953,24 @@ static int hv_pci_irqchip_init(void)
 	 * way to ensure that all the corresponding devices are also gone and
 	 * no interrupts will be generated.
 	 */
-	hv_msi_gic_irq_domain = acpi_irq_create_hierarchy(0, HV_PCI_MSI_SPI_NR,
-							  fn, &hv_pci_domain_ops,
-							  chip_data);
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		irq_domain_parent = hv_pci_acpi_irq_domain_parent();
+#endif
+#if defined(CONFIG_OF)
+	if (!irq_domain_parent)
+		irq_domain_parent = hv_pci_of_irq_domain_parent();
+#endif
+	if (!irq_domain_parent) {
+		WARN_ONCE(1, "Invalid firmware configuration for VMBus interrupts\n");
+		ret = -EINVAL;
+		goto free_chip;
+	}
+
+	hv_msi_gic_irq_domain = irq_domain_create_hierarchy(
+		irq_domain_parent, 0, HV_PCI_MSI_SPI_NR,
+		fn, &hv_pci_domain_ops,
+		chip_data);
 
 	if (!hv_msi_gic_irq_domain) {
 		pr_err("Failed to create Hyper-V arm64 vPCI MSI IRQ domain\n");
-- 
2.43.0


