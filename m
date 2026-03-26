Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C9810A88E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMVh41/flJhHXUmskY74HI0cHDnV8XVUzcIyI3Tc5Ws=; b=nLeUQY45p3mLS/g9fHd8BUBFkC
	2LAXDsvQs0Rwnmjo4wAlT+vIbINNvxRuDfu+qcNojHh4+oEKtVWjQzogsGAzYObirCb4+aF1Le0nL
	StMnwqV+XS7PY37fc99N53xiyPO334nbYGuB3wHztakRl7nxAK1CDNcUR0MF9jrNwGxUw0pYRb4z7
	5CFbnJuPatw/ueraNQDMVFuzhUKZCsm3KyjNwUJFKnVXM4M3oLv7vMhTurAy4ZXLJ5NvH9s2d5Knu
	/5OycSUF5AMMqgpi/I7ihsEbYHUZGMgu1KRY+6iuLgNksgIX+hfp1hyucnKifSKzBxd29LBDHiFKZ
	eFffGu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nlL-00000005sA0-2qXl;
	Thu, 26 Mar 2026 16:40:51 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nlG-00000005s95-0tFv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 16:40:50 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-89a6ac6f389so13198036d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 09:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774543244; cv=none;
        d=google.com; s=arc-20240605;
        b=IAvaYZYqWuTErJ03skhSev3k13VPFiaDRlKVgwrS8uk9PhTcOqHGsTORENpHMwgSI6
         tk/itBblbcriRenHTI5/r4fLPxNs5EEQ7Y9zlHrIttYsz6f+iz1LLqYqeZE73JhavweR
         ZP95KmX9h1LzQaiRVyQIKvYZSTQrwQZweSvhQd4u6ngjNlA5blxGMkHws8n7OQ/nU3eM
         cJ2T3JXIcXDeULlwioyyLG4d/98Gh5p4ArBAQRQMxKUztqMMEruPTa7swkUjyTRrxdys
         0Gv0Gy50ZDqMJsGm7buA5GLYuzCof4EdJdV8U32I/IHJxlOhJ6V06AQOS3HWX4J6zGhr
         iwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lMVh41/flJhHXUmskY74HI0cHDnV8XVUzcIyI3Tc5Ws=;
        fh=wPSp2FKfLW0lLXxv6uHwWlpOr0Qhq4HsozJG7xnIK9U=;
        b=R57iOxkaiHwSW9PJZhRK1Rq+JaYmRCltiYWuFJEVMu02LcU7I62B3v1602GNkhLT1p
         uwFjVUWWKZ7ncV2kHrnjU8WjZn2lNY40BNrJqPqJnsR4RTQvul/5m1OO9Tn8hzCA5NUm
         NMBu3KTzT4JAzGqJLGMFJYdswKlpawWwhSbJBltwGDqbpcZU0VgDL6DyNcfmKub9Gyg5
         B0vWx4tdLeoXcREjR+14QRyG9hw4AXX5kuEMBZWi71r/ImiSFDKw9KFvoqjaXMPex5Qn
         vPxiDiW/2qUg3cM75chgVzvBYdCLVRiCgA77GhOxoHR9vu7xz4Y6QPhfChSlyzpf2lKA
         tXow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1774543244; x=1775148044; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMVh41/flJhHXUmskY74HI0cHDnV8XVUzcIyI3Tc5Ws=;
        b=iFpUMb78QsLonjyihYc43FNXsn0Qh7MMcvk9MTxEFreeQZbjBF80f+q16wZcbBw+iA
         sKxs9ClYmfGuJrswmDI91+MDV0XnLRShvOYaaTNBBO2rnh3Ut5H83Rq5uHIZPP7BjWcw
         Ma89VNIXVRLtg0K4i8nX5YgBaAdk4IGoaD35BKoj6PmCiHVp5YrZ9R+mZHdvlbJ88RYX
         jRsKXkkRL4r7WZa2kYd7gHS8B1/i6dXW9XBfkKAtRUDIxYKYUmvSHyNWDc8gjtoOe5I+
         v68e91On4vbWG0lbNPm0s2X8g4puCEnn76G06m7S3Z23V06fUxu9g9BZT6bTmueB2nL4
         hc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774543244; x=1775148044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lMVh41/flJhHXUmskY74HI0cHDnV8XVUzcIyI3Tc5Ws=;
        b=OhQBy6oS/RTzqTZaQsTG0DY/HF7YiEa9MxOnyEvCVPS1KOlRGPWn01QAIg2mt8vcBL
         LsEJBJoxmCZzRivzxNPFRMSLczDw12IzmKN6DSyMkDCOwNQjGvYScsyp5nbrxQM9lgOA
         l85XyRQ1e35raifY3jnhsh3HXEPn9VDcP1LmCymlXi03BgzXj7K2NONCiNhfqbie4jl8
         lCa9c9h7P4LiVXgZfyYIzPibRIpJHg0NWYZpcGvBO6bdtG9CA28FRetxz7gEkpnIGvVY
         ESN57YMcUEq1OM6Z6PR0dcajI5+yACQzmDRj17OJZLQdNvqL02Zb4gBLe6ObMqegkqxl
         oaLA==
