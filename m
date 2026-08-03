Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907C0C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8Wl8glcfw9dwbeP1JywUt3GNYgmfkhCQveycZVpS4Y=; b=xpB41Dnzm+j8ZP
	yg8niWaIz0zOt+xe0RYI4sRT2F+KTRUhzuqANZQVYOyZ69M5sdhYIUyIjXONp6OqxKSBfOWaaEkTO
	fDe9qeQ7ARB8CZ/gvVUnyUJN+9C2z1dpkklbcXiY0aDuYIklMYRK+hJ7mRfHjZFYUYZPvUeq3bil/
	QNgpbygZpv+a7eWF16WrdGNB7Ratyp+Zu0txI67bzRGsFdmawdJSC6hWcAubEYsdT/1YRAtCkQdP1
	wSjCBPJ56cp33YRF+dVnJ2Es3F6BNnQIOGqzvkfz+h/5tFoBw0VRSmljxOJ9G9CvxgU2eWsAwVAjk
	efcMwOBF0TIfvWYU6AlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwPm-00000000EGB-2WHU;
	Mon, 03 Aug 2026 17:25:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwPl-00000000EG0-0vR2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:25:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95C4960A64
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3221F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777924;
	bh=f8Wl8glcfw9dwbeP1JywUt3GNYgmfkhCQveycZVpS4Y=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=GFTEUWkmu2NCm4po3VjBMuGvVHYDGUBNmMaXilf0mY7UiI11PCXNoSowwKYofYwuG
	 a94uOifcgZdGu4a8vv7o/Cl86Eiyf+4BdVRXzdwratD0+v1CZ8dDIIZmmYPUiHlXCA
	 rpXFLEDhUdpVbg9W6F2dyCd7bbnM4dYvkIeSulNt4QJEPd+U92q/2f8fwiRHpaAfU+
	 j/NbMgtA5vXrIuVdGBYH4Me0aHnfGqmk6QmNluqfzByvNi42EN8SqYej3sR6iTBE1S
	 f6OoD5z62DgI7yTUygaubHXGcNTf9W0u8oYL5TdZiwbfOE6KJZf4rsJeudLtWCVPbm
	 KAWasP5FyLHkw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c83acb86eso32723981fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpvsliPKZPCINqLaLDo5qc+TfylgkKBsws+eba38MJ3BQtf5QTCXX8AcndK/tsncNvr84mBAkegTePrpFkrhjMm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9qD8Cgqje1qj4HZRwv717Q23yOD9GcEyLa4RQ4IsLaTNS5RDT
	agyxa6YkYlyvzUgzdjarqK7jN22I3myd7rGYjLc7T9MPDYKd24xOfMoaPobUt/lJPVK9MagAnX8
	Xu3j1+tV5Wmirj5wsry9aU+GtUrjtCzY=
X-Received: by 2002:a2e:bc23:0:b0:39c:99e9:da37 with SMTP id
 38308e7fff4ca-39f86105917mr20611141fa.1.1785777922694; Mon, 03 Aug 2026
 10:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v66E95PwYhdPC4mkX1htF2VXECiGwUHfzLHV2ydOMiwxrg@mail.gmail.com>
X-Gm-Features: AUfX_my_BxERgV_M62Gj1-mbWsAsqDTo5FE1B6VdIoWAAMqmFyEPjHTvoGE-COI
Message-ID: <CAGb2v66E95PwYhdPC4mkX1htF2VXECiGwUHfzLHV2ydOMiwxrg@mail.gmail.com>
Subject: Re: [PATCH 13/13] drm/sun4i: Align VI buffer addresses for subsampled formats
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> This is a partial revert of commit 79ac1c945ab8 ("drm/sun4i: layers:
> Use drm_fb_dma_get_gem_addr() to get display memory").
>
> Chroma must start at the beginning of a subsampling block, for example
> chroma start address for NV12 must be aligned to 2 pixels.
> drm_fb_dma_get_gem_addr() offsets luma by the exact source coordinates
> and chroma by the coordinates divided by the subsampling factor, so for
> odd offsets both planes no longer describe the same pixel, which the
> Display Engine scaler can't handle.
>
> Align source coordinates down for all planes instead. Remaining shift
> of one pixel is already compensated with scaler phase shift in
> sun8i_vi_layer_update_coord().

Well I think this applies to the format in general, and probably should
be fixed in drm_fb_dma_get_gem_addr() instead?

> Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to=
 get display memory")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 09f668c8af24..ad036cb9d88e 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -197,15 +197,31 @@ static void sun8i_vi_layer_update_buffer(struct sun=
8i_layer *layer,
>         struct drm_plane_state *state =3D plane->state;
>         struct drm_framebuffer *fb =3D state->fb;
>         const struct drm_format_info *format =3D fb->format;
> +       struct drm_gem_dma_object *gem;
> +       u32 dx, dy, src_x, src_y;
>         dma_addr_t dma_addr;
>         u32 ch_base;
>         int i;
>
>         ch_base =3D sun8i_channel_base(layer);
>
> +       /* Adjust x and y to be divisible by subsampling factor */
> +       src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
> +       src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);

AFAICT the only difference compared to drm_fb_dma_get_gem_addr()
is the masking here, i.e. round_down().

> +
>         for (i =3D 0; i < format->num_planes; i++) {
> -               /* Get the start of the displayed memory */
> -               dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
> +               gem =3D drm_fb_dma_get_gem_obj(fb, i);
> +               dma_addr =3D gem->dma_addr + fb->offsets[i];
> +
> +               dx =3D src_x;
> +               dy =3D src_y;
> +               if (i > 0) {
> +                       dx /=3D format->hsub;
> +                       dy /=3D format->vsub;
> +               }
> +
> +               dma_addr +=3D dx * format->cpp[i];
> +               dma_addr +=3D dy * fb->pitches[i];


Where as the helper has (or used to have before the blocksize stuff):

    paddr +=3D (format->cpp[plane] * (state->src_x >> 16)) / fb->format->hs=
ub;
    paddr +=3D (fb->pitches[plane] * (state->src_y >> 16)) / fb->format->vs=
ub;

Am I missing something?


ChenYu

>
>                 /* Set the line width */
>                 DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
> --
> 2.43.0
>

