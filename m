Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA64E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhkDNu8xEtmYmXc4rSWaSCSwQ3eFKhPgOlMt0OzpZGs=; b=XgJGZP3AkinysLhUdDVAdFyJXV
	GmCjwreXPsMPFKh1MVlZg6VcgWXbHmA4ILX2V0xrWlEpvgWZm+YcchbZyje5GaaSpA6gP9KgSoyH/
	AJYrZ2BbiS5WD8DFQs3xPnbpRMy6BYjv0AiXPwmJDtgW1NnNAcIF/a4J5CBjnhZ3Kif8lIeXJAr4F
	aEf1Na/jXGeyITvsvPxFgm9rAg4bcPN7TWzPHeuEc92YWjV5abXqPVUdk27XoIwZuUsFvlAvsAS+C
	r+3XDe0si/cImugvZULCrpSAN7yUJ+1D3ZHQdUnYfFVVLW39lVV/tC8sogI800Q71agiedFGwEdBb
	rPwbMDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEqp-0000000Gm5T-0TUw;
	Thu, 05 Dec 2024 16:37:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEnp-0000000GlZK-1yqu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:34:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29AA016F8;
	Thu,  5 Dec 2024 08:34:37 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37F063F5A1;
	Thu,  5 Dec 2024 08:34:08 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	quic_pbrahma@quicinc.com
Subject: [PATCH v2 2/4] iommu/arm-smmu: Retire probe deferral workaround
Date: Thu,  5 Dec 2024 16:33:56 +0000
Message-Id: <4167c5dfa052d4c8bb780f0a30af63dcfc4ce6c1.1733406914.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1733406914.git.robin.murphy@arm.com>
References: <cover.1733406914.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_083409_547112_758D0B62 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

This reverts commit 229e6ee43d2a160a1592b83aad620d6027084aad.

Now that the fundamental ordering issue between arm_smmu_get_by_fwnode()
and iommu_device_register() is resolved, the race condition for client
probe no longer exists either, so retire the specific workaround.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: New

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0949f2734e5d..79afc92e1d8b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1437,17 +1437,6 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 			goto out_free;
 	} else {
 		smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
-
-		/*
-		 * Defer probe if the relevant SMMU instance hasn't finished
-		 * probing yet. This is a fragile hack and we'd ideally
-		 * avoid this race in the core code. Until that's ironed
-		 * out, however, this is the most pragmatic option on the
-		 * table.
-		 */
-		if (!smmu)
-			return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER,
-						"smmu dev has not bound yet\n"));
 	}
 
 	ret = -EINVAL;
-- 
2.39.2.101.g768bb238c484.dirty


