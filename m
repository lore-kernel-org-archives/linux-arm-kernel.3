Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F1BFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orEuFxihbtCw78bb0MGSYlMJ0pgE+offZfO0F9CrVb0=; b=UIHcl/sMFv33eZOchOahn9sZjY
	F1oq+B6bsUlUGFTX2QsWP9T2UH82lwqGRhRNTUsfSvwU5MeDQ8xnUVJe2dYntb2AQmUXevvZn2U9I
	VzktxX9O0gYoD3sOMmAKzBG+MUYMoLCAYWLo0IvO7dn/yrsl1NpiFjiPwB9YGa9K3Qr0N7FgtL9DG
	4j/sCYdXZu0i7N//elSzMj5uRXK5QSDhaLY6ISKmm3TotaGGSF6JLAQZkhFiAomglmiLm9NMQh0Iq
	d0nRvxw5BOvJQtEzLusYAJrlAp38jV9sutvObub0U5bcAlqKdcXptsa5itDBozHTPNp9o9Sg/OLNR
	3uPGXx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJt1m-0000000DF1c-0J8c;
	Mon, 04 May 2026 13:08:02 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJt1g-0000000DExv-23TA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 13:08:00 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8b6c9fdb68cso17006226d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 06:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777900075; x=1778504875; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orEuFxihbtCw78bb0MGSYlMJ0pgE+offZfO0F9CrVb0=;
        b=zu7YPiX4pKt2gQHE9rRmxmaTbjKmEngYh7uLGqojvhdxGNiHNLEFObnMoqmb3ekyNB
         xndcYQquXq6zVipBVgTYeZtkxkakFCYUsSM8fDHTO9VdrtHkOi6nld9xH25n/OnrLyoc
         SPi+eAye5D3d562bdHce1KDFl2SQQ6Ql8Cg00FgAOUY1VIf4G1ItPyTksqoLHRq+KBfV
         ZcPhdqmuSlBRgguc+0C8ilrogyGA0Nah+yp9ErkohoVuMH4sW5FFnyTUXLnvPIBVnifC
         N7Ed0HbsOz+lcpLlo0haDVbH2dREoCgyTWJgvuYJ3/s1SR5boiyCE0gbQhYk8oGIBlmp
         zH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900075; x=1778504875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orEuFxihbtCw78bb0MGSYlMJ0pgE+offZfO0F9CrVb0=;
        b=Bw9saUph3QdNdeQcrZZVVHgyiz9od8QKpgmSLnFrITmiTC1KlmR2NRPWkiNMG+KLAM
         aT/4uI7WJosEH30pYbzyXhDqlOg09Yt2qgHKxgEBoroT0YVqaEHCNkEEUHGfnWK1Hdwy
         4HnJ6Jbm1ZikP8bCsTbywmPMQsHjPbP8fxXrJOAVrjS8KJq6oSinQumuPGmYagxkT837
         Am49FTBfavpo5uPofZoyqApvOfmEmVui5RBtN96uTPJal8RH0YqZOhPOtRv9eBITBVla
         PcugFpEi8i0cVfVDB1/y24OtbK48BGixNB2Bl3OOyUD5HrPm2x45b2UUD/6aPzrTrM2M
         PavQ==
X-Forwarded-Encrypted: i=1; AFNElJ+As6YmIl8ULsdElH1KgHKtZv0jAO2FdDREmR+fFyYEKR/B7swbdR+O3OHBK09eZsKxAmypHCLdHH7Eq/6qe20a@lists.infradead.org
X-Gm-Message-State: AOJu0YxVnIWzQ8uQmIFEeIWPvDdSOKC+F6BquqCI8z2urnEHDRsgj3Aw
	0WUDCiov3ny59pkGiWFGbhRvggrqHu25246WtavfFfNO3o82yhUNiOMyM7ROzXcnENc=
