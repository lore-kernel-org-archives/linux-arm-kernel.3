Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183AEC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4i45AoIudLNwR9IAtBYltSG7m68RejbFO/2WAgFeL9Y=; b=vqnhTmqSXKpgbe89jZLSIE7lQ3
	8iut2H2VxgNBaaHZ1H2bnGnL33DlKDujACHCJ4sRFEs7AsrIQuFIjcYT0xEfNw/FZAOHkjz461RL1
	BhqWv3xvL9jhpOv6O1N6bkAYd07Dvry40JK0FxFbfm6NMj1bM3zFmn9il0jDJfnzQrU2ZPgxtOmFG
	nCF9TSYma3rXPryypNB8uOghHiCdiun2pJOLVfALPkoakGF6Ir9dRO97+gEfdftmzl0sfw6i5ukn2
	XOBhkOS8PwHHfDpBRbcaYAK88lZCZx8kqIN1W9aLiB4R35J/XIceuXj5WOkMTd/Pt16oCAukKrL0S
	Yc8kyFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPZ4-00000003b86-0agQ;
	Mon, 27 Jul 2026 17:56:34 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPYu-00000003b5F-3Syq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 17:56:26 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-81e89f60620so2008907b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 10:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785174984; cv=none;
        d=google.com; s=arc-20260327;
        b=biH1lEo5KVZojuAYo4LQTgGGKIzYqT1nybdoMCKuZj7J25IvaFp8fnSNy8hf1IJmy3
         xz0HQrp7m7MVdzBQZYl1Irfv1/rTnrdpHfyOvXrTn6l26B1eaZ1Of93SMc5U1PvUrF7V
         AeMtrcQhtJfRSSnQppkPKuhLlkz1XjgXd7Eg4rPiEgcxDfmw7NguOgA6FoOtQO1CpzOc
         /54zg9vD0JTc5SrXbsEZkhb0xca0MxZWmwIZYus1cx8rxmr68BIL9/zDNSU0Tr/y63uN
         YqvmUa1LsUF/BuVGS8U4aj4DdzupImXBoMsQ7ugZswk0PHspSoCk3mH3aYHGNRkowqVd
         wo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4i45AoIudLNwR9IAtBYltSG7m68RejbFO/2WAgFeL9Y=;
        fh=yNG8cPmCqV0txEcjYWoK4tWvzTphvNwicP3u7zzfwIU=;
        b=FZl6uiwvMpUCYLoCWERwqyw70Q2JNeRPYGJqscO4ZMIb/RIBD0eY7flRJq26zK+qCV
         x+s0VVJnUxFwxelrgs+SfYy2RwDKPE9pqG5iXUMANSW5Dtuf9sFVroHa4Oszqi45NH+5
         v97id+trNGJO6MAcLfRJRnoJorb2jakarfOx7Y2f34XizfvIQOxFyGT8hCbhTOI6wT/z
         mYX7SRfLdEh9oCLLZ9uoovkW9tiaayLOxHALUl5o6QsATRVw6u0heG4x3wHCGth8rZBD
         1gffUfTxND8lwIqjSvpdhDU2KNfqCwDit1ShNKNADE1USTDiuxpz1iIIjfP/VG4BwtMG
         UBqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785174984; x=1785779784; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4i45AoIudLNwR9IAtBYltSG7m68RejbFO/2WAgFeL9Y=;
        b=Y9V6+yH8P9HQEj6ikiSfEm+7IbuDXtwMRSJXOBr7A4/A305QViRFRYqxLdUVlGcXwT
         Nj1vxx6CbhXRnn7i2AyOiYQ6gnriWeGL0QRlof+eYKzLGQl82NBi25QXSJ7G1EsvdmTg
         GxUPANchhPvOasByoMX5KFQqzf4h5HVYh1HrBXAB7djef9PATlrZ/rmt5iOEtFNweqod
         PgjbmthAVdUzG7ZZMPog9YlzKY3tXzcrNR28Ft7hKZMTSMf0sDUpdl3V9RwU+4unSo46
         dNysbc5t2EGSytLs9PVPx889HKyrYOd2s/jZDRc9yzwPQIN1b1ozQ84x6gF97f7Enjcb
         nSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785174984; x=1785779784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i45AoIudLNwR9IAtBYltSG7m68RejbFO/2WAgFeL9Y=;
        b=Yj+Yxa3R97xsY75JhgVZK3DVnnWMgzaLyRr+UzvSZhA4/26J2OjMmBGlvtzcPebF+P
         1PtjxjG61VAF45mbTl6moh87NdmxdXcSsR2x731cIacu6dKwEnb5ACngb1HISQ4ZQ/ad
         /OhcCrpuvHK0gCP7260ARZjUrqFsObdWnmUmBhz/28Q2rnyu/RH5CIfnjTjYgqxKl2W6
         Y0PU1GssJe+Vern7FNc/8zo/lnC+5Fm4RroaIoYfVZ22jSQb3o14bpYnCuVnHKOUJQq3
         h9RF2GzOsWDUjN+m22Jcsh//50XP6pJbQOUoitw4InXjPD9L3AXX0UDDYmVUONQMxFvB
         j39g==
