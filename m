Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C55FC55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQHukA8q/nWnCf8E4TYdCO3M6nSrkBqAfEwr+PxHQSY=; b=ptoiVAZP0XxW4g6Ngxnso0hfMe
	jNu7doNhp+oXvn992sBT3GEuOh0GfAZK5D75GnWwhFPiA7OCxpOaxeU6I17VnHkL8SORA3Wql6K6M
	C+lsb6v4XcwOp0+3+RhWt1V0y+IMEU8C/6Asc9qLf+n+oA7NhKYWak1wEM030++NgmW5DEcOrLT+S
	zmGZcwLD/zS2SgqBYVy93Dq+Op4MtXEyGXUKQL28gcT9SWMjRzidPAqRVKdteBWEzI/j3tmZwsNcs
	TAzyinishC7olK3nhoO3NVARlEXH7lt+BwJkWsX4IIm67ZpnLjxeJmCGfSE3bNupcWdZz9dv/yPuY
	IRE0nW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYH8-00000003fBa-0Jg8;
	Wed, 05 Aug 2026 09:51:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYH5-00000003fAz-0njo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:51:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CAD354E410F0;
	Wed,  5 Aug 2026 09:50:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83C1A602AB;
	Wed,  5 Aug 2026 09:50:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E944D11C3462D;
	Wed,  5 Aug 2026 11:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785923453; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WQHukA8q/nWnCf8E4TYdCO3M6nSrkBqAfEwr+PxHQSY=;
	b=jH5LuowduI/XKIkcaqUUxiW7Ol+EaGTPiorT3kiO854uKqBifIKgDbzQ9rMi2/ofKu1249
	sbLzkXz0RnLqDiph3DHZvv556+U4DTxXi3J+9NzY/OHYhm6Cxk48hI5u2JGKNjm040vP6I
	4a5bKHHeiDKY0r7MM2z2RPay+cLs2DntvgqyS0/48sT9QJo5B2ijdj5mJIgyxhPfU5iBYg
	Pe7M2bdOPXn6YJd3c0TIFESE+Z9ykM3txG/jNRQQk/QGjTxBgC98f1f2IGPec7bGOBHphH
	X7GRAaDEtut49k2NwCLvtf+rzYGgy6YRtXMElSONPmIJo85sRKBW+Z1/A0+gZw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/3] drm/bridge: samsung-dsim: enable MFLUSH_VS for
 Exynos 7870 DSIM
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260723-exynos-dsim-fixes-v3-1-0c31ae1dbecc@disroot.org>
References: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org>
 <20260723-exynos-dsim-fixes-v3-1-0c31ae1dbecc@disroot.org>
Date: Wed, 05 Aug 2026 11:50:38 +0200
Message-Id: <178592343861.489541.8951125546023501465.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_025059_378724_5D526198 
X-CRM114-Status: GOOD (  16.53  )
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

On Thu, 23 Jul 2026 00:28:32 +0530, Kaustabh Chakraborty <kauschluss@disroot.org> wrote:

Hello Kaustabh,

> Commit a36c533ad3e1 ("drm/bridge: samsung-dsim: Always flush display
> FIFO on vsync pulse") intends to enable FIFO flushing at v-sync pulse by
> not setting the active-low MFLUSH_VS bit.
> 
> However, in Exynos 7870 DSIM, the MFLUSH_VS bit is active-high. There is
> no publicly available documentation to the best of my knowledge, but
> downstream kernel code [1] supports this claim. Enable the bit for
> Exynos 7870.
> 
> Cc: stable@vger.kernel.org # v6.17 and later

Being a fix, there must be a Fixes: tag.

>
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index e2fc69fc51b6..b72542a0afb6 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1089,6 +1089,13 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
>  			reg |= DSIM_HBP_DISABLE_MODE;
>  		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
>  			reg |= DSIM_HSA_DISABLE_MODE;
> +
> +		/*
> +		 * For some hardware types, DSIM_MFLUSH_VS bit needs to be
> +		 * enabled explicitly.
> +		 */
> +		if (dsi->plat_data->hw_type == DSIM_TYPE_EXYNOS7870)
> +			reg |= DSIM_MFLUSH_VS;
>  	}

Based on your commit message, the differentiating point of the Exynos 7870
not "needs to be enabled" but rather "it is active high". So a more
understandable comment would be "The Mflush_VS bit is active low on most
devices but active high on the Exynos 7870", or something similar.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


