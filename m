Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F005CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScToGLgY21W9pR03qXloVq8Erpuen1ih1N7DUB0PhsI=; b=WAs06euYq9Ar1KsPO7HUCTmSpb
	25/UeozczXUgTvVCpNlPSVdQomiErFrMfl4PGz17DUeJmrVqj8Xc95xGgjk7YbIlPLmAkpCKABzBL
	TC3qAnrAmgiO8R9PGA9mOArcdTKLn92w+isoRc1YF4JOw91zx31EMMo7z/psT82egL6PcY+D6qSxF
	3nuZLndJLztabXmlwt00IEzS6xnue49tgsszc7ezkrdenZczBrzezF9bCPymybBe1xpwjOptfx7dh
	Sk42lIGtDgneScEpTJRsMjGH/ID0t8lagqvlBMxHpa5a/KUkgnFX41CTO4Snnv5bn6QCJEa1Pt457
	LhIlgtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CHR-00000002Zcv-30Lg;
	Tue, 07 Oct 2025 18:19:21 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CHP-00000002ZbU-0CUO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:19:20 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-863fa984ef5so802748785a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759861158; x=1760465958; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ScToGLgY21W9pR03qXloVq8Erpuen1ih1N7DUB0PhsI=;
        b=NyS8u49Kt/h7Kfu9Ng6CRNV7cAsVI2QAM9r/IsvWTutmsE9BFRtw4RsUzur2LAmF6l
         v7lBnYQsgvqOCuCfFE54pn80/oY4Fn7jtUsMUmKVVHYAYyKaUQ05lJISaj6zHTgfPszG
         SW554SDyGayco88ObQOax2jPTmJCRnMZp3Mru9Jm3+QcxBzV/4BB3cDsRBYB72BvgZPK
         KJ3xw79REEuM63iSokkrC/Qv5MGoZKk4Zqgy5rF+Jie9Zy4IWsdpCjyCkDZhAEj/X1B5
         wumoVWAHoYnChCQ+lPqZlMKJH5eLyNiK9480bCiQwckuY8OyguAFaVbrN2l0dy71A3WK
         1Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759861158; x=1760465958;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScToGLgY21W9pR03qXloVq8Erpuen1ih1N7DUB0PhsI=;
        b=CkBknmLAvpLoG8I7DFacbm3ls3aXhwEiIIdrIDHyGUvXse6G6hNHvMIRqo6YU1mWQ0
         Ryo5914ELUFmi0I4spXqYsqHO7iarWsclCDmF8tzBVNpN6qtr9cSTuy5juWFofp0u7ba
         3x5s/nQEz2BYqqDXruSvmkXASZIcIBAt6ox1YmPLbp5erM+TNqVZJdjXlo+J7aNfVl/R
         41WdUxKGJiT5yDktOoYxjbUjXziKRyxsVRUaPKl4/GbXtJbGSPnlkZOebkX1Batl51uc
         oOMTTtpSYfvI3zvR47MrXZh+s61Qx+9BfOxSgrn5FjpaiQ2ESfIGfrSIu17flZgLBCQn
         v7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCV8KsgDrM0ydclBVmkaV1PSipu5wWf6EkCBO62GBeGr82FDtxeTCwPpvQHo8k3YuEKlO95ll4IiIFzIX0tKhJqy@lists.infradead.org
X-Gm-Message-State: AOJu0Yykhd43656BPOG3Rw59FZjU0tHJk28BUj2vMYA5LOjsJM4rmCbk
	8Mokgr9vSJCb6Jn2EMzwd/xPBGFIjIvKyQh0p6LNkRF110Du88OY8RJzowJKSTu+XSI=
X-Gm-Gg: ASbGncv0TThUp6ux+DmD6x2PKS8bzxO+CqoBDz+bYmtUjoyXgzQiQ0wK7yPtWi7mNbS
	GDlXjO50W12AAAzWaS5Y1PRjEcrUq2/XXb4LMA5tEdFbwgmXdrSdF+PlebZKtKOpNiZShjXXo7k
	4+Sxw3uVCrQYcQrxKDdJM5WaYpku7V2bTYvw2b6keKhRL56k4JdobACOMnBWLa1bksQI0RAPpvW
	iJ+7i8I7UEZB7JRMld4z6NoqyVZNUcPZoutE2nvolKBwVgdefa8lBueOF8DBbQjPgQtG/evneMq
	BKFPKjRS2HHr4ybA7UL7KGmG5iDT/ScvtPtB4KjwuxS4qMOoJu1Y/05w+49Sqem8Pxy6EqG89qo
	DtElRXchALsVQLNYF1jxKld5WKkdfVr1hK/qTKMbx0WphIG2kLyBL
