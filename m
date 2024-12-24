Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682A3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtIDcdlTcL47l1JyKAXSQb+DUXo1fGrqYZ+NRkBcaJ4=; b=BACkNbhAlOIj+os6FJ3aiWjNPl
	aUa0nwQnxe3CEu78hBNy2Ma1vUkhHTlbkNk6waXMoiCQVsav5EuCPOp5KY0C6ZtKExO3J1VSrpehg
	HOVkX8WynmZGs5hIv2TRR3AhGCiQFIqOs/Hle1ukqsTav+WjWG6Mvx4qzRnMmZmCjIIByuHtIQaAZ
	lba7J+UaG7aVSPjoCaREfBTIDBL4ONdsADEyjY40G5qpm3QBUu3kYAe3Pg8GoEp+1+vVeRAC8ri7e
	yJF629h+5Xy49LZHovsiybo9YgRIKXrHmSFLjUAGM87CjMg13MOoaLHsgBUIW6baHewNoiayyN7qH
	QjTAtxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5zD-0000000C9Iw-44cs;
	Tue, 24 Dec 2024 14:34:15 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5vm-0000000C8m0-0od2;
	Tue, 24 Dec 2024 14:30:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa66ead88b3so962205566b.0;
        Tue, 24 Dec 2024 06:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735050641; x=1735655441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtIDcdlTcL47l1JyKAXSQb+DUXo1fGrqYZ+NRkBcaJ4=;
        b=Hkl6jOCOA64/UV0dsS+emcINp7q4MZkoktdoLYU6hjfAS1skQbe1b1KV9x5m2jVck6
         hCKc+n7ilu/M0E8PCeqOleoFs68qIE3k2BAJVxbTgZjweJRw64QpbhPCVEQebJTG/SAH
         3+FIfmDpydn95XzxxpbP4K8RUuVUVLZVvx0idvrgifb+b3vLzV6jP5MRDBWHummnZgw9
         SlndcmROk7KyO1nTs7OnNCcBD8ACN1YjhDOulJ8wUm4Lmyat4vVEhneDn7TS38yw0wpq
         IhRG9HxoTORknsoajs6TtN1A+SOsm/cMilFduFQJMGywRFvCueuvdILKrhMdUXTY2NZI
         M5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735050641; x=1735655441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtIDcdlTcL47l1JyKAXSQb+DUXo1fGrqYZ+NRkBcaJ4=;
        b=PTaRFuyu7ZSHwirKauBqN5y8nyQwhh18V/wa5ej0zOMpjsSp2NiCLlbWrG4nHIXZQl
         fHYlv/hqNP0V9x55Pl0LqedXG5IC6O6ZZjqJw4ZYvvlR7cKLpZNGCksD6h6Dz7uIwFG+
         6Ofq+I6lYxfutYs2ZXT649pEkp1EEbUP6gR5zuqGIVN84NTQ1yUyArh/I0IbYJ8lRmpE
         /rJJ/+HfClkdQioyKavNL/sxaukjgnB7ubVFa6gacbSNfFXPo4YvmhUoTaDDFhC5mHyr
         brhB9NNiJqpOjMUc6Rl3yNayuT2E+llqZKAzkN21XRA1V4tfObLcYqh7OWxj9j4BaV4S
         QsbA==
X-Forwarded-Encrypted: i=1; AJvYcCVFkfmMiVNsmWXw8mXP3beiJ6tAki8Z8xeGL4pV2NhZsYbKMbFwu3UNHPuIMTdpm27ltkaIjF3XO3Ud+HEzaS9ltA==@lists.infradead.org, AJvYcCXE8a43b8hAG90oY+5oxMBW7BhUJjtdnI2EAa2Vf6QVW/wVlvgQI5MpifSynlSKKZcPnG3C41NPIb5ZFhI0@lists.infradead.org
X-Gm-Message-State: AOJu0YxAsNxE11nkS6X/aEBF4ASts/kFBb1QqqEP9h21jc6goeVLO1MR
	+SeBCquK3fFepNTVa70CRMtMnuLMfHMp7LCM7X8TkvNIefwPZcok
X-Gm-Gg: ASbGnctfusMn2smNlPdaMTItjTTqFZa054LhspXQBQjU34NQlDvTmjOIb2HwqPz9sM5
	maTZA/7S1FcpzHWykOfDMoR9y7voezpxrzAcxryeutCZ3b7eUzH7n0+KdC6dYl+6BGPuJb4m78r
	bD97acpg3KFyfWnd885MYSNifUAn9B1vR59v6c4+XwU3mImRfaCVF0BDELUoIIc29gxbo3WJMFn
	nzlv8kuV67n7WcnBdIvq0il7OgEAaKvyJOcq3+9Zli/Ng4LSTOjNSjan2G+GIOuhNG5aM8akeNN
	IzpajH8OMBruWdh0s9PQ0zU2lGhbMFK2w+VapnAonqXaQW/HHcXtOJNuZ2rPDUrs0LQYchSsTKc
	AihBkCj8=
X-Google-Smtp-Source: AGHT+IHbuxvtjRdu0Ntf+3XKJZS8NGXLreQtkLnmulcwU+OEWzchjnRtrfW5QBwUKRofxzAHfpMq/g==
X-Received: by 2002:a17:907:944b:b0:aa6:73ae:b3b3 with SMTP id a640c23a62f3a-aac2d13c90fmr1732470866b.32.1735050640570;
        Tue, 24 Dec 2024 06:30:40 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a5d7-4700-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a5d7:4700::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0eae74e4sm658827166b.91.2024.12.24.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:30:40 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	gnstark@salutedevices.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 3/3] iio: adc: meson: simplify MESON_SAR_ADC_REG11 register access
