Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8969DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 22:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aR5FsxsIycmRcn42PG+oTQzQG5IybM8JAOJ2uJYYZWk=; b=x0PG4FdsDfDYpGeNfCZUCjLMLd
	G3Ixz+93KcjSE4JY/v6LdfKvknAL55Y4if00kIbNqlIDez0IEq3BIL23NS4ZbBJne4MQUqXCvdWIE
	VTY12rtUUkHakBQKnOKH7XU6gprxN/06ykv4+9tbCbpc5voUDj6Gd2GLmM84Cr8zNMGdN4ugD1qcT
	l9YZrSlC/hLbfYZJPNr6whyv7I/3KN8pB27nVvRBFcfb9ZlFgMbt0bx8G173rTkYT8aqY1nusTCx0
	+8cwNKKV/0pufMVZvM+CALst8ONzBZ2mEYuOtEUca+WhB/yYpMALH6ZtWhYcqv1MAiio5HXlhNc10
	psAgzuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqg12-0000000Fgyf-1VoE;
	Fri, 07 Mar 2025 22:18:00 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfmf-0000000FdzB-1QJ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 22:03:10 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 869FD2038F48;
	Fri,  7 Mar 2025 14:03:08 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 869FD2038F48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741384988;
	bh=aR5FsxsIycmRcn42PG+oTQzQG5IybM8JAOJ2uJYYZWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OS0h5GSdSB83+eNsI9lehhfII7iCqqXhVnSvJ/hbLXpRQzaqZfooB0Vzd+4V8oTk6
	 i26BmsHR2wCE6ElhQM5dcmfdZVOjl4nsRhp6ZKiSYY8qb4iAGpBMXT4fZHiUUwFHGM
	 lHsypdTC78wxPh3kC8K/061cp7wmt0we2hrq4iZY=
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
Subject: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ number from DeviceTree
Date: Fri,  7 Mar 2025 14:03:00 -0800
Message-ID: <20250307220304.247725-9-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307220304.247725-1-romank@linux.microsoft.com>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_140309_409237_2FD7CF60 
X-CRM114-Status: GOOD (  12.24  )
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
 drivers/hv/vmbus_drv.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 75eb1390b45c..c8474b48dcd2 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2345,6 +2345,36 @@ static int vmbus_acpi_add(struct platform_device *pdev)
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
@@ -2359,6 +2389,12 @@ static int vmbus_device_add(struct platform_device *pdev)
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


