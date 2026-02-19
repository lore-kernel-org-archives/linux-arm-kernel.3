Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52BDE9A050
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwRsYZvOzH3HfX1u9fY19r7fFuIvsB23NUu35nMXKKc=; b=WxsC4xkAQcwWhSNvEc0rVGNqmS
	RDHFgYUda3VtfCCychD/VuHFAjwEFnxwoJwi74rub9twLfnXJGnrltdncNwFWSltVj6X6SxL1RRg3
	TVwlM7vTuQlM3f8EVa3sxnc5uCi2Tw93lf/LMan430jvAi8zXUNvcy7MeXC9YHkuve2s6e+VJxjS5
	y7QmVHMT1O4OajPeNIdbWHDQj3Ixnf91ACU3kvbqMmciImhNiHbcB8lcqTueKP0Bs5wiqESlKc9PW
	V+BRSowScbJlqmC7hRadL2LO2axfT9N0ZBTP+l8LxgfA7EV4DeX0mh11IVNEWFZ5m2VssnTHFCfDj
	1Aq125xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7OZ-0000000BfQl-1qoL;
	Thu, 19 Feb 2026 17:00:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7OW-0000000BfPz-46ft;
	Thu, 19 Feb 2026 17:00:54 +0000
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2D10755C;
	Thu, 19 Feb 2026 17:59:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771520396;
	bh=+bJb8RAUEGHe8xLGRMHWSourYuWFNASIziuTwS8aCok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p25jL6qPmnFmkBcyC8A8dXf8xXvrzOWBzsJn4Ux841mXCS0ZyncZ3QnzdQC+gJE8W
	 QLRGk9gON41wwd4iIFLQMWFilucJbxZa86JpDMbIq5NtgkYJAw+SFVIYjR746In9bP
	 0VMMLw97wf0sABn7MygMiSSh5RxYmPTtgQnVWuWQ=
Date: Thu, 19 Feb 2026 18:00:46 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: comply with minimum number
 of buffers requirement
Message-ID: <20260219170046.GA626936@killaraus.ideasonboard.com>
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
 <20260216-rkcif-fixes-v1-2-b16db20b6d68@collabora.com>
 <20260219091301.GF520738@killaraus.ideasonboard.com>
 <d701a97d-6051-4a32-ada6-bf014e385c68@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d701a97d-6051-4a32-ada6-bf014e385c68@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_090053_159180_B5BC9E85 
X-CRM114-Status: GOOD (  26.03  )
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

On Thu, Feb 19, 2026 at 05:19:46PM +0100, Michael Riesch wrote:
> On 2/19/26 10:13, Laurent Pinchart wrote:
> > On Mon, Feb 16, 2026 at 02:49:57PM +0100, Michael Riesch via B4 Relay wrote:
> >> From: Michael Riesch <michael.riesch@collabora.com>
> >>
> >> Each stream requires CIF_REQ_BUFS_MIN=1 buffers to enable streaming.
> >> However, it failed with only one buffer provided.
> >>
> >> Comply with the minimum number of buffers requirement and accept
> >> exactly one buffer.
> >>
> >> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
> >> Cc: stable@kernel.org
> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >> ---
> >>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 41 +++++++++++-----------
> >>  1 file changed, 21 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> >> index e00010a91e8b..5a5ab9e7e86e 100644
> >> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> >> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> >> @@ -106,19 +106,6 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
> >>  {
> >>  	struct v4l2_pix_format_mplane *pix = &stream->pix;
> >>  
> >> -	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> >> -	if (!stream->buffers[0])
> >> -		goto err_buff_0;
> >> -
> >> -	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> >> -	if (!stream->buffers[1])
> >> -		goto err_buff_1;
> >> -
> >> -	if (stream->queue_buffer) {
> >> -		stream->queue_buffer(stream, 0);
> >> -		stream->queue_buffer(stream, 1);
> >> -	}
> >> -
> >>  	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
> >>  	stream->dummy.vaddr =
> >>  		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> >> @@ -132,16 +119,30 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
> >>  			stream->dummy.buffer.buff_addr[i - 1] +
> >>  			pix->plane_fmt[i - 1].bytesperline * pix->height;
> >>  
> >> -	return 0;
> >> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> >> +	if (!stream->buffers[0])
> >> +		goto err_buff_0;
> > 
> > Why do you move this after allocation of the dummy buffer, to then add
> > dma_free_attrs() in the err_buff_0 error path ?
> 
> To keep the two rkcif_stream_pop_buffer calls together. We need to
> allocate the dummy in any case, but in case the second pop fails we use
> it -- this was not the case before.

I suppose it's easier than returning buffers[0] in the dummy buffer
allocate error path. Works for me.

> >> -err_dummy:
> >> -	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
> >> -	stream->buffers[1] = NULL;
> >> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> >> +	if (!stream->buffers[1]) {
> >> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
> >> +		stream->buffers[stream->frame_phase]->is_dummy = true;
> >> +	}
> >> +
> >> +	if (stream->queue_buffer) {
> >> +		stream->queue_buffer(stream, 0);
> >> +		stream->queue_buffer(stream, 1);
> >> +	}
> >> +
> >> +	return 0;
> >>  
> >> -err_buff_1:
> >> -	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
> >> -	stream->buffers[0] = NULL;
> >>  err_buff_0:
> >> +	dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
> >> +		       stream->dummy.vaddr,
> >> +		       stream->dummy.buffer.buff_addr[0],
> >> +		       DMA_ATTR_NO_KERNEL_MAPPING);
> >> +	stream->dummy.vaddr = NULL;
> >> +err_dummy:
> >>  	return -EINVAL;
> > 
> > You can drop the err_dummy label and return -EINVAL directly. Except you
> > should probably return -ENOMEM as the failure comes from
> > dma_alloc_attrs().
> 
> Makes sense, will fix.
> 
> >>  }
> >>  

-- 
Regards,

Laurent Pinchart

