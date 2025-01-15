Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B063C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Av0rjEk4K1UrBkuc3slj27PyoP59w6tr+UnsldrkkKE=; b=ib67e6R798sSzQvwjQX66a46Do
	8f/iXfB0cHgfvJRZzFFySC+M01peW3QcA88Q9vrcLfSBUZgYpS+Yoox6+KctY+Um5AVQR9JtFd2zv
	dOT1QQQzuhTwjn76t6ka2rnDIn1aj8yOFnHrm9vCACSymYy8Vs4IYppOPoAb6FBlhICcAJqGDECu5
	VIg+81PIFpm4HC5UNiSLJY4iSR35HcGZRpbPtETV/GctIq1aasJ4KLMQZm5Wayr9uJttCNdHLJtdk
	cE7dYLU0Sv4jWxHu6hYEM5/rqTmFkEwvBKZxd+o983oPrWNX1i62w5ilYyCZpTRZ3PyNyPUDjFTPo
	0C+RWc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Pn-0000000Be2x-3DbA;
	Wed, 15 Jan 2025 11:18:27 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1LO-0000000Bcx1-1t0Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:13:55 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54024aa9febso5885483e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736939632; x=1737544432; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Av0rjEk4K1UrBkuc3slj27PyoP59w6tr+UnsldrkkKE=;
        b=BgC3Wg+Bm/nqswxBMF7rqRRUJ+2u/NABWXHFXJX5TYbFFMHRWHbKqqHNGvbcz5XQ/Z
         Y6SLbNIHaIPAUVRgBI+Il7gpU8t5SrUz+g1jMGHfddg5C7bFb/3Zjv2FOiHlGquV7G0m
         dhCvQQXE7EfY8CcEtrYg0IgDbZ3iMxDWuN+t++WVD+sujfPV3ixbsD2MPtSwQ4a62mix
         YLejs6MunGhlGsogJZvSjBzXue+QZr/yYiBkkG3eKQerWsDUAk4isI4ElaHXkEaf4Ktk
         j57S5tOC7MAPA7B26K6UH31h/WWNPgNZ2HGajOSwgAwrx5Lk1005AmdBIhfRLsodJVXA
         th2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939632; x=1737544432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Av0rjEk4K1UrBkuc3slj27PyoP59w6tr+UnsldrkkKE=;
        b=jLdCEEZfoI/vLx5/Zfs2HQDDzzd1ZRALbyNp6z+9aK05GfKSBKdXAVPz0oRuBnHvne
         xJ5QVVQPoUew4Ub0FhBxV8Kh5Qs3OfiDuVcFkltMxL+1hk5EakTDu2SP35c8dJcmq1ot
         qvcujC8oYrGXs5WdcKDovqzF5W4oLGfquLGu52h7sTv69/NlocgLr4Prsnr+o9hGvcu4
         E1nLygIG6mERn7h/Cs/2+IjVnWVM3bzugP6kS12E3aTtpOalchUx3Ui7LREnVQF72hcI
         oEgcuzJlnlBYO743WZNeZZdf81aQvKatWR8gV/3DhVrDr9Zw/wfQNBzdttd4moWJE4ur
         bkIw==
X-Forwarded-Encrypted: i=1; AJvYcCW0cEio64OrtzWiQUzp0vpVK2uM2AHtu+Ln9K8NYJb+Gh9RywPZxkpZCeXJgU50xzhx5LdUj9YIPCOCatXwYzh7@lists.infradead.org
X-Gm-Message-State: AOJu0YzpZW/Vc4gD6wh0jeP7j6G/veH8nOJVuazyg5oVbH6p+xTRdL8w
	NEgu5tHIUStCA7TvWaX6n5G+j5uISlnhEWJ69k0JT+OUHQUo48es+XGX6YT6OuA=
X-Gm-Gg: ASbGncvZHn2Xp+FCGGb4D2xoJ6Es9EpVyjIWV27ZaF2YTziZCUTMijY6Kwkhs3x3ksy
	jGA+VsH/mvhkDltencjnIrpYH/vHTgeb38BUIqTUhQr5N4wRaB3FMX+7Nl0v7IzbA0t9A2Hv1mO
	s+0hfHDFya/bmR1ZGDUk4xUyaOfyKz9cBj9aAb4intpJfHWdXPSOpc8xtP+4v0FnMwzHHmqLXoa
	UtoYH7ikyfcqTVBk4mCh6Qti6YHFDg32SBulc9bFUXOlKEnz5JmtnMTQvne1+tUTbtw8h84Igqe
	E1xhTJr/OZbGejnPGZjKIjfIGcKv9KBOMr+G
X-Google-Smtp-Source: AGHT+IH0d/mqqFG8l0nVwVIfYL0lorLg9/b/9Bo50ztfLEBMz3O/VEgCt0rLyvdS4QgL0qaCmUx0IQ==
X-Received: by 2002:a05:6512:3196:b0:540:357a:4aa3 with SMTP id 2adb3069b0e04-542845d1878mr6129056e87.28.1736939632489;
        Wed, 15 Jan 2025 03:13:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea669dsm2009355e87.164.2025.01.15.03.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:13:52 -0800 (PST)
