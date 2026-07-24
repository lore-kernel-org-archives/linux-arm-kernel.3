Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F40C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtN44z1BuwvvFd9UHNBpsGREUSMEsEWybwxiKcauHzU=; b=WIVf+5yhuWzGVdmpRyiV1yim2H
	p1YmQdg7SNXXCFeAh3uDfu3rZSQlK0HUJhpCTxerCWSLOAC43toiR/0RBTASgeRpHCPLBHtIkNt0f
	2ylcPbImq/MLBRQ/1VjD+VogyCY5fOSxyBKlNIZAOj/XSBiHD+35TmXEDHnlu5HN8dPytntLtGXb5
	udKhwNtPGM2p8c0NkK0QBpeg94wxmY3UBykmfTDx+dmNbpMoHvrXdPW3QVh0AWZXg/RRHAZgL7Nnc
	oULk3WhWFxUFLpQ7FxoD7TGHO64Tnt/gPXwoKRCZ4E8amLvRo3LymG3gd3vY7EksKaIuEoL6BXffb
	M6MJjULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFOH-0000000GQZ6-0Eki;
	Fri, 24 Jul 2026 12:52:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFOE-0000000GQY2-2Cl2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:52:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso3134225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 05:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784897552; x=1785502352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtN44z1BuwvvFd9UHNBpsGREUSMEsEWybwxiKcauHzU=;
        b=XfWKL5L18nyByftIJle7woytOK8qkGjvBYAT9Xmgka+dX2S9BvLlcD/OftHRKTH9DK
         zxHcmUMgIF1zihwtf8b4iHVG72H6DbHMgD/87yZJkx6iHO/u/mrZDwSO+eIBBteLsQO4
         YpUNNQFTicQGA42PxhSlu+OGyUdDU6alFaxJAvk0R+zmt4WaCcE3FGDyavJDEggMUWX4
         qMyxpeoMG8vbIlx/FPg/S0ydewuvSF9iyR1tTxT3ChtJQyJh+UDjAvkU0M2SAsQlBt1F
         wqpcAI9ict06IVFp3FqyghJXzayGTt7/bkKu7B2CBH9lAvDImg7wvKxA/zOHn9bhCCWF
         qrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784897552; x=1785502352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtN44z1BuwvvFd9UHNBpsGREUSMEsEWybwxiKcauHzU=;
        b=UAqy9zyRSxnWTi9RMAMlXDAjqtO/M10F9ibP59rf+WvrySIqH8k8mGn7gzzEFVIHKd
         SfQeo1ynqOjlyzjQtdKY+bNPSU7UhddCGcMqWLNmo9MSf9ekgce8ihNhmZ2AncTaVblR
         LtXh5mPB0FiaE7vjjYgAEFznyY3Ve0ftqOgE13QesO7ps5FLSVK41y+BUaRxJKwT5vRm
         75Rn0Av6eXaKLfAYbFfin6xZSurGbmI+AuBIhES2AN6hUvU3JfwU31fads/8jQrhkIpi
         SLjHBARvzDV6aRGmP+Qw0e2uHUFQ5L4vriNI6v8wWUgpObeTf7I0MEbD2ox8tm166EkC
         2xPg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+7NiB+JMe/Y09Wg4Jl/OR55bO7lSzKd991GgqimRrpOiADTLqi8eIPYkEYd59RfCB0aTC8VbRcC1vR82kvt8S@lists.infradead.org
X-Gm-Message-State: AOJu0YzT//SN2AShDBlDir5g5lxAfKK1lb4Ffu1HLAE+Avne2306ZxHc
	MsLs+O4U4TSG6CvNl6U9gcddz0dad6DRaXDzSeXR96BrAYIqL5+ng2FhnCRaGTtZgFo=
