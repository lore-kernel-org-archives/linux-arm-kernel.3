Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E95CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf4jeYc3U4bONNuXU0BsbSC15btun+iYy7Ddwdfj74U=; b=njpw9jdCaVSj3lRz8rxkjXSA6x
	iInzrKXM9MRO3GBjp4DL0EOYY5FY02JvV4vJ0QdkV0v5ac+JWwRX35Wx/9cUYHL7FaI+p2HwdqcUA
	gQkYqweXDU0I3uVZmdua0j4LpVo/oPVgTqUF1mi2HO0CGnRrF0JD9rmAS9HcDJiVFaWUMSEmnX32G
	shFd23m9TU0kWfTTqX0iXEs3mNYcxKvuQPXWsbEDUNIFtjDaq+unMGV6cN7yuULyXXjBgab/KaWDO
	/O9IbJPxA/Z4KnHNadzNv66eTsuwYI8CrvkU7hESuRscQLXyh81ci2hiDjBcrj9NdL0h9vQi7xcAw
	Op9K36/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PtY-00000005Bi1-2OXu;
	Thu, 16 Oct 2025 15:28:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PtW-00000005BhC-0tsJ;
	Thu, 16 Oct 2025 15:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DAFC416AE;
	Thu, 16 Oct 2025 15:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8377EC4CEF1;
	Thu, 16 Oct 2025 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760628477;
	bh=OkslPl/BfgU+xJGaHNwPTb7HL57jgw9At+2ouWVRKQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/6ZxPhY+IJgaqAqHS4IHGqJR8EHzqAgmlKKH3OmylShBjDYAJC4YOdSX1W7nPSer
	 /YpcYNlThilc8xv3hD/XhYJE3PvzUVLFCqpNa61XTEESU38234B4gpuxx1Gn3RJqtB
	 md44x2aLYUv0QTarqnJ+62MALgYpoUwrJj8KopDSfUAbohnEMW0RSNeYCQAW+iITS3
	 1NPp00+ffS7+z0VfCASHpzLz9wX5iuT28sKloVVoE+/mKtio5HLphfvVj6Vrim2OzA
	 t2msJry2Zyz8pu3cdiPw5Wg2jOBDOdBhzxsXXid8xF7qMcI5ev3MADZ6h59X7Izx6B
	 6m2XKt2uVkSxA==
Date: Thu, 16 Oct 2025 16:27:49 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sjoerd Simons <sjoerd@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: Re: [PATCH 09/15] dt-bindings: net: mediatek,net: Correct bindings
 for MT7981
Message-ID: <20251016-squealer-neurology-5bf32360e5bf@spud>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-9-de259719b6f2@collabora.com>
 <a3d6b229-8f33-4e88-8a55-6c5640f688e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KThuiYHY98QAsVsP"
Content-Disposition: inline
In-Reply-To: <a3d6b229-8f33-4e88-8a55-6c5640f688e1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_082758_319025_EEF7E5AA 
X-CRM114-Status: GOOD (  19.42  )
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


--KThuiYHY98QAsVsP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 01:29:01PM +0200, AngeloGioacchino Del Regno wrote:
> Il 16/10/25 12:08, Sjoerd Simons ha scritto:
> > Different SoCs have different numbers of Wireless Ethernet
> > Dispatch (WED) units:
> > - MT7981: Has 1 WED unit
> > - MT7986: Has 2 WED units
> > - MT7988: Has 2 WED units
> >=20
> > Update the binding to reflect these hardware differences. The MT7981
> > also uses infracfg for PHY switching, so allow that property.
> >=20
> > Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> > ---
> >   Documentation/devicetree/bindings/net/mediatek,net.yaml | 16 ++++++++=
+++++---
> >   1 file changed, 13 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/=
Documentation/devicetree/bindings/net/mediatek,net.yaml
> > index b45f67f92e80d..453e6bb34094a 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> > @@ -112,7 +112,7 @@ properties:
> >     mediatek,wed:
> >       $ref: /schemas/types.yaml#/definitions/phandle-array
> > -    minItems: 2
> > +    minItems: 1
>=20
> If minItems is 1 here
>=20
> >       maxItems: 2
> >       items:
> >         maxItems: 1
> > @@ -338,12 +338,14 @@ allOf:
> >               - const: netsys0
> >               - const: netsys1
> > -        mediatek,infracfg: false
> > -
> >           mediatek,sgmiisys:
> >             minItems: 2
> >             maxItems: 2
> > +        mediatek,wed:
> > +          minItems: 1
>=20
> You just need maxItems here.
>=20
> > +          maxItems: 1
> > +
> >     - if:
> >         properties:
> >           compatible:
> > @@ -385,6 +387,10 @@ allOf:
> >             minItems: 2
> >             maxItems: 2
> > +        mediatek,wed:
> > +          minItems: 2
> > +          maxItems: 2
> > +
> >     - if:
> >         properties:
> >           compatible:
> > @@ -429,6 +435,10 @@ allOf:
> >               - const: xgp2
> >               - const: xgp3
> > +        mediatek,wed:
> > +          minItems: 2
> > +          maxItems: 2
>=20
> Analogously, you should be needing just minItems here if I'm not wrong.

Yeah, you don't need to duplicate constraints that are copies of the
outermost one set in the definition. I dunno how it is actually done by
the schema tools, but I like to think of it that every constraint that's
possible is applied at the same time.

pw-bot: changes-requested

>=20
> Cheers,
> Angelo
>=20
> > +
> >   patternProperties:
> >     "^mac@[0-2]$":
> >       type: object
> >=20
>=20
>=20

--KThuiYHY98QAsVsP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEO9QAKCRB4tDGHoIJi
0hB8AP0WbwLBXfaFxwsMo5BvlMRztESdk8TuK8HVUS2Q6TWmTgD/WTWk4/gsETsu
K0xG+ZNiHz8uOyLf4AObjEBnftGY1gA=
=Hk7g
-----END PGP SIGNATURE-----

--KThuiYHY98QAsVsP--

