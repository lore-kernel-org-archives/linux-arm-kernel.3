Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F57C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae3lwIG1bNMfgLcb9UOChi6PzxvbhnZHhBNXR+QOsdw=; b=DJk3aMLB1rNyQBUNt2xTQ1XRNd
	ajlSeChacOMn669roPcwcOtejQuXTa+17+GiF4TrpDT73jcQb06qq6PfZy/CsNYJYhZpcP2nlnkdP
	dRe889InLrFNj9404pe7a01dQ5fqiUAeH/a9u1uKqhhMDhFMC6VYwUzz+mCkAsUwPhh0Pn/HTFmfL
	bS9sf/wrOG8JQwOWtq5TYhexj0Eq6EAZaEOjpBLhs1sLPElNqYH/6kOmDXlMOyvoDdc7113AUJzHz
	oYjZkNPb7kzTb8gP2VcqkoHanvtZtkk3dlAkIeJIXVS7qkEjn5WO+WlzUTQHfuR9vf/2jog0WU+tX
	YRZMQjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUiz-000000007Sd-3u4M;
	Mon, 10 Feb 2025 14:25:25 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUha-000000007B8-3v9e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 14:24:00 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6f77b9e0a34so32162367b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 06:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739197436; x=1739802236; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae3lwIG1bNMfgLcb9UOChi6PzxvbhnZHhBNXR+QOsdw=;
        b=BDFRNF9v/3MUOk4OAERyht2gucw2UXIrhM6D6lLyKqUnz9/cuWHcy2lNptEX4pd6I1
         iod3OB9BUEa8RXuVyTDrI0hOUCAyJe32sT7t6TwUD+9KFtUcpm1azsPuTMZtbwA2q5Rv
         +q8jxScMySRgTb/kLOVf47kH1LUV+o5eMG41OiaE9i0FoNcLsf/1skA+759sFK/n8lke
         Q9T6pIKZdAjkcLtVi06R5zAwJjh1gGpUTaGAu6V2eWO4cxF3UnPV9Y5oe/npPenvAn21
         Mh1aH4i4y4g2pF+ggeCmTHr/laYOykaCGtvxyNy/ZA31sJt5gyyQOKGn2bj+Zp1y8JTL
         xScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197436; x=1739802236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae3lwIG1bNMfgLcb9UOChi6PzxvbhnZHhBNXR+QOsdw=;
        b=jll/TSoSPchf3fj1ELnDfCgk32r1QD4GS9OUBDOfrAiHaQklMTSlgLdVyUdiPSoHA0
         2V/qRv6xhU5WXgg/A0FeHaeEoG9pn7RFOszNpJkzs6XYdz+rhWO1IdI0Fs0F/d/lfP7S
         p/ZqNLFw8QWc2W9QDDF+xdu1Yw37gXjUFm6opFI9zd3EJqqPNZTTq2b5Lz7OHcRZOMkP
         75MmJSpfhAscwga7YWScpqZmqcOP3gzc7zqNdW/uHGItWD1g+6LiEF3/RBw8mpSsNAjp
         sWDTNGygwwbueogZTfJOSBbVJb9Dv/IuxuLvyzdwGEjliHLug1KPZr+Ric9HAoGqtaNw
         TwBA==
X-Forwarded-Encrypted: i=1; AJvYcCWi/isOhzexkobhn5w9qdBbOWKBesJt6C6PwAygri18BIcSRDfezFRZMp+quv70DIU9PLhC3z60Xr55YHwpoh/F@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6FjeeNldWxkH5s18r/+39bxyM6dd/6Zzck8G9H4X0eLbFFu08
	9uv+nU+uc17UbIucJIJQ3jutgHqhoNMueTRSCS9TAqslM2BSDPuD3ypY5vWHznWLHMsz1peWcxg
	YdXsNwmajSauEYrpkziSgPY7jIPSqWrODrtOOUg==
X-Gm-Gg: ASbGncusJeR7aSbvdpPHQOop7HIKPsZCiAWzoFvJRnbetndPVVUhf3dAK6Snp3dPk/i
	fNtZ4MpUcnCdQ5+Zk9Rr01JwN8O7+lO76sBUPsPYQuPZyVwTQ20SJNd2Hhs1fDtm+HnWoGvxVEq
	/pg/nUKmQAY1w=
