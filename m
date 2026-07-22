Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7600C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4WgNrEKdg3Ic3C4pPexVwOX2zafZ8GZg4cnbInNRII=; b=WAQDes116GoVS3A9kJEM48SBk3
	eoh1cjJtCmFEcBw+R25LIA2vnCyKkyszHBx8P8y60VN9lo/ISLaqsomyt62g4wd9WTwUZvEl7Ym0z
	gBfQJaZZWO8P3+lVOxkz97P/kdQp+RbCssmQedkY0BBbUjMJIq+GG5Av4BGXFjDfmBW5W8KIl0iEM
	RzK05QqFUfC00p98rRB3wBJP+zLGPSZo86ptuqdYKk/JmThHcf+qDJBXHfG+rQBiolP4JKDuVSVoL
	WFZC8aFrtgTbpqx8x/hjabsaCIdjwgw47wPENawjXE0Z4QWP9gz+kpfSlhOKjb6rFjPswoTFLwJzq
	YVM2L8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTLv-0000000BQeE-026v;
	Wed, 22 Jul 2026 09:34:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTLs-0000000BQdw-3bfq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:34:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1711360A7C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10CE1F01559
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784712895;
	bh=i4WgNrEKdg3Ic3C4pPexVwOX2zafZ8GZg4cnbInNRII=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Cu6Mc/sTiHEugnS/UEUP5o1+6fDnZqVfmlxJQqiFffjcMGqHzy+gRrrDqF5vE3wCX
	 jDfzbDes4z1Vi0jlCuNfJ5S0dC1KAONP/jSJeLDrvazOVYPa6UM0wAtDAiUagN89ri
	 p5U0TDZ7Cv15Kmj7t/aHdNiEeIr1/mcbOu3MIIh86c33Si5/Y2kubgA2tVudJ5aqKj
	 AK35MmbSuTb5RsAz0tT7fx81y8C9OPKS8raXuKAu3KHhXvJsrcDyWG3/yBGeIA7GaU
	 g9NvPL48PxcMkPwS4T/GY9Y/6CBaVDVG4gLgEVlX8KRHc8oRagh/LLFfZflsA8+ivm
	 ev8j87IUsQxaQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so5850116e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:34:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpqWQmmuK9afgWplbWPEikGL8AHMi/yWZQc73kk+IVnWlQrZx3h15neMazFBzFyJtmhaY1f9RjVuwHA7hUD14Cd@lists.infradead.org
X-Gm-Message-State: AOJu0YxB/Hy5QV7hyMKuxFdQXU9f7AK6ItdrVRvG5Yj4FO2NyvxSql2I
	HBimJV5f3AGg+mg9aCC9lxHZuhgWFhFgyIyvbKAGw9jW9GhV9zl9I8v5E1oC2iXZLS0LPBSW1b+
	QwQQl9NmNbHi2/eLJbuFtJHEQa5oyFmrDIeyqrOHlpw==
X-Received: by 2002:a05:6512:6f:b0:5ae:b0c0:16bc with SMTP id
 2adb3069b0e04-5b28f890184mr3237380e87.27.1784712894372; Wed, 22 Jul 2026
 02:34:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 02:34:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 02:34:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <amCGXUUd4VmuQRGD@linaro.org>
