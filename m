Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C434DCF5397
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKoI9dEllx1TNgC9xZVCozD6BRiFRJgzuEW3oaX71qI=; b=DUnwfT6FZPlasR3cOFFQY/TKk8
	jKJ4tejqIRiyP3OuzKikniJcYCSpry17RcFRzf9vEf2jxWaRD/N4BO0Kd/uupf0TOdXvwfuStZeNn
	EXpwpRd5He+vRgQjpHPDrvM9sg4dtth22HsF/ESytbOtVa7xk92oY5tPTSl/W2lHw+oQ5lAu4GA+F
	gAybmGHu85JQzxGjCH4P5rrphxafcowO/YbSeXt+UUtoPkoLsbZBFD5fFtWGMC99b5ZmjlLYt6BHy
	Q793TV/rOAl8rsMxnzq2zHIdhYj1JCYmwhVAS4mpth8vmhGm3B2ByqWPzY5DTlYiDuSvqzKPcR+C5
	hhyER+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cPP-0000000EiMK-00BG;
	Wed, 23 Oct 2024 14:32:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cNd-0000000EhbT-125x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2ED895C57F9;
	Wed, 23 Oct 2024 14:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5EAC4CEC6;
	Wed, 23 Oct 2024 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693832;
	bh=DTPT4zl44npMYzjERrEH9EvBCMsinVpzO0mfU1W/K+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gZZGLJl+iG9JdNz/tDltYSPBH+P1BzVIeOb+X5mKKGdkSzWrFAIDwkXVngoUfzLxe
	 Txo7XVFgUlnmwc4msYAbE94uBGxmYdHMhO4Qx+psH5nrx8ZAM0PBGGCY+tLvvgULSx
	 VBCfOWwe4kx8U2ICOoQus9DH0OBEc7L+k02XMaA9UBKX4PeyTDqihClw36LggcEoYt
	 RlJbMeDI2IdI4oxEy+mstaLK57kwSWlxi5qnzHMfhOAbl20aMkKJQuIuKhxOcD2ah4
	 Xk6GdgIBTT74600jLyBof/AxR2HNo+cud8fpLegrixWTzdJFo+/VZWRnYoCb4ypW5x
	 inqT+FU0B23ig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Subject: [PATCH AUTOSEL 6.11 12/30] iommu/arm-smmu: Clarify MMU-500 CPRE workaround
Date: Wed, 23 Oct 2024 10:29:37 -0400
Message-ID: <20241023143012.2980728-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143012.2980728-1-sashal@kernel.org>
References: <20241023143012.2980728-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_073033_356241_2B49AD7F 
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


