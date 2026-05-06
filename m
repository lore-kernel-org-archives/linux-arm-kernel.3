Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD6CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPAHJXbw3H0Z6Fr7JDsTRJvACNq8fiNkjU5P+lZp9AQ=; b=DHuuPntpnKnx82GKYqtscswNxo
	3sLq/hXChq/1Z458+Cz+rmxdu/lF3stIJtM0ALQiRE9P4Bi/gKhNYK5h9mAhTdlsB/8N65fdipuV1
	UsFgUkvUHtXr68n4XH01EjyC7NLSB+fbBFeVXehJ1Gzf3Z6cPf0keUUmWzvtJR6c0ZOZJCMLu5TYH
	s517weoYDjq/ACDMpiPQ0sMGcsqzY+ijJQK1GZMtKs7X3q/R+76e+2+GdceNZZEBLROdeR0aaViXt
	0mghSoX947QXGtd7BK1iyJVX7cBdFmQD188NleVOsC7LFLlbqYobrauOi9qrP08cml6QUoBOwgb2L
	MCjjVpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbPy-00000000lrM-1DGb;
	Wed, 06 May 2026 12:31:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbPw-00000000lqn-1ibb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:31:56 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F0D763D;
	Wed,  6 May 2026 14:31:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778070710;
	bh=KZrtDt/6j/qhsaVg4cuWkGmW5irl6jJerSBpBcqY1fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vv96Wrda6sp2mnhCJRY1/Mxfk52pN5rDgKQyP7MGJZ/3cjoDkvwhYTjpg0A/pjHAQ
	 znSUflykD0W1adFenMpb8ZSiY1FA98sy9xyIvb2L81DO31Fs95SHSX0WS76VPzhVkn
	 oYGvQqRfZj2D+QD3BSp3MXzr+TqlglZIJAy9dpsI=
Date: Wed, 6 May 2026 15:31:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: imx8-isi: fix use-after-free on remove
Message-ID: <20260506123152.GN1598374@killaraus.ideasonboard.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-2-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506031210.2769998-2-xiaolei.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_053156_593418_C4653D4B 
X-CRM114-Status: GOOD (  19.65  )
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

On Wed, May 06, 2026 at 11:12:07AM +0800, Xiaolei Wang wrote:
> KASAN reports a slab-use-after-free in __media_entity_remove_link()
> during rmmod of imx8_isi:
> 
>   BUG: KASAN: slab-use-after-free in __media_entity_remove_link+0x608/0x650
>   Read of size 2 at addr ffff0000d47cb02a by task rmmod/724
> 
>   Call trace:
>    __media_entity_remove_link+0x608/0x650
>    __media_entity_remove_links+0x78/0x144
>    __media_device_unregister_entity+0x150/0x280
>    media_device_unregister_entity+0x48/0x68
>    v4l2_device_unregister_subdev+0x158/0x300
>    v4l2_async_unbind_subdev_one+0x22c/0x358
>    v4l2_async_nf_unbind_all_subdevs+0xfc/0x1c0
>    v4l2_async_nf_unregister+0x5c/0x14c
>    mxc_isi_remove+0x124/0x2a0 [imx8_isi]
> 
>   Allocated by task 249:
>    __kmalloc_noprof+0x27c/0x690
>    mxc_isi_crossbar_init+0x22c/0x560 [imx8_isi]
> 
>   Freed by task 724:
>    kfree+0x1e4/0x5b0
>    mxc_isi_crossbar_cleanup+0x34/0x80 [imx8_isi]
>    mxc_isi_remove+0x11c/0x2a0 [imx8_isi]
> 
> The problem is that mxc_isi_remove() calls mxc_isi_crossbar_cleanup()
> before mxc_isi_v4l2_cleanup(). The crossbar cleanup frees the media
> entity pads, but the subsequent v4l2 cleanup still tries to remove
> media links that reference those pads.
> 
> Fix this by calling mxc_isi_v4l2_cleanup() before
> mxc_isi_crossbar_cleanup() to ensure all media entities are properly
> unregistered while the pads are still valid.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 4bf8570e1b9e..2d639b789910 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -556,8 +556,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  		mxc_isi_pipe_cleanup(pipe);
>  	}
>  
> -	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  	mxc_isi_v4l2_cleanup(isi);
> +	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  }
>  
>  static const struct of_device_id mxc_isi_of_match[] = {

-- 
Regards,

Laurent Pinchart

