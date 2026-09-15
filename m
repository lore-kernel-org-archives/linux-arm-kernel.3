Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD62DC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OygZrAtFs+UkE/RG+UcvAU7GorjdYhIE8PMV7ebATNg=; b=NykO8RmXPiLtXjOlnLC9URG64K
	1N1V+DLKZ731NCD+JPzUlrbIdHztFuD8oHWU33ZROkGfLGwh5rQzjbPMGmfUbiXIr2l1wjIPpRkq8
	uxKt32Eu8traGwHEJQmuL3ztBnmz2n8Nq/YD5QI6H0dB+TTpel4nsF6wZa/Cs/VLbnFFd8d5NubZb
	PsGN4mLBl4YWUTsEVSTkGOVDpfRSxrR2XDknn10AuV9JnNVh7uye3Cu498aVb7lsUdL7x9kklWmrb
	J9UgQH17CT9OrVW+bEP1jUtu60tYsRjBNfr3Ba91xe1d6kjpWnqbILEF6Xs3vqNHO3dgPc9gGXsYo
	IXL8DCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TCF-00000006jGd-14Sr;
	Tue, 15 Sep 2026 13:27:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TCE-00000006jGM-0bQT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 13:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OygZrAtFs+UkE/RG+UcvAU7GorjdYhIE8PMV7ebATNg=; b=H/tor6xKL/0tIUhXdP8crvrese
	dOuEtHZtfa/rKgwlGe16b8nEQiNAvmA0TNsPlFBONTmDwC6mH3kYVOz8g3St3WxgsR9d1xmfuoz+e
	EkJil//79K/hWwvqCAQr/qjaNYOhOd3nblSmEmYb0k9+2f/ENuBGlWoZWA9z70rc/b/Lt8A+NtWdY
	WnN/qEKiPpD6SgWuyEZWCOIogDcatUiyxWfXrUyxXDy2tin/kizjnNXE0VQQWXiGj/fEcGr/ei01N
	eAjWoja9cxwrRl1qm7haURYiaZ8IBClTIy1oUjFJ6D7nIhdQbsyPMw8Dj51kDAp+AUAHgpgLtxvbb
	Lx7pnznw==;
Received: from mgamail.intel.com ([192.198.163.8])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6TCA-00000006p2t-3jg8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 13:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789478855; x=1821014855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LvQZ0lj3BE7qSBpR37PGrtquuI5nJqHwIN8zYY7oDdM=;
  b=mUOcOR38B4azUxvMyRvoenrPAdL9o9hL28hfOODanBq9Z5P7zAV/bF0m
   weShOfNYwx/GJXJDN8ef4eDMkWT60/nxkn6vphllRzpLHy/pP0FGpbk6i
   BpS8ItmYFINGcoVcdZAt+Uj65Q8LHZa2/JcO8KbHSSs7xfqHHOjv6yjcz
   09hLylF/wzsIOgidP75nd8wbvTqrJIvT+k9nBVyMBvDRyGgm33mrOF8hI
   G88Qnm+KShtDR6JyqXEVkE2ZYROpGmXOn2y3iuBrhjT010toUFm2EWqKR
   WFZr/xXx+GwFSpDElfb0G3Ht9vIxBAhx5FoeraYrzGTkgocddz77etUTm
   w==;
X-CSE-ConnectionGUID: YamXzZvVSAy4do+ld6MD2w==
X-CSE-MsgGUID: 0Oz59/DCQPmo3xLFq7IhWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107353194"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107353194"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:27:32 -0700
X-CSE-ConnectionGUID: ZNMsbKv1RnuiE3ZxRK2M1Q==
X-CSE-MsgGUID: B+6W7utzQDKDtDV+XQ1KUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296513770"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:27:26 -0700
Date: Tue, 15 Sep 2026 16:27:24 +0300
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
Subject: Re: [PATCH v7 07/15] clk: ambarella: add CV75 RCT clock controller
Message-ID: <aqlHvB2FkpBdlEBT@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-7-3297d3fbc9c0@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-7-3297d3fbc9c0@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_142735_321737_1F22A8EE 
X-CRM114-Status: GOOD (  17.36  )
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

On Tue, Sep 15, 2026 at 07:15:37PM +0800, Long Zhao via B4 Relay wrote:

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
> +#include <linux/math64.h>

> +#include <linux/mod_devicetable.h>

No new driver should use this, ID tables are provided by...

> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>

^^^...this one.

> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>

...

> +struct cv75_fixed_factor {
> +	const char *name;
> +	u32 id;

> +	u16 mult;
> +	u16 div;

There is struct u16_fract in math.h. Can you use it instead of these two?

> +};

...

> +static int cv75_rct_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	spin_lock_init(&cv75_ccu.lock);
> +
> +	cv75_ccu.base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(cv75_ccu.base))
> +		return PTR_ERR(cv75_ccu.base);

> +	data = devm_kzalloc(dev, struct_size(data, hws, CV75_NUM_CLKS),
> +			    GFP_KERNEL);

I think it's okay to have this on a single line.

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



