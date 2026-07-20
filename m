Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251CDC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dlR1VSEOP+P+zQGfaFMhFwH/x1vDY3bfx6C3cbYWvs=; b=ILq7RoZJb9vyNCbGS0CSU9V/Ku
	X+i0nXPFQ2m2yVQ5/oHj5DCus1A5pIfcx4HK3SgjC9kI9TYr0wxvMk+pc5JZDIeax63bhZJ4qSS4D
	XYsWEfLUp24h9Q8zAFeUfZcywAKnwCHMeatSBwFWZijy/FYgemqe930AcESmQKNpOTvxd80i6IWba
	KLfs/CXTNtAZl4tvHa8A1v4uqfaRBcg3k76Av2YOn7SBThZ1Ul2Yrjd5Wo5bL4LW9ibmDoaczwsd4
	X+vdD8aS13fcDKoFmZMmS0Ht5TUi3r+KxZZkj7sbHHtbpmIlB4ENCkppr83ZpQrbM8bT02OPrRhXy
	2rKBeSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliVH-000000066IN-1BW5;
	Mon, 20 Jul 2026 07:33:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliVD-000000066GX-42FD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:33:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso5335857f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784532805; x=1785137605; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9dlR1VSEOP+P+zQGfaFMhFwH/x1vDY3bfx6C3cbYWvs=;
        b=wQoWCQ5yLvr8lklSd6KQsy1Mkl07wZQ+6+iH0oH9gQAiozLGQmzUPRP7T19vNphVZs
         9JYLJcAZmnSAWK4JWyN8QIUxzU5DQjAB74nbiCAMRQyY8QKl0IGRnHd4GGouRVc0MOcj
         GUjqGUBTvwr6nYDgP8840ulp4sc/Y+Umle9ws5dbHReY/Oopn3IvJgCrsF0NT1lEXmBc
         SJScVUy9EQyUWcIQSnFAOCFI4u+dAdZAL/WQMqO5Ndpv8kXuP5yuKjmtBnH5TfEq/M40
         nKeh0duhl2ugLfXNeq+gp8R9ke5q6lYE/BdPfcDprWxEreD2MOrOeQZqqgiDkT7ndvvf
         2QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532805; x=1785137605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dlR1VSEOP+P+zQGfaFMhFwH/x1vDY3bfx6C3cbYWvs=;
        b=EmmtZ5w4BxMt/KtY5jaNBlwZSyyq9ksYsEr4doeZj1/SK596ykiSsLifWZOa3DrlvH
         bGFEDe9lOTpIi/PumYVrEa9XqWbPKMU0/yWS0St6evs7Ykj6TxTZznwKP0XHqAoQHWCM
         YXBdTz/+YDMXoFWhRPdgutpiB8ec4DQTHKeDQZVIlRoXX+BlFVPof46b2dgfJRknXizj
         UZCuC6hnU8xGHXR9jut6VvzW19vg6obJT2WjHLYP9mqZkvpdq0IFCYEOxRgwlFTbMmne
         abzK+JtDvlZU9mNF3i3dx4SxV73h81cZJfmEzxy1toiqDXZKhi/efv7c6q+ttO0G+Roi
         dm4A==
X-Forwarded-Encrypted: i=1; AHgh+RqtBa7ZZfPhvXC/qVe/SKk+su99xnzAlnHjyoMCR9uVz7h6b1x+ANq6w2H2fIF2DmWG/LER9HG4bbEI48up13II@lists.infradead.org
X-Gm-Message-State: AOJu0YzBaksM40v87OH6d40K4LEtAdKVRFOlfqEbgX3MT+eJQDm/8EQV
	Zy6mKLBCwlMhkBBIGUBrMaMtZO4DgE+yVZBAUOvQS1YUoN0mWLsidsqBi+pTbdu7IK4=
X-Gm-Gg: AfdE7cm7VTg6SGGwyqi1vr+oAQ++WxXX75Yrqkd8e5h1Nv5peQ1EreX6PAcIRZ+pgqM
	3CQp1gtu0LscDiBrD4AAbHqN46kdzd4fxnpflT9EdSnHxboYPLt7Ry/iizNSfvrF7cW5s3AIvIP
	uRsntOh4mRDojHdSNIXyrp+nd1a454DyANK4WnRKJPTb2HReLKy+OA2VSLe787Cxjs7ydraSthA
	zsYPSbfIKuGvHgCMYIOiS6B6RGT1raZxLOm4PKEaQ9wzLdGqDsoTX50sKYg6SEUjAcg7IvC+CPm
	z4biWS+pAINQuwzyOCNe8MLuBaC9vRRrS9QkBzc1V/ERJk7FCOJYlTa07lapC+Nl31+Br7P7QMK
	GRevMIhe+rOOPQTI2xS/acVNaupvWE3SNVMiFMklMDgGd/5ZjjaMknn99X/VWN/MGhXtqSyoKUZ
	87XjB8b8IzGbC4zA==
