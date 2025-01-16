Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75120C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ST/uwYj8FbdGl2sV7queyr7M4lWHLEgBHKORDgGElUw=; b=xb3xx2fu/OOr3gevtK8fg16D3T
	Qsu/rbnIScE90MSsNAQm20m2hKaz+eBoLOeNHm9ieiWWWxt/ZgrVP7kB1wU4q5leSV/9XPsTtiOUN
	S/AM2hCix9YSL52253eDF5wiMrtU08olf4L+U5GrB5F30LAFLUT/k8fNT52YWfJlU+qoBM3tPViJY
	2BQOKrInVAmrWXjfmkadLT2PzgzDWgnY2Xqb31dOc/O3mCHSNaFK7vJc/KaGHZ6MfC9MwIP66pLX1
	+Ygo0sRrgG4MzaLrHrRmVolOWAYHo+XqKB2Xkq9dQ2Zw3C5Mc0lPihqUTj39lqLFac5980w8eJeiS
	l37M2q+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZQ5-0000000GX3F-0qph;
	Thu, 16 Jan 2025 23:37:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZCt-0000000GPlq-128T
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 16 Jan 2025 23:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ST/uwYj8FbdGl2sV7queyr7M4lWHLEgBHKORDgGElUw=; b=ZLsoc4jvNfcdjtxw74boeeUFoL
	y1rr22T4gdauY0zxw4O5zUGtAZsHC686ZaAvyCd8Fsnu1/S8Ie3WVhVdc/MM7qRYx6fpnpVcy5Sao
	3jBfiN5Y3LVfH3+8CZ9wfUPYmGc5zUVgE0XJcexAgJoH0Vu0DONiVhtjsDAEscRwLDnj+jWFMXIzH
	sUBozT894ijL4hmOVTJTXdAVJlQ11VJFPKltttZywk7vXKFjZuOxlfRnRsTKtsHS6NaO6kdneFeJn
	J4ej6dvsYmfb6FfMaJhje8+8wixYs4cY42S1N7CkVsaPd4r/yiPsQ7t3xXljRXAybP1ZX15pqR8py
	dOotOFAg==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZCp-0000000BKjp-3eMF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:23:21 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.66])
	by linux.microsoft.com (Postfix) with ESMTPSA id 64A4920591A9;
	Thu, 16 Jan 2025 15:23:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 64A4920591A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737069794;
	bh=ST/uwYj8FbdGl2sV7queyr7M4lWHLEgBHKORDgGElUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mNltCitoyFhAJ3HY+1fuvvbcID2aKoAS4gmW+dzqEGa+4F0DHl67YAGr24gAMGhg3
	 juvidvkXMFhQEROq2EvoWCaOytxEIN+HG0u7ORRNJGChtWKJenvpDhsYvDrTK3ZB7R
	 ammoFXmKbmpfz+TgQJfpMLE4G9c/1D/h0Iz6SjRI=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: will@kernel.org,
	jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com,
	code@tyhicks.com,
	eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com
Subject: [PATCH 3/3] arm-smmu: use dts passed MSI IOVA address and length
Date: Thu, 16 Jan 2025 15:23:05 -0800
Message-Id: <20250116232307.1436693-2-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
References: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_232320_470906_ADEB2289 
X-CRM114-Status: GOOD (  18.09  )
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

Fix this by passing PCI MSI IOVA address via dts property
"arm,smmu-pci-msi-iova-data". Likewise this property can be
used to set custom MSI IOVA address length, by default it should be
set to MSI IOVA default length value i.e, 0x100000.

If this property is not found in the dtb for the given platform then
the driver falls back on the default MSI IOVA address.

Since this change allows configuration of custom MSI IOVA base
address and length, rename existing as MSI_IOVA* macros accordingly.

Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 10 ++++-
 drivers/iommu/virtio-iommu.c                |  6 +--
 include/linux/iommu.h                       | 45 ++++++++++++++++++++-
 4 files changed, 62 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 0e4cbb2c64d73..91e88025424f9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -32,6 +32,8 @@
 #include "arm-smmu-v3.h"
 #include "../../dma-iommu.h"
 