X-Forwarded-Encrypted: i=1; AJvYcCUURDGJ9HqvIneOJeeEljrq58E1/dx7Su/k7RpIlXxMydsG3AbwJWvru4QrrJdClVPuBUdnjUeEQKJdrf1Wh5vs@lists.infradead.org
X-Gm-Message-State: AOJu0YwSNSDXlocn1k7/W9xZ9PSBHV/zSA62xc5MVTmRWFsLszejzfnp
	ZcZxYrfdR3DZVDniYhv55wZbdVX210Z5pwB3CXkslbZcaAsn3oDigpUMF+WF9yofCCZYAYY6lYk
	VKS0WxXxltvJm1nLgxBn6ZvhbZpoJ4ztyYI0b3TktAQ==
X-Gm-Gg: ATEYQzxJ2nCLv8L4p3Cpc1/En863PjSEIuYAm1RD0ZLaPKflow0qfGkh2nkqRM30jcY
	2JAfTMteB38iG64uKsDB46S249KerZhIU3aAGUmo29f52Y890Rmqy+mhiSZgf3LwzUoaN8c4+gF
	yW0SQYkDGDgVYabEOr/UDJzXu7WyOwZNa/4D9NieTkZAtBba/GkuZM3pw55imHr7ppApb/c1usI
	3kcmrOs1ffN7LNYQF9BBxfnieXVfRcV4pLBFZRiRe+Ldm5nFru8LyVwCUeezgss/ExEevlJPYfn
	NJ1PRQE=
X-Received: by 2002:a05:6214:d6f:b0:89c:866d:15c9 with SMTP id
 6a1803df08f44-89cc4b07bc2mr122325186d6.56.1774543244239; Thu, 26 Mar 2026
 09:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260325-neat-elegant-raven-ebc9ab@houat> <acPA60Ci3n_t__xF@intel.com> <3979783.tdWV9SEqCh@workhorse>
In-Reply-To: <3979783.tdWV9SEqCh@workhorse>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 26 Mar 2026 16:40:32 +0000
X-Gm-Features: AQROBzB2J1rLcK9oOY95uN7pO5Y8iJWro7kBrTyJSKQV06IZlwAC79afqJRLPi8
Message-ID: <CAPj87rMpu-ZL45_uNPcZe3gu8Eqn2ALp3r0zRgghvT08-6RGVg@mail.gmail.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Werner Sembach <wse@tuxedocomputers.com>, Andri Yngvason <andri@yngvason.is>, 
	Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_094046_357541_2918F8A8 
X-CRM114-Status: GOOD (  30.06  )
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

Hi there,

On Thu, 26 Mar 2026 at 12:44, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> On Wednesday, 25 March 2026 12:03:07 Central European Standard Time Ville=
 Syrj=C3=A4l=C3=A4 wrote:
> > But I'm not really concerned about documenting struct members.
> > What I'm talking about is the *uapi* docs. Surely userspace
> > will want to know what the new property actually does so the
> > uapi needs to be documented properly. And down the line some
> > new driver might also implement the wrong behaviour if there
> > is no clear specification.
> >
> > So I'm thinking (or perhaps hoping) the rule might be something like:
> > - YCbCr limited range
> > - RGB full range if "Broadcast RGB" property is not present
> > - RGB full or limited range based on the "Broadcast RGB" property
> >   if it's present
> >
> > I think the "Broadcast RGB" property itself might also be lacking
> > proper uapi docs, so that may need to be remedied as well.
>
> Alright, so in v12 I'll do the following:
>
> - Add a line to all YCBCR connector formats that specifies they're
>   limited range as long as Broadcast RGB is limited. Whether it's limited
>   range when Broadcast RGB is full is purposefully left undefined.
>   In the future, we can expand this to state they're limited range by
>   default unless some other property is set. If we're not re-using
>   Broadcast RGB for that, this will work out fine, because users who
>   don't know about the eventual new property won't have this behaviour
>   changed. If we do re-use "Broadcast RGB" for that, then only users
>   relying on things we explicitly left undefined will get surprise
>   full range YCBCR.
> - Add a line to the RGB connector format that specifies its range
>   depends on the "Broadcast RGB" property
>
> This is a bit of a mess, because it's entirely reasonable that a
> future YCBCR range property would want to default to full range
> so that users get the most color out of their monitors. But with
> this description of the connector color formats, we can't do that.
>
> If there are alternate suggestions, I'm open for them. We can't
> really rename "Broadcast RGB" but if I had a time machine, that'd
> be my first choice.

'Broadcast RGB' isn't what you want even if it could handle YUV, since
it also sets up colour transforms to modify the data ... so we need a
separate, orthogonal, property which only affects the HDMI infoframe,
rather than applying any transforms.

Cheers,
Daniel

