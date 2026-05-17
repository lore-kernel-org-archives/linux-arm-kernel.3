Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD09BCD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MRGfKr8H7ah4yZfqeoPinkYJCKeiXt9tjcXW8VOiYM=; b=Mq4v/h2q3cUsP+zmbI5ntK5ymx
	W0jT28w1uZmclXA9hbp4L6UgGNojjbPQBCBjcx02q/7kzAIOq3tmwkgHskBonRzmrJ2Tfbn0NpFNo
	fmSC4ViXeUC6cxWu8HlFfYDM+iSsbx7m3zshIV8mEU1mA6zMslGdlEZ4Kg7xTOb6G4t3oA0KSjlcy
	GRyQPuzG884tIHqL2pZ8z1KgV8Tb7LAzMzwomEsCNHAcdwBPmuiRDLFv/iQqNjNbnceJsgV3J+veS
	0lfUVZ0hXaekLDkTh8gULba85kvbJT1+VwEB1ufX8hAuYnxwfJKNh3FCw7dhNwLH3wHHErsToiCdZ
	s75/krRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4P-0000000DCRe-3Byw;
	Sun, 17 May 2026 18:18:33 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4L-0000000DCP4-0HUx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:18:30 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-404254ffe8aso1347209fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041907; x=1779646707; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MRGfKr8H7ah4yZfqeoPinkYJCKeiXt9tjcXW8VOiYM=;
        b=kj9YpaOF4ZyZlDpZUfXvxTsRMiKwj4AyT7l8BkOVjvKrdecW+/aEBOZ8WcAyLLG67e
         mDAjAVqWZxz3ir7Sax1xMPh4DwLv6ONzKY3qh2vXciAoTv/624xeEpV+kE8ltv/Z7HhJ
         yFPd9CINOtkRO6tduZbss2m5bmcArovfR+UB+oexFhxPPKc9Dm89KtnxvkoLFSPoo5wA
         1/iRr3OoGSjtsxakc/rULzdgSsM5LLldDcZCAQ08usWkHEsJWLI3cH7BiB/ZZRvgVdp3
         RtFmFWqliOhA1jToht9GGU+s18sgfpLfvIWTdcvDzCb2zOrnRC0t+qJSxZFiHmbxzIb4
         bNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041907; x=1779646707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8MRGfKr8H7ah4yZfqeoPinkYJCKeiXt9tjcXW8VOiYM=;
        b=c1d5eYjppdOFino4J6tg58m+RGFHCgAgVg7XviU2RM5aKFoibcYG+sXCVXfVt/V0jQ
         arQ7g8QNL88QkNoFrX9zpIzHKwfx8rKLzRM1QxrWHbdXW0S1uECcWHxP4O89GFAq3gci
         kzf5F3g9fiakEiA2nRvYkGZ7+hbpQoevEtNMMir+2D1AyuY6CGK/GUKMbDRGX1nXI4yk
         /35xFDilCbzDyd71xm0xumkr6jaqcIHdYkQdSfjUllyQbgeKSyIN2BkZuytsrOgkwiR4
         tRp8W9S0l/0bqJi+P7R9v38/NvZoIFhatOvBS570U5bZTsyXZ5t18ttP4gbqQ3+61Shp
         4ziQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mVnFL+U5mQiJJAk/vwrl0ePd0gafmKYx4Kc9I2QZNynmXHIhwshF3ihXn/AnTiP0QqRBLYFR65M7f7DsorCYT@lists.infradead.org
X-Gm-Message-State: AOJu0YwTczHGdO7EYaUWOrsCd7Wa+o5qdvzG4uvC42cnxr6jah4dFNjG
	I/BwBuukeOX0ZtuBhPr0XmuWAcMR6jPOnMfrK4cGalIiR6965XZOMVlU/PT13mNWANc=
