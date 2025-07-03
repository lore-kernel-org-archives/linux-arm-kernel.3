Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EDBC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bbyCA7u4oRyb4IfwLbd0OeJ+mk3+/I0J5p5dTLG50kI=; b=aImX1lrfDrEV7jcr68vuxZ+jMT
	pi2KRrN7XBPOq9l8PPfzjVT+mUD12+rsMRKGjDia+VOrDwuryMb3VnSLqpCojcgFT1H8P2DX2LLP2
	WafzrbXYnMFh9m9pVdOV9ndDSkPBKVAtPG+LKBTmL13nDtiSmwCn49Q+lG49NjMQ1by+ESwZmv9Ut
	gp3IxFN1vIKrpFR9wUXbqkZQIpWoYZ8iSjtxMLnRtKT5JZwJl786lemk16qxYOfIpWW5wDiXl4WB7
	N+22K2ycLAjYzczjuTXwxKZEcTHk3P7tueBjCjrF4uyeChitVBoX6E0c4IwTaALOPJb3i2Y4+p6Gg
	/kfodTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSLW-0000000CiYk-0H0H;
	Thu, 03 Jul 2025 22:23:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOmd-0000000CFcU-0HqN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9599B5C546D;
	Thu,  3 Jul 2025 18:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4F4C4CEE3;
	Thu,  3 Jul 2025 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567742;
	bh=IC0AaW5NceEW8wxtKNxGomplDZEXFb+Zwef0eWisnmM=;
	h=From:To:Cc:Subject:Date:From;
	b=PheJp7dWH1mp9+0iIi+SIENaoI39JddxSfVd9oADxS2XX9TvHBmG8aVj5XsY99dtU
	 8GAh+dffJIKsFZ87UQTsXNggJL2zVcssdldw1A/BPNtjcUGxZyfkO19lnr+vK3Ranr
	 nVI1qh0IZZ5HuI7yfcgdZeHuio9qskwZ7ooRvlHSgai/C6+YjSFCPthc8wDkg2p19s
	 smvV/H1emWZbk3ie33DnFEt5FzUk2naSynnrHwRE0iNQ20RArlo+bL8Avz5McfVqaJ
	 lzQDY2QlYjYs2khC6a74BnjN/pY7fzWFIhwOD65jbP652AkmRX03pqBcST9M8yjwDc
	 Ub8ed2A0aHHWA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: stm32-ospi: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:35:37 -0500
Message-ID: <20250703183537.2075746-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_113543_147181_54EB903D 
X-CRM114-Status: GOOD (  12.41  )
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

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/spi/spi-stm32-ospi.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 7c1fa55fbc47..fbf00909b6c5 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -771,7 +771,7 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_ospi *ospi = platform_get_drvdata(pdev);
-	struct resource *res;
+	struct resource *res, _res;
 	struct reserved_mem *rmem = NULL;
 	struct device_node *node;
 	int ret;
@@ -825,17 +825,13 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 			goto err_dma;
 	}
 
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (node)
-		rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-
-	if (rmem) {
-		ospi->mm_size = rmem->size;
-		ospi->mm_base = devm_ioremap(dev, rmem->base, rmem->size);
+	res = &_res;
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, res);
+	if (!ret) {
+		ospi->mm_size = resource_size(res);
+		ospi->mm_base = devm_ioremap_resource(dev, res);
 		if (!ospi->mm_base) {
-			dev_err(dev, "unable to map memory region: %pa+%pa\n",
-				&rmem->base, &rmem->size);
+			dev_err(dev, "unable to map memory region: %pR\n", res);
 			ret = -ENOMEM;
 			goto err_dma;
 		}
-- 
2.47.2


