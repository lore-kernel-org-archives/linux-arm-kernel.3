Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1008BCF5395
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKoI9dEllx1TNgC9xZVCozD6BRiFRJgzuEW3oaX71qI=; b=G1jH9Oq3WN2heaWfEtzH2EazzA
	+nTyL/IAZuZGnKSh3uFMLY7J5/RzZpUBH/UhiYlz8kmv3XIdRVtVFu3Vt4a3EXVpW+Y9UrJTLPFZF
	12qTAfoocKhQ/hkG7lttsJ9H0LIqSq0PJmuiSap0ANrKb9o297uOgnWJ9suTHGOBXjcl3HLxv13XJ
	sHqJhZ584wic+tV+gYGRHcV+Et9yR88GfNCiHy+Noy5vTwgrRYqQsPqoM8/HocfFO0Y0cRjxFzb6R
	FWi9rdok/KxWCFG1vBwWt7Aa5FoXnMNWgOUlX5pwH/efYKMVOXdV96g+vhk6HY7JJTvHDM0dR0O0l
	TBfjbz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cU6-0000000EkaE-1wt0;
	Wed, 23 Oct 2024 14:37:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cOa-0000000Ei6U-3V01
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:31:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BADF3A44F3A;
	Wed, 23 Oct 2024 14:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0210C4CEC6;
	Wed, 23 Oct 2024 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693891;
	bh=DTPT4zl44npMYzjERrEH9EvBCMsinVpzO0mfU1W/K+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hb9j67H0cQJisbeOByZnDrvtNRkiL0B/AQ60yQMivg7recmbCI3cpy9hLv7dt0iSr
	 ZHGFcgklUTzkrYEgqtboOWpMpoEAlcATRRXtn6oUMMP8E6NkZOERzQSgkD+mLd9Ufe
	 2U0VnpexlJDbSgR3+nuxg3s9uTBObiTd8OKuiRWgKfjG2HZ4g8z/RniynOD8EVBrNQ
	 NoYyx5ASofpW2GHYNjpPR8d1ZE+fXCKPVuBsVF/J7uvpg+YaX0T8QSFoVgUmEZAyEH
	 o8Y3tSgBshTjZXLIGPXR+qt5egiR3iyLpBCwa/+tIJlquzC8zgZyboezniA/MUZb0A
	 mjNFmakYW/bWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Subject: [PATCH AUTOSEL 6.6 09/23] iommu/arm-smmu: Clarify MMU-500 CPRE workaround
Date: Wed, 23 Oct 2024 10:30:53 -0400
Message-ID: <20241023143116.2981369-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143116.2981369-1-sashal@kernel.org>
References: <20241023143116.2981369-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.58
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_073133_028341_E47A6BF4 
X-CRM114-Status: GOOD (  12.33  )
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

From: Robin Murphy <robin.murphy@arm.com>

[ Upstream commit 0dfe314cdd0d378f96bb9c6bdc05c8120f48606d ]

CPRE workarounds are implicated in at least 5 MMU-500 errata, some of
which remain unfixed. The comment and warning message have proven to be
unhelpfully misleading about this scope, so reword them to get the point
across with less risk of going out of date or confusing users.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Link: https://lore.kernel.org/r/dfa82171b5248ad7cf1f25592101a6eec36b8c9a.1728400877.git.robin.murphy@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 9dc772f2cbb27..99030e6b16e7a 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -130,7 +130,7 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu)
 
 	/*
 	 * Disable MMU-500's not-particularly-beneficial next-page
-	 * prefetcher for the sake of errata #841119 and #826419.
+	 * prefetcher for the sake of at least 5 known errata.
 	 */
 	for (i = 0; i < smmu->num_context_banks; ++i) {
 		reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
@@ -138,7 +138,7 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu)
 		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, reg);
 		reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
 		if (reg & ARM_MMU500_ACTLR_CPRE)
-			dev_warn_once(smmu->dev, "Failed to disable prefetcher [errata #841119 and #826419], check ACR.CACHE_LOCK\n");
+			dev_warn_once(smmu->dev, "Failed to disable prefetcher for errata workarounds, check SACR.CACHE_LOCK\n");
 	}
 
 	return 0;
-- 
2.43.0


