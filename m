Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B53D66BAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 02:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6cFMA97wMCUPk4FMY/xe15A0vCYHHeAmrFxkhhEQC8=; b=u/D/fxIJczLZECTkpEPjaM4nqy
	BnfgPg5P+S8IRMR2NwY92dPTGBkRhyyrK8xyiy3qVXOcJpDtQ1xo7eIVGBcngxdrXGUgxpZhLFepe
	kUkbKQeuYA8xCp13N0clj13JyX7lUGsT2GpSpjuCOlrnTTuwg7uGVE+ijiXYwvnMWoJ5HGlulPTRN
	HNN6bvtgQVCBwLPf30Vyq0y84FUaW8t8QPwawlX/E5V/GrbkzAJdQvYnF+2j1C3TYRPJTVL42t3Nd
	lUQNKgolJJBXXoADiqfjvIEzy72K3qz9tZp8neFTB9Fa/osPwuf3177yFzZpfi/YRP1VcHj47bdvz
	1AivI0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG7hp-0000000C4PM-1TaR;
	Wed, 27 Nov 2024 02:23:05 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG7gr-0000000C4KV-2pIk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 02:22:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-724e6c53fe2so4152713b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 18:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732674124; x=1733278924; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6cFMA97wMCUPk4FMY/xe15A0vCYHHeAmrFxkhhEQC8=;
        b=CbYZmZqxM6eOXltC6RSbGEwKbJ/idMp9Uv4y/1FwiouRkZauLxX+hfycc7EgYsnAZh
         gLOsvFU+ZsyUC1BmGJpfebUPxJPHgCvE4XYizGOQBCrq+8Q88FyopI1XlBe/uJKMYokv
         xKmyAKffXi7/IPiSpgizSHj2esKWjQcEszXK+P+XoajtvSUb6i9ZoVusdJivWWkU14dJ
         qjTEjJM3lABUEcQX0Q8UZ7e2lltpGt6IJYgFqT9JqDBaMb3gnmzLM9toP6aEkDnO8YJE
         5rJBqGpCqFwCRW4uZJQwt6XjckRQQjCo/6G5PLht8usBdMxwh5UpDHQueglWQvhCouZA
         +6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732674124; x=1733278924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6cFMA97wMCUPk4FMY/xe15A0vCYHHeAmrFxkhhEQC8=;
        b=Ve8rKGv7V0UNsc5YcisMMAbYMEWCoOuXtFMPN98IyVbufzALkI6HNZSGlEAxN5L1tU
         YkBlSn8I4xuyxUAo1P5l5ggVqwwOLq71nE2RSOAcLUFM8RayZ8xx8MGwBBnEoPlKHVci
         BImLh5DsiryJsN1lrsUAjSy+QABVP+opJrlBbbrpUEvw2GiRamaOxtCD/Bhl3+/VB5Sl
         2UKFLixCv/3fQ0fAVc6BKIK+T0LAzd3D2RkBqj4olGSSXSTdj0B7RVaBfTjULM2+j9Ia
         fGe/hPU8rZ/3/8xAom19c7+cfaWE7Q0/FtCt2X63TlM4j7vi9JZh77QGnnS/iOoGaVax
         3D2g==
X-Forwarded-Encrypted: i=1; AJvYcCXgAv+M7WxDSy8vw8Cd6eBHAY3q1yzC3P9rq1JWkGWghlQr1Xy4mXQrFNCtN1h9JN77umX5pgsZ7pmBBt/ETYJ8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7cLTe768Bt1goMh5ru9oeOQIMqS1J1pgoZe4yMWKwlybuyAUb
	M6PxMiQyhfRcryEIP+8b6rdte8Fh28L9557tX8biVCtumiDAMI8u
X-Gm-Gg: ASbGncs8HtWFbWSFdwHqXhRkiensVEr6Ndh/dUzmnMHbi47ncOPfw+g/l82Ss5Hf/gF
	CF+AKy29eIvjtsvx3QmCAEaKpvqzww/2i+ayMmXzDsaMHRyHN/l8tBJnB0THNsRskMG+DKXsgpA
	X61wBwZVBCtkYNRwahhURqrE1G+2z7D0RdIkWPTAEGyq88ozY11b4jSotrm6foUsCnRmePtZJtL
	YhHLMZ0LalbQgGeLt0kTVUoDaYe/SOcs9Fmu+DeXvtApDUbt80=
