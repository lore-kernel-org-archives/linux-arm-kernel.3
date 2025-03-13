Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F3CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roBKFnJdmrMZJlpMxADUL71pNHfO1ZK7zkRFAGYiMqE=; b=nts2OYdJICRQkCf4fegkkm/pwr
	FpxFKz17qKiAqmtSfawiGh3Iq4HWkEdZnQzpvtnSNAWMV92jgNlLQr92mMiO+8Pa/PbqKUpFwdavb
	L6Gzg5w7ORvDrx7rZyn6Ny6GJp3wJrn/tdlzDTvlSRQy9Az26LceYQvGpSMHRccRuxd15uFqw938Y
	ahqMRu86PZW8wss3mvSxjkP8KOYLzrC3e1GterNBN2qR7yERpQiIfiVAzCRUaVtnfxaCxn93Nogqa
	JKVg+pvcKC56ZSNsrmqF4eCMbXBjSyI3pfY2o90OLFtgqJ5s1tgd45vYm5JXk6cRqYgfi/EVSnsdP
	bWf2pQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsify-0000000BOSj-2IHr;
	Thu, 13 Mar 2025 13:32:42 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsidA-0000000BOAE-1tdb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741872588; x=1773408588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3R5NqPG75eCifry1xE8jCo+Ba/RPNsND3Th6ewF0DW8=;
  b=LUOQWDVpcOi8PI2qbyByY+2qScKBOOZtthpREA7utobv+e4OSJ9vhNSy
   pYTVOP2t+jxFIuYYwDYJ8rF7EujzPCkqTyjUwbwv1AALqiB5O5vO5InMp
   Sr1Ij9n8iQoe1rHbCS7orbAiFaCcnpPdld8YplDbk/ZSiYbedVwldkH13
   4K756Ohf1jMeQ+rx7Zu9U+QMd9Tw+jcy0O8o/W5u58Nsn/Y0W7RoN7/aB
   Mlvpqqtr9Isa/ebhOt5eQ5EddubBZhhN6WQhY1KNoEdz4MOca5RO4sax0
   BNvSwae4hDe49XBZEqxYoHT9vpTgpuCvIMZop4JjI8IpDZrT82sPKe0PZ
   Q==;
X-CSE-ConnectionGUID: BoCLMlkQS0eqMjDY0DuuNw==
X-CSE-MsgGUID: awi0g/4jSZqtF9yZzN74Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43119156"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="43119156"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 06:29:47 -0700
X-CSE-ConnectionGUID: 04qS8wQPRn6wZVe4oTPTzg==
X-CSE-MsgGUID: 4xEfR6NSTcGJ84TSNnC6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="120669500"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 06:29:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsid0-00000002BNc-0muS;
	Thu, 13 Mar 2025 15:29:38 +0200
Date: Thu, 13 Mar 2025 15:29:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <Z9LdwUVBOEx-Tbvr@smile.fi.intel.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <c8899e8c535a1d93cd7588b7c160eb0fae5d26d2.1741849323.git.mazziesaccount@gmail.com>
 <Z9LQFqSweiV-zT3b@smile.fi.intel.com>
 <bca95d63-fb6e-4d6c-8ab6-df67f0e697e6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bca95d63-fb6e-4d6c-8ab6-df67f0e697e6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_062948_504621_1B5C6701 
X-CRM114-Status: GOOD (  26.11  )
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

On Thu, Mar 13, 2025 at 03:17:27PM +0200, Matti Vaittinen wrote:
> On 13/03/2025 14:31, Andy Shevchenko wrote:
> > On Thu, Mar 13, 2025 at 09:18:18AM +0200, Matti Vaittinen wrote:

...

> > > +	num_chan = iio_adc_device_num_channels(dev);
> > > +	if (num_chan < 1)
> > > +		return num_chan;
> > 
> > This is really interesting code. So, if the above returns negative error code,
> > we return it, if it returns 0, we return success (but 0 channels)?
> 
> Yes. I don't think it's that interesting though. Checking the devicetree
> succeeded while no channels were found. I think returning 0 is very much
> aligned with this.

Right, but as I suggested, let's follow already established APIs that return
-ENOENT and never 0 in similar cases.

> > Shouldn't we do *cs = NULL; at the case of 0 channels if it's a success?
> 
> I suppose you're right.
> 
> But, as you pointed out in review of the 05/10:
> > Usually in other similar APIs we return -ENOENT. And user won't need
> > to have an additional check in case of 0 being considered as an error
> > case too.
> 
> I don't know whether to agree with you here. For majority of the ADC
> drivers, having no channels in devicetree is indeed just another error,
> which I think is not in any ways special.

So...? (I see below your answer :-)

> However, for 33,3333% of the users added in this patch, the "no channels
> found" is not really an error condition ;) The BD79124 could have all
> channels used for GPO - although this would probably be very very unusual.
> (Why buying an ADC chip if you need just a GPO?). Still, this wouldn't be an
> error. (And I need to handle this better in BD79124 probe - so thanks).

ENOENT check is again established for optional/not_found cases.

> > (Under success I assume that returned values are okay to go with, and cs in
> > your case will be left uninitialised or contain something we don't control.
> 
> I see your point although I wouldn't be concerned with cs not being NULL for
> as long as number of channels is zero.
> 
> Anyway, I think it makes sense to simplify ~67% of callers by returning
> -ENODEV if there is no channels. The remaining ~33% can then check for the
> -ENODEV and handle it separately from other returned errors. So, thanks.

Not at all!

-- 
With Best Regards,
Andy Shevchenko



