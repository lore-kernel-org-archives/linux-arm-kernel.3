Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC15C104BEA7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ow79JTabgZIRsJS6+UL0N2v2U8DPJz+PJynXqjT3UBM=; b=0iLPAxDTvBx06CgWtTowpOxVVk
	MtEMyBRLcb3Gq9RhcHaXDph4vleV/if+afMqRLa6s/qAHNZHsh29rkabu6CTasxoOxNxuGK11yKKX
	bru2qpX/TYKP9rn8cVJOMM3w1r6Z+kuoVSc1XyPGHuLmYFnt3Igo6vSG+IiFhW7LO8zPSnrdSYUAV
	guBsfcYlaDrWh8138q9aU142g5PyUjOzdYnybN+CahidrhtO4NE0Q6xHQmRxOyE3XlISPcwae2J+/
	PXSQO9lwOUUsQ8U2VwcGXerRknrTuWFpdGKDkqjSHFsNspphbyIfMjS0e8HjiQId3GUIwMSLVRWEv
	HFRtyZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GN7-0000000BMPO-2RjI;
	Wed, 11 Mar 2026 10:00:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GN6-0000000BMP7-0s5f
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 10:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ow79JTabgZIRsJS6+UL0N2v2U8DPJz+PJynXqjT3UBM=; b=JHCNf0b96vHhx7iHCwNvdF7SKH
	27RhVuWkwciaWfbac1lE3igcmSQciJEX1d9QpOWFNQkPAwWZcFy8y8QI/ML+AVaKS5ZjzmsGve6SY
	xliPvsfpMTxITjXQAy1qaBTAw0lwfHXExwxf1gN7pUyPmttIsOSZSkFQWzt/v6PQgtPneQ2ZkCCKQ
	Z85NpNVGlAziDaHj3vUS0gz2GB08jcGGfyZn4JpEyl/sEd3NuHFcUntoslfeBlzS91gJDAz+Iy6qm
	rdhE3NhA/vtzKneEC6WBGOJWCOPzTUkHVc/QPj9+0Je19w2/xzFZ3GDTS0U0hM4QqVcyu4bVV3WVQ
	kEjNHxmg==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GN2-0000000Gdyd-3NZN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:00:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439c56e822eso8427228f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773223250; x=1773828050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ow79JTabgZIRsJS6+UL0N2v2U8DPJz+PJynXqjT3UBM=;
        b=aZQp1mdncxqSB5yX790GJnvtviPoTS/l/qUoQYHsXUlcZN30yRhjbtpp26bmxw6osC
         8RVkxPq5XYOY0PaNQr17WTKW0NMIcX/iH3SutYCV1qPHhQbkCG6ZbVYE+dmviVL6FK5Z
         EHzoZQLtrP+pQ509L43qr57L+RVD25MvJ4Xpii2kIL4fXq2d2f6+gNibNvsjgWGttc58
         zoJx0TVAhK2h+3zwnab0reVVki3KrEFFEdiX1WqVRi+CoUYePOs007qWJhnlj80z3581
         LLrdwaOJXoJ60HeE4IgWLBVJdZFwLLtukiSeYVY4Sg0t11cJ3aSwSoa8LgckGgsD2HHL
         HW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223250; x=1773828050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ow79JTabgZIRsJS6+UL0N2v2U8DPJz+PJynXqjT3UBM=;
        b=lKtnQ0u3FLZQ4+stcyek45UZv/IJ+PfcP1RI9EQc6Lg+lY5lii49XZKKtFUf3XvE18
         txyj389KxkFWXbNw9lPtSay8FwjFhvU7HSffE1ZqtayNi8+dp/gjr89GCdypYH8l1hwK
         TJHNyvtI4U7ZSNoWuDT59JbQlJmmL+UiNPpylapW5DbPKzhhISVlkZNFzgbW+7fVlE9D
         Zg5WzEvw0e43O1v+Sp2sbNcpZ3BVVBH6oiXYlM45G3oWkjVVWzPyzYFgdh9ce7vzUEMl
         x0oLsbZA9jpThL+DXI6wPTRcDoL/5lUOCbpvpSv6Qz/El98F4wBxdDfmEN3IFZhZvi7G
         gZlg==
