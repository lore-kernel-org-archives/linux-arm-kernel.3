Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4E5C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZZilhhfR6UIIAZr6pdD8yvOdyyQhH84LHh22Ppz/fk=; b=iH1nOxOCTGoCuxNc1az2ruAgxr
	Exd/E7TFr94ctXpCI8pFMLWhV6I/41zio76he6yFMp65r9UpElfkueiVsDMcTJJ/MBbL9AIgs9uso
	F+wI89zXlzozCqAr7FyiH5oGiyRwlcI5xqxkR+rNrVEt7x92by4dRufxKjsNiUDRZVxXyGFwz0zxI
	uIKLh8RsC7J7qsQhzCeYXIyORcpIu6qCgdRFkekgGQBZAQyHwMSQZmb8P6Zy3PIaQuZjmy8yHjHus
	Wy8SOZc9MaHhqIns57diMkPN/OpRYV1vy1EZQHng8XY8eaASVrC/7Xp1JdLtSqh6iK1lNUDliOGvm
	VgR5T9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaJ2-0000000Ah0S-2VVA;
	Mon, 12 May 2025 21:03:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaH0-0000000AgmM-0WHe;
	Mon, 12 May 2025 21:01:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2B6C4A4AFE3;
	Mon, 12 May 2025 21:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D88C4CEE7;
	Mon, 12 May 2025 21:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747083676;
	bh=LKLLONeCVjQVAaNx8UdwNrH4MsosiV3gnDGhpSa48kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnnkW34rYr5Yyflxu0il8Q6hxkNKCrMwwjOkRS9FklhqXnePrp6HXUjGqvpL4XveL
	 0TQtB92rfaDcCOH9e1pk1D4ic/agrs6hwpXMPFHudeKeZfQv6yDSJqQ/pKThu+ODJl
	 +ZLPwdtj02aYTXg3oHIzEKxV4sVVl8qKceifsWcIwomKVeXCId61MWxQOtp6u4lRVv
	 CgKLLVTRCdXXttrvq7J0fBw19etyehXiK43NerTW3Pka1615TKQTSJ1dvAKD0XCPLK
	 Z5sSDHt4VOVGJ821FN9XRSa6rlwy8iN4fBlbq+MKhSamPyjSZ1KDZxsM+b72sDA1k6
	 U3GTEQA7oIZDA==
Date: Mon, 12 May 2025 22:01:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 01/14] dt-bindings: net: mediatek,net: update for
 mt7988
Message-ID: <20250512-spooky-overbuilt-abc946ba1f55@spud>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-2-linux@fw-web.de>
 <20250512-nibble-freemason-69e0279f2f99@spud>
 <05760B5E-955E-4E0E-9B69-E762783CC37B@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ihom2EqWEYhuIF8/"
Content-Disposition: inline
In-Reply-To: <05760B5E-955E-4E0E-9B69-E762783CC37B@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_140118_300004_A04AB0A7 
X-CRM114-Status: GOOD (  21.13  )
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


--ihom2EqWEYhuIF8/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 07:33:22PM +0200, Frank Wunderlich wrote:
> Am 12. Mai 2025 18:21:45 MESZ schrieb Conor Dooley <conor@kernel.org>:
> >On Sun, May 11, 2025 at 04:19:17PM +0200, Frank Wunderlich wrote:
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >>=20
> >> Update binding for mt7988 which has 3 gmac and 2 reg items.
> >>=20
> >> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >> ---
> >>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b=
/Documentation/devicetree/bindings/net/mediatek,net.yaml
> >> index 9e02fd80af83..5d249da02c3a 100644
> >> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> >> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> >> @@ -28,7 +28,8 @@ properties:
> >>        - ralink,rt5350-eth
> >> =20
> >>    reg:
> >> -    maxItems: 1
> >> +    minItems: 1
> >> +    maxItems: 2
> >
> >This should become an items list, with an explanation of what each of
> >the reg items represents.
>=20
> I would change to this
>=20
>   reg:
>     items:
>       - description: Register for accessing the MACs.
>       - description: SoC internal SRAM used for DMA operations.
>     minItems: 1
>=20
> Would this be OK this way?

Ye, that looks good.

>=20
> >> =20
> >>    clocks:
> >>      minItems: 2
> >> @@ -381,8 +382,12 @@ allOf:
> >>              - const: xgp2
> >>              - const: xgp3
> >> =20
> >> +        reg:
> >> +          minItems: 2
> >> +          maxItems: 2

You also shouldn't need to set maxItems here, since the list has 2 items
total.

> >> +
> >>  patternProperties:
> >> -  "^mac@[0-1]$":
> >> +  "^mac@[0-2]$":
> >>      type: object
> >>      unevaluatedProperties: false
> >>      allOf:
> >> --=20
> >> 2.43.0
> >>=20
>=20
> Hi Conor
>=20
> Thank you for review.
> regards Frank

--ihom2EqWEYhuIF8/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCJhlgAKCRB4tDGHoIJi
0np2AP9tRdqvR8H53faGqXax224YS7YArSQXFuynwo25eICEhgEAntebUayynsz/
+miUO3kJllRjEAYIKIHnvI4YCHk0Wws=
=8MP/
-----END PGP SIGNATURE-----

--ihom2EqWEYhuIF8/--

