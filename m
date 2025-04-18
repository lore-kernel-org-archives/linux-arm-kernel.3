Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201EEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rBDR1U//AMtHVJOkZ/ynz5adiM1MIpFrbiMNuOexx0=; b=KR0FAtE6rockKe4lKQt7T4sMPK
	ZqWE0JAEyqRTXngfBU/EyD60aM2NLohMecuXzPT3sZ1bTN3LoGloMSOote3FWMtjMEGd47G2w/soK
	kQskPYBlDaSgvo+e+ljtMDK0ANuT0syV2XOkxsJX53dUj88iQHX0msHULJpFHA9LB0Towl0JDBY1j
	tq6qAwPS0HdNpc815ynVOeOxeucc2oNP7Hh91dA9117qJLoY80IbETEf5SIlWdV+FDTJj/MDDH8MT
	Za97MOY5Sjkm7K3GNLiobgC9PGYgNdoNCGaDrIWyD5Yy4nPsr9tNp+cLNwMySFQ/G+sDJcli+Fg4q
	HSv7Bsog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5s7Y-000000006dw-18A9;
	Fri, 18 Apr 2025 20:15:32 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsX-000000003yo-1o0C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 20:00:02 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2c2dc6c30c2so588829fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006400; x=1745611200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rBDR1U//AMtHVJOkZ/ynz5adiM1MIpFrbiMNuOexx0=;
        b=T8zdHeDyXQBOEMlDDRYDT1kJXU/QnE4O/jfGAvDIDKNRh0wYTltd7s0YNw1KGIQ9rx
         RI6W4eA4f1hsBn2v8Zu9+82K1Uzr/MDLxjp/CPkXP0OX8do+erNa8e0t34iczQ2fVU0j
         chcggwkII+AzSCeGQ/dt0ie9YI/dUIQFXpCls0yf2VrvgT55V3GNXpuLW3xAZ1bSQp9f
         hGa+GwFWzYW8OcH63XYkBYVlB4RlqCZpQkfdMM83ifPCRZrT0p8v7HHLg8JFvYIPn1Tm
         SPgPiFfaxTABf9JEgFqHmYduSxjiVafUQIWCPb0O7BbuyNoPDLLSnleEH2CLQniW+1y3
         Mfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006400; x=1745611200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rBDR1U//AMtHVJOkZ/ynz5adiM1MIpFrbiMNuOexx0=;
        b=BJdkiSzYqBEn64/0ah/EFgd/dfDR5Js3LJj+AwRyutfXKAAzYDTrCFV0LK/ZEP2oXQ
         ADeBFEpETdIEDba4DRmKNWCfuGIjs00Uz5nmz5zigjBRivz3k8f88qSJtH2elnDScgk8
         S7e2GjJlQ5NAPiKPvFyjOuLYY4UBNb+5MqurjC0XjkiD47xIxjuFdKTNDAF4/YXzZ3ZN
         OHH1o0BlUEEwUv7m791ztwjZwHhR25tjtDb3CMGC/xUBupC/RasIjLZCaRcSFhzWAhSt
         /crp2OwvhhjrNoc9r1HP1ucEyTK9f54AOHsMRzUa4knrIdPLgdA0miUYzDNqsy0j98qr
         Qiqg==
X-Forwarded-Encrypted: i=1; AJvYcCUd3DyYsKvtF7IlwedY3Yoc3z9KQRJo/ifi4BYdBt+sYNDdfXY3yIFVMS8WvSXIdvT6E8qoIWHZpe9QmHzWX52a@lists.infradead.org
X-Gm-Message-State: AOJu0YzymGflfabvA/e2dmuTdkilDt9X+EVSTX+HC1wVrv/tBkVUanC6
	UBG7yQcPi8kZ+7IyE6+k5Z+sUYBc5r1HAGJJhptRShITl+UYVlZ0IHRUT9zND0M=
X-Gm-Gg: ASbGncvbkyAxTq+p7pt/pZ4GupcR9Vr6Y16aa20db54GgxpR1IcXMdPwOammv3kYp3c
	AOMABA6j9uDYfap6hVy1MRfz7rMeej2mcWTiRuv+SwXHxL2KAWMcS9sQBWTJkI/dTeQZ4k4Tb7N
	6b9SMIp5kupD0UhAyPn7z2u544sP5MMsWURT1rl3thpAcI7PzYcTsBz9FQbO7Hctz3uPPwFmgSP
	mwJIThrARXHz5jNcG9XWyNGi8UqBqptwwWad/R9YA4pjHjVDYIlWrmldUGLaX0MYmANwcuydLEW
	rKY/JRUiPDWANhW6TXw9zIhSJQ3cXEKAjd5F0eEWOLQ78ps=