X-Forwarded-Encrypted: i=1; AHgh+RqmdpKFiguUvqeLHXVL7ojD49gGYcK7ZR2WAIVr0BTPnc6oh/N+OV9/uy5u18iVZm9w6BC+hn+/7BCkDgCF5ywZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCRwzJYs07Y6TQ/KX/AskuisS60KI9+CvGRUiHDZOntAB1wdt5
	7Q2amYecskmWMDIeijVH/Cydt4FSSftOu+JeMphtJVrjbb/UurtOGYpg2TYcF0dfzrCLWmrQ4qp
	C8mh2baxEz8YjhR9Qv5u40q6E9UMswqc=
X-Gm-Gg: AR+sD10JFScMnOMhFGYqNlYA4jlofe1hv+ztNpwSKuIqctoz7GKB4mLshU75gWV8E+5
	Lv4WpLFHOuNJcV4a79LsHDlp7ZvQ/ug9eI/7HRJreKaoxiszzOF6dJNmTLVOf5MHfM2PRpsvZYb
	ckUtLUtF//MKLCmG7MO/jeypBPapM0XX2UK2qWdPKrc22T5LCC2r70uMq5b/WF442m2aG+v9AJw
	8MvW8fBU3xoQsgbjG7l4C+/6GRge08GxmSTxoa/JKdMeNcL+3X6AVVQaIhW/1gaLBheor6PW6+u
	4gtTQvMm7QVn8Q1aQI7pA1S5XF/xwic=
X-Received: by 2002:a05:690c:e3ea:b0:81e:ba71:2be2 with SMTP id
 00721157ae682-81f91933c4amr4863477b3.5.1785174983542; Mon, 27 Jul 2026
 10:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com>
 <cb8XVJu6RUmEjMZpl7NA1g@collabora.com> <CAEWPSH7rQv-yZ+dL+mZi6Mt3rj6gUZhp3r7_Gpjy8=1OArqwUA@mail.gmail.com>
 <CAMhzuboSqvGxV3C1YSRqtopGm=sTo9S9YD5fh7GVHjAebH2wOw@mail.gmail.com>
In-Reply-To: <CAMhzuboSqvGxV3C1YSRqtopGm=sTo9S9YD5fh7GVHjAebH2wOw@mail.gmail.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 27 Jul 2026 19:56:12 +0200
X-Gm-Features: AUfX_mxKOCcJHgSDrqe3mSeA7IFNg94Yj5C1MqeSQXmQtWXKJTA5E3698nF-3fo
Message-ID: <CAEWPSH7rNrVEKFTUFMN4Pd08s=5+E2Bdb1hOXDU+A9hvNOOKEQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt()
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
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
X-CRM114-CacheID: sfid-20260727_105624_887655_B973C0A0 
X-CRM114-Status: GOOD (  46.71  )
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

HI

