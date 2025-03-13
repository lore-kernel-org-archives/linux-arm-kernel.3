Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7959C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SG/6dRrGjiIzzNMMAPTUFEne/bo220tw89x3Y8yNDyc=; b=hC403AaEiNEMFUEpvuyj1fEEsI
	DA9fxIiA+z3MFC7Dhl6YHTg4+GLctMhtNYyfcMH34gva0sn6wDwutsWtnW+bKQWTHj9UlxQrBQS04
	fWfq10riZEWRKZmBBiObjferl2nv6GGi+7NJjQ7TYooNk3+S3Y2ehmVLi73Ht8Gfy0UbFCvgo+nBB
	9rSbt74JwYirHSiJD7BGcS/yuiJIjMF0tO/gFnQNZiDX4AhykkaSmcNR2TBtGOo7+jag9dBb3G6gk
	XUqGP9Xyd0sR2xw+WZoU7lcWQ8MIOB7X93D2A/VFY7trsuNb1ErEgBbpnDcAMKcbo5OmDG2MPg3a1
	gTbB71uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmu3-0000000C6TU-40tl;
	Thu, 13 Mar 2025 18:03:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmOq-0000000C32g-1Zp9;
	Thu, 13 Mar 2025 17:31:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5F16150C;
	Thu, 13 Mar 2025 10:31:25 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5101C3F673;
	Thu, 13 Mar 2025 10:31:14 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: iommu@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	heiko@sntech.de,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 1/3] iommu/rockchip: Allocate per-device data sensibly
Date: Thu, 13 Mar 2025 17:31:04 +0000
Message-Id: <771e91cf16b3048e93f657153b76905665878fa2.1741886382.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1741886382.git.robin.murphy@arm.com>
References: <cover.1741886382.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_103116_458725_096EBD4C 
X-CRM114-Status: UNSURE (   9.62  )
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

Now that DT-based probing is finally happening in the right order again,
it reveals an issue in Rockchip's of_xlate, which can now be called
during registration, but is using the global dma_dev which is only
assigned later. However, this makes little sense when we're already
looking up the correct IOMMU device, who should logically be the owner
of the devm allocation anyway.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/rockchip-iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 323cc665c357..48826d1ccfd8 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1148,12 +1148,12 @@ static int rk_iommu_of_xlate(struct device *dev,
 	struct platform_device *iommu_dev;
 	struct rk_iommudata *data;
 
-	data = devm_kzalloc(dma_dev, sizeof(*data), GFP_KERNEL);
+	iommu_dev = of_find_device_by_node(args->np);
+
+	data = devm_kzalloc(&iommu_dev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	iommu_dev = of_find_device_by_node(args->np);
-
 	data->iommu = platform_get_drvdata(iommu_dev);
 	data->iommu->domain = &rk_identity_domain;
 	dev_iommu_priv_set(dev, data);
-- 
2.39.2.101.g768bb238c484.dirty


