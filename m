Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C64109C059
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5IehnxV7e5DF84ZNGYTQ1Iv4cs08XRIA2xiIGAR1xU=; b=GDnFp/qD0byqKCWzc/RWGe7rl2
	PIirnw2CceLDaviVzwKG9mNH9mKasfIso2eFtXYOB57Irnd5BDBk7Ne8efnvrpJzwU0eftj+L9oga
	5syTzerzHILnQZ8F3zzjPxF3EAvy2Vu3BHGJi8YwqW5icODR8lKc32JF8WlIYGc9+uFcfkd7X1S3Z
	hXGHE4UpOp76p6MooP8kOjHIirhqZtchiQRPDADstROEVgrt95+hRpPqbIszUxeec58i8KigB/A6Q
	X7IPQBrihC9xZHU8yk8E63QXbu/ZMeNEaUpdnZrLXwCxGlBlGoTiMjHHjyetrrjgUZLHNZ2Mf97cl
	d2rQxC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TFp-000000046Si-457g;
	Wed, 25 Mar 2026 18:46:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TFn-000000046SH-0LYT;
	Wed, 25 Mar 2026 18:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774464412;
	bh=4BhKnDHxlKSMru2h+OBmbdE9nJuAzrXPd4R2KPATfNA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GF6X0/cY68U7TcAA+jc86lgp+tJTdbOmYWAykONCLEOKDH3m1FbW0NVFAK8DfeNkk
	 fWvPmJslpjaU9Buu53ZxlXmW/z4V8bR1GeMz7rxUufvJ9KRsIOy5wD4/ivcnRMpm0U
	 5QqFdXGYl/GCr0FS3Rk7vEDWrlgT3GBlWPjHKuRg2zByCVhfzbyMHA/zEbFQ/k2S2P
	 aRJeIMYweKB9Lv64uxT8xNH0PdZ0CCCVWrUIBqIY2ae4bM3GPRptCD+MWQP47/Hg/x
	 pL/kKF5YTm5Qwrjuz0zec//cv4EOrh5jZgQPmiQch6D6x7/8u/yRfFk/6sGpSoRuJO
	 +qkJpE3qTBBSQ==
Received: from [IPv6:2606:6d00:15:e06b::c41] (unknown [IPv6:2606:6d00:15:e06b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6BA3917E5CBA;
	Wed, 25 Mar 2026 19:46:51 +0100 (CET)
Message-ID: <a9931f6b0568fa8c21b53a5c8ca93a9a90fed25d.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: AV1: Discard none supported profiles
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Wed, 25 Mar 2026 14:46:49 -0400
In-Reply-To: <20260325131956.18075-1-benjamin.gaignard@collabora.com>
References: <20260325131956.18075-1-benjamin.gaignard@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5z62E6Ku7U3JD7cZZml0"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_114655_269712_13AB2ADF 
X-CRM114-Status: GOOD (  14.89  )
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


--=-5z62E6Ku7U3JD7cZZml0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 mars 2026 =C3=A0 14:19 +0100, Benjamin Gaignard a =C3=A9crit=
=C2=A0:
> AV1 hardware can only decode YUV420 pixel format. That means
> that only profile 0 is supported. Discard all other profiles
> when receiving AV1 sequence control.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> =C2=A0drivers/media/platform/verisilicon/hantro_drv.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 2e81877f640f..12f98e7e7994 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -283,6 +283,8 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0
> =C2=A0		if (sequence->bit_depth !=3D 8 && sequence->bit_depth !=3D 10)
> =C2=A0			return -EINVAL;
> +		if (sequence->seq_profile !=3D 0)
> +			return -EINVAL;

You should also add the missing control to better tell userspace what it ca=
n and
cannot do. Check MTK driver for reference, I think the same config can be u=
sed:

drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
...
		.cfg =3D {
			.id =3D V4L2_CID_MPEG_VIDEO_AV1_PROFILE,
			.min =3D V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
			.def =3D V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
			.max =3D V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
		},
...

Nicolas

> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;

--=-5z62E6Ku7U3JD7cZZml0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacQtmQAKCRDZQZRRKWBy
9Cy+AP4lqq9BCcDZOqXjBZ3yYGOfcfoXWeWE2KU70uAXcKsbpQD/bUl+RdDxPIY7
yPwo6Fq713yfESsmKcVnHwPn9Tht5As=
=z+Ou
-----END PGP SIGNATURE-----

--=-5z62E6Ku7U3JD7cZZml0--

