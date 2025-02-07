Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A9DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1QxMKnddA91WCGvSvK0Kv8+Ui7raPxM47ZCxWA1T70=; b=wsB5xRDHYk+1xqLcUDSLLKbYcH
	G1v6DOaMq0ol4HvkG/U1NWndCTWQrtKCIGrgcd2yxODzDX7Y+RI12/KeG+wfZQL4Xq6Qpr8J5zSea
	NEu9bucda3TH+o6RwCpGv1oVT6o1CoXNsuxhhNX5/1RbAmLQVOXrVg1yktJBmlbThySw2I00GpbPG
	/NegAud0d3qcNef0Wu6VynKffRMlhMIq0PtAZE10L9RPy3ogAu3h9pkbz5FwUh5Wes9dULWEczJ2M
	ckCvMeYhhL9G6qyaTYCWQQbV0LKQABea6rIRNd1pgAX2rgAR2R1NPG5D3sAnwAh5Rh/tIec8gXUct
	xA5b8B2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgESB-000000087jq-2MMd;
	Fri, 07 Feb 2025 02:50:51 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEQp-000000087ak-0DU9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:49:28 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53e3778bffdso1649606e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896565; x=1739501365; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x1QxMKnddA91WCGvSvK0Kv8+Ui7raPxM47ZCxWA1T70=;
        b=gesXZiUE0jAXuQc0CDUjkSWGGw46fe2WoPTBHTbkK5braHtua5yusm4aZU+RfWElKJ
         44dryuJuapi7QIaiA4yj/rDAaEDT8e1hsy6UQs2PJJd5wGvJSmMmIr1iD1ECFbxvYxeh
         4dVr9b1Vsb41rLFWbabjHBD8qA8/nh67rzlY0PWiZhSlPd1ZsNGVXVIcdW/IWgxqUfRw
         hSvaUtj/hpQBBEEXdhH93K8xQZ46DiXB4TRDDfuMM8hYp44LhZtVAyR2cl40Qd4tf/ON
         lOHKBCKEPxV79d15RdJk+QXVkj2LsvL71PbfmL8+f3W5ioFx0gR+FUsr00biKzGZPrxr
         +AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896565; x=1739501365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1QxMKnddA91WCGvSvK0Kv8+Ui7raPxM47ZCxWA1T70=;
        b=w7JRmE9pGXhmZbPUaCw1NgYuMOIe+rIUIKd4LMca8ZBM6Ebxvp35RPJInzYrvN7hc+
         sbXwUJgTYB2QiWEZw5x+ogl7ES72Ojz3emU0aAgzFVy5KV3DNDsp0k5iSA75oR3sDubO
         VpETO9AFWDWT26y5KEHqDrKZNcZlDWTLsAQ0xMqtfWVmBTCewDcnlqjauw8DbIObzPlY
         FSliLUCbl2D1VKGfOvDPUw4Bo9BhChjxO5AVkIr8kMioc+UeDmNmwNtxjssdMS3NwyiD
         d9u8FoNNhAttO4UEvMY5IX4cNrERSiCTbjLC9QuIAfmJ+am46QcPmQvqrPjQDVX2yoh/
         c1tg==
X-Forwarded-Encrypted: i=1; AJvYcCWxcamf1ejPCjfFn81AyQMjIny4yIKpm0g54tSHxlqgRXnP9+PKLi1Elc/ln2VrJM/OxLrG8oWWBUv5q9Hjdqgp@lists.infradead.org
X-Gm-Message-State: AOJu0YysznUkuGFf1CwlqUzV/G7prlmA4dWOTlxFrw116IpfuFTBZ871
	YdFAoz/5vHnP8erQrPGZ3FlpOyZGPyWaETNZcPgjhbRVm26PyA/xzC0GEV4IdKc=
