Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495A7C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQReq9xQ99y9zIKRJOryjTQFC2bFCDp3B7MQU03SZE4=; b=xGCCcQwkA7gf0DCu4zGPn3Kb3F
	W6v/MPuNkz1dpFVTYbpNIO1FChqe8YKiMPrbMDPFUZAsC7G7sA6OYBmDNVLzNIcZE4/YHB8KOyTt8
	LFNv1rG4FtfP9V22/vndxuR9R+wL7UNFE4gH96OqJmtFIOaepDlfpA109nIwUQtUk8Q4HsRWS6yFl
	qS3AbQ6CGHa36CDPN4ZD+6K3KDNtBkRTOezxHfs01/AmTKgLb5Qm1Xp5BPogsT94q+pgaLvIybkBf
	w7yu+6RHUOXjDpYhWsWXYEtq4+dE2X1xgcfju6MQOhvnk8qPwT3bCceWQdmOjEcRfHVOdyZu5LxC8
	rrUzHqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgENh-000000087Fd-2ktg;
	Fri, 07 Feb 2025 02:46:13 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEMK-0000000874w-0Pwh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:44:49 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5440d5b30a8so1878085e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896286; x=1739501086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MQReq9xQ99y9zIKRJOryjTQFC2bFCDp3B7MQU03SZE4=;
        b=chopdQUHz226662KF6cPQFLgPkLmtcDcZswXO4kn29m+hVufuprYPxXtSxVweh9dtp
         d0OaQg6PdpNDGIM9oZPMGiQFX9Gt29K93MvDRHE/B4ANm+CUEDclnsMiejOs5kcQB/dA
         tmVGdsqQkTHEaabxs3mzTHw29r48jGLj4NHHs7+jZ2Al9eRJUFDqQVRsGIO4X3rRBUJT
         z/7FvkffRKYboUUn6sI9jTINVVekvMrxBbcDIr9lQG/aeLhdUL5XPygxq2YVl3Qbgw3U
         9c/rqBK+3XKLMLpx1rwQcmbf0SeK2hV4yxGlOSq33TXN4MpSwg/wrvWzfGC6e4ZksSJt
         AlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896286; x=1739501086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQReq9xQ99y9zIKRJOryjTQFC2bFCDp3B7MQU03SZE4=;
        b=kZeFAhvsRTAHoY+26jjebL135SxKkLdsyO30jurkWvAm3RStn2SyDNWplthB97Cd/T
         tE26xcRKbxQzNTmOpolaKE0j1OYDEhbeSA17G1Vh9uGiEJb0dmyA2Xos8u2M6zFWFYdg
         D9geRSgftzaghRQi/qYQV/Q+z0ZT4UPUZtqivvQaBFBXtvP58v89KcPSmaZATzgFELKb
         8Wl/2R0nRyFzpWVDyKzWkyalXxkekf9cgDO+Ze39HfbFVypnTDooJTjHPehLsTh79QZS
         Mu3rcbWFt8idrMrvm1D26NZAlOnl3x6+tkEB4ac6P5baKCUGK5wJB/ExtRSk7UJmi37d
         4jRA==
X-Forwarded-Encrypted: i=1; AJvYcCUa7IRMZNLXG0em+xhXo4viRDEqph3C6uJvJfDikD4qH2CMjqVFH7BgUc6dLwodinCM+X7AgoO4DSq+Ae5xIuEg@lists.infradead.org
X-Gm-Message-State: AOJu0YxKpDH8dU9n0kRCYYseJiagrDhm9CawoeceuXicES7U5WIQdtXB
	pa+yQoNvhfGOioJn0cLOUe1dI5vYq+NVn2iFJVOu8txS1QSIYKqz6zqhg0gjSLs=
X-Gm-Gg: ASbGnctBkKfXPgnFLPXKMVxO447s3bVpCkK7tyfIrhwXeljdlgRTnco5u3bMWvt23yM
	gNsh5iVethWU9HYNYc0a1fsF0wZLyEnCKRj/L81InVrpPFwVzPw81Th6/ha5Q9r/Yj/UxxlTPsj
	dz1Bf44RkBYJNSf3vxaZH15wN5YPmmOb+jBa1LCyvfud3/sSqPBW00WfiT+0jhsc1f0f05K/9GG
	8lVYAebATrZ36IqKR2rTHtvMPqVq/bfm4HU1goBNy0y+RLbwfAyWVmxmMTTiYj09Kjj3U0sm5fK
	JFJ9jyocd67RlpyCNMeG6BcAr+9l0T3kAdMQCBrJHUrb4MDsTVWhSqf8xUXRIC1M9rsNUHg=
X-Google-Smtp-Source: AGHT+IEMdrg6IaKfrHTFSkbGGZM6z3+o/AOEBo27rSaLzMBVYmx9IKsUOm6sC7QIz9laKpK7sx9QjQ==
X-Received: by 2002:a05:6512:5d3:b0:540:fb1a:af1f with SMTP id 2adb3069b0e04-54414af5721mr284630e87.39.1738896286187;
        Thu, 06 Feb 2025 18:44:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bf58esm296912e87.107.2025.02.06.18.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:44:45 -0800 (PST)
Date: Fri, 7 Feb 2025 04:44:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 07/26] drm/bridge: panel: forbid initializing a panel
 with unknown connector type
Message-ID: <cii3ko3pejzmvz3cft2saw3biyx6yipcsemd3mzihzy7tyhsdg@zpmqujujwcie>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-7-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-7-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_184448_141207_8E33FFAE 
X-CRM114-Status: GOOD (  18.50  )
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

On Thu, Feb 06, 2025 at 07:14:22PM +0100, Luca Ceresoli wrote:
> Having an DRM_MODE_CONNECTOR_Unknown connector type is consuidered bad, and

considered

> drm_panel_bridge_add_typed() and derivatives are deprecated for this.
> 
> drm_panel_init() won't prevent initializing a panel with a
> DRM_MODE_CONNECTOR_Unknown connector type. Luckily there are no in-tree
> users doing it, so take this as an opportinuty to document a valid
> connector type must be passed.
> 
> Returning an error if this rule is violated is not possible because
> drm_panel_init() is a void function. Add at least a warning to make any
> violations noticeable, especially to non-upstream drivers.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

