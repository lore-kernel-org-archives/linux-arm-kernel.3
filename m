Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D47CFD641
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rduilXH5Wm8364iH84Ou35yn1xf2b+yaz9w7SzfHx7E=; b=XN19fql7YlAg8xfrqiTFRNa6Cl
	wP/9zlqulaDA9D/0S+n8rSHHbUGx5pQc77jZpqsBRC8FRfU25PMbqvcpO9bSUxpSuJ4JVJcTjaXHq
	9MH8jjmVCdRYL0QUQaMW81TPvJJ7YWrwS/w8G555UKJ9bHMue9RNP90EDLxEu3JC+hPQlvwxDZ8NZ
	EpCyUNmkwrZBj8JzgOD/f188gxFnfr4mUyErfUk4nwMyPMVAiXfYRyYHk9jMXv3S1ekhBwXSFwGRE
	l1Xq3Iz+/e8/UwxdirOPhxL+/4A6wwW4sJ7fYyAQRzxy63dCNNvrlv+nFR8dVFvE2wfPPsK6O4Rhi
	kW5fBBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUOb-0000000F4td-1DE1;
	Wed, 07 Jan 2026 14:20:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUOZ-0000000F4sb-01PY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:20:20 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vdUO9-0007DI-H7; Wed, 07 Jan 2026 15:19:53 +0100
Message-ID: <b4b1a113-a8dc-4ed7-b395-eaa0deb6a957@pengutronix.de>
Date: Wed, 7 Jan 2026 15:19:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/22] media: rockchip: rga: support external iommus
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
 <20251203-spu-rga3-v2-14-989a67947f71@pengutronix.de>
 <c5b6707e3e6748bf923aaf34db1ae231c7e121ad.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <c5b6707e3e6748bf923aaf34db1ae231c7e121ad.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_062019_191832_87E341F2 
X-CRM114-Status: GOOD (  27.71  )
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

Hi,

