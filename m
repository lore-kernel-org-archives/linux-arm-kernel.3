Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52412F55102
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 20:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PTQiwVIkhzGdBuR9m0+qN2tQhaza5TlPaFgGaSbElk=; b=s/o0M1Fk86W+isyFZ12r7Hp+/k
	21ebTnVTB11akNQ1LXnoOU4dPwrymxyeZ2zGoSOBConn/3j00jZsHMw0I/8VgA2bN/ZyCE6MisRzr
	XBfBDt8OOsnha+d9eBpY/Rei9yJKNFRbZOKrHsIZ/yAdb4jYF2uIdrK5VNhVhthNFVypxCus5byGP
	V5su5j1Qo0TRoP49xr12OAFW2daIXYXAtx3C9fUZs00fYJu9+EdP765NFDSN2QbkOgqplwVni5YMK
	rz6/vB5ymmNrIXFomlmCK5j35mXdiFD2cOsf3DSMD6FIqBh+nhy5D3f+OWVczkwaZT4CGzLJ+H72M
	PZojAmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyyL4-00000005UYR-172w;
	Sat, 07 Mar 2026 20:33:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyyL2-00000005UYK-35vL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 20:33:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B729160051;
	Sat,  7 Mar 2026 20:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B8EC19422;
	Sat,  7 Mar 2026 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772915607;
	bh=31nT2idXq0b+j8ZBcxl0zy3PJn21/46lvsAvq0uSrZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lajtb8PLKfTECoMV48do6LFXGQr0OLrEVgYDwGomgZjaA/+vYMBq5DJk3TKH0yf09
	 8umviV+NpV9V8KosVu1u29DMjDUppkt7HEMYplUgw2w1aLHiTUZcKrU6i4XhiPQ2Oo
	 Ly4i1BSLRHKur85eP2SdyITkSaRvBi7N8GctW5ystyxuWH37lpNvt6833CF768WChW
	 n1LaFhHwBDrVHqAbzyhZYpYMbmd7QJhPuoJD1fx5oQRXUFxbmMgmNx/QAIJ9c9lCfC
	 9S3ku7+aOCkycsqyVHMIOmAMBklTpvbB1nm+IH2tBqCgVsQxWsQexuOJ6fp3AAwotS
	 vRBzbTcMeHFBg==
Date: Sun, 8 Mar 2026 02:03:22 +0530
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
Subject: Re: [PATCH RFC v11 12/12] dmaengine: qcom: bam_dma: add support for
 BAM locking
Message-ID: <aayLkmDRLMuTzXZv@vaman>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <20260302-qcom-qce-cmd-descr-v11-12-4bf1f5db4802@oss.qualcomm.com>
 <aahHeR9j7q4_ynYK@vaman>
 <CAMRc=Mc48+NyMPkFRa8GPv-odCe=r9WXJWUZYkTsaY53Ev_stQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc48+NyMPkFRa8GPv-odCe=r9WXJWUZYkTsaY53Ev_stQ@mail.gmail.com>
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

On 04-03-26, 16:27, Bartosz Golaszewski wrote:
> On Wed, Mar 4, 2026 at 3:53 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 02-03-26, 16:57, Bartosz Golaszewski wrote:
> > > Add support for BAM pipe locking. To that end: when starting the DMA on
> > > an RX channel - wrap the already issued descriptors with additional
> > > command descriptors performing dummy writes to the base register
> > > supplied by the client via dmaengine_slave_config() (if any) alongside
> > > the lock/unlock HW flags.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> [snip]
> 
> > > +static struct bam_async_desc *
> > > +bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
> > > +                struct bam_cmd_element *ce, unsigned int flag)
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
> > > +     bam_prep_ce_le32(ce, bchan->slave.dst_addr, BAM_WRITE_COMMAND, 0);
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
> >
> > I am not sure I understand this.
> >
> > At start you add a descriptor in the queue, ideally which should be
> > queued after the existing descriptors are completed!
> >
> > Also I thought you want to append Pipe cmd to descriptors, why not do
> > this while preparing the descriptors and add the pipe cmd and start and
> > end of the sequence when you prepare... This was you dont need to create
> > a cookie like this
> >
> 
> Client (in this case - crypto engine) can call
> dmaengine_prep_slave_sg() multiple times adding several logical
> descriptors which themselves can have several hardware descriptors. We
> want to lock the channel before issuing the first queued descriptor
> (for crypto: typically data descriptor) and unlock it once the final
> descriptor is processed (typically command descriptor). To that end:
> we insert the dummy command descriptor with the lock flag at the head
> of the queue and the one with the unlock flag at the tail - "wrapping"
> the existing queue with lock/unlock operations.

Why not do this per prep call submitted to the engine. It would be
simpler to just add lock and unlock to the start and end of transaction.

-- 
~Vinod

