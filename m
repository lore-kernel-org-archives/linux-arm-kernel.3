Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1244C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=; b=KewmteT4ljFSUxO1e5cN1TPIKR
	QmR7v0uhY6ZcIQ7AkZM7M3ZmpKe1qMBYm0sd507VJd7Xx2Rk9LfFh+iTXPZLZaFHLhVL7DtERCWhy
	o754FjhYP7zT1B+Aq02vOtCvOL/j25HXXaw7QDQpSE22zo3whBAoeHt2wO4JlRNRN13ccYzNbNS6q
	D6rpdwMMXdeqQivhGX40f1YrtpC+Uo590y2lybDJrReiQkunW7H/u3r4StdHkuozP1k1z0D37RPd8
	YSQbo1YTNgEAF536iqmNnFBXVW9gc9pHaIfWQhMxLCj2zi68YM2fm3jBi+ZRYepi7tnnuYRwvkU3O
	7Hdwk/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VEv-00000007UWS-0Ua0;
	Mon, 28 Apr 2025 20:38:09 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V1U-00000007SIK-1Lwo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:24:17 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3f8ae3ed8f4so3645268b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871855; x=1746476655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=;
        b=hxayOanKhQyf3ZlrWflY1UXrfD7AYLaAiGQmKnK+24a+IwDHGUf2AwKUolHtionZxL
         QAdKChv2Exr/KrTha7HzP8Aiy+LN1NJt2PPnfVQzLMkICcS/WnM/XiMiu3YU1EV1PkTm
         2ov5y6e5396d1EpGC/3XG+rEOPg4OwiYVuWi0DyHaIbqBXFCmLbHwF8w0oWpgRpc+aHR
         jSvYpacfyDMPnRWztLT+e3kqWRv6fDcP6k6Dg0Y+n3ax8bDiQFES/JKJdM/c3FV0MNLP
         558pG0YZMCtD/hG0pBTKwk5oCBCofMaQI4lEAIAcCrn62tw1as3APa6YEYlje2usn00f
         c42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871855; x=1746476655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=;
        b=GH16wq9Rpgp99et4eHKu0Pt1coEHukQyQU5FJ0NUoFL7hMdIyNKaKXKUg2nKQUMaMf
         MUJCHreMZPtlgLkvNwNTq58eAe7gGPpt4WzhvZE9D/EA7u4x6uUo3yE/ApFmSeJxZ2io
         yFSiTMfYjJES+anDXbr+TYtGjXacmVFU0cKVz0bBpbOprXQyYIKVOdQJZ9dEBercmBq9
         lA+5VnJN+ciPhlV/TejsHOMtgtOF1DjTnn8hWY4n+RDKI0GVn0auXcZogU5XP/cyi9fg
         FHOZC7iIcB0+SRmuohvrHIkd/nf7xUqf1a+iBDOAT2xDfGmp7anZVb6bYXpPds5SBste
         NDjA==
X-Forwarded-Encrypted: i=1; AJvYcCUrZh9rPYAHOPO0aG1I6JBNZBEtTmbvp8Aty1PST2HQPz+3cf/o17PTyeIFIU62uRUIEndhK7JiUyAVnF/ypBBl@lists.infradead.org
X-Gm-Message-State: AOJu0YzY49yvn0paxHlfUeSPDh4qQ9/CX5HzjhMby/CR14vIjMP+JObm
	401cfqCRHr1NGiL+DcamKyOL9Dw6rUFr/rxQ5VJlU0NphaeM72vMaZdiC8zIbaY=
X-Gm-Gg: ASbGncsBI9w2fAMfR9qXgR51mz2ccObI91KDhJwuHiZf+/OK6uKIABxWGXHzwgGOLky
	WS6Pec/DnyWVp3uvA4Dgqwi8XMKINNPS/kHwWEs3qPa1MnMRhlV8yA7L7HsfUlIj/Bz7t3OL+Md
	AJY1FEJkeNlYERmiaHS+SjNDC9ZsP7xJ7HJXsvPBKvZlA2lgbzbmb3hibmKb/jCAQPaHoWT1v0b
	G20VjK8thacalAkiPtODDP+cvh6qHUBf+b+5cgdGdND07HHLU8VZIEuNHGby9YlPcXjfs+jLpOf
	byYjuX2GckSIsqqdA151HNZb5WQNlShrmjuS4UItqO5l1gVI6lXTvSQ7qQ==
X-Google-Smtp-Source: AGHT+IHWDYsPV4NitcaTYpgE7UhDjAc/dkOOE3bAqOcW2gABkaCTrsjM84VlpdSsucL1H4N7hzx65w==
X-Received: by 2002:a05:6808:330a:b0:401:e949:6381 with SMTP id 5614622812f47-40211577993mr179164b6e.19.1745871854968;
        Mon, 28 Apr 2025 13:24:14 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:14 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:08 -0500
Subject: [PATCH v4 6/7] iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-6-6f7f6126f1cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2980; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=htzNMPXlRVfXDBCUzoC72qPIY7Dbustt/aeF0u587HA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+PTGYK6ltZUKAz6ARjAhcxo37S0yYyvXAfZ8
 IeVDjBAieyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/j0wAKCRDCzCAB/wGP
 wE5PCACauVxdlLd4SV1hK2nzoW85CFCUCnNXbPIlokdEh+LfKhvlbt8S3RI9cGDMwumFDlZPZq0
 7Z3BqalYsLPvdH6nQfN5DZSWSeS/cywoHGkyJjFGWJ85e1NdC2XptNEu6GV0gYnp4XXQpsxjzq3
 CYd8GXj4eehMVbOhOOoT/p4Lfd2tj5uaXDVL8TPik9wRlxSdwhhg38Gh7fqxrrPDmzyht60T3pF
 Gcp3eYRkT1F1RljVJIam/foR+bogJEy6bX9w7+SM5JpXmeX8EJoDE69w8lXHFPDdfGRDfLB8Qla
 R6yXv1ErpZzFeweqLdaSp6fpqSy0FdPezOTS33hsc9b/Xd67
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_132416_364675_1101F7AB 
X-CRM114-Status: GOOD (  15.42  )
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


