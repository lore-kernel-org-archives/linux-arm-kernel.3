Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9B7C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 00:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFq0+VRq9FjIStPFaZmw0RW9ODwBOIR5La7oy0PGiVk=; b=2+qSY1M5kM27SPhcJIhmD4U457
	JxXVYxsdW638n4SOCwJ2vTDhjO482eFI59oAWfXANjkueEyZYMOem67loIkiNo+IK2KxpH2nnyeJM
	6swOWv4BeRciLxaam5NF1JdMLMQ5Jmm9mwx9oT3oy7FGxpabx1lumc/djCN/CY++rKd5nmcRCj95R
	ltjVgHolRGTgtJOZIv2insPq3FJRkjhSrwBVipXtQcetlmmudRnixPGpjcnNdGYrRQmZUP0LIdKcs
	vuIas9VoUqZ/BSpioWiMADYqZ72EXbet9THlUxa0DYEHVjGWW/WKRS2Ul7iqKpQXoLEKfzuSMki7M
	ERhureGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAPd-0000000G9wb-2Xzl;
	Thu, 16 Jul 2026 00:57:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAPa-0000000G9vz-2GMd;
	Thu, 16 Jul 2026 00:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784163429;
	bh=KrKywOSi2DWeM2XOCMC0Rkz1CR6sXdjtn+QIWnjdl3E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EoQ5V1a9P5dXRl1LowJUXLbblJLnZUzRnJLTWMjZjcLQqHA0+RC/ML95j46cV8gGY
	 sYHMaqWnkwVEjuUFRZt0VBnR33E6hMC0q5ogUyp8qWi2+OYEqjGG1DEIX+kkhCQH/j
	 fCiQEPui12Om91gH6n2WDUz34HpLPk4jUlptD3C50CwnEZ8dHjiVbegyfcSeUVNR1R
	 jVN/LbeQQO9SurFQ3cZuOvp/XEQXhFlqK7ejftrjgt89tPpwuz5Krxr5406+5DkcjC
	 JR81HXYJVjE7mVcay2NuPcTp98WC5baZbKEhaEMpsm9G5+695mFHgSRKYiE/ZEpWVD
	 0D7ZroGdC6JHQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A41117E0F3F;
	Thu, 16 Jul 2026 02:57:07 +0200 (CEST)
Message-ID: <0c1c07cbdcbb3a6852e2fc13b94b84d7641f5b6d.camel@collabora.com>
Subject: Re: [PATCH] media: rockchip: rga: don't change RGB quantization
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Hans Verkuil
	 <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>, Michael
 Tretter	 <m.tretter@pengutronix.de>
Date: Wed, 15 Jul 2026 20:57:06 -0400
In-Reply-To: <20260605-spu-fixrga3quantization-v1-1-1059d984dc6e@pengutronix.de>
References: <20260605-spu-fixrga3quantization-v1-1-1059d984dc6e@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-U5+3yGyg/PFkfq4Pnraa"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_175715_157673_A60E3894 
X-CRM114-Status: GOOD (  27.27  )
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


--=-U5+3yGyg/PFkfq4Pnraa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 05 juin 2026 =C3=A0 15:32 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Don't change the quantization of an RGB format when converting between
> RGB and YUV with the RGA3. As the RGA3 only supports doing conversions
> to full range YUV with BT601, it wants to announce it through
> try_fmt/s_fmt.
>=20
> As it is only relevant, when converting between RGB and YUV, it's
> guarded by a given condition. But the condition also causes the
> RGB format quantization to be adjusted to limited range, which
> is incorrect.
>=20
> Therefore simplify the condition to only apply when the current format
> is a YUV format. Also document the reason for checking if the other
> format is an RGB format.
>=20
> Fixes: 24a63d4c9d3c ("media: rockchip: rga: add rga3 support")
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> This patch is a fix to the upcoming RGA3 support. By mistake it'll also
> adjust the RGB quantization instead of only adjusting the quantization
> of the YUV formats. Therefore remove the incorrect conditions and
> document why we also check the format of the other side.
>=20
> I've just noticed this flawed condition and didn't check/reproduce it in
> a practical scenario.
>=20
> =C2=A0=C2=A0=C2=A0 v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
> =C2=A0=C2=A0=C2=A0 ....
> =C2=A0=C2=A0=C2=A0=C2=A0	Card type=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : rga3
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 Total for rockchip-rga device /dev/video0: 48, Succeed=
ed: 48, Failed: 0, Warnings: 0
>=20
> =C2=A0=C2=A0=C2=A0 v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0=C2=A0	Card type=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : rga2
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 Total for rockchip-rga device /dev/video1: 48, Succeed=
ed: 48, Failed: 0, Warnings: 0
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.c | 12 ++++++++----
> =C2=A01 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.c
> index ca1c268303dd4..c4a71306278ba 100644
> --- a/drivers/media/platform/rockchip/rga/rga3-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
> @@ -450,10 +450,14 @@ static void *rga3_adjust_and_map_format(struct rga_=
ctx *ctx,
> =C2=A0	other_format =3D is_output ? &ctx->out.pix : &ctx->in.pix;
> =C2=A0	other_format_info =3D v4l2_format_info(other_format->pixelformat);
> =C2=A0
> -	if ((v4l2_is_format_rgb(format_info) &&
> -	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_is_format_yuv(other_format_info)) ||
> -	=C2=A0=C2=A0=C2=A0 (v4l2_is_format_yuv(format_info) &&
> -	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_is_format_rgb(other_format_info))) {
> +	/*
> +	 * Only apply the quantization restrictions when we need to
> +	 * convert between RGB and YUV. Otherwise there is no point
> +	 * to limit the quantization for operations like scaling or
> +	 * rotations.
> +	 */
> +	if (v4l2_is_format_yuv(format_info) &&
> +	=C2=A0=C2=A0=C2=A0 v4l2_is_format_rgb(other_format_info)) {
> =C2=A0		/*
> =C2=A0		 * The RGA3 only supports BT601, BT709 and BT2020 RGB<->YUV conve=
rsions
> =C2=A0		 * Additionally BT709 and BT2020 only support limited range YUV.
>=20
> ---
> base-commit: 6a75e3d4f6428b90f398354212e3a2e0172851d6
> change-id: 20260605-spu-fixrga3quantization-061c761a1d80
>=20
> Best regards,
> --=C2=A0=20
> Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20

--=-U5+3yGyg/PFkfq4Pnraa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgsYgAKCRDZQZRRKWBy
9OkIAQDuCasCEJk0CphEcAaQPA3GXoNSFdqaKd4FLtrQf1ZxWwEAn/tLHAo7eJO3
SimYY8iNZqub9/LnkkGXUBrKRzNkIwE=
=6NwO
-----END PGP SIGNATURE-----

--=-U5+3yGyg/PFkfq4Pnraa--