X-Gm-Gg: Acq92OFC7iImw7putT+eU4nYTnauBdKWVebb6M0gcfqPbRBYJxUhqbRZZVRPWk3P2+o
	H5XARg0VK9IZqokN29dao7OXI1oBUo9iWcqJNa12bKuI8Svh7bdHXnl5dhUUjuvuNTHCjb4Vwmm
	RdCa4xopFAdqVY25Thx+VSrlSObCPvL8OFemQTjZc+6rU5XeW7bGBDEN02lrZdyZOYYw+8UdWsC
	peHjO+qW4fAirj+L7wsKoDv0ezfZYH/8Z18ide4IIZGmgl7tSbL+0S58QLNykyAj2yeKUJBTtnY
	4b9MdSXBomfl3gSDIkuD4y1zzLqdOwB2j9wI4F3buS/JnnUyS5jplqeW6KWUtlOedbhU7qxble7
	hYwXGtoWSyXrxlRb94rgeWhZK4KE+7sN0n0eNuRo3KufQa0FJ+Rzz0L36x24FP+78kBSXxzr3Ks
	QLAxghEOLeF8MpP9xGNS99yfNuDZJFM7ErSQDOyw==
X-Received: by 2002:a05:6870:1797:b0:435:486c:f2fc with SMTP id 586e51a60fabf-439f94bfe19mr8687343fac.18.1779041907408;
        Sun, 17 May 2026 11:18:27 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:26 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:19 -0500
Subject: [PATCH 2/8] iio: adc: dln2-adc: simplify timestamp channel
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-2-61fb908c11c7@baylibre.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=BwNLo5FYKl87iXnoZu+CcTxTzv1iNen3r6e4SjxMA7s=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgY8TJDJ6Ft/FcVQ5VpLbl7I3sreJsrciaZuR
 YcR8uAF1CeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGPAAKCRDCzCAB/wGP
 wOqBCACLIOEEYmguYfD2EXtVfXwCV+RMMhWS2cj5j6FCUGhFAIT3c6jLdr4I9QvxORRNbgHFE+u
 8irHHh2DH8okhGX6jVbG4CmXaHnJQcresATqKmSXGuI/Y5g3mOXB69I/wgkefbvup1uazdswGAW
 GrFSQL0eYVZyNMZMWJn26wexmzWpk4waVuT6s87rOiIC1MGPCIRk7NO3le4sj8d9E2CWCjbycgf
 xq+7BVUqhUVWXYT2gbdFFdHRY2mFqcvldot7KGVW+0OrVUJd9I2oXmxfZ03O1XH5KNKNWA5CGgo
 BnO79x5kMgSBG1qUGXnvKcYFIOAi3JCqJz0ljFkZHqE2o7tV
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_111829_246988_1DD1F8AB 
X-CRM114-Status: GOOD (  12.21  )
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

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/dln2-adc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index eb902a946efe..b7250fbe4fae 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -444,16 +444,6 @@ static int dln2_update_scan_mode(struct iio_dev *indio_dev,
 	lval.scan_type.endianness = IIO_LE;				\
 }
 
-/* Assignment version of IIO_CHAN_SOFT_TIMESTAMP */
-#define IIO_CHAN_SOFT_TIMESTAMP_ASSIGN(lval, _si) {	\
-	lval.type = IIO_TIMESTAMP;			\
-	lval.channel = -1;				\
-	lval.scan_index = _si;				\
-	lval.scan_type.sign = 's';			\
-	lval.scan_type.realbits = 64;			\
-	lval.scan_type.storagebits = 64;		\
-}
-
 static const struct iio_info dln2_adc_info = {
 	.read_raw = dln2_adc_read_raw,
 	.write_raw = dln2_adc_write_raw,
@@ -614,7 +604,7 @@ static int dln2_adc_probe(struct platform_device *pdev)
 
 	for (i = 0; i < chans; ++i)
 		DLN2_ADC_CHAN(dln2->iio_channels[i], i)
-	IIO_CHAN_SOFT_TIMESTAMP_ASSIGN(dln2->iio_channels[i], i);
+	dln2->iio_channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
 
 	indio_dev->name = DLN2_ADC_MOD_NAME;
 	indio_dev->info = &dln2_adc_info;

-- 
2.43.0


