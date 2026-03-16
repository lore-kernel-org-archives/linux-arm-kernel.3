Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE09F506D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wk5UVaNS+P8NlqUtcWJ5r7+C8I6RPKAQ8HfHFd9yE7E=; b=Sev0ivFPomh0dYxVY8Xser16hJ
	yKvFdVMGF4g0pyD6DRq5JgzmS+4vn0aoryN8XyFlJe3OG08YJPmJSPINQ/pLU5tzSXEYBgaNmqhJr
	xNWvtSSqWr/LJguHY+NBGo0SRyveq7g45nC2ot77CKBNEaTwJuIXezSwphfJ82/N7Ixj75MCoI8Lb
	gUKcR6kjHgPa8dXVTDaZ+DW8UuYHizFNNKwFiU1jpxe9WFsACIrAj0E/R0Z4gwMrTYHkFpxvfMY20
	cR0qA/MXJEAt1GsONx+Wql6HqR3KsukU6L9kN5Kx+odoNfizKBp4POZ7fUSjYbOSfLTyanZ47qF3y
	taOLXAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28sz-00000004AwD-32EF;
	Mon, 16 Mar 2026 14:25:37 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28sv-00000004Avq-2lUu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 14:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773671133; x=1805207133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BSgg6KtHp+XdA95gnl1/Q020tGtHqDxyhgpg7ceAYDE=;
  b=eFaERYzAU9pNWDyN0ynEjFtl/eejGg7TJ7oYBwgHznEbuc5Tc0KjvJor
   tADrLVj15dZZIg9wCLq5zCuWHI5ELTzZ3p+obErVb5ck6Z3Vov0Nyx6+V
   DwKHo8TBMzsvHBmMb4JbA2kx/mC8ZJxvps0/dfVmCX2LoRJ4wEIfB37qx
   oBqGoddBrzdW6vElKkSKuT0nAgQ65RqDS6YFzc0Ww+pSQhqFz50sNOaT6
   PDJckiIA0wbYnZ4JZSsrBYShYY4iv7uw2/My84uBluKJNW2iyRJYuhHaR
   TUU6g/ZL1r9XdpTI/c0kKPA44jOXbasSHowBKBe1d9cBSEfz5+x/okGeE
   g==;
X-CSE-ConnectionGUID: +XxZAKVpRaSwZ/9eyz+rig==
X-CSE-MsgGUID: D8tbZx3XSiirWWtfrU6vlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73869887"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73869887"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:25:32 -0700
X-CSE-ConnectionGUID: 9dSGBVBxSU+QgCbE+j0MPQ==
X-CSE-MsgGUID: ekmacsyCTWuQio6UChNBFw==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:25:29 -0700
Date: Mon, 16 Mar 2026 16:25:26 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	morris_mao@aspeedtech.com
Subject: Re: [PATCH v2 2/3] iio: adc: Enable multiple consecutive channels
 based on model data
Message-ID: <abgS1lOoEO1RTe9X@ashevche-desk.local>
References: <20260316-adc-v2-0-21475a217b09@aspeedtech.com>
 <20260316-adc-v2-2-21475a217b09@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-adc-v2-2-21475a217b09@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_072533_818825_FC6A26B6 
X-CRM114-Status: GOOD (  15.49  )
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

On Mon, Mar 16, 2026 at 11:00:47AM +0800, Billy Tsai wrote:
> Add helpers to generate channel masks and enable multiple ADC channels
> according to the device model's channel count.

...

> +

(1)

> +/*
> + * Enable multiple consecutive channels starting from channel 0.
> + * This creates a bitmask for channels 0 to (num_channels - 1).
> + * For example: num_channels=3 creates mask 0x0007 (channels 0,1,2)
> + */
> +static inline u32 aspeed_adc_channels_mask(unsigned int num_channels)
> +{
> +	if (num_channels == 0)
> +		return 0;

> +	if (num_channels >= 16)
> +		return GENMASK(15, 0);
> +	return GENMASK(num_channels - 1, 0);

This entire function can be folded into

	return BIT(min(num_channels, 16U)) - 1;

Or

	if (num_channels > 16)
		return GENMASK(15, 0);

	return BIT(num_channels) - 1;

> +}

> +/*
> + * Helper function to enable multiple channels in the control register
> + */
> +static inline u32 aspeed_adc_enable_channels(unsigned int num_channels)
> +{
> +	return FIELD_PREP(ASPEED_ADC_CTRL_CHANNEL, aspeed_adc_channels_mask(num_channels));
> +}

> +

One of these (see 1 above) new blank lines should be rather added in the previous patch.

>  /* Battery sensing is typically on the last channel */
>  #define ASPEED_ADC_BATTERY_CHANNEL		7

...

>  	/* Start all channels in normal mode. */
> -	adc_engine_control_reg_val =
> -		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
> -	adc_engine_control_reg_val |= ASPEED_ADC_CTRL_CHANNEL;
> +	adc_engine_control_reg_val = readl(data->base + ASPEED_REG_ENGINE_CONTROL);

> +	adc_engine_control_reg_val |=
> +		aspeed_adc_enable_channels(aspeed_adc_get_active_channels(data));

Why not FIELD_MODIFY()?

>  	writel(adc_engine_control_reg_val,
>  	       data->base + ASPEED_REG_ENGINE_CONTROL);

-- 
With Best Regards,
Andy Shevchenko



