Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84D4C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlsBHkNByvb+woDkTNhk2IzRWfs42V/+yDEzWWtQwtY=; b=QLFkXCgcZpdydIfjm6qyocEkib
	NTQEZ4Dg0JAEAohU87rL5P3hBL0oFsHatstitq49iXAgVYl8mJd9Aw0CzdNvO8+9uk1TW50fG2umF
	SMKkJcLw2/ISLca+Z9dqvCLZPdglCDQBIc5AULRJELcugMIoxNQ5skr8fRAojJRUsBfX0ymLTJnq1
	laHEw59hpPBBzzTlGHNqO2Y8/Xz+PO0vDZHRwMqzOh+zutdn8aZIFi1xCWLlMTG4/koxST1ytz/nD
	VSbpRaKHmV/EJUQlW2wDRg+ubVyI3G1ABuL8A2mSrzTqX27M72FjeRqy3cNmLc2MGBSqI1WKCxrIU
	cLhETnTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nDO-000000090SR-32F8;
	Wed, 16 Sep 2026 10:50:10 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nDM-000000090Rt-2Q5y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789555808; x=1821091808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OT3IE4Z8J1dRKbh31nrw/ExOCgfzBzB9bdPinP6gAls=;
  b=L/ZP6XhrkzoY4EiwAz7sRejjWQfPWfJt5HblgjxmIp5OBUt3bwOadGgp
   eOkmaELoTLIJu55cairyjQlU+ka5NdH/5eZ5xC5N0nemT+XCXOBB0VTes
   vzFQ/8k+tFfkuBjjiuGJ5IcQK2mByAw5oSilCjAcleHJgVqBNnDjbGyle
   cNvp19qaS9yjJY+I/QBx/pUplpa176pdDqptchQ4dBw6gKgj1z9mBoPEO
   c3xYv0BjjXlf+bIbanuxCJaSRCBMF/MmpYPpoPSwrh9JkCJg4Y08wP5pA
   H8Ri7v4twShZiSiL9nNxfJ2qBr8Zg/odpSuE4Hi4k7gfOTgF4BoHJXdyT
   w==;
X-CSE-ConnectionGUID: DRLDqznHQQWRVSyc8yppOw==
X-CSE-MsgGUID: L2BrlUx9TJi+RLasGZWdkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93632219"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93632219"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:50:06 -0700
X-CSE-ConnectionGUID: gmfebdBYSwujWMTLn9OVRw==
X-CSE-MsgGUID: 6NotP4dCSS2ky5FSZxb+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267093716"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:50:00 -0700
Date: Wed, 16 Sep 2026 13:49:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/15] pinctrl: ambarella: add CV75 pin controller
Message-ID: <aqp0VlwWotnuK9t7@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-12-3297d3fbc9c0@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-12-3297d3fbc9c0@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_035008_659372_C2FBE6CD 
X-CRM114-Status: GOOD (  26.61  )
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

On Tue, Sep 15, 2026 at 07:15:42PM +0800, Long Zhao via B4 Relay wrote:

> Add an Ambarella pinmux-only pinctrl driver with CV75 function/group
> tables. GPIO is handled by the PL061 driver.

...

