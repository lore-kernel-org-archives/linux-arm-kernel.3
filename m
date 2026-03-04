Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D95EF8FF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiOE48VMgXKAHSp/NgRnPZu1daK6ovvGLxx3bgB0qE4=; b=KObj15iUmCEtCkB1Cy+VNWTN9p
	5vanJHa7fB9zVa/nXdckOfcPgTTIHCnffB51JoqZkLeo28iCbBbb3ioa3jzhYRWVqw6KXSASTiLLF
	wOSqtIZgIuV1Sa6PknNkXEod+UxNW0mEUJ1R9GgiQaX9qm2Tjr60u0rcXnwLWcGzTQC2ZpseqIPdy
	b7B9WwRqbgKO24ZXaMalHrJv+EBcMB3nH1uOUfOXdps3QkaxWfagujACW8/n7pYrOG1Fg7RwVi9OF
	upnehYIiGxUI+bezW/UDE+aVJeKngGb1E/hVQW+S376xREVdLqSguHQgcYKBTBFjU005uaNdjBorJ
	Zgqh5Z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnbj-0000000HS2K-0UGC;
	Wed, 04 Mar 2026 14:53:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnbh-0000000HS1p-2M5W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:53:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC00444098;
	Wed,  4 Mar 2026 14:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4591BC4CEF7;
	Wed,  4 Mar 2026 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772636028;
	bh=BQ44oQAbUgWr8U493meAVTfSHv7WjBkib8olnp0zRU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6MmgnWD9JwZT5Tvq6TfWT4O2Q0Ys4L4GsXTR99rvN4VdJSfEj4ZluNmAQMjsZdxp
	 V+DtoAa1YNw7+qyrec0lX+nJFl7SrGE4eD/3irtT21i9lHBv65L+TYP9+yAb5XnS2c
	 ii/X5EXVyth4FxwEx9IZk5taVpjq8CK4yhqtt7WdaaM7MW8xFIZnzobXi7X3qX+/Z0
	 VyurzjP7sF2JONPbrejSJI8uOkRAalAjh9N3ZKSMLGGDiPyWcFTMVECa3/jJjnyI0V
	 gp3jyR/fUwsIuD+Hpo/UMOBhQXYANsZpjjQDEKWr1J392kst//oRBLVVnd9k4VL5FB
	 oY+zrqBmrPvhg==
Date: Wed, 4 Mar 2026 20:23:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH RFC v11 12/12] dmaengine: qcom: bam_dma: add support for
 BAM locking
Message-ID: <aahHeR9j7q4_ynYK@vaman>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <20260302-qcom-qce-cmd-descr-v11-12-4bf1f5db4802@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-12-4bf1f5db4802@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_065349_639024_08E3B0E6 
X-CRM114-Status: GOOD (  29.04  )
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

