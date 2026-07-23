Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1879AC531D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewg2HL4k6zrTIkhmRK46j/xkTuAz/+C1cgAX9vtcPZw=; b=yTNwImjMnNQ/J9JP0rRvlXd87n
	x9saR3YZbyIIG2LD4+WMCE5XTYMsL2RWCmP4Jwc6rYsPFivcPVsIUiSKTlhuZkhBQ6LbwaI7mM5ch
	jnCc3zyORN2OyIDdzpuyzcgTOw5xK4AZCLcr1+Hn82lvAL1OEKnu3vZmveWNtrrcHjJH0c/pS2ifh
	61dePPsoO2hlr5WF9NVSIeJhVXlPCmwdOayGQvWIaA2DE71GPudoI+RsYvDxoBbKR8obi6dQ1Nhz5
	1jkHGJKju4V9E2cG/x5Q3S9AS3iYZ56Te9l7d3/7w0dKw/S2HTVUbdcHkj87/iZb5aHlihhstImoN
	dPeuaBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuHI-0000000EU0U-1MQx;
	Thu, 23 Jul 2026 14:20:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuHC-0000000ETy0-0ICN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:19:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF385176A;
	Thu, 23 Jul 2026 07:19:48 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E8E9A3F59E;
	Thu, 23 Jul 2026 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784816393; bh=t9M1S99nkGHInIRcGtd0XHHvsXwFrSJ8hHcGk/W93vY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bTH6XLSLWps9hzIQoUsxNMezon3YEaoBL7zFWBrG39McLIioaWunZWcnYahzKQVxp
	 YsL2G+LhnF5KmMnLBvf6xo3Y7OMdmj0/fntm0IPO2LSaQ7bTpauRAkEpCtGA3xXZZk
	 VRDPPLz1c/dN6UMTzvLGoshyD/0Ijb4jaKnzOjwQ=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com,
	joro@8bytes.org
Cc: jpb@kernel.org,
	jgg@nvidia.com,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] iommu/arm-smmu-v3: Add HAFT support for SVA
Date: Thu, 23 Jul 2026 15:19:44 +0100
Message-ID: <57ae366ec501a142bd20f2cc7d18b3eca8eeac25.1784814923.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1784814923.git.robin.murphy@arm.com>
References: <cover.1784814923.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_071954_211161_8808173C 
X-CRM114-Status: GOOD (  13.99  )
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

v2: Update IORT override warning condition correctly

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 5 +++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 9 ++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 3 +++
 3 files changed, 16 insertions(+), 1 deletion(-)

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
index a10affb483a4..14e5b3f08962 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4921,10 +4921,14 @@ static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
 
 static void arm_smmu_get_httu(struct arm_smmu_device *smmu, u32 reg)
 {
-	u32 fw_features = smmu->features & (ARM_SMMU_FEAT_HA | ARM_SMMU_FEAT_HD);
+	u32 fw_features = smmu->features & (ARM_SMMU_FEAT_HA | ARM_SMMU_FEAT_HD |
+					    ARM_SMMU_FEAT_HAFT);
 	u32 hw_features = 0;
 
 	switch (FIELD_GET(IDR0_HTTU, reg)) {
+	case IDR0_HTTU_ACCESS_DIRTY_HAFT:
+		hw_features |= ARM_SMMU_FEAT_HAFT;
+		fallthrough;
 	case IDR0_HTTU_ACCESS_DIRTY:
 		hw_features |= ARM_SMMU_FEAT_HD;
 		fallthrough;
@@ -5256,6 +5260,9 @@ static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
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


