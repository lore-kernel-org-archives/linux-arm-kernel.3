Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69970C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qGNYqgu45iCzPUDN1sRc/iOGDzLiyCE7X0FhGMvUzY=; b=lnecPdMlU4+WZHyWO/+7btkwzX
	6xVJMwH+xjrnKgS91q+lVTgptG8hsdzWrVAFYqdnrGIJThLNw/t1zUmmO7D/IwyLevOdQvhl2Dtd8
	16d2fxwDuOG8l40Q8a59mw2voCg57q8Iiswsuff+J0xEeGJk2sUe+nr3TPIIt5yveZ2U8JO/bXU1u
	5QPpWUOeYLGtX0mPySbcG+y18IJcKZ0vehV3JfCCXiMbMXPXH/LDpfrakNrFajbQagvNwMfwl4ZWG
	BBKxABg/t6+F7yVL5gc3t1TB4vkWH87RuNlKiynJHngsyuojZEyOhfASgWDpFvzReByHJ4pKiePW1
	K4jaGldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDXM-0000000GB07-3pEE;
	Fri, 24 Jul 2026 10:53:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDXK-0000000GAxX-0Q0d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:53:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-472326ca506so257157f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 03:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784890428; x=1785495228; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9qGNYqgu45iCzPUDN1sRc/iOGDzLiyCE7X0FhGMvUzY=;
        b=B7Wh0JvmHrB02Lbi3XTsfZ1RCICJTV9PRzSRZ9/yWG29VocaC9MwiXWl5gPRtSIVZC
         ujUbGLFft5Ec5P4h+CQvGeJ/wjq2MZYaH/rqChhDr9nX6hz/C7IJmYl7q+IN3G94oOhb
         SHueL0CTubAD0FGDTqrnK9IXbZoThii/O5G2iJG97K8fM32yU+GpvOTd/OM+65g2tD7q
         vR/w5U1D/i+hMSlLMcSHpykaOArYCqlu0j83AXVSrihIl/aoazCzg6a7HlAoEl7/fz9k
         CTH3vsMbcy1WSB+ZmBkBPuu1An4gKvGPaU8wv9IFwmmHfI899dkzKBCYA6vQJ/0JTwSv
         m8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890428; x=1785495228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qGNYqgu45iCzPUDN1sRc/iOGDzLiyCE7X0FhGMvUzY=;
        b=VtOA8wrWZjqPC2c1ar1PcNVRNQt8BTDHaRm0gVnhhlFcU2siujLNNHWGEX20XVQb9Q
         kdycDOfim4goj/xlc7gCCvh155C8kHvEiQu53h/tv92yMLa8Jq9m2VOVI/LLvuo2OP5w
         4EP834PP+VZdjJkp2fV3KyAHEDQy1Bn+GHvbxxZXebqJxnQtBPvB1IYr2oZ3T4vFUskK
         eq7U4wfGsOOMg3cu7+3vm4b8IgGW0DheLYFjyqncbYUM8GV1lv37dV1esy1S9UZjMAG8
         Yra9kgUq0c8Utuk96maWDl6tmlTd+d3Ho3feDoivKPnf9LTufa5dwtlEvGSJGO3uqZWO
         7EAg==
X-Forwarded-Encrypted: i=1; AHgh+RquoXEOABUb0/tpmt4kBwkRjPm1mlQYn0aopthDKFhXZjoAUEMltUqZsDZlpqbPj2YJSVLEmOi/ILy53KOI+ZHn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6UklnR5ATOWeQdLm2k52+T4UrCihKaKBy7l4G5GC2lbnfxBoM
	rluVNjzYDrQGzCVhsQmjC8UysJ4J6VJV2Y8mMTbj7ktqXGlrv33u5xBAFB16rjorLl4=
X-Gm-Gg: AR+sD12Jb3OuPqhgiJQndXqyrci93FaM95uBd5/ZYEkxV2Qd7RC0di7JJ+RXGIoegNB
	jEWcMoMCSuhd98tI8srfQqa6p2027XFNnAgvBl114WeQ16Q9NF5rpm27+WX43zYvQcKbAS1epxN
	EeLq2j9XHYlzASuFJdj/buodCxa5C+PxRdBFRjodNz5lZamGD3r1U6Wqe//6mrIER9nFCzrRm5A
	P5MSLAuyGQiiAYkEaP2cjuuY8Mx3mh2HGlJgXOZX0w/fmyg441iEUlOHW9OjgaYRw74RcnCxrQL
	oQTNdXDPrqhFjikKUwYofwtE9wn1aNYH1KSniusrZj8lrny8fJ38P/5E16j2xW/Uas9Sdu89EJ5
	iGj4ckHYfb0x/ZYHqaU6EhPiOUU2x2/k4FSeDEpTB8eTh1Gw/zjEalGAt+HVe5mKWEFHAHyIq5W
	WR11fedrO2CTCQug==
