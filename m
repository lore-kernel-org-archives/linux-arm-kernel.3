Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEC1C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyNqE7JyafZ8qHZu8yrzPJ6UuI9o22K67HXsQlZvY0k=; b=ZhT4VHn61H7xvzX01vPzI1TzzY
	rBftuf1C8kVF7Xo0P8bH5aauul+ACh6KIeMospjYAb3fv7j1qxC6681llUBg/QTcl3b6AIatuojJQ
	kgAx00yZAxKQ/cfYENzTsfVtB3ezn0hlT2ns6VdCWBGuV3d5U3P8HjyJcIPAlnJ02JgWKwprGzLoB
	nTbeEyQ6v9jYshMKWcG9tI5kxSrPzzOlf3edKIFBQiaXDQnLNZbtmLdOwdNpmGvriR7UCCyv6E6J4
	GpY4SwfJaPiPS5cRhOQ4ng8tLcNejpLrINmbggcljB2mo6nirQZKXJWRU/6R6XTN7RW0AWlrc1eRD
	ITwTJpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWja-0000000AB6E-2V9K;
	Mon, 12 May 2025 17:14:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVub-0000000A157-0aC0;
	Mon, 12 May 2025 16:21:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B9DC5C0648;
	Mon, 12 May 2025 16:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3D0C4CEE7;
	Mon, 12 May 2025 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747066912;
	bh=Cw16mLp8GBEQCcOKwuFSOtn+PoZCJYu4QwEC/5THH6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjWDW5ipMKXBnBTQnDL//oE57mzcvjgoU1Ton8qgojjwFyPxcD/zG/sLf/+qoX0WA
	 onl7eoXYzFz98ul7cCauOz3vwSqHsjTMNXxy4MHoHFByrilbQ4G9jTZ/dSzd5XRBlq
	 JoPfIQU7+w81uzvYu3dFmIRKPmCaTWTq9D31Lnn704gy42p4Ipyte1Djh82MKghM+d
	 lJri9FOcBdfu27jie/UdYAgPVIehCS1Pmqyq5mrNMpXxxVOcM8CBzesTbQcOolL+JT
	 /aI2JhND0tKPf20Mk8yLGONCN8t52y6fENYrsyoMvnIGT34Ki8SDew58BKGAfMIC7E
	 P+tql2ye6ipcQ==
Date: Mon, 12 May 2025 17:21:45 +0100
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
Message-ID: <20250512-nibble-freemason-69e0279f2f99@spud>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BeH6zc2zJClOlCJ9"
Content-Disposition: inline
In-Reply-To: <20250511141942.10284-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_092153_268707_F238FD59 
X-CRM114-Status: GOOD (  16.54  )
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


--BeH6zc2zJClOlCJ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 04:19:17PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Update binding for mt7988 which has 3 gmac and 2 reg items.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Do=
cumentation/devicetree/bindings/net/mediatek,net.yaml
> index 9e02fd80af83..5d249da02c3a 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -28,7 +28,8 @@ properties:
>        - ralink,rt5350-eth
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

This should become an items list, with an explanation of what each of
the reg items represents.

> =20
>    clocks:
>      minItems: 2
> @@ -381,8 +382,12 @@ allOf:
>              - const: xgp2
>              - const: xgp3
> =20
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +
>  patternProperties:
> -  "^mac@[0-1]$":
> +  "^mac@[0-2]$":
>      type: object
>      unevaluatedProperties: false
>      allOf:
> --=20
> 2.43.0
>=20

--BeH6zc2zJClOlCJ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIgGQAKCRB4tDGHoIJi
0kdJAQD7lUldL2lyECoq6kz6Xgzpc9L4CU21TH0X3mhKWLc3KAEAkBFq4G5y02M6
M2qDeF8a2MAP3H9Vr3AIiT3T4ZG04gg=
=Vo8k
-----END PGP SIGNATURE-----

--BeH6zc2zJClOlCJ9--