X-Gm-Gg: AR+sD11uWD19+xfg1IQlgEBYpDpmHjQPtIJmpuDZGZmH0QmUXEYT/U8oF7Yuc4K3wM2
	wnWdke3yx0kYTmbjLnNmB2/pqwPJxbp4p6tSSLh6cBVQNyTBo/PuI3qQBheVM9XEjXP194hHdVu
	z4xrSc/Z9YY7Psihjl88O3mBcrCm8pgypeCEmbhedqhYOvo2MIlBMAuHUGTxRNpihl8kNKZ3m5J
	hwLRk3aVbJyaRlYLFSgTcca+FsCF0EG7fr/ApIJ4EOSduwOggp1pXZrmtc79Dv7w4BSQc4/q/I3
	fPogep2U7X+PgxO18ihkt/nYBjV2b7t/JOkk9knUyHnhuydFvl5ihplxEZjtxhijXC8846yoQOZ
	EQhnpRtK4bw8Hxi4ZA7VXz4l6Py3FShxBZUbAqMq4VuGnrK8qQ2Z/jb0HRizx4b+4tJZcQ9tHKM
	/6WtGWQdZIuc0dlA==
X-Received: by 2002:a05:600d:8444:10b0:495:5845:fb2 with SMTP id 5b1f17b1804b1-49573cfa980mr62663925e9.38.1784897552342;
        Fri, 24 Jul 2026 05:52:32 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:d8e1:da6c:62ef:6ff9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af78a02sm67574155e9.7.2026.07.24.05.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:52:31 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:52:27 +0200
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
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org
Subject: Re: [PATCH v24 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <amNf-bljjasmTKn_@linaro.org>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
 <20260723-qcom-qce-cmd-descr-v24-6-4f87bb4d9938@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-6-4f87bb4d9938@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_055234_630126_21B2C81E 
X-CRM114-Status: GOOD (  42.88  )
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

On Thu, Jul 23, 2026 at 07:09:12PM +0200, Bartosz Golaszewski wrote:
> Add support for BAM pipe locking. To that end: when starting DMA on a TX
> channel (DMA_MEM_TO_DEV) - prepend the existing queue of issued
> descriptors with an additional "dummy" command descriptor with the LOCK
> bit set. Once the transaction is done (no more issued descriptors),
> issue one more dummy descriptor with the UNLOCK bit.
> 
> We *must* wait until the transaction is signalled as done because we
> must not perform any writes into config registers while the engine is
> busy.
> 
> The dummy writes must be issued into a scratchpad register of the client
> so provide a mechanism to communicate the right address via slave
> config.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> [Stephan: came up with the solution to write lock/unlock descriptors
> directly into the FIFO]
> Co-developed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/dma/qcom/bam_dma.c       | 146 ++++++++++++++++++++++++++++++++++-----
>  include/linux/dma/qcom_bam_dma.h |  13 ++++
>  2 files changed, 142 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index f3e713a5259c2c7c24cfdcec094814eb1202971a..373569c36a94e149d54ef041974b11018e634669 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> [...]
> @@ -676,10 +697,51 @@ static void bam_free_chan(struct dma_chan *chan)
>  static int bam_slave_config(struct dma_chan *chan,
>  			    struct dma_slave_config *cfg)
>  {
> +	struct bam_config *peripheral_cfg = cfg->peripheral_config;
>  	struct bam_chan *bchan = to_bam_chan(chan);
> +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
> +
> +	if (peripheral_cfg && cfg->peripheral_size != sizeof(*peripheral_cfg))
> +		return -EINVAL;
>  
>  	guard(spinlock_irqsave)(&bchan->vc.lock);
>  
> +	/*
> +	 * This is required to setup the pipe locking and must be done even
> +	 * before the first call to bam_start_dma().
> +	 */
> +	if (bdata->pipe_lock_supported && peripheral_cfg) {
> +		if (cfg->direction != DMA_MEM_TO_DEV)
> +			return -EINVAL;
> +
> +		if (bchan->bam_locked)
> +			return -EBUSY;
> +
> +		if (!bchan->lock_ce) {
> +			bchan->lock_ce = kmalloc_obj(*bchan->lock_ce, GFP_ATOMIC);
> +			if (!bchan->lock_ce)
> +				return -ENOMEM;
> +
> +			bchan->lock_ce_phys = dma_map_single(bchan->bdev->dev, bchan->lock_ce,
> +							     sizeof(*bchan->lock_ce),
> +							     DMA_TO_DEVICE);
> +			if (dma_mapping_error(bchan->bdev->dev, bchan->lock_ce_phys)) {
> +				kfree(bchan->lock_ce);
> +				bchan->lock_ce = NULL;
> +				return -ENOMEM;
> +			}
> +		}
> +
> +		bam_prep_ce_le32(bchan->lock_ce, peripheral_cfg->lock_scratchpad_addr,
> +				 BAM_WRITE_COMMAND, 0);
> +		dma_sync_single_for_device(bchan->bdev->dev, bchan->lock_ce_phys,
> +					   sizeof(*bchan->lock_ce), DMA_TO_DEVICE);

Nitpick: The sync is redundant if you just called dma_map_single()
above. It doesn't hurt to sync again for the one-time setup though.

> +		bchan->locking_enabled = true;
> +	} else {
> +		/* Don't touch lock_ce here, it might still be used by issued descriptors */
> +		bchan->locking_enabled = false;
> +	}
> +
>  	memcpy(&bchan->slave, cfg, sizeof(*cfg));
>  	bchan->reconfigure = 1;
>  
> @@ -802,6 +864,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
>  		}
>  
>  		vchan_get_all_descriptors(&bchan->vc, &head);
> +		bchan->bam_locked = false;
>  	}

