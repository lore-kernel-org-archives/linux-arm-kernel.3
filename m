Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F86CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YR1Mod+NFveRRpWwy/fSpGz8PTuzMYsp+0BiZ5cmWtQ=; b=SdnpvM6+Vkmrjq5FCPgVx9lFMQ
	fry8jQl7DvhwlMIMam9Y2gcr/cOKxQ2kZBdT/DnSI7M2gi2aF6KHB2oxDkFb5DsfSSJr00G2oTiT9
	d+/1X0YyBnVB71f0OHRb1c6KQ+Ni87COqO3/1Rc3mS4CZd4rWG0/mKFPSDpwU0MmGHE6YFyoeCt14
	Z+aBtBzI2xoFsm5YI2b/N8aZPA4KofY6EJ7J2iCJWcE2IgnbMA8UZVPvW3f7TdJlzzbA9Zxw0xCXs
	HwDmweq7byivqdpexazbklvvxJUgsMhdmUPGxCRzeO8O1f4WZerPt7bkOS7+V72+HP31xSz8HVpjR
	M3Dhx0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uya-00000007Ni9-08wd;
	Wed, 01 Oct 2025 11:26:28 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uyX-00000007Nai-22iY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:26:26 +0000
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
Subject: [PATCH 5/6] spi: aspeed: Add per-platform adjust_window callback for decoding range
Date: Wed, 1 Oct 2025 19:26:04 +0800
Message-ID: <20251001112605.1130723-6-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001112605.1130723-1-chin-ting_kuo@aspeedtech.com>
References: <20251001112605.1130723-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_042625_530995_DED2C683 
X-CRM114-Status: GOOD (  28.28  )
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

Different ASPEED SoCs have specific limitations on SPI address decoding,
such as total range size, minimum window size per CS, and alignment
requirements. The original adjustment logic only handles simple cases
and could fail in more complex setups found in advanced board designs,
e.g., small flash on CS0 and large flash on CS1, or when the total physical
flash size exceeds the decoding range supported by the SPI controller.

This patch introduces a per-platform adjust_window callback to handle
these constraints properly. Each platform defines its own logic to
adjust decoding ranges, trim excess size, and ensure alignment.

If trimming is required, the affected CS will fall back to user mode
access to ensure the entire flash remains accessible from the MTD layer.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 202 +++++++++++++++++++++++++++++------
 1 file changed, 168 insertions(+), 34 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 83a47ac0711e..4f6ae48dd904 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -67,6 +67,7 @@ struct aspeed_spi_chip {
 	u32			 ahb_window_size;
 	u32			 ctl_val[ASPEED_SPI_MAX];
 	u32			 clk_freq;
+	bool			 force_user_mode;
 };
 
 struct aspeed_spi_data {
@@ -83,6 +84,7 @@ struct aspeed_spi_data {
 	u32 (*segment_start)(struct aspeed_spi *aspi, u32 reg);
 	u32 (*segment_end)(struct aspeed_spi *aspi, u32 reg);
 	u32 (*segment_reg)(struct aspeed_spi *aspi, u32 start, u32 end);
+	int (*adjust_window)(struct aspeed_spi *aspi);
 	u32 (*get_clk_div)(struct aspeed_spi_chip *chip, u32 hz);
 	int (*calibrate)(struct aspeed_spi_chip *chip, u32 hdiv,
 			 const u8 *golden_buf, u8 *test_buf);
@@ -462,9 +464,166 @@ static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++)
 		aspi->chips[cs].ahb_window_size = 0;
 
+	if (aspi->data->adjust_window)
+		aspi->data->adjust_window(aspi);
+
 	return aspeed_spi_set_window(aspi);
 }
 
