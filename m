Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BB7C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pYu5PJMwDbiD3YaUZzHgB4wN8SoNcJfUzk9qPUH13c=; b=AJAww5EP5Kb4lidESBfAZt/zNt
	c5MIZxxta52pOCbTWE/0h3u0h8ZNxtTfuSog9hrAnhdTFA4qgHIfv2d1uPluFa58Jx1j382lmDTHE
	VXtuUX5buxlGR11ajmWbxc+1qvTRBtOGXjnH/+G2USmqLPX5ATqmTl9C67aDM9PrtsyMV7blVd7Ng
	TyHeN8sMGe2nJ84C/bjW/NWcQCX/UMhLvmPQYTdplThZTr9tJyO4ADOAZwqgJ0U++shGBizmG7bqv
	np27YXX4XPBuinM8yHT02E7NT4wDbtBSXbOaQkNP6EeGpkQirBtNieGEvIMAokoCu6SF+xKjMC4Cc
	BsK2N8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GYc-0000000CB6I-03dU;
	Thu, 17 Sep 2026 18:10:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GYa-0000000CB5g-1gGM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 18:10:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B105600D4;
	Thu, 17 Sep 2026 18:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0B51F00893;
	Thu, 17 Sep 2026 18:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789668599;
	bh=4pYu5PJMwDbiD3YaUZzHgB4wN8SoNcJfUzk9qPUH13c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WbPi5HkVF8DSz0T2SCNJanVPF1hO+VUVNvlf7dZN/M+QGQZdaZZ++HiKXIdGawI0K
	 HoNSeXerN+3x7/q2GZx9A1BCMFtT6htdqJZ48oJSZe5prgnajMVxTbrsV37XDsodIL
	 nFgOSCtk9xLUnNo9T5jIw7b+hxZrEP2SI7saVA+3Tfuw89Qv7f66r2lozXtG1mM9N5
	 /wB/fpo4qFySqnM6qYJ3bWJdhbhNrCwJd0ZXHgk1bBgE76Dt0bo4BxnnXXZCXNiwB4
	 5I+uWXcHsxWWx3DRSbK05yRnPAhe00NkpmwlmO7L2NzHBqZ/zl4oPzq6bUmJ7fh5bU
	 LcQRf0alicsEw==
Date: Thu, 17 Sep 2026 23:39:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
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
Message-ID: <aqws8pN2rfS9-dCC@parshuram>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
 <aqgCQvRw9fns__0d@SMW015318>
 <aqjzvxI4ecoFvRLT@ashevche-desk.local>
 <aqlpoBJJXfZgsMxT@parshuram>
 <aqlwRkNcs_UqKjWs@parshuram>
 <aql6u3T0nnSVr-FC@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aql6u3T0nnSVr-FC@SMW015318>
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

On 15-09-26, 12:04, Frank Li wrote:
> On Tue, Sep 15, 2026 at 09:50:22PM +0530, Vinod Koul wrote:
> > On 15-09-26, 21:22, Vinod Koul wrote:

> > > > Traditional naming would be
> > > > dma/engine/provider.h
> > > > dma/engine/consumer.h
> > >
> > > consumer and provider and good names.. I would retain the full dmaengine
> > > everywhere please. dma causes confusion already!
> >
> > Thinking about it again, drivers/dma/dmaengine.h should be the provider
> 
> There some dmaengine code outside drivers/dma directory, like
> drivers/crypto/ccp/ccp-dmaengine.c

They chose to be outside, their choice... They need to be updated as
well to point to ../../dma/dmaengine.h :-)

-- 
~Vinod

