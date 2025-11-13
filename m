Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8004DCD6E5C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQkkqmO1JTEqvi4TMO0ZQ/b1FHhR2XjnwcEZpp95XA4=; b=sORTr22ZX+czEwmTzCi1JE5ZWO
	vb3bKv6vx+GXvd6vrAIsRnBi53LkMjBdm1Zi3rNsRkAZmmA+skgOl0qMmMQxCP7A1lafLMSAs/+eK
	PeoTzqIa2JdOYP6lJGIXUlRSf6Gs6rNorS60rERQkBPBqlKkHwYJG7U3RRWIYcLAtwHa4JWutHw9b
	sRc6sLcooZFr7yTcfXZDfgUU0npZAIucMzwZcilL5xoj+zb+jxoLxK+5QPXnGGCgqy7IlYU0g38Gb
	D9zvulOaIa6zcJRNysS1p06lDE3LaO8UsPuGDEFBmP9Sz308tUrPrgV2GVdgCkC6kvMWZf2M2YBbO
	hnGKoO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYEb-0000000Abgv-0rty;
	Thu, 13 Nov 2025 14:23:37 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYEY-0000000AbgS-2Rlg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 14:23:35 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-9351ed45fb8so251814241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 06:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763043813; x=1763648613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQkkqmO1JTEqvi4TMO0ZQ/b1FHhR2XjnwcEZpp95XA4=;
        b=EpQPHJp7Y5psSP9ICilELCFnvodc52Tu9C7bRChYT4cz8Z9TlU0ZmdGX9WQ8yKPRMQ
         DESqSAoIp9wFLp4292FMMC2ZJk2JMeBIMvLswoZlyxfJTXd+fNR2jMeTIjvVMY+vx1JF
         kT7sk7r91BrNaHrTE4fMfxhY3xLPbl/w+oPn7UDN/Mw0mNuGGRhfY+dGyNtCYrx7EZJR
         LWHlygjJ5KkfP2xjkI4ryF28jaPSWL2Lr929Rkp2WdPngllOToxzButf2HCQ6GOW25pv
         B9XwgTYlmdif8K7/k412m2wMNp4FC0yoaxkfKa8jSGBcPMtiTs+sNX5LQBySs84Xt+Y/
         tQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043813; x=1763648613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AQkkqmO1JTEqvi4TMO0ZQ/b1FHhR2XjnwcEZpp95XA4=;
        b=e9ACdesQVWffeR4e8Fc9+sKRJGKgNU02i+VfqKh4a5L5hy65QZQ//DXL0pgvtsA80Y
         dVEFBro8H+mj/MKZ8sHesUPSuN7dKyRsc5MwR+XBVdydh3zosxWgJGFckeA4CPtpDZwS
         xbEI54yn7lmGCXxMEaWg+YjqsSroQHvBl6Yc6EvKz3u69BuYkmL9KB+Zt2w4fZn/Zjxo
         VMxpsqpK6lHC/3l6rwgjORFEZ4ZkWTcXx0EOqUYDBfgoxYYQGBRICospFLoz/lVH6GWf
         dPIXhUHAmkGeauSs1g7mYEJi/4npE+hdkNoYx8Y9+a8DQzv+v4jSSeYsD0DasXYnzB87
         BvDg==
X-Forwarded-Encrypted: i=1; AJvYcCU+f9pEOhEDvYpcUutI+RbOAPQXwjkFyL6pyYybxrM40R2RN0xfgXkLymTegQcjmDvgFNVxTHSDXJJ/KBiqzRO0@lists.infradead.org
X-Gm-Message-State: AOJu0YzVSTRe+JR20R3vbNTJ+Dgft6DKil8MtdyZRjrLF+5GmHeSfmJ9
	9u0QUyVY/eHZrA3xQyeNsq8VxNPbyyDsLjsWelePmkGH83FaduWEUmMwHSR3D7K/FEoY2BtZnTR
	cJTLEA0KkboDHApckRgqij3Qd9N9xJvI=
