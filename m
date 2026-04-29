Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16073CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 18:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy3/mquAbKfiH3F5S1yRVxXbCoAXZ5AsFyUnVlVXhbU=; b=4Q0yfxAdkq+QZpY6nZxp5jFLyb
	WraerI9k3wZXA2i/ocHPtZk7NqTGHjNkmMuW0I8kAPZk1elpGa4f0agTU6RSb9S1oB4Stk+s5X5sQ
	+FkwzIhGrrIc4rlzV1RW6Hp79XgvpwCW4PI1CRHozSx+6n7mtgKauR60w2wk7rY/DAW5oivsszQml
	bpOeLYTdtN40RhIpkdbFlhvonpfMUnRu0zzowte1V022LhDrPNl8lomRNGi3/j1cIwTg31CcdD+Fg
	QCKc0yczHwwzfVMvMnX2u9LcrEuc6oF3nmgkZlVzYhJcR2hRd2Q1yPjA8EzOnh0pHJ8ZVlAtb9Ya/
	2/WUGoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9To-000000043hH-2HR1;
	Wed, 29 Apr 2026 18:17:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9Tm-000000043gt-2FMD;
	Wed, 29 Apr 2026 18:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777486662;
	bh=f3X2sCykS3XjkcDUPz13DMo3K1nn3Ll6Ytr0HV222vA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BzqUK7q/gl2Kb0JE88v3rX78GCbNczyUnEhAYIv+P5Z8H9J5IczADQUAMJY7FSaJi
	 qj8n8X89wkD1w6YnX+ct+flH/M7o9uVofUM+Wr4Izwl+rVsi+vr/ls3gMDDsTdN43a
	 /u16p4sFIeb1gsC+Pxap0+sf1wCrZyR/wuBD97/S3nRkYwCu14a7InTxZenyeFm6v4
	 lIzAC3C0CEzywaNkacylIKxsc94aKFyHRGGiyurEg6w5qRiOfayUUpjW45XgKvqAaK
	 0VjtjRQXcMfD0PUWj0oesqwM00dJIhD/u8GBaJ26MPTZiBR8jul+t9v7ssSoQzijLg
	 gTR73FqJv8NHA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F07C17E05FC;
	Wed, 29 Apr 2026 20:17:41 +0200 (CEST)
Message-ID: <40b8ba9bd3ca1926d8550b9345a21851cbbb61ba.camel@collabora.com>
Subject: Re: [PATCH v3 1/4] media: rkvdec: Introduce a global bitwriter
 helper
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers	 <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, kernel@collabora.com
Date: Wed, 29 Apr 2026 14:17:40 -0400
In-Reply-To: <20260402-rkvdec-use-bitwriter-v3-1-2072474ceaf4@collabora.com>
References: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
	 <20260402-rkvdec-use-bitwriter-v3-1-2072474ceaf4@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-ojEsNyi3XYjWjFdaxKBG"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_111746_868985_ECF447E6 
X-CRM114-Status: GOOD (  21.27  )
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


--=-ojEsNyi3XYjWjFdaxKBG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 avril 2026 =C3=A0 10:06 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> The use of structures with bitfields is good when the values are
> somewhat aligned.
> More mis-alignement means that compilers need to do more gymanstics
                                                           gymnastics
> to edit the fields values.
>=20
> Some cases have been reported with CLang on specific architectures
> like armhf and hexagon, where the compiler would allocate a bigger
> local stack than needed or even completely freeze during compilation.
>=20
> Some fixes have been provided to ease the issues, but the real fix
> here is to use a bitwriter instead of heavily unaligned bitfields.
>=20
> This is a preparation commit to provide a global bitwriter interface
> for the whole driver.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-bitwriter.h=C2=A0=C2=A0=C2=A0 |=
 39 ++++++++++++++++++++++
> =C2=A01 file changed, 39 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h b/=
drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
> new file mode 100644
> index 000000000000..2a5c271ade91
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Video Decoder bit writer
> + *
> + * Copyright (C) 2026 Collabora, Ltd.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Detlev Casanova <detlev.casanova@collab=
ora.com>
> + * Copyright (C) 2019 Collabora, Ltd.
> + *	Boris Brezillon <boris.brezillon@collabora.com>

nit: indent it the same for for your name.

I will do the edits if I find now other issues=C2=A0in the series.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> + */
> +
> +#ifndef RKVDEC_BIT_WRITER_H_
> +#define RKVDEC_BIT_WRITER_H_
> +
> +#include <linux/types.h>
> +#include <linux/bits.h>
> +
> +struct rkvdec_bw_field {
> +	u16 offset;
> +	u8 len;
> +};
> +
> +#define BW_FIELD(_offset, _len) ((struct rkvdec_bw_field){ _offset, _len=
 })
> +
> +static inline void rkvdec_set_bw_field(u32 *buf, struct rkvdec_bw_field =
field, u32 value)
> +{
> +	u8 bit =3D field.offset % 32;
> +	u16 word =3D field.offset / 32;
> +	u64 mask =3D GENMASK_ULL(bit + field.len - 1, bit);
> +	u64 val =3D ((u64)value << bit) & mask;
> +
> +	buf[word] &=3D ~mask;
> +	buf[word] |=3D val;
> +	if (bit + field.len > 32) {
> +		buf[word + 1] &=3D ~(mask >> 32);
> +		buf[word + 1] |=3D val >> 32;
> +	}
> +}
> +
> +#endif /* RKVDEC_BIT_WRITER_H_ */

--=-ojEsNyi3XYjWjFdaxKBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJLRAAKCRDZQZRRKWBy
9CfpAQDqF14g5OufVsa2Fpra0HvendS7U/2GaNB0mAdxpVSheQD/VHfDT4/LbugD
q9xHQ7ZBhrVCWlO17vwUUH9yJW1KegE=
=4+T8
-----END PGP SIGNATURE-----

--=-ojEsNyi3XYjWjFdaxKBG--

