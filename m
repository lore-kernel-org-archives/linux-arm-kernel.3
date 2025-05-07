Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78685C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 20:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzPdaraet1qd/hRhYNfeQIRYquiVkvvOEQ3W8/ikI7E=; b=qxVQcWmGqtA/1t87wcdgk+35ou
	gIQ3V8sLAb96QEwS7Z8yyGREJtpxvBNLdgK1uj+562rp9fjkBfUEr7uCJ3VfGtRiiSMmiXbS+HQhX
	WLsigLdJD/PWNWkvsq0Q4xBU1blU6toPu3wketyjo6UYB3WfEiuseASqaXabDjVW3PjlLJtKHCCb5
	RrKIx7/VY66ecNXjjHeszlQk0GL+B0ZIGHynR18/aj0fvFuHCBWvgRotqCsdRddLqXe+CceGdovWg
	rTwYKYgFZLJFECRtA1/QxBSzFGsuytwdVcKbkgglmynEBiEYiAJxWazFA0BoAbvZ9GoH9O9E5B7oj
	U+mnypaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClri-0000000GkGn-2lUe;
	Wed, 07 May 2025 20:59:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClcW-0000000Gi4e-0xyg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 May 2025 20:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fzPdaraet1qd/hRhYNfeQIRYquiVkvvOEQ3W8/ikI7E=; b=ZyuPbzJjIL73r5HECAjVlVMRTx
	o+4BZgbitPG1nix2RN86tRXW9SJQGN/uBplQc6NQJDaNdrbTq9TsY0JyZ3wx7oJ96JC0PsJZvJBYP
	e+j496OAt1D5FltPT3ol5n3eAxTFYXh83oUjNSWNl9fp9xVkELk2C+Mi5UpYILHgc37rVqiA6ylEz
	v3LjI8Sh22yv0a5h+cTQNB90FsLWYBVmsUUSQXcdfT5YhWLnOc7H0XF5Pt+pR2MKrhFlPIHJvmg8s
	YdJ4pd0o9B6rIhJO+4gpKBOB8EfcicgBN22/n8ajE6cMdyuoTgTlN8s9i9p+tCyFK+txAipSB/Qqj
	VOzYC5Kg==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uClcS-0000000Fv4P-31MK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 20:43:58 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7303d9d5edeso86396a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 13:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746650631; x=1747255431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzPdaraet1qd/hRhYNfeQIRYquiVkvvOEQ3W8/ikI7E=;
        b=ypGyitvmonqkTzLp88oq6gNqFKDUtSvjLaUWiMLS1kSlOcK3xby/rbshljaLH8L9l4
         kJLOU6ijesffJqdkSyEFRQ6aBHG+KJprHE8mxgw5EWjyrHxFz8DZ0B5kRTuo/KeQmOhb
         gp2nopgeobEQgPcZKWJc7Arcguu4BTtmvAcwenUlJP+azL3AkeqM5LHTrnV5EFAK5V52
         cNR+lE4xBX7sFpExilpaKuUimP6Obpi8dYzVwTeJGTCDzhHHZ0SX1RTYLaIn66xTAIkR
         fIuHtaEqmNS+XC7qwD1gGGt6sxOr39V/ftkhszo/NeYGGzMzOWqawxlLC3B5+to8pCGP
         18Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650631; x=1747255431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzPdaraet1qd/hRhYNfeQIRYquiVkvvOEQ3W8/ikI7E=;
        b=jiTwNrER7VP/BNmxYny5MMDxbo8CShZ3sD3NoZ2IyLpNO1AytPyaOpwtAXu4/mgGYw
         bIKWLhAe7tPWhl+rTfsyNxiJpbcl0olZU/p1+Y1K0FGztClSWE/i0U2osT4ipQfY9RmO
         Y0jyZTucd/mOhXyzmNUaJdvupPzowTzYXV13DP0Y7E4xfArD9BSPQJR+tS50gWnv2UPV
         omk6znKxhMw7J/IsQXp/jzVi75dmhBP72mWc2KXicWwr6cS9Dm/WU26UvuHWjmgQPUNo
         UvwsyWnWItzT/QPDtogyr8FpPIV0BGiKsQTmVTXVicGTtFtoYhwvBdKc9aIzhW7wat2j
         6nbw==
X-Forwarded-Encrypted: i=1; AJvYcCXf4erEUbTDMmtTAKDFcA+QxeLro/d20SNtQ2hJ9H15zN3WO2GEbyq7s/qKF3lmOnf4WW68MsFA0rh+Xx2+kJt+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1/TYZE9JV2xWRH45ss0jwHutt95cR8vs3g3Fbeya8+iXVKQAW
	Ljrt45zqLjF6zjUaOyjojqg39GorN6rXwGt9LChy9j/2ZmzFntkmWL8CPPB9PFw=
X-Gm-Gg: ASbGncvBxxg+/94ZTsTcu6pjip5ZVm/si1QSw9bNc4MXBgFlsx6tOIA6oa3Q0KDR23n
	3Ref8swSVc1GA0uiKX5SCeUvz4alk/t/CpVAj/W8fB2r9S6GrQsK7c7vhRw3Px7/v689rfQqLPv
	VkQ2QI+VKNsidtl3vAp4V38zUrZFIalJ+8jZDPhB6+/aBnVnO2jCgx5S/bfbK5F8if7YJRVbht5
	yqP5+wb8e+2kdAS6m2y/4o1Y/D7YwnE6+eln2Dru3MmWH3qX6Yp2TYx35ggQoIlmGickQym5MQg
	819Wa+BAqiG9PE43vPI0mc/iLNJyNZJ8AM5kmzQHcdKf7A==
X-Google-Smtp-Source: AGHT+IEpHAnG01Scl8J+PpIsjJyBK4Ozzp5Btge1E7DtlkBYgx1uC1tvjoReIGhc8pl1J4BDBekRyg==
X-Received: by 2002:a05:6870:4591:b0:2b7:d3f1:dc72 with SMTP id 586e51a60fabf-2db5c0689bbmr3206424fac.29.1746650631030;
        Wed, 07 May 2025 13:43:51 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5cd716d3sm898642fac.21.2025.05.07.13.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:43:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 07 May 2025 15:42:45 -0500
Subject: [PATCH v6 6/7] iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-6-4aee1b9f1b89@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3024; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=dvUFehPiHRrmTSC3dtvpsj/U2poRcpbR8vHtY4i3nHY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoG8XsfCtuj9afQdP+zJ6RY1Bvt2zemL+sDgCwQ
 kXeNrGbo4GJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBvF7AAKCRDCzCAB/wGP
 wGyqB/9o5h9iBDRuaIoFSHY1pBm5fkeyDKqnrw3bEgY8R0uUDWwzRNWAvrLeZFaFG0JPwu2sBNv
 +l0AZ6J9yMJ0J1nong62NfhEOxIpZg+qRE8RipH3LscKnXoOcMuu4ptiF8Vh9rOA2Fb3+j73SzJ
 z8SdMyDCVIML7mH9boq8DnliwmotlxdYo0Mho0+w+f3qZArRypNzHQbKKqgc6nZDXpTy3Djqeq/
 O76xOo9fkthmY+F5ZQda/ZaFtlQrGU5qn2/lyEPzmunUU8XlFG5FBCgybA44jKN+A+b/qoZ8ZVz
 fpAtYnb4YwBP9R+XYPexIC4pazTSS28lU2TQPYv4uxc7clFX
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_214356_999423_3C3190DD 
X-CRM114-Status: GOOD (  15.12  )
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


