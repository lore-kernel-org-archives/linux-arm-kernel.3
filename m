Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D75C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5DKmClFGUyTFGPu0nP1vsfcVZ/IX+FI4vKFGgJ6zxqo=; b=vue0Obkh9LUmG010FChkeY0exC
	Bpvl5MkOBkZXtSm76i/eJeejjYVGffHzATUAG8hFUJc69aWabFpp+ULZOoYU+NcULOCeVT45n22Vp
	YlpVapYQBY92NqZm1IpyP7NZ41U5LiwM30ffxoTqYriB0pA0XF5yQxC6Z73pvnTEauIB4ebEv4aKv
	73aO4fULjIuoCXyEzs3N4o6nhDtbU3jTsn6Oc8w0Mo3ouGvgSyYDyvdyBmOBCrokgvpuOr2lWqsaY
	GXJrMtQBcm4NiLnAje7zOQgm9ZgGjuyOSrcqT04bSqjMw2Vemf8MolkV/T3iZSTYI3x7zoC2uM6wy
	Tq75F1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wez0H-00000002kaE-0jXG;
	Wed, 01 Jul 2026 17:45:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wez0D-00000002kXM-3El7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 17:45:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6CFA2BF7;
	Wed,  1 Jul 2026 10:45:30 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B5C0E3F85F;
	Wed,  1 Jul 2026 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782927935; bh=JYlNs5cCz4iPuOZduJDZZgEyl0FofGYsMvYkgOEiosY=;
	h=From:To:Cc:Subject:Date:From;
	b=D8QgBOAWEV0NgOSJOt29mYQd7CeduBIC8fDG+HvGIgYU6EarArrsRwY5PWRQNX3XX
	 HwlhUhuxMY1m8wsHYQipFtTu2dRu3L+mN/dveZzBnT2E5OxjZrefhUPdDyc2p10i5x
	 mm8i/kdEytzA+nLMFa0Or60sjnCw6UZIsnqhNy4w=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Cc: jpb@kernel.org,
	catalin.marinas@arm.com,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] iommu/arm-smmu-v3: Add HAFT support for SVA
Date: Wed,  1 Jul 2026 18:45:17 +0100
Message-ID: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104537_898154_0C8D7148 
X-CRM114-Status: GOOD (  12.58  )
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

Since table access flags cannot be software-managed, if process
pagetables are using HAFT then SVA must require the SMMU to support and
enable it too, otherwise page aging is liable to get out of whack.

Cc: <stable@vger.kernel.org>
Fixes: 62df5870ebf7 ("arm64: Enable ARCH_HAS_NONLEAF_PMD_YOUNG")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 5 +++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 6 ++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 3 +++
 3 files changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 1ed8a6f29dc4..ef11e9493f93 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -102,6 +102,8 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
 			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
 		if (master->smmu->features & ARM_SMMU_FEAT_HD)
 			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);
+		if (master->smmu->features & ARM_SMMU_FEAT_HAFT && system_supports_haft())
+			target->data[1] |= cpu_to_le64(CTXDESC_CD_1_HAFT);
 	} else {
 		target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_EPD0);
 
@@ -211,6 +213,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
 	if (system_supports_bbml2_noabort())
 		feat_mask |= ARM_SMMU_FEAT_BBML2;
 
+	if (system_supports_haft())
+		feat_mask |= ARM_SMMU_FEAT_HAFT;
+
 	if ((smmu->features & feat_mask) != feat_mask)
 		return false;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a10affb483a4..7637e9128533 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4925,6 +4925,9 @@ static void arm_smmu_get_httu(struct arm_smmu_device *smmu, u32 reg)
 	u32 hw_features = 0;
 
 	switch (FIELD_GET(IDR0_HTTU, reg)) {
+	case IDR0_HTTU_ACCESS_DIRTY_HAFT:
+		hw_features |= ARM_SMMU_FEAT_HAFT;
+		fallthrough;
 	case IDR0_HTTU_ACCESS_DIRTY:
 		hw_features |= ARM_SMMU_FEAT_HD;
 		fallthrough;
@@ -5256,6 +5259,9 @@ static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
 		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
 
 	switch (FIELD_GET(ACPI_IORT_SMMU_V3_HTTU_OVERRIDE, iort_smmu->flags)) {
+	case IDR0_HTTU_ACCESS_DIRTY_HAFT:
+		smmu->features |= ARM_SMMU_FEAT_HAFT;
+		fallthrough;
 	case IDR0_HTTU_ACCESS_DIRTY:
 		smmu->features |= ARM_SMMU_FEAT_HD;
 		fallthrough;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index c909c9a88538..61a7df5afb99 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -40,6 +40,7 @@ struct arm_vsmmu;
 #define IDR0_HTTU			GENMASK(7, 6)
 #define IDR0_HTTU_ACCESS		1
 #define IDR0_HTTU_ACCESS_DIRTY		2
+#define IDR0_HTTU_ACCESS_DIRTY_HAFT	3
 #define IDR0_COHACC			(1 << 4)
 #define IDR0_TTF			GENMASK(3, 2)
 #define IDR0_TTF_AARCH64		2
@@ -369,6 +370,7 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
 #define CTXDESC_CD_0_ASET		(1UL << 47)
 #define CTXDESC_CD_0_ASID		GENMASK_ULL(63, 48)
 
+#define CTXDESC_CD_1_HAFT		(1UL << 3)
 #define CTXDESC_CD_1_TTB0_MASK		GENMASK_ULL(51, 4)
 
 /*
@@ -921,6 +923,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_FEAT_HD		(1 << 22)
 #define ARM_SMMU_FEAT_S2FWB		(1 << 23)
 #define ARM_SMMU_FEAT_BBML2		(1 << 24)
+#define ARM_SMMU_FEAT_HAFT		(1 << 25)
 	u32				features;
 
 #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
-- 
2.54.0.dirty


