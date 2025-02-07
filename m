Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C329C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Nnc+VLoNy3XrMrlSAm4S+smEOzp9c+gb/eHhOZ1VIc=; b=OrUGoWxadZh1/OgW2DWYvkam3h
	GZ5unhGvbF19CJG9ssZsN7su1vRRtslMh56lhFAJlYsG1fkN6ndB/0tC2DE4/ecxfhfA+PxnE68Rx
	4tcZlQySjpWp2gsT4yNHiHod21nLD3ul18hUIO6RZdUYNwc+3kBLpuF7aNEcSCd3rNox1xLRy19Wn
	h44ns8TMM5uctOKgCJ72gdH7zsFrAgp+LEGvFRN1DDMSx1WvEWQ5En/DPM+v0Lut6QyMTPv48BV1f
	eN76kpanbdN5G/KMdDLfza9sOZpEoy8eVwI2UmF/W+mkZTvRx8u5zEkjsd51tiacluSeYkEb4105L
	XbF2q4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUz1-0000000B4KW-05N7;
	Fri, 07 Feb 2025 20:29:51 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUJg-0000000AxyT-1etf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:47:09 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-544fe4f254eso826569e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 11:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738957626; x=1739562426; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Nnc+VLoNy3XrMrlSAm4S+smEOzp9c+gb/eHhOZ1VIc=;
        b=XgFYm2/F3shTmCvF2X4rpqUwUSmr5R8CLZK8rchbAVFQcRhtYYK6lWRMAr0ZO57fvP
         hZxcUzJlZMfASKA0w/Lv84lqxqnmW20muVJpnulgLCyClI8LGuz4pKZaskBveHP9OhSp
         1l1xM/aIU2fUveQAyHEYpczaR9Rkd2xB88RiNlk6V9olip3CI8givFAkrVKMlSIj3oMo
         tkWJcDUnsYBdA9Kx0TBO8af06Klfw9i0FHHoiTWYC9sOgby49t9LDrPwJ+kxAB2pUdyb
         nD9TXYVikQZRJxENBaZbS4A4jjs9gPoHKdmD0a/PNDG67R30MSfQkjwvUE+tQ1D95++c
         ZE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738957626; x=1739562426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Nnc+VLoNy3XrMrlSAm4S+smEOzp9c+gb/eHhOZ1VIc=;
        b=DssFi8DAU7KMX677JonG+0lBwjU6cKE6n3RxBu1nB0GCqlj7cSCx4A0GSXZyqsBNuI
         qkXEkDsjVKGnqqahxEreT1J2qenCibsoUZmuU9W7ieJlfsq+pvyEp2y+5MJrMMExO6L2
         iLfDIo8yzwEv0zV+F5GgligVi6vweIPvjGzGZK26Mdw0kdXvy919AX3D0Y+OAp9090xz
         9FuUiExS10LZLXIFvEm4pJgNS7Rhwuv5XGsYAxBUtzOn4IyUT+ofneBar1uGPSyvvx16
         UkWKNTbA8CBCqeXenl4ILiJ6nJ9EKjicFRGD9J+jfZXsYRYDxfpFE8QFK5N5hEvnqc1S
         m1sA==
X-Forwarded-Encrypted: i=1; AJvYcCVFcqzAyLMHJcfytspnfdVzYaVF9wh8bhZ88H5bt0ySnx3nSsWkLOjbLEkXVER2eOMUUjLDKfAUd/ZbZ1XXIkxW@lists.infradead.org
X-Gm-Message-State: AOJu0YwwnWlc+BHEz4GlCuzxXBJROuB8MBey8rgN5bK2umhWis8dMlyi
	G+yUc9gCxnOExNeftSsbt/1Cwr0dYSzaqUbx9VblT/SBwQm+XWZMBsbHz6208Dg=
X-Gm-Gg: ASbGncv2wuRUZ5OQPB7dnu8EoQwcTMhJzFiajUvZdnp1jz8GPXXYJnAaxwNJMsmH7wq
	90YgqtIoJ9nEVAv3O56+WM5zrUcH48zJBCbY7F8FvSJS9ztfdmfuMr+pAZHdkkYs2fXg3PdUfxG
	r3MhIyI6WVbm6YTEqpmBZxZg7zHkRqkNcE9fb4qgrb+7xFFTHE3kGyLOpnzgI0wSgaZ22qpR+Aa
	8cVOkzZT8wqgotqVxtWbkOsEX6cINYCOLxNwH+aPIwZxv7s1mHUOYvtUvWgcLUI+e701kXYrYdU
	Ird4l9G5OPb8MK8ivGEM63m3wdXA7aXbRhT3mGvYxDAXc4dSGCHHwlE8z8Th2CAiKrnwShE=
