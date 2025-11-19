Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02949CF58C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm1+NlkVcm2FW6AU+GoohanmMoORgHk9geudYHpmSO8=; b=CwS+rI7Q56cfOXQl59Zmx5jJkK
	lT+rfhPp5JWWlld8Z0a9XT4mdxyj8bZ37cNhr34hm6Pc8ilj1Elt6gvrYMmYKMBBMjOyuqDX7IaYL
	M9fHqnu+BSePvAAyQnn5+AsaT3KdZh93SMyGan7735bNndjJuDC6nk6WghzP65VdhfXEsPGKTSXlj
	NSnP8PyU9olORiqKenwl0Z01NjAa3VPr0NqXEUJipxHg9HUp4iEb8o81/ptXopHSyIxKp5KL6gzAF
	awOJN0X/3fQ1F6I85PvXdUG08jY2La+H2K0rvYkzKW5ni7Or31zlpYnBjFCSSkmzlBlp2vNbWU0iQ
	Yb6Dy/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmFD-00000004FPw-3oKu;
	Wed, 19 Nov 2025 17:45:27 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmFB-00000004FOe-2tKq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 17:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763574325; x=1795110325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZvJCsNM8gCRFeXG3xspjSuRDvUlSdVawzrxA3IrXDdU=;
  b=BKfEh7YyK7koS+SCthwqTAHSOX6dH3t0loRpJT1D4U8xbjwBhUF0VUED
   oX7znUipn/Vhx7YvnrlzK0KcSjjhtA9rudHVDM7yfOws8MCLssCWVm0Le
   d+NkOHeSXkq19IKIp+dZW79XYcXqNZpsjmGCc32oo8K3C6baLhybQC0A8
   ht3q8gg1W1vVjiXnskXSqD+AGe1vPbr/5L+3u5WLsiukuvWecVpZTGC3m
   xxa5Tmu35zKQDREJG7rY/uvTFV9m25oBtzkpDGyh8XNfkil0Xzr3yapTm
   uomDRyLd/MUnLG+IMkZclmS9TA3sKepYjLIhUfg8g2cUM/iUAlbIZzl5n
   A==;
X-CSE-ConnectionGUID: sIVatyCZTr2p+JuDWaK6xQ==
X-CSE-MsgGUID: S+icIEJ7TXyqKz33wu+coQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68231297"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="68231297"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:45:24 -0800
X-CSE-ConnectionGUID: 2amsmZZfTxG9s2IGlSkIQQ==
X-CSE-MsgGUID: A+3PCHlDS9WC7/jHTAEagw==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:45:19 -0800
Date: Wed, 19 Nov 2025 19:45:17 +0200
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
Subject: Re: [PATCH v4 02/15] gpio: brcmstb: Use modern PM macros
Message-ID: <aR4CLQ_2-kUM-e2F@smile.fi.intel.com>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119163327.16306-3-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_094525_743981_114EB68B 
X-CRM114-Status: GOOD (  12.87  )
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

On Thu, Nov 20, 2025 at 12:33:14AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

>  static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> -	.suspend_noirq	= brcmstb_gpio_suspend,
> -	.resume_noirq = brcmstb_gpio_resume,
> +	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
> +	.resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),

Can it be DEFINE_NOIRQ_DEV_PM_OPS() / NOIRQ_SYSTEM_SLEEP_PM_OPS()?

>  };

-- 
With Best Regards,
Andy Shevchenko



