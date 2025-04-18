Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7996FC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwEV6MZFJIchPoMNTCpHkxpHxz93usoOxoRUm2ZA0bk=; b=dyGnWd2VrpXYuUC04VeKSqoIWw
	JUedAkteVl+/FDvRctPVPkbHVMebFLEprupXj1Ud6ezyZztSG93VUupQQAeWWjCnRWZlOHP/MzcwJ
	NxszTGPQk8wLn8RlB/eqGxSPOB8VXyCkZJHgjxT7TcsxZV80bPCqLZREdFchChFiB6eiNWqopYw71
	40X05aytvbVmKw2r96ML537QlTBSQpLzLlLGwBcyAFs2lhUW0U8yalaaUnKtSVtF1zdw03o9Oxk8n
	yXQHYP9BMnBuDpJTUHp/23jgRBgrTqX8usVh+0lzGutrfYHMLsbfx+w+SZNqG+EyKknRh3awNWkIv
	byDGu0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5s9R-0000000076v-4AVm;
	Fri, 18 Apr 2025 20:17:29 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsa-000000003zy-1zgG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 20:00:05 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2c7f876b320so1360285fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006403; x=1745611203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwEV6MZFJIchPoMNTCpHkxpHxz93usoOxoRUm2ZA0bk=;
        b=U2j4eVBjwGMvaUmWiXqNQ5YGQaop9lyJfnad4tIX7fNvcN+dgVQbDXMHVoafNiP2NX
         S5Hujyz9cb2Pj1naMmVGpn5lI+zno/imHOGHZT7p+cwdeeVsba15sHUIPQuidbAoV0T3
         vduNia12UuDnESxEwU+jgcCaxrJRHVzIv6Tqi6Gd8xnOv9Wah2d23mE+apUF4tr8s17r
         AjxZngllHLxJjCrUYuVKd2Asp4q+NSX0/Z3zYFu8IUNX4sIBhz5rBuyXTJn3OIKjp9bw
         b/OFF9Uvo0rJ4Xd/uZzeJZ19VA0O6+xWzvdDRCkESsmKMVM5luTfkqt/aEARA+Uj9zhU
         0o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006403; x=1745611203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwEV6MZFJIchPoMNTCpHkxpHxz93usoOxoRUm2ZA0bk=;
        b=vbUY53X9lBemKTlmGQL5VOHJtUW60R/ikwZbu55JC1yac+ewvV7VHzG7TnCdAEnsYX
         i/XhFZg1blR7kVznycaIKLdoDvXUzZvjW1A/A4s8U9EXzHKvf2V4CmRDAecKrfdh9VDR
         ojTIYZDze64o/PJbMM6m19nZte6+6CeJAUmFy1BUTrE1Xf6ckZIJCutoB5gzjZ+gXF2J
         xpoHZ0DDt1j/n+7ApXYuQqBlYLI2R6eSFwi/ibDGWebCHZ2+weAQKQXNu8IzRjMzkG4I
         lzs3uGk2h7TmDacOPGOsJ7Wo81MZroNocHcmhisgEw6NpZ03J0A2iIYvSyWVd3+ANOmJ
         T/ww==
X-Forwarded-Encrypted: i=1; AJvYcCX6NHqshEiKoohZEx/d/tznbeV2cy2mebF4IZht2JScb3dxAynzI2rL+kgkPmX5lHu49AyCWN3Iu4+8YSTTkGPC@lists.infradead.org
X-Gm-Message-State: AOJu0YznWt9TvCiXNHpTzyubBhNzp+9KqWwemgnHgAAFUZQ3lRoyvfl4
	Kkpwi1geEwXMVH0Tf1iw5Jsim+xr3Jajq+2oenOHjgt5UsmvVwHP2wZI1piL0ck=
X-Gm-Gg: ASbGncszRS04RrzkENwY0uwvMI4/Oizs1dcwFIEKwyyAIUYmjivLXOW4i1JkiP+RZmT
	7va1rD72vLYEPjYmMqC508YPnMnBdAydefQub2oqdYsElt+CJCB4/UU1VtMFVHpxOS99njLpbXk
	sSlkkwuBEFTzPRShUPhCIf1Ih8HTXk3PPTnOmLfn604mo8uYDiCJoFwUJz0czZjNNwPMY34FwTZ
	6eE0tA2RJoLSkFR5uJaEux6bh7b6EhxAxFTGIYFpxc8VAEU9fbPbeAZdL1fMgDLb00eK6Qg+syg
	cuMFIZ/LWmXnqVJ5s3BC38J5sOZXJHd2AOr9hZa0bnXfncs=
