Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4D9E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XC7aFoxrHSDbAWGEa4JymcLKu3NlXqEnFCSTzXWk0ZE=; b=ujlqIQr4CXD0L3qfPTHUwCaA43
	zrdV465gWd5D1RtP+mIFuzToKoaRbQenHn9hsB59XiZ32BuP0Q/3XbGdAiNlL9ViB/eyK+WA9uC6l
	0JmC03IhbDj5RdBPLYRH/nLpaxruXftSeT656Ay3jzZKcmCpXNztRt/rdsmtIUYtu6hw8COa05qzl
	U9C4wFMLN9RxW4gaA361sn4BoNh8JJnP1KLAItB2CgO5JWAvKAkUjV1IamD6sKFYmTh/0m+/96iFl
	t/u6V50S9fT52KuMw0QtMVeNj3+HimRYZU7RHCBgSHhK28j6ME3sIdmpwRdG29zAK4T6CxaizRR5H
	tlAptnBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSExI-00000005BIW-0Gkl;
	Mon, 30 Dec 2024 12:33:08 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSEvF-00000005B6E-1SL4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 12:31:02 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso99202371fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 04:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735561859; x=1736166659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XC7aFoxrHSDbAWGEa4JymcLKu3NlXqEnFCSTzXWk0ZE=;
        b=bcJvuEpKhE2XNm9k9RDbQeXygCpW4Pl/AUAHlOd7E6gxvG24oawiNbJ2M3nNk3chNl
         i1JWcoDcDGiKWzD6JZwlzI9dLYckCX0BKNDmLdDpLK8sg04xdb9rt2YoEtATnBnUFK0N
         R0aIIVHrWQ2EAHYXv8jSKBz1Wk+wEtLHfa4GS7PPg4RpS/j1i+P7wsOYC3Sf3nPtbPbD
         YutHqxHw/CbZS9A4xs3t8ctq3evkj8pmtsl+V8PWjQ8BqLhPCyNDJ2SmJ36KdTHCm9V3
         2zy2dum5/z9iSm2IuU3KoHl8mL/SsKLs6tRW9665L2oPnmWA10W2AaxwLD6e81Yhi281
         DKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735561859; x=1736166659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XC7aFoxrHSDbAWGEa4JymcLKu3NlXqEnFCSTzXWk0ZE=;
        b=bH8rhJe7myJHifZtdxzqUDgJWQcNQPB2Gwzbb+BcfXevjTbxjeant/bSQm247/Uu2r
         Xj3tKawEnY9UO45Uj7u6A7MZqzGPq/8j/ocE0M21T9woJEexX6z2Uc4RZqWSU6csOmpG
         5YJHEWOBZlotzx+xNz1k/w+DWQ4wac7ukjTFqk666aD7UCu8DubbIRlYb2H6gvwJQCP0
         UOq3edrlLdjdKyZ7aEzTGu9uUq7owCAYvCAeU/Q4fvtNedST9wLE7o2bVEJzcy+uSvtz
         Y1x9CF4gsvQh1gh4FjAkrv/I7v3XpK3Dtxcpii0bS5tIhK1KxUxKQduUPowRzIv/qgFe
         HPTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8LbnCugZiGSKcjIW0pFXwF7BRSMIrzo4H43YWONqkgwRez/XrvIrwgEAr0W4HyCxkjLh+V1Qr/zH92dDop99N@lists.infradead.org
X-Gm-Message-State: AOJu0YwYqlxF2GFombxwOp2G6ogE3BsH6/qXK3/P8MXzA/7k1iHXU2zX
	FYE722xurSder5Yp9ae2AekYGRb7nx2cZ55/3SEhAq7JtmTSzWagiINf0EqHgcs=
