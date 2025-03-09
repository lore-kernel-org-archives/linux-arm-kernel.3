Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ECDC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 21:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEHqnFFPGOtZDYCXmFfRdj+VMlzCOmjRhnGLeYoAHkA=; b=Ec/6sxJroJ3r/DhGYYEVEvzmyA
	xyNWk4zVpAei0D/ieIm4v4bBxF/8tsJ6zyg/Ch8BIl7UVaCsuXvH0Cq1oI7hU3AMmXGkuFLhvJzhY
	mHjMEfOO7nzyUEhdQtrnQxvPXh20ObsmnWv7vxt6zKrTVHLS3mCHe/2LTcKeDvIGU62yoL4XsO9+b
	e/ySRFrZMe+Ga1pAM8PV6CkDTnaPBVVDkWtlZWhLnZbwzYvp1BFkWnWNnUWKpcv+i1M/SZWagmiuQ
	VSuRQPjsfrUvXt+5QT7usIuf8ioPhv+vt4QmoBkeR/tQDTjwX/qWU8tpGT0YzEtbaZuxMg/BSAjSR
	4Fj7dp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trO3X-00000001ANP-1f4h;
	Sun, 09 Mar 2025 21:19:31 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trO1u-00000001AHV-3Bun;
	Sun, 09 Mar 2025 21:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741555057; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TL+le3Fjjl1o4ZHF9iog5whT86KEGyTlV+8Xk5gwUd7Q55AweYktohMQxsXou2Ry5qbuhLD6lHvfVhIAXy+Us5dHhyGXvQcW+YOJdeWP8t66tDR7XiWONEHZI+d/jwvRfQOp+IpEyeBHN7WtC/m0lV6aKwVimkf0iSXjmT9pgeY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741555057; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FEHqnFFPGOtZDYCXmFfRdj+VMlzCOmjRhnGLeYoAHkA=; 
	b=HpfqP6iWN8sIOokjz7ipFBUSczQiH/dRDsJu2QNlGteqs0WyMFLMEsnBRBksIsT3oDDIk3kPe2krtPrEAMNx+E4h7LGIGfKjYb2CuWDEkwpJs+EPouoOBjjQgVbr1aTADkAL9yfSR6jKnV9BXYSTx77BPguofmKGLT92C+zEH1c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741555057;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=FEHqnFFPGOtZDYCXmFfRdj+VMlzCOmjRhnGLeYoAHkA=;
	b=cExVH6efvz0/jHzn3PRYqBAlIf7GljmOjGbtiMf1ycGEypHmLDIixUuzvw5B56iL
	Qg/FH5nfS0RnpY++bLVhpAgwp6o950rneXUbiEXX9n/dq0U/JkvkNphwVA9++Nd5ncm
	sZfXoAZxvFlmN4wAPGrTK7Ij9GJQj4/Q0FlE1RSM=
Received: by mx.zohomail.com with SMTPS id 1741555055557728.5348605229481;
	Sun, 9 Mar 2025 14:17:35 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id F36F7180073; Sun, 09 Mar 2025 22:17:29 +0100 (CET)
Date: Sun, 9 Mar 2025 22:17:29 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] net: stmmac: dwmac-rk: Validate GRF and
 peripheral GRF during probe
Message-ID: <n6frqyzi2rn3sbzmmerq5ennoo6dn2husrtw3qzbtummpjutc7@2bu2753xrb7a>
References: <20250308213720.2517944-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5zfvhkwd55d7y42"
Content-Disposition: inline
In-Reply-To: <20250308213720.2517944-1-jonas@kwiboo.se>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/241.192.19
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_141750_848603_ACFFAA4B 
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


--b5zfvhkwd55d7y42
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/3] net: stmmac: dwmac-rk: Validate GRF and
 peripheral GRF during probe
MIME-Version: 1.0

Hi,

On Sat, Mar 08, 2025 at 09:37:12PM +0000, Jonas Karlman wrote:
> All Rockchip GMAC variants typically write to GRF regs to control e.g.
> interface mode, speed and MAC rx/tx delay. Newer SoCs such as RK3576 and
> RK3588 use a mix of GRF and peripheral GRF regs. These syscon regmaps is
> located with help of a rockchip,grf and rockchip,php-grf phandle.
>=20
> However, validating the rockchip,grf and rockchip,php-grf syscon regmap
> is deferred until e.g. interface mode or speed is configured.
>=20
> This series change to validate the GRF and peripheral GRF syscon regmap
> at probe time to help simplify the SoC specific operations.
>=20
> This should not introduce any backward compatibility issues as all
> GMAC nodes have been added together with a rockchip,grf phandle (and
> rockchip,php-grf where required) in their initial commit.
>=20
> Changes in v2:
> - Split removal of the IS_ERR() check in each SoC specific operation to
>   a separate patch
> - Disable rockchip,php-grf in schema for GMAC not requiring it
> - Add a php_grf_required flag to indicate when peripheral GRF is
>   required
> - Only lookup rockchip,php-grf phandle when php_grf_required is true
> - Use ERR_CAST() instead of ERR_PTR()
>=20
> Jonas Karlman (3):
>   dt-bindings: net: rockchip-dwmac: Require rockchip,grf and
>     rockchip,php-grf
>   net: stmmac: dwmac-rk: Validate GRF and peripheral GRF during probe
>   net: stmmac: dwmac-rk: Remove unneeded GRF and peripheral GRF checks
>=20
>  .../bindings/net/rockchip-dwmac.yaml          |  21 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 270 ++----------------
>  2 files changed, 37 insertions(+), 254 deletions(-)

The series is

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--b5zfvhkwd55d7y42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfOBWIACgkQ2O7X88g7
+ppXPQ//QTO5/6yllSRnNLdmY8b6+WI244U8KRooF4JYZwUq1OFC/ZlozoNaZrOG
aqJpTCkevGsaUstJ0sBrLrn/rr+lxkTLn39v7LSLNCEupLM1QikVRQYn7lgLB6rK
eDgSMEAXAUwux/v3D/wX/470LwLAWnffXX5wDxha7183La0P6JgL2Ue8TC6jyU25
ULQ4IoCPlGME4z472RngSBuN/g0zZDajgmCBNiRYaCIya07pPOtT/PrVNEYfQ9CS
oa0t1M/jPDS3VvsJMOmwzxOtiOD9VJxS90xLpphqUei4dyWFu/7aV7GaXEhm9UYb
/HCeOEBFuXcsNvZitv0oSsQBpbzUKwiS5zKxZFpRyiEMbRuyMLHwajpwdGaHI4Ji
3iXll3AjBTh+Rc8kEBlzXkcdCJlznz9FGBSkwCWYCSQXm8MuCZ7+cc8rBNgEowbG
h8mUntbIWKHcIYOjYGDOppdLXsK1D3qxP5GO1t/0cNEqZhWdGeRtK2l2gK4faH7K
92dtEtDzLzSe/9Awg3txooKrizcuo6L6bl6eopu8bzTNjLPsLAmFtr/vsQBbFVet
tfJBYiQD7WkYdYpB0NiSIE1w7y6H/YIvjhhqI5yuUBoYVtnzrY4EWt6nHtU1XAl1
OAQMUaQAf2IIvxGFYDmVtG8bm7rSsLw6RYvmQMluvoviGPs6meY=
=Fj91
-----END PGP SIGNATURE-----

--b5zfvhkwd55d7y42--

