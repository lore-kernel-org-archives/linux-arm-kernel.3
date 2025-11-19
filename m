Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B46CF58C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cfTisswQ6sIAgWdgfBibmTyK7jFDrPc7CTycsulMr0=; b=cSwfCHw5Kf0cxTgrGuMe2g07gX
	ENCrlBPiYvVP6aWVytC7s77lKdqU9l9kDSsGrJ4gTL03MH81K1zU60SSi2YZJgyjRCkgq97WEkS24
	wfcbKzMEdRIBjJ2CN7qsyOxRqca0jOK0oZL5gxA697t9cawL+ULUUoXjv424qQxnLbbapspu3VQVZ
	yuJ/orwq0SGqYLuZy6I9TlmfJ/uSBfyeClVzJHFWdmtxD/8hT1DNzenzpC2VT3wdymVew/38uz9jS
	8PkaDUaw0YZDiqa0HwZP/cNXBzdV/bzmPozi+3GxsnzdpAtdbO+hejEkaBA+XH3OHqQ4IRZTkbiJT
	BKsS/hEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmBn-00000004DZf-0pYL;
	Wed, 19 Nov 2025 17:41:55 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmBk-00000004DZH-392L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 17:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763574113; x=1795110113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q4ogyePfvPPVC198borYC1IEQLnRNOOxPn543dof334=;
  b=IFYK14Aj8wYDemfwlRvM/PaeU4byJVfQF9JNt3JA13qD07AQRt87ZMaS
   C80oTN/4gBCnAOf+kYT2iuDA9eEnCoK7Pk1qbckWFn9ptDCyRbQHmMyYv
   EwEukpIoK3Y4j19zAV/qyCyJJRQClx/Rk/ZTciHlPdeiGVPS2NgHLtYlz
   nFQqW+gHjq5LfgGR3gjHCsC9Pp00HS5obnVqooWeFgXW7XZHcth5qFn6H
   BsFcSfNOI1GlMkdj+L5CJHS0dMHuvmCmoCRC0k1HMf5HCCfe4RL3zkM/N
   WjnGXNo8zuRH0VsFyga1Qlr3aQ1ESx8eHqM1DaObSSvVZTtnJqpvx3D8j
   w==;
X-CSE-ConnectionGUID: PzmjpnrVSmO+t0BPghTgsw==
X-CSE-MsgGUID: jwuGs1TLQ1yTXV3zgd2hiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69492252"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="69492252"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:41:52 -0800
X-CSE-ConnectionGUID: QA3EiLidSZC7kxroBm3LWw==
X-CSE-MsgGUID: ZGup7eNSRe+q+/IkGlUXng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191918464"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:41:47 -0800
Date: Wed, 19 Nov 2025 19:41:44 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR4BWLo4BdyKhnlI@smile.fi.intel.com>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-6-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119163327.16306-6-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_094152_847032_720AAEAB 
X-CRM114-Status: GOOD (  13.70  )
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

On Thu, Nov 20, 2025 at 12:33:17AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

>  static struct syscore_ops pxa_gpio_syscore_ops = {
> -	.suspend	= pxa_gpio_suspend,
> -	.resume		= pxa_gpio_resume,
> +	.suspend	= pm_ptr(pxa_gpio_suspend),
> +	.resume		= pm_ptr(pxa_gpio_resume),
>  };

I believe this needs to be thoroughly checked and thought through as
this is *not* a dev_pm_ops.

-- 
With Best Regards,
Andy Shevchenko



