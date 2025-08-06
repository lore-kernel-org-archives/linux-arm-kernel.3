Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31867C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 00:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMBDT2zYRzRMO1qYEwatd0iuKmtiwimyn6wYon4+bTE=; b=W50I38WIXjoQfAsb1AP9eBqdLR
	DIZd2yclovsocY50YhcNt3Seu3xvUKQOo8d24f7N0Si4v8HjPamTd3vSPCcIhxcB9D1GCqycUwbfc
	6EssfRqFSDuw7tWRK5+TCBAraEzeNNwWTGgpAr83puDlfnhXGT6wyz6fjvMwdyx3AKCtfbYw7dpZm
	aETwFEtxSAGjTm2iW1BienyfRaIGcnQj5Qi3subAgwgHq147rGsBzH8mfCI/yVWomdUfPFxHSEPR/
	9Gf7+1DlTgZrsPHiDi32z/bsqFQjC2Q1kfsu5yyam5W8nnUF0NPi+47Otqx0U3m7i0QbsRLCb8KUf
	LhiGbCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujoW4-0000000Gv9e-1Rcr;
	Thu, 07 Aug 2025 00:29:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm7A-0000000GegQ-426V
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 21:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EMBDT2zYRzRMO1qYEwatd0iuKmtiwimyn6wYon4+bTE=; b=Vf5evzOfOxNQBT1d2+GWvxhtE8
	WAcR2qvwfVnrZ1UFoGJ0ki3hUzguZIBpCp+0rSKipmb79HXs/iEnXSvKFVKu53A7qA+QruSA8YDxt
	s5JLIrVBhP7FE2h4Si12YhUvtbSLl0YxWWW+suVjULqd01R0Eck003jWXl/sjGPNjR+ISdn+yzHLw
	TQzlsmzipysmzSGewkVEvpSzd9F06SazVw9IF06ENPDNGSRQ8qEajAioauFIKmePUJi3gEFJxNNif
	CwB9Knn0V1DuNtyM+/pdujUzETNMpRWBmkWPcmZ502oIJFfSWEYj0YujwKCeC5+7SEfJY1qV8L3en
	lq/a1Rjw==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm74-0000000ER8I-2296
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 21:56:01 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [40.65.108.177])
	by linux.microsoft.com (Postfix) with ESMTPSA id E3DE4201BC8C;
	Wed,  6 Aug 2025 14:55:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E3DE4201BC8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1754517349;
	bh=EMBDT2zYRzRMO1qYEwatd0iuKmtiwimyn6wYon4+bTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s0B5TsGcwACdQKAFaHdhC7vvERX2B/PzH3VHd+0ealVxsDHeWfeLoGngkc1e8N2Co
	 vIsT4H6bUQe7CnrQS9+M8X7xOhp2+/PNA25jQsFuyl537BlziC689mZldl/J/Z1xYU
	 Z7K/MJqMUCorjkvH6xomiVt6SAZYB35+LoGlQMp0=
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
Subject: [PATCH v3 1/3] arm-smmu: move MSI_IOVA macro definitions
Date: Wed,  6 Aug 2025 14:55:37 -0700
Message-Id: <20250806215539.1240561-2-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_225559_578444_FB4DD2A6 
X-CRM114-Status: GOOD (  10.21  )
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
index ea41d790463ed..4db5714a50f1e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -503,9 +503,6 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
 #define ARM_SMMU_POLL_TIMEOUT_US	1000000 /* 1s! */
 #define ARM_SMMU_POLL_SPIN_COUNT	10
 
-#define MSI_IOVA_BASE			0x8000000
-#define MSI_IOVA_LENGTH			0x100000
-
 enum pri_resp {
 	PRI_RESP_DENY = 0,
 	PRI_RESP_FAIL = 1,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 4ced4b5bee4df..4a07650911991 100644
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
index 532db1de201ba..6b72776f17716 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -24,8 +24,6 @@
 
 #include "dma-iommu.h"
 
-#define MSI_IOVA_BASE			0x8000000
-#define MSI_IOVA_LENGTH			0x100000
 
 #define VIOMMU_REQUEST_VQ		0
 #define VIOMMU_EVENT_VQ			1
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7073be1d88415..517f908296436 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1508,6 +1508,9 @@ static inline void iommu_debugfs_setup(void) {}
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


