Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03116CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7xT0wwGtRh1F9QxqGNVizUkPlO88Kff6j6WBKqgtY0=; b=fC/skz6PVr97Eo7LD9BwcsJqGR
	WaUWqjn0bF+3odEFg0f7Eyt2WW4/mV2xjbfBs6iBSrZ+0Y2mKNHbwjk5PNeMpctoXk7VGXEOIqiR4
	jZ8GEAd3cMUOzhLR5m2ORszatJ4BjpzOCtEtjHkXUOuQvCn4AnjkZbo9KFtszvwWdFHuKBeDQ/bUT
	+6LJlEBikYDp5M+Nxrsq6o9uxKnbSpwQ96FrKK4Od/t3jz4cupifPUHzYpmrEzWAIrvIOj9GG0EwY
	ouWm9t4Y+nOmwrkTwEfiVvM3JtSq59/hVdSmMko4V2YpocmT3MK9J94G+eDsf45aY+5d/9sFdfFdx
	pyimxeYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHd1-0000000EYSy-05Ag;
	Sun, 04 Oct 2026 08:31:28 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHcx-0000000EYSP-1cAV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791102683; x=1822638683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=et2ZK2SJ1VtuqGzFJI2TWpIthJtmQ9Ek7g1wQZoau10=;
  b=irmcSOUcI9kdDoP1SY4YM9mUuFabRi7JAHClDCOqAYEkk4JqodQUy0wc
   09QAvRNOY/yemWtWgxDhJ63vJhqEa16be41lkwHlmXZ1WBUrwVfsVW2eL
   8A6SIUPyY+CSTqH520uFQpw2vkwWUUc8Yi/mqXUnLHjNOt6b+wa8HT9+m
   m9SahzIcdG3ZMuWn4HcqOa/d4YCOqmncc055+HgNiU/KpMn1KOA95LkoW
   9FSkYrGZLO0ri/vnH4dgLiM6Yb87+zw2yxN2kV29ByCSQQfy9FjtPqVeU
   0r1bGug3wjp89vjKhEcY7ywQklUk7HvOKEfQLZIuJmqKjheSs4dk59/De
   Q==;
X-CSE-ConnectionGUID: u53lZOVMQAizSgfbLe8NtA==
X-CSE-MsgGUID: lwU7DumIQh2QkK3iNnHBnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="109289931"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="109289931"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 01:31:21 -0700
X-CSE-ConnectionGUID: RgYkFbywSeyl+uqTyYbi8A==
X-CSE-MsgGUID: iWoMLbKfSc+S/CjQy+BRmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="657332"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 01:31:16 -0700
Date: Sun, 4 Oct 2026 11:31:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 01/10] dmaengine: Move enum dma_slave_buswidth to a
 new header
Message-ID: <asIO0tGiHGm0llvI@ashevche-desk.local>
References: <aql6u3T0nnSVr-FC@SMW015318>
 <aqws8pN2rfS9-dCC@parshuram>
 <aqz1-OzFobOROuBw@nsa>
 <aq18_TMNs4EJzgZO@parshuram>
 <arDtEB0na9DxDWAS@nsa>
 <arFXc0LqEpgWSS6m@SMW015318>
 <ar-Il2qP_Qms3Qw1@nsa>
 <ar-13p3a7ENGfMOF@SMW015318>
 <asEWwIfO0LB27wj9@ashevche-desk.local>
 <asGk4fj_HQ5HupB4@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asGk4fj_HQ5HupB4@SMW015318>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_013123_442024_832E4632 
X-CRM114-Status: GOOD (  53.75  )
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

On Sat, Oct 03, 2026 at 07:59:13PM -0500, Frank Li wrote:
> On Sat, Oct 03, 2026 at 05:52:48PM +0300, Andy Shevchenko wrote:
> > On Fri, Oct 02, 2026 at 08:47:10AM -0500, Frank Li wrote:
> > > On Fri, Oct 02, 2026 at 11:43:17AM +0100, Nuno Sá wrote:
> > > > On Mon, Sep 21, 2026 at 11:12:35AM -0500, Frank Li wrote:
> > > > > On Mon, Sep 21, 2026 at 09:53:49AM +0100, Nuno Sá wrote:
> > > > > > On Fri, Sep 18, 2026 at 11:33:41PM +0530, Vinod Koul wrote:
> > > > > > > On 18-09-26, 09:39, Nuno Sá wrote:
> > > > > > > > On Thu, Sep 17, 2026 at 11:39:54PM +0530, Vinod Koul wrote:
> > > > > > > > > On 15-09-26, 12:04, Frank Li wrote:
> > > > > > > > > > On Tue, Sep 15, 2026 at 09:50:22PM +0530, Vinod Koul wrote:
> > > > > > > > > > > On 15-09-26, 21:22, Vinod Koul wrote:

...

