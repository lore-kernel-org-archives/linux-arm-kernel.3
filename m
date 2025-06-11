Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286E5C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7BvPO14dME7rxPy0XG4Suixfv/o3vfcBS7p0YrP3lVs=; b=eCnxV1MqRjbPp9
	uJQ8HTvbqFxK9HX7lOOYMPjA3QaK2G63p0Bf8b1varcuCdmfwvlotdelYENXmvwOTz/q/qHGAY1+G
	0zS9+FQFHLH4+uqd1D2NgJet0AwgGWTyS2oLL7z5CiNwd31Zne6u1nRrVd2KYYUQyVEVTxMihVEiq
	zt8i98CTth/evuOkGfe2CsyBknhZylgQYaM7Wc4jQKSe/QG1BhOwadTmmei7QmRZN+Izl7a7/s3/M
	4bOBmUe8PXxRf+M2csTRwtzXZtwRcvCq56C2SBtnkAB6BDxjmnBGqVl6ZahXshVg9ecnJ7Pjj1OU9
	aV27x3NeEtlVs7hAoZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUfi-0000000BekF-3FgH;
	Wed, 11 Jun 2025 23:15:54 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU99-0000000BVI0-0YIW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:18 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-408d14c7e92so244587b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681734; x=1750286534; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BvPO14dME7rxPy0XG4Suixfv/o3vfcBS7p0YrP3lVs=;
        b=t/gLFDpcIeSEcCP7RvT5sK1sP6SRfyLQqvn0zjNRrHK61VVf7rGFycKl3070W+E2yq
         6w6VUpyeelTp56+6t7knkhLuEVzyMzpOTubbBm2YxrPiqOJJMUBJPoyTBOEApQ0FOjwx
         OBL+zKvvow2BwB3dgolE5bypOEShZAJ0kzQoFSdrIKi0J6aYPG+OuEtykPhP7AHQPP0J
         PIKhxzHkVYitCqCVs0BW/ZfZQSefJHbdhIzh+vZvZuwV9N/DIKHCfuA1RANO8ZN2vXU0
         4ATZ4qoOh4RyxonND2JCquc12c5MciCOfoM8qS5/NdXtYBivPl1waBIxQHp0Ohb4IzMr
         MAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681734; x=1750286534;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BvPO14dME7rxPy0XG4Suixfv/o3vfcBS7p0YrP3lVs=;
        b=BwGArnhSLB539euju0B2Ez0ShGrljWJ8g3pkHLwj93jTTRTInP8cl4R6j9p/TnS2Ek
         Agwqhy5XIgZVG4K4DnBC8QtaslTiG/0nktLsWE1uPLjzwUAs/8/UXsliyqCnFhgCDCkI
         V7q28+CY2HbiAwzDxFD2dc+BUBtzZOOWD5rq16r8q3q1iCiSUzihK1jqxJOUmJPzL4BJ
         qG/A9yEmHJEJPpTg99/8cqOGNpxWZyzwFHk8iePb4Dvp0tcsAIy3JbDR04Xga67wLHzf
         EduorBQ76Bgw+AinkBkfw9fSUC4zeL+JWEo1PhYgX4k9CYK+npzZjoxOL3fV1T/iDfyp
         wlfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRaMt6By4zy+xyXB+TzRsZgUKzMNZhWEOagp9kNKDA4N8EXBtVp3lCHKSUAJqCEcxlqR/no4guFKLDEFkxC4M0@lists.infradead.org
X-Gm-Message-State: AOJu0YxbJHebryoz4i+WYoyoR1/e6NZ+ZKwoN4ul/eyviHn/v9UubTeI
	LSBU1rL2/j0peyyABv8BFl8D6XMM1/5SSYVptMljRLu4wLTNz1Uz4oH4njnCOujUM2w=
X-Gm-Gg: ASbGnctOuduMz9HSg2n2/wQpppooWDLWxLf8osGE9LqqkSVfvl5uRGwZo5liB1RS58t
	ZLHKeKQb76tinDvj392p5PmqJuFL+GxxRAbc5w+wh4bucUHPt0aq6QNFtASqrHlxVhIfzr2gbH4
	X9HaD0BHwIAfReZlbRX8xBZQAIidbIWb1/wrzHL/ar22whcb9Aejmcmw6qxH3NyHtAOf3khFfmZ
	stq6p4uzSbhvmldRoDXZCAzPRe54DpZotcF5lVdikcEjZSYLV289JZ8dE3mzpDeWcpom5wo6jLM
	gr2kfbvTl/ywEBi1kLrytm3vARFYrAjjC3Bv+EnauaMnrG26HMqd7oe9gk8y77sKdg9k
X-Google-Smtp-Source: AGHT+IF44UK8AdQd6fFvDc21ilNMu4m0bVVIKOfl5xOOjYgMQm/xz/i3oLPfD33Zol0pZXaxSSar7w==
X-Received: by 2002:a05:6808:4fe7:b0:3fc:7e1:a455 with SMTP id 5614622812f47-40a669c01efmr518853b6e.2.1749681734252;
        Wed, 11 Jun 2025 15:42:14 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:12 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 00/28] iio: zero init stack with { } instead of memset()
Date: Wed, 11 Jun 2025 17:38:52 -0500
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwFSmgC/x3NQQrCMBBG4auUWTuQCVXBq4iLmEztjzSRTFBp6
 d0NLr/NexuZVqjRZdio6huGkjvkMFCcQ34oI3WTd/7oTiIMFF61FkZGY2shPvmDNndb05C4TLz
 oYtrYJfFplHDWeKcefFWd8P3Prrd9/wGWqNUmfAAAAA==
