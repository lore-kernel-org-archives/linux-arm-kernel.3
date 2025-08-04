Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7ECC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3jFcJ5v3Pwh0IDf/K6HMvoIIU/y9UuEX3r9bUtk0kU=; b=p+WAEc8lSyzBMWh4v5uRtXF5vA
	MKh9WltlzSonkI60rRJk1BXIc0z6uVTSFDaxHFsRE/r7oVKhqNIfAor0LipcWivqswUdNel+oLzUb
	3hD4wrYWRXnnnVMSLQcFHPzL3Fqqbt1blpNsVwqNYG/K5UO6T5ngN5cuRe1Nt8HafLMxglQmQykdH
	4ljZW8rKTsmK3CRcP6bvq7JQSiuW8KK4VCBGscIVG2c6b+7SvDutXFZ/uuEjhM7HCWMC8N8jdt62i
	0JfleCkFB5ZEwuU+/x/MPJr5vKIyiPjrzMYOYvJzhSwoyypkjUxggvi4KumCRPO+Lm3+8yrHp2Cgx
	aPEsbVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisRK-0000000ABop-0Ok2;
	Mon, 04 Aug 2025 10:29:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis2g-0000000A8yz-0S5s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301821; x=1785837821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6W4F2tMrJ4fQ3+1dSbKRAr9IS7Qo3RdtktFxwVVRt40=;
  b=0nrTLnGDFR0ul6oiCv8I+/PJCgloR/97+eMDDMtgzE3puHW6XaJX+LwY
   /Atwaljj+oxH+bxm2zFQ+k4R4CqClXZAyn3/RNJmZO0N1ZWo1BkOdYiz8
   Ec+VJ6/2lvhbYM8euRZ7Q2W0ceBbXudblcNB6lrQn/sfnRms0QLv4H9zY
   G4Rz2uu9twfV3RLQuo7XWBGxvHiOE+5HcCW7QuJwwKOro9BQj7GO4GBpI
   Zk2hdQ8PRYB3RMNM01WhG73pbp789AY10Gf6bzEp9D/SUVM9ecqb1MGB9
   qotjZu3JkDMdsCmB9qJ2wMVcm1RplSVBd1UPqtIleS4tU1jr/cIpnIEvp
   w==;
X-CSE-ConnectionGUID: E6rlgp6tRPCj0Q8ccA/Yqg==
X-CSE-MsgGUID: nhnyn57ETHaYkg3E28HNcw==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44245519"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:03:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:03:25 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:03:19 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 09/15] iio: adc: at91-sama5d2_adc: adapt the driver for sama7d65
Date: Mon, 4 Aug 2025 15:32:13 +0530
Message-ID: <20250804100219.63325-10-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030342_217123_BCD68D51 
X-CRM114-Status: GOOD (  17.76  )
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

Add support to sama7d65 ADC. The differences are highlighted with the
compatible. The init and parsing of the temperature sensor and
calibration indexes are the main differences.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 94 ++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 916682e326c7..909841b84834 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -456,6 +456,8 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 struct at91_adc_state;
 static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 				     struct device *dev);
+static int at91_sama7d65_adc_temp_sensor_init(struct at91_adc_state *st,
+					      struct device *dev);
 
 /**
  * struct at91_adc_platform - at91-sama5d2 platform information struct
@@ -525,6 +527,20 @@ enum at91_adc_ts_clb_idx {
 	AT91_ADC_TS_CLB_IDX_MAX = 18,
 };
 
+/**
+ * enum at91_sama7d65_adc_ts_clb_idx - calibration indexes in sama7d65 NVMEM buffer
+ * @AT91_SAMA7D65_ADC_TS_CLB_IDX_P1: index for FT1_TEMP equivalent to P1 * (10 ^ 6)
+ * @AT91_SAMA7D65_ADC_TS_CLB_IDX_P4: index for FT1_VPAT equivalent to P4
+ * @AT91_SAMA7D65_ADC_TS_CLB_IDX_P6: index for FT2_VBG equivalent to P6
+ * @AT91_SAMA7D65_ADC_TS_CLB_IDX_MAX: max index for temperature calibration packet in OTP
+ */
+enum at91_sama7d65_adc_ts_clb_idx {
+	AT91_SAMA7D65_ADC_TS_CLB_IDX_P1 = 2,
+	AT91_SAMA7D65_ADC_TS_CLB_IDX_P4 = 1,
+	AT91_SAMA7D65_ADC_TS_CLB_IDX_P6 = 4,
+	AT91_SAMA7D65_ADC_TS_CLB_IDX_MAX = 10,
+};
+
 /* Temperature sensor calibration - Vtemp voltage sensitivity to temperature. */
 #define AT91_ADC_TS_VTEMP_DT		(2080U)
 
