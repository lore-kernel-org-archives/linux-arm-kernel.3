Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CFF1091929
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 21:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzMmanfjIA3Vi+ugwenl/HwtE2Ck7ASx/kODBmSH9HI=; b=taFYzejhj8DQGI1Hfb92qt7KiZ
	TcK8knc33Yc1alWzPAZQBdEHEnKzTLa5WVypt8ykHnp4Ai9odBPK81am62r0LWXi8ZmQH5vx6PUf6
	CbCgm9O5Z2BfzPUeae4LwZg9eAVDvFTbzX3gsp3OOSS18irZoSU8nvwbqMhXiQgTf5/gXbWTN/3pU
	qJeML6gSsA18/hG7bv+IQ+LsHiRbfEeqCFnqnV0pPhmV3f1DCX9JMHa4j4e8r5j4oZEFh1dNe8M43
	FTO3wIQUyqgo6Ixi1CqB9xOYFBn/Y8gcMJ7LXCFr0WEUmKvZkDeiJzsvIwm9b+7byKgnbJElPcWks
	il4fe2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LOp-0000000Bc0A-3ppB;
	Thu, 19 Mar 2026 21:59:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LOn-0000000Bbzp-0U2h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 21:59:26 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 74D46838;
	Thu, 19 Mar 2026 22:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773957489;
	bh=aC0FGWPPla4uf7rNFOUmz6zWZ0rXHirwJjooLiRgQ7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obuvIyhkR0pIYx2XtVAcWsfn/dLXstgLlMwkLvZaKkdXaUb8ZnZLmZHN5F+GNL45R
	 8TcnOwEkgR0E+33XoDdrx2XINH9i1+GQNMY70QxlIYECP3W5Bg8uziNzR/OO2hNNvu
	 /9wCKqtvupxHZB6l26TnCMWJ04PfilA6Qct330m4=
Date: Thu, 19 Mar 2026 23:59:21 +0200
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
Subject: Re: [PATCH v2 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Message-ID: <20260319215921.GC950375@killaraus.ideasonboard.com>
References: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
 <20260312-isi_min_buffers-v2-2-d5ea1c79ad81@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-isi_min_buffers-v2-2-d5ea1c79ad81@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_145925_296645_2569EF95 
X-CRM114-Status: GOOD (  20.42  )
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

Hi Guoniu,

Thank you for the patch.

On Thu, Mar 12, 2026 at 11:12:35AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Change the buffer selection logic to use pending buffers first (up to the
> number available), and only use discard buffers to fill remaining slots
> when insufficient pending buffers are queued. Ensure user buffers are
> utilized as soon as possible, improving efficiency and reducing the number
> of discarded frames at stream start.

The commit message should explain *why* the change is good. How does
this improve the behaviour ?

I'll queue 1/2 in my tree already.

> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - Replace "This ensures" with "ensure"
> - Put example from commit message to comment in driver suggested by Frank
>   https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#m2774912ed31553ef1fdcc840bd6eae53a03ecccd
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 1be3a728f32f89338a75ddcc4e96e7501ed954e1..77ebff03323ace50ff039c8333d25a9c3dd44880 100644
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
> 

-- 
Regards,

Laurent Pinchart

