Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7543AC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=; b=Pw2BlEwcCqE5V4+N+Z6h7vBHLx
	ubHxcQrkcVpCvdUoE/m/B76P5ny/v2doUNQSp0I4tX9LhLHXenyZWoDrjYCamchgwBI/URG37cKWd
	jV5WfbgngkAlCSOiuKNGyZ0kvSTG9eGqSp7bdmm6aDcrLyvgQODuXASVqDyqCQRcYDuRnz+NFusj+
	wXXXIpuEw+O090dJii7otaFYQxgbpmadA+BT3HwI2O/fRQeaQ5mpxA8rF3LGmcRPToAZ4wHIWTzjj
	M6L4gy2CMSsaiusv01S3nk42hp5mx4RaZ2WA3w+VDkjouvCZpwNnMfk6TfgvcU/6xyvsl07ri5K7n
	hSv1oRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VCz-00000007UGl-1Msy;
	Mon, 28 Apr 2025 20:36:09 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V1R-00000007SHA-3Bdx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:24:14 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3feb3f54339so5333713b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871853; x=1746476653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=;
        b=P//Ujc3h9MZEr8/T4qvRXEhqOBMb5gDkf/6CJvGA0aBTHuXKMrOYuIL68YFdl6yMZV
         UesPoOhtm7z9nYDtcd1xvFZMreRfm2gceWaQemp7pNl6bN7/a5I0IkY4keafaKNqeGY9
         Qw+QTLz3W7bILcdaonBtCVUT4K0dgSkzVjX9z8zT85oSXGkTelzRkKpl/0AURXeeH3vH
         f4F4ORE8BYuaG/ajsBG40xJfd6d/guFgHq5UrMWSR6DK/XB2jgTuBs3mjVpE3gXdKA/8
         /gHFEnYYaLXKS6fricFMhDRMqNAjeZmPSMKLTvkoUAwIdhfpgyqQZr+4tH2WzqZ2xsug
         g05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871853; x=1746476653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=;
        b=PokyviEWP4Mkhum9gp8BuAPr9M7cvLyITtruhKG1Uscpni8//yNmvl9b/BMPKodarX
         efzD6OOpyGCSUKOKocSRYfDjUcNVgn/9mOd7fg82iHfo0u6Wu0hpcJA/P6VNe5t+N7Zn
         /ER46fOIGMRfMrm9lhRkrNi9H01hWIRkqu+xVf8637Oip5Z+BDU5Z+WDQp2rCTF7fR3K
         oa1pZ18QgY82xRif/wtQBgNd6SVSr9uvj2JvSdfjtIyFe5v8KOApXS3/tfMep3LEqK4B
         /8JVSVzy+R1Lt20kW7YNoceGglQMOyC6FWfUkVoeQGubBP+CwSbzz5zcm78p0cMPnFWV
         NAww==
X-Forwarded-Encrypted: i=1; AJvYcCVVti2J1d8dffJBJZwhHZqyuBGjQ38SfYKYHl9x1BprLTW+Img3XWzFOFQAFZXY+wKHd60HmKqH8xHJNvHxn3Cq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3BpI2qIZ8rvy3lKBEWmxtCFy1CZBTSZ7jSuwkIU8xANJqLFuK
	HuyaqS9tg0N5a5fcBVSWxFBhp+dTk8wzLNo9RbmiFDB2jDMrTU4funUKthVEORE=
X-Gm-Gg: ASbGncvz1gz4r0f3OltrHxAoSN4dQlFuHyC4CpUtvzoXgoZO5NuGQZRFqvwprUIiayl
	JaLf50Xnyqvgnodr3lJveCW+zEQynvBPBtMSbzwMXzpuRVlvm4vmNY854YPyV1+MKMpIoowcsE7
	OOCaGLf1z6JtQLqLya1jqZGTdK5cNwhucdQLv9wkTtoMMuCR9TvzNezzWAaQEniBeA6y3fz5qo+
	Zy2Ry5/wPS2P9B3wAze1SWu/MtArcH+dJMwEtQoFSoJjAiNJfIj7LHX9IPMgmRAV/1TMJMxdejo
	FmOyDgpZ3rwt9fP4yemTdYn/wTlC3lN5WdAn6MK2HbXpddYOiSooZVu7jg==
X-Google-Smtp-Source: AGHT+IFMSSYxN7PK63XVoFOxHQkyZ8JEzuE0uzWukzKAPCdxZRACSzzcrQRpXZPMCEOaZ577NXiY7g==
X-Received: by 2002:a05:6808:6f93:b0:3fe:f4c6:a053 with SMTP id 5614622812f47-402107c0d8cmr718547b6e.4.1745871853106;
        Mon, 28 Apr 2025 13:24:13 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:12 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:07 -0500
Subject: [PATCH v4 5/7] iio: adc: ad7380: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-5-6f7f6126f1cb@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Vr9wDkA3SNoSLT9FCnDYkBa0JumGawTzg2ZkCcTYUYM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+PMWNKFP7ZhFMvFOuiJ7rcZBKKOsujRDG4Os
 CIHO4PxOY2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/jzAAKCRDCzCAB/wGP
 wFmoB/9c4ABl1VBly/ge4NLl3iDZmPa8fsd5u8MhDN3q4RgHIjRoWV3Vn2ypZk5O/wO6jSI3Y5g
 8Vi8Y9ASJ7k4FUo+us7y6o/9Nq27euWZ/uOWxbC1iJueH1HgWYcaUBhIrZSq2qMFW+HaB8V8OAM
 g5obAma5H3SKK4Zcx4YyG6xgvM/SzEO1SB1etFTw28vVc+Z8HCa64wdILIhF7rVS6JK+qQY6NgU
 wtEWuN5caQfN5xosKwIGyC8GTMrU0D9siB9mn2YUdGNWBFwj+3ecHDV6invWY8I6A1Q+DVvjzTE
 iV4NSAqtnYANrywdxzgMJkqvADUn8Re2UUV+CkV0yz1nT/hD
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_132413_816727_24737CBF 
X-CRM114-Status: GOOD (  13.17  )
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

Use IIO_DECLARE_DMA_BUFFER_WITH_TS() to declare the buffer that gets
used with iio_push_to_buffers_with_ts(). This makes the code a bit
easier to read and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

As discussed in v1, this one stays u8 because it is used with both 16
and 32-bit word sizes.

v3 changes:
* Use IIO_DECLARE_DMA_BUFFER_WITH_TS() and drop __align()

v2 changes:
* None (but I messed up and there was supposed to be a change).
---
 drivers/iio/adc/ad7380.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index f93e6c67766aa89b18c1a7dec02ae8912f65261c..ed5e43c8c84cfcc9c4ce1866659a05787c1d6f5e 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -909,8 +909,7 @@ struct ad7380_state {
 	 * Make the buffer large enough for MAX_NUM_CHANNELS 32-bit samples and
 	 * one 64-bit aligned 64-bit timestamp.
 	 */
-	u8 scan_data[ALIGN(MAX_NUM_CHANNELS * sizeof(u32), sizeof(s64))
-			   + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * sizeof(u32));
 	/* buffers for reading/writing registers */
 	u16 tx;
 	u16 rx;

-- 
2.43.0


