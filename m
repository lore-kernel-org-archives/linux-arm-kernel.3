Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADADC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46gL7e56MAEV+QE7Z3CduA1LUjoQGUDv2tnhYHAXOoc=; b=GgTjXthZWiGPeQ5x6x3hMwKhiX
	8kc2zPa/AkK/jpsVgz58hfQYmBRH7l+I96BNiUDjsIrL0WWowHqV3w7Xhj6LyR8eRG4glpagnh0C4
	bn1E0lCO5lD2kjyEUii/0udqkRPTDE9B2ZZgU8rD7uWVIwf1z4J1bY2hSFrslLQzgSIHwwaLTCTz6
	oObjdXXcnOdA4h8BjroLdCiMC4PZTpcP1QfwzV3qXLfBDm52VibNHRZg53nVO9ZG2/wzzxaNmw5t9
	ZtZGEKZ6WvNoY7YmgMsJjX6lldu7kgLDEEDBR6dT6Z8/cdlvNIj4y4cstQoKQBLMnnEjTULWm4JBF
	FSID8sDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VtU-00000007OOn-33NI;
	Tue, 15 Sep 2026 16:20:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VtT-00000007OOc-4ATz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0219442A37;
	Tue, 15 Sep 2026 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022DB1F00893;
	Tue, 15 Sep 2026 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489226;
	bh=46gL7e56MAEV+QE7Z3CduA1LUjoQGUDv2tnhYHAXOoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i6gOUUdRELi9ju9aLowbcP6vJKgEXpk8T75B7wgpZB2AXtVSfjgFS/5krFn+Tjrjn
	 U+toJGWxVxzuErG+fvgvEatlTQ+q3EEbNN1/IScUhX9f9OSGu7UACw/+iPgEfhg3md
	 d96nYF4wWEym8yrAUuuUV2Ye0qY/HfEqbRcUZfhJqAyWc3xSnLJVrg+N/Sacu+MkXs
	 4GOpV3KLpWCXXtTmuaztED2nA7EuYV2eE2gKgSq+bQqCXY2m2iz3rEjUpkzxcwLCjh
	 mxpWVbUNKrGvNMpHLBTNyYARbXQen6GlpgBCk1IsCDGyILoJkSgU5m/mIMzYhmR/Dn
	 ks/VKHqWJfiCg==
Date: Tue, 15 Sep 2026 21:50:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
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
Message-ID: <aqlwRkNcs_UqKjWs@parshuram>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
 <aqgCQvRw9fns__0d@SMW015318>
 <aqjzvxI4ecoFvRLT@ashevche-desk.local>
 <aqlpoBJJXfZgsMxT@parshuram>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqlpoBJJXfZgsMxT@parshuram>
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

On 15-09-26, 21:22, Vinod Koul wrote:
> On 15-09-26, 10:29, Andy Shevchenko wrote:
> > On Mon, Sep 14, 2026 at 09:18:42AM -0500, Frank Li wrote:
> > > On Fri, Sep 11, 2026 at 06:25:36PM +0100, Nuno Sá wrote:
> > > > In preparation for the bitmap based bus width capabilities, move
> > > > enum dma_slave_buswidth out of linux/dmaengine.h into a new
> > > > include/linux/dma/engine/types.h.
> > > >
> > > > linux/dmaengine.h is included nearly everywhere, so growing it with the
> > > > new interface would make every one of its users pay for it. Keeping the
> > > > basic types in a separate header lets the new interface live next to it
> > > > without that cost. linux/dmaengine.h includes the new header, so its
> > > > users are unaffected.
> > > >
> > > > While at it, add the missing kernel-doc for the enum members. The block
> > > > already opened with /**, so kernel-doc expected every member to be
> > > > described and warned about each one of them. Describe the UNDEFINED case
> > > > in particular, as its meaning depends on where the value is used.
> > 
> > ...
> > 
> > > >  include/linux/dmaengine.h        | 20 +++-----------------
> > > 
> > > I think it is good to split dmengine consumer and provider header files to
> > > hidden dmaengine's detail.
> > 
> > It's indeed desirable change. but isn't it a bit out of scope of the series?
> > I suggest to do one step at a time. Would it work for you?
> > 
> > > suggest name
> > > 	dma/engine.h
> > > 
> > > so we can start move more API to this files.
> > > 
> > > after all user include this consumer header file,  old
> > > include/linux/dmaengine.h rename to include/linux/dmaengine-provider.h,
> > > which only include by dmaengine drivers.
> > 
> > Traditional naming would be
> > dma/engine/provider.h
> > dma/engine/consumer.h
> 
> consumer and provider and good names.. I would retain the full dmaengine
> everywhere please. dma causes confusion already!

Thinking about it again, drivers/dma/dmaengine.h should be the provider
and include/linux/dmaengine.h the consumer header, things can be
arranged into these files.. I would say whatever is not used by
consumers can be moved into local header

Thanks
-- 
~Vinod

