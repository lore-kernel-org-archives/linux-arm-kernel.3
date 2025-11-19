Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8D0CF58C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoAlKankPjwDBZsBhFjqAmHi8z8mlE25zclp2lVWf5Q=; b=uHcj6jbEN0l987McqWClrbaVJl
	JB1RCVMEEsvimya5NshJ8YuO60v2NXtfkoUYL+2bv1wOZdByK1CiSI0GPgZ6COtwHoqQIUBnZMexz
	OMsifEIUJBNS/ML5eT5MhmWtfwYFkxN0G0uErTTmIQJ6E/85U9uioDodNsOBp1gUrWMOVlKrCMUpo
	TbJEeHbRC01iEw9ydmLYpdQ/n35YIDoyGFad8aKkl17M3VTDk2HB4qHij7UVn3sQhz38mhZXHBVW6
	cMerIxGiJf/dsHIPxSFXBftQt05SjgJc0ReitrM3rp2PKUu6o0ABxVFzfYORMJN/XaX+ahxZHfUEZ
	xYoRZrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmHL-00000004GYL-1rzR;
	Wed, 19 Nov 2025 17:47:39 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmHI-00000004GVz-2GU8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 17:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763574457; x=1795110457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n5G815o72bSdZKf6R9A00oNCrgUtX6rVv0ZArJPpfoU=;
  b=G9TA7U3tuF2wC9NNBCIakgIsvI/u86oCWq0kP4nbiCJJ2G38C4yzWvYV
   T1ES1bUym9/jQJzX9I87rtWaX+FA3fBoS0GvzHgB8NIR1TIBe7UwlPUOD
   7Bvw5zGMDwjVfhb1uHHgUSEmbHG/zBh1HeRasdgD23k4Cl+AlJ/XEnidi
   jAW8LA4IE17VxmeQVgU1RObm4EIbGFZ2QF91WzKqJxJ4WW4J3peHI/qG0
   bUUJR4rCmYV/i9VVgfoZnUmp3GLEvSYnnqS/5vQp50EI3/ABIHFqIT4az
   ghHpnM1o9+9DTChOG2VyJsjGYHJSr7+vBrhbaC9+hiOk4BktGORqhjRVG
   w==;
X-CSE-ConnectionGUID: xNSmK9RKSA60BTLWZTmjlw==
X-CSE-MsgGUID: OHBZN2qMRZOs/+mKzoqVXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83016955"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="83016955"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:47:36 -0800
X-CSE-ConnectionGUID: NkbzTLrqQISEUsW1Zqvg4w==
X-CSE-MsgGUID: D1fHhFKoR6KIL6wtLaWF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="196264383"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:47:31 -0800
Date: Wed, 19 Nov 2025 19:47:28 +0200
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
Subject: Re: [PATCH v4 00/15] gpio: Use modern PM macros
Message-ID: <aR4CsO5JGs_vTtBd@smile.fi.intel.com>
References: <20251119163327.16306-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119163327.16306-1-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_094736_617688_66DA7FE1 
X-CRM114-Status: GOOD (  15.73  )
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

On Thu, Nov 20, 2025 at 12:33:12AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
> left as is, because the memory for saving HW context is not trivial,
> if we convert them, then the two drivers' users may complain for
> !CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.
> 
> patch to gpio-dwapb.c is tested on real HW, others are compile-tested only.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
except patches 2, 5, and 11.

-- 
With Best Regards,
Andy Shevchenko



