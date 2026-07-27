Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1938CC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GE2Gc7S3rQsVMvQ6VTSOfR/xqWu60Jvi8kVxQRl1IrM=; b=W434L9CeN+dcYa0ce0IwUHQj8a
	5oFfSq2gU7Iz+8lJX8yrw8wrpJCQb4O69TlQVhoUG8yQJGORzhvhO4w16X/F121SIZSy5hdiRfNOJ
	Jc2nE7z0g8a9RsSa923nGSwq9Cu1wf6FUfXyOWBF2zn5VrOypf9ho9mNIZIlt0RVbGNY0pON92wUh
	ovTjxJsKDxViHcnzaOGVQ9dVwe3Z0guMP+Lcr7eDgy+cJO6yS2Yn6g0nqeechCFFO2zbk1cMKIeMR
	yyPkJAfLCIPoJBPeRs5EnId54eS+3Fb0hrOFhnxbF3NmLkGtfkH9DMe1KtSivJi8CaTsnXDIHKAhI
	zLFncKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPM1-00000003Yyi-3inn;
	Mon, 27 Jul 2026 17:43:05 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLz-00000003YxU-1gI5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 17:43:04 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-848479c9bd5so2270781b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 10:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785174182; cv=none;
        d=google.com; s=arc-20260327;
        b=TqT7NvvsTZXb2yC/5j6hfoTd0bPjZYD6E0mV8l+JXy65RGW7nRLOxmVfD9PAXAFUxi
         +bzsR3k0DePLc9WuvrOxMCDZEmxww4Z2XUn8u3rM3SyT51zRVA7DQ/mfiTOSHSl+7AIS
         QtHEPWI6WudyPWFxTwmInEr9bybYqDwc8OOyrwrSB8B14ikqyBi509AKyUeocFZ2qokm
         7N2/MkwELYVkaq/VrzOuNsI1pCbTjsfk0Mkl6pTABNtTj76CPK/nbzI+5ALffJXzFFNf
         pxfMmQpAg6m4K8tfMA0//3jKvi0GgZID54YA9AzwFqcSPHmGXs66K4z8yyHfB4eO7kI2
         PG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GE2Gc7S3rQsVMvQ6VTSOfR/xqWu60Jvi8kVxQRl1IrM=;
        fh=GNbvJBCWvkMxj/Pe2h6xUZT45xhslWOy2embFtLPkYo=;
        b=Bdf9+tdmCAjUYBnncO87/SOW/UKk2kitylPeHYO2lW9RL2CBCIpPSQ4UhbpxZMDyoH
         ScnXr0ibJ1JnrZgbh+iHbcnYdTHC/qxnxT8mcmT9+THoX7+Pqtp2ACj9J6wqmYmlD8+/
         k23dWj0gElBB9Gztvaw6ftIMS44qQiUmwkTVpvwuiMDdxMKrjefKVaNRE/9qw5SNBXH6
         D9NBr+QM+m1iJAvI4e9Djn2WiImGYGo7xpPecRDD9+lTVxbuSzDWZM+1SYYRvF+fj6Mz
         hMQnp612+AOSf/4xBpWVPcuH3cButLbOcftWb+lauZCYEpZ0SmGhGfhJZm+d1am+gSFp
         DAiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785174182; x=1785778982; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GE2Gc7S3rQsVMvQ6VTSOfR/xqWu60Jvi8kVxQRl1IrM=;
        b=AYf8PYK31sUxJX4yEDHJ63ENZ5/HKyayHaJu6/BSKPl+maRV0F0VKKpxbFkRHAVGWd
         w3VUrjRiT0py4UKgfjxlPOrYYZfiMgUKmZ2A7QFUikN6dMzr/FTdIx/YVv9l/9Rogbzi
         gGOBscIYkF2480cmKqti8H6YrCe7dgV+IoN/o5OxW+sqnrBU3Cd85hEJzz6jhfzpoMvr
         JLx84P373vhb4sxPaK4z7Eb/EJGZYdJ+LoLH7m5Q8Wr4dBqbaIILU4EeHJfg+GFO86sl
         EC4lOMYxg5o1/JcRBP3ZaxV99eKVzqXpbo1cHtf5e0emP4dd3r+Iirqjob+8KttKznzZ
         ix4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785174182; x=1785778982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GE2Gc7S3rQsVMvQ6VTSOfR/xqWu60Jvi8kVxQRl1IrM=;
        b=RztY6KJJ4D0iVOD6I2YWDufqj5Vx/SbrtqQjYwHxTV1YR3V3ztSPwt7V6tNOlLzTfS
         nqsOQwV2ftwti3i6WX0PsST//LAXf711UtteMNa4N/N5/K2hvmlKKQqsP5Dta3P8WNat
         dN8rY3WcMB14tgw1QgeCp2v2NdHZwGW4QH7v0nWkrQ9ha07bW5HLtot1YJLNccfPytcy
         AWNhCO7Toj/u23Nv1kki+e0RMHHFgZ+arapkhKjCN1DhDrPWEfkNx6UihYltPOmDFmbo
         94qgmsPAEpbT8lrGwDFFrh+vg2tdHsJ/CGdi03G1Ave+4eQcP5KWLANOAW7ylkx0lPIm
         Auaw==
