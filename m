Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC6DC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfeUloH1D5YQJ4zSbv3mA6ITAlWmazeuNMbmPCyKglE=; b=M2mL3IhCXFjlG50JuK9wQABqn1
	gYkBpw40J330/Ol/IHfl4fPPndlcqKhgFkdGv1IX0QLPNVhlty1vbsQQRzoxskiDb8oJN+MAlFN5U
	EuT26Dn+zbROqB47R7/UHv6UAUJb25LehL4EQC2Sai4e++/666xpgcL3WSwbCGIek7BS9ulx/D4Aq
	H0ZDW7rouDwgXAqpXb8RDJYBJyuiYFAiPNRvmKOASVSYm78jDeIPmTo8ffJI0hmmPbMgREKyLD6ED
	yZRbyuCX5Ui0eU3p70fv1DGO4tc4bYOvqDDynZmLziQXOS8nfrvZWYsNAQhDa7cHB7wJv4Fr2DbG+
	08XILNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUyz-0000000B4IQ-3hi2;
	Fri, 07 Feb 2025 20:29:49 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUGC-0000000Ax4p-1FMe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:43:33 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-543cc81ddebso2766968e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 11:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738957410; x=1739562210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sfeUloH1D5YQJ4zSbv3mA6ITAlWmazeuNMbmPCyKglE=;
        b=qJCJvGpED4gLSFJ3UnCeYctFfulXKs3CR4fu4Z6wSFTRk2kvD0rjmXKGIUwZ1IrcS/
         zcbXzxW45MMTP6SdgZzaF7nNyY9EhGZ56oiv/JJYOw0s9ifJgd//oJ9DpiXvxC3Jjvbr
         /ba1oXe4iqQVz41lgw47Si9A6yjQuvEjXTMcmhQS5Tq7CC30p1l8Z5JzcJve7oqGeNZv
         e0KvIJBspZZWh5hURGm9SYcvOInIVjNnlT5c+bKnozlrtxYKPLumGWvz+E7CNSvZb1PP
         WnCOkOXwwWfH2mSTxI0e4/BAnY8+wm54/xboA3jT3j4/vRshtLfXBX6k0raX3X6ExEJV
         lEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738957410; x=1739562210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfeUloH1D5YQJ4zSbv3mA6ITAlWmazeuNMbmPCyKglE=;
        b=k2uWzLGL3hGCAjCNyvvd94i3Ykrdkx0DhcOcxLH8TJmzw3xPRYfhe0AFmOtcxrcWEs
         uQ0IdMWn+37SjYEOu3B8enubwYbvlNPL9JUjFq4vWS6CvJkBje/POiQd3bhdOgDnLEP/
         RlStcFigUlm1sowCsrS+FCeubvkDkDyhE/foK/WVQMevnI/PTvc0hvILMbNY0xXghmMc
         U1b0wm7/DQNZ4g5IRn8R5nGJ1Z12SB6UvDTnYOo/Mr6QiwfbU+y6bJOG0eVcg97HJsyD
         3JpQh/Csq9ZqF0djbyP7zgQ2dXdjlXfdZFO7u90Wz/aCJKYK5HT21eVUhcCVItS9pzL0
         ongQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq7LsQvYmsxUWIrp/KaLKPZvjyY1MTf6A1mcQPBEAhqN3voDfETYWUpQ0CAiVpBx1LaDdCLE7RHN0T+VB6zcNA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5nE6t7QdlAl9n2AZKSYaEMAu/6yp7jzSfM5Vw+1r69B1iqa4k
	HuHjgPx+cHO7ByZ6UFq0/cGJNsYykgpB5ppcMy3sxDu29675A3bcyBUoCUdYsnc=
X-Gm-Gg: ASbGncvnZeQbTNL/C/Y6YcE5Dl1Smb7t6rlq733mA508AvNrfGfsv32z4vsA2O7DKHK
	KT7wTUmQqkcV2liKj+gav5d4zQEjoZFHmK/KbhcFZ9dDzj2BMyZrWZfAJh0TZzer7u1S6H1ekUi
	IAwn/7iaW+RLhi2WHijBm8gzOlv3zZrrv2rY1KV9b6UdW1Nl2HOBZuPwE2uYgVBOe5OM4Ld/PjY
	fT1FAVMiA3Sl1d3KX/vWMo7DPCjdd/1yImQyMTZMZas35jCxpn1l16DjyGYejFQcfEPNHw0XgoY
	6z8owDy/jLh2vggtg/jry7kSvXvLUTdn1GDLmkGzL98nJ9EsRxXaKuwv89+Id7v2+ozZdmg=
