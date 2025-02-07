Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1E6C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 03:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScckE3sdkg/vVUj7WnXQkdjlruhwNWA4ty0J/lG2SIg=; b=kz5Qh0UXfUVGj4pq9R+e+fSTvv
	tPqQ0JnKMvuc1bQbiN+X3K05XL5QVer9eW9pAGiESfDg8v95RD2JZP2oAuY10kgQkg+ESy/HOWAkQ
	5euz+FQHiC4ZPaE0fjTdyFJKYHpXzf1ZXz++YpLJTbnOw93MqX8cYzE55iE1/nIHEz0VY9kK4yM/q
	B3nIi+1nZVFaOe6gwzucz/EIvyoeltGIioEgdfPKkuSU2+UVJftspUeeSke6fYNAwOSQJm/szsk6r
	P/XLDoHJsqTiaNbEpAxmtBrILr+vAxanlvrGm658UQJVAdovuuxQ+zjnRBy/4x5dV032Oo6S0eJdf
	6kHQs0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEfc-000000089jr-2mfV;
	Fri, 07 Feb 2025 03:04:44 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEeE-000000089O8-3F4e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 03:03:19 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so1626394e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 19:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738897397; x=1739502197; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ScckE3sdkg/vVUj7WnXQkdjlruhwNWA4ty0J/lG2SIg=;
        b=VfTf/Ba+yE2hNpGAWz0UxTFBFc6yvyNNdvgog+m9wH9pIoHB4C81mpQUpDoc1AgNMA
         7dRiTFgz+xKGqKdPwP9ju3yRRNBniw7wQx4vJ6PKJsBJ/t54JdqgTA7pzymAkBb0I3zP
         K4gszsGLdc7n7q+WxjJ+mgvYZeEYibCDpZ9lHZia0xlpw6yNjSj45fymUZgwZcUHH72x
         MDTPIGPe95ljCNJLy0pKOJnomlsE3P0tnY4yRhHlUEfYsvbULu85VFVqlirbgiCjKiCG
         8Ih+JTGlhuVYrAKIB+pAY2vjHY1I/fULNr8yA6Tl3mGN+tUINs0S6f2DOofirpn3fvSZ
         FOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738897397; x=1739502197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScckE3sdkg/vVUj7WnXQkdjlruhwNWA4ty0J/lG2SIg=;
        b=Kykq1IQyrA5MV1v8AcBiGuPOpdJNA/t4GrOfEqU0E7lVpFfKnI87Kf6uMhflA9JOMR
         rs5dKGHOlGCDb9su7OvYk2U7o7uiUklq2IZknUwmzouD5jQP0VrsK3n8b42uq8mHYtRD
         KPdNbWqqkG5UfSTMzd/wHiwHX+7sqzTakKgpYXmNPjBfeiLB8DWLiiMIqmwQDiBo/B/5
         BQhV6H3/cktyiue2FeqD6fg1X+x9jS8Et97Bkcnf3QATAUM0iGp5+rY/kzO6P3ovgc02
         mSzuTxPfOnMPYpPwaY3GgutYC4FU7EG/VkrCDeS0JE11LcoPbxciBbPEBpvcrNsJP/8X
         f1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqRjicWpeca5O0/QQXySbLhwtPgIaL250Su17f7B5vZGUs/nGmg7fIs6ZxAD+MmuRMtg241lqt5/8OZaFkwC1s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy96EZuaX3nRgxSqk0xSk1czPCIuFDA/vqaxF4ks/8rLc16zgZz
	W9QRdKbuhUOIOWYHVWu0XUwBs8zWP/Ukj8GladtvCRLdWrCN9tO4WjVTA9P/tdU=
X-Gm-Gg: ASbGnct3xYSlsohdvRDQzSfPqigpNa0ltEeZben3dLh1nffqs9yfXSX1LZHxVkI0WEC
	g0fH0CpNcf6XshzJCJe3tLO1Gz34uPHcnntWyRNHGeDSdcuAbvVYEw98kZKlIELrzBgBmSggwhQ
	Ha2Yj3mty0fGJvGLjFBM9SqRUrFGSa2I198ZWZt0h2G5l9vawD1d4/LSAd75kNmck2QjuLMkINR
	nUmqjVnYbXpZcrLIggq09FSEB+gT+7qSD/vIFtW1VmBofHkPKTwFkhy1PYzhL7v22GJFUmmi30a
	E+oDRf6t0nRdyUxFMWvswloLImsK46LD0RQEOZ3jGhgSJfJ3Bo1cNg1wY98R4/hObEPsTug=
X-Google-Smtp-Source: AGHT+IF1zkGPC274Byqhl5z75QjvE44TjiZdR7ZFTdBZSZkQteq90ey7AMuc2ci0aBKLn5vOWSqUSA==
X-Received: by 2002:a05:6512:2316:b0:540:1a40:ab0d with SMTP id 2adb3069b0e04-54414aa87e7mr369435e87.28.1738897396852;
        Thu, 06 Feb 2025 19:03:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54411cc9fa4sm261365e87.149.2025.02.06.19.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 19:03:15 -0800 (PST)
Date: Fri, 7 Feb 2025 05:03:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 13/26] drm/encoder: add drm_encoder_cleanup_from()
Message-ID: <spxzxwcs27uv2ttt5mh3r2767ihczvzzrtov6afdmex2ye7lam@r6kdqv5ocg5h>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_190318_815359_09211475 
X-CRM114-Status: GOOD (  25.85  )
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

On Thu, Feb 06, 2025 at 07:14:28PM +0100, Luca Ceresoli wrote:
> Supporting hardware whose final part of the DRM pipeline can be physically
> removed requires the ability to detach all bridges from a given point to
> the end of the pipeline.
> 
> Introduce a variant of drm_encoder_cleanup() for this.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v6: none
> Changes in v5: none
> Changes in v4: none
> Changes in v3: none
> 
> Changed in v2:
>  - fix a typo in a comment
> ---
>  drivers/gpu/drm/drm_encoder.c | 21 +++++++++++++++++++++
>  include/drm/drm_encoder.h     |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 8f2bc6a28482229fd0b030a1958f87753ad7885f..472dfbefe2960924a4e83bec425af8c7ef5f5265 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -207,6 +207,27 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  }
>  EXPORT_SYMBOL(drm_encoder_cleanup);
>  
> +/**
> + * drm_encoder_cleanup_from - remove a given bridge and all the following
> + * @encoder: encoder whole list of bridges shall be pruned
> + * @bridge: first bridge to remove
> + *
> + * Removes from an encoder all the bridges starting with a given bridge
> + * and until the end of the chain.
> + *
> + * This should not be used in "normal" DRM pipelines. It is only useful for
> + * devices whose final part of the DRM chain can be physically removed and
> + * later reconnected (possibly with different hardware).
> + */
> +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge)
> +{
> +	struct drm_bridge *next;
> +
> +	list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
> +		drm_bridge_detach(bridge);
> +}
> +EXPORT_SYMBOL(drm_encoder_cleanup_from);

Shouldn't drm_encoder_cleanup() also use this function?

> +
>  static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
>  {
>  	struct drm_encoder *encoder = ptr;
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 977a9381c8ba943b4d3e021635ea14856df8a17d..bafcabb242674880a97dfb62a50d93cc4d80c1d4 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -320,6 +320,7 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
>  }
>  
>  void drm_encoder_cleanup(struct drm_encoder *encoder);
> +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge);
>  
>  /**
>   * drm_for_each_encoder_mask - iterate over encoders specified by bitmask
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

