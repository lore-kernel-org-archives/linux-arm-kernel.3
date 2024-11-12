Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A302BD42B8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P444EYBYC759Lw3rpDxhDogwUcjfftSEtX1twQpyH7g=; b=dhjFR5sPrshg6GgEV4wbWOENus
	/txWSk6p02zu03dGC79c3osYT6SKNsgbgil6eX7ZVqrm/y6v2zMLOmUFJ+8zF7JWEot3Pk+IRWKaM
	xoBgjNBZWFHtrECoSW4QAwD6W8/iLY+dyjQBh+KrROeYI3+gyjLZ6a09x9dExKlAy7bveoFKDzTaI
	HfSBjcCGXCihqjOsGKjfmPRO7XSmNDmBqA2SUmMx02sZrJ1ABr/JdlWLYodPufWGGY3/sy81/gNyG
	KUUVls1ZllXBioOfsFpqK8O50WHAIBtskyo2DUh2Uu1R2Z7LGoF3WwHWwJ4DVUj2m7zOWrzxZw7jx
	AwXr0zFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsLV-00000003qz2-02Qd;
	Tue, 12 Nov 2024 14:58:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsDV-00000003p7l-1WFc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 14:50:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5937A25E3;
	Tue, 12 Nov 2024 06:50:34 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84F1F3F66E;
	Tue, 12 Nov 2024 06:50:03 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2.5/3] iommu/arm-smmu-v3: Undo SMMU enable on probe failure
Date: Tue, 12 Nov 2024 14:49:59 +0000
Message-Id: <0812e9f61234cbcdc5cab7de307e1c9a8e3c9498.1731422868.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1731088789.git.robin.murphy@arm.com>
References: <cover.1731088789.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_065005_464524_C9F45BD6 
X-CRM114-Status: UNSURE (   9.22  )
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

If SMMU probe fails afer arm_smmu_device_reset(), we leave the SMMU
enabled with an empty Stream Table, silently blocking all DMA. This
proves rather annoying for debugging said probe failure, so let's handle
it a bit better by putting the SMMU back into (more or less) the same
state as if it hadn't probed at all.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 7908fca962fe..566d66e9c91e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4640,6 +4640,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	iommu_device_sysfs_remove(&smmu->iommu);
 free_iopf:
 	iopf_queue_free(smmu->evtq.iopf);
+	arm_smmu_device_disable(smmu);
 	return ret;
 }
 
-- 
2.39.2.101.g768bb238c484.dirty


