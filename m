Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B69C02192
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 03:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riZEsBjGD+WMkPhrq6w9Y2zbnt1QJbZcmX3HYuho+5I=; b=NnbtNAA83JnjCfaB4iTrX00iGC
	TRlH8b1ao14Clx/b0++87cbj+vggNQi9tRhB7JfblJpesRzgIWHReEd+sfC1rba3ahsQzuiwtDkIa
	Sq1WAchJs9SANn3G8h8WY0cmmqs2STy+iuU+Pg3lA5DMbTR/FFY9ALo6dEp9M4Ae4z8TooLYiZQYc
	ZxjvIphkF/EPsDIFNC2+GViMJ6Z1bOEAUnhoJKdV1q1PYg8tg4pbNJxxd+vMlPxVCkCv1QGnvndf1
	p4RgGlBUXsNDWob3fSUoFdTCeRdBQ6xR04UqGSw7+XEm5tkOTN2TYcVZUnT4VDbj+nVwzU4mJkTu5
	bV/EzSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsK9-000000057GX-3IPz;
	Thu, 06 Feb 2025 03:13:05 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsIl-0000000575V-2aiT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 03:11:40 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so390791e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 19:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738811498; x=1739416298; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=riZEsBjGD+WMkPhrq6w9Y2zbnt1QJbZcmX3HYuho+5I=;
        b=HJ1tNfvAroFdvbbH1KmA7sESzBlZ6OAads+ILahEHq9U5RJNcsHRSpRTGYJBf0vDiK
         UN156PdC9GoplC4fi1hOmw0yx1FHpTUIV9ud94pJ/Tcq19WhKLmYcKS8BIAZpOEIrSQS
         g7QYs7ofSR3Xagspn7I6aJ/EyTSTZ9erbzU3UUS8bJOb6B4bQ36eH4cRZJ7YJdYpD4zG
         zpw67DK1MKH04qu709fId1BVeST23x7+tRqQrZlR71w0cMLEitZZL4mNHjHGOKkZJbol
         JYbajCLgFK2r2pycgsuOEpcwybdQFSxjDInPUCMDs9qNFSbsJSKXw9dXLcNdjRMdsLgj
         mt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811498; x=1739416298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riZEsBjGD+WMkPhrq6w9Y2zbnt1QJbZcmX3HYuho+5I=;
        b=l0UO4p4Rcf6jhmvgXyiT/eOEvKdT1zqzR2iWoYEyZYzfE1myG7IUnrZkQ4+Fl5+AtR
         h/QNO8aSlNzgkw99gpL6F7yVtI0Y43zTWOk0WICIAWwIlP3sqrXTwyb321//1nLmRjzm
         3/pT5Py9rW0iqFEs9/wU4dUWXoVNm9yfd9QPNRfY4jXX6bWWoEk+vA35W/veHWVgW1bN
         ezqGahj3PitMUyTybRohPiz0gf1ZU+0Y4z2NeuSbl46WL+W5JGLs/p98n9VFQBDtijuG
         N1SXV45mCNcr8sYkf1tQEn2AdLAzKE/ZwWYrZ/35gr/cOspZdtuHlHUhlNC5/nE8TqKn
         32RA==
X-Forwarded-Encrypted: i=1; AJvYcCUhQdaBXbhST4MkSUVyC7YuOaIy+f9qqw7eHStEPUbRfPRmgasiyHELe2TM8EJi5XPwJx795rzJeTfoEsDJZdLd@lists.infradead.org
X-Gm-Message-State: AOJu0YwVR1dPYjEcrYUFQYyMnt409JshmqjMX6X1lBLPq6aGevMb7Box
	iDVsFmpULrlJicGYHRCF465Gi1aiZ5FNBQbpq64qOZV6Ks5LqtrnH656Wc1D1G8=
X-Gm-Gg: ASbGnctEFSUYZH5458/nWYI2TGaW5Kgd5Rqob9NldVWq+xP/PLfSgUcabPN/YVHoEYi
	PH5bGTjwfbSb4uy7zJ9wJcSvuqhl4qQm++F3ymqHmK7novsOYnsASw60Gf2ufvZUiC0DhJgq9zI
	MaoIuOejcwIzITcOggKocypHSasTgBJ+fW1u7lb9xkGZotlLqTcO/zDZ2Quou6qTd/8DHU1pU5f
	PaDPLxH51qriwIO5H9mrAVcQ1Aa5XfudghTecWA9cpApB/kmYPIRK+NneqclDInryP7/dYPNsbJ
	ncorMsrBz1ibd/89EX3zUyiFj5zVimOhLkO38Sxr3nTkunVoqkOWFZ4UwUEJd9rAkrOjuJA=
X-Google-Smtp-Source: AGHT+IG7cQyWk5BClZUOKBlAbFSkmSlCgj+5e1lmNN+0LsHPGyFIdpVIo0QGlnaSeGvuHE71RAIFfQ==
X-Received: by 2002:a05:6512:3f07:b0:542:2a29:88ed with SMTP id 2adb3069b0e04-54405a68aecmr1721549e87.44.1738811497642;
        Wed, 05 Feb 2025 19:11:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f336dsm20237e87.201.2025.02.05.19.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:11:36 -0800 (PST)
Date: Thu, 6 Feb 2025 05:11:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v5 3/5] drm: panel: Add a panel driver for the Summit
 display
Message-ID: <jubbid3i7revhr4dg2dp6mbnja3yvrndwncppfx66ftnryx47d@q645nyfiaav4>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_191139_661935_6117DD08 
X-CRM114-Status: GOOD (  19.83  )
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

On Wed, Feb 05, 2025 at 11:10:52PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This is the display panel used for the touchbar on laptops that have it.
> 
> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig        |   9 +++
>  drivers/gpu/drm/panel/Makefile       |   1 +
>  drivers/gpu/drm/panel/panel-summit.c | 132 +++++++++++++++++++++++++++++++++++
>  3 files changed, 142 insertions(+)
> 
> +
> +static int summit_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode = drm_mode_create(connector->dev);
> +
> +	connector->display_info.non_desktop = true;
> +	drm_object_property_set_value(&connector->base,
> +				      connector->dev->mode_config.non_desktop_property,
> +				      connector->display_info.non_desktop);
> +
> +	mode->vdisplay = 2008;
> +	mode->hdisplay = 60;
> +	mode->hsync_start = mode->hdisplay + 8;
> +	mode->hsync_end = mode->hsync_start + 80;
> +	mode->htotal = mode->hsync_end + 40;
> +	mode->vsync_start = mode->vdisplay + 1;
> +	mode->vsync_end = mode->vsync_start + 15;
> +	mode->vtotal = mode->vsync_end + 6;
> +	mode->clock = (mode->vtotal * mode->htotal * 60) / 1000;
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	mode->flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC;
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +	return 1;
> +}

I think most of the drivers store mode in a static var and then use
drm_connector_helper_get_modes_fixed(). It's a matter of taste, but I
think the latter one is a nice helper.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +static const struct drm_panel_funcs summit_panel_funcs = {
> +	.get_modes = summit_get_modes,
> +};
> +

-- 
With best wishes
Dmitry

