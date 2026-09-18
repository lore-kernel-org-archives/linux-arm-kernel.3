Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C29C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITqNY912hHAbwc9T2h8ninUwVl/brEY9TWjcH5XDilY=; b=pU8VDEouCgw48o1LKMVCqsTdsT
	ov81GkkdMH6HaLi1WeT1o9Hyi7rsS4MXiqVPr1aKqlyWaeX3JIIqoVVfBEZgA5Bq4d0pUy8f3kKvr
	fT8E+ZJpqjrfrQrfQHaqJT0CAyEIukzjWZd8wOCh6DTq1IQ2nwghmdQAVEiIbSxhkuLRnIf+MAanX
	okQ5iJzxefxZDH3VZwKNwbB58n65VgUqUho3NLjxnf0rlkT0lA5wYHM4vo7scEYLReq7EWC6WTODS
	+kR0QvoLdVtEGK5p2nycqgC+5zx2lzltcJl3xElTz7HwungTZW2eDhrT6erVL/c6zrRLjBFvHTP+0
	kg3hvkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sqd-0000000DfiZ-3AxD;
	Fri, 18 Sep 2026 07:17:27 +0000
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sqb-0000000Dfhv-0ymq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:17:26 +0000
Received: by mail-yx2-x0c.google.com with SMTP id 956f58d0204a3-66e4aa8d881so451404d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789715844; cv=none;
        d=google.com; s=arc-20260327;
        b=WesSifkl/uooyVOM5E2MKTjSxTPLNOZQ+LYLTYsWJJjTKJ8fmBClbzp+R5RfkCArdf
         HULcbcnXvO8SjFTYt147uLnoJIKfy7xNtVw/CZVXAcm5crZpZ3W77PNN90BTXO5+xkfY
         geuNWjE97yPt9UWvmYDHFa/XD5m3tZ58lZ47hAZFmvwnkLR4LgtAID38RX3KsvPoyvg3
         r0eVdIRJxXDJPnUYTGLNzHzx0KbkH/PZu3aCy6ILY1FFuHJ3erE751iS1ttyr0CuL9M1
         i/IbKc4bFqU9ZrOHB/PNPLialAJgXieJ0Yf07M1C2OvJYlFUWJyg/9fQGVZ0GT1DgVwp
         mKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITqNY912hHAbwc9T2h8ninUwVl/brEY9TWjcH5XDilY=;
        fh=AqNRCoYuM3V6tjs4pJYzVrE9Pjh4447NsQ7RB8pkcE8=;
        b=rNoTQUdgnUK5VcTwgLjAhUmNVPWTd0M7Qfz5rowgQ0Mx+5JbTYC5rycdlhMEwtgirj
         NBXFy0LMh7lndqGqKdp/kskGJ44uYK6PLRluPCc6JHDCnrbym9sPEOeKedatl6F1zdXK
         fiEyze6cLG4+hzUGbVM9qb154lJ44MkB0VptVBWc+VhEgs6oC7QGNYQ/AAr7NStEFiUh
         KpCo9GtMe/J306nTqzj5CP7/cIvkxpvwbCSHLIkPiQTuJwmtJgLvijCNsLDpmJ7Xr5Bf
         flMOaUGBFoCDnUg5VJpEYm6h2tLV18PwujuJDjSPjs0w4ynGX1WCL44RzAbOR4IT22HR
         gI1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789715844; x=1790320644; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITqNY912hHAbwc9T2h8ninUwVl/brEY9TWjcH5XDilY=;
        b=Mq7P5Oklq46boj4uNiZb5iMf8BZfiPu3bHamWF3tmhaeI1sYbQTpK10ZB2qSizKmtq
         c/bK1/vsQbpEOsXgwMJTNPdAVLP0kyx/hV5y7naFyojTr7Jn8WhluVlArPougMZaWAJT
         ml9r5ni1oE0Qp5R1XFECJcju6Bv+z0G5zfBag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715844; x=1790320644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITqNY912hHAbwc9T2h8ninUwVl/brEY9TWjcH5XDilY=;
        b=MyGDnYnVCo6STxQGGp4InIo4yj+HB1UYC7ULWn7ADwXttnQTucjdI9m6LExUWaHxmj
         jjDmXpJUBHo/vl112qQnrnsfzhg1fPQyQE01yQqobwHlJyMRolEbzhhabPD58ESEiXEn
         erHmKEU/zFYFmZhJsAm5DmrTNtwdC67D2hNiixIis9jXQ+2Ua8uSu0Zh26PLmn7VaFPZ
         13XoooVh3CUBjVWYWJkSvlrKxyvCd1CCLq83nCIhE9zyXl7qFevIypNfFjvueuFI/5nt
         cJSscNbFVFh2abDFnzpnrZvtN+BpxlnGN/YOjjsf4wU01GFr0gDN+KUyOVVkCWJsglK1
         82Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxxK4zNgmBFoTF0DVxPCJihcsxhvKVP7jPoYd3WQHg4tTl5ZAZ1v/yMSllQ7O/hmY0l8suoH1hW54/nUVV7UyaP@lists.infradead.org
