Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89465C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 00:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4K++fqiP84qacsZ/10/m3tNXa1bo+IGgMpwd09KRMY=; b=Kqes4WUaq3/dIC1J56pFVOUA6x
	FjoEesZ0Xwx9cvCZn4PJywgzPqll/dw8mBFVTj8oGyPIeLG4L++etkNK81rVuFHNh9/aD+Vvoj2rO
	qfCbXqikN5af9iHJ91eU5i4g0JAhim9ulbC5ELRnN7+gy6Hm9xgWLdQTB3qgSCbM9ujHbhgRD+5cP
	IS0PoEMSjPyTD5Dc6BMfuinTYXvRf/a6YnGga9vvRY/QHlpDmTiUpRAz9doAIhSiUyIznrk/mE+Xe
	Mv8YnUl5AeEz+g1XEovTCg8PZlmX7LU3vOn4hcW5SbsLT+C3amADM9NZdMnN99VCT3RFpl7qGikl1
	CR1kV5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFW1-0000000Fbm7-31zE;
	Sat, 15 Mar 2025 00:36:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFFo-0000000FZZU-3p0Q
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 15 Mar 2025 00:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k4K++fqiP84qacsZ/10/m3tNXa1bo+IGgMpwd09KRMY=; b=T1SK+GKKmoWdT2Nck7WtIH97kE
	XITm//lriEzPqcEwtjvSq3CVByOlvMtQFM8MSgdCqRHzfInmRY54L/Uz2qWlEfLILwtZ0I7Sc1U21
	fv+qEm0NZHuDVJugRmWhUtAT+ULVYiVuCmi9zJevIHwTHoDRc6Tt1VtS3Eb9YHmcZd0TQSG+JwT/9
	95/tc1WYUPZyCvg0bUdRTj8ClLHczsTIAt7hqAY8wPmz6KWJhpT/0t5OtXawLPJP9qRkzrRy6MR6x
	xfSWM3dIkXLehIzhF867LG9/d5E7thORw1SfgZf9dW+LerJECr9/l13cmL+aeUtyygnnUyb1cEIMS
	wGQL/LGg==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFFc-000000031L1-22AD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 00:19:42 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 64D98203345E;
	Fri, 14 Mar 2025 17:19:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 64D98203345E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741997976;
	bh=k4K++fqiP84qacsZ/10/m3tNXa1bo+IGgMpwd09KRMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Os6o5XJEUqFmk0cEU1prfpmSEvi8J0J1SMLVoL1B2wsQF8hhRX0nhbJ4vbU6l/+8k
	 7evvtXPnRoZHlBNxnvUp8RiH1JMArPoMnvOWMK/I/xbe7zadktk0i6JVl7L1IE6o8+
	 dGUm+h9+2bmkj/U+ywtCVNoDhpOGYSRUQpkiciU8=
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
Subject: [PATCH hyperv-next v6 09/11] Drivers: hv: vmbus: Introduce hv_get_vmbus_root_device()
Date: Fri, 14 Mar 2025 17:19:29 -0700
Message-ID: <20250315001931.631210-10-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250315001931.631210-1-romank@linux.microsoft.com>
References: <20250315001931.631210-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_001940_898929_7F80DC0A 
X-CRM114-Status: GOOD (  14.19  )
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

The ARM64 PCI code for hyperv needs to know the VMBus root
device, and it is private.

Provide a function that returns it. Rename it from "hv_dev"
as "hv_dev" as a symbol is very overloaded. No functional
changes.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/hv/vmbus_drv.c | 23 +++++++++++++++--------
 include/linux/hyperv.h |  2 ++
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index e8f2c3e92d1f..df18b4070b01 100644
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
 
@@ -1930,7 +1937,7 @@ int vmbus_device_register(struct hv_device *child_device_obj)
 		     &child_device_obj->channel->offermsg.offer.if_instance);
 
 	child_device_obj->device.bus = &hv_bus;
-	child_device_obj->device.parent = hv_dev;
+	child_device_obj->device.parent = vmbus_root_device;
 	child_device_obj->device.release = vmbus_device_release;
 
 	child_device_obj->device.dma_parms = &child_device_obj->dma_parms;
@@ -2292,7 +2299,7 @@ static int vmbus_acpi_add(struct platform_device *pdev)
 	struct acpi_device *ancestor;
 	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
 
-	hv_dev = &device->dev;
+	vmbus_root_device = &device->dev;
 
 	/*
 	 * Older versions of Hyper-V for ARM64 fail to include the _CCA
@@ -2378,7 +2385,7 @@ static int vmbus_device_add(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	hv_dev = &pdev->dev;
+	vmbus_root_device = &pdev->dev;
 
 	ret = of_range_parser_init(&parser, np);
 	if (ret)
@@ -2696,7 +2703,7 @@ static int __init hv_acpi_init(void)
 	if (ret)
 		return ret;
 
-	if (!hv_dev) {
+	if (!vmbus_root_device) {
 		ret = -ENODEV;
 		goto cleanup;
 	}
@@ -2727,7 +2734,7 @@ static int __init hv_acpi_init(void)
 
 cleanup:
 	platform_driver_unregister(&vmbus_platform_driver);
-	hv_dev = NULL;
+	vmbus_root_device = NULL;
 	return ret;
 }
 
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 675959fb97ba..1f310fbbc4f9 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1277,6 +1277,8 @@ static inline void *hv_get_drvdata(struct hv_device *dev)
 	return dev_get_drvdata(&dev->device);
 }
 
+struct device *hv_get_vmbus_root_device(void);
+
 struct hv_ring_buffer_debug_info {
 	u32 current_interrupt_mask;
 	u32 current_read_index;
-- 
2.43.0


