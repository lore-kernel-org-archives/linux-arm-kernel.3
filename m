Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A124C10854DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJQ8a+oK7e3o9ElFh7hTVj7pj4xoXxfHO84hbLiAThU=; b=T4ebk/M63i/wVE
	CRAoGzMOIqkHyKCj/+rzGWUbyNwweWBalxgqhj9tvZkgTY/ep1nXXbKbx2Xsy+8KMaYCrxoVsHpfR
	u7GH7yjoQWvJgTPe9K9hHYk2AzLkBNIDwIQcBGmN9fab/mOeMUX22OQxyWSYsQ57VgjXqn8CdjWsm
	5DVg1oQcC4yqpaF5dxYB4piBEKulzUeE+rZckJKkMaPyev/YSoW5WCMbaObtdubAtZXu2IzIz5Kz1
	m4+8JFgowk5ZRGqNxNI1NihyfcIgR9icONKDrx90lIH+Qf/GCjBhAw3EMyrTnwauhJrILhz6RHFRU
	YmPIIYeGzXUrs0IXKuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nJg-000000089e3-3eog;
	Wed, 18 Mar 2026 09:35:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nJe-000000089dI-3bVJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 09:35:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2865D4321E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04666C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773826550;
	bh=NNL2xgUJCPM81B+UYpkjib8Cjd06OgJVpxhiciQMxo4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=TFt9s5U9RL0FcxVNls0KlnRrgrlHTyP6WbwAinOm/ERWY3mJGthOeJVm7ADc673y9
	 THwq1X9VkBBVfbfXIvSTTJ4LVxqNxBiwCYF6VhiFYP31JGBNVne8Pvly4mJRFRJOIx
	 SERFuWsFOacNy47KPA7/spwnt+Mg3Ov6wZKu+wkJzl/AFQsEHeYgBhkc4sh60ZyMpt
	 rdV4k6VG/ieYleYKHrsjFw3dg9tdQdcliCX03RVEq9G3/dG4QDMvaFdM0vX9BF2myK
	 o3WXZJ21LKhLgD7Sa+UvwlXuZ3mrEqeumm4UmWCeiNZPW8S67r+CTEdBo8OgHvKpAf
	 /b31jJNKWv1lQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a27c329e98so191294e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 02:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV++Q/rYYe1QXqQqYfiED/0fo+FDSnXIi4mlJFjhhL3x6pbyjpdEubMq1fd+m/f4MA07dxyuYsxMeTLGvDvGVF6@lists.infradead.org
X-Gm-Message-State: AOJu0YzvKnZTRucHuslNL9NxMnqHxqnwphFVlvwgkNvX1weeopd8cTCx
	uEOhod2CgEFliZicvVJQTZCS7LrNMlqEf1Z2alhjlAalTmMx+/b6fISGiFVMs50rTFmecTGjPLE
	kgxyEo6FoNt4XP+ODxYfcFJ7WkfZBWAA=
X-Received: by 2002:a05:6512:4385:b0:5a2:7a31:9194 with SMTP id
 2adb3069b0e04-5a27a319417mr807672e87.19.1773826548295; Wed, 18 Mar 2026
 02:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260309165635.1138413-1-wens@kernel.org>
In-Reply-To: <20260309165635.1138413-1-wens@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Mar 2026 17:35:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v67sA48gfecLKiGozULmTo45hXF25n+2+nAHVFY_QEL24w@mail.gmail.com>
X-Gm-Features: AaiRm51bZESMFhkKeSPe84bj2pH_AC1xNkhL9Br1ZIQosPwlFSutjUaZxouPc_E
Message-ID: <CAGb2v67sA48gfecLKiGozULmTo45hXF25n+2+nAHVFY_QEL24w@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get
 display memory
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-sunxi@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_023550_944378_FA07818B 
X-CRM114-Status: GOOD (  21.82  )
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

Hi,

On Tue, Mar 10, 2026 at 12:56=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
> adds a new helper, which covers fetching a drm_framebuffer's GEM object
> and calculating the buffer address for a given plane.
>
> This patch uses this helper to replace our own open coded version of the
> same function.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 16 ++-------------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 27 ++------------------------
>  2 files changed, 4 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index f08f6da55dd0..72c92203ae63 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -124,25 +124,13 @@ static void sun8i_ui_layer_update_buffer(struct sun=
8i_layer *layer,
>  {
>         struct drm_plane_state *state =3D plane->state;
>         struct drm_framebuffer *fb =3D state->fb;
> -       struct drm_gem_dma_object *gem;
>         dma_addr_t dma_addr;
>         u32 ch_base;
> -       int bpp;
>
>         ch_base =3D sun8i_channel_base(layer);
>
> -       /* Get the physical address of the buffer in memory */
> -       gem =3D drm_fb_dma_get_gem_obj(fb, 0);
> -
> -       DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
> -
> -       /* Compute the start of the displayed memory */
> -       bpp =3D fb->format->cpp[0];
> -       dma_addr =3D gem->dma_addr + fb->offsets[0];
> -
> -       /* Fixup framebuffer address for src coordinates */
> -       dma_addr +=3D (state->src.x1 >> 16) * bpp;
> -       dma_addr +=3D (state->src.y1 >> 16) * fb->pitches[0];
> +       /* Get the start of the displayed memory */
> +       dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, 0);

I just realized while reading more code that there's a subtle difference
here.

The original code used state->src.x1, which is the "clipped" coordinates,
while drm_fb_dma_get_gem_addr() uses state->src_x, which is the original
coordinates.

Jernej, do you know which one the driver is supposed to use? Or maybe
it doesn't matter?


ChenYu

