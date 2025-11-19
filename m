Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37738CF3977
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3TS3t2y7yaXLJIYqr/g/oZSgvV0HfPG+4L7UkdUfw0=; b=yDIpzFe4Q4vru5xPb9RdOB0Oyv
	qgMzZTXXHYymevVKN+UBQvo3tXLTyEb82DcrDMWXgoDieW7SvKKaew5anBJDroFqkruqEGrSR/Vdy
	cxsUECPA4wycYfG92tjYsFweDuC+gulgmEPQPPgi0sopwhWe9m39FfmhI8O3/bbDy0Pkc+YPUqzbI
	OFWNmoBWXBWNfB5a3kFDsSFxxJYIBtRFLGvinOQ5ZDgnx9hWiCurOCCyWnyGg1pAwtLhX9XbSVGDN
	yqFm+7cwIad3Q3wkXNn3WYGm8wlPFxVotcgfsBI8RY7/AZfpT7V7lzkIk8SLnTchNT6JpHOvIeut8
	GqDI8m6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlql-000000041Mh-0eNW;
	Wed, 19 Nov 2025 17:20:11 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlqi-000000041Kz-2Luc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 17:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763572809; x=1795108809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yRC3ZjX4yKs1fHPYIaMuMJ9xkm2PhgZ57PbRcPxNYnQ=;
  b=WmWBW3nKTw5PKgO7xxJ2I3r0BfRrO6Jo27IW25RhMUdI+68+ihicH95C
   Yakycdl88I7lacpH+LXIdx4sPMYeH4cyxz0Qxi2S516L+Fi4aE6geVk97
   L9R/bZCGuwhFZePcK7XlnaJfRzAVWD+y3EAuqdNx5KbctDzNcd1/RC6OR
   v7QdqrlzRUpq/b/Ei+Npa2WPQIK+Ud+/2VBcnMNCKzBVJskMtBpScUjDS
   LpN/3aGdaLQ1Jw+zr24aceAuzxMY7nTsF1vW8+0MuAnIm7F2AnTkqG9tg
   riZ5LLUNHhW1Dg7cUiMxnFqPiS6QnFdKEy02vvRrxwXaZb/HRsA4bakUZ
   Q==;
X-CSE-ConnectionGUID: iZpL+fucQM6ZLU37ApZZ5Q==
X-CSE-MsgGUID: vXEEqrlnQlmwhfWI2YJtfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83014565"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="83014565"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:20:06 -0800
X-CSE-ConnectionGUID: AC+1iDvmQ8u//B1fcrQoXg==
X-CSE-MsgGUID: PAbH0ctoRdWb1viWqMOHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191241800"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:20:01 -0800
Date: Wed, 19 Nov 2025 19:19:58 +0200
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
Subject: Re: [PATCH v4 11/15] gpio: tqmx86: Use modern PM macros
Message-ID: <aR38PkERpLxXhNfD@smile.fi.intel.com>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-12-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119163327.16306-12-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_092008_642579_24BAD9EC 
X-CRM114-Status: GOOD (  14.67  )
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

On Thu, Nov 20, 2025 at 12:33:23AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

...

>  static const struct dev_pm_ops tqmx86_gpio_dev_pm_ops = {
> -	SET_RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend,
> -			   tqmx86_gpio_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend, tqmx86_gpio_runtime_resume, NULL)
>  };

...

>  static struct platform_driver tqmx86_gpio_driver = {
>  	.driver = {
>  		.name = "tqmx86-gpio",
> -		.pm = &tqmx86_gpio_dev_pm_ops,
> +		.pm = pm_sleep_ptr(&tqmx86_gpio_dev_pm_ops),

For RPM this should be pm_ptr(), no?

>  	},

-- 
With Best Regards,
Andy Shevchenko



