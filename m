Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55472C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ru1wvh36CbOfubIqIyD+5sQyMz21Y8aZYTgm/d3+5o=; b=F3fdq19k7gwAELnt8YY4p2DUbO
	G2YLXojXjIT+G+Nedgm3UsvYKkWlwjUG1rN0pbEy8q+kaZl4w48+VW8PeWvnZcud5RmJADHzdmnfX
	hKGaQQoq5nafwcn1KH/uCMb8j2O1Yj6UXsq7ZArOgh7oqqb6p6wGLnwOIQB38uRAShRvraTq5Vo4z
	yskVnImrqswLi5/HsGRZ5G8gl/EO+0QSqfOAl6HBT5/n+bblZd0CndYnSEJHZYWZrEejw0e55YdCq
	6pmP308sF2oQ0RyVOvjIJtk3qGuKICmbT4CcdkHss6ec81Xzrvd2WP2IpvtaGFaoXRafYrBovh53l
	0Z8xf3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUz2-0000000B4N9-1VzW;
	Fri, 07 Feb 2025 20:29:52 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUQW-0000000AzPW-2bHu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:54:13 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-543d8badc30so2907287e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 11:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738958051; x=1739562851; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ru1wvh36CbOfubIqIyD+5sQyMz21Y8aZYTgm/d3+5o=;
        b=IDE/kOLHBSfWAX5VQIwibcTbwZxWO8DdrNu/lakmwi79pFCS7/Qn9vUaJmiz7xb4vW
         VRhe0694VIwqreyoeZNQ5lCJ5jnYZX0qeXn0XaNt+iUjRUAHVnW1ejUjqucHmjeLCj5m
         H5TQYyI4HZDPJRyIMZN2q6mzzMZ/Hs3uCQTuxvaJA6sLzOzCEqIq4L8je4uuRn3mUUWJ
         YTRTAd4ndXighkdKwb3H8wRY0draai2Vv0MyT5gN2BOwu/oYSjypsecKhm8gWXsrf+9U
         ng8RE6QuvCjTSct7Kbo/ASmbRUZaHSc9aQHhmr3uWEWkKIp4+X6CSTsQ7wDej9fcUHr3
         mbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958051; x=1739562851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ru1wvh36CbOfubIqIyD+5sQyMz21Y8aZYTgm/d3+5o=;
        b=IZZvipqru31vS2B4D3CpNhVw8L0+FZEZPkwbih/pjUKAdzH7/xke9G42dZYD+YuCbk
         XWQ1lRAWClYr5oOLf+L69eSDJGiXzO2Tsv7upl2TWR04k883DHsPD/HFxkHfIGb4P4Av
         WYsseYq/eEoQrI5BSA08SsLtU4Os8Wr43E2MzTh9hVelznCSpIab2WUjkCdtAZoTNhpO
         NAr6vMWNMhuIkIb3Nyx00gHPJu5RX8w4Wa0VrZ0EyExHOZmLOlIQsK6vZJLSjihknS/w
         HmUN78+7DJw6Zi76Kuig5oK2svi72vXyt1t0/Nm5UeswFEScrRcLdXYw/k0SZ86HPY0N
         atuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzDs8rLnZpZ11asYryS4FAjotmgrMyBcmhw+uyUSW83riejtlK0QlYmq2cuoDO/GLFIrPSc6SsvbK76wG8MkUs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqic7LNzJpi263WN0UrLz4Mf6jV+vuJlgvp/2TdfM2J6afmT+u
	zCQZ9LlyxuLQv7JczJsutCvmkEFs7QNVEVUvFBMtyA59HfqB4HKuOsAG04XMXqw=
X-Gm-Gg: ASbGncuUErb1jfdKRyGxnULpnf+402Zqt8hnYKChFipq9kOY35PJRhfXcMWII/8iQuY
	Bm1l9TVHgwjeWVlgyKAWWOCqyGziwWBvicr365QF+MZijV9+V6gNWaoYv3ffKQ+Jy9+8lrYKvul
	c8iujleVRVYWjt4+PDS1wxLW/Do3MhxjsOT/XeMH823XE6DxeMkv1WjcS5iM06DlKNeHS6iZMuv
	b8NeP0GmaOlQm1DS+eUVtLniTsq4JibSeKnyozfLmmA53YbUcFEgsfNSYu6Szq+Yd1+1NI5Y7LL
	t9jDjYYG+YAfCpvTm183TGExevjWOqMzCLPt6DgKp3u+sLu3lxrMR57ZFpfN3poPDdrTfJk=