X-Gm-Gg: ASbGnct0Zr2Wu15Xqa4Qd0iDEb3Hyxxe4ke30N4HRsNppjTZ6xJ6YnMpzSXJkF+oU5m
	p0hB1leLfetDWAAaMjbEE6SIrIlq/tlYLIfPsqLQOjSlZEqzvk4qZMIKw3DDhB9ZGxcSxyUaTJ0
	mEgORVxOSHIPas7VzfhAgSiMIv+xT33o6YjF84RovChQcvZR0jyLnCOK4cEwWmKQplzuQ/RPF+l
	pDEZ6scZtyMjr7ShRDmbadFL/KpjFiHgOd/JzrhNVdKDV39tFxjF4Rhmn/BWMkciCAKCw==
X-Google-Smtp-Source: AGHT+IEdl9tzzz4LmeLbbScFz7vEKneZAAwSpFKwNSObLKjtaLI1BVG/9M8fwcPigkX8YTSZH2mEkOKn47z8CXxwMZQ=
X-Received: by 2002:a67:e043:0:b0:5df:ac57:b0ea with SMTP id
 ada2fe7eead31-5dfac57b3ddmr1090766137.10.1763043812409; Thu, 13 Nov 2025
 06:23:32 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4@epcas2p4.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com> <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
 <CAAQKjZM3qgQO=FaAuc4d1aUT1fCT6Vfo0X7Y7B=NwRNM=B34wA@mail.gmail.com> <000001dc537e$42b8bc20$c82a3460$@samsung.com>
In-Reply-To: <000001dc537e$42b8bc20$c82a3460$@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 13 Nov 2025 23:22:55 +0900
X-Gm-Features: AWmQ_bkMCoxlUNto3uZx9EZFH13ZH-AWorJ3ocnpvF6QI-HTLttLH3Rd-wpAotw
Message-ID: <CAAQKjZMAPtisBhgcZE1QVoUsG8n=4PGzNB9rdVtjxaVnGc0YOA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/exynos: plane: Disable fully off-screen planes
 instead of zero-sized update
To: hy_fifty.lee@samsung.com
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_062334_645402_5C9D2EE4 
X-CRM114-Status: GOOD (  40.96  )
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

Hi Hoyoung,

2025=EB=85=84 11=EC=9B=94 12=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 11:44,=
 <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > -----Original Message-----
