Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6FDD3399F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFrGXvIVLOCuGUNHBCbe0RIQyaSsaQp58bvNrLALAyk=; b=1C09Kr1MfsBvHvWMF2zv0RMqfz
	Cdc2R/ayy2Zqbt/z74DOOH92PLTN6dQv/KEN7K5hm4StvyXiQ52yZyKHoxcg3TL9owQ0Y6EKVVWkP
	3z/NFql+dg87qVsNh+n2vEUzxZFH5/7f1UfhfiH+oU1XiEIwcOlA/mT/xMjv1mAc/wOQ08Al2QZ1K
	77+f+UOcdrWO+B8gURl5Np8QgqEatbffnw7NEi6mMqevCbPTnB1bhV8mk+4zq52A/NOpeLLAlJOII
	TXMpfSYjADeuSLXUPoOFTG2fJjxQB6+Lqawx0+D3vG89bjayCj54yAZVF7Olfntt8LG0SPfLJY8J8
	QWQ3fjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SkK-0000000BVou-1o3z;
	Mon, 28 Oct 2024 16:37:36 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5S9j-0000000BOdY-0cqV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730131187; x=1761667187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M0le9V9Kdnc+SoqVOHgbafA8bV44ev7rfgdQq7f2H2o=;
  b=nTYd/aFee3OCvx+I6+lnzHgO0jENFut/V0z1cAPzsuaMgSZy40kzEu/R
   EDYhrDX8q34Ie+ljH+cT+0XEzYjcbFDPLxs8eIkEdN4qTWE/qLJMi+JXc
   hwj0VBDwEbzNxiYeyQu2pkkibbxVzmDQ1cjy9r06Oa/yPstv6B4idHIwa
   oGYzmbMxj6UOHkVoyYkbi+DO9oDSgPnfQ09zhr3herdGeema/xhOkhSX5
   GP7YgHuP0l09aGvjFyGLZ8HsOJp9zm9LQdRk8UQUNCCUNfQ8IwlY01grJ
   n8tFr9/Q98GTAHjd9sSJUhK99LifnDga+ZwIoOJg4fE1jXRMuYf0coErS
   A==;
X-CSE-ConnectionGUID: btIMHx7yRYyGTvD3W+iu2A==
X-CSE-MsgGUID: +KEt+HEURj2x9QJQCer/hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29506438"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29506438"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 08:59:33 -0700
X-CSE-ConnectionGUID: iQc8wkRRTKWL3fpaCf50SQ==
X-CSE-MsgGUID: ov8Po5UBSmyDzG3bh9zQUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="112480471"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 08:59:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t5S9M-000000087nQ-3TE6;
	Mon, 28 Oct 2024 17:59:24 +0200
Date: Mon, 28 Oct 2024 17:59:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aren <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] iio: light: stk3310: log error if reading the
 chip id fails
Message-ID: <Zx-03Era_8ulHjDb@smile.fi.intel.com>
References: <20241028142000.1058149-1-aren@peacevolution.org>
 <20241028142000.1058149-6-aren@peacevolution.org>
 <Zx-jj8FEldW6sG55@smile.fi.intel.com>
 <xcavh66uxpl2orehtlzsy4g4udr3p2yqsq5pyhmxdqdmnegsvq@jpomr2uuwspz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xcavh66uxpl2orehtlzsy4g4udr3p2yqsq5pyhmxdqdmnegsvq@jpomr2uuwspz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_085947_392521_6EFCE355 
X-CRM114-Status: GOOD (  17.89  )
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

On Mon, Oct 28, 2024 at 11:29:35AM -0400, Aren wrote:
> On Mon, Oct 28, 2024 at 04:45:35PM +0200, Andy Shevchenko wrote:
> > On Mon, Oct 28, 2024 at 10:19:59AM -0400, Aren Moynihan wrote:
> > > If the chip isn't powered, this call is likely to return an error.
> > > Without a log here the driver will silently fail to probe. Common errors
> > > are ENXIO (when the chip isn't powered) and ETIMEDOUT (when the i2c bus
> > > isn't powered).
> > 
> > The commit message does not explain why dev_err_probe() has been chosen
> > and not simple dev_err().
> 
> This function is only called from stk3310_probe, and this condition
> should propagate it's error, so it fits what dev_err_probe is designed
> for. dev_err would be pretty much equivalent just longer, like this:
> 
> if (ret < 0) {
> 	dev_err(&client->dev, "failed to read chip it: %d\n", ret);
> 	return ret;
> }

It's fine, the problem is the commit message in the patch. Please,
update the commit message accordingly.

-- 
With Best Regards,
Andy Shevchenko



