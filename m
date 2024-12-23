Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6CBE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PysGQXFhFIaY82I36Y7kVr5DOhB1P1lEm8vqt8odrR0=; b=xfqj7auETMeMEHVpgb98wVW5yY
	5oKpMLhvGWZkAIzGEu3gJl3GmVZ2Ae+oQZy3WqY92Vye05ALJh6mStFT8YqNf+6iVzG4GMtGbbA16
	rmLYCCcryD/KNLvETFfbYmuVgccSSJAo8NLW9m053uehThYi0jw/LpN2GZL8jEPPhvFA+N+I7tCnU
	ABy/5l24cRTGQDMfcwTGLaRY9d4y1itAn6oA+PgHBH7VzLOGF8RFmOjiFYjThnOdMNGQY/VepS1hH
	LKhAuLf+KhjgJZI3DdeBULpRoX5asJYn9MA3O+XRaJb8gRRCYRgQvxQa96CYcLD6Kk+HGJv9vKfDL
	6EVGxduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPg3k-00000009p0n-1g6c;
	Mon, 23 Dec 2024 10:53:12 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPg2L-00000009on2-0MyU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 10:51:46 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53e399e3310so4810287e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734951103; x=1735555903; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PysGQXFhFIaY82I36Y7kVr5DOhB1P1lEm8vqt8odrR0=;
        b=fhOHO3jOOu+BCaIaTd0QFloO0NsvVlqkUDqOrw1DH2EC1qg8fdj2OPVDUu9kr3pFUx
         gPQH2ojEhqkwIFqIXS6MhMUdCUglUC/3ecRvu3NqPA6xIjt87hLFPmiA2zbxsbcwGCOr
         1sxockiU3x0jMr7kqSTbStFr4Grz1ws09FDEKh9zK60iHwBktJZ6YWWCsmyEQTQEOzty
         yZzW6VQidCpxdXgQgap8J5cmAVtqoesQtz7Do+NKFyUJjWdmXFiFjHoTYwTL7U1Tz6+9
         lSa+S63rEk/XB825Tty4P/84yp5os1JM8WTibUsaZlmCk+zUzyQufdpCZSrVXfMJCniV
         qDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734951103; x=1735555903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PysGQXFhFIaY82I36Y7kVr5DOhB1P1lEm8vqt8odrR0=;
        b=QP+J6n0tV3XHuDX9V2CRsVr5xnRUz8j7UQ3uS+loDK1WZeo/hYDsBM/Ad4bu7p/4dF
         Z0omLkYSBFcSjERS4SAn9yIS5YD1Br1CO7ck8VNULvrbitEXTvDnGzdrFDnkVWrHgAxQ
         F/957Po0c7tMIYkQ4oFozNkZqDI+lHLZs6FRDmJiSBT1Go8Mme8z9hP7h9P7RM4ELHDJ
         FvjHu2oL+yfduOmHqLiFsJH1xh9Gfg7IBQhpJd/n8RAyzTAbMomqOoKOuptrVlG0gncb
         FB4fG92kSued2IR07KZ5i4qtg1kSGHcBsNK5ov8/APS/DwGP7hwNLefqGiVDJsj9hu+s
         pqtg==
X-Forwarded-Encrypted: i=1; AJvYcCU1lIVovh08exMODDpHaUwYPTQKk2uB4fxTG8I3rXFjq4i+ZU0c9HmKB6jij+e2FI3x0OnVBozZpgNBNyrHw3Wc@lists.infradead.org
X-Gm-Message-State: AOJu0YzLNA6hnxxfdVeQ02tjOGDrSgEXKsNZOK2ZWvrfRQnk6VNlHOfG
	S8SJ9e/LZwX6szdShsbkg7/MVlJ3ujLE9yVyGECOHwYha3ljTXBnPAhPEHDLsdQ=
X-Gm-Gg: ASbGnctAakEHd58I/EVMvudxiOvwRhzfLO+0KnRnQKiGCQCrWtnc1dMByPw98FBWFUF
	XBYJzHD025B1OxM5F/QjO8j8pxYwy0f9DCOWhpg9nFSnbuh0Qd4MeNeS4odRLxi5JomJPfJY1rQ
	HeuooKOriCt9GsnnFkyvs/rlFhnTpVVGjI0HkKeRH2nfC8KOwgZhgwuhuVFgdHMS5+wl9uxeopY
	YYRjXkI+2llLewhA8aYaOBDiZzIi43eLsIg0mnpVwYaXBO5W024c5e91hrn9fs2m7eYygmid6UQ
	jAJa9FOJFrMAOXfvmTA6MisNjXdbaueg9Ubd
