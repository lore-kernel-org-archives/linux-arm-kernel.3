Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04773C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPBwsnJctpCGo+Gv5aaUHeSE9XwloUJj+xf/DjxcQs0=; b=2v557qr/UgMmxboN5T6vOzGVkA
	XKaCG4MkVMPK0YLKSwwkAFGeNeGhwVov85chw2Pz5yn2FkMhyiopfeIOUu6owm1jrYoY1bRWtJys5
	d4HK02mJBFITVCwOLhhsS42cKLXLxisTqfUcPjEuXAKvUeHbvz4tCr2FYO4nzw4cwjjjpotyfV/0w
	xBjQ/SpVZ898hxXdzqec92OZVtUwsIVOkHYtPZaB/HaobP1pY6kMQBsmIJ8Bq8G/KKp5HSlOXFjVj
	JVLU4o9I3ZeQ5EMskadlgMR2Ut7KWezxBNtejc1tehLauOmAWKpceiaz73Gqk31muaPVt4W63fs7M
	cx4XXE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Ys-0000000HC3l-09w3;
	Thu, 03 Sep 2026 11:24:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Yr-0000000HC38-1WB2;
	Thu, 03 Sep 2026 11:24:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C80424192E;
	Thu,  3 Sep 2026 11:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C001F000E9;
	Thu,  3 Sep 2026 11:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788434692;
	bh=kPBwsnJctpCGo+Gv5aaUHeSE9XwloUJj+xf/DjxcQs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e5UXzvW7R7eEeXeftP6MoE9NDW/GmS2pyb4lsGGp8y9SyrjXqASeetiJpubN3ZBad
	 B7TYibV3V/v46ob7XzfdXxP06v9ZoP7RYK6RDobkDtH7GBt194j5kt2SH2irjHQqRz
	 KKZF/V7Qub1X87fW+5v4WAPWdMgIRtE8ASqE4xsRHSiK18rUAHdmGj7tYNVwzYskV/
	 1pYdbh/zgdiunNU07b3ZmqVwVceArrw+f+YNidUrM8rgrvCqvQvjS7sflayjohjHtK
	 5/RbH/phI6oCDszTQW3x+AMk/irIiabZW7s0wFmQc7nZ2VwYoTtukT9dVo7ziL4ptS
	 DHx1AquViRdlQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] mtd: rawnand: lpc32xx_slc: Remove platform data support
Date: Thu,  3 Sep 2026 14:24:23 +0300
Message-ID: <20260903112425.1904748-2-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260903112425.1904748-1-vz@kernel.org>
References: <20260903112425.1904748-1-vz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since NXP LPC32xx SoC support in the Linux kernel strictly depends on
device tree support, the unused platform data support can be removed
from the NAND SLC driver.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 21 ++-------------------
 include/linux/mtd/lpc32xx_slc.h    | 17 -----------------
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 include/linux/mtd/lpc32xx_slc.h

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 10c8080207f4..b4d90afa9267 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -25,7 +25,6 @@
 #include <linux/dmaengine.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/mtd/lpc32xx_slc.h>
 
 #define LPC32XX_MODNAME		"lpc32xx-nand"
 
@@ -213,7 +212,6 @@ struct lpc32xx_nand_cfg_slc {
 
 struct lpc32xx_nand_host {
 	struct nand_chip	nand_chip;
-	struct lpc32xx_slc_platform_data *pdata;
 	struct clk		*clk;
 	struct gpio_desc	*wp_gpio;
 	void __iomem		*io_base;
@@ -727,24 +725,11 @@ static int lpc32xx_nand_write_page_raw_syndrome(struct nand_chip *chip,
 static int lpc32xx_nand_dma_setup(struct lpc32xx_nand_host *host)
 {
 	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
-	dma_cap_mask_t mask;
 
 	host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
 	if (IS_ERR(host->dma_chan)) {
-		/* fallback to request using platform data */
-		if (!host->pdata || !host->pdata->dma_filter) {
-			dev_err(mtd->dev.parent, "no DMA platform data\n");
-			return -ENOENT;
-		}
-
-		dma_cap_zero(mask);
-		dma_cap_set(DMA_SLAVE, mask);
-		host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter, "nand-slc");
-
-		if (!host->dma_chan) {
-			dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
-			return -EBUSY;
-		}
+		dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
+		return PTR_ERR(host->dma_chan);
 	}
 
 	return 0;
@@ -873,8 +858,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	gpiod_set_consumer_name(host->wp_gpio, "NAND WP");
 
-	host->pdata = dev_get_platdata(&pdev->dev);
-
 	chip = &host->nand_chip;
 	mtd = nand_to_mtd(chip);
 	nand_set_controller_data(chip, host);
diff --git a/include/linux/mtd/lpc32xx_slc.h b/include/linux/mtd/lpc32xx_slc.h
deleted file mode 100644
index a044b806566b..000000000000
--- a/include/linux/mtd/lpc32xx_slc.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Platform data for LPC32xx SoC SLC NAND controller
- *
- * Copyright © 2012 Roland Stigge
- */
-
-#ifndef __LINUX_MTD_LPC32XX_SLC_H
-#define __LINUX_MTD_LPC32XX_SLC_H
-
-#include <linux/dmaengine.h>
-
-struct lpc32xx_slc_platform_data {
-	dma_filter_fn dma_filter;
-};
-
-#endif  /* __LINUX_MTD_LPC32XX_SLC_H */
-- 
2.51.0


