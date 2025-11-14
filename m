Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145B5CE7AAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJGTuzVpLNWbUpxhTQvl2uO7y+Gc/zlbpWZXgPByx+s=; b=z7cCHS7hbbtCiI/bvkoqqeLL5U
	DIPbqOYWW2x47DUxVsOEUtATuMmg2mRnrWxP4NQ96oUZyiWqnJVGs873WpNiMpeFY7JXHEcTtSQvW
	wfU0vsZ9Sz8+3T60Fiz1y/p5MGzdIazbyWqHXt1wl5vTU5lb2Sa0ssByFzM5pxXi9a14JEzMTehMS
	b6DIP3UXdgE9WaeRYgevaTdJkVoz3HVlq1zmXD2NzmgebzeNe87d7qoQs2fbXR+Y9olWCVjRcP4b/
	cfFF9p+KTRcDlTkHMruCnsCklBJPJh6fcbMiW0ZWoERSPeVhL2wdvR4+eFxhdnc5gG2mZK+H5QNFK
	GVJ3JGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqli-0000000Byu3-1uaS;
	Fri, 14 Nov 2025 10:11:02 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqlc-0000000ByoE-3BsC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:10:57 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 14 Nov
 2025 18:10:42 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 14 Nov 2025 18:10:42 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 3/4] spi: aspeed: Use phys_addr_t for bus addresses to support 64-bit platforms
Date: Fri, 14 Nov 2025 18:10:41 +0800
Message-ID: <20251114101042.1520997-4-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
References: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_021056_798711_50C540BB 
X-CRM114-Status: GOOD (  10.84  )
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

Update bus address types from u32 to phys_addr_t to support systems with
64-bit memory address space. This change ensures compatibility with
upcoming SoCs that extend the system bus beyond 32-bit, while maintaining
support for existing platforms.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 4163632fed8b..d1a8bdf6d540 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -82,9 +82,10 @@ struct aspeed_spi_data {
 	u32	hdiv_max;
 	u32	min_window_size;
 
-	u32 (*segment_start)(struct aspeed_spi *aspi, u32 reg);
-	u32 (*segment_end)(struct aspeed_spi *aspi, u32 reg);
-	u32 (*segment_reg)(struct aspeed_spi *aspi, u32 start, u32 end);
+	phys_addr_t (*segment_start)(struct aspeed_spi *aspi, u32 reg);
+	phys_addr_t (*segment_end)(struct aspeed_spi *aspi, u32 reg);
+	u32 (*segment_reg)(struct aspeed_spi *aspi, phys_addr_t start,
+			   phys_addr_t end);
 	int (*adjust_window)(struct aspeed_spi *aspi);
 	u32 (*get_clk_div)(struct aspeed_spi_chip *chip, u32 hz);
 	int (*calibrate)(struct aspeed_spi_chip *chip, u32 hdiv,
@@ -97,7 +98,7 @@ struct aspeed_spi {
 	const struct aspeed_spi_data	*data;
 
 	void __iomem		*regs;
-	u32			 ahb_base_phy;
+	phys_addr_t		 ahb_base_phy;
 	u32			 ahb_window_size;
 	u32			 num_cs;
 	struct device		*dev;
@@ -484,9 +485,9 @@ static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 	/* Assign the minimum window size to each CS */
 	for (cs = 0; cs < aspi->num_cs; cs++) {
 		aspi->chips[cs].ahb_window_size = aspi->data->min_window_size;
-		dev_dbg(aspi->dev, "CE%d default window [ 0x%.8x - 0x%.8x ]",
-			cs, aspi->ahb_base_phy + aspi->data->min_window_size * cs,
-			aspi->ahb_base_phy + aspi->data->min_window_size * cs - 1);
+		dev_dbg(aspi->dev, "CE%d default window [ 0x%.9llx - 0x%.9llx ]",
+			cs, (u64)(aspi->ahb_base_phy + aspi->data->min_window_size * cs),
+			(u64)(aspi->ahb_base_phy + aspi->data->min_window_size * cs - 1));
 	}
 
 	/* Close unused CS */
@@ -930,17 +931,18 @@ static void aspeed_spi_remove(struct platform_device *pdev)
  * The address range is encoded with absolute addresses in the overall
  * mapping window.
  */
-static u32 aspeed_spi_segment_start(struct aspeed_spi *aspi, u32 reg)
+static phys_addr_t aspeed_spi_segment_start(struct aspeed_spi *aspi, u32 reg)
 {
 	return ((reg >> 16) & 0xFF) << 23;
 }
 
-static u32 aspeed_spi_segment_end(struct aspeed_spi *aspi, u32 reg)
+static phys_addr_t aspeed_spi_segment_end(struct aspeed_spi *aspi, u32 reg)
 {
 	return ((reg >> 24) & 0xFF) << 23;
 }
 
-static u32 aspeed_spi_segment_reg(struct aspeed_spi *aspi, u32 start, u32 end)
+static u32 aspeed_spi_segment_reg(struct aspeed_spi *aspi,
+				  phys_addr_t start, phys_addr_t end)
 {
 	return (((start >> 23) & 0xFF) << 16) | (((end >> 23) & 0xFF) << 24);
 }
@@ -952,16 +954,16 @@ static u32 aspeed_spi_segment_reg(struct aspeed_spi *aspi, u32 start, u32 end)
 
 #define AST2600_SEG_ADDR_MASK 0x0ff00000
 
-static u32 aspeed_spi_segment_ast2600_start(struct aspeed_spi *aspi,
-					    u32 reg)
+static phys_addr_t aspeed_spi_segment_ast2600_start(struct aspeed_spi *aspi,
+						    u32 reg)
 {
 	u32 start_offset = (reg << 16) & AST2600_SEG_ADDR_MASK;
 
 	return aspi->ahb_base_phy + start_offset;
 }
 
-static u32 aspeed_spi_segment_ast2600_end(struct aspeed_spi *aspi,
-					  u32 reg)
+static phys_addr_t aspeed_spi_segment_ast2600_end(struct aspeed_spi *aspi,
+						  u32 reg)
 {
 	u32 end_offset = reg & AST2600_SEG_ADDR_MASK;
 
@@ -973,7 +975,7 @@ static u32 aspeed_spi_segment_ast2600_end(struct aspeed_spi *aspi,
 }
 
 static u32 aspeed_spi_segment_ast2600_reg(struct aspeed_spi *aspi,
-					  u32 start, u32 end)
+					  phys_addr_t start, phys_addr_t end)
 {
 	/* disable zero size segments */
 	if (start == end)
-- 
2.34.1


