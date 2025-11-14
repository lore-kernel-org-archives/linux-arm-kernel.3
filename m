Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EA6CE7AAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyikLWglI9X7tpxVtau6yVc+6UcVwQ7rv4E6hjD4g8o=; b=lEwh9yMGS68Rp7pvmiw8eJpfJs
	sJdTRl/W8dGVojgHPTgP6nPNg6YTuAirpVRByuSu72RAXe0Jkrk1ZOkPZh8hwomi+D+T9CH2BaPi7
	yk6HEs1wAhONE+rcwraxOeWHSsCsUf3bK5hHbQqz6OuMK+DS9tVvhOYDeUgy4R8cJCOn4rQaNwafb
	Leypoay+5YQXiSe6W7q2pd37HARrWH1idGh/yVg/2jX70GBWRqkpoYMmQGIkXypdWnFrsdYY5z8TK
	Ri+Y1pljFCnGXrk4+sKsquC4qkdOVr1fVD3D6FW2OjHUblCa58kl1pLsLYWuf2opl7GDkG3c9c8R4
	TypZGZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqli-0000000ByuO-38AM;
	Fri, 14 Nov 2025 10:11:02 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqle-0000000ByoE-1IUt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:10:59 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 14 Nov
 2025 18:10:43 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 14 Nov 2025 18:10:43 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 4/4] spi: aspeed: Add support for the AST2700 SPI controller
Date: Fri, 14 Nov 2025 18:10:42 +0800
Message-ID: <20251114101042.1520997-5-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
References: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_021058_348971_1C8CF80A 
X-CRM114-Status: GOOD (  13.17  )
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

Extend the driver to support the AST2700 SPI controller. Compared to
AST2600, AST2700 has the following characteristics:
 - A 64-bit memory address space.
 - A 64KB address decoding unit.
 - Segment registers now use (start <= range < end) semantics,
   which differs slightly from (start <= range <= end) in AST2600.
 - Known issues related to address decoding range registers have been
   resolved, and the decoding range is now 1GB, which is sufficient.
   Therefore, the adjust_window callback is no longer required on AST2700
   for range adjustment and bug fixes.
 - The SPI clock divider method and timing calibration logic remain
   unchanged from AST2600.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index d1a8bdf6d540..db3e096f2eb0 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -985,6 +985,41 @@ static u32 aspeed_spi_segment_ast2600_reg(struct aspeed_spi *aspi,
 		((end - 1) & AST2600_SEG_ADDR_MASK);
 }
 
+/* The Segment Registers of the AST2700 use a 64KB unit. */
+#define AST2700_SEG_ADDR_MASK 0x7fff0000
+
+static phys_addr_t aspeed_spi_segment_ast2700_start(struct aspeed_spi *aspi,
+						    u32 reg)
+{
+	u64 start_offset = (reg << 16) & AST2700_SEG_ADDR_MASK;
+
+	if (!start_offset)
+		return aspi->ahb_base_phy;
+
+	return aspi->ahb_base_phy + start_offset;
+}
+
+static phys_addr_t aspeed_spi_segment_ast2700_end(struct aspeed_spi *aspi,
+						  u32 reg)
+{
+	u64 end_offset = reg & AST2700_SEG_ADDR_MASK;
+
+	if (!end_offset)
+		return aspi->ahb_base_phy;
+
+	return aspi->ahb_base_phy + end_offset;
+}
+
+static u32 aspeed_spi_segment_ast2700_reg(struct aspeed_spi *aspi,
+					  phys_addr_t start, phys_addr_t end)
+{
+	if (start == end)
+		return 0;
+
+	return (u32)(((start & AST2700_SEG_ADDR_MASK) >> 16) |
+		     (end & AST2700_SEG_ADDR_MASK));
+}
+
 /*
  * Read timing compensation sequences
  */
@@ -1511,6 +1546,40 @@ static const struct aspeed_spi_data ast2600_spi_data = {
 	.adjust_window = aspeed_adjust_window_ast2600,
 };
 
+static const struct aspeed_spi_data ast2700_fmc_data = {
+	.max_cs	       = 3,
+	.hastype       = false,
+	.mode_bits     = SPI_RX_QUAD | SPI_TX_QUAD,
+	.we0	       = 16,
+	.ctl0	       = CE0_CTRL_REG,
+	.timing	       = CE0_TIMING_COMPENSATION_REG,
+	.hclk_mask     = 0xf0fff0ff,
+	.hdiv_max      = 2,
+	.min_window_size = 0x10000,
+	.get_clk_div   = aspeed_get_clk_div_ast2600,
+	.calibrate     = aspeed_spi_ast2600_calibrate,
+	.segment_start = aspeed_spi_segment_ast2700_start,
+	.segment_end   = aspeed_spi_segment_ast2700_end,
+	.segment_reg   = aspeed_spi_segment_ast2700_reg,
+};
+
+static const struct aspeed_spi_data ast2700_spi_data = {
+	.max_cs	       = 2,
+	.hastype       = false,
+	.mode_bits     = SPI_RX_QUAD | SPI_TX_QUAD,
+	.we0	       = 16,
+	.ctl0	       = CE0_CTRL_REG,
+	.timing	       = CE0_TIMING_COMPENSATION_REG,
+	.hclk_mask     = 0xf0fff0ff,
+	.hdiv_max      = 2,
+	.min_window_size = 0x10000,
+	.get_clk_div   = aspeed_get_clk_div_ast2600,
+	.calibrate     = aspeed_spi_ast2600_calibrate,
+	.segment_start = aspeed_spi_segment_ast2700_start,
+	.segment_end   = aspeed_spi_segment_ast2700_end,
+	.segment_reg   = aspeed_spi_segment_ast2700_reg,
+};
+
 static const struct of_device_id aspeed_spi_matches[] = {
 	{ .compatible = "aspeed,ast2400-fmc", .data = &ast2400_fmc_data },
 	{ .compatible = "aspeed,ast2400-spi", .data = &ast2400_spi_data },
@@ -1518,6 +1587,8 @@ static const struct of_device_id aspeed_spi_matches[] = {
 	{ .compatible = "aspeed,ast2500-spi", .data = &ast2500_spi_data },
 	{ .compatible = "aspeed,ast2600-fmc", .data = &ast2600_fmc_data },
 	{ .compatible = "aspeed,ast2600-spi", .data = &ast2600_spi_data },
+	{ .compatible = "aspeed,ast2700-fmc", .data = &ast2700_fmc_data },
+	{ .compatible = "aspeed,ast2700-spi", .data = &ast2700_spi_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, aspeed_spi_matches);
-- 
2.34.1


