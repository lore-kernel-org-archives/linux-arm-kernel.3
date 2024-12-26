Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9F0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppCCMWUp+TBSk6cyVK5gjcdhw0wzNeHxXsbdb9zpgKQ=; b=q5b9K5S/RnvpWLC4oFcKQUeIuK
	Hk89HPd+D4iV7Nht8deqUT7ikHwJQpc+MSOSBuw+8fFPteuPV700hanY3Cf6UXwuzjWD7JszeBgE7
	ZNCP2FlffSJn9FUC4irEZkgdPoK2edp3m4iuyDVoqWDCPTUu7NWs/w/2DtxprKHPUFekDXOv29yVZ
	9Ez8XQX8a2fdD6q1rytwoTPoNtnoX7YrnKFZPwf87fXYU/jMr5CRtbLqtNhhL4XnTDGIDx9dtN+91
	V8JFVlz2krLDXBYj8otHg7iDMTkNaWkeokv2P9dKTj3vTnxTPMfYRCk+x5xAYeiDooxKcPl1Xb1JS
	mKzQR+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQp1i-0000000Fv1p-1RJg;
	Thu, 26 Dec 2024 14:39:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQp0W-0000000Fule-29t0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 14:38:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4362f61757fso64990355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 06:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735223915; x=1735828715; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppCCMWUp+TBSk6cyVK5gjcdhw0wzNeHxXsbdb9zpgKQ=;
        b=Nig4DvMqrbZJN0OeTtILazgtKWsihsCqpkazKJ/7tZugcTZkv5OpdZ81JtiG7gWv5x
         fFIhwWToEjjNJjq31ETSYd8r+GwTSUmQFHvX5Y6/kNt7qfN+/Sg41JXQhiNuI1MZObvI
         GxPc+SALklUBLr9+8qkTSjLnEerkuq3+dA105mdlEcDhzrUC8lt9ddx/IvE5UX8CtGyK
         W3t5aXXwmWn8Aot7FhXyRhd9RwxrpnEJWtk6bjymhnRB+DufqmJIwyNrXJP1vpzLgQPS
         0heyTW/XcZ27OGs1Q/W1RTJ3fn1LFkXl75qlLoq/UpceYow6Z6g1pb5J11tbARYRsmX4
         1a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735223915; x=1735828715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppCCMWUp+TBSk6cyVK5gjcdhw0wzNeHxXsbdb9zpgKQ=;
        b=UUSVPHGgTqhd7UkJuUGh6/e84KngBsqTOXldfsnUEHpnTQSTMGOUNMdJ+RL/8bHhWS
         Mu/q75LU4Jxktr6q7ARGP1LIWHFY3DMhWSTqa8qM/DzQVH+utAp3etk0p7SC3xl1g4qD
         ljEeNpLNAsfjjY1ocprKyJHBRMnUPJEHy72SGI9mPIzMGMDurID30/O79K/TmnuVZID1
         fyowcJeFXNu2vVEcI1gkkAkbdlCN+g9+6YnxIia6Mk/1K4j1WUmg+SGkrfVBNyNx21Lf
         4XziHg2k8kBlOE+apSaj9pKQ/K+Cm7FMlAgU7gkAWoDoM2Kt104tBu8r5u8+fBj+k0lG
         ZkPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/kGxldSa/OaGpqhx3I+leTKOlNoF6SM7Cj3xsnCJMB4jtOZdPPK8Oei9bKRpimTjzsJuTu4I/K6ZPx28TwFNz@lists.infradead.org
X-Gm-Message-State: AOJu0YwvvGipRQt4Vn9H67e/1ZweW+g3TC8A+5mKuMZd5TKxJQWVVK74
	N19jWUnIRHcD4rsr0zuPKzAEfCty0VyN43rcDDvezZs3T9xcsx7Xtw5E10nrjAPwEhRlQ1b8jgZ
	R
