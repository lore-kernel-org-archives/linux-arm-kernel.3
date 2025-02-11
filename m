Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D23C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIe3nZvsmrSNSCOnrOVapFRUk4Br/0nr0mcpvxpZTHk=; b=3wq2r/x2YU5Xzt7/zR+axPg7o5
	WwuGwgWMwRml3LhgjBvFqHlPLJkTekJWFaM5kH68q+19F2KkbUKXspEoFYTTtiBTnLeNgAt+ew3d8
	fKbB5sXzax8DJuapgGH6IMBW+szVBBzwxFtmfoV71shfTEhJUCSdrWuhOx9Xg8QmJQyW/nTLIFb9M
	oU3cmopRaw3YKIkXj5A/2NXUcU3Sw9YEUgMUU06tNj3JaSrsOWh6/3PnBWMHvIu27Ow+0k5EsGsrE
	ZPdXFeyqjvXIJRlBPFCVFLoAgKtBSJtJuDbHgINb66t6XzaNOOAg597qs4EOxgnq+oV4IIdHk889A
	r+09sViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtVv-00000004ajH-0Ll7;
	Tue, 11 Feb 2025 16:53:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thtBu-00000004Wsn-2mRQ;
	Tue, 11 Feb 2025 16:32:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 809295C4BC2;
	Tue, 11 Feb 2025 16:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5EDC4CEDD;
	Tue, 11 Feb 2025 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291573;
	bh=gVBL4F8jU3SJlilexW8hvt6+wtNPSAz34HLk7+XFdww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1ru+DTzVqEPsgCq+7MeCU7Y9eGN/HEfpggxdgyY7Vh0GNULJRF5QK2xI3f0PtPGa
	 56oYv4BgfXoTc1jYeUIcAeLQwRhrf8+T/C7gdBzJJv2XT0u3UbkMxAwi3BOhm4/pPB
	 m9hBfO3Jq0PAlMszXLj1nwei618R6cyJ6w+OuSlpFImcCUaH5MEe7U8lwF21rqT5dx
	 o4sdaDxGAgm6ySmKMfsetSPkHReQhzFTJT/Fka+gbk/OuLt90VA5rm/8er2m5+WeZJ
	 MgOmnKAN9ga7ITrXzQlHTrQIBKDp4BD0cop1Tb56el/oTKWFiXJ1aAxEgRR6yYLKMj
	 55946rlOWNVhg==
Date: Tue, 11 Feb 2025 17:32:51 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next v3 11/16] dt-bindings: arm: airoha: Add the NPU
 node for EN7581 SoC
Message-ID: <Z6t7s0m1xzsnjAsV@lore-desk>
References: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
 <20250209-airoha-en7581-flowtable-offload-v3-11-dba60e755563@kernel.org>
 <20250211-judicious-polite-capuchin-ff8cdf@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5YUTzFhuFvIYeyt1"
Content-Disposition: inline
In-Reply-To: <20250211-judicious-polite-capuchin-ff8cdf@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_083254_785151_F11A5F36 
X-CRM114-Status: GOOD (  22.08  )
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


--5YUTzFhuFvIYeyt1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11, Krzysztof Kozlowski wrote:
> On Sun, Feb 09, 2025 at 01:09:04PM +0100, Lorenzo Bianconi wrote:
> > This patch adds the NPU document binding for EN7581 SoC.
> > The Airoha Network Processor Unit (NPU) provides a configuration interf=
ace
> > to implement wired and wireless hardware flow offloading programming Pa=
cket
> > Processor Engine (PPE) flow table.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../devicetree/bindings/arm/airoha,en7581-npu.yaml | 71 ++++++++++++++=
++++++++
> >  1 file changed, 71 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-npu.ya=
ml b/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a5bcfa299e7cd54f51e70f7=
ded113f1efcd3e8b7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml
>=20
> arm is for top-level nodes, this has to go to proper directory or as
> last-resort to the soc.
>=20
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/airoha,en7581-npu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha Network Processor Unit for EN7581 SoC
> > +
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +
> > +description:
> > +  The Airoha Network Processor Unit (NPU) provides a configuration int=
erface
> > +  to implement wired and wireless hardware flow offloading programming=
 Packet
> > +  Processor Engine (PPE) flow table.
>=20
> Sounds like network device, so maybe net?

yes. Do you mean to move it in Documentation/devicetree/bindings/net/ ?

>=20
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - airoha,en7581-npu
> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 15
>=20
> You need to list the items.

ack, I will fix it.

>=20
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +    description:
> > +      Phandle to the node describing memory used to store NPU firmware=
 binary.
>=20
> s/Phandle to the node describing//

ack, I will fix it.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof
>=20

--5YUTzFhuFvIYeyt1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ6t7sgAKCRA6cBh0uS2t
rEcNAP9MlnGQ2GW0xvg4g0/eolQXH1kOd7wal6bxIySJIMBQNgEAqs/5Z011yWwQ
5DcNR5bUJWyr9AmldMOhCQ88BjX9Vwg=
=rkEw
-----END PGP SIGNATURE-----

--5YUTzFhuFvIYeyt1--

