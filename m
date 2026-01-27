Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3654FD2D8DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/lKgEYg6bpWqqJ6YLjWkTk+fez50N6AhBdNhJubuDM=; b=JlX2ypueXvIVj7Gqgu8UCVtQdw
	JDdswjDmUdDrvtItgu1fdJI+NL/jOsuyJint7RdruGPrNYTXhKvkkbQiUC3DZfYHbCQCcaSkWrWJK
	C/l4JdzfKAA/K6hnw/OUuPDGqo6gHdGYibeo2yVmVdO+DUtNTqNJcoagNmm/cdv/UasXov1hUkHIB
	xB6WE6OEP1NITVs/ninll3fLztrgcXUSgvk0nO7RoRYHgWdS/CYhCn6bHo6xwsEoEx6VVR//+R+rQ
	VU9wO8lZcs0ZbC9VP6KN+8vRbU4gkDnaFD5IQ4QoTpDloNxYHEMXdajySFw7JhEv0eOcErMCYQGPD
	VHvPzbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfjH-0000000DzqJ-3vPY;
	Tue, 27 Jan 2026 09:51:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfjG-0000000Dzq1-10SC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:51:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 532ED60171
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A725C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507481;
	bh=FGhVpDtMVZVm3tb6KxliGgMLN0Evi2bHotKWpU75YQM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=TTTTZgsPRIOHFQSKDpAGDG4oaplDbO1l8xdmHLXajWLKrZQEa9BjEb3uyc/wlTV/7
	 GrzuwR8nXJIt/kC0eOK6mcrKqyucgNbT/xJGEW6MtSN921jFTFXLesgOkm9qDpoVrX
	 gw/MzXKa8sr5VlmVP1Blyu4YVruLkgasNVjOiE3Y8fbh3JCaVL2rvUgzwRsDlPJw9F
	 9YdSmsYRrPARFg2/JE/GYXytu1Nk5wmpm4+eBzHacPohrZjUzQxldLf+mKmkoc0nYM
	 rVivhUGF11aDcZdRdsJtTeuZl9Z3DVvlXOBpzD/CM0tnhV8pQ+Ykuc6CZjVWOVmV3K
	 jgD12cdVMSubw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dd263bf42so6003445e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:51:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdmWByZlCIAKPbxMNBCjye2QbdA/qjlH33DT6Ut799lxTsxtyTqGsmDHzd7oIBwgibsjwXFD0R5yUFKitMC4Xs@lists.infradead.org
X-Gm-Message-State: AOJu0YybCh8qaocV82fj/1Il8tgyXYlyyKNH/Rw/52xigu6P68BQGOVa
	MpDHD5RP/qvJ3+3PwSXls9vtg0ZlLXZlj0LLKHzw/S+63okzRzhk019coUFDIytamAHsRqtDYmV
	TOdaPZtFlL79gN9Dml5ejlV6mCYrkkfAKBSHyYlSutA==
X-Received: by 2002:a05:6512:124e:b0:59d:cda0:8b70 with SMTP id
 2adb3069b0e04-59e0412dcb0mr548455e87.52.1769507479645; Tue, 27 Jan 2026
 01:51:19 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:51:17 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:51:17 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-3-9f4c00bfb5cb@bootlin.com>
MIME-Version: 1.0
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com> <20260123-dev-b4-aaeon-mcu-driver-v2-3-9f4c00bfb5cb@bootlin.com>
Date: Tue, 27 Jan 2026 01:51:17 -0800
X-Gmail-Original-Message-ID: <CAMRc=McYKZ8TY9wAhZ3sZtYRNJhoh2VfQ+6FA=+VRwstpWQOHg@mail.gmail.com>
X-Gm-Features: AZwV_QhnJ3-HaFivIkkQZJQTm3GV_7xh9A9lzaVebFHWLuaiyt9Faz2iUZq47wY
Message-ID: <CAMRc=McYKZ8TY9wAhZ3sZtYRNJhoh2VfQ+6FA=+VRwstpWQOHg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mfd: aaeon: Add SRG-IMX8PL MCU driver
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 23 Jan 2026 10:54:32 +0100, "Thomas Perrot (Schneider
Electric)" <thomas.perrot@bootlin.com> said:
> Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8PL
> embedded controller. This driver provides the core I2C communication
> interface and registers child devices (GPIO and watchdog controllers).
>
> The MCU firmware version is queried during probe and logged for
> diagnostic purposes. All I2C transactions are serialized using a mutex
> to ensure proper communication with the microcontroller.
>
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>
> ---