Date: Tue, 24 Dec 2024 15:29:41 +0100
Message-ID: <20241224142941.97759-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224142941.97759-1-martin.blumenstingl@googlemail.com>
References: <20241224142941.97759-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_063042_256827_601406CC 
X-CRM114-Status: GOOD (  12.79  )
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

Simply check the max_register value to decide whether
MESON_SAR_ADC_REG11 is present on the current IP revision. This allows
dropping two additional bool fields from struct meson_sar_adc_param
which previously had to be manually kept in sync. No functional changes
intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 469af3c57066..997def4a4d2f 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -315,14 +315,12 @@ static const struct iio_chan_spec meson_sar_adc_and_temp_iio_channels[] = {
 struct meson_sar_adc_param {
 	bool					has_bl30_integration;
 	unsigned long				clock_rate;
-	u32					bandgap_reg;
 	unsigned int				resolution;
 	const struct regmap_config		*regmap_config;
 	u8					temperature_trimming_bits;
 	unsigned int				temperature_multiplier;
 	unsigned int				temperature_divider;
 	u8					disable_ring_counter;
-	bool					has_reg11;
 	bool					has_vref_select;
 	u8					vref_select;
 	u8					cmv_select;
@@ -976,7 +974,7 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 			   MESON_SAR_ADC_REG3_CTRL_CONT_RING_COUNTER_EN,
 			   regval);
 
-	if (priv->param->has_reg11) {
+	if (priv->param->regmap_config->max_register >= MESON_SAR_ADC_REG11) {
 		regval = FIELD_PREP(MESON_SAR_ADC_REG11_EOC, priv->param->adc_eoc);
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 				   MESON_SAR_ADC_REG11_EOC, regval);
@@ -1013,16 +1011,15 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 static void meson_sar_adc_set_bandgap(struct iio_dev *indio_dev, bool on_off)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
-	const struct meson_sar_adc_param *param = priv->param;
-	u32 enable_mask;
 
-	if (param->bandgap_reg == MESON_SAR_ADC_REG11)
-		enable_mask = MESON_SAR_ADC_REG11_BANDGAP_EN;
+	if (priv->param->regmap_config->max_register >= MESON_SAR_ADC_REG11)
+		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
+				   MESON_SAR_ADC_REG11_BANDGAP_EN,
+				   on_off ? MESON_SAR_ADC_REG11_BANDGAP_EN : 0);
 	else
-		enable_mask = MESON_SAR_ADC_DELTA_10_TS_VBG_EN;
-
-	regmap_update_bits(priv->regmap, param->bandgap_reg, enable_mask,
-			   on_off ? enable_mask : 0);
+		regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELTA_10,
+				   MESON_SAR_ADC_DELTA_10_TS_VBG_EN,
+				   on_off ? MESON_SAR_ADC_DELTA_10_TS_VBG_EN : 0);
 }
 
 static int meson_sar_adc_hw_enable(struct iio_dev *indio_dev)
@@ -1186,7 +1183,6 @@ static const struct iio_info meson_sar_adc_iio_info = {
 static const struct meson_sar_adc_param meson_sar_adc_meson8_param = {
 	.has_bl30_integration = false,
 	.clock_rate = 1150000,
-	.bandgap_reg = MESON_SAR_ADC_DELTA_10,
 	.regmap_config = &meson_sar_adc_regmap_config_meson8,
 	.resolution = 10,
 	.temperature_trimming_bits = 4,
@@ -1197,7 +1193,6 @@ static const struct meson_sar_adc_param meson_sar_adc_meson8_param = {
 static const struct meson_sar_adc_param meson_sar_adc_meson8b_param = {
 	.has_bl30_integration = false,
 	.clock_rate = 1150000,
-	.bandgap_reg = MESON_SAR_ADC_DELTA_10,
 	.regmap_config = &meson_sar_adc_regmap_config_meson8,
 	.resolution = 10,
 	.temperature_trimming_bits = 5,
@@ -1208,10 +1203,8 @@ static const struct meson_sar_adc_param meson_sar_adc_meson8b_param = {
 static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {
 	.has_bl30_integration = true,
 	.clock_rate = 1200000,
-	.bandgap_reg = MESON_SAR_ADC_REG11,
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 10,
-	.has_reg11 = true,
 	.vref_voltage = 1,
 	.cmv_select = 1,
 };
@@ -1219,11 +1212,9 @@ static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {
 static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.has_bl30_integration = true,
 	.clock_rate = 1200000,
-	.bandgap_reg = MESON_SAR_ADC_REG11,
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 12,
 	.disable_ring_counter = 1,
-	.has_reg11 = true,
 	.vref_voltage = 1,
 	.cmv_select = 1,
 };
@@ -1231,11 +1222,9 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
 	.has_bl30_integration = true,
 	.clock_rate = 1200000,
-	.bandgap_reg = MESON_SAR_ADC_REG11,
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 12,
 	.disable_ring_counter = 1,
-	.has_reg11 = true,
 	.vref_voltage = 1,
 	.has_vref_select = true,
 	.vref_select = VREF_VDDA,
@@ -1245,11 +1234,9 @@ static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
 static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
 	.has_bl30_integration = false,
 	.clock_rate = 1200000,
-	.bandgap_reg = MESON_SAR_ADC_REG11,
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 12,
 	.disable_ring_counter = 1,
-	.has_reg11 = true,
 	.adc_eoc = 1,
 	.has_vref_select = true,
 	.vref_select = VREF_VDDA,
-- 
2.47.1


