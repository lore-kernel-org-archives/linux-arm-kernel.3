Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF2CCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxfMRrE8il0yOnAObNAwbxVxFL1j9FZ+kXpHdeGoTLA=; b=DP/EeZsmn+hs+MXpwiPXFeW7Vl
	krtbzUpXHwlgTY9k7tRwBhz4JElDMTaiLRzRULu/sDggcTH7HxvPZsNnRcj1nWKfgDX/lxwY3ochY
	JwBDLVL/PSsHzwe6sk4gJ6ayQZbfsAkHoOQnaVViKzbrrve6dsmkC9ZAR1OiDnPILgbFr9dBL6VQ0
	t7r+SXB3EGtbRf8/1xMxzrikM5Inop7M/RkX8JkrHV7xAIvKZIVZR4CyQLTJd6IvPOneyhVs6pwb6
	msXDZ9H6V8UNYMLMZMG4jdowl8mxid4t94puZT8P5u/5j0E7p6hvJLmblGOSy5nY4iWSfoO/FkCt9
	97VkQhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7865-00000007w04-0lbk;
	Fri, 10 Oct 2025 08:03:29 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7861-00000007vuB-1DhB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 08:03:26 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 10 Oct
 2025 16:03:16 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Oct 2025 16:03:16 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 3/3] watchdog: aspeed: Add support for AST2700 platform
Date: Fri, 10 Oct 2025 16:03:15 +0800
Message-ID: <20251010080315.816628-4-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
References: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_010325_329121_287F9DE4 
X-CRM114-Status: GOOD (  12.21  )
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

Add AST2700 platform support to the ASPEED watchdog driver. This includes
a new per-platform configuration with SCU reset status register at
SCU1_070 and support for 5 reset mask registers.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index d23e565f30a8..c9e79851504c 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -83,10 +83,24 @@ static const struct aspeed_wdt_config ast2600_config = {
 	.num_reset_masks = 2,
 };
 
+static const struct aspeed_wdt_config ast2700_config = {
+	.ext_pulse_width_mask = 0xfffff,
+	.irq_shift = 0,
+	.irq_mask = GENMASK(31, 10),
+	.scu = {
+		.compatible = "aspeed,ast2700-scu0",
+		.reset_status_reg = 0x70,
+		.wdt_reset_mask = 0xf,
+		.wdt_reset_mask_shift = 0,
+	},
+	.num_reset_masks = 5,
+};
+
 static const struct of_device_id aspeed_wdt_of_table[] = {
 	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
 	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
 	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
+	{ .compatible = "aspeed,ast2700-wdt", .data = &ast2700_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
@@ -483,7 +497,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	}
 
 	if (!of_device_is_compatible(np, "aspeed,ast2400-wdt")) {
-		u32 reset_mask[2];
+		u32 reset_mask[5];
 		size_t nrstmask = wdt->cfg->num_reset_masks;
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
 		int i;
-- 
2.34.1


