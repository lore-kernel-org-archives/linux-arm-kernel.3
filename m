Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D07C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVkzG+wHl7b0hFwJEBuSwYI7fFrwiKABhZ91z4775sk=; b=LWhSMi63cfi50IntyYBI44Nr61
	iK9r/aV4ehTluNQapocJlwfPJSQu/rdXWkGVqyDsnD7iIkOT6OQQhp1py8BzjJha70Omxt7cijN9q
	4lDWrBVAOvDCUvXPmP7rYxng5/xvqm/XJGN659mx/mY/b1M8lMB0KJ4nfgE9zGd8Oqr43cg6ADmXS
	zn0I3C3Q82LebABk9ANkbCtVM60KsFGGpGnOIwTk5Awpus+9oEozZSVutbFNtO47T3+0F4KUMGr8B
	aUzA8iR3udGPAfMnQxcELIXbIDGNRW3f2C96faZZXjuG6KwvqXrDEewL/VzlmK+JL+v8GvNoqSI8Z
	MWThvS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSnP-0000000BJd0-2pHW;
	Wed, 22 Jul 2026 08:59:19 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSnM-0000000BJcN-3WVF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:59:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f878135e0so188342f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784710754; x=1785315554; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wVkzG+wHl7b0hFwJEBuSwYI7fFrwiKABhZ91z4775sk=;
        b=or7xzEVxMg8k86Hk2WnsEIX0VleA26THG8l67vAIw+dmqHLgS8IT4wazfxq9M3z7aH
         YA6HvokQo/HDs+wvcAGbI9K4wq0DLX/6U1gURBAGCdheF6MEQG9FxIQkZDmZ8HuLocSY
         HH+rw+5+c8ullCEeCvSAMhzO7zrkSeKHXr/cIRGXfxJ9PMBOrUqdWwKp5uYX5Mgpii1c
         EvC7UO3XVvus9SrwM05f4UC2TEnhLwHTDlh9B5vfeGDjK3wtLGDCKdqJ5xoYzb9rhIdy
         0y4RMumf1/rdUohSIAZQx5UvHWIdaPpqKKQfIixlut0Zf7CE7qWxA9SPpi78YV90ZozR
         KMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710754; x=1785315554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVkzG+wHl7b0hFwJEBuSwYI7fFrwiKABhZ91z4775sk=;
        b=W48ajC/EvlhqewkTi/XIAbmfTG9PNm7r92CZYmKXJAsrvw2XxT/YaoYOfYjSXigesn
         ceNOShdJA3zLOTJ+eSeA5iW03FjmcSj7jkLDj55lcCltVBQFRCS6eZUiS6VzIdJocsDI
         iQeYKdHbIcsxPwh6mtkcOokJo/Hkq9erf8rEzikNm5W7UysHEX77rLuxotdUf0OcNTkP
         yRreH5517nrYUojdrQDHMEy+42+FFZ9Ltdt3E/ffc7OPpBQFRa9obVj5y58emrFliBtH
         tyE+++DPLPJB2ggAdisuacMIH5LyKNyv0k4GndlNwJKY2pT2SIl9KxWsfDL3fyitsXru
         Kv7w==
X-Forwarded-Encrypted: i=1; AHgh+Rq+BhPXsrcZRkw4xfPfM5lo15HqVU+cSUQQR5EHCJ2UnOrD1ZqPDk9iQ4vnNlvfmjNlz6b90FPf0rdPHhPb6CFE@lists.infradead.org
X-Gm-Message-State: AOJu0YzQxp8fhwQCCuSZxMUS5savAyuXahWladwH9hY8nUUPnxdCxr2r
	BmspDtGVRgecfDJae6/lHWegmN/PdlqiJ4ewEmyT0teI4QpwBKqGoGu7DHYuuSDWPUk=
X-Gm-Gg: AR+sD13+dMIp+z6WtiAoqy55u0ncM7LH67P9z92WthOO+Pl+iWoRY4PwASPKHInMg66
	TKek3qbXJdnHeHXlIC0Zb4lon742jYnN2qKLlfYiZWzepDIIRv4H12zqEBkJ7WxPG69y9TmrEBg
	8ydglvLLQO+3dWABBK/iSYj9UoIhCNudMN8LqPxlZgjSn1QRaZQyQ0XaaKDs4h/3pJzr4GHaIFy
	x/Qul9xeOdbIJ08lqgyCpm30LvhK4DdnMqsW+jYd+XSkUtqbaBIs7YG/L98pgs46onfOSt7ijTC
	5wchS7tSzUBB2hoZlIuy29+RjGfpo0rEmgF7V4GUL8AXabhnPWHMxckWU/mgMRXz2ZopAlWMKcS
	s/MsG/HWtgJjf6gq4cYp+XHLLhDanGOCnflDDLUx0sLiU9ScvXj39rMXGoSQpgftxjhqyuTVb5A
	40cFFm7OuRXiHl
X-Received: by 2002:a05:6000:310f:b0:47f:83f8:a956 with SMTP id ffacd0b85a97d-47f83f8ac9cmr3886714f8f.37.1784710754365;
        Wed, 22 Jul 2026 01:59:14 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:7ae3:a857:e482:495])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm4587664f8f.10.2026.07.22.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:59:13 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:59:09 +0200
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
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <amCGXUUd4VmuQRGD@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721134853.2B2401F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_015916_923270_E714754E 
X-CRM114-Status: GOOD (  41.16  )
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

