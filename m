Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB19D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BaR3k+5zrCCB1XIcd8osL/EF92HXoyzBz26/MVuE/I=; b=OraK6tYAwE3vZ7zzbqw8gGX2wQ
	wLaunZ6VJDInenN/MixxWAYcqNcBSSf6SL+begchHVWmNHZlhN8zAzd5t28+pRlx5RDyVhgr2I28O
	I3aqKrCaYY+qarm8MOJgZ/z8aG+z7+DkGg7DE/uz50kRq3hvAGqCx84IILXBtKFaYfeHU6K9VJUGa
	zvcIgu2IEM8FiV9y8HueNIEWCWwPHMk9q0bpbk1ks7BKmpB2xQmWp4aEaM3ROEvHpdHGUWor8QWjn
	1T/iFhfGwWDaSv4AfO5+IGjAUqcxBlB8dzmU9AD6nA8muy770WMLB3H9zAyaggx+dWV5CMnS/7jH0
	nCRJ7hxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgJ9-0000000Dq98-0Zmv;
	Mon, 22 Dec 2025 13:50:43 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgJ6-0000000Dq8n-3YgA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 13:50:42 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so3946964b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 05:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766411439; x=1767016239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8BaR3k+5zrCCB1XIcd8osL/EF92HXoyzBz26/MVuE/I=;
        b=CI6Fm6bWtJejf5ma78eVF1ktbafaBG/6eqXnckpu/jw8aBeSw+3xVK+/tNZAntX+Qz
         7WFIyziBef2QbXs4QJOBe2eZxfo5IxfL0s44tD4nt+PWrCUwy33Ev/3SMh/D5eV5nBZZ
         Ty9WTQc/rRiCf0QZOcadd+7A54eYNAKHZhMSeazgODgageIQ78yYNXZJV8GlLwsL/xRz
         df6GWEtXd0Kr+FWIlbRaca91ghk6XPsXkMJYdTWdL6QtBbBWzphtV0SApMwBSqf9ejKX
         wHM/qJdY5LuVii8GaBdwvAfs9afGc7cEaYu9IblNASZ42SwDFE23eIXz6NmInJ49KR3A
         kdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766411439; x=1767016239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BaR3k+5zrCCB1XIcd8osL/EF92HXoyzBz26/MVuE/I=;
        b=xStMn6pOIMtcIVT/oZEzDQFgYGaYcTP4R8c1jF2501uRY1mrt3EmhQAC4gaNZltKSS
         QsLsKUyDL2QhvZ8M5L4yVl/Iyi0ittKpPrn1LYd9UGBIs1zgJ6GJ14sRMjW6UctNaNR2
         Iuv88oziH252T5DocafgYRUxdMM/WOzHnvj/Ix+dpeeG0ZSaSZCGmDZAQlC0IvC0dQk6
         X2mdVcTL+xqK52ayXTRhsY0Qk0dW654olQ26KMGzCwvdXBe11FGAbcpE4KHAHU32pouB
         MsaO5ewBMAgC+NhzeZMjYOcKKKuYkzjXI+KOTgTcRmo7u/xQnCzEJ21ui1XfuMri5wXq
         0msg==
X-Forwarded-Encrypted: i=1; AJvYcCUkYuTuZIAghXRCwZqCYEEJAORNbW9I7I4/YXGQ9w4WIPo3GJQRs/mxN59aO2EL4Zs0gPtODu1VKTqvsZxSDTpK@lists.infradead.org
X-Gm-Message-State: AOJu0YzgEYOm6eCCxVhCdx5uhCm2IGDwqOSYhlzyjGx29SELpEucQev9
	UUpr4YgpdQBiY5rGuoStzsyjdoL0vDQwTxfGvgJsVavCrCKmlxePeVJC
