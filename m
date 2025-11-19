Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97360CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QNGMbea7Nqqh2hO3l8CByqB+FjkU8sfEZmutZYc7g8=; b=wjN77ZJceB6TQ1k5MfNwRCiTG0
	JfEBfn/asyvZvRovst/RYw9+G5RWF3TSfkwXPSGs4JS5TbO5bUJIXn0OwWlw2UoNUdEjRtSReqpFr
	cIbuR5Vh0MKyE7xvq0b3Z6hgdoidwUu5sTdg6zKZYsfZ99odJvnMV/J99Skm5QTpo8QZTa6GQadtA
	CXDwys8JI6jnlqJ7uTbXs0x7Maw66Vf9AIlcwsqOjcyP8+e+cTUZ4ZrQSuMMGVq+urlWmM4otoafP
	KodxQzEzRaPoYkb71U3YvXwjlH9VRcMe/l6iF5utAtlRiyhT4+dLK4YtmMA2UZWAsc/qj20JOwf4R
	60KUHwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkSQ-00000003aMa-3l01;
	Wed, 19 Nov 2025 15:50:58 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkSA-00000003a2p-2mrK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763567442; x=1795103442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sKe7PQga7mEwwmr43fx8AUl/x1ZKsYGU49c5RjNn8dg=;
  b=RMf4eOTA50mIOjaI7V835LQie1/mKdODNxgtdrKzrxtazaVhHAcyMDjk
   C2jjvdLQkHxeY6NUzhEcQczImyku1roWdH74hvXhCaKo9EO31wqplroLM
   oDi1IpdZrhuAp+5OfOlX2R7QT9UNy/LJQXMkHgX/uPrXM9wbb+MF1iA9o
   nHOlkQjkyTzmQjhdrrDYzXy6LK4Asuwu1EXpUAeujjESWPNjVAjXAvreu
   3i6wHaAPvcP0ufM9sQETlKcb1aaGSIKtnVOfhepfdyZAuOxDAQuEOMXvv
   IczhpB3cXyBn/3z7TPv6bvTJAJJHLUjmjbQIZNkfHR6QCCdGWNBwpMf9Z
   w==;
X-CSE-ConnectionGUID: ufPuSsE+QgGWBTqFhJeEKQ==
X-CSE-MsgGUID: 9Top9z+4Tc+UHXK44ZD85Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69466196"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="69466196"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:50:41 -0800
X-CSE-ConnectionGUID: njUuKHcIS1Sr/heLazlIfg==
X-CSE-MsgGUID: TOrmaFR8RRyFFpf7JmhZ2Q==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:50:37 -0800
Date: Wed, 19 Nov 2025 17:50:34 +0200
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
Subject: Re: [PATCH v3 04/15] gpio: pl061: Use modern PM macros
Message-ID: <aR3nSmSlV9bfqi3k@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-5-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119144327.13345-5-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_075042_741558_B2C31677 
X-CRM114-Status: GOOD (  14.08  )
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

On Wed, Nov 19, 2025 at 10:43:16PM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> The pl061_context_save_regs structure is always embedded into struct
> pl061 to simplify code, so this brings a tiny 8 bytes memory overhead
> for !CONFIG_PM_SLEP.

As I pointed out you have a typo here

_SLEEP


...

> -#ifdef CONFIG_PM
>  	struct pl061_context_save_regs csave_regs;
> -#endif

Just leave it here, and drop that paragraph from the commit message.

The rest is fine.

-- 
With Best Regards,
Andy Shevchenko



