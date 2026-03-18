Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E32107760C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 19:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wv6jP1e3M1+PHnQU5Hq+FG1C5SwOP02k/za1P8Uz0WI=; b=MNsumqKLRgm58poT8RMol2A5RF
	UVb+ZGiNiV9PbIA8yCn8sZw9bQb94Y1RwtUgMQl6yUjYGt1HnVaAD3c+vvvgxetQNojHDZs4gPkkG
	tKGtjteFC8WYogvoFRPBjZEfmwaU34+1LTR0poAax0eZcd82qgz8pJ2huDZK2KJ1N6hmmq9IuZfTN
	Us3fn/so4rT4jgMUNv/JchaYXUSNYHNXHmw/ffaAXdX/sK6a0yb8/eD/KoFFFhJoCPWxLUwPbeM7N
	nG5rfmdxr3WCoiLxcVgbiT7b5LsRozWKv74IVz4FZbCyfwTZE/FHpEwm7A7i5JoyAynnwJi3y86Oi
	VsBCFdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wZC-00000009EhT-1Vq4;
	Wed, 18 Mar 2026 19:28:30 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wZA-00000009EgR-2fVk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 19:28:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-439b611274bso81649f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 12:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862106; x=1774466906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wv6jP1e3M1+PHnQU5Hq+FG1C5SwOP02k/za1P8Uz0WI=;
        b=b7qESpHSq9JgfvXi12CAqbaOkIdWjr872HqS4racgUZXuS8KpVwh9GyPz80ofKer10
         TFDS0Cb4Bdh+AMWoMEHbdvwIML1HuM5vphXNZZfD58x1ZQbFtxJjvCC/ma6n2N5B6oJC
         4mnGkRRrfY7HGKMiT5MPsBBtmW2/UmMRdnYkozhG/FHymyI8szPzR9TCgQGnrwpBZVlE
         uJc/3de1mEmU4B8vqSoU9pdIG1/Z+QAUtldSwyfmYkbvZb9pmB5LN+0pGpWoCn4oaxA6
         UDQpqwbV0fk4eXmS8zAkFJIjpTITA1hvbS+xhNiASFVdUjY30oXxHOG+4frqkRmle/d3
         8nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862106; x=1774466906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wv6jP1e3M1+PHnQU5Hq+FG1C5SwOP02k/za1P8Uz0WI=;
        b=iX9h7FqHO3LqhojqDJTtOrPMGDYWK8WXido8cuBvDCg3M4In9GgREzIj26RIDHWIqF
         ExoUT1PwmsqWmVfnR4rbZyA0Lpkc7rq9JtCsmJ8nGzIaCG8wpnexJ3SOv6l1k1Q5MgVu
         v5J+OeSTOx2SQL99iPJffOROTvQWM/H36heTtG80hIH0o9Q5GobUMq7M3dtu777xUaAP
         gexyf7/Ve/WeVy0s7EvHrEPDl+/gXVlFeM06rt9VLi0L5WkDbO/YXg+eMD1zl9dJAfPJ
         h+9wmkfn15EPrlgyuQNW/j8XtLMABtqc1PQBCPvZ6Os0nlyqxZmxwXJNbeAgcJVX0QB4
         a49Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbVLYZ2mkXWcxos4fD0eAd2JV6kC9vIm6m/Y0R+Bt1P93QopUxAzweX8hellzsC8HtXl/I4B4WtaveJrpJg2y9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1pW2rzlnEYtFtWlt7YHtdFa1m37HKmE2fVKcVHn4mxtsR7Bbc
	XtzDhzhktIJRYjNHvY3SOTU8Rsm1WC7ZaA3ITtLxecSrEn6hcqPX/M0/
