Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CB4C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY805taQCjgb03o/s8e5sUsofMrXtbd/rx03espmDQw=; b=nNuhMmjc/2yovf6/LDEZtTkPZD
	alV/J9oXvGYLXMoKVxzYs/EXXyvRIybqbCV9dnRBVnKb6J3OohCGOm1phdpeGXHJL+54j0eW+XSja
	8rCg64uQyS1jyluTBtZ07/WxQta6Y+51OKiYnB4eaDWDOTkYZLm/ChOT9HVpSqI0NiK4WC7PO6mT0
	QwVG+cHlFtpLQhvkG/mDJgEKZ6MiEJeNN+LEtEfSO/zbgOcoMEJJ091d2tXOKc9xl/wCzjXkshpVA
	W/N+rbELRAu8ouZAaymjPCcEOEa+YggkSAYNMku7QOkC0paBukfpoyTqMKmjs/fJ+5Ej+x/tAzoq0
	T+qomH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1fG-0000000FL0h-3dj6;
	Wed, 15 Jul 2026 15:36:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1fG-0000000FL0W-0fEW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:36:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D613842E28;
	Wed, 15 Jul 2026 15:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23151F000E9;
	Wed, 15 Jul 2026 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784129809;
	bh=yY805taQCjgb03o/s8e5sUsofMrXtbd/rx03espmDQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VygLZc03gz4xzJm+budUdm3rStKb6PFBOhsNxZQM0yXDPX70SIhaMelOv+5f3H8lb
	 pz+OAsnmghx1L8QzstPAAnTqU2ML9N0M1WCURhWu8ijlIU8hYokpic9Uz3Z38vAbJC
	 nsDnoKDLvjJr4/9iF9OmcTfcu+6ty2BYIm5j8MrxKXtr9RjRvg4QoCPurf+DSoyMEf
	 KMvGIB80Ah1I93Ea1E6CZuXWzeVXDhudJGlkugb4+3Sx+zXQJTp/KAYXWOhp8g7Ril
	 1wgbs3E9xuwpTHv2W3J6wljq31KKn/5B2ySg0h5+b/BH7lzt7RuUgdJqjdCh1oZtLx
	 ieD241T8ApPLw==
Date: Wed, 15 Jul 2026 21:06:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v21 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <alepDnRJmRLbFGRQ@vaman>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com>
 <alYGGu7_3G6mJAzQ@linaro.org>
 <CAMRc=MevqXga1u-XC8LYc3hnjjzmdESntsSGYP25XECeeySfJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MevqXga1u-XC8LYc3hnjjzmdESntsSGYP25XECeeySfJA@mail.gmail.com>
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

On 15-07-26, 14:43, Bartosz Golaszewski wrote:
> On Tue, 14 Jul 2026 11:49:14 +0200, Stephan Gerhold
> <stephan.gerhold@linaro.org> said:
> > On Mon, Jul 13, 2026 at 03:01:07PM +0200, Bartosz Golaszewski wrote:
> >> Add support for BAM pipe locking. To that end: when starting DMA on an RX
> >> channel - prepend the existing queue of issued descriptors with an
> >> additional "dummy" command descriptor with the LOCK bit set. Once the
> >> transaction is done (no more issued descriptors), issue one more dummy
> >> descriptor with the UNLOCK bit.
> >>
> >> We *must* wait until the transaction is signalled as done because we
> >> must not perform any writes into config registers while the engine is
> >> busy.
> >>
> >> The dummy writes must be issued into a scratchpad register of the client
> >> so provide a mechanism to communicate the right address via descriptor
> >> metadata.
> >>
> >> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> > Thanks for the fixes. The lock/unlock sequence looks good to me now,
> > I commented on a couple of minor things below that would be good to fix
> > (some of them are also reported by Sashiko).
> >
> 
> Thanks.
> 
> >> ---
> >>  drivers/dma/qcom/bam_dma.c       | 191 +++++++++++++++++++++++++++++++++++++--
> >>  include/linux/dma/qcom_bam_dma.h |  14 +++
> >>  2 files changed, 198 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> >> index f3e713a5259c2c7c24cfdcec094814eb1202971a..f08549ee3872eece85884606d6ee9e540ee688ca 100644
> >> --- a/drivers/dma/qcom/bam_dma.c
> >> +++ b/drivers/dma/qcom/bam_dma.c
> >> [...]
> >> @@ -686,6 +702,35 @@ static int bam_slave_config(struct dma_chan *chan,
> >>  	return 0;
> >>  }
> >>
> >> +static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
> >> +{
> >> +	struct bam_chan *bchan = to_bam_chan(desc->chan);
> >> +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
> >> +	struct bam_desc_metadata *metadata = data;
> >> +
> >> +	if (!data)
> >
> > Doesn't really matter much, but since the parameter exists you might as
> > well add
> >
> > 	&& len == sizeof(*metadata)
> >
> > here to be sure.
> >
> 
> Ok.
> 
> >> +		return -EINVAL;
> >> +
> >> +	if (!bdata->pipe_lock_supported)
> >> +		/*
> >> +		 * The client wants to use locking but this BAM version doesn't
> >> +		 * support it. Don't return an error here as this will stop the
> >> +		 * client from using DMA at all for no reason.
> >> +		 */
> >> +		return 0;
> >> +
> >> +	guard(spinlock_irqsave)(&bchan->vc.lock);
> >> +
> >> +	bchan->scratchpad_addr = metadata->scratchpad_addr;
> >> +	bchan->direction = metadata->direction;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct dma_descriptor_metadata_ops bam_metadata_ops = {
> >> +	.attach = bam_metadata_attach,
> >> +};
> >
> > I'm not sure if we have discussed this before, but could we avoid
> > re-programming the scratchpad_addr all the time by placing it into
> > struct dma_slave_config -> peripheral_config? It still feels awkward to
> > me to place a global constant configuration value into per-descriptor
> > metadata.

The concept is that a dmaengine can handle multiple peripherals, so the
peripheral is always per desciptor

> Yes, this was discussed several versions ago. I went with using
> dmaengine_slave_config() until v11. I think Vinod or Dmitry requested we change
> it to the metadata.

metadata seems better fit for this.

> >>  /**
> >>   * bam_prep_slave_sg - Prep slave sg transaction
> >>   *
> >> [...]
> >> @@ -802,6 +851,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
> >>  		}
> >>
> >>  		vchan_get_all_descriptors(&bchan->vc, &head);
> >> +		bchan->bam_locked = false;
> >
> > I wonder about the implications of this. If the LOCK descriptor was
> > already processed, will we cause a deadlock if we never submit the
> > UNLOCK descriptor? Or I guess bam_reset_channel() might reset the lock
> > as well?

Good point

-- 
~Vinod

