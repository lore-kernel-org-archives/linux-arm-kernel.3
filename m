Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62806C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=; b=a+cXVkhWxHIly7KDXu1GAatlR8
	0CGc09W7vQ5/4vi84o/bex8/YZuInakmCBxXUUu1mwn+5bNEkTafUKHa+J8pGH+VEW62k+0xm5zxP
	xmiaostOqRO6/nFu7CXzUXiWYZWz5Ome2rKQJxlAmpBKOo9t5iki4JCW1JswQGdnQdbwv8TvgAwp2
	ydEWHx5nO0Ulf/YPaGVXkvsP4aKWHyVUOCHziSd+//NnrugkQ9eU7N0/q1Ae0Q9RlDVBQEstbFXno
	Q69K1gZWIV5aRNIIkB9ii+qO9EVAwvxrADZhpHbqwM+ngmYUlmpL8iGEomcuwlYhTRFfkXimmsrAD
	4ikHF5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QWN-00000000uyN-3Fg4;
	Fri, 25 Apr 2025 21:23:43 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QIp-00000000tH6-2uVx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:09:44 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-72c14138668so802075a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 14:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745615382; x=1746220182; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=;
        b=eB6KP3ZFwpEmcTCzrWspcyLhFeu5TQhcIP5jCJc7UcNGItZ9901ULO/0A5Knpms7M+
         3UyeT2qDnG78W72TWvRYaj2TMSC1ZxuCKN95ugEUWUBRqDa3/QPqBsFS66JBzPVzEy6W
         5FPCVmGoEKcfgcZtXPT3eLaWu4tyKbPKtrtPE7EEZpTgo98BceCeNJccmlg7C9EtLFKF
         BqP0qZ8D4MiuRGxL+TTSPo6SWyPmUAOpOfTVukwztR/TzJYWfXpbsWchUKYQQHlCCZ9a
         vQcxv1U0Mo9HGnKwalFoAMipX7thqWl3DdaUnwRVMEBsEbvkhGFDSxHuyUUBCCQor7DP
         WaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615382; x=1746220182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=;
        b=rqk0oyDn0JNIYVxDU3oV8NsgBRr2m7Db6ssKvxuWIAIKrqzmj4dQZwxiVQkLAqwNqE
         rQ2llmO0VaV0v/ybhZacpz3K8qDJaPxqFiA/znublzdiPsLZfbi500H4Rr6lNfeIJByG
         38puZ59laOYBTR9kEiccxjQ9PSPMXWuwNDUXddwgZZGvHC9CP60eHKPz9AhjaBNqvesb
         N3x62Tamdh9oCNOHKiUsTjhyHKcfUhBf6ngcJQlTrDR/20NYFUYJ3Vb8FTTkah/8agta
         gVfl4NrYlK6pCXvHQhUwjBXfJsl+v+FG82c5L+xeSWyj1hwPhJq4Y+CNVK3gDXdcAkU6
         KQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhc5MF6Hzln4kkW4D6ZTG1oAakchc6EbUBBcanVBLfwKhbAPV8zBtKRcrd/gI1wCGlLCqekd/oQyF7p2wq/KSw@lists.infradead.org
X-Gm-Message-State: AOJu0YymeFg4bo6cbPlyBl9nwDlh15cLabNNCMdry752dFiVxH2ZiKBw
	v1vOJcaPEObgXxwvx8El6kNHC3oS63T8kb/0Lg/OnQmpVl0x/jzsZCb1ADoKKIU=
X-Gm-Gg: ASbGnct0iUHzMTHF58xYyTrbsyHZpYNJtx9LC1+R/iuYpvOKvlXAzkatJw50OLPa7do
	Xg94hrgLTmYgU8yR3qiOu4ifvtBcjE50QiJnb6NBcSWozGIp3TTz7IIbdFWYWRs4o5qynUKJXW/
	lUi/zgxMIhMSkZaNzj+xAEf9aUssyKBe0ueFSA/hiHH7wXUx2R+SKEH0kmaLcDpQE1pf/O4zNpA
	/fhsVXyr7K3GeRNgHehNR0zRBl3jfxg/q5QbvafYm1Y7aYAVIjdwrFTCyzlN3v7rOpsDCQPH9EU
	VwFTY6KL+RJdmFzol0PB0dwhPphElVvWSxgrXTAu2lpi
X-Google-Smtp-Source: AGHT+IHLgQHGW0PActt52m77uug4cyBdR0f29K9AKJZKuS1/OMf1wtoVjtXc0QZ+kbE0ZSOMbu7xqw==
X-Received: by 2002:a05:6830:6c16:b0:72c:3289:ab9e with SMTP id 46e09a7af769-7306528fbbamr857002a34.27.1745615382663;
        Fri, 25 Apr 2025 14:09:42 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f188052sm847673a34.8.2025.04.25.14.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 14:09:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 25 Apr 2025 16:08:47 -0500
Subject: [PATCH v3 5/6] iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-5-f12df1bff248@baylibre.com>
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
In-Reply-To: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
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
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoC/oC99c7vmgahKavaaqiaEwFgXFazfdsIHWhn
 /S6WuWWb5yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAv6AgAKCRDCzCAB/wGP
 wBmKB/4lJcLjJW0z//7l87DZoFSQnUkGM1DBpTGiF647U0XkqoDbOqJ49+vuOFHBVBnpQtn6F+K
 I4UkBG8x6x4TFqWHY7jHgHI80t9kBAvmB9fE17HEu5jgdmydpfe0RAHxNsQP4OW/NNf0rg3DJOb
 +/NpEmjvyUNUQXjp68euE+DXBg159TtrzYwvJyxHZMh4X8HGoh8PRiuzbmflcShlZdS96i9SSL5
 bMiOhQE9+hy1LTX+O8bh0oRdjVzK/Wst21kN/sEW4SwfEZGNrhJyqisqJN0dXjJLg0HFpMRFBA0
 T1VPuE5WvvVTNli/8uj7ck+N48jC754QNaLmK8ELHvPBVBlS
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_140943_743703_5502FE26 
X-CRM114-Status: GOOD (  15.31  )
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


