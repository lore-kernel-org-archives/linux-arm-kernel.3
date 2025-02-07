Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C8BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lzta5S0gzTGOLstB++0r/Lba8xmTnzwJ+9gzDMBGEjI=; b=EegwDkVfyWZaZ5fSqBggEg+veb
	uxb89CBP9mElJf8EeE+vVJ8tzW12uvHluu0960Xlg2y7eM0/BUJA2jdmHioeONFMF6z5RY+hsSZ/E
	MB/q2qqI8NrDhj/NsLdbzuPod5ZhJFlRND/9Z0YHiOeE4iWmm4NPhnVtywfJP9p+LZGgfzPys/s7i
	QkMmanA9hQF7wgAYboD7CZrhb6FRsFPRVVOkoYpLKFbTsPAzbtnSFIysbIropIeg8MCOQBjNOle8f
	R1zApRBC2zCnWW9KqIim/V6q3+bPatW6czd3s1Ec5fpwr4s6zC7olimCpJfHfTOQIZ+9tkaxOi1pv
	C2+wzr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgE31-000000084x3-1CuB;
	Fri, 07 Feb 2025 02:24:51 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgE05-000000084C1-1EfO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:21:50 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-543cc81ddebso1830010e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894907; x=1739499707; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lzta5S0gzTGOLstB++0r/Lba8xmTnzwJ+9gzDMBGEjI=;
        b=j3kNV7IJsl8pq2UnC1u2fn7iIMoGhRtozlRw4eBFq8pN7gOyHvN+pMcK8sWc0i+Cqn
         0UUu21Ztw/74Qxu7/LoOxOpH5fr7xtrKP8x1VW4YVXAYRPxZW+RUv4oe+RAeukKHj4Ow
         umr/tICADOkmHsFNaaMqZAfsBlPHEmg/xE3OhRC4jsXrn+wDMTFDOVkNtZgZL02/Ao94
         dsSusZ8+ooebHiKBok6thudmYr9XPpe9CKyzcpjbcGPLFkWz18VErfAhy58kWM5B0tOG
         WSaKOeeAox0mxsX3pHLIEncTwFCMygcoHbyedthk7wlI9ih24yRjDq1olUDz+PpGDmvC
         HoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894907; x=1739499707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lzta5S0gzTGOLstB++0r/Lba8xmTnzwJ+9gzDMBGEjI=;
        b=dqWyAousG6CugCAc6mK9dZW+4+3tB/IMAN6SVZQVkf6ywG3oIokxRaWwjl1ATcFggo
         WtB12B3CltjHw3ZNPy5azD79sTIxVAZ/lU66Xhg+fMSgGmc6B7Mu0muWqGGNQAAEJA4l
         5w340LhbMTzrbx1siURXxPD+0wPzf/WnDSZBeaRJ+QWrkrTXEmm8otvck/7JHtCpKwcM
         SB91bmjyVUyTFa5nl515wfxU6XNhtAdnQFlGYcWagnHIMw9+L6VIuphCXOPy0IAmmtHb
         X4xKuwZ4AGkY8b+zkOTND3qZyNAismNBzTbZfaDEmCY+EAr4aA/5oY389SfiuCjrGYlB
         LWgA==
X-Forwarded-Encrypted: i=1; AJvYcCUbRxHGhPYSZvvznr/RPmWWXb6jWtR80rgXFXBWFT9pkQxmvkpYwk16XGkz/b1qhziuCC5LdLH2kKJOgHA2weCz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkk3p8FyvqniKfIP/g9TKsAtnvoBetM/xNz1o5Hx595x6XxeHv
	Jwhkj8yTpHieSOaNVDmXSer0wliwz5Z7s7FlYgYmKE/wBxfYRAuTYQ8S4hkLx9U=
X-Gm-Gg: ASbGncs34QB/YLtVE+Qj0T3vSJqFiT5LeZJeT8rsWeFzB0nvZspYXoacRkDCt7qQHXm
	9VDkeb1Im0SFIDiGWaG+XOOGjDRaDkF8EGeyoJEZ6AYFp1HG7CjZopXxPnstf824tNL5HwKu6DI
	yv1S0fkKUzBMewXs7NGOi5tWtaXTQVl3XGiTvugXXuy39htGqq9pERjnpPzYwS6RTzUbL+Txs4R
	SM+tmoeHSqpnzI7WgPbuNH0QwVxIv0tayYUcmLpY390dW3ul2NmjlHyONYiakx2NxUVfwi9L0j7
	57XxZP7VSv3NUinexRxuwwG+wslObMIklUyBNv2NC+IALapkgAySkx6Ji7W63tYzoqXPdVs=
X-Google-Smtp-Source: AGHT+IEEMycc7B1Xywi6/voRjDNNe0jaAwgIo39w5VQbQbJyRuz6zbWk5Cv25Kf+Od2N2WEWuA4GlA==
X-Received: by 2002:a05:6512:3d0b:b0:542:2388:3f09 with SMTP id 2adb3069b0e04-54414ae0b88mr338836e87.37.1738894907389;
        Thu, 06 Feb 2025 18:21:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053eb2dsm296973e87.28.2025.02.06.18.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:21:46 -0800 (PST)
Date: Fri, 7 Feb 2025 04:21:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 03/26] drm/bridge: panel: use drm_bridge_is_panel()
 instead of open code
Message-ID: <yokzxkh2fobfvrvcsp72o7j44tnhhb7w7sf5ofvsuibivju2my@bpauhrvwpkmh>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-3-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-3-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_182149_350976_701534C3 
X-CRM114-Status: GOOD (  15.95  )
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

On Thu, Feb 06, 2025 at 07:14:18PM +0100, Luca Ceresoli wrote:
> drm_panel_bridge_remove() reads bridge->funcs to find out whether this is a
> panel bridge or another kind of bridge. drm_bridge_is_panel() is made
> exactly for that, so use it.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