@@ -764,6 +780,31 @@ static const struct at91_adc_platform sama7g5_platform = {
 	.temp_init = at91_adc_temp_sensor_init,
 };
 
+static const struct at91_adc_platform sama7d65_platform = {
+	.layout = &sama7g5_layout,
+	.adc_channels = &at91_sama7g5_adc_channels,
+#define AT91_SAMA7D65_SINGLE_CHAN_CNT	16
+#define AT91_SAMA7D65_DIFF_CHAN_CNT	8
+#define AT91_SAMA7D65_TEMP_CHAN_CNT	1
+	.nr_channels = AT91_SAMA7D65_SINGLE_CHAN_CNT +
+		       AT91_SAMA7D65_DIFF_CHAN_CNT +
+		       AT91_SAMA7D65_TEMP_CHAN_CNT,
+#define AT91_SAMA7D65_MAX_CHAN_IDX	(AT91_SAMA7D65_SINGLE_CHAN_CNT + \
+					AT91_SAMA7D65_DIFF_CHAN_CNT + \
+					AT91_SAMA7D65_TEMP_CHAN_CNT)
+	.max_channels = ARRAY_SIZE(at91_sama7g5_adc_channels),
+	.max_index = AT91_SAMA7D65_MAX_CHAN_IDX,
+#define AT91_SAMA7G5_HW_TRIG_CNT	3
+	.hw_trig_cnt = AT91_SAMA7G5_HW_TRIG_CNT,
+	.osr_mask = GENMASK(18, 16),
+	.oversampling_avail = { 1, 4, 16, 64, 256, },
+	.oversampling_avail_no = 5,
+	.chan_realbits = 16,
+	.temp_sensor = true,
+	.temp_chan = AT91_SAMA7G5_ADC_TEMP_CHANNEL,
+	.temp_init = at91_sama7d65_adc_temp_sensor_init,
+};
+
 static int at91_adc_chan_xlate(struct iio_dev *indio_dev, int chan)
 {
 	int i;
@@ -2319,6 +2360,56 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 	return ret;
 }
 
+static int at91_sama7d65_adc_temp_sensor_init(struct at91_adc_state *st,
+					      struct device *dev)
+{
+	struct at91_adc_temp_sensor_clb *clb = &st->soc_info.temp_sensor_clb;
+	struct nvmem_cell *temp_calib;
+	u32 *buf = NULL;
+	size_t len;
+	int ret = 0;
+
+	if (!st->soc_info.platform->temp_sensor)
+		return 0;
+
+	/* Get the calibration data from NVMEM. */
+	temp_calib = devm_nvmem_cell_get(dev, "temperature_calib");
+	if (IS_ERR(temp_calib)) {
+		ret = PTR_ERR(temp_calib);
+		if (ret != -ENOENT)
+			dev_err(dev, "Failed to get temperature_calib cell!\n");
+		return ret;
+	}
+
+	buf = nvmem_cell_read(temp_calib, &len);
+	if (IS_ERR(buf)) {
+		dev_err(dev, "Failed to read calibration data!\n");
+		return PTR_ERR(buf);
+	}
+
+	if (len < AT91_SAMA7D65_ADC_TS_CLB_IDX_MAX * sizeof(u32) ||
+	    buf[0] != AT91_TEMP_CALIB_TAG) {
+		dev_err(dev, "Invalid calibration data!\n");
+		ret = -EINVAL;
+		goto free_buf;
+	}
+
+	/* Store calibration data for later use. */
+	clb->p1 = buf[AT91_SAMA7D65_ADC_TS_CLB_IDX_P1];
+	clb->p4 = buf[AT91_SAMA7D65_ADC_TS_CLB_IDX_P4];
+	clb->p6 = buf[AT91_SAMA7D65_ADC_TS_CLB_IDX_P6];
+
+	/*
+	 * We prepare here the conversion to milli from micro to avoid
+	 * doing it on hotpath.
+	 */
+	clb->p1 = clb->p1 / 1000;
+
+free_buf:
+	kfree(buf);
+	return ret;
+}
+
 static int at91_adc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2633,6 +2724,9 @@ static const struct of_device_id at91_adc_dt_match[] = {
 	}, {
 		.compatible = "microchip,sama7g5-adc",
 		.data = (const void *)&sama7g5_platform,
+	}, {
+		.compatible = "microchip,sama7d65-adc",
+		.data = (const void *)&sama7d65_platform,
 	}, {
 		/* sentinel */
 	}
-- 
2.34.1


