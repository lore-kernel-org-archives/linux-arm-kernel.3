Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42051CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DChg0VKli/eox/50RDLC0AeEnxituixU6XJ1AwoBK8=; b=MZCy6E6NbcNs77CyDuOZeC1vib
	lIhDMWDwBFhUWLODJdJx2DT6fFhzN7jp/J3Hc95iG9r2zFXuymVTrWhh5YoRll8joZGOBUpG3wwoW
	XBw7wxStsXVkwydgYHqhgumCzi93AXj2tav4kRv6WGs+ZRiI4GprGuxzO1/DFx/OyFWCmIcIyQntd
	MSlMLlUv6KWou+X9ORltA9RnFMWpEaX5COv7KLsbjo4ilmBZsEcmEaMrnNEpgrORH6euiksFqQoEo
	+mYvywu7s5rKK9xIsE4o6rDqrTR43hvl17M5BWLL24R7Y+ChNXpMn5Hcjc1iUO5f9jlwrko5BHF18
	nDTYdDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuEZ-00000003COM-0JWI;
	Thu, 07 May 2026 08:37:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuEW-00000003CNG-1SND
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:37:26 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D9E664;
	Thu,  7 May 2026 10:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778143035;
	bh=yRFEhZivggtsy1WIFd6s2+6wukdiSm1BWUEOTkcdLww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKycNdg59d7OwdoyMEAlp+6nNCTsV+oTKqmePm/AglampNq+MeTusQ8o2Qh2JiLrH
	 iplD8fALtVKRbIXEOsWsS1zi44JawHQy32wTmkRWPyHwqWisAcKlVxnRrRs7J37S1q
	 j7M7LegsLVeuWMI0blp6aZuSObq0z0jTSHTDGpFM=
Date: Thu, 7 May 2026 11:37:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: nxp: imx8-isi: Fix missing
 v4l2_subdev_cleanup() in pipe init error path
Message-ID: <20260507083717.GH1778786@killaraus.ideasonboard.com>
References: <20260507041318.491594-1-xiaolei.wang@windriver.com>
 <20260507041318.491594-4-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507041318.491594-4-xiaolei.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_013724_817673_FE0F1916 
X-CRM114-Status: GOOD (  15.07  )
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

On Thu, May 07, 2026 at 12:13:17PM +0800, Xiaolei Wang wrote:
> After v4l2_subdev_init_finalize() succeeds in mxc_isi_pipe_init(), if
> platform_get_irq() or devm_request_irq() fails, the error path jumps to
> a label that only calls media_entity_cleanup() and mutex_destroy(),
> missing the v4l2_subdev_cleanup() call needed to free the subdev active
> state allocated by v4l2_subdev_init_finalize().
> 
> Add an error_subdev label that calls v4l2_subdev_cleanup() before
> falling through to the existing error cleanup.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index cb50af2270f6..a59b9456b590 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -796,18 +796,20 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
>  	irq = platform_get_irq(to_platform_device(isi->dev), id);
>  	if (irq < 0) {
>  		ret = irq;
> -		goto error;
> +		goto error_subdev;
>  	}
>  
>  	ret = devm_request_irq(isi->dev, irq, mxc_isi_pipe_irq_handler,
>  			       0, dev_name(isi->dev), pipe);
>  	if (ret < 0) {
>  		dev_err(isi->dev, "failed to request IRQ (%d)\n", ret);
> -		goto error;
> +		goto error_subdev;
>  	}
>  
>  	return 0;
>  
> +error_subdev:
> +	v4l2_subdev_cleanup(sd);
>  error:
>  	media_entity_cleanup(&sd->entity);
>  	mutex_destroy(&pipe->lock);

-- 
Regards,

Laurent Pinchart