X-Google-Smtp-Source: AGHT+IEX/wE6vKWAFwICx9CtlReQSMFmjn6yOfdCDmiizKZeJHyRie3LA+6lJskicwM/rhyEQV3BlQ==
X-Received: by 2002:a05:6512:34c2:b0:542:91ac:3f78 with SMTP id 2adb3069b0e04-54414ab8364mr1217019e87.17.1738957626455;
        Fri, 07 Feb 2025 11:47:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bfd35sm545378e87.115.2025.02.07.11.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:47:05 -0800 (PST)
Date: Fri, 7 Feb 2025 21:47:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 09/26] drm/bridge: move devm_drm_of_get_bridge and
 drmm_of_get_bridge to drm_bridge.c
Message-ID: <7tul5avfkrw7potqif4xbv57o2wp5suuiiqna2gzcd2z4wwyxg@c2qu7bigul67>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
 <aayr7q6i3x34xw7ivvapnk6h6mgx67qhpv2rqk2gotejyjetwy@olb5lbwxd5e3>
 <20250207095421.07ca853f@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207095421.07ca853f@booty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_114708_445130_E2721429 
X-CRM114-Status: GOOD (  42.23  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2025 at 09:54:21AM +0100, Luca Ceresoli wrote:
> On Fri, 7 Feb 2025 04:52:20 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Thu, Feb 06, 2025 at 07:14:24PM +0100, Luca Ceresoli wrote:
> > > devm_drm_of_get_bridge() and drmm_of_get_bridge() do not have anything to
> > > do with struct drm_panel anymore, they just manage bridges. So move them
> > > from bridge/panel.c to drm_bridge.c.
> > > 
> > > Move also of_drm_find_bridge_by_endpoint() which is used only by
> > > devm_drm_of_get_bridge() and drmm_of_get_bridge().
> > > 
> > > No code changes, only move functions to a different file within the same
> > > module and add an #include as needed.
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > 
> > > ---
> > > 
> > > This patch was added in v6.
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c | 102 -----------------------------------------
> > >  drivers/gpu/drm/drm_bridge.c   | 100 ++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 100 insertions(+), 102 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > > index 6995de605e7317dd1eb153afd475746ced764712..1230ae50b2020e7a9306cac83009dd600dd61d26 100644
> > > --- a/drivers/gpu/drm/bridge/panel.c
> > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > @@ -418,49 +418,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
> > >  }
> > >  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
> > >  
> > > -/**
> > > - * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> > > - * @np: device tree node containing encoder output ports
> > > - * @port: port in the device tree node
> > > - * @endpoint: endpoint in the device tree node
> > > - * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> > > - *
> > > - * Given a DT node's port and endpoint number, find the connected node and
> > > - * return the associated struct drm_bridge.
> > > - *
> > > - * Returns zero if successful, or one of the standard error codes if it fails.
> > > - */
> > > -static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> > > -					  int port, int endpoint,
> > > -					  struct drm_bridge **bridge)  
> > 
> > I'd say make this function the main API instead (and name it drm_of
> > rather than of_drm, this can happen in the previous patch).
> 
> I agree there should be a small number of APIs for the foreseeable
> future (and any number of, hopefully decreasing-at-some-point,
> deprecated ones).
> 
> And I agree this one ^ and the devm_drm_of_get_bridge() below are
> equivalent, despite having different signatures, and so one should
> disappear.
> 
> So, time to think about what APIs we want. Some thoughts of mine:
> 
>  * I prefer "get" over "find", looks more intuitive as these functions
>    will drm_bridge_get()
>  * Is there a logic between of_drm_ and drm_of_? Just "the former is
>    old and deprecated"?

I don't know, it might be historical. Nevertheless, I think, having just
drm_ prefix for all DRM-related symbols is a good idea.

>  * Since getting bridges via the endpoint is the preferred way, I'd
>    like this function to have a shorter name than its variants
>  * Returning a struct drm_bridge err_ptr looks better to me than
>    returning an error and the bridge via a ptr-to-ptr, especially as we
>    don't have anymore the case of returning a panel or a bridge from
>    the same function
> 
> So, bottom line, we'd have:
> 
>  - struct drm_bridge *drm_of_get_bridge(np, port, endpoint)
>  - struct drm_bridge *drm_of_get_bridge_by_node(bridge_np)

I think these two are fine, please go with them

>  - devm_ and drmm_ variants of the above

These two are only necessary for the refcounted bridges. I'd say, skip
them as a part of the panel / bridge patchset. Please don't
overcomplicate it too much.

> 
> or a subset of these, in case some is not needed.
> 
> What are your opinions?
> 
> > > -struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> > > -					  struct device_node *np,
> > > -					  u32 port, u32 endpoint)
> 
> ^ kept for reference
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry

