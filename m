Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7453DC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 20:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpqEL8DpAJMrJ/rNxfQI3uKIUT/9KC6tNWKUzxHa+5g=; b=tduwfzTBOwWZekGJet+amFz3VM
	Iq5adO6ovS9aAHfcDMW0ONU1g22JJMBbjstOVnKh33+sqaMVsYlhms1vQj+ruNATDYomklW5AcH+7
	8XsZjXv44szVvbg/k0AkcowrlBm0ppTKQXf3bmC9R8lXfnEPtgNCd130p1dRS8xU6EzIxKrU1tJwy
	H3he3msqIeDEJhBZ4qwNS5t9y8vrAsFsAM6m5JihnU1nbs8J+PnRYgSYCebfrMPtZNfA/lFpO3dlq
	O5chasapWjKJIPlmELkGbDAbjQzJPrbi7hYOHhmWuLGfcrciVzf6UeEOMR4FrM58fOzzvEvl1hWbZ
	X/ddKxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7hq-00000005tL3-0FvQ;
	Mon, 17 Feb 2025 20:27:06 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7I2-00000005p9L-17rN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 20:00:27 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5461f2ca386so1359721e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 12:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739822424; x=1740427224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpqEL8DpAJMrJ/rNxfQI3uKIUT/9KC6tNWKUzxHa+5g=;
        b=Udnposr15Qd01FTKRkFxKZp6IXquDP2XG3ktHcnD6RD37mLdm2kaZHl/hHgSwwCczP
         GtUnYFM4iZkRyMno2vf4dA8As7c57P6qS3p9Ndcif/LIdk1ivIkhLOm0h/dq/0SdVQ06
         jJl9UicoMzWiv6DlbjkiHRyzD4YXDIZCGBDqBqsJU1QnnsWKBM8HVWbiGXMQOkIehbrh
         0ITrJhAmQbaJyjhRSuysArY80SkY3VT+zdI7r00o14VbEgtOorhW7dw6qFRSZ8t/+aUS
         lRqoJ7CIkVcgsWTDxhi7dDsIKN74ddaKEoE7Grmx+ZP/2/meS/bYvLEPM7FeWZ/ZCvB7
         Jy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739822424; x=1740427224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpqEL8DpAJMrJ/rNxfQI3uKIUT/9KC6tNWKUzxHa+5g=;
        b=rT7TNMczuEwFdWW7ntcu6TY9ubHIpGwjRP0e957YT07bCnR1QthobcwJulu2r8gGpw
         bhMrii78EDNMt8Bzpb0M4zSZxuTgpqRFajwJc7XTVq/shecNdedpTjqbYpRdhSeXxIBW
         CqkOSpzeO+cXfi2ombRKNL+QyjFB8s78X8524QBlADdfdwJvIXAdLUV/NJA1KyyvlBRM
         x1tNNWWXhuSyK+HPimq8ug61Q4drEjJfL72SaqMrC46QTybKKHD3uJLlikgLGEqMFP/Z
         MzFswcja5rYJ28/wNVn3apoynyxFikAqzecC/03tOikAQ5yn/4qGsCsNYSMh/nqSjXxu
         WvIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqmTYt3WsnCL8GzqHSxm+pDUDHA6xHMR4wQ4SWFnZV9m+/ohSj13fWuk097RWzEo7rl5/HIdLH7ihD4dHmFo1P@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe7gxDiiJbcc9R+N179+QxSkAbl85lix5Mp76XtrXrS7dPjgty
	yZtACfvnmyNqMlRt5pE99tsyCHLCrDO/S6G1S76LZ2OjGVsG8R+OMSY71BqkxBo=
X-Gm-Gg: ASbGncvFS3non98MOxkM1CF1qCUruyoGk2VqH4V72WWCxredoEjgPYF+AfXxGdOzgkm
	6TLNiF0Fi6NlvPCktUew20w2vR/kGLfmgmtQ/BFbwyIPNRBS/i1Q2qNDpS/isDXWA7ssBg/gsF/
	7nnHoH2exdpoH8E7PFL9Cgd4yf2YPvgY5YX6l1DzZZpTfgTmLiNbVc6TtltevYF08e7Pxf1bmCA
	aCUmMwLSuVREAbIDUT5jOxBvJs5LX84fEhM6LUDJsHLgcdodMCfZ+8BCzSr2vqZZIm6X2+Iw+5D
	FMfrJ4wDxB0DkMUGJVBdg1ouWJ65/pOtsWkdKjWwj2CbuHDZM3UK0f+MgOkdlUWp7LA+oxU=
X-Google-Smtp-Source: AGHT+IHfYFHYucbMv9ssVZrygfyI/KAzMXlRnYVSK6/tZCdLiSCDTSlyjiu2Y9vqwm/0Wc+nrvZGmQ==
X-Received: by 2002:a05:6512:2398:b0:545:2c86:17e6 with SMTP id 2adb3069b0e04-5452fe2f270mr3457419e87.5.1739822424412;
        Mon, 17 Feb 2025 12:00:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54525784de2sm1436453e87.109.2025.02.17.12.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 12:00:23 -0800 (PST)
Date: Mon, 17 Feb 2025 22:00:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, 
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
Message-ID: <e5ujn5lhj5vuvkbavoc3oppt3cpxnr7mm2vwh6liojmpxkfy2d@grpmckvbl5h4>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-2-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-2-90d0fe106995@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_120026_308285_F3918F70 
X-CRM114-Status: GOOD (  20.61  )
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

On Wed, Feb 12, 2025 at 04:56:06PM +0200, Tomi Valkeinen wrote:
> Add two new pixel formats:
> 
> DRM_FORMAT_XV15 ("XV15")
> DRM_FORMAT_XV20 ("XV20")
> 
> The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
> subsampled whereas XV20 is 2x1 subsampled.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 8 ++++++++
>  include/uapi/drm/drm_fourcc.h | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 1e9afbf6ef99..bb0a2294573b 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -346,6 +346,14 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
>  		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
>  		  .hsub = 2, .vsub = 2, .is_yuv = true},
> +		{ .format = DRM_FORMAT_XV15,		.depth = 0,
> +		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
> +		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
> +		  .vsub = 2, .is_yuv = true },
> +		{ .format = DRM_FORMAT_XV20,		.depth = 0,
> +		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
> +		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
> +		  .vsub = 1, .is_yuv = true },

It might be beneficial to use the same formatting as previous entries,
it simplifies reviewing. If the patchset is resent, it would be nice to
get that fixed..

However the patch looks correct, so


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index e41a3cec6a9e..ead756a71825 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -304,6 +304,14 @@ extern "C" {
>  #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
>  #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
>  
> +/*
> + * 2 plane 10 bit per component YCrCb
> + * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
> + * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian
> + */
> +#define DRM_FORMAT_XV15		fourcc_code('X', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane 2:10:10:10 */
> +#define DRM_FORMAT_XV20		fourcc_code('X', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane 2:10:10:10 */
> +
>  /*
>   * 2 plane YCbCr
>   * index 0 = Y plane, [7:0] Y
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

