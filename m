Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BD5C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 02:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RCYfV/skPLARVSorP7PZJEmoYaVmrx4b6IPq4/bP+4I=; b=P/xXA0fdX4W9qMjGpQqud00oF7
	eqPI7KnnWKogqezv4iXAaQEhhbgMiBXy0ZN6B7y+s50VZUVY6WPJzfGb2SZj65b0bD9Gu6Pggu/+S
	bXwpiJwFCg33d7/Q1CtW24wVkGptsqgRorEwssQkXdcl50PGG9SrXrSu9qKeefnh/UrAIKgwDZBgK
	mIKBxCQ9cXtqjUzEQcWKurCSjU/iOV+YaEDBUdIvDLBQ8TtoDdwxqQW+Iy/qd7fYNdrDmU8M8sJON
	QPKkRUtX7ZbyeuOpct6zy8iKzxeqiw1xI8ZaCuCCy0RSM2VetXVTh6Hjuo75+suksojLRdyJcCsda
	KKWbHJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKOx-00000007AJO-3B53;
	Wed, 09 Jul 2025 02:19:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKMX-00000007ADj-20dk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 02:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBF555C655E;
	Wed,  9 Jul 2025 02:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F00C4CEED;
	Wed,  9 Jul 2025 02:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752027404;
	bh=W34gJZJ0Sfv42p0qrt0l9Q2E2RvLRp6jugQiTNTywbQ=;
	h=From:To:Cc:Subject:Date:From;
	b=NYuBtwURYidvFrxE2AGzKqfUZEwQg0sXZHw9tBkUQqrEGAg5kj/AB3C8AlscQh32C
	 Gg53ryOb/isxZK9bck+A3vH+ri0b6mZWiroR5GCMknrmp9Ejnge7Cq7iW1rOsaj8TM
	 3vIvhYp6t0TEMpwfhq22KtJmK1xOA1Bo3VUFiQkCSUUBmjUlwBTRJEWtEX46peQHoe
	 As7yzZWmW24q4FB5mE7Lm0QvRCGAce5DJwHDMyEm1pqXeUHEwsIZSdxShKj1RKfA1U
	 3o7GLzCue1reKRq2PTYr1wl4zfIpZ53k1Y1kqOvFR6f0dvkgnlMlx6rsXoYxsJ+pag
	 +GMqZeG2WrOyw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] spi: stm32-ospi: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Tue,  8 Jul 2025 21:16:37 -0500
Message-ID: <20250709021638.2047365-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_191645_558978_61965314 
X-CRM114-Status: GOOD (  12.72  )
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
v2:
 - Fix unused variable warnings
---
 drivers/spi/spi-stm32-ospi.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 7c1fa55fbc47..4753e02a7d2f 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -771,9 +771,7 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_ospi *ospi = platform_get_drvdata(pdev);
-	struct resource *res;
-	struct reserved_mem *rmem = NULL;
-	struct device_node *node;
+	struct resource *res, _res;
 	int ret;
 
 	ospi->regs_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
@@ -825,17 +823,13 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
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


