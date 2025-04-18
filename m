Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC5FC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MggEbc3/wN2+Q2lPVGSfBi5tCxmBAoGp/YWYe65Ys5s=; b=0cVX2HU18UKbJMU6IwAgZBQ03G
	FpdrGprE5nHcxPkGdozXkXo+A4Ysp8mLl/bm54P0UCF7UU7Tk/JKuWGzY7RVUwUqcWXI5u7EX76ij
	lnau+OBgiYqkAZkn9gmNInusEbxPPrWp+e4L+QFMW+d1XM8RNDxpZAGP/8Tm67Q/UUiDRqJ2j2RZJ
	+frIU4j3qjZ1QbLr5OjmaFrstDL5vz8tg7fr93VlwuruzUDUAX3Y3Ki4TUZZJchC9J+iV+U9vI9fM
	oH9mjw1kclYoTI8KhqGiFDjfKfDf8HfPTPmehBe95BSAPSv8Uu7jq9ubOJadr3Zm3qNTyLVQWpBZP
	nbYTgCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5s5d-000000006GJ-2JpX;
	Fri, 18 Apr 2025 20:13:33 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsU-000000003xY-1tun
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:59:59 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2c7e5f7f0e3so615413fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 12:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006397; x=1745611197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MggEbc3/wN2+Q2lPVGSfBi5tCxmBAoGp/YWYe65Ys5s=;
        b=Ld6RWnXazBYPhuLrSPxEPCgwHjg592ddU6aX65YfftbBVO/97Cegyh7O7gR6UElORX
         l9iAtkD0qhCmz1MaBP8y5fuZt4UovAUQZRiuzTNhdKtMS/b4L54l+aViLqhwYeiUYXSD
         qEEd+vyht3IacaQZRQc58Ci/IZQ+HZrZQjjW4zrU9y5IQQxy2xSMA3UUfosTwoIdQbX3
         RWjGty2gH8ZzMfLzq2xiiQ051vN6mYxWEtrDcnBcP/mUoJPgRKggJjOfCWMbelbDktPS
         IaSiTVbMD9+HKDGB1+idP+JCzqq2SwReR0JKMIIxFfrMTJjVqsO7YMXVVCI0hISj7+Z2
         K3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006397; x=1745611197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MggEbc3/wN2+Q2lPVGSfBi5tCxmBAoGp/YWYe65Ys5s=;
        b=awH0dacCiW0nwd6uD3+tFMUCVuGBsJnjrx5XTZO4yRt5NZkjPdzt8hfFKX779e2jtP
         +52hBQGi0nZRaH7O6aXtQ1vjbZ4EjlISS/MFytgcXzYhpo5QhXh/pkjz3qmBWCmpC1xK
         4KnJllNZ4s4lSbJqpnjZmVysTbucq0Ht1mqzUyM35RAGTm+JxuoH3fogky++GTe6+0s3
         xa3cP3DdXfQbF7SFXwQfxG0yYTm3k+ipzQpQ0NVI3WK6GBskhJf/s0Zw/08g7iMMNnbD
         m7Tq4Od9VFLf3SVLn72oJTuLnMNIKrirTQNbe6CuyaHZOEBtWM+0zZaHMIPOb8sHhSMZ
         SrVw==
X-Forwarded-Encrypted: i=1; AJvYcCWROJwzE04AULluXVVw2V5XyQYIqLcL46XeRrJ1LofD9I+vzSZsmh/TeMFjstWQs8PIznsM/v6J61v+WcE4VfHE@lists.infradead.org
X-Gm-Message-State: AOJu0YzIPQp6ojBLfD0DGrgluEsvxNGr0pCkgYTYkWhIa0WptbNh4fLS
	tXHT+GkYDPriBkcpaETZScxDsP/zcbmTrx8og9bvMxuTWkhNi3iX4wOqeTclP0M=
