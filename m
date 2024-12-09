Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9329E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 22:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UliQ9BaJK6cQyNMhh4lON7tY5Q+y0a9nzBcys+98C3I=; b=FafQJVJn8k4nc8rxc1lzKUuES7
	MZicflNyiI3Tsb0tMerjLwHjhTzGjOCdzeNzbwEr5hrBwny2nlDH0fC7fFi/5hGeQx8NhVxKNaAyg
	I1nfZfUt8gNv55FXIf/ccHkxU1a9uh54HKUljEYBSDDVrV6ZMUBFuS6zn1yx0vU2QwwTCMNm7LDtf
	LR5BVR6ArizhshYdU7N9fkJx6tN5+sGWuj1Y02hIJZJZz9yuEnmq1q0PxXVWc5b9PV5opdW0DbCS6
	ZHDkklOL8XcIM1BmrVlLvsH6qb5BzyNdl42JQ2jgktiWP32aHEgP4ZukuDzNASMtAAkCD2EKWwLSq
	CuvS3QBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmHB-00000009RA8-3DMK;
	Mon, 09 Dec 2024 22:30:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmG8-00000009R0m-1sml
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 22:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DF42A4198C;
	Mon,  9 Dec 2024 22:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C951C4CEDD;
	Mon,  9 Dec 2024 22:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733783382;
	bh=uQB9FqZV8S9ljImuA1+RLrowIMKCGgBRgFgwfCk1L+s=;
	h=From:To:Cc:Subject:Date:From;
	b=qSmkNYDnDYfnTXlZ/hbN66HInnToCRcDJYAU94+Pe5oXlpwTOc/6W3gCxO6q6IfR1
	 bGybcx8QeYxXJfH1l1Vems7MzQb0ymHvkGqSDX2knyTKzA6F4a0AbgQT+gStqZPTvQ
	 pGhoW+E0AwkkUnNxNDO822be3pirQJp7j9UuvQ+wsC4bvBZth2mkjmu54SXoDvKf6p
	 RCZcUVLqkXsVSyWRJNTMYlqwBO/9wS1K3t8Zc8rB7gbrN4DjEns++0G1fFg8XWX1AE
	 g8OmPC5DRGDfStJaqitiEc99/SDp8b4DEnk7XTPLBNpFar8O0vuZJATHoJlpqJC4uw
	 mZV/UlU8CsVuA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] perf/dwc_pcie: Qualify RAS DES VSEC Capability by Vendor, Revision