+/*
+ * As the flash size grows up, we need to trim some decoding
+ * size if needed for the sake of conforming the maximum
+ * decoding size. We trim the decoding size from the rear CS
+ * to avoid affecting the default boot up sequence, usually,
+ * from CS0. Notice, if a CS decoding size is trimmed,
+ * command mode may not work perfectly on that CS, but it only
+ * affect performance and the debug function.
+ */
+static int aspeed_spi_trim_window_size(struct aspeed_spi *aspi)
+{
+	struct aspeed_spi_chip *chips = aspi->chips;
+	size_t total_sz;
+	int cs = aspi->data->max_cs - 1;
+	u32 i;
+	bool trimmed = false;
+
+	do {
+		total_sz = 0;
+		for (i = 0; i < aspi->data->max_cs; i++)
+			total_sz += chips[i].ahb_window_size;
+
+		if (cs < 0)
+			return -ENOMEM;
+
+		if (chips[cs].ahb_window_size <= aspi->data->min_window_size) {
+			cs--;
+			continue;
+		}
+
+		if (total_sz > aspi->ahb_window_size) {
+			chips[cs].ahb_window_size -=
+				aspi->data->min_window_size;
+			total_sz -= aspi->data->min_window_size;
+			/*
+			 * If the ahb window size is ever trimmed, only user
+			 * mode can be adopted to access the whole flash.
+			 */
+			chips[cs].force_user_mode = true;
+			trimmed = true;
+		}
+	} while (total_sz > aspi->ahb_window_size);
+
+	if (trimmed) {
+		dev_warn(aspi->dev, "Window size after triming:\n");
+		for (cs = 0; cs < aspi->data->max_cs; cs++) {
+			dev_warn(aspi->dev, "CE%d: 0x%08x\n",
+				 cs, chips[cs].ahb_window_size);
+		}
+	}
+
+	return 0;
+}
+
+static int aspeed_adjust_window_ast2400(struct aspeed_spi *aspi)
+{
+	int ret;
+	int cs;
+	struct aspeed_spi_chip *chips = aspi->chips;
+
+	/* Close unused CS. */
+	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++)
+		chips[cs].ahb_window_size = 0;
+
+	ret = aspeed_spi_trim_window_size(aspi);
+	if (ret != 0)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * For AST2500, the minimum address decoding size for each CS
+ * is 8MB. This address decoding size is mandatory for each
+ * CS no matter whether it will be used. This is a HW limitation.
+ */
+static int aspeed_adjust_window_ast2500(struct aspeed_spi *aspi)
+{
+	int ret;
+	int cs, i;
+	u32 cum_size, rem_size;
+	struct aspeed_spi_chip *chips = aspi->chips;
+
+	/* Assign min_window_sz to unused CS. */
+	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++) {
+		if (chips[cs].ahb_window_size < aspi->data->min_window_size)
+			chips[cs].ahb_window_size =
+				aspi->data->min_window_size;
+	}
+
+	/*
+	 * If command mode or normal mode is used by dirmap read, the start
+	 * address of a window should be multiple of its related flash size.
+	 * Namely, the total windows size from flash 0 to flash N should
+	 * be multiple of the size of flash (N + 1).
+	 */
+	for (cs = aspi->num_cs - 1; cs >= 0; cs--) {
+		cum_size = 0;
+		for (i = 0; i < cs; i++)
+			cum_size += chips[i].ahb_window_size;
+
+		rem_size = cum_size % chips[cs].ahb_window_size;
+		if (chips[cs].ahb_window_size != 0 && rem_size != 0)
+			chips[0].ahb_window_size +=
+				chips[cs].ahb_window_size - rem_size;
+	}
+
+	ret = aspeed_spi_trim_window_size(aspi);
+	if (ret != 0)
+		return ret;
+
+	/* The total window size of AST2500 SPI1 CS0 and CS1 must be 128MB */
+	if (aspi->data == &ast2500_spi_data)
+		chips[1].ahb_window_size =
+			0x08000000 - chips[0].ahb_window_size;
+
+	return 0;
+}
+
+static int aspeed_adjust_window_ast2600(struct aspeed_spi *aspi)
+{
+	int ret;
+	int cs, i;
+	u32 cum_size, rem_size;
+	struct aspeed_spi_chip *chips = aspi->chips;
+
+	/* Close unused CS. */
+	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++)
+		chips[cs].ahb_window_size = 0;
+
+	/*
+	 * If command mode or normal mode is used by dirmap read, the start
+	 * address of a window should be multiple of its related flash size.
+	 * Namely, the total windows size from flash 0 to flash N should
+	 * be multiple of the size of flash (N + 1).
+	 */
+	for (cs = aspi->num_cs - 1; cs >= 0; cs--) {
+		cum_size = 0;
+		for (i = 0; i < cs; i++)
+			cum_size += chips[i].ahb_window_size;
+
+		rem_size = cum_size % chips[cs].ahb_window_size;
+		if (chips[cs].ahb_window_size != 0 && rem_size != 0)
+			chips[0].ahb_window_size +=
+				chips[cs].ahb_window_size - rem_size;
+	}
+
+	ret = aspeed_spi_trim_window_size(aspi);
+	if (ret != 0)
+		return ret;
+
+	return 0;
+}
+
 /*
  * Yet to be done when possible :
  * - Align mappings on flash size (we don't have the info)
@@ -475,48 +634,18 @@ static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
 					 u32 local_offset, u32 size)
 {
 	struct aspeed_spi *aspi = chip->aspi;
-	u32 cs;
-	u32 total_window_size;
 	int ret;
 
 	/* No segment registers for the AST2400 SPI controller */
 	if (aspi->data == &ast2400_spi_data)
 		return 0;
 