X-Gm-Gg: ASbGnctjk5UPTiBae+OQ6DkFMlOp/bhHq4yWO2ZvW+jUk/yITMsyx9nvzdO+NUhbQTy
	YMiNtJaYormxCJG+02fiPTI2uUYbLv7BCZoMuExpNPCAgjEnl3NTP2b5P/klxSWA2Nvur3u8aQx
	dDnLTUmFEnZpWHGz5anVDijFzNQGlh+CGcixe70+fXWOrEFkmdGW+H85NK8ZC0yq2W39i/aDJZs
	FzLq3jMIZFTIAYt4p870YXWucDjyFPFfmeKkRtxoOwg65Pt1kDItro=
X-Google-Smtp-Source: AGHT+IFPzIF1oPeem4JaOE0kiI2t8N5T16Kp29XglspdwnIhUCG31MxEJbnojAYYdfxmNkxmbdm+AA==
X-Received: by 2002:a05:600c:a0a:b0:434:fe62:28c1 with SMTP id 5b1f17b1804b1-43668645ffdmr208219815e9.18.1735223914701;
        Thu, 26 Dec 2024 06:38:34 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c25sm267607585e9.8.2024.12.26.06.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 06:38:34 -0800 (PST)
Date: Thu, 26 Dec 2024 16:38:31 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
	marex@denx.de
Subject: Re: [PATCH v6 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
Message-ID: <Z21qZzfjzxPb6PzO@linaro.org>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
 <20241112100547.2908497-3-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112100547.2908497-3-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_063836_568864_B60D9A44 
X-CRM114-Status: GOOD (  20.70  )
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

On 24-11-12 18:05:42, Liu Ying wrote:
> This reverts commit ff06ea04e4cf3ba2f025024776e83bfbdfa05155.
> 
> media_disp1_pix clock is the pixel clock of the first i.MX8MP LCDIFv3
> display controller, while media_disp2_pix clock is the pixel clock of
> the second i.MX8MP LCDIFv3 display controller.  The two display
> controllers connect with Samsung MIPI DSI controller and LVDS Display
> Bridge(LDB) respectively.  Since the two display controllers are driven
> by separate DRM driver instances and the two pixel clocks may be derived
> from the same video_pll1_out clock(sys_pll3_out clock could be already
> used to derive audio_axi clock), there is no way to negotiate a dynamically
> changeable video_pll1_out clock rate to satisfy both of the two display
> controllers.  In this case, the only solution to drive them with the
> single video_pll1_out clock is to assign a sensible/unchangeable clock
> rate for video_pll1_out clock.  Thus, there is no need to set the
> CLK_SET_RATE_PARENT flag for media_disp{1,2}_pix clocks, drop it then.
> 
> Fixes: ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> v6:
> * New patch.
> 
>  drivers/clk/imx/clk-imx8mp.c | 4 ++--
>  drivers/clk/imx/clk.h        | 4 ----
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 516dbd170c8a..e561ff7b135f 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -547,7 +547,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_AHB] = imx8m_clk_hw_composite_bus_critical("ahb_root", imx8mp_ahb_sels, ccm_base + 0x9000);
>  	hws[IMX8MP_CLK_AUDIO_AHB] = imx8m_clk_hw_composite_bus("audio_ahb", imx8mp_audio_ahb_sels, ccm_base + 0x9100);
>  	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
> -	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET_RATE_PARENT);
> +	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300);
>  
>  	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
>  
> @@ -609,7 +609,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_USDHC3] = imx8m_clk_hw_composite("usdhc3", imx8mp_usdhc3_sels, ccm_base + 0xbc80);
>  	hws[IMX8MP_CLK_MEDIA_CAM1_PIX] = imx8m_clk_hw_composite("media_cam1_pix", imx8mp_media_cam1_pix_sels, ccm_base + 0xbd00);
>  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
> -	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
> +	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00);
>  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>  	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>  	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index aa5202f284f3..adb7ad649a0d 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -442,10 +442,6 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *name,
>  	_imx8m_clk_hw_composite(name, parent_names, reg, \
>  			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
>  
> -#define imx8m_clk_hw_composite_bus_flags(name, parent_names, reg, flags) \
> -	_imx8m_clk_hw_composite(name, parent_names, reg, \
> -			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAULT | flags)
> -
>  #define imx8m_clk_hw_composite_bus_critical(name, parent_names, reg)	\
>  	_imx8m_clk_hw_composite(name, parent_names, reg, \
>  			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
> -- 
> 2.34.1
> 

