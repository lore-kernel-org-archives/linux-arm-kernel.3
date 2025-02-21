Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81173C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8iNv4rUSK4BcCyI65khem7cbMSrm4/FPAbuC68UIbI=; b=Dx7/0aThSZzxbnRhZK90XDr2AV
	s8qeha7WqAUPaa0+vZ6G4f0BxLRw2CNpKB22nu5Rq3Cj8wFJpXjNm8qXfPYXnUf9t4Xxp+Dc3FRzh
	proRo8tsuCUT0YSo4FYqmHpMR50y+xaZF28A6ixGCJMtb4fL9yQAJKOSzmtAV6yNULYJvF67hNMJl
	Vx55iHlQyhuQagH2PhGeLMASuVXiomzNtiKp7bc5yfDnEhpDICKwT4ILUjWob1gLViiBjCQFXC+/u
	IkJ09K0iUM75VWoYgDJQq+Wf5klgTWbh0iEUBmlTxxHS23uGNsL/8qGDvfnDKrthp4xcuiFl5qq1Z
	9tW7ZvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnId-00000007scP-2ucA;
	Sat, 22 Feb 2025 11:04:00 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnDl-00000007roF-1sd3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 10:58:59 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250222105851epoutp03de2e644fa42a2991845d6ac258908042~mgqB_dJ3d0508405084epoutp03F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 10:58:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250222105851epoutp03de2e644fa42a2991845d6ac258908042~mgqB_dJ3d0508405084epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740221931;
	bh=j8iNv4rUSK4BcCyI65khem7cbMSrm4/FPAbuC68UIbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PBZ0eJGWwiWdQ4/eN6cy1x0TfafzMBa6ivvMkbHpTM1Lv7qZytcehHbNFm2j66nft
	 o/ZWIWINwmx5EGuMiDn33MOkrQB16uoMk82sscdYXIVQbgsymHNPX2fDovE2ZNNCOC
	 F92neLKEnnD8Ghz13PdPcXti+vbwCxsx+w4bCX74=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20250222105851epcas5p3ff9deb2962954f25f151002e63fdf2f4~mgqBUL3zx3197831978epcas5p36;
	Sat, 22 Feb 2025 10:58:51 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.179]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Z0PBK1wF6z4x9Pq; Sat, 22 Feb
	2025 10:58:49 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CB.7C.19956.9EDA9B76; Sat, 22 Feb 2025 19:58:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250221132024epcas5p13d6e617805e4ef0c081227b08119871b~mO8VR5tw13253332533epcas5p1f;
	Fri, 21 Feb 2025 13:20:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250221132024epsmtrp28d6db9df4df799ab7b304a5441da1e75~mO8VQ3UAr1906719067epsmtrp2V;
	Fri, 21 Feb 2025 13:20:24 +0000 (GMT)
X-AuditID: b6c32a4b-fe9f470000004df4-90-67b9ade92214
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	03.59.18729.89D78B76; Fri, 21 Feb 2025 22:20:24 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250221132021epsmtip27b96bcc645abda7a5dbb604b12c1bd58~mO8SYgc580769307693epsmtip2I;
	Fri, 21 Feb 2025 13:20:21 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@Huawei.com, fan.ni@samsung.com, nifan.cxl@gmail.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com, cassel@kernel.org,
	18255117159@163.com, xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com, Shradha Todi <shradha.t@samsung.com>
Subject: [PATCH v7 1/5] perf/dwc_pcie: Move common DWC struct definitions to
 'pcie-dwc.h'
