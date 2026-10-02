Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC87CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1yOdAUZ+cHcklaHWlGeNoHwJ85ZYd6FRd7fBVBKCrQ=; b=cPJIIF7qKI1ESc0jDKF3wW3cKq
	jBlKdLSKz35WwodjoGl885U2TkdSQjoOMQVEcYY4zGxytdrKbOEub8syVcPS2nzE4Zve9zeF1+aJ4
	eYA9w7sirphHkfalvsEYZ1ntgK+yoQE0YOzpDOSqqb/VFfuAvrMYNsBjEpQkATCGgM447dcz7bywt
	BZviKF8Y3Zq1ND1NeuKZWNl6z6WT0cXvfnk7gpMsbreKbst0kU2fKHthnlVamzLXBkPhRoy7jTZo5
	njIq61gkpNkQAn7A92V1ESSW0I1J/NstZhKZ6+f79opIxlY4j4CLXkzm9IIDHQ/KN6RKIg1nF43tX
	dkqy7hzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYM3-0000000AwgX-2eAR;
	Fri, 02 Oct 2026 08:10:55 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYM1-0000000AwgC-1qTl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790928654; x=1822464654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jbrobNgLFvEYW+K5702m//jZXUekQEX6EeXtEarN3MI=;
  b=D0qdrsKYu8MXWjk3Ev0cqck1smzCaB1Pg9FUpxnk3e7P9vljHMJQ2O+G
   8tVavb1qXtMEDfO6RIa9b+BAULW9vT85W/Nh5wBmyJq98ae+s4MM3pzI1
   uI9h9h8Z1ar0iChpvZlV3F+OjSDJ/UAGPyHxXDdE7YB+6X8PtAzts6qJG
   91Fl1sWtyPp+eeqK5zJ/mC1CdAeSDBvUjmAuo8eizN2TL3oq8JoL3CHLf
   xyPIT6VKXiUpwyFfO92qWTD7Y9HnM2cflfuuJ7z053SL6u9YIaJQeBkBx
   R0WDNXszPKKLl0fmmLs4aR2szUBP5JWZaxkydqhwlL8i6ddRhxO6v8i+1
   g==;
X-CSE-ConnectionGUID: 6uCZu2ZcSMK8RUWXoMggrQ==
X-CSE-MsgGUID: HVqs9zp+Sjqyf1ZoyQXRJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94406439"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="94406439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:10:53 -0700
X-CSE-ConnectionGUID: OWKdrr/1QZ+1XoZZBrzcjw==
X-CSE-MsgGUID: wfmyyLdUR1uQ8ZwS3auB0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275740714"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:10:47 -0700
Date: Fri, 2 Oct 2026 11:10:44 +0300
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
	Michael Walle <mwalle@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 06/15] clk: ambarella: add CV75 RCT clock controller
Message-ID: <ar9nBBGJ361IFXn8@ashevche-desk.local>
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-6-486cc289a4b8@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-cv75-v5-v9-6-486cc289a4b8@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_011053_562236_FD008E8E 
X-CRM114-Status: GOOD (  20.88  )
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

On Thu, Oct 01, 2026 at 08:40:55PM +0800, Long Zhao via B4 Relay wrote:

> Add a table-driven CCF driver for the CV75 root clock tree. Register
> the core PLL, AHB/APB fixed factors and UART0 composite clock, with
> osc supplied via clk_parent_data.

...

> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>

> +#include <linux/math.h>
> +#include <linux/math64.h>

The latter one covers the former one.

> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>

...

> +struct cv75_pll_hw {
> +	struct clk_hw hw;

> +	u32 ctrl;
> +	u32 frac;
> +	u32 ctrl2;

This repeats twice in different data structures. Is the semantic the same in
both cases? If so, it might make sense to have a separate data structure for
these three and embed it as required.

> +};

...

> +struct cv75_pll {
> +	const char *name;
> +	struct cv75_pll_hw *hw;
> +	unsigned long flags;

> +	u32 ctrl;
> +	u32 frac;
> +	u32 ctrl2;

^^^ See above.

> +	int id;
> +};

...

> +{
> +	struct clk_parent_data parent_data = { .fw_name = "osc" };
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(cv75_plls); i++) {

	for (unsigned int i = 0; i < ARRAY_SIZE(cv75_plls); i++) {

Same approach in the below code where similar cases appear.

> +		const struct cv75_pll *desc = &cv75_plls[i];
> +		struct cv75_pll_hw *pll = desc->hw;
> +		struct clk_init_data init = {};
> +		int ret;
> +
> +		pll->ctrl = desc->ctrl;
> +		pll->frac = desc->frac;
> +		pll->ctrl2 = desc->ctrl2;
> +
> +		init.name = desc->name;
> +		init.ops = &cv75_pll_ops;
> +		init.parent_data = &parent_data;
> +		init.num_parents = 1;
> +		init.flags = desc->flags;
> +		pll->hw.init = &init;
> +
> +		ret = devm_clk_hw_register(dev, &pll->hw);
> +		if (ret)
> +			return ret;
> +
> +		if (desc->id >= 0)
> +			data->hws[desc->id] = &pll->hw;
> +	}
> +
> +	return 0;
> +}

...

> +static int cv75_rct_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;

> +	spin_lock_init(&cv75_ccu.lock);

Can it be done later, after memory allocation?

> +	cv75_ccu.base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(cv75_ccu.base))
> +		return PTR_ERR(cv75_ccu.base);
> +
> +	data = devm_kzalloc(dev, struct_size(data, hws, CV75_NUM_CLKS), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->num = CV75_NUM_CLKS;
> +
> +	ret = cv75_register_plls(dev, data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register plls\n");
> +
> +	ret = cv75_register_fixed_factors(dev, data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register fixed factors\n");
> +
> +	ret = cv75_register_composites(dev, data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register composites\n");
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



