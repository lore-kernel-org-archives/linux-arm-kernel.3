Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D29105F787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A939J4iWGdtlVWArFdZqUZziIm4200CdJ3vSkDQy8t4=; b=aXLzLaXHiX0YQxONDOXErUVPIL
	O6c+BLg5vAkZNZ+X98bkCguyq/WPauvnhFnlfgq0LYlmX5senxkzlLKf7C/BwKL4jDce22x4s+1oY
	cOwXcwqsqDESTqbrQytX1fLrdIvs2O4T+UxpgSpmagru5W/3K76FklG2X1aq4RZFpE+mFO2on6Tft
	unpTGIba5jrBB8qsaWy+IN3yGouhu7advUoRM95XhRuSLcgVRd66/swKkSUwCNweR5TNdJM41y/hc
	BG9+HTGb6Slxhql6anuzYc1pl35R3vxwWZTaFzbQjyigt17tOis6eo3tJFNT6wcoxEWHpSDorC7NZ
	0KShdzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zLp-0000000HTJx-0Jj0;
	Fri, 13 Mar 2026 10:02:37 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zLl-0000000HTJN-41gW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:02:35 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Mar
 2026 18:02:24 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 18:02:24 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 13 Mar 2026 18:02:16 +0800
Subject: [PATCH] iio: adc: aspeed: Reserve battery sensing channel for
 on-demand use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260313-adc-v1-1-7a2edb4e5664@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAKfgs2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nj3cSUZF0Tc8skg8QkA8ukxFQloMqCotS0zAqwKdGxtbUA9f8ANlU
 AAAA=
X-Change-ID: 20260313-adc-479b0ab09bae
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<morris_mao@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396144; l=6286;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=EUOMjFM/rFziWkFH4VEIzdpUTOeldEDjn+7qcp7rxEU=;
 b=Xdi0AH3kN54e+ecLGXWjtxc7b+xDzUWduaZgLFqjkrogFUSi/KvCrfGlJtR0QmP5YdPGmMu0T
 t6RU8GR6a30DS4/VyYBoJNw5xiFAQstlILViGDMnPRhmy8HU4rJCFwR
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_030234_003294_3C7E0592 
X-CRM114-Status: GOOD (  21.19  )
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

For controllers with battery sensing capability (AST2600/AST2700), the last
channel uses a different circuit design optimized for battery voltage
measurement. This channel should not be enabled by default along with other
channels to avoid potential interference and power efficiency issues.

Changes made:
- Introduce aspeed_adc_get_active_channels() to return the number of
  channels that should be enabled by default
- For battery sensing capable controllers, exclude the last channel
  from the default channel enable mask
- Enable the battery sensing channel only when explicitly accessed
  via read_raw()
- Replace hardcoded channel numbers with ASPEED_ADC_BATTERY_CHANNEL macro
- Add helper functions for cleaner channel management

This ensures optimal power efficiency for normal ADC operations while
maintaining full functionality when battery sensing is needed.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 88 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 4be44c524b4d..376a024341e3 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -73,6 +73,31 @@
 #define ASPEED_ADC_CTRL_CHANNEL			GENMASK(31, 16)
 #define ASPEED_ADC_CTRL_CHANNEL_ENABLE(ch)	FIELD_PREP(ASPEED_ADC_CTRL_CHANNEL, BIT(ch))
 
+/*
+ * Enable multiple consecutive channels starting from channel 0.
+ * This creates a bitmask for channels 0 to (num_channels - 1).
+ * For example: num_channels=3 creates mask 0x0007 (channels 0,1,2)
+ */
+static inline u32 aspeed_adc_channels_mask(unsigned int num_channels)
+{
+	if (num_channels == 0)
+		return 0;
+	if (num_channels >= 16)
+		return GENMASK(15, 0);
+	return GENMASK(num_channels - 1, 0);
+}
+
+/*
+ * Helper function to enable multiple channels in the control register
+ */
+static inline u32 aspeed_adc_enable_channels(unsigned int num_channels)
+{
+	return FIELD_PREP(ASPEED_ADC_CTRL_CHANNEL, aspeed_adc_channels_mask(num_channels));
+}
+
+/* Battery sensing is typically on the last channel */
+#define ASPEED_ADC_BATTERY_CHANNEL		7
+
 #define ASPEED_ADC_INIT_POLLING_TIME	500
 #define ASPEED_ADC_INIT_TIMEOUT		500000
 /*
@@ -121,6 +146,18 @@ struct aspeed_adc_data {
 	struct adc_gain		battery_mode_gain;
 };
 
+static inline unsigned int aspeed_adc_get_active_channels(const struct aspeed_adc_data *data)
+{
+	/*
+	 * For controllers with battery sensing capability, the last channel
+	 * is reserved for battery sensing and should not be included in
+	 * normal channel operations.
+	 */
+	if (data->model_data->bat_sense_sup)
+		return data->model_data->num_channels - 1;
+	return data->model_data->num_channels;
+}
+
 #define ASPEED_CHAN(_idx, _data_reg_addr) {			\
 	.type = IIO_VOLTAGE,					\
 	.indexed = 1,						\