X-Gm-Message-State: AFuF++lJ7MUP939lir25hUSJQWY9G4enYdLEzn3jP8XhHvTJGWPsH65U
	oWAGr7Vcvlas0cX4+PnFRqcYPS1MMxYam7CB295XNv6sVXl1V8Ja8uoGWq0/85+VMgVUZ9pKDtM
	bl/JvaSM/96rtvy9g+XRB+u42H3tKjFJ7gNWBwhd2
X-Gm-Gg: AYBFou1V7ELO3xmJIJimnXq6asXt0rQKpCujdQLYjCLDm4h9C0I9YS8yioCKwbK5EwK
	pCg6OomC+ez7rfupKiYafIgFs3RkFCHt1HhSu/vINRpwkuhPlO01C81qbRg4Un0fLQU6tNG7U9t
	eJhxpK9jNsQSbrtm9uB1JhZZoTcUGncUmeTwcJLtYydDmnQqttLBP1OmL26oIl/8Oj+5A5Vh+/h
	QJdXZxlGzCYCwwJ/ywQRsNxIj4dmjQGm08Vpu7JHlHDfMAQBAA2xjme2furb4ySi82TehLH4nS5
	XDft/3C56aM6k49xmz/au7IcQhpL3v7QUaqc4IVN9KFmm82VaIjaHU6czdsotyKag5s6UMdwQP8
	stY0kh5ekPw==
X-Received: by 2002:a05:690e:1244:b0:667:ba34:51e2 with SMTP id
 956f58d0204a3-6717fc73f18mr528044d50.13.1789715844017; Fri, 18 Sep 2026
 00:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <20260916033327.3054126-2-wenst@chromium.org>
 <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de> <CAGXv+5ErgWVNtnRiW+QA7+Mzh=W_Y+HGL_iRa1fOaXCYSoAwMA@mail.gmail.com>
 <f7fa4c4c-bc59-4822-94bb-6e9d68f8f0ca@suse.de> <CAGXv+5GNjKxzHuBn28PbRtbFA1yuJ7h02xDpght4add3emuKJg@mail.gmail.com>
In-Reply-To: <CAGXv+5GNjKxzHuBn28PbRtbFA1yuJ7h02xDpght4add3emuKJg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Sep 2026 15:17:12 +0800
X-Gm-Features: AcwNN1VfNznx-wGfs8r_CeKKtrEj641j8sqUrt8qB1yK2OIkZ-fPkbPmzPQcswY
Message-ID: <CAGXv+5FOB9Y3HCt=ydrcUPdo7S92MiJRqsjXAZiW99-3NfYECQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260918_001725_356480_524205AF 
X-CRM114-Status: GOOD (  47.27  )
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

