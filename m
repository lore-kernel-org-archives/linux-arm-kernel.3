Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1EAC5DF8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4A3Mtednu7asElI1r+tS0Ghnojj12CQ+o9v9cHTTsg=; b=S7KLL0lGQOXezWelfmq220/Lia
	B2odhPFbvwq11+512oZNs1LWFRzRUxBZR4+OtMO9nEimfMEx+f+PRnL9IzdRzvGhF/tlsN5erMC2M
	OdAhi3bNlfHHkXknSuIeh4XNbjIQaNnt+CeRiVJyNrsefh6/co0GKZ+b2btW4Ee3I4uwxPYqvDbZA
	CrSO3VTmruiS5qGzj9uziTgvGrNCdrYSDqJdHCdON4lrC/sAICqBaTd2i6PHQXtbOQ+tnNsDC7tBR
	PO8qV3DrUNSa3pLiBmsBb01aLA+H+6vhzauP6WHY1TuT+n7NCR6v2f/nU7hvcaUkcrQxmhbI60uzs
	vNdysUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8BN-0000000C5tF-3wi4;
	Thu, 20 Aug 2026 19:12:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8BN-0000000C5sc-0OpJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B43BF43D4D;
	Thu, 20 Aug 2026 19:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97A49C2BCFD;
	Thu, 20 Aug 2026 19:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787253128;
	bh=ga11gBdb5eBtt5ElhIBixkEHwyzyp+XXck2vhlIjGFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JAd617qke6WhYeXp6mm3jjnGfXY7EeDzezRBCQNVNOipOX2rXLOJG60Ek4Yc/dFCz
	 wzdojLHJpujIKPaiWpRcW8T8egeqv+IyvSlU9scQII41yJ1MgIcPBTu19AAA2dwPl3
	 QBaCfU2+5p98eEvK12BOpBZuLGkjgnLlykPfrXbGYyByg8dcZWPAm2PbxVRspFv3Ru
	 tFASHlChBHKxFuN3LfXbWMmuohahLzd6uMobYMmEUhfTwdzq0uNiNIDO20MSf+1vBT
	 xz+8azPrm2QBH+iLjEPbY4EMx+VSerQGZOpktSuet2I42FQQN1YILUVtj+cmX3QVMj
	 oeogWAaz9Z4FQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FC0C5DF86;
	Thu, 20 Aug 2026 19:12:08 +0000 (UTC)
From: Markuss Broks via B4 Relay <devnull+markuss.broks.gmail.com@kernel.org>
Date: Thu, 20 Aug 2026 22:12:07 +0300
Subject: [PATCH 3/4] iommu/exynos: fix TLB invalidation for no-block
 SysMMUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-exynos-iommu-fixes-v1-3-6bbcd673bb15@gmail.com>
References: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
In-Reply-To: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Markuss Broks <markuss.broks@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787253126; l=1957;
 i=markuss.broks@gmail.com; s=20260803; h=from:subject:message-id;
 bh=HrkpBlZCi51pjFv6cW4myb/9v3ctbW7Y5uVSy6+Uxlw=;
 b=4vw4diMfzpg6jMkBwD2QGOLnKc61wkJfWQEuXDwnPSCbO5WU6JnfM39Vifoh4H+FbAxFDD6wV
 p0M+hzavBGOB8tUTLy3V1uIZ8yBWZGf0XlDyHVi71pnU0kqsYoODXCe
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=oKzGUTm30BCDqinRMpiHQqByOx1mp2mwmhg80Mv7Zg4=
X-Endpoint-Received: by B4 Relay for markuss.broks@gmail.com/20260803 with
 auth_id=911
X-Original-From: Markuss Broks <markuss.broks@gmail.com>
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
Reply-To: markuss.broks@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Markuss Broks <markuss.broks@gmail.com>

sysmmu_block() polls MMU_STATUS for the blocked state, which no-block
hardware never reports, so on such SysMMUs it always fails, and both
sysmmu_tlb_invalidate_entry() and sysmmu_tlb_invalidate_flpdcache()
skip the invalidation entirely when blocking fails.

On no-block hardware the invalidation registers are written with the
MMU running; the vendor driver never blocks around invalidation. Do
the same and write the invalidation directly. In the FLPD cache path
no-block implies a v7+ SysMMU, hence the unconditional flush-all.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/iommu/exynos-iommu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index a3a59d8a4cf1..29b27c7e400a 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -685,7 +685,14 @@ static void sysmmu_tlb_invalidate_flpdcache(struct sysmmu_drvdata *data,
 	spin_lock_irqsave(&data->lock, flags);
 	if (data->active && data->version >= MAKE_MMU_VER(3, 3)) {
 		clk_enable(data->clk_master);
-		if (sysmmu_block(data)) {
+		/*
+		 * No-block hardware accepts invalidation writes while the
+		 * MMU is running; it is also v7+, so flush-all covers the
+		 * FLPD cache.
+		 */
+		if (data->no_block) {
+			__sysmmu_tlb_invalidate(data);
+		} else if (sysmmu_block(data)) {
 			if (data->version >= MAKE_MMU_VER(5, 0))
 				__sysmmu_tlb_invalidate(data);
 			else
@@ -721,7 +728,9 @@ static void sysmmu_tlb_invalidate_entry(struct sysmmu_drvdata *data,
 		if (MMU_MAJ_VER(data->version) == 2)
 			num_inv = min_t(unsigned int, size / SPAGE_SIZE, 64);
 
-		if (sysmmu_block(data)) {
+		if (data->no_block) {
+			__sysmmu_tlb_invalidate_entry(data, iova, num_inv);
+		} else if (sysmmu_block(data)) {
 			__sysmmu_tlb_invalidate_entry(data, iova, num_inv);
 			sysmmu_unblock(data);
 		}

-- 
2.55.0



