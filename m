Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8646CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0rCVlJGM8FFZAG5A27B92FYIY+5Ez2lvNjy4sLQwHo=; b=3ZbOU3yQ+roYfyTfp10ABeNL29
	0CDmEul564QPn+dlaVyzrutC1GnVeWmTD4dZGHelPybQtUmwpiuIFY588/TB85nts6uTFixOFWGYT
	b4cQzduKfP7SGdJLMAEesJ2ICSjFrTINvX28MYw/asql5MT5S/E371nokjg8ciC3qR006RwYyHFNl
	onjzVlEQQPjtgl+X0VNXtr6+HhMw4Scv4w+bp74jtwVZsYpmAYwi8BheEEfcPlRzm7vCyJhGkPQR/
	PFW7kKx91I/zhHs0ExyGPqnCslK0orKUTmvL40Et3iWg6ohRpDkbXM8peOh6nJUpJFyIfpfJ97tCI
	15yqprsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSiC6-00000007gAL-47oY;
	Tue, 31 Dec 2024 19:46:22 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSi8X-00000007fgU-2zMG;
	Tue, 31 Dec 2024 19:42:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso1496115566b.3;
        Tue, 31 Dec 2024 11:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735674160; x=1736278960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0rCVlJGM8FFZAG5A27B92FYIY+5Ez2lvNjy4sLQwHo=;
        b=Zhmyph7sFCThEHxt1t3sranuwCtRGLc+B0IHLk8jhOKxwu+bv5Ah7wq6bl6UUu5/Zq
         HhtEzqqBWkiRDNsD5BYyO+TRI6PCQT+fcRerFjLUKFwUKpwkCHXOs+ZBTorblRHg/t3T
         nOcL3YHNex9ZbOjQIRgb9zz9QaxF9yC8ONVZ6wgtxr7MOy3yXrGqWJKXO9Fry+XKwiIT
         3aBOv9QbtCcmHOZDSgGMni/MbIndEoIHEQwe7vVbOLuF8dlw6vQAUU2LeKFMHI6Njufn
         x8yOhkuMk/SK17uxiYMEgKxoNy5Gq1H4dn+S+zacmZiGkvCPep1+Hnc4FLQ9hZqZsDII
         MkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735674160; x=1736278960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0rCVlJGM8FFZAG5A27B92FYIY+5Ez2lvNjy4sLQwHo=;
        b=j1LEso7MG80A5u/7nQkx95ic/j49KhNZk5/e6ZhjD+qUsdFOzK/VDTHb5G5oPP2K4T
         4oCAEDQSCvSlmC2f2HZJMxjv9PkHBpn7XoFtMrZUWjjKXkFlk6+Ye1XcQGgHzMXkOKz6
         pVM9+UuD5OGXI/JGh1JChzw2r3ZSqW6B8z+lTi6Gj2QeUdt00uhweEI2H0hBScX1WQ5c
         xXO8a4emcw41xWAr9+LRUZaklbFTxhpAyshlnYtOxzvDzyPcDvJYeJ/xcAloG5MwXRyn
         5kB9cgIoXfa/ItEbuIoum+rCmePzMYrCpScqpubgSKEJIaeHJrsaFIGA8AT5y2oVAJNy
         OTmg==
X-Forwarded-Encrypted: i=1; AJvYcCX0aSPCWU/k3VpMhNBRy5A4H7MY7HRbiqiDs8lDRA0iOPIbDAS9SZt8Z6kBa0dKFBUnhMT3YDA43oNKst1F2TGk@lists.infradead.org
X-Gm-Message-State: AOJu0YyktuKsOIby2aYBMpaLg66la5WLTBPflyVwgtDUKyeo6Gnf9+04
	CMkj5OwqAzUMV3gYliMH1/racajx5sr2fAmgjWNrB29aNaVViNt6w5YdTw==
X-Gm-Gg: ASbGncssWrbpKFaVL+FhMg9sVxqUwhQfIygBjVrVqtIXE5XovsvWdRXKIBoDYNXw1UN
	nfDv+bS6v9rULZRcukP9QES+/PEb1wxcmUV4iQ+1acBZ+PWjdNuKPgnEGIABYM/BbjZO5r8eVAr
	yjYKEdo6zVyjghWZOhRtIs1g2Kji/XQz/+y2PNp3q5iaMjxWYyuHuDguNczlVrf3el34VeAqOrw
	+MPlHBqZJAxMcOciU5XlOFZki2YQ61uKVDRt4SMgmJ31KuAp5CTUcue9U3FR6Oo4IDi5tTm2nOZ
	v5z8ek6ZhXSg8osC5m6SmaKnJYLZePBl1j68VVU9rFTdc486xYSkfGTxgev92o66gsb+Lh1k9Cf
	L0YHqBQlmE2VoKE4KXV+i37E1
