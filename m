Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB10C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 13:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEwUMLZxq0p2ok1ig4UlS+jtAFMxWsAuPxBBLyv10o4=; b=SYJqMMZBpMgM95RNDyL05YAu+i
	Kfs9R9ttudSgDXijDtBu+LcB9MmegTPy1bZxQ15EQ45kadOyzEguUqiEqPVuBWWt1x9WUo6NZP4tW
	igFntqjwsFRvVqUxFDeA1S+DkL3hmT5+TpZcAyoNYdhQIGxUS5vUi+sDFf/EA7Z28ZuVzXw06CktW
	cqB1feIOY6jnygyFUOaS4e2FHL5qZoeNejWyHiTpx+SFRVEa6hMQGBcBlog+nDSQVO4D1svi/L6a2
	872jrpySIFiNL1dsloDVp2xOZRphW8CmPmF7/qFKHD6Ci4vvnWm4Eiyr/8aWyZprY1xftUDb2siHu
	8ohlgCaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWnU-00000006X1g-2asl;
	Sat, 11 Jul 2026 12:27:08 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWnQ-00000006X15-2V3I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 12:27:06 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-4a25f986bffso1363812b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 05:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772823; cv=none;
        d=google.com; s=arc-20260327;
        b=GBGn++WGKnPbzYVJ2jSPvyXemRs2QgDMhTwwx9/g7fzXLqVGR69R+0/7vcfA3dxfzt
         iq3wBbilHtPznI/+9ypSXw/etChRuARz6RL4RfoXyPVwWpdJhuvGc8ngTv5Qlp6RJf9l
         hjOAd9C7Eop755YjLkOc1gSBCMBYEVQ481THZkRo6krzK5O/y2wGWykox5ElvWxeoidx
         H2tMAZ+7v5/ipnlE2mNJ/d+65biKJVOZ8UA4l4p0CnYkg2fYHzvCWvvUcE2oOros42uJ
         0zdfy+s7dpn8H4GryCZYexpKmmTu7EAqX1/ThrZY2Or94PbOg3aPRl0Py0Qw0oY0foJS
         gJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hEwUMLZxq0p2ok1ig4UlS+jtAFMxWsAuPxBBLyv10o4=;
        fh=3n2tVgyTGAkLONgS4QObezPmvbUzrJGXq8l2D/wjvC0=;
        b=fKpzxqYaIqddJGfo0hJdeQkOyPA/jR3Oeqn/DwOebs920Lxq3Ebq+DTTCJlP0QiJjx
         w28xlBqSLAAe2ZUJZ2JSMNgzAUMFufOIaO+DdBHE8xtQw9m4edWvFGaC6+AqHpx1/OF/
         uhJskVYm+QgRl+dJxcwJXkbLFc53308tKWsFMAH8Ptp6Cy4AX/vAWLq9992mEmtlfmQD
         sodfXlGvIgiymDFn7HqYxoUf9tUq0jrXqrc//ZZUh0X4avbxRUgyTxWMtqNEVHgsoUde
         lIdA7ERsjnBK/BfmhRvmGgOtTT2Ztsjmb+bCVkuvjxQ4EZq4wCYTTtXTgwn+8nmeQgS8
         FD1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772823; x=1784377623; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hEwUMLZxq0p2ok1ig4UlS+jtAFMxWsAuPxBBLyv10o4=;
        b=RfcgDyUHteees1EciL4tpHzaV1arw17mkmpEsWU1i+bKbdWXspEEB3RRs8gPxwVeAl
         9ZC48y3Bh65z9EF/g4JzRofPsek4byLNIcEYjPUG3r+kPBLHsmPUf0E5fq8U3dGrDCcu
         v6gs3aEOqcPCtxdy5VeU6gjtILy/B+ipVGF24+E71eXUArzzwVSWO0J69Or9yDdW5i2D
         zzWX7wqvLaN1V3bYI77bcVo95sKVbL0fitAaMC364XtSTRZ1UxQ4U9mT/sUwILJYyoRj
         Rbmd/zK+0WqfyFWmv0wAcUrxX1YZY7ydfIYJKnovn6BolYayUTgkoVNrXd3kMFwDDX75
         Errg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772823; x=1784377623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEwUMLZxq0p2ok1ig4UlS+jtAFMxWsAuPxBBLyv10o4=;
        b=BDzdp8F37j3KYAOS9ZbxcjzNh3k5GnRztNwRE/VhP76t15MkznYN8BHH6bLuyynYQ/
         jAjon+STjPc4b7m6HYzdNivJ/U8w1g5S3K32vtpnv92NMM4kAl0tv3YQ4OZNyBUbGp7s
         BQlqY6W1J1dhx2zw/IUWxUPbqZd3DJJwsc8ttECewtAfiqwsahMnneUoPqk83bFpH35P
         nNqLfWe+cqGagRJgoHrblalWxTB77t2TgRtSQBTmGNYtWQldw+vlUYpTbmAD8qf11/+y
         0qiKcYoN5osfThvFI9UYh7hh7KtgEWMagNdtLwAUWWX8nCA/v2L2CtdjuzBap/xwNury
         HrYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/akdjfSksLaaPlD8eZLux6iW8NnREVDiKUhjmQeQT+pHsTXutXiZShGfY9Mg9VNsdH0TrazA6WR+yUKCB4uFpG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6wsswreZOgZADXpclvTLvKb3mwHCB+R0YKUkWpFLps3uud2vi
	R8lODnvTTzNhh4e7esovsfahjdr0ktWUle070YSpLomn1MacZ1XUNm3B+4ZaclnZYv0VrsZ7rf9
	MQ6hhps4Sr5OHdMhbcIll+Q18OWpoQpU=