On Tue, Jul 21, 2026 at 01:48:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] State leak causing hardware misconfiguration on channel reuse due to uncleared `lock_scratchpad_addr` and hardcoded direction.
> - [High] Channel state corruption when `bam_slave_config` fails validation.
> - [High] Infinite BH workqueue loop and unratelimited log flood on memory allocation failure.
> - [High] DMA API violation: `lock_ce` buffer shares a cacheline with frequently CPU-modified struct members.
> - [Low] Unused assignment of `hdesc` in IRQ handler.
> --
> 
> --- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> commit 8b44c5e4935cbb61832adb3262df00b3b606a283
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> dmaengine: qcom: bam_dma: add support for BAM locking
> 
> This commit adds support for BAM pipe locking by prepending and appending
> dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
> channel. It uses a peripheral-local scratchpad address communicated via slave
> config for the dummy writes.
> 
> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > index f3e713a5259c2..411c60c4433e2 100644
> > --- a/drivers/dma/qcom/bam_dma.c
> > +++ b/drivers/dma/qcom/bam_dma.c
> [ ... ]
> > @@ -72,6 +76,11 @@ struct bam_async_desc {
> >  
> >  	struct bam_desc_hw *curr_desc;
> >  
> > +	/* BAM locking infrastructure */
> > +	bool is_lock_desc;
> > +	struct scatterlist lock_sg;
> > +	struct bam_cmd_element lock_ce;
> > +
> >  	/* list node for the desc in the bam_chan list of descriptors */
> >  	struct list_head desc_node;
> 
> [Severity: High]
> Does placing lock_ce immediately adjacent to desc_node risk a DMA API
> violation? lock_ce is mapped for DMA via dma_map_sg(), but desc_node is
> actively modified by the CPU via list_add_tail() during bam_start_dma()
> while the mapping is active. On non-coherent architectures, could this
> cause cacheline tearing or stale data writebacks if they share the same
> cacheline?
> 

I think this complaint was there in some revisions before. Could be
mostly a false positive given that the lock_ce is just DMA_MEM_TO_DEV
(i.e. read-only for the BAM)...

> [ ... ]
> > @@ -676,13 +691,26 @@ static void bam_free_chan(struct dma_chan *chan)
> >  static int bam_slave_config(struct dma_chan *chan,
> >  			    struct dma_slave_config *cfg)
> >  {
> > +	struct bam_config *peripheral_cfg = cfg->peripheral_config;
> >  	struct bam_chan *bchan = to_bam_chan(chan);
> > +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
> >  
> >  	guard(spinlock_irqsave)(&bchan->vc.lock);
> >  
> >  	memcpy(&bchan->slave, cfg, sizeof(*cfg));
> >  	bchan->reconfigure = 1;
> >  
> 
> [Severity: High]
> Is it safe to overwrite bchan->slave and set bchan->reconfigure = 1 before
> validating the configuration direction below? If cfg->direction !=
> DMA_MEM_TO_DEV, this returns -EINVAL to the caller, but the channel
> retains the rejected parameters and will apply them on the next transfer
> because bchan->reconfigure remains set.
> 

Yeah, better to swap the order.

> > +	/*
> > +	 * This is required to setup the pipe locking and must be done even
> > +	 * before the first call to bam_start_dma().
> > +	 */
> > +	if (bdata->pipe_lock_supported && peripheral_cfg) {
> > +		if (cfg->direction != DMA_MEM_TO_DEV)
> > +			return -EINVAL;
> > +
> > +		bchan->lock_scratchpad_addr = peripheral_cfg->lock_scratchpad_addr;
> > +	}
> 
> [Severity: High]
> If bam_slave_config() is called without peripheral_cfg, should
> bchan->lock_scratchpad_addr be reset to 0 to avoid leaking state from a
> prior configuration? If the previous lock_scratchpad_addr is retained,
> bam_start_dma() might erroneously inject dummy lock descriptors on new
> transfers.
> 

Probably unlikely to happen, but yeah.

I would also check if (cfg->peripheral_size == sizeof(peripheral_cfg)),
just to be safe.

> [ ... ]
> > @@ -919,13 +959,19 @@ static u32 process_channel_irqs(struct bam_device *bdev)
> >  			 * push back to front of desc_issued so that
> >  			 * it gets restarted by the work queue.
> >  			 */
> > +
> > +			list_del(&async_desc->desc_node);
> >  			if (!async_desc->num_desc) {
> > -				vchan_cookie_complete(&async_desc->vd);
> > +				hdesc = async_desc->desc;
> > +
> 
> [Severity: Low]
> Is the assignment to hdesc used anywhere? It appears to be assigned here but
> is never read.
> 

Yeah, I think I pointed this out before.

> [ ... ]
> > @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
> >  
> >  	lockdep_assert_held(&bchan->vc.lock);
> >  
> > +	vd = vchan_next_desc(&bchan->vc);
> >  	if (!vd)
> >  		return;
> >  
> > @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
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
> > +					"failed to setup the pipe lock, deferring transfer: %d\n",
> > +					ret);
> > +				queue_work(system_bh_highpri_wq, &bdev->work);
> > +				break;
> > +			}
> 
> [Severity: High]
> Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
> starvation? Because system_bh_highpri_wq executes in softirq context,
> requeuing immediately without sleeping prevents the memory reclaim needed
> to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.
> 

It looks like my suggestion to queue_work() again in the error path of
bam_start_dma() wasn't great if we end up causing an infinite spin loop.
We do need to retry somehow or report an error though, I don't think
aborting and leaving the desccriptors completely unhandled is an option
either... :(

One option would be to try to avoid the allocation and write the lock
descriptors directly into the FIFO, but this will probably get really
messy as well, since you would need to carefully modify the FIFO
management in several functions ...

I don't have a good spontaenous idea how to solve this right now. :/

Thanks,
Stephan

