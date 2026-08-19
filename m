Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49375C5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsPwfGfYCx9rcO+FEBE8OEei2rIOlpeF10Irz6cXO9A=; b=f4jJ0l+PcTOIwkXel8Yt14wjto
	dvmm/vtKZdo9ys33bMq5AwRghcgMgP9mpzKcAFf6FC3zLiZb6zku+MB21QWTfOQ8eYIuqCisHUl3p
	C8KlLdcMGUbRxzZWvMtW5yG34mJpZKjUI/LrruUCVKFFBoyzA8Ytj/Kc0W4eW5Lht1zbFOrWLHGM/
	5Dyagy0UwkaiKP7ff1l+sXZ/TrmiiYAuP4toqm9ng3C8TYb7NjcjbSCsr8GPU27EG9eXUf5gvKOws
	ERtq6DvU3kuhcerxWKSBcgDjfcteSzG7E/At0UP6hxokr4X6FCaE2J4RxJ9AhA17DvCUMIKraU/3q
	pcZfBqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhrO-0000000A2nI-2b3S;
	Wed, 19 Aug 2026 15:05:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhrL-0000000A2mu-3KNV;
	Wed, 19 Aug 2026 15:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787151939;
	bh=ZOI+W6oA/uAi32MTH/0/AbBQ8UTI/tV8YYpxIRduY98=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ooh4O4nnoS1GXQvarlxiNA7WIlnZgxkLdtnUfrl+ZIw4UZy8ON2JPAULUqn6glymV
	 TEYU4unh5Cc2IMADNY237oj8DvJF9Hf4tCTVa7vxKQfRINYeqorsHt6krRZH9EU6Fm
	 s6lHo8w0qteJ9R6d/YaycRc85DID+Z0N/SR23csjhtyO0HfJBKnSpHSKYDjNM5a5LZ
	 7iszudSMqSvCpRuNpe/leqIEAWFrE/hdO0T0/MuOWy5zh7GlklDoPoHMWTwm0WXpPY
	 dqkivmrgfcqdmQm4DZ8GhHEtvT4otsHUivKlsBJisFoGpuB5MVHt3le6zX6bL2X8eF
	 Ie3SXFdLuyg8A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E329617E0824;
	Wed, 19 Aug 2026 17:05:36 +0200 (CEST)
Message-ID: <ea57db621f1267c1cd3079cebed543180d82ed95.camel@collabora.com>
Subject: Re: [PATCH 1/7] media: verisilicon: Fix the cleanup when a codec
 ->run() fails
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,  Hans Verkuil
 <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Sinn	 <lucas.sinn@wolfvision.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Date: Wed, 19 Aug 2026 11:05:35 -0400
In-Reply-To: <20260819-rk3588-jpegdec-v1-1-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
	 <20260819-rk3588-jpegdec-v1-1-33d74cdf369c@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-jClPjoRyYChhJM6d5vWN"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_080543_989749_AC3E939E 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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


--=-jClPjoRyYChhJM6d5vWN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sascha,

Le mercredi 19 ao=C3=BBt 2026 =C3=A0 12:37 +0200, Sascha Hauer a =C3=A9crit=
=C2=A0:
> =C2=A0	ret =3D start_prepare_run(ctx, &decode_params);
> =C2=A0	if (ret) {
> -		hantro_end_prepare_run(ctx);
> +		hantro_end_prepare_run(ctx, ret);

Since its already in an if (ret) branch, and for code readability, can you =
use
hantro_abort_prepare_run(ctx) instead and leave all other sucessful calls a=
s-is.

Nicolas

--=-jClPjoRyYChhJM6d5vWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaoXGPwAKCRDZQZRRKWBy
9J96AP4pVbuljONCTasFDnqGz3LRJHuAwLr5VErmMrO2wrsqrwEAzhFgMDQ9TSeS
/dfy+t87UYjwpZwgjpWq+Cp2ewMU1wo=
=KCQs
-----END PGP SIGNATURE-----

--=-jClPjoRyYChhJM6d5vWN--

