Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0493FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Io0aFnNNwQiWHsIlYK7BZZBTMpe4hxTbSGJahPhqnd0=; b=zNtBs90jBJiiqfAZItdsEXCIQT
	9E1XLjPUrTUYsoRHGhAv2ig220erJrRPB2yA0ZgZoG6yo0/dgI17XcpflBLuI7pdc8F1p+F67e2Z1
	s0Oi0FsmN8FVdwyFlJvrg+TWtLOhoBJLD928tpQouwWI30NCCvMoNmQAl0bltoHO4i4pfRDUnIUda
	CnC5OkIlcb98KWGOgjw8vpn/yy8OvXvh/ZHUyWdRAbQr62iWj0pOvTKHNj1vPuh2Au93lj3SmuZB3
	qEf96IGF1JnqNsTC68GTKask0AZqh8R9PkPqMQdQEtyUT59I70+j+7G8ziZy4ShVcLAhCHyD34Ned
	0gGpF7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgnm-00000009vCH-2E8b;
	Mon, 23 Dec 2024 11:40:46 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgfY-00000009uW1-01T9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 11:32:17 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so5428116e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 03:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734953534; x=1735558334; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Io0aFnNNwQiWHsIlYK7BZZBTMpe4hxTbSGJahPhqnd0=;
        b=Cdl7joJus4SBwtlxsnalpeK89BIW4gh1WJq6UQjQ8TICjwdwGdjbzzBBdR4+dXv41s
         OXNJv6HNdub/T+eI519Kkk/Ugla9RXg2qn3IAjjGCz+xLvh536thTN13sCwoFoVm9u9k
         KL5BEDPaDO1aNGeoMVTZxvGZGqJKXv1pQr2Arabz/3FhMaLW2TG0n+FNsi0ikNb/Pwx0
         bb6eYlKk2g2fJriKQnNIkn7Sii9s5QJOVy6WUuE8DLbVAdnb8FVs5Yttgf6r+j0oWH0A
         YlHws89+pwmbY1XXoSCL3z4JhI8fJ7mfq0y+09bnXGrG25cR2yFvTqlHpkyTEqF+BImy
         TBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734953534; x=1735558334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io0aFnNNwQiWHsIlYK7BZZBTMpe4hxTbSGJahPhqnd0=;
        b=vYq++KHGTW4vwjpgF4kwMEv8Ik6Fv5doa6sRWNEeYG5K79Q0KEOgjk8prGqKVb3qyd
         Ie7EbJzoqSIfQL1IVGhGbGOhH+X5RlchCU45rQM7ynQQyYhxtcrIUhDYKaTcuT6tra9S
         yzm0d/F5t+SZjjYXWdVYTAMTn7RhWXaKuQCo6wAdqq8cXcq3QmVjMUnksbHOoecQjYbD
         5ABQ0bFOd65MvX+WjS0LSmlMlTSsNQdfXraXg2riVxkwDpxWEMzwQFsM/hegpO4r7NsX
         E+wMaPh+LafRKp9DzpIyMd2j9pq/urvc0Bg04a8bqrxpIutKPhWIA7qVScFhV0hJH3r8
         6O9g==
X-Forwarded-Encrypted: i=1; AJvYcCUUq4BDYCdX/qfv/pastUFmPJusYPKzmkgqwxvqJWAaduLsBUSnd1S56o0dyhQotjgXMdLkmBFd6uPB4LI/brZ/@lists.infradead.org
X-Gm-Message-State: AOJu0YxbiG+AVHVxpome/vabdDE9xLHD9RkYiqp1VNS716Kaptp5K755
	SF3m02T+dUipESvZgJti64JtCKlwUaPDD2+bOJdRXMEhqPBvDtCrp+MB1FIGjE8=
X-Gm-Gg: ASbGncs7t3x0bJtvke6aqbje+fCZnujOpWIe3O064VXhcmwefK6FuledU6AdxRk9gt8
	LsqiAx2WPhV2EHfakwisB6is9YWOIL+DwpN7CHd4WbIeJvBfXWGv+GpSlnLaiZJ7LXWgWb5OCpt
	+Y0AwoemnVYGS0bVLWMuyiKHro6iwQB61b+XIgo3gmR37uD3XHmknIzmkAbX93m4g6gX96i4pqs
	BV5jT8mRNnjrR+DqDXvjBCO9JyJMTQMk332oWAfQJUy+pPlo/ZGX6223mU8QUBJTtoLDqa+5+ts
	5+kTgo3tMLBxOeWnzUUjx1MbZwrcGnRP8GDP