X-Received: by 2002:a05:6000:491c:b0:47f:73d3:bfc3 with SMTP id ffacd0b85a97d-47f73d3c0fcmr5580169f8f.61.1784532805224;
        Mon, 20 Jul 2026 00:33:25 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:b6d9:bb37:a20c:1c55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm26586179f8f.25.2026.07.20.00.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:33:24 -0700 (PDT)
Date: Mon, 20 Jul 2026 09:33:13 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v22 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <al3POSAJKHkLYVgW@linaro.org>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
 <20260717-qcom-qce-cmd-descr-v22-6-ff0d18b27246@oss.qualcomm.com>
 <20260717085136.E0FBC1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717085136.E0FBC1F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_003328_130656_F65FC7E9 
X-CRM114-Status: GOOD (  53.29  )
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

On Fri, Jul 17, 2026 at 08:51:36AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] DMA API violation due to mismatched device pointers in dma_map_sg and dma_unmap_sg.
> - [High] The client-provided physical address for the lock scratchpad is silently truncated to 24 bits.
> - [Medium] Transient allocation failure for lock descriptors causes a permanent channel stall.
> - [Medium] Pipe locking is restricted to TX channels instead of RX channels, contradicting intended design.
> - [Medium] The dummy lock descriptor clears the `reconfigure` flag using a hardcoded TX direction, potentially misconfiguring the channel.
> - [Low] Missing integer argument for `%d` in `dev_err_ratelimited` call.
> --
> 
> --- Patch [6]: [PATCH v22 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> commit c786d3c51276cef4b55a461357b399c32982316b
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Subject: dmaengine: qcom: bam_dma: add support for BAM locking
> 
> This commit adds support for BAM pipe locking by prepending and appending
> dummy command descriptors with LOCK and UNLOCK bits set. It aims to prevent
> writes into config registers while the engine is busy.
> 

Thanks for all the changes! It looks good to me for the most part, so
I'll just comment on the remaining Sashiko comments below.

> > Add support for BAM pipe locking. To that end: when starting DMA on an RX
> > channel - prepend the existing queue of issued descriptors with an
> 
> [Severity: Medium]
> Is this intended to be restricted to TX channels? The commit message mentions
> starting DMA on an RX channel, but the implementation in bam_setup_pipe_lock()
> aborts the lock setup if the direction is not DMA_MEM_TO_DEV.
> 

Is this a typo in your commit message? I guess RX vs TX depends on the
perspective (kernel or peripheral), but I think "TX channel" would be
clearer here (or even just put DMA_MEM_TO_DEV).

> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > index f3e713a5259c2..edaa694eb9df0 100644
> > --- a/drivers/dma/qcom/bam_dma.c
> > +++ b/drivers/dma/qcom/bam_dma.c
> 
> [ ... ]
> 
> > @@ -859,6 +887,15 @@ static int bam_resume(struct dma_chan *chan)
> >  	return 0;
> >  }
> >  
> > +static void bam_dma_free_lock_desc(struct virt_dma_desc *vd)
> > +{
> > +	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
> > +	struct dma_chan *chan = vd->tx.chan;
> > +
> > +	dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
> 
> [Severity: High]
> Will this cause a DMA API violation? 
> 
> The scatterlist is unmapped here using the client device (chan->slave), but it
> is mapped in bam_make_lock_desc() using the DMA controller device 
> (bchan->bdev->dev).
> 

Yep, we need to change all those DMA calls to bchan->bdev->dev.

> > +	kfree(async_desc);
> > +}
> 
> [ ... ]
> 
> > @@ -1046,13 +1090,101 @@ static void bam_apply_new_config(struct bam_chan *bchan,
> >  	bchan->reconfigure = 0;
> >  }
> >  
> > +static struct bam_async_desc *
> > +bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
> > +{
> > +	struct bam_async_desc *async_desc;
> 
> [ ... ]
> 
> > +	bam_prep_ce_le32(&async_desc->lock_ce, bchan->lock_scratchpad_addr, BAM_WRITE_COMMAND, 0);
> 
> [Severity: High]
> Can this truncate the physical address and cause memory corruption?
> 
> The client-provided lock_scratchpad_addr is a 64-bit phys_addr_t, but
> bam_prep_ce_le32() masks the address to 24 bits:
> 
> bam_ce->cmd_and_addr = cpu_to_le32((addr & 0xffffff) | ((cmd & 0xff) << 24));
> 
> If the physical address is above 16MB, the BAM engine will perform its dummy
> write to an arbitrary truncated address.
> 

This looks correct as well. It seems the address in a BAM command
descriptor is more like a "address within the peripheral" than an actual
physical address, so the same applies to the lock_scratchpad_addr. Can
you clarify this inside the struct bam_config documentation comment?

This also means there is no point to accept a phys_addr_t in
lock_scratchpad_addr, u32 is sufficient.

> > +	sg_set_buf(&async_desc->lock_sg, &async_desc->lock_ce, sizeof(async_desc->lock_ce));
> > +
> > +	mapped = dma_map_sg(bchan->bdev->dev, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
> 
> [ ... ]
> 
> > +static int bam_setup_pipe_lock(struct bam_chan *bchan)
> > +{
> > +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
> > +	struct bam_async_desc *lock_desc, *unlock_desc;
> > +
> > +	lockdep_assert_held(&bchan->vc.lock);
> > +
> > +	if (!bdata->pipe_lock_supported || !bchan->lock_scratchpad_addr ||
> > +	    bchan->direction != DMA_MEM_TO_DEV)
> > +		return 0;
> 
> [Severity: Medium]
> Does this restriction conflict with the commit message? 
> 
> The condition limits pipe locking to DMA_MEM_TO_DEV (TX), making this feature
> dead code for RX channels (DMA_DEV_TO_MEM).
> 

Clarifying the commit message should fix this comment as well.

> > +
> > +	/*
> 
> [ ... ]
> 
> > @@ -1072,6 +1205,22 @@ static void bam_start_dma(struct bam_chan *bchan)
> >  		return;
> >  
> >  	while (vd && !IS_BUSY(bchan)) {
> > +		/*
> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> > +		 * already have bam_locked set and must not trigger a second pair.
> > +		 */
> > +		if (!bchan->bam_locked) {
> > +			ret = bam_setup_pipe_lock(bchan);
> > +			if (ret) {
> > +				dev_err_ratelimited(bdev->dev,
> > +					"failed to setup the pipe lock, deferring transfer: %d\n");
> 
> [Severity: Low]
> Is this missing the integer argument for the %d format specifier?
> 

Yep.

> [Severity: Medium]
> Will this cause a permanent channel stall on memory pressure? 
> 
> If bam_setup_pipe_lock() fails due to a GFP_NOWAIT allocation failure, the
> loop breaks and leaves the descriptors on the desc_issued list, but no
> mechanism appears to schedule a retry.
> 
> > +				break;

Could be true, if we break out of the loop here, where will this
deferral happen? Will anything call bam_start_dma() again?

Perhaps we should have queue_work() here?

> > +			}
> > +			if (bchan->bam_locked)
> > +				vd = vchan_next_desc(&bchan->vc);
> > +		}
> > +
> >  		list_del(&vd->node);
> >  
> >  		async_desc = container_of(vd, struct bam_async_desc, vd);
> 
> [ ... ]
> 
> >  		/* on first use, initialize the channel hardware */
> >  		if (!bchan->initialized)
> >  			bam_chan_init_hw(bchan, async_desc->dir);
> >  
> >  		/* apply new slave config changes, if necessary */
> >  		if (bchan->reconfigure)
> >  			bam_apply_new_config(bchan, async_desc->dir);
> 
> [Severity: Medium]
> Could the dummy lock descriptor clear the reconfigure flag with the wrong
> direction?
> 
> The lock descriptor is created with async_desc->dir hardcoded to
> DMA_MEM_TO_DEV. If pipeline locking is ever enabled for RX channels,
> bam_apply_new_config() will configure the BAM engine using dst_maxburst
> instead of src_maxburst, and clear the bchan->reconfigure flag before the
> real data descriptor is processed.
> 

Err, what? I think we can ignore this one, since I don't think there is
a use case for locking on the RX channel.

Although, looking a bit more at your changes, I think you should make
sure the direction is correct already in bam_slave_config():

+	/*
+	 * This is required to setup the pipe locking and must be done even
+	 * before the first call to bam_start_dma().
+	 */
+	if (bdata->pipe_lock_supported && peripheral_cfg) {
+		bchan->lock_scratchpad_addr = peripheral_cfg->lock_scratchpad_addr;
+		bchan->direction = cfg->direction;
+	}
+

I don't think there is much point to store the direction at all if we
just support DMA_MEM_TO_DEV in bam_setup_pipe_lock(). I would just check
the direction inside this if statement and return -EINVAL if some user
tries to setup pipe locking on a TX channel. Then you don't need to
store bchan->direction at all.

> >  
> 
> [ ... ]
> 
> > @@ -1191,8 +1344,11 @@ static void bam_issue_pending(struct dma_chan *chan)
> >   */
> >  static void bam_dma_free_desc(struct virt_dma_desc *vd)
> >  {
> > -	struct bam_async_desc *async_desc = container_of(vd,
> > -			struct bam_async_desc, vd);
> > +	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
> > +	struct dma_chan *chan = vd->tx.chan;
> > +
> > +	if (async_desc->is_lock_desc)
> > +		dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
> 
> [Severity: High]
> Does this share the same DMA API violation mentioned earlier? 
> 
> The abort/cleanup path also unmaps using the client device instead of the
> DMA controller device.
> 

Same thing here as above, yeah. Should be bchan->bdev->dev.

Thanks,
Stephan