X-Google-Smtp-Source: AGHT+IE0g27FEGOeRAZwGb7S3MgR4LXpDdhrkSZoSOq5U1jJjfFXRfvfAEBsqb9Cm3IID24zNyOYw0dpb/wBuLQLVBA=
X-Received: by 2002:a05:690c:4513:b0:6f7:598d:34a3 with SMTP id
 00721157ae682-6f9b2349b17mr123277977b3.0.1739197436560; Mon, 10 Feb 2025
 06:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat> <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210-bold-steel-collie-cecbad@houat>
In-Reply-To: <20250210-bold-steel-collie-cecbad@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Feb 2025 16:23:44 +0200
X-Gm-Features: AWEUYZl00UgPkDK5peSLElXsBxEbhr7D2kNasc0K5iG6VfIY6yez4cOHp2_9LzA
Message-ID: <CAA8EJppyDiAeH8bm-rdCUsGoyVOrp=4AvrYLJ-=5BTLtmnP11g@mail.gmail.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM bridges
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_062358_972941_7379711A 
X-CRM114-Status: GOOD (  43.77  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 10 Feb 2025 at 14:31, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Fri, Feb 07, 2025 at 09:54:06PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> > > > DRM bridges are currently considered as a fixed element of a DRM card, and
> > > > thus their lifetime is assumed to extend for as long as the card
> > > > exists. New use cases, such as hot-pluggable hardware with video bridges,
> > > > require DRM bridges to be added and removed to a DRM card without tearing
> > > > the card down. This is possible for connectors already (used by DP MST), so
> > > > add this possibility to DRM bridges as well.
> > > >
> > > > Implementation is based on drm_connector_init() as far as it makes sense,
> > > > and differs when it doesn't. A difference is that bridges are not exposed
> > > > to userspace, hence struct drm_bridge does not embed a struct
> > > > drm_mode_object which would provide the refcount. Instead we add to struct
> > > > drm_bridge a refcount field (we don't need other struct drm_mode_object
> > > > fields here) and instead of using the drm_mode_object_*() functions we
> > > > reimplement from those functions the few lines that drm_bridge needs for
> > > > refcounting.
> > > >
> > > > Also add a new devm_drm_bridge_alloc() macro to allocate a new refcounted
> > > > bridge.
> > > >
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > >
> > > So, a couple of general comments:
> > >
> > > - I've said it a couple of times already, but I really think you're
> > >   making it harder than necessary for you here. This (and only this!)
> > >   should be the very first series you should be pushing. The rest can
> > >   only ever work if that work goes through, and it's already hard enough
> > >   as it is. So, split that patch into a series of its own, get that
> > >   merged, and then we will be able to deal with panels conversion and
> > >   whatever. That's even more true with panels since there's ongoing work
> > >   that will make it easier for you too. So the best thing here is
> > >   probably to wait.
> >
> > Luca and I had a quick chat on this during FOSDEM. I really think that
> > panel (part of the) series can go in first as it fixes a very well known
> > bug _and_ allows a pretty good cleanup to a whole set of drivers.
>
> I don't necessarily disagree on principle, but if you state that it can
> get first, and fixes a known problem (which one?), then it should be a
> separate, standalone, series.

A problem of panel bridges having the wrong lifetime because of devm_
attachment to a wrong device and so either being kept for too long or
being destroyed too early.

>
> Ever-expanding features are bad for both the reviewers and the
> contributors, even more so when the discussion happens off-list.
>
> > With all those panel / bridge wrappers gone we should be able to see a
> > clearer picture of what individual drivers are doing. In other words,
> > which memory and which code actually hosts and uses internal
> > 'next_bridge' reference.
> >
> > > - This patch really needs to be split into several patches, something
> > >   along the lines of:
> > >
> > >   + Creating devm_drm_bridge_alloc()
> > >   + Adding refcounting
> > >   + Taking the references in all the needed places
> > >   + Converting a bunch of drivers
> >
> > The last two parts seem troublematic to me, but, I must admit, I didn't
> > spend so much time reviewing all drm_bridge usage patterns.
>
> Why? the third one is already done by that patch, the fourth can
> relatively easily be done using coccinelle.

I have doubts about cocci. It doesn't have a way to know, what is the
lifetime of the references to the reference-holding memory. Maybe I'm
missing a point there.

-- 
With best wishes
Dmitry