X-Gm-Gg: AY/fxX4uth4hlcoPRqk0BkCJtLmZiMSKCZ1n7OWsGOPM8dcaZN6HjaghtlbTeueTdoM
	rPm99xLZGNEI9aeWMYvOFe4IdGwFw7uZRjw59QRMML2QZSaWZ7yEm33K6G+fNYjugl1COBOlPeG
	0fpbp6K8vNrCeHceXnCyXW4iMznl3T3gMWyzvqj7M706wlux9wmpF49abd44FHI2IKF7Ii5l/XB
	mjWqEpyiDdk61V4+MQMMwhLneQ0M4yxwzTtIZn7eYoGLMO3SAwDF7tAl56dlsN/tf+TEdLElEge
	mqL6Sq1Sz+b12VVOvluWh2cuyAHcm0Yvitu/1Xj2Qwo0clYEutj9j96o8Vh0I21ev4cU4r21YSJ
	UAtSbGcNjLw8u/tOpw0gtgNqZT26Y0yz0zVQTyk0HV+alYjilThR51DU15Fj9GdHUnaWtk8pTds
	dqDk5350w8GYDiBbBIqBo1N/EsAwui
X-Google-Smtp-Source: AGHT+IEyXSAJPi4cc8ok6Aq+xnI2o3obyF+3x23oU5Ir+vtxQzV06aOtv7kzKDFrV13w830o83jyfg==
X-Received: by 2002:aa7:930b:0:b0:7e8:450c:61b8 with SMTP id d2e1a72fcca58-7ff6607e842mr10207742b3a.40.1766411439404;
        Mon, 22 Dec 2025 05:50:39 -0800 (PST)
