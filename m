Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2522AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qW5gE1SVXsLM75dbtLqJZ3ORODL9ZvjSk2AUw9e0oKo=; b=A9DfVTQ7JgWU+bj2BCQy4f6PIg
	I1xlakQ/2jfYmeXp1h5csfECZHwBlyL5fMusQp9zgJeUNhdkY+xYTIX6JNYVTgNO9C4daRbLrjcwn
	PQWyVJJBV8rVURVDzdoEl1AsM5rZTRMTDkkzG+wSXp1tflFwZv/6NaClbEgmEQtZ96POjwsbhzxid
	gqeV5uyjWIuYY1uXCCEAORhuYMg+3rQhr/W/OKbdVVvDsANJwN1KkAaHoaTzHh7j9xqguuAtkTa7G
	r+Ipar7lhAeBshBrK+9OcL+t203tAVf9p46tGG0Bwhzo0eb7vBuKX8BtPKoTX8LqOtiDDkA9LsK3m
	Ma8yTTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmu5-0000000C6Un-0Ykb;
	Thu, 13 Mar 2025 18:03:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmOr-0000000C33G-2Als;
	Thu, 13 Mar 2025 17:31:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23CA11515;
	Thu, 13 Mar 2025 10:31:27 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D1D533F673;
	Thu, 13 Mar 2025 10:31:15 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: iommu@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	heiko@sntech.de
Subject: [PATCH 2/3] iommu/rockchip: Register in a sensible order
Date: Thu, 13 Mar 2025 17:31:05 +0000
Message-Id: <e69532f00bf49d98322b96788edb7e2e305e4006.1741886382.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1741886382.git.robin.murphy@arm.com>
References: <cover.1741886382.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_103117_607872_CAC0CD46 
X-CRM114-Status: GOOD (  11.23  )
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

Currently Rockchip calls iommu_device_register() before it's finished
setting up the hardware and driver state, and as such it now gets
unhappy in various ways when registration starts working the way it was
always intended to, and probing client devices straight away. Reorder
the operations to ensure that what we're registering is a prepared and
functional IOMMU instance.

Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/rockchip-iommu.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 48826d1ccfd8..9d2120a9232a 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1256,14 +1256,6 @@ static int rk_iommu_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = iommu_device_sysfs_add(&iommu->iommu, dev, NULL, dev_name(dev));
-	if (err)
-		goto err_unprepare_clocks;
-
-	err = iommu_device_register(&iommu->iommu, &rk_iommu_ops, dev);
-	if (err)
-		goto err_remove_sysfs;
-
 	/*
 	 * Use the first registered IOMMU device for domain to use with DMA
 	 * API, since a domain might not physically correspond to a single
@@ -1290,12 +1282,19 @@ static int rk_iommu_probe(struct platform_device *pdev)
 
 	dma_set_mask_and_coherent(dev, rk_ops->dma_bit_mask);
 
+	err = iommu_device_sysfs_add(&iommu->iommu, dev, NULL, dev_name(dev));
+	if (err)
+		goto err_pm_disable;
+
+	err = iommu_device_register(&iommu->iommu, &rk_iommu_ops, dev);
+	if (err)
+		goto err_remove_sysfs;
+
 	return 0;
-err_pm_disable:
-	pm_runtime_disable(dev);
 err_remove_sysfs:
 	iommu_device_sysfs_remove(&iommu->iommu);
-err_unprepare_clocks:
+err_pm_disable:
+	pm_runtime_disable(dev);
 	clk_bulk_unprepare(iommu->num_clocks, iommu->clocks);
 	return err;
 }
-- 
2.39.2.101.g768bb238c484.dirty


