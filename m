Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E93C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 06:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyJQ9t7txm2uX4ghg6HKI7hOthBf32vtoSwhjIHi9uc=; b=DR9d3feK6YyAOqDEBoKAW115ds
	DsTbNwtZhlYOTOGbIcAZfubVl0bMnYAqAD2h3yZ3z/1YaOVIuSPDFZ+KyOtxMSYlAw2PRZQxx3gXO
	Aje5Nm8Gvqf7mh+MhsNI50WywFWFmmswbHx3djYheqO8g93zuM/tnJjw7e1QwAuQl/zKnL9GejtXn
	x8OB/NuLTnNkmPtEgLSZauQpBCd7bSFtzJKMqYwR2udyc5La1pnuu3B4LmveJ2QcOTCbAs4DStgS2
	VdLgb4LWi4RcBF57DB7778eNjwqXG8zmxuqAoqMeIH2HZIVDFeScAjw52RzXll0gutSNNK2z2OwfX
	vd+Qk7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taU5z-00000009TZy-2Qf4;
	Wed, 22 Jan 2025 06:20:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taU4i-00000009TTB-32ji
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 06:18:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21680814d42so106310785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 22:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737526731; x=1738131531; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyJQ9t7txm2uX4ghg6HKI7hOthBf32vtoSwhjIHi9uc=;
        b=Ihv0VRFJFA8a0178JDU5CpHHc6BLIbJ4WMCPYYaKS0rkcwn/kfBBAnSptrZbp5C00S
         z0MsrgiXdomlr1xBgzcBO3q0nx1RqMJKTVJM+TGN39HmJZYz/+7rcAYpL8mEJ3XrYcAI
         mWu5KJr4RyBtTDI/2/CGnBSbl6W4ZKnN0LAP6CkrEsvxjq49Xa8rAS8Yp94PAKxcw0QA
         m2En/KSV7FI7B4zTaKyOX6Qxj4pIoUiw6zxUG/zMFSmPTflMbFFOMkCskPUv6pCXLGUW
         5zoOHR1iyDqXmbi3AdvwLS8GT+I8Oz3Mg5hBU5pV2Xc7K+LPkB6CfkCZdZZzKSmJYQ+e
         bQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737526731; x=1738131531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyJQ9t7txm2uX4ghg6HKI7hOthBf32vtoSwhjIHi9uc=;
        b=DwPFFBejuk+lDEAIoSUguAmeaAqZaWLY6ruqRFjr4BiLii+/Td7I/LLEia+oxhA2OF
         L25CVXZ8J7jtupWOzWE0MoGgQu9PbJHv+y9KoUAuh5vFi5Y8hT/amGdG5jmRhG//g92S
         fFzV0zwycEJ2l5JCkX3vcu+J0s8AAHBB8nxzN1GT4sC0cWp1x+rOs38qMeEpxD9kqjU0
         U4RU2clL70VH7fTthKA+uMauYKABq2GFFneUdplOoaNLFHwWsns8T8+Hhf7WvqziSPu8
         WEVYmXzvBGX02sMmhxN9YVilhbmV8vLH7r/6PbVIjqAh4AhXfn3cUWv55r9ldrZW3cMJ
         ZIYw==
X-Forwarded-Encrypted: i=1; AJvYcCUNn1JEeZ8J00XQmMq4wELmy9yx2iKIY/DkbXktyYCyfVdNT/4tv+TKfb8EL0M6SiwcpY8B5rlN/nto9uiAGtFs@lists.infradead.org
X-Gm-Message-State: AOJu0YwCDblrtWBLfdU7flCRqvdWpzkCYkIJPTeRXKbnvcDaFL1pF19S
	TMGkV7vfIYLDCAst4mqdO75RVn45HUSoUOIkzJ3yvs7gh3Dun+7l
X-Gm-Gg: ASbGncu1pXR33bfGd8rqKItV6VEcaZ2w+St9RU2DX/SjNfKR7WdHV0+MhYJCeTgdTiz
	yKiBUYiDIjDwqZFxTkQqH0TlrZgVRaiMxJi1J0WWhbe7INhk5dyj8sk7FOE7aMY8J2EjLBuMs/m
	YUjlB1KdDCbDiEvBsf+rdphoBLE3viEzy1Jxm4xL0JhFI1za1QqzKAjKZnyW+rAYNJxG+iQ8cMy
	8q3RcDCcTWa3AQCuTxfORjhBxo17iYu3FaAfGnjFgABq2iORZQb3XoSCEhd4N0T8EgtNgU=