X-Forwarded-Encrypted: i=1; AHgh+RoJDgNazD+HovCoHEQqIPOwIFBHKzhV1JWGvuA9LUdQN+VBdjohXC8s94RneergO1YQmi3DiG8hXQS4thr6LpTY@lists.infradead.org
X-Gm-Message-State: AOJu0YxIQZQFt3J5VYBBk37LvJvc7lXjXvwWkQuhJIbgt9oDXDCKMoRe
	jiZO6/Stww28juGsPzWVFN1I5FL7iMsvAVlyrxLm3PIVcMSY+7XVV71HkPZpvvIT+juYp//ynVw
	iv6EA3aG1YB/ELzKLEh9vZZx70e7M4w==
X-Gm-Gg: AR+sD12rRo7G1OR2MTpr1AN7SVF0zkmZT0J4V4zSDSoyPVJ/N4+ngqKhknbFFOkpC70
	sIApQEZFvWxDZnqllwJ2eCVfb084jLz8h71nIlycHg3gm+7VhkcjGjgo5KPGnWiwH3fpH6Q6OcV
	fzlcNE+fprXWn8oebWYWdUAY+j0BT5zh1iZGJgbokZiDkVXLyx7RQX/vaXVvqOF61SegEAGgj2B
	8hh++9Q8pXMRlgPT18c3wBLd09xwsGaAs//pLTLKJ44KF+9hK+1eIco/cMV+DftifSj33yFVe2e
	U9Iq3an8qt4vorNQVA==
X-Received: by 2002:a05:6a00:4285:b0:845:31a6:d84d with SMTP id
 d2e1a72fcca58-84e594050a0mr7460731b3a.7.1785174182279; Mon, 27 Jul 2026
 10:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com>
 <cb8XVJu6RUmEjMZpl7NA1g@collabora.com> <CAEWPSH7rQv-yZ+dL+mZi6Mt3rj6gUZhp3r7_Gpjy8=1OArqwUA@mail.gmail.com>
In-Reply-To: <CAEWPSH7rQv-yZ+dL+mZi6Mt3rj6gUZhp3r7_Gpjy8=1OArqwUA@mail.gmail.com>
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Date: Mon, 27 Jul 2026 19:42:49 +0200
X-Gm-Features: AUfX_mzH05lg1Xshmnhdl4MT0s8-l2--8m9czgeFTmnU7hUrCIbQUFu1WK57mGY
Message-ID: <CAMhzuboSqvGxV3C1YSRqtopGm=sTo9S9YD5fh7GVHjAebH2wOw@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt()
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104303_452999_1ED9BFDC 
X-CRM114-Status: GOOD (  37.49  )
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

Hi,

> The 10-bit capture format is NV15, whose luma stride is width * 5 / 4
> [...] while the VDPU381 needs the luma stride 64-byte aligned (2432).
> [...] so NV15 comes out unaligned and the decoded frame is corrupted
> without this. I can show the before/after on a 10-bit vector if that's
> useful.

The arithmetic is right, the hardware requirement does not reproduce here.
I built the same tree twice, changing only this hunk, and measured on a
Rock 5B+ (RK3588, VDPU381):
test with ALIGN without ALIGN libvpx
1920x1080 VP9 Profile 2, 10-bit 8f40faddd32e 8f40faddd32e 8f40faddd32e
1080x1920 VP9 Profile 2, 10-bit 68400b913caa 68400b913caa 68400b913caa
fluster VP9-TEST-VECTORS 224/305 224/305 -
Both clips are the shapes that reach the ALIGN: 1920 gives an NV15 stride
of 2400 (2400 % 64 =3D 32) and the portrait clip rounds to a capture width =
of
1088, stride 1360 (1360 % 64 =3D 16). md5 is of the decoded frames converte=
d
to I420, same pipeline for hardware and software. The 8-bit control on the
same pipeline is byte-identical too, so the comparison is not hiding a
conversion artefact.
That matches what the registers ask for. The stride goes into the hardware
as bytesperline / 16 (y_hor_virstride, uv_hor_virstride, and the VP9
reference ones), and width * 5 / 4 with a 64-aligned width is always a
multiple of 16, so step_width =3D 64 already guarantees the alignment the
hardware needs. Rounding to 64 only pads the stride reported to userspace,
for every variant and every coded format, not just the 10-bit case.
If you did see corruption without this, I suspect the other hunk in the
same patch was missing too. Taking the MV and reference pitch from
bytesperline instead of the bitstream width is the part that makes the
register value and the buffer layout agree, and it is the one I would keep.
My A/B has that hunk on both sides, so what I varied is only the ALIGN. If
you have a vector that fails with the pitch fix in place and the ALIGN
removed, I would like to run it.
One small thing on the v2 suggestion: v4l2_fill_pixfmt_mp_aligned() does
not exist in 7.2-rc5. v4l2-common.h exports v4l2_fill_pixfmt() and
v4l2_fill_pixfmt_mp() only, so that would be a new helper to add rather
than a drop-in replacement.

