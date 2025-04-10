Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE879C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 22:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1L/lBwFs+AoYXX7M34lWjEC0yx+AYdjFCcZZm+bO1mg=; b=3b0EIK4Fr/GWN0wkB2JYxNnLcD
	GUoG1fgKGSDOV0yS0HSdeZF1icjkfQQV/KtBUECXnDqGRGYmtsj38enTLsf3jMqDldlOVDCbxU56r
	2yP7149DLeCERRaaThuGusBz1vcTJddYsfd2bgVk72pPxP+t3Me9RmkhTj0vuG23XThvBqlQyeh2r
	6ZAs3rYQ/HNXbd+VyqUmIANORv1fjz/2wl4rjJlYuDJOJfSB0rtyIMlAZ9W/VnzFAhApz/a4NNlyM
	ytHuajmMuLLk+qWvoL30Fuyynxw3XrSB+FhHzMfgq2tIaqNJEBcI4XXPGqmAIiZZGdf29dnIey+TE
	pqCxNhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30oc-0000000C0IU-44Ib;
	Thu, 10 Apr 2025 22:56:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30jE-0000000BzJq-3Z3q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 22:50:39 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id 470912114DAC;
	Thu, 10 Apr 2025 15:50:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 470912114DAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744325435;
	bh=1L/lBwFs+AoYXX7M34lWjEC0yx+AYdjFCcZZm+bO1mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ouD2J1M6Syc04G0BdVTKC6Tw5VlDo00LLQq/BPfc84OcOz77peQdCCw8Zqxt+neSn
	 ABkg8kpYvzqIIkB0YtJe/KN823X2z7FYOJRUkv6fcU6UMSZ509smgkZkpOCGIt66tU
	 ZD4JhUiztiVVO9ZcLBHA74sry1k76aapLHDrwEzQ=
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
Subject: [PATCH v2 1/3] arm-smmu: move MSI_IOVA macro definitions
Date: Thu, 10 Apr 2025 15:50:28 -0700
Message-Id: <20250410225030.2528385-2-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_155036_914397_B4CF9A24 
X-CRM114-Status: GOOD (  10.81  )
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

MSI_IOVA* are common among different iommu/smu drivers,
so move them to common iommu.h header file.

Suggested-by: Jacob Pan <jacob.pan@linux.microsoft.com>
Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 3 ---
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 3 ---
 drivers/iommu/virtio-iommu.c                | 2 --
 include/linux/iommu.h                       | 3 +++
 4 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index bd9d7c85576a..d1713f6bbe6d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -502,9 +502,6 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
 #define ARM_SMMU_POLL_TIMEOUT_US	1000000 /* 1s! */
 #define ARM_SMMU_POLL_SPIN_COUNT	10
 
-#define MSI_IOVA_BASE			0x8000000
-#define MSI_IOVA_LENGTH			0x100000
-
 enum pri_resp {
 	PRI_RESP_DENY = 0,
 	PRI_RESP_FAIL = 1,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8f439c265a23..a54dc4608c62 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -50,9 +50,6 @@
  */
 #define QCOM_DUMMY_VAL -1
 
-#define MSI_IOVA_BASE			0x8000000
-#define MSI_IOVA_LENGTH			0x100000
-
 static int force_stage;
 module_param(force_stage, int, S_IRUGO);
 MODULE_PARM_DESC(force_stage,
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index b85ce6310ddb..8c8783c8b31b 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -24,8 +24,6 @@
 
 #include "dma-iommu.h"
 
-#define MSI_IOVA_BASE			0x8000000
-#define MSI_IOVA_LENGTH			0x100000
 
 #define VIOMMU_REQUEST_VQ		0
 #define VIOMMU_EVENT_VQ			1
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index cf8c16ba04a0..8d38d85f23f1 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1530,6 +1530,9 @@ static inline void iommu_debugfs_setup(void) {}
 #endif
 
 #ifdef CONFIG_IOMMU_DMA
+#define MSI_IOVA_BASE        0x8000000
+#define MSI_IOVA_LENGTH      0x100000
+
 int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
 #else /* CONFIG_IOMMU_DMA */
 static inline int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
-- 
2.34.1


