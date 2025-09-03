Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE8ECA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIXMvGqfXdYiAbZkWQSwKWDwnY4kZ7HlWOtTEmHX7l0=; b=Ht8jhsX4aCd/o74yI58Hy3oYdL
	Px2qoTWfiZMeKh4X1WjBMfESqKfc7GubthbQbTSn3Vms7x1M+u9PzsNwLRN573KCwu3sT/cik1aea
	vdU37cA52SXiIZNmEBJYGE2PFRm4ynQQxRRINUQp1EHwaUzxy9pjqik9QxUDpL69Ju6MOuqsh9tIw
	1l5MH8aYl3aBAWC4GKSTKB/OuMTSRxrra6LQL3SANECpHsSMagVDQe2pr9ygkJjbHk9r9dyG4a0MD
	1vyeyPIplt9HzLe/olOpA8Kqp7fyzSIw+gNFvhKGvWmkFCGlx7CgNwIZjd09U7fO5YuWZ1ExvNchD
	gObItHGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uttbu-00000007WDm-1JHo;
	Wed, 03 Sep 2025 19:57:38 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpfU-00000006xPY-3AFK;
	Wed, 03 Sep 2025 15:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756914305; x=1788450305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RmIXgX4EPYbEWf+ZuRyxg8gVS0O/rPn4FNVOhp5P5DQ=;
  b=HUmjNwYefqozFulfvhzDN4QhVqH6Rc8D/xaqEZerat3IAxge0JcwGhxp
   BvM8AJbl8chb3ji0nPRPsOPtmRjDmQ7r/0Y9oRxHgr4k+jT+KMQlN9MNw
   2ptEobpSm06TE2cEELonEsxOW/4QV3q7YeutEIWkrz6TkW6S03eSeuUxc
   8DseELcQ+NZjewJWuf/j4cz0ughOJoD9y9KeQjpFQxwUV936IRnSJOxz8
   mGUReOj4wCj8+aM4UAY7tZFC4aQsUS4JWn8jQvt/z1MCNjjNQSz3FCTPb
   NwKg3Lj94HDyQf9n3dx6+kB0lHpmpIwr3X3HZWbSOc2q3LO5Zl75xfHGM
   w==;
X-CSE-ConnectionGUID: nNSvh+b5QGaWQfifrgqLsw==
X-CSE-MsgGUID: x/WJa1sJTRCWtrucmYYHgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="84662831"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="84662831"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 08:45:04 -0700
X-CSE-ConnectionGUID: iISP29WiSIKcCafvMOGpUw==
X-CSE-MsgGUID: JOSrHn6xRGumw7gqBYMURg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="175985164"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2025 08:45:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D7E0695; Wed, 03 Sep 2025 17:44:59 +0200 (CEST)
Date: Wed, 3 Sep 2025 17:44:59 +0200
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
Message-ID: <aLhie72v1T9Bw1vx@black.igk.intel.com>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-7-356b4b1d5110@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-7-356b4b1d5110@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_084504_806786_49CD1F90 
X-CRM114-Status: GOOD (  15.09  )
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

On Mon, Aug 25, 2025 at 11:48:48AM +0200, Bartosz Golaszewski wrote:
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.

...

> +	config = (typeof(config)){

First of all, what's wrong with the pattern used in the kernel when we
explicitly show the compound literal? Also we put a space before {.

> +		.dev = dev,
> +		.sz = 2,
> +		.dat = base_addr + INPUT_REG_OFFSET,
> +		.set = base_addr + OUTPUT_REG_OFFSET,
> +		.dirout = base_addr + DIRECTION_REG_OFFSET,
> +	};
> +
> +	retval = gpio_generic_chip_init(chip, &config);
>  	if (retval)
> -		return dev_err_probe(dev, retval, "bgpio_init failed\n");
> +		return dev_err_probe(dev, retval,
> +				     "failed to initialize the generic GPIO chip\n");

Second, can't it all be hidden in the GPIOLIB just by passing the pointer to
the above initialised structure? Yes, it will take a pointer space in GPIO chip
for all, but I think it will reduce the burden.

-- 
With Best Regards,
Andy Shevchenko



