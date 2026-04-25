Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B07FFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 16:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iD/M1fyNXTAwfQKzUaSJw2dnydcQ7vF9bXiqIToJulA=; b=i1386Pbjk5xwsZBF/3z2SMZvgM
	G6PtqbA4KJziNF3hKflC2SyTaT/wsP/m6jgtpCup5WgB2URutIAvp5O+1wcyVwgIejqmcbh2PVFwM
	AxXUdHE5nCmuinK3PHG7rVnvZECQQuIp+LP17xnHd2roXg2HVU+ns9KWtEYjjch4ekykBB/IL9fuj
	b83v40ULXKHc4XamAthh3SF/7UwkXhD8+lLpxSTs0wPffvofUNUXKtPUNEoB7dJ5VegdD2AiNi2/P
	JsdxFnGqWkG5IYHXLf3fJ3jOfyLOKY/PvDD9a48RuguX4VHL9eyNOrbWp1wSmc9fvFdKDhLeSfmAO
	30D5tZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfXk-0000000EZBk-3Hw0;
	Sat, 25 Apr 2026 16:07:44 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfXi-0000000EZB0-0k3d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 16:07:43 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso6933522a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777133261; x=1777738061; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iD/M1fyNXTAwfQKzUaSJw2dnydcQ7vF9bXiqIToJulA=;
        b=rNnB8FfHUCDriYjoPteE1PtjvI1/OPf4UwhetOtCmcdGMoMLbMQdSUAEtD0EfuuccW
         jXDtjemf6UcO1QHwIOg/gjxV1dINF/QBIiTACIVPRvJMVTST+3XiEZRqhdSJLeY5zv09
         d7r9JN59qEwYHw9e+rLM7fVAg6mvfoA7ujbU3vhynj/BF3R5BKfwVhIhPE7qCpolyYjU
         Q5XigVk+c1QskExanXRkQ+E9Ftig6eO3YRPaO5wsT6g8MOKQd1lsKym4T10lFiiQAJZd
         sUKnawY1jbzY0SJ4kUiVhdqqAo1opLvtTwq8N96Trg4O+RGJrrVn8jELzukSK0umPi+C
         9+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777133261; x=1777738061;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iD/M1fyNXTAwfQKzUaSJw2dnydcQ7vF9bXiqIToJulA=;
        b=mkRo8T95l9k2mf1pN150Z0T7q7Egl7Mu+6CAOpyJkX3TYzjy1bHK47T57MnCM08eej
         C43PHnIgiq4NE2BQHwukF4Ypg2hUwLVu9OJYua0qwTF382ZbZFttCrFDiJ53hMiXBE5x
         t9RD1xz8vhvKhH+Ce0zvIkDVSG/VuiVzqPkH+fWhY6X7Lv9PWVp9lS+ACyn1Uo3IfsjP
         K50k0R81VJfOv4RwPwCzTR2466vgw+XqlETelk2RA1pqLuIGERFxkMIOXvQgtY49XTxa
         w3HO28Ddzh+JY5LjXXKILtufB8qo6OIVAevqi4oaai4MvSufGuDvt46n7fWoR8lQDmt+
         CFtg==
X-Forwarded-Encrypted: i=1; AFNElJ+yGanG/LfeaAAS3smUmkrINxMgRSVqv2L/6xKhF2PIWuJG7BMZzToNLaW6x6DEEDTSY3UOxgD9b1tFSsXFGsiH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7/XiS5j+T7VPBMqtGVLqhOA/NcSTQJR73XFDCb2iXWqfuHX7A
	rxwdUlfUspGWP/pW4+2FU6iCGdXCXaqCir/DP1LRAs1gYmu4bJ6QtOLgCOWsuTT+J1g=