Thank you for measuring it -- that settles it, and you're right. The
byte-exact A/B on both the landscape and portrait shapes that reach
the ALIGN is conclusive: the hunk makes no difference to the decoded
output.

Tracing it back through the registers after your mail confirms your
explanation. The luma and reference strides are programmed as
bytesperline / 16 (reg018/019 and the VP9 lastf/golden/altref
hor_virstride fields), so the hardware only needs a 16-byte-aligned
stride, and width * 5 / 4 on a 64-aligned width is always a multiple
of 16. step_width =3D 64 already guarantees what the hardware asks for.
My "corrupted without this" was reasoned from the ALIGN constant
rather than measured against this tree with the pitch fix in place --
that was my mistake.

You're right that the real fix is taking the MV and reference pitch
from bytesperline instead of the bitstream width -- that's what makes
the register value and the buffer layout agree, and it's already in
the "Add VP9 support" patch ("Real buffer stride, not
display-width-derived"). I don't have a vector that fails with that in
place and the ALIGN removed.

So this patch should be dropped in v2; the pitch derivation carries
it. And thanks for the catch on v4l2_fill_pixfmt_mp_aligned() --
you're right it isn't in 7.2-rc5, so that suggestion doesn't apply
either.

Igor


On Mon, Jul 27, 2026 at 7:43=E2=80=AFPM Francesco Saverio Pavone
<pavone.lawyer@gmail.com> wrote:
>
> Hi,
>
> > The 10-bit capture format is NV15, whose luma stride is width * 5 / 4
> > [...] while the VDPU381 needs the luma stride 64-byte aligned (2432).
> > [...] so NV15 comes out unaligned and the decoded frame is corrupted
> > without this. I can show the before/after on a 10-bit vector if that's
> > useful.
>
> The arithmetic is right, the hardware requirement does not reproduce here=
.
> I built the same tree twice, changing only this hunk, and measured on a
> Rock 5B+ (RK3588, VDPU381):
> test with ALIGN without ALIGN libvpx
> 1920x1080 VP9 Profile 2, 10-bit 8f40faddd32e 8f40faddd32e 8f40faddd32e
> 1080x1920 VP9 Profile 2, 10-bit 68400b913caa 68400b913caa 68400b913caa
> fluster VP9-TEST-VECTORS 224/305 224/305 -
> Both clips are the shapes that reach the ALIGN: 1920 gives an NV15 stride
> of 2400 (2400 % 64 =3D 32) and the portrait clip rounds to a capture widt=
h of
> 1088, stride 1360 (1360 % 64 =3D 16). md5 is of the decoded frames conver=
ted
> to I420, same pipeline for hardware and software. The 8-bit control on th=
e
> same pipeline is byte-identical too, so the comparison is not hiding a
> conversion artefact.
> That matches what the registers ask for. The stride goes into the hardwar=
e
> as bytesperline / 16 (y_hor_virstride, uv_hor_virstride, and the VP9
> reference ones), and width * 5 / 4 with a 64-aligned width is always a
> multiple of 16, so step_width =3D 64 already guarantees the alignment the
> hardware needs. Rounding to 64 only pads the stride reported to userspace=
,
> for every variant and every coded format, not just the 10-bit case.
> If you did see corruption without this, I suspect the other hunk in the
> same patch was missing too. Taking the MV and reference pitch from
> bytesperline instead of the bitstream width is the part that makes the
> register value and the buffer layout agree, and it is the one I would kee=
p.
> My A/B has that hunk on both sides, so what I varied is only the ALIGN. I=
f
> you have a vector that fails with the pitch fix in place and the ALIGN
> removed, I would like to run it.
> One small thing on the v2 suggestion: v4l2_fill_pixfmt_mp_aligned() does
> not exist in 7.2-rc5. v4l2-common.h exports v4l2_fill_pixfmt() and
> v4l2_fill_pixfmt_mp() only, so that would be a new helper to add rather
> than a drop-in replacement.
>
> Sav
>
> Il giorno lun 27 lug 2026 alle ore 19:07 Igor Paunovic
> <royalnet026@gmail.com> ha scritto:
> >
> > Hi
> >
> > > This shouldn't be needed. As you set step_width to 64,
> > > v4l2_apply_frmsize_constraints() should already do the alignment.
> > > Do you have more context as to when width is not aligned ?
> >
> > You're right that the width is aligned -- step_width =3D 64 handles tha=
t.
> > This isn't the width though, it's the stride, and it only bites on the
> > 10-bit (Profile 2) capture format.
> >
> > For 8-bit NV12 the luma stride equals the width, so once the width is
> > 64-aligned the stride is too and this block is a no-op.
> >
> > The 10-bit capture format is NV15, whose luma stride is width * 5 / 4
> > (bpp {5, 10}, bpp_div {4, 4} in v4l2-common.c). That isn't a multiple
> > of 64 even when the width is: a 1920-wide Profile 2 frame gives a
> > 2400-byte stride, while the VDPU381 needs the luma stride 64-byte
> > aligned (2432). v4l2_apply_frmsize_constraints() only rounds the width
> > and height, and v4l2_fill_pixfmt_mp() fills the stride with alignment 1=
,
> > so NV15 comes out unaligned and the decoded frame is corrupted without
> > this. I can show the before/after on a 10-bit vector if that's useful.
> >
> > If you'd rather express it through the framework than with a manual
> > ALIGN() here, v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width,
> > height, 64) produces the same bytesperline and sizeimage -- happy to
> > switch to that in v2.
> >
> > Igor
> >
> >
> > On Mon, Jul 27, 2026 at 5:58=E2=80=AFPM Detlev Casanova
> > <detlev.casanova@collabora.com> wrote:
> > >
> > > Hi !
> > >
> > > On Sunday, 26 July 2026 16:25:37 EDT Venkata Atchuta Bheemeswara Sarm=
a Darbha
> > > wrote:
> > > > From: Igor Paunovic <royalnet026@gmail.com>
> > > >
> > > > Ensure bytesperline is 64-byte aligned and scale sizeimage accordin=
gly.
> > > >
> > > > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > > > Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> > > > Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha
> > > > <vdarbha0473@gmail.com> ---
> > > >  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++--
> > > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > > b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> > > > 436bb460f04e..6ab6530b1cc9 100644
> > > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > > @@ -102,12 +102,20 @@ static void rkvdec_fill_decoded_pixfmt(struct
> > > > rkvdec_ctx *ctx, struct v4l2_pix_format_mplane *pix_mp)
> > > >  {
> > > >       const struct rkvdec_variant *variant =3D ctx->dev->variant;
> > > > +     struct v4l2_plane_pix_format *plane =3D &pix_mp->plane_fmt[0]=
;
> > > > +     u32 aligned_bpl;
> > > >
> > > >       v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->widt=
h,
> > > > pix_mp->height);
> > > >
> > > > -     ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> > > > +     /* ensure bpl is 64 byte aligned and scale sizeimage accordin=
gly.
> > > */
> > > > +     aligned_bpl =3D ALIGN(plane->bytesperline, 64);
> > > > +     if (aligned_bpl !=3D plane->bytesperline) {
> > > > +             plane->sizeimage =3D plane->sizeimage / plane-
> > > >bytesperline * aligned_bpl;
> > > > +             plane->bytesperline =3D aligned_bpl;
> > > > +     }
> > >
> > > This shouldn't be needed. As you set step_width to 64,
> > > v4l2_apply_frmsize_constraints() should already do the alignment.
> > >
> > > Do you have more context as to when width is not aligned ?
> > >
> > > >
> > > > -     pix_mp->plane_fmt[0].sizeimage +=3D variant->ops->colmv_size(=
pix_mp-
> > > >width,
> > > > pix_mp->height); +    ctx->colmv_offset =3D plane->sizeimage;
> > > > +     plane->sizeimage +=3D variant->ops->colmv_size(pix_mp->width,
> > > > pix_mp->height); }
> > > >
> > > >  static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_f=
ormat *f,
> > >
> > > Regards,
> > > Detlev.
> > >
> > >
> > >