X-Gm-Gg: AfdE7ck8MFIPO6FMmlHuoreXgrkA9fGmmuumhOvAqg6UGwyBcLAzaX6p8w2GGv5LknC
	cENLzy319Y1KFNRY/3/DoGdpF6B8IDUghtiDZJV4K7W/CEzHftzgT1bxggPjaJYkGHYVVxJL31R
	KLBdJJrCU+qI8ZkZYplKZCaNsfdtCUtZq1WZTyN4Kxh2d7HacyYFrjULy/KlWiw9Dhcm2W2Et6m
	+x8dqYMMwuxfdDSC20r3BaR3kQ3cXKtXFyLIDeF2slJc49HjN4n+aMP2lpaeYZftLrmrXgwrXDx
	eFh10ot87sqMk4Xmh/amtIwnrsi27nLybY7MM/yv6VHoG6GLx/NGn91ixw==
X-Received: by 2002:a05:6808:4484:b0:4a3:5294:43d3 with SMTP id
 5614622812f47-4a42ac1c2e8mr1775095b6e.3.1783772823070; Sat, 11 Jul 2026
 05:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260527124552.33815-1-arash.golgol@gmail.com> <ahfxskMC340jUtbQ@shepard>
In-Reply-To: <ahfxskMC340jUtbQ@shepard>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 11 Jul 2026 15:56:51 +0330
X-Gm-Features: AUfX_mxN86zZBxPKHCNMJW9RhtruJcbvwihBjdQU--ZAFLpMa1mHyqWXuxF1LQ0
Message-ID: <CAMxPZkgtu1_H=UQ6pRg0mtj=O4bq7gpEuTg-wmEtVAOP12qUJg@mail.gmail.com>
Subject: Re: [PATCH] media: sun6i-csi: bridge: Remove duplicate mbus format entries
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_052704_695031_196FE1B1 
X-CRM114-Status: GOOD (  19.24  )
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

On Thu, May 28, 2026 at 11:11=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Arash,
>
> On Wed 27 May 26, 16:15, Arash Golgol wrote:
> > The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
> > MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
> > codes.
> >
> > Remove the duplicated entries from sun6i_csi_bridge_formats[].
>
> Looks good to me, thanks for taking care of this!
>
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

I'd like to gently follow up on this patch.

> All the best,
>
> Paul
>
> > ---
> >  .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
> >  1 file changed, 12 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c =
b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > index d006d9dd0170..0bec0cd7620e 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > @@ -113,12 +113,6 @@ static const struct sun6i_csi_bridge_format sun6i_=
csi_bridge_formats[] =3D {
> >               .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
> >               .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
> >       },
> > -     {
> > -             .mbus_code              =3D MEDIA_BUS_FMT_UYVY8_2X8,
> > -             .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > -             .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> > -             .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> > -     },
> >       {
> >               .mbus_code              =3D MEDIA_BUS_FMT_VYUY8_2X8,
> >               .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > @@ -143,12 +137,6 @@ static const struct sun6i_csi_bridge_format sun6i_=
csi_bridge_formats[] =3D {
> >               .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
> >               .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
> >       },
> > -     {
> > -             .mbus_code              =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > -             .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > -             .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> > -             .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> > -     },
> >       {
> >               .mbus_code              =3D MEDIA_BUS_FMT_VYUY8_1X16,
> >               .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > --
> > 2.34.1
> >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

--=20
Regards,
Arash Golgol

