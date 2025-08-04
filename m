Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053C0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Pxts+TpPd0gVB/flX2DtlTIYUi/ogTk6nRuNMTNWyc=; b=sbXJ47F4HNiW6Bj6wHgDxfDi8f
	VVV604adBBbty9gTWJTwj9tMfX1cKCSwjMU9hU/rtFPZZB8VEV/oMZmnYZ+UEiiVNc5k3Ehg2lnH8
	rqJxmWt+QvMQIzjM+eRiBxTtXZa5RdVb2tPfeZhk5h1wN3I82E5oWDyx4SGTUuugJCqVYuXB0MwtZ
	2CBSNf0yBvMwVQZ6599nSSRCq+GlQW6PABOLq2JX5tWQtrqaQBLGV8kGIBZFD0BsICzk6PyGkiwcR
	9eXzanpunvH5VJ6QB43UwmExYnPGl6LX3gWyDUocN7tYn8NKd09NvAzWXf/ealPWj/+3wOoVcnUJQ
	hBuCdnvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisMK-0000000ABFG-1yEQ;
	Mon, 04 Aug 2025 10:24:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis2I-0000000A8sm-0ArF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301797; x=1785837797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NHU+4lXLdo/vKM5ziZuHEbn4fKMpkU+mkRMJySUxKhU=;
  b=L5YS01e+9R9WN0YiSPnyAqGvAFeUjwnXimjqhD2v8srSY+pRbwreQIWv
   kVcSnUnBff/Wyv6YqKKf6pzqSBz0qrd/wGwyhvFdKKIYkOiZX4ZMSEo1N
   ZlXwbwlgWJ6w75gYGpZ25SUkkZ+J8avTJFRPhHO24FMEmGxZ3a4rRtohM
   UX884Ay/NtDcS5SH7x0XdSdcGElH25xj1Am8f2XPLGwm4N4OcqgBQkesZ
   yYcXJJdmu0bDcT4XnbsZmNV6wI8PeVTBqjHyuTQN9Ordg9W3xnnFxMPDL
   NOxdfDPnBaGaplS4ckQVOpmjJwry1o7V/F7uLRRFxRXQg6wVz8bVHgqLW
   A==;
X-CSE-ConnectionGUID: QrHuXWrSRt6GNRSNglLzJg==
X-CSE-MsgGUID: d4QybLDHSbij9X24PZTrgw==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44245505"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:03:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:03:12 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:03:07 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 07/15] iio: adc: at91-sama5d2_adc: add temp init function as callback
Date: Mon, 4 Aug 2025 15:32:11 +0530
Message-ID: <20250804100219.63325-8-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030318_157998_86AFC161 
X-CRM114-Status: GOOD (  14.91  )
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

Adding the temperature sensor init function as a callback function.
The temperature sensor initialisation sequence is handled differently
for each platform. The same is added to the platform data of the
corresponding device. This allows us to handle new devices like
sama7d65.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index d952109a64a9..916682e326c7 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -453,6 +453,10 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
  */
 #define AT91_TEMP_CALIB_TAG	0x41435354
 
+struct at91_adc_state;
+static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
+				     struct device *dev);
+
 /**
  * struct at91_adc_platform - at91-sama5d2 platform information struct
  * @layout:		pointer to the reg layout struct
@@ -472,6 +476,8 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
  * @chan_realbits:	realbits for registered channels
  * @temp_chan:		temperature channel index
  * @temp_sensor:	temperature sensor supported
+ * @temp_init:		callback function to initialize the temperature sensor
+ *			with its calibration data
  */
 struct at91_adc_platform {
 	const struct at91_adc_reg_layout	*layout;
@@ -489,6 +495,7 @@ struct at91_adc_platform {
 	unsigned int				chan_realbits;
 	unsigned int				temp_chan;
 	bool					temp_sensor;
+	int (*temp_init)(struct at91_adc_state *st, struct device *dev);
 };
 
 /**
@@ -729,6 +736,7 @@ static const struct at91_adc_platform sama5d2_platform = {
 	.oversampling_avail = { 1, 4, 16, },
 	.oversampling_avail_no = 3,
 	.chan_realbits = 14,
+	.temp_init = at91_adc_temp_sensor_init,
 };
 
 static const struct at91_adc_platform sama7g5_platform = {
@@ -753,6 +761,7 @@ static const struct at91_adc_platform sama7g5_platform = {
 	.chan_realbits = 16,
 	.temp_sensor = true,
 	.temp_chan = AT91_SAMA7G5_ADC_TEMP_CHANNEL,
+	.temp_init = at91_adc_temp_sensor_init,
 };
 
 static int at91_adc_chan_xlate(struct iio_dev *indio_dev, int chan)
@@ -2328,7 +2337,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 
 	st->soc_info.platform = device_get_match_data(dev);
 
-	ret = at91_adc_temp_sensor_init(st, &pdev->dev);
+	ret = st->soc_info.platform->temp_init(st, &pdev->dev);
 	/* Don't register temperature channel if initialization failed. */
 	if (ret)
 		num_channels = st->soc_info.platform->max_channels - 1;
-- 
2.34.1