X-Forwarded-Encrypted: i=1; AJvYcCWOSSMvg2o9VgXL8rVwgA1Uvx96o3/VUA6kqkYebIETSa1GM/jamzwwRC1F8e/a26o+qDG6x1mUyBZ+q23oq5Pq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjpg7Unc/BdBTvdrracJz9W4WPJ/2h69Fgkf+zafx9/80PyRwZ
	uIJb/MQRat20uaGDRG6x/M/iHE+QLfdOZT+h6uhsla04fIMJhGhuZpAoWN2cWGMvgG4=
X-Gm-Gg: ATEYQzyBWvChBcae1Kct8KBdCWGnicjA6iTvlUwX/gqSxmPm8Wm/bxQCRU6RivQQIBD
	ODhMKmUTmlRlpJYkYucz3JP9eDp9nWSNY0lh7eDnK16uC5+eIdzvPOL+/SR5JEssWhoVQnTZzuY
	NeN7QdTzn3DSP5p8nWfFEh0Upr5zE6CX206p9+Ovtywa/m4viuBeV9TMVVXhy6gXLeqLwcQc2Wj
	yPfBClRPsCuJcgelQPg8Qge6ZwNUdmBizV7iMgKluM6wJSI1o1kLqDwC6IssSph5mPo17aFSIOo
	/hqWN++uhLS8Wa3UFxGGtIN+5/3kyMji+tT6XPkB1v+JOvWoQpVUIUno7Ax53NnIz2pwMTyeSPP
	6p0VurSxla+ra62hvhg9E1uD0H511xWZHV+R9njwavPNfdcKWJ76Pwfk2gjaNUGABNFT1noyndg
	atm8gdBZtFaE7FboWJbPMUqAq/wyCRrQjn2Fk=
X-Received: by 2002:a05:6000:2f85:b0:439:c38e:66cc with SMTP id ffacd0b85a97d-439f821e5aemr3551932f8f.46.1773223249530;
        Wed, 11 Mar 2026 03:00:49 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81acc22sm5146729f8f.16.2026.03.11.03.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:00:48 -0700 (PDT)
Date: Wed, 11 Mar 2026 11:00:37 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v12 05/12] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <abE9RQfGN6Ycns1B@linaro.org>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <20260310-qcom-qce-cmd-descr-v12-5-398f37f26ef0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-5-398f37f26ef0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_100052_975996_F02F1642 
X-CRM114-Status: GOOD (  30.36  )
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

