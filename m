Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C82E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwalPoVfhXMCQGFYr9ryIpasntXwzfLlG4s9wl797Go=; b=A9jLQmUFGlQdpKQb89AsHZq1vw
	eeBJNpzUOID3Jgp4nhls9zDZGYN89WG4tdQzH1NaqoTrYybVG49jSAvFgZDlavINBimJN2dLNEK44
	QWdTS4Z6Cs/GMYoWCbqoI0vnZnOxdOZJ5Fh9wNFNCxBlmC6zEZX9vL1HzDgUsLzYMY+SWTVqejX5L
	RCJFIGvdnbwZgAaL6qVNDrnqZxgmV9eqM7WmQQNotr5dXHYi3FTlI2/TnC73yLlaqhuEWLX4BsnD0
	/9TIRQ+ocbiZ/MTT/LLvHEeUQiVHwGzi7euXG8kBtImJzoQhciMA2VFSW3FrrqKI4OF6ZSX1tRCBf
	8MaD+OYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSEw9-00000005BBw-3eFx;
	Mon, 30 Dec 2024 12:31:57 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSEuy-00000005B1r-1YcQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 12:30:45 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5401c68b89eso11363094e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 04:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735561842; x=1736166642; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwalPoVfhXMCQGFYr9ryIpasntXwzfLlG4s9wl797Go=;
        b=hdlwFv86vpVz3QunrnAqYjz+IVhffsobumw6HywR3d4i1vQPooewY1nDIuM2to5v9n
         t63qFJFBykGzlajJKHZcuFTOBzYHIXNPiTzeZIpq15JCcc46b7jQvJqoDACgrJA9Y9WZ
         MrcaLRX8uTYTFs0Sx5WjpPTjrdt3c13Y1OIr6ZqaCaLbvgu6tADNotD8aphViE5aS4VE
         aepzO/rm0Upzq8HS7XWn+osiaUGgIp1SxiUyk+3Ba21yFpwmEE2FONobj8eNqL0zHUuS
         qVIYATr96dH3z2pO4AA05ug0WvkLKK79QiCpyLoaBX0Gr5UOROzKLEA1AmeA4r9KYZl9
         dZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735561842; x=1736166642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwalPoVfhXMCQGFYr9ryIpasntXwzfLlG4s9wl797Go=;
        b=DJl7728joDLzLf6z8HxHV9/pYMe/AiZ6m+03XyeGhIOF72Z/2g1tvwqyqVBWtIkqVv
         Cdh6SvJ+iAHU7vSo7nIOEWJGBEMUGYhN08rFOWv9IUcgGMsf8mqvx1W5hSkj8p8HUbXH
         N5QfjKelFy9L9l4MIxYeIslrNHc0Mx6HkGI665zcVpWQSfdt1RGqT2z9JlrsZNuyoIMR
         L0FV44G+mf7YczQxr8cQZIksfknWWJFABqv6ig3M++MXwv6B4HL6RwBAJur6bepe3Rr/
         LU9Vng8DXegrPxfkHFozaI9nwaJPzrjmKzYExdhRvSmUkqyaiZSPeHongERifvV0+J/G
         SkIw==
X-Forwarded-Encrypted: i=1; AJvYcCVGjTaZeCcUXj4NXGIo/HUujS6RGYtwrcBFxPWVle6zHN0t7V59j+rKx2XdCBdQdYYupbNdAq8pCxjcZ4FCkmLg@lists.infradead.org
X-Gm-Message-State: AOJu0YzXnUs0EnpNAdTfIvSUfWD+nn9W8kCMHrx0zdaTFRTvH9+lT6wM
	KRIbv4Tm3Q9stRthUYrqLRQ6AmTzZ1q0oPQbJj2G9mquwVXMc/pyWh1Zy2LjNBM=
X-Gm-Gg: ASbGncsu6LG8ZUUUfOshagFO6JLFx46GtJL+VSe0r5TX6GT/I2OUBw4dHgpSSHItCKf
	JKQsuCLlep1KwztaXlZ8FovFoxBKpAevTvukDKJTWK4mN4K1jB41HHYDdkXTyO5c8A4gMuYW7MH
	wFRguRL6dpatzCq5seHswBxLIsszoUpreB/viebciWCnIa+I+1iB/7G6TK8naS92Xd7mkS3IAzl
	bO9SbTudUOiNIukxy+xV0KdsanekBgJGUEDk45bGnsKBAzOAXcPjoPmTc7AB2BIHPfLpq+A2qGS
	//n8lVTxpZ/Zy9I5vGaS3XSzWIiA0GFk73aU
X-Google-Smtp-Source: AGHT+IGs664Z6a1VXnL1IU1qIYV7pMmpsbWRxTp2wEqrbi2vMMk6KM7ZX9fIIcaItp6yhkS4k5KJrg==
X-Received: by 2002:a05:6512:10ce:b0:540:2fbb:22fe with SMTP id 2adb3069b0e04-54229474ebcmr9865558e87.26.1735561841796;
        Mon, 30 Dec 2024 04:30:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6073sm3157778e87.27.2024.12.30.04.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:30:40 -0800 (PST)
Date: Mon, 30 Dec 2024 14:30:37 +0200
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
Subject: Re: [PATCH v8 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <kwipz3wzydihroelii6enzxv63yyfuidmrua2fzhdvjdbjpqqp@s66fwhbbvcs5>
References: <20241230021207.220144-1-victor.liu@nxp.com>
 <20241230021207.220144-10-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230021207.220144-10-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_043044_447121_EB0EE263 
X-CRM114-Status: GOOD (  20.20  )
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

On Mon, Dec 30, 2024 at 10:11:57AM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing
> units that operate in a display clock domain.  Add minimal feature
> support with FrameGen and TCon so that the engine can output display
> timings.  The FrameGen driver, TCon driver and display engine driver
> are components to be aggregated by a master registered in the upcoming
> DRM driver.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8:
> * Get DE/FG/TC device instance numbers through register start addresses of the
>   devices, instead of compatible strings. (Dmitry)
> * s/shdld/shdload/ for DE IRQs. (Dmitry)
> * Drop id member from struct dc_de. (Dmitry)
> * Add dc_de_post_bind(), to avoid dependency on the component helper's way of
>   implementing component binding order. (Dmitry)
> 
> v7:
> * Add kernel doc for struct dc_drm_device. (Dmitry)
> * Fix regmap_config definitions by correcting name field, correcting read
>   ranges and setting max_register field.
> * Get instance numbers from device data(compatible strings) instead of OF
>   aliases.
> * Collect Maxime's R-b tag.
> * Trivial tweaks.
> 
> v6:
> * No change.
> 
> v5:
> * Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
> * Select REGMAP and REGMAP_MMIO Kconfig options.
> * Fix commit message to state that display engine driver is a component driver
>   instead of a master/aggregate driver.
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
>   KMS routine to initialization stage. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the drivers.
> 
> v3:
> * No change.
> 
> v2:
> * Use OF alias id to get instance id.
> * Add dev member to struct dc_tc.
> 
>  drivers/gpu/drm/imx/Kconfig     |   1 +
>  drivers/gpu/drm/imx/Makefile    |   1 +
>  drivers/gpu/drm/imx/dc/Kconfig  |   7 +
>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>  drivers/gpu/drm/imx/dc/dc-de.c  | 177 +++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h  |  56 +++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>  drivers/gpu/drm/imx/dc/dc-drv.h |  57 +++++
>  drivers/gpu/drm/imx/dc/dc-fg.c  | 376 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-tc.c  | 141 ++++++++++++
>  10 files changed, 853 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