X-Gm-Gg: AeBDiev9btLetswJ+tDD3OeT48M3S3tmNOd01D3Tn43JQ8ffy8Wqbyei4Fejb8HNMml
	THwafgFAvZyFAtLIQEBifusPiahaykiDI2htxUVAuN5+pbomIhnQb1MIuFhBH1DUpr4bk0SAQcU
	hOUkXiV8rJuR39YX0j2UxgUVThiUl4frMR7OF8lgHCxk5dm+2nBE6sdbLjMOlEO3IOgJP+1jGl9
	Re45paRjhHWr/veyWXdRCgLUqqtqAT+6HQZZAv5mJnqY8nj3gnQTu5fDpC3xa1r+pjjEyHp3REd
	sCs0uJFs4or7gLKcQf/8e2frOIg6lZbwleEZ0oQ6F2O3WDs5n/BOWhKFTIXMwKH9cs2V17amQDp
	QN/xZlVMqRv+rA8gFH2ncqrtoA6hMte+ePvi6N4tJZJb5//CBIzE8w3VpCpoIF2ygbAyhzoFCe+
	4rQ04V3XDcWklcO0nXiaDJlTMc7iT4cpdHgApzAHoAEPag9HMwEFk594GKgJ8R9EwZ/fWxspq0Q
	Q==
X-Received: by 2002:a05:6214:5342:b0:8ac:b4d5:50ec with SMTP id 6a1803df08f44-8b668a1fafbmr160317526d6.38.1777900074368;
        Mon, 04 May 2026 06:07:54 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c6b8398sm130363776d6.37.2026.05.04.06.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:07:53 -0700 (PDT)
Message-ID: <53fb87c9-25f3-4da1-aa7b-104c10c92a06@riscstar.com>
Date: Mon, 4 May 2026 08:07:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <CAMRc=McWXCqyv1LmWMuEMmE3HqaURx_eMD8rkDs9AJT+7W2aYw@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAMRc=McWXCqyv1LmWMuEMmE3HqaURx_eMD8rkDs9AJT+7W2aYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_060756_917147_1670980C 
X-CRM114-Status: GOOD (  39.17  )
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

On 5/4/26 7:46 AM, Bartosz Golaszewski wrote:
> On Fri, 1 May 2026 17:54:17 +0200, Alex Elder <elder@riscstar.com> said:
>> Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially
>> a small and highly-specialized SoC.  TC956x includes a GPIO block that
>> can be accessed, alongside several other peripherals, via two PCIe
>> endpoint functions.  The PCIe function driver creates an auxiliary
>> device for the GPIO block, and that device gets bound to this auxiliary
>> device driver.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>

Thanks Bartosz, I've got some responses below.

