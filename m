Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FF3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1DYXIUQnIiN84/lMI+GWM+J+e6plcKuO3rAiK+mKgk=; b=UV1Cy5d5AawGjQ/WibliJJQ32t
	g9xgJX6MkifDDM8vgIvBQp4vZwDikhF9FotuSgN05zjT8TebSmu2JcbpJOw0mJ+YBf+PW6bMhp9io
	ESJnYyZ5aLskNlL7CIKHjjxlB/xr7Z/xB/1WjyHH1tcPs6UQgYRzKeKZazcQHNhFoFxL/+8Ld5sVf
	xWt4yOVdvQM+3kaEkEjiSY1TZp422Itwx1ZI6ecQZY1lvp/vqMUQov06+x4y4LYIfN4PDoF5hAqGN
	U4amzGqsBCldWekRWlyuRmVY7kZGSU72YKdH/kz4PiaMLVXHNGjvh1RMNRt+h4RHZbmZ4vuS3K3I2
	crTBGcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZlc-0000000BUuo-0gZy;
	Tue, 14 Jul 2026 09:49:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZlY-0000000BUuD-3r3w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:49:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso1802176f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 02:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784022566; x=1784627366; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1DYXIUQnIiN84/lMI+GWM+J+e6plcKuO3rAiK+mKgk=;
        b=OWs2+raPM25Bxb7ubDIO8TDZvCiMOPIsC/bBAoMGGItFrPUuZcLOPpuc80TR84fdpj
         fSC2kbv8w5DCnNxtUdTGWEbDQO0/wsdobJKzXGaLXtObPjJLEc1UWqJ79yoDXqdK3GBF
         QvMwNSYn6kiTjwgjXeq6vWJKiZkBuYpB5VmDM7S51Z2YCsujt4NDZBc7mfqBqcPzZZOB
         EbkLldZ2TTh+zIiY4Gb2ZlWRV4lDVJSuSfRWk4va0IoMfLBTADgKakFV96/nYPQjU7OS
         2zmzRpmme4Ul0mbm8jFyZbekSBnjOQ+yaZLzM6w03Chb7+yIcYeNTxN7PotVhZRpLQhu
         N1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784022566; x=1784627366;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1DYXIUQnIiN84/lMI+GWM+J+e6plcKuO3rAiK+mKgk=;
        b=cegagh516Qqz+CL2sEHfB5fzLeayoC6/ISAopsI8C5VB7c1pl5ia+uwIE4eokho1fY
         P65bbMLHNlBxgOoyIVCMiLWcOiu/cVRhjtWN9miKS8uXpbz/30F7Jjwx4Gf16w4BeOLF
         C18QRrokC/0V2oAk93yQH3TXCTSRnKe3hq1SnE2HhFOu56B5KRY2cUg/Vk29+vBGEt1k
         Digl7VqN9/W4JUtFVmIVbAZHbUyLfclUFjN+93bck9242AY4hTl5rbML3Yojr0MJSUfY
         lzc7XzgN0xuT94N6hbC1u0siYo0NdBJYihfVlQO5ZypgqSThrqVf2QbDUiThNDGlb6+Z
         K84A==
X-Forwarded-Encrypted: i=1; AHgh+RoixsA0deORoRi566EKwpcs7GIM897kaR8mKqQ+zYLaSyqkawS+osAVd9kkE8ZbDB7duJT7mAAmit5TgwAkqJze@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1jemD84rX109CzfsXcpw2/OA8DD22YHqnMUa+iCi3k5J+czbw
	677ugWmLXoiZ9YemfL8B9VeMFqn/50+Y6pn4TL/pb4a8KN2zGDdurKMhRFJhRPfXq+4=
