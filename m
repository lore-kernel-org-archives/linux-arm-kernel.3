Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CD4CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbfF1U0fCTLny7anR+S7+9OZvMa+ePR240qxz4WAm6k=; b=vS09hD+9VzjtKEepPRoPUqluPY
	zUhrvBKB3e3iXuSHpfUCddYIQ7lbTN2obMvmEoQa0phwBxXVAmXY4RmBiK1sa739iCFMDYeyV/iuk
	DolUCFiO3Y+68/lMJGPUF6hXUIYjJdsgjiTg8dtzyqJGX+5OM2C1snrP5MvFaqMLCe77chD9Lt2bs
	Y2vehVF31/+vkpmaUfUxwVlvrennBYEUrAVG9DJGGPcWqRTfWJJsh5xnNds0DzMdygUIcls5Rd22A
	GbPH5+gQzsS3ipxS3tp/sGRbl5u2ZxHheGwH+egNi6pAV4ZxjqiiwR0844d1c4c6F95AW413E5qX0
	+QehCtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4GU-000000082PY-43mT;
	Thu, 21 May 2026 14:20:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4GQ-000000082OJ-3mom
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:20:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4GG-0008CY-NE; Thu, 21 May 2026 16:20:32 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4GF-0017OQ-34;
	Thu, 21 May 2026 16:20:32 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4GG-00000004Wvo-1c98;
	Thu, 21 May 2026 16:20:32 +0200
Date: Thu, 21 May 2026 16:20:32 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v7 14/28] media: rockchip: rga: move cmdbuf to rga_ctx
Message-ID: <ag8UsNez6_zATJI2@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
 <20260521-spu-rga3-v7-14-3f33e8c7145f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-14-3f33e8c7145f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_072044_086020_48A704E9 
X-CRM114-Status: GOOD (  27.70  )
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

