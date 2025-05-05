Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F87C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=; b=Dk7A0QEAdLEHl7Mccajyy0thVp
	WKSKJUdEVg9TXEdsAtOJOxkpEePd7iW7cgGl7dMkcu0xWRHk765u1gKlDuPJ/PfriyElxn07R73Ja
	qWmOaSyB+x1NiifJWVWv9DXItKYE5NrgguZ2fX0GtG6+4htArD1ejfb46b7u8lNE2p+LPYvXWXsva
	5jqpgJmyKV+wSBBCwdKTMh+tBZSE8r7sMDl0h9TZkO+aUmb6IPj7oCJ73huwToQdhclE63PS/6Tzv
	2LDmm1rAO+sWy4sIiXnb2waOK8bW79GoeoXUSTw5UQyVIY02yRYM6Ly/2LWVb38Hu67eApNw+EL+p
	z67eEe6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBz5p-0000000845F-37IT;
	Mon, 05 May 2025 16:55:01 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBykK-00000007zyQ-3qAZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:32:50 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3feb0db95e6so3053449b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462768; x=1747067568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=;
        b=HPZ/TRJ3g+iLVRIj3l53dGQhenfKcEtIBFR7JsMzRYjO7cTIAVRBSpFf1F18a4cJN5
         9X/ig9maqOtmTU6FQrtjv5wbp9ikHMnaIVQHNFiuq1fmFUInm0Vn8/fWPj9/HX9+uZvl
         RsgMXCZPOmAUKCSwsPC7ICV41XZmyQfvTysaCZys3lGiMt7oQnnJkUQ9jhEPT+iNqRhk
         J2ixhMZYyLY2ZIKO7LUsNhhNNDCEi0CyPc4PI2c0JwQ4Z374gbZ+i1Fcga8UZa8Hm09Y
         Z4VpnvIgytTqy3OTNg1+MigGalbsi18RP0Z1SqsZEP/GodwXRG5ynco/2JgY32hxqGda
         6C4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462768; x=1747067568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=;
        b=t/k3CmUwhxP6aTBFEi5AWdwZeTC+sRoqSOmF34Mo8fyWodM0BYmRiUBpi5RrIEvjxs
         Fns51Ct0W9/wUcjTHbByf2hztQLsycFMnH62/IT9ADQcCKOt8e0VTqhQj/aoeQ2x+OTh
         T4xvoAtmq7Qp8EOMj5NqH8wIVlHuhAiUtjIy83Fpu3Ge7rahFSrTZYGVYWC6AmcG1v8H
         ksOZVps9EAm4ny3pVGoPftUNdxK0GpItyySChtlSE5psgZ7hjn8e8lWbygUHofsdAtoX
         vSz6mNmpNam0usQhK16xAGFHEhLEaNi5f32DZF5GvHvPls3ClQC/YyJ7qbNq5MRgLZp8
         Jpqw==
X-Forwarded-Encrypted: i=1; AJvYcCWkPSHv/DDuZ8Wqef7zR0kwQVCEDYWKgiUMhGS1G5Th9I057XY8iL9ipnYF+J6dg6MgHSHAq2TFG2EfHUYddyDT@lists.infradead.org
X-Gm-Message-State: AOJu0YwJnuElrj0EYgAWT8wko40GoEGOi0l+HDXvz+WP2ylag7M6E9S5
	uwpeWUZ7Htn0CNlt+gWUPDjzj8b7Z8rHG4ZLOSCjszfRgrJlJnClVxgDPFlFA9w=
X-Gm-Gg: ASbGncsL3I1JXufSeSJp9s/pFYRvGArJCoJYJxKP4WSp6PuFrGgzPnvvB/WgPnO+erJ
	v9QFASqNMLrGKF4LcI0trG59qGrG5zUZx4kZ2VYyVM+/kKjIkCt541xL4/UX8ogJYibJS+AdVRE
	bSFLOVoFlTQ8B3FdZjW34uSkOjGvYNkNRmLztc8ihwTxmPbUCDg37wYKcfhN04ptiTxu5tYYIHt
	kfFiF/XlASiLDQDKsVy/HLCKCbUAtp163P8KfFR+3ATxUm6zNgZEYGTFIUHpJL7kyivHXcdELBq
	bnpiAqCsGUU5xmYnOXUouJn7FJBhu6Lv0qlxjnk0davQOw==
