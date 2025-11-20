Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96693CF649C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 00:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aQcft8ZRvCGOYJYHw9QJlBr72VIq7z5c5cRVWGJD6g=; b=3Tpd7lj8+qFYUu3/XOAlcMaYDj
	4wlJv7kSrBJ+LnpyJLofuUtRvKEEV3fM7X9f6YVZnls0p1PSwjeibC4Usf8vPS9NNySgujL7W0cOJ
	SH3hvmDRVBEi2J4Zr5Y2wBsVHl5xGoUgNtHB8U5tsEYxQm0r5acLLlyxAgZSlA8/qhYmYgUrm3DnQ
	o6QLNlLz5Mj88+Up6XzzHN8BINtri3k1bKGWncZ4dWN5S55NMB9hsDlWYQTlqnuuJPFHuAFX2gJRk
	OWTsMcFY1Tmh7dHqGDpTo/pm33henygwQpj1g5F0T3eVRXl35EupyEmQZ7EK9PYeqQIOIDif7jM1t
	EdwT50Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLskm-00000005tq0-3yI5;
	Thu, 20 Nov 2025 00:42:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLskm-00000005tpu-0KYc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 00:42:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F2516018D;
	Thu, 20 Nov 2025 00:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD29FC4CEF5;
	Thu, 20 Nov 2025 00:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763599346;
	bh=Ajyj6guw9ILg0uUELthy7g4sRzTM7I8Q8BpMXUy4Zz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBv7UVMvJZ3EzYmsKQgv29nHMgeiNXyoojfczj2R/qu5jqzsBbMQT8ucyfYaHHlo3
	 95aVG23IdkWHwM1omBHQ+OP05obSG0tjm+7Oe1lX+PodT7CFz/bWJJPfHZZEXIEmpm
	 OdRJZIJlqg75wz5p+/jdgkIUKMz+azSmG15FG7dtEGQksbMv/lbiNL+r8Puoj9qp6l
	 vVMg6Tu9T+0u6WweiHLH9QE8kg7iOMXtDJ7TeFqT0/1lFAJMUQd5PMixCf4kGCP803
	 5Eid7MvPVPXbsZ9Ye+s8mTo9UuskLEf4epxvxm9twCwIRyB0+DdCMTvXlA2/RjiGVW
	 3vhNbj75aM2Gg==
Date: Thu, 20 Nov 2025 08:24:34 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
Message-ID: <aR5fwvGYqf1MAbq7@xhacker>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-6-jszhang@kernel.org>
 <aR4BWLo4BdyKhnlI@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aR4BWLo4BdyKhnlI@smile.fi.intel.com>
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

On Wed, Nov 19, 2025 at 07:41:44PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 20, 2025 at 12:33:17AM +0800, Jisheng Zhang wrote:
> > Use the modern PM macros for the suspend and resume functions to be
> > automatically dropped by the compiler when CONFIG_PM or
> > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> > 
> > This has the advantage of always compiling these functions in,
> > independently of any Kconfig option. Thanks to that, bugs and other
> > regressions are subsequently easier to catch.
> 
> ...
> 
> >  static struct syscore_ops pxa_gpio_syscore_ops = {
> > -	.suspend	= pxa_gpio_suspend,
> > -	.resume		= pxa_gpio_resume,
> > +	.suspend	= pm_ptr(pxa_gpio_suspend),
> > +	.resume		= pm_ptr(pxa_gpio_resume),
> >  };
> 
> I believe this needs to be thoroughly checked and thought through as
> this is *not* a dev_pm_ops.

pm_ptr()/pm_sleep_ptr() is defined in pm.h, so I think we can make use
of it for syscore_ops as well.
E.g This patch makes use of pm_ptr() to optimize out .suspend/.resume when !PM
while get in them when PM. Thus the same result can be acchieved between
before and after this patch.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