On Thu, 21 May 2026 00:44:19 +0200, Sven Püschel wrote:
> Move the command buffer to the rga_ctx struct in preparation to reuse
> an already prepared command buffer. This allows to split the command
> buffer setup in a further commit to setup a template for the command
> buffer at streamon and only update the buffer addresses in device_run
> and trigger the command stream. No sync point is added, as one command
> buffer should only be used for one conversion at a time.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c | 28 +++++++---------
>  drivers/media/platform/rockchip/rga/rga.c    | 48 ++++++++++++++++------------
>  drivers/media/platform/rockchip/rga/rga.h    |  5 +--
>  3 files changed, 41 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 17f7a67c0b4bb..9881c14f908d5 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -122,8 +122,7 @@ static struct rga_addr_offset *rga_lookup_draw_pos(struct
>  
>  static void rga_cmd_set_src_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>  {
> -	struct rockchip_rga *rga = ctx->rga;
> -	u32 *dest = rga->cmdbuf_virt;
> +	u32 *dest = ctx->cmdbuf_virt;
>  	unsigned int reg;
>  
>  	reg = RGA_MMU_SRC_BASE - RGA_MODE_BASE_REG;
> @@ -135,8 +134,7 @@ static void rga_cmd_set_src_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>  
>  static void rga_cmd_set_src1_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>  {
> -	struct rockchip_rga *rga = ctx->rga;
> -	u32 *dest = rga->cmdbuf_virt;
> +	u32 *dest = ctx->cmdbuf_virt;
>  	unsigned int reg;
>  
>  	reg = RGA_MMU_SRC1_BASE - RGA_MODE_BASE_REG;
> @@ -148,8 +146,7 @@ static void rga_cmd_set_src1_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>  
>  static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>  {
> -	struct rockchip_rga *rga = ctx->rga;
> -	u32 *dest = rga->cmdbuf_virt;
> +	u32 *dest = ctx->cmdbuf_virt;
>  	unsigned int reg;
>  
>  	reg = RGA_MMU_DST_BASE - RGA_MODE_BASE_REG;
> @@ -162,7 +159,7 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>  static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>  {
>  	struct rockchip_rga *rga = ctx->rga;
> -	u32 *dest = rga->cmdbuf_virt;
> +	u32 *dest = ctx->cmdbuf_virt;
>  	unsigned int scale_dst_w, scale_dst_h;
>  	unsigned int src_h, src_w, dst_h, dst_w;
>  	union rga_src_info src_info;
> @@ -322,8 +319,7 @@ static void rga_cmd_set_src_info(struct rga_ctx *ctx,
>  				 struct rga_addr_offset *offset)
>  {
>  	struct rga_corners_addr_offset src_offsets;
> -	struct rockchip_rga *rga = ctx->rga;
> -	u32 *dest = rga->cmdbuf_virt;
> +	u32 *dest = ctx->cmdbuf_virt;
>  	unsigned int src_h, src_w, src_x, src_y;
>  
>  	src_h = ctx->in.crop.height;
> @@ -350,8 +346,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
>  {
>  	struct rga_addr_offset *dst_offset;
>  	struct rga_corners_addr_offset offsets;
> -	struct rockchip_rga *rga = ctx->rga;
> -	u32 *dest = rga->cmdbuf_virt;
> +	u32 *dest = ctx->cmdbuf_virt;
>  	unsigned int dst_h, dst_w, dst_x, dst_y;
>  	unsigned int mir_mode = 0;
>  	unsigned int rot_mode = 0;
> @@ -397,8 +392,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
>  
>  static void rga_cmd_set_mode(struct rga_ctx *ctx)
>  {
> -	struct rockchip_rga *rga = ctx->rga;
> -	u32 *dest = rga->cmdbuf_virt;
> +	u32 *dest = ctx->cmdbuf_virt;
>  	union rga_mode_ctrl mode;
>  	union rga_alpha_ctrl0 alpha_ctrl0;
>  	union rga_alpha_ctrl1 alpha_ctrl1;
> @@ -423,7 +417,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>  {
>  	struct rockchip_rga *rga = ctx->rga;
>  
> -	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
> +	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
>  
>  	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
>  	/*
> @@ -439,11 +433,11 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>  	rga_cmd_set_dst_info(ctx, &dst->offset);
>  	rga_cmd_set_trans_info(ctx);
>  
> -	rga_write(rga, RGA_CMD_BASE, rga->cmdbuf_phy);
> +	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
>  
>  	/* sync CMD buf for RGA */
> -	dma_sync_single_for_device(rga->dev, rga->cmdbuf_phy,
> -		PAGE_SIZE, DMA_BIDIRECTIONAL);
> +	dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
> +				   PAGE_SIZE, DMA_BIDIRECTIONAL);
>  }
>  
>  static void rga_hw_start(struct rockchip_rga *rga,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 77b8c7ab74274..bf6bbcbfc869b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -219,6 +219,16 @@ static int rga_open(struct file *file)
>  	ctx = kzalloc_obj(*ctx);
>  	if (!ctx)
>  		return -ENOMEM;
> +
> +	/* Create CMD buffer */
> +	ctx->cmdbuf_virt = dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> +					   &ctx->cmdbuf_phy, GFP_KERNEL,
> +					   DMA_ATTR_WRITE_COMBINE);
> +	if (!ctx->cmdbuf_virt) {
> +		ret = -ENOMEM;
> +		goto rel_ctx;
> +	}
> +
>  	ctx->rga = rga;
>  	/* Set default formats */
>  	ctx->in = def_frame;
> @@ -230,15 +240,13 @@ static int rga_open(struct file *file)
>  			    ctx->out.fmt->fourcc, def_width, def_height);
>  
>  	if (mutex_lock_interruptible(&rga->mutex)) {
> -		kfree(ctx);
> -		return -ERESTARTSYS;
> +		ret = -ERESTARTSYS;
> +		goto rel_cmdbuf;
>  	}
>  	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(rga->m2m_dev, ctx, &queue_init);
>  	if (IS_ERR(ctx->fh.m2m_ctx)) {
>  		ret = PTR_ERR(ctx->fh.m2m_ctx);
> -		mutex_unlock(&rga->mutex);
> -		kfree(ctx);
> -		return ret;
> +		goto unlock_mutex;
>  	}
>  	v4l2_fh_init(&ctx->fh, video_devdata(file));
>  	v4l2_fh_add(&ctx->fh, file);
> @@ -252,6 +260,15 @@ static int rga_open(struct file *file)
>  	mutex_unlock(&rga->mutex);
>  
>  	return 0;
> +
> +unlock_mutex:
> +	mutex_unlock(&rga->mutex);
> +rel_cmdbuf:
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +		       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> +rel_ctx:
> +	kfree(ctx);
> +	return ret;
>  }
>  
>  static int rga_release(struct file *file)
> @@ -266,6 +283,10 @@ static int rga_release(struct file *file)
>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>  	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
> +
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +		       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> +
>  	kfree(ctx);
>  
>  	mutex_unlock(&rga->mutex);
> @@ -720,19 +741,10 @@ static int rga_probe(struct platform_device *pdev)
>  
>  	pm_runtime_put(rga->dev);
>  
> -	/* Create CMD buffer */
> -	rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> -					   &rga->cmdbuf_phy, GFP_KERNEL,
> -					   DMA_ATTR_WRITE_COMBINE);
> -	if (!rga->cmdbuf_virt) {
> -		ret = -ENOMEM;
> -		goto rel_m2m;
> -	}
> -
>  	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> -		goto free_dma;
> +		goto rel_m2m;
>  	}
>  
>  	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
> @@ -740,9 +752,6 @@ static int rga_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> -free_dma:
> -	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> -		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>  rel_m2m:
>  	v4l2_m2m_release(rga->m2m_dev);
>  rel_vdev:
> @@ -759,9 +768,6 @@ static void rga_remove(struct platform_device *pdev)
>  {
>  	struct rockchip_rga *rga = platform_get_drvdata(pdev);
>  
> -	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> -		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> -
>  	v4l2_info(&rga->v4l2_dev, "Removing\n");
>  
>  	v4l2_m2m_release(rga->m2m_dev);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 27b3c9b4f220c..04aeb7b429523 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -53,6 +53,9 @@ struct rga_ctx {
>  	struct rga_frame out;
>  	struct v4l2_ctrl_handler ctrl_handler;
>  
> +	void *cmdbuf_virt;
> +	dma_addr_t cmdbuf_phy;
> +
>  	int osequence;
>  	int csequence;
>  
> @@ -89,8 +92,6 @@ struct rockchip_rga {
>  	spinlock_t ctrl_lock;
>  
>  	struct rga_ctx *curr;
> -	dma_addr_t cmdbuf_phy;
> -	void *cmdbuf_virt;
>  
>  	const struct rga_hw *hw;
>  };
> 
> -- 
> 2.54.0
> 
> 

