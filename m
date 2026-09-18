Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA243C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVTLUeibsWBPZCdD+qqGVF/fmQVK7DA4WjMhu8zs7u0=; b=L/6+e15KfwRMXObS6MIaYZaue+
	pnOGNzzcePB/wTLuQ6gKOs+/tgeG4v6fEbMpkHC5xO1q4X4NxATwevEAEFQ/Oqgo1z+Kjn6uSw3Cs
	lEWBS3nxcmqvrKHsBjZ9Wx3a61c7MlHnvKml3vq6JQebyJbSqi0ugECCzHqhR8wr9vKLl5FDk1Shn
	0jp/viJwLglampzUj5IOkfQAZQeEL7lXChLy8IFxG9YkhVzXJlX3GTsJlhgVgIt7wnKVtTIgd8Ta/
	BrPiNM0rKuB9nsOaJUHO0YZX6zDpDmSe541TYbdxN0js3Fn6bjxPaNR0ZMc00CXA/z6bP1gwgkEs4
	kbT3gL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sgp-0000000DeZf-2GAA;
	Fri, 18 Sep 2026 07:07:19 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sga-0000000DeVC-1uHw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:07:05 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66f7f72a284so367642d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789715223; cv=none;
        d=google.com; s=arc-20260327;
        b=symH3l4lBQX9Ufx0zEb3VrjcSGKywPvzGT/7PcauvbicRbCORC86NNLqSK6ZeRicsf
         WRR5inYA/jUxm1TAq2HyaQiEHNLm+pJtipuJGpemUfQpLkwWH0CL0AOF0WB+oifuc5Hz
         I1IbhHEUSirkPlQ4gXZAVq2Ni6Fca9t7aKIpkpghrk2Hj/pUjirosc0aiPuOQjF6Ataq
         lJhdZMT5HZaihEpZ/9fYCwdHwOA107ZVew/pcK6qFywdcxfRyVJfIq3rFsH+lFI8srTJ
         YaYoOfvPoxyMAZbjPhSRPsrbS/XJDhThR094O+DD/0benWc6GMllwkwygdsWtdnv/m12
         0QDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZVTLUeibsWBPZCdD+qqGVF/fmQVK7DA4WjMhu8zs7u0=;
        fh=mKu6XU5TL0aItgrw7kHQ4WU/ET7pILUpqCZYxTihyic=;
        b=FKZn8QSOo9tXXnJOIOLDC8USi7IRDiC34kMNSI2nf8LkPtlbK40rVIHEKXFv1YbjWK
         xgn5cJze+9iglaKR2vnj3mx0IlngThGWOqNRnQX2gm15/04aSwt05TtByo9ssq70m6Yd
         fk3A/8Z+Onrm89L2eNf86MciaYImAjq56t4MRZBMUbDrtvKiJ0HpBtiD4KDGThoXH680
         RVae1W/NP0Y1gBBvZAbnEvzYnp/bJ96bBGoNmPmq1sDWX5UCeoY9mW023ET4zIX7jMXb
         TKtDOQOsJnOVWZHM7xwn+L4AEZmXWeYXOPKm+R87MypOFX0UvseoXaSdm+64fTu3ohEn
         g/VA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789715223; x=1790320023; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVTLUeibsWBPZCdD+qqGVF/fmQVK7DA4WjMhu8zs7u0=;
        b=UCm5F2uaEYTl1EQOEazHiNRvXRFKuRp5twMjN6tmruD5wjrrfYvfSB3eRXLra0/ppB
         mCvXZIcJL4v812jEbwVsFa8CRsNhwiwOuGeWxQGLmSVIdBBOaGo0wF12vLpABLsLTCMM
         PIUnoZC+xNmG7WCeM5J0osPqE7svH6X3bMUZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715223; x=1790320023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVTLUeibsWBPZCdD+qqGVF/fmQVK7DA4WjMhu8zs7u0=;
        b=vRCtdRlMaIQeke2lPkv3UKpgSYF2Il/L45UCivyzrG5onxuRbe/CsjkImkryzLq7DE
         dZ9or9qp1q/m/Fx3T9B9+Glrssvvdkfl/IFh6pKIg59OX5xrqTiGKrsTWUeG9bSLJUxC
         PRaQ3tvoz1r7zCqzC31E3+3ZFtPNCLp/qHXCvsns1hB28C8AIhaXfKNQWhBJceTde8YC
         dPFV7KphK6X+w+009Fjx+UcmvbKimZT9he3JmL1CjmavbiTFgrk9mxwKl2/c/lFrmS6h
         uGqS3Ly8eVD7C+BxAsZxJ6pmOgjN5BaOOCynjKMfAlLNbMIQ9HDX9JzlQujtlDFUYIMu
         Kqvg==
