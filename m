Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0265CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 02:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQYjb15LQkUsCJVby49O7R+AcuVLuxsTRLE2IcB39qA=; b=Reza5U0WSixkoK2FGjeIWKiONL
	n1pPR0u7MXIJfkv53u5ZYsWRoOaxQLmlUcm02ciIHx1/2Eq7PyJal+laicMAM8/rmSKTKOOle8EtJ
	FaB//JqJKgn3n35JsLEoeBnV31eKFTqfVSr8nuVr0A02IiNFM+NY1Ot0p4NKobFLmhtOMgfyvUIki
	NLyFqWeo/h/XaR++zdh94qOQVrHkfIPQqY34+sLrK9zPFPYbp9Hgrg8IKRFJ1RCf66pgUduYMvxZj
	CKPme9n5HydNrnNHADl5SipKzyE+BDLcxRnOa9Jo2vEo1o03oeUn9/+E7bITX4TCB4LfZ9HD+e8+d
	hYG0bkqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIHab-00000004cC0-1foM;
	Mon, 10 Nov 2025 02:25:05 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIHaY-00000004cBd-2u1x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 02:25:03 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-55965c96fd7so596053e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 18:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762741501; x=1763346301; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQYjb15LQkUsCJVby49O7R+AcuVLuxsTRLE2IcB39qA=;
        b=i1Zu27Q3fxkPPZiFL3kFDBEdobZ1CFi4aJlLoEpyCA0dX9Qd+Od9Ldu0qghZbNIvwU
         fb7kkH1VNZTCT630fJAy8AJsqEeERfYqqZnJ/vrtvQOdI5guM28NnIII/+BzrdhYbGT4
         zIL7j74PV3zfpOwoB9/9z6XdDSgz6hSB7DGzmurISYlFDtf4sIrkgireJqpEq5sQclza
         b9swPuy64Y16ETJ6pw7dVcViTpbhCQfnNYnVHZjbIpVePVA59s5NFOsm7pcoSTuyE1s/
         PhO4+gCNtDoTy37uKYszK8GPX5Pq38ncqfvHmOIhfxJyPYW6bbE5AAWIXSFlaLPfwUHR
         9Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762741501; x=1763346301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQYjb15LQkUsCJVby49O7R+AcuVLuxsTRLE2IcB39qA=;
        b=chhpYAKvFXlp4c9IIsthZw1kzLrevZs0gJqjCq2VEaP+pMGOqjCQMtik8RLjac57yN
         W5Ka3vbZ5dKwZiFtoVUWgB2zY38SNE32zO6oGzVwQAovwm0NqQoqu6CjJB1H8L6Ce6pG
         18SJxR+Ozv99+sxFelol0H4vl+FG8+twxrvarO0XjGCBiEp5BcwlOCFk4vCnzbbmA+XT
         5+nz2yI9EqIqeudZVAsitdnkgWOlfWt+1FbDV/bRiiGI5LvKnmHs51sMogFCTQYm2Iz1
         LDY2NZKItNqpzEMiIFY2duvZtDkS6HVEfljpd3OWpgvrZXaTu7O1V1GL24damxXC8vAN
         nisA==
X-Forwarded-Encrypted: i=1; AJvYcCWrNbl6dLHUAiB6MrfG+vuKKMWPR0nIwA7jGIMvPW0YslRfOmY060/ISpY2vwGI4XKN8GvDJ+7bQTBBz9cxDi1y@lists.infradead.org
X-Gm-Message-State: AOJu0YwRKgEsNdmkA++1WOOijQ7D+QkUIXnRP8tSJVqlxaOnKbZOweXS
	o+ffpB9yiaG0hO2M/21ReGPfMR3uGqNcjcEjYG0xJZYNx7z32uxR3l9giFz33POl5YnH6O1HD0W
	fK2XCqMla5mYQAIiCXU0hR9zhoOUCOoc=
X-Gm-Gg: ASbGncslAfLO2nB1zSrcwqWoIadrIwQYf8iz4iztqB+rycLl98nRVk5OXe+9WSRtYNH
	s/9dmS1i0SgYZUJfQXREHbQDSot4jC5U3TtBS9x70RTWuKiySHKx+LVn97H9CcBcmbFKjLwfM4G
	63qt4JsVZrK53L1iuoHMCckMfqNzM+NEJFEm8KNdZzYv2m1Yhreto5nJwMMW7oonin9HhOR7nP+
	ANKHmEiCVbOGhm/lj1LqCGpDBdzlRBOTNep7uz0d4GrhP/UZjnUyRLuaXQc8KKLi9Gt4g==
