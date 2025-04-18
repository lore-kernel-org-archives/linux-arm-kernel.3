Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77905C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlDI/QLmlPJuz1yS/XHu6VU6BQuOeAxWmCMkkw2CqXk=; b=zCUhKGXNjpsZiL3VgxwQ7TOhm8
	dfB5ESRRf7apo9VFJNKL4zFGIxFvJdROLRcyRh6V7K3OC8t7a80SqbYzUW+Ou/9CnqLaU+8WUAi8a
	Q5B5fnXd8eTMq5VN4OKLD4cCb42DJVN8ijiK6SUO4a5TVpOhuQlt+P1IbLBU0nStDLqx1rZ7P+Vik
	WJ1ZBLgaN0Q+bdE63BNggbMxUTWKhS3ozpyJ1i7EwKObM6w7gqJN4J4TAQTWqfr59NFbIHk48K5kV
	jv4pc/a77uc7m4ksy3ew9qbukBYFoA9CtGg4fU5/OeWsX3l0F8UdlD0M1QP95HRpZRgPFXsyIBY77
	G+1i1rOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rw8-000000004mz-26OG;
	Fri, 18 Apr 2025 20:03:44 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsI-000000003u0-2pP7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:59:47 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2d4f8c42f49so1137397fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006385; x=1745611185; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlDI/QLmlPJuz1yS/XHu6VU6BQuOeAxWmCMkkw2CqXk=;
        b=fzRDkdi1SLKF2xd54jb98+61dKIQjCSQMOvfl7v0Dg4ynvht3QnP+ngJDtzIlP/4Y8
         UiprWjK77tf3H4Cw+grr5mXFrb26OSYMvrMqDCtX+tOKK9er4Rj+ECfCIdVQPdR4fKRL
         QAe9qCeeClgVg7HYNOSy63JDQxZQBbERmHBxy1sB9jiO3Gr8V3ud2Jz8UxbSpT/fO/GK
         rbjCmKRwf7pgdQpTHodRcv35p/ZVdVLz8H/aS7rlSxU2+cUo/LVqcFHM3+bkT/mrJ4Wg
         b4K3GG3QE0+KJZYFh80e9ywUvO99V9Qq2Ex7ZfM0qrw4hJRDq0gU69G6DDJzpe4p+LTt
         +jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006385; x=1745611185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlDI/QLmlPJuz1yS/XHu6VU6BQuOeAxWmCMkkw2CqXk=;
        b=cNptvW1ZV115WEY5HcxKYFh7ISr8ScYUp/2hKmtCYzfl9qxmohpb8oNBsJDmXOpG+V
         Xu3zSLqL4nplsgpeyQpXnXHhztE9hTamwMt2TxgLTga2di3iHk4kP5fKdm4H7NsQeDdc
         4TKJb3n2HroLkV75VXa6vM72M0Bxlgqg8U6GjZLb7dnKEJCjtc7M2Xvl8jciBW41F0Oe
         IkOG4BJveowNkjAXfAOJDNfrRbQzyBznzKB8SMG0cwtdfYvGJxvKEaoFepoEFDe3yjI9
         iT+fvbu+4xxM75wBNkO3gA45M83RPQ+OWorle7j4v1Z3u0y//3kssBRF4R7ZQEf3EUpd
         A8dA==
X-Forwarded-Encrypted: i=1; AJvYcCVOKl4Bgu19jyQ4FJQgsjNCmUeKdqvz8mQudmy+2yPqbBygfXLOik9DTglMo/aRU+P8M6A4a61ycFhKPIL9O9tl@lists.infradead.org
X-Gm-Message-State: AOJu0YzFs5aJW1iSaXNX+Gzh/1kKQZMZp8R8dOD1t/nLiFm2e6YjHxLI
	ty2qOn3T1yW6BNE7A4oX2AhW/f3dSAubRQEjK80+PNmaruQuWH7Eq90Tn9tlT3o=
X-Gm-Gg: ASbGncsttLMMFixdvWNubVBSyMQzEx/QNGXaBPCF8zIvvTHcackK96Ho8qXPUKLwpVo
	rJXCrQlj0gK3Pm0mBEMOeTlmlmq2J6o1f6Tbt/FlKb7ryyAhz6TZVLOuxvlbiKgnlYu3tKyGabI
	/VriCBdROCSq4q0YJXs7mvEO3VMc0V5hp3KAoUsmq1dJ/PebBzbiKEZPW3PAfjRZoYrCN/HjlAe
	qMPNyuYt5ARwrVnaX6fvUh06ixoaYfdd+N1d3WIhAHvHYhbX9fSDKlJ0vdAfhAVsYLms1MjyViV
	NPwPY91XDEHcKNHJeBNex4uXWdDwvd/y+K9vhpWHylbBTe0=
