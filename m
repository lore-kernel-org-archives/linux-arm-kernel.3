Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A2ACA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 20:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AVMETFFG1sRXEm+LC8z/1HU6yTWzwSfDnG+HzRWYt4=; b=TVJPWHiBchC/K5fWo34MNtP3l5
	tId2HAZd1gp2KsML7uP1c8Xzg1YMEsacEINqVmijQw4gkRWsABiDinnR5dwLKOvATbxWR9hTItNfP
	ZBth+BDeNWV6wvYMjTPa7mNmnMPEshsqKL5HggSRQlhAUwCWM8rFkUdYYI8nMj3TODMoXnhJq3r/3
	QjYU3q16j9e1MlG78uvqrFIDCBWfqstzkAGoERnRPb0PRq98WGsb+G6sGkbk5N94UQiAaR1FX6rP0
	cVOM4SedEHkjYZ1OsOoDlECS8ake8rMiqPaevZZ0FyojjGVw2zNyX3a1W5NzVDuod8AZUa+mbxHfx
	yKGwi0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utteZ-00000007WXO-2C9g;
	Wed, 03 Sep 2025 20:00:23 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpiX-00000006xz4-21Vh;
	Wed, 03 Sep 2025 15:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756914494; x=1788450494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ibe9kE7bJQVzmN0iWK+qfrTbPUnPCwHMYJUF1OEdNRc=;
  b=P26X69lcPMH25GGZDSy1cgmAT1yfTFml3mJGa1nC22tao2dZygKAbnZ/
   yyN9jVxU78v+bbchyPCksLE1Pi9Ejcz9Rqg/aJPmr/h2WweErpNBDA8PG
   ZGwdZHWOOklYk5dENOo5NPtyGWd8SneME182VVd+m12mBcnygLQESxdcU
   85WNbiq00X37nUA/0GnGNlDyeMjw3PC4+BE7mznx4E9zYU6cdr+FeQidm
   TOMjD7m1fsggZNEu6mH9kHh/+G9a+OKuPAH5aIxFhiV/93+pD7P4U9nJm
   CJ0v2AsaCWpCfIjxJTXbhimWJagwUtxuokmhYCxLuNj+GhjZyMcjTqhay
   w==;
X-CSE-ConnectionGUID: bL20pRugQrm4bEVqO5tirQ==
X-CSE-MsgGUID: Tb24+5HbQjmMyX9msUY/Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76678528"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="76678528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 08:48:13 -0700
X-CSE-ConnectionGUID: tJhmELzKQICPQfuLn4iUQg==
X-CSE-MsgGUID: LxeRLip3RROHG4izuv4+mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171185220"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2025 08:48:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5F61595; Wed, 03 Sep 2025 17:48:08 +0200 (CEST)
Date: Wed, 3 Sep 2025 17:48:08 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 07/14] gpio: ts4800: use new generic GPIO chip API
Message-ID: <aLhjOAttpdT--tW7@black.igk.intel.com>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-7-356b4b1d5110@linaro.org>
 <aLhie72v1T9Bw1vx@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLhie72v1T9Bw1vx@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_084813_567743_9F0A6D8C 
X-CRM114-Status: GOOD (  19.26  )
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

On Wed, Sep 03, 2025 at 05:44:59PM +0200, Andy Shevchenko wrote:
> On Mon, Aug 25, 2025 at 11:48:48AM +0200, Bartosz Golaszewski wrote:
> > 
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.

...

> > +	config = (typeof(config)){
> 
> First of all, what's wrong with the pattern used in the kernel when we
> explicitly show the compound literal? Also we put a space before {.
> 
> > +		.dev = dev,
> > +		.sz = 2,
> > +		.dat = base_addr + INPUT_REG_OFFSET,
> > +		.set = base_addr + OUTPUT_REG_OFFSET,
> > +		.dirout = base_addr + DIRECTION_REG_OFFSET,
> > +	};
> > +
> > +	retval = gpio_generic_chip_init(chip, &config);
> >  	if (retval)
> > -		return dev_err_probe(dev, retval, "bgpio_init failed\n");
> > +		return dev_err_probe(dev, retval,
> > +				     "failed to initialize the generic GPIO chip\n");
> 
> Second, can't it all be hidden in the GPIOLIB just by passing the pointer to
> the above initialised structure? Yes, it will take a pointer space in GPIO chip
> for all, but I think it will reduce the burden.

Okay, it seems the motivation is to make it in align with, e.g., gpio-regmap.
But why not simply convert the drivers to use gpio-regmap instead?

-- 
With Best Regards,
Andy Shevchenko