>> ---
>>   drivers/gpio/Kconfig       |  11 ++
>>   drivers/gpio/Makefile      |   1 +
>>   drivers/gpio/gpio-tc956x.c | 209 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 221 insertions(+)
>>   create mode 100644 drivers/gpio/gpio-tc956x.c
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index 020e51e30317a..746cedea7e91d 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -1646,6 +1646,17 @@ config GPIO_TC3589X
>>   	  This enables support for the GPIOs found on the TC3589X
>>   	  I/O Expander.
>>
>> +config GPIO_TC956X
>> +	tristate "Toshiba TC956X GPIO support"
>> +	depends on TOSHIBA_TC956X_PCI
>> +	default m if TOSHIBA_TC956X_PCI
>> +	help
>> +	  This enables support for the GPIO controller embedded in the Toshiba
>> +	  TC956X (and Qualcomm QPS615).  This device connects to the host
>> +	  via PCIe port, which is the upstream port on an internal PCIe
>> +	  switch.  On some platforms, a few of the GPIO lines are used to
>> +	  manage external resets.
>> +
>>   config GPIO_TIMBERDALE
>>   	bool "Support for timberdale GPIO IP"
>>   	depends on MFD_TIMBERDALE
>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>> index b267598b517de..c3584e7cba9b4 100644
>> --- a/drivers/gpio/Makefile
>> +++ b/drivers/gpio/Makefile
>> @@ -178,6 +178,7 @@ obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
>>   obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
>>   obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
>>   obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
>> +obj-$(CONFIG_GPIO_TC956X)		+= gpio-tc956x.o
>>   obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
>>   obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
>>   obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
>> diff --git a/drivers/gpio/gpio-tc956x.c b/drivers/gpio/gpio-tc956x.c
>> new file mode 100644
>> index 0000000000000..12221d8f812d9
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-tc956x.c
>> @@ -0,0 +1,209 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +/*
>> + * The Toshiba TC956X implements a PCIe Gen 3 switch that connects an
>> + * upstream x4 port to two downstream PCIe x2 ports.  It incorporates
>> + * an internal endpoint on a internal PCIe port that implements two
>> + * Synopsys XGMAC Ethernet interfaces.
>> + *
>> + * 35 GPIOs are also implemented by an embedded GPIO controller.  Three
>> + * registers control the first 32 GPIOs (other than 20 and 21, which are
>> + * reserved).  Three other registers control GPIOs 32 through 36. GPIOs
>> + * 22-24, 27-28, 31, and 34 are treated as "input only".
>> + *
>> + * There is a TC956X PCI power controller driver that accesses the
>> + * direction and output value registers for GPIOs 2 and 3.  These
>> + * GPIOs control the reset signal for the two downstream PCIe ports.
>> + * Their values will never change during operation of this driver, and
>> + * this driver reserves these two GPIOS.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/dev_printk.h>
> 
> This is implied by device.h which is guarnteed by platform_device.h. Please
> drop it.

OK, I'll drop it.

>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#define DRIVER_NAME		"tc956x-gpio"
>> +
>> +#define TC956X_GPIO_COUNT	37	/* Number of GPIOs (20-21 reserved) */
>> +
>> +/* The GPIO offsets are relative to 0x1200 in TC956X SFR space */
>> +#define GPIO_IN0_OFFSET		0x00		/* Input value (0-31) */
>> +#define GPIO_EN0_OFFSET		0x08		/* 0: out; 1: in (0-31) */
>> +#define GPIO_OUT0_OFFSET	0x10		/* Output value (0-31) */
>> +
>> +#define GPIO_IN1_OFFSET		0x04		/* Input value (32-36) */
>> +#define GPIO_EN1_OFFSET		0x0c		/* 0: out; 1: in (32-36) */
>> +#define GPIO_OUT1_OFFSET	0x14		/* Output value (32-36) */
>> +
>> +/*
>> + * struct tc956x_gpio - Information related to the embedded GPIO controller
>> + * @chip:		GPIO chip structure
>> + * @regmap:		MMIO register map for SFR GPIO region access
>> + * @input_only:		Bitmap indicating which GPIOs are input-only
>> + */
>> +struct tc956x_gpio {
>> +	struct gpio_chip chip;
>> +	struct regmap *regmap;
>> +	DECLARE_BITMAP(input_only, TC956X_GPIO_COUNT);
>> +};
>> +
>> +static int tc956x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 reg;
>> +	u32 val;
>> +
>> +	if (test_bit(offset, gpio->input_only))
>> +		return GPIO_LINE_DIRECTION_IN;
>> +
>> +	reg = offset < 32 ? GPIO_EN0_OFFSET : GPIO_EN1_OFFSET;
>> +
>> +	regmap_read(gpio->regmap, reg, &val);
>> +	if (val & BIT(offset % 32))
>> +		return GPIO_LINE_DIRECTION_IN;
>> +
>> +	return GPIO_LINE_DIRECTION_OUT;
>> +}
>> +
>> +static int tc956x_gpio_direction_input(struct gpio_chip *gc,
>> +				       unsigned int offset)
>> +{
>> +	u32 reg = offset < 32 ? GPIO_EN0_OFFSET : GPIO_EN1_OFFSET;
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 mask = BIT(offset % 32);
>> +
>> +	return regmap_update_bits(gpio->regmap, reg, mask, mask);
>> +}
>> +
>> +static int tc956x_gpio_direction_output(struct gpio_chip *gc,
>> +					unsigned int offset, int value)
>> +{
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 vreg;
>> +	u32 dreg;
>> +	u32 mask;
>> +
>> +	if (test_bit(offset, gpio->input_only))
>> +		return -EINVAL;
>> +
>> +	if (offset < 32) {
>> +		vreg = GPIO_OUT0_OFFSET;
>> +		dreg = GPIO_EN0_OFFSET;
>> +	} else {
>> +		vreg = GPIO_OUT1_OFFSET;
>> +		dreg = GPIO_EN1_OFFSET;
>> +	}
>> +	mask = BIT(offset % 32);
>> +
>> +	/* Set output value first, then direction */
>> +	regmap_update_bits(gpio->regmap, vreg, mask, value ? mask : 0);
>> +
>> +	return regmap_update_bits(gpio->regmap, dreg, mask, 0);
>> +}
>> +
>> +static int tc956x_gpio_get(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	u32 reg = offset < 32 ? GPIO_IN0_OFFSET : GPIO_IN1_OFFSET;
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 val;
>> +
>> +	regmap_read(gpio->regmap, reg, &val);
>> +
>> +	return val & BIT(offset % 32) ? 1 : 0;
>> +}
>> +
>> +static int tc956x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
>> +{
>> +	u32 reg = offset < 32 ? GPIO_OUT0_OFFSET : GPIO_OUT1_OFFSET;
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 mask = BIT(offset % 32);
>> +
>> +	return regmap_update_bits(gpio->regmap, reg, mask, value ? mask : 0);
>> +}
>> +
>> +static int tc956x_gpio_init_valid_mask(struct gpio_chip *gc,
>> +				       unsigned long *valid_mask,
>> +				       unsigned int ngpios)
>> +{
>> +	/*
>> +	 * GPIOs 2 and 3 are used by the PCI power control driver, and
>> +	 * we don't allow them to be used.  GPIOs 20 and 21 are reserved
>> +	 * (and not usable).
>> +	 */
>> +	bitmap_fill(valid_mask, ngpios);
>> +	bitmap_clear(valid_mask, 2, 2);
>> +	bitmap_clear(valid_mask, 20, 2);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tc956x_gpio_probe(struct auxiliary_device *adev,
>> +			     const struct auxiliary_device_id *id)
>> +{
>> +	struct device *dev = &adev->dev;
>> +	struct tc956x_gpio *gpio;
>> +	struct gpio_chip *gc;
>> +
>> +	if (!dev->platform_data)
>> +		return -EINVAL;
>> +
>> +	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
>> +	if (!gpio)
>> +		return -ENOMEM;
> 
> Add newline.

I will add a newline here.

> 
>> +	gpio->regmap = dev->platform_data;
> 
> It's not clear whether this is an mmio regmap or a slow-bus one that can fail.
> In the code above you're checking the return values of regmap operations quite
> inconsistently. Could you please verify if you need it and either always check
> them or not at all?

You're right.  I'm returning the result of regmap_update_bits()
from two callback functions.  But yes, this is an MMIO regmap.

I will return 0 and ignore the return value of regmap_update_bits()
in those spots, and will add some comments that make it clear that
this is an MMIO regmap.

>> +
>> +	/* Mark GPIOs 22, 23, 24, 27, 28, 31, and 34 as input only */
>> +	bitmap_set(gpio->input_only, 22, 3);
>> +	bitmap_set(gpio->input_only, 27, 2);
>> +	set_bit(31, gpio->input_only);
>> +	set_bit(34, gpio->input_only);
>> +
>> +	gc = &gpio->chip;
>> +
>> +	gc->label = DRIVER_NAME;
>> +	gc->parent = dev->parent;
>> +
>> +	gc->get_direction = tc956x_gpio_get_direction;
>> +	gc->direction_input = tc956x_gpio_direction_input;
>> +	gc->direction_output = tc956x_gpio_direction_output;
>> +	gc->get = tc956x_gpio_get;
>> +	gc->set = tc956x_gpio_set;
>> +	gc->init_valid_mask = tc956x_gpio_init_valid_mask;
>> +
>> +	gc->base = -1;
>> +	gc->ngpio = TC956X_GPIO_COUNT;
>> +	gc->can_sleep = false;
> 
> This makes me think this is an MMIO regmap after all.

You are correct.

> 
>> +
>> +	dev_set_drvdata(dev, gpio);
> 
> There's no corresponding dev_get_drvdata().

I hadn't noticed that.  We're only using the GPIO chip data
field (gc->gpiodev->data) instead.  I'll drop this call.

>> +
>> +	return devm_gpiochip_add_data(dev, gc, gpio);
>> +}
>> +
>> +static const struct auxiliary_device_id tc956x_gpio_ids[] = {
>> +	{ .name = "tc956x_pci.tc9564-gpio", },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(auxiliary, tc956x_gpio_ids);
>> +
>> +static struct auxiliary_driver tc956x_gpio_driver = {
>> +	.name		= DRIVER_NAME,
>> +	.probe          = tc956x_gpio_probe,
>> +	.id_table       = tc956x_gpio_ids,
>> +	.driver = {
>> +		.name		= DRIVER_NAME,
>> +		.owner		= THIS_MODULE,
>> +		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
>> +	},
>> +};
>> +module_auxiliary_driver(tc956x_gpio_driver);
>> +
>> +MODULE_DESCRIPTION("Toshiba TC956X PCIe GPIO Driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("auxiliary:" DRIVER_NAME);
>> --
>> 2.51.0
>>
>>
> 
> There are a few minor issues but overall looks good!

Thank you very much for the review Bartosz.  I'll implement
all of your suggestions in the next version.

					-Alex


> 
> Bart