I think this needs some more thought. I put this assignment into
bam_reset_channel(), because presumably that's the only operation that
would really reset the lock status without processing an unlock
descriptor.

bam_dma_terminate_all() does not always reset the BAM channel. It does
that only if (!list_empty(&bchan->desc_list)) {
	bam_chan_init_hw(bchan, async_desc->dir);
}

I _think_ it is possible that we have no in-flight descriptors
(bchan->desc_list), but the unlock is still pending (or not even written
to the FIFO yet). In that case, bchan->bam_locked should not be reset
here.

I would put the bchan->bam_locked = false; into bam_reset_channel() like
in my diff.

Then, you could either leave this as-is (and assume the unlock
descriptor will still be finished/written even after cancelling the
descriptors).

Or, you add some more checks to this if statement to reset the BAM. This
could work I think:

	if (!list_empty(&bchan->desc_list)) {
		async_desc = list_first_entry(&bchan->desc_list,
					      struct bam_async_desc, desc_node);
		bam_chan_init_hw(bchan, async_desc->dir);
	} else if (bchan->bam_locked || bchan->head != bchan->tail) {
		/* BAM still locked or unlock still pending */
		bam_chan_init_hw(bchan, DMA_MEM_TO_DEV);
	}

Unfortunately, bchan->bam_locked alone doesn't tell us if the BAM is
locked, only if we haven't written the UNLOCK descriptor yet. It may be
pending in the FIFO. head != tail should tell us that the FIFO is not
empty (which should be the UNLOCK descriptor if desc_list is empty)...

>  
>  	vchan_dma_desc_free_list(&bchan->vc, &head);
> @@ -869,7 +932,7 @@ static int bam_resume(struct dma_chan *chan)
>  static u32 process_channel_irqs(struct bam_device *bdev)
>  {
>  	u32 i, srcs, pipe_stts, offset, avail;
> -	struct bam_async_desc *async_desc, *tmp;
> +	struct bam_async_desc *async_desc;
>  
>  	srcs = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_EE));
>  
> [...]
> @@ -919,13 +991,12 @@ static u32 process_channel_irqs(struct bam_device *bdev)
>  			 * push back to front of desc_issued so that
>  			 * it gets restarted by the work queue.
>  			 */
> -			if (!async_desc->num_desc) {
> +			list_del(&async_desc->desc_node);
> +			if (!async_desc->num_desc)
>  				vchan_cookie_complete(&async_desc->vd);
> -			} else {
> +			else
>  				list_add(&async_desc->vd.node,
>  					 &bchan->vc.desc_issued);
> -			}
> -			list_del(&async_desc->desc_node);
>  		}

I think this is an unneeded/unrelated formatting change now. Drop?

