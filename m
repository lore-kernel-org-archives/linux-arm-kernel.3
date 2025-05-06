Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440D7C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YeCRaAJQKi+swQx4TF2dqwqlQrzKmKd2w9IrTf/irw=; b=UjHFaWSCQEg14xldEwyoWE5owR
	THrtS06V8/rUNhiH/ByNolqEhGT4jsUZXeLAX8bCUd+lkHUeIvjXOsISw5knwCApFIshzrIe4eC5h
	yRROTUd1bysV9ikE0rLh6CveEPVoMSCZuqWhrkRC3yki+Yn4/foD6K4JL+Q7wgYZRuuczQNTUyojH
	y1sMibhBzU7JTLHMQI4UTyw6Xmg+X8hGIgU/tHDFYQm8EOEyL0GJTcx9/7voX6teI75lC257k0BmG
	IYjkOwIw1SHbRJKWzjIRf2d2FJ/rR0oYMuUGXso/8vAerEadsLVQ/7sIR0cB+QWzyfO6kaquwLEN4
	CPfQLSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHoE-0000000ByuI-1USs;
	Tue, 06 May 2025 12:54:06 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFgP-0000000Baqx-1pfT;
	Tue, 06 May 2025 10:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746527873; x=1778063873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XtJyhQdvGfr7mbAylqa9uwfJ4UqSMiFpvWs0eozYVp4=;
  b=kGbzu5mDiKPFFgNpzcvLeypKiC1WDzb0A1FuWZ0lkB2AgfBxhtNQSMF7
   eU6L0M2ZTHwI0+QKQ1FJIsnYUueZSCNBztJYoaFN5jM/ed1m5+zESHQVc
   LOEYKeaogb2EpQmOL+p1+WvDp6yLbh9FSyEqvh6F7PmBSxRVrhBSNuS1N
   qti4vGMaElUcmuGr2b8RvU8mP7aIPPPnIcS/oLmx4p719RReq+OpfTJsw
   4Brf9aESY4hvuMSKtDncmsGAhGc3GrjleHH49gVV5N+YmSymseQYPkCvX
   rEjR8z+8Dcq93lCIMBbkEdHWrha+Z09NnvxkIR4brl/yR71rZ0j37MUSg
   Q==;
X-CSE-ConnectionGUID: 76rN9p2FQgKV8n0qzwFz3Q==
X-CSE-MsgGUID: rdUuFDGfSTy1/Wg0l955uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48323592"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="48323592"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 03:37:49 -0700
X-CSE-ConnectionGUID: GWxWfPhwRXe2gHswx3a2Pw==
X-CSE-MsgGUID: XCWAf+28TdeIOZ7pUIX3Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136574157"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.251])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 03:37:45 -0700
Date: Tue, 6 May 2025 12:37:34 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Michael Riesch <michael.riesch@wolfvision.net>, Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v6 06/13] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <fx5zweayuzo2vcov7i5d6itlizw4bwmr3wwbd4m6mdjsiou5zb@osl3u2ijv3uj>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-6-d2f5fbee1551@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v6-6-d2f5fbee1551@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_033753_497558_A9A38A2F 
X-CRM114-Status: GOOD (  25.27  )
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

Hi Michael,

Thank you for the patch!

Is it possible to sent the v4l2-compliance output in the next version ?

On Wed, Apr 30, 2025 at 11:15:55AM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@wolfvision.net>
> 

SNIP

> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
> +{
> +	struct device *dev = ctx;
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +	struct rkcif_stream *stream;
> +	u32 intstat, lastline, lastpix, cif_frmst;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (!rkcif->match_data->dvp)
> +		return ret;
> +
> +	intstat = cif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
> +	cif_frmst = cif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
> +	lastline = RKCIF_FETCH_Y(cif_dvp_read(rkcif, RKCIF_DVP_LAST_LINE));
> +	lastpix = RKCIF_FETCH_Y(cif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
> +
> +	if (intstat & RKCIF_INTSTAT_FRAME_END) {
> +		cif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
> +			      RKCIF_INTSTAT_FRAME_END_CLR |
> +				      RKCIF_INTSTAT_LINE_END_CLR);
> +
> +		stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
> +
> +		if (stream->stopping) {
> +			cif_dvp_stop_streaming(stream);
> +			wake_up(&stream->wq_stopped);
> +			return IRQ_HANDLED;
> +		}
> +
> +		if (lastline != stream->pix.height) {
> +			v4l2_err(&rkcif->v4l2_dev,
> +				 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
> +				 intstat, cif_frmst, lastpix, lastline);
> +
> +			cif_dvp_reset_stream(rkcif);
> +		}
> +
> +		rkcif_stream_pingpong(stream);
> +
> +		ret = IRQ_HANDLED;

just return IRQ_HANDLED like above ?

> +	}
> +
> +	return ret;
> +}
> +
> +int rkcif_dvp_register(struct rkcif_device *rkcif)
> +{
> +	struct rkcif_interface *interface;
> +	int ret, i;
> +
> +	if (!rkcif->match_data->dvp)
> +		return 0;
> +
> +	interface = &rkcif->interfaces[RKCIF_DVP];
> +	interface->index = RKCIF_DVP;
> +	interface->type = RKCIF_IF_DVP;
> +	interface->in_fmts = rkcif->match_data->dvp->in_fmts;
> +	interface->in_fmts_num = rkcif->match_data->dvp->in_fmts_num;
> +	interface->set_crop = rkcif_dvp_set_crop;
> +	ret = rkcif_interface_register(rkcif, interface);
> +	if (ret)
> +		return 0;
		|
		+-> Copy-paste error ?

> +
> +	if (rkcif->match_data->dvp->setup)
> +		rkcif->match_data->dvp->setup(rkcif);
> +
> +	interface->streams_num = rkcif->match_data->dvp->has_ids ? 4 : 1;
> +	for (i = 0; i < interface->streams_num; i++) {
> +		struct rkcif_stream *stream = &interface->streams[i];
> +
> +		stream->id = i;
> +		stream->interface = interface;
> +		stream->out_fmts = rkcif->match_data->dvp->out_fmts;
> +		stream->out_fmts_num = rkcif->match_data->dvp->out_fmts_num;
> +		stream->queue_buffer = cif_dvp_queue_buffer;
> +		stream->start_streaming = cif_dvp_start_streaming;
> +		stream->stop_streaming = cif_dvp_stop_streaming;
> +
> +		ret = rkcif_stream_register(rkcif, stream);
> +		if (ret)
> +			goto err_streams_unregister;
> +	}
> +	return 0;
> +
> +err_streams_unregister:
> +	for (; i >= 0; i--)
> +		rkcif_stream_unregister(&interface->streams[i]);
> +	rkcif_interface_unregister(interface);
> +
> +	return ret;
> +}
> +

SNIP

> +static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
> +{
> +	return container_of(vb, struct rkcif_buffer, vb);
> +}
> +
> +static inline struct rkcif_stream *to_rkcif_stream(struct video_device *vdev)
> +{
> +	return container_of(vdev, struct rkcif_stream, vdev);
> +}
> +
> +static struct rkcif_buffer *rkcif_stream_pop_buffer(struct rkcif_stream *stream)
> +{
> +	struct rkcif_buffer *buffer = NULL;
> +	unsigned long lock_flags;
> +
> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);

guard(spinlock_irqsave)(&stream->driver_queue_lock) will simplify this function.