X-Google-Smtp-Source: AGHT+IHAN4pZjNRmmjniVTQYekbD8pM0Q+9DHCv4rh7qOTooNtWbQmwGL4IxpavnXlznH/zxFYUPUA==
X-Received: by 2002:a05:620a:3909:b0:813:ccb9:509f with SMTP id af79cd13be357-88351de79cbmr108285785a.5.1759861157718;
        Tue, 07 Oct 2025 11:19:17 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87771129491sm1649508085a.2.2025.10.07.11.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:19:16 -0700 (PDT)
Message-ID: <db7030790063d0ebe6d254c7053e758184b9d7cc.camel@ndufresne.ca>
Subject: Re: [PATCH 03/16] media: rockchip: rga: align stride to 16 bytes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Tue, 07 Oct 2025 14:19:15 -0400
In-Reply-To: <20251007-spu-rga3-v1-3-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-3-36ad85570402@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xTXqAg4scDgbBruSU9ja"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_111919_098169_C08EBA01 
X-CRM114-Status: GOOD (  23.41  )
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


--=-xTXqAg4scDgbBruSU9ja
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le mardi 07 octobre 2025 =C3=A0 10:31 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Align the stride to a multiple of 16 according to the RGA3 requirements
> mentioned in the datasheet. This also ensures that the stride of the RGA2
> is aligned to 4 bytes, as it needs to divide the value by 4 (one word)
> before storing it in the register.
>=20
> Increasing the stride for the alignment also requires to increase the
> sizeimage value. This is usually handled by v4l2_fill_pixfmt_mp, but
> it doesn't allow to set a stride alignment. Therefore use the generated
> values to calculate the total number of lines to properly update the
> sizeimage value after the bytesperline has been aligned.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 21 ++++++++++++++++++++=
+
> =C2=A01 file changed, 21 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index
> 6438119a6c7aeff1e89e7aa95dcd5d2921fefa08..3cb7ce470c47e39d694e8176875a75f=
ad271
> 7f96 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -459,6 +459,25 @@ static int vidioc_enum_fmt(struct file *file, void *=
priv,
> struct v4l2_fmtdesc *f
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static void align_pixfmt(struct v4l2_pix_format_mplane *pix_fmt)
> +{
> +	int lines;
> +	struct v4l2_plane_pix_format *fmt;
> +
> +	/*
> +	 * Align stride to 16 for the RGA3 (based on the datasheet)
> +	 * To not dismiss the v4l2_fill_pixfmt_mp helper
> +	 * (and manually write it again), we're approximating the new
> sizeimage
> +	 */
> +	for (fmt =3D pix_fmt->plane_fmt;
> +	=C2=A0=C2=A0=C2=A0=C2=A0 fmt < pix_fmt->plane_fmt + pix_fmt->num_planes=
;
> +	=C2=A0=C2=A0=C2=A0=C2=A0 fmt++) {
> +		lines =3D DIV_ROUND_UP(fmt->sizeimage, fmt->bytesperline);
> +		fmt->bytesperline =3D (fmt->bytesperline + 0xf) & ~0xf;
> +		fmt->sizeimage =3D fmt->bytesperline * lines;

Instead of open coding this, describe this with struct v4l2_frmsize_stepwis=
e and
then use v4l2_apply_frmsize_constraints().

Nicolas

> +	}
> +}
> +
> =C2=A0static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_=
format *f)
> =C2=A0{
> =C2=A0	struct v4l2_pix_format_mplane *pix_fmt =3D &f->fmt.pix_mp;
> @@ -474,6 +493,7 @@ static int vidioc_g_fmt(struct file *file, void *priv=
,
> struct v4l2_format *f)
> =C2=A0		return PTR_ERR(frm);
> =C2=A0
> =C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, frm->fmt->fourcc, frm->width, frm-
> >height);
> +	align_pixfmt(pix_fmt);
> =C2=A0
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> =C2=A0	pix_fmt->colorspace =3D frm->colorspace;
> @@ -496,6 +516,7 @@ static int vidioc_try_fmt(struct file *file, void *pr=
iv,
> struct v4l2_format *f)
> =C2=A0				(u32)MIN_HEIGHT, (u32)MAX_HEIGHT);
> =C2=A0
> =C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-
> >height);
> +	align_pixfmt(pix_fmt);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> =C2=A0
> =C2=A0	return 0;

--=-xTXqAg4scDgbBruSU9ja
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVZowAKCRDZQZRRKWBy
9MJZAQCpWWpCOI+8uxUCGwR39EX9OFe0+a9YuMmqqvplJUrUewEA0RMUMOwAoFpB
7n2OM0ustpDmfHr+P0+lF6Jtxzgqcwo=
=MSnu
-----END PGP SIGNATURE-----

--=-xTXqAg4scDgbBruSU9ja--

