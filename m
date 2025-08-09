Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA334C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEf0z8FSDwgCU6exrUzPyMW0umuAP7vwj4IIUykCofU=; b=dBloluESzIDwkz8yuBeeCgNGOS
	a64yGrl7iMqLY11MRvKKNL3NBQfcrZ/TbyvJkvB9U4kz5NG6jbLndGGiy/C3yxwZfUvQ8/+WsuPUw
	EnZ92aYjF4DWKxeOj1xy86vmBDZvNkLOBIre3Na05QcZCe4RwGiJQuamgqNvTuunfhS5InyZka00q
	LyO5NT6WSepxtGJ5jd35Zz/gIxoc1ZkR3vOFXdnMPE4cfEBsfCn6aZjXJNPfNib9irqexUek7k2aZ
	qu98a+Z0kpO6vGj0bsKmtnr1GSvA89RDB/sMf8/yF/LhcqAJJPPVxUReOMsCkU2FNQoPFqJ2uwCYH
	xXjxn4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukgjK-00000004MfP-2iS4;
	Sat, 09 Aug 2025 10:23:14 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukggo-00000004MWl-0Us6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 10:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754734838; x=1786270838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eHAWshYo5nna3AmUeod1PTFXIMn1ICMHmBB7kfmM/PA=;
  b=I96UqO/s2MsqAxnoFqgYkki4nqdJAzVvFI1jye+YfF/XmHh0DGxwiqS3
   SzDtRtu3KcFk4c+/G4Ap+DMw0JBTQzEbUyFQlZB0oJjprpUH8NlsU9K2i
   qHlcUK1IfNJY4osS0b3SPPGgzXEyZ/BDEif7OfLDL1qfAPrg6QU8Rhttg
   mQagemh+HKN51pD5Ux6E161TYOHFDRunyUx6amYSfClL/bp2vrwyAmwrE
   zl2KvCsIx8V/m84OPJMsyycTS4ZOk7akLge5S7+gMdZXzHF+2N+NvKXnG
   1vFVJoknj4Rvb/Wmb0QrN0uv1t7VQTI1loqJqHCtS0u0TFOUexQlH3Hm2
   g==;
X-CSE-ConnectionGUID: x7fEEq6ZQbqkSQLhnrHsZQ==
X-CSE-MsgGUID: RPowuaP7TAu4Th7ZvDdcIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="79630885"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="79630885"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 03:16:05 -0700
X-CSE-ConnectionGUID: 2h95dtyqRheD3pXdT0xt/g==
X-CSE-MsgGUID: jijf491uSumE3YvesbUHRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196339261"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 03:16:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ukgcH-00000004cnG-2CH4;
	Sat, 09 Aug 2025 13:15:57 +0300
Date: Sat, 9 Aug 2025 13:15:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 19/21] usb: udc: pxa: remove unused platform_data
Message-ID: <aJcf3UzbRMx-hEab@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-20-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808151822.536879-20-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_032038_225239_FB2E2D6A 
X-CRM114-Status: GOOD (  17.09  )
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

On Fri, Aug 08, 2025 at 05:18:04PM +0200, Arnd Bergmann wrote:
> 
> None of the remaining boards put useful data into the platform_data
> structures, so effectively this only works with DT based probing.
> 
> Remove all code that references this data, to stop using the legacy
> gpiolib interfaces. The pxa27x version already supports gpio
> descriptors, while the pxa25x version now does it the same way.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
See a comment below.

...

>  static int pxa_udc_probe(struct platform_device *pdev)
>  {
>  	struct pxa_udc *udc = &memory;
> -	int retval = 0, gpio;
> -	struct pxa2xx_udc_mach_info *mach = dev_get_platdata(&pdev->dev);
> -
> -	if (mach) {
> -		gpio = mach->gpio_pullup;
> -		if (gpio_is_valid(gpio)) {
> -			retval = devm_gpio_request_one(&pdev->dev, gpio,
> -						       GPIOF_OUT_INIT_LOW,
> -						       "USB D+ pullup");
> -			if (retval)
> -				return retval;
> -			udc->gpiod = gpio_to_desc(mach->gpio_pullup);
> -
> -			if (mach->gpio_pullup_inverted ^ gpiod_is_active_low(udc->gpiod))
> -				gpiod_toggle_active_low(udc->gpiod);
> -		}
> -		udc->udc_command = mach->udc_command;
> -	} else {
> -		udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
> -	}
> +	int retval = 0;
> +
> +	udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);

Missed error check, in particular it will ignore deferred probe case.

>  	udc->regs = devm_platform_ioremap_resource(pdev, 0);

-- 
With Best Regards,
Andy Shevchenko