Date: Mon,  9 Dec 2024 16:29:38 -0600
Message-Id: <20241209222938.3219364-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_142944_620703_61872621 
X-CRM114-Status: GOOD (  19.32  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

PCI Vendor-Specific (VSEC) Capabilities are defined by each vendor.
Devices from different vendors may advertise a VSEC Capability with the DWC
RAS DES functionality, but the vendors may assign different VSEC IDs.

Search for the DWC RAS DES Capability using the VSEC ID and VSEC Rev
chosen by the vendor.

This does not fix a current problem because Alibaba, Ampere, and Qualcomm
all assigned the same VSEC ID and VSEC Rev for the DWC RAS DES Capability.

The potential issue is that we may add support for a device from another
vendor, where the vendor has already assigned DWC_PCIE_VSEC_RAS_DES_ID
(0x02) for an unrelated VSEC.  In that event, dwc_pcie_des_cap() would find
the unrelated VSEC and mistakenly assume it was a DWC RAS DES Capability.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
Sample devices that advertise VSEC Capabilities with VSEC ID=0x02 that are
unrelated to the DWC RAS DES functionality:

  https://community.nxp.com/t5/S32G/S32G3-PCIe-compliance-mode-set-speed-to-5-8Gbit-s/m-p/1875346#M7024
    00:00.0 PCI bridge: Freescale Semiconductor Inc Device 4300 (prog-if 00 [Normal decode])
      Capabilities: [70] Express (v2) Root Port (Slot-), MSI 00
      Capabilities: [158 v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>

  https://github.com/google-coral/edgetpu/issues/743
    0000:00:00.0 PCI bridge: NVIDIA Corporation Device 1ad0 (rev a1) (prog-if 00 [Normal decode])
      Capabilities: [70] Express (v2) Root Port (Slot-), MSI 00
      Capabilities: [1d0 v1] Vendor Specific Information: ID=0002 Rev=4 Len=100

  https://www.linuxquestions.org/questions/linux-kernel-70/differences-in-'lspci-v'-output-4175495550/
    00:01.0 PCI bridge: Intel Corporation 5520/5500/X58 I/O Hub PCI Express Root Port 1 (rev 13) (prog-if 00 [Normal decode])
      Capabilities: [90] Express Root Port (Slot+), MSI 00
      Capabilities: [160] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>

  https://www.reddit.com/r/linuxhardware/comments/187u87b/the_correct_way_to_identify_the_kernel_driver/
    04:00.0 Network controller: Realtek Semiconductor Co., Ltd. Device c852 (rev 01)
      Capabilities: [70] Express Endpoint, MSI 00
      Capabilities: [170] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
---
 drivers/perf/dwc_pcie_pmu.c | 68 ++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 9cbea9675e21..d022f498fa1a 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -20,7 +20,6 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
-#define DWC_PCIE_VSEC_RAS_DES_ID		0x02
 #define DWC_PCIE_EVENT_CNT_CTL			0x8
 
 /*
@@ -100,14 +99,23 @@ struct dwc_pcie_dev_info {
 	struct list_head dev_node;
 };
 
-struct dwc_pcie_vendor_id {
-	int vendor_id;
+struct dwc_pcie_pmu_vsec_id {
+	u16 vendor_id;
+	u16 vsec_id;
+	u8 vsec_rev;
 };
 
-static const struct dwc_pcie_vendor_id dwc_pcie_vendor_ids[] = {
-	{.vendor_id = PCI_VENDOR_ID_ALIBABA },
-	{.vendor_id = PCI_VENDOR_ID_AMPERE },
-	{.vendor_id = PCI_VENDOR_ID_QCOM },
+/*
+ * VSEC IDs are allocated by the vendor, so a given ID may mean different
+ * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
+ */
+static const struct dwc_pcie_pmu_vsec_id dwc_pcie_pmu_vsec_ids[] = {
+	{ .vendor_id = PCI_VENDOR_ID_ALIBABA,
+	  .vsec_id = 0x02, .vsec_rev = 0x4 },
+	{ .vendor_id = PCI_VENDOR_ID_AMPERE,
+	  .vsec_id = 0x02, .vsec_rev = 0x4 },
+	{ .vendor_id = PCI_VENDOR_ID_QCOM,
+	  .vsec_id = 0x02, .vsec_rev = 0x4 },
 	{} /* terminator */
 };
 
@@ -519,31 +527,28 @@ static void dwc_pcie_unregister_pmu(void *data)
 	perf_pmu_unregister(&pcie_pmu->pmu);
 }
 
-static bool dwc_pcie_match_des_cap(struct pci_dev *pdev)
+static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
 {
-	const struct dwc_pcie_vendor_id *vid;
-	u16 vsec = 0;
+	const struct dwc_pcie_pmu_vsec_id *vid;
+	u16 vsec;
 	u32 val;
 
 	if (!pci_is_pcie(pdev) || !(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT))
-		return false;
+		return 0;
 
-	for (vid = dwc_pcie_vendor_ids; vid->vendor_id; vid++) {
+	for (vid = dwc_pcie_pmu_vsec_ids; vid->vendor_id; vid++) {
 		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
-						DWC_PCIE_VSEC_RAS_DES_ID);
-		if (vsec)
-			break;
+						vid->vsec_id);
+		if (vsec) {
+			pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER,
+					      &val);
+			if (PCI_VNDR_HEADER_REV(val) == vid->vsec_rev) {
+				pci_dbg(pdev, "Detected PCIe Vendor-Specific Extended Capability RAS DES\n");
+				return vsec;
+			}
+		}
 	}
-	if (!vsec)
-		return false;
-
-	pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER, &val);
-	if (PCI_VNDR_HEADER_REV(val) != 0x04)
-		return false;
-
-	pci_dbg(pdev,
-		"Detected PCIe Vendor-Specific Extended Capability RAS DES\n");
-	return true;
+	return 0;
 }
 
 static void dwc_pcie_unregister_dev(struct dwc_pcie_dev_info *dev_info)
@@ -587,7 +592,7 @@ static int dwc_pcie_pmu_notifier(struct notifier_block *nb,
 
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
-		if (!dwc_pcie_match_des_cap(pdev))
+		if (!dwc_pcie_des_cap(pdev))
 			return NOTIFY_DONE;
 		if (dwc_pcie_register_dev(pdev))
 			return NOTIFY_BAD;
@@ -612,13 +617,14 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	struct pci_dev *pdev = plat_dev->dev.platform_data;
 	struct dwc_pcie_pmu *pcie_pmu;
 	char *name;
-	u32 sbdf, val;
+	u32 sbdf;
 	u16 vsec;
 	int ret;
 
-	vsec = pci_find_vsec_capability(pdev, pdev->vendor,
-					DWC_PCIE_VSEC_RAS_DES_ID);
-	pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER, &val);
+	vsec = dwc_pcie_des_cap(pdev);
+	if (!vsec)
+		return -ENODEV;
+
 	sbdf = plat_dev->id;
 	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
 	if (!name)
@@ -730,7 +736,7 @@ static int __init dwc_pcie_pmu_init(void)
 	int ret;
 
 	for_each_pci_dev(pdev) {
-		if (!dwc_pcie_match_des_cap(pdev))
+		if (!dwc_pcie_des_cap(pdev))
 			continue;
 
 		ret = dwc_pcie_register_dev(pdev);
-- 
2.34.1


