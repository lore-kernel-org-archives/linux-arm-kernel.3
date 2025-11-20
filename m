Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89829CF6497
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 00:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvT5Gi53aFsmwNQccuYOAkTSlCoswKi6VFFg6wnMjEo=; b=erT+v/fkbJReMmXvVRkrt7ZP/k
	l/70khhYLWh4tYIn7MfJgZpITyxkcgq9TvGT+Dfjg+Nc6dqWAaXpW3GNDdPEaHf7Ba3nUfj3tsbbs
	rEezoOipBlwVjOxJ4fpbsFB3WWS2xmfdRpqtqz+QQkGxAwzBZOmDfyA+xmTJqVdDRRFAZ6TAlwB7j
	tf9dydtEaaHtIeh662hsSisaouXsRMXl11UNd+wiPiD1RG58Z9CZUvWDvm+X8MyNI1Rim/b/atKXi
	kpdAOJesHcLzX04FqGVoNZE1VmZJ09xQOPyr6bg17umPQIfJv1lE6qMQbWTASx3cPNZvEsaWbj1QA
	iqT2LIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsoT-00000005u1q-26EE;
	Thu, 20 Nov 2025 00:46:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsoR-00000005u1V-3MdM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 00:46:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33F9860174;
	Thu, 20 Nov 2025 00:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCD4C4CEF5;
	Thu, 20 Nov 2025 00:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763599574;
	bh=V+lbau4ImiiyPpelZNyUjrC1edHPTz1Ab2ur4WE0RJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnJQBFzneWDiAgLExO/LCxn62DHBVvuSu8IeCo094JIS7t8nW5OKL+fekyx6XZ1nN
	 P0Pxfk6AvPK+q67YosInlD3k4aXkiqTK/go3gGfVhwYw8hkqbA1HIGSjYKw9yWDn6l
	 UVYKZ98zZOUDkoTztJrAuVlM3fDU+hQGzzRqsVRg/7sYx8k00rgn6Q/X8Xlt+mRgJH
	 YtSA0rt+/6siBRGtO+zvpUHWI4kjmzDuOk4Ar+DaznKSFsSfAunJyj2UVyByH3lkM2
	 V/TgfWRtyaxwz139B0GW7PIR9Y0TGEVBu6YApjZdp3KnYhLd4FNtT+6FYSR8QF7cY7
	 SYNEItuNm7Igg==
Date: Thu, 20 Nov 2025 08:28:22 +0800
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
Subject: Re: [PATCH v4 02/15] gpio: brcmstb: Use modern PM macros
Message-ID: <aR5gpsbw_r-y4JdS@xhacker>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-3-jszhang@kernel.org>
 <aR4CLQ_2-kUM-e2F@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aR4CLQ_2-kUM-e2F@smile.fi.intel.com>
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

On Wed, Nov 19, 2025 at 07:45:17PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 20, 2025 at 12:33:14AM +0800, Jisheng Zhang wrote:
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
> >  static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> > -	.suspend_noirq	= brcmstb_gpio_suspend,
> > -	.resume_noirq = brcmstb_gpio_resume,
> > +	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
> > +	.resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
> 
> Can it be DEFINE_NOIRQ_DEV_PM_OPS() / NOIRQ_SYSTEM_SLEEP_PM_OPS()?

Yep I agree with you. But IMHO, it's better to make the
DEFINE_NOIRQ_DEV_PM_OPS() switching as a seperate patch and merge this
series which wants to clean up various #ifdef #endif usages