X-Google-Smtp-Source: AGHT+IFqKHGasE/q3CxHFccgze4kDl9/B+uNOjperFB7eOc3YOSJklsXFoHknccNnTyE5kIJNN+cEw==
X-Received: by 2002:a05:6808:f10:b0:401:e721:8b5f with SMTP id 5614622812f47-4035a548133mr4310632b6e.2.1746462767858;
        Mon, 05 May 2025 09:32:47 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 11:31:47 -0500
Subject: [PATCH v5 6/7] iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-6-814b72b1cae3@baylibre.com>
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
In-Reply-To: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2980; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=htzNMPXlRVfXDBCUzoC72qPIY7Dbustt/aeF0u587HA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGOgaCStXP11tomR1UVCYdZrN8uLnoILCaVV4Z
 BeCxDvcs2WJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjoGgAKCRDCzCAB/wGP
 wBf0CACDz7JX5f7i4xgLS2PbJoMxYM+RRs6unBD67Ezb/eqc2RApwNtQ3dsCjG6QkO6AuH25Cfu
 X1K9VzIkl5hWdyKAVX6JBT9mO4sFv+yMplB4ZxzxIUzF3Yv+VR4OsgjtSbxNUF5CFLLNFSnLKrV
 tqe5q9Op5uDxpH7GR74XoJBGLtIK1qqCXQAPxF5rAzm9JPVIgCvRjttmLxM1MuDUtBpT5/JyoSH
 Vs1mZwrLz5T86vOHRXArdldRfbFG+NDH9qCmtQzPErbVO/R7q+iccd4AC7Rm33SVGdQ/PILqux3
 y0FbJEDW7xYXrJV9pscAhM/3jHQmtYdNtMt19Fr94L88A3Vg
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_093248_958820_C331DA9C 
X-CRM114-Status: GOOD (  15.38  )
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

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
This is an alternative to [1]. Also, this serves as a test to see if we
can get a rule of thumb to decide how much is too much to put on the
stack vs. needing to put the buffer in a static struct. SCA3300_SCAN_MAX
is 7, so this add a bit over 64 bytes to the stack, make the stack now
roughly double what it was before.

[1]: https://lore.kernel.org/linux-iio/20250418-iio-prefer-aligned_s64-timestamp-v1-1-4c6080710516@baylibre.com/
---
 drivers/iio/accel/sca3300.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/accel/sca3300.c b/drivers/iio/accel/sca3300.c
index 1132bbaba75bcca525fac2f3e19f63546380fd4f..67416a406e2f43e4e417210410904d44c93111d2 100644
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
@@ -193,9 +184,6 @@ struct sca3300_chip_info {
  * @spi: SPI device structure
  * @lock: Data buffer lock
  * @chip: Sensor chip specific information
- * @buffer: Triggered buffer:
- *          -SCA3300: 4 channel 16-bit data + 64-bit timestamp
- *          -SCL3300: 7 channel 16-bit data + 64-bit timestamp
  * @txbuf: Transmit buffer
  * @rxbuf: Receive buffer
  */
@@ -203,7 +191,6 @@ struct sca3300_data {
 	struct spi_device *spi;
 	struct mutex lock;
 	const struct sca3300_chip_info *chip;
-	u8 buffer[SCA3300_MAX_BUFFER_SIZE] __aligned(sizeof(s64));
 	u8 txbuf[4] __aligned(IIO_DMA_MINALIGN);
 	u8 rxbuf[4];
 };
@@ -492,7 +479,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, void *p)
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct sca3300_data *data = iio_priv(indio_dev);
 	int bit, ret, val, i = 0;
-	s16 *channels = (s16 *)data->buffer;
+	IIO_DECLARE_BUFFER_WITH_TS(s16, channels, SCA3300_SCAN_MAX);
 
 	iio_for_each_active_channel(indio_dev, bit) {
 		ret = sca3300_read_reg(data, indio_dev->channels[bit].address, &val);
@@ -505,8 +492,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, void *p)
 		channels[i++] = val;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, data->buffer,
-				    sizeof(data->buffer),
+	iio_push_to_buffers_with_ts(indio_dev, channels, sizeof(channels),
 				    iio_get_time_ns(indio_dev));
 out:
 	iio_trigger_notify_done(indio_dev->trig);

-- 
2.43.0