X-Google-Smtp-Source: AGHT+IFESQi/ZfA50kegJe4RtMSS4PZyQ9d46ZiXlLlHIdLoF/HU+gKoBW8lEVWEJo4/bW8fFvnACw==
X-Received: by 2002:a05:6870:ac10:b0:29e:2bbd:51cb with SMTP id 586e51a60fabf-2d526d6e952mr2256820fac.24.1745006400470;
        Fri, 18 Apr 2025 13:00:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:59 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:26 -0500
Subject: [PATCH 07/10] iio: adc: ti-adc12138: use struct with aligned_s64
 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-7-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=s4l8P5OcPMgo24O003DNQ+152ZESYZRIhpn5OwsYUsI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8Sfs2AclmrDLeJi56Pk//ih6Hw7R97L6d4q
 buJJAK8DOyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvEgAKCRDCzCAB/wGP
 wNv2B/9ot5lFQsMp+EgjDd/QqmcvuIydEgfUNbhAvAbPepUmk89W4MY9JTUT4zxZqWE11B6m2F0
 3zIVrrIDDZ3e56OlvCdt+U/BqUKLhOsnt7igGBmtKpP4ySz0oU2RYl8BXUeKuguiIw3XupttbFi
 Ud5X97R0RJStNPy0+C0JjSr57E5J3u491cFFhlTvKsUyIMaK6HYbPkpCBGv6hdWrAhBbiabbSc6
 alXYEmMVK+RiMRZLEJr6bRGjTVLLmbdbPxrlSC0y8KZMqtcCsp066Fsuz9VN4sGrWXrTyiwPLwr
 dyjbqaoUlUuymOoPka1GF4PxTtk/WfwzI4cG7/T/LHnfv+HX
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_130001_481820_2DB73AD4 
X-CRM114-Status: GOOD (  14.17  )
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
 drivers/iio/adc/ti-adc12138.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-adc12138.c b/drivers/iio/adc/ti-adc12138.c
index 9dc465a10ffc8d9f596e34215af685999235d690..27cafc2954e8956fbd674eb2bc32c59980ffb746 100644
--- a/drivers/iio/adc/ti-adc12138.c
+++ b/drivers/iio/adc/ti-adc12138.c
@@ -19,6 +19,7 @@
 #include <linux/iio/triggered_buffer.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/regulator/consumer.h>
+#include <linux/types.h>
 
 #define ADC12138_MODE_AUTO_CAL			0x08
 #define ADC12138_MODE_READ_STATUS		0x0c
@@ -53,7 +54,10 @@ struct adc12138 {
 	 * Less may be need if not all channels are enabled, as long as
 	 * the 8 byte alignment of the timestamp is maintained.
 	 */
-	__be16 data[20] __aligned(8);
+	struct {
+		__be16 data[16];
+		aligned_s64 timestamp;
+	} buffer;
 
 	u8 tx_buf[2] __aligned(IIO_DMA_MINALIGN);
 	u8 rx_buf[2];
@@ -351,7 +355,7 @@ static irqreturn_t adc12138_trigger_handler(int irq, void *p)
 		reinit_completion(&adc->complete);
 
 		ret = adc12138_start_and_read_conv(adc, scan_chan,
-					i ? &adc->data[i - 1] : &trash);
+					i ? &adc->buffer.data[i - 1] : &trash);
 		if (ret) {
 			dev_warn(&adc->spi->dev,
 				 "failed to start conversion\n");
@@ -368,7 +372,7 @@ static irqreturn_t adc12138_trigger_handler(int irq, void *p)
 	}
 
 	if (i) {
-		ret = adc12138_read_conv_data(adc, &adc->data[i - 1]);
+		ret = adc12138_read_conv_data(adc, &adc->buffer.data[i - 1]);
 		if (ret) {
 			dev_warn(&adc->spi->dev,
 				 "failed to get conversion data\n");
@@ -376,7 +380,7 @@ static irqreturn_t adc12138_trigger_handler(int irq, void *p)
 		}
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, adc->data, sizeof(adc->data),
+	iio_push_to_buffers_with_ts(indio_dev, &adc->buffer, sizeof(adc->buffer),
 				    iio_get_time_ns(indio_dev));
 out:
 	mutex_unlock(&adc->lock);

-- 
2.43.0