X-Gm-Gg: AfdE7cnZQ8TUgS8gmDLNAmqKElSykYL/j2DbLR+HMVMS3M7y+RT56wA/gdXSMqJgo63
	P8sjzPCPHASmR2QP9J9VD9Pp9OsqlkGQieOGqwmfZgw0s+7UwbAlVakLaxYW567VgnYEIpMTf3J
	qPUv/lzwnF0NzLTQ+A2C0zSLoq89725kkOZIelLyxwl6VAeUyr3lJdVQXPhyeLdidp3rT5wdIta
	m/e0aiizs4IU105oTO01gELNeKRrxhPPB3/A83A665PtLHp0Q3qSa9Vi06u+kEWqsCVwXck9hYs
	ben/qW8RsqBjNQL0rn90HKtyplgvEF9kOVMNdK3uTPSVLka5yPOBWzvHS+d/hCSEA0LUee8dW8P
	GHR8t9lbHXZiC/PosbBR7iVIPHCsEhVpCh/gJauLYcgnmOzZH47cHMIYqZMI4ahGl/Zjmp0269K
	1aty3juNCoC/J0ZTun8Z5xKYnJ
X-Received: by 2002:a05:6000:4602:b0:47d:fb9e:c3f6 with SMTP id ffacd0b85a97d-47f488573eamr1707837f8f.20.1784022566424;
        Tue, 14 Jul 2026 02:49:26 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:6c30:6cbd:7b12:2745])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm7671449f8f.22.2026.07.14.02.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 02:49:25 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:49:14 +0200
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
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v21 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <alYGGu7_3G6mJAzQ@linaro.org>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_024929_039589_22A7BC6C 
X-CRM114-Status: GOOD (  38.32  )
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

On Mon, Jul 13, 2026 at 03:01:07PM +0200, Bartosz Golaszewski wrote:
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
> The dummy writes must be issued into a scratchpad register of the client
> so provide a mechanism to communicate the right address via descriptor
> metadata.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for the fixes. The lock/unlock sequence looks good to me now,
I commented on a couple of minor things below that would be good to fix
(some of them are also reported by Sashiko).

> ---
>  drivers/dma/qcom/bam_dma.c       | 191 +++++++++++++++++++++++++++++++++++++--
>  include/linux/dma/qcom_bam_dma.h |  14 +++
>  2 files changed, 198 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index f3e713a5259c2c7c24cfdcec094814eb1202971a..f08549ee3872eece85884606d6ee9e540ee688ca 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> [...]
> @@ -686,6 +702,35 @@ static int bam_slave_config(struct dma_chan *chan,
>  	return 0;
>  }
>  
> +static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
> +{
> +	struct bam_chan *bchan = to_bam_chan(desc->chan);
> +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
> +	struct bam_desc_metadata *metadata = data;
> +
> +	if (!data)

Doesn't really matter much, but since the parameter exists you might as
well add

	&& len == sizeof(*metadata)

here to be sure.

> +		return -EINVAL;
> +
> +	if (!bdata->pipe_lock_supported)
> +		/*
> +		 * The client wants to use locking but this BAM version doesn't
> +		 * support it. Don't return an error here as this will stop the
> +		 * client from using DMA at all for no reason.
> +		 */
> +		return 0;
> +
> +	guard(spinlock_irqsave)(&bchan->vc.lock);
> +
> +	bchan->scratchpad_addr = metadata->scratchpad_addr;
> +	bchan->direction = metadata->direction;
> +
> +	return 0;
> +}
> +
> +static const struct dma_descriptor_metadata_ops bam_metadata_ops = {
> +	.attach = bam_metadata_attach,
> +};

I'm not sure if we have discussed this before, but could we avoid
re-programming the scratchpad_addr all the time by placing it into
struct dma_slave_config -> peripheral_config? It still feels awkward to
me to place a global constant configuration value into per-descriptor
metadata.