X-Gm-Gg: ASbGncszxLvWmUjYo0ix9K3PaxBtWmf7hSp3tTTdr7xqRlhfX3f2zf7Z8OS9zGg8Ib5
	MK8+m+LIy5azIsPAJwuSo1my3q0x3Js0nG5Pv3/fOOBoBeU5DUmeUDoE+btqqdwspcK3tAuic5U
	/DV9b7lWisN0ylP0ODX74BhsgQz/EWRuHLyg3o8RUlV2QQjakfqB1e97IDrZ/2niqHixPtaS0L5
	dHDLUgpeqo7j7WD0Y8TBisi6iNwlJyXrVrDkVCIaggwGfKkEWy7/zLJ/i3HD7GWXF4NP+uw+fJF
	M+d7ZIDhEsf1jaT2fQlsfJMtvAIgrso71LS979DfLSDoFB1mLYWwjXCa+LO/GGChdfa0tOI=
X-Google-Smtp-Source: AGHT+IFTPGY2nzRLHllSo8hDFl+TxXnd4EtAypxnHw3YEBN2TqXVdM1x8iFz55a0HF67J/9VnE7uOQ==
X-Received: by 2002:a05:6512:70e:b0:540:1e17:10d2 with SMTP id 2adb3069b0e04-54414ae5f0amr254436e87.49.1738896565019;
        Thu, 06 Feb 2025 18:49:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed63sm300364e87.41.2025.02.06.18.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:49:23 -0800 (PST)
Date: Fri, 7 Feb 2025 04:49:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_184927_095412_B3B8F028 
X-CRM114-Status: GOOD (  33.85  )
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

On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> Adding a panel does currently not add a panel_bridge wrapping it. Usually
> the panel_bridge creation happens when some other driver (e.g. the previous
> bridge or the encoder) calls *_of_get_bridge() and the following element in
> the pipeline is a panel.
> 
> This has some drawbacks:
> 
>  * the panel_bridge is not created in the context of the driver of the
>    underlying physical device (the panel driver), but of some other driver
>  * that "other driver" is not aware of whether the returned drm_bridge
>    pointer is a panel_bridge created on the fly, a pre-existing
>    panel_bridge or a non-panel bridge
>  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
>    but the "other driver" doesn't know whether this is needed because it
>    doesn't know whether it has created a panel_bridge or not
> 
> So far this approach has been working because devm and drmm ensure the
> panel bridge would be dealloacted at some later point. However with the
> upcoming implementation of dynamic bridge lifetime this will get more
> complicated.
> 
> Correct removal of a panel_bridge might possibly be obtained by adding more
> devm/drmm technology to have it freed correctly at all times. However this
> would add more complexity and not help making lifetime more understandable.
> 
> Use a different approach instead: always create a panel_bridge with a
> drm_panel, thus matching the lifetime of the drm_panel and the panel_bridge
> wrapping it. This makes lifetime much more straightforward to understand
> and to further develop on.
> 
> With the panel_bridge always created, the functions to get a bridge
> [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> the bridge they are looking for exists already (if it can exist at all). In
> turn, this is implemented based on a variant of
> drm_of_find_panel_or_bridge() that only looks for panels:
> of_drm_find_bridge_by_endpoint(). In the future
> drm_of_find_panel_or_bridge() can be progressively removed because there
> will never be a panel not exposing a bridge.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---------
>  include/drm/drm_panel.h        |  8 +++++
>  2 files changed, 66 insertions(+), 16 deletions(-)
> 

LGTM, minor issue below.

> @@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  {
>  	struct drm_bridge **ptr, *bridge;
>  
> +	if (panel->bridge) {
> +		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
> +		return panel->bridge;
> +	}

Shouldn't the rest of the function also be removed as you do in other
cases?

> +
>  	ptr = devres_alloc(devm_drm_panel_bridge_release, sizeof(*ptr),
>  			   GFP_KERNEL);
>  	if (!ptr)

-- 
With best wishes
Dmitry

