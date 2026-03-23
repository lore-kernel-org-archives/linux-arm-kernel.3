Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5952CF46113
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6I8HX5OyGwEWzfCYsI9oL102hKAYf5jDgCPpWt76ao=; b=JJ30FvJ2QaMOA+cDotm04Ztn5v
	v5Jcl/ulCOXfOr76sY3QzHWOl25NtNBlYpumBNv7E/l0MfEZvRrChxTnKXgpS61j0tHNWLHAABnU5
	sdXLK6yczI8VK2bsjw4tDYGy7z7/nKuaUSi/VAEaKBFdQYCsJnP7ulgB2dS2IHrAPXaoeYt77LAlC
	FnfwkCsmtj+Obrwt+SO1sh4bFeTslkbHwJfYKjAaDz4rrhj1igBHuVnndWB3L1WnxnczuSLXpqGHs
	iw8r/TVqZoCgyhgqAEmHJHS8lzC9Eqk6qcBgxJYbuX/tyT7rkD5kuOQOUA7GTGbkyWjfpIthkC//W
	Z+dKrUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fXs-0000000GrBO-1t82;
	Mon, 23 Mar 2026 13:42:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fXq-0000000GrAi-367S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:42:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5D8A600C4;
	Mon, 23 Mar 2026 13:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8C8C2BC9E;
	Mon, 23 Mar 2026 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774273333;
	bh=ZtPoRCkru0zgzMg1Dtr1KtTXqI/BbXwaUF7s9LHVs9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIxB7vn8lilMCHPxPp+kxXTrecdLy1a7i2KTdVl3MMbLYSvrJVTyOCSfscdRkKN33
	 MCVYxvIfx2UPiEWZASusQSJ0bK67Y3D4sUd1r/Aj1ecHcsFFOROGx+xxJPwRVxhHJQ
	 hZiyy3CaMLMsRjh81BqYBWMfAGWCPCd+cBjNfZIMrByTtUeRZEllBttXO+yg055goV
	 XUWcLiHHgMYd5ePrUwlGkcQIW0yKROm7dH9ZoifRjCDabIRhAXPPAeJG4OG7W8zm5k
	 A934KPuhHN69KZgJbiXYoSEbjW49m/et+1nOeMto3lzz0GYpXBrMAaEonnllPUUEJZ
	 eFuG/V0t6QoXQ==
Date: Mon, 23 Mar 2026 19:11:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v13 05/12] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <5i4vef45tsr5oquo4kpdnydgnmmciprpzif3do5g5clfx3ny2e@tfjapk6haitq>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
 <20260317-qcom-qce-cmd-descr-v13-5-0968eb4f8c40@oss.qualcomm.com>
 <hohx2judes5c6na4svpah254hqbaf4kbeyu7prwkprfv5dy7hj@26nxwlvb76yp>
 <CAMRc=McostnmVjE=uV=2KA7-dqLvQ2BAJYTXzANacFpPGgS+Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McostnmVjE=uV=2KA7-dqLvQ2BAJYTXzANacFpPGgS+Sw@mail.gmail.com>
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

