Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47949C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJ2zkKifpQ89f3hMtzxU+G41sKfC/86q4GHwa2AD6jI=; b=jpy0DXscpYoX6zE9vNrDZjQyVg
	5juk06JqwA0szyMVaJZv2FbB7QGvoYxNtokFsyT/P6m8mJn7TUNJgA+y6sDaPptkh9tg41LTS0xav
	4JI50tYs3Gb4xRQxydgGvNA1vMkltlt/bwqN4t41O7Cjo+XEsAhCXtQ3mL8NkvSgQsqaoytcBwQcu
	w+jyP1A9llNBeavZpe4MRsJmmJBLuo/d9cfKIZYXy36xKSp6kgxe8OEcV3NVs6AH1Fc5SgTUH2umh
	kqFbKCONumNLs8GKZX2xQScK38FMPYqUGKSQ2+lbP492QTstX3LFe1TCUYlFA9BcuDZgSJn42JuyI
	o1PgSwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgE74-000000085R2-3ZFv;
	Fri, 07 Feb 2025 02:29:02 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgE0l-000000084R6-2KaD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:22:32 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3076262bfc6so16351461fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894949; x=1739499749; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ2zkKifpQ89f3hMtzxU+G41sKfC/86q4GHwa2AD6jI=;
        b=PBnBcUZW88WiFJuHV57UcyrznbotalsSwhy0AUEzcKj+fXq7ma9Pb2H0uv0G645RYR
         7L0RI6fKEJXVxlZrL6zHMcIvCIYwMZ4QEKXEQmm8uSzUmy0WESS5s45hxi8SdV2ztlu4
         UfqqvUWGdV7Oy1GbDPcwglU1JrrMMc6Q+9DnCt1/nLeIvefXkC85+Bp7gtylQZG7Orvz
         KxrM+p8BXjpVxgRQO+MTStnzxSUO9J0l6pte8IL/AmxVIYnd9KqZUXs0AOJ5XgijyZR+
         4Z4JdW/A7/ZsOIDC1rFeZnwO+oFFQfS09iZVjFYyoE8LtwAkeTFUuN/D6HSOnAkVR75n
         87yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894949; x=1739499749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJ2zkKifpQ89f3hMtzxU+G41sKfC/86q4GHwa2AD6jI=;
        b=RzjySZilgKZEHVHrIs4D9a/qmV4VsNnbq38WKAXLKBxyROENwb9mvz8pVdVDmz2jFn
         sMQJFmF3Gj0AVXkdj0/Th7XTuLAfN4TFgX5IBoFiS9siPrfgLRa9waDmf8ZNxKf5tweG
         TPLJbnFrIu3smNb7FG8GaIzD5d8IuqYTfxHLXEltq7s97XOviukXMFFMvGiSNmFe6Pcw
         FgHaB8+VuKVw7TcofHnkpOt9bzHXvXlQ4Ay/P83QbPh8Umd6eOZCEwpErdqJWyRhJhJq
         cPSCV6szVqGkB/XTVNH4LAisZVXhRvDjo9t9A79E5K8c3KCOG5209d/7qOIoIoceSvEl
         Gd8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUX2J8UbjjYBLg9WqV7ExokncDutV2ch2erN5jVF1eS6l/flQ3/WmOzQd3DhBYiAgr+/N95JAi8wuIhRjivZdhq@lists.infradead.org
X-Gm-Message-State: AOJu0YwprqDBoAnX2dSNXx+cy6MPOTtomPpEozNWJJV6F1X0+0jqBbCR
	IAU077H6A8LAChlPBfua4T112rDJ2nbmPbewXFBIcPwSuKrFL8cyEmiy2qguGRQ=
X-Gm-Gg: ASbGncv8muCRFkx/ZAhsK+j6sGZzhGp+Orkf4tbhw7S1RyFh7VQlZB6EQO7putZMfTj
	KfgxEv01iS7DuaQSolYF9bmmzYxW7Wt+/l4v0C0fI7Q+Ig0uPaOSRUND8llRK2eo8CpXpjmqjZ4
	O4Ztva9FrWodTE3DQ8R8AfnZH/+N/dk4HJofKYgWEf2GSl0mQGtbksDWG/jjplGjX+IYiByNi3F
	TLdLDXwFoM++JHF9wGv3GSCSLaXgE/CnJa1I2Kee9uV9/dL3UAvxM1tS9Eb+8l0Q3foevWvxGcw
	RrPUKXjGvQIakJcF6RlkX8TIPJsAPw7RDFH/YdPmPTFsHbTiP2/SNkOonQo+djQ9MAVFMVQ=
X-Google-Smtp-Source: AGHT+IGYPeDLkcUcJNuKIyN2Hu1GKaefHM6B17kcLxSwD3vE/zsB8TapdQI7IpzwkzI9FScw1YMjSg==
X-Received: by 2002:a2e:be21:0:b0:300:3de4:ff72 with SMTP id 38308e7fff4ca-307e5a739e3mr2648431fa.27.1738894949030;
        Thu, 06 Feb 2025 18:22:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a67c9sm2915881fa.48.2025.02.06.18.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:22:27 -0800 (PST)
Date: Fri, 7 Feb 2025 04:22:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 04/26] drm/bridge: panel: drm_panel_bridge_remove:
 warn when called on non-panel bridge
Message-ID: <cpe634qeg46gfph6diw7lshdiolnpmuik3nmd4fpayg4st5r55@5bcfdwjme7z7>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_182231_591656_C1AC55E5 
X-CRM114-Status: GOOD (  22.08  )
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

On Thu, Feb 06, 2025 at 07:14:19PM +0100, Luca Ceresoli wrote:
> This function is for panel_bridge instances only. The silent return when
> invoked on other bridges might hide actual errors, so avoid them to go
> unnoticed.

Is there a real case of something using this function in a wrong way?

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 0c5db13b11dcb90ee88b9932b91aa05fc48d59bd..c57036b06493a6922e2cae38bcd1733930ff0073 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -322,8 +322,10 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
>  	if (!bridge)
>  		return;
>  
> -	if (!drm_bridge_is_panel(bridge))
> +	if (!drm_bridge_is_panel(bridge)) {
> +		drm_warn(bridge->dev, "%s: called on non-panel bridge!\n", __func__);
>  		return;
> +	}
>  
>  	panel_bridge = drm_bridge_to_panel_bridge(bridge);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

