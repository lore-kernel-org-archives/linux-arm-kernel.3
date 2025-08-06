Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE79C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 23:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZfnUWwxdxJN9955pgQFuv1T6J84459tvn2v5OJo7mg=; b=KVvJm3dARcROJfb5jIFaBatVN+
	jdl91XpCCudgWlpTAy3QF/zU5cbjg2miLHPRh+OJyO6IEoQWxkFSzXn5eced/T7ZmhMQ0G7ZmEKk1
	J9yv95g1ciNQLvevMsAX72BGjwOvcGMZ4i0pYv60IzERZYcnZa/CZfNUJXEUgWXE0I/5FF9RtrlaL
	DbDJvV1sNL/dydh5zUqax3BwY8fSfXjwKrNh9t9IoCUNATwsqbdWItvtvReZroDLKufk1M3bq7ZUr
	3QrVt0et+a5Y/5pbNtEjAHXhg5wG43tx3scdVOM+6I8V7Vv2DY2lgkb7F7tK3tjXDXdk/jlkFle5x
	N/h3sKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnLV-0000000GnjL-0uxi;
	Wed, 06 Aug 2025 23:14:57 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm6x-0000000GecN-35gg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 21:55:53 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [40.65.108.177])
	by linux.microsoft.com (Postfix) with ESMTPSA id DB4B7201BC85;
	Wed,  6 Aug 2025 14:55:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DB4B7201BC85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1754517350;
	bh=CZfnUWwxdxJN9955pgQFuv1T6J84459tvn2v5OJo7mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nY3Trcvs//X2Tf79PjOTOC2zzQiT48wYcGdOOJR66n9wdprAOc7jUohX6jkfsNMBT
	 u1xaaRzXmn7yO5VRXXvmvJbCkKTh/lOJPgrTpUzcpFg23rm2r6gC5bceLtPHokRw5t
	 3l8aS0kmSExWgR4JviCBxlPhDhWg/tCeYqqcU7qY=
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
	vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com
Subject: [PATCH v3 3/3] arm-smmu: select suitable MSI IOVA
Date: Wed,  6 Aug 2025 14:55:39 -0700
Message-Id: <20250806215539.1240561-4-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_145551_831108_CA7E8E99 
X-CRM114-Status: GOOD (  15.17  )
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

Fix this by reserving faulty IOVA range and selecting alternate MSI_IOVA
suitable for the intended platform.

Example of reserving faulty IOVA range for PCIE device in the DTS:

reserved-memory {
	#address-cells = <2>;
	#size-cells = <2>;
	faulty_iova: resv_faulty {
		iommu-addresses = <&pcieX 0x0 0x8000000 0x0 0x100000>;
	};
};

&pcieX {
	memory-region = <&faulty_iova>;
};

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Link: https://lore.kernel.org/linux-iommu/20250416181759.GF493866@ziepe.ca/
Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27 +++++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 27 +++++++++++++++------
 include/linux/iommu.h                       | 25 +++++++++++++++++++
 3 files changed, 65 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5f46140a8f3fa..0dfb522e173f0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3642,17 +3642,30 @@ static int arm_smmu_of_xlate(struct device *dev,
 static void arm_smmu_get_resv_regions(struct device *dev,
 				      struct list_head *head)
 {
-	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
-	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
-	if (!region)
-		return;
-
-	list_add_tail(&region->list, head);
+	static const u64 msi_bases[] = { MSI_IOVA_BASE, MSI_IOVA_BASE2 };
 
 	iommu_dma_get_resv_regions(dev, head);
+
+	/*
+	 * Use the first msi_base that does not intersect with a platform
+	 * reserved region. The SW MSI base selection is entirely arbitrary.
+	 */
+	for (int i = 0; i != ARRAY_SIZE(msi_bases); i++) {
+		struct iommu_resv_region *region;
+
+		if (resv_region_intersects(msi_bases[i], MSI_IOVA_LENGTH, head))
+			continue;
+
+		region = iommu_alloc_resv_region(msi_bases[i], MSI_IOVA_LENGTH, prot,
+						 IOMMU_RESV_SW_MSI, GFP_KERNEL);
+		if (!region)
+			return;
+
+		list_add_tail(&region->list, head);
+		return;
+	}
 }
 
 /*
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 4a07650911991..84b74b8519386 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1600,17 +1600,30 @@ static int arm_smmu_of_xlate(struct device *dev,
 static void arm_smmu_get_resv_regions(struct device *dev,
 				      struct list_head *head)
 {
-	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
-	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
-	if (!region)
-		return;
-
-	list_add_tail(&region->list, head);
+	static const u64 msi_bases[] = { MSI_IOVA_BASE, MSI_IOVA_BASE2 };
 
 	iommu_dma_get_resv_regions(dev, head);
+
+	/*
+	 * Use the first msi_base that does not intersect with a platform
+	 * reserved region. The SW MSI base selection is entirely arbitrary.
+	 */
+	for (int i = 0; i != ARRAY_SIZE(msi_bases); i++) {
+		struct iommu_resv_region *region;
+
+		if (resv_region_intersects(msi_bases[i], MSI_IOVA_LENGTH, head))
+			continue;
+
+		region = iommu_alloc_resv_region(msi_bases[i], MSI_IOVA_LENGTH, prot,
+						 IOMMU_RESV_SW_MSI, GFP_KERNEL);
+		if (!region)
+			return;
+
+		list_add_tail(&region->list, head);
+		return;
+	}
 }
 
 static int arm_smmu_def_domain_type(struct device *dev)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 517f908296436..6750ecdebaa94 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1509,14 +1509,39 @@ static inline void iommu_debugfs_setup(void) {}
 
 #ifdef CONFIG_IOMMU_DMA
 #define MSI_IOVA_BASE        0x8000000
+#define MSI_IOVA_BASE2       0xA0000000
 #define MSI_IOVA_LENGTH      0x100000
 
+static inline bool resv_region_intersects(phys_addr_t msi_base, size_t length,
+					  struct list_head *resv_region_list)
+{
+	struct iommu_resv_region *region;
+	phys_addr_t start, end, resv_region_end;
+
+	start = msi_base;
+	end = start + length - 1;
+	list_for_each_entry(region, resv_region_list, list) {
+		resv_region_end = region->start + region->length - 1;
+		/* overlap detected */
+		if (!(start > resv_region_end || end < region->start))
+			return true;
+	}
+
+	return false;
+}
+
 int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
 #else /* CONFIG_IOMMU_DMA */
 static inline int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
 {
 	return -ENODEV;
 }
+
+static inline bool resv_region_intersects(phys_addr_t msi_base, size_t length,
+					  struct list_head *resv_region_list)
+{
+	return false;
+}
 #endif	/* CONFIG_IOMMU_DMA */
 
 /*
-- 
2.34.1


