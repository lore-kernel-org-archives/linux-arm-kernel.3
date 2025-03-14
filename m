Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7598BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIY165QBF2I7E64kxf0y7gan5+WkPY6SwpR93M25+8U=; b=0wohWWpZxOCZNKPU0mYVk4jTWF
	JXEDJ7ZFgxBasu0Nr/xk3R+LaRjkjD2MK6qb/ZVjvP83rypNsEiWYn1F6/eFQvUkY9FhVVX2pfbck
	zYObSaKeKtdOveLJMmG3yktVKNXQ8fTn9yyFl4PZoi3gh2J7gir5CQhMl3kDMiMkfA0/Ha5tq8wsX
	1Bp/c854UQNEuN1xHhX7PHAMYa8x7CZ5qSO8p5qclrCZ1cBsNIfY5gxZCSRu0v/bId8fI5mAdcS/w
	IYrber5rWoteB2wtg/ND4b8hqAYFL1s7Ie2TPfxgOeoYCPJf8avcGiSa5kyftKLHNAZqNa+1j7alY
	YGi8wOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Wl-0000000EfTh-2Oxc;
	Fri, 14 Mar 2025 16:04:51 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Sg-0000000EepC-1chy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:00:39 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so561521a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741968038; x=1742572838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIY165QBF2I7E64kxf0y7gan5+WkPY6SwpR93M25+8U=;
        b=TZdCwFxysKtV8D/XFN+dmxhgh2wWTj1mz200GvVfaoFKt7S76x+DkbJCVQcQTelx8A
         C9uUcr/zx+DpZgRF8lK7ycFIkJmORgHrXHg95Bo8VHgO3cc2kOpnb2+H9m9lTaO86Eoj
         2C61i6+ZILBUr3T6cKEcHwhik/mJHrI5fn8RkCsKec1Yl2AgzCXE/gYZ43B3s2aWm2Vf
         Nz58UK3KPDK6cJQ47iqm5YIA7DtbxuLlvlxdo2t2WeS2Do5wRVR5ZMV3H4ST3ULE9SQ5
         4fCM9EmQNG7hpKUca/neyaam+3ojie+bgJMLwgWktTt/buj4Qgc7VDPwN3HDQaOuGmNJ
         cCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741968038; x=1742572838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIY165QBF2I7E64kxf0y7gan5+WkPY6SwpR93M25+8U=;
        b=MZRwVe3//V18KTjBjzs91Do1/t3LJR+Be98fsPkSJO/4BMYo117nEE5DFpAkgRZV/V
         d67OhM0sMSw5pxP0bYhfwZyzwWcdAJtp/9+ZghYHRZf+PxLRw+45QLy9v8y81+pK9IGa
         rDUhBCNzsV6WB9t1M3UGRBbJPaXcSiPYPOaOmnJuZJ63LVUitJusOE4XUsgQJv6v6ri7
         1mXaesk7sagyASXPb8dFxfdzOSsD/Zgokun9ZWXkr3d2s1R8fiKbHpfBDzpLA+HsrOHl
         Yn18KWd6JS0nA42EhPudJZlYaw8YNj2jbyzOU3KYY3AegMBmrBd8U6/7Fa5pJV3hKptE
         CpZA==
X-Forwarded-Encrypted: i=1; AJvYcCUemZmdzflgDiB3PM71sHJuU7ilBYih+BUVsaOVVip0UyyNEk0z4AJL2ag3Tgkn3n1NugjhB6UDRqufzx1uFGe1@lists.infradead.org
X-Gm-Message-State: AOJu0YxpKTe/aRvKu3oB3eMtGXlGfNzFqyhZlJsVl4A2VkiEsPWelu0N
	htqx/6+ncAK3SjjmghxWCObVzvyG6WLlF/7oNI/WIQv8sbZRugRjkpw3qPsRDX0moV8sCAcVh8e
	FNZd9qvd++K9EbPW1Cs6RxM/NaA==
