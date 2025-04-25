Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00845C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLGFE4jWdVqehv02FfXRMamFv946mVo/oPig2GMtSpQ=; b=lCiqoNrz1zXvWNl8QhSjsReY/e
	U2AEtEVITtVLvFSOaacihg3d/9qWIXXQC2uS++wQSSN04Gu08MRmNi+3KI/o+UaeKat6Fq4472n5N
	e7cRGCnQw58WoRllxDrOqPqUJO53FyN40nzfnSpxPVMxOSvbsIXGdm9tQ40koDNklxIwyhaswmmNd
	/fyhwbjtjRXpkXBfPHWspO9S3Pjy5ieYNMqqSBBoUCEq3rnS9lh3LtWTnaJEe24xi36M17l6v2XDU
	ssnDR8FbGbuhqmCw5AkW3tkYKnEwwRxWf9vhoqbL0AU2V1s5fHIZzzPJL+XNONYeV7t0ISh7Af4xi
	JXn98ClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QYD-00000000vBP-1w6J;
	Fri, 25 Apr 2025 21:25:37 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QIq-00000000tHS-2DZP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:09:45 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7306482f958so271482a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 14:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745615383; x=1746220183; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLGFE4jWdVqehv02FfXRMamFv946mVo/oPig2GMtSpQ=;
        b=ApD+pANQ5O/Bt1M6fvvZ7A8TN3vBDtHHXKKiywOM07FMvYl1yNcfkF1qXdvPSblpGH
         A95OUziBLvbc9xXlOWP17k1YMKPk31MUIXQHWvk287cZcxfsFMGH1HCyfWehHqR+XSsl
         q1QKGNKPqRV33F0Bal+D2DOviNk3PlG4Tei5ebJDoQaih7a6jKqBIu5g6JY9V12+a/QA
         qs01urWx2ItCDFnQTRDYBo41l+IRyGxDY7Z0tbZHNnSzr+dgE2EESJAz5JHnIFA5BKrR
         MBl55UYR1HBFPiSQGLbGo56pot+Zf+LkQw7cY8GtjtpXqvYwqNtUPBXhytWWEl5tmdMa
         A/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615383; x=1746220183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLGFE4jWdVqehv02FfXRMamFv946mVo/oPig2GMtSpQ=;
        b=fBCPYHYK5XX4lPVc8gz0w4fzcwMVMUZ3cl9VULzNJBIBAo/pW97KtgGF7Y9egKLYKK
         kDvb2oNLOOvwk4N20cVJK6lcS9ZaZMN8NwtcI4szW7SHcCEXC1E9aTSHFG/TCYTMxU5l
         5UZkXz6knCJQ2T8iMj56XIMF1OCrdi1Nt9DadJoY/Gmo3s3/v4M84RX3WumU6USQ4M5x
         s7l1Laz8xeloozDohvXa7wgNQ53URzPyUAmq9H8/8WcWb3SCipN2DxZ0Kuff45SckBK7
         XXzAt5TXiKonkUhNH7tq6hLK63lwyN/JGBUel2B3peH6dLZgIbA9nrbrQ7tx/4X9uaGK
         CVAw==
X-Forwarded-Encrypted: i=1; AJvYcCVbmMy8aCWFYZGvMSlXOZD+gvYdpWM/dc7+wJsCkFD9rLMxBvkUscxgYYrsHJiDagVQNqkIrfB7uygrnAcz3Jmy@lists.infradead.org
X-Gm-Message-State: AOJu0YxY1lyIlrs2VhT42dXvxs8Xr/oAAfI+Q3Cc+/3Ry+JLCf9s3oVU
	MAlV/4T7TidSvRPjz1GWpQ1/exF9sJj41sw4Fy8ZQJXECkKmG9ZhKLyZNMFjE+E=
