Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D52FC72C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmdXwTMByXlQtXyVEuM8ZEQe80RkWuQUj8gRkLjyMOs=; b=c5GFU7kWTL84N+/BHhYvVcnlyb
	8Y++shfKZbKxRTa5OKt/pUFSUn8sVWufA3B1TZM96fwFAn/+ZiT+TfcKn044aXFgr5lhSIcqvs7mG
	yTZJeMSXNIwIfVfU1fu+l5Jl56imRKS5WpSFkwi/aAWVbivoEITcQRPgxEJhulo1VXouJwhZ2QSD+
	cX2skGcifof4uWm9kBZKstTUsrvGdQmPkaXjQg7AGm+t11gMM96nrJ/s9q8cHUL5xdyC5GXEvALwC
	LjTHLeOhNJ7gAMpZopkFGg/cL1EmCc/n9ysQa7BwTqufp8Q4SsfnjLZRUqsx6oPpKshNe5MArkTow
	j6DULXng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JMp-0000000FODA-2EkZ;
	Sun, 22 Mar 2026 14:01:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JMn-0000000FOCA-1mDC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 14:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E130B44560
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 14:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C573AC2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774188080;
	bh=QmdXwTMByXlQtXyVEuM8ZEQe80RkWuQUj8gRkLjyMOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lrt8fvFazEtLA06IWldGlVlmOQ9mHzsIa5lVgNVMJuSLZls+9ojaALd2yLH9TNEK8
	 Z9AFdviJ2lH+eG675obsclGgxjJPTRcR4aY9K2wcxIRO4SxtnQE2vD38hUhjmnSxNl
	 fbIkJfFr85Mi6bC+kRkjnqxWTUvDU0vDN932IWPczz0VpJZdBLSRxu5Xe42qUqrH62
	 ouH6ScH4hlVLr8Ah+of3+v7WGTtarOykMwhMNii4TFCDP1/dh7cH0Fn36QDbjgMLbj
	 tVPINM0Fdw6zw+4j9KR5Qak4ZCyu+equOiDjcaEFva7JzaVpWesAogJeJme0DmRoVn
	 6fJJI4MGAtdWA==
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c0e38f3f60so1736291eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 07:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvK4mFEUham6R+PYhoUQL9BYESszOnpzdswgu5RgZuXd3QtmnBCHVoxHu2+upKgwf24OAICwMr+17cgaAnc/Xo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8x6K+M7VjvVxfngSlgiGK5gIIIwUiPpoE+ngbKeboQM2bIsWM
	PIkrq+vciNTv2ShcvFw3l4fLfX4kcrRC1Zaqxi0jnfJtXWkcZSL1ohy/nPbWw9d9e5Ynygsf3Y3
	DEbjyaFlxEIjt0hKJRGirVatWZAkE+g==
X-Received: by 2002:a05:7022:125:b0:119:e569:f875 with SMTP id
 a92af1059eb24-12a72342011mr4458266c88.18.1774188079697; Sun, 22 Mar 2026
 07:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org> <20260305-drm-rework-color-formats-v3-11-f3935f6db579@kernel.org>
In-Reply-To: <20260305-drm-rework-color-formats-v3-11-f3935f6db579@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 14:01:07 +0000
X-Gmail-Original-Message-ID: <CAAOTY__bMYqtVLqYin4sLs1F=-yWoYVj=W0osL_vcwdqCHVACw@mail.gmail.com>
X-Gm-Features: AaiRm51o2YPhQeYKXw9UtRNG-i4wgZe6wEfJUWBYiwwTcCwjkboilWj5OZVfgGo
Message-ID: <CAAOTY__bMYqtVLqYin4sLs1F=-yWoYVj=W0osL_vcwdqCHVACw@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] drm/mediatek: dp: Convert to drm_output_color_format
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_070121_678915_7C0CD799 
X-CRM114-Status: GOOD (  14.13  )
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

Maxime Ripard <mripard@kernel.org> =E6=96=BC 2026=E5=B9=B43=E6=9C=885=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=889:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
>
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X =3D BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
>
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>