X-Google-Smtp-Source: AGHT+IF7DB3GIhD4ucxQGS0qe6L7IpexwNdheNcQXCo5anRmV02PU8nV7KQt6qlPQNDAklrGZyIlgQ==
X-Received: by 2002:a05:6a00:b52:b0:71e:7174:3ae with SMTP id d2e1a72fcca58-7253004d67bmr1838422b3a.11.1732674124062;
        Tue, 26 Nov 2024 18:22:04 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de575d9asm9070855b3a.178.2024.11.26.18.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 18:22:03 -0800 (PST)
Date: Tue, 26 Nov 2024 18:22:00 -0800
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
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z0aCSBNEAJlgNIAI@google.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_182205_726293_C2A1C8C2 
X-CRM114-Status: GOOD (  39.35  )
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

On Tue, Nov 26, 2024 at 09:48:00PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/input/touchscreen/Kconfig    |  13 +
>  drivers/input/touchscreen/Makefile   |   1 +
>  drivers/input/touchscreen/apple_z2.c | 495 +++++++++++++++++++++++++++++++++++
>  3 files changed, 509 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 1ac26fc2e3eb94a4f62a49962c25ec853b567a43..4ad5002191f77a17414f9e1494b0afd6447355c0 100644
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
> index 0000000000000000000000000000000000000000..9f57708b3d1749bf23db6132d25cbb47fd622a9f
> --- /dev/null
> +++ b/drivers/input/touchscreen/apple_z2.c
> @@ -0,0 +1,495 @@
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
> +
> +struct apple_z2 {
> +	struct spi_device *spidev;
> +	struct gpio_desc *cs_gpio;
> +	struct gpio_desc *reset_gpio;
> +	struct input_dev *input_dev;
> +	struct completion boot_irq;
> +	int booted;
> +	int open;
> +	int counter;
> +	int y_size;
> +	const char *fw_name;
> +	const char *cal_blob;
> +	int cal_size;
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
> +	u16 cmd;
> +	u16 len;
> +	u32 addr;
> +	u16 checksum;

Does this need endianness annotation? It is being sent to the device...

> +} __packed;
> +
> +struct apple_z2_fw_hdr {
> +	u32 magic;
> +	u32 version;
> +} __packed;
> +
> +struct apple_z2_read_interrupt_cmd {
> +	u8 cmd;
> +	u8 counter;
> +	u8 unused[12];
> +	__le16 checksum;
> +} __packed;

Do these need to be packed? They seem to be naturally aligned.

> +
> +static void apple_z2_parse_touches(struct apple_z2 *z2, char *msg, size_t msg_len)
> +{
> +	int i;
> +	int nfingers;
> +	int slot;
> +	int slot_valid;
> +	struct apple_z2_finger *fingers;
> +
> +	if (!z2->open)
> +		return;

I do not think you need to check this condition (and need to track
whether the device is open or closed). The input core will not be
delivering events for a closed device even if you try sending them.

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
> +		input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid);
> +		if (!slot_valid)
> +			continue;

Shorter form:

		if (!input_mt_report_slot_state(...))
			continue;