X-Gm-Gg: ASbGncsgxNtwUJhKbJTCePo73oNYKxzm9+b2raMbKEc8B3G17oaydLgXgapDlexfHC0
	SSJ4ifQFQGjFd26f8+YHLPMUGQmUu2aSz8VZDB+vSXx5DrDoc/f3zLxMD1i6d7x+JVJdoVG9a/7
	YW3aHPPWEPUiHkEpvyh9vwSDSKLtqDCdFyRHfcOJy+3vjm9wjBmG87Cw53Igj26lky+655/5VKd
	/iz3QT2miRIiBYq5AzaPsKOLH6RlZgok2be/iRVDhf42lc8Ck7YPMymdtywGFExpM245I+B2cml
	iMsXyVtTvtTQU3L8ddSkjm1ca+gs8aivCicU0VrpMfesoGTNyw4SDgo=
X-Google-Smtp-Source: AGHT+IHuXyKh5ZN8gTfHG9qpfrVJEoH9N4Qd7+y62hF7SPBuooeBppTq0ItxP6Q1b31VLKNINSFoXg==
X-Received: by 2002:a05:6830:7008:b0:727:3f3e:53bb with SMTP id 46e09a7af769-730652484d4mr866727a34.24.1745615383552;
        Fri, 25 Apr 2025 14:09:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f188052sm847673a34.8.2025.04.25.14.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 14:09:43 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 25 Apr 2025 16:08:48 -0500
Subject: [PATCH v3 6/6] iio: adc: at91-sama5d2: use
 IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-6-f12df1bff248@baylibre.com>
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
In-Reply-To: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=0ZROZIYuD1zVkkOa3PNcABnV8cSDGoSdT6l8Emh427M=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoC/oJEty80tyPXVTdFqZGvPX6xqzXo1bpiUv2M
 CaUL8XvOzOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAv6CQAKCRDCzCAB/wGP
 wBvoB/0UnRiw0riUGqhqh/XDIPZR7uCez6zobleSUHhagNRfN8sY4l8bawJc5MlIgLLbl8FhYhd
 9/eqeGougvJ/jGQ7YqbmoGTbqoYdi2YQLw4l6W2w+G3nkS66Xg8/LGPSpILZy6RAk97URQr1IhJ
 g6nc4HSEde06PLI7VFJIn96AQxa6ztR5vh8M9P8G/WK2rCC1xQjGyei2MpR7S5YAm/W1O7k/c2/
 Iiczy+BYuiFS1g/LIhku9hvc6zrrbuiXZGQPUi7BDWz4SQijbCiH0Fi3R5SmAPY2a2o0hle7l/w
 ov1SL+pzWf/yX2jcoRIE9yleZxsrAm8YkUcevoy0zlrcxau4
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_140944_596750_38617D64 
X-CRM114-Status: GOOD (  13.51  )
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

Use IIO_DECLARE_BUFFER_WITH_TS() to declare the buffer that gets used
with iio_push_to_buffers_with_ts(). This makes the code a bit easier to
read and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
This is an alternative to [1].

[1]: https://lore.kernel.org/linux-iio/20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com/
---
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 414610afcb2c4128a63cf76767803c32cb01ac5e..4ebaeb41aa4568e2461506471af0540af9d1a041 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -586,15 +586,6 @@ struct at91_adc_temp {
 	u16				saved_oversampling;
 };
 
-/*
- * Buffer size requirements:
- * No channels * bytes_per_channel(2) + timestamp bytes (8)
- * Divided by 2 because we need half words.
- * We assume 32 channels for now, has to be increased if needed.
- * Nobody minds a buffer being too big.
- */
-#define AT91_BUFFER_MAX_HWORDS ((32 * 2 + 8) / 2)
-
 struct at91_adc_state {
 	void __iomem			*base;
 	int				irq;
@@ -616,8 +607,8 @@ struct at91_adc_state {
 	struct at91_adc_temp		temp_st;
 	struct iio_dev			*indio_dev;
 	struct device			*dev;
-	/* Ensure naturally aligned timestamp */
-	u16				buffer[AT91_BUFFER_MAX_HWORDS] __aligned(8);
+	/* We assume 32 channels for now, has to be increased if needed.*/
+	IIO_DECLARE_BUFFER_WITH_TS(u16, buffer, 32);
 	/*
 	 * lock to prevent concurrent 'single conversion' requests through
 	 * sysfs.

-- 
2.43.0