+struct msi_iova_data msi_data_smmu_v3;
+
 static bool disable_msipolling;
 module_param(disable_msipolling, bool, 0444);
 MODULE_PARM_DESC(disable_msipolling,
@@ -3540,8 +3542,9 @@ static void arm_smmu_get_resv_regions(struct device *dev,
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
-	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
+	region = iommu_alloc_resv_region(msi_data_smmu_v3.msi_iova_base,
+					 msi_data_smmu_v3.msi_iova_length, prot,
+					 IOMMU_RESV_SW_MSI, GFP_KERNEL);
 	if (!region)
 		return;
 
@@ -4569,6 +4572,9 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	u32 cells;
 	int ret = -EINVAL;
+	struct msi_iova_data *msi_data_ptr = &msi_data_smmu_v3;
+
+	iommu_configure_msi_iova(dev, "arm,smmu-pci-msi-iova-data", msi_data_ptr);
 
 	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
 		dev_err(dev, "missing #iommu-cells property\n");
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 287f8e8d25890..b636ea302cee0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -49,6 +49,8 @@
  */
 #define QCOM_DUMMY_VAL -1
 
+struct msi_iova_data msi_data;
+
 static int force_stage;
 module_param(force_stage, int, S_IRUGO);
 MODULE_PARM_DESC(force_stage,
@@ -1593,8 +1595,9 @@ static void arm_smmu_get_resv_regions(struct device *dev,
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
-	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
+	region = iommu_alloc_resv_region(msi_data.msi_iova_base,
+					 msi_data.msi_iova_length, prot,
+					 IOMMU_RESV_SW_MSI, GFP_KERNEL);
 	if (!region)
 		return;
 
@@ -2029,6 +2032,9 @@ static int arm_smmu_device_dt_probe(struct arm_smmu_device *smmu,
 	const struct arm_smmu_match_data *data;
 	struct device *dev = smmu->dev;
 	bool legacy_binding;
+	struct msi_iova_data *msi_data_ptr = &msi_data;
+
+	iommu_configure_msi_iova(dev, "arm,smmu-pci-msi-iova-data", msi_data_ptr);
 
 	if (of_property_read_u32(dev->of_node, "#global-interrupts", global_irqs))
 		return dev_err_probe(dev, -ENODEV,
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 8c8783c8b31be..ca50dee09f352 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -958,9 +958,9 @@ static void viommu_get_resv_regions(struct device *dev, struct list_head *head)
 	 * software-mapped region.
 	 */
 	if (!msi) {
-		msi = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					      prot, IOMMU_RESV_SW_MSI,
-					      GFP_KERNEL);
+		msi = iommu_alloc_resv_region(MSI_IOVA_BASE_DEFAULT,
+					      MSI_IOVA_LENGTH_DEFAULT, prot,
+					      IOMMU_RESV_SW_MSI, GFP_KERNEL);
 		if (!msi)
 			return;
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 2a26d3e18b24e..412a89200f094 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1505,8 +1505,43 @@ static inline void iommu_debugfs_setup(void) {}
 #ifdef CONFIG_IOMMU_DMA
 #include <linux/msi.h>
 
-#define MSI_IOVA_BASE		0x8000000
-#define MSI_IOVA_LENGTH		0x100000
+/* MSI_IOVA_BASE_DEFAULT address can be overridden by dts specified address */
+#define MSI_IOVA_BASE_DEFAULT		0x8000000
+#define MSI_IOVA_LENGTH_DEFAULT		0x100000
+
+struct msi_iova_data {
+	u32 msi_iova_base;
+	u32 msi_iova_length;
+};
+
+static inline void iommu_configure_msi_iova(struct device *iommu_dev,
+					    const char *msi_iova_prop,
+					    struct msi_iova_data *msi_data)
+{
+	static bool is_msi_base_set_from_dt;
+	u32 msi_data_from_dt[2];
+	int rc;
+
+	rc = of_property_read_u32_array(iommu_dev->of_node, msi_iova_prop,
+					msi_data_from_dt, 2);
+	if (!rc && !is_msi_base_set_from_dt) {
+		msi_data->msi_iova_base = msi_data_from_dt[0];
+		msi_data->msi_iova_length = msi_data_from_dt[1];
+		dev_info(iommu_dev, "setting custom MSI IOVA base to 0x%x\n",
+			 msi_data->msi_iova_base);
+		is_msi_base_set_from_dt = true;
+	} else if (is_msi_base_set_from_dt &&
+		msi_data->msi_iova_base != msi_data_from_dt[0])
+		dev_warn(iommu_dev, "custom MSI IOVA base already set to 0x%x,"
+			 " skip resetting it to 0x%x\n",
+			 msi_data->msi_iova_base, msi_data_from_dt[0]);
+	else if (!is_msi_base_set_from_dt && rc == -EINVAL) {
+		msi_data->msi_iova_base = MSI_IOVA_BASE_DEFAULT;
+		msi_data->msi_iova_length =  MSI_IOVA_LENGTH_DEFAULT;
+		dev_info(iommu_dev, "using default MSI IOVA base: 0x%x\n",
+			 msi_data->msi_iova_base);
+	}
+}
 
 int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
 
@@ -1518,6 +1553,12 @@ void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg);
 struct msi_desc;
 struct msi_msg;
 
+static inline void iommu_configure_msi_iova(struct device *iommu_dev,
+					    const char *msi_iova_prop,
+					    u32 (*msi_addr)[2])
+{
+}
+
 static inline int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
 {
 	return -ENODEV;
-- 
2.34.1