-	/*
-	 * Due to an HW issue on the AST2500 SPI controller, the CE0
-	 * window size should be smaller than the maximum 128MB.
-	 */
-	if (aspi->data == &ast2500_spi_data && chip->cs == 0 && size == SZ_128M) {
-		size = 120 << 20;
-		dev_info(aspi->dev, "CE%d window resized to %dMB (AST2500 HW quirk)",
-			 chip->cs, size >> 20);
-	}
-
-	/*
-	 * The decoding size of AST2600 SPI controller should set at
-	 * least 2MB.
-	 */
-	if ((aspi->data == &ast2600_spi_data || aspi->data == &ast2600_fmc_data) &&
-	    size < SZ_2M) {
-		size = SZ_2M;
-		dev_info(aspi->dev, "CE%d window resized to %dMB (AST2600 Decoding)",
-			 chip->cs, size >> 20);
-	}
-
 	/* Adjust this chip window */
 	aspi->chips[chip->cs].ahb_window_size = size;
 
-	total_window_size = 0;
-	for (cs = 0; cs < aspi->data->max_cs; cs++)
-		total_window_size += aspi->chips[cs].ahb_window_size;
-
-	if (total_window_size > aspi->ahb_window_size) {
-		aspi->chips[chip->cs].ahb_window_size -= (total_window_size -
-							  aspi->ahb_window_size);
-		dev_warn(aspi->dev, "CE%d window resized to %zdMB",
-			 chip->cs, aspi->chips[chip->cs].ahb_window_size >> 20);
-	}
+	/* Adjust the overall windows size regarding each platform */
+	if (aspi->data->adjust_window)
+		aspi->data->adjust_window(aspi);
 
 	ret = aspeed_spi_set_window(aspi);
 	if (ret)
@@ -600,7 +729,7 @@ static ssize_t aspeed_spi_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	struct aspeed_spi_chip *chip = &aspi->chips[spi_get_chipselect(desc->mem->spi, 0)];
 
 	/* Switch to USER command mode if mapping window is too small */
-	if (chip->ahb_window_size < offset + len) {
+	if (chip->ahb_window_size < offset + len || chip->force_user_mode) {
 		int ret;
 
 		ret = aspeed_spi_read_user(chip, &desc->info.op_tmpl, offset, len, buf);
@@ -1265,6 +1394,7 @@ static const struct aspeed_spi_data ast2400_fmc_data = {
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.adjust_window = aspeed_adjust_window_ast2400,
 };
 
 static const struct aspeed_spi_data ast2400_spi_data = {
@@ -1294,6 +1424,7 @@ static const struct aspeed_spi_data ast2500_fmc_data = {
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.adjust_window = aspeed_adjust_window_ast2500,
 };
 
 static const struct aspeed_spi_data ast2500_spi_data = {
@@ -1310,6 +1441,7 @@ static const struct aspeed_spi_data ast2500_spi_data = {
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.adjust_window = aspeed_adjust_window_ast2500,
 };
 
 static const struct aspeed_spi_data ast2600_fmc_data = {
@@ -1327,6 +1459,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
 	.segment_start = aspeed_spi_segment_ast2600_start,
 	.segment_end   = aspeed_spi_segment_ast2600_end,
 	.segment_reg   = aspeed_spi_segment_ast2600_reg,
+	.adjust_window = aspeed_adjust_window_ast2600,
 };
 
 static const struct aspeed_spi_data ast2600_spi_data = {
@@ -1344,6 +1477,7 @@ static const struct aspeed_spi_data ast2600_spi_data = {
 	.segment_start = aspeed_spi_segment_ast2600_start,
 	.segment_end   = aspeed_spi_segment_ast2600_end,
 	.segment_reg   = aspeed_spi_segment_ast2600_reg,
+	.adjust_window = aspeed_adjust_window_ast2600,
 };
 
 static const struct of_device_id aspeed_spi_matches[] = {
-- 
2.34.1


