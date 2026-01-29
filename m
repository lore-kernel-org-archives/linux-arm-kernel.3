Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EF5D358F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 10:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoUkF4sEPD+P1wlIpev37zRNdBw0YRU2QAEXjVXgWJg=; b=UQ2VtkuQw0hOkoqWtYbE7d3R7p
	vqXyaz9C6j9YIiqMkVgHvc8LJ4zdAl5nmgM9xKsRG+y4oFnjafHg6C9VvIcbwbuzsVzatrWBlUgFf
	k73IsVXq2A5B1387na9Aww8LmW2OtfFK3Cte6+heJbC4l0VZaf5bZhKIQKqJLSPJcozPI0n/EjTf+
	pHRejBKArgJiuv+h+0LU8pDWXkmsvwJgSsGh7FvbYv7TJY0S2qTWrSZ4/qpeRJN2S5IEwuW5VpR6b
	0iJtCFv6mmorQ7hmWrHL+v+bFwltGSoNKbpni6yVGgrAvwKvb2PVZb/WK1L6/UIvuTm2UXn1tpSEO
	PCNN33eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOps-0000000HY2o-2uRU;
	Thu, 29 Jan 2026 10:01:12 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOpp-0000000HY1z-3uUj;
	Thu, 29 Jan 2026 10:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769680870; x=1801216870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SqH9AdxR/lHB8viiJnIr2poCQMky6Igt6nCYuv99EBc=;
  b=jlRZ6jumGnjMfJ2rdcSpinCwRdGjRlT8mgAYN/+Ihu1saDjrUVsZSEWL
   RcSTnx0jp8+qszwvLYyYGgNqlApj1beztt8J7pTe18XVCiJxTgGkA0kbT
   MaVjNBlitYoOKCdjX7BUyizzFrxLHCl+TMmW3UMt7oIxsK+kObWZMcHBd
   zPdKOcWgwrchvtJ9x10ZsvWC7IIfCbz/vg/k4gXv8BQVvfz6+s2Pk8M3j
   zSyInu2u5b5OFNsxqXdAm29Wy8PWPD6DsHEP4d2oEf0tv8KyDYDYCI0gI
   KREmItdtgVX3NkMTL3HySowPDSsJCwaXEsHDc/A1EthiNxcLnDSMp4bat
   g==;
X-CSE-ConnectionGUID: OhnGIlBtReuqgAkGW6Wfdw==
X-CSE-MsgGUID: Fm3e0OG+QbWIxY6lXL8NSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70630037"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70630037"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 02:01:07 -0800
X-CSE-ConnectionGUID: q96kEhegQ5GodER4IxHUhQ==
X-CSE-MsgGUID: n0Y7OLBCQQaoEMLmTpwHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="213400871"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 02:01:01 -0800
Date: Thu, 29 Jan 2026 12:00:59 +0200
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
Message-ID: <aXsv200DLo6ssao2@smile.fi.intel.com>
References: <20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com>
 <20260129-rk3588-bgcolor-v6-2-c15f755a4055@collabora.com>
 <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_020110_023516_237DA548 
X-CRM114-Status: GOOD (  20.22  )
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

On Thu, Jan 29, 2026 at 11:37:33AM +0200, Andy Shevchenko wrote:
> On Thu, Jan 29, 2026 at 02:58:52AM +0200, Cristian Ciocaltea wrote:

...

> > +#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)({				\
> > +	__u16 mask = __GENMASK((bpc) - 1, 0);				\
> > +	__u16 conv = __KERNEL_DIV_ROUND_CLOSEST((mask & (c)) *		\
> > +						__GENMASK(15, 0), mask);\
> 
> The whole point of the first patch is to use it in the divisions by 2^n - 1.
> Can we transform this to make it "divisions" by power-of-two?
> 
>      ...: def dbm2(c, bpc):
>      ...:     m = (1 << bpc) - 1
>      ...:     c1 = m & c
>      ...:     r = c1 << (16 - bpc)
>      ...:     for i in range(1, 16 // bpc):
>      ...:         r = r + (c1 << (16 - (i + 1) * bpc))
>      ...:     return r

I noticed that on some inputs it gives off-by-small-number error.
But you got the idea.

Taking this into account, perhaps we can share __KERNEL_DIV_ROUND_CLOSEST()
anyway and leave it there and improve the situation later on. Up to DRM
maintainers.

> The above is a Python version of PoC of this approximation. Basically
> we transform the fraction X / (2^n - 1) to a chained version of
> X / 2^n + X / 2^2n + ... X / 2^kn as derived from recurrent formula
> of i+1:th iteration as Xi+1 = Xi / 2^n + Xi / (2^n * (2^n - 1)).
> 
> So, maybe that one should be used instead? (It may be thought through
> on how to collapse the for-loop to maybe some bitops, but even with
> a for-loop it might be faster than real division.)
> 
> Note, we have some (for sure more than one, I remember the same Q appeared to
> me a few years ago) of the examples which may avoid division at all. I would
> like to have this macro to be kernel wide (and UAPI seems also okay).

> > +	__DRM_ARGB64_PREP(conv, shift);					\
> > +})

-- 
With Best Regards,
Andy Shevchenko