> +		input_report_abs(z2->input_dev, ABS_MT_POSITION_X,
> +				 le16_to_cpu(fingers[i].abs_x));
> +		input_report_abs(z2->input_dev, ABS_MT_POSITION_Y,
> +				 z2->y_size - le16_to_cpu(fingers[i].abs_y));
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
> +static int apple_z2_spi_sync(struct apple_z2 *z2, struct spi_message *msg)
> +{
> +	int error;
> +
> +	if (z2->cs_gpio)
> +		gpiod_direction_output(z2->cs_gpio, 0);
> +
> +	error = spi_sync(z2->spidev, msg);
> +
> +	if (z2->cs_gpio)
> +		gpiod_direction_output(z2->cs_gpio, 1);

As I mentioned the CS quirk needs to be at the SPI controller level.

> +
> +	return error;
> +}
> +
> +static int apple_z2_read_packet(struct apple_z2 *z2)
> +{
> +	struct spi_message msg;
> +	struct spi_transfer xfer;
> +	struct apple_z2_read_interrupt_cmd len_cmd;
> +	char len_rx[16];
> +	size_t pkt_len;
> +	char *pkt_rx;
> +	int error;
> +
> +	spi_message_init(&msg);
> +	memset(&xfer, 0, sizeof(xfer));
> +	memset(&len_cmd, 0, sizeof(len_cmd));
> +
> +	len_cmd.cmd = APPLE_Z2_CMD_READ_INTERRUPT_DATA;
> +	len_cmd.counter = z2->counter + 1;
> +	len_cmd.checksum = cpu_to_le16(APPLE_Z2_CMD_READ_INTERRUPT_DATA + 1 + z2->counter);
> +	z2->counter = 1 - z2->counter;
> +	xfer.tx_buf = &len_cmd;
> +	xfer.rx_buf = len_rx;
> +	xfer.len = sizeof(len_cmd);
> +
> +	spi_message_add_tail(&xfer, &msg);
> +	error = apple_z2_spi_sync(z2, &msg);
> +	if (error)
> +		return error;
> +
> +	pkt_len = (get_unaligned_le16(len_rx + 1) + 8) & (-4);
> +	pkt_rx = kzalloc(pkt_len, GFP_KERNEL);

Please use __free(kfree) cleanup for temp allocations.

> +	if (!pkt_rx)
> +		return -ENOMEM;
> +
> +	spi_message_init(&msg);
> +	memset(&xfer, 0, sizeof(xfer));
> +	xfer.rx_buf = pkt_rx;
> +	xfer.len = pkt_len;
> +
> +	spi_message_add_tail(&xfer, &msg);
> +	error = apple_z2_spi_sync(z2, &msg);
> +
> +	if (!error)
> +		apple_z2_parse_touches(z2, pkt_rx + 5, pkt_len - 5);
> +
> +	kfree(pkt_rx);
> +	return error;
> +}
> +
> +static irqreturn_t apple_z2_irq(int irq, void *data)
> +{
> +	struct spi_device *spi = data;
> +	struct apple_z2 *z2 = spi_get_drvdata(spi);
> +
> +	if (!z2->booted)

unlikely()?

> +		complete(&z2->boot_irq);
> +	else
> +		apple_z2_read_packet(z2);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, char *data)
> +{
> +	u16 len_words = (z2->cal_size + 3) / 4;
> +	u32 checksum = 0;
> +	u16 checksum_hdr = 0;
> +	int i;
> +	struct apple_z2_hbpp_blob_hdr *hdr;
> +
> +	hdr = (struct apple_z2_hbpp_blob_hdr *)data;
> +	hdr->cmd = APPLE_Z2_HBPP_CMD_BLOB;
> +	hdr->len = len_words;
> +	hdr->addr = address;
> +
> +	for (i = 2; i < 8; i++)
> +		checksum_hdr += data[i];
> +
> +	hdr->checksum = checksum_hdr;
> +	memcpy(data + 10, z2->cal_blob, z2->cal_size);
> +
> +	for (i = 0; i < z2->cal_size; i++)
> +		checksum += z2->cal_blob[i];
> +
> +	*(u32 *)(data + z2->cal_size + 10) = checksum;

Endianness? cpu_to_Xe32() or put_unaligned_Xe32().

> +}
> +
> +static int apple_z2_send_firmware_blob(struct apple_z2 *z2, const char *data, u32 size, u8 bpw)
> +{
> +	struct spi_message msg;
> +	struct spi_transfer blob_xfer, ack_xfer;
> +	char int_ack[] = {0x1a, 0xa1};
> +	char ack_rsp[] = {0, 0};
> +	int error;
> +
> +	spi_message_init(&msg);
> +	memset(&blob_xfer, 0, sizeof(blob_xfer));
> +	memset(&ack_xfer, 0, sizeof(ack_xfer));
> +
> +	blob_xfer.tx_buf = data;
> +	blob_xfer.len = size;
> +	blob_xfer.bits_per_word = bpw;
> +	spi_message_add_tail(&blob_xfer, &msg);
> +
> +	ack_xfer.tx_buf = int_ack;
> +	ack_xfer.rx_buf = ack_rsp;

I think these buffers need to be DMA-safe.

> +	ack_xfer.len = 2;
> +	spi_message_add_tail(&ack_xfer, &msg);
> +
> +	reinit_completion(&z2->boot_irq);
> +	error = apple_z2_spi_sync(z2, &msg);
> +	if (error)
> +		return error;
> +	wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
> +	return 0;
> +}
> +
> +static int apple_z2_upload_firmware(struct apple_z2 *z2)
> +{
> +	const struct firmware *fw;
> +	struct apple_z2_fw_hdr *fw_hdr;
> +	size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
> +	int error;
> +	u32 load_cmd;
> +	u32 size;
> +	u32 address;
> +	char *data;
> +	u8 bits_per_word;
> +
> +	error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);

