Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C16C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c21ngjJ5XlclNkcsiWl5J6SQ+KBmH0ZVxdFOlgqSkMo=; b=de+zwGwX0vkdaaWa0HAQSx+XF3
	F5LEDLZpCqTJLbBFdDF8QB1SxEAZdoGA5bPh1HOUyCj6MwmLTU8g16fbV/WZmDINa3D4ilH1uRSp9
	chIunxYuzOHlekerDx0JCbReB4J1PVC5D8xBqzPFk5dxAMzme0pcRgyVzpWrozIQrp86Xfq2qUTwm
	viDC5IBDcvrNDOGvjBIE/CRGSprKyMJ4wQTEcJIL6GPC9Zcm0SPKuDOpAqm6X8k53eJa/nF9+tG3q
	FnH0uQuLaXtThZFFO+jfFKsb17yYcpEGi9kPos6mihOzgb6LsXwtRpfidJidvc053e3fE8RqcXn0g
	uU3OhJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOo6-00000003UCz-0qeG;
	Mon, 27 Jul 2026 17:08:02 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOo3-00000003UBu-1AYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 17:08:00 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-66854eebf60so337427d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 10:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785172077; cv=none;
        d=google.com; s=arc-20260327;
        b=oq2zV8n2kJelGWOxHa4birTBezDA9d2CMfknxxqd+LgwjnhIXMgdIk4tKIAvBCsJv2
         kazNI5MX91Kt7afAQIRScOaCcBneSCF4QoWM20eb05COxU6FM0PkhXsY/iwJV4231aB0
         pF4q9kuF9rmGoQ9RwYfB0qB24fiQYmBSm6vlUgi9aBDGBwVWB17PWX5F2KjuUjFVNqFU
         Hgxsf4Y/3mcMQDanLKS32hzt94fpfU+jM97Q1fI42Sr/rSqz80wa2rBvj0VOjtupHEO5
         F/vg/j4DvwwPzfxL71T4srpkFC7yQn44FNDOjMyXngrfPm9dxpj7URu7hPpSB87Gx719
         iZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c21ngjJ5XlclNkcsiWl5J6SQ+KBmH0ZVxdFOlgqSkMo=;
        fh=kwaSkY3J6+aftZsMKgYy+mJ+f4K+TNjZOMyJlP9dGAI=;
        b=ssbPLA8qNINcIT+TUJNloOehkrEqOxmmFCJRyLF5rb/dmfZD3LSCQgUCr7TzITvB1d
         u/RHTx9Jj+yzzULKYjBjkZ2E8cluJiub0IzMSvyIg8Jjl9zqscjIA6t+IDCtNa1oA5a7
         Zsjx2IguFFgycEN9zppYZ8UMIDffh6wZ9G1mv122A/XX5dXKlsj2Zmhi5zd0+0BfU412
         UOMAcIJubN2sfythkXxBvmTLEy1n1iu4d9Jn0v/9Zi0Ajq5EqoFZ1NJVXyhYzl8aAM7G
         ItJxQlgwOSnBYYYwYOmlbmmdGgidSbdDPXdiv+lJI+7TgBAOYlN5ZG7IEnBtNovzx5OW
         Rlog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785172077; x=1785776877; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c21ngjJ5XlclNkcsiWl5J6SQ+KBmH0ZVxdFOlgqSkMo=;
        b=aIq9MdK1iTfGKDTPIq/OKscmD1w+VCFQ/25rQ5YTDTlK0FraupL+2K0hLaBR1l5FGg
         WtxFIfH0J5mherEEJWOowjgXP0ax59JEy1SlUvkUyBGfY+5yfFSx2lt9SsFsnvSUGH2W
         Q3cWQdFwXetCpjBJyf6V8yhGHAGnEIUmat+PvMEJk+324UKJXBmm/KFq9Ha538LijK7v
         vWyyDCDXg9Rh9DeLY/APCLMnLPrdbBNsxOmqFlXnb9Wtm2QHppqnf9sptlfP2cFJXtiY
         +zzxAPl1bxYAmFYyJtw+KnMuQPJNYb/y66xv9DyIJE6tKeH0URP+XTb48Txg+4IhLyho
         qBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172077; x=1785776877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c21ngjJ5XlclNkcsiWl5J6SQ+KBmH0ZVxdFOlgqSkMo=;
        b=FRzcKKmAyE0fqZLITsTatjdmfC0C91z2y5fE9O2X8fQS/PCKE4+l2iTFhjKlfK8jCU
         saSOtkj6BZbomdS1H+aU75atSXBIhd5GsWz8kVcq9NJMOrsJnKkuwp6Fy7ZF8MjEKlq6
         2bxj+AvGlkbWMyvBo+zx7AKeLp9wsAw+4LidYW7OzQdyKigYuwADb7XWR9a1LoT1TK2/
         zoxQTC+3fiflaZ0W+M0fMgfMZNV9OVux4aBvJdHPBUNFLQoaAg8Wt/B65EKjDyTLp1Ey
         /8re1/2TGTbekMomVC67SgbXI909VE1Kfgyj54b+s/hjK36BddodTXcn6UtoJmDYXUm8
         9+pQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5ECfTrjvM5j0+fSN9CB2iH3VhShkmCmK7TdpL+iaNBPZ3wQ5LxJlOd6K5mzUgoMDTicISFvd0pDsegDDQ3Bcg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7+If1s5W7mqCIlWTn/gbOT44xLXYDsdt+DDjU8mRLB2iTxDVE
	kDjqcMVFJrfWDA2a4pDJ0tyERIvPMPvP5OuFU7BUWllwQ03W2k+9XQ0i/x8nWWhO4Gngd/CFOjF
	YU9B0SpNsv7cmW1mHvTgItgs/shJXbwg=