X-Google-Smtp-Source: AGHT+IGPtAJCB3CGqF85jrgae3kZNpGKdBiQF5zyaTqCla9QfN39wSgkGoIzsR5MIcuzbaZGPE0Bzg==
X-Received: by 2002:a05:6512:2316:b0:543:9a61:a2e5 with SMTP id 2adb3069b0e04-54414aa87c8mr1684308e87.23.1738957409927;
        Fri, 07 Feb 2025 11:43:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54410604225sm542577e87.237.2025.02.07.11.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:43:28 -0800 (PST)
Date: Fri, 7 Feb 2025 21:43:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <aoy4vtqfffq3chbfdqdcrtqmex3pqijlusem7pp37wwsg34lgl@mnaqbp6fijnc>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
 <iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
 <20250207095428.244f0f91@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207095428.244f0f91@booty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_114332_344463_EDEE361D 
X-CRM114-Status: GOOD (  44.49  )
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

On Fri, Feb 07, 2025 at 09:54:28AM +0100, Luca Ceresoli wrote:
> On Fri, 7 Feb 2025 04:49:21 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> > > Adding a panel does currently not add a panel_bridge wrapping it. Usually
> > > the panel_bridge creation happens when some other driver (e.g. the previous
> > > bridge or the encoder) calls *_of_get_bridge() and the following element in
> > > the pipeline is a panel.
> > > 
> > > This has some drawbacks:
> > > 
> > >  * the panel_bridge is not created in the context of the driver of the
> > >    underlying physical device (the panel driver), but of some other driver
> > >  * that "other driver" is not aware of whether the returned drm_bridge
> > >    pointer is a panel_bridge created on the fly, a pre-existing
> > >    panel_bridge or a non-panel bridge
> > >  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
> > >    but the "other driver" doesn't know whether this is needed because it
> > >    doesn't know whether it has created a panel_bridge or not
> > > 
> > > So far this approach has been working because devm and drmm ensure the
> > > panel bridge would be dealloacted at some later point. However with the
> > > upcoming implementation of dynamic bridge lifetime this will get more
> > > complicated.
> > > 
> > > Correct removal of a panel_bridge might possibly be obtained by adding more
> > > devm/drmm technology to have it freed correctly at all times. However this
> > > would add more complexity and not help making lifetime more understandable.
> > > 
> > > Use a different approach instead: always create a panel_bridge with a
> > > drm_panel, thus matching the lifetime of the drm_panel and the panel_bridge
> > > wrapping it. This makes lifetime much more straightforward to understand
> > > and to further develop on.
> > > 
> > > With the panel_bridge always created, the functions to get a bridge
> > > [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> > > the bridge they are looking for exists already (if it can exist at all). In
> > > turn, this is implemented based on a variant of
> > > drm_of_find_panel_or_bridge() that only looks for panels:
> > > of_drm_find_bridge_by_endpoint(). In the future
> > > drm_of_find_panel_or_bridge() can be progressively removed because there
> > > will never be a panel not exposing a bridge.
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > 
> > > ---
> > > 
> > > This patch was added in v6.
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---------
> > >  include/drm/drm_panel.h        |  8 +++++
> > >  2 files changed, 66 insertions(+), 16 deletions(-)
> > >   
> > 
> > LGTM, minor issue below.
> > 
> > > @@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
> > >  {
> > >  	struct drm_bridge **ptr, *bridge;
> > >  
> > > +	if (panel->bridge) {
> > > +		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
> > > +		return panel->bridge;
> > > +	}  
> > 
> > Shouldn't the rest of the function also be removed as you do in other
> > cases?
> 
> Indeed it should.
> 
> And even more, I now realize drm_panel_bridge_add_typed() should also
> become a simple 'return panel->bridge', like its devm and drmm
> variants, and its code, implementing the actual creation of a panel
> bridge, move to an internal function. Otherwise this patch is a bug:
> existing drivers which do call drm_panel_bridge_add_typed() would end
> up in having two panel_bridges for the same panel.
> 
> I must say the process of developing this patch together with the
> hotplug work was "convoluted" to say the least, which probably explains
> why this got unnoticed so far.

That's why I suggested to post this series separately - it saves you
from rebasing hotplug work on top.

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