X-Forwarded-Encrypted: i=1; AKwUvBzFlCShotTNI6UB9wTrqtrsZ17lxwuc/jYxOlNj3BdsS4ip7jKozqnWctv4eI0LOZmslknALJsoN5zDX6p0F1Qw@lists.infradead.org
X-Gm-Message-State: AFuF++kSDvDWFEwc5ds/uYRMXRiOL2VccmTKneE9wyh5qYvqVp3XcpIK
	CWyeYDPywtM6307ulb/vV9F/jwq/7jGdzSrl0gCbdvdc5+ilucwm5Qwfefgq2E5eT2y1VK4tHfO
	oTXttum/+VpmioHyog0ZGYQpe0ACFdWfF8Y9YtKsO
X-Gm-Gg: AYBFou15rKOIcxxBTqOJIif3CjAAfO3FhhoIBfj/xPAex6bb+rO2rtAABObGfP1FOWy
	RJt+Hx/+mx1vvMqcmN4mhnU6ez7urpwfcDmNiFzp0NXfbYRT8IohKaI8pYeDk1tNwSYNKYyE0IW
	2o8wVMP6CGr/znSQqveTUnbR2wPsgw8ZVXVVGTEyMVwEQ7nShrs5LBL+l8bqFYpcrGsrhtVfq+t
	bxB7jubg5YiO37OytXfbrxXl1XJUtuvq17ed+Jg1N7tkdSTKGX0y99Hy7tXgRh1GCxylF2N46bE
	SQILkSTOIEFMX0WioMZvYw1Dqiv7IdPIEsL4Go+EpkKrjEnLC0zoRmbl8a90lspJl8CJd1nugnI
	4gW6F3JnrmA==
X-Received: by 2002:a05:690e:c4d:b0:671:7b0:e5ce with SMTP id
 956f58d0204a3-6717fdf1073mr497902d50.75.1789715223118; Fri, 18 Sep 2026
 00:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <20260916033327.3054126-2-wenst@chromium.org>
 <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de> <CAGXv+5ErgWVNtnRiW+QA7+Mzh=W_Y+HGL_iRa1fOaXCYSoAwMA@mail.gmail.com>
 <f7fa4c4c-bc59-4822-94bb-6e9d68f8f0ca@suse.de>
In-Reply-To: <f7fa4c4c-bc59-4822-94bb-6e9d68f8f0ca@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Sep 2026 15:06:51 +0800
X-Gm-Features: AcwNN1VLg__gblp0p9qUFHinFpHutsjL-_8trTnXduaSEQp1OhTN0-X1tjhNQaU
Message-ID: <CAGXv+5GNjKxzHuBn28PbRtbFA1yuJ7h02xDpght4add3emuKJg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260918_000704_575627_BBAB2097 
X-CRM114-Status: GOOD (  41.15  )
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

