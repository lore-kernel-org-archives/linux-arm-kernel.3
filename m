Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C025BEDEC04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cj2evDlwnNkzABttd4YNchw6wVbpncuY/X8XS90rCSg=; b=s6ULBMfnezd5Wjirq3QHwuz5oE
	JuCC7K8/P6Op23JvLgyRuyrRBZxWj77xEMU/Np36Z0gVMTXNBxPb1XtORUfcM8sp1xTvrgZff1ey4
	+QNYErxP1E8p5lXxYB+AXYJ/nzvVkeS6ConVeHi+wKdbCYQwI9aix3F+MvoxVAtrWohb/CLpDIp3U
	RGaML+Hor8AAWRWpTvY8jsafQ7HwjG7hCtTQR8xemB3j+bDJ0BwReXupBmQm2oBh+QeTFUlgyG9lK
	+K4RRN/VON6wtFj9vqZIqVLI/8i/kc+1xtwo64E196TOWIf3betdy0aWZziSSUPMcYkVRezmtUfqh
	cYFqBxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdg5-0000000GQjE-2Agj;
	Wed, 04 Mar 2026 04:17:41 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdg2-0000000GQiS-3TG5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:17:40 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-79868eae536so65197927b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 20:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772597857; x=1773202657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cj2evDlwnNkzABttd4YNchw6wVbpncuY/X8XS90rCSg=;
        b=NbyJEpcyF/20i2pn4jUok7EwNsiP4JHsOZ6CJ2Znej9fO2YsCCX3lr23yWvyA5q7JC
         zwvg7ISdrwdKyOS1Tzrc1+mx4Iqu5Hh2bgVdRMCJj8pEdJBUfHhB58vnll5XybnrV0NB
         FQ0qEQWxJaQUTJJMdAAFstQU5xYgwsT/dXpMCrgfdEXymuL98IO5M7Naw/YD63NlL8oX
         KM28qltba7czpzSXHOe7Q9xcm+/CtMBOgvq6Nu7dx9yM1CaH2vM1iO6G4fcBDb0EGcl1
         5oXI4QTvN1EDj2OvGKF1gMyVydymtQJw2yiNM8jkm2VS5FxluIuJqtMxyEH22zt9gBCd
         Up4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772597857; x=1773202657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj2evDlwnNkzABttd4YNchw6wVbpncuY/X8XS90rCSg=;
        b=fezOco5kll09uG4/JebL8gd6e0IlCVJOFQqt4yeiCsrOqSZXYb+ZRkl+YaoACBHkct
         QpaJ5mP4FCegUT3Htn6Dwj2lQZxorNher8LHkR2Hj2lphY4RxlcUkoZBWzkZnDIdTFIi
         ApPldQp2+q+bRvIXrpjBL+Op8TIFxV+RRnF2tKq3zyNdsGLe1l12jnDe/u8KAWR8TtAo
         GMmSE3d0mXAt/Zce0/T7NtzCXHwdJEWYFGo6s/UO1o4mm06oU3/XehQMKxlnoX4vi7U/
         U0NeuYRzmwSXY/T8eb+bRr7qA4EUIUgkYRBFv+X6Z4vM39mlgZi6sX7Hcy1SMcEhG3+x
         DTWg==
X-Forwarded-Encrypted: i=1; AJvYcCWh40IFebmOjCnTrPppimAY7pcHkpBQUeb8TEvr6lMOFygxHWxW3UsiJpGz61uR5m7bcBn72x3Bxm0vKuboioZD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvy6rMDt78YkfQ6goIqz42kfoT/wcrdJ1Y4yh7bZBb5WrvEJCk
	ZwylRtwoalhavUfHGgy1H7gNQdB+whYbuy4+TJccv++Llz3CLSNqcvZn
X-Gm-Gg: ATEYQzzwRjRiL8jxggBnI9hfRNXScL0fI2NGNaJFUGUpnmHInNtw/i+tPmP+1SuU8FR
	wGhAMPkt/g3aIcsrNh2QGOXTKvfsEQ/uqR7EOfBqnQwoD3WQWFBx9J8IDZEZu5F3dO8wUxhLWS1
	FX+NgsmiYVrRqM/V97UUWgchIlqpIkUtkvv4aJkLRktimuGt705Exjh8vJlPXu/HDK2M+Pbrro0
	jsiY1vk2LmktYJEUHZiXUAN7jiHHHnR5B50oFfU+cSxkZi193BqhT2fe0e0PNzJ4/FhJisT7XyI
	EkzeZ4qZP/lRt6NZsboZF6/BN7/SM+yZIiDCiqdqZfJvrNXjGoSgPIl5hPLoqBmwgtyDsgn1Ef3
	vLyNBMqkDttaH6edbPknJRrifAvLwtYXSGKRy74HHThVfbhHv5Dr72XPylsucvocv3+arx1huHb
	VCg1B+jd80W1GppWXu5c7m4QbwfrL82wonRz2FSunAawkdOPy6kPxTZxU8S0y82No3
X-Received: by 2002:a05:690c:6983:b0:796:371c:7afd with SMTP id 00721157ae682-798c6b8a015mr5803047b3.13.1772597857322;
        Tue, 03 Mar 2026 20:17:37 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876ad9045sm69989297b3.16.2026.03.03.20.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:17:35 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Xichao Zhao <zhao.xichao@vivo.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iio: adc: meson: no devm for nvmem_cell_get
Date: Tue,  3 Mar 2026 20:17:16 -0800
Message-ID: <20260304041716.7631-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_201738_871591_9ED718FC 
X-CRM114-Status: GOOD (  12.04  )
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

There is no reason to extend the lifetime of this post removal of the
driver when it's only needed in one spot.

Moved tsc_regmap assignment to avoid two nvmem_cell_put calls.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/iio/adc/meson_saradc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 47cd350498a0..ed91edf0e391 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -792,7 +792,7 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 	size_t read_len;
 	int ret;
 
-	temperature_calib = devm_nvmem_cell_get(dev, "temperature_calib");
+	temperature_calib = nvmem_cell_get(dev, "temperature_calib");
 	if (IS_ERR(temperature_calib)) {
 		ret = PTR_ERR(temperature_calib);
 
@@ -806,13 +806,9 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 		return dev_err_probe(dev, ret, "failed to get temperature_calib cell\n");
 	}
 
-	priv->tsc_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "amlogic,hhi-sysctrl");
-	if (IS_ERR(priv->tsc_regmap))
-		return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap),
-				     "failed to get amlogic,hhi-sysctrl regmap\n");
-
 	read_len = MESON_SAR_ADC_EFUSE_BYTES;
 	buf = nvmem_cell_read(temperature_calib, &read_len);
+	nvmem_cell_put(temperature_calib);
 	if (IS_ERR(buf))
 		return dev_err_probe(dev, PTR_ERR(buf), "failed to read temperature_calib cell\n");
 	if (read_len != MESON_SAR_ADC_EFUSE_BYTES) {
@@ -820,6 +816,11 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 		return dev_err_probe(dev, -EINVAL, "invalid read size of temperature_calib cell\n");
 	}
 
+	priv->tsc_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "amlogic,hhi-sysctrl");
+	if (IS_ERR(priv->tsc_regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap),
+				     "failed to get amlogic,hhi-sysctrl regmap\n");
+
 	trimming_bits = priv->param->temperature_trimming_bits;
 	trimming_mask = BIT(trimming_bits) - 1;
 
-- 
2.53.0