X-Google-Smtp-Source: AGHT+IEQTplKGNA9h3pF/a43u0N0BbCMlHsBnxxEeVeXsOQK2hxccYc8MSrjFdD/VABnA+P70RM5UA==
X-Received: by 2002:a17:902:d582:b0:216:2426:767b with SMTP id d9443c01a7336-21c352dde25mr340213375ad.10.1737526731328;
        Tue, 21 Jan 2025 22:18:51 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:b7e0:baea:f99d:5c57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d404755sm87056125ad.243.2025.01.21.22.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 22:18:50 -0800 (PST)
Date: Tue, 21 Jan 2025 22:18:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v5 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z5CNx9natNYmJ5il@google.com>
References: <20250118-z2-v5-0-6d38b2582169@gmail.com>
 <20250118-z2-v5-2-6d38b2582169@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250118-z2-v5-2-6d38b2582169@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_221852_778193_988494DF 
X-CRM114-Status: GOOD (  40.34  )
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

Hi Sasha,

On Sat, Jan 18, 2025 at 11:42:23PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.

A few more comments.

> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/input/touchscreen/Kconfig    |  13 +
>  drivers/input/touchscreen/Makefile   |   1 +
>  drivers/input/touchscreen/apple_z2.c | 453 +++++++++++++++++++++++++++++++++++
>  3 files changed, 467 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 1a03de7fcfa66c0f60768be17d776a79e36e570e..6c885cc58f323b3628538d41460248f8ab1dbf7d 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -103,6 +103,19 @@ config TOUCHSCREEN_ADC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called resistive-adc-touch.ko.
>  
> +config TOUCHSCREEN_APPLE_Z2
> +	tristate "Apple Z2 touchscreens"
> +	default ARCH_APPLE
> +	depends on SPI
> +	help
> +	  Say Y here if you have an Apple device with
> +	  a touchscreen or a touchbar.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called apple_z2.
> +
>  config TOUCHSCREEN_AR1021_I2C
>  	tristate "Microchip AR1020/1021 i2c touchscreen"
>  	depends on I2C && OF
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index 82bc837ca01e2ee18c5e9c578765d55ef9fab6d4..97a025c6a3770fb80255246eb63c11688ebd79eb 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_TOUCHSCREEN_AD7879_I2C)	+= ad7879-i2c.o
>  obj-$(CONFIG_TOUCHSCREEN_AD7879_SPI)	+= ad7879-spi.o
>  obj-$(CONFIG_TOUCHSCREEN_ADC)		+= resistive-adc-touch.o
>  obj-$(CONFIG_TOUCHSCREEN_ADS7846)	+= ads7846.o
> +obj-$(CONFIG_TOUCHSCREEN_APPLE_Z2)	+= apple_z2.o
>  obj-$(CONFIG_TOUCHSCREEN_AR1021_I2C)	+= ar1021_i2c.o
>  obj-$(CONFIG_TOUCHSCREEN_ATMEL_MXT)	+= atmel_mxt_ts.o
>  obj-$(CONFIG_TOUCHSCREEN_AUO_PIXCIR)	+= auo-pixcir-ts.o
> diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e244761132212ba0bd962497d5615e3374b34ec4
> --- /dev/null
> +++ b/drivers/input/touchscreen/apple_z2.c
> @@ -0,0 +1,453 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple Z2 touchscreen driver
> + *
> + * Copyright (C) The Asahi Linux Contributors
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/spi/spi.h>
> +#include <linux/unaligned.h>
> +
> +#define APPLE_Z2_NUM_FINGERS_OFFSET      16
> +#define APPLE_Z2_FINGERS_OFFSET          24
> +#define APPLE_Z2_TOUCH_STARTED           3
> +#define APPLE_Z2_TOUCH_MOVED             4
> +#define APPLE_Z2_CMD_READ_INTERRUPT_DATA 0xEB
> +#define APPLE_Z2_HBPP_CMD_BLOB           0x3001
> +#define APPLE_Z2_FW_MAGIC                0x5746325A
> +#define LOAD_COMMAND_INIT_PAYLOAD        0
> +#define LOAD_COMMAND_SEND_BLOB           1
> +#define LOAD_COMMAND_SEND_CALIBRATION    2
> +#define CAL_PROP_NAME                    "apple,z2-cal-blob"
> +
> +struct apple_z2 {
> +	struct spi_device *spidev;
> +	struct gpio_desc *reset_gpio;
> +	struct input_dev *input_dev;
> +	struct completion boot_irq;
> +	bool booted;
> +	int index_parity;
> +	struct touchscreen_properties props;
> +	const char *fw_name;
> +	u8 *tx_buf;
> +	u8 *rx_buf;
> +};
> +
> +struct apple_z2_finger {
> +	u8 finger;
> +	u8 state;
> +	__le16 unknown2;
> +	__le16 abs_x;
> +	__le16 abs_y;
> +	__le16 rel_x;
> +	__le16 rel_y;
> +	__le16 tool_major;
> +	__le16 tool_minor;
> +	__le16 orientation;
> +	__le16 touch_major;
> +	__le16 touch_minor;
> +	__le16 unused[2];
> +	__le16 pressure;
> +	__le16 multi;
> +} __packed;
> +
> +struct apple_z2_hbpp_blob_hdr {
> +	__le16 cmd;
> +	__le16 len;
> +	__le32 addr;
> +	__le16 checksum;
> +};
> +
> +struct apple_z2_fw_hdr {
> +	__le32 magic;
> +	__le32 version;
> +};
> +
> +struct apple_z2_read_interrupt_cmd {
> +	u8 cmd;
> +	u8 counter;
> +	u8 unused[12];
> +	__le16 checksum;
> +};
> +
> +static void apple_z2_parse_touches(struct apple_z2 *z2, char *msg, size_t msg_len)