X-Google-Smtp-Source: AGHT+IG+15flgGLqsMrZ5BL4gMnDHWQG9KiSz+F4gPV4kBjlj5dHbyvd5yf8E3fFs/QR/3iviG06Bg==
X-Received: by 2002:a05:6512:1150:b0:541:cdef:7ca3 with SMTP id 2adb3069b0e04-5422953c1a8mr3075505e87.27.1734951102906;
        Mon, 23 Dec 2024 02:51:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238216c0sm1231593e87.218.2024.12.23.02.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:51:42 -0800 (PST)
Date: Mon, 23 Dec 2024 12:51:40 +0200
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
Subject: Re: [PATCH v7 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <6mhlb26vdfc7v3jmb7y3tlcuo336x7vkblbkzd5sosd6urirou@bbfalnfisdij>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-10-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-10-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_025145_190607_15AAE4A6 
X-CRM114-Status: GOOD (  29.94  )
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

On Mon, Dec 23, 2024 at 02:41:37PM +0800, Liu Ying wrote:
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
> v7:
> * Add kernel doc for struct dc_drm_device. (Dmitry)
> * Fix regmap_config definitions by correcting name field, correcting read
>   ranges and setting max_register field.
> * Get instance numbers from device data(compatible strings) instead of OF
>   aliases.

Unfortunately no. Your instances are compatible on the hardware level
(at least they were with the previous versions, I don't think that
there was a silicon change).

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
>  drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>  drivers/gpu/drm/imx/dc/dc-drv.h |  29 +++
>  drivers/gpu/drm/imx/dc/dc-fg.c  | 378 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-tc.c  | 142 ++++++++++++
>  10 files changed, 810 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> 

[...]

> +
> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	void __iomem *base_top;
> +	struct dc_de *de;
> +	int ret;
> +
> +	de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
> +	if (!de)
> +		return -ENOMEM;
> +
> +	de->id = (enum dc_de_id)(uintptr_t)device_get_match_data(dev);
> +
> +	base_top = devm_platform_ioremap_resource_byname(pdev, "top");
> +	if (IS_ERR(base_top))
> +		return PTR_ERR(base_top);
> +
> +	de->reg_top = devm_regmap_init_mmio(dev, base_top,
> +					    &dc_de_top_regmap_config);
> +	if (IS_ERR(de->reg_top))
> +		return PTR_ERR(de->reg_top);
> +
> +	de->irq_shdld = platform_get_irq_byname(pdev, "shdload");

Nit: shdload or shdld? Which one is used in the documentation?

> +	if (de->irq_shdld < 0)
> +		return de->irq_shdld;
> +
> +	de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
> +	if (de->irq_framecomplete < 0)
> +		return de->irq_framecomplete;
> +
> +	de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
> +	if (de->irq_seqcomplete < 0)
> +		return de->irq_seqcomplete;
> +
> +	de->dev = dev;
> +
> +	dev_set_drvdata(dev, de);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	dc_drm->de[de->id] = de;
> +
> +	return 0;
> +}
> +

[...]

> +
> +struct dc_de {
> +	struct device *dev;
> +	struct regmap *reg_top;
> +	struct dc_fg *fg;
> +	struct dc_tc *tc;
> +	int irq_shdld;
> +	int irq_framecomplete;
> +	int irq_seqcomplete;
> +	enum dc_de_id id;

Why do you need to store it? This patch makes use of it just for the
registration.

> +};
> +

[...]

> +static int dc_fg_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	void __iomem *base;
> +	enum dc_fg_id id;
> +	struct dc_fg *fg;
> +	struct dc_de *de;
> +
> +	fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
> +	if (!fg)
> +		return -ENOMEM;
> +
> +	id = (enum dc_fg_id)(uintptr_t)device_get_match_data(dev);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
> +	if (IS_ERR(fg->reg))
> +		return PTR_ERR(fg->reg);
> +
> +	fg->clk_disp = devm_clk_get(dev, NULL);
> +	if (IS_ERR(fg->clk_disp))
> +		return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
> +				     "failed to get display clock\n");
> +
> +	fg->dev = dev;
> +
> +	de = dc_drm->de[id];

This depends on a particular order of component's being bound. If the
order changes for whatever reason (e.g. due to component.c
implementation being changed) then your driver might crash here.

This applies to several other places in the driver.

> +	de->fg = fg;
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry

