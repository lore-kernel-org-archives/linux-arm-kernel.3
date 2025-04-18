Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6A4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksSqxXQXgKq3MEdL/jjg1tyq7wfP3KlJsiMdvfm/kDA=; b=lfChmnFtm+LUG9EAY5d2TOzePn
	0MT5IDFGkpkjenkuX7TLTCAHzvPHfIVMGecBTSsQnX3EpeFZ7I2F/m8E3SQl9v0RX6yJqPZ0EWTXn
	OhYerjPtfispbx1Ik4Kz1zdA1go5oW+A3aL18/BfCF6C0VonXB4Ama6IqIqdeP+W5GXa85xzMUvWF
	g2Fu+6fCoP0Cnvv+USb2ry6vKuw1K/VPxbi7oGWBvPSpxbg0ZaR2Fr8RaI/cEmnogKVtLnjuXPjm9
	yyKODs/NWI8DEQ8MNvCVdP235pc5OG75fpjAYJCsmHRkLmfxcqcEor0pCGZzQBwWEP7WLQkaiMklN
	8C6F5wZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ry2-0000000055F-0vpm;
	Fri, 18 Apr 2025 20:05:42 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsL-000000003uq-35O3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:59:50 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-604ad0347f5so521841eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006388; x=1745611188; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksSqxXQXgKq3MEdL/jjg1tyq7wfP3KlJsiMdvfm/kDA=;
        b=CFpxR8+THb1omQHgsJ0fqdtFEizCOrXXLLZXjMi3ySi6XlWCIb4Ghgr/07BRilgkVn
         pL+O4vt7Tdg+kux/WSoZQh8jDFOm/QysW2dQiYfS8nuGg2LX4LyKH8d7tOrKew2lwjIE
         K8c3jKcVWc0UXRFUdCChZCkYAjDLoVLU560e7a3BmpeTpFFbq2HEnYAFFl+DD2abj//j
         gQY1og2Uti44SPh2UkiFAXSZalZHLZ9OhzPlPTkRetGQZ7I8jSV8FUqceoGtAEOYT0nB
         GGSETiWh1JcFCz4QJhRxh5RZ8DrVWigI+ekoNM8aHDDyNMMLCcd6prQfejDbqlKUQN96
         8PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006388; x=1745611188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksSqxXQXgKq3MEdL/jjg1tyq7wfP3KlJsiMdvfm/kDA=;
        b=XYKrIrpi8DCbPMc8zBCEnUzb9PEgjOFamJ9/2tMF9wjJzIzashvDwF0lvZO2Tz7OQE
         qGTn9YxiNDDY1WrDy9kPypTYr2GzOiiVCmKS/H/ENZyhS/GPRZSc7keoRmq4Ql0ywNlo
         fHcrEv6TDojWnjrrVoRSnxRNvuycF0ZJWMYIjN5tcQBYEoYdrxkf7FL+3F9U7D1vBnAa
         lmMcHctHbFcvk3juquHwR6io1r/dYYN6HqGBuIihs1XO75NpyVlYoK3dM86DOeWR4rBe
         mNJRDzg3BEmToZlUlcvXFB77pun/BkAH11rzgpQezZUsMzMDmt++e/W90iSSYeiXe9dw
         L+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWM9nr/ZsdARZ0la/SDWBe8qP3DcqLZjYzHLEdRvK8m1O2500BMYLEStYA60i6hoAvsbAPr/Qz1cJIZ/eXLr0Zl@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn0DlD6lyMKT9dgsNKO3Y+PYBoKbcSUPvM8Q3ZWE6q78RUEa/O
	iKeb14RJIK04oRtBlA3357mlGA6ZHaPbwFHIg3m9H3t7wyUbT0qIQwlRv2dszeo=
X-Gm-Gg: ASbGnctVEPBcKk7BCDH6HLMwrNhGKIs88o9ohfogDHMQJY9xgOCxmVhF27Q8C2Tlqnr
	uc/mgo/w4arpAj97SgFLyg/DX5g0IjgdX33WvHGMnrBanT5r8fDJYqaeU4nMJOlKTfzq8Pguckk
	kcDRgv2/AFA1iasT2O5je4qiyi1Hd3nzUIDs98jSCyb6vlRItbHwABu/DrqX8W9fUfpv7MQzXwv
	vDzfCVIjoeLNsPlBE3/xUdqbh1Q5SKkTOwEe2gBgkK0iqPKOqj+QnTp9KIyTPsbHtYsw+krMLsp
	RT1WjHzeRsBQmkoeJOkdng88jEYjyP7YwCSwi6XxlFbfKfE=