const u8 *msg here and elsewhere were char * is used for binary data.

> +{
> +	int i;
> +	int nfingers;
> +	int slot;
> +	int slot_valid;
> +	struct apple_z2_finger *fingers;
> +
> +	if (msg_len <= APPLE_Z2_NUM_FINGERS_OFFSET)
> +		return;
> +	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
> +	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
> +	for (i = 0; i < nfingers; i++) {
> +		slot = input_mt_get_slot_by_key(z2->input_dev, fingers[i].finger);
> +		if (slot < 0) {
> +			dev_warn(&z2->spidev->dev, "unable to get slot for finger\n");
> +			continue;
> +		}
> +		slot_valid = fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
> +			     fingers[i].state == APPLE_Z2_TOUCH_MOVED;
> +		input_mt_slot(z2->input_dev, slot);
> +		if (!input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid))
> +			continue;
> +		touchscreen_report_pos(z2->input_dev, &z2->props, le16_to_cpu(fingers[i].abs_x),
> +				       le16_to_cpu(fingers[i].abs_y), true);
> +		input_report_abs(z2->input_dev, ABS_MT_WIDTH_MAJOR,
> +				 le16_to_cpu(fingers[i].tool_major));
> +		input_report_abs(z2->input_dev, ABS_MT_WIDTH_MINOR,
> +				 le16_to_cpu(fingers[i].tool_minor));
> +		input_report_abs(z2->input_dev, ABS_MT_ORIENTATION,
> +				 le16_to_cpu(fingers[i].orientation));
> +		input_report_abs(z2->input_dev, ABS_MT_TOUCH_MAJOR,
> +				 le16_to_cpu(fingers[i].touch_major));
> +		input_report_abs(z2->input_dev, ABS_MT_TOUCH_MINOR,
> +				 le16_to_cpu(fingers[i].touch_minor));
> +	}
> +	input_mt_sync_frame(z2->input_dev);
> +	input_sync(z2->input_dev);
> +}
> +
> +static int apple_z2_read_packet(struct apple_z2 *z2)
> +{
> +	struct apple_z2_read_interrupt_cmd *len_cmd = (void *)z2->tx_buf;
> +	struct spi_transfer xfer;
> +	int error;
> +	size_t pkt_len;
> +
> +	memset(&xfer, 0, sizeof(xfer));
> +	len_cmd->cmd = APPLE_Z2_CMD_READ_INTERRUPT_DATA;
> +	len_cmd->counter = z2->index_parity + 1;
> +	len_cmd->checksum =
> +		cpu_to_le16(APPLE_Z2_CMD_READ_INTERRUPT_DATA + len_cmd->counter);
> +	z2->index_parity = !z2->index_parity;
> +	xfer.tx_buf = z2->tx_buf;
> +	xfer.rx_buf = z2->rx_buf;
> +	xfer.len = sizeof(*len_cmd);
> +
> +	error = spi_sync_transfer(z2->spidev, &xfer, 1);
> +	if (error)
> +		return error;
> +
> +	pkt_len = (get_unaligned_le16(z2->rx_buf + 1) + 8) & (-4);

Negative mask is unusual. Can you replace it with a hex value? Do you
know what is in the discarded bits?

> +
> +	error = spi_read(z2->spidev, z2->rx_buf, pkt_len);
> +	if (error)
> +		return error;
> +
> +	apple_z2_parse_touches(z2, z2->rx_buf + 5, pkt_len - 5);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t apple_z2_irq(int irq, void *data)
> +{
> +	struct spi_device *spi = data;
> +	struct apple_z2 *z2 = spi_get_drvdata(spi);

If you pass z2 to devm_request_threaded_irq you can avoid this call.

> +
> +	if (unlikely(!z2->booted))
> +		complete(&z2->boot_irq);
> +	else
> +		apple_z2_read_packet(z2);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, size_t cal_size, char *data)
> +{
> +	u16 len_words = (cal_size + 3) / 4;

I think this can be "round_up(cal_size, 4)".

> +	size_t hdr_size = sizeof(struct apple_z2_hbpp_blob_hdr);
> +	u32 checksum = 0;
> +	u16 checksum_hdr = 0;
> +	int i;
> +	struct apple_z2_hbpp_blob_hdr *hdr;
> +	int error;
> +
> +	hdr = (struct apple_z2_hbpp_blob_hdr *)data;
> +	hdr->cmd = cpu_to_le16(APPLE_Z2_HBPP_CMD_BLOB);
> +	hdr->len = cpu_to_le16(len_words);
> +	hdr->addr = cpu_to_le32(address);
> +
> +	for (i = 2; i < 8; i++)
> +		checksum_hdr += data[i];
> +
> +	hdr->checksum = cpu_to_le16(checksum_hdr);
> +	error = device_property_read_u8_array(&z2->spidev->dev, CAL_PROP_NAME,
> +					      data + hdr_size, cal_size);
> +	if (error)
> +		return error;
> +
> +	for (i = 0; i < cal_size; i++)
> +		checksum += data[i + hdr_size];
> +
> +	put_unaligned_le32(checksum, data + cal_size + hdr_size);
> +	return 0;
> +}
> +
> +static int apple_z2_send_firmware_blob(struct apple_z2 *z2, const char *data, u32 size, bool init)
> +{
> +	struct spi_message msg;
> +	struct spi_transfer blob_xfer, ack_xfer;
> +	int error;
> +
> +	z2->tx_buf[0] = 0x1a;
> +	z2->tx_buf[1] = 0xa1;
> +
> +	spi_message_init(&msg);
> +	memset(&blob_xfer, 0, sizeof(blob_xfer));
> +	memset(&ack_xfer, 0, sizeof(ack_xfer));
> +
> +	blob_xfer.tx_buf = data;
> +	blob_xfer.len = size;
> +	blob_xfer.bits_per_word = init ? 8 : 16;
> +	spi_message_add_tail(&blob_xfer, &msg);
> +
> +	ack_xfer.tx_buf = z2->tx_buf;
> +	ack_xfer.len = 2;
> +	spi_message_add_tail(&ack_xfer, &msg);
> +
> +	reinit_completion(&z2->boot_irq);
> +	error = spi_sync(z2->spidev, &msg);
> +	if (error)
> +		return error;
> +
> +	/* Irq only happens sometimes, but the thing boots reliably nonetheless */
> +	wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
> +
> +	return 0;
> +}
> +
> +static int apple_z2_upload_firmware(struct apple_z2 *z2)
> +{
> +	const struct apple_z2_fw_hdr *fw_hdr;
> +	size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
> +	int error;
> +	u32 load_cmd;
> +	u32 size;
> +	u32 address;
> +	char *data;
> +	bool init;
> +	size_t cal_size;
> +
> +	const struct firmware *fw __free(firmware) = NULL;
> +	error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);
> +	if (error) {
> +		dev_err(&z2->spidev->dev, "unable to load firmware\n");
> +		return error;
> +	}
> +
> +	fw_hdr = (const struct apple_z2_fw_hdr *)fw->data;
> +	if (le32_to_cpu(fw_hdr->magic) != APPLE_Z2_FW_MAGIC || le32_to_cpu(fw_hdr->version) != 1) {
> +		dev_err(&z2->spidev->dev, "invalid firmware header\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * This will interrupt the upload half-way if the file is malformed
> +	 * As the device has no non-volatile storage to corrupt, and gets reset
> +	 * on boot anyway, this is fine.
> +	 */
> +	while (fw_idx < fw->size) {
> +		if (fw->size - fw_idx < 8) {
> +			dev_err(&z2->spidev->dev, "firmware malformed\n");
> +			return -EINVAL;
> +		}
> +
> +		load_cmd = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
> +		fw_idx += sizeof(u32);
> +		if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
> +			size = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
> +			fw_idx += sizeof(u32);
> +			if (fw->size - fw_idx < size) {
> +				dev_err(&z2->spidev->dev, "firmware malformed\n");
> +				return -EINVAL;
> +			}
> +			init = load_cmd == LOAD_COMMAND_INIT_PAYLOAD;
> +			error = apple_z2_send_firmware_blob(z2, fw->data + fw_idx,
> +							    size, init);
> +			if (error)
> +				return error;
> +			fw_idx += size;
> +		} else if (load_cmd == LOAD_COMMAND_SEND_CALIBRATION) {
> +			address = le32_to_cpu(*(u32 *)(fw->data + fw_idx));
> +			fw_idx += sizeof(u32);
> +			cal_size = device_property_count_u8(&z2->spidev->dev, CAL_PROP_NAME);
> +			if (cal_size != 0) {
> +				size = cal_size + sizeof(struct apple_z2_hbpp_blob_hdr) + 4;
> +				data = kzalloc(size, GFP_KERNEL);
> +				error = apple_z2_build_cal_blob(z2, address, cal_size, data);
> +				if (!error)
> +					error = apple_z2_send_firmware_blob(z2, data, size, 16);

I assume "16" supposed to be "true".

Overall I find the logic a bit confusing here. Can you please see if the
patch at the bottom works for you?

> +				kfree(data);
> +				if (error)
> +					return error;
> +			}
> +		} else {
> +			dev_err(&z2->spidev->dev, "firmware malformed\n");
> +			return -EINVAL;
> +		}
> +		if (fw_idx % 4 != 0)
> +			fw_idx += 4 - (fw_idx % 4);

I think this is "round_up(fw_idx, 4)" as well.

> +	}
> +
> +
> +	z2->booted = true;
> +	apple_z2_read_packet(z2);
> +	return 0;
> +}
> +
> +static int apple_z2_boot(struct apple_z2 *z2)
> +{
> +	int timeout;
> +	int error;
> +
> +	reinit_completion(&z2->boot_irq);
> +	enable_irq(z2->spidev->irq);
> +	gpiod_set_value(z2->reset_gpio, 0);
> +	timeout = wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
> +	if (timeout == 0)
> +		return -ETIMEDOUT;

Shorter

	if (!wait_for_completion_timeout(&z2->boot_irq,
					 msecs_to_jiffies(20))
		return -ETIMEDOUT:

> +
> +	error = apple_z2_upload_firmware(z2);
> +	if (error) {
> +		gpiod_set_value(z2->reset_gpio, 1);
> +		disable_irq(z2->spidev->irq);

		return error;
> +	}
> +	return error;

	return 0;
> +}
> +
> +static int apple_z2_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct apple_z2 *z2;
> +	int error;
> +
> +	z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
> +	if (!z2)
> +		return -ENOMEM;
> +
> +	z2->tx_buf = devm_kzalloc(dev, sizeof(struct apple_z2_read_interrupt_cmd), GFP_KERNEL);
> +	/* 4096 will end up being rounded up to 8192 due to devres header */
> +	z2->rx_buf = devm_kzalloc(dev, 4000, GFP_KERNEL);
> +	if (!z2->tx_buf || !z2->rx_buf)
> +		return -ENOMEM;

Can we please check immediately after allocation instead of combining
the checks?

> +
> +	z2->spidev = spi;
> +	init_completion(&z2->boot_irq);
> +	spi_set_drvdata(spi, z2);
> +
> +	/* Reset the device on boot */
> +	z2->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(z2->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(z2->reset_gpio), "unable to get reset\n");
> +
> +	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
> +					  apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					  "apple-z2-irq", spi);
> +	if (error)
> +		return dev_err_probe(dev, error, "unable to request irq\n");
> +
> +	error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
> +	if (error)
> +		return dev_err_probe(dev, error, "unable to get firmware name\n");
> +
> +	z2->input_dev = devm_input_allocate_device(dev);
> +	if (!z2->input_dev)
> +		return -ENOMEM;
> +	z2->input_dev->name = (char *)spi_get_device_id(spi)->driver_data;
> +	z2->input_dev->phys = "apple_z2";

Phys is supposed to be unique, however my understanding there could be 2
devices in the system?

Thanks.

-- 
Dmitry

diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
index 4a5ea252961a..a1bd2f3147ab 100644
--- a/drivers/input/touchscreen/apple_z2.c
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -78,7 +78,8 @@ struct apple_z2_read_interrupt_cmd {
 	__le16 checksum;
 };
 
-static void apple_z2_parse_touches(struct apple_z2 *z2, char *msg, size_t msg_len)
+static void apple_z2_parse_touches(struct apple_z2 *z2,
+				   const u8 *msg, size_t msg_len)
 {
 	int i;
 	int nfingers;
@@ -101,8 +102,10 @@ static void apple_z2_parse_touches(struct apple_z2 *z2, char *msg, size_t msg_le
 		input_mt_slot(z2->input_dev, slot);
 		if (!input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid))
 			continue;
-		touchscreen_report_pos(z2->input_dev, &z2->props, le16_to_cpu(fingers[i].abs_x),
-				       le16_to_cpu(fingers[i].abs_y), true);
+		touchscreen_report_pos(z2->input_dev, &z2->props,
+				       le16_to_cpu(fingers[i].abs_x),
+				       le16_to_cpu(fingers[i].abs_y),
+				       true);
 		input_report_abs(z2->input_dev, ABS_MT_WIDTH_MAJOR,
 				 le16_to_cpu(fingers[i].tool_major));
 		input_report_abs(z2->input_dev, ABS_MT_WIDTH_MINOR,
@@ -163,38 +166,58 @@ static irqreturn_t apple_z2_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, size_t cal_size, char *data)
+/* Build calibration blob, caller is responsible for freeing the blob data. */
+static const u8* apple_z2_build_cal_blob(struct apple_z2 *z2,
+					 u32 address, size_t *size)
 {
-	u16 len_words = (cal_size + 3) / 4;
-	size_t hdr_size = sizeof(struct apple_z2_hbpp_blob_hdr);
-	u32 checksum = 0;
-	u16 checksum_hdr = 0;
+	u8 *cal_data;
+	int cal_size;
+	size_t blob_size;
+	u32 checksum;
+	u16 checksum_hdr;
 	int i;
 	struct apple_z2_hbpp_blob_hdr *hdr;
 	int error;
 
-	hdr = (struct apple_z2_hbpp_blob_hdr *)data;
+	if (!device_property_present(&z2->spidev->dev, CAL_PROP_NAME))
+		return NULL;
+
+	cal_size = device_property_count_u8(&z2->spidev->dev, CAL_PROP_NAME);
+	if (cal_size < 0)
+		return ERR_PTR(cal_size);
+
+	blob_size = sizeof(struct apple_z2_hbpp_blob_hdr) + cal_size + sizeof(__le32);
+	u8 *blob_data __free(kfree) = kzalloc(blob_size, GFP_KERNEL);
+	if (!blob_data)
+		return ERR_PTR(-ENOMEM);
+
+	hdr = (struct apple_z2_hbpp_blob_hdr *)blob_data;
 	hdr->cmd = cpu_to_le16(APPLE_Z2_HBPP_CMD_BLOB);
-	hdr->len = cpu_to_le16(len_words);
+	hdr->len = cpu_to_le16(round_up(cal_size, 4));
 	hdr->addr = cpu_to_le32(address);
 
+	checksum_hdr = 0;
 	for (i = 2; i < 8; i++)
-		checksum_hdr += data[i];
-
+		checksum_hdr += blob_data[i];
 	hdr->checksum = cpu_to_le16(checksum_hdr);
+
+	cal_data = blob_data + sizeof(struct apple_z2_hbpp_blob_hdr);
 	error = device_property_read_u8_array(&z2->spidev->dev, CAL_PROP_NAME,
-					      data + hdr_size, cal_size);
+					      cal_data, cal_size);
 	if (error)
-		return error;
+		return ERR_PTR(error);
 
+	checksum = 0;
 	for (i = 0; i < cal_size; i++)
-		checksum += data[i + hdr_size];
+		checksum += cal_data[i];
+	put_unaligned_le32(checksum, cal_data + cal_size);
 
-	put_unaligned_le32(checksum, data + cal_size + hdr_size);
-	return 0;
+	*size = blob_size;
+	return no_free_ptr(blob_data);
 }
 
-static int apple_z2_send_firmware_blob(struct apple_z2 *z2, const char *data, u32 size, bool init)
+static int apple_z2_send_firmware_blob(struct apple_z2 *z2, const u8 *data,
+				       u32 size, bool init)
 {
 	struct spi_message msg;
 	struct spi_transfer blob_xfer, ack_xfer;
@@ -233,11 +256,9 @@ static int apple_z2_upload_firmware(struct apple_z2 *z2)
 	size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
 	int error;
 	u32 load_cmd;
-	u32 size;
 	u32 address;
-	char *data;
 	bool init;
-	size_t cal_size;
+	size_t size;
 
 	const struct firmware *fw __free(firmware) = NULL;
 	error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);
@@ -263,10 +284,10 @@ static int apple_z2_upload_firmware(struct apple_z2 *z2)
 			return -EINVAL;
 		}
 
