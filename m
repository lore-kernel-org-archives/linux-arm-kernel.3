Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A969CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFYs9CF2krLOKV1+Ib/ZV5GYYaYEcVMj0+s+Jrj0azU=; b=tK2FCp7k6M8lTwTWluJvQ2k0p5
	lUZ6g2s1R2ESBNuN+S6942BjD4oMdYWUA9v6yEljwNYZWJOft5v9iUx5LrrbHmiW1CkIFJsLFHUIv
	HbpZDsZGBRa9nyF9digdtFKnQ797GThQsaB2Kw5N6cclHwDXl92VKy8fTlloz4Vh7AIKM73tIljuK
	cP5J6ij+sc+3L1UKVYPDepeuD+tvZxyHY5mBN56hf63QTP34pygFWRBY/rPO0O/wwla5soeQxGHdH
	zNSqgIovhCwBvELtzyOowUhTVUunk6lHdrwDAmgsZB8xxeonBnYfq9YIv0i+FmY3cMu4n1nN0+Ipn
	4ObJCbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7Bk-00000007Jdi-1Vf0;
	Thu, 06 Feb 2025 19:05:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6YR-00000007Aza-0LYB;
	Thu, 06 Feb 2025 18:24:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55640A4440F;
	Thu,  6 Feb 2025 18:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9C7C4CEDD;
	Thu,  6 Feb 2025 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738866286;
	bh=53zJkpFR18b9Ggt/TwIC2xs8XPYRRBAHjr15GY57Wrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EchApnR6LI/AE9zaSEU0xrSO5CJrAIwdYiOYs3nEpROrfkzXVB23aqPS6Tiurf2bl
	 g9FM3C3yDhm8aRh825IAWU+FFnqD90dBqy6sjjWjYWL7BQW6LttgflCdt+oKxa8F1d
	 iSwrD5Z/uxSNpyTw2xFkoLESoir/Z8KjKUeFmriKF7Hqm/63Hwx60SnBoNfMoMnO+3
	 deCndpmR70QViPcvDbgf2IwGciFQ1GcNeHv7mOYXfQZ9D8zWzeew1Pw3cL9OzlGS8V
	 F6wbqCbigrDRVxLTWsZp/x4swPMvR6NOIdWT3lyblAK2/a1uWB3baigFDYYfa2TEsv
	 e3l5RDUubNQjA==
Date: Thu, 6 Feb 2025 18:24:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 09/13] dt-bindings: net: airoha: Add airoha,npu
 phandle property
Message-ID: <20250206-charbroil-armhole-078069994058@spud>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
 <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
 <20250205-cleaver-evaluator-648c8f0b99bb@spud>
 <Z6O8-dUrLNmvnW1u@lore-desk>
 <20250205-disagree-motive-517efca2b90c@spud>
 <Z6PPfnYV57NmWV6N@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2K4ihKtAKq5vhnGT"
Content-Disposition: inline
In-Reply-To: <Z6PPfnYV57NmWV6N@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_102447_255999_524A5D1A 
X-CRM114-Status: GOOD (  30.67  )
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


--2K4ihKtAKq5vhnGT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 09:52:14PM +0100, Lorenzo Bianconi wrote:
> > On Wed, Feb 05, 2025 at 08:33:13PM +0100, Lorenzo Bianconi wrote:
> > > > On Wed, Feb 05, 2025 at 07:21:28PM +0100, Lorenzo Bianconi wrote:
> > > > > Introduce the airoha,npu property for the npu syscon node availab=
le on
> > > > > EN7581 SoC. The airoha Network Processor Unit (NPU) is used to of=
fload
> > > > > network traffic forwarded between Packet Switch Engine (PSE) port=
s.
> > > > >=20
> > > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml | 8=
 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-=
eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > > index c578637c5826db4bf470a4d01ac6f3133976ae1a..6388afff64e990a20=
230b0c4e58534aa61f984da 100644
> > > > > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > > @@ -63,6 +63,12 @@ properties:
> > > > >    "#size-cells":
> > > > >      const: 0
> > > > > =20
> > > > > +  airoha,npu:
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > +    description:
> > > > > +      Phandle to the syscon node used to configure the NPU module
> > > > > +      used for traffic offloading.
> > > >=20
> > > > Why do you need a phandle for this, instead of a lookup by compatib=
le?
> > > > Do you have multiple instances of this ethernet controller on the
> > > > device, that each need to look up a different npu?
> > >=20
> > > actually not, but looking up via the compatible string has been naked=
 by
> > > Krzysztof on a different series [0].
> >=20
> > Hmm, I disagree with adding phandles that are not needed. I don't agree
> > that there's no reuse, if you can treat the phandle identically on a new
> > device, in all likelihood, that node should have a fallback to the
> > existing one.
>=20
> honestly I do not have a strong opinion about it, I am fine both ways.
>=20
> >=20
> > That said, the bigger problem in what you link is the ABI break caused =
by
> > requiring the presence of a new node. I'd NAK that patch too.
>=20
> there is no PCIe support in dts for this device upstream yet, so I guess =
there
> is no ABI break, right?

The binding and driver are upstream and therefore there could be users.
Whether or not the dts is upstream isn't what determines ABI break or not!
If the thing worked before adding the syscon in the PCIe patch you'd linked,
the syscon should remain optional - unless there really are no users
that will be impacted. If it didn't work without the syscon, then I
wonder why it was upstreamed like that at all.

--2K4ihKtAKq5vhnGT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6T+aAAKCRB4tDGHoIJi
0q4aAQDZ7TcfNn+m4kHVpqE+dO6WwwXPFBYx5ZPAIVaG70FGqwD+L/yuigkFs46b
+PUbXOf0VcC8ooyHGLrQiOQ+p3oOSgA=
=l89c
-----END PGP SIGNATURE-----

--2K4ihKtAKq5vhnGT--

