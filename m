Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7B3C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0T9/ZuNkQ4ks8pt7svCxV1BQmZdwdu/CWy/f/RDblk=; b=PLAiAoQBlY7tuFzYBG4Bmo/PwE
	8auaJPIUcMb3XVw2RWX+lBPaeLNdGKi3vlwm5iN0AAMMVTjLAeKzta5eHJsPGkESEcXqRk0CIzrD4
	vbv5btn6YEmdjF22+UYkQB7zUqjpy6Fz/SKeSeraVUDzOVaIDwGZm2aMP14CpreU2xEb0sO2qLTgL
	TwAE6rAo2FSMVF/4zcu1MIiQ7micS4Koca1iYy3me9de2bs4VC0jxW2saAGEG6P1X92Git/IuDlkT
	IconBIagOIJSWUzKqUL0XiqXG3O9o3kVY3BuTo6gh2Lrmq9HEgKqyVT97ciUCKGS9g/cf8WydSdm3
	HlwxPTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUz8-0000000B4YW-1v1U;
	Fri, 07 Feb 2025 20:29:58 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUTn-0000000Aztf-00Qs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:57:36 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5440d5aae5cso2599927e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 11:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738958253; x=1739563053; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x0T9/ZuNkQ4ks8pt7svCxV1BQmZdwdu/CWy/f/RDblk=;
        b=cyhuk+zYBQYcpN5yDA1FDzgSfStqaBq/12kykDMUNdxnuPIFcGlJ3DdtwhfHMssMkK
         OoSblrc9fj1RRrwlTs7vxzMn5PBmMWTpc7JyvBXeynTfSR5lEyBaUrnvDhY1fJnwCr2b
         AASsBOu4lDS4cscqlnptbKB1ZE2DRxD0KAbnCIBJtFY1h8Gd3cKKRKn6oRr/IpJDPyza
         zOfmhBb1QZS/s9SjXx3wrtDNgSvpEb2V6Ydp8ZKb46GvybcsReWtQ3bibul3D2+vnwEq
         R+SQzZqrDxGygn6bJtxPFW2J27ZjFHKPe7LfUbG5EXPDWrclrFlWB0meEnshPosliHJX
         qveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958253; x=1739563053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0T9/ZuNkQ4ks8pt7svCxV1BQmZdwdu/CWy/f/RDblk=;
        b=T1pLBFbLaCZ6ivGvkQb6N2V3lk9WpMGcIE0WeB6D7aDW897hatcO+hpgh1ws8sfhE0
         f8SmtH0uEAdjFArTLGL6afotZIOoSB0nkndo1Pq6rKgLh78WgoXmEqgfX4Q51XNbiPV5
         HwPvvrlr3EGIxUQnKgVEG4e4/FaISi+R84b9+cv9BMhiz8cPSDVPFzghHo+9iSL2sU4l
         xud+xmEEJrfnVUpNY/M3FpCj7KlIEGxpBmt5GTH9gvXC2VdRPPJpyDgJVi/AyzeewsHA
         PIB61Genj4H/AjBfDDOPB4B7sAjS1pog2aW1avwOU49pfkshXHtxAurmjWmoa9GPyYp9
         Cm/w==
X-Forwarded-Encrypted: i=1; AJvYcCUCO1zA3ysiCHYCEolFpBxXKrOCVcZV/iLwFAHfXBoshmdoSZRBlXrtjWXvu49QMy36ue+WOkdoWI1/kZh/YMX9@lists.infradead.org
X-Gm-Message-State: AOJu0YwfersoRypLTTys6cPlmoODPRD2aKlWgI9znLKJvFHalRowYl8d
	+5VspZvTu3REx0DySvq+PxB893PG20fOYby/jqU0lSXCXHf3frkYkdSw+1WXeDE=
X-Gm-Gg: ASbGnct1fnLZiEOCDvlSrRlXkABw+pXq1eNPXLQ/NnKwemUcxYrc85u3h3bwWqeJ6HI
	KJ3Hhsd/fu95gXEOXXCxSbEKZhsGsPIhW8qg5RFDPVDIHag+nxrlMShzsSUnEsBPvMGjEYaox8P
	4DuyA/HUDWCey1jP/za2snc0cnUCEwlT/9fCjCv2EjScEc3oVbCDyA6Lv1lIVznuC4MCCkw1Roa
	fM1mmssZeyO7YEicRKY6drOxpu93LR0tBzFZDLmjwrdrJC1fWcpVtzwmjky+LtVZbMhUMbHWRu4
	t15wkXVRyc3jlPSKPYoDQa8TVkFzSjAkOYsG5wxXeMxrcSD1sRW8JjGSkwUOYq5zrDGChlw=
X-Google-Smtp-Source: AGHT+IGHcoDCGXH/LL0Tkb8Pbbsjc+ii5rlqX6YsqqRGWi5SEaXype8ZThbpCLSTDmjeyW4IMVV6kA==
X-Received: by 2002:ac2:4e07:0:b0:540:353a:df8e with SMTP id 2adb3069b0e04-54414b052a7mr1658512e87.39.1738958253085;
        Fri, 07 Feb 2025 11:57:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed99sm547105e87.3.2025.02.07.11.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:57:32 -0800 (PST)
Date: Fri, 7 Feb 2025 21:57:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 15/26] drm/bridge: devm_drm_of_get_bridge and
 drmm_of_get_bridge: automatically put the bridge
Message-ID: <k6endeznshwoftdmhyezuavg6vlemujukfybtqeil66cmjnhtv@yh6knwpabpno>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
 <w3qufv73ldzdcfuz6n3prx4di2dhoq2wfqmmvxvxkea6uqxkge@pjwmugvicsbt>
 <20250207114401.7869b422@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207114401.7869b422@booty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_115735_044883_84015483 
X-CRM114-Status: GOOD (  25.76  )
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

On Fri, Feb 07, 2025 at 11:44:01AM +0100, Luca Ceresoli wrote:
> On Fri, 7 Feb 2025 05:17:43 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Thu, Feb 06, 2025 at 07:14:30PM +0100, Luca Ceresoli wrote:
> > > Add a devm/drmm action to these functions so the bridge reference is
> > > dropped automatically when the caller is removed.  
> > 
> > I think the get() should go to the underlying of_drm_bridge_find() function.
> 
> It is done in the following patch.
> 
> Indeed I could swap patches 15 and 16 for clarity. Or I could squash
> together patches 14+15+16, as they are various parts or the refcounted
> bridge implementation, but I felt like keeping them separated would
> help reviewing.

I think most of refcounting should be introduced as a single patch,
otherwise you risk having memory leaks or disappearing bridges.

> 
> > Also it really feels like it's an overkill to keep the wrappers. After
> > getting bridge being handled by the panel code would it be possible to
> > drop all of them?
> 
> Do you mean having only drm_of_get_bridge_by_node(), without any devm
> or drmm variant? I'm not sure it is a good idea. Most DRM code (well,
> all of it, technically) is currently unable of working with refcounted
> bridges, but if they use the devm variant they will put the ref when
> they disappear.
> 
> > Then this patch might introduce one new devm_
> > function? Or are drmm_ functions actually being used to store data in
> > the drmm-managed memory?
> 
> Which devm function are you thinking about? Sorry, I'm not following
> here.

drmm_of_get_bridge() / devm_of_get_bridge(). I have a feeling (which of
course might be wrong), that they were used somewhat randomly in some
cases.

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

