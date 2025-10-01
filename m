Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C27CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2CBn8iy9Ks/WyNgBKbgxVeaugrKtVcmImy4dqYBWyk=; b=09WzvwVYvEKLjh9sYJGuYKAw1A
	0/uFGE3M/GY7LbZ52k4Z9G/qXztYo2HqnpcDTJf8Ox4yNo0iLsWvvbGxE98R/E6z44n9QgH9uZvBB
	p/953E2IrIRoPBKSyXPlvbd+5VTOBudpYeqQrV0WyOKJgppMen+fMlQ0pPRV0Ye3PINZheFmlN4rR
	SlVfQEqXrooZZDfxUy86LZIXhuH4VDERL2ok+jti3o6E1NSYnLXFc1SEtkM9MhmKSdCko+Xvuu+Zd
	OPLEH5orsLcGa8YpKot6ab+aJat6um6n+7Nlo+DGH1O4IxXvoYGnDDXfENO3C8wOY5uNPurh9aM+F
	/jq4AXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uyb-00000007Njz-1Ur5;
	Wed, 01 Oct 2025 11:26:29 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uyZ-00000007Nai-0V2Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:26:28 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 1 Oct
 2025 19:26:05 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 1 Oct 2025 19:26:05 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 6/6] spi: aspeed: Only map necessary address window region
Date: Wed, 1 Oct 2025 19:26:05 +0800
Message-ID: <20251001112605.1130723-7-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001112605.1130723-1-chin-ting_kuo@aspeedtech.com>
References: <20251001112605.1130723-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_042627_162676_B5769C92 
X-CRM114-Status: GOOD (  16.63  )
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

Previously, the driver mapped the entire SPI address decoding region during
probe. On systems with small flash or limited memory, this could lead to
excessive memory usage or allocation failures.

This patch changes the strategy to initially map a small address window
for SPI flash device probing. After determining each chip select's flash
size, the driver unmaps the temporary region and remaps only the required
address window accordingly.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 39 +++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 4f6ae48dd904..0c3de371fd39 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -96,7 +97,6 @@ struct aspeed_spi {
 	const struct aspeed_spi_data	*data;
 
 	void __iomem		*regs;
-	void __iomem		*ahb_base;
 	u32			 ahb_base_phy;
 	u32			 ahb_window_size;
 	u32			 num_cs;
@@ -394,6 +394,13 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi)
 	u32 cs;
 	size_t window_size;
 
+	for (cs = 0; cs < aspi->data->max_cs; cs++) {
+		if (aspi->chips[cs].ahb_base) {
+			iounmap(aspi->chips[cs].ahb_base);
+			aspi->chips[cs].ahb_base = NULL;
+		}
+	}
+
 	for (cs = 0; cs < aspi->data->max_cs; cs++) {
 		seg_reg = seg_reg_base + cs * 4;
 		seg_val_backup = readl(seg_reg);
@@ -425,13 +432,29 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi)
 		else
 			dev_dbg(dev, "CE%d window closed\n", cs);
 
-		aspi->chips[cs].ahb_base = aspi->ahb_base + offset;
 		offset += window_size;
 		if (offset > aspi->ahb_window_size) {
 			dev_err(dev, "CE%d offset value 0x%llx is too large.\n",
 				cs, (u64)offset);
 			return -ENOSPC;
 		}
+
+		/*
+		 * No need to map the address deocding range when
+		 * - window size is 0.
+		 * - the CS is unused.
+		 */
+		if (window_size == 0 || cs >= aspi->num_cs)
+			continue;
+
+		aspi->chips[cs].ahb_base =
+			devm_ioremap(aspi->dev, start, window_size);
+		if (!aspi->chips[cs].ahb_base) {
+			dev_err(aspi->dev,
+				"Fail to remap window [0x%.9llx - 0x%.9llx]\n",
+				(u64)start, (u64)end - 1);
+			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -447,7 +470,9 @@ static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 
 	/* No segment registers for the AST2400 SPI controller */
 	if (aspi->data == &ast2400_spi_data) {
-		aspi->chips[0].ahb_base = aspi->ahb_base;
+		aspi->chips[0].ahb_base = devm_ioremap(aspi->dev,
+						       aspi->ahb_base_phy,
+						       aspi->ahb_window_size);
 		aspi->chips[0].ahb_window_size = aspi->ahb_window_size;
 		return 0;
 	}
@@ -839,10 +864,10 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	if (IS_ERR(aspi->regs))
 		return PTR_ERR(aspi->regs);
 
-	aspi->ahb_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
-	if (IS_ERR(aspi->ahb_base)) {
-		dev_err(dev, "missing AHB mapping window\n");
-		return PTR_ERR(aspi->ahb_base);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (IS_ERR(res)) {
+		dev_err(dev, "missing AHB memory\n");
+		return PTR_ERR(res);
 	}
 
 	aspi->ahb_window_size = resource_size(res);
-- 
2.34.1