> +#define CV75_GROUP(_name)						\
> +	{								\
> +		.name = #_name,						\
> +		.mux = cv75_##_name##_pinmux,				\
> +		.nmux = ARRAY_SIZE(cv75_##_name##_pinmux),		\
> +	}

Can't we use PICTRL_PINGROUP()? Why not?

...

> +#define CV75_FUNCTION(_name)						\

> +	PINCTRL_PINFUNCTION(#_name, cv75_##_name##_groups,		\
> +			    ARRAY_SIZE(cv75_##_name##_groups))

I would dare to make it a single line.

...

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>

I don't see the need to use errno.h, err.h provides the basic ones.

> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>

...

> +static void amb_pinmux_set_altfunc(struct amb_pinctrl *ipc, u32 bank,
> +				   u32 offset, u32 altfunc)
> +{
> +	if (bank >= ipc->data->nr_banks)
> +		return;
> +
> +	for (unsigned int i = 0; i < 3; i++) {
> +		u32 data;
> +
> +		data = readl_relaxed(ipc->iomux_base + IOMUX_REG(bank, i));
> +		data &= ~BIT(offset);
> +		data |= ((altfunc >> i) & 1U) << offset;

		data |= ((altfunc & BIT(i)) >> i) << offset;

Or even

		unsigned long data;
		...
		__assign_bit(offset, &data, altfunc & BIT(i));

> +		writel_relaxed(data, ipc->iomux_base + IOMUX_REG(bank, i));
> +	}
> +}

...

> +static int amb_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> +			   unsigned long *configs, unsigned int num_configs)
> +{
> +	struct amb_pinctrl *ipc = pinctrl_dev_get_drvdata(pctldev);
> +	u32 bank = PINID_TO_BANK(pin);
> +	u32 offset = PINID_TO_OFFSET(pin);
> +	int ret;
> +
> +	if (bank >= ipc->data->nr_banks)
> +		return -EINVAL;
> +
> +	for (unsigned int i = 0; i < num_configs; i++) {
> +		enum pin_config_param param = pinconf_to_config_param(configs[i]);
> +		u32 arg = pinconf_to_config_argument(configs[i]);
> +		int ds;
> +
> +		switch (param) {
> +		case PIN_CONFIG_BIAS_DISABLE:
> +			ret = regmap_update_bits(ipc->pull_regmap,
> +						 ipc->data->pull_en[bank], BIT(offset), 0);
> +			if (ret)
> +				return ret;
> +			break;
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +			ret = regmap_update_bits(ipc->pull_regmap,
> +						 ipc->data->pull_dir[bank], BIT(offset),
> +						 (param == PIN_CONFIG_BIAS_PULL_UP) ?
> +						 BIT(offset) : 0);

_assign_bits()?
Ditto for the rest of the similar cases.

> +			if (ret)
> +				return ret;
> +			ret = regmap_update_bits(ipc->pull_regmap,
> +						 ipc->data->pull_en[bank], BIT(offset),
> +						 BIT(offset));
> +			if (ret)
> +				return ret;
> +			break;
> +		case PIN_CONFIG_DRIVE_STRENGTH:
> +			ds = amb_drive_strength_to_reg(ipc, arg);
> +			if (ds < 0)
> +				return ds;
> +			if (ipc->data->have_ds2) {
> +				ret = regmap_update_bits(ipc->ds_regmap,
> +							 ipc->data->ds0[bank], BIT(offset),
> +							 (ds & BIT(0)) ? BIT(offset) : 0);
> +				if (ret)
> +					return ret;
> +				ret = regmap_update_bits(ipc->ds_regmap,
> +							 ipc->data->ds1[bank], BIT(offset),
> +							 (ds & BIT(1)) ? BIT(offset) : 0);
> +				if (ret)
> +					return ret;
> +				ret = regmap_update_bits(ipc->ds_regmap,
> +							 ipc->data->ds2[bank], BIT(offset),
> +							 (ds & BIT(2)) ? BIT(offset) : 0);
> +				if (ret)
> +					return ret;
> +			} else {
> +				ret = regmap_update_bits(ipc->ds_regmap,
> +							 ipc->data->ds0[bank], BIT(offset),
> +							 (ds & BIT(1)) ? BIT(offset) : 0);
> +				if (ret)
> +					return ret;
> +				ret = regmap_update_bits(ipc->ds_regmap,
> +							 ipc->data->ds1[bank], BIT(offset),
> +							 (ds & BIT(0)) ? BIT(offset) : 0);
> +				if (ret)
> +					return ret;
> +			}
> +			break;
> +		default:
> +			return -EOPNOTSUPP;

Is it indeed what we use in pin control? I think the correct one here is
ENOTSUPP (and in that case errno.h is required, yes). Yeah, some drivers
has a mixture and they probably didn't get how this error code is used.

> +		}
> +	}
> +
> +	return 0;
> +}

...

> +static int amb_pinconf_get(struct pinctrl_dev *pctldev,
> +			   unsigned int pin, unsigned long *config)
> +{
> +	struct amb_pinctrl *ipc = pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param = pinconf_to_config_param(*config);
> +	u32 bank = PINID_TO_BANK(pin);
> +	u32 offset = PINID_TO_OFFSET(pin);
> +	u32 pull_en, pull_dir, ds0, ds1, ds2, ds;
> +	int ret, strength;
> +
> +	if (bank >= ipc->data->nr_banks)
> +		return -EINVAL;
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		ret = regmap_read(ipc->pull_regmap, ipc->data->pull_en[bank],
> +				  &pull_en);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(ipc->pull_regmap, ipc->data->pull_dir[bank],
> +				  &pull_dir);
> +		if (ret)
> +			return ret;

> +		pull_en = (pull_en >> offset) & 1;
> +		pull_dir = (pull_dir >> offset) & 1;

Seems to me they can be boolean?
In any case, use ' & BIT(offset)' instead of the above.

> +		if (param == PIN_CONFIG_BIAS_DISABLE) {
> +			if (pull_en)
> +				return -EINVAL;
> +			*config = pinconf_to_config_packed(param, 0);
> +			return 0;
> +		}
> +
> +		if (!pull_en)
> +			return -EINVAL;
> +		if (param == PIN_CONFIG_BIAS_PULL_UP && !pull_dir)
> +			return -EINVAL;
> +		if (param == PIN_CONFIG_BIAS_PULL_DOWN && pull_dir)
> +			return -EINVAL;
> +
> +		*config = pinconf_to_config_packed(param, 1);
> +		return 0;
> +
> +	case PIN_CONFIG_DRIVE_STRENGTH:
> +		ret = regmap_read(ipc->ds_regmap, ipc->data->ds0[bank], &ds0);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(ipc->ds_regmap, ipc->data->ds1[bank], &ds1);
> +		if (ret)
> +			return ret;
> +
> +		ds0 = (ds0 >> offset) & 1;
> +		ds1 = (ds1 >> offset) & 1;
> +		if (ipc->data->have_ds2) {
> +			ret = regmap_read(ipc->ds_regmap, ipc->data->ds2[bank],
> +					  &ds2);
> +			if (ret)
> +				return ret;
> +
> +			ds2 = (ds2 >> offset) & 1;
> +			ds = (ds2 << 2) | (ds1 << 1) | ds0;
> +		} else {
> +			ds = (ds0 << 1) | ds1;
> +		}

Same here, use BIT(offset). For example,

			ds2 = !!(ds2 & BIT(offset));

> +		strength = amb_reg_to_drive_strength(ipc, ds);
> +		if (strength < 0)
> +			return strength;
> +
> +		*config = pinconf_to_config_packed(param, strength);
> +		return 0;
> +
> +	default:
> +		return -EOPNOTSUPP;

Same Q about the error code.

> +	}
> +}

...

> +	for (unsigned int pin = 0; pin < ipc->data->npins; pin++) {
> +		pindesc[pin].number = pin;
> +		pindesc[pin].name = devm_kasprintf(ipc->dev, GFP_KERNEL,
> +						   "io%u", pin);
> +		if (!pindesc[pin].name)
> +			return -ENOMEM;
> +	}

Use devm_kasprintf_strarray().

...

> +static int amb_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct amb_pinctrl *ipc;
> +	int ret;
> +
> +	ipc = devm_kzalloc(dev, sizeof(*ipc), GFP_KERNEL);
> +	if (!ipc)
> +		return -ENOMEM;
> +
> +	ipc->dev = dev;
> +	ipc->data = device_get_match_data(dev);
> +	if (!ipc->data)
> +		return dev_err_probe(dev, -EINVAL, "missing SoC data\n");

-ENODATA

> +	if (!ipc->data->nr_banks || ipc->data->nr_banks > AMBA_MAX_BANKS ||
> +	    !ipc->data->npins ||
> +	    !ipc->data->groups || !ipc->data->ngroups ||
> +	    !ipc->data->functions || !ipc->data->nfunctions)
> +		return dev_err_probe(dev, -EINVAL, "invalid SoC data\n");
> +
> +	ipc->iomux_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ipc->iomux_base))
> +		return PTR_ERR(ipc->iomux_base);
> +
> +	ipc->ds_regmap = syscon_regmap_lookup_by_phandle(dev_of_node(dev),
> +					"ambarella,drive-strength-syscon");
> +	if (IS_ERR(ipc->ds_regmap))
> +		return dev_err_probe(dev, PTR_ERR(ipc->ds_regmap),
> +				     "missing drive-strength syscon\n");
> +
> +	ipc->pull_regmap = syscon_regmap_lookup_by_phandle(dev_of_node(dev),
> +					"ambarella,pull-syscon");
> +	if (IS_ERR(ipc->pull_regmap))
> +		return dev_err_probe(dev, PTR_ERR(ipc->pull_regmap),
> +				     "missing pull syscon\n");
> +
> +	spin_lock_init(&ipc->lock);
> +
> +	ret = amb_pinctrl_register(ipc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register pinctrl\n");
> +
> +	platform_set_drvdata(pdev, ipc);
> +
> +	return 0;
> +}

