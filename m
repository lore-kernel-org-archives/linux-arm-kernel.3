Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43370C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FfIalmLeScOxNe/jU0URjsOVpQ536KPeXddNb2Qzuk=; b=R4p/YGUyBc7GO4SGncB2UTISkg
	HKeLqu/j2Yj5Q+YaBg5llhEZALCHv+qsn4go9J54/DlAZfPR8lHNPA3SKHbiAFCcjS5aNr8dBLYCo
	erja12W99Hrzv4P4ED7gc8qJO/kMt/bPhfAVon2NGPv5sYRMUSKjoqoEztSkqVzcmQ5hlglnTgg4Q
	E73sPA8v83UZnaSb3+Hhvfnf9J1xV7vqjunTrINflemUZ9Pumzk+ByQKYaYyVrirgC98sFCnUgrVs
	k88lrh1Pd9c1ktp+zVphZS0AIkopEsFR5UfskgwbPawOddbu9FddO6IvzS0OMTNTrAOJtjP+oLD34
	Y06p1k0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJPg-00000002Ysc-3Fjx;
	Tue, 04 Aug 2026 17:58:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJPe-00000002Yrr-1yxt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:58:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-495590dde14so1023085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785866328; x=1786471128; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8FfIalmLeScOxNe/jU0URjsOVpQ536KPeXddNb2Qzuk=;
        b=rrEF3s3K2Bp+c4apbVlWY3A2uTGT9QHF8drEcqUyGJ2skFbfIdJmUSL1epSWiFDA3j
         TQSxJU82DGw4MGrehSpYThh0xdHT8oTV/mfJhL6gVXjX9o7BJMqhnjGQ5WC7nu/hNmIS
         Z+XXjPVYvhjBigk+EpnjyukG9s47lUA3bd5kiy3ttAgnYGzFutN0p5Spzbt6dhmzPMi/
         06Yv7fk/zD24ljuQUqHaB1asRj/6MdQXQFHPyseMrw3gfgeqTmsHvGtgMyD6TmgzFN/u
         yTRNcxXQ/hsAEkIsTaUsYaIG2r2xvRwZP5NeAi7JFevrpiCArSrK3PmWyHvAoevQrK9g
         9DIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785866328; x=1786471128;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8FfIalmLeScOxNe/jU0URjsOVpQ536KPeXddNb2Qzuk=;
        b=FuDdHhDEpw3tZ8booRsfawvWYa7O7xFEB0/LJ1XuNYMjgCFTKhkfbW2PrcRzMLxc40
         G219sCcxrDPhvjg8AHwcFUd6ZeL7Pgi61iJmpHoPQVnO+Un0BCT0iFGhWh7Lgb23uzCc
         0xkp1QafsjiojRHBrQPmlG8kypFstLzGqrLPlcLe5xlgobjlYFdrtCs4pHQFyA6hjPWp
         XeEUNNcfgRNpbcOtT1IUV5R6cW/4TTn3cdLKOCizv3lu6K0xFxQrvbfb0nhSvDWq1myq
         jKxEAEE/AdVkawNE5/fliwBgdIA2n9Huzrsq5Gfey7kx41kgqBPd8M6AueHsk9czjXo6
         YNtg==
X-Forwarded-Encrypted: i=1; AHgh+RrOEcfWaFovO63DneKTSTm027Z01dYqsfO25UCliqsd0hzH4bLqFNxvcCZeEXYOZ+KQqbC2SZ5/SAJthuyOfih2@lists.infradead.org
X-Gm-Message-State: AOJu0YzqJlOBxZ7Kc3EmTNEig9Ji/gjnlFYN0nZ8z1wImU1zXOwd80uh
	UkM1K2k1npO7Zw7RCZqVuU+fAiv3Tl3Hy79lLoD1cnoysDX0qfHxocwT