Sav

Il giorno lun 27 lug 2026 alle ore 19:07 Igor Paunovic
<royalnet026@gmail.com> ha scritto:
>
> Hi
>
> > This shouldn't be needed. As you set step_width to 64,
> > v4l2_apply_frmsize_constraints() should already do the alignment.
> > Do you have more context as to when width is not aligned ?
>
> You're right that the width is aligned -- step_width =3D 64 handles that.
> This isn't the width though, it's the stride, and it only bites on the
> 10-bit (Profile 2) capture format.
>
> For 8-bit NV12 the luma stride equals the width, so once the width is
> 64-aligned the stride is too and this block is a no-op.
>
> The 10-bit capture format is NV15, whose luma stride is width * 5 / 4
> (bpp {5, 10}, bpp_div {4, 4} in v4l2-common.c). That isn't a multiple
> of 64 even when the width is: a 1920-wide Profile 2 frame gives a
> 2400-byte stride, while the VDPU381 needs the luma stride 64-byte
> aligned (2432). v4l2_apply_frmsize_constraints() only rounds the width
> and height, and v4l2_fill_pixfmt_mp() fills the stride with alignment 1,
> so NV15 comes out unaligned and the decoded frame is corrupted without
> this. I can show the before/after on a 10-bit vector if that's useful.
>
> If you'd rather express it through the framework than with a manual
> ALIGN() here, v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width,
> height, 64) produces the same bytesperline and sizeimage -- happy to
> switch to that in v2.
>
> Igor
>
>
> On Mon, Jul 27, 2026 at 5:58=E2=80=AFPM Detlev Casanova
> <detlev.casanova@collabora.com> wrote:
> >
> > Hi !
> >
> > On Sunday, 26 July 2026 16:25:37 EDT Venkata Atchuta Bheemeswara Sarma =
Darbha
> > wrote:
> > > From: Igor Paunovic <royalnet026@gmail.com>
> > >
> > > Ensure bytesperline is 64-byte aligned and scale sizeimage accordingl=
y.
> > >
> > > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > > Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> > > Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha
> > > <vdarbha0473@gmail.com> ---
> > >  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> > > 436bb460f04e..6ab6530b1cc9 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > @@ -102,12 +102,20 @@ static void rkvdec_fill_decoded_pixfmt(struct
> > > rkvdec_ctx *ctx, struct v4l2_pix_format_mplane *pix_mp)
> > >  {
> > >       const struct rkvdec_variant *variant =3D ctx->dev->variant;
> > > +     struct v4l2_plane_pix_format *plane =3D &pix_mp->plane_fmt[0];
> > > +     u32 aligned_bpl;
> > >
> > >       v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width,
> > > pix_mp->height);
> > >
> > > -     ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> > > +     /* ensure bpl is 64 byte aligned and scale sizeimage accordingl=
y.
> > */
> > > +     aligned_bpl =3D ALIGN(plane->bytesperline, 64);
> > > +     if (aligned_bpl !=3D plane->bytesperline) {
> > > +             plane->sizeimage =3D plane->sizeimage / plane-
> > >bytesperline * aligned_bpl;
> > > +             plane->bytesperline =3D aligned_bpl;
> > > +     }
> >
> > This shouldn't be needed. As you set step_width to 64,
> > v4l2_apply_frmsize_constraints() should already do the alignment.
> >
> > Do you have more context as to when width is not aligned ?
> >
> > >
> > > -     pix_mp->plane_fmt[0].sizeimage +=3D variant->ops->colmv_size(pi=
x_mp-
> > >width,
> > > pix_mp->height); +    ctx->colmv_offset =3D plane->sizeimage;
> > > +     plane->sizeimage +=3D variant->ops->colmv_size(pix_mp->width,
> > > pix_mp->height); }
> > >
> > >  static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_for=
mat *f,
> >
> > Regards,
> > Detlev.
> >
> >
> >

