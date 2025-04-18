Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC2AC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDqqSLn17t5025nkyBHLLdQZLsyBrfKDeHjL9m8bNdc=; b=CQIZgN/VnTe2VFip3Y0VBx5VtT
	gEYqQfJqRiIsbqxHkydfAK25d+pSwXzjjCjjbS7HzVCKmVGW/cHRzRvIDlV2IFKfjATgwyEKQ77Rp
	Bse+vdz/D5zD7PAf8kO0N9f7eYDjGI76JzihE1JGHiQ0+my8hgVNbZvQY1hbINkCPZJfTeD9RPfkw
	Vvi3n6ve44bSr3g8Mup+k3aD0Wpg0uhsRWRNNTIljSa+vjb2jfjPRG4zpR3fp94L5gLiYD9LXgPFj
	HKSvZM5srOnGdbYXWGWJCtbN33HzcrvRHfQMDXenpeXZYOuDy7aVyU2ciuAlOe4RvqrliQMrVCox1
	zqsPKCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5sBM-000000007dT-3HYH;
	Fri, 18 Apr 2025 20:19:28 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsd-0000000040q-0Vos
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 20:00:08 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2cc82edcf49so551657fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006406; x=1745611206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDqqSLn17t5025nkyBHLLdQZLsyBrfKDeHjL9m8bNdc=;
        b=oH6tb9J1KzGG/dDMznEeSVw6kr7pqR21YmfIYTod6u8fbvghqLkI8GYPamupxe6j4a
         eQsJ91mEXCWAGCd6k6W58xzQzTUjn13VJEuezTpTy6Hp9ErHGOTZvNOgMqJc8QNRQTDH
         403Dim2Ta1ETuYG99qYl42S5NOYMfWm+RG8yrhMKqC8ef48tY5m38BRViBOUESNpN2Fx
         5DQCyAKZmC8GBMJ2cFJVdA0t8N0dHFUuY433i0LxevdIbqx4R3pSmxpPzR+/orW34fHq
         V5iclw4uys3oRkbwFgAsqqd8rXizqgvOfrd2WYXR3oc5S4+TWFMkD4kH6ude2MrroHnd
         MlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006406; x=1745611206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDqqSLn17t5025nkyBHLLdQZLsyBrfKDeHjL9m8bNdc=;
        b=VtID+84s1LUcODs5fl1vfT8v6mHjojwzXE75DT7iyqiJpKx7qRhf8Km316kQph5v01
         omXE7rbMne91CDzl0rvWpNMt2NgfdnZadd7GNDPPrMJvuixAY9/Vp1U5aUaNu6KZh52d
         nH3OhI/HiFAgCV7jEd4ljykTKu1flnWoDGi9/qAMvyMRVdMmZNlNnIcfMfqMz9j8tE8T
         hLLIR5dKZcynJ0naH6dUftH4dUa5O/SwnB2HOVaREpEySNzJ55X75/mKRRn0zHKO5FT6
         sPVHZjsM8WpW4vhhxxm/DRRh0WifPokIPvYF/BSKxDWMg+nmN+1RYs75HItRKWtvRdaw
         iCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2IEOyRBCmfmruEBBNeJMZ80fVe57LzTjDKnTCwWtl+IKjN/hdDtOnHjQ8L2gTS1s1ssJYeo102mlpJ3eB2YKI@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ9te784wg3YWEW6r2ycjrfnfKUl7XZfsbHz+uvgpn8jNCh4aj
	PtVHgr4LgWkX+0Y4lydonT6U3+xu/nyHP+JxoUxDRZJinhRnQKw1EMbVt7bO/kE=