Please use __free(firmware) annotation.

> +	if (error) {
> +		dev_err(&z2->spidev->dev, "unable to load firmware");
> +		return error;
> +	}
> +
> +	fw_hdr = (struct apple_z2_fw_hdr *)fw->data;
> +	if (fw_hdr->magic != APPLE_Z2_FW_MAGIC || fw_hdr->version != 1) {
> +		dev_err(&z2->spidev->dev, "invalid firmware header");
> +		return -EINVAL;
> +	}
> +
> +	while (fw_idx < fw->size) {
> +		if (fw->size - fw_idx < 8) {
> +			dev_err(&z2->spidev->dev, "firmware malformed");

Maybe check this before uploading half of it?

> +			error = -EINVAL;
> +			goto error;
> +		}
> +
> +		load_cmd = *(u32 *)(fw->data + fw_idx);

Please review endianness handling of firmware upload.

> +		fw_idx += 4;
> +		if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
> +			size = *(u32 *)(fw->data + fw_idx);
> +			fw_idx += 4;
> +			if (fw->size - fw_idx < size) {
> +				dev_err(&z2->spidev->dev, "firmware malformed");
> +				error = -EINVAL;
> +				goto error;
> +			}
> +			bits_per_word = load_cmd == LOAD_COMMAND_SEND_BLOB ? 16 : 8;
> +			error = apple_z2_send_firmware_blob(z2, fw->data + fw_idx,
> +							    size, bits_per_word);
> +			if (error)
> +				goto error;
> +			fw_idx += size;
> +		} else if (load_cmd == 2) {
> +			address = *(u32 *)(fw->data + fw_idx);
> +			fw_idx += 4;
> +			if (z2->cal_size != 0) {
> +				size = z2->cal_size + sizeof(struct apple_z2_hbpp_blob_hdr) + 4;
> +				data = kzalloc(size, GFP_KERNEL);
> +				apple_z2_build_cal_blob(z2, address, data);
> +				error = apple_z2_send_firmware_blob(z2, data, size, 16);
> +				kfree(data);
> +				if (error)
> +					goto error;
> +			}
> +		} else {
> +			dev_err(&z2->spidev->dev, "firmware malformed");
> +			error = -EINVAL;
> +			goto error;
> +		}
> +		if (fw_idx % 4 != 0)
> +			fw_idx += 4 - (fw_idx % 4);
> +	}
> +
> +
> +	z2->booted = 1;
> +	apple_z2_read_packet(z2);
> + error:
> +	release_firmware(fw);
> +	return error;
> +}
> +
> +static int apple_z2_boot(struct apple_z2 *z2)
> +{
> +	int timeout;
> +
> +	enable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 0);
> +	timeout = wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
> +	if (timeout == 0)
> +		return -ETIMEDOUT;
> +	return apple_z2_upload_firmware(z2);
> +}
> +
> +static int apple_z2_open(struct input_dev *dev)
> +{
> +	struct apple_z2 *z2 = input_get_drvdata(dev);
> +	int error;
> +
> +	/* Reset the device on boot */
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	usleep_range(5000, 10000);
> +	error = apple_z2_boot(z2);

Why can't we wait for the boot in probe()? We can mark the driver as
preferring asynchronous probe to not delay the overall boot process.

> +	if (error) {
> +		gpiod_direction_output(z2->reset_gpio, 1);
> +		disable_irq(z2->spidev->irq);
> +	} else
> +		z2->open = 1;
> +	return error;
> +}
> +
> +static void apple_z2_close(struct input_dev *dev)
> +{
> +	struct apple_z2 *z2 = input_get_drvdata(dev);
> +
> +	disable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	z2->open = 0;
> +	z2->booted = 0;
> +}
> +
> +static int apple_z2_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct apple_z2 *z2;
> +	int error;
> +	const char *label;
> +	struct touchscreen_properties props;
> +
> +	z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
> +	if (!z2)
> +		return -ENOMEM;
> +
> +	z2->spidev = spi;
> +	init_completion(&z2->boot_irq);
> +	spi_set_drvdata(spi, z2);
> +
> +	z2->cs_gpio = devm_gpiod_get_index(dev, "cs", 0, 0);
> +	if (IS_ERR(z2->cs_gpio)) {
> +		if (PTR_ERR(z2->cs_gpio) != -ENOENT) {
> +			dev_err(dev, "unable to get cs");
> +			return PTR_ERR(z2->cs_gpio);
> +		}
> +		z2->cs_gpio = NULL;
> +	}
> +
> +	z2->reset_gpio = devm_gpiod_get_index(dev, "reset", 0, 0);
> +	if (IS_ERR(z2->reset_gpio)) {
> +		dev_err(dev, "unable to get reset");
> +		return PTR_ERR(z2->reset_gpio);
> +	}
> +
> +	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
> +					apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					"apple-z2-irq", spi);
> +	if (error < 0) {
> +		dev_err(dev, "unable to request irq");
> +		return z2->spidev->irq;
> +	}
> +
> +	error = device_property_read_string(dev, "label", &label);
> +	if (error) {
> +		dev_err(dev, "unable to get device name");
> +		return error;
> +	}
> +
> +	error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
> +	if (error) {
> +		dev_err(dev, "unable to get firmware name");
> +		return error;
> +	}
> +
> +	z2->cal_blob = of_get_property(dev->of_node, "apple,z2-cal-blob", &z2->cal_size);

