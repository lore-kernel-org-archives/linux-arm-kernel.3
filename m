Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A635C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMCsqXSPMgBSso0mF8vkcqT8NTgpMP+lANz86GR/1JE=; b=zxTIOkPyjN0H11TgyApSGcgTog
	SNYez8QTSEx9i8NNDUXduldobkNCFleAQuyDyaJj1Snt4DiN1M/B2CN7UdVUclbMhvIQ7uFYQGLtb
	qq3Ur44G71BpRgT2tQxD+gRvWI80RHUfT9syzszR7CbXthxFrIgXugUaoHgu39m9LBOG3dusJa5l7
	49sL432+gscyge17OC0ZxNHkBAfWuBtEMdqANGbXcIlXuuEReKYbIN3dtPVJ2hN/20NsjyNRGi7M5
	Un+w2JE8LeCKs3b8t6lACQh3j9sBTE123ChuLzVAZDMdXPzH1hqg3Oa+rLV8dbyHx8bZxztDPrOOg
	g7ryfdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOxC-00000008dUH-2Drd;
	Tue, 18 Feb 2025 14:52:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOia-00000008Zjk-0CzT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:37:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC339A41035;
	Tue, 18 Feb 2025 14:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42349C4CEE6;
	Tue, 18 Feb 2025 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739889418;
	bh=o4GSDwcgCMz6AI4qFmm6hqFIO8SQo/fCcVqaBA7mmiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TnaEI9PNS6TDXzIPducf6m7rFu5FiYShedTbFhQZN5UbBqQqzjIqcU13fDgVoSafu
	 imVxDSeAkxrcmzB4bGtEHn3hV9Cp4EnZBP66WaxvBwMM6TEi/dHOEeQHfRTQldeJaK
	 IYLv+tPSpYSmXgZ6J7PMwniTFcsc2kHMF7hVysuzQFBrk5cjLm0z8x+UJ8d3P5s0vR
	 ON7uOcZnSaPLdgt0l4pMT+z36dI2FtUpZlZm5f4B88SECkVHX2mAza/x6q5SOseKJR
	 oyGYVUwsOGcKaH7E6sI2MxKGzQduY3KE6rtGEinVF+YOxR/8wVSf7rrHQExrXB0gDi
	 +3eck03/JPvVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB4CC021AD;
	Tue, 18 Feb 2025 14:36:58 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Tue, 18 Feb 2025 20:06:40 +0530
Subject: [PATCH 1/4] perf/dwc_pcie: Move common DWC struct definitions to
 'pcie-dwc.h'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-pcie-qcom-ptm-v1-1-16d7e480d73e@linaro.org>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
In-Reply-To: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>, 
 Jing Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3403;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=6d2Yb8pZtN0A+yfWOqcZ9eUeZfdnTNPaYMX4prFPOcU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBntJsHNIhzToT44AY+uhNUlCsCN6bOgu98Qogla
 8fEUJTYaTeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ7SbBwAKCRBVnxHm/pHO
 9WZ0B/9Nin9btaLnESIchxC1r4blWqXKP9BhZLaYFCxr61YM/Ph8gTp0V8EHuv2b7Va1fr0QWky
 5PGPDx8LXDlVdLyoPq0tz0t1jnv6USht1n+8SCWYLUAwUfMNU2iXopohMhcY3flFWFgGmOqatQq
 MC5k05B6r4WatPiN/s1AIbo8QlGoAp/nPJsgttnQrtWvKcuA84LYi01Hg0XZBt7fuTzr3hyY8nY
 7Yys0rTVKtBQn6s6eCcPu7I7fBpcgpfuHAAjHfpsPry7KpQxAK8KweQ+1xrzA2Iu6GzKJ90T2Ib
 Mpp00V379HiuU/qgoo7PcgX/ik+4LfjwG993avYaYGYGEue5
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_063700_232128_4C32A7A7 
X-CRM114-Status: GOOD (  18.45  )
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
Reply-To: manivannan.sadhasivam@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Since these are common to all Desginware PCIe IPs, move them to a new
header, 'pcie-dwc.h' so that other drivers could make use of them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS                 |  1 +
 drivers/perf/dwc_pcie_pmu.c | 23 ++---------------------
 include/linux/pcie-dwc.h    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..b4d09d52a750 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18123,6 +18123,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
 F:	Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
 F:	drivers/pci/controller/dwc/*designware*
+F:	include/linux/pcie-dwc.h
 
 PCI DRIVER FOR TI DRA7XX/J721E
 M:	Vignesh Raghavendra <vigneshr@ti.com>
diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index cccecae9823f..05b37ea7cf16 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -13,6 +13,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/pcie-dwc.h>
 #include <linux/perf_event.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
@@ -99,26 +100,6 @@ struct dwc_pcie_dev_info {
 	struct list_head dev_node;
 };
 
-struct dwc_pcie_pmu_vsec_id {
-	u16 vendor_id;
-	u16 vsec_id;
-	u8 vsec_rev;
-};
-
-/*
- * VSEC IDs are allocated by the vendor, so a given ID may mean different
- * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
- */
-static const struct dwc_pcie_pmu_vsec_id dwc_pcie_pmu_vsec_ids[] = {
-	{ .vendor_id = PCI_VENDOR_ID_ALIBABA,
-	  .vsec_id = 0x02, .vsec_rev = 0x4 },
-	{ .vendor_id = PCI_VENDOR_ID_AMPERE,
-	  .vsec_id = 0x02, .vsec_rev = 0x4 },
-	{ .vendor_id = PCI_VENDOR_ID_QCOM,
-	  .vsec_id = 0x02, .vsec_rev = 0x4 },
-	{} /* terminator */
-};
-
 static ssize_t cpumask_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
@@ -529,7 +510,7 @@ static void dwc_pcie_unregister_pmu(void *data)
 
 static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
 {
-	const struct dwc_pcie_pmu_vsec_id *vid;
+	const struct dwc_pcie_vsec_id *vid;
 	u16 vsec;
 	u32 val;
 
diff --git a/include/linux/pcie-dwc.h b/include/linux/pcie-dwc.h
new file mode 100644
index 000000000000..261ae11d75a4
--- /dev/null
+++ b/include/linux/pcie-dwc.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021-2023 Alibaba Inc.
+ *
+ * Copyright 2025 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#ifndef LINUX_PCIE_DWC_H
+#define LINUX_PCIE_DWC_H
+
+#include <linux/pci_ids.h>
+
+struct dwc_pcie_vsec_id {
+	u16 vendor_id;
+	u16 vsec_id;
+	u8 vsec_rev;
+};
+
+/*
+ * VSEC IDs are allocated by the vendor, so a given ID may mean different
+ * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
+ */
+static const struct dwc_pcie_vsec_id dwc_pcie_pmu_vsec_ids[] = {
+	{ .vendor_id = PCI_VENDOR_ID_ALIBABA,
+	  .vsec_id = 0x02, .vsec_rev = 0x4 },
+	{ .vendor_id = PCI_VENDOR_ID_AMPERE,
+	  .vsec_id = 0x02, .vsec_rev = 0x4 },
+	{ .vendor_id = PCI_VENDOR_ID_QCOM,
+	  .vsec_id = 0x02, .vsec_rev = 0x4 },
+	{} /* terminator */
+};
+
+#endif /* LINUX_PCIE_DWC_H */

-- 
2.25.1