X-Gm-Gg: ASbGncudT0HURJhPDSBBdLeGfktVvEOWME+PnW/eWYwjqtUeXCQzNkQejC30Q2Hc8yA
	e2l9AqXEPBJz6awMdwjFw3hKq1ibXJLKBIphFfrH5Imqr40e21oNqh61oIiOx3Z1GkIPIh+P3eh
	lHzqtn/ah2CfdBUPaE5/+PIUPkcnqcD4NeWFsJNBYT511Fej0o/arBNTl/Bn9jnnyXnMUgESwGK
	3wYHldIbV4BeZH3BsN8JNrQ5Zb6OkCwNdIECc2VIeGHSCkbiqWGgot7GdJqsAvXKzClSaFFVOfA
	J7F7d1fYsbNYk8g+t/4TeZ4MRNFUTVSdm+uXhBGzong2qcqI879c0wCXFQ==
X-Google-Smtp-Source: AGHT+IGyvAhFlRCsX12Lhwr22tKkpHolc2Tt6LGi5+wwx4p3gTPOGLhHmLju7HF0T94FQvgvVlBiHw==
X-Received: by 2002:a05:6870:4413:b0:29e:6547:bffa with SMTP id 586e51a60fabf-2d526af61c3mr1982271fac.21.1745006406486;
        Fri, 18 Apr 2025 13:00:06 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:00:05 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:28 -0500
Subject: [PATCH 09/10] iio: adc: ti-ads8688: use struct with aligned_s64
 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-9-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=ARIVPfAYjojNb4iBMLsUhX2LD/OFISQyTpJFmR/jUmA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8gnMqNGtdNT2ZIPYnYVdyTTiuNmSwk6ytsh
 TVb3PrODfaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvIAAKCRDCzCAB/wGP
 wBNxCACdVaOqC9XUOO3XNtkEYvq9VgXfioFD1KTARQagGK8F4RZ52Ql+vvMTIfwlpvJZ2gt1C6p
 2H95DFKR9LUWM73Oc2uor9X8qIw+B85vCeAZAV4Ux5UDRP16K0Q7Ick+F/d72GPdBKSM3cnPUAq
 wNHPB/7otHliUHUsABIkKUC45xghvbM3+0JbwXMEuLAcC0xgu3XU2XGzKcuqbj39kBioJKPOLje
 7uhR6CGsgbp8xEjN+n3V/Q9CdEC0y1JBy7RPnbUXTJkQiccRgPr7kgv7T+7V2Qm3YGDkxz7YnDa
 0zhX+IsfH+cnM/RBIpCAFz6Fa+Uz/hbt5JnBiJfw2/EJvSyj
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_130007_166328_934B5734 
X-CRM114-Status: GOOD (  14.15  )
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

Changed from struct initializer to memset() in case the size ever
changes and there could be holes in the struct. The compiler generally
optimizes calls to memset() anyway.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads8688.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads8688.c b/drivers/iio/adc/ti-ads8688.c
index b0bf46cae0b69eb1fe8d7734c8a32ac642c5d0cd..2a9cb7d9bbfae4b282682d755992acd47fb88b99 100644
--- a/drivers/iio/adc/ti-ads8688.c
+++ b/drivers/iio/adc/ti-ads8688.c
@@ -380,16 +380,20 @@ static irqreturn_t ads8688_trigger_handler(int irq, void *p)
 {
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
-	/* Ensure naturally aligned timestamp */
-	u16 buffer[ADS8688_MAX_CHANNELS + sizeof(s64)/sizeof(u16)] __aligned(8) = { };
+	struct {
+		u16 data[ADS8688_MAX_CHANNELS];
+		aligned_s64 timestamp;
+	} buffer;
 	int i, j = 0;
 
+	memset(&buffer, 0, sizeof(buffer));
+
 	iio_for_each_active_channel(indio_dev, i) {
-		buffer[j] = ads8688_read(indio_dev, i);
+		buffer.data[j] = ads8688_read(indio_dev, i);
 		j++;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, buffer, sizeof(buffer),
+	iio_push_to_buffers_with_ts(indio_dev, &buffer, sizeof(buffer),
 				    iio_get_time_ns(indio_dev));
 
 	iio_trigger_notify_done(indio_dev->trig);

-- 
2.43.0


