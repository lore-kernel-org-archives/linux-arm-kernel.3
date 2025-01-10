Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08DCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P7iNv0mAXeAGSKfCf0HUawhqYYLf6sisnMlgkknW/s=; b=fwVL0XFS4DSliyqieaBUqLCFaS
	04fVGshpzoeMC1SJ4GRNh2PaoQYH8yBvJAJfi6o7OG20PmMTVocDs55ub62ASIHODVNxHCJuxN8jV
	BKuIUEEVv5IhljZAlyxhyxZwLi17SLdQJCMOkzWwIjGCMPhsuaRGGaawYj2nyvM0mE3fY26W8AI4D
	e6X2jXHzZqLLZWvXE1rnJS80a7Q8JMI2oMESL9J/Qpzc4GsynJ/QIed3emhc0m0KMCmhiQRpkWmj3
	5tHZyPvIjMfLHNHuEguIarZejMqEomU410j53uEBa+MqvmNbIMhShnIrsmxe2J8l4wsr1vkZhbwq1
	uZ/nSaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFGZ-0000000FVrs-1iIJ;
	Fri, 10 Jan 2025 13:41:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFBY-0000000FV0X-0AvP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 13:36:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43618283d48so15635455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736516182; x=1737120982; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8P7iNv0mAXeAGSKfCf0HUawhqYYLf6sisnMlgkknW/s=;
        b=kYtEKG0XjPlD5cG2TXhU6KZumr6Fs3DY58MQiHrKw377DhifyDxbiOPnrGLiNxhwkR
         ypdSLYPhh8VhRm+InahcAOnC7VnOOFubPFhF9i+TO+W73cZufr2ytDD2NEns/0SaQRSh
         ObBjXQ2MtNbHtVuEHVC6pJNazGZU5M1vwTaZP+2FpVSMh3NR3OdVUKBFyawKv1+9xph7
         dI3BJNAlSNFX3qEL4W9L7eS6DEdUe2lQdb8rgB3XllxliHc05aguO8k5OWlYHzeFfFAV
         2b+YD+5LkYct16hhkbO+wBB/y6Dk3rLg0sgckwQzIwHzuhbE5EbtIZdG4Bf2xURxblcA
         Dwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736516182; x=1737120982;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P7iNv0mAXeAGSKfCf0HUawhqYYLf6sisnMlgkknW/s=;
        b=N/PD8u0YG2hbvztQIY3AxhsKHTzDyf6la8cRgz6LIlkiBgKO5mFMNpWpODYoc45kep
         CiqpysgMwbUac8Adb546V80vrMtrmOHfCjkIdyKemt2yAy8RZWuuOaxsF83bKOkDXllH
         9rYly8mmWiiHBV2YIuzeA8cJt5EtFspud0RNXPw3CD1Q34VMTs/2qVD55pVjQs3CZNFq
         Ryz4OD/dpvH2TsN4vdlOHv38xupvO8J9Qcnm+R0XOAP0oThJ1BtW4XDZV1tI4C5K8Sqb
         QTlZdceq6f24oqqMlJ76TK6pJ++I+9jwPj1RGZJvSAI97rKypxCujWVLTg0pHYrwkqbI
         khug==
X-Forwarded-Encrypted: i=1; AJvYcCWyMXXU0MqeYXpJdZ3hyvdAOMbCzfMODTMpF/Ywpy3DZCFezX3jqjEjfBZRlN41crH2OzX4LMvJq9uIG0H+3A/K@lists.infradead.org
X-Gm-Message-State: AOJu0YzK1S+Bc0X0PWUUormnfNMtdsovoeC+D+ebrt12mj+op9CdlVzl
	nbmA14goC1RLGKpF0o341cCleuZxq0T/Hdt32GExri580Pvie7+0h3vXmSZpGb4=
X-Gm-Gg: ASbGnctbl2ywP9V8BQJNqrR4qhSEhrJEivhbC/9mGRTk1GhwaOk+gi/apiHkMtBZNzD
	DLOp/gPeUaeFBKyLLblJxEP4m3AQ9LX3cduh+fneent7dWTzkBtdNUcy8kPYi8B1iJZ+CFZ1POw
	5msM1THj2g1/RpZDnoHrUUDtP7kxELpoQeRS7HjmGTl8GVk+RL76HF8AH3Eeq9iaPmdG4Gl/QjJ
	vlIU42NvxxIi16zplnFbluw4C4/iQpPpZbQ862pHpsTtjLMOWKlqno=
X-Google-Smtp-Source: AGHT+IE2t38/6Fgkasnk5z1oGlZWIwNNkxu56/ClKRywxNOMHRMUbu2KBmbq53eWMrvzd2a8fGu+uA==
X-Received: by 2002:a05:600c:5486:b0:434:f131:1e64 with SMTP id 5b1f17b1804b1-436e2696d1fmr96900075e9.9.1736516181737;
        Fri, 10 Jan 2025 05:36:21 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f3f7:a818:65b5:3db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e383dedsm4640121f8f.35.2025.01.10.05.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:36:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  ao.xu@amlogic.com,  dri-devel@lists.freedesktop.org,
  linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] drm: meson: add S4 compatible for DRM driver