Date: Fri, 21 Feb 2025 18:45:44 +0530
Message-Id: <20250221131548.59616-2-shradha.t@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250221131548.59616-1-shradha.t@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WTf0xbVRTHvX197QNX8gK4Xcis+HBT0ELLWrgw6uYk+AwzwRljojFQ6bMg
	pe3ea+ccEhmUDHA0kG3hh4Djl3bAYGuBlK0YhDl0BsKyytTABtsiguwXvwlDbWnR/z7nnO/3
	nnvPvZfAAn8QhBJZOiPD6lRaSuDP7xmMiJDMnO/VSOcahch1Yl2IKgefR80FmehquRVDBW0T
	OLIuVgtRa8OYAOWfXMeR7e4Yjm5cqhWg4fohAXJ1d/CR+YmZjybMJThquXmdhzZ6+gBq7F4U
	oobCGYD+cTqEqGwwD5nHFejhml2wfzvdZD2N0+317YDurZkQ0mdtJtp85T5O21pLBPT4mFNA
	907F0/dclTza3vwFbelqBfSCTZy67f3sxExGpWbYMEaXoVdn6TRKKuWdtNfTFLFSmUQWj+Ko
	MJ0qh1FSSQdTJclZWvdpqbAjKq3JnUpVcRwV/WoiqzcZmbBMPWdUUoxBrTXIDVGcKocz6TRR
	OsaYIJNKYxRuYXp2ZvFkDW74RXz0wpO9+eCrkFLgR0BSDucqV3ilwJ8IJC8D+Gt1H+YN5gGc
	LunBvcEygG1VTmzL8mVnmU/VB+DGxSK+pxBILgJYtBrjYQEZCY8vlW4agskiAK/8sd1jwMge
	DPZbre4CQQSRH8Bpe7BHwyd3wbqB34CHRWQCdBRbfc2eg20X+jfZj9wLW0cqed78JAHvdPs0
	SbBwaQV4OQjODnUJvRwKFx70CbysgefsVT69Fi7bm33r7IP9rlq+ZzsYGQE7L0V708/CM9c6
	NiUYGQDL1u/55CLoqN/icLi44eR7OQTWX72Be5mGy8NbU7QAOH+xEC8H4pr/W5wFoBWEMAYu
	R8NwCsMeHfPpf3eWoc+xgc33HJniAHcmH0UNAB4BBgAkMCpYJDE6NIEiteqzYwyrT2NNWoYb
	AAr3/Cqw0Gcy9O4PoTOmyeTxUnlsbKw8fk+sjNohKuw1awJJjcrIZDOMgWG3fDzCLzSf90r+
	GtUke7mpIAIq1roipr9xdSZZ2NvZU0Llm49OVeEx1x7Mjyvto2HqnTCZ4LfFyIqij7esWe4W
	nnLkfL26Mvqh+bUFXgXRWJHc8J5yrYUTs3zRtiOHynN3vPjS2+Bkdx19+HpC9dBE2s+J7Nyu
	uG/F+eVP4XlRGvrjw/T979MDnMW1Usa2W3c0d66b6hDvHjWl3xpZ+qlU4vpzSv70Xy/EVbcf
	qv3uo32/p/TlSYoPHrC0f8KOjDWRLaLVM83chF+J+iF2wlg3vDPRGvDu4xntWynTAad/LP48
	CsDHFbMNt1Zy1blBmCjc4BQq/W+eM/39xjHs8uz5GpOJCA/Zf5vic5kqWSTGcqp/ARlCwRtY
	BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSvO6M2h3pBjeuKFpcaf/NbjH9sKLF
	kqYMi2MTVjBbNK2+y2qx4stMdotVC6+xWTT0/Ga12PT4GqvF5V1z2CzOzjvOZnFl6zoWi5Y/
	LSwWd1s6WS2WXr/IZPF3215Gi0Vbv7BbLGx+yWjxf88Odovew7UWLXdMLd7/3MzmIOaxeMUU
	Vo8189YweuycdZfdY8GmUo+WI29ZPTat6mTzuHNtD5vHzoeWHk+uTGfy2Lyk3qNvyypGj8+b
	5AJ4orhsUlJzMstSi/TtErgyOh7MYi24Klex4Y91A+NsyS5GTg4JAROJ7vW9zF2MXBxCArsZ
	Jf4tus8EkZCU+HxxHZQtLLHy33N2EFtI4BOjxNR9fiA2m4CWROPXLrBmEYFORom9R96xgzjM
	AueYJWZ+bmEEqRIWiJQ4/HcdK4jNIqAqMffQTbA4r4CVxI6OFcwQG+QlVm84AGZzClhLrDo3
	nQlim5XEni33WScw8i1gZFjFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcRVqaOxi3
	r/qgd4iRiYPxEKMEB7OSCK9uyY50Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rziL3pThATSE0tS
	s1NTC1KLYLJMHJxSDUym4elv3BlMv+18P89D84ifnLL+orNHd20ODt57/PVpvie1k3hFZFYo
	bLqwuY7JK4bvvIjWColp7rY/N1ScbRC+N7367D/Bsgj+QOu7hoclJH133hZvPfi0m7Gs7+9x
	0+JKE7mW03LRtwTjS7S2vD9QNVnU0mPRVzOms3l1h3+8KS7Jnf+5rjBxfrkph9CM/fczVTsj
	bocd6gu2TFj0Upbl5avz0jf4ud4p960WOPFv/W+mx5sOZ6T4qdRftw6v+5m6Yj+TuK6o/Ntt
	KypMGhekbSr88H3NEj7W51Xmz4+4rPR0LX2j+oTxgLMy4/eDy379u3Btlu2r3tXv1bc/PrU1
	ITqY9eZ8l0a2Q0cXpT1TYinOSDTUYi4qTgQAxli9+xEDAAA=
X-CMS-MailID: 20250221132024epcas5p13d6e617805e4ef0c081227b08119871b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250221132024epcas5p13d6e617805e4ef0c081227b08119871b
References: <20250221131548.59616-1-shradha.t@samsung.com>
	<CGME20250221132024epcas5p13d6e617805e4ef0c081227b08119871b@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_025857_811927_256D6CB0 
X-CRM114-Status: GOOD (  24.39  )
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

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Since these are common to all Desginware PCIe IPs, move them to a new
header 'pcie-dwc.h', so that other drivers like debugfs, perf and sysfs
could make use of them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 MAINTAINERS                 |  1 +
 drivers/perf/dwc_pcie_pmu.c | 25 +++----------------------
 include/linux/pcie-dwc.h    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 22 deletions(-)
 create mode 100644 include/linux/pcie-dwc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3864d473f52f..6474a2d83de4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18167,6 +18167,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
 F:	Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
 F:	drivers/pci/controller/dwc/*designware*
+F:	include/linux/pcie-dwc.h
 
 PCI DRIVER FOR TI DRA7XX/J721E
 M:	Vignesh Raghavendra <vigneshr@ti.com>
diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index cccecae9823f..da30f2c2d674 100644
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
@@ -529,14 +510,14 @@ static void dwc_pcie_unregister_pmu(void *data)
 
 static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
 {
-	const struct dwc_pcie_pmu_vsec_id *vid;
+	const struct dwc_pcie_vsec_id *vid;
 	u16 vsec;
 	u32 val;
 
 	if (!pci_is_pcie(pdev) || !(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT))
 		return 0;
 
-	for (vid = dwc_pcie_pmu_vsec_ids; vid->vendor_id; vid++) {
+	for (vid = dwc_pcie_rasdes_vsec_ids; vid->vendor_id; vid++) {
 		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
 						vid->vsec_id);
 		if (vsec) {
diff --git a/include/linux/pcie-dwc.h b/include/linux/pcie-dwc.h
new file mode 100644
index 000000000000..40f3545731c8
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
+static const struct dwc_pcie_vsec_id dwc_pcie_rasdes_vsec_ids[] = {
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
2.17.1