On Tue, Mar 10, 2026 at 04:44:19PM +0100, Bartosz Golaszewski wrote:
> Add support for BAM pipe locking. To that end: when starting DMA on an RX
> channel - prepend the existing queue of issued descriptors with an
> additional "dummy" command descriptor with the LOCK bit set. Once the
> transaction is done (no more issued descriptors), issue one more dummy
> descriptor with the UNLOCK bit.
> 
> We *must* wait until the transaction is signalled as done because we
> must not perform any writes into config registers while the engine is
> busy.
> 
> [...]
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 83491e7c2f17d8c9d12a1a055baea7e3a0a75a53..627c85a2df4dcdbac247d831a4aef047c2189456 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> [...]
> +static int bam_do_setup_pipe_lock(struct bam_chan *bchan, bool lock)
> +{
> +	struct bam_device *bdev = bchan->bdev;
> +	const struct bam_device_data *bdata = bdev->dev_data;
> +	struct bam_async_desc *lock_desc;
> +	struct bam_cmd_element *ce;
> +	struct scatterlist *sgl;
> +	unsigned long flag;
> +
> +	lockdep_assert_held(&bchan->vc.lock);
> +
> +	if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
> +	    bchan->slave.direction != DMA_MEM_TO_DEV)
> +		return 0;
> +
> +	if (lock) {
> +		sgl = &bchan->lock_sg;
> +		ce = &bchan->lock_ce;
> +		flag = DESC_FLAG_LOCK;
> +	} else {
> +		sgl = &bchan->unlock_sg;
> +		ce = &bchan->unlock_ce;
> +		flag = DESC_FLAG_UNLOCK;
> +	}
> +
> +	lock_desc = bam_make_lock_desc(bchan, sgl, ce, flag);
> +	if (!lock_desc)
> +		return -ENOMEM;
> +
> +	if (lock)
> +		list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
> +	else
> +		list_add_tail(&lock_desc->vd.node, &bchan->vc.desc_issued);
> +
> +	bchan->locked = lock;
> +
> +	return 0;
> +}
> +
> +static int bam_setup_pipe_lock(struct bam_chan *bchan)
> +{
> +	return bam_do_setup_pipe_lock(bchan, true);
> +}
> +
> +static int bam_setup_pipe_unlock(struct bam_chan *bchan)
> +{
> +	return bam_do_setup_pipe_lock(bchan, false);
> +}
> +
>  /**
>   * bam_start_dma - start next transaction
>   * @bchan: bam dma channel
> @@ -1121,6 +1266,7 @@ static void bam_dma_work(struct work_struct *work)
>  	struct bam_device *bdev = from_work(bdev, work, work);
>  	struct bam_chan *bchan;
>  	unsigned int i;
> +	int ret;
>  
>  	/* go through the channels and kick off transactions */
>  	for (i = 0; i < bdev->num_channels; i++) {
> @@ -1128,6 +1274,13 @@ static void bam_dma_work(struct work_struct *work)
>  
>  		guard(spinlock_irqsave)(&bchan->vc.lock);
>  
> +		if (list_empty(&bchan->vc.desc_issued) && bchan->locked) {
> +			ret = bam_setup_pipe_unlock(bchan);
> +			if (ret)
> +				dev_err(bchan->vc.chan.slave,
> +					"Failed to set up the pipe unlock descriptor\n");
> +		}
> +
>  		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
>  			bam_start_dma(bchan);
>  	}

I'm not entirely sure if this actually guarantees waiting with the
unlock until the transaction is "done", for two reasons:

 1. &bchan->vc.desc_issued looks like a "TODO" list for descriptors we
    haven't fully managed to squeeze into the BAM FIFO yet. It doesn't
    tell you which descriptors have been consumed and finished
    processing inside the FIFO.

    Consider e.g. the following case: The client has issued a number of
    descriptors, they all fit into the FIFO. The first descriptor has a
    callback assigned, so we ask the BAM to send us an interrupt when it
    has been consumed. We get the interrupt for the first descriptor and
    process_channel_irqs() marks it as completed, the rest of the
    descriptors are still pending. &bchan->vc.desc_issued is empty, so
    you queue the unlock command before the rest of the descriptors have
    finished.

 2. From reading the BAM chapter in the APQ8016E TRM I get the
    impression that by default an interrupt for a descriptor just tells
    you that the descriptor was consumed by the BAM (and forwarded to
    the peripheral). If you want to guarantee that the transaction is
    actually done on the peripheral side before allowing writes into
    config registers, you would need to set the NWD (Notify When Done)
    bit (aka DMA_PREP_FENCE) on the last descriptor before the unlock
    command.

    NWD seems to stall descriptor processing until the peripheral
    signals completion, so this might allow you to immediately queue the
    unlock command like in v11. The downside is that you would need to
    make assumptions about the set of commands submitted by the client
    again... The downstream driver seems to set NWD on the data
    descriptor immediately before the UNLOCK command [1].

    The chapter in the APQ8016E TRM kind of contradicts itself
    sometimes, but there is this sentence for example: "On the data
    descriptor preceding command descriptor, NWD bit must be asserted in
    order to assure that all the data has been transferred and the
    peripheral is ready to be re-configured."

Thanks,
Stephan

[1]: https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/securemsm-kernel/-/blob/fa55a96773d3fbfcd96beb2965efcaaae5697816/crypto-qti/qce50.c#L5361-5362

