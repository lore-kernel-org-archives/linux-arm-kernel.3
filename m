Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318E2C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 23:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtpQrrpJTcuq4sh0RF02CMt1hhGMgSXKF+99m/NQzZk=; b=xg0poglVyCquCFbr974LwD2F6e
	kg3gkY+20PQP4opDywMOpFSA2AeMIiwOc/YHFVX6OuRzZ0nMCMI0/Rd6VqpAAduTr4nEIEOrWRosJ
	ot4Qsc9dLcJ2RhAdYKMuu8u4KMptB5pm3N/0NEgaB+8DZAODG6ySltJo/Wxzv9IMWuMWfG0KL3whH
	KqswCPq6kXHS93Tcl4DjBnHAuP+i/TxeTaB//GDTt1P3YRNQybDtsHFpuE9YuCdTGyVp3S7IBL6y/
	Tqx+P1NpRYPz20NqpkABZQGhV7GpAqg0Ox5NV5QEIW+/oxU0MqWm3ZapXAiVzfmkE3cI0D3+dyB1h
	POS1Wigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7rH-00000006sAX-3hU0;
	Thu, 06 Aug 2026 23:50:43 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7rE-00000006sA7-3cSz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 23:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786060241; x=1817596241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kKLOSlFiKcKTHwiRLrLPxhtjlh2a0eF4wg9zelMpFRk=;
  b=IsVfiZJ16EXUOIeeS4lq5AX/b5Q3jHyiBw8XL4lMcoDgqiHg2Zlo4GjT
   /uI6+uiEDqIIqfwmP7GsTIKgpH1/MlZFyZFoEha59KjFFGh65lcI9cd7A
   JjaSJAFVP+jf7gArjmzH1uZ9oOcZp4WmpVtq37IHiidit0w347Fzps4Rx
   vwvypbc5Q+ntk3IZGqi/9RoKS8A1BEyK+Xf/nbaTF9QofsxlR009s4DvH
   XUISSvAaKlaEzfGaTRKGdRnSMLPh5tPj24WeeiXH8PCKBjtFiIAnfB8VE
   BX1QzNMRW7oEl4m6ZsAPYOx+Hyn1wjTPnXNsJ2AhzvZRhqY2sTNDcC+ia
   Q==;
X-CSE-ConnectionGUID: HVQwDHUqS8uKsjETor+0ew==
X-CSE-MsgGUID: Xk9yfJycQGKGcOXqWYYgqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86606914"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86606914"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:50:39 -0700
X-CSE-ConnectionGUID: pDQtYCSCRAKL//ir7Y0GPA==
X-CSE-MsgGUID: 0JzKfXPLTkSZA5H5+0xUfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="260964048"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:50:36 -0700
Date: Fri, 7 Aug 2026 02:50:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v2] iio: adc: bcm_iproc_adc: Convert probe() to use
 dev_err_probe()
Message-ID: <anUdydEokIvj2pyO@ashevche-desk.local>
References: <20260727034009.5c6b0be9@jic23-huawei>
 <20260730140405.369634-1-mdshahid03@gmail.com>
 <20260730140405.369634-2-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730140405.369634-2-mdshahid03@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_165040_969741_C07868D8 
X-CRM114-Status: GOOD (  16.63  )
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

On Thu, Jul 30, 2026 at 07:32:45PM +0530, mdshahid03@gmail.com wrote:

> Replace open-coded probe error handling with dev_err_probe() for
> resource acquisition and initialization failures.
> 
> This simplifies the error paths, avoids repetitive error handling,
> and automatically suppresses duplicate messages when -EPROBE_DEFER is
> returned while preserving the existing error messages.
> 
> Also remove the redundant error message after iproc_adc_enable(),
> allowing the error to be propagated without additional logging.

...

> static int iproc_adc_probe(struct platform_device *pdev)

While at it, consider adding

	struct device *dev = &pdev->dev;

at the top of the function to simplify the below calls.

>  	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
>  			   "adc-syscon");
> -	if (IS_ERR(adc_priv->regmap)) {
> -		dev_err(&pdev->dev, "failed to get handle for tsc syscon\n");
> -		ret = PTR_ERR(adc_priv->regmap);
> -		return ret;
> -	}
> +	if (IS_ERR(adc_priv->regmap))
> +		return dev_err_probe(&pdev->dev,
> +				     PTR_ERR(adc_priv->regmap),
> +				     "failed to get handle for tsc syscon\n");

		return dev_err_probe(dev, PTR_ERR(adc_priv->regmap),
				     "failed to get handle for tsc syscon\n");

>  	adc_priv->adc_clk = devm_clk_get(&pdev->dev, "tsc_clk");
> -	if (IS_ERR(adc_priv->adc_clk)) {
> -		dev_err(&pdev->dev,
> -			"failed getting clock tsc_clk\n");
> -		ret = PTR_ERR(adc_priv->adc_clk);
> -		return ret;
> -	}
> +	if (IS_ERR(adc_priv->adc_clk))
> +		return dev_err_probe(&pdev->dev,
> +				     PTR_ERR(adc_priv->adc_clk),
> +				     "failed getting clock tsc_clk\n");

And here, and so on...

...

>  	adc_priv->irqno = platform_get_irq(pdev, 0);
>  	if (adc_priv->irqno < 0)
> -		return adc_priv->irqno;
> +		return dev_err_probe(&pdev->dev,
> +				     adc_priv->irqno,
> +				     "failed to get IRQ\n");

This is wrong. The above call print an error.

>  	ret = regmap_clear_bits(adc_priv->regmap, IPROC_REGCTL2,
>  				IPROC_ADC_AUXIN_SCAN_ENA);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to write IPROC_REGCTL2 %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				     ret,
> +				     "failed to write IPROC_REGCTL2\n");

It's a one line still (with the above change):

		return dev_err_probe(dev, ret, "failed to write IPROC_REGCTL2\n");

>  	ret = devm_request_threaded_irq(&pdev->dev, adc_priv->irqno,
>  				iproc_adc_interrupt_handler,
>  				iproc_adc_interrupt_thread,
>  				IRQF_SHARED, "iproc-adc", indio_dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "request_irq error %d\n", ret);
> -		return ret;
> -	}

> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				     ret,
> +				     "failed to request IRQ\n");

This should be a separate patch to drop the dup message. The IRQ core prints
it.

...

> +		return dev_err_probe(&pdev->dev,
> +				     ret,
> +				     "failed to enable clock\n");

One line.

-- 
With Best Regards,
Andy Shevchenko



