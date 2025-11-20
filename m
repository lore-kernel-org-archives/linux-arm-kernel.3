Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC7DCF649E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 00:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Lb43LxAyKFFdyU1hoOXfrqLJGDuZ9WpJ8cCJh0D4hw=; b=nSIAdPHsbwFmILH2XXApxUcZKC
	Tgy10MYiIFZG+rouDR6NmDGm1OobUa1UVZdonDgBZ8CWNun60L3XRl2OXnlJ0MtX4MQbCw36D/TdB
	UHyqBjci4MZVGu8k/mf2m4yAofatTUDe6RQsV08sRi034fWwp4SXE7pwtJ6pGw5MoqydZaVL/lzHi
	0bqs15Vz7gdUqBnX+Mmkc55ZCKlDiWbwKGFFoo/CQmJM0MVilKhCoDp96xktUBE+/jQ/pIUB46IzA
	7pp2MKfvApNzk10iiUIJ6SxX21UVZl18ToMo9XbIEvq7l5+/c/CVZVOZu5dUQzVtphEQPDAvo5b+P
	1ONJba2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsXA-00000005tIL-37rW;
	Thu, 20 Nov 2025 00:28:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsX8-00000005tHb-1ATX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 00:28:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB23641A9D;
	Thu, 20 Nov 2025 00:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D13EC4CEF5;
	Thu, 20 Nov 2025 00:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763598501;
	bh=WE4dW3eUoC04Cv20exXr2znqJM0ssIf18VtMt9cY1Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3fAf1fEjlc6JfEMeWVU8D8PY8Mp0elxZly9c1vM+iApTrCF1jVRJQKuUuJ5SH3wQ
	 M5e/rillypC8dVafplgA+XZNNgRSkQAJKJbP6hP/2vwkEF9AkxBzhlZ8UiecV2umP0
	 G0vpANV4Px5paJ95EGxblaLnT7qX+bNHj2/YWH+cNGPbzaMYz6BcoF/Acw6/DvLw7X
	 GTO/LzCcKRwUGVfNiaq3mOmk0tFnn33Fj/Ij6mD9GVFwFPIzCfJCpPrlsbA+th9/PA
	 6siC08YuAQf8xsMtS2jSOk82gaEUjvZqyLoYK9Ft9xP9Q/EGWNm6H883T7Pccjp+LL
	 0M2Foj/imHjuA==
Date: Thu, 20 Nov 2025 08:10:28 +0800
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
Subject: Re: [PATCH v4 11/15] gpio: tqmx86: Use modern PM macros
Message-ID: <aR5cdOOKl1Anji1h@xhacker>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-12-jszhang@kernel.org>
 <aR38PkERpLxXhNfD@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aR38PkERpLxXhNfD@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_162822_338973_554A43FD 
X-CRM114-Status: GOOD (  16.21  )
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

On Wed, Nov 19, 2025 at 07:19:58PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 20, 2025 at 12:33:23AM +0800, Jisheng Zhang wrote:
> > Use the modern PM macros for the suspend and resume functions to be
> > automatically dropped by the compiler when CONFIG_PM or
> > CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused
> 
> ...
> 
> >  static const struct dev_pm_ops tqmx86_gpio_dev_pm_ops = {
> > -	SET_RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend,
> > -			   tqmx86_gpio_runtime_resume, NULL)
> > +	RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend, tqmx86_gpio_runtime_resume, NULL)
> >  };
> 
> ...
> 
> >  static struct platform_driver tqmx86_gpio_driver = {
> >  	.driver = {
> >  		.name = "tqmx86-gpio",
> > -		.pm = &tqmx86_gpio_dev_pm_ops,
> > +		.pm = pm_sleep_ptr(&tqmx86_gpio_dev_pm_ops),
> 
> For RPM this should be pm_ptr(), no?

Indeed, pm_ptr() is better. Thanks. Let me do it in next version, I will
wait for one or two days as Bart kindly reminded ;)

> 
> >  	},
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