On 12/24/25 4:50 PM, Nicolas Dufresne wrote:
> Le mercredi 03 décembre 2025 à 16:52 +0100, Sven Püschel a écrit :
>> In preparation for the RGA3 add support for external iommus. This is a
>> transition step to just disable the RGA2 specific mmu table setup code.
>>
>> Currently a simple rga_hw struct field is used to set the internal iommu.
>> But to handle the case of more sophisticated detection mechanisms
>> (e.g. check for an iommu property in the device tree), it is abstracted
>> by an inline function.
>>
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>> ---
>>   drivers/media/platform/rockchip/rga/rga-buf.c | 46 ++++++++++++++++-----------
>>   drivers/media/platform/rockchip/rga/rga-hw.c  |  1 +
>>   drivers/media/platform/rockchip/rga/rga.c     | 11 +++++--
>>   drivers/media/platform/rockchip/rga/rga.h     |  6 ++++
>>   4 files changed, 43 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
>> index 8845e1f894f29..e8d1e2e579140 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
>> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
>> @@ -12,6 +12,7 @@
>>   #include <media/v4l2-ioctl.h>
>>   #include <media/v4l2-mem2mem.h>
>>   #include <media/videobuf2-dma-sg.h>
>> +#include <media/videobuf2-dma-contig.h>
>>   #include <media/videobuf2-v4l2.h>
>>   
>>   #include "rga.h"
>> @@ -79,14 +80,16 @@ static int rga_buf_init(struct vb2_buffer *vb)
>>   	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
>>   	size_t n_desc = 0;
>>   
>> -	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
>> +	if (rga_has_internal_iommu(rga)) {
>> +		n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
> n_desc is not used outside of this scope, perhap drop the definition with the 0
> init, and use:
>
> 		const size_t n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
> 		
>>   
>> -	rbuf->n_desc = n_desc;
>> -	rbuf->dma_desc = dma_alloc_coherent(rga->dev,
>> -					    rbuf->n_desc * sizeof(*rbuf->dma_desc),
>> -					    &rbuf->dma_desc_pa, GFP_KERNEL);
>> -	if (!rbuf->dma_desc)
>> -		return -ENOMEM;
>> +		rbuf->n_desc = n_desc;
>> +		rbuf->dma_desc = dma_alloc_coherent(rga->dev,
>> +						    rbuf->n_desc * sizeof(*rbuf->dma_desc),
>> +						    &rbuf->dma_desc_pa, GFP_KERNEL);
>> +		if (!rbuf->dma_desc)
>> +			return -ENOMEM;
>> +	}
>>   
>>   	return 0;
>>   }
>> @@ -133,17 +136,21 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
>>   	for (i = 0; i < vb->num_planes; i++) {
>>   		vb2_set_plane_payload(vb, i, f->pix.plane_fmt[i].sizeimage);
>>   
>> -		/* Create local MMU table for RGA */
>> -		n_desc = fill_descriptors(&rbuf->dma_desc[curr_desc],
>> -					  rbuf->n_desc - curr_desc,
>> -					  vb2_dma_sg_plane_desc(vb, i));
>> -		if (n_desc < 0) {
>> -			v4l2_err(&ctx->rga->v4l2_dev,
>> -				 "Failed to map video buffer to RGA\n");
>> -			return n_desc;
>> +		if (rga_has_internal_iommu(ctx->rga)) {
>> +			/* Create local MMU table for RGA */
>> +			n_desc = fill_descriptors(&rbuf->dma_desc[curr_desc],
>> +						  rbuf->n_desc - curr_desc,
>> +						  vb2_dma_sg_plane_desc(vb, i));
>> +			if (n_desc < 0) {
>> +				v4l2_err(&ctx->rga->v4l2_dev,
>> +					 "Failed to map video buffer to RGA\n");
>> +				return n_desc;
>> +			}
>> +			dma_addrs[i] = curr_desc << PAGE_SHIFT;
>> +			curr_desc += n_desc;
>> +		} else {
>> +			dma_addrs[i] = vb2_dma_contig_plane_dma_addr(vb, i);
>>   		}
>> -		dma_addrs[i] = curr_desc << PAGE_SHIFT;
>> -		curr_desc += n_desc;
>>   	}
>>   
>>   	/* Fill the remaining planes */
>> @@ -173,8 +180,9 @@ static void rga_buf_cleanup(struct vb2_buffer *vb)
>>   	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>>   	struct rockchip_rga *rga = ctx->rga;
>>   
>> -	dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
>> -			  rbuf->dma_desc, rbuf->dma_desc_pa);
>> +	if (rga_has_internal_iommu(rga))
>> +		dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
>> +				  rbuf->dma_desc, rbuf->dma_desc_pa);
>>   }
>>   
>>   static void rga_buf_return_buffers(struct vb2_queue *q,
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
>> index fe6f518aedd4e..fb0389ae8e132 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>> @@ -617,6 +617,7 @@ static struct rga_fmt formats[] = {
>>   
>>   const struct rga_hw rga2_hw = {
>>   	.card_type = "rga2",
>> +	.has_internal_iommu = true,
>>   	.formats = formats,
>>   	.num_formats = ARRAY_SIZE(formats),
>>   	.cmdbuf_size = RGA_CMDBUF_SIZE,
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
>> index c9719c7bcfc1c..f28ec88c186fa 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -23,6 +23,7 @@
>>   #include <media/v4l2-ioctl.h>
>>   #include <media/v4l2-mem2mem.h>
>>   #include <media/videobuf2-dma-sg.h>
>> +#include <media/videobuf2-dma-contig.h>
>>   #include <media/videobuf2-v4l2.h>
>>   
>>   #include "rga.h"
>> @@ -95,13 +96,16 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
>>   	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>   	src_vq->drv_priv = ctx;
>>   	src_vq->ops = &rga_qops;
>> -	src_vq->mem_ops = &vb2_dma_sg_memops;
>> +	src_vq->mem_ops = &vb2_dma_contig_memops;
> That's a bit I'm less knowledgeable here, since I never used the sg_memops in
> any of my work, but what is the consequence ? (appart from gaining external
> iommu support)

This is only for the external iommu support, which uses the 
vb2_dma_contig_plane_dma_addr function to get a single linear address 
(instead of vb2_dma_sg_plane_desc used for the manual iommu mapping).

Without an external iommu the value is overridden afterwards to 
vb2_dma_sg_memops. I probably should move the if up to make clear that 
this is only set for the external iommu case.

Or did I misunderstand your question?

>>   	src_vq->gfp_flags = __GFP_DMA32;
>>   	src_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
>>   	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>>   	src_vq->lock = &ctx->rga->mutex;
>>   	src_vq->dev = ctx->rga->v4l2_dev.dev;
>>   
>> +	if (rga_has_internal_iommu(ctx->rga))
>> +		src_vq->mem_ops = &vb2_dma_sg_memops;
>> +
>>   	ret = vb2_queue_init(src_vq);
>>   	if (ret)
>>   		return ret;
>> @@ -110,13 +114,16 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
>>   	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>   	dst_vq->drv_priv = ctx;
>>   	dst_vq->ops = &rga_qops;
>> -	dst_vq->mem_ops = &vb2_dma_sg_memops;
>> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
>>   	dst_vq->gfp_flags = __GFP_DMA32;
>>   	dst_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
>>   	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>>   	dst_vq->lock = &ctx->rga->mutex;
>>   	dst_vq->dev = ctx->rga->v4l2_dev.dev;
>>   
>> +	if (rga_has_internal_iommu(ctx->rga))
>> +		dst_vq->mem_ops = &vb2_dma_sg_memops;
>> +
>>   	return vb2_queue_init(dst_vq);
>>   }
>>   
>> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
>> index 772f7dff9a8e5..fc81bc5562792 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.h
>> +++ b/drivers/media/platform/rockchip/rga/rga.h
>> @@ -148,6 +148,7 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
>>   
>>   struct rga_hw {
>>   	const char *card_type;
>> +	bool has_internal_iommu;
>>   	struct rga_fmt *formats;
>>   	u32 num_formats;
>>   	size_t cmdbuf_size;
>> @@ -163,6 +164,11 @@ struct rga_hw {
>>   	void (*get_version)(struct rockchip_rga *rga);
>>   };
>>   
>> +static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga)
>> +{
>> +	return rga->hw->has_internal_iommu;
>> +}
>> +
>>   extern const struct rga_hw rga2_hw;
>>   
>>   #endif

