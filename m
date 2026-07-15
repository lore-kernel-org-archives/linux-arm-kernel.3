Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA58FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 22:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmgWqTsfYK/tjmYPG4Fq7soUO4p1K1bnG54UUC51j94=; b=hXLZGtT0S+Ox2NNsqg7ib8ASFV
	M7oRXzxIUxxC/OyhhSGfi3V2k3m9axYgM8ZgcRq7MT2ImjpP+ESLmoGxIyuFoqSgkYuXvg+Wg/IRU
	l05+hvdWSM9wsi4POAjWeWRzEjrU16MYvROThzoIeZ6uZrHt81AlooGpK2d477v6aZ6oQ4MYwosNw
	rGQvrjGt38F70Dy2G3XiRYcfXCyWdFe3hXwenMsCAeLZo/m7bviUoNBUv7Yq9EOl9x+KSKEqW+KR9
	lVJuXFfpqUzgk6hCPOXiBGoxBweQSXrFhMDoLVzr8ks4sNPbZ0Zx9bu4zrny8Ed9JdS0+EE5ieXXh
	jEis/MNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk8M6-0000000G2sE-0vHy;
	Wed, 15 Jul 2026 22:45:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk8M3-0000000G2rY-0gbH;
	Wed, 15 Jul 2026 22:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784155523;
	bh=26FjX/e7xnbplCk23y9PjT+woZZKEcAuRBoakCUskuA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=U66iHuhoUjmJcChJLk3hwHFQw9zRgTFq+K7FGRAP8Dxb77tznedEUb2SjEXqj9c4p
	 LDXBZqKaGjkAwEDjYOXP0c2QP6UNgT0xVtaWxwDWwyQQpdR/qTtNPmq7QvOi3swmlM
	 ZOHUwoq/CIC0V5v9E0g/ck0vNX9mZ+9fAm58FbmmS25BBFVxTvJfyZVlJd/pzxl/Ka
	 KoE6SFVtGeoqcSwynFQ4GcokCbi7uzHq9uNXnsW7d3Y7J47fMcqzzjNlE4bwPxCQne
	 y+CaqXXMo8CsLwnEMEFgpS30DJz0bvG9oWVHYA8BdKAjeGtWh8eLvrb3pg5H+9YOCm
	 K/ysBXrWYX3UQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A9AC17E07A2;
	Thu, 16 Jul 2026 00:45:22 +0200 (CEST)
Message-ID: <8c5be57e8fcc088f8041bf64068575b6bb0d7fcb.camel@collabora.com>
Subject: Re: [PATCH v2 3/3] media: rkvdec: hevc: guard
 INTER_REF_PIC_SET_PRED index underflow
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Bommarito <michael.bommarito@gmail.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Wed, 15 Jul 2026 18:45:21 -0400
In-Reply-To: <20260527194737.1999409-4-michael.bommarito@gmail.com>
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
	 <20260527194737.1999409-1-michael.bommarito@gmail.com>
	 <20260527194737.1999409-4-michael.bommarito@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-I8pg+O55ZQp1VWGZyCYM"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_154528_003384_A42B40F2 
X-CRM114-Status: GOOD (  16.15  )
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


--=-I8pg+O55ZQp1VWGZyCYM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 27 mai 2026 =C3=A0 15:47 -0400, Michael Bommarito a =C3=A9crit=
=C2=A0:
> st_ref_pic_set_prediction() computes the reference RPS index as
> st_rps_idx - (delta_idx_minus1 + 1) per HEVC spec equation 7-59.
> Both operands are u8, so when delta_idx_minus1 + 1 exceeds the
> current index the subtraction wraps and the subsequent array access
> at calculated_rps_st_sets[ref_rps_idx] reads far out of bounds.
>=20
> A userspace V4L2 client that can open the RKVDEC m2m decoder can
> submit an EXT_SPS_ST_RPS control with INTER_REF_PIC_SET_PRED set
> and delta_idx_minus1 crafted to trigger the underflow.
>=20
> Reject the entry early when the reference index would underflow.
>=20
> Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 var=
iant")
> Cc: stable@vger.kernel.org
> Suggested-by: Detlev Casanova <detlev.casanova@collabora.com>
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> index 3119f3bc9f98b..898d1ce74f38a 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -268,6 +268,9 @@ static void st_ref_pic_set_prediction(struct rkvdec_h=
evc_run *run, int idx,
> =C2=A0	int i, j;
> =C2=A0	int dPoc;
> =C2=A0
> +	if ((unsigned int)rps_data->delta_idx_minus1 + 1 > idx)
> +		return;
> +
> =C2=A0	ref_rps_idx =3D st_rps_idx - (rps_data->delta_idx_minus1 + 1); /* =
7-59 */
> =C2=A0	delta_rps =3D (1 - 2 * rps_data->delta_rps_sign) *
> =C2=A0		=C2=A0=C2=A0 (rps_data->abs_delta_rps_minus1 + 1); /* 7-60 */

--=-I8pg+O55ZQp1VWGZyCYM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgNgQAKCRDZQZRRKWBy
9GIcAP9N/ju7zuDAju1GJU3D1q50WHfd8e3K6bwTwIhCQCezRQEA/WKm8VkQAkIJ
FGLTRoEbQCWgEcGsVv8X5CJPPWkRVAU=
=01gk
-----END PGP SIGNATURE-----

--=-I8pg+O55ZQp1VWGZyCYM--