X-Gm-Gg: AeBDievhRg0fypXvCvN2AV9Xoet68iw79h+z/+llStH1/qJNZImB6ZAXlmHfZNrV2tk
	Z9G8lc3tYqPys+l/SuERxnubNZWjtCwnglIUqO4uoNrzXVBDCFJIc3pHYEhRJoGbuc058cjkUSf
	APidu6psgkKlvzd2Nyh5okjpgEg4Lk26rWOQ0TiPHpP4qiRaoPATrvPK6lEG3nRrqgO0qZ7sFvq
	l06xZ49nyvplY/IiZ2XxfzbibPmO/dA6ZeZNn8xL7qQrHqtYU56IKbnYzTdDgJc1Zj3wKBaz+kb
	LG3vrPJDlaYpLI4I9/JnZjstjWoH6Nmr6axlvugE9lxd4opePQHfGXm51E9VmRvdkfT7sY+uKb9
	QtrzvwgnjY11XbJt62ZNkEcPjnG1fuKMLaNlU7KmytknQNEMKI3VXvQjlQ6NI6OUXoSpi2cLcAQ
	fyI93iVOs8ULzhqrtaO34ZFCz10AwioMNsrSyx9ptfit24otN/uxrEL75bEUDp4SmfjRkZ5CRo+
	M5yrD/g1c+yqXT94KN+N4JqCCuMPcqM85XU/hzGew==
X-Received: by 2002:a17:90b:35d2:b0:35f:bbc0:e570 with SMTP id 98e67ed59e1d1-36140228e16mr38201383a91.0.1777133260516;
        Sat, 25 Apr 2026 09:07:40 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f3e5sm21431182a12.5.2026.04.25.09.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:07:40 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 26 Apr 2026 00:07:24 +0800
Subject: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
X-B4-Tracking: v=1; b=H4sIALvm7GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNT3dzU4vy8+OLEosSUZF1Tk8SkZFOjFMskY0MloJaCotS0zAqwcdG
 xtbUA8wWlq14AAAA=
X-Change-ID: 20260425-meson_saradc-54abc52d9b31
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rosen Penev <rosenp@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777133256; l=2229;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=KjIIBYWTn6p4BuyO0upgqtz3U+Oi6OBq7Ml4SOzFSuc=;
 b=Vjn5Dax+7/hZTXWQgOoS9q3jBjBGAaFI0EgVquwXjkkRPefUzhwtIOndDXMCrGBT4d0Tqueia
 Q0c34yJMIvXARu6F1W6/gneXeBQgC3XHQ9lvOdScnQGncIwqotb2Oua
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_090742_210016_D20148C1 
X-CRM114-Status: GOOD (  11.65  )
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

meson_sar_adc_temp_sensor_init() allocates a buffer with
nvmem_cell_read(), but the old code leaked it if
syscon_regmap_lookup_by_phandle() failed.

Switch buf to __free(kfree) so all return paths release it.

Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/iio/adc/meson_saradc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 23991a3612bd..9708ddcc4919 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -786,7 +786,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
 static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
-	u8 *buf, trimming_bits, trimming_mask, upper_adc_val;
+	u8 trimming_bits, trimming_mask, upper_adc_val;
 	struct device *dev = indio_dev->dev.parent;
 	struct nvmem_cell *temperature_calib;
 	size_t read_len;
@@ -807,14 +807,12 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 	}
 
 	read_len = MESON_SAR_ADC_EFUSE_BYTES;
-	buf = nvmem_cell_read(temperature_calib, &read_len);
+	u8 *buf __free(kfree) = nvmem_cell_read(temperature_calib, &read_len);
 	nvmem_cell_put(temperature_calib);
 	if (IS_ERR(buf))
 		return dev_err_probe(dev, PTR_ERR(buf), "failed to read temperature_calib cell\n");
-	if (read_len != MESON_SAR_ADC_EFUSE_BYTES) {
-		kfree(buf);
+	if (read_len != MESON_SAR_ADC_EFUSE_BYTES)
 		return dev_err_probe(dev, -EINVAL, "invalid read size of temperature_calib cell\n");
-	}
 
 	priv->tsc_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "amlogic,hhi-sysctrl");
 	if (IS_ERR(priv->tsc_regmap))
@@ -835,8 +833,6 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 	priv->temperature_sensor_adc_val |= upper_adc_val << BITS_PER_BYTE;
 	priv->temperature_sensor_adc_val >>= trimming_bits;
 
-	kfree(buf);
-
 	return 0;
 }
 

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260425-meson_saradc-54abc52d9b31

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