[snip]

 +++ b/drivers/mfd/aaeon-mcu.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU driver
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.co=
m>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/mfd/core.h>
> +#include <linux/platform_device.h>
> +
> +#define AAEON_MCU_FW_VERSION	0x76
> +
> +static struct mfd_cell aaeon_mcu_devs[] =3D {

Can be const.

> +	{
> +		.name =3D "aaeon-mcu-wdt",
> +	},
> +	{
> +		.name =3D "aaeon-mcu-gpio",
> +	},
> +};
> +
> +static int aaeon_mcu_read_version(struct device *dev, u8 index, u8 *vers=
ion)
> +{
> +	u8 cmd[3] =3D { AAEON_MCU_FW_VERSION, index, 0x00 };
> +
> +	return aaeon_mcu_i2c_xfer(dev, cmd, sizeof(cmd), version, sizeof(*versi=
on));
> +}
> +
> +static int aaeon_mcu_print_fw_version(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	u8 major, minor;
> +	int ret;
> +
> +	ret =3D aaeon_mcu_read_version(dev, 0x00, &major);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D aaeon_mcu_read_version(dev, 0x01, &minor);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "firmware version: v%d.%d\n", major, minor);

I would drop this entirely or demote it to dev_dbg(), there's no reason for
a successfully probed device to yell about it.

> +
> +	return 0;
> +}
> +
> +int aaeon_mcu_i2c_xfer(struct device *dev,
> +		       const u8 *cmd, int cmd_len,
> +		       u8 *rsp, int rsp_len)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct aaeon_mcu_dev *mcu =3D i2c_get_clientdata(client);
> +	int ret;
> +
> +	mutex_lock(&mcu->i2c_lock);
> +
> +	ret =3D i2c_master_send(client, cmd, cmd_len);
> +	if (ret < 0)
> +		goto unlock;
> +
> +	ret =3D i2c_master_recv(client, rsp, rsp_len);
> +	if (ret < 0)
> +		goto unlock;
> +
> +	if (ret !=3D rsp_len) {
> +		dev_err(dev,
> +			"i2c recv count error (expected: %d, actual: %d)\n",
> +			rsp_len, ret);
> +		ret =3D -EIO;
> +		goto unlock;
> +	}
> +
> +	ret =3D 0;
> +
> +unlock:

Just use guard(mutex) from cleanup.h and drop the label.

> +	mutex_unlock(&mcu->i2c_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(aaeon_mcu_i2c_xfer);
> +
> +static int aaeon_mcu_probe(struct i2c_client *client)
> +{
> +	struct aaeon_mcu_dev *mcu;
> +	int ret;
> +
> +	mcu =3D devm_kzalloc(&client->dev, sizeof(*mcu), GFP_KERNEL);
> +	if (!mcu)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, mcu);
> +	mcu->dev =3D &client->dev;
> +	mutex_init(&mcu->i2c_lock);

For lock debugging purposes it's better to destroy the mutex too. Or use
devm_mutex_init().

> +
> +	ret =3D aaeon_mcu_print_fw_version(client);
> +	if (ret) {
> +		dev_err(&client->dev, "unable to read firmware version\n");
> +		return ret;
> +	}
> +
> +	return devm_mfd_add_devices(mcu->dev, PLATFORM_DEVID_NONE, aaeon_mcu_de=
vs,
> +				    ARRAY_SIZE(aaeon_mcu_devs), NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id aaeon_mcu_of_match[] =3D {
> +	{ .compatible =3D "aaeon,srg-imx8pl-mcu" },
> +	{},
> +};
> +

Unneeded newline.

> +MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
> +
> +static struct i2c_driver aaeon_mcu_driver =3D {
> +	.driver =3D {
> +		.name =3D "aaeon_mcu",
> +		.of_match_table =3D aaeon_mcu_of_match,
> +	},
> +	.probe =3D aaeon_mcu_probe,
> +};
> +

Same here.

> +module_i2c_driver(aaeon_mcu_driver);
> +
> +MODULE_DESCRIPTION("Aaeon MCU Driver");
> +MODULE_AUTHOR("J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootli=
n.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.=
h
> new file mode 100644
> index 0000000000000000000000000000000000000000..c9dc7a9adbc86c489f03a550e=
7776d3b1da4e7b2
> --- /dev/null
> +++ b/include/linux/mfd/aaeon-mcu.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Aaeon MCU driver definitions
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.co=
m>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#ifndef __LINUX_MFD_AAEON_MCU_H
> +#define __LINUX_MFD_AAEON_MCU_H
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct aaeon_mcu_dev - Internal representation of the Aaeon MCU
> + * @dev: Pointer to kernel device structure
> + * @i2c_lock: Mutex to serialize I2C bus access
> + */
> +

Kerneldocs should be attached to the struct they describe. But...

> +struct aaeon_mcu_dev {
> +	struct device *dev;
> +	struct mutex i2c_lock;
> +};

... you don't seem to need to export this structure. You don't use it at al=
l
in the subsequent GPIO patch.

> +
> +int aaeon_mcu_i2c_xfer(struct device *dev,
> +		       const u8 *cmd, int cmd_len,
> +		       u8 *rsp, int rsp_len);
> +
> +#endif /*  __LINUX_MFD_AAEON_MCU_H */
>
> --
> 2.52.0
>
>

Bart

