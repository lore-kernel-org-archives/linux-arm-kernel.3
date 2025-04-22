Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D944C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcAjMtDsEwOO8O58Cs5cDx4aKARQOhUbmH4snH5r6Ms=; b=AltTOYvxop36X8ySH8akXrleT1
	D6yceAZmeWCgko1AtuqmSbFG9fxEDrTcMSDnnSwt5ucykgiCLJTqhDAORLJPE6+2vqdhjpJC7KbQp
	5cHGZzlMnXJtZC9mHxSOb22W+7BP4yiGJEjpWiexKw87Y78NeSj6JglX5aT/F2yBWcEfgRJ7Y9wji
	JgEm1vm/bqkLwFtsvtwdewZ+lCHMTqUrR34azxJWw0v2UF18DYKnOR9uAFIRZpoi/F8MTT957lKeR
	8Xzs+eTYVgnXRWdXRP8SuXiRj+8x3te16wzMv9c0G+2ZHPRq6cAy0WIPiR/tbHXTA3/X67nySeqVz
	+c8dMb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7M4R-00000008iLl-0O3W;
	Tue, 22 Apr 2025 22:26:27 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LnP-00000008fpQ-0LPU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:08:52 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-72ecc0eeb8bso1367732a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745359730; x=1745964530; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcAjMtDsEwOO8O58Cs5cDx4aKARQOhUbmH4snH5r6Ms=;
        b=GzaVnTps8ftqTORJOmzy1exoEziO9rSjuS7Wjdh/uHjjn9TFnD6RkBQUb9pflQqXUa
         sdC2mY/Mmjk3lGk+lsB4a44GB48oebmgqw9qKIWjo48rqGVW7WinS/QiGIjwt3JpcX9K
         zsOobq5lC6OjzLwT/1OlX3InB0MilC5T0TXi7dCwOOmdTt2sdh0Qr0ANzSMHOj8yGAI2
         9pFa6k429Sez0eZXUBZ0yynYCe79+TdDaJeB5JN79xYwyFlPX712pLbnf4k4x3Qm2gXi
         WVXJQTKiMv6DNQOAW5ui5fmBlT0U/XYUH6SNKcxu6PJ+Nr2oU8UN4EVJ0wWvN2Rt+jjI
         cXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359730; x=1745964530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcAjMtDsEwOO8O58Cs5cDx4aKARQOhUbmH4snH5r6Ms=;
        b=doBcS9p2B9zLrYGQl83RJZvXW+f2pL3zZw614h5zUz2MuJ/Vw+pD4S8GMLdujSwax2
         uKWWcWddSnncUqKOnC3Na+3CkF87Kg+aShRuxVO/vvfNmu7W5NPoopP6r0Z4tCZjREIO
         tBsJ2MiujcqhXgPl7Y5ssOBNotN1d6Ywm4Kwrr+KEu6eUIPqXafIOM71wqZTwwVAWGEH
         sUwf9iTTJd/Wkqvduvnl+4tNzjD0odJY45xv8bZJHzwmgmibmc/XfpCoPqDPKDgy5YTB
         pBzCBpf0eOMETTs6ps2+VAUslQ0NN8uYuJU9rjoFIw2eTfvws3c0u6AZgQJbQl+OBWXj
         fr2A==
X-Forwarded-Encrypted: i=1; AJvYcCUhRHD6+Ia0+Mkfy6vUc/IHA09d6oyknFdUwA5ztMIFPX5F79EbQ+7YZhGEmcZI7+PqcDO6DfgK/uwEFgcdXkP7@lists.infradead.org
X-Gm-Message-State: AOJu0YyParVEEOJBCGkBsfdINj54QWQ8yMp0nH/lwlM5t/Yj13GXDbJ+
	vP/j8Q5Xkt8Zfs/Du1rLVf6606Vnzkv0tjAb1kGsYn4oCl6WkoTBtFmbAPg8e2A=
X-Gm-Gg: ASbGnctIH/sNI8RMjhhZz++wlaVD+7lGilzbeNq0bcgaoAlro+DiBbQoTd5LHxoOdys
	b48sDKWKeUHN67oqjvNHKXU+F5jzbN74fW2pAUjU+CQFIwa2bjXC7oq0ii9vUKyPbiOOqRVarfy
	M+Eeku1LbNj3UXq0HByDg18Wab6KxuLeb/ksuHr+Ot5vyP935gtoWpnSZ33DxbdeLdri+xj8ojO
	Jt5M9GzAhYyoxsW7XBeNO55ZRQRSuIoQFfRF4cQKqTq/sXwOVBDJuhJPso7YMdCzoRA+ldA2LQf
	T2bCh770AHNnVDT2JdMhD2cd4O239Rui3bexwedNukc2voM=
X-Google-Smtp-Source: AGHT+IHzzwKW3y0fInhdjWSpsuJ5JmWctR16v6GWhHHGSelSclI2sxPnML9dTnb8TnnyDMSSFW1wDQ==
X-Received: by 2002:a05:6830:61cb:b0:72a:1dfc:c981 with SMTP id 46e09a7af769-730063304edmr11661860a34.25.1745359730406;
        Tue, 22 Apr 2025 15:08:50 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730048848dfsm2265938a34.52.2025.04.22.15.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:08:50 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 22 Apr 2025 17:07:51 -0500
Subject: [PATCH v2 6/6] iio: adc: at91-sama5d2: use
 IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-6-3fd36475c706@baylibre.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=bNzghGrt115+ZKNUZFU+xQJSBPkqwVs5iV+9xGBsm0g=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoCBNjAzzt1sRYLcJPXzefhzYxHcbR4XNJFDKvZ
 JN6D57NVvyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAgTYwAKCRDCzCAB/wGP
 wFKfB/45NebbapbIP3t4eBe7IDDKz2IX0X7vuL1EOiu0sCj5YLzAqoCos3aGbC3nAYBmnTV/9hu
 cGfDIiEMSXlDgH7ASvPN7SFQ/ANjGO2xc896/FcMxGq/kyx3dOp33a9ienXD+mFjne9N1/PXWIg
 oO+XPo6f+HtvNvjb/uyALdwB822D7BpmRJ2i765kt5mysIPkY5yd1SBIXUu4sT9gLI9lMfV+oIo
 MqxuocA4UYA0VEMFVRssN3TAOhlHC5i+k06k7VuE04rpLH+kqyuHDcLJvBuDJnsLBOsic2D2h+q
 5Kbts705K+v72L/z4sznTI1YwjSMGRe0UILK+jAPLEOzrS4u
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_150851_124399_7F2019D2 
X-CRM114-Status: GOOD (  13.85  )
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

Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
and understand.

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


