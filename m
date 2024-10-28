Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94513D339AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKs1RKbi5ql42C9tWBVv87+H/Yk19C0NmjTIvYROwUI=; b=RjRQh3uDYvniZMbwyBmgjRJl9U
	Agf/tzVrSZR4JZ8hiqd+eW9TcfJXWh5GgPg0/hN5uW4AkenxLtxwpA9g5BHEA0rERYIFw3foyXZg5
	dUbYaXiVnf/XtQELd/d4rLaCEYFV55wYrF8QHU7gHJ2xlfmfzD+oXHpYqRNRpYzW3LIZmqsTScMB3
	/arKRDcVCfKLqcJpdjXNlqBZlcYQE0904NjT63gcmDbwPrSLsdAbLMQ29EbEq5/qDCWs+5TvWucMU
	bmhOGLeHkl3is8GYbnZR1u8HuMxDZSAdwHcTkMCxMKGw+n0aSoI1D22NSj1+DTLkt1XYMC0oqQLax
	1tsEtguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UGF-0000000BmFQ-1yyZ;
	Mon, 28 Oct 2024 18:14:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5U0v-0000000BjMG-2To7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:58:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0511213D5;
	Mon, 28 Oct 2024 10:59:19 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 421D43F66E;
	Mon, 28 Oct 2024 10:58:47 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: hns@goldelico.com,
	b-padhi@ti.com,
	andreas@kemnade.info,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/4] remoteproc/omap: Handle ARM dma_iommu_mapping
Date: Mon, 28 Oct 2024 17:58:35 +0000
Message-Id: <6186e311cb6f64a787f87fd41e49a73f409b789c.1730136799.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_105849_695897_D500C00E 
X-CRM114-Status: GOOD (  12.01  )
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

It's no longer practical for the OMAP IOMMU driver to trick
arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
the arch code's dma_iommu_mapping out of the way to avoid problems.

Fixes: 4720287c7bf7 ("iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/remoteproc/omap_remoteproc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 9ae2e831456d..3260dd512491 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -37,6 +37,10 @@
 
 #include <linux/platform_data/dmtimer-omap.h>
 
+#ifdef CONFIG_ARM_DMA_USE_IOMMU
+#include <asm/dma-iommu.h>
+#endif
+
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
 
@@ -1323,6 +1327,19 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	/* All existing OMAP IPU and DSP processors have an MMU */
 	rproc->has_iommu = true;
 
+#ifdef CONFIG_ARM_DMA_USE_IOMMU
+	/*
+	 * Throw away the ARM DMA mapping that we'll never use, so it doesn't
+	 * interfere with the core rproc->domain and we get the right DMA ops.
+	 */
+	if (pdev->dev.archdata.mapping) {
+		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(&pdev->dev);
+
+		arm_iommu_detach_device(&pdev->dev);
+		arm_iommu_release_mapping(mapping);
+	}
+#endif
+
 	ret = omap_rproc_of_get_internal_memories(pdev, rproc);
 	if (ret)
 		return ret;
-- 
2.39.2.101.g768bb238c484.dirty