X-Google-Smtp-Source: AGHT+IFj8rQZMZvtPmVYvlswaBgMb9r1fm1cQCciAYKz5X9YEKQwhLXdNPStKbPWJNkdDXJj7/qY+g==
X-Received: by 2002:a05:6870:9e0d:b0:29e:671b:6003 with SMTP id 586e51a60fabf-2d526e0b311mr3083100fac.32.1745006388641;
        Fri, 18 Apr 2025 12:59:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:21 -0500
Subject: [PATCH 02/10] iio: adc: at91-sama5d2_adc: use struct with
 aligned_s64 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2897; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=uGEGli6agFbSIEZPgrYVG1FE8mDYaDMCfJyp/lazgiE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq7vX8GGgAAxPwrJ/N9bdFji+tUrDObD7oWs0
 DvLOxngo0WJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu7wAKCRDCzCAB/wGP
 wPcDB/9Rn9JB9hcWF+vXoNFbgTyeYaeIohNCTpSNvM8pHIkYDyV+bTUeYPRDtYP+ubhiUNbAVy3
 3VZ841HJG9nqewSUOCOlBAE5AkziGAUm5bSrkL5ifXr3DSLzxkPnrQ3Ao3AiutbhF1sclOUJ3ye
 nheGCoAyzEluF3FJD2g70v8IDaD6bh6vaEe2yMQL8BSBuuaP5NZQw8HIM6Ek1xhsC1GWZ86urbo
 8Xxzad8bX2Qv8/zWuuH7qTCszseLNJdsXQXnyGDF5WJ/xCTvHU0VOpfaB/PB1RPj58Y97aA9QDD
 PTkAvQX6xnNlTfsPVMqA6uDJtbSh6vQzTQnrXLTEGHqPBUM2
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_125949_780546_BA49FFA2 
X-CRM114-Status: GOOD (  14.88  )
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

Use a struct with aligned s64 timestamp_instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 414610afcb2c4128a63cf76767803c32cb01ac5e..07ced924f7a6ae36fe538021a45adbf7d76c2e69 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/sched.h>
+#include <linux/types.h>
 #include <linux/units.h>
 #include <linux/wait.h>
 #include <linux/iio/iio.h>
@@ -586,15 +587,6 @@ struct at91_adc_temp {
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
@@ -617,7 +609,10 @@ struct at91_adc_state {
 	struct iio_dev			*indio_dev;
 	struct device			*dev;
 	/* Ensure naturally aligned timestamp */
-	u16				buffer[AT91_BUFFER_MAX_HWORDS] __aligned(8);
+	struct {
+		u16 data[32];
+		aligned_s64 timestamp;
+	} buffer;
 	/*
 	 * lock to prevent concurrent 'single conversion' requests through
 	 * sysfs.
@@ -1481,14 +1476,14 @@ static void at91_adc_trigger_handler_nodma(struct iio_dev *indio_dev,
 		if (chan->type == IIO_VOLTAGE) {
 			val = at91_adc_read_chan(st, chan->address);
 			at91_adc_adjust_val_osr(st, &val);
-			st->buffer[i] = val;
+			st->buffer.data[i] = val;
 		} else {
-			st->buffer[i] = 0;
+			st->buffer.data[i] = 0;
 			WARN(true, "This trigger cannot handle this type of channel");
 		}
 		i++;
 	}
-	iio_push_to_buffers_with_timestamp(indio_dev, st->buffer,
+	iio_push_to_buffers_with_timestamp(indio_dev, &st->buffer,
 					   pf->timestamp);
 }
 
@@ -1643,7 +1638,7 @@ static void at91_adc_touch_data_handler(struct iio_dev *indio_dev)
 			at91_adc_read_pressure(st, chan->channel, &val);
 		else
 			continue;
-		st->buffer[i] = val;
+		st->buffer.data[i] = val;
 		i++;
 	}
 	/*
@@ -1691,7 +1686,7 @@ static void at91_adc_workq_handler(struct work_struct *workq)
 					struct at91_adc_state, touch_st);
 	struct iio_dev *indio_dev = st->indio_dev;
 
-	iio_push_to_buffers(indio_dev, st->buffer);
+	iio_push_to_buffers(indio_dev, st->buffer.data);
 }
 
 static irqreturn_t at91_adc_interrupt(int irq, void *private)

-- 
2.43.0