Received: from [192.168.1.115] ([59.188.211.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm10542320b3a.50.2025.12.22.05.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:50:38 -0800 (PST)
Message-ID: <aa4242f9-7d26-4df5-9e14-1b3bb7334652@gmail.com>
Date: Mon, 22 Dec 2025 21:50:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] input: macsmc-input: New driver to handle the
 Apple Mac SMC buttons/lid
To: James Calligeros <jcalligeros99@gmail.com>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-8-728e4b91fe81@gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-8-728e4b91fe81@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_055040_928650_480CF0D7 
X-CRM114-Status: GOOD (  39.89  )
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



Hi,
On 12/11/2025 19:16, James Calligeros wrote:

> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements power button and lid switch support for Apple Mac
> devices using SMC controllers driven by the macsmc driver.
> 
> In addition to basic input support, this also responds to the final
> shutdown warning (when the power button is held down long enough) by
> doing an emergency kernel poweroff. This allows the NVMe controller to
> be cleanly shut down, which prevents data loss for in-cache data.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/input/misc/Kconfig        |  11 ++
>  drivers/input/misc/Makefile       |   1 +
>  drivers/input/misc/macsmc-input.c | 207 +++++++++++++++++++++++++
>  4 files changed, 220 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb55a167699e..48bdca6943f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2455,6 +2455,7 @@ F:	drivers/hwmon/macsmc-hwmon.c
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> +F:	drivers/input/misc/macsmc-input.c
>  F:	drivers/input/touchscreen/apple_z2.c
>  F:	drivers/iommu/apple-dart.c
>  F:	drivers/iommu/io-pgtable-dart.c
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index cc2558630797..1144ba151dbf 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -992,4 +992,15 @@ config INPUT_STPMIC1_ONKEY
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called stpmic1_onkey.
>  
> +config INPUT_MACSMC
> +	tristate "Apple Mac SMC lid/buttons"
> +	depends on MFD_MACSMC
> +	help
> +	  Say Y here if you want to use the input events delivered via the
> +	  SMC controller on Apple Mac machines using the macsmc driver.
> +	  This includes lid open/close and the power button.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called macsmc-input.
> +
>  endif
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index f5ebfa9d9983..c6394105252f 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -52,6 +52,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
>  obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
>  obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
>  obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
> +obj-$(CONFIG_INPUT_MACSMC_INPUT)	+= macsmc-input.o
should be CONFIG_INPUT_MACSMC (alternatively change Kconfig instead)

>  obj-$(CONFIG_INPUT_MAX7360_ROTARY)	+= max7360-rotary.o
>  obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
>  obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
> diff --git a/drivers/input/misc/macsmc-input.c b/drivers/input/misc/macsmc-input.c
> new file mode 100644
> index 000000000000..f4598e65fc80
> --- /dev/null
> +++ b/drivers/input/misc/macsmc-input.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC input event driver
> + * Copyright The Asahi Linux Contributors
> + *
> + * This driver exposes certain events from the SMC as an input device.
> + * This includes the lid open/close and power button notifications.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/mfd/macsmc.h>
Missing #include <linux/mfd/core.h>

> +#include <linux/module.h>
> +#include <linux/reboot.h>
> +
> +/**
> + * struct macsmc_input
> + * @dev: Underlying struct device for the input sub-device
> + * @smc: Pointer to apple_smc struct of the mfd parent
> + * @input: Allocated input_dev; devres managed
> + * @nb: Notifier block used for incoming events from SMC (e.g. button pressed down)
> + * @wakeup_mode: Set to true when system is suspended and power button events should wake it
> + */
> +struct macsmc_input {
> +	struct device *dev;
> +	struct apple_smc *smc;
> +	struct input_dev *input;
> +	struct notifier_block nb;
> +	bool wakeup_mode;
> +};
> +
> +#define SMC_EV_BTN 0x7201
> +#define SMC_EV_LID 0x7203
> +
> +#define BTN_POWER		0x01 /* power button on e.g. Mac Mini chasis pressed */
> +#define BTN_TOUCHID		0x06 /* combined TouchID / power button on MacBooks pressed */
> +#define BTN_POWER_HELD_SHORT	0xfe /* power button briefly held down */
> +#define BTN_POWER_HELD_LONG	0x00 /* power button held down; sent just before forced poweroff */
> +
> +static void macsmc_input_event_button(struct macsmc_input *smcin, unsigned long event)
> +{
> +	u8 button = (event >> 8) & 0xff;
> +	u8 state = !!(event & 0xff);
> +
> +	switch (button) {
> +	case BTN_POWER:
> +	case BTN_TOUCHID:
> +		pm_wakeup_dev_event(smcin->dev, 0, (smcin->wakeup_mode && state));
> +
> +		/* Suppress KEY_POWER event to prevent immediate shutdown on wake */
> +		if (smcin->wakeup_mode)
> +			return;
> +
> +		input_report_key(smcin->input, KEY_POWER, state);
> +		input_sync(smcin->input);
> +		break;
> +	case BTN_POWER_HELD_SHORT: /* power button held down; ignore */
> +		break;
> +	case BTN_POWER_HELD_LONG:
> +		/*
> +		 * If we get here the power button has been held down for a while and
> +		 * we have about 4 seconds before forced power-off is triggered by SMC.
> +		 * Try to do an emergency shutdown to make sure the NVMe cache is
> +		 * flushed. macOS actually does this by panicing (!)...
> +		 */
> +		if (state) {
> +			dev_crit(smcin->dev, "Triggering forced shutdown!\n");
> +			if (kernel_can_power_off())
> +				kernel_power_off();
> +			else /* Missing macsmc-reboot driver? */
> +				kernel_restart("SMC power button triggered restart");
> +		}
> +		break;
> +	default:
> +		dev_warn(smcin->dev, "Unknown SMC button event: %04lx\n", event & 0xffff);
> +	}
> +}
> +
> +static void macsmc_input_event_lid(struct macsmc_input *smcin, unsigned long event)
> +{
> +	u8 lid_state = !!((event >> 8) & 0xff);
> +
> +	pm_wakeup_dev_event(smcin->dev, 0, (smcin->wakeup_mode && !lid_state));
> +	input_report_switch(smcin->input, SW_LID, lid_state);
> +	input_sync(smcin->input);
> +}
> +
> +static int macsmc_input_event(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +	struct macsmc_input *smcin = container_of(nb, struct macsmc_input, nb);
> +	u16 type = event >> 16;
> +
> +	switch (type) {
> +	case SMC_EV_BTN:
> +		macsmc_input_event_button(smcin, event);
> +		return NOTIFY_OK;
> +	case SMC_EV_LID:
> +		macsmc_input_event_lid(smcin, event);
> +		return NOTIFY_OK;
> +	default:
> +		/* SMC event meant for another driver */
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +static int macsmc_input_probe(struct platform_device *pdev)
> +{
> +	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
> +	struct macsmc_input *smcin;
> +	bool have_lid, have_power;
> +	int error;
> +
> +	/* Bail early if this SMC neither supports power button nor lid events */
> +	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
> +	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
> +	if (!have_lid && !have_power)
> +		return -ENODEV;
> +
> +	smcin = devm_kzalloc(&pdev->dev, sizeof(*smcin), GFP_KERNEL);
> +	if (!smcin)
> +		return -ENOMEM;
> +
> +	smcin->dev = &pdev->dev;
> +	smcin->smc = smc;
> +	platform_set_drvdata(pdev, smcin);
> +
> +	smcin->input = devm_input_allocate_device(&pdev->dev);
> +	if (!smcin->input)
> +		return -ENOMEM;
> +
> +	smcin->input->phys = "macsmc-input (0)";
> +	smcin->input->name = "Apple SMC power/lid events";
> +
> +	if (have_lid)
> +		input_set_capability(smcin->input, EV_SW, SW_LID);
> +	if (have_power)
> +		input_set_capability(smcin->input, EV_KEY, KEY_POWER);
> +
> +	if (have_lid) {
> +		u8 val;
> +
> +		error = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
> +		if (error < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
> +		else
> +			input_report_switch(smcin->input, SW_LID, val);
> +	}
> +
> +	if (have_power) {
> +		u32 val;
> +
> +		error = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
> +		if (error < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
> +		else
> +			input_report_key(smcin->input, KEY_POWER, val & 1);
> +	}
> +
> +	error = input_register_device(smcin->input);
> +	if (error) {
> +		dev_err(&pdev->dev, "Failed to register input device: %d\n", error);
> +		return error;
> +	}
> +
> +	input_sync(smcin->input);
> +
> +	smcin->nb.notifier_call = macsmc_input_event;
> +	blocking_notifier_chain_register(&smc->event_handlers, &smcin->nb);
> +
> +	device_init_wakeup(&pdev->dev, true);
> +
> +	return 0;
> +}
> +
> +static int macsmc_input_pm_prepare(struct device *dev)
> +{
> +	struct macsmc_input *smcin = dev_get_drvdata(dev);
> +
> +	smcin->wakeup_mode = true;
> +	return 0;
> +}
> +
> +static void macsmc_input_pm_complete(struct device *dev)
> +{
> +	struct macsmc_input *smcin = dev_get_drvdata(dev);
> +
> +	smcin->wakeup_mode = false;
> +}
> +
> +static const struct dev_pm_ops macsmc_input_pm_ops = {
> +	.prepare = macsmc_input_pm_prepare,
> +	.complete = macsmc_input_pm_complete,
> +};
> +
> +static struct platform_driver macsmc_input_driver = {
> +	.driver = {
> +		.name = "macsmc-input",
> +		.pm = &macsmc_input_pm_ops,
> +	},
> +	.probe = macsmc_input_probe,
> +};
> +module_platform_driver(macsmc_input_driver);
> +
> +MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_DESCRIPTION("Apple SMC input driver");
> +MODULE_ALIAS("platform:macsmc-input");
> 

Best regards,
Nick Chan

