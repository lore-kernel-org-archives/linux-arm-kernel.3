Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A28C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 01:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIGXQWp2vHYmOORROwPtmg/4obB3ld7P9a96RbaBVDE=; b=J2S3GzVy1Vb34kvaR26hw85vvd
	H9dmv2cBJguiRpNGD+uXs34rFn4qRNHzpG8AhqjeEQhXmfIiF8cUZwR3HECtKm7igLQRCYEl6CUAZ
	xJEXYQKq718MVnYVkTdfHBbOfv+gCg++PxBO/XjzMc3vP5MMoMRIok7Ys8MMVWXzYrzCnJTc+apLV
	HjH7Xii50v8VRvbT9GquESsDIgd9iyT1ciqEd//ivABVsplLoDM/EocxyIu0lHNjgiJ6nK6VoUo4D
	NNBPc8UBQ71hWEPbts7I5NeqeG/hEfwhoanzLeDilfjV9ERmcxAbDoFAvtje98XxDJNxNdFUsGryb
	MHYTMiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1uz-00000005ssb-3C8S;
	Wed, 12 Feb 2025 01:52:01 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1mh-00000005r5M-1pSR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 01:43:28 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 82FD72107ABD;
	Tue, 11 Feb 2025 17:43:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 82FD72107ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739324606;
	bh=YIGXQWp2vHYmOORROwPtmg/4obB3ld7P9a96RbaBVDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qsBRk4wRIg/F/eecOTCuiulUOzMx65ifZ1ByxOQSrzspu/rEkJO3oW1OWywhgWr2d
	 6Wf+gxpOlVVo0La5ERXlCgVzaJtcAZGpmaUHYBUP2tgYOHUqc6PcnmSkFue1wUEbao
	 pDHbrSOV14fJlmri8TENZZIsfhHq119tD+uq0lLU=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mingo@redhat.com,
	robh@kernel.org,
	ssengar@linux.microsoft.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	x86@kernel.org
Cc: benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v4 6/6] PCI: hv: Get vPCI MSI IRQ domain from DeviceTree
Date: Tue, 11 Feb 2025 17:43:21 -0800
Message-ID: <20250212014321.1108840-7-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212014321.1108840-1-romank@linux.microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_174327_520603_9AA38C58 
X-CRM114-Status: GOOD (  25.47  )
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
 drivers/hv/vmbus_drv.c              | 23 ++++++----
 drivers/pci/controller/pci-hyperv.c | 69 ++++++++++++++++++++++++++---
 include/linux/hyperv.h              |  2 +
 3 files changed, 80 insertions(+), 14 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 9d0c2dbd2a69..3f0f9f01b520 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -45,7 +45,8 @@ struct vmbus_dynid {
 	struct hv_vmbus_device_id id;
 };
 
-static struct device  *hv_dev;
+/* VMBus Root Device */
+static struct device  *vmbus_root_device;
 
 static int hyperv_cpuhp_online;
 
@@ -80,9 +81,15 @@ static struct resource *fb_mmio;
 static struct resource *hyperv_mmio;
 static DEFINE_MUTEX(hyperv_mmio_lock);
 
+struct device *hv_get_vmbus_root_device(void)
+{
+	return vmbus_root_device;
+}
+EXPORT_SYMBOL_GPL(hv_get_vmbus_root_device);
+
 static int vmbus_exists(void)
 {
-	if (hv_dev == NULL)
+	if (vmbus_root_device == NULL)
 		return -ENODEV;
 
 	return 0;
@@ -861,7 +868,7 @@ static int vmbus_dma_configure(struct device *child_device)
 	 * On x86/x64 coherence is assumed and these calls have no effect.
 	 */
 	hv_setup_dma_ops(child_device,
-		device_get_dma_attr(hv_dev) == DEV_DMA_COHERENT);
+		device_get_dma_attr(vmbus_root_device) == DEV_DMA_COHERENT);
 	return 0;
 }
 
@@ -1920,7 +1927,7 @@ int vmbus_device_register(struct hv_device *child_device_obj)
 		     &child_device_obj->channel->offermsg.offer.if_instance);
 
 	child_device_obj->device.bus = &hv_bus;
-	child_device_obj->device.parent = hv_dev;
+	child_device_obj->device.parent = vmbus_root_device;
 	child_device_obj->device.release = vmbus_device_release;
 
 	child_device_obj->device.dma_parms = &child_device_obj->dma_parms;
