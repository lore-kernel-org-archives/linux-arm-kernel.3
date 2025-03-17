Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1693AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exeGtIy04+KfSvX1mWIbVOxjHlGdbtxQnt7GN0U0DdI=; b=LI/862m44SokMCVjxjkSpIsa+Q
	8exEJKsYQflbZqyK9dVM2s0xYvLZlbdS6a5eclW7w9PHcBTvZr9EnuM0961NPhjrI+VEfN7CIA3Qw
	yZ9lB0dp2tVXyzRTZA9uTJMSZddQzw2i8KWXSmAQtwzqhb6QhJQkCxaL9IzNFqeZiFFq7l+dPk1o4
	nOatoCbbD76M8gu/YTHWasT6qDt8oUUpq3Kl0b8purxX6LKhqJw1bDlEjh//2xWtSqTD2e4Y5qoJJ
	8st/yEsKYgz8IvDiz7cnB7mcULg4ZExp93VwjJKbk7uZrPrneKQb/5bmVybL3eeIaWOoytRWUSLqV
	vemLv04Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6mo-00000001vcl-3Mnq;
	Mon, 17 Mar 2025 09:29:30 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6l7-00000001vCG-3Uj9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742203666; x=1773739666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dJoV1yMs920m1r9dWptgBPGSZSrP9BNdmMBKMk1MVp0=;
  b=R1wCP1mdqE10XNzo+hcX4KkgcfpT+7cZlrEcxCBCVGriW98S/6YBut6j
   GfUCvKfuCvmNswJN+wm2iS8min8yN0YOnZAa8Ap00j/0KIKQJKm1p71FX
   LRgbwcmju3DPL78Q3T9XWlZ5ds+mY263jDlDBkiqNh5WxcEb7+WSCVwVs
   Tc4bPu9c9MFdWi5q4abJZ6NWJwO7rAKcVhBCqhbeYnBvKuGc228jmQ2Ip
   N4k2Apdt+X/PFrJw8Tno/beFLR3K/6M9Ij5RieMx7KvBw6T2Sy/K37Mq2
   XqVI8reaV0HXLhiinJuGSzNmsvYYqEtG5ZSc+HZ2ypxyJhrDiVfCul+/L
   Q==;
X-CSE-ConnectionGUID: HsSxKw6pSIy0JawLh51Paw==
X-CSE-MsgGUID: 1QMTOomQStSTWJpemyed6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43157133"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43157133"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 02:27:45 -0700
X-CSE-ConnectionGUID: DNF9w2caToufAA+qjO/N8w==
X-CSE-MsgGUID: 4w/qxc07Q9GdL3t3sDcjLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="126743831"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 02:27:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tu6kz-00000003GTc-24Ua;
	Mon, 17 Mar 2025 11:27:37 +0200
Date: Mon, 17 Mar 2025 11:27:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <Z9frCUqRTD0i1Faq@smile.fi.intel.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <df0b2b53affbef5ccb7219328cc15db3ba843737.1741849323.git.mazziesaccount@gmail.com>
 <Z9LQ0O34EUM8WZku@smile.fi.intel.com>
 <20250316094112.6731bd01@jic23-huawei>
 <50b126c5-248e-4694-9782-4f28d6db5fce@gmail.com>
 <Z9fUmo5wp3EcNWzm@smile.fi.intel.com>
 <0db2a42f-d393-4e75-afbf-cf30c0e06cce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0db2a42f-d393-4e75-afbf-cf30c0e06cce@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_022745_912051_CE9F44FC 
X-CRM114-Status: GOOD (  38.93  )
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

On Mon, Mar 17, 2025 at 10:42:07AM +0200, Matti Vaittinen wrote:
> On 17/03/2025 09:51, Andy Shevchenko wrote:
> > On Mon, Mar 17, 2025 at 09:11:08AM +0200, Matti Vaittinen wrote:
> > > On 16/03/2025 11:41, Jonathan Cameron wrote:
> > > > On Thu, 13 Mar 2025 14:34:24 +0200
> > > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Mar 13, 2025 at 09:18:49AM +0200, Matti Vaittinen wrote:

...

> > > > > > +	num_channels = devm_iio_adc_device_alloc_chaninfo_se(dev,
> > > > > > +				&sun20i_gpadc_chan_template, -1, &channels);
> > > > > > +	if (num_channels < 0)
> > > > > > +		return num_channels;
> > > > > > +
> > > > > >    	if (num_channels == 0)
> > > > > >    		return dev_err_probe(dev, -ENODEV, "no channel children\n");
> > > > > 
> > > > > Note, this what I would expected in your helper to see, i.e. separated cases
> > > > > for < 0 (error code) and == 0, no channels.
> > > > > 
> > > > > Also, are all users going to have this check? Usually in other similar APIs
> > > > > we return -ENOENT. And user won't need to have an additional check in case of
> > > > > 0 being considered as an error case too.
> > > > In a few cases we'll need to do the dance the other way in the caller.
> > > > So specifically check for -ENOENT and not treat it as an error.
> > > > 
> > > > That stems from channel nodes being optionally added to drivers after
> > > > they have been around a while (usually to add more specific configuration)
> > > > and needing to maintain old behaviour of presenting all channels with default
> > > > settings.
> > > > 
> > > > I agree that returning -ENOENT is a reasonable way to handle this.
> > > 
> > > I agree - but I'm going to use -ENODEV instead of -ENOENT because that's
> > > what the current callers return if they find no channels. That way the
> > > drivers can return the value directly without converting -ENOENT to -ENODEV.
> > 
> > ENODEV can be easily clashed with other irrelevant cases,
> 
> Can you please explain what cases?

When it's a code path that returns the same error code for something different.

> > ENOENT is the correct
> > error code.
> 
> I kind of agree if we look this from the fwnode perspective. But, when we
> look this from the intended user's perspective, I can very well understand
> the -ENODEV. Returning -ENODEV from ADC driver's probe which can't find any
> of the channels feels correct to me.

Okay, it seems we have got yet another disagreement as I think this has to
be ENOENT. Because this is related to the firmware description and not real
hardware discovery path. If it is the latter, I may fully agree on ENODEV
choice. But AFAICS it's not the case here.

> > If drivers return this instead of another error code, nothing bad
> > happen, it's not an ABI path, correct?
> 
> I don't know if failure returned from a probe is an ABI. I still feel
> -ENODEV is correct value,

And I have the opposite opinion. I think ENODEV is _incorrect_ choice
in this case.

> and I don't want to change it for existing users -
> and I think also new ADC drivers should use -ENODEV if they find no channels
> at all.

Again, the problem is that you are trying to apply the error code for HW to the
information that comes from FW.

> Besides that I think -ENODEV to be right, changing it to -ENOENT for
> existing callers requires a buy-in from Jonathan (and/or) the driver
> maintainers.

Yeah, will wait for Jonathan to judge, but I think you can find rationale above.

-- 
With Best Regards,
Andy Shevchenko



