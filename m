Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D70CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0quufEInlABpdVcvvsDlGHvmEqIabCr9Dahyi+YU+ec=; b=Hou/4zR5KHR9rYgcNvQ8Rt5N4G
	PlieiJ6KddTMpFz6o74QgbcLlEaYFTRUEwJ++KCgPbPz5e5oI6ySWMEI6P6JrgZeXEtafbLLJFKVr
	mL/35UFFeA7oPXBTUDY7xroly2M+C1ceKYGEQBeD7tpr9wkOXf76+uFo8m6NcfCjoHU5NENrmGOkB
	RMc7x+jdG3bWVrlgqFGFlAPw2vrYGW7vs+r1KQQp7c7FAMmqgriHvkw40jTz3kwh+vYBYkx7TdQMr
	tnil6+k9jjj2BCul+j1o6gFioAFGq3Eyh/swWLHN0ZXPM4lBEqlIQk38WzAmhLkKC+uzn0d++qmty
	ykhhDxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkRH-00000005GZt-2YIT;
	Wed, 20 May 2026 17:10:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkRE-00000005GYf-1kRd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:10:33 +0000
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29D0D268;
	Wed, 20 May 2026 19:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779297014;
	bh=Ux2/DNLRQw+2bH/LJDABLvpu83efmamdHvelP0BNLT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+EPK18PqAyn+a1IdG5GQP1/1eIS9XEPMKayB1kaCnkF2KXTqtUzHcN4BYQACnrGy
	 o96ljeOFjwuWV9B1xcX9BKehDIn0HtsyCwXC5ECpw4jjYzykrN+0Hy4HzXjEyt8GqL
	 XqebMzbA/bwuPLiuNCisCF3GKI3BRP3hDe9uCVHI=
Date: Wed, 20 May 2026 19:10:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexi Birlinger <alexi.birlinger@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Message-ID: <20260520171026.GA10336@killaraus.ideasonboard.com>
References: <20260320-isi_min_buffers-v3-0-66e0fabccca3@oss.nxp.com>
 <20260320-isi_min_buffers-v3-2-66e0fabccca3@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320-isi_min_buffers-v3-2-66e0fabccca3@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_101032_603599_A34BB05A 
X-CRM114-Status: GOOD (  25.09  )
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

Hello Guoniu,

Thank you for the patch.

On Fri, Mar 20, 2026 at 02:42:02PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The number of times to use the discard buffer is determined by the
> out_pending list size:
> 
>   discard = list_empty(&video->out_pending) ? 2
>             : list_is_singular(&video->out_pending) ? 1
> 	    : 0;
> 
> In the current buffer selection logic, when both discard and pending
> buffers are available, the driver fills hardware slots with discard
> buffers first which results in an unnecessary frame drop even though
> a user buffer was queued and ready.
> 
> Change the buffer selection logic to use pending buffers first (up to
> the number available), and only use discard buffers to fill remaining
> slots when insufficient pending buffers are queued.
> 
> This improves behavior by:
> - Reducing discarded frames at stream start when user buffers are ready
> - Decreasing latency in delivering captured frames to user-space
> - Ensuring user buffers are utilized as soon as they are queued
> - Improving overall buffer utilization efficiency

There's a bit of repeat here, but that's OK.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v3:
> - Expanded commit message to explain the problem in current driver and the
>   benefits gained from this change
> - No code changes
> 
> Changes in v2:
> - Replace "This ensures" with "ensure"
> - Put example from commit message to comment in driver suggested by Frank
>   https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#m2774912ed31553ef1fdcc840bd6eae53a03ecccd
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 1be3a728f32f..77ebff03323a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -792,7 +792,14 @@ static void mxc_isi_video_queue_first_buffers(struct mxc_isi_video *video)
>  		struct mxc_isi_buffer *buf;
>  		struct list_head *list;
>  
> -		list = i < discard ? &video->out_discard : &video->out_pending;
> +		/*
> +		 * Queue buffers: prioritize pending buffers, then discard buffers
> +		 * For example:
> +		 * - 2 pending buffers: both slots use pending buffers
> +		 * - 1 pending buffer: first slot uses pending, second uses discard
> +		 * - 0 pending buffers: both slots use discard buffers
> +		 */
> +		list = (i < 2 - discard) ? &video->out_pending : &video->out_discard;
>  		buf = list_first_entry(list, struct mxc_isi_buffer, list);
>  
>  		mxc_isi_channel_set_outbuf(video->pipe, buf->dma_addrs, buf_id);

-- 
Regards,

Laurent Pinchart