I would prefer if we used generic device property API instead of
OF-specific one. I know we do not have direct replacement of
of_get_property(), but we need to make a copy anyway, so we can use
device_property_read_u8_array() when we build calibration blob instead
of doing it at probe time.

> +	if (!z2->cal_blob) {
> +		dev_warn(dev, "unable to get calibration, precision may be degraded");
> +		z2->cal_size = 0;
> +	}
> +
> +	z2->input_dev = devm_input_allocate_device(dev);
> +	if (!z2->input_dev)
> +		return -ENOMEM;
> +	z2->input_dev->name = label;
> +	z2->input_dev->phys = "apple_z2";
> +	z2->input_dev->dev.parent = dev;

Not needed because of devm_input_allocate_device(), please drop.

> +	z2->input_dev->id.bustype = BUS_SPI;
> +	z2->input_dev->open = apple_z2_open;
> +	z2->input_dev->close = apple_z2_close;
> +
> +	/* Allocate the axes before setting from DT */
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
> +	touchscreen_parse_properties(z2->input_dev, true, &props);
> +	z2->y_size = props.max_y;

You can use input_abs_get_max() to get max coordinate, no need to store
it separately. OTOH you should use touchscreen_report_pos() and use
device property to indicate that the axis is inverted.

> +	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
> +	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
> +	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MINOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_ORIENTATION, -32768, 32767, 0, 0);
> +
> +	input_set_drvdata(z2->input_dev, z2);
> +
> +	error = input_mt_init_slots(z2->input_dev, 256, INPUT_MT_DIRECT);
> +	if (error < 0) {

	if (error) {

> +		dev_err(dev, "unable to initialize multitouch slots");
> +		return error;
> +	}
> +
> +	error = input_register_device(z2->input_dev);
> +	if (error < 0)

	if (error) {

> +		dev_err(dev, "unable to register input device");

		return error;
	}

> +
> +	return error;

	return 0;

> +}
> +
> +static const struct of_device_id apple_z2_of_match[] = {
> +	{ .compatible = "apple,z2-multitouch" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, apple_z2_of_match);
> +
> +static struct spi_device_id apple_z2_of_id[] = {
> +	{ .name = "j293-touchbar" },
> +	{ .name = "j493-touchbar" },
> +	{ .name = "z2-touchbar" },

Why do you need these extra IDs?

> +	{ .name = "z2-multitouch" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, apple_z2_of_id);
> +
> +static struct spi_driver apple_z2_driver = {
> +	.driver = {
> +		.name	= "apple-z2",
> +		.owner = THIS_MODULE,

This is no longer needed, module_spi_driver() will take care of setting
this.

> +		.of_match_table = of_match_ptr(apple_z2_of_match),
> +	},
> +	.id_table       = apple_z2_of_id,
> +	.probe		= apple_z2_probe,
> +};
> +
> +module_spi_driver(apple_z2_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_FIRMWARE("apple/dfrmtfw-*.bin");
> 
> -- 
> 2.47.1
> 
> 

Thanks.

-- 
Dmitry

