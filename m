Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09F5F0182B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGT37qGNsluLjmINqsfaizbELlKtx7X4hZsBVqWUmz0=; b=G/hBT2Q5HxfrxLNQlUZ98MuPI2
	ijbhW9G1HeP2+mYefbFrFr/dr3tV6zrpbezsi65C1yXDUPvoKI0fPg2g4/J8jGRHzF6vwo0OyID+W
	MqnQDwcCnyNM8ZcVONJCpQcT/I2CoW97qUoJICebPeloUJGyORLpYoy/wpKut3l1bDcV6peWeaX5W
	x0Z4luLruTdjHyKtSFmXGih41AN4zWXBKT9sVmVsPLKgNfp+f9MenklGivu1QMJN++xsYGiGEDFpy
	VFGBIeRH3mYOjbGtwSXnrTKdOGzk2cA36jclvAUgmeK1ocTAZyWc97+fJq8+G5Ql76QGBK6AfeIoM
	X8GTNJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTtx-00000003asA-3s8s;
	Fri, 06 Mar 2026 12:03:29 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTth-00000003ape-137I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772798593; x=1804334593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gxY2HteUlEPwtGAhzmFFS7SvKb27QN/7kHK5ETDjuv8=;
  b=Km+3gEQkSXzWuPEW6lWBcESeDJdeiSJ5MpNP7LlVa5nURVY0zMQrOMDJ
   pphju5Hxul10TE9qa35XJgrj+HIKNpsoA1ND6KuNznUS4UzuU4pozLmk5
   BNaZCIru7uWYczOx041e3wF/VdLhYSC5xrZFJjANkHE78HAff3L596WG2
   Bp+vYU+/gjUCbZtLvbW8iaqYR3bNdnKfysY4pruEt0mJMP/klnPR7fJW5
   GGjbZ3d469rPAu9HDmygQDdiDAn0VLNmQfH1SHxvKl/15CzWRSrxSx+ge
   k8IvYrgWmu1pu3nDpKbT2ZJVEHZ8/2nuDn7dPN+QkOfZ57DqCeKcCLY4k
   g==;
X-CSE-ConnectionGUID: vSaVH0orQouTEyLgINz5vA==
X-CSE-MsgGUID: JtSP8agYTPiDBRfn+B7pCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="74020368"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="74020368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 03:53:51 -0800
X-CSE-ConnectionGUID: EwWNBUmeSwO6ezV8ekzYDw==
X-CSE-MsgGUID: eZsczoX6Q3CYsfBXL7YygA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="249460615"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 03:53:46 -0800
Date: Fri, 6 Mar 2026 13:53:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Frank Rowand <frowand.list@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/6] gpio: move hogs into GPIO core
Message-ID: <aarARyStudt76FMo@ashevche-desk.local>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
 <20260305-gpio-hog-fwnode-v1-2-97d7df6bbd17@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-gpio-hog-fwnode-v1-2-97d7df6bbd17@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040316_742270_20925816 
X-CRM114-Status: GOOD (  20.69  )
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

On Thu, Mar 05, 2026 at 10:51:27AM +0100, Bartosz Golaszewski wrote:
> Refactor line hogging code by moving the parts duplicated in
> gpiolib-acpi-core.c and gpiolib-of.c into gpiolib.c, leaving just the
> OF-specific bits in the latter.
> 
> This makes fwnode the primary API for setting up hogs and allows to use
> software nodes in addition to ACPI and OF nodes.

...

> +int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
> +{
> +	struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
> +	struct of_phandle_args gpiospec;
> +	enum gpiod_flags dflags;
> +	struct gpio_desc *desc;
> +	unsigned long lflags;
> +	const char *name;
> +	int ret, argc;
> +	u32 gpios[3]; /* We support up to three-cell bindings. */
> +	u32 cells;
> +
> +	lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
> +	dflags = GPIOD_ASIS;
> +	name = NULL;
> +
> +	argc = fwnode_property_count_u32(fwnode, "gpios");
> +	if (argc < 0)
> +		return ret;

As LKP noticed this perhaps needs to be changed to

		return argc;

> +	if (argc > 3)
> +		return -EINVAL;
> +
> +	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (is_of_node(fwnode)) {
> +		/*
> +		 * OF-nodes need some additional special handling for
> +		 * translating of devicetree flags.
> +		 */
> +		ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
> +		if (ret)
> +			return ret;

> +		if (cells && argc != cells)
> +			return -EINVAL;

Hmm... So, when cells is 0 we don't care about argc not being 0?

> +		memset(&gpiospec, 0, sizeof(gpiospec));
> +		gpiospec.np = to_of_node(fwnode);
> +		gpiospec.args_count = argc;
> +		memcpy(&gpiospec.args, gpios, argc * sizeof(u32));
> +
> +		ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);

I prefer to see less OF things here, id est we may use struct
fwnode_reference_args.

> +		if (ret)
> +			return ret;
> +	} else {
> +		/*
> +		 * GPIO_ACTIVE_LOW is currently the only lookup flag
> +		 * supported for non-OF firmware nodes.
> +		 */
> +		if (gpios[1])
> +			lflags |= GPIO_ACTIVE_LOW;
> +	}
> +
> +	if (fwnode_property_present(fwnode, "input"))
> +		dflags |= GPIOD_IN;
> +	else if (fwnode_property_present(fwnode, "output-low"))
> +		dflags |= GPIOD_OUT_LOW;
> +	else if (fwnode_property_present(fwnode, "output-high"))
> +		dflags |= GPIOD_OUT_HIGH;
> +	else
> +		return -EINVAL;
> +
> +	fwnode_property_read_string(fwnode, "line-name", &name);
> +
> +	desc = gpiochip_get_desc(gc, gpios[0]);
> +	if (IS_ERR(desc))
> +		return PTR_ERR(desc);

> +	ret = gpiod_hog(desc, name, lflags, dflags);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Can be

	return gpiod_hog(desc, name, lflags, dflags);

> +}

-- 
With Best Regards,
Andy Shevchenko