On 02-03-26, 16:57, Bartosz Golaszewski wrote:
> Add support for BAM pipe locking. To that end: when starting the DMA on
> an RX channel - wrap the already issued descriptors with additional
> command descriptors performing dummy writes to the base register
> supplied by the client via dmaengine_slave_config() (if any) alongside
> the lock/unlock HW flags.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/dma/qcom/bam_dma.c | 100 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 83491e7c2f17d8c9d12a1a055baea7e3a0a75a53..b149cbe9613f0bdc8e26cae4f0cc6922997480d5 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -28,11 +28,13 @@
>  #include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dma/qcom_bam_dma.h>
>  #include <linux/dmaengine.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/lockdep.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of_dma.h>
> @@ -60,6 +62,8 @@ struct bam_desc_hw {
>  #define DESC_FLAG_EOB BIT(13)
>  #define DESC_FLAG_NWD BIT(12)
>  #define DESC_FLAG_CMD BIT(11)
> +#define DESC_FLAG_LOCK BIT(10)
> +#define DESC_FLAG_UNLOCK BIT(9)
>  
>  struct bam_async_desc {
>  	struct virt_dma_desc vd;
> @@ -391,6 +395,12 @@ struct bam_chan {
>  	struct list_head desc_list;
>  
>  	struct list_head node;
> +
> +	/* BAM locking infrastructure */
> +	struct scatterlist lock_sg;
> +	struct scatterlist unlock_sg;
> +	struct bam_cmd_element lock_ce;
> +	struct bam_cmd_element unlock_ce;
>  };
>  
>  static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
> @@ -1012,14 +1022,92 @@ static void bam_apply_new_config(struct bam_chan *bchan,
>  	bchan->reconfigure = 0;
>  }
>  
> +static struct bam_async_desc *
> +bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
> +		   struct bam_cmd_element *ce, unsigned int flag)
> +{
> +	struct dma_chan *chan = &bchan->vc.chan;
> +	struct bam_async_desc *async_desc;
> +	struct bam_desc_hw *desc;
> +	struct virt_dma_desc *vd;
> +	struct virt_dma_chan *vc;
> +	unsigned int mapped;
> +	dma_cookie_t cookie;
> +	int ret;
> +
> +	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
> +	if (!async_desc) {
> +		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
> +		return NULL;
> +	}
> +
> +	async_desc->num_desc = 1;
> +	async_desc->curr_desc = async_desc->desc;
> +	async_desc->dir = DMA_MEM_TO_DEV;
> +
> +	desc = async_desc->desc;
> +
> +	bam_prep_ce_le32(ce, bchan->slave.dst_addr, BAM_WRITE_COMMAND, 0);
> +	sg_set_buf(sg, ce, sizeof(*ce));
> +
> +	mapped = dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE, DMA_PREP_CMD);
> +	if (!mapped) {
> +		kfree(async_desc);
> +		return NULL;
> +	}
> +
> +	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
> +	desc->addr = sg_dma_address(sg);
> +	desc->size = sizeof(struct bam_cmd_element);
> +
> +	vc = &bchan->vc;
> +	vd = &async_desc->vd;
> +
> +	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
> +	vd->tx.flags = DMA_PREP_CMD;
> +	vd->tx.desc_free = vchan_tx_desc_free;
> +	vd->tx_result.result = DMA_TRANS_NOERROR;
> +	vd->tx_result.residue = 0;
> +
> +	cookie = dma_cookie_assign(&vd->tx);
> +	ret = dma_submit_error(cookie);

I am not sure I understand this.

At start you add a descriptor in the queue, ideally which should be
queued after the existing descriptors are completed!

Also I thought you want to append Pipe cmd to descriptors, why not do
this while preparing the descriptors and add the pipe cmd and start and
end of the sequence when you prepare... This was you dont need to create
a cookie like this


> +	if (ret)
> +		return NULL;
> +
> +	return async_desc;
> +}
> +
> +static int bam_setup_pipe_lock(struct bam_chan *bchan)
> +{
> +	struct bam_async_desc *lock_desc, *unlock_desc;
> +
> +	lock_desc = bam_make_lock_desc(bchan, &bchan->lock_sg,
> +				       &bchan->lock_ce, DESC_FLAG_LOCK);
> +	if (!lock_desc)
> +		return -ENOMEM;
> +
> +	unlock_desc = bam_make_lock_desc(bchan, &bchan->unlock_sg,
> +					 &bchan->unlock_ce, DESC_FLAG_UNLOCK);
> +	if (!unlock_desc) {
> +		kfree(lock_desc);
> +		return -ENOMEM;
> +	}
> +
> +	list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
> +	list_add_tail(&unlock_desc->vd.node, &bchan->vc.desc_issued);
> +
> +	return 0;
> +}
> +
>  /**
>   * bam_start_dma - start next transaction
>   * @bchan: bam dma channel
>   */
>  static void bam_start_dma(struct bam_chan *bchan)
>  {
> -	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
> +	struct virt_dma_desc *vd;
>  	struct bam_device *bdev = bchan->bdev;
> +	const struct bam_device_data *bdata = bdev->dev_data;
>  	struct bam_async_desc *async_desc = NULL;
>  	struct bam_desc_hw *desc;
>  	struct bam_desc_hw *fifo = PTR_ALIGN(bchan->fifo_virt,
> @@ -1030,6 +1118,16 @@ static void bam_start_dma(struct bam_chan *bchan)
>  
>  	lockdep_assert_held(&bchan->vc.lock);
>  
> +	if (bdata->pipe_lock_supported && bchan->slave.dst_addr &&
> +	    bchan->slave.direction == DMA_MEM_TO_DEV) {
> +		ret = bam_setup_pipe_lock(bchan);
> +		if (ret) {
> +			dev_err(bdev->dev, "Failed to set up the BAM lock\n");
> +			return;
> +		}
> +	}
> +
> +	vd = vchan_next_desc(&bchan->vc);
>  	if (!vd)
>  		return;
>  
> 
> -- 
> 2.47.3

-- 
~Vinod

