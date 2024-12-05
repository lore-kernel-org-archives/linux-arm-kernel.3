Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177CCE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wSh/ubfVUi4jGTm1ylplJ/8qGJ6pJwTLdA84eH0P5Uc=; b=do+lrldYpa+uvFz2vdjGwzrn2b
	kdNXnw59LiaGoXI5kgq7QOxre9VSLkKSmJM5fFq9udV2epeQN32csgMSCwN7ydj2+flF6stl5hCA6
	NeTjAVfGI1FAnqnUTLfVT/zZYdNLm8zj6dQhpxA/IhqPU8+/Rd1pvZrv1G2eNZX5CqmVfGXPEy9Uo
	CJ35h2k2+Sm65tfDOmulg5LJ1d74tViO7uw9czbKyJen1miEcQXhs7j2njDgHNbodAGsH3zHZe1QP
	zWMJuGswFhgilctHyAQeuCi4ZSScb4ah9fGFly1P4QhhFQu9qgj7aB8QtiaeLBvVHGVNEBHKULmh3
	ai/PFQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCEK-0000000GEA5-0Ks6;
	Thu, 05 Dec 2024 13:49:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCDJ-0000000GDvK-0Aen
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:48:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B6201063;
	Thu,  5 Dec 2024 05:48:44 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BFC6D3F71E;
	Thu,  5 Dec 2024 05:48:14 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com
Cc: joro@8bytes.org,
	jean-philippe@linaro.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	ryan.roberts@arm.com,
	broonie@kernel.org
Subject: [PATCH 1/2] iommu/arm-smmu-v3: Document SVA interaction with new pagetable features
Date: Thu,  5 Dec 2024 13:48:09 +0000
Message-Id: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_054817_120681_C6A65775 
X-CRM114-Status: GOOD (  13.04  )
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

Process pagetables may now be using new permission-indirection-based
features which an SMMU may not understand when given such a table for
SVA. Although SMMUv3.4 does add its own S1PIE feature, realistically
we're still going to have to cope with feature mismatches between CPUs
and SMMUs, so let's start simple and essentially just document the
expectations for what falls out as-is. Although it seems unlikely for
SVA applications to also depend on memory-hardening features, or
vice-versa, the relative lifecycles make it tricky to enforce mutual
exclusivity. Thankfully our PIE index allocation makes it relatively
benign for an SMMU to keep interpreting them as direct permissions, the
only real implication is that an SVA application cannot harden itself
against its own devices with these features. Thus, inform the user about
that just in case they have other expectations.

Also we don't (yet) support LPA2, so deny SVA entirely if we're going to
misunderstand the pagetable format altogether.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 1d3e71569775..9ba596430e7c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -112,6 +112,15 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
 	 * from the current CPU register
 	 */
 	target->data[3] = cpu_to_le64(read_sysreg(mair_el1));
+
+	/*
+	 * Note that we don't bother with S1PIE on the SMMU, we just rely on
+	 * our default encoding scheme matching direct permissions anyway.
+	 * SMMU has no notion of S1POE nor GCS, so make sure that is clear if
+	 * either is enabled for CPUs, just in case anyone imagines otherwise.
+	 */
+	if (system_supports_poe() || system_supports_gcs())
+		dev_warn_once(master->smmu->dev, "SVA devices ignore permission overlays and GCS\n");
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_make_sva_cd);
 
@@ -206,8 +215,12 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
 	unsigned long asid_bits;
 	u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
 
-	if (vabits_actual == 52)
+	if (vabits_actual == 52) {
+		/* We don't support LPA2 */
+		if (PAGE_SIZE != SZ_64K)
+			return false;
 		feat_mask |= ARM_SMMU_FEAT_VAX;
+	}
 
 	if ((smmu->features & feat_mask) != feat_mask)
 		return false;
-- 
2.39.2.101.g768bb238c484.dirty


