Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3371AC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 04:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5DKEYyvWEAWVKejXJm1cVbz3X+KIz29ykH7P6jopns=; b=GfqR271iGwnRFPt1lg5M2Okd2a
	FMU9IIJZfnMlGg1Hzx1aZN72yih8ik9zsPUnfaaK9WCmFBxF03ZDcqgLjBcyzTKID8enR/ghMKd4v
	SHYfCcJEzzCvr644QhN+GFmv72FenIY6lNAI/bdF+Wo7s6aKCLyHNC65N045izCkddUru6j0S1atY
	FkSMbA+obqtNxvJUW8eMK4reYUdGVTY34fgXYAXoLlMZ7ivN4DPRMmysrvDz/cKDZni+24AIUjgKT
	HrrM+Utxavv1rP+R7S1j2J9nlrFn5O3tRpXjX5NaKh0Z9gEIPHGHQQYJXntKoe87bIPy9zodwtmLe
	HcBGJp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Q1Y-0000000DRNd-3nDg;
	Fri, 18 Sep 2026 04:16:32 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Q1W-0000000DRNI-1bDy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 04:16:31 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4ab201ecso307904d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789704989; cv=none;
        d=google.com; s=arc-20260327;
        b=rHS/Yrp1R4GXMclWXN+bgszphU2Ea4WW5gtmvZVqP+h8YPYFnl1/7uiN1AvGbQ2hC8
         IzKVfzVRes8Z3UO7Zt3Ii7aZp9WOO0E6YxUE8CW3dbxJ+JZTCdlmZ9Ipo28j1f1ADlqK
         oHJ+x2CN8sZm30O7PwJK+QX908iSrduWZqvt8YelfwiQtmWewBdXcS+o9c5ewHLUnBdR
         gWXsqdLNrA5CnYUwMlaSp5eZYjAzXd4Uz115azeC0KFPzfiKvmSCPcGeD2/8x9fmMMkv
         qluNUbXWJNpx7vatz/WagFDz5r6yjKrmhXCX+Sfzk5jlq7pvmZqUbMZz126fpXPU6tBh
         AEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5DKEYyvWEAWVKejXJm1cVbz3X+KIz29ykH7P6jopns=;
        fh=vfcRMQ9vvkZZzkHSoQtGmHtFiNB0rAKSv1py2pxtakw=;
        b=NnudNCRiVN7osOE+6TzbB4gUzbMTfX/Cbo/dfEwu9jitEL+yaSnyKnL4NK5mRvTq/v
         R6SDl3Lfi4fjS8jHJG50XYosiLg+K5oeiD7+oaBHkJTLEa2MNnvGLBAD5scCT0PK7UAW
         NfCFOa+Km1KRH6To1qPKyQopAbUmZHfm8bYux+d5c0V4UXd/zkPnR2lP7JU2se1CDp0r
         /jIfuWkJZ6uJUBc8JVyWHGH2GtRJiGeSoo47DwyzYJAgrs1j3A4f5XzUVqcqgSdPnOQX
         7SxZRMrmBno0Thv3ACvVLb4muxxD4g5DYmnHHRAN508dvIcX5SbbupPZHyfljuO33Idu
         NukQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789704989; x=1790309789; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5DKEYyvWEAWVKejXJm1cVbz3X+KIz29ykH7P6jopns=;
        b=IbEuUo79ioRvalCoYfD6x2EGFjltXP6gm5iLise6VhC9ei8AYM3qIOYM9+Vgr3CIGO
         8y4TZUSytdvnvyR0jkEn9XuTgwdFmzUS9o9sBJ5EHxJ+uNjWGIzm+3h3rBa4TO3/BiJt
         plwACprTjtIVABxz23B2WvLfRX5zktp9PcvNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789704989; x=1790309789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5DKEYyvWEAWVKejXJm1cVbz3X+KIz29ykH7P6jopns=;
        b=trupaPEkISz3ANAQVMSGtcWZLyHWcPs0BTenBf4OeJQw5AmDDh2EC3ulz4FTpa7OxZ
         6EvgbMmMuEUsZoA7FvJhN1apMEjKHcuIndQiMjP6lQlC3qsf8m5ev2roCOGCNYrbDPcl
         tTUaXf02dRtS7buJ/EQr+Jhjl5YMNttBVWlNA9LZPB8cnrhJLVmvkbCJ3YyEq43CY3rc
         J+AYhkzsFxl8fwSAASFjOs/AmhWJ4lrWkdBFmDpd8NpTaJvJLhd9afUf2EjJ4+cJS29F
         A2jlrGghcoISGDCi1dP7oeFk8p+BHpeCpcPKVnzkV2m6zJhtoTe+6f2QJAIhsVM8peMu
         ikag==
