Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFF8C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 22:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gtu6nH7srNfvTtxxwiTNF8qbQE3fc+/uSVqmjie7Kk=; b=EpjZTZgjdi0oFTl7rVt9XiVo3J
	GkwWhFOmj2EYOyHdN40ATl5m1UJ96DMQY3Kf+jK/HYXjZd6/YdPKx/3fL+eC19hWX84XFeEd18tvi
	AhH3bVjEXH74Zcxfa1/jht9bRwrzGokAQvW5wubDJq/sdUV0lf7QeaKTAJ64fA7BvYCFRn5bL22GA
	ukUWfMCCo6V/39oGy/WaOvCK8Fu1Z5MBPMx7O9YBy2+1IbzBH3DaA649oEKOCG4ttMIwMPH6/Q0z1
	Tnk8zbV1IgaXmS6TP+IXJcxz3hU8MBkfgU67u9dMkgWsiifMEJSYQOkdqG52VmO8R4pz86JvZA0H3
	PXGOCzHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30l3-0000000Bzig-2PLZ;
	Thu, 10 Apr 2025 22:52:29 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30jE-0000000BzJt-3RLO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 22:50:38 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id 05FEA2114DAE;
	Thu, 10 Apr 2025 15:50:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 05FEA2114DAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744325436;
	bh=7gtu6nH7srNfvTtxxwiTNF8qbQE3fc+/uSVqmjie7Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ar5iCyWv/QVBsLCCJFSqIY3ZHBZI2x61i2WxVHZ+lvnVMCy4vq9FKsvvgBAk1HT+w
	 +1lEETI/HuA8bD6AKBf336epHfsi/fLw4wlM4JmFUPXenfHseNInTSdc2qXD8jtqWu
	 oQvtuf6RkBkC45BRU/ZEVTKkKllPMqYn0zbkRTSA=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: jgg@ziepe.ca,
	will@kernel.org,
	jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com,
	code@tyhicks.com,
	eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com
Subject: [PATCH v2 3/3] arm-smmu: select suitable MSI IOVA
Date: Thu, 10 Apr 2025 15:50:30 -0700
Message-Id: <20250410225030.2528385-4-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_155036_910194_D95A5DC9 
X-CRM114-Status: GOOD (  16.77  )
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

Currently ARM SMMU drivers hardcode PCI MSI IOVA address.
Not all the platform have same memory mappings and some platform
could have this address already being mapped for something else.
This can lead to collision and as a consequence the MSI IOVA addr
range is never reserved.

Fix this by adding one more MSI_IOVA base address, so that if the
platforms can select suitable PCI MSI IOVA address if SMMU dts node
has "arm,smmu-faulty-msi-iova".

If this property is not found in the dtb for the given platform then
the driver falls back on the default MSI IOVA address.

Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  9 +++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  9 +++-
 include/linux/iommu.h                       | 49 +++++++++++++++++++++
 3 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 358072b4e293..d6ea82ed4530 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -33,6 +33,8 @@
 #include "arm-smmu-v3.h"
 #include "../../dma-iommu.h"
 
+u32 msi_iova_base;
+
 static bool disable_msipolling;
 module_param(disable_msipolling, bool, 0444);
 MODULE_PARM_DESC(disable_msipolling,
@@ -3541,8 +3543,8 @@ static void arm_smmu_get_resv_regions(struct device *dev,
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
-	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
+	region = iommu_alloc_resv_region(msi_iova_base, MSI_IOVA_LENGTH, prot,
+					 IOMMU_RESV_SW_MSI, GFP_KERNEL);
 	if (!region)
 		return;
 
@@ -4570,6 +4572,9 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	u32 cells;
 	int ret = -EINVAL;
+	u32 msi_iova_ptr;
+
+	iommu_configure_msi_iova(dev, "arm,smmu-faulty-msi-iova", msi_iova_ptr);
 
 	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
 		dev_err(dev, "missing #iommu-cells property\n");
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index a54dc4608c62..cd8bf2278057 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -50,6 +50,8 @@
  */
 #define QCOM_DUMMY_VAL -1
 
+u32 msi_iova_base;
+
 static int force_stage;
 module_param(force_stage, int, S_IRUGO);
 MODULE_PARM_DESC(force_stage,
@@ -1594,8 +1596,8 @@ static void arm_smmu_get_resv_regions(struct device *dev,
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
-	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
+	region = iommu_alloc_resv_region(msi_iova_base, MSI_IOVA_LENGTH, prot,
+					 IOMMU_RESV_SW_MSI, GFP_KERNEL);
 	if (!region)
 		return;
 
@@ -2030,6 +2032,9 @@ static int arm_smmu_device_dt_probe(struct arm_smmu_device *smmu,
 	const struct arm_smmu_match_data *data;
 	struct device *dev = smmu->dev;
 	bool legacy_binding;
+	u32 *msi_iova_ptr = &msi_iova_base;
+
+	iommu_configure_msi_iova(dev, "arm,smmu-faulty-msi-iova", msi_iova_ptr);
 
 	if (of_property_read_u32(dev->of_node, "#global-interrupts", global_irqs))
 		return dev_err_probe(dev, -ENODEV,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 8d38d85f23f1..cfd047fdf225 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1531,10 +1531,59 @@ static inline void iommu_debugfs_setup(void) {}
 
 #ifdef CONFIG_IOMMU_DMA
 #define MSI_IOVA_BASE        0x8000000
+#define MSI_IOVA_BASE2       0xa0000000
 #define MSI_IOVA_LENGTH      0x100000
 
+static inline u32 select_msi_iova_base(u32 erratic_iova_addr)
+{
+	phys_addr_t start, end, msi_iova_end;
+
+	if (!erratic_iova_addr)
+		return MSI_IOVA_BASE;
+
+	start = erratic_iova_addr;
+	end = start + MSI_IOVA_LENGTH - 1;
+	msi_iova_end = MSI_IOVA_BASE + MSI_IOVA_LENGTH - 1;
+
+	/* return non-overlapping address */
+	return (start > MSI_IOVA_BASE ||
+			end < msi_iova_end) ? MSI_IOVA_BASE : MSI_IOVA_BASE2;
+}
+
+static inline void iommu_configure_msi_iova(struct device *iommu_dev,
+					    const char *faulty_msi_iova_prop,
+					    u32 *msi_iova)
+{
+	static bool is_msi_iova_selected;
+	u32 faulty_msi_iova_from_dt;
+	int rc;
+
+	rc = of_property_read_u32(iommu_dev->of_node, faulty_msi_iova_prop,
+				  &faulty_msi_iova_from_dt);
+	if (!is_msi_iova_selected) {
+		*msi_iova = select_msi_iova_base(rc ? 0 : faulty_msi_iova_from_dt);
+		dev_dbg(iommu_dev, "setting custom MSI IOVA base to 0x%x\n", *msi_iova);
+		is_msi_iova_selected = true;
+		return;
+	}
+
+	dev_dbg(iommu_dev, "custom MSI IOVA base already set to 0x%x\n", *msi_iova);
+}
+
 int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
 #else /* CONFIG_IOMMU_DMA */
+
+static inline u32 select_msi_iova_base(u32 erratic_iova_addr)
+{
+}
+
+static inline void iommu_configure_msi_iova(struct device *iommu_dev,
+					    const char *faulty_msi_iova_prop,
+					    u32 *msi_iova)
+{
+}
+
+
 static inline int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
 {
 	return -ENODEV;
-- 
2.34.1