X-Google-Smtp-Source: AGHT+IF2EMlurBzuMt0qOjdQBCv2IFE0TWGHtCo4RfIbED7bE2bHbiRvxWtYQJUkcmfpI0qEQHMqGsLRQb6EJAlUMEM=
X-Received: by 2002:a05:6102:2ac7:b0:5db:fb4c:3a8f with SMTP id
 ada2fe7eead31-5ddc485e4edmr2017252137.39.1762741501079; Sun, 09 Nov 2025
 18:25:01 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4@epcas2p4.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com> <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
In-Reply-To: <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 10 Nov 2025 11:24:23 +0900
X-Gm-Features: AWmQ_bnpaBAd4D4AdmA6qBIjSKlXa89V9KyU_fLfaAFw_TI3ApflT_I8g0W-s48
Message-ID: <CAAQKjZM3qgQO=FaAuc4d1aUT1fCT6Vfo0X7Y7B=NwRNM=B34wA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/exynos: plane: Disable fully off-screen planes
 instead of zero-sized update
To: Hoyoung Lee <hy_fifty.lee@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_182502_766963_9040011D 
X-CRM114-Status: GOOD (  25.44  )
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

Thanks for contribution,

2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:29, H=
oyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Some configurations require additional actions when all windows are
> disabled to keep DECON operating correctly. Programming a zero-sized wind=
ow
> in ->atomic_update() leaves the plane logically enabled and can bypass
> those disable semantics.
>
> Treat a fully off-screen plane as not visible and take the explicit disab=
le
> path.
>
> Implementation details:
> - exynos_plane_mode_set(): if computed actual_w/actual_h is zero, mark
>   state->visible =3D false and return early.
> - exynos_plane_atomic_check(): if !visible, skip further checks and
>   return 0.
> - exynos_plane_atomic_update(): if !visible, call ->disable_plane();
>   otherwise call ->update_plane().
>
> No functional change for visible planes; off-screen planes are now cleanl=
y
> disabled, ensuring the disable hooks run consistently.
>
> Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/=
exynos/exynos_drm_plane.c
> index 7c3aa77186d3..842974154d79 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -91,6 +91,11 @@ static void exynos_plane_mode_set(struct exynos_drm_pl=
ane_state *exynos_state)
>         actual_w =3D exynos_plane_get_size(crtc_x, crtc_w, mode->hdisplay=
);
>         actual_h =3D exynos_plane_get_size(crtc_y, crtc_h, mode->vdisplay=
);
>
> +       if (!actual_w || !actual_h) {
> +               state->visible =3D false;

The state->visible field in the DRM atomic framework is set to true
only when the following conditions are met:
- Both state->crtc and state->fb are present (having only one of them
results in an error).
- src_w/src_h and crtc_w/crtc_h are non-zero.
- The source rectangle does not exceed the framebuffer bounds (e.g.,
src_x + src_w <=3D fb->width).
- Rotation and clipping checks pass successfully.

However, this patch modifies the state->visible value within
vendor-specific code. Doing so can be problematic because it overrides
a field that is managed by the DRM atomic framework. Even if it
currently works, it may lead to unexpected behavior in the future.

For example, if the DRM atomic framework sets visible =3D true after
validating the above conditions and begins processing certain logic,
but the vendor driver later changes it to false, the framework may
still assume the variable remains true, resulting in inconsistent
states.

Turning off a plane when it doesn=E2=80=99t need to be displayed is a good
idea I think. You might consider contributing this behavior upstream
so it can be properly handled within the DRM atomic framework itself.

Thanks,
Inki Dae

> +               return;
> +       }
> +
>         if (crtc_x < 0) {
>                 if (actual_w)
>                         src_x +=3D ((-crtc_x) * exynos_state->h_ratio) >>=
 16;
> @@ -244,6 +249,9 @@ static int exynos_plane_atomic_check(struct drm_plane=
 *plane,
>         /* translate state into exynos_state */
>         exynos_plane_mode_set(exynos_state);
>
> +       if (!new_plane_state->visible)
> +               return 0;
> +
>         ret =3D exynos_drm_plane_check_format(exynos_plane->config, exyno=
s_state);
>         if (ret)
>                 return ret;
> @@ -263,8 +271,10 @@ static void exynos_plane_atomic_update(struct drm_pl=
ane *plane,
>         if (!new_state->crtc)
>                 return;
>
> -       if (exynos_crtc->ops->update_plane)
> +       if (new_state->visible && exynos_crtc->ops->update_plane)
>                 exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane)=
;
> +       else if (exynos_crtc->ops->disable_plane)
> +               exynos_crtc->ops->disable_plane(exynos_crtc, exynos_plane=
);
>  }
>
>  static void exynos_plane_atomic_disable(struct drm_plane *plane,
> --
> 2.34.1
>
>

