Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E15C83028
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Qc5jiBQI96Q1vkjxrTeiie4o/Bqp2odIBowBozZGiY=; b=Vg+AcHGgPw7leIId1Y4klCAy6H
	aamZifv86BMzwkE6SZxZxNCi6HkTmsXBeYvH60OmHZ2Hy9XNTKvYt4vxtkNHDYPfo9CBdOTThRy2k
	D6tWWwByxPvvgqgb+CScZHG9WKimvsx1HoTkGxaTPJW95zlh6VTY3iKXWfY8CnA92kbtDUoC0szpX
	NW0JdZjTPPkfHZSB/T1jq61/m1NogdaNH/NhskFJ6TLfU6bfTrZj0jXCFXtAZV/U4kkCRzYH869U4
	M+/wTQTTmL4+WMjoLSO/3b7RF4Z/49TkTb0XCmlHYmrW2+nPUb/VMNkFA/aK6guWB3BIgSjx2tnpo
	BL4230ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAv5-0000000F4CS-3nyX;
	Fri, 27 Jun 2025 15:23:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAfj-0000000F0cy-0ah0;
	Fri, 27 Jun 2025 15:07:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C92EF1A00;
	Fri, 27 Jun 2025 08:07:04 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B9E403F66E;
	Fri, 27 Jun 2025 08:07:20 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	yong.wu@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] iommu/mediatek-v1: Tidy up probe_finalize
Date: Fri, 27 Jun 2025 16:07:10 +0100
Message-Id: <7c78149504900bc6c98a9c48f4418934b72d89ac.1751036478.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_080723_217503_BEECDE65 
X-CRM114-Status: GOOD (  11.10  )
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

Krzysztof points out that although the driver now supports COMPILE_TEST
for other architectures, it does not build cleanly with W=1 where the
stubbed-out ARM API can lead to an unused variable warning.

Since this is effectively the correct intent of the code in such cases,
mark it as __maybe_unused, tidying up some cruft in the process.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

Since I'd already got as far as thinking this through, I figure I may
as well save Krzysztof the trouble of rewriting it :)
 
 drivers/iommu/mtk_iommu_v1.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 66824982e05f..2fc18e194e19 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -509,14 +509,10 @@ static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 
 static void mtk_iommu_v1_probe_finalize(struct device *dev)
 {
-	struct dma_iommu_mapping *mtk_mapping;
-	struct mtk_iommu_v1_data *data;
+	__maybe_unused struct mtk_iommu_v1_data *data = dev_iommu_priv_get(dev);
 	int err;
 
-	data        = dev_iommu_priv_get(dev);
-	mtk_mapping = data->mapping;
-
-	err = arm_iommu_attach_device(dev, mtk_mapping);
+	err = arm_iommu_attach_device(dev, data->mapping);
 	if (err)
 		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
 }
-- 
2.39.2.101.g768bb238c484.dirty