> +
> +	if (list_empty(&stream->driver_queue))
> +		goto err_empty;
> +
> +	buffer = list_first_entry(&stream->driver_queue, struct rkcif_buffer,
> +				  queue);
> +	list_del(&buffer->queue);
> +
> +err_empty:
> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> +	return buffer;
> +}
> +
> +static void rkcif_stream_push_buffer(struct rkcif_stream *stream,
> +				     struct rkcif_buffer *buffer)
> +{
> +	unsigned long lock_flags;
> +
> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
> +	list_add_tail(&buffer->queue, &stream->driver_queue);
> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> +}
> +
> +static inline void rkcif_stream_return_buffer(struct rkcif_buffer *buffer,
> +					      enum vb2_buffer_state state)
> +{
> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> +
> +	vb2_buffer_done(&vb->vb2_buf, state);
> +}
> +
> +static void rkcif_stream_complete_buffer(struct rkcif_stream *stream,
> +					 struct rkcif_buffer *buffer)
> +{
> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> +
> +	vb->vb2_buf.timestamp = ktime_get_ns();
> +	vb->sequence = stream->frame_idx;
> +	vb2_buffer_done(&vb->vb2_buf, VB2_BUF_STATE_DONE);
> +	stream->frame_idx++;
> +}
> +
> +void rkcif_stream_pingpong(struct rkcif_stream *stream)
> +{
> +	struct rkcif_buffer *buffer;
> +
> +	buffer = stream->buffers[stream->frame_phase];
> +	if (!buffer->is_dummy)
> +		rkcif_stream_complete_buffer(stream, buffer);

You can actually keep this frame dropping mechanism without using the
dummy buffer.

You can set a drop flag to TRUE: keep overwriting the buffer you already have
without returning it to user-space until you can get another buffer, set
the flag again to FALSE and resume returning the buffers to user-space.

> +
> +	buffer = rkcif_stream_pop_buffer(stream);
> +	if (buffer) {
> +		stream->buffers[stream->frame_phase] = buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = false;
> +	} else {
> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = true;
> +		dev_warn(stream->rkcif->dev,
> +			 "no buffer available, frame will be dropped\n");

This warning can quickly flood the kernel logs if the user-space is too slow in
enqueuing the buffers.

> +	}
> +
> +	if (stream->queue_buffer)
> +		stream->queue_buffer(stream, stream->frame_phase);

is this if statement really needed ?

> +
> +	stream->frame_phase = 1 - stream->frame_phase;
> +}
> +
> +static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
> +{
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +	int i;
> +
> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[0])
> +		goto err_buff_0;
> +
> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[1])
> +		goto err_buff_1;
> +
> +	if (stream->queue_buffer) {
> +		stream->queue_buffer(stream, 0);
> +		stream->queue_buffer(stream, 1);
> +	}
> +
> +	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
> +	stream->dummy.vaddr =
> +		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> +				&stream->dummy.buffer.buff_addr[0], GFP_KERNEL,
> +				DMA_ATTR_NO_KERNEL_MAPPING);
> +	if (!stream->dummy.vaddr)
> +		goto err_dummy;
> +
> +	for (i = 1; i < pix->num_planes; i++)
> +		stream->dummy.buffer.buff_addr[i] =
> +			stream->dummy.buffer.buff_addr[i - 1] +
> +			pix->plane_fmt[i - 1].bytesperline * pix->height;
> +
> +	return 0;
> +
> +err_dummy:
> +	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
> +	stream->buffers[1] = NULL;
> +
> +err_buff_1:
> +	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
> +	stream->buffers[0] = NULL;
> +err_buff_0:
> +	return -EINVAL;
> +}
> +

SNIP

> +static int rkcif_stream_init_vb2_queue(struct vb2_queue *q,
> +				       struct rkcif_stream *stream)
> +{
> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->drv_priv = stream;
> +	q->ops = &rkcif_stream_vb2_ops;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->buf_struct_size = sizeof(struct rkcif_buffer);
> +	q->min_queued_buffers = CIF_REQ_BUFS_MIN;

If I recall correctly min_queued_buffers should be the strict minimum
number of buffers you need to start streaming. So in this case it should
be 3 = 2 pingpong buffers + 1 dummy buffer.

VIDIOC_REQBUFS will allocate min_queued_buffers + 1 and user-space will
probably allocate even more anyway.

> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->lock = &stream->vlock;
> +	q->dev = stream->rkcif->dev;
> +
> +	return vb2_queue_init(q);
> +}

--
Kind Regards
Mehdi Djait

