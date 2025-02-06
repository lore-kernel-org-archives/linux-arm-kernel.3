Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA3FC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 20:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wp1vAa9FBC8xV8GKJ1p2ZFuvg2iVsICkoDp8a9xb6eE=; b=tmHqxEfmd3fCEteLTx+288Bxp9
	nntYm0LVz/+RePIgiO2RSnQXK02sbvcvKh99Zcwv1UnUri5UFa5qPxnS+G60pUTVB+y9hb19/DidI
	xX7cZnLQkXpSrFSf0Mwq4qbwA/ljLPXjfhbkpwRwYKkLqN5/jtvHvla6e1++RBV+4zrb+nJ40tmbT
	QwJHiBfnocjeVyLOgqY7RZao/I8RPunWChJqQj1zbVxJBgY7U9556+PwgpL+C7D59HVjbaqhA5R3L
	JRIhJ84E0SuCH2O6Dx2WHcV730yU9xsGjq/gn3/WUFRmoOJvPsTTwiBPtsdwCjKOobenzSpT0/IV9
	44Aam+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8Zl-00000007UtT-3G9X;
	Thu, 06 Feb 2025 20:34:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8Xh-00000007UYK-3Ey0;
	Thu, 06 Feb 2025 20:32:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E08D95C6DE2;
	Thu,  6 Feb 2025 20:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A34C4CEDD;
	Thu,  6 Feb 2025 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738873928;
	bh=8++XfkeoGTNTrOI9Lv+WUaBkvALFfxwEBpO7jocNRuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmG54vlzC1bt1aRdUOQzfumbyhGlfb21qRuMJhXeYPFF1oMw2+7jCmbrO2wyUHexJ
	 utnZ3E3MxKRRmhVaMXZqWRGM013iABImXjkuf+ZgJ1P2+rmPRHT7hmG67fCyI2nR9S
	 x4I3rm1jEseTWanEkQI+exbcLNZ7H9jbrvXB6/CQ6FEs2ZNe+tS6u0Vcdl4KbPfrBJ
	 zunfJ76KNiJlG6oErceWoE+qXLCYVGMYf0EIFFkWqcdRL4JOlq4BohxDsWWloBJoi1
	 WBXlvN4EwHH9Yp66eeAjRG9vCs9yGFCxEdAeYzImhvQMsDbAmvmx/3E75RdfVyTAq9
	 dwVxljhMlkVcA==
Date: Thu, 6 Feb 2025 21:32:05 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
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
Message-ID: <Z6UcRRaLmUSvWS9Y@lore-desk>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
 <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
 <20250205-cleaver-evaluator-648c8f0b99bb@spud>
 <Z6O8-dUrLNmvnW1u@lore-desk>
 <20250205-disagree-motive-517efca2b90c@spud>
 <20250205-patronage-finisher-bbfbdb5b7dbc@spud>
 <Z6PQEzvvCdDKQSnl@lore-desk>
 <20250206-sabbath-carded-2bd52c03440d@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zvsYUP/vzkaeMiCQ"
Content-Disposition: inline
In-Reply-To: <20250206-sabbath-carded-2bd52c03440d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_123209_901026_1FD03602 
X-CRM114-Status: GOOD (  37.04  )
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


--zvsYUP/vzkaeMiCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Feb 05, 2025 at 09:54:43PM +0100, Lorenzo Bianconi wrote:
> > > On Wed, Feb 05, 2025 at 08:01:26PM +0000, Conor Dooley wrote:
> > > > On Wed, Feb 05, 2025 at 08:33:13PM +0100, Lorenzo Bianconi wrote:
> > > > > > On Wed, Feb 05, 2025 at 07:21:28PM +0100, Lorenzo Bianconi wrot=
e:
> > > > > > > Introduce the airoha,npu property for the npu syscon node ava=
ilable on
> > > > > > > EN7581 SoC. The airoha Network Processor Unit (NPU) is used t=
o offload
> > > > > > > network traffic forwarded between Packet Switch Engine (PSE) =
ports.
> > > > > > >=20
> > > > > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > > > > ---
> > > > > > >  Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml=
 | 8 ++++++++
> > > > > > >  1 file changed, 8 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/Documentation/devicetree/bindings/net/airoha,en7=
581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > > > > index c578637c5826db4bf470a4d01ac6f3133976ae1a..6388afff64e99=
0a20230b0c4e58534aa61f984da 100644
> > > > > > > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth=
=2Eyaml
> > > > > > > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth=
=2Eyaml
> > > > > > > @@ -63,6 +63,12 @@ properties:
> > > > > > >    "#size-cells":
> > > > > > >      const: 0
> > > > > > > =20
> > > > > > > +  airoha,npu:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > > > +    description:
> > > > > > > +      Phandle to the syscon node used to configure the NPU m=
odule
> > > > > > > +      used for traffic offloading.
> > > > > >=20
> > > > > > Why do you need a phandle for this, instead of a lookup by comp=
atible?
> > > > > > Do you have multiple instances of this ethernet controller on t=
he
> > > > > > device, that each need to look up a different npu?
> > > > >=20
> > > > > actually not, but looking up via the compatible string has been n=
aked by
> > > > > Krzysztof on a different series [0].
> > > >=20
> > > > Hmm, I disagree with adding phandles that are not needed. I don't a=
gree
> > > > that there's no reuse, if you can treat the phandle identically on =
a new
> > > > device, in all likelihood, that node should have a fallback to the
> > > > existing one.
> > >=20
> > > Also, where is the binding for this npu? It looks like a brand-new
> > > module that you're adding a driver for in this series and a phandle to
> > > the node for here but I see no binding for it.
> >=20
> > The driver loads the NPU node just as syscon so I have not added the bi=
nding
> > for it to the series. I will add it in v2.
>=20
> I don't think it is "just as syscon", you've got an entire driver for it
> that you're loading via the phandle, it's not just some generic syscon th=
at
> you're looking up here - at least that's what it seemed like to me after
> my scan of the driver patches.

ack, fine. I will add binding for it in v2.

Regards,
Lorenzo

--zvsYUP/vzkaeMiCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ6UcRQAKCRA6cBh0uS2t
rCzfAQD0HAk5INsFs2L2kyrtH38gO74kQpiDIptn5lb5dfb+IgEAwlmjHSO5IZEc
WKie0fs9KqDUq4KwzBlYR3b1Ae7nDgw=
=AbnL
-----END PGP SIGNATURE-----

--zvsYUP/vzkaeMiCQ--