Date: Wed, 15 Jan 2025 13:13:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, 
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH v2 00/10] drm: Add new pixel formats for Xilinx Zynqmp
Message-ID: <r6mwhzcrab75ireqdqm335ayzf6n6nqnytmdnpuhlgcqkiudz5@alqr5ep5ub7m>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_031354_486836_BB561C46 
X-CRM114-Status: GOOD (  34.22  )
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

On Wed, Jan 15, 2025 at 11:03:29AM +0200, Tomi Valkeinen wrote:
> Add new DRM pixel formats and add support for those in the Xilinx zynqmp
> display driver.
> 
> All of these formats are already supported in upstream gstreamer, except
> in the gstreamer kmssink, which obviously cannot support the formats
> without kernel having the formats.
> 
> Xilinx has support for these formats in their BSP kernel, and Xilinx has
> a branch here, adding the support to gstreamer kmssink:
> 
> https://github.com/Xilinx/gst-plugins-bad.git xlnx-rebase-v1.18.5
> 
> New formats added:
> 
> DRM_FORMAT_Y8
> - 8-bit Y-only
> - fourcc: "GREY"
> - gstreamer: GRAY8
> 
> DRM_FORMAT_Y10_LE32
> - 10-bit Y-only
> - fourcc: "YPA4"
> - gstreamer: GRAY10_LE32
> 
> DRM_FORMAT_XV15
> - Like NV12, but with 10-bit components
> - fourcc: "XV15"
> - gstreamer: NV12_10LE32
> 
> DRM_FORMAT_XV20
> - Like NV16, but with 10-bit components
> - fourcc: "XV20"
> - gstreamer: NV16_10LE32
> 
> DRM_FORMAT_X403
> - 10-bit 4:4:4
> - fourcc: "X403"
> - gstreamer: Y444_10LE32

Could you possibly add support for those formats to the modetest util?

> 
> Some notes:
> 
> I know the 8-bit greyscale format has been discussed before, and the
> guidance was to use DRM_FORMAT_R8. While I'm not totally against that, I
> would argue that adding DRM_FORMAT_Y8 makes sense, as: 1) we can mark it
> as 'is_yuv' in the drm_format_info, 2) we can have the same fourcc as in
> v4l2, 3) it makes more sense for the user to use Y8/GREY format instead
> of R8.
> 
> Also, if we go with DRM_FORMAT_R8, then I think it would make sense to
> also add the 10-bit grayscale version as R10, instead of Y10, and it
> would also have to have 'is_yuv' false, and I feel that would just
> create even more confusion.
> 
> I have made some adjustments to the formats compared to the Xilinx's
> branch. E.g. The DRM_FORMAT_Y10_LE32 format in Xilinx's kmssink uses
> fourcc "Y10 ", and DRM_FORMAT_Y10. I didn't like those, as the format is
> a packed format, three 10-bit pixels in a 32-bit container, and I think
> Y10 means a 10-bit pixel in a 16-bit container.
> 
> Generally speaking, if someone has good ideas for the format define
> names or fourccs, speak up, as it's not easy to invent good names =).
> That said, keeping them the same as in the Xilinx trees will, of course,
> be slightly easier for the users of Xilinx platforms.
> 
> There's also a bit unrelated path on top, fixing the missing max dma
> seegment size in the zynqmp driver which I encountered while testing
> these.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v2:
> - I noticed V4L2 already has fourcc Y10P, referring to MIPI-style packed
>   Y10 format. So I changed Y10_LE32 fourcc to YPA4. If logic has any
>   relevance here, P means packed, A means 10, 4 means "in 4 bytes".
> - Added tags to "Fix max dma segment size" patch
> - Updated description for "Add warning for bad bpp"
> - Link to v1: https://lore.kernel.org/r/20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com
> 
> ---
> Tomi Valkeinen (10):
>       drm/fourcc: Add warning for bad bpp
>       drm/fourcc: Add DRM_FORMAT_XV15/XV20
>       drm/fourcc: Add DRM_FORMAT_Y8
>       drm/fourcc: Add DRM_FORMAT_Y10_LE32
>       drm/fourcc: Add DRM_FORMAT_X403
>       drm: xlnx: zynqmp: Use drm helpers when calculating buffer sizes
>       drm: xlnx: zynqmp: Add support for XV15 & XV20
>       drm: xlnx: zynqmp: Add support for Y8 and Y10_LE32
>       drm: xlnx: zynqmp: Add support for X403
>       drm: xlnx: zynqmp: Fix max dma segment size
> 
>  drivers/gpu/drm/drm_fourcc.c        | 24 ++++++++++++++++++
>  drivers/gpu/drm/xlnx/zynqmp_disp.c  | 49 ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c |  2 ++
>  include/uapi/drm/drm_fourcc.h       | 20 +++++++++++++++
>  4 files changed, 91 insertions(+), 4 deletions(-)
> ---
> base-commit: adc218676eef25575469234709c2d87185ca223a
> change-id: 20241120-xilinx-formats-f71901621833
> 
> Best regards,
> -- 
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 

-- 
With best wishes
Dmitry

