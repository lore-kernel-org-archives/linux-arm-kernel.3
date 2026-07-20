Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07150C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhsDptVnJ/ztNAQxE/yHvNkAp31hKo/DarPf2cIRmUI=; b=2vcEzUHdYtIqo/q33usPicJfda
	t3eck+IDIcjOzhf6aN42N5pcmpRZ8tn2EUf63UEEBpZV53CGkQw0Q2e/Vy7MLhpus7gNB2nyRNw5L
	4OiPhWxo188yxt2K/nUKIftgxqZxauO/FlTJs9DTB5mk8y2pK564YYZ5Q5wfHCQJFs8fSl+dZwpcU
	DYhS8GIb5PqGIpRTHLtaIp59adSdzzU3kbQGC9BfSBd1qL/IdQfkAO9s9JtTEWoI2rygYuwRaH4QF
	8h7bFXWciso6xq8sOCm2TbM6D3ssnbeXvvb4G4EPlggPLH2QX0ivo2AQEyEo7BjjbeVaIh5yJBui1
	C0228twA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltZl-00000007k6x-0rgI;
	Mon, 20 Jul 2026 19:22:53 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltZi-00000007k4w-1Jyo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784575370; x=1816111370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JHcppqoikoS8e0wMZIde7eaA2lWQyyAwdPloNvfOIcs=;
  b=fNmHhWe7AMxmmM+qyj1PbtTtOcga9FShgN165hsxXeIhURVPmln5uMh0
   D4w3wdF3RL0+mC2zS+FpY9mN8C6WnKhSD2l7hoxxa3nomW7JxdafGoz1v
   ovX+DWoGgXqFyGjfjBbt6Sq0hVy2vV3wq4T8v1VmHP7W6ckvyHwO3kDZN
   xcXHe85W+jPIhgKVv/BJB2KDExdkUx0EImxUMsaFhUEUb7sEtlfcxiodL
   bRYpWfhuz3J3w5MUVI/rLpQbAtqsuV+9/U+CtD0IswaNGGD/FCyvg6oYN
   7zdrHo92e1Ccl1cydXkD6UsNCTfdnu9x/tz8LVLgmXKnRUq9zOxHIg5En
   g==;
X-CSE-ConnectionGUID: X3iQtnjNTGOsGmUY6TssCg==
X-CSE-MsgGUID: jLH1oPDjRSGxFd9sDBBEcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96299855"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="96299855"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:22:48 -0700
X-CSE-ConnectionGUID: LuL0t+6hQgex6EGAUYO66g==
X-CSE-MsgGUID: zUA/8s2zRDq/rrKDCG7NAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="258181719"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:22:46 -0700
Date: Mon, 20 Jul 2026 22:22:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 1/7] spi: pxa2xx: introduce clock enable and disable
 helper functions
Message-ID: <al51g77Zsdr3OyBS@ashevche-desk.local>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-2-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720162117.32304-2-fourdollars@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_122250_407156_BBAF844E 
X-CRM114-Status: GOOD (  20.54  )
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

On Tue, Jul 21, 2026 at 12:21:10AM +0800, Shih-Yuan Lee wrote:
> The driver disables the clock during PM runtime suspend, PM system
> suspend, and device unbinding (remove). It also disables the clock
> on various error unwinding paths in pxa2xx_spi_probe().
> 
> However, if the clock is already disabled (for example, if the device is
> already runtime-suspended during driver unbinding), calling the common
> clock framework's clk_disable_unprepare() again leads to clock prepare/enable
> count underflows, generating kernel warnings.

Any real life example here?

> Introduce pxa2xx_spi_clk_enable() and pxa2xx_spi_clk_disable() helper
> functions that track the clock enable state using a new 'clk_enabled'
> boolean flag in struct driver_data.
> 
> This ensures clk_disable_unprepare() is called only when the clock is
> active, preventing clock underflows during suspend transitions and unbind.
> It also allows the probe function to safely unwind resource allocations
> without triggering clock underflows.

...

Same issue, I have no cover letter in my mailbox. Please, slow down and check
your email setup. Something is wrong.

...

> +static int pxa2xx_spi_clk_enable(struct driver_data *drv_data)
> +{
> +	int ret;
> +
> +	if (drv_data->clk_enabled)
> +		return 0;
> +
> +	ret = clk_prepare_enable(drv_data->ssp->clk);

> +	if (ret == 0)
> +		drv_data->clk_enabled = true;
> +
> +	return ret;

Use usual pattern

	if (ret)
		return ret;

	...
	return 0;

> +}

> +static void pxa2xx_spi_clk_disable(struct driver_data *drv_data)
> +{
> +	if (drv_data->clk_enabled) {

	if (!drv_data->clk_enabled)
		return;

> +		clk_disable_unprepare(drv_data->ssp->clk);
> +		drv_data->clk_enabled = false;
> +	}
> +}

...

> struct driver_data {

>  	void __iomem *lpss_base;
>  
> +	bool clk_enabled;

How is this protected against simultaneously called enable/disable on different
CPUs?

>  	/* Optional slave FIFO ready signal */
>  	struct gpio_desc *gpiod_ready;
>  };

Whenever you add the field, check with `pahole` that the layout is optimal.

-- 
With Best Regards,
Andy Shevchenko