On Fri, Sep 18, 2026 at 2:41=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 18.09.26 um 06:16 schrieb Chen-Yu Tsai:
> > On Thu, Sep 17, 2026 at 11:20=E2=80=AFPM Thomas Zimmermann <tzimmermann=
@suse.de> wrote:
> >> Hi
> >>
> >> Am 16.09.26 um 05:33 schrieb Chen-Yu Tsai:
> >>> Currently drm_fb_dma_get_gem_addr() calculates the offset into the
> >>> framebuffer memory for the framebuffer's unclipped source coordinates=
,
> >>> adds that to the framebuffer's backing storage, and returns the resul=
t.
> >>>
> >>> We are about to add a variant that uses the clipped source coordinate=
s,
> >>> so there is already some reuse of code. However, calculating the data
> >>> offset for a given pixel is not specific to the DMA FB helpers. The
> >>> offset is only related to the framebuffer.
> >>>
> >>> Split out the offset calculation into a new framebuffer helper so tha=
t
> >>> non-DMA users can also reuse the same code.
> >>>
> >>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Cc: <stable@vger.kernel.org> # dependency for next patch
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>> ---
> >>> Changes since v1:
> >>> - New patch
> >>> ---
> >>>    drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
> >>>    drivers/gpu/drm/drm_framebuffer.c   | 45 +++++++++++++++++++++++++=
++++
> >>>    include/drm/drm_framebuffer.h       |  3 ++
> >>>    3 files changed, 51 insertions(+), 25 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/dr=
m_fb_dma_helper.c
> >>> index fd71969d2fb1..ab0f37d8a5ff 100644
> >>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> >>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> >>> @@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_fra=
mebuffer *fb,
> >>>                                   unsigned int plane)
> >>>    {
> >>>        struct drm_gem_dma_object *obj;
> >>> -     dma_addr_t dma_addr;
> >>> -     u8 h_div =3D 1, v_div =3D 1;
> >>> -     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> >>> -     u32 block_h =3D drm_format_info_block_height(fb->format, plane)=
;
> >>> -     u32 block_size =3D fb->format->char_per_block[plane];
> >>> -     u32 sample_x;
> >>> -     u32 sample_y;
> >>> -     u32 block_start_y;
> >>> -     u32 num_hblocks;
> >>>
> >>>        obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> >>>        if (!obj)
> >>>                return 0;
> >>>
> >>> -     dma_addr =3D obj->dma_addr + fb->offsets[plane];
> >>> -
> >>> -     if (plane > 0) {
> >>> -             h_div =3D fb->format->hsub;
> >>> -             v_div =3D fb->format->vsub;
> >>> -     }
> >>> -
> >>> -     sample_x =3D (state->src_x >> 16) / h_div;
> >>> -     sample_y =3D (state->src_y >> 16) / v_div;
> >>> -     block_start_y =3D (sample_y / block_h) * block_h;
> >>> -     num_hblocks =3D sample_x / block_w;
> >>> -
> >>> -     dma_addr +=3D fb->pitches[plane] * block_start_y;
> >>> -     dma_addr +=3D block_size * num_hblocks;
> >>> -
> >>> -     return dma_addr;
> >>> +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, pla=
ne,
> >>> +                                                             state->=
src_x >> 16,
> >>> +                                                             state->=
src_y >> 16);
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_=
framebuffer.c
> >>> index d32aceb6ca9b..9e1231162047 100644
> >>> --- a/drivers/gpu/drm/drm_framebuffer.c
> >>> +++ b/drivers/gpu/drm/drm_framebuffer.c
> >>> @@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_pri=
nter *p, unsigned int indent,
> >>>        }
> >>>    }
> >>>
> >>> +/**
> >>> + * drm_framebuffer_get_block_offset() - Get offset to start of pixel=
 block for
> >>> + * the given framebuffer and coordinates.
> >>> + * @fb: The framebuffer
> >>> + * @plane: Which plane
> >>> + * @x: x coordinate for pixel
> >>> + * @y: y coordinate for pixel
> >>> + *
> >>> + * This function will usually be called from the PLANE callback func=
tions,
> >>> + * or from one of the helpers that calculates the framebuffer's DMA =
address.
> >>> + *
> >>> + * Return: offset from start of framebuffer to start of pixel block
> >>> + */
> >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, uns=
igned int plane,
> >>> +                                  unsigned int x, unsigned int y)
> >> Better use u64 as return type.
> > To avoid overflow? Not sure who would use crazy large framebuffers, but
> > doesn't hurt to play it safe.
>
> I'd be worried about a malicious user space that tries to access OOB.
>
> Apart from that, we use u64 for other framebuffer-related sizes like
> pitch calculations or dma addresses. Using u64 here would keep that
> consistent.