X-Gm-Gg: ASbGncsJ7gg8PaMPeYLHlmY2m/ULuV2UBJGjzO5K9+Xev6vmbKEdiE4UNTtw/4XJIy1
	SmKYF0uG9oqFYb/WdLaBszwooiCrM518VIXmbCQFIczb8EBaZwbOyTX0dsb4SUYsmB/YTJBXmxB
	/YHCIVtzSfi4/fxxvyNb8OYeBvetQrxFHpt4oObrrJj1wC4CY51Lr/MMvxx6lk7bZhspKKKa6Sl
	gks74K0UE2wTLaYKUnRwUJhrf1xXEjkj2c5O0IJ22dI7kAltiEZkITD5ABwhhlN0rRQgk4G8cvh
	P+8QL1jI3AhEC0S/4t+1QmowlShGAETVGpaQ
X-Google-Smtp-Source: AGHT+IHnMCZF1zu8nJTtjEUT7Ed/kcm++NEx7SYSKZGed7mcIjxQVIqgMQ+VgW8ijFMQzuCRlvCpHQ==
X-Received: by 2002:a05:651c:2229:b0:2ff:a7c1:8c55 with SMTP id 38308e7fff4ca-304685f51f9mr159543341fa.28.1735561859482;
        Mon, 30 Dec 2024 04:30:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b069ef9sm34662771fa.91.2024.12.30.04.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:30:59 -0800 (PST)
Date: Mon, 30 Dec 2024 14:30:56 +0200
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
Subject: Re: [PATCH v8 10/19] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
Message-ID: <ircgfhci3wmpahpxflmsbsxpahafqj6y5v56llezazaarbzppf@njzxhahie7xx>
References: <20241230021207.220144-1-victor.liu@nxp.com>
 <20241230021207.220144-11-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230021207.220144-11-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_043101_501213_C78EBCB8 
X-CRM114-Status: GOOD (  21.13  )
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

On Mon, Dec 30, 2024 at 10:11:58AM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller pixel engine consists of all processing
> units that operate in the AXI bus clock domain.  Add drivers for
> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
> well as a pixel engine driver, so that two displays with primary
> planes can be supported.  The pixel engine driver and those unit
> drivers are components to be aggregated by a master registered in
> the upcoming DRM driver.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8:
> * Get CF/ED/FL/FW/LB device instance numbers through register start addresses
>   of the devices, instead of compatible strings. (Dmitry)
> * s/shdld/shdload/ for ED IRQs. (Dmitry)
> * Add dc_pe_post_bind(), to avoid dependency on the component helper's way of
>   implementing component binding order. (Dmitry)
> * Add dev_warn() to dc_lb_pec_dynamic_{prim,sec}_sel(). (Dmitry)
> * Drop lb_links[] and dc_fetchunit_all_fracs[] arrays. (Dmitry)
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
> * Fix build warning by expanding sizeof(fu->name) from 13 to 21.
>   (kernel test robot)
> 
> v5:
> * Replace .remove_new with .remove in dc-{cf,de,fl,fw,lb,pe}.c. (Uwe)
> * Fix commit message to state that pixel engine driver is a component driver
>   instead of a master/aggregate driver.
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_lb_blendcontrol() function call from KMS routine to initialization
>   stage. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the drivers.
> * Make some fetch unit operations be aware of fractional fetch unit index(0-7).
> 
> v3:
> * No change.
> 
> v2:
> * Use OF alias id to get instance id.
> 
>  drivers/gpu/drm/imx/dc/Makefile |   3 +-
>  drivers/gpu/drm/imx/dc/dc-cf.c  | 172 +++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |   6 +
>  drivers/gpu/drm/imx/dc/dc-drv.h |  22 +++
>  drivers/gpu/drm/imx/dc/dc-ed.c  | 288 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fl.c  | 185 ++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fu.c  | 258 +++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fu.h  | 129 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fw.c  | 222 ++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-lb.c  | 325 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-pe.c  | 158 ++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-pe.h  | 101 ++++++++++
>  12 files changed, 1868 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

