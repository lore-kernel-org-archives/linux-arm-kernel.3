Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABABD46BEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 18:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1QwpqzMBdUe1Axl/9HP1RrGHUflq6sYNWtXxm3qdKk=; b=GObXmnwq+sb7A1ElXK7o3zF6ok
	oFDLYBQ4VwZNrRa5mOPh4USd9VhiCuFiE3Vc5pmmSW6MuN1+HTPMdAJ3jX525koBVcO3e67B5Hw2z
	7K52jcQbYu5UUCxNO1B7cjNSi6R/JUpSaTgkpvjMXGUJ9fSMPlS1evhHH0I+TXZksVKUScCAX5nns
	fONGj+hLLMAYiekaigwwJ7GC4cMl/WCGySE3hm1D5TnLAqaLKpcw6h3qIGStSS8bk2ntiSTGhOyQN
	IsFwMBLrj1Ix3JiWyFs5c52OIRveT6RgcQ9/pglNj46rba8kinbuvtTR4245hrlWEo1UqHieJPJul
	gJRV4ouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlA0Q-0000000GbLh-40Hx;
	Wed, 28 Jan 2026 18:11:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlA0O-0000000GbJg-3w6c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 18:11:06 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5BD2C581;
	Wed, 28 Jan 2026 19:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769623826;
	bh=EMvDSrhLuJYUdTt6x5YZzNaZ5Ae30vVVs3RJ1+GHQ7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcq7Fqk8tFogFaa1gePWNLDgONDKPHtXc8LhrdeHuIYcKDJ0uGyg6M/PdJ4doFD/W
	 FcXymOgG3nC9wZV5D1agQgOpocVMQARjvte5dR71hBImv/hMGmkAfFV/lTKkcvhkz5
	 XxNvyvFpPV7BQV3PQppY65gm2PoVHzjt4z+VzXiY=
Date: Wed, 28 Jan 2026 20:11:01 +0200
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v8 09/11] drm: xlnx: zynqmp: Add support for Y8 and
 Y10_P32
Message-ID: <20260128181101.GE3225981@killaraus>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
 <20260128-xilinx-formats-v8-9-9ea8adb70269@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128-xilinx-formats-v8-9-9ea8adb70269@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_101105_115397_C3BB7B84 
X-CRM114-Status: GOOD (  18.71  )
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

On Wed, Jan 28, 2026 at 07:25:34PM +0200, Tomi Valkeinen wrote:
> Add support for Y8 and Y10_P32 formats. We also need to add new csc
> matrices for the y-only formats.
> 
> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 1dc77f2e4262..57bb6d1dd10a 100644
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
>  	},
>  };
>  
> @@ -697,6 +707,17 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
>  	0x0, 0x1800, 0x1800
>  };
>  
> +/* In Y-only mode the single Y channel is on the third column  */
> +static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {
> +	0x0, 0x0, 0x1000,
> +	0x0, 0x0, 0x1000,
> +	0x0, 0x0, 0x1000,
> +};
> +
> +static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
> +	0x0, 0x0, 0x0
> +};
> +
>  /**
>   * zynqmp_disp_blend_set_output_format - Set the output format of the blender
>   * @disp: Display controller
> @@ -846,7 +867,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
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