X-Forwarded-Encrypted: i=1; AKwUvByORmQJkjqrLiln2p197ROEFLWWzUHqr8vcSp8Eum0vi7csdR7dGsdRl65KRO9j5mXiYzLbIFnCc1kBgzomfNv4@lists.infradead.org
X-Gm-Message-State: AFuF++m2isR6ZAOK6SixMc+J5ldnr5N3gQkbGSRunWrE/VJ6WNuCwPfY
	LkWgBJ2DKN41gGeiCNNfx7mWu/dXXxV0vmVcjrWQ2UhQIBzTq+8yNqlnCbgW849/MJsIqs07t5m
	f7YrAk6el7xyoR/4lxczRlD+OnjLYEfj2AkvoPHm4
X-Gm-Gg: AYBFou3UfIc10bPVfaTlJnWa35m0Reh12l1GZDRiHwA+/LRwuph4YWczByHyGnChtet
	+XJ/SEfOGgj0uuu/1cQMmYlmjILFKYj5ukc7+l957V4WO33qM8JbwvC0LDUOSIBOha0ECvhtFkj
	FJW7OzSYL2uyym7yQ1v/iwbkIs5ZJ3cmlZlzjrWm16As4oPhQ5UrxhqJJC6gVKd1gatE7Uzo4fX
	NHJOcRE++4zuOoIDa8uZG+N4fJzStftA+UvMvGYUNKPSUe9o3lGebuMJrnD6wDCL9stFDO0GHL9
	yFqpgC3ixdt8X5XcsSmPUux//3Hu91SS2XTwP8zCISdJ9+yCmkePZ0nH4iD6XHcpTKYT9pyoF0y
	a9TCbx6W7xA==
X-Received: by 2002:a05:690e:809:10b0:671:3141:3832 with SMTP id
 956f58d0204a3-6717fc76ff0mr285169d50.4.1789704988719; Thu, 17 Sep 2026
 21:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <20260916033327.3054126-2-wenst@chromium.org>
 <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de>
In-Reply-To: <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Sep 2026 12:16:17 +0800
X-Gm-Features: AcwNN1UR3eVFLoBD9oF0TIdnuDNIVRYA94Woweb8vmhnl_ZgpInsWYdL86x54Xk
Message-ID: <CAGXv+5ErgWVNtnRiW+QA7+Mzh=W_Y+HGL_iRa1fOaXCYSoAwMA@mail.gmail.com>
Subject: Re: [PATCH RFT v2 1/5] drm: Split framebuffer pixel offset
 calculation from drm_fb_dma_get_gem_addr()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Liu Ying <victor.liu@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_211630_492353_CCDF474A 
X-CRM114-Status: GOOD (  35.94  )
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