X-Gm-Gg: ATEYQzzrUvGqvryngX5TRx3kerDJlzikQ3mK+bfhJ/j0QjRrsg4KNw9Fcu9xG+H88Oq
	7/EgHjNBEKAJT+aFPMEv2CatrPsuax4n0rpbT0XtODqHqTOvgJaquIrOWFQA/jAhEQD5u8/EhI1
	28bgYYxeVs/mSdOfAUIFWihOPchv3SX7+rx11oADc6fiWjmF+zVhK6BD9hSVWYlt+ApQ21noKtP
	WT9+vaehq0QCUkycpYWBZEhgmT261Q93P78O9i7PxyBlE+n4qOfbz3qW7auH5pBuqVhq4yNYXHU
	VwR4fP3pTjNp5Pr0D5+f/uBuzEFzlLJQ+amH2+6jPDfGDg5Ct4diEwBJ+e1V6m9rd7L30/7xgAr
	UUsBHB8TGIjJv16lKlhxhrFeCoM9dOIV1MZfzQ2R+F+j6n6jaOoDE+QaoAiSGojhKmHFaO4UIi2
	4u0ccLkzBgCeyPzsgSMUgFbGExQ+R4aYG2Ww3b+XwozNj7BxMXCcr+ywPXXhND1mXhnf19nmuTH
	0xDQwzW
X-Received: by 2002:a05:6000:400a:b0:439:bcdb:95a8 with SMTP id ffacd0b85a97d-43b52648c7cmr7805238f8f.0.1773862105581;
        Wed, 18 Mar 2026 12:28:25 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-248.dynamic.telemach.net. [82.149.12.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51899617sm10663715f8f.31.2026.03.18.12.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:28:25 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, wens@kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display
 memory
Date: Wed, 18 Mar 2026 20:28:23 +0100
Message-ID: <6247601.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <CAGb2v67sA48gfecLKiGozULmTo45hXF25n+2+nAHVFY_QEL24w@mail.gmail.com>
References: <20260309165635.1138413-1-wens@kernel.org>
 <CAGb2v67sA48gfecLKiGozULmTo45hXF25n+2+nAHVFY_QEL24w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_122828_687759_2ABF96CF 
X-CRM114-Status: GOOD (  24.19  )
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

Dne sreda, 18. marec 2026 ob 10:35:35 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> Hi,
>=20
> On Tue, Mar 10, 2026 at 12:56=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> w=
rote:
> >
> > Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
> > adds a new helper, which covers fetching a drm_framebuffer's GEM object
> > and calculating the buffer address for a given plane.
> >
> > This patch uses this helper to replace our own open coded version of the
> > same function.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 16 ++-------------
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 27 ++------------------------
> >  2 files changed, 4 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/s=
un4i/sun8i_ui_layer.c
> > index f08f6da55dd0..72c92203ae63 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > @@ -124,25 +124,13 @@ static void sun8i_ui_layer_update_buffer(struct s=
un8i_layer *layer,
> >  {
> >         struct drm_plane_state *state =3D plane->state;
> >         struct drm_framebuffer *fb =3D state->fb;
> > -       struct drm_gem_dma_object *gem;
> >         dma_addr_t dma_addr;
> >         u32 ch_base;
> > -       int bpp;
> >
> >         ch_base =3D sun8i_channel_base(layer);
> >
> > -       /* Get the physical address of the buffer in memory */
> > -       gem =3D drm_fb_dma_get_gem_obj(fb, 0);
> > -
> > -       DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
> > -
> > -       /* Compute the start of the displayed memory */
> > -       bpp =3D fb->format->cpp[0];
> > -       dma_addr =3D gem->dma_addr + fb->offsets[0];
> > -
> > -       /* Fixup framebuffer address for src coordinates */
> > -       dma_addr +=3D (state->src.x1 >> 16) * bpp;
> > -       dma_addr +=3D (state->src.y1 >> 16) * fb->pitches[0];
> > +       /* Get the start of the displayed memory */
> > +       dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, 0);
>=20
> I just realized while reading more code that there's a subtle difference
> here.
>=20
> The original code used state->src.x1, which is the "clipped" coordinates,
> while drm_fb_dma_get_gem_addr() uses state->src_x, which is the original
> coordinates.
>=20
> Jernej, do you know which one the driver is supposed to use? Or maybe
> it doesn't matter?

I would say that it doesn't matter for point of origin. Original coordinates
use uint32_t values which means origin cannot be out of screen (negative
numbers). What I found interesting is that clipped coordinates are int, e.g.
they can be negative.

Best regards,
Jernej





