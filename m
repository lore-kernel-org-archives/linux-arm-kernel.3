Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD425C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxcllqlAxGqsvqgkY1jmnRBvrU6YNyliNCeWX4COibA=; b=rivVMEh58D60bBXYHHQUoB6rOb
	AgjrQcFsn/Z7qJG8DRBg6+GnYcdhm7NungeEAL4Xze5lWf5aI+3Lo5JvUrw931NVRpKEmQh2FMPJ0
	uN89FoG7RITzxK3D+uT9lceDHjffB84kRKcxV60BVWYSAmlqoHj6777L0YFVNl1KI7RsIr9C8rK9H
	FdaeDDH2z0jP+urI9ta/DZqztTdVPyqT+g9r5sYtEEDx6OWZKljfh5AJCRNctjOxe6UZV2Yfxu+oW
	r8NEoQYEQLTZL7cFn6ezaM1Yr/szgcbGgQ7gNhRzPJ11lQ3jkBStqnT1BITivriiBrBGoTxwjsgGB
	mTIrIUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7M2a-00000008hzO-1kYQ;
	Tue, 22 Apr 2025 22:24:32 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LnO-00000008fp5-24T7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:08:51 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7303d9d5edeso271003a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745359729; x=1745964529; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxcllqlAxGqsvqgkY1jmnRBvrU6YNyliNCeWX4COibA=;
        b=XpSeHT6q+KNMcLjs+3lp28SVuMT65JuhTRDOyzO8T7svmhhrXFNAuXlZIRA+rb2+ZA
         4Si+N16U1bljbT4KMJ0JOxDkP2jdF2or3VEDqLIjMMOTVES/NaM125GZZ3AYnP56CVK0
         /CmyiWJlPOsBnOwVJd/RgPNzMAezqjg9MmREgVjfjLV2P5cam7YF7l64Lozwr8uW081W
         O5tefKCy9Vpq49KnV9/qCmL4ZLrq4+uWIgBHSXmagfYUtmnVdHnZPYp1DGwlfaOWESPX
         YSzC7SNpTwVtDGHsL/2GUuF4fzH3eqhy4wfGoOVhL+pWLby5nciJqiljI9zMW/Eu5Xvn
         0E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359729; x=1745964529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxcllqlAxGqsvqgkY1jmnRBvrU6YNyliNCeWX4COibA=;
        b=GrZV5Ta0ah8f5iw8zwxeE2r6Ga5cXVCT3qs2TBU3Bn33lSnI52oBJmjh+TkPRje3nF
         rOy/XrTVGNI1pyLYD4UG5YsrJQJgRbfw24AESIvi1KpGISxIGoFlO1fXMiVW68eIisqi
         /uLOHACj2JQOS6JWv9DHUfwYOHgDFd/PNecbfc1iYsprM4GdSl+F2HHT1Srol3IrmZ6d
         bPjxtseuJwjMcmrOXIat5GpYmTO0hJPMDeYOjmvBPruYGcjtwTpsqwg5LO0fM7dAjnOy
         crkzRPOKEJKjZYuNFzqxJuKkE/CxoeQSKG9op87LZ20gc1TRMFIETUj447ePZiqTSS+A
         ch/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEvET0Irujh7xDhkJYJc7WLkCKkkUoQAV6crXEI/tjIyiEkTAW/uLChCappEy3vQup3DNKLG6liggdpMM1VXBz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx+QQVHmE/bC1H1vjF2CRlJaxg0c3AX37b7J4l0dfyJHWDzQRW
	EA1AYvEFtykYJxgSdAntUess16KxZT90Bz3KYUZnx9U/lqlCawlNRcGDaFucDB4=
X-Gm-Gg: ASbGncuev9uBZwmhV1yR2sNJbDDw+gO4yJQe2F3Xb+lmvVGU2nkh9Bztl7g9acgTFKg
	VIQKftMN4b04UP4iTtGgo0TvCQvKVFmAof4aEQBVD21S/VGF7KeXHO3VomOHaU70nCT7UVlWzJx
	5znlyDdSub5ss5X3Xn6oqbq4vjbKyQGlf7r2W1/dq56Awc28goWZeuP16BbUhVuDCST2hL1JAzE
	7ar+8YyC0aUSI/JY4ZsRAQBsNK8sC6ZOgZKm1j2hdnXnhFzYC3ly7UFfva64yKvveg7bU7/eLYV
	mr/tIAKPeIMJb+gTOBAptyoJdxa0nfbuSFUKoEVX09Z9i48=
X-Google-Smtp-Source: AGHT+IEHQ1xlklPGq2GZ44BS1JT8PZ0bjGyLk9c5dWYPUyG84Suj7pcBUnv1TneF5QAxVGuSMQf2Hg==
X-Received: by 2002:a05:6830:264b:b0:72b:9993:118e with SMTP id 46e09a7af769-730062f8177mr11792393a34.22.1745359729568;
        Tue, 22 Apr 2025 15:08:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730048848dfsm2265938a34.52.2025.04.22.15.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:08:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 22 Apr 2025 17:07:50 -0500
Subject: [PATCH v2 5/6] iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-5-3fd36475c706@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=COjNIZhPuNt4S3954Fn2UL7GTZFMh/VIXCBpDzwE6Cs=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoCBNbRITiIrOuOBiNd6+w5vU0Q+H8NcTHgrQrU
 wLSWJRb19CJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAgTWwAKCRDCzCAB/wGP
 wBTnB/9W3nNh7c5a7hXZRRRgX27QxylG6YYb6ppn7Xw65rFs9kwK77c2XZJ0mvMb2GtkwdRJTi/
 gl3MYrnC4UO8Fa0QYFI86FvSwrL/Csc0KUdtxnoLwen4TidL0q/LrDC5juRb6mA15H4PxMU/7tV
 exHDy6eWEe4Mcr0HAkaWXpjKFp+uPdkC4fo+O+Z8mgP/68Yh5bRqYXoI7J/w/apXcV288ZzZjqv
 Rn9UvvZhMoS3u5jPkZKIoGhf2P8H3oPLCsresOruS7yjQ90ZC+hgnfSN7PTSd8X2QS/ldSmhabx
 4oGYoytUtH0tST5kio2IoJVgt8p121obveXOAH7573ErgxVp
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_150850_538334_CA587EBB 
X-CRM114-Status: GOOD (  15.75  )
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


