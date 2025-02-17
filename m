Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCE6C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 20:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRkHg5Ucp6RGHWusT3IEAggViQD31EKhbXy2GP0vglI=; b=Zzz/z5xj6KsqxLDxmtEsmiTUr6
	HajNmK7+K5MiVZLpr4R8pkg9YqxidiAbu2wV3jnBOm2e0miYEt4voJHdVTy8X2QYkij9VXPbBLpmy
	zdBd0FrRvlk5+i2t6yQxhwEEBGHe/tofJ0G/zWyGFTbj+F6mEUE4iCFquHaVItFPJN8qubr6UKrOh
	s1w3WKYZWF9bAuoFeq6ZJ0u2LiZ5UGp4YVxRUYRrsEedqTbtgpkPNqc9gw+dMKIlcnjZqnxGrKd/H
	YyVmPXu/rexURvV02pg7q+Qd5SQktUHuFrBNJQdVCpFq6ZSfZloPXzgqPK0gWu+ezRjnYORhdRpm3
	/8/UZD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7ki-00000005tng-1Wd3;
	Mon, 17 Feb 2025 20:30:04 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7Wb-00000005rS2-0Sg5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 20:15:30 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5439e331cceso5640047e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 12:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739823327; x=1740428127; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRkHg5Ucp6RGHWusT3IEAggViQD31EKhbXy2GP0vglI=;
        b=z82facSg6OMGRGxg8oWVnbISKVTZ7grRjpKfWm8bb7/UxJ77CLGjkkeqQSJo3Brhbb
         dFwFUixnkbCkIkkZ4DRna1ueY67Xi2dbZssodG/K7eAzDMcORhjTjyLdxeMQS3WgDGJI
         A/VjEKXWaVPjV/WA10m4BtywZK/NYSVtMfHxq7lUr5nHWPXhLHlM7HG+I+is5QHKyIML
         TZwB1W5KZ0La77YsVwWcZP6uxcczhf9/SAVxKeibELefbgSa6CyBQYowptHzUERP+Iaq
         JQB00vyXWJRz+zVEzsPbLjt/ZqKUjVMREA/7bgQ5/PJk6XHfVqdIulWV31PjUq9JLhdo
         gKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739823327; x=1740428127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRkHg5Ucp6RGHWusT3IEAggViQD31EKhbXy2GP0vglI=;
        b=VNMJ+Ef43zqMn0O9YpExOF0PtwuV+IK3o0Jjm1woJEW7mORTwJf9OhYtkGkbO7CeyH
         coCrBlrlQzGYE1g+nt40HA32PBb1MqKxAFPfzkb1ptvZVmsQJOumpNE2ZPleQrWRVtHy
         iRpUzyTUlmTPOHpDr3MSH1ijqOi8Kn+JZDItDufZGB1a3VfKNa8Yn78896NSlatqQLgG
         FAUcivL31bmMxNGs5q5Sexk0BcWrHOUbsa70ZYQiit+AIT5LvRMb0/Z7tzr4qFUZ7zsb
         Ugx8+NGyPFBkePdOowfoOtD/SObJtEppWG9v5U8//Pp+RDnuJyxSP4kawItK2XySytAM
         gQUw==
X-Forwarded-Encrypted: i=1; AJvYcCVMI/tU2NZf8MywJxsRl9UhXqEmmvgKwLy3pRc2lygQPWAA0Kl/hruJxV6POvQf+5ww9you3oiOemw5mNPAj+v5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeeq8aKSDM53KOi8pv51j4eC/YAwxHLlLkKa8r2V1KVNJtMAVE
	pH6NTecgy0V2hstjmclKAoZk+9ODg9pPRaChNRayFiaOzNP64Oh1yYT+QOGaH7o=
X-Gm-Gg: ASbGncstGpK4U0/5qgzRFrJY+R2UtGtVr0YXkLUrzHA889YBzqzRsipn4S5QGvumGo1
	aUwAb6FHtAQ2eH5Po1jL7XYVwvMLMDy8PeffIE9zrDaDtrEYB+z07fJfo0wDbfsyzxwpVCBsMCv
	sVGpJ2FXdUALI0vWxFYy4Q175DXOCqYNE3Td+I2+QuRUPdPKI+BCQmKef/5VCgnDZs7ZIC4Yhve
	1AFwi34b4b4x9eAZhFBi0fQc4lKs1jDm6/q6WDC8MStB5Za3axqSe19Anyv+1VEeKS37vdAPb4S
	XtE1UctshRpUzgWxuo9V9Bh10BNZv65VdKmMtjDc8EbF/VNgDe3YD7V4GpXcbr9/hpsLRJ8=
X-Google-Smtp-Source: AGHT+IHN4TQQDcSOwXKpfuPORhrxQ9cJeq7yFtgX9iUm7RPvnEU4xWfa1ad7OdRTHhcIA1rKUqRDiA==
X-Received: by 2002:a05:6512:3ba9:b0:545:1233:d4f9 with SMTP id 2adb3069b0e04-5452fe66b4fmr2845657e87.30.1739823327250;
        Mon, 17 Feb 2025 12:15:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54620544eacsm565555e87.136.2025.02.17.12.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 12:15:25 -0800 (PST)
Date: Mon, 17 Feb 2025 22:15:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, 
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Message-ID: <bdpw2g65uor77tijlhpabodog7haqvdcemnr3wzqkooerzuib5@hfdn5zsrbkgg>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_121529_150764_869943A6 
X-CRM114-Status: GOOD (  18.29  )
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

On Wed, Feb 12, 2025 at 04:56:10PM +0200, Tomi Valkeinen wrote:
> Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
> container.

Is there a more common name for this format? Otherwise googling for it
reveals only your series.

> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 1 +
>  include/uapi/drm/drm_fourcc.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index cc7e1ef4ef21..07b03b0fe9ad 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -280,6 +280,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_VYUY,		.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_XYUV8888,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_VUY888,          .depth = 0,  .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_XVUY2101010,     .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_AYUV,		.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true, .is_yuv = true },
>  		{ .format = DRM_FORMAT_Y210,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_Y212,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index f936cac2aebc..7e8aa3bd52b9 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -246,6 +246,7 @@ extern "C" {
>  #define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
>  #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
>  #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
> +#define DRM_FORMAT_XVUY2101010	fourcc_code('X', 'Y', '3', '0') /* [31:0] x:Cr:Cb:Y 2:10:10:10 little endian */
>  
>  /*
>   * packed Y2xx indicate for each component, xx valid data occupy msb
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

