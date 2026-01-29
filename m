Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B910CD358ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu6ImEH3THsnXSCanI4pCuinWyuI9iiaF38KQnLjAy4=; b=Jibi/GJneHxHLNqSNhPtYxVaxb
	b92/SsUAkj6f/jv1QIxDqf48Plr5gEywl6PiWO4reqVrfYnLXuQUIA2V4rpGnUfd6U50dyw9itNoC
	yIsVxMfEbdrkSXoN2R9UqxOpLmOGVSyQktswt7uG45DtN5FPRBXiCpNPkccUo19REdJNNm/2WK922
	h6H1HW1l72ICQ3jYktyZ3J2/8kfyQ52tYa9Cfdre8xBQh7byfOwIdwwJVrRMeZB0QTDc4ur3kNZF1
	mr066TikzteLKcKGzIsOy4EpelrjdDKSj6IpFyAdVbkNDKjyneT3QUu9rHUa6bljJblFyEaXXLFoJ
	OkTezuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOTL-0000000HWf8-2dOu;
	Thu, 29 Jan 2026 09:37:55 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOTI-0000000HWdz-2fKJ;
	Thu, 29 Jan 2026 09:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769679473; x=1801215473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fcH4mUDNyS5wydLrVZXUX/K4ZKaotkjSpo0HtMsk+1o=;
  b=lVGPwfTSy0eOth5F5bjSFiLDm8t0sZOIEE8lC0BJmJ9fpuPGqZYiruTS
   Xj1lM6ZGm6xdbTQoP2A0hcW6QvZdqcKE7KkUwPR1HJrPCqtgUns96JwmB
   NAZCIv//SNVoJR9TG481GqUqmNW0qJttZ8F+YDCuyYqyjdbmMUFEUHaWN
   inltHv94RieOdeNd8/x8BWiyIT/Iwj18FHejILHUmlNkfsXF/Zoz8yNXF
   fZ7p0i9DCDKMJm0cEGaptg2j+M+e01bwyd+eqjyNItRfd0SkvKcza/ZjM
   G/tLVwYqf8zl211U0Rmjg5e0OY4MwI1w/FQEvtkvAKqR/MyQ3dyewT64H
   g==;
X-CSE-ConnectionGUID: 8yTWqO0nQS6EGbu68HInPQ==
X-CSE-MsgGUID: dW1SyljrRviCPMduZp953A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="71074878"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="71074878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 01:37:50 -0800
X-CSE-ConnectionGUID: Q6oB1hS4RWCJLoDv2BxPDA==
X-CSE-MsgGUID: vyc3EwQqRieVpm72pc7e7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="246133392"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.155])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 01:37:29 -0800
Date: Thu, 29 Jan 2026 11:37:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Matt Roper <matthew.d.roper@intel.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH v6 2/4] drm: Add CRTC background color property
Message-ID: <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
References: <20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com>
 <20260129-rk3588-bgcolor-v6-2-c15f755a4055@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-rk3588-bgcolor-v6-2-c15f755a4055@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_013752_752197_CA2E37FD 
X-CRM114-Status: GOOD (  23.83  )
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

On Thu, Jan 29, 2026 at 02:58:52AM +0200, Cristian Ciocaltea wrote:
> Some display controllers can be hardware programmed to show non-black
> colors for pixels that are either not covered by any plane or are
> exposed through transparent regions of higher planes.  This feature can
> help reduce memory bandwidth usage, e.g. in compositors managing a UI
> with a solid background color while using smaller planes to render the
> remaining content.
> 
> To support this capability, introduce the BACKGROUND_COLOR standard DRM
> mode property, which can be attached to a CRTC through the
> drm_crtc_attach_background_color_property() helper function.
> 
> Additionally, define a 64-bit ARGB format value to be built with the
> help of a couple of dedicated DRM_ARGB64_PREP*() helpers.  Individual
> color components can be extracted with desired precision using the
> corresponding DRM_ARGB64_GET*() macros.

...

> +/*
> + * Put 16-bit ARGB values into a standard 64-bit representation that can be
> + * used for ioctl parameters, inter-driver communication, etc.
> + *
> + * If the component values being provided contain less than 16 bits of
> + * precision, use a conversion ratio to get a better color approximation.
> + * The ratio is computed as (2^16 - 1) / (2^bpc - 1), where bpc and 16 are
> + * the input and output precision, respectively.

Not sure if you should explicitly mention that "bpc must not be 0"
(it can be derived from the "division by 0" in the given formula,
but still...).

> + */
> +#define __DRM_ARGB64_PREP(c, shift)					\
> +	(((__u64)(c) & __GENMASK(15, 0)) << (shift))
> +
> +#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)({				\

Not sure if this is an accepted style in DRM, by I find it difficult
to follow. I would expect the "({" be on a separate line.

> +	__u16 mask = __GENMASK((bpc) - 1, 0);				\
> +	__u16 conv = __KERNEL_DIV_ROUND_CLOSEST((mask & (c)) *		\
> +						__GENMASK(15, 0), mask);\

The whole point of the first patch is to use it in the divisions by 2^n - 1.
Can we transform this to make it "divisions" by power-of-two?

     ...: def dbm2(c, bpc):
     ...:     m = (1 << bpc) - 1
     ...:     c1 = m & c
     ...:     r = c1 << (16 - bpc)
     ...:     for i in range(1, 16 // bpc):
     ...:         r = r + (c1 << (16 - (i + 1) * bpc))
     ...:     return r

The above is a Python version of PoC of this approximation. Basically
we transform the fraction X / (2^n - 1) to a chained version of
X / 2^n + X / 2^2n + ... X / 2^kn as derived from recurrent formula
of i+1:th iteration as Xi+1 = Xi / 2^n + Xi / (2^n * (2^n - 1)).

So, maybe that one should be used instead? (It may be thought through
on how to collapse the for-loop to maybe some bitops, but even with
a for-loop it might be faster than real division.)

Note, we have some (for sure more than one, I remember the same Q appeared to
me a few years ago) of the examples which may avoid division at all. I would
like to have this macro to be kernel wide (and UAPI seems also okay).

> +	__DRM_ARGB64_PREP(conv, shift);					\
> +})

-- 
With Best Regards,
Andy Shevchenko