MIME-Version: 1.0
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org> <amCGXUUd4VmuQRGD@linaro.org>
Date: Wed, 22 Jul 2026 02:34:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
X-Gm-Features: AUfX_mwVr6pWOzeRIi6v2GZNWX7GGrq8Md8rkImjzrBVx4v9bKKGCd1iVRWIwX0
Message-ID: <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	brgl@kernel.org, sashiko-reviews@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 22 Jul 2026 10:59:09 +0200, Stephan Gerhold
<stephan.gerhold@linaro.org> said:
> On Tue, Jul 21, 2026 at 01:48:52PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>> - [High] State leak causing hardware misconfiguration on channel reuse due to uncleared `lock_scratchpad_addr` and hardcoded direction.
>> - [High] Channel state corruption when `bam_slave_config` fails validation.
>> - [High] Infinite BH workqueue loop and unratelimited log flood on memory allocation failure.
>> - [High] DMA API violation: `lock_ce` buffer shares a cacheline with frequently CPU-modified struct members.
>> - [Low] Unused assignment of `hdesc` in IRQ handler.
>> --
>>
>> --- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
>> commit 8b44c5e4935cbb61832adb3262df00b3b606a283
>> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>
>> dmaengine: qcom: bam_dma: add support for BAM locking
>>
>> This commit adds support for BAM pipe locking by prepending and appending
>> dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
>> channel. It uses a peripheral-local scratchpad address communicated via slave
>> config for the dummy writes.
>>
>> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>> > index f3e713a5259c2..411c60c4433e2 100644
>> > --- a/drivers/dma/qcom/bam_dma.c
>> > +++ b/drivers/dma/qcom/bam_dma.c
>> [ ... ]
>> > @@ -72,6 +76,11 @@ struct bam_async_desc {
>> >
>> >  	struct bam_desc_hw *curr_desc;
>> >
>> > +	/* BAM locking infrastructure */
>> > +	bool is_lock_desc;
>> > +	struct scatterlist lock_sg;
>> > +	struct bam_cmd_element lock_ce;
>> > +
>> >  	/* list node for the desc in the bam_chan list of descriptors */
>> >  	struct list_head desc_node;
>>
>> [Severity: High]
>> Does placing lock_ce immediately adjacent to desc_node risk a DMA API
>> violation? lock_ce is mapped for DMA via dma_map_sg(), but desc_node is
>> actively modified by the CPU via list_add_tail() during bam_start_dma()
>> while the mapping is active. On non-coherent architectures, could this
>> cause cacheline tearing or stale data writebacks if they share the same
>> cacheline?
>>
>
> I think this complaint was there in some revisions before. Could be
> mostly a false positive given that the lock_ce is just DMA_MEM_TO_DEV
> (i.e. read-only for the BAM)...
>

Yes, I ignored it because it's not a problem for us in this case.

>> [ ... ]
>> > @@ -676,13 +691,26 @@ static void bam_free_chan(struct dma_chan *chan)
>> >  static int bam_slave_config(struct dma_chan *chan,
>> >  			    struct dma_slave_config *cfg)
>> >  {
>> > +	struct bam_config *peripheral_cfg = cfg->peripheral_config;
>> >  	struct bam_chan *bchan = to_bam_chan(chan);
>> > +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
>> >
>> >  	guard(spinlock_irqsave)(&bchan->vc.lock);
>> >
>> >  	memcpy(&bchan->slave, cfg, sizeof(*cfg));
>> >  	bchan->reconfigure = 1;
>> >
>>
>> [Severity: High]
>> Is it safe to overwrite bchan->slave and set bchan->reconfigure = 1 before
>> validating the configuration direction below? If cfg->direction !=
>> DMA_MEM_TO_DEV, this returns -EINVAL to the caller, but the channel
>> retains the rejected parameters and will apply them on the next transfer
>> because bchan->reconfigure remains set.
>>
>
> Yeah, better to swap the order.
>

Sigh... ok.

>> > +	/*
>> > +	 * This is required to setup the pipe locking and must be done even
>> > +	 * before the first call to bam_start_dma().
>> > +	 */
>> > +	if (bdata->pipe_lock_supported && peripheral_cfg) {
>> > +		if (cfg->direction != DMA_MEM_TO_DEV)
>> > +			return -EINVAL;
>> > +
>> > +		bchan->lock_scratchpad_addr = peripheral_cfg->lock_scratchpad_addr;
>> > +	}
>>
>> [Severity: High]
>> If bam_slave_config() is called without peripheral_cfg, should
>> bchan->lock_scratchpad_addr be reset to 0 to avoid leaking state from a
>> prior configuration? If the previous lock_scratchpad_addr is retained,
>> bam_start_dma() might erroneously inject dummy lock descriptors on new
>> transfers.
>>
>
> Probably unlikely to happen, but yeah.
>
> I would also check if (cfg->peripheral_size == sizeof(peripheral_cfg)),
> just to be safe.
>

Ok.

>> [ ... ]
>> > @@ -919,13 +959,19 @@ static u32 process_channel_irqs(struct bam_device *bdev)
>> >  			 * push back to front of desc_issued so that
>> >  			 * it gets restarted by the work queue.
>> >  			 */
>> > +
>> > +			list_del(&async_desc->desc_node);
>> >  			if (!async_desc->num_desc) {
>> > -				vchan_cookie_complete(&async_desc->vd);
>> > +				hdesc = async_desc->desc;
>> > +
>>
>> [Severity: Low]
>> Is the assignment to hdesc used anywhere? It appears to be assigned here but
>> is never read.
>>
>
> Yeah, I think I pointed this out before.
>

Dang it, I removed one but seem to have missed this.

>> [ ... ]
>> > @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
>> >
>> >  	lockdep_assert_held(&bchan->vc.lock);
>> >
>> > +	vd = vchan_next_desc(&bchan->vc);
>> >  	if (!vd)
>> >  		return;
>> >
>> > @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
>> >  		return;
>> >
>> >  	while (vd && !IS_BUSY(bchan)) {
>> > +		/*
>> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
>> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
>> > +		 * already have bam_locked set and must not trigger a second pair.
>> > +		 */
>> > +		if (!bchan->bam_locked) {
>> > +			ret = bam_setup_pipe_lock(bchan);
>> > +			if (ret) {
>> > +				dev_err_ratelimited(bdev->dev,
>> > +					"failed to setup the pipe lock, deferring transfer: %d\n",
>> > +					ret);
>> > +				queue_work(system_bh_highpri_wq, &bdev->work);
>> > +				break;
>> > +			}
>>
>> [Severity: High]
>> Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
>> starvation? Because system_bh_highpri_wq executes in softirq context,
>> requeuing immediately without sleeping prevents the memory reclaim needed
>> to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.
>>
>
> It looks like my suggestion to queue_work() again in the error path of
> bam_start_dma() wasn't great if we end up causing an infinite spin loop.
> We do need to retry somehow or report an error though, I don't think
> aborting and leaving the desccriptors completely unhandled is an option
> either... :(
>
> One option would be to try to avoid the allocation and write the lock
> descriptors directly into the FIFO, but this will probably get really
> messy as well, since you would need to carefully modify the FIFO
> management in several functions ...
>
> I don't have a good spontaenous idea how to solve this right now. :/
>

Pre-allocate the lock descriptors (if needed) in bam_prep_slave_sg()? As in:
call bam_make_lock_desc() in bam_prep_slave_sg(), store the descriptors and
make bam_setup_pipe_lock() return void as it will no longer be possible for it
to fail? It would just grab the preallocated descriptors.

Bart