...

> +#include <linux/types.h>

> +#include <linux/pinctrl/pinctrl.h>

Not really used. Can be replaced with forward declarations.

> +#define AMBA_MAX_BANKS			8
> +
> +#define AMBA_PINMUX(pin, alt)		(((alt) << 12) | (pin))
> +#define AMBA_PINMUX_TO_PIN(mux)		((mux) & 0xfff)
> +#define AMBA_PINMUX_TO_ALT(mux)		(((mux) >> 12) & 0x7)
> +
> +struct amb_pinmux_group {
> +	const char *name;
> +	const u32 *mux;
> +	unsigned int nmux;
> +};
> +
> +struct amb_pinctrl_data {
> +	const struct amb_pinmux_group *groups;
> +	const struct pinfunction *functions;
> +	unsigned int ngroups;
> +	unsigned int nfunctions;
> +	unsigned int nr_banks;
> +	unsigned int npins;
> +	unsigned int ds0[AMBA_MAX_BANKS];
> +	unsigned int ds1[AMBA_MAX_BANKS];
> +	unsigned int ds2[AMBA_MAX_BANKS];
> +	unsigned int pull_en[AMBA_MAX_BANKS];
> +	unsigned int pull_dir[AMBA_MAX_BANKS];
> +	bool have_ds2;
> +};
> +
> +extern const struct amb_pinctrl_data ambarella_cv75_pinctrl_data;

-- 
With Best Regards,
Andy Shevchenko