On Mon, Mar 23, 2026 at 02:36:59PM +0100, Bartosz Golaszewski wrote:
> On Mon, Mar 23, 2026 at 10:35 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Tue, Mar 17, 2026 at 03:02:12PM +0100, Bartosz Golaszewski wrote:
> > > Add support for BAM pipe locking. To that end: when starting DMA on an RX
> > > channel - prepend the existing queue of issued descriptors with an
> > > additional "dummy" command descriptor with the LOCK bit set. Once the
> > > transaction is done (no more issued descriptors), issue one more dummy
> > > descriptor with the UNLOCK bit.
> >
> > I've left some comments in v12, but looks like you've missed them.
> 
> Sorry for that, as I explained in private, this email did not end up
> in my inbox and I didn't see it on lore.
> 
> > >
> > > +static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
> > > +{
> > > +     struct bam_chan *bchan = to_bam_chan(desc->chan);
> > > +     const struct bam_device_data *bdata = bchan->bdev->dev_data;
> > > +     struct bam_desc_metadata *metadata = data;
> > > +
> > > +     if (!data)
> > > +             return -EINVAL;
> > > +
> > > +     if (!bdata->pipe_lock_supported)
> > > +             return -EOPNOTSUPP;
> >
> > As mentioned in v12, you should return 0 to avoid erroring out the clients if
> > pipe lock is not supported.
> >
> 
> If the client attaches the scratchpad register then it probably does
> want to use locking, right? On the other hand, I assume you're
> thinking about a situation where the client wants locking but BAM does
> not support it. It's unlikely but ok, I'll change it.
> 

Locking is supported only since v1.4.0. So I was trying to avoid erroring out
the clients wanting to use DMA on older platforms (pre 1.4.0). I'm not sure if
such platforms exist, but could be possible.

- Mani

> > >
> > > +static struct bam_async_desc *
> > > +bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
> > > +                struct bam_cmd_element *ce, unsigned long flag)
> > > +{
> > > +     struct dma_chan *chan = &bchan->vc.chan;
> > > +     struct bam_async_desc *async_desc;
> > > +     struct bam_desc_hw *desc;
> > > +     struct virt_dma_desc *vd;
> > > +     struct virt_dma_chan *vc;
> > > +     unsigned int mapped;
> > > +     dma_cookie_t cookie;
> > > +     int ret;
> > > +
> > > +     sg_init_table(sg, 1);
> > > +
> > > +     async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
> > > +     if (!async_desc) {
> > > +             dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
> > > +             return NULL;
> > > +     }
> > > +
> > > +     async_desc->num_desc = 1;
> > > +     async_desc->curr_desc = async_desc->desc;
> > > +     async_desc->dir = DMA_MEM_TO_DEV;
> > > +
> > > +     desc = async_desc->desc;
> > > +
> > > +     bam_prep_ce_le32(ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0);
> > > +     sg_set_buf(sg, ce, sizeof(*ce));
> > > +
> > > +     mapped = dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE, DMA_PREP_CMD);
> > > +     if (!mapped) {
> > > +             kfree(async_desc);
> > > +             return NULL;
> > > +     }
> > > +
> > > +     desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
> > > +     desc->addr = sg_dma_address(sg);
> > > +     desc->size = sizeof(struct bam_cmd_element);
> > > +
> > > +     vc = &bchan->vc;
> > > +     vd = &async_desc->vd;
> > > +
> > > +     dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
> > > +     vd->tx.flags = DMA_PREP_CMD;
> > > +     vd->tx.desc_free = vchan_tx_desc_free;
> > > +     vd->tx_result.result = DMA_TRANS_NOERROR;
> > > +     vd->tx_result.residue = 0;
> > > +
> > > +     cookie = dma_cookie_assign(&vd->tx);
> > > +     ret = dma_submit_error(cookie);
> > > +     if (ret)
> > > +             return NULL;
> >
> > You are leaking async_desc here.
> >
> 
> Yeah, not only that but also should unmap the sg here too. Thanks.
> 
> > > +
> > > +     return async_desc;
> > > +}
> > > +
> > > +static int bam_do_setup_pipe_lock(struct bam_chan *bchan, bool lock)
> > > +{
> > > +     struct bam_device *bdev = bchan->bdev;
> > > +     const struct bam_device_data *bdata = bdev->dev_data;
> > > +     struct bam_async_desc *lock_desc;
> > > +     struct bam_cmd_element *ce;
> > > +     struct scatterlist *sgl;
> > > +     unsigned long flag;
> > > +
> > > +     lockdep_assert_held(&bchan->vc.lock);
> > > +
> > > +     if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
> > > +         bchan->slave.direction != DMA_MEM_TO_DEV)
> > > +             return 0;
> > > +
> > > +     if (lock) {
> > > +             sgl = &bchan->lock_sg;
> > > +             ce = &bchan->lock_ce;
> > > +             flag = DESC_FLAG_LOCK;
> > > +     } else {
> > > +             sgl = &bchan->unlock_sg;
> > > +             ce = &bchan->unlock_ce;
> > > +             flag = DESC_FLAG_UNLOCK;
> > > +     }
> > > +
> > > +     lock_desc = bam_make_lock_desc(bchan, sgl, ce, flag);
> > > +     if (!lock_desc)
> > > +             return -ENOMEM;
> > > +
> > > +     if (lock)
> > > +             list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
> > > +     else
> > > +             list_add_tail(&lock_desc->vd.node, &bchan->vc.desc_issued);
> > > +
> > > +     bchan->locked = lock;
> >
> > What is this flag for?
> >
> 
> Just a leftover. I'll drop it, thanks.
> 
> > >
> > > +struct bam_desc_metadata {
> > > +     phys_addr_t scratchpad_addr;
> >
> > I think it'd be worth adding a comment for this.
> >
> 
> Will do.
> 
> Bart

-- 
மணிவண்ணன் சதாசிவம்

