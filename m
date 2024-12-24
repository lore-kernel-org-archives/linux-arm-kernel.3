Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7F8E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 01:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tH4XshjLhtYgFGpFywgz5Uu8exiT5Uij2L/jGX3fAcc=; b=h1kA8nU/SLbuylY7WrEk+kCYlp
	T/Th7vZjzeW94nzKLwjanoI1EGCTTDmQvPk5xDL3ybpm/YmcwcUoCAas2mlMDa/iQb0uvmd7nzT2x
	4gHnNpbFDbsWXPjcmBwVi/IaXkLv8AhHFKlyYcog1WLo5mpoRyIAHGvGhP0Avs1tLDr1erBW2xt84
	ZCy24wrsa9R1E7lAFU2x4VlL0m3EVza8bNX7PDOMZG1SfrH8nYmIGhc/eQJXsar0Ns+XZkZeBS/Ys
	gCRJ2b6Cuz0HTrQ4WOHEKEL+UQ+ajNVH9XzPIK3z9g3uU2/t7UB5J3ytT2NIcRBX+QZrKo8gee24d
	7H60tdkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPtIu-0000000Ayt6-2aaG;
	Tue, 24 Dec 2024 01:01:44 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPtHi-0000000AyoS-0Uaz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 01:00:32 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30229d5b1caso50867111fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 17:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735002028; x=1735606828; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tH4XshjLhtYgFGpFywgz5Uu8exiT5Uij2L/jGX3fAcc=;
        b=DOvbkKbtKK4rFpeKYG1yPHiUC52oDZEoMzpiFguTGlOVuXwyGkanbRXU5f6W+g/VoV
         KO5d4YObSR4BqVMi5MV92zXNrPOOqAGUwhH7Ge0cWZ0owq0YcwgNIzP9RQIGorMcLxJf
         OXEXu773F0r90rqk4IUGqSidHa33BfGz9OVsoxgZDisTXaDfDlOhEir1kxioW99w3a8Q
         wGOdru/I21uVoZiSV+Faa85pPUOf5ESb+DdyCZg1v1eV/I3Slqm+I4GfQrEFqeE7Pg4G
         5Ljudzrp3RlQA6RgdnlVqYdjV1u8IkwnMNEsN+s2HGZGrOy+zRttm1TkYwohDpoPKb7l
         +SMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735002028; x=1735606828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tH4XshjLhtYgFGpFywgz5Uu8exiT5Uij2L/jGX3fAcc=;
        b=B4Pr2ChfxX+GeYceNrwPO2sxrKxiMsrOxU0DFGE2T9/p+ozpjsQgRS33CBkVgYLjGa
         Hma3kuj7D1s6s1QQ3QFoj+bPnN1F/lxLU5A/49Rr6rFMOxYQKojaxDJbJcYKNyNhmgeF
         D9q4sw5O/idJBEIbbExeLj/Zq/7W6Fr828JI4bbBjsmo0yJ6UvG4OjFBcBdake9yRfup
         GpVlQUsGBRFalNDOGI4vQYlmRPQc8vRShPZ85dbRwu3YMpewIXJDVB7ioPue4KQ+Yh6b
         kqQR9SE6FOwTObe5//F3iq463rJMFG+ZMHmENzYY0cGYqVO6R6fgTemszwLEh5ZdYrFF
         X7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCDEut5qwNWYUQeeY5rqIeBRiK8UptqihpPDOfXl/ZQE/oMtvR1t45qc4F8FrsG4u3UZ3fCcGYlpMc633AoTat@lists.infradead.org
X-Gm-Message-State: AOJu0YzVpjXvVegqE78jXj3VnarEwwnYhrxOPpNWrlVlO2YgQRnK15ek
	4Wwk9+MqivKpzYZ2YKHyoxDaeXBZN3TdWE9wLHnkMaK57/Ud7FIy6K4y71Gf8Ww=
X-Gm-Gg: ASbGncsiW796O+H/i7FfhXo3OpEeBbT1lqFFygAbWucmuTOJ9WDC//j+LenXzECDT97
	Brf99tN+gGw0mmpyEoVWhCrZPAfgNvN6NvK6BBU4uexyAVuH7QIC8KbTkzfbrNMZ1pWFmXexNZx
	Dc9iHgXvbFBTL9SfqPF/XjQfgDcEwKQuwAaLwAUM++eVCqbAaEMIS0+MYTPEnO9NzOfKOGZeoSN
	DONCo4Z6ollIEHyrWrTvzcP14vrCwgOvrjKUs2DrWQil02eExmvy5WDhqpBoNOp5OnRPqU7TEKA
	jNStWI+2hF/ebbdhofnLsGTqVMM4c6KfFe24
X-Google-Smtp-Source: AGHT+IHtyOoIg7bHGt0g9e1Uo2eNMrzJeCrkRIN1DDXKRKcewpjO0JB5UPvqvpz2rQ2ZoS2g0aK8Ag==
X-Received: by 2002:a05:6512:2807:b0:53e:38fd:7514 with SMTP id 2adb3069b0e04-5422956bdaamr5438834e87.51.1735002027757;
        Mon, 23 Dec 2024 17:00:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422381381csm1459363e87.165.2024.12.23.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:00:26 -0800 (PST)
Date: Tue, 24 Dec 2024 03:00:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
Message-ID: <6p6gvofde5mbjdzjs3am7qrezhwzxf7byguws5lfhexeh5faaa@vw4effmwiyay>
References: <20241224004439.239880-1-marex@denx.de>
 <20241224004439.239880-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-2-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_170031_026389_E47EB0CF 
X-CRM114-Status: GOOD (  17.60  )
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

On Tue, Dec 24, 2024 at 01:42:48AM +0100, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Plus.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