X-Google-Smtp-Source: AGHT+IGOnbfbgHvkykmuoWWumpe/zQvoKx6ZttBWLA1bqT+37tvAXi4z2gJDa6nDw9JVR42V4KG3Zg==
X-Received: by 2002:a05:6870:aa9a:b0:2c1:44a9:fc16 with SMTP id 586e51a60fabf-2d526ec9824mr2328947fac.38.1745006403477;
        Fri, 18 Apr 2025 13:00:03 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:00:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:27 -0500
Subject: [PATCH 08/10] iio: adc: ti-ads124s08: use struct with aligned_s64
 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-8-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=SKCpF0rSJSY06g0qoJ4XgXpVJV0JPJb8oLvnwY1CUvQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8ZpjC92ceussgPgpBKBLXA1tO4DdY6Pfv+q
 jbN1Cv80eqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvGQAKCRDCzCAB/wGP
 wNhbB/419+xS1/MlezzwDnTGWqQSMnAh1Q2CLkNfdMRF68px0+3K710C9xuAgCWfWqc+HY4d/gd
 0Z6Ek4aSyCx9NVF+d9REpdeTCbkAjzL0yt1UBHDq7hsMFQOylHBCYJFxtxStm16dSE9AByAHWcp
 ztS2vlc/Dgu77OXzBjdmjGD0dhTrhCxBJHEAVudLPfh/WAoVrFRmc5QXkl5E57hP1EQoHD1p8CV
 iob437dhuhV1doZeSuFDEMRKbhsa1awJs7IRtPIZywjnzRwZ9s4wgjSYJSr0o+bYCyQ6Y1y1JLq
 bo67Oufp7S8gpeHG7/yyq/tHcStfArgOiFqPlRhGWaoDoT8L
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_130004_523340_10A23E42 
X-CRM114-Status: GOOD (  15.34  )
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

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads124s08.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/ti-ads124s08.c b/drivers/iio/adc/ti-ads124s08.c
index 8ea1269f74db09427a4a8d434ba1d63e7c63d038..ecaffe83fcc911f99afbeae7ef51440d150bef73 100644
--- a/drivers/iio/adc/ti-ads124s08.c
+++ b/drivers/iio/adc/ti-ads124s08.c
@@ -98,14 +98,10 @@ struct ads124s_private {
 	struct gpio_desc *reset_gpio;
 	struct spi_device *spi;
 	struct mutex lock;
-	/*
-	 * Used to correctly align data.
-	 * Ensure timestamp is naturally aligned.
-	 * Note that the full buffer length may not be needed if not
-	 * all channels are enabled, as long as the alignment of the
-	 * timestamp is maintained.
-	 */
-	u32 buffer[ADS124S08_MAX_CHANNELS + sizeof(s64)/sizeof(u32)] __aligned(8);
+	struct {
+		u32 data[ADS124S08_MAX_CHANNELS];
+		aligned_s64 timestamp;
+	} buffer;
 	u8 data[5] __aligned(IIO_DMA_MINALIGN);
 };
 
@@ -289,7 +285,7 @@ static irqreturn_t ads124s_trigger_handler(int irq, void *p)
 		if (ret)
 			dev_err(&priv->spi->dev, "Start ADC conversions failed\n");
 
-		priv->buffer[j] = ads124s_read(indio_dev);
+		priv->buffer.data[j] = ads124s_read(indio_dev);
 		ret = ads124s_write_cmd(indio_dev, ADS124S08_STOP_CONV);
 		if (ret)
 			dev_err(&priv->spi->dev, "Stop ADC conversions failed\n");
@@ -297,8 +293,8 @@ static irqreturn_t ads124s_trigger_handler(int irq, void *p)
 		j++;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, priv->buffer, sizeof(priv->buffer),
-				    pf->timestamp);
+	iio_push_to_buffers_with_ts(indio_dev, &priv->buffer,
+				    sizeof(priv->buffer), pf->timestamp);
 
 	iio_trigger_notify_done(indio_dev->trig);
 

-- 
2.43.0


