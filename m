Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3418C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/1G+SKQdNCp7/TEN2iwmfHVFh9Mpgi3hXXpjOWL2nA=; b=B/LegfewQoGqj1y9GNYCNHEVVw
	3CUiarT4P3xVuI+ufO9HOuCB2CrEpPl65DGk2QGoH8QOjm6nC0Pnxdusu/K5n7uVQ5bmKkCT6vDet
	x5IxPbCqRk2pV/DOB7V3lTImaIVaOo0FjgdNEgiurF0oXXvP4Ayj0A6csN4WJNqK+hiRU5YdAn3UY
	cAuoKnP+B7G/qi1Kw/fP8rYbUtliX731ldunw06wVa3KC+dxFnKZCzRZla0rue3Kz21PnKHXt29eQ
	t/sQinYuO2SbfyxWQVB6+ZrsiS8ncIoLwK2bmJHnZre8P7w/ZTMHKgvd96D2w+3RPh84um+ISrccl
	eynfL+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VS3-00000007JYU-3arb;
	Tue, 15 Sep 2026 15:52:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VS1-00000007JXh-2pfE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:52:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A7D3600C8;
	Tue, 15 Sep 2026 15:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E704D1F00893;
	Tue, 15 Sep 2026 15:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789487524;
	bh=o/1G+SKQdNCp7/TEN2iwmfHVFh9Mpgi3hXXpjOWL2nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VAQ04ieKIx8qzu2N0TjEFTUlNC0rVBiIK1ljVsXU60NzK4UnF7PAaJQNkLlulOZTo
	 omuP8Ticljoh3dg54JBRvb7nk6q6gs3nUVm6+aW/JtrwpZx2FmtHgIlBVS9WbTnYmQ
	 9IL/U7kFNGRj6d69sGEZP68+DZdGrZEIuN/AcXFr4ZjoDpXED6Uz6qe6FDhV+IHZNg
	 Ft3hSm8dddhRpnu/+tOX1o0XRzjk+9VyaiygBwpD4d3CSWeJUD1duhlXwjHyfcTlI6
	 HLMoeu36XnYqaC8cytIuSasSpS0ilAn5spVfnkGj2w4CzWEnwygDoZ464QxWitZoa6
	 OSV0xAP81qs0w==
Date: Tue, 15 Sep 2026 21:22:00 +0530
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
Message-ID: <aqlpoBJJXfZgsMxT@parshuram>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
 <aqgCQvRw9fns__0d@SMW015318>
 <aqjzvxI4ecoFvRLT@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqjzvxI4ecoFvRLT@ashevche-desk.local>
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

On 15-09-26, 10:29, Andy Shevchenko wrote:
> On Mon, Sep 14, 2026 at 09:18:42AM -0500, Frank Li wrote:
> > On Fri, Sep 11, 2026 at 06:25:36PM +0100, Nuno Sá wrote:
> > > In preparation for the bitmap based bus width capabilities, move
> > > enum dma_slave_buswidth out of linux/dmaengine.h into a new
> > > include/linux/dma/engine/types.h.
> > >
> > > linux/dmaengine.h is included nearly everywhere, so growing it with the
> > > new interface would make every one of its users pay for it. Keeping the
> > > basic types in a separate header lets the new interface live next to it
> > > without that cost. linux/dmaengine.h includes the new header, so its
> > > users are unaffected.
> > >
> > > While at it, add the missing kernel-doc for the enum members. The block
> > > already opened with /**, so kernel-doc expected every member to be
> > > described and warned about each one of them. Describe the UNDEFINED case
> > > in particular, as its meaning depends on where the value is used.
> 
> ...
> 
> > >  include/linux/dmaengine.h        | 20 +++-----------------
> > 
> > I think it is good to split dmengine consumer and provider header files to
> > hidden dmaengine's detail.
> 
> It's indeed desirable change. but isn't it a bit out of scope of the series?
> I suggest to do one step at a time. Would it work for you?
> 
> > suggest name
> > 	dma/engine.h
> > 
> > so we can start move more API to this files.
> > 
> > after all user include this consumer header file,  old
> > include/linux/dmaengine.h rename to include/linux/dmaengine-provider.h,
> > which only include by dmaengine drivers.
> 
> Traditional naming would be
> dma/engine/provider.h
> dma/engine/consumer.h

consumer and provider and good names.. I would retain the full dmaengine
everywhere please. dma causes confusion already!

-- 
~Vinod