> +
>  /**
>   * bam_prep_slave_sg - Prep slave sg transaction
>   *
> [...]
> @@ -802,6 +851,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
>  		}
>  
>  		vchan_get_all_descriptors(&bchan->vc, &head);
> +		bchan->bam_locked = false;

I wonder about the implications of this. If the LOCK descriptor was
already processed, will we cause a deadlock if we never submit the
UNLOCK descriptor? Or I guess bam_reset_channel() might reset the lock
as well?

>  	}
>  
>  	vchan_dma_desc_free_list(&bchan->vc, &head);
> [...]
> @@ -870,6 +929,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
>  {
>  	u32 i, srcs, pipe_stts, offset, avail;
>  	struct bam_async_desc *async_desc, *tmp;
> +	struct bam_desc_hw *hdesc;
>  
>  	srcs = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_EE));
>  
> @@ -919,13 +979,20 @@ static u32 process_channel_irqs(struct bam_device *bdev)
>  			 * push back to front of desc_issued so that
>  			 * it gets restarted by the work queue.
>  			 */
> +
> +			list_del(&async_desc->desc_node);
>  			if (!async_desc->num_desc) {
> -				vchan_cookie_complete(&async_desc->vd);
> +				hdesc = async_desc->desc;
> +				u16 flags = le16_to_cpu(hdesc->flags);

Is this unused? Also a bit odd to have hdesc declared outside of the
loop and flags declared inside.

> +
> +				if (async_desc->is_lock_desc)
> +					bam_dma_free_lock_desc(&async_desc->vd);
> +				else
> +					vchan_cookie_complete(&async_desc->vd);
>  			} else {
>  				list_add(&async_desc->vd.node,
>  					 &bchan->vc.desc_issued);
>  			}
> -			list_del(&async_desc->desc_node);
>  		}
>  	}
>  
> @@ -1046,13 +1113,102 @@ static void bam_apply_new_config(struct bam_chan *bchan,
>  	bchan->reconfigure = 0;
>  }
>  
> +static struct bam_async_desc *
> +bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
> +{
> +	struct dma_chan *chan = &bchan->vc.chan;
> +	struct bam_async_desc *async_desc;
> +	struct bam_desc_hw *desc;
> +	struct virt_dma_desc *vd;
> +	struct virt_dma_chan *vc;
> +	unsigned int mapped;
> +
> +	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
> +	if (!async_desc) {
> +		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	sg_init_table(&async_desc->lock_sg, 1);
> +
> +	async_desc->num_desc = 1;
> +	async_desc->curr_desc = async_desc->desc;
> +	async_desc->dir = DMA_MEM_TO_DEV;
> +	async_desc->is_lock_desc = true;
> +
> +	desc = async_desc->desc;
> +
> +	bam_prep_ce_le32(&async_desc->lock_ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0);
> +	sg_set_buf(&async_desc->lock_sg, &async_desc->lock_ce, sizeof(async_desc->lock_ce));
> +
> +	mapped = dma_map_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);

I agree with Sashiko that mapping using the BAM device
(bchan->bdev->dev) would be more precise, since the BAM will be reading
the descriptor. (It doesn't matter in practice since both BAM and
consumer usually have the same IOMMUs defined.)

> +	if (!mapped) {
> +		kfree(async_desc);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
> +	desc->addr = sg_dma_address(&async_desc->lock_sg);

cpu_to_le32()

> +	desc->size = cpu_to_le16(sizeof(struct bam_cmd_element));
> +
> +	vc = &bchan->vc;
> +	vd = &async_desc->vd;
> +
> +	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
> +	vd->tx.flags = DMA_PREP_CMD;
> +	vd->tx_result.result = DMA_TRANS_NOERROR;
> +	vd->tx_result.residue = 0;
> +
> +	return async_desc;
> +}
> +
> [...]
> @@ -1072,6 +1229,18 @@ static void bam_start_dma(struct bam_chan *bchan)
>  		return;
>  
>  	while (vd && !IS_BUSY(bchan)) {
> +		/*
> +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> +		 * already have bam_locked set and must not trigger a second pair.
> +		 */
> +		if (!bchan->bam_locked &&
> +		    !container_of(vd, struct bam_async_desc, vd)->is_lock_desc) {

Do we need the ->is_lock_desc check here? Looks redundant to me.

> +			ret = bam_setup_pipe_lock(bchan);
> +			if (ret == 0 && bchan->bam_locked)
> +				vd = vchan_next_desc(&bchan->vc);

Do we want some error handling here? If there is an error, this will
silently continue queuing everything without any locking.

Thanks,
Stephan