X-Gm-Gg: ASbGncszTdtj43mtMRFBwn+bmJYQPqHCnWXTaPumxSsStORTveKvXEH1pyK1YmWJj3B
	47kSZImHj7Dd/5IW9b61/Vs8gj9QNHM7IhBwKJD1F39hccjpK2B8sqi9hCdpYm6LkP1LxAR2wnP
	44yYVmUyRgyb8EDqMC7013nFQZNV2xb5FcJL9nqxWupd82xglA8PQ/6C//8Efp0MdWhATsGhePM
	WqmnUiRe3I83dZxyC7+Yav1Hl53RIgIYZsfz+z1CfL3IzKYBk/YjQz73fD6wT+mo+0vagiGB1Ea
	08ISqnz0/Wf60+10h/wVWtiehX6ObnTXLgV7dnKL/XmfxSAtB+o76di4eQ==
X-Google-Smtp-Source: AGHT+IG+gejGjhaQSsLs7N1sUMk8COxBQa4oufobNgGcbDF7GP8s42nvoeAVo7lIwRuf8OSEn7c6ww==
X-Received: by 2002:a05:6870:ae84:b0:29e:503a:7ea3 with SMTP id 586e51a60fabf-2d526f226b0mr2234380fac.36.1745006397466;
        Fri, 18 Apr 2025 12:59:57 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:56 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:25 -0500
Subject: [PATCH 06/10] iio: adc: ti-adc0832: use struct with aligned_s64
 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-6-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=k5yhrc00lCr8GGuZ0R5nv3Gzs90XuAA6/+QofhTasXU=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8L4xpevGeyh+Cbk2mjcqGgi7fDAYg/NhVII
 IL10PDy+pGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvCwAKCRDCzCAB/wGP
 wOHsB/4y5HpYvODEZLE67Y714oZoOOB72/gk72fvqGQ9uGCnlTWkSz7wnEGxYKbmMkLsb+moj/F
 NBujkX9MGrrHtpAp8TLZsFx98Hcb7jzknjKtpB2htjv9TdDIv9CqKX1yOBA8EVZXwi8XHCeYB93
 3BtqQ9OWhxpnqUwAM6qebZ+ptcjHPFtorYG4nsZpXR6JFv4oH39UENA2/CYzJ9EA1q31gj/VbIt
 LBL0I6QcLgYVzgzg8aDfKEbAB8tuNXT7KJdCRbPUBCzRQkNQITxQ7cbaRf6lJIfRc8O/Xp5MnxT
 rnK9CSmF3wjWUJALvkW2wA+G9QPBXPEI0MzWeOle7GfS6WLA
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_125958_497157_FF206B53 
X-CRM114-Status: GOOD (  13.84  )
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
 drivers/iio/adc/ti-adc0832.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/ti-adc0832.c b/drivers/iio/adc/ti-adc0832.c
index cfcdafbe284b103a069857028886411bc72dea4f..f508f7113faa2610a2889f3c36c5a679fa72264d 100644
--- a/drivers/iio/adc/ti-adc0832.c
+++ b/drivers/iio/adc/ti-adc0832.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/spi/spi.h>
+#include <linux/types.h>
 #include <linux/iio/iio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/iio/buffer.h>
@@ -29,12 +30,10 @@ struct adc0832 {
 	struct regulator *reg;
 	struct mutex lock;
 	u8 mux_bits;
-	/*
-	 * Max size needed: 16x 1 byte ADC data + 8 bytes timestamp
-	 * May be shorter if not all channels are enabled subject
-	 * to the timestamp remaining 8 byte aligned.
-	 */
-	u8 data[24] __aligned(8);
+	struct {
+		u8 data[16];
+		aligned_s64 timestamp;
+	} buffer;
 
 	u8 tx_buf[2] __aligned(IIO_DMA_MINALIGN);
 	u8 rx_buf[2];
@@ -222,10 +221,10 @@ static irqreturn_t adc0832_trigger_handler(int irq, void *p)
 			goto out;
 		}
 
-		adc->data[i] = ret;
+		adc->buffer.data[i] = ret;
 		i++;
 	}
-	iio_push_to_buffers_with_ts(indio_dev, adc->data, sizeof(adc->data),
+	iio_push_to_buffers_with_ts(indio_dev, &adc->buffer, sizeof(adc->buffer),
 				    iio_get_time_ns(indio_dev));
 out:
 	mutex_unlock(&adc->lock);

-- 
2.43.0


