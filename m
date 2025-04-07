Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1A6C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7usvJbWdzao6Cpj0TdEPzfAZnIHMs9Jb/NJTFyO0qY=; b=lDPej1Otgi0+UMzzG2VFD51yzv
	FwHopyR4TN6EgdnR4syqtTLpSuQggq0JQud9/qOZ6yhOt3dGWO3RrWjDt2iA6T2xtWu7wH0uyULBc
	hoe2DDA1A37Ul06lXBehFk54EwGSjWfJ3ruRKEBJdKlidlo09C1oMECkik3ZPlilP4XJ4lA6w/G/J
	0xqBJBZPf4vgbdODsGMwQwuiKVGeEVWPvvn210rn3XvPlGgPM2vdOi9oCpx5Rh8EPs04OtFwZTOIF
	xTfB58O+9V7SkcHrqE5npfQ3gKfom5Xm0FEW25gz8bBywFBf0XXVxQ8gPvVFkgjxvO5O/tWOq33WW
	O3Vfttaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uKq-000000027hl-2wAd;
	Mon, 07 Apr 2025 21:48:52 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sql-00000001wER-1pRe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 20:13:45 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 54B862113E88;
	Mon,  7 Apr 2025 13:13:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 54B862113E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744056821;
	bh=y7usvJbWdzao6Cpj0TdEPzfAZnIHMs9Jb/NJTFyO0qY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EHi+eNCM61h7pcU0C55egc10Rg40Cvcy6Ih35fIv/1RsKF9JPtRNv7yhXKGfHqsyL
	 ikM/4E2A0i93AFZsf4k9usi61d7e3AkCo+xLigqbb5BwwPafyDGNBT7FOLbbavgBmJ
	 vKSkrPu3BEIHIzFj0BWtz64ATsqoxCs4BlMKicQs=
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
	rafael.j.wysocki@intel.com,
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
Subject: [PATCH hyperv-next v7 08/11] Drivers: hv: vmbus: Get the IRQ number from DeviceTree
Date: Mon,  7 Apr 2025 13:13:33 -0700
Message-ID: <20250407201336.66913-9-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407201336.66913-1-romank@linux.microsoft.com>
References: <20250407201336.66913-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_131343_501099_2FE37794 
X-CRM114-Status: GOOD (  11.86  )
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
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/hv/vmbus_drv.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 22afebfc28ff..e8f2c3e92d1f 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2345,6 +2345,31 @@ static int vmbus_acpi_add(struct platform_device *pdev)
 }
 #endif
 
+static int vmbus_set_irq(struct platform_device *pdev)
+{
+	struct irq_data *data;
+	int irq;
+	irq_hw_number_t hwirq;
+
+	irq = platform_get_irq(pdev, 0);
+	/* platform_get_irq() may not return 0. */
+	if (irq < 0)
+		return irq;
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
@@ -2359,6 +2384,11 @@ static int vmbus_device_add(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (!__is_defined(HYPERVISOR_CALLBACK_VECTOR))
+		ret = vmbus_set_irq(pdev);
+	if (ret)
+		return ret;
+
 	for_each_of_range(&parser, &range) {
 		struct resource *res;
 
-- 
2.43.0


