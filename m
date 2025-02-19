Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A39C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JParjzdc5yBYoG0m5UmXTy5mjDiWwZLgHUFOravZSiI=; b=aE9V6kP2xIfovLh+qI3NyZYzVZ
	xz7gPa6IN3LJ3HdE2NamAx8504ywm2cUdnSji7A9szXTRPMTcx8lvcGBAwrj/+SqrhtyviL2Be0Wp
	aLmy0/F3ru8sWQets8jauVq+5ARUIST1VuzVsoWLlYObl9BDKgbDBSO+bNUFP22AFR+i1toU8zDTN
	nreQco10J5WZW/zfec0WxNcx1IJjPBV0iuu761kUjie1lrK1KDH0TuVHko9AakWXdtm2v16kLkUK7
	qzfXTOOCdSy7j78eg9dvygfSd1BteEPHCgx8Umhyy9cIqKOW8YoALhCsUQ9EA6DYGqCWEFFrArN0S
	SsWKl9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgJ5-0000000BpMY-2WHv;
	Wed, 19 Feb 2025 09:23:51 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkg1u-0000000BjNn-31Ra
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 09:06:07 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54527a7270eso5038455e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739955965; x=1740560765; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JParjzdc5yBYoG0m5UmXTy5mjDiWwZLgHUFOravZSiI=;
        b=cExsSjyCLOJ2ndO1WnWmRyfWX4Mkd+w4vshHQFbnnpvxP2h1qz8dCnllRRaSHnMuOI
         SqGcdBVeVHE7Wr0Jn+x7FsDhjEOI2WSxmm6QeICS7IGdGzYlDjdd7hl8DrwzyoQ6rOQx
         Y31pmLCQpW3BDao89Rx8QGtGnBDqPes97Qi9+PwZa24hJ6hHfYkflTUnlOvnobZThb3x
         c/O1LyafzS83sVocniKdSYj/zOTSDQuamAGgvK8tk3Km/JIE4hnSbE6LMb/OuV+1P15J
         0oOGvKzI/ycT2scR4quXvFtx+3+kSUKyEK/BjT4isSjHG9SCElOsGB8MVkqFl/5SFzDO
         MG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955965; x=1740560765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JParjzdc5yBYoG0m5UmXTy5mjDiWwZLgHUFOravZSiI=;
        b=etEw1xm0BYGinswB+pQAiECC1dEPaZLuQuSi3pnsSVOzWqwunelFsISPHZ0QgGcveC
         qcbeDBdPMpBpmgStDqMvN7qDJA7Xl/AGlzN0j3F5paP2etYpG08WmDzMx2/yEhjf+4QA
         vOIM9xtdTQj8ric7Fvatu105bxw1AhHr8D6Fv3HDvVue0lq7xF7iWlD+3sCp1EkWdBDl
         bkIF1BFbGBwrSL8NW6f0QyscIliDFjeZ78zPomSe41Rg+CxqrH3eave1KmIJL2rziZbx
         yvJQywOPlvQRYwyUedzUXy/UGm9AQ2NMDGw3NEQKFizU5OWV4Bs/Igl787UkKO2D4H8f
         VLVw==
X-Forwarded-Encrypted: i=1; AJvYcCV3VFgMSm+ZHV2RHvoH+k/fRFs6pvyPpMKf3i4uhyrkXWYItww8nO3fhZt0yvi0iFsj67bBfDQi95fH7SCvN8Ey@lists.infradead.org
X-Gm-Message-State: AOJu0YxTWtteH/1iREZgV/R2MPVrp5H3Cuw5GHj932D9YO7DxtqjeIMy
	U69et3m/pnlGsWW+JQKonCUEkBTDN67kuwdVhPLWvVD/B85u+OivfabdIpMkCnI=
X-Gm-Gg: ASbGncuUSZUMauuMfDttKfomk1bFoiCl3bMXaOqyzODHP+cSMl95bRPFwHiYtL/pZGr
	TaBr/jusCLKrMvoMM8te4hf+SJUsdHeSeErSGGwV1KxSLZRmDCGGXKU53kYY9AehaRsHEyD2IYv
	dWY1rKeRFob4tsqc4witFl8C4REAyPMFkW1MVtVnkA3URverVT2//sinQxSIjf/C9HyVH24AHbT
	r1NgrDPopb6B4AnXoA/EHK/F6WqyUIlapUKSFyurbzXQ+GYlKb37/5ccqy6csQoBF3eOphmrSqq
	kFqMjD8wInZlnkCWEULsU435Jda+1SsvTwvQsXTKBx2hVzFEw+U+KklBmvqapnLxb+rRlYM=
X-Google-Smtp-Source: AGHT+IHm7rrZGF7gWE8rLuZPX4nvDlV3DcFc5Uk1QwC4R6ncjGo7U2SoOER3uymDvhu6BZaa/4okgQ==
X-Received: by 2002:a05:6512:3a94:b0:545:10bc:20ca with SMTP id 2adb3069b0e04-5452fe583c4mr6368433e87.24.1739955964491;
        Wed, 19 Feb 2025 01:06:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54530df9016sm1454714e87.36.2025.02.19.01.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 01:06:04 -0800 (PST)
Date: Wed, 19 Feb 2025 11:06:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_010606_769019_801A1605 
X-CRM114-Status: GOOD (  25.10  )
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

On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> Add helper functions to create a device on the auxiliary bus.
> 
> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> the same code repeated in the different drivers.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/auxiliary_bus.h |  17 +++++++
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> --- a/drivers/base/auxiliary.c
> +++ b/drivers/base/auxiliary.c
> @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
>  }
>  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
>  
> +static void auxiliary_device_release(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +
> +	kfree(auxdev);
> +}
> +
> +/**
> + * auxiliary_device_create - create a device on the auxiliary bus
> + * @dev: parent device
> + * @modname: module name used to create the auxiliary driver name.
> + * @devname: auxiliary bus device name
> + * @platform_data: auxiliary bus device platform data
> + * @id: auxiliary bus device id
> + *
> + * Helper to create an auxiliary bus device.
> + * The device created matches driver 'modname.devname' on the auxiliary bus.
> + */
> +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> +						 const char *modname,
> +						 const char *devname,
> +						 void *platform_data,
> +						 int id)
> +{
> +	struct auxiliary_device *auxdev;
> +	int ret;
> +
> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> +	if (!auxdev)
> +		return NULL;
> +
> +	auxdev->id = id;
> +	auxdev->name = devname;
> +	auxdev->dev.parent = dev;
> +	auxdev->dev.platform_data = platform_data;
> +	auxdev->dev.release = auxiliary_device_release;
> +	device_set_of_node_from_dev(&auxdev->dev, dev);
> +
> +	ret = auxiliary_device_init(auxdev);
> +	if (ret) {
> +		kfree(auxdev);
> +		return NULL;
> +	}
> +
> +	ret = __auxiliary_device_add(auxdev, modname);
> +	if (ret) {

This loses possible error return values from __auxiliary_device_add().
I'd suggest to return ERR_PTR(ret) here and in the
auxiliary_device_init() chunks and ERR_PTR(-ENOMEM) in case of kzalloc()
failure.

> +		/*
> +		 * It may look odd but auxdev should not be freed here.
> +		 * auxiliary_device_uninit() calls device_put() which call
> +		 * the device release function, freeing auxdev.
> +		 */
> +		auxiliary_device_uninit(auxdev);
> +		return NULL;
> +	}
> +
> +	return auxdev;
> +}
> +EXPORT_SYMBOL_GPL(auxiliary_device_create);
> +

-- 
With best wishes
Dmitry

