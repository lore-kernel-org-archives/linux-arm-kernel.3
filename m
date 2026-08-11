Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56874C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bcFHmkU9nSJ0MDbVyrPBqiYyAs1hPGT8G7FVHkOHZ4=; b=xx5+st+g5A+LcIrlhLW+cGEQ+v
	fsmCj0dhodIkwETRtsngGKqPN1tk1ds84VyVb/chUKZeBxO3hrTGAEsOCM+u9zC9iq3LbAFC3/d4J
	oaBqYTfaY/IykNDlexpvg84XMkjJpwwRvA/TjYFxBZG7ktvYLKNsMkCu+bY63kYXRJ1sgiku80P9F
	tcGwIffVlhkEWzqaPf5p9a13trvHRYtQgqndEIi4MOWO4EROBjEu7lYHtlUTKjwAt3waXc2h+NXSU
	JnVEGa1sz80Wwe7jt6Z7+gsxBySOp0KnY5d3LMzAwsumP4oYMZ/F4jgFptfSt8NQiAny2wsZhhySs
	uKFTiNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpVR-0000000EWZV-04qJ;
	Tue, 11 Aug 2026 16:39:13 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpVO-0000000EWYU-0yvF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:39:11 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-92e65e18969so6181585a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786466348; cv=none;
        d=google.com; s=arc-20260327;
        b=XOgUSW+yEMdwscXBmcgndJVE0vVgaX67V7kf3ZfoKcjX1RhTG+6sJopjkUrj4CB1kG
         867jl0nKP4o0bc6EsaJ/MVwqG9ZXbU6lu/4/fM7Np31bIcR3u5mhroGHWo2FhmQO69bU
         eQJaA4kgtAqNe4l4QBC+RBLLxVTgwguCU0+nw9GpPNLQEFkifAptOCd+7cAvINYeruSV
         fs/i+/+W9M4FHZN9Nl9kCcPtH0JwrVq8HopKmEalPR5yuI1/qD4eCX/kdW6TUc6x6BMC
         JyMKBhWJklpxcNPo5yoHa8rkiYXffW5nX6c1ysErpFo3L3jHztQf8/o3NtZ3YYfrFAM2
         HZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4bcFHmkU9nSJ0MDbVyrPBqiYyAs1hPGT8G7FVHkOHZ4=;
        fh=XHORuEstB7/yIUPNOkESYmxtOFUTpHyKNzJ/SgnRXLQ=;
        b=EQ1sco+2jvsglU1AFum6dEeGlrxafOMN4YpEguzsj3BKxqhTkXJmOSom9yqMSSzDrB
         4AUHs6GQKiZHGUKuQ5ANDkDfapG1roJFPI6TthLujnHTjhmzTHnAO4VdoGNj8JFG3VTC
         Vfwe3yEDVL7blgTf8Q/M7VcqkaLPGKyO4N4y6lH7AsojxKCXRILsIt2dMHYxOKrM/tkf
         wi1SK2Sq5xG1bJn26bmjhmneZV23muUR8Z4yMGsbaYGbOQujOCWDiXVgBBUOqh07cuHi
         Uet0eWEYhhonk60COMoNELrYIdnTdsPJvvUEmvhYsXEXtPY9/CozT7XRD7Xn8a9U5MdL
         ub/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786466348; x=1787071148; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bcFHmkU9nSJ0MDbVyrPBqiYyAs1hPGT8G7FVHkOHZ4=;
        b=hbuR8kGcowL5Ri6ZWFsDRKB+MXQ4OS+n3z0tJW/49vu1NzFq14c4g7/u/KlGK5+iS3
         ZUE/wrqzU3deAznPyGM1cifk5qdxOu2JomHFKRCZ4vzUTsWn469NRtZLWAmSgBW3Vdtr
         HyqjDsalJOhuS5zpykQcMHO+y1C1uAY8wDRx/zwsJ4doGbf+B1fKsQ6TxECmaAr9nhBf
         BG1QpeLr0ZBi8XDurFaPQwbfmel5ZcFoxyrIAscSrJPZzuToQ6TavpTRnWSHWlz2BzsF
         3znfdghPYOxYHtbW6mJi9N6IdIz5sujQ9hDGkvKd4SvqvXMoMegCRqHrvFLGb2p5gGpw
         OESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466348; x=1787071148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bcFHmkU9nSJ0MDbVyrPBqiYyAs1hPGT8G7FVHkOHZ4=;
        b=LlDhOaM/JGOsgc1YzevHA4J5QgnB3HPhcY2PfBweTyu8ElLzTNxz7evJ1LKDbudovd
         Uwt7LGrObZFN4qDZ+dp65YPKKbiOqPQutLUrsufdVr2q9tpduAkuzuh/ZYRhmOs6Fo1t
         0l+wQ387h7QYg5XDdNCmXDa3kmDZgf1kBNhOWOb/td3URdsVKt/acx5T9whkii60uEiz
         Iim8nVaNQ7byd5MWXcVWZ9n6CxLYU/FkzonUpcr+i5yxPu1BNOZ46GFy2F1Evq6C8sBj
         h8ktPwOPOqM8BYGFQEpWDSgtEVpTEzF2NU8d1gsue53q6GBy2R68dIdmJj2sSRpuUuT7
         ERkg==
