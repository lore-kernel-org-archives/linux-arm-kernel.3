Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6971FC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 01:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxnUth80ZpwN+R8QXh2rnXW3rersdPCTTnOAkFWYgDI=; b=0kIAVPSjrZ3gcJiqi7sbmou3hz
	d7blYBb8fQmY6zNJLfkv8JEOnBiw2rmBnwJcT88fXcl6r528XnW+KvXAqSgZQ6MvzTmrr8oRjS4wc
	K0JzBmgJUSpjbXU6q6ZIEYFW8C7AdyGB/zoJfyIXc4cP+h4yG49rzAWwk9dcaGKPqwp9fHV/UXsAk
	J91Q8bLpuW0AlemIlDIijWqWF+j0Hq3EO2qM7suBLxdQhvNbJcdGG3VgYk0OR9rpVdFjNp0JReuYa
	WPpKaJw0maL/z6v3dvOdHbTZW3E9W4dQIyiqozRWw3Z0wU96EjEfedoYOZ9jBvQAYmIu1qhQfjz3d
	stMF2onA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1wN-00000005t1z-1ii9;
	Wed, 12 Feb 2025 01:53:27 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1mh-00000005r5o-3cdo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 01:43:29 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 20D092107ABC;
	Tue, 11 Feb 2025 17:43:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 20D092107ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739324606;
	bh=fxnUth80ZpwN+R8QXh2rnXW3rersdPCTTnOAkFWYgDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ShwoORgjejjON2N7A2RFHlzYeBAbDLfGWZ4lEe29wGSWjBl/n8jLBpsASsJolKAbc
	 Sfic0A88GQiTr0d2oJKBHmrDh42UeiTOvV3t7FHjrVPoqlWGi79DfAjxa9mR2wlFW+
	 AHR+5D1yr49w35P0Z85bP6dJhHEFrUqJGSpnGwfE=
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
Subject: [PATCH hyperv-next v4 5/6] Drivers: hv: vmbus: Get the IRQ number from DeviceTree
Date: Tue, 11 Feb 2025 17:43:20 -0800
Message-ID: <20250212014321.1108840-6-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212014321.1108840-1-romank@linux.microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_174327_932716_B8E79D25 
X-CRM114-Status: GOOD (  12.23  )
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

The VMBus driver uses ACPI for interrupt assignment on
arm64 hence it won't function in the VTL mode where only
DeviceTree can be used.

Update the VMBus driver to discover interrupt configuration
from DT.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 drivers/hv/vmbus_drv.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 0f6cd44fff29..9d0c2dbd2a69 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2335,6 +2335,36 @@ static int vmbus_acpi_add(struct platform_device *pdev)
 }
 #endif
 
+static int __maybe_unused vmbus_set_irq(struct platform_device *pdev)
+{
+	struct irq_data *data;
+	int irq;
+	irq_hw_number_t hwirq;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq == 0) {
+		pr_err("VMBus interrupt mapping failure\n");
+		return -EINVAL;
+	}
+	if (irq < 0) {
+		pr_err("VMBus interrupt data can't be read from DeviceTree, error %d\n", irq);
+		return irq;
+	}
+
+	data = irq_get_irq_data(irq);
+	if (!data) {
+		pr_err("No interrupt data for VMBus virq %d\n", irq);
+		return -ENODEV;
+	}
+	hwirq = irqd_to_hwirq(data);
+
+	vmbus_irq = irq;
+	vmbus_interrupt = hwirq;
+	pr_debug("VMBus virq %d, hwirq %d\n", vmbus_irq, vmbus_interrupt);
+
+	return 0;
+}
+
 static int vmbus_device_add(struct platform_device *pdev)
 {
 	struct resource **cur_res = &hyperv_mmio;
@@ -2349,6 +2379,12 @@ static int vmbus_device_add(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+#ifndef HYPERVISOR_CALLBACK_VECTOR
+	ret = vmbus_set_irq(pdev);
+	if (ret)
+		return ret;
+#endif
+
 	for_each_of_range(&parser, &range) {
 		struct resource *res;
 
-- 
2.43.0