X-Google-Smtp-Source: AGHT+IFAea/MRPW5NqZuydSkxXmqLttpsbttAcYS0zhETRXM+wh1dfpRWMrPcOicMETtA2XEcZqpWg==
X-Received: by 2002:a05:6512:108d:b0:540:2a92:7da9 with SMTP id 2adb3069b0e04-54414ab5605mr1626033e87.21.1738958050673;
        Fri, 07 Feb 2025 11:54:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54502a4efa2sm58959e87.195.2025.02.07.11.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:54:09 -0800 (PST)
Date: Fri, 7 Feb 2025 21:54:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-ingenious-daffodil-dugong-51be57@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_115412_662939_FAB8115E 
X-CRM114-Status: GOOD (  44.38  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> > DRM bridges are currently considered as a fixed element of a DRM card, and
> > thus their lifetime is assumed to extend for as long as the card
> > exists. New use cases, such as hot-pluggable hardware with video bridges,
> > require DRM bridges to be added and removed to a DRM card without tearing
> > the card down. This is possible for connectors already (used by DP MST), so
> > add this possibility to DRM bridges as well.
> > 
> > Implementation is based on drm_connector_init() as far as it makes sense,
> > and differs when it doesn't. A difference is that bridges are not exposed
> > to userspace, hence struct drm_bridge does not embed a struct
> > drm_mode_object which would provide the refcount. Instead we add to struct
> > drm_bridge a refcount field (we don't need other struct drm_mode_object
> > fields here) and instead of using the drm_mode_object_*() functions we
> > reimplement from those functions the few lines that drm_bridge needs for
> > refcounting.
> > 
> > Also add a new devm_drm_bridge_alloc() macro to allocate a new refcounted
> > bridge.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> So, a couple of general comments:
> 
> - I've said it a couple of times already, but I really think you're
>   making it harder than necessary for you here. This (and only this!)
>   should be the very first series you should be pushing. The rest can
>   only ever work if that work goes through, and it's already hard enough
>   as it is. So, split that patch into a series of its own, get that
>   merged, and then we will be able to deal with panels conversion and
>   whatever. That's even more true with panels since there's ongoing work
>   that will make it easier for you too. So the best thing here is
>   probably to wait.

Luca and I had a quick chat on this during FOSDEM. I really think that
panel (part of the) series can go in first as it fixes a very well known
bug _and_ allows a pretty good cleanup to a whole set of drivers. With
all those panel / bridge wrappers gone we should be able to see a
clearer picture of what individual drivers are doing. In other words,
which memory and which code actually hosts and uses internal
'next_bridge' reference.

> - This patch really needs to be split into several patches, something
>   along the lines of:
> 
>   + Creating devm_drm_bridge_alloc()
>   + Adding refcounting
>   + Taking the references in all the needed places
>   + Converting a bunch of drivers

The last two parts seem troublematic to me, but, I must admit, I didn't
spend so much time reviewing all drm_bridge usage patterns.

> 
> > Changes in v6:
> >  - use drm_warn, not WARN_ON (Jani Nikula)
> >  - Add devm_drm_bridge_alloc() to replace drm_bridge_init() (similar to
> >    drmm_encoder_alloc)
> >  - Remove .destroy func: deallocation is done via the struct offset
> >    computed by the devm_drm_bridge_alloc() macro
> >  - use fixed free callback, as the same callback is used in all cases
> >    anyway (remove free_cb, add bool is_refcounted)
> >  - add drm_bridge_get/put() to drm_bridge_attach/detach() (add the bridge
> >    to a list)
> >  - make some DRM_DEBUG() strings more informative
> > 
> > This patch was added in v5.
> > ---
> >  drivers/gpu/drm/drm_bridge.c |  76 ++++++++++++++++++++++++++--
> >  include/drm/drm_bridge.h     | 117 +++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 189 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 1955a231378050abf1071d74a145831b425c47c5..f694b32ca59cb91c32846bc00b43360df41cc1ad 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -200,6 +200,57 @@
> >  DEFINE_MUTEX(bridge_lock);
> >  LIST_HEAD(bridge_list);
> >  
> > +/* Internal function (for refcounted bridges) */
> > +void __drm_bridge_free(struct kref *kref)
> > +{
> > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > +	void *container = ((void *)bridge) - bridge->container_offset;
> > +
> > +	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);
> 
> Pointers are not really useful to track here, since they are obfuscated
> most of the time. Using the bridge device name would probably be better
> (or removing the SHOUTING DEBUG entirely :))

bridge device name or bridge funcs (I opted for the latter for the
debugfs file)


-- 
With best wishes
Dmitry

