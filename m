Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E222C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wjDBD4eTQIvB0n0DbUPkYQj15kwWSjuBDp4QqdtW1U=; b=d8qHDAsN3Gdpfy4MxlGu7jh02V
	NIBy5hq4ORpPlWlwukrcqVxTiJrmOykCuBjGEBgQVQT4jQQnJ+e1shBfar4iyj7Kau5vSP3bNzjgo
	3D00YAdC93j6wIMoMLu9S19DvpLpAw8LAldvpgcwwO0PfYhj5CSCxR0dgiSFcH+ZAh2T4YPChuFET
	eiY1MxpBEjExfmieaLK942WjI3myTOfMwpbUPnDKiloO6Wc3ebvJooqx5C+/yHIWh5aJ8jU/l+aZ7
	7GgAwKddn8OTsBUEujjPvCRZKLCDaIl87zU+RGJDAHeDnJXlS897CEm63THOcA4qQJuYU7twIN/Ar
	Tu+eu/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Har-0000000BgOx-0Xo8;
	Wed, 09 Sep 2026 12:40:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hap-0000000BgOX-1zW1;
	Wed, 09 Sep 2026 12:39:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E366E60211;
	Wed,  9 Sep 2026 12:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780A31F00A3A;
	Wed,  9 Sep 2026 12:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957598;
	bh=4wjDBD4eTQIvB0n0DbUPkYQj15kwWSjuBDp4QqdtW1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rj1IrIP44mOF3Q6zyOQy+1mwdi2cS/MrkriYAymLSDMvvPBZjd2BSJywkaPirWg8+
	 jv/pq79HZ+t8lNaivmIEMURx7xVM9uZRHBtyl4CZpzxBScOgkPil862x8VRJkZQ8yw
	 vzXO0wfO/FidAIalJo0eqfh/4Ta6rD6cqcF/nQN2DB91B/G/QVs7KEZaIaVmSft2A6
	 tYZ4I43+QPYvVgApIkob6jsUrdpDLGK+t9Fq+CdwgOTVg0a++n811WNpc6Z9csJTwe
	 ppUYxVQ62KkGkRjhIUVlKTSDS0Ho258mO1pXA2cLr1XatH7NSfmBlCr9xQZXP4MaiG
	 6/OplGs7fuUMQ==
Date: Wed, 9 Sep 2026 18:09:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Frank.Li@oss.nxp.com, Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 3/4] dmaengine: add (dmaengine|vchan)_chan_dev() helper
Message-ID: <aqFTmjUCysJWmy-P@parshuram>
References: <20260904-dma-chan_dev-rename-v3-0-685601b0b788@nxp.com>
 <20260904-dma-chan_dev-rename-v3-3-685601b0b788@nxp.com>
 <c79f42cf-43c4-4b5a-a6da-217052d40284@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c79f42cf-43c4-4b5a-a6da-217052d40284@foss.st.com>
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

On 07-09-26, 10:55, Amelie Delaunay wrote:
> Hi Frank,
> 
> On 9/4/26 23:49, Frank.Li@oss.nxp.com wrote:
> [...]
> 
> I don't think removing chan2dev() function from the STM32 DMA drivers is an
> improvement, since the parameter is a `stm32` chan, not a `dma_chan`.
> chan2dev() was meant to expose the channel device behind the `stm32` wrapper
> and keep logging concise.
> 
> > diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
> > index 3e8151e2ad75a..4688cebaf7f7a 100644
> > --- a/drivers/dma/stm32/stm32-dma.c
> > +++ b/drivers/dma/stm32/stm32-dma.c
> > @@ -248,11 +248,6 @@ static struct stm32_dma_desc *to_stm32_dma_desc(struct virt_dma_desc *vdesc)
> >   	return container_of(vdesc, struct stm32_dma_desc, vdesc);
> >   }
> > -static struct device *chan2dev(struct stm32_dma_chan *chan)
> > -{
> > -	return &chan->vchan.chan.dev->device;
> > -}
> > -
> 
> I would rather keep it as:
> 
> static struct device *chan2dev(struct stm32_dma_chan *chan)
> {
> 	return vchan_chan_dev(&chan->vchan);
> }
> 
> and then drop all further updates.

I would say better to use a common macro than keep one for yours

-- 
~Vinod