X-Forwarded-Encrypted: i=1; AHgh+RpHwg1RFyPrbtI6Lc9XaJi7H9PjmFrdLby1bA/ZOBQTFEaCPN//3e9w/+dh79IlsW9McRpzBxMkPiQNLD6WWRTl@lists.infradead.org
X-Gm-Message-State: AOJu0YwNvbD1k8FzQ3/FoRUAfcJ8oRisRPVaahy4/8fbl4OSaHVM5rwG
	woPc2FiZDCsTGtSDRftMbfoCLmRj0pWex1qxg9waVTGgztBxQ4jBbXnRnCLS3++JPN6QB7Et9zJ
	1a5e5hNC0Ru28h4z+CkRPma1V9h3xC6U=
X-Gm-Gg: AR+sD105XBdmZ7mAu0hrCA0tuykoqy3CQyiUEv8ifG4rO0CVi+/kgHMx6CpFzpwDrcT
	9CpjI8jQgwXLVZm3uusretEAYmBzGlT/oOaSCzZbY089/UCiuHBN5gOJ0rKS5LlLm8SV85/qbtP
	FeuB+L+wvaOYPFMc6bD8/E4OMQQ0Bk1ep/+gQ3Aa8Xbu+l9woX1QUJvVhMGug7ZWz8pmEly6YmK
	vRE8evh/ftteeWQo5AQfJYOEvou/273/XVCBiBcOdXzPLkbjcdBwEPZFEpbxfeFY2us86AqlNXe
	WvGhIr56dH54YPnH0yjgKXXsjJSASEt4vtv+N2hQ83zN5TFilkUZAhmnRJj5n4Iop1uaT56jZyi
	Y7MThkdZQGt5q6nW/o5hq4sJPd3z1MrQXi8c=
X-Received: by 2002:a05:620a:6018:b0:936:9f49:69ca with SMTP id
 af79cd13be357-936ae1b6195mr122622585a.21.1786466348494; Tue, 11 Aug 2026
 09:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260730153603.5721-1-tharitt97@gmail.com> <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
In-Reply-To: <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Tue, 11 Aug 2026 23:38:56 +0700
X-Gm-Features: AUfX_mxbavY404ZnMz9OyorTzYiN16EACxukLGAUaARpCgqkofGP15kHe_8MlHk
Message-ID: <CACak8wPrEJ6hj2hL=5yQVY1oUPcJV0GwZChbVGT+n0C924jR6g@mail.gmail.com>
Subject: Re: [PATCH] media: rkvdec: fix v4l2-compliance failure
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_093910_280657_64D1B970 
X-CRM114-Status: GOOD (  26.09  )
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

Hi Nicolas,

Thanks for the suggestion.

I moved the default out of rkvdec and into the common V4L2 compound
control initialization, making V4L2_CTRL_TYPE_HEVC_SPS default
chroma_format_idc to 1 (4:2:0).

I'll send this as v2.

Thanks,
Tharit

On Mon, Aug 10, 2026 at 9:05=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi,
>
> Le jeudi 30 juillet 2026 =C3=A0 15:36 +0000, Tharit Tangkijwanichakul a =
=C3=A9crit :
> > rkvdec fails v4l2-compliance in two tests related to
> > V4L2_CID_STATELESS_HEVC_SPS. The Control ioctls test reads the control
> > with GET_EXT_CTRLS and writes the same value back; TRY_EXT_CTRLS then
> > returns -EINVAL because the VDPU38x rkvdec_hevc_validate_sps() rejects
> > sps->chroma_format_idc =3D=3D 0, which is the value returned when the
> > control has no default.
> >
> >     v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
> >     v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38
> >     Control ioctls:
> >         fail: v4l2-test-controls.cpp(942):
> >       try_ext_ctrls returned an error (22)
> >       test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> >     Buffer ioctls:
> >         fail: v4l2-test-buffers.cpp(3102): node->streamon(q.g_type())
> >         fail: v4l2-test-buffers.cpp(3157): testBlockingDQBuf(node, m2m_=
q)
> >       test blocking wait: FAIL
> >
> > Provide a control default via p_def with chroma_format_idc =3D 1 (4:2:0=
),
> > which is the only value the VDPU38x SPS validation accepts.
> > This fixes both the Control ioctls and the Buffer ioctls failures.
> >
> > Tested on Radxa Rock 5B (RK3588).
> >
> > Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 v=
ariant")
> > Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> > ---
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/=
media/platform/rockchip/rkvdec/rkvdec.c
> > index 1d1e9bfef8e9..37603f049788 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -236,6 +236,10 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls=
 =3D {
> >       .num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
> >  };
> >
> > +static struct v4l2_ctrl_hevc_sps vdpu38x_hevc_sps_default =3D {
> > +     .chroma_format_idc =3D 1,
> > +};
> > +
> >  static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
> >       {
> >               .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> > @@ -243,6 +247,7 @@ static const struct rkvdec_ctrl_desc vdpu38x_hevc_c=
trl_descs[] =3D {
> >       {
> >               .cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
> >               .cfg.ops =3D &rkvdec_ctrl_ops,
> > +             .cfg.p_def.p_hevc_sps =3D &vdpu38x_hevc_sps_default,
>
> Thanks for your patch. Have you considered setting this default in v4l2-c=
ommon
> instead ? Monochrome is rarely supported of implemented in codecs, so set=
ting
> the global default to 4:2:0 seems like it would be valid for all drivers.
>
> Nicolas
>
> >       },
> >       {
> >               .cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,