X-Google-Smtp-Source: AGHT+IEZLt8vJ+Vea+VdNW6U5TrIwsCbEZj5notcgMOj7WZyAPb2+50/gNm/PtPTqMubaQMXt78WIA==
X-Received: by 2002:a05:6871:2208:b0:2d4:e101:13f1 with SMTP id 586e51a60fabf-2d528764a94mr2112473fac.13.1745006385694;
        Fri, 18 Apr 2025 12:59:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:20 -0500
Subject: [PATCH 01/10] iio: accel: sca3300: use struct with aligned_s64
 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-1-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=atzk3KgpYuN7DI/cmia/uI2CCnJShxRg4I1+4wGuxyE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq7pqs36/Uewg4GkPF0PtQe0BngPZ5CQYydvA
 pwIa4qdyciJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu6QAKCRDCzCAB/wGP
 wHfFB/9GtQnD4PldNnD2VgoEGzk7DgDePLxDOrYU32KN2nhp0QWkAaDNoNEYBhYQt2fv5gWVB9Z
 Xl15hL/X0IiIWQRQz0YQHmodc+DHZYkKl1DEl0fSOPzAHfvCGvbpGgRG+4Oi/RcZfLmeN1kcldK
 n12hAhtHqetBeEWIcKRs0mmQ/CiOAiWdd0XKJcRXQqdrIl578xkTzRhW8ZfgcDRJhO5REY+r49u
 G03D66fWWIAFlreYa769SW1MC9WJgtmcWExTXic/L5+NbF5GDRVAxt6cFwEUAnayJNtp/F1N/Z1
 EH5T41MtVfiXCOUB9ErI3MJ7H+yNku6IF9i6ZOXG3mKna/oO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_125946_718409_942BE876 
X-CRM114-Status: GOOD (  13.13  )
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

Use a struct with aligned_s64 timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Changing the array part to s16 insted of u8 also lets us drop the cast
when it is used.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/accel/sca3300.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/accel/sca3300.c b/drivers/iio/accel/sca3300.c
index 1132bbaba75bcca525fac2f3e19f63546380fd4f..f04ad523f48abd598b1b2df37c51da894c0ce796 100644
--- a/drivers/iio/accel/sca3300.c
+++ b/drivers/iio/accel/sca3300.c
@@ -58,15 +58,6 @@ enum sca3300_scan_indexes {
 	SCA3300_SCAN_MAX
 };
 
-/*
- * Buffer size max case:
- * Three accel channels, two bytes per channel.
- * Temperature channel, two bytes.
- * Three incli channels, two bytes per channel.
- * Timestamp channel, eight bytes.
- */
-#define SCA3300_MAX_BUFFER_SIZE (ALIGN(sizeof(s16) * SCA3300_SCAN_MAX, sizeof(s64)) + sizeof(s64))
-
 #define SCA3300_ACCEL_CHANNEL(index, reg, axis) {			\
 	.type = IIO_ACCEL,						\
 	.address = reg,							\
@@ -203,7 +194,10 @@ struct sca3300_data {
 	struct spi_device *spi;
 	struct mutex lock;
 	const struct sca3300_chip_info *chip;
-	u8 buffer[SCA3300_MAX_BUFFER_SIZE] __aligned(sizeof(s64));
+	struct {
+		s16 channels[SCA3300_SCAN_MAX];
+		aligned_s64 timestamp;
+	} buffer;
 	u8 txbuf[4] __aligned(IIO_DMA_MINALIGN);
 	u8 rxbuf[4];
 };
@@ -492,7 +486,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, void *p)
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct sca3300_data *data = iio_priv(indio_dev);
 	int bit, ret, val, i = 0;
-	s16 *channels = (s16 *)data->buffer;
+	s16 *channels = data->buffer.channels;
 
 	iio_for_each_active_channel(indio_dev, bit) {
 		ret = sca3300_read_reg(data, indio_dev->channels[bit].address, &val);
@@ -505,7 +499,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, void *p)
 		channels[i++] = val;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, data->buffer,
+	iio_push_to_buffers_with_ts(indio_dev, &data->buffer,
 				    sizeof(data->buffer),
 				    iio_get_time_ns(indio_dev));
 out:

-- 
2.43.0


