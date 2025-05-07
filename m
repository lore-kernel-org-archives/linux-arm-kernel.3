Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A565C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 20:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkEEnGIyeDiVPJ1Vchg86i4F6EdVT5nAWBfWqQhvCKc=; b=c2wg+/iKVOCInjF/wA8rEVY9pS
	aXkNUK3cuGKXCw3Ev1c6CjoDEfYh24uU55ukdvulWqaMZKY2gltvOiX9gqn3+ASPYIaS+7A+UbsgS
	QCYYnWxXSnlLtijaa2qZ2dd+uwgx3ZaPVsXz6dB3cR3+rAjj0ApYkJs5lAmjLd0Q8j6vLap2dT2qA
	RYndtKzaneCspjwRTKm4SKUjUTQsFO0lBaFEpNUv5GuSFwoIBFQwsPOAjpgvCNxKJTVnDJsIYK6My
	CaXEIHi7CdzDaK+RTFrrpCwA+mxrIWV99OXmrwGqPc8qxbYKG7ESoPudX9ZeWNXn5B3uJMnvgLoZo
	Src5fbhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCllx-0000000GjhT-29Uf;
	Wed, 07 May 2025 20:53:45 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClcP-0000000Gi3R-3KKG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 20:43:55 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2cca475546fso219929fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 13:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746650633; x=1747255433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkEEnGIyeDiVPJ1Vchg86i4F6EdVT5nAWBfWqQhvCKc=;
        b=vPsONw8gSdDeP/FkzTgjFVi7P7ODyQqAT2mOgrYCHBCxf3vgo9M3l4LDL93/XK04ZY
         gEISmfBZnGQfEKXPqg5PYCQn8H4f2LttCZFK8+l7i916QpmZCHe6v0vBPprv/2inmfW+
         buE1TFR9HNCfRNFOzj1bTQMFPPCUsNZoqZqxcWjg4+ioX9DSt0l22YimfJNIqWKNlkax
         Reg9mF2VL69Z+H9Ygq4MtEKTUTUgOArKSJcmDeOfe3tZE7SY359X6b6Jnn0zlJr68+VV
         DER7cmdrtXOQXw33Tozeu7vc6k/5ucUKBvdeE+9AGLsslXAbxGkkbDGtsoEZztBVo+Y3
         GpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650633; x=1747255433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkEEnGIyeDiVPJ1Vchg86i4F6EdVT5nAWBfWqQhvCKc=;
        b=IfEYLCDJlviepw3nAVDhtibJ/C2ClUzHSmgbcLBccbCNyfi6al1tt01Y8FCt1bggbI
         TUSHE0PLynLIn257HQ/KTVIW30SYIswXTh+Q29G1x70F/NSSrlSVn3QvraLugy7UIkr+
         Fusb6yZs85tEtNE7u/sAuRG38YqVgoRhgQSVy/p2m6SgM3YSAahyLKAhvm6fkAzGZBpx
         Rcow3KLzeLqweKV6xd3XOR3b/I/JE/MmIvgxGwExZ+TIayZHUY9gnkNQUVb1viSFEWOq
         OlmBCDhQuVGM2jjeTEz/lFGeFH6SD1lj/UsZLk0cDxdWhWnvW1ZDrRmDER1cPDsxx/FI
         L5wg==
X-Forwarded-Encrypted: i=1; AJvYcCVRvOtC20zst4kA0wryC1mslBujbGS2hEnoJi3fuopo4HDjCHKDzswWJSeYFusT1D79tIT9Nn+UDq8VHAGt8Ftm@lists.infradead.org
X-Gm-Message-State: AOJu0YwPEdLPuGKcJhAzA8LGOLzBOjHrgjy1pb6k9vdToEw0/DU5Ndoh
	Xuq6sXnC3eD9TzJvX5ONqoR7rkEnJsSf9896diOheBWP9bTwsKhWgp/3W8PihcI=
X-Gm-Gg: ASbGncvK/ahU8v7p1aLlWTXk2Hnk8XDhUDPGEvn7lSE8Y/VWvuhH2y5LNv1FGBvJUaV
	YxNuPUkYuT69R1ZqrJ7mtvJ3KX8EFyKYVmouCY62n4vBS/6nLeX+GY/oSqO/RwsQih/kpkJpXGV
	auV8ZgiEs/mS+PliounUQzzM91y02eBNrL3VwZhDGMAn5mFK8f2gBgurR84wCSOeOKClKDUBCrz
	vhOBLEDCCBVFs39nwxcviZlozMgNusT3fjFrNEP3sw6/CvWy7C+02T2BDKBapsB2GB+LseF2BzD
	V6M1WBCcB5rjSi1MEdcYL8Lncc0XpW0UVd3LaVZW0mMTDg==
X-Google-Smtp-Source: AGHT+IFv9/lwSfeqqxrnWeC2Lb3fTYoOfdj8WDrV1djbCLjHfaiWSRE1YF1jLbIdYdNWncmdHjrl4g==
X-Received: by 2002:a05:6870:47a8:b0:2b7:f8d9:d5f7 with SMTP id 586e51a60fabf-2db5becfba8mr2933835fac.19.1746650632817;
        Wed, 07 May 2025 13:43:52 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5cd716d3sm898642fac.21.2025.05.07.13.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:43:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 07 May 2025 15:42:46 -0500
Subject: [PATCH v6 7/7] iio: adc: at91-sama5d2: use
 IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-7-4aee1b9f1b89@baylibre.com>
References: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
In-Reply-To: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1780; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=E9PIAfLoyJ0RJi3D/ewNgK6tsUeqLYCSdDUrepVzsaE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoG8XzuxRWPot5Lj1UBI0PQHvKcH+S/2Js7bWDC
 MwB352L8NCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBvF8wAKCRDCzCAB/wGP
 wC1JB/0Qrc6VwdlpFKuZ/ZskSEubr5JpckDQsyuLEoWu5pHwj3LfH2VhLa8WVcMwLPGyWbNbyQA
 33488s4yfq3TNY1UOh5vaoWaqGkVmfSzeS24yx8k0aSi0KKfUJWNZparRvnuBocE6/6fF/dQKGX
 9DTINk3cX+Nsrl+Ohqa0A8MU114uOBom9yKi0ukZKc3ue+pkKI/LKWU1lUYP6CPz9/Tmo0Aiom0
 kXxkWMtUU0ZBWlzv8u3nQ67fLe/pKlrlRh8noB2RDIK1ucNK8cgf3PgyZi8pm+NVMw2MWx8OOQl
 dlVuaTnCVHdp0ACpYSrD2WYk9ahopTw10uq3rJEVjmBWh2/N
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_134353_831384_47D142A0 
X-CRM114-Status: GOOD (  13.57  )
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

Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v5 changes:
* Fixed missing space at end of comment.

This is an alternative to [1].

[1]: https://lore.kernel.org/linux-iio/20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com/
---
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 414610afcb2c4128a63cf76767803c32cb01ac5e..c3450246730e08cdacc975ed19f46044dc76848f 100644
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
+	/* We assume 32 channels for now, has to be increased if needed. */
+	IIO_DECLARE_BUFFER_WITH_TS(u16, buffer, 32);
 	/*
 	 * lock to prevent concurrent 'single conversion' requests through
 	 * sysfs.

-- 
2.43.0


