Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4C0CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGb/Pn04mYvEzJ9n5vaAWyRTpgOnzLvPPmBKuHXfeJU=; b=KV04wg9EKMBNyEnWJnrWgdLbYG
	0gYtHY5pcf1/8FrBt72rRBbLcQpf3FDCJogNyqb9T1JmPR8LdiE1jFyxzQFKBy37MyzxrFJEf5N6E
	yNnPDPuJ8QAyfccmbE5yk6zndL0SCSHINtuCrleC+n3wWiIzcjge25UaS5ITOzHFbgTJOY17Cz6bG
	SCOBxVJq25kHlybp6wg20HrHgA/CkQUBGxNcqADTqLAmLF+xEKItrMFfokBJcJZaKE5xwkA44svB6
	mw2jrlQi31Y/VUizlR3GzbFL+Wa3HKGe9ROqRLDflHf7zsInjMgYe6oz1Q6Wh6mFg9iWTxbVd5Zy4
	n/Ript0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkPS-00000003YVf-1O5P;
	Wed, 19 Nov 2025 15:47:54 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkPO-00000003YUJ-08c8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763567270; x=1795103270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MjS6qANrG66ZEpC560m0ZY+4OoXsFOnALao2kMmuR28=;
  b=gnGDiBw8b55Iaj1ndjM6G7sq/O9EuiInZBOD4nCS4Cj6Umf/Ok0sf39G
   2kz0twvo2mttJlhXcW0O0CXkeXwDxWdcWZ/ZAB09HjshXVQQzy3FuQYxp
   HatVoYdDZRLG6Idcft/Dk8/1jnFyxXS/u74SNqMm3qHEcBGd8Q3RlZOxF
   8yso/4TJy4keEYmvrlfAezPKHoXro4rLx+vx3GbqrHN7B3nKLFATIvCE+
   qn85vQpaKnadU2SBOU+h6TYg4AxrNpAJjsrbAtKQsjkLQOsmCzbfu4AaQ
   VsssciqM32yDm8S6lcF+puzXYGr1CgtZMlXbUqkBt8G3zu+/f607mlAcd
   g==;
X-CSE-ConnectionGUID: g/ahM9+oR9WBtr6HCLoWZw==
X-CSE-MsgGUID: zky5v9A8SVOUeNj7DSPVrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65546804"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65546804"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:47:49 -0800
X-CSE-ConnectionGUID: qARCDVdDSRq4Jvica6pVbw==
X-CSE-MsgGUID: 9q3MyH01SZm07qrscShvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221740025"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:47:44 -0800
Date: Wed, 19 Nov 2025 17:47:41 +0200
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
Subject: Re: [PATCH v3 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR3mnWQedt7SMRP0@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-6-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119144327.13345-6-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074750_128252_BDEE535F 
X-CRM114-Status: GOOD (  18.05  )
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

On Wed, Nov 19, 2025 at 10:43:17PM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

> struct pxa_gpio_bank {

...

>  	unsigned long	irq_mask;
>  	unsigned long	irq_edge_rise;
>  	unsigned long	irq_edge_fall;

> -

As I already pointed out this is stray change. Why you ignored my comment?

> -#ifdef CONFIG_PM
>  	unsigned long	saved_gplr;
>  	unsigned long	saved_gpdr;
>  	unsigned long	saved_grer;
>  	unsigned long	saved_gfer;
> -#endif

Same Q as per dwapb driver. The CONFIG_PM=n doesn't need these.

>  };

...

>  static struct syscore_ops pxa_gpio_syscore_ops = {
> -	.suspend	= pxa_gpio_suspend,
> -	.resume		= pxa_gpio_resume,
> +	.suspend	= pm_ptr(pxa_gpio_suspend),
> +	.resume		= pm_ptr(pxa_gpio_resume),
>  };

This is not a device PM ops actually. Is there any guarantees on the
relationship with CONFIG_PM and these callbacks? If so, I think we
need to have special macros somewhere in include/linux/syscore_ops.h.

Otherwise I'm not sure this will be a good patch at all.

-- 
With Best Regards,
Andy Shevchenko



