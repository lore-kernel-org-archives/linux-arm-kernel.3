Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15B0C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 22:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFW+fheQRqhJgUnjb6b3XmpXwLi7fBGMrB/KUQTUDC0=; b=XCij3n+XIhdI6e3xMXzfJqlj0C
	sguHRTo2HZE81nSWbWXWoc1Rk+PRG6vhtAR8ORelQcALlWuNCFoeksqqfKzRptJh+liNIcUIcO4MA
	nNe32cVSKoM9/yx9xyES63Igx8o+ELqH39lnnl/zsUKEH09YHl2Gp73tHVc+i1amA4xPBoUHzsJFe
	OMt4LT5D5OJJxTHIH2rZNY6iinKF8k8/wguwUjdtyiGkAyl6b4JKUX8TbPeBWlOUQayfgzi5ZIwdI
	zHn26jsKe3eYHdAvjsuwmNGCRR4Z7ITyO6lFMMewFZzt/TVXIRR4vCXeQMVDlb9eeohiOfcZv059k
	Pn7CUSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txw7E-0000000CBQb-1oBz;
	Thu, 27 Mar 2025 22:54:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txw5U-0000000CBBv-0vaV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 22:52:37 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC509446;
	Thu, 27 Mar 2025 23:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743115845;
	bh=04MuPzuXvPrWYZpyfrG/qxOsUxH6sKfHzhd+lnURa04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8Qs+4qJ/w31JqrublP+vX9igLskTPOvYYYH0hRLBZiGDKCJFOScz1C6gSOSiEaeQ
	 JOb9I7pHgSh1vhwWW+WQnWmJceRYCLwc3QPg+Fz9PYQs+SRrQ+E2PE9Kx5OqAM+U/3
	 kdeWvISioZ3MswcRgNteAYnwdB50LOgAJD3v5rCs=
Date: Fri, 28 Mar 2025 00:52:09 +0200
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
Subject: Re: [PATCH v4 09/11] drm: xlnx: zynqmp: Add support for Y8 and
 Y10_P32
Message-ID: <20250327225209.GB16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-9-322a300c6d72@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-9-322a300c6d72@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_155236_403651_FB937E50 
X-CRM114-Status: GOOD (  23.77  )
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

On Wed, Mar 26, 2025 at 03:22:52PM +0200, Tomi Valkeinen wrote:
> Add support for Y8 and Y10_P32 formats. We also need to add new csc
> matrices for the y-only formats.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 1dc77f2e4262..ae8b4073edf6 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -307,6 +307,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
>  		.swap		= false,
>  		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_Y8,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO,
> +		.swap		= false,
> +		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_Y10_P32,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,

Assuming the DRM format definitions get approved, this looks good to me.

>  	},
>  };
>  
> @@ -697,6 +707,16 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
>  	0x0, 0x1800, 0x1800
>  };
>  
> +static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {

TODO: Add support for colorspaces to the driver.

> +	0x0, 0x0, 0x1000,
> +	0x0, 0x0, 0x1000,
> +	0x0, 0x0, 0x1000,

This surprises me a bit, I was expecting 0x1000 to be in the first
column. What am I missing ?

> +};
> +
> +static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
> +	0x1800, 0x1800, 0x0

Why do you need offsets ? Those values correspond to -128 in a 8-bit
range, and that's what would need to be applied to the chroma values.
There's no chroma here. I think you could use csc_zero_offsets.

> +};
> +
>  /**
>   * zynqmp_disp_blend_set_output_format - Set the output format of the blender
>   * @disp: Display controller
> @@ -846,7 +866,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
>  				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
>  				val);
>  
> -	if (layer->drm_fmt->is_yuv) {
> +	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
> +	    layer->drm_fmt->format == DRM_FORMAT_Y10_P32) {
> +		coeffs = csc_sdtv_to_rgb_yonly_matrix;
> +		offsets = csc_sdtv_to_rgb_yonly_offsets;
> +	} else if (layer->drm_fmt->is_yuv) {
>  		coeffs = csc_sdtv_to_rgb_matrix;
>  		offsets = csc_sdtv_to_rgb_offsets;
>  	} else {

-- 
Regards,

Laurent Pinchart

