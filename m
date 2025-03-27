Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32477C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 23:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqjSlG7nisHdrXyYdz9Us4ThHd3/fiw0wF9sILQDoDU=; b=AaEbPhUvo8y7Y80gJlbOsqkSNc
	rqvEckNPSfhru6R2J704f1JWMJcAJFRNq3SHMQSKZDr+afxu+XwDXkNHCexDQN04XpDRL5/2TWDRU
	Zr1wvRnte7yPxDmzqYVLyJ7bx0jh2Ho0/xLs9U9PxeC0PyzkZqNCuroZz7/hTXtLle8wHnZB8mskm
	aL1ZxGYrYfdbE3FYGvngi8GBEm4ICCEVZPlJITwGPSuw6BuwFplK+2wrTIl5pxtPUv2M3bLyzVnIg
	oHLKdQfK06uURd9VR+Fj+DP35ZjhCixqU1cFu8ERJoTmdwzMnyEcKMycixMqt922w6eW4iXpqhsv0
	xNfQaGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwKt-0000000CCiH-3IQX;
	Thu, 27 Mar 2025 23:08:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwJA-0000000CCXt-3py5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 23:06:46 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57E5D3DA;
	Fri, 28 Mar 2025 00:04:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743116694;
	bh=Jg0lay9DQTanzPgGVu0GDPUwJJjKFNGOTQpAD6wb1LU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLbtod8/qhWpgj251QPTnmeCPBgmLYhkvNKL3C8DvdM9NmjpjMCJGIDAJCw9AhQnl
	 Nx2RAVQ37idvF4rViSSvA7i3IlltNWvibGwdyJb06oSoXyr41UGNRJcQNiPpmGy18D
	 pNp3d6ht1KaEwOedYgcULuxNsBgppRE5MNDpLCYI=
Date: Fri, 28 Mar 2025 01:06:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
Message-ID: <20250327230619.GF16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-11-322a300c6d72@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-11-322a300c6d72@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_160645_091672_DBFEA530 
X-CRM114-Status: GOOD (  15.26  )
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

Hi Tomi,

Thank you for the patch.

On Wed, Mar 26, 2025 at 03:22:54PM +0200, Tomi Valkeinen wrote:
> Add support for XVUY2101010 format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index ce685dfbf31f..79f58e06f38f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -322,6 +322,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
>  		.swap		= false,
>  		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_XVUY2101010,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,

I'll have to trust your word on this, the documentation is just too
wrong in too many places to trust it. Assuming you've tested this
format,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart

