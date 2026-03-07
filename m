Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DCCF55104
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjqnMz7iTzJ2GtXS3sOBAaXrLUpb5WBurCzc81cKQ5I=; b=gyOPRZj+XG8J9RgWaoTTgqgEwC
	3H56KMyFAzuTkkuaawmzfJiqLuKe98okQ8cmCHIlYTpcJnsRn8d4hs63NZtItlgvdv77IMtXTHa9c
	pW1XUNvmjcvUCLwgy8WW5qL6IBXkDYPwwnYvwaMK8tC0CI8tdIyS0FTft60IFKahL+vKCgnmV/ncq
	oR2N28uZTM6yvxuIxxqiFsRBnyi56FbSvSF0b5fjgPL9RrrTDdndDEc8twPe6bUaEBobyKeMcU9wU
	fIjSdrATYOKKwf+/zo/8o96l9Evi3QFTW2qdY6HFFblctrBYpFHdGOIJSOteFc3/PZ0RM0lvC6Woj
	ecUScCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyyMv-00000005Ugq-2pgL;
	Sat, 07 Mar 2026 20:35:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyyMq-00000005UgH-3X83
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 20:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFFE643716;
	Sat,  7 Mar 2026 20:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E94DC19422;
	Sat,  7 Mar 2026 20:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772915718;
	bh=un14T0IT/vIqcYm6aN8xOLPJnlapIRXG/s+nnWU1kqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fv3jG6JBv75N4xFs3hP3/xuPfMcJfEmgzLxtHA1/0aBvtRCg1GamFg0WRHTl1VfTT
	 W9ACjsPMPLYWQrfKKpz+6uz24D/uggUV0a+0G9qGqtv5eDXbjcm3bCyczwfsOzbdOP
	 1moudz6U3cYKoVxc2nm9W051L9fmJApiixzy3/iWnQ8NojskWhU54NzItkTLcUhX/9
	 OkyRJbjkwRxR0M13mJx9jwEAitNTIM8Tly6TE3Esj1WzMX1soHZcnPHqDwOgw6D5rK
	 pcK3r+cS+o9G3okXQVTUV2ZGxUR50Harvo1UPy8o1XYlAKzJ3RJPlBe4UH5U05MRO6
	 bjn/SKVoRzJFQ==
Date: Sun, 8 Mar 2026 02:05:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC v11 07/12] crypto: qce - Communicate the base
 physical address to the dmaengine
Message-ID: <aayMAlkJNxp9h4KO@vaman>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <20260302-qcom-qce-cmd-descr-v11-7-4bf1f5db4802@oss.qualcomm.com>
 <aahEMjjBRINXL5zC@vaman>
 <CAMRc=Md2G7k7DGMZv2Du75ososQtsAutw2WwwAQ3WL8pC_-LmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md2G7k7DGMZv2Du75ososQtsAutw2WwwAQ3WL8pC_-LmQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_123521_297416_C1D18BE9 
X-CRM114-Status: GOOD (  19.81  )
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

On 04-03-26, 16:05, Bartosz Golaszewski wrote:
> On Wed, Mar 4, 2026 at 3:39 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 02-03-26, 16:57, Bartosz Golaszewski wrote:
> > > In order to let the BAM DMA engine know which address is used for
> > > register I/O, call dmaengine_slave_config() after requesting the RX
> > > channel and use the config structure to pass that information to the
> > > dmaengine core. This is done ahead of extending the BAM driver with
> > > support for pipe locking, which requires performing dummy writes when
> > > passing the lock/unlock flags alongside the command descriptors.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> > >
> > >       dma->txchan = devm_dma_request_chan(dev, "tx");
> > >       if (IS_ERR(dma->txchan))
> > > @@ -121,6 +123,12 @@ int devm_qce_dma_request(struct qce_device *qce)
> > >               return dev_err_probe(dev, PTR_ERR(dma->rxchan),
> > >                                    "Failed to get RX DMA channel\n");
> > >
> > > +     cfg.dst_addr = qce->base_phys;
> > > +     cfg.direction = DMA_MEM_TO_DEV;
> >
> > So is this the address of crypto engine address where dma data is
> > supposed to be pushed to..?
> 
> No. In case I wasn't clear enough in the cover letter: this is the
> address of the *crypto engine* register which we use as a scratchpad
> for the dummy write when issuing the lock/unlock command. Mani
> suggested under the cover letter to use the descriptor metadata for
> that.

This is overloading of address field. If we go this was I would add a
comment in code explaining this and why in the setup the engine does not
need peripheral address. Meta data sounds okay as well.

-- 
~Vinod