-		load_cmd = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
+		load_cmd = le32_to_cpup((__force __le32 *)(fw->data + fw_idx));
 		fw_idx += sizeof(u32);
 		if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
-			size = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
+			size = le32_to_cpup((__force __le32 *)(fw->data + fw_idx));
 			fw_idx += sizeof(u32);
 			if (fw->size - fw_idx < size) {
 				dev_err(&z2->spidev->dev, "firmware malformed");
@@ -279,16 +300,16 @@ static int apple_z2_upload_firmware(struct apple_z2 *z2)
 				return error;
 			fw_idx += size;
 		} else if (load_cmd == LOAD_COMMAND_SEND_CALIBRATION) {
-			address = le32_to_cpu(*(u32 *)(fw->data + fw_idx));
+			address = le32_to_cpup((__force __le32 *)(fw->data + fw_idx));
 			fw_idx += sizeof(u32);
-			cal_size = device_property_count_u8(&z2->spidev->dev, CAL_PROP_NAME);
-			if (cal_size != 0) {
-				size = cal_size + sizeof(struct apple_z2_hbpp_blob_hdr) + 4;
-				data = kzalloc(size, GFP_KERNEL);
-				error = apple_z2_build_cal_blob(z2, address, cal_size, data);
-				if (!error)
-					error = apple_z2_send_firmware_blob(z2, data, size, 16);
-				kfree(data);
+
+			const u8 *data __free(kfree) =
+				apple_z2_build_cal_blob(z2, address, &size);
+			if (IS_ERR(data))
+				return PTR_ERR(data);
+
+			if (data) {
+				error = apple_z2_send_firmware_blob(z2, data, size, true);
 				if (error)
 					return error;
 			}
@@ -296,8 +317,7 @@ static int apple_z2_upload_firmware(struct apple_z2 *z2)
 			dev_err(&z2->spidev->dev, "firmware malformed");
 			return -EINVAL;
 		}
-		if (fw_idx % 4 != 0)
-			fw_idx += 4 - (fw_idx % 4);
+		fw_idx = round_up(fw_idx, 4);
 	}
 
 


