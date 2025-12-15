Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6A2D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/3NQ1ZFlz91mAO+kwIn+vkLcFkrkUM1n9uVSSYrHYk=; b=sVEwzlpNlKKxZzkeqb1iUfPU2c
	Qc10Hf0yZvNgMy8stwPFOJ2UoTzxT0L3EoRVdZ2naI/Nhxd89+0ot/+unmHnPi2DOeNLkNsd8k2KX
	p7Pq34JVxqnx9mG0DdD5U87zi6o2R8Yth6CsIS/9rmWuzB/EMvafnUYKPeqaENQCCRweQtDNWbaHo
	8pVbvhtyg5y8sd/BarzJNdZnKFFPl9liShitaLo4wl4s6FEuSqglzzJ+xaZjIV0xSBokSyWUjjm8j
	YFnErGoS94gAdo0ldPvbjBfXD+Sf1phzJuu17I3x6TdeGIeTb70mlP3nWxOxInL9vXU6lcRquYUle
	V1JIZZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV34A-00000003ClM-1Ql7;
	Mon, 15 Dec 2025 07:32:22 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV345-00000003CkU-1Epg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 07:32:20 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=M/3NQ1ZFlz91mAO+kwIn+vkLcFkrkUM1n9uVSSYrHYk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765783922;
 b=WU41e+xVmIVQpLlnKs2CigKwEFoTuzG3aJpBPJ6IGNpCVJCxZjo3JiLfX/jUjRPYmqZM6l0w
 Ov2AtQJsMeMCtvvz+IvA0k6gyt+mKB4TlOQHNqDXRZAmLU/+9B8Xfl6etXl7P2ynRM7+nRbJLPP
 8XaesxYONYUkywJUvmqS7INw1K//hWCHhguNGgZHu+Gu7vskStjfXLWUoHs6TGe5MkBqIbOz9xb
 l6Z9dq7jOglwA0w+jW8POUECde+GV7Ej697VvV8tXfeopeXdewqORRkj4/tVPuRN0hvJebz24cq
 40NPfi5zIwBOOyeS5PyRnQt2lBMncZqH5lxoO287ioUKg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765783922;
 b=a/SPsuuyAqhVmA6Y7U4z2GD9xqFx16FxX4SgltTtVbrakR3izyQnEkbXbLkvwCLOYql+qkOx
 aLALqhLRHtDQ9o3+DlHGvwn38eFM82D4NNRUiRfKgImoagWNRnpVh4t4Tf8yEZADHdzypjDorI5
 bl2UYwDBA/A09w82elSRQx1MkyYRwwqq2wBMAbWfRlZJyKGgxNDpIAUwdtVKxgOhR/go2OFO7JG
 GD+PmN4MgXDgO0dA4zNBXMzsDpMcWM5L6p92eTf8d+NqBI61plyazEC9h8UnQXmyELUTv+pbPsi
 fs9jVzATAFPyuXSlNu8SHPWUnbOoF0yRTTLQxpO4ujheg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Mon, 15 Dec 2025 08:32:02 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 55309220CD2;
	Mon, 15 Dec 2025 08:31:48 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: fsl,imx-gpc: Document address-cells
Date: Mon, 15 Dec 2025 08:31:47 +0100
Message-ID: <12807757.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aTxKqPqGdiHllLo6@lizhi-Precision-Tower-5810>
References: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
 <aTxKqPqGdiHllLo6@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5957622.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dVBZs00wwz1kNkWZ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: fbd490092935c18b4ac3a78bf74f2ef7
X-cloud-security: scantime:1.933
DKIM-Signature: a=rsa-sha256;
 bh=M/3NQ1ZFlz91mAO+kwIn+vkLcFkrkUM1n9uVSSYrHYk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765783922; v=1;
 b=if1HnTLxe2wxmnGwRmJf0PypksfJDYmNAhLDxToitig4srBcw9DppueC7tDuy86PmDdmiG7j
 bR7HYhlRkY6c7UMFAEqjZ5kOYr6Z5GLNudIVnMTqL3E6RYvS6HV7xBjnLMrfIo2v12g3NI3GMDs
 +8Ct5jBAo04UqGnJjXNL3sAKkCQREAF00r6uAdLLjBvmn47JZvLyWNntuWBqGQJVeVzZbsE5ePf
 R+7OUSE7HeuHvpVh1IUseUsRrrqnXLQVM1cxKw34bE/VEgXYuiNUT6CPvdGsn9CyyHGDyDWj+po
 DN/wiBnQbh4NYkjqmvXGpmTyiCf6MwJIq5L2yC+rC0wvA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_233217_792073_4A13CFAD 
X-CRM114-Status: GOOD (  22.43  )
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

--nextPart5957622.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Date: Mon, 15 Dec 2025 08:31:47 +0100
Message-ID: <12807757.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aTxKqPqGdiHllLo6@lizhi-Precision-Tower-5810>
MIME-Version: 1.0

Hi,

Am Freitag, 12. Dezember 2025, 18:02:32 CET schrieb Frank Li:
> On Fri, Dec 12, 2025 at 09:58:59AM +0100, Alexander Stein wrote:
> > The GPC power controller is an interrupt controllers and can be referen=
ced
> > in interrupt-map properties, e.g. PCIe controller, thus the node should
> > have address-cells property.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Strange, there are not #address-cells property for gic if there are not
> ITS node. gic is widely used.
>=20
> Does gic node also missed #address-cells?

Yes and no.
Yes: see commit faf183a02ed6b ("arm64: dts: imx8mp: Add default GIC address=
 cells")
No: AFAICS this is only necessary if an interrupt-controller is referenced
from within interrupt-map. But on imx6qdl.dtsi 'intc' (GIC) is not used tha=
t way.

Best regards,
Alexander

>=20
> Frank
>=20
> > ---
> >  Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml b=
/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> > index 9de3fe73c1eb6..d49a5130b87c7 100644
> > --- a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> > +++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> > @@ -38,6 +38,9 @@ properties:
> >    reg:
> >      maxItems: 1
> >
> > +  "#address-cells":
> > +    const: 0
> > +
> >    interrupts:
> >      maxItems: 1
> >
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart5957622.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmk/uWMACgkQaS+g2M0Z
/iVnFQgAtjzww7A+HPJWD5saX8fzUaqaTzrhRCNP2SsX9ckRMLEBGbKr6E63A/2c
Bu2V3Z5tl0ICUOp9Av2WYKt0OcBOUNTn/mkFDNimQmNEreAj/03AVtiSc9ttg3l2
1ceKi5iEoZk3F3ndOaPrYVvr1Nn3fdtnJzg+VAuAMi5oHLUrz5orL8MVSeH99xSZ
YvTZoMwnITg0+84bwfDykq84sszqZqnHQD9JiCJjElJOOyUvbdQshTU5BV3IGSPP
TGH/6eg0nxo47gT9auWk7VL8uVmYDVWvWf6C5hEAqwJ7WY8R7Gz78CFEuf4d8xzv
0i8/vBDEL3ye3nFT4lYFAje/rlLZbQ==
=oPa7
-----END PGP SIGNATURE-----

--nextPart5957622.DvuYhMxLoT--




