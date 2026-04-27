Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE6CFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/9rLg1nLE+ZWgSqQp+5EPf/U4Z5gRcFyKlqDW6O5ro=; b=BAAIdLKwL7DdfbhS6Cru5yhDED
	kJH2isY1MdJC13k2bE2pZB9kB/BkZoX9qsU2W+3fUWvILdxsNm2+v/0it7S4ozHIkMw1mFXb1KwWR
	JRJjdg60JASwu8TUz3vz1QxHllwrKLj/5BaO9dCMviwupGqPpG/gT2PISPbm0rA1zC+kPRLvofQ89
	PxLYoCvapl0o2Nlb8q07pyoSeyNwUU3MT9Vu4voCXCcRGYOBZIsTscv2dIEXcrzYMQW2TpYp26DEQ
	g0jrgVhVge7AnPQjZHc7Lhv7LaYCXITBEDgmS5utMGejtOcf9p6mRzEzVulWH3skJiENPxeazF0sG
	Yj5L9uOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOLp-0000000HFxM-17zX;
	Mon, 27 Apr 2026 15:58:25 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOLm-0000000HFwp-0rY4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777305503; x=1808841503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bRO0pft5QsUPW4LQyQOyXHgfHCTW8GGaobJi0FhQc0E=;
  b=mKRCKCuq/q/Os5ek2+xkOLms7t+Ceu2q6bcs8piNWWIHFHxiPlvHdLSQ
   kMOAM3avQGXj+wCKfuHWUzTj3qQ5pRhhosTHwbH7QC5Q5lcj1xk87jYEX
   XgjnXikotpyFazl8MvDPNKXMwVELmtA9SE7C1saBoaw65oDCOgkVDzpFP
   SBLTIl2HIlCFtDlhZg7Ih8lOYscOZmiQd1xv3JMMUAIe3oQtrUTF2yCxA
   dLdo90hPY1PpNoXXkfpjUHdjwZtKyP/766qk1r6/8VtijD4K4emQIrRhA
   8KWgtzSqJdTlZrc/+2O3ZFGCSesnJpNhVLd57HY3qnvV9FGvt7+icvrW3
   w==;
X-CSE-ConnectionGUID: eDtc9Jf7Tu2QeTpZb40q3A==
X-CSE-MsgGUID: CbQdP/aIQQKRIaXL9FqLBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88510962"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="88510962"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:58:22 -0700
X-CSE-ConnectionGUID: vlwi7aK4RPmb16kNrF4n+w==
X-CSE-MsgGUID: st8OBs88TvuijDWBDwdKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="229115369"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:58:18 -0700
Date: Mon, 27 Apr 2026 18:58:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: pxa2xx: push gpio usage into arch code
Message-ID: <ae-Hl4LZiZzCh8dy@ashevche-desk.local>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427144658.3609647-2-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_085822_346948_FE80BB77 
X-CRM114-Status: GOOD (  13.58  )
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

On Mon, Apr 27, 2026 at 04:46:30PM +0200, Arnd Bergmann wrote:

> There are no remaining static platform_device users of pxa2xx ac97,
> so the rest of that code path can go away as well.
> 
> Since nothing in the driver uses the gpio number now, constrain the use
> of the legacy gpio interface to the architecture specific code.

...

> +	if (cpu_is_pxa27x()) {
>  		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
>  		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
> +		if (IS_ERR(rst_gpio))
> +			rst_gpio = NULL;

Have you seen my
https://lore.kernel.org/r/20260415150412.365989-1-andriy.shevchenko@linux.intel.com
?

Perhaps you can incorporate it into this mini-series, as it looks like that one
hasn't been applied yet.

-- 
With Best Regards,
Andy Shevchenko



