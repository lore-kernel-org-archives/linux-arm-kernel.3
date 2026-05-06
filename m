Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B4DCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5qTjZViI7TL0vgPhGeTAhQHwqIINfxGZsF91jkvQu4=; b=Y8fatni3rqUlZPtrR9LmgJUW7Z
	rjBvq16XCBZknKg/unWbDjIqsGGUCj8eqWYAlW+LEZBBJh8qSiKKXL+rEWILTaViU/Q9gg0g0Q60z
	9pN0wtSwbG1goQ1oIfDoBvPCWIU9xp/KnrpoysQ6XItEzI9wBMK938aKBE3gfrzryNvIZzQxY08os
	1JjS8TQPXEHpEhBDl4rTOLR6GW0mjtQWyxYBzvwKuc+BPj8QS6QPz2DA/rC3fW3z78Zk2d5A4yKLQ
	u4zmF4DZNn+R+iqKbpQDnMaFNsiRk/lYVimPE8Go9M7vtfkTs8kYtx72blCPK8/5ZX+DsUuKKvXd6
	jDu65TMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbTe-00000000mJE-3KdQ;
	Wed, 06 May 2026 12:35:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbTc-00000000mIj-2LK2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:35:44 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A77FF63D;
	Wed,  6 May 2026 14:35:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778070939;
	bh=nbw46mxLLQX1LlFnsr2gxQX1L3Mtv1grDLT66heuhpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSZKOwRat5PndRjUnnfnEKJEvP9O19dowtGuzE5GMrN34ox9azsLXJYNV/FhaF/ZU
	 WYrRj2P4GZDbmVjLb+QcGoSX9fSZ939fZ94KGLY5jpnk02BVs8H7eTmY3FVWVD51YL
	 TggPQITr2mL9ELrDSzic3LMV4mMHn2cm10mUYioA=
Date: Wed, 6 May 2026 15:35:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: imx8-isi: add missing
 v4l2_subdev_cleanup() in crossbar and pipe
Message-ID: <20260506123541.GO1598374@killaraus.ideasonboard.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-3-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506031210.2769998-3-xiaolei.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_053544_737597_B08E1B78 
X-CRM114-Status: GOOD (  17.15  )
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

Hello Xiaolei,

Thank you for the patch.

On Wed, May 06, 2026 at 11:12:08AM +0800, Xiaolei Wang wrote:
> Both mxc_isi_crossbar_init() and mxc_isi_pipe_init() call
> v4l2_subdev_init_finalize() which allocates the subdev active state,
> but neither mxc_isi_crossbar_cleanup() nor mxc_isi_pipe_cleanup()
> calls v4l2_subdev_cleanup() to free it.
> 
> This causes a memory leak on every rmmod, reported by kmemleak:
> 
>   unreferenced object 0xffff0000d06fc800 (size 192):
>     comm "(udev-worker)", pid 254, jiffies 4294913455
>     backtrace (crc 36eeae58):
>       kmemleak_alloc+0x34/0x40
>       __kvmalloc_node_noprof+0x5f8/0x7d8
>       __v4l2_subdev_state_alloc+0x1fc/0x30c
>       __v4l2_subdev_init_finalize+0x178/0x368
> 
> Add the missing v4l2_subdev_cleanup() calls before media_entity_cleanup()
> in both crossbar and pipe cleanup paths.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 605a45124103..c580c831972e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -491,6 +491,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>  
>  void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar)
>  {
> +	v4l2_subdev_cleanup(&xbar->sd);
>  	media_entity_cleanup(&xbar->sd.entity);
>  	kfree(xbar->pads);
>  	kfree(xbar->inputs);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0..cb50af2270f6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -819,6 +819,7 @@ void mxc_isi_pipe_cleanup(struct mxc_isi_pipe *pipe)
>  {
>  	struct v4l2_subdev *sd = &pipe->sd;
>  
> +	v4l2_subdev_cleanup(sd);

v4l2_subdev_cleanup() should also be called in some of the error paths
of mxc_isi_pipe_init(). This can be done in a separate patch, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	media_entity_cleanup(&sd->entity);
>  	mutex_destroy(&pipe->lock);
>  }

-- 
Regards,

Laurent Pinchart