In-Reply-To: <20250110-drm-s4-v1-3-cbc2d5edaae8@amlogic.com> (Ao Xu via's
	message of "Fri, 10 Jan 2025 13:39:53 +0800")
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
	<20250110-drm-s4-v1-3-cbc2d5edaae8@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 14:36:20 +0100
Message-ID: <1j8qriaizv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_053624_086982_C723EDB3 
X-CRM114-Status: GOOD (  27.73  )
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

On Fri 10 Jan 2025 at 13:39, Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org> wrote:

> From: Ao Xu <ao.xu@amlogic.com>
>
> Add S4 compatible for DRM driver. This update driver logic to support
> S4-specific configurations. This also add vpu clock operation in
> bind, suspend, resume, shutdown stage.
>
> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 127 +++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/meson/meson_drv.h |   6 ++
>  2 files changed, 132 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 81d2ee37e7732dca89d02347b9c972300b38771a..d28094efeb137ae0b9990ab3608825d563358dba 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -11,6 +11,7 @@
>  #include <linux/aperture.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
> +#include <linux/clk.h>
>  #include <linux/of_graph.h>
>  #include <linux/sys_soc.h>
>  #include <linux/platform_device.h>
> @@ -160,6 +161,34 @@ static void meson_vpu_init(struct meson_drm *priv)
>  	writel_relaxed(value, priv->io_base + _REG(VPU_WRARB_MODE_L2C1));
>  }
>  
> +static void meson_setup_clk(struct meson_drm *priv, bool enable)
> +{
> +	int ret;
> +
> +	if (!priv || !priv->vpu_clk || !priv->vapb_clk)
> +		return;
> +
> +	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
> +		return;
> +
> +	if (enable) {
> +		ret = clk_prepare_enable(priv->vpu_clk);
> +		if (ret) {
> +			dev_err(priv->dev, "Failed to set vpu clk\n");
> +			return;
> +		}
> +		ret = clk_prepare_enable(priv->vapb_clk);
> +		if (ret) {
> +			dev_err(priv->dev, "Failed to Set vapb clk\n");
> +			clk_disable_unprepare(priv->vpu_clk);
> +			return;
> +		}
> +	} else {
> +		clk_disable_unprepare(priv->vpu_clk);
> +		clk_disable_unprepare(priv->vapb_clk);
> +	}
> +}
> +
>  struct meson_drm_soc_attr {
>  	struct meson_drm_soc_limits limits;
>  	const struct soc_device_attribute *attrs;
> @@ -241,6 +270,83 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  		goto free_drm;
>  	}
>  
> +	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sysctrl");
> +		if (!res) {
> +			ret = -EINVAL;
> +			goto free_drm;
> +		}
> +		/* Simply ioremap since it may be a shared register zone */

This comment, the name of the zone and even the usage you are making of
it clearly show this is repeating the error of past, directly accessing
improperly shared registers which should otherwise have been implemented
as proper controller using the kernel available framework, such PD, phys,
clock, reset, etc ...

Worse, it gets encoded into the dt binding, making extremely difficult
to fix later on.