On Thu, Sep 17, 2026 at 11:20=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi
>
> Am 16.09.26 um 05:33 schrieb Chen-Yu Tsai:
> > Currently drm_fb_dma_get_gem_addr() calculates the offset into the
> > framebuffer memory for the framebuffer's unclipped source coordinates,
> > adds that to the framebuffer's backing storage, and returns the result.
> >
> > We are about to add a variant that uses the clipped source coordinates,
> > so there is already some reuse of code. However, calculating the data
> > offset for a given pixel is not specific to the DMA FB helpers. The
> > offset is only related to the framebuffer.
> >
> > Split out the offset calculation into a new framebuffer helper so that
> > non-DMA users can also reuse the same code.
> >
> > Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: <stable@vger.kernel.org> # dependency for next patch
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - New patch
> > ---
> >   drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
> >   drivers/gpu/drm/drm_framebuffer.c   | 45 ++++++++++++++++++++++++++++=
+
> >   include/drm/drm_framebuffer.h       |  3 ++
> >   3 files changed, 51 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_=
fb_dma_helper.c
> > index fd71969d2fb1..ab0f37d8a5ff 100644
> > --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > @@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_frame=
buffer *fb,
> >                                  unsigned int plane)
> >   {
> >       struct drm_gem_dma_object *obj;
> > -     dma_addr_t dma_addr;
> > -     u8 h_div =3D 1, v_div =3D 1;
> > -     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> > -     u32 block_h =3D drm_format_info_block_height(fb->format, plane);
> > -     u32 block_size =3D fb->format->char_per_block[plane];
> > -     u32 sample_x;
> > -     u32 sample_y;
> > -     u32 block_start_y;
> > -     u32 num_hblocks;
> >
> >       obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> >       if (!obj)
> >               return 0;
> >
> > -     dma_addr =3D obj->dma_addr + fb->offsets[plane];
> > -
> > -     if (plane > 0) {
> > -             h_div =3D fb->format->hsub;
> > -             v_div =3D fb->format->vsub;
> > -     }
> > -
> > -     sample_x =3D (state->src_x >> 16) / h_div;
> > -     sample_y =3D (state->src_y >> 16) / v_div;
> > -     block_start_y =3D (sample_y / block_h) * block_h;
> > -     num_hblocks =3D sample_x / block_w;
> > -
> > -     dma_addr +=3D fb->pitches[plane] * block_start_y;
> > -     dma_addr +=3D block_size * num_hblocks;
> > -
> > -     return dma_addr;
> > +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane=
,
> > +                                                             state->sr=
c_x >> 16,
> > +                                                             state->sr=
c_y >> 16);
> >   }
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> >
> > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fr=
amebuffer.c
> > index d32aceb6ca9b..9e1231162047 100644
> > --- a/drivers/gpu/drm/drm_framebuffer.c
> > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > @@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_print=
er *p, unsigned int indent,
> >       }
> >   }
> >
> > +/**
> > + * drm_framebuffer_get_block_offset() - Get offset to start of pixel b=
lock for
> > + * the given framebuffer and coordinates.
> > + * @fb: The framebuffer
> > + * @plane: Which plane
> > + * @x: x coordinate for pixel
> > + * @y: y coordinate for pixel
> > + *
> > + * This function will usually be called from the PLANE callback functi=
ons,
> > + * or from one of the helpers that calculates the framebuffer's DMA ad=
dress.
> > + *
> > + * Return: offset from start of framebuffer to start of pixel block
> > + */
> > +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsig=
ned int plane,
> > +                                  unsigned int x, unsigned int y)
>
> Better use u64 as return type.

To avoid overflow? Not sure who would use crazy large framebuffers, but
doesn't hurt to play it safe.

> > +{
> > +     u8 h_div =3D 1, v_div =3D 1;
> > +     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> > +     u32 block_h =3D drm_format_info_block_height(fb->format, plane);
> > +     u32 block_size =3D fb->format->char_per_block[plane];
> > +     u32 sample_x;
> > +     u32 sample_y;
> > +     u32 block_start_y;
> > +     u32 num_hblocks;
> > +     u32 offset;
> > +
> > +     offset =3D fb->offsets[plane];
> > +
> > +     if (plane > 0) {
> > +             h_div =3D fb->format->hsub;
> > +             v_div =3D fb->format->vsub;
> > +     }
> > +
> > +     sample_x =3D x / h_div;
> > +     sample_y =3D y / v_div;
> > +     block_start_y =3D (sample_y / block_h) * block_h;
> > +     num_hblocks =3D sample_x / block_w;
> > +
> > +     offset +=3D fb->pitches[plane] * block_start_y;
> > +     offset +=3D block_size * num_hblocks;
>
> User space controls the values in fb->offsets and fb->pitches.  I'm not
> sure how well they have been validated already at this point. Did you
> investigate this?

It wouldn't be worse than before, since this changes is purely code movemen=
t.

There are minimal sanity checks done by drm_internal_framebuffer_create()
in framebuffer_check(), such as offset overflow or pitch size too small,
but that's about it. It would be up to individual drivers to perform more
checks that match their hardware limitations.

What sort of issues are you thinking about?


ChenYu

> Best regards
> Thomas
>
>
> > +
> > +     return offset;
> > +}
> > +EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
> > +
> >   #ifdef CONFIG_DEBUG_FS
> >   static int drm_framebuffer_info(struct seq_file *m, void *data)
> >   {
> > diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffe=
r.h
> > index 38b24fc8978d..c07aea1cc59f 100644
> > --- a/include/drm/drm_framebuffer.h
> > +++ b/include/drm/drm_framebuffer.h
> > @@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffer =
*fb);
> >   void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
> >   void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
> >
> > +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsig=
ned int plane,
> > +                                  unsigned int x, unsigned int y);
> > +
> >   /**
> >    * drm_framebuffer_get - acquire a framebuffer reference
> >    * @fb: DRM framebuffer
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
>
>