>  	}
>  
> [...]
>  /**
>   * bam_start_dma - start next transaction
>   * @bchan: bam dma channel
>   */
>  static void bam_start_dma(struct bam_chan *bchan)
>  {
> -	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
> +	struct virt_dma_desc *vd;
>  	struct bam_device *bdev = bchan->bdev;
>  	struct bam_async_desc *async_desc = NULL;
>  	struct bam_desc_hw *desc;
> @@ -1064,22 +1145,34 @@ static void bam_start_dma(struct bam_chan *bchan)
>  
>  	lockdep_assert_held(&bchan->vc.lock);
>  
> -	if (!vd)
> +	vd = vchan_next_desc(&bchan->vc);
> +	if (IS_BUSY(bchan) || (!vd && !bchan->bam_locked))
>  		return;
>  
>  	ret = pm_runtime_get_sync(bdev->dev);
>  	if (ret < 0)
>  		return;
>  
> +	if (!bchan->initialized)
> +		bam_chan_init_hw(bchan, container_of(vd, struct bam_async_desc, vd)->dir);

Okay yeah, that was my bug. Thanks for moving it :-)

> +
> +	if (bchan->locking_enabled && !bchan->bam_locked) {
> +		/* Defer locking until we also have space for a data descriptor */
> +		avail = CIRC_SPACE(bchan->tail, bchan->head, MAX_DESCRIPTORS + 1);
> +		if (avail < 2) {
> +			queue_work(system_bh_highpri_wq, &bdev->work);
> +			goto out;
> +		}
> +
> +		bam_fifo_write_lock(bchan, DESC_FLAG_LOCK);
> +		bchan->bam_locked = true;
> +	}
> +
>  	while (vd && !IS_BUSY(bchan)) {
>  		list_del(&vd->node);
>  
>  		async_desc = container_of(vd, struct bam_async_desc, vd);
>  
> -		/* on first use, initialize the channel hardware */
> -		if (!bchan->initialized)
> -			bam_chan_init_hw(bchan, async_desc->dir);
> -
>  		/* apply new slave config changes, if necessary */
>  		if (bchan->reconfigure)
>  			bam_apply_new_config(bchan, async_desc->dir);
> @@ -1135,11 +1228,24 @@ static void bam_start_dma(struct bam_chan *bchan)
>  		list_add_tail(&async_desc->desc_node, &bchan->desc_list);
>  	}
>  
> +	/*
> +	 * Close the bracket once there is no more client work queued. The
> +	 * UNLOCK is flagged for an interrupt so process_channel_irqs() is
> +	 * guaranteed to observe its completion and retire it from the FIFO
> +	 * promptly, instead of leaving bchan->head to lag until a later
> +	 * bracket's skip-loop catches up with it.
> +	 */

Fair enough, I was a bit lazy here and omitted the DESC_FLAG_INT. It
should help with the head!=tail check I mentioned for
bam_dma_terminate_all() though.

> +	if (bchan->bam_locked && !vd && !IS_BUSY(bchan)) {
> +		bam_fifo_write_lock(bchan, DESC_FLAG_UNLOCK | DESC_FLAG_INT);
> +		bchan->bam_locked = false;
> +	}
> +
>  	/* ensure descriptor writes and dma start not reordered */
>  	wmb();
>  	writel_relaxed(bchan->tail * sizeof(struct bam_desc_hw),
>  			bam_addr(bdev, bchan->id, BAM_P_EVNT_REG));
>  
> +out:
>  	pm_runtime_mark_last_busy(bdev->dev);
>  	pm_runtime_put_autosuspend(bdev->dev);
>  }
> @@ -1162,7 +1268,13 @@ static void bam_dma_work(struct work_struct *work)
>  
>  		guard(spinlock_irqsave)(&bchan->vc.lock);
>  
> -		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
> +		/*
> +		 * A channel also needs kicking if a bracket is still open
> +		 * (bam_locked) with no further client work queued: closing
> +		 * the UNLOCK requires a fresh call into bam_start_dma().
> +		 */
> +		if ((!list_empty(&bchan->vc.desc_issued) || bchan->bam_locked) &&
> +		    !IS_BUSY(bchan))
>  			bam_start_dma(bchan);

The if statement is redundant, bam_start_dma() now checks all of that
internally. 

	if (IS_BUSY(bchan) || (!vd && !bchan->bam_locked))
		return;

list_empty(desc_issed) == !vd

Same for !IS_BUSY() in bam_issue_pending().

Thanks,
Stephan

