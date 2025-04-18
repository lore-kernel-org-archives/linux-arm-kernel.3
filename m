Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF3CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwf2pqYvTfZAKWRzV4AAx6ws0t+3hl5RqCYYJcwd3fg=; b=lyGg5u7mcZ1oUHYi7Tdk6mNW44
	Bze5Ff81/WX9feMW2bqfowuU3fbEJxfcb4hcPBwbkx20NepWRPjCCM1TNNTWYGNm0UgzL2LCyZBDo
	NXJFUC0B7OBvbuPowNR/qlP2bkUdmkz0xTI+x72IXdo3ru5Ti0MjccQ7RK3RhhNhJ0D4UQxIRsoKk
	nkYeRc+HmuLVsUSNBEm1qYUssqI1dhBKhik24SeI7xyfq4NGjSllmj+pB2+PP/LptIxWlLzKQZsoy
	b1mlauVKzirDvhWkjeL2Ug+SYkXo439Bpsstd6L0hJ8+mqPA9o1waP73aqtCFT8lZYolpQkurgGjD
	/XkzColw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rzv-000000005Hg-02wz;
	Fri, 18 Apr 2025 20:07:39 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsM-000000003vL-2l0X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:59:51 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2d4cefac09dso1128238fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 12:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006389; x=1745611189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwf2pqYvTfZAKWRzV4AAx6ws0t+3hl5RqCYYJcwd3fg=;
        b=rIu7E4phvgOmPddjKv/13qHYNu3KyWwSS5dJT6u1D3OsD/fC/cfnzKHhAU8TgUKu6w
         hI6UmHd6Qq9U5LfiqVh1yKXuvhPP21eTMwIQAp60MxOsOlTIsqwBGAyLfYgT5F9f9xNb
         yh5UsP15lYcbKR47jTDjFwDwRROfGpCgZ1w/T/2tLa2EU9GNMP/OELJ38tDq1XRddLms
         Dj6zXM57QvoWOVy8SSggO+EdfvWZfJ9oan2owclTXOG5N51u89HPsNUagVHdCh8ZLSWn
         P0UfykTi88NKQ74w5EEkrHHFccm4dSn/Vo+mrJ5cCU0ybjRnmPpvNkq25OhWPA2LyGkA
         e4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006389; x=1745611189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwf2pqYvTfZAKWRzV4AAx6ws0t+3hl5RqCYYJcwd3fg=;
        b=KJuvNZ8EwXGU/ziWkdeYkMuY5aSKZwbf4dKr5UITSF062SANKv0cjnyWr4b01lxa88
         JFWMXiJHMwgG0SXn8Sa1pGylhH5vvVP0AWG+mSLXZXK+KYIbKGybwJNWFE9jy+/37Mpg
         n2B2HuGK1USWuWqAfYLy6zYZwPgko+TRTOJZDZRzdUcvbcnuh3ITfGxdSL6evTg4dslq
         JFYPEZ0Ru7UTiJVzewkbHpvWoFko8v1NYLBGDwBE4nscdeYd3+w9fL0POZJwgnxLaA4/
         a8J5PoaqFNQjbRAqV4PPY+qM9tC13/sI4vsj15mj7HzneOuZCqxNWxfXPSUR4Yfr2ox0
         ZkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnQyr7FtLrfkH3Be4+eFXAWFSwUe/sMpmhukznDA/+wbDv6nHtvgqRHmc7vLoLGuJkqYpS9Ic5W0/7NHCGixdw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw944LlW7c7sFcYoI6cEEFb8WzMhXhHY+5DIKGP0dTyJ+cVp/9C
	+R/SvJc5uWmN6RBo6mVwB2cpFXJjevNbAmiWfz4Dx+bUQ4CPWTtBQhXu8tyJkQs=