X-Google-Smtp-Source: AGHT+IFUyhcb9Cx4FtvKLUY9YCOTTUG3voJ3IdPFUMD6nijH05dZt6EZuVPrz0AfxFYRAHfrGVRcIQ==
X-Received: by 2002:a17:907:8004:b0:aae:b9e5:ed07 with SMTP id a640c23a62f3a-aaeb9e5f697mr2477282066b.58.1735674159532;
        Tue, 31 Dec 2024 11:42:39 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b300-ce00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b300:ce00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm16237820a12.31.2024.12.31.11.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:42:38 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gnstark@salutedevices.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1 2/2] iio: adc: meson: add support for the GXLX SoC
Date: Tue, 31 Dec 2024 20:42:07 +0100
Message-ID: <20241231194207.2772750-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_114241_755293_0C1B2490 
X-CRM114-Status: GOOD (  18.90  )
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

The SARADC IP on the GXLX SoC itself is identical to the one found on
GXL SoCs. However, GXLX SoCs require poking the first three bits in the
MESON_SAR_ADC_REG12 register to get the three MPLL clocks (used as clock
generators for the audio frequencies) to work.

The reason why there are MPLL clock bits in the ADC register space is
entirely unknown and it seems that nobody is able to comment on this.
So clearly mark this as a workaround and add a warning so users are
notified that this workaround can change (once we know what these bits
actually do).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 997def4a4d2f..df15a2566ec7 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -160,6 +160,11 @@
 	#define MESON_SAR_ADC_REG11_EOC				BIT(1)
 	#define MESON_SAR_ADC_REG11_VREF_SEL			BIT(0)
 
+#define MESON_SAR_ADC_REG12					0x30
+	#define MESON_SAR_ADC_REG12_MPLL0_UNKNOWN		BIT(0)
+	#define MESON_SAR_ADC_REG12_MPLL1_UNKNOWN		BIT(1)
+	#define MESON_SAR_ADC_REG12_MPLL2_UNKNOWN		BIT(2)
+
 #define MESON_SAR_ADC_REG13					0x34
 	#define MESON_SAR_ADC_REG13_12BIT_CALIBRATION_MASK	GENMASK(13, 8)
 
@@ -326,6 +331,7 @@ struct meson_sar_adc_param {
 	u8					cmv_select;
 	u8					adc_eoc;
 	enum meson_sar_adc_vref_sel		vref_voltage;
+	bool					enable_mpll_clock_workaround;
 };
 
 struct meson_sar_adc_data {
@@ -995,6 +1001,15 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 				    priv->param->cmv_select);
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 				   MESON_SAR_ADC_REG11_CMV_SEL, regval);
+
+		if (priv->param->enable_mpll_clock_workaround) {
+			dev_warn(dev,
+				 "Enabling unknown bits to make the MPLL clocks work. This may change so always update dtbs and kernel together\n");
+			regmap_write(priv->regmap, MESON_SAR_ADC_REG12,
+				     MESON_SAR_ADC_REG12_MPLL0_UNKNOWN |
+				     MESON_SAR_ADC_REG12_MPLL1_UNKNOWN |
+				     MESON_SAR_ADC_REG12_MPLL2_UNKNOWN);
+		}
 	}
 
 	ret = clk_set_parent(priv->adc_sel_clk, priv->clkin);
@@ -1219,6 +1234,17 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.cmv_select = 1,
 };
 
+static const struct meson_sar_adc_param meson_sar_adc_gxlx_param = {
+	.has_bl30_integration = true,
+	.clock_rate = 1200000,
+	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
+	.resolution = 12,
+	.disable_ring_counter = 1,
+	.vref_voltage = VREF_VOLTAGE_1V8,
+	.cmv_select = true,
+	.enable_mpll_clock_workaround = true,
+};
+
 static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
 	.has_bl30_integration = true,
 	.clock_rate = 1200000,
@@ -1267,6 +1293,11 @@ static const struct meson_sar_adc_data meson_sar_adc_gxl_data = {
 	.name = "meson-gxl-saradc",
 };
 
+static const struct meson_sar_adc_data meson_sar_adc_gxlx_data = {
+	.param = &meson_sar_adc_gxlx_param,
+	.name = "meson-gxlx-saradc",
+};
+
 static const struct meson_sar_adc_data meson_sar_adc_gxm_data = {
 	.param = &meson_sar_adc_gxl_param,
 	.name = "meson-gxm-saradc",
@@ -1298,6 +1329,9 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
 	}, {
 		.compatible = "amlogic,meson-gxl-saradc",
 		.data = &meson_sar_adc_gxl_data,
+	}, {
+		.compatible = "amlogic,meson-gxlx-saradc",
+		.data = &meson_sar_adc_gxlx_data,
 	}, {
 		.compatible = "amlogic,meson-gxm-saradc",
 		.data = &meson_sar_adc_gxm_data,
-- 
2.47.1


