Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FDFC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SGboSOswdFr4oKFb8b41BIGPchcd0X0BYweRE28Gn4=; b=n28zNzX7Y01btue9JnhT/o7NM1
	XRHSa6c744hr8gcKE0h5Q5FER87T8cF6avpsZBD3pnBI3nZN6Fo0HMKjPjXG78Ej7e6qr1ef9lVlD
	L/hZ+AZkS64tsi8yv4evFrVyjHiQz6SP84kzo36maJWPV2zSqDzBiAC0NtWZHdFWpnYWrFbeBPq5W
	YflAL97FP1KGNkDHY4rSuRMTuhwiaQUafnZ7RvoOGZK+J8jnssyU+vfNuXgKcK+zwDYJkODfKtxcn
	0kojaQ3cLNCbiHzll0Zsfgtb3RRdp7kYGXN3e145WYgDMjRlS27I5qmuwpwgcSvVjK8001YAtFUjh
	g/7TYbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQdI-0000000Bx5T-1UXi;
	Mon, 10 Aug 2026 14:05:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQdF-0000000Bx4r-3xn9;
	Mon, 10 Aug 2026 14:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786370732;
	bh=3is/7Qz5EMpjjXNHjtJS3LzE2Ultwl4Sfu9h9ip4T0s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=oiVuW0lT5Of6lm7Z/ZOFbtbkfKJmtmRybLKH5/+JTRZfY5YBjhdCC9fnKBmrSNgp4
	 /3ttdMNe6ljisIWCM1OWoCOGD+nI1gX64un1PPBrBugd5fWvs3vvPG6yBHzvjAw/0o
	 he8YPYGU8V6GFNV+EPtpOOulef/iSA8jqy4Y0Afzq+GrSaTyy5dicu1A50bgfdTuOx
	 pc5xGk35pkbWwdsS89406fqCHac7m/G/1FEEBsPSEXQ2H+jTWttF5sq1g/ihh6/5VI
	 U0mVpbI4q9HzJETpBZo4WT2hJzndItkoD12pg4Xz3po41ffeKtoPqD/g8k2l1g5ft7
	 qOJeJ8inm9AoA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6874D17E080A;
	Mon, 10 Aug 2026 16:05:30 +0200 (CEST)
Message-ID: <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: fix v4l2-compliance failure
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>,  Hans Verkuil <hverkuil+cisco@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Date: Mon, 10 Aug 2026 10:05:29 -0400
In-Reply-To: <20260730153603.5721-1-tharitt97@gmail.com>
References: <20260730153603.5721-1-tharitt97@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-TzX0jms5qUDK0lg++uvs"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_070538_139430_1172F9D9 
X-CRM114-Status: GOOD (  19.64  )
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


--=-TzX0jms5qUDK0lg++uvs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 30 juillet 2026 =C3=A0 15:36 +0000, Tharit Tangkijwanichakul a =C3=
=A9crit=C2=A0:
> rkvdec fails v4l2-compliance in two tests related to
> V4L2_CID_STATELESS_HEVC_SPS. The Control ioctls test reads the control
> with GET_EXT_CTRLS and writes the same value back; TRY_EXT_CTRLS then
> returns -EINVAL because the VDPU38x rkvdec_hevc_validate_sps() rejects
> sps->chroma_format_idc =3D=3D 0, which is the value returned when the
> control has no default.
>=20
> =C2=A0=C2=A0=C2=A0 v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
> =C2=A0=C2=A0=C2=A0 v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38
> =C2=A0=C2=A0=C2=A0 Control ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail: v4l2-test-controls.cpp(9=
42):
> 	try_ext_ctrls returned an error (22)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> =C2=A0=C2=A0=C2=A0 Buffer ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail: v4l2-test-buffers.cpp(31=
02): node->streamon(q.g_type())
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail: v4l2-test-buffers.cpp(31=
57): testBlockingDQBuf(node, m2m_q)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test blocking wait: FAIL
>=20
> Provide a control default via p_def with chroma_format_idc =3D 1 (4:2:0),
> which is the only value the VDPU38x SPS validation accepts.
> This fixes both the Control ioctls and the Buffer ioctls failures.
>=20
> Tested on Radxa Rock 5B (RK3588).
>=20
> Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 var=
iant")
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 1d1e9bfef8e9..37603f049788 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -236,6 +236,10 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls =
=3D {
> =C2=A0	.num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
> =C2=A0};
> =C2=A0
> +static struct v4l2_ctrl_hevc_sps vdpu38x_hevc_sps_default =3D {
> +	.chroma_format_idc =3D 1,
> +};
> +
> =C2=A0static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D =
{
> =C2=A0	{
> =C2=A0		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> @@ -243,6 +247,7 @@ static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctr=
l_descs[] =3D {
> =C2=A0	{
> =C2=A0		.cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
> =C2=A0		.cfg.ops =3D &rkvdec_ctrl_ops,
> +		.cfg.p_def.p_hevc_sps =3D &vdpu38x_hevc_sps_default,

Thanks for your patch. Have you considered setting this default in v4l2-com=
mon
instead ? Monochrome is rarely supported of implemented in codecs, so setti=
ng
the global default to 4:2:0 seems like it would be valid for all drivers.

Nicolas

> =C2=A0	},
> =C2=A0	{
> =C2=A0		.cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,

--=-TzX0jms5qUDK0lg++uvs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCannaqQAKCRDZQZRRKWBy
9G57AP92mrNZWgsDBwsQ2XuKqcBeRf0Gxt9wn6CCa0p8jJZaggEAtrJ7HoEDXOBa
hQUTaEu7DxXMJvm07IaizMrkf6mhqgw=
=XESv
-----END PGP SIGNATURE-----

--=-TzX0jms5qUDK0lg++uvs--

