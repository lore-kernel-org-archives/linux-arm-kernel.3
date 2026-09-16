Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90851C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TgbcRDl0LnWMPb+nwlHQ7XoH/41SE6ESgqz8uxDQlk=; b=CSocrpq0ucf+4V2x0Vbs/9n5nY
	uBACu3L8CKcP9244NuzexavUTDurufmPBmqDZtabC/yN4QuspoAtZ1CVx4midsZlFg+++wCC/x4Dz
	bprAveCP7iX6aV9cCZIELGlBtycanJ0aE90xqCYAaJ4C8+ED5OSJUCuSK0WrYSwHqVrBh50QPljAW
	OQbrFVDwm4KPGVWbrdEsduFSkrJCIknKsGkmhjozB/KSGUnlMHtYqGyP+I8UJzaaKkgcAPkL+5Xvh
	zCTBHF02Jy/pJu413Uy5VcxNvFX7SFbHQgfbQh5H6sKPVMqctwWNJPHXkf1D8XEmBxWUXkJTL2pYv
	2zxBw9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kKb-00000008cJt-1LlB;
	Wed, 16 Sep 2026 07:45:25 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kKX-00000008cJT-3Vr2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789544722; x=1821080722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2oleBu2ZyXTqH7IkiY2FnDAfDfVgurItEBflxV+93NA=;
  b=ES/0pMxsoeP4ZJa/tC1mPEKGfOxb8OP1gL2J8GhHBklaXu7XipAnRUOO
   rHVSjBqxl+isBLGkkaLpt1tjKiOoxLmRQo4vcsHi46Co81pqxbvr56fLI
   jhDg5Qe0x5eJMfBsRpehTaYXEKzIa5p3dNOkd8hWQhwSOS6ksJk6aqKyk
   hk9lB0uvTkL1hnCe0Aqo/GnnaUCDUbRSQSubzpb5SRLCahY/F12QMTwJz
   8yPrNy6LX2wdil/3GkIJtKjddV5Gpy1ooS7h+47cgc2wDckgksyoeUtW2
   Vli5o2ji+1KvxkkcUjONq0rELrrmTKWKDwLeMq3te41h1gVs/+IvurkHU
   A==;
X-CSE-ConnectionGUID: P8Ib8g9JRdCZUxdO4hZjMw==
X-CSE-MsgGUID: 4parpxtsQ9+XHllJebLG/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100579787"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100579787"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:45:20 -0700
X-CSE-ConnectionGUID: BQV/x/2rRbWb7yalBTZ5Qw==
X-CSE-MsgGUID: QduNPbCCTtG8DYwiVMlcrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272788606"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:45:16 -0700
Date: Wed, 16 Sep 2026 10:45:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] iio: adc: stm32-adc: fix check on internal channel
 availability
Message-ID: <aqpJCsBNKDSKlfFD@ashevche-desk.local>
References: <20260915-adc-fix-intchan-v1-v1-1-761a1b35001b@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-adc-fix-intchan-v1-v1-1-761a1b35001b@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_004522_759141_EBADD0C3 
X-CRM114-Status: GOOD (  23.07  )
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

On Tue, Sep 15, 2026 at 06:15:49PM +0200, Fabrice Gasnier wrote:
> If an unsupported internal channel like vddgpu is requested, the driver
> prints a warning but falls through and assigns it a valid int_ch below.
> 
> This causes a problem later during setup:
> stm32_adc_int_ch_enable() {
>     ...
>     case STM32_ADC_INT_CH_VDDGPU:
>         stm32_adc_set_bits(adc, adc->cfg->regs->or_vddgpu.reg,
>                            adc->cfg->regs->or_vddgpu.mask);
>     ...
> }
> 
> Because the register offset is uninitialized (0), this performs a
> read-modify-write on offset 0, which corresponds to the ISR register.
> 
> Fix this by returning before a valid int_ch is assigned.
> Choice is made to just warn about the channel name as it could
> be confusing, rather than making the probe fail.

Are this and the other patch made with AI assistance?

...

>  	struct stm32_adc *adc = iio_priv(indio_dev);
>  	u16 vrefint;
> -	int i, ret;
> +	int i, ret = 0;

No, either assign closer to its first user, or do even better.

>  	for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
>  		if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
> @@ -2267,31 +2267,36 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
>  			switch (i) {
>  			case STM32_ADC_INT_CH_VDDCORE:
>  				if (!adc->cfg->regs->or_vddcore.reg)
> -					dev_warn(&indio_dev->dev,
> -						 "%s channel not available\n", ch_name);
> +					ret = -ENOENT;

This is a repetition of the same value. Instead add a boolean flag and do here

	bool na;
	...
			na = false; // or can be dropped with 'default' case
			switch (i) {
			case STM32_ADC_INT_CH_VDDCORE:
				na = !adc->cfg->regs->or_vddcore.reg;

>  				break;
>  			case STM32_ADC_INT_CH_VDDCPU:
>  				if (!adc->cfg->regs->or_vddcpu.reg)
> -					dev_warn(&indio_dev->dev,
> -						 "%s channel not available\n", ch_name);
> +					ret = -ENOENT;
>  				break;
>  			case STM32_ADC_INT_CH_VDDQ_DDR:
>  				if (!adc->cfg->regs->or_vddq_ddr.reg)
> -					dev_warn(&indio_dev->dev,
> -						 "%s channel not available\n", ch_name);
> +					ret = -ENOENT;
>  				break;
>  			case STM32_ADC_INT_CH_VREFINT:
>  				if (!adc->cfg->regs->ccr_vref.reg)
> -					dev_warn(&indio_dev->dev,
> -						 "%s channel not available\n", ch_name);
> +					ret = -ENOENT;
>  				break;
>  			case STM32_ADC_INT_CH_VBAT:
>  				if (!adc->cfg->regs->ccr_vbat.reg)
> -					dev_warn(&indio_dev->dev,
> -						 "%s channel not available\n", ch_name);
> +					ret = -ENOENT;
>  				break;

Don't you also need a default?

			default:
				return -EINVAL; // for example...

>  			}

			if (na) {
				...
				return 0;
			}

>  
> +			if (ret) {
> +				/*
> +				 * Confusing channel label matches an internal STM32 ADC channel.
> +				 * Just warn about it, as there's normally no restriction on the
> +				 * name but that's not among supported internal channels.
> +				 */
> +				dev_warn(&indio_dev->dev, "no %s internal channel\n", ch_name);
> +				return 0;

My gosh, the ret value is even ignored!

> +			}

-- 
With Best Regards,
Andy Shevchenko



