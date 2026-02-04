Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A90EA7946
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aBBoaAY+POSrzneGG989Xszwk+7DoOl/OY2QF3iPZ8=; b=XBcuByey0rthnyC1qs3DxK1Qa+
	+RrxR6TN70Eao+d6MceQYC5T4/c8GOMHH86gYB/L+2hluG9efSlcyox7CLlocFWiOjw7qf0O7JfVd
	3ob2gUEdrIQD9dLq5fyEvIIbuVM2CSIeYrUUQ+jwbqsMmqfwnmQjHHzmCDW05gsZgljW/Hf2r+asa
	r8gI2YwvvD20V28sXmTwya6cyN6jrLOJXr4wq4P+kIYXO1AXyBkdIrjMRjA79MEZLJvMuZfhc3XQ7
	cVuGpgJ6gO98KuDNBEBH9HDWYHf3QVLb+hJjXwrYQZVO2bnWrBVjnln/Blz9MUPg3C+LYkVStYJ+J
	lEXMraIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnk8i-000000095N9-0nwp;
	Wed, 04 Feb 2026 21:10:20 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnk8f-000000095Ma-1AtM;
	Wed, 04 Feb 2026 21:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770239417; x=1801775417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8BGUP+Fh8sJoIk+wDhGM6z4Q5hkH9tUOVqzPdwjSySk=;
  b=ByZyaTLGeLve+sVkxvNfGvuSBRx4NhWLSHuXdoznVcAvRrB7M0hbIWM+
   yMq+bB+y5gt8GaYcCzHRtapEhWY+PbaSB9CFcDCyFjKqbMvcYiQi7+aUA
   8+/wBRTLwUh9eIAs4zEaSJO7+buK0sBCpjWOoYA5Ylzi8b7KXMugGIId6
   Q6bnto97FeuNsXqJ0iK0TA0gfGppqQbss5vXgTKYrBwxQvyqk83hphjhl
   po5oQRzcnkz0c8bgG9Bg+ghmlNjvL5JzwUWtXb8Fxi8MZf11Rk0WZYYvY
   0IJH2LHcQVGF9rDmbRw1M7G2NvHDJPEKWAVzH53vzePxYKa1vpvIWFfyP
   g==;
X-CSE-ConnectionGUID: RV7I4O9JSwOkxprv4iBMwg==
X-CSE-MsgGUID: S8bBE2m+Qt2o2rxP5+agAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81748681"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="81748681"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:10:17 -0800
X-CSE-ConnectionGUID: 7aeGqPOERc25kyYZt88EPg==
X-CSE-MsgGUID: iAE4JCIoS9+oWNVbTP0NyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214806959"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:10:12 -0800
Date: Wed, 4 Feb 2026 23:10:09 +0200
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
Message-ID: <aYO1sY0DAkI00uDx@smile.fi.intel.com>
References: <20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com>
 <20260129-rk3588-bgcolor-v6-2-c15f755a4055@collabora.com>
 <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
 <97a4fd2d-62e2-41ad-8ee9-d2551c3ab312@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97a4fd2d-62e2-41ad-8ee9-d2551c3ab312@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_131017_363242_0DC1AD80 
X-CRM114-Status: GOOD (  15.31  )
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

On Wed, Feb 04, 2026 at 10:32:23PM +0200, Cristian Ciocaltea wrote:
> On 1/29/26 11:37 AM, Andy Shevchenko wrote:
> > On Thu, Jan 29, 2026 at 02:58:52AM +0200, Cristian Ciocaltea wrote:

...

> >> +#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)({				\
> > 
> > Not sure if this is an accepted style in DRM, by I find it difficult
> > to follow. I would expect the "({" be on a separate line.
> 
> I initially got confused by the plethora of different styles, e.g. in
> "include/linux/math.h" we can find:
> 
>   #define rounddown(x, y) (				\
>   [...]
> 
>   #define DIV_ROUND_CLOSEST_ULL(x, divisor)(		\
>   [...]
> 
>   #define mult_frac(x, n, d)	\
>   ({				\
>   [...]
> 
>   #define abs_diff(a, b) ({			\
>   [...]


math.h is a collection of APIs from the past from different years and code,
that's why the style is inconsistent (a lot!). So better not to take that
as an example.

> I agree your option is the most readable one, hence I used it consistently in
> v7.

Thanks!

-- 
With Best Regards,
Andy Shevchenko