@@ -281,13 +318,35 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 			       int *val, int *val2, long mask)
 {
 	struct aspeed_adc_data *data = iio_priv(indio_dev);
-	u32 adc_engine_control_reg_val;
+	u32 adc_engine_control_reg_val = readl(data->base + ASPEED_REG_ENGINE_CONTROL);
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
-		if (data->battery_sensing && chan->channel == 7) {
-			adc_engine_control_reg_val =
-				readl(data->base + ASPEED_REG_ENGINE_CONTROL);
+		/*
+		 * For battery sensing capable controllers, we need to enable
+		 * the specific channel before reading. This is required because
+		 * the battery channel may not be enabled by default.
+		 */
+		if (data->model_data->bat_sense_sup &&
+		    chan->channel == ASPEED_ADC_BATTERY_CHANNEL) {
+			u32 ctrl_reg = adc_engine_control_reg_val & ~ASPEED_ADC_CTRL_CHANNEL;
+
+			ctrl_reg |= ASPEED_ADC_CTRL_CHANNEL_ENABLE(chan->channel);
+			writel(ctrl_reg, data->base + ASPEED_REG_ENGINE_CONTROL);
+			/*
+			 * After enable a new channel need to wait some time for adc stable
+			 * Experiment result is 1ms.
+			 */
+			mdelay(1);
+		}
+
+		/*
+		 * Battery sensing mode requires special configuration:
+		 * - Set channel 7 to battery mode
+		 * - Enable battery sensing functionality
+		 * - Apply voltage divider compensation
+		 */
+		if (data->battery_sensing && chan->channel == ASPEED_ADC_BATTERY_CHANNEL) {
 			writel(adc_engine_control_reg_val |
 				       FIELD_PREP(ASPEED_ADC_CH7_MODE,
 						  ASPEED_ADC_CH7_BAT) |
@@ -301,15 +360,15 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 			*val = readw(data->base + chan->address);
 			*val = (*val * data->battery_mode_gain.mult) /
 			       data->battery_mode_gain.div;
-			/* Restore control register value */
-			writel(adc_engine_control_reg_val,
-			       data->base + ASPEED_REG_ENGINE_CONTROL);
 		} else
 			*val = readw(data->base + chan->address);
+		/* Restore control register value */
+		writel(adc_engine_control_reg_val,
+				data->base + ASPEED_REG_ENGINE_CONTROL);
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_OFFSET:
-		if (data->battery_sensing && chan->channel == 7)
+		if (data->battery_sensing && chan->channel == ASPEED_ADC_BATTERY_CHANNEL)
 			*val = (data->cv * data->battery_mode_gain.mult) /
 			       data->battery_mode_gain.div;
 		else
@@ -607,10 +666,15 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	}
 
 	aspeed_adc_compensation(indio_dev);
-	/* Start all channels in normal mode. */
-	adc_engine_control_reg_val =
-		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
-	adc_engine_control_reg_val |= ASPEED_ADC_CTRL_CHANNEL;
+	adc_engine_control_reg_val = readl(data->base + ASPEED_REG_ENGINE_CONTROL);
+	/*
+	 * Enable channels for normal operation. For battery sensing capable
+	 * controllers, the battery channel is handled separately and is not
+	 * included in the normal channel enable mask.
+	 */
+	adc_engine_control_reg_val |=
+		aspeed_adc_enable_channels(aspeed_adc_get_active_channels(data));
+
 	writel(adc_engine_control_reg_val,
 	       data->base + ASPEED_REG_ENGINE_CONTROL);
 

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260313-adc-479b0ab09bae

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