X-Gm-Gg: ASbGnctDGFSkAxhF2+4FrLcfwQ4sqelKN1HJeos3LX7YSGAWKGpNNbXbEj/6ouVDgYq
	g+0HVHD2avwEvxPpVYAjvN9OjvqQu9TWPB+NyvCH++RRNKpquA3GYi71yA6VMNvWHHG9MS3lvcg
	hU00nZCRfww1XUg6/gTSGBN2KLyUQ=
X-Google-Smtp-Source: AGHT+IHPg5LEX9RcXJcT7z3Dh6z47dRs4csMp548pLAhreG5srJVcZIIpfZ8T/92XQSoT8s0QhUvp3pVVX5xQ+RxwCQ=
X-Received: by 2002:a17:90b:164f:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-30151c88e12mr1556703a91.1.1741968037522; Fri, 14 Mar 2025
 09:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250314012029.668306-1-chenyuan0y@gmail.com> <20250314-prophetic-attentive-platypus-3ab214@houat>
In-Reply-To: <20250314-prophetic-attentive-platypus-3ab214@houat>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Fri, 14 Mar 2025 11:00:26 -0500
X-Gm-Features: AQ5f1JoUD0V5ZOdvR5FcIitlHbVLK_E695Xu4I0ACsV86e_NOveKe5yScUlp2jo
Message-ID: <CALGdzurT1_fY_o8Hv92j4+XFQHu1iHRzqVtZAM8upHYBPfA1BA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: backend: Fix error pointers in sun4i_backend_atomic_check
To: Maxime Ripard <mripard@kernel.org>
Cc: wens@csie.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, jernej.skrabec@gmail.com, 
	samuel@sholland.org, neil.armstrong@linaro.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_090038_425151_B4BF35FB 
X-CRM114-Status: GOOD (  23.54  )
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

HI Maxime.

Thanks so much for pointing that out!

How about such a patch?

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c
b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 2dded3b828df..5ad0e90d3e6b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -490,9 +490,14 @@ static int sun4i_backend_atomic_check(struct
sunxi_engine *engine,
  drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
  struct drm_plane_state *plane_state =3D
  drm_atomic_get_plane_state(state, plane);
- struct sun4i_layer_state *layer_state =3D
- state_to_sun4i_layer_state(plane_state);
- struct drm_framebuffer *fb =3D plane_state->fb;
+ struct sun4i_layer_state *layer_state =3D NULL;
+ struct drm_framebuffer *fb =3D NULL;
+
+ if (IS_ERR(plane_state))
+ return PTR_ERR(plane_state);
+
+ layer_state =3D state_to_sun4i_layer_state(plane_state);
+ fb =3D plane_state->fb;

  if (!sun4i_backend_plane_is_supported(plane_state,
        &layer_state->uses_frontend))
--=20

-Chenyuan

On Fri, Mar 14, 2025 at 2:17=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Thu, Mar 13, 2025 at 08:20:29PM -0500, Chenyuan Yang wrote:
> > The function sun4i_backend_atomic_check was dereferencing pointers
> > returned by drm_atomic_get_plane_state without checking for errors. Thi=
s
> > could lead to undefined behavior if the function returns an error point=
er.
> >
> > This commit adds checks using IS_ERR to ensure that plane_state is
> > valid before dereferencing them.
> >
> > Similar to commit da29abe71e16
> > ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_change=
d").
> >
> > Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for=
 the frontend")
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/su=
n4i/sun4i_backend.c
> > index 2dded3b828df..a8e0e2123764 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > @@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi=
_engine *engine,
> >       drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
> >               struct drm_plane_state *plane_state =3D
> >                       drm_atomic_get_plane_state(state, plane);
> > +
> > +             if (IS_ERR(plane_state))
> > +                     return PTR_ERR(plane_state);
> > +
>
> This introduces a build warning. You shouldn't mix declarations and code.
>
> Maxime

