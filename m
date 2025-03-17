Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025D3C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptpIHHYVlj8cQ+aMjzJcOoBsPGgPk4DT7i1v/90W4MI=; b=CVxZAoweu73hXUJCLTXNn5vrjS
	cuyue41ymTH60jDFO/JagCPBwnkx58OSQsUuZxh4pWU8CC7mM2ViFAGSmDCgwKWtLfOLs3UOBd9i4
	xJDsQ+eBUp2CNFA9BqX1JybLzxTi+3rUG4tKucWPz8egMtKgGA02qGDHDXKLnCjHsYPYYebuc95xn
	vaWApbMdmL7hi3AQGrmrLKsYdb7ie4H4qfZeQ608BYzIYPG9JEM0c+ywSn1HiN6Ejqdz9GCvKoCjY
	pT6p6IpF45EpnU081BOPBjxqW7PJjWC179qd6NnYJzYDtBY1pEM6JdN7lORK3kYHSIBpi7SVFg8OL
	65kcqXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5I9-00000001eLW-42vv;
	Mon, 17 Mar 2025 07:53:45 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5GU-00000001eDP-1lH6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 07:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742197922; x=1773733922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZHa6ERJ7NFArEGUz2GyKEAKlA9PEk/2XjeW1JUGRc4Q=;
  b=ILlSOgq1GXMA1rw9MxMGunF+5p1yHt7xk/LcohkqJdTeBgSx/JBSjuZM
   pEIRfqRGvJqnxb144/gQt8C8eVwyo/yWFZgL7AR8moaJiSFCXsgitwFQ1
   NhQ/L8ldhunIZckZzV6ZNNdTRefBBpopuC+PXcSu6TrLdNWEyaLtE+dYq
   JixG0atp7GfOAyUHmzubuQGNBldmypC1BVx10RdIkao07HcMxkoM2ZpsV
   Bp9jNUtp7PvDfrMR+49CgytW7jgqn8yqT5wq9hehkueQE5WTvlRSovMMZ
   Zb9dbYRHQtW/5Vu/ZKwnfpNpqbfOu8C/7V1xiPMJll1OEHTqPrP0/uKsC
   Q==;
X-CSE-ConnectionGUID: muYqZp4jTji8fyPYxdWXtw==
X-CSE-MsgGUID: KLQwRE7sS5O9xDZhCaBjLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="68638747"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="68638747"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 00:52:01 -0700
X-CSE-ConnectionGUID: vBGt1R1iRZmxKRlgsciK1g==
X-CSE-MsgGUID: ZjVdBA2qRUKjxLSCoLq+qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="122375993"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 00:51:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tu5GM-00000003FCZ-2dgX;
	Mon, 17 Mar 2025 09:51:54 +0200
Date: Mon, 17 Mar 2025 09:51:54 +0200
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
Message-ID: <Z9fUmo5wp3EcNWzm@smile.fi.intel.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <df0b2b53affbef5ccb7219328cc15db3ba843737.1741849323.git.mazziesaccount@gmail.com>
 <Z9LQ0O34EUM8WZku@smile.fi.intel.com>
 <20250316094112.6731bd01@jic23-huawei>
 <50b126c5-248e-4694-9782-4f28d6db5fce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50b126c5-248e-4694-9782-4f28d6db5fce@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_005202_472937_8299E123 
X-CRM114-Status: GOOD (  22.30  )
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

On Mon, Mar 17, 2025 at 09:11:08AM +0200, Matti Vaittinen wrote:
> On 16/03/2025 11:41, Jonathan Cameron wrote:
> > On Thu, 13 Mar 2025 14:34:24 +0200
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 13, 2025 at 09:18:49AM +0200, Matti Vaittinen wrote:

...

> > > > +	num_channels = devm_iio_adc_device_alloc_chaninfo_se(dev,
> > > > +				&sun20i_gpadc_chan_template, -1, &channels);
> > > > +	if (num_channels < 0)
> > > > +		return num_channels;
> > > > +
> > > >   	if (num_channels == 0)
> > > >   		return dev_err_probe(dev, -ENODEV, "no channel children\n");
> > > 
> > > Note, this what I would expected in your helper to see, i.e. separated cases
> > > for < 0 (error code) and == 0, no channels.
> > > 
> > > Also, are all users going to have this check? Usually in other similar APIs
> > > we return -ENOENT. And user won't need to have an additional check in case of
> > > 0 being considered as an error case too.
> > In a few cases we'll need to do the dance the other way in the caller.
> > So specifically check for -ENOENT and not treat it as an error.
> > 
> > That stems from channel nodes being optionally added to drivers after
> > they have been around a while (usually to add more specific configuration)
> > and needing to maintain old behaviour of presenting all channels with default
> > settings.
> > 
> > I agree that returning -ENOENT is a reasonable way to handle this.
> 
> I agree - but I'm going to use -ENODEV instead of -ENOENT because that's
> what the current callers return if they find no channels. That way the
> drivers can return the value directly without converting -ENOENT to -ENODEV.

ENODEV can be easily clashed with other irrelevant cases, ENOENT is the correct
error code. If drivers return this instead of another error code, nothing bad
happen, it's not an ABI path, correct?

-- 
With Best Regards,
Andy Shevchenko