@@ -2282,7 +2289,7 @@ static int vmbus_acpi_add(struct platform_device *pdev)
 	struct acpi_device *ancestor;
 	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
 
-	hv_dev = &device->dev;
+	vmbus_root_device = &device->dev;
 
 	/*
 	 * Older versions of Hyper-V for ARM64 fail to include the _CCA
@@ -2373,7 +2380,7 @@ static int vmbus_device_add(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	hv_dev = &pdev->dev;
+	vmbus_root_device = &pdev->dev;
 
 	ret = of_range_parser_init(&parser, np);
 	if (ret)
@@ -2692,7 +2699,7 @@ static int __init hv_acpi_init(void)
 	if (ret)
 		return ret;
 
-	if (!hv_dev) {
+	if (!vmbus_root_device) {
 		ret = -ENODEV;
 		goto cleanup;
 	}
@@ -2723,7 +2730,7 @@ static int __init hv_acpi_init(void)
 
 cleanup:
 	platform_driver_unregister(&vmbus_platform_driver);
-	hv_dev = NULL;
+	vmbus_root_device = NULL;
 	return ret;
 }
 
diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index cdd5be16021d..24725bea9ef1 100644
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
@@ -887,6 +896,35 @@ static const struct irq_domain_ops hv_pci_domain_ops = {
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
+	domain = NULL;
+	if (parent) {
+		domain = irq_find_host(parent);
+		of_node_put(parent);
+	}
+
+	/*
+	 * `domain == NULL` shouldn't happen.
+	 *
+	 * If somehow the code does end up in that state, treat this as a configuration
+	 * issue rather than a hard error, emit a warning, and let the code proceed.
+	 * The NULL parent domain is an acceptable option for the `irq_domain_create_hierarchy`
+	 * function called later.
+	 */
+	if (!domain)
+		WARN_ONCE(1, "No interrupt-parent found, check the DeviceTree data.\n");
+	return domain;
+}
+
+#endif
+
 static int hv_pci_irqchip_init(void)
 {
 	static struct hv_pci_chip_data *chip_data;
@@ -906,10 +944,29 @@ static int hv_pci_irqchip_init(void)
 	 * IRQ domain once enabled, should not be removed since there is no
 	 * way to ensure that all the corresponding devices are also gone and
 	 * no interrupts will be generated.
+	 *
+	 * In the ACPI case, the parent IRQ domain is supplied by the ACPI
+	 * subsystem, and it is the default GSI domain pointing to the GIC.
+	 * Neither is available outside of the ACPI subsystem, cannot avoid
+	 * the messy ifdef below.
+	 * There is apparently no such default in the OF subsystem, and
+	 * `hv_pci_of_irq_domain_parent` finds the parent IRQ domain that
+	 * points to the GIC as well.
+	 * None of these two cases reaches for the MSI parent domain.
 	 */
-	hv_msi_gic_irq_domain = acpi_irq_create_hierarchy(0, HV_PCI_MSI_SPI_NR,
-							  fn, &hv_pci_domain_ops,
-							  chip_data);
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		hv_msi_gic_irq_domain = acpi_irq_create_hierarchy(0, HV_PCI_MSI_SPI_NR,
+			fn, &hv_pci_domain_ops,
+			chip_data);
+#endif
+#if defined(CONFIG_OF)
+	if (!hv_msi_gic_irq_domain)
+		hv_msi_gic_irq_domain = irq_domain_create_hierarchy(
+			hv_pci_of_irq_domain_parent(), 0, HV_PCI_MSI_SPI_NR,
+			fn, &hv_pci_domain_ops,
+			chip_data);
+#endif
 
 	if (!hv_msi_gic_irq_domain) {
 		pr_err("Failed to create Hyper-V arm64 vPCI MSI IRQ domain\n");
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 4179add2864b..2be4dd83b0e1 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1333,6 +1333,8 @@ static inline void *hv_get_drvdata(struct hv_device *dev)
 	return dev_get_drvdata(&dev->device);
 }
 
+struct device *hv_get_vmbus_root_device(void);
+
 struct hv_ring_buffer_debug_info {
 	u32 current_interrupt_mask;
 	u32 current_read_index;
-- 
2.43.0


