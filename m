Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F036C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aS2qqHcm6zQyufR12sJ8du8H5X5aWLXjVp9+B4ePgGM=; b=nbZ2ElYQ7BaSO7AnNDS1MYxEvx
	OI/Rsz16/9d4BVZi+d1sKnx2IuT+43ONkOskrA25BrzjfbqVsFBiVM30vTjgTrydGhao9Vyy62+Hx
	vo93owi6jvn4yKmZZWr9ADo+eo4cSxbRf79aDebiud/aXncacpm6KhY6W8z1m0Yjx1nJDZvmG4nFj
	y57CROPTknPR0p2gizO+HU52lL6ZyzqS0VsAePevDRf389CgsG03dL9bprgcQeYCbIvIYB0cdcpKl
	/0NRWrpquAXinhWl/jEi4kzgRonXMTvXaJ1h2DD9m9CN5eLQBrPOrNLRZsPlBCNE2Ps3HQ3JGA72g
	aAUH/Bbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSEX-0000000ChrE-2Wam;
	Thu, 03 Jul 2025 22:16:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOm9-0000000CFW2-3ufm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:35:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FB6261151;
	Thu,  3 Jul 2025 18:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD4AC4CEE3;
	Thu,  3 Jul 2025 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567713;
	bh=g2Jp3nFdzDCpqkTRi8VIAw0hMS6wPtk21mPBmhu++tY=;
	h=From:To:Cc:Subject:Date:From;
	b=RUzjlcwoLNijbmZtgaC063oZlSftT7OSR304vJ9hQCLhQ2N7gpBcQugMFgMqt+Yw8
	 K0LHrYDwbktvSF8uFo7QgTyp+FqIsgQxyJYXlxCXumvxcgO66j3jGYMGwgJ5bEWxQh
	 YkDA9rcwST1+/KaSOXbpWehG/bBuswMqtL4k1+4uE0tIbI7UjWa36WMpRurUt6JNAX
	 J13miDVT7bMAWypLXEhgcMU0O9+pgPcBRpGq8VzNSL5HOGaXu3MzU6IGEPJjGIBG3F
	 8EECS6h72sov1okm2KGFkgHYYVLPhg6jjk+EkRQ1uB3u1OBNlxwsY7+FlItcfocorJ
	 bfuhlI35Ki8qw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: aspeed: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:35:07 -0500
Message-ID: <20250703183508.2074735-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The error handling is a bit different. "memory-region" is optional, so
failed lookup is not an error. But then an error in
of_address_to_resource() is treated as an error. However, that
distinction is not really important. Either the region is available
and usable or it is not. So now, it is just
of_reserved_mem_region_to_resource() which is checked for an error.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 14 +++-----------
 drivers/soc/aspeed/aspeed-p2a-ctrl.c | 14 +++-----------
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index ee58151bd69e..b7dbb12bd095 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -10,6 +10,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/regmap.h>
@@ -254,17 +255,8 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, lpc_ctrl);
 
 	/* If memory-region is described in device tree then store */
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (!node) {
-		dev_dbg(dev, "Didn't find reserved memory\n");
-	} else {
-		rc = of_address_to_resource(node, 0, &resm);
-		of_node_put(node);
-		if (rc) {
-			dev_err(dev, "Couldn't address to resource for reserved memory\n");
-			return -ENXIO;
-		}
-
+	rc = of_reserved_mem_region_to_resource(dev->of_node, 0, &resm);
+	if (!rc) {
 		lpc_ctrl->mem_size = resource_size(&resm);
 		lpc_ctrl->mem_base = resm.start;
 
diff --git a/drivers/soc/aspeed/aspeed-p2a-ctrl.c b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
index 6cc943744e12..3be2e1b1085b 100644
--- a/drivers/soc/aspeed/aspeed-p2a-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
@@ -19,7 +19,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -334,7 +334,6 @@ static int aspeed_p2a_ctrl_probe(struct platform_device *pdev)
 	struct aspeed_p2a_ctrl *misc_ctrl;
 	struct device *dev;
 	struct resource resm;
-	struct device_node *node;
 	int rc = 0;
 
 	dev = &pdev->dev;
@@ -346,15 +345,8 @@ static int aspeed_p2a_ctrl_probe(struct platform_device *pdev)
 	mutex_init(&misc_ctrl->tracking);
 
 	/* optional. */
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (node) {
-		rc = of_address_to_resource(node, 0, &resm);
-		of_node_put(node);
-		if (rc) {
-			dev_err(dev, "Couldn't address to resource for reserved memory\n");
-			return -ENODEV;
-		}
-
+	rc = of_reserved_mem_region_to_resource(dev->of_node, 0, &resm);
+	if (!rc) {
 		misc_ctrl->mem_size = resource_size(&resm);
 		misc_ctrl->mem_base = resm.start;
 	}
-- 
2.47.2