X-Change-ID: 20250611-iio-zero-init-stack-with-instead-of-memset-0d12d41a7ecb
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4170; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=yr3KMlpdAIDpFQpkD3xC/enXTLilJ1AAF5YBAl5/CHI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWAfjXY88M5ZYDZ+7DX9ossNW945JAucW1/v
 jGUtSZ5M1eJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFgAAKCRDCzCAB/wGP
 wPuQB/9qvN9qaCT672/2gBbYyejlFF3k1/j6Gn/mB3Q9wXva2BfxWsvzY/aFxXDjRUixvEIYtHr
 Aa2OgjvXXp8xeKaF9+2tuO3eZMkPIlIsGMSh8RlslM5ziujYyK74q8EbozYwpwlW1iEN+nhz2d2
 veKGy321c5RC4/6ArZl7vHAkwa+0YbhQgUQMiL/p0G7uDdnZaPAOsMjP3qOZAFm5g5e6xP3QeuZ
 NXEr3Fmbf7SKpE+P8cDfUrlyI0ktmNb2LmQCFLyFLxJcwfPz1+dMjbqnyCkB+OsBvSwWgo6eIed
 GyVNvi0jVIHbMRsHldgnXbcgyInHxugOhj5ZAno4ZKQqOxLc
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154215_410702_C21CB501 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Jonathan mentioned recently that he would like to get away from using
memset() to zero-initialize stack memory in the IIO subsystem. And we
have it on good authority that initializing a struct or array with = { }
is the preferred way to do this in the kernel [1]. So here is a series
to take care of that.

[1]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/

---
David Lechner (28):
      iio: accel: adxl372: use = { } instead of memset()
      iio: accel: msa311: use = { } instead of memset()
      iio: adc: dln2-adc: use = { } instead of memset()
      iio: adc: mt6360-adc: use = { } instead of memset()
      iio: adc: rockchip_saradc: use = { } instead of memset()
      iio: adc: rtq6056: use = { } instead of memset()
      iio: adc: stm32-adc: use = { } instead of memset()
      iio: adc: ti-ads1015: use = { } instead of memset()
      iio: adc: ti-ads1119: use = { } instead of memset()
      iio: adc: ti-lmp92064: use = { } instead of memset()
      iio: adc: ti-tsc2046: use = { } instead of memset()
      iio: chemical: scd4x: use = { } instead of memset()
      iio: chemical: scd30: use = { } instead of memset()
      iio: chemical: sunrise_co2: use = { } instead of memset()
      iio: dac: ad3552r: use = { } instead of memset()
      iio: imu: inv_icm42600: use = { } instead of memset()
      iio: imu: inv_mpu6050: use = { } instead of memset()
      iio: light: bh1745: use = { } instead of memset()
      iio: light: ltr501: use = { } instead of memset()
      iio: light: opt4060: use = { } instead of memset()
      iio: light: veml6030: use = { } instead of memset()
      iio: magnetometer: af8133j: use = { } instead of memset()
      iio: pressure: bmp280: use = { } instead of memset()
      iio: pressure: mpl3115: use = { } instead of memset()
      iio: pressure: mprls0025pa: use = { } instead of memset()
      iio: pressure: zpa2326: use = { } instead of memset()
      iio: proximity: irsd200: use = { } instead of memset()
      iio: temperature: tmp006: use = { } instead of memset()

 drivers/iio/accel/adxl372.c                       | 3 +--
 drivers/iio/accel/msa311.c                        | 4 +---
 drivers/iio/adc/dln2-adc.c                        | 4 +---
 drivers/iio/adc/mt6360-adc.c                      | 3 +--
 drivers/iio/adc/rockchip_saradc.c                 | 4 +---
 drivers/iio/adc/rtq6056.c                         | 4 +---
 drivers/iio/adc/stm32-adc.c                       | 3 +--
 drivers/iio/adc/ti-ads1015.c                      | 4 +---
 drivers/iio/adc/ti-ads1119.c                      | 4 +---
 drivers/iio/adc/ti-lmp92064.c                     | 4 +---
 drivers/iio/adc/ti-tsc2046.c                      | 3 +--
 drivers/iio/chemical/scd30_core.c                 | 3 +--
 drivers/iio/chemical/scd4x.c                      | 3 +--
 drivers/iio/chemical/sunrise_co2.c                | 6 ++----
 drivers/iio/dac/ad3552r.c                         | 3 +--
 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
 drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
 drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c        | 4 +---
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c        | 6 ++----
 drivers/iio/light/bh1745.c                        | 4 +---
 drivers/iio/light/ltr501.c                        | 4 +---
 drivers/iio/light/opt4060.c                       | 4 +---
 drivers/iio/light/veml6030.c                      | 4 +---
 drivers/iio/magnetometer/af8133j.c                | 4 +---
 drivers/iio/pressure/bmp280-core.c                | 5 +----
 drivers/iio/pressure/mpl3115.c                    | 3 +--
 drivers/iio/pressure/mprls0025pa_i2c.c            | 5 +----
 drivers/iio/pressure/zpa2326.c                    | 4 +---
 drivers/iio/proximity/irsd200.c                   | 3 +--
 drivers/iio/temperature/tmp006.c                  | 4 +---
 30 files changed, 34 insertions(+), 85 deletions(-)
---
base-commit: 4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
change-id: 20250611-iio-zero-init-stack-with-instead-of-memset-0d12d41a7ecb

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


