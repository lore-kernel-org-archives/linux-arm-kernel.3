Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D310C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkEDAUTBCrsUQhu/V8Ts10sSIe5JXbmvZ+4elQfTjpc=; b=uY6fPd2WReTnShafOaFVNghMJJ
	vAs33wuAV9zcrISpRAERNDu7HS8t7S8xMbHc4u0dPeEh6hBdquug4foBrZdXexJaG6zPBgV5Av4sd
	qbf50HjgkKPYwZPIqtTamel5vgJDte1MkH4p0j8ptec8LIdiqh1TzzqnerYrtCvlocGxGkku0gkAl
	H8hceHqlT5M1TXO+VPTWorYAz1BZSysF5jJZY2IQKPXzEfpILJYzG9W10dPk4SefoRUJ4ex1KpkgC
	2BIyUMYThJhKBb4AAi/FfCGHjlFMgk7NRzH9UQvsNFPLVI3Dm6uBSRs85WgG3TfXe3HkXcv2Qpr7V
	nVxeEzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tposX-00000008CbD-2XxU;
	Wed, 05 Mar 2025 13:33:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnCN-00000007uGR-188h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:46:04 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2F2AE29;
	Wed,  5 Mar 2025 12:44:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741175066;
	bh=jCVOIod30h+lSwy9042pHFbMu1wURiEi3CLiAWIdzso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oG8/ow7KkH6H1uRTwoivo5xbUq03NDT+NBNNM3Mc6A2YkLNDpok33KvlY2+ntLWDq
	 plMAKZkZkjChJCOvbf/Wcb1quxRk9J6pv3+lcA4G4z/DpiXdEsCCuxQK10v/3c4viy
	 zINGWp624SCuaDNYJu3P6GH2HPibXgQLVKv9AbPc=
Date: Wed, 5 Mar 2025 13:45:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gost.dev@samsung.com
Subject: Re: [PATCH] media: imx-mipi-csis: Fix v4l2 mbus frame descriptor type
Message-ID: <20250305114536.GB31618@pendragon.ideasonboard.com>
References: <CGME20250305060259epcas5p20c02f4c4b4ff84b0f790b4ea446056e6@epcas5p2.samsung.com>
 <20250305055655.6622-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250305055655.6622-1-inbaraj.e@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_034603_449887_2919B120 
X-CRM114-Status: GOOD (  17.11  )
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

Hi Inbaraj,

Thank you for the patch.

On Wed, Mar 05, 2025 at 11:26:55AM +0530, Inbaraj E wrote:
> For MIPI CSI2 v4l2 mbus frame descriptor type should be set to
> V4L2_MBUS_FRAME_DESC_TYPE_CSI2. Now frame descriptor type is set to
> V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL. So changing the frame descriptor
> type to V4L2_MBUS_FRAME_DESC_TYPE_CSI2.

The frame descriptor describes the bus on the *output* of the CSIS.
That's not CSI-2 anymore, but a parallel bus.

Is this patch fixing an actual issue ?

> Fixes: d200de90de2a0 ("media: imx: imx-mipi-csis: Implement the .get_frame_desc() operation")
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 29523bb84d95..bb6550bed230 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1137,7 +1137,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  	if (!csis_fmt)
>  		return -EPIPE;
>  
> -	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>  	fd->num_entries = 1;
>  
>  	entry->flags = 0;

-- 
Regards,

Laurent Pinchart

