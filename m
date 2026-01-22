Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC8DD3EE75
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7H/lFWgDCgKocbgrafUWtuq2P6PmvNus5a2IO1XQ9g=; b=tTAnf6mzIpqfhr/1UeR34KrRT3
	dI6L4FnBWrqc0IZimm6H0UucpjCqhya4gyWaiPBPmshiJxz3oIw+U+bmU2GG1gaLjy2qgT7p8tEma
	GTkFy1cmmw+4t2CJ67ZlwxLnBswrerxSNj7kUReKdw0WyFKJhaUilSIESPqcEAssiFaCJXyM2deSf
	m6zDCwDcq64xncLmEDCYgbfUFgqbLoXUFI/FXlqdtYhz8kUiY1SAYLrQE8VXWnZVJrFRP1vULfcpW
	2JLRo/z5qo5IqZzC/2jksKBmbpSLqEbpz6WzU/k2B9MPSbc4pBiL5yfHL9NTWuSjf+AwMBgbY72YY
	g2bcvGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwHV-00000007IbX-3SyM;
	Thu, 22 Jan 2026 15:07:33 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwHS-00000007Iax-0etJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769094450; x=1800630450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yu8hIcz6LsJdSdVI0ARln3Qs2ekXTeI4xd+A/dSoqNE=;
  b=bzmdKvbLKvep9TiV4KA+wd2HAHFz/yhcughWx/lPBdaxEezqFvB/gCFT
   BsaqviMk8t75bmyQ+gHKyc57XBWlitOT59S36pTRdWQc9cO4YUV+dWffU
   xctuNmG2912R+ig8jAwq4O5zOMMRsSP2N7bjpAYGy0NwvcUM6BWmyr1+T
   nc+PaRy4Ki8+Y10tNiTvm0dU54UdaVbP9kI8OJw3qMFVsUvkjEnWRWzvl
   IdDb7KOTSYMZzQYsnD86Qps67Ol1eFWfzbLRiy6mGGRArCr7xZ08idCG1
   IaQPIGqLpP1+8DuqyDDvaAdsdAL+kLDh36JYzgO9DcMI2GEyBw8mrYyZa
   g==;
X-CSE-ConnectionGUID: yDo6f4cFQ5a00XqcdOM5Vw==
X-CSE-MsgGUID: r5uXbDsKQLS+RvzkDpk1Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87915298"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="87915298"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:07:28 -0800
X-CSE-ConnectionGUID: lrGmoEL/Ta6R+1zUAMw9RQ==
X-CSE-MsgGUID: lDSlKKAkSMqleLtnDd4eAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="244370822"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:07:23 -0800
Date: Thu, 22 Jan 2026 17:07:20 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/4] ASoC: ac97: Convert to GPIO descriptors
Message-ID: <aXI9KKlohbA1ySB0@smile.fi.intel.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
 <20260122-sound-cleanup-v1-4-0a91901609b8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-sound-cleanup-v1-4-0a91901609b8@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070730_206613_57801DA4 
X-CRM114-Status: GOOD (  16.89  )
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

On Thu, Jan 22, 2026 at 08:45:00PM +0800, Peng Fan (OSS) wrote:

> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get to get GPIO descriptor, and set consumer
>    name.
> 
> Since the driver still pass the reset_gpio to pxa27x_configure_ac97reset,
> so use desc_to_gpio() to get it gpio id.

GPIO

Why can't we convert that one to use GPIO descriptor to begin with?

...


>  	if (dev->dev.of_node) {
> -		reset_gpio = of_get_named_gpio(dev->dev.of_node, "reset-gpios", 0);
> -		if (reset_gpio == -ENOENT)
> +		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
> +		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
> +		ret = PTR_ERR(rst_gpio);
> +		if (ret == -ENOENT)
>  			reset_gpio = -1;
> -		else if (reset_gpio < 0)
> -			return reset_gpio;
> +		else if (ret)
> +			return ret;
> +		reset_gpio = desc_to_gpio(rst_gpio);

Also, have you considered moving towards 'reset-gpio' driver?

...

And last but not least Q, have you checked gpiolib-of.c if there is any quirks
regarding this case (might be some fixes related to polarity)?

-- 
With Best Regards,
Andy Shevchenko