X-Gm-Gg: ASbGncvmtieVc9iS7B7SjohnG3M2Viy7q6efakDoOZqZCdazlpnXI/eUApejrYLGhh0
	edlLTypLZJsrjDtceVYJaeZ6PCQ2BRc2DCUB2Os1uLVqvp1gMNwAQDtTnHQHndB1ILD79n3SPWG
	Wb5UVHevGS0HMudM49XVWj0M/o90+L9ihVGfFWrTZ/D9iopvTru463QG/GhSuyvc0jW23xh3ejJ
	68Y49fCpnoLBi7TI6ll4oHGSIHWFo7rpKxwjSq2fPqq6rujcgYvapnnWJj5GIj+HCqiPEWFSWtq
	krqebOFVmL88n5CvKyW9oClu3nS8u8OFh5SXTUnnxG7utOKD0CK4tbwGWA==
X-Google-Smtp-Source: AGHT+IFwZ3EWj8a1332iU/6yoy+sVrn6yZp+kcyFC3R5X2BbUGWBQCdaSARBWT9nwdH3ywi0Y6UEcg==
X-Received: by 2002:a05:6870:1b11:b0:2d0:4a2c:7c22 with SMTP id 586e51a60fabf-2d526ae9243mr2222694fac.18.1745006389633;
        Fri, 18 Apr 2025 12:59:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:22 -0500
Subject: [PATCH 03/10] iio: adc: hx711: use struct with aligned_s64
 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-3-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=lGbQ3dZga8UFYhE2RmKRRSTA6YHIjjV8TI3JBRQo+eI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq736zDtgasDsEkD9rWkk6FaF1wjLFLYYEylg
 PumkP1NSyGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu9wAKCRDCzCAB/wGP
 wGuVCACVD/U6ho5K+XhYyv2ZNkNciwcFJPn/JPwQupiAbpUPj2JNFkyuR6gPyuLTUVWvVmzG4s9
 FeA62PoeKoiQkB2DMCf/dAnzaaifeKAjLoJ0IrqCYNoyxwMa5JNelAZOuNDyAilVXoH8vdGWVjy
 qpMHWiMGa8zdWFx5cTHLVkqj+fvO4I6AtQvTm4/k2nejdcLCE6Lm/6NF5HnwgrBgP9IZ2jOcMx4
 0RxycD8GgRzI6AiAJv+nN7K1NWEz8zjk/ja29Z347y8KgnYnl5dckBrqu858JTt1s8lEvLS1jml
 BgZmOJfTqI6VwbEvW3F38Hc51xsFx9QMlH2Dhe9oF5v8D+xK
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_125950_701531_761DCE46 
X-CRM114-Status: GOOD (  13.64  )
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
 drivers/iio/adc/hx711.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 8da0419ecfa3575aa54a93707c681ec8ced28be8..7235fa9e13d57c693751757c5d40e8a799622f17 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -87,7 +87,10 @@ struct hx711_data {
 	 * triggered buffer
 	 * 2x32-bit channel + 64-bit naturally aligned timestamp
 	 */
-	u32			buffer[4] __aligned(8);
+	struct {
+		u32 channel[2];
+		aligned_s64 timestamp;
+	} buffer;
 	/*
 	 * delay after a rising edge on SCK until the data is ready DOUT
 	 * this is dependent on the hx711 where the datasheet tells a
@@ -361,15 +364,15 @@ static irqreturn_t hx711_trigger(int irq, void *p)
 
 	mutex_lock(&hx711_data->lock);
 
-	memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
+	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
 
 	iio_for_each_active_channel(indio_dev, i) {
-		hx711_data->buffer[j] = hx711_reset_read(hx711_data,
+		hx711_data->buffer.channel[j] = hx711_reset_read(hx711_data,
 					indio_dev->channels[i].channel);
 		j++;
 	}
 
-	iio_push_to_buffers_with_timestamp(indio_dev, hx711_data->buffer,
+	iio_push_to_buffers_with_timestamp(indio_dev, &hx711_data->buffer,
 							pf->timestamp);
 
 	mutex_unlock(&hx711_data->lock);

-- 
2.43.0