Indeed. It seemed weird that the helper originally used u32. Maybe it
was carried over from CMA on ARMv7, which predominantly only had
32-bit address space data busses?

>
> >
> >>> +{
> >>> +     u8 h_div =3D 1, v_div =3D 1;
> >>> +     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> >>> +     u32 block_h =3D drm_format_info_block_height(fb->format, plane)=
;
> >>> +     u32 block_size =3D fb->format->char_per_block[plane];
> >>> +     u32 sample_x;
> >>> +     u32 sample_y;
> >>> +     u32 block_start_y;
> >>> +     u32 num_hblocks;
> >>> +     u32 offset;
> >>> +
> >>> +     offset =3D fb->offsets[plane];
> >>> +
> >>> +     if (plane > 0) {
> >>> +             h_div =3D fb->format->hsub;
> >>> +             v_div =3D fb->format->vsub;
> >>> +     }
> >>> +
> >>> +     sample_x =3D x / h_div;
> >>> +     sample_y =3D y / v_div;
> >>> +     block_start_y =3D (sample_y / block_h) * block_h;
> >>> +     num_hblocks =3D sample_x / block_w;
> >>> +
> >>> +     offset +=3D fb->pitches[plane] * block_start_y;
> >>> +     offset +=3D block_size * num_hblocks;
> >> User space controls the values in fb->offsets and fb->pitches.  I'm no=
t
> >> sure how well they have been validated already at this point. Did you
> >> investigate this?
> > It wouldn't be worse than before, since this changes is purely code mov=
ement.
> >
> > There are minimal sanity checks done by drm_internal_framebuffer_create=
()
> > in framebuffer_check(), such as offset overflow or pitch size too small=
,
> > but that's about it. It would be up to individual drivers to perform mo=
re
> > checks that match their hardware limitations.
>
> Right, makes sense. Looking through the framebuffer validation, a
> buffer-size check could be done in framebuffer_check().  But that's
> another patch series.

That's further covered by drm_gem_fb_init_with_funcs(), which
drm_gem_fb_create*() goes into. I didn't check all the drivers that
implemented their own .fb_create callback though.

- rockchip uses the GEM FB helpers
- MSM reimplements the GEM FB helpers, but does have proper size checks
- nouveau has size checks
- omap has size checks

> >
> > What sort of issues are you thinking about?
>
> Again, I'm thinking of malicious user space that crafts these values to
> force an OOB access.

I think we're covered.


Thanks
ChenYu

> Best regards
> Thomas
>
>
> >
> >
> > ChenYu
> >
> >> Best regards
> >> Thomas
> >>
> >>
> >>> +
> >>> +     return offset;
> >>> +}
> >>> +EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
> >>> +
> >>>    #ifdef CONFIG_DEBUG_FS
> >>>    static int drm_framebuffer_info(struct seq_file *m, void *data)
> >>>    {
> >>> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuf=
fer.h
> >>> index 38b24fc8978d..c07aea1cc59f 100644
> >>> --- a/include/drm/drm_framebuffer.h
> >>> +++ b/include/drm/drm_framebuffer.h
> >>> @@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffe=
r *fb);
> >>>    void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
> >>>    void drm_framebuffer_unregister_private(struct drm_framebuffer *fb=
);
> >>>
> >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, uns=
igned int plane,
> >>> +                                  unsigned int x, unsigned int y);
> >>> +
> >>>    /**
> >>>     * drm_framebuffer_get - acquire a framebuffer reference
> >>>     * @fb: DRM framebuffer
> >> --
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> >> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
> >>
> >>
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