X-Gm-Gg: AR+sD11rWhbhbSghSgl7bxSkpT16pXKHK4gZCxPCwp89mW2wRCPlCWpmd9tvIeUJ3cB
	CaQ0SnYmiAtpFS+5paKXMD5bk9I9UQwDWyxt40xO4S6Zwa5hoaBYhObQQ/07555TiHqIMp52+0b
	ly01WdLbGSDMS5wdqDJ9McW1gSw9DOjRiVLy/L42X/PU9BQUViDzvM3ECT0yFlpOls4L7CCS/qN
	NMUyyv+BhzLIFoXw7cqH5HY5huR0eMs4ACuooHalBxMrSQz4uisjqvXxlfKe0SK0hUlQv0XpR3N
	EGqdSX1dz2GT2KLjlsHh
X-Received: by 2002:a05:690c:c508:b0:81d:a82a:a4fa with SMTP id
 00721157ae682-81f918e48e9mr3545747b3.5.1785172077323; Mon, 27 Jul 2026
 10:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com> <cb8XVJu6RUmEjMZpl7NA1g@collabora.com>
In-Reply-To: <cb8XVJu6RUmEjMZpl7NA1g@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 27 Jul 2026 19:07:46 +0200
X-Gm-Features: AUfX_mwAp38CvxOzFNFIy663VRohFPhaabl-gVyS3Hkri8cjdi-61b1oibiQvGg
Message-ID: <CAEWPSH7rQv-yZ+dL+mZi6Mt3rj6gUZhp3r7_Gpjy8=1OArqwUA@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt()
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_100759_319805_F3F80DDE 
X-CRM114-Status: GOOD (  24.63  )
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

Hi

> This shouldn't be needed. As you set step_width to 64,
> v4l2_apply_frmsize_constraints() should already do the alignment.
> Do you have more context as to when width is not aligned ?

You're right that the width is aligned -- step_width =3D 64 handles that.
This isn't the width though, it's the stride, and it only bites on the
10-bit (Profile 2) capture format.

For 8-bit NV12 the luma stride equals the width, so once the width is
64-aligned the stride is too and this block is a no-op.

The 10-bit capture format is NV15, whose luma stride is width * 5 / 4
(bpp {5, 10}, bpp_div {4, 4} in v4l2-common.c). That isn't a multiple
of 64 even when the width is: a 1920-wide Profile 2 frame gives a
2400-byte stride, while the VDPU381 needs the luma stride 64-byte
aligned (2432). v4l2_apply_frmsize_constraints() only rounds the width
and height, and v4l2_fill_pixfmt_mp() fills the stride with alignment 1,
so NV15 comes out unaligned and the decoded frame is corrupted without
this. I can show the before/after on a 10-bit vector if that's useful.

If you'd rather express it through the framework than with a manual
ALIGN() here, v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width,
height, 64) produces the same bytesperline and sizeimage -- happy to
switch to that in v2.

Igor


On Mon, Jul 27, 2026 at 5:58=E2=80=AFPM Detlev Casanova
<detlev.casanova@collabora.com> wrote:
>
> Hi !
>
> On Sunday, 26 July 2026 16:25:37 EDT Venkata Atchuta Bheemeswara Sarma Da=
rbha
> wrote:
> > From: Igor Paunovic <royalnet026@gmail.com>
> >
> > Ensure bytesperline is 64-byte aligned and scale sizeimage accordingly.
> >
> > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> > Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha
> > <vdarbha0473@gmail.com> ---
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> > 436bb460f04e..6ab6530b1cc9 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -102,12 +102,20 @@ static void rkvdec_fill_decoded_pixfmt(struct
> > rkvdec_ctx *ctx, struct v4l2_pix_format_mplane *pix_mp)
> >  {
> >       const struct rkvdec_variant *variant =3D ctx->dev->variant;
> > +     struct v4l2_plane_pix_format *plane =3D &pix_mp->plane_fmt[0];
> > +     u32 aligned_bpl;
> >
> >       v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width,
> > pix_mp->height);
> >
> > -     ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> > +     /* ensure bpl is 64 byte aligned and scale sizeimage accordingly.
> */
> > +     aligned_bpl =3D ALIGN(plane->bytesperline, 64);
> > +     if (aligned_bpl !=3D plane->bytesperline) {
> > +             plane->sizeimage =3D plane->sizeimage / plane-
> >bytesperline * aligned_bpl;
> > +             plane->bytesperline =3D aligned_bpl;
> > +     }
>
> This shouldn't be needed. As you set step_width to 64,
> v4l2_apply_frmsize_constraints() should already do the alignment.
>
> Do you have more context as to when width is not aligned ?
>
> >
> > -     pix_mp->plane_fmt[0].sizeimage +=3D variant->ops->colmv_size(pix_=
mp-
> >width,
> > pix_mp->height); +    ctx->colmv_offset =3D plane->sizeimage;
> > +     plane->sizeimage +=3D variant->ops->colmv_size(pix_mp->width,
> > pix_mp->height); }
> >
> >  static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_forma=
t *f,
>
> Regards,
> Detlev.
>
>
>