> > From: Inki Dae <daeinki@gmail.com>
> > Sent: Monday, November 10, 2025 11:24 AM
> > To: Hoyoung Lee <hy_fifty.lee@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin Park
> > <kyungmin.park@samsung.com>; David Airlie <airlied@gmail.com>; Simona
> > Vetter <simona@ffwll.ch>; Krzysztof Kozlowski <krzk@kernel.org>; Alim
> > Akhtar <alim.akhtar@samsung.com>; dri-devel@lists.freedesktop.org; linu=
x-
> > arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linu=
x-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 1/3] drm/exynos: plane: Disable fully off-screen
> > planes instead of zero-sized update
> >
> > Thanks for contribution,
> >
> > 2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:2=
9, Hoyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91
> > =EC=84=B1:
> > >
> > > Some configurations require additional actions when all windows are
> > > disabled to keep DECON operating correctly. Programming a zero-sized
> > > window in ->atomic_update() leaves the plane logically enabled and ca=
n
> > > bypass those disable semantics.
> > >
> > > Treat a fully off-screen plane as not visible and take the explicit
> > > disable path.
> > >
> > > Implementation details:
> > > - exynos_plane_mode_set(): if computed actual_w/actual_h is zero, mar=
k
> > >   state->visible =3D false and return early.
> > > - exynos_plane_atomic_check(): if !visible, skip further checks and
> > >   return 0.
> > > - exynos_plane_atomic_update(): if !visible, call ->disable_plane();
> > >   otherwise call ->update_plane().
> > >
> > > No functional change for visible planes; off-screen planes are now
> > > cleanly disabled, ensuring the disable hooks run consistently.
> > >
> > > Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > > b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > > index 7c3aa77186d3..842974154d79 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > > @@ -91,6 +91,11 @@ static void exynos_plane_mode_set(struct
> > exynos_drm_plane_state *exynos_state)
> > >         actual_w =3D exynos_plane_get_size(crtc_x, crtc_w, mode->hdis=
play);
> > >         actual_h =3D exynos_plane_get_size(crtc_y, crtc_h,
> > > mode->vdisplay);
> > >
> > > +       if (!actual_w || !actual_h) {
> > > +               state->visible =3D false;
> >
> > The state->visible field in the DRM atomic framework is set to true onl=
y
> > when the following conditions are met:
> > - Both state->crtc and state->fb are present (having only one of them
> > results in an error).
> > - src_w/src_h and crtc_w/crtc_h are non-zero.
> > - The source rectangle does not exceed the framebuffer bounds (e.g., sr=
c_x
> > + src_w <=3D fb->width).
> > - Rotation and clipping checks pass successfully.
> >
> > However, this patch modifies the state->visible value within vendor-
> > specific code. Doing so can be problematic because it overrides a field
> > that is managed by the DRM atomic framework. Even if it currently works=
,
> > it may lead to unexpected behavior in the future.
> >
> > For example, if the DRM atomic framework sets visible =3D true after
> > validating the above conditions and begins processing certain logic, bu=
t
> > the vendor driver later changes it to false, the framework may still
> > assume the variable remains true, resulting in inconsistent states.
> >
> > Turning off a plane when it doesn=E2=80=99t need to be displayed is a g=
ood idea I
> > think. You might consider contributing this behavior upstream so it can=
 be
> > properly handled within the DRM atomic framework itself.
> >
> > Thanks,
> > Inki Dae
> >
> > > +               return;
> > > +       }
> > > +
> > >         if (crtc_x < 0) {
> > >                 if (actual_w)
> > >                         src_x +=3D ((-crtc_x) * exynos_state->h_ratio=
)
> > > >> 16; @@ -244,6 +249,9 @@ static int exynos_plane_atomic_check(struc=
t
> > drm_plane *plane,
> > >         /* translate state into exynos_state */
> > >         exynos_plane_mode_set(exynos_state);
> > >
> > > +       if (!new_plane_state->visible)
> > > +               return 0;
> > > +
> > >         ret =3D exynos_drm_plane_check_format(exynos_plane->config,
> > exynos_state);
> > >         if (ret)
> > >                 return ret;
> > > @@ -263,8 +271,10 @@ static void exynos_plane_atomic_update(struct
> > drm_plane *plane,
> > >         if (!new_state->crtc)
> > >                 return;
> > >
> > > -       if (exynos_crtc->ops->update_plane)
> > > +       if (new_state->visible && exynos_crtc->ops->update_plane)
> > >                 exynos_crtc->ops->update_plane(exynos_crtc,
> > > exynos_plane);
> > > +       else if (exynos_crtc->ops->disable_plane)
> > > +               exynos_crtc->ops->disable_plane(exynos_crtc,
> > > + exynos_plane);
> > >  }
> > >
> > >  static void exynos_plane_atomic_disable(struct drm_plane *plane,
> > > --
> > > 2.34.1
> > >
> > >
>
> Hi Inki,
> Thanks for the review.
>
> I agree that mutating state->visible value in vendor code is risky.
> Rather than touching the DRM atomic framework or that field, how about we=
 add a driver-private flag in Exynos(e.g. exynos_drm_plane_state->visible) =
and use that instead?
> If this approach sounds reasonable to you, I=E2=80=99ll spin a v2 along t=
hese lines.
>

For now, it is fine to add a driver-private flag and apply the change
only to Exynos. However, I believe this feature can also be generally
applied to other SoCs whose display controllers support multiple
hardware overlays, not just Exynos. Therefore, it would be ideal if
this could eventually be integrated into the DRM atomic framework so
that other SoCs may also take advantage of it in the future.

Thanks,
Inki Dae

> BRs,
> Hoyoung Lee
>
>
>