X-Google-Smtp-Source: AGHT+IFQAVVka8tfhQQLypKSuFFeZTfbXIdbwFKArHWMlABaOq9wX6sZw2Zp8LWAHfr0uv4tXZ5d1Q==
X-Received: by 2002:a05:6512:23a2:b0:542:1bdb:9a61 with SMTP id 2adb3069b0e04-5422946f053mr3666830e87.19.1734953533962;
        Mon, 23 Dec 2024 03:32:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223831fdesm1270675e87.241.2024.12.23.03.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:32:12 -0800 (PST)
Date: Mon, 23 Dec 2024 13:32:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
	u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 12/19] drm/imx: Add i.MX8qxp Display Controller KMS
Message-ID: <wpxxedxabgo2kxf5wuosu76i5ud3ce2tywm2imhvad4nyy5u2d@qgfhev2hndba>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-13-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-13-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_033216_864784_76890595 
X-CRM114-Status: GOOD (  24.94  )
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

On Mon, Dec 23, 2024 at 02:41:40PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller(DC) is comprised of three main components that
> include a blit engine for 2D graphics accelerations, display controller for
> display output processing, as well as a command sequencer.  Add kernel
> mode setting support for the display controller part with two CRTCs and
> two primary planes(backed by FetchLayer and FetchWarp respectively).  The
> registers of the display controller are accessed without command sequencer
> involved, instead just by using CPU.  The command sequencer is supposed to
> be used by the blit engine.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Drop using typeof in macros and explicitly define variable types. (Dmitry)
> * Add a comment for disable_irq_nosync() to explain why _nosync. (Dmitry)
> * Inline dc_crtc_check_clock(). (Dmitry)
> * Use global drm_dc->pe. (Dmitry)
> * Drop dc_crtc_disable_at_unbind(). (Dmitry)
> * Add kernel doc for struct dc_{crtc,drm_device,plane}. (Dmitry)
> * Define common IRQ handlers separately for each IRQs. (Dmitry)
> * Rebase this patch upon next-20241220, so drop date entry from drm_driver
>   and correctly include drm/clients/drm_client_setup.h.
> * Collect Maxime's R-b tag.
> 
> v6:
> * No change.
> 
> v5:
> * Replace .remove_new with .remove in dc-drv.c. (Uwe)
> 
> v4:
> * Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
>   function calls from KMS routine to initialization stage. (Dmitry)
> * Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
>   appropriate .h header files or .c source files. (Dmitry)
> * Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
> * Drop dc_drm->pe_rpm_count. (Dmitry)
> * Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
> * Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
>   Instead, put it in struct dc_crtc.  (Dmitry)
> * Call devm_request_irq() to request IRQs, instead of using drmm action.
>   (Dmitry)
> * Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
> * Select DRM_CLIENT_SELECTION due to rebase.
> * Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
> * Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
> * Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
>   rebase.
> * Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
>   register dc_drm_component_unbind_all() action.
> * Request interrupts in dc_crtc_post_init() after encoder initialization to
>   make sure next bridge is found first.
> 
> v3:
> * No change.
> 
> v2:
> * Find next bridge from TCon's port.
> * Drop drm/drm_module.h include from dc-drv.c.
> 
>  drivers/gpu/drm/imx/dc/Kconfig    |   5 +
>  drivers/gpu/drm/imx/dc/Makefile   |   5 +-
>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 556 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h    |   3 +
>  drivers/gpu/drm/imx/dc/dc-drv.c   | 238 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-drv.h   |  22 ++
>  drivers/gpu/drm/imx/dc/dc-kms.c   | 143 ++++++++
>  drivers/gpu/drm/imx/dc/dc-kms.h   | 131 +++++++
>  drivers/gpu/drm/imx/dc/dc-plane.c | 241 +++++++++++++
>  9 files changed, 1342 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
> 


> +
> +static int dc_plane_check_no_off_screen(struct drm_plane_state *state,
> +					struct drm_crtc_state *crtc_state)
> +{
> +	if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
> +	    state->dst.x2 > crtc_state->adjusted_mode.hdisplay ||
> +	    state->dst.y2 > crtc_state->adjusted_mode.vdisplay) {
> +		dc_plane_dbg(state->plane, "no off screen\n");
> +		return -EINVAL;
> +	}

Nit: doesn't drm_atomic_helper_check_plane_state() ensure in this already?

With that in mind

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +
> +	return 0;
> +}
> +
-- 
With best wishes
Dmitry