> > > > > > > > > > > > > Traditional naming would be
> > > > > > > > > > > > > dma/engine/provider.h
> > > > > > > > > > > > > dma/engine/consumer.h
> > > > > > > > > > > >
> > > > > > > > > > > > consumer and provider and good names.. I would retain the full dmaengine
> > > > > > > > > > > > everywhere please. dma causes confusion already!
> > > > > > > > > > >
> > > > > > > > > > > Thinking about it again, drivers/dma/dmaengine.h should be the provider
> > > > > > > > > >
> > > > > > > > > > There some dmaengine code outside drivers/dma directory, like
> > > > > > > > > > drivers/crypto/ccp/ccp-dmaengine.c
> > > > > > > > >
> > > > > > > > > They chose to be outside, their choice... They need to be updated as
> > > > > > > > > well to point to ../../dma/dmaengine.h :-)
> > > > > > > >
> > > > > > > > I tend to agree with Andy but anyways. I feel this is going a bit out of
> > > > > > > > scope now. So what we have now in the series is:
> > > > > > > >
> > > > > > > >
> > > > > > > > - include/linux/dmaengine.h (without enum dma_slave_buswidth)
> > > > > > > > - include/linux/dma/types.h (with enum dma_slave_buswidth and new
> > > > > > > >   dma_buswidth_t type) - A future one would be dma_cap_mask_t and we could
> > > > > > > >   drop bitmap.h from dmaengine.h
> > > > > > > > - include/linux/dma/widthmask.h - The new bitmap based API for bus_width
> > > > > > > >
> > > > > > > > I kind like the separation (and the whole point was to avoid bitmap.h in
> > > > > > > > the main dmaengine.h API) but tbh I'm not sure if a consumer driver
> > > > > > > > will ever use dma/widthmask.h without needing the consumer API. But
> > > > > > > > to sum things up, what do you suggest for vÛE?
> > > > > > > >
> > > > > > > > * include/linux/dmaengine.h as the consumer API and includes the new
> > > > > > > > the widthmask API
> > > > > > > > * provider/private goes to drivers/dma/dmaengine.h and just includes
> > > > > > > > include/linux/dmaengine.h as the starting point?
> > > > > > > >
> > > > > > > > Let me know how do you want things for v5
> > > > > > >
> > > > > > > Yes lets talk about dma_slave_buswidth, it is client type. This is
> > > > > > > configured by users to set the width of peripheral.
> > > > > > > So this needs to be in the include/linux/dmaengine.h
> > > > > > >
> > > > > >
> > > > > > Agreed! But providers also need to set the allowed bus mask. And I'm
> > > > > > just not sure they need to include/consume all of the consumer API.
> > > > > > Also, it's common to allow the provider API to be widely used throughout
> > > > > > the kernel (but I agree that could be even harder to get done - if we
> > > > > > want to make some stuff really private - but I guess that could be done
> > > > > > in a second step or more incrementally). We do also have some subfolders
> > > > > > in `drivers/dma` which means we'll need the odd "../dmaengine.h" relative
> > > > > > include which I do not love tbh (on top of the crypto stuff).
> > > > > >
> > > > > > I really think something like the below would be more appropriate (if we
> > > > > > just want the provider/consumer API without further splitting like the
> > > > > > types.h and widthmak.h in this version):
> > > > > >
> > > > > > include/linux/dmaengine.h - provider API (as of today)
> > > > > > include/linux/dmaengine-consumer.h
> > > > > >
> > > > > > But anyways, if you or Frank do not object in the next few days, I'll
> > > > > > take the above approach suggested by Vinod:
> > > > > >
> > > > > > drivers/dma/dmaengine.h - provider
> > > > > > include/linux/dmaengine.h - consumer
> > > > >
> > > > > It think it is fine.
> > > >
> > > > So I was aboutto start on this again and I just realized
> > > > drivers/dma/dmaengine.h already exists today so nothing to do on this
> > > > series.
> > >
> > > I just find it and start some cleanup/move work.
> > >
> > > > I mean I could remove the consumer include on the dmaengine
> > > > drivers that I'm touching but not really on scope and super important
> > > > IMO. So, for the consumer side, should I just go to the first approach
> > > > where all the bus_width API goes into include/linux/dmaengine.h or
> > > > should I keep:
> > > >
> > > > include/linux/engine/types.h
> > > > include/linux/engine/widthmask.h
> > > >
> > > > And have a better separation on the consumer side? Or maybe changing
> > > > s/engine/consumer/ on the above paths?
> > >
> > > I go through v3 thread, Andy just said split to new type.h, but not have
> > > provided reason.
> > >
> > > I am planning move provide API and data structure to driver/dma/dmaengine.h
> > >
> > > include/linux/dmaengine.h will keep consume only defination and API.
> > >
> > > why still need types.h?
> >
> > The idea was to rectify the messed up dependencies. Without split of types we
> > will need to have bitmap.h (IIRC the initial idea of the split was that) only
> 
> There are already include bitmap.h, and use
> 
> typedef struct { DECLARE_BITMAP(bits, DMA_TX_TYPE_END); } dma_cap_mask_t;

This is not part of bitmap.h. DECLARE_BITMAP() resides in types.h.

> Suppose all DMA Engine consumer will use it to do some check. So I think
> needn't split it as indivial version.

I guess you need to dive a bit more in that mess we have...

> > where it's indeed required. Besides bitmap.h there are might be more headers
> > that "include half of the world" which should be avoided in every header file.

-- 
With Best Regards,
Andy Shevchenko