X-Received: by 2002:a05:6000:2489:b0:460:3233:beed with SMTP id ffacd0b85a97d-47f8d75ec77mr9286973f8f.41.1784890427609;
        Fri, 24 Jul 2026 03:53:47 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:d8e1:da6c:62ef:6ff9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm22309568f8f.10.2026.07.24.03.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:53:47 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:53:36 +0200
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
Subject: Re: [PATCH v24 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <amNEMK4k54l655ku@linaro.org>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
 <20260723-qcom-qce-cmd-descr-v24-6-4f87bb4d9938@oss.qualcomm.com>
 <20260723172814.661591F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723172814.661591F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_035350_222889_A9964B4F 
X-CRM114-Status: GOOD (  46.62  )
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

On Thu, Jul 23, 2026 at 05:28:13PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] Calling `queue_work()` inside `bam_start_dma()` when there is exactly 1 slot available creates an infinite busy-loop in softirq context (softlockup).
> - [High] The transaction completion callback fires before the hardware pipe is actually unlocked, violating the mutual exclusion requirement.
> - [High] The driver clears the software lock state prematurely, allowing concurrent configuration changes to corrupt in-flight hardware execution.
> - [Medium] The 'reserved' field of the lock command element is left uninitialized before being synced to the device.
> 
> Pre-existing issues:
> - [Critical] Mismatch between FIFO wrapping modulo and CIRC_SPACE size leads to silent descriptor overwrites and data corruption.
> --
> 
> --- Patch [6]: [PATCH v24 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> commit bf87fb2cf384d859e1e0efff5d0a48f0cb3ccea2
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> dmaengine: qcom: bam_dma: add support for BAM locking
> 
> Add support for BAM pipe locking. To that end: when starting DMA on a TX
> channel (DMA_MEM_TO_DEV) - prepend the existing queue of issued
> descriptors with an additional "dummy" command descriptor with the LOCK
> bit set. Once the transaction is done (no more issued descriptors),
> issue one more dummy descriptor with the UNLOCK bit.
> 
> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > --- a/drivers/dma/qcom/bam_dma.c
> > +++ b/drivers/dma/qcom/bam_dma.c
> 
> [ ... ]
> 
> > @@ -676,10 +697,51 @@ static void bam_free_chan(struct dma_chan *chan)
> >  static int bam_slave_config(struct dma_chan *chan,
> >  			    struct dma_slave_config *cfg)
> >  {
> > +	struct bam_config *peripheral_cfg = cfg->peripheral_config;
> >  	struct bam_chan *bchan = to_bam_chan(chan);
> > +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
> > +
> > +	if (peripheral_cfg && cfg->peripheral_size != sizeof(*peripheral_cfg))
> > +		return -EINVAL;
> >  
> >  	guard(spinlock_irqsave)(&bchan->vc.lock);
> >  
> > +	/*
> > +	 * This is required to setup the pipe locking and must be done even
> > +	 * before the first call to bam_start_dma().
> > +	 */
> > +	if (bdata->pipe_lock_supported && peripheral_cfg) {
> > +		if (cfg->direction != DMA_MEM_TO_DEV)
> > +			return -EINVAL;
> > +
> > +		if (bchan->bam_locked)
> > +			return -EBUSY;
> > +
> > +		if (!bchan->lock_ce) {
> > +			bchan->lock_ce = kmalloc_obj(*bchan->lock_ce, GFP_ATOMIC);
> 
> [Severity: Medium]
> Will this leave the reserved field of the command element uninitialized?
> 
> Looking at how this is initialized in include/linux/dma/qcom_bam_dma.h:
> 
> static inline void
> bam_prep_ce_le32(struct bam_cmd_element *bam_ce, u32 addr,
>                  enum bam_command_type cmd, __le32 data)
> {
>         bam_ce->cmd_and_addr =
>                 cpu_to_le32((addr & 0xffffff) | ((cmd & 0xff) << 24));
>         bam_ce->data = data;
>         bam_ce->mask = cpu_to_le32(0xffffffff);
> }
> 
> The reserved field is not set here, and kmalloc_obj() does not zero the
> memory. Could this map and sync uninitialized kernel heap memory to the DMA
> hardware?
> 

kzalloc_obj()? This is your bug. :-)

> [ ... ]
> 
> > @@ -1064,22 +1145,34 @@ static void bam_start_dma(struct bam_chan *bchan)
> >  
> >  	lockdep_assert_held(&bchan->vc.lock);
> >  
> > -	if (!vd)
> > +	vd = vchan_next_desc(&bchan->vc);
> > +	if (IS_BUSY(bchan) || (!vd && !bchan->bam_locked))
> >  		return;
> >  
> >  	ret = pm_runtime_get_sync(bdev->dev);
> >  	if (ret < 0)
> >  		return;
> >  
> > +	if (!bchan->initialized)
> > +		bam_chan_init_hw(bchan, container_of(vd, struct bam_async_desc, vd)->dir);
> > +
> > +	if (bchan->locking_enabled && !bchan->bam_locked) {
> > +		/* Defer locking until we also have space for a data descriptor */
> > +		avail = CIRC_SPACE(bchan->tail, bchan->head, MAX_DESCRIPTORS + 1);
> 
> [Severity: Critical]
> This is a pre-existing issue, but does CIRC_SPACE() calculate the correct
> available space when bchan->tail wraps at 4095?
> 
> MAX_DESCRIPTORS is 4095. Down below in bam_start_dma(), the pointers wrap
> via:
> 
>     bchan->tail += async_desc->xfer_len;
>     bchan->tail %= MAX_DESCRIPTORS;
> 
> Since bchan->tail wraps to 0 after 4094, it never reaches 4095. However,
> CIRC_SPACE() is called with MAX_DESCRIPTORS + 1 (4096). Because
> CIRC_SPACE() assumes the pointers wrap at the provided power-of-2 size, when
> the buffer is full (tail == head), won't it incorrectly evaluate the space as
> 4095 and cause a massive buffer overrun?
> 

Ooof, this seems correct to me but we can/should fix this separately
probably...

> > +		if (avail < 2) {
> > +			queue_work(system_bh_highpri_wq, &bdev->work);
> > +			goto out;
> > +		}
> 
> [Severity: High]
> Can this early return cause an infinite busy-loop softlockup?
> 
> If exactly one slot is available (avail == 1), queue_work() is called and
> we return. The worker executes bam_dma_work():
> 
>     if ((!list_empty(&bchan->vc.desc_issued) || bchan->bam_locked) &&
>         !IS_BUSY(bchan))
>         bam_start_dma(bchan);
> 
> Since IS_BUSY() only tests for avail == 0, the check passes and
> bam_start_dma() is immediately called again. It sees avail < 2 again,
> queues the work again, and returns. Could this loop indefinitely in softirq
> context until a hardware interrupt eventually fires?
> 

Yes, the queue_work() doesn't make sense here. We need to wait for the
BAM to finish processing some descriptors. Once it has notified us about
that, the IRQ handler will queue_work() it anyway, so you can just drop
this.

Technically, the avail < 2 check isn't even needed. We could start
writing the LOCK descriptor and then wait for the BAM to make further
room for the data descriptors. I just thought it's a bit weird to queue
LOCK without also adding some data descriptors at the same time.

> [ ... ]
> 
> > @@ -1135,11 +1228,24 @@ static void bam_start_dma(struct bam_chan *bchan)
> >  		if (((avail <= async_desc->xfer_len) || !vd ||
> >  		     dmaengine_desc_callback_valid(&cb)) &&
> >  		    !(async_desc->flags & DESC_FLAG_EOT))
> >  			desc[async_desc->xfer_len - 1].flags |=
> >  				cpu_to_le16(DESC_FLAG_INT);
> 
> [Severity: High]
> Does this cause the transaction completion callback to fire before the
> hardware pipe is actually unlocked?
> 
> DESC_FLAG_INT is set on the data descriptor here, regardless of whether an
> UNLOCK descriptor will immediately follow. When the data descriptor completes,
> an interrupt is generated and process_channel_irqs() completes the cookie:
> 
>     if (!async_desc->num_desc)
>         vchan_cookie_complete(&async_desc->vd);
> 
> Could this notify client drivers of transaction completion while the UNLOCK
> descriptor is still pending in the hardware FIFO, allowing clients to modify
> state or power down the device prematurely?
> 

Yes, but the client driver should be only concerned about the completion
of its own data operations, the lock handling is transparent and
internal to the BAM driver IMO. "Works as intended."

> [ ... ]
> 
> > +	/*
> > +	 * Close the bracket once there is no more client work queued. The
> > +	 * UNLOCK is flagged for an interrupt so process_channel_irqs() is
> > +	 * guaranteed to observe its completion and retire it from the FIFO
> > +	 * promptly, instead of leaving bchan->head to lag until a later
> > +	 * bracket's skip-loop catches up with it.
> > +	 */
> > +	if (bchan->bam_locked && !vd && !IS_BUSY(bchan)) {
> > +		bam_fifo_write_lock(bchan, DESC_FLAG_UNLOCK | DESC_FLAG_INT);
> > +		bchan->bam_locked = false;
> > +	}
> 
> [Severity: High]
> Is the software lock state cleared too early here?
> 
> We synchronously set bchan->bam_locked to false immediately after placing the
> UNLOCK descriptor into the software FIFO, before the hardware has actually
> completed the transaction. 
> 
> If a client then calls bam_slave_config(), the -EBUSY check for
> bchan->bam_locked will pass, and the driver might overwrite bchan->lock_ce
> or configuration registers while the hardware is still busy processing
> in-flight descriptors. Does this violate the mutual exclusion requirement?

It's true, but I think this can be ignored. That's why I didn't even
have the -EBUSY check in my diff. bam_start_dma() already re-configures
the channel in the middle of a transaction (if bchan->reconfigure is
set), so that one will already make changes to in-progress descriptors
anyway. It's a bit problematic though that we don't provide a way for
clients to wait until the unlocking has been completed, so they don't
have any chance to avoid affecting ongoing unlock operations from their
side.

Or you just disallow changing the lock_scratchpad_addr once it has been
set. Whatever. I don't think anyone will ever use multiple different
addresses there.

Thanks,
Stephan

