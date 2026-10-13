Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF05FCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpOiKm6dLU8JrOTG+i4Sq4LvOc1uu87JrwdXKWOINIM=; b=mZZdB6P/vf5dgCFyrMhvDrs5ZT
	UnfWuyFyy5KaY4RdXqrNtwUL4OdO+s4vXlhYRJpz9S5jk6m5IvsagSChcFM1pfubNPNd9+JOKNMBp
	Y9lCIjQ2489UvJe/Uerfy5Ba1k4L06zlUElOZ5s5p3on+9dyFexo+HlddliWGfGFdnPNaU3UcoEt/
	UnBJmdpv8ajX77pltzD6CgxkxNXVK8OeHi5SiP4dXnZx6uX/i5MserCkjXlNJ/9wD8JU1W9a1R9Jc
	LzIbr1pOTSIWMPSRZmEd+gWYudzWxTkP9K9T18yJw7fzSF1yVkWIXPrTdztNNoH3cc34VzEgQ0+ul
	sPI+M4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcN9-0000000Cvog-0gMx;
	Tue, 13 Oct 2026 13:16:51 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcN6-0000000Cvny-2ORu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791897409; x=1823433409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FIPSuuAhJUZjRKHszZhAldZlUkr1RYeuYNKC12aR3Nk=;
  b=Lp4/79zN8HEbIVOG+qG6R8jFSlbNv78t0I9W1sqEuBibvFTpFq3lN6iU
   p3xDeK5MkP1b/XNz5pfWLLo/el2T4MAH8DLLPnFxoiW/yviKMvVwUf+1S
   MdW09QPWtdML4mjWAm4ID9al+xfQIKAhKvr33EPjtER3l1iLWoi7xE3wH
   6KkKtKmEkCLGeZEA8cr41UTjrxGc24UNCgATED7X/O6A5ZnXqByNRlXdw
   5/XlURqWFDt8cWEls+GZh684zID8hlYR0aJyTHUoVjQP9mx0ITJ+NoG5I
   7oZFL8Il6Qltb7jZuP+046GSsOAh7sKfnvIajKKOtKkvHicUNYrrEyg+t
   w==;
X-CSE-ConnectionGUID: xplDGRXqQdCZcjbFMl70+g==
X-CSE-MsgGUID: WQ+Ml74rQEGKjECkMHgeyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="716913"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="716913"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:16:48 -0700
X-CSE-ConnectionGUID: SurxRxWWR++Z/RD+iIDdww==
X-CSE-MsgGUID: s+kdQgkrTRKlo3wJuiMFgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1091049"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:16:44 -0700
Date: Tue, 13 Oct 2026 16:16:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ma Ke <make_ruc2021@163.com>
Cc: antonio.borneo@foss.st.com, linusw@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: stm32: Fix fwnode reference leak in
 stm32_gpiolib_register_bank()
Message-ID: <as4vOoSRE0zjh8NT@ashevche-desk.local>
References: <20261011061722.3159941-1-make_ruc2021@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011061722.3159941-1-make_ruc2021@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_061648_643350_9AC59F8B 
X-CRM114-Status: GOOD (  14.81  )
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

On Sun, Oct 11, 2026 at 02:17:22PM +0800, Ma Ke wrote:
> stm32_gpiolib_register_bank() walks the "gpio-ranges" property with
> fwnode_property_get_reference_args().  As documented in
> drivers/base/property.c:
> 
>  * The caller is responsible for calling fwnode_handle_put() on the
>  * returned @args->fwnode pointer.
> 
> The returned reference is never put.  The function calls the helper
> twice, once directly and then repeatedly in a while loop, and each
> call overwrites args, so only the last reference is even reachable
> and all the earlier ones are leaked for good.
> 
> Put the reference as soon as args.args[] has been consumed, both for
> the initial call and for every iteration of the loop.
> 
> Found by code review.

...

>  		/* get the last defined gpio line (offset + nb of pins) */
>  		npins = args.args[0] + args.args[2];
> -		while (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, ++i, &args))
> +		fwnode_handle_put(args.fwnode);
> +
> +		while (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, ++i, &args)) {
>  			npins = max(npins, (int)(args.args[0] + args.args[2]));
> +			fwnode_handle_put(args.fwnode);
> +		}

Can we use GPIOLIB facility to fulfil the task? Yeah, it seems non-trivial
change, so for the quick fix the above seems okay.

-- 
With Best Regards,
Andy Shevchenko