On Fri, Sep 18, 2026 at 3:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Fri, Sep 18, 2026 at 2:41=E2=80=AFPM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
> >
> > Hi
> >
> > Am 18.09.26 um 06:16 schrieb Chen-Yu Tsai:
> > > On Thu, Sep 17, 2026 at 11:20=E2=80=AFPM Thomas Zimmermann <tzimmerma=
nn@suse.de> wrote:
> > >> Hi
> > >>
> > >> Am 16.09.26 um 05:33 schrieb Chen-Yu Tsai:
> > >>> Currently drm_fb_dma_get_gem_addr() calculates the offset into the
> > >>> framebuffer memory for the framebuffer's unclipped source coordinat=
es,
> > >>> adds that to the framebuffer's backing storage, and returns the res=
ult.
> > >>>
> > >>> We are about to add a variant that uses the clipped source coordina=
tes,
> > >>> so there is already some reuse of code. However, calculating the da=
ta
> > >>> offset for a given pixel is not specific to the DMA FB helpers. The
> > >>> offset is only related to the framebuffer.
> > >>>
> > >>> Split out the offset calculation into a new framebuffer helper so t=
hat
> > >>> non-DMA users can also reuse the same code.
> > >>>
> > >>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >>> Cc: <stable@vger.kernel.org> # dependency for next patch
> > >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > >>> ---
> > >>> Changes since v1:
> > >>> - New patch
> > >>> ---
> > >>>    drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
> > >>>    drivers/gpu/drm/drm_framebuffer.c   | 45 +++++++++++++++++++++++=
++++++
> > >>>    include/drm/drm_framebuffer.h       |  3 ++
> > >>>    3 files changed, 51 insertions(+), 25 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/=
drm_fb_dma_helper.c
> > >>> index fd71969d2fb1..ab0f37d8a5ff 100644
> > >>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > >>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > >>> @@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_f=
ramebuffer *fb,
> > >>>                                   unsigned int plane)
> > >>>    {
> > >>>        struct drm_gem_dma_object *obj;
> > >>> -     dma_addr_t dma_addr;
> > >>> -     u8 h_div =3D 1, v_div =3D 1;
> > >>> -     u32 block_w =3D drm_format_info_block_width(fb->format, plane=
);
> > >>> -     u32 block_h =3D drm_format_info_block_height(fb->format, plan=
e);
> > >>> -     u32 block_size =3D fb->format->char_per_block[plane];
> > >>> -     u32 sample_x;
> > >>> -     u32 sample_y;
> > >>> -     u32 block_start_y;
> > >>> -     u32 num_hblocks;
> > >>>
> > >>>        obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> > >>>        if (!obj)
> > >>>                return 0;
> > >>>
> > >>> -     dma_addr =3D obj->dma_addr + fb->offsets[plane];
> > >>> -
> > >>> -     if (plane > 0) {
> > >>> -             h_div =3D fb->format->hsub;
> > >>> -             v_div =3D fb->format->vsub;
> > >>> -     }
> > >>> -
> > >>> -     sample_x =3D (state->src_x >> 16) / h_div;
> > >>> -     sample_y =3D (state->src_y >> 16) / v_div;
> > >>> -     block_start_y =3D (sample_y / block_h) * block_h;
> > >>> -     num_hblocks =3D sample_x / block_w;
> > >>> -
> > >>> -     dma_addr +=3D fb->pitches[plane] * block_start_y;
> > >>> -     dma_addr +=3D block_size * num_hblocks;
> > >>> -
> > >>> -     return dma_addr;
> > >>> +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, p=
lane,
> > >>> +                                                             state=
->src_x >> 16,
> > >>> +                                                             state=
->src_y >> 16);
> > >>>    }
> > >>>    EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> > >>>
> > >>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/dr=
m_framebuffer.c
> > >>> index d32aceb6ca9b..9e1231162047 100644
> > >>> --- a/drivers/gpu/drm/drm_framebuffer.c
> > >>> +++ b/drivers/gpu/drm/drm_framebuffer.c
> > >>> @@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_p=
rinter *p, unsigned int indent,
> > >>>        }
> > >>>    }
> > >>>
> > >>> +/**
> > >>> + * drm_framebuffer_get_block_offset() - Get offset to start of pix=
el block for
> > >>> + * the given framebuffer and coordinates.
> > >>> + * @fb: The framebuffer
> > >>> + * @plane: Which plane
> > >>> + * @x: x coordinate for pixel
> > >>> + * @y: y coordinate for pixel
> > >>> + *
> > >>> + * This function will usually be called from the PLANE callback fu=
nctions,
> > >>> + * or from one of the helpers that calculates the framebuffer's DM=
A address.
> > >>> + *
> > >>> + * Return: offset from start of framebuffer to start of pixel bloc=
k
> > >>> + */
> > >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, u=
nsigned int plane,
> > >>> +                                  unsigned int x, unsigned int y)
> > >> Better use u64 as return type.
> > > To avoid overflow? Not sure who would use crazy large framebuffers, b=
ut
> > > doesn't hurt to play it safe.
> >
> > I'd be worried about a malicious user space that tries to access OOB.
> >
> > Apart from that, we use u64 for other framebuffer-related sizes like
> > pitch calculations or dma addresses. Using u64 here would keep that
> > consistent.
>
> Indeed. It seemed weird that the helper originally used u32. Maybe it
> was carried over from CMA on ARMv7, which predominantly only had
> 32-bit address space data busses?
>
> >
> > >
> > >>> +{
> > >>> +     u8 h_div =3D 1, v_div =3D 1;
> > >>> +     u32 block_w =3D drm_format_info_block_width(fb->format, plane=
);
> > >>> +     u32 block_h =3D drm_format_info_block_height(fb->format, plan=
e);
> > >>> +     u32 block_size =3D fb->format->char_per_block[plane];
> > >>> +     u32 sample_x;
> > >>> +     u32 sample_y;
> > >>> +     u32 block_start_y;
> > >>> +     u32 num_hblocks;
> > >>> +     u32 offset;
> > >>> +
> > >>> +     offset =3D fb->offsets[plane];
> > >>> +
> > >>> +     if (plane > 0) {
> > >>> +             h_div =3D fb->format->hsub;
> > >>> +             v_div =3D fb->format->vsub;
> > >>> +     }
> > >>> +
> > >>> +     sample_x =3D x / h_div;
> > >>> +     sample_y =3D y / v_div;
> > >>> +     block_start_y =3D (sample_y / block_h) * block_h;
> > >>> +     num_hblocks =3D sample_x / block_w;
> > >>> +
> > >>> +     offset +=3D fb->pitches[plane] * block_start_y;
> > >>> +     offset +=3D block_size * num_hblocks;
> > >> User space controls the values in fb->offsets and fb->pitches.  I'm =
not
> > >> sure how well they have been validated already at this point. Did yo=
u
> > >> investigate this?
> > > It wouldn't be worse than before, since this changes is purely code m=
ovement.
> > >
> > > There are minimal sanity checks done by drm_internal_framebuffer_crea=
te()
> > > in framebuffer_check(), such as offset overflow or pitch size too sma=
ll,
> > > but that's about it. It would be up to individual drivers to perform =
more
> > > checks that match their hardware limitations.
> >
> > Right, makes sense. Looking through the framebuffer validation, a
> > buffer-size check could be done in framebuffer_check().  But that's
> > another patch series.
>
> That's further covered by drm_gem_fb_init_with_funcs(), which
> drm_gem_fb_create*() goes into. I didn't check all the drivers that
> implemented their own .fb_create callback though.
>
> - rockchip uses the GEM FB helpers
> - MSM reimplements the GEM FB helpers, but does have proper size checks
> - nouveau has size checks
> - omap has size checks

Side note: it seems that the drivers that reimplement
drm_gem_fb_init_with_funcs() do so because they need to do additional
checks on the (sub-classed) GEM objects. Perhaps exporting drm_gem_fb_init(=
)
or deconstructing drm_gem_fb_init_with_funcs() could allow more of them
to use common helpers for things like size checks.

> > >
> > > What sort of issues are you thinking about?
> >
> > Again, I'm thinking of malicious user space that crafts these values to
> > force an OOB access.
>
> I think we're covered.
>
>
> Thanks
> ChenYu
>
> > Best regards
> > Thomas
> >
> >
> > >
> > >
> > > ChenYu
> > >
> > >> Best regards
> > >> Thomas
> > >>
> > >>
> > >>> +
> > >>> +     return offset;
> > >>> +}
> > >>> +EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
> > >>> +
> > >>>    #ifdef CONFIG_DEBUG_FS
> > >>>    static int drm_framebuffer_info(struct seq_file *m, void *data)
> > >>>    {
> > >>> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_frameb=
uffer.h
> > >>> index 38b24fc8978d..c07aea1cc59f 100644
> > >>> --- a/include/drm/drm_framebuffer.h
> > >>> +++ b/include/drm/drm_framebuffer.h
> > >>> @@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuf=
fer *fb);
> > >>>    void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
> > >>>    void drm_framebuffer_unregister_private(struct drm_framebuffer *=
fb);
> > >>>
> > >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, u=
nsigned int plane,
> > >>> +                                  unsigned int x, unsigned int y);
> > >>> +
> > >>>    /**
> > >>>     * drm_framebuffer_get - acquire a framebuffer reference
> > >>>     * @fb: DRM framebuffer
> > >> --
> > >> --
> > >> Thomas Zimmermann
> > >> Graphics Driver Developer
> > >> SUSE Software Solutions Germany GmbH
> > >> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> > >> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
> > >>
> > >>
> >
> > --
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> > GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
> >
> >