> +		regs = devm_ioremap(dev, res->start, resource_size(res));
> +		if (!regs) {
> +			ret = -EADDRNOTAVAIL;
> +			goto free_drm;
> +		}
> +
> +		priv->sysctrl = devm_regmap_init_mmio(dev, regs,
> +						  &meson_regmap_config);
> +		if (IS_ERR(priv->sysctrl)) {
> +			dev_err(&pdev->dev, "Couldn't create the SYSCTRL regmap\n");
> +			ret = PTR_ERR(priv->sysctrl);
> +			goto free_drm;
> +		}
> +
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "clkctrl");
> +		if (!res) {
> +			ret = -EINVAL;
> +			goto free_drm;
> +		}
> +		/* Simply ioremap since it may be a shared register zone */
> +		regs = devm_ioremap(dev, res->start, resource_size(res));
> +		if (!regs) {
> +			ret = -EADDRNOTAVAIL;
> +			goto free_drm;
> +		}
> +
> +		priv->clkctrl = devm_regmap_init_mmio(dev, regs,
> +						  &meson_regmap_config);
> +		if (IS_ERR(priv->clkctrl)) {
> +			dev_err(&pdev->dev, "Couldn't create the clkctrl regmap\n");
> +			ret = PTR_ERR(priv->clkctrl);
> +			goto free_drm;
> +		}
> +
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwrctrl");
> +		if (!res) {
> +			ret = -EINVAL;
> +			goto free_drm;
> +		}
> +		/* Simply ioremap since it may be a shared register zone */
> +		regs = devm_ioremap(dev, res->start, resource_size(res));
> +		if (!regs) {
> +			ret = -EADDRNOTAVAIL;
> +			goto free_drm;
> +		}
> +
> +		priv->pwrctrl = devm_regmap_init_mmio(dev, regs,
> +						  &meson_regmap_config);
> +		if (IS_ERR(priv->pwrctrl)) {
> +			dev_err(&pdev->dev, "Couldn't create the pwrctrl regmap\n");
> +			ret = PTR_ERR(priv->pwrctrl);
> +			goto free_drm;
> +		}
> +
> +		priv->vpu_clk = devm_clk_get(&pdev->dev, "vpu");
> +		if (IS_ERR(priv->vpu_clk)) {
> +			dev_err(&pdev->dev, "vpu clock request failed\n");
> +			ret = PTR_ERR(priv->vpu_clk);
> +			goto free_drm;
> +		}
> +
> +		priv->vapb_clk = devm_clk_get(&pdev->dev, "vapb");
> +		if (IS_ERR(priv->vapb_clk)) {
> +			dev_err(&pdev->dev, "vapb clock request failed\n");
> +			ret = PTR_ERR(priv->vapb_clk);
> +			goto free_drm;
> +		}
> +		meson_setup_clk(priv, true);
> +	}
> +
>  	priv->canvas = meson_canvas_get(dev);
>  	if (IS_ERR(priv->canvas)) {
>  		ret = PTR_ERR(priv->canvas);
> @@ -424,12 +530,21 @@ static const struct component_master_ops meson_drv_master_ops = {
>  
>  static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
>  {
> +	int ret;
>  	struct meson_drm *priv = dev_get_drvdata(dev);
>  
>  	if (!priv)
>  		return 0;
>  
> -	return drm_mode_config_helper_suspend(priv->drm);
> +	ret = drm_mode_config_helper_suspend(priv->drm);
> +	if (unlikely(ret)) {
> +		drm_err(dev, "suspend error: %d", ret);
> +		return ret;
> +	}
> +
> +	meson_setup_clk(priv, false);
> +
> +	return ret;
>  }
>  
>  static int __maybe_unused meson_drv_pm_resume(struct device *dev)
> @@ -439,6 +554,7 @@ static int __maybe_unused meson_drv_pm_resume(struct device *dev)
>  	if (!priv)
>  		return 0;
>  
> +	meson_setup_clk(priv, true);
>  	meson_vpu_init(priv);
>  	meson_venc_init(priv);
>  	meson_vpp_init(priv);
> @@ -458,6 +574,7 @@ static void meson_drv_shutdown(struct platform_device *pdev)
>  
>  	drm_kms_helper_poll_fini(priv->drm);
>  	drm_atomic_helper_shutdown(priv->drm);
> +	meson_setup_clk(priv, false);
>  }
>  
>  /*
> @@ -471,6 +588,7 @@ static const struct of_device_id components_dev_match[] = {
>  	{ .compatible = "amlogic,meson-gxl-dw-hdmi" },
>  	{ .compatible = "amlogic,meson-gxm-dw-hdmi" },
>  	{ .compatible = "amlogic,meson-g12a-dw-hdmi" },
> +	{ .compatible = "amlogic,meson-s4-dw-hdmi" },
>  	{}
>  };
>  
> @@ -539,6 +657,11 @@ static struct meson_drm_match_data meson_drm_g12a_data = {
>  	.afbcd_ops = &meson_afbcd_g12a_ops,
>  };
>  
> +static struct meson_drm_match_data meson_drm_s4_data = {
> +	.compat = VPU_COMPATIBLE_S4,
> +	.afbcd_ops = &meson_afbcd_g12a_ops,
> +};
> +
>  static const struct of_device_id dt_match[] = {
>  	{ .compatible = "amlogic,meson-gxbb-vpu",
>  	  .data       = (void *)&meson_drm_gxbb_data },
> @@ -548,6 +671,8 @@ static const struct of_device_id dt_match[] = {
>  	  .data       = (void *)&meson_drm_gxm_data },
>  	{ .compatible = "amlogic,meson-g12a-vpu",
>  	  .data       = (void *)&meson_drm_g12a_data },
> +	{ .compatible = "amlogic,meson-s4-vpu",
> +	  .data       = (void *)&meson_drm_s4_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
> index 3f9345c14f31c13b071f420533fe8a450d3e0f36..c801a2e3e55a054247710aebae5602e44c9e1624 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -22,6 +22,7 @@ enum vpu_compatible {
>  	VPU_COMPATIBLE_GXL  = 1,
>  	VPU_COMPATIBLE_GXM  = 2,
>  	VPU_COMPATIBLE_G12A = 3,
> +	VPU_COMPATIBLE_S4 = 4,
>  };
>  
>  enum {
> @@ -45,6 +46,11 @@ struct meson_drm {
>  	enum vpu_compatible compat;
>  	void __iomem *io_base;
>  	struct regmap *hhi;
> +	struct regmap *sysctrl;
> +	struct regmap *clkctrl;
> +	struct regmap *pwrctrl;
> +	struct clk *vpu_clk;
> +	struct clk *vapb_clk;
>  	int vsync_irq;
>  
>  	struct meson_canvas *canvas;

-- 
Jerome