X-Gm-Gg: AR+sD12rURIuELJ97+BnItsaUAshgj+V/asg0Jl/5GFyS0kMzcp0cNACbGmZVm5Aih1
	Gft7VyX3VqdrpN1Cb7+5wzAw9IO8itSjyxWYf34CYAfv/+x+dAezgzqX5fHaL4MbzP5ZqFCf6Ss
	4YFHgNOHfBVOxNpFIi1o4/0fGKajRqBPaXO72MODRVIM9CKvyqIj83UMUn6NAZr54fnde5tC5H+
	ODRIiartm166tzdZKtJ9qtLHmKZaw7yYN4Dzo881Ui/b/rx/EiCzgpfd4spDcSdwjqvfv8qeiFW
	wOoRZg1JppR2sSioeNRnR5DW9qk38pWAwiaEWOgMIKSPBUI6MfS/xw52tYX+aBJGMDeSaimP2ke
	ZCJbX/rer5FFivfWq9sYfImSXh1P/ycLjr9HICEvkmuxbrqcwUN62AGLY2ZOVMKCx48WC8Kwb1n
	ShTmfAfcD6JhIKGBfsNFOXUtwv/g/+p5NnELS9iXKMQXhpLscAU8g3NFlskqeK2QLkG5iY1uf8U
	buKrAIi1570PFxcGL8zIQxZs61PT5SIx+wWa1ybzLCvjzaa4R7CVArEEqgOXhHIX81RKxmtuFFO
	2fbNOgSgLe1da0A6tNNsicdUhMArdSX+lTUnKo5NPI8TNeP4m6Nu6AxCxQy3Rpaf8MxYDqo+NRJ
	JWZzPUED1uM04wYxpfd0wii0RBDx6qisg781jlIVUlDW7RnUQlfTBqq37eRQryCAXiYbZRwIphk
	J/oEQSwvdStjbmgQ==
X-Received: by 2002:a05:600c:8b51:b0:495:6b55:f938 with SMTP id 5b1f17b1804b1-4994e7ba99emr39395e9.10.1785866328394;
        Tue, 04 Aug 2026 10:58:48 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-102-118-gprs.simobil.net. [46.122.102.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994dfe8973sm19187475e9.7.2026.08.04.10.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:58:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/13] drm/sun4i: Align VI buffer addresses for subsampled formats
Date: Tue, 04 Aug 2026 19:58:45 +0200
Message-ID: <58Gvon3UR1Sy7a6nLT6bDw@gmail.com>
In-Reply-To: <CAGb2v67mTzB+R7XDasSNhpmdzu5ikdoO0QwiHR432pdt_v7A_Q@mail.gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
 <ugAWjG4QTtSgFVIbk0BoGg@gmail.com>
 <CAGb2v67mTzB+R7XDasSNhpmdzu5ikdoO0QwiHR432pdt_v7A_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_105850_548456_4876E50F 
X-CRM114-Status: GOOD (  46.33  )
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

Dne torek, 4. avgust 2026 ob 19:04:10 Srednjeevropski poletni =C4=8Das je C=
hen-Yu Tsai napisal(a):
> On Wed, Aug 5, 2026 at 12:25=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne torek, 4. avgust 2026 ob 13:14:38 Srednjeevropski poletni =C4=8Das =
je Chen-Yu Tsai napisal(a):
> > > On Tue, Aug 4, 2026 at 1:25=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org>=
 wrote:
> > > >
> > > > On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skra=
bec@gmail.com> wrote:
> > > > >
> > > > > This is a partial revert of commit 79ac1c945ab8 ("drm/sun4i: laye=
rs:
> > > > > Use drm_fb_dma_get_gem_addr() to get display memory").
> > > > >
> > > > > Chroma must start at the beginning of a subsampling block, for ex=
ample
> > > > > chroma start address for NV12 must be aligned to 2 pixels.
> > > > > drm_fb_dma_get_gem_addr() offsets luma by the exact source coordi=
nates
> > > > > and chroma by the coordinates divided by the subsampling factor, =
so for
> > > > > odd offsets both planes no longer describe the same pixel, which =
the
> > > > > Display Engine scaler can't handle.
> > > > >
> > > > > Align source coordinates down for all planes instead. Remaining s=
hift
> > > > > of one pixel is already compensated with scaler phase shift in
> > > > > sun8i_vi_layer_update_coord().
> > > >
> > > > Well I think this applies to the format in general, and probably sh=
ould
> > > > be fixed in drm_fb_dma_get_gem_addr() instead?
> > > >
> > > > > Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_a=
ddr() to get display memory")
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 ++++++++++++++++++--
> > > > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu=
/drm/sun4i/sun8i_vi_layer.c
> > > > > index 09f668c8af24..ad036cb9d88e 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > > @@ -197,15 +197,31 @@ static void sun8i_vi_layer_update_buffer(st=
ruct sun8i_layer *layer,
> > > > >         struct drm_plane_state *state =3D plane->state;
> > > > >         struct drm_framebuffer *fb =3D state->fb;
> > > > >         const struct drm_format_info *format =3D fb->format;
> > > > > +       struct drm_gem_dma_object *gem;
> > > > > +       u32 dx, dy, src_x, src_y;
> > > > >         dma_addr_t dma_addr;
> > > > >         u32 ch_base;
> > > > >         int i;
> > > > >
> > > > >         ch_base =3D sun8i_channel_base(layer);
> > > > >
> > > > > +       /* Adjust x and y to be divisible by subsampling factor */
> > > > > +       src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
> > > > > +       src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);
> > > >
> > > > AFAICT the only difference compared to drm_fb_dma_get_gem_addr()
> > > > is the masking here, i.e. round_down().
> > > >
> > > > > +
> > > > >         for (i =3D 0; i < format->num_planes; i++) {
> > > > > -               /* Get the start of the displayed memory */
> > > > > -               dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i=
);
> > > > > +               gem =3D drm_fb_dma_get_gem_obj(fb, i);
> > > > > +               dma_addr =3D gem->dma_addr + fb->offsets[i];
> > > > > +
> > > > > +               dx =3D src_x;
> > > > > +               dy =3D src_y;
> > > > > +               if (i > 0) {
> > > > > +                       dx /=3D format->hsub;
> > > > > +                       dy /=3D format->vsub;
> > > > > +               }
> > > > > +
> > > > > +               dma_addr +=3D dx * format->cpp[i];
> > > > > +               dma_addr +=3D dy * fb->pitches[i];
> > > >
> > > >
> > > > Where as the helper has (or used to have before the blocksize stuff=
):
> > > >
> > > >     paddr +=3D (format->cpp[plane] * (state->src_x >> 16)) / fb->fo=
rmat->hsub;
> > > >     paddr +=3D (fb->pitches[plane] * (state->src_y >> 16)) / fb->fo=
rmat->vsub;
> > > >
> > > > Am I missing something?
> > >
> > > After some headbanging on my end I see that the offset for the Y plane
> > > needs to be rounded down.
> > >
> > > But instead of reverting the whole thing and open-coding the helper
> > > again, could you adjust the address returned by the helper for odd
> > > offsets?
> >
> > Yes, that's also an option. I'll do it in v2.
> >
> > >
> > > And just a heads up, this also needs a clipped version of
> > > drm_fb_dma_get_gem_addr() as sun8i_ui_layer_update_coord() uses the
> > > clipped dimensions. I am currently working on this part.
> >
> > Can you explain a bit more? I don't see why it needs any adjustement.
>=20
> My understanding is that drm_atomic_helper_check_plane_state() calculates
> the "clipped" rectangles for the plane using values from userspace in
> state->src_[xywh] and state->crtc_[xywh] and puts them in state->src
> and state->dst, respectively. If the overlay is moved partially outside
> the screen, the overlay is "clipped".
>=20
>=20
> Say we have a screen of 1920x1080, with an overlay buffer that is 1280x72=
0.
> Say state->src_x and state->src_y are (-50, 0), given by userspace.
> drm_atomic_helper_check_plane_state() will calculate the clipped & scaled
> rectangles and put them in state->src. This latter rectangle is what is
> used sun8i_ui_layer_update_coord().
>=20
> So we would have:
>=20
>     (src_x, src_y) =3D (-50, 0), (src_w, src_h) =3D (1280, 720)
>=20
> The clipped numbers are
>=20
>     (src.x1, src.y1) =3D (0, 0), (src.x2, src.y2) =3D (1230, 720)
>=20
> src, not src_[xywh], is what sun8i layers uses to program the coordinates,
> and prior to the drm_fb_dma_get_gem_addr() conversion, also to calculate
> the buffer start address. drm_fb_dma_get_gem_addr() however uses src_[xy]
> to calculate the address.
>=20
>=20
> Essentially, when overlaying a clipped plane, the start address needs to
> be adjusted if the source (top left) offset is outside the screen.
> clipping =3D=3D automatic cropping to fit the screen.
>=20
> I don't know if userspace applications routinely do this, but I think this
> needs to be restored to the prior behavior.

Uh, it would be nice if this is fixed. But I think it's not too common
for app to use negative coordinates.

Best regards,
Jernej



