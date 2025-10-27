Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374E2CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqpZMR16TgadU2zStkFM9SmRTupKVjzaOUbN319AAfc=; b=XFkIeLoFj/NTQDbrYUdh8w3vUy
	qFWeWlztRMLuTy/7xFj8g5dXk+7/CsJjKmgoTJlsy5STNi5bByqgaVWBuFFXVihIxkDGJW7rlLbIq
	NmTQM/15f+biAgJ2DYzAIfNhR28wH3LIcwJFa4vRgJqZ9NGAX1S2Hzi+en11WdfaaXmJa7OJ6/mor
	QdY+kuzbZPtSDWjxNaZxeKW09y/BDk0+gaMA3TnxgVpbLXizO4B5XIsgiKva37TRyTIV19NhJ+fpP
	HFvpGjADr//oQ+AS56iY3Znz/fsIPBo2SNRrK//z62zdtNgF0q6ibLVSKOrDjOjAiGxe2IeoJSVxd
	oStKEsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQfk-0000000EOWv-34vb;
	Mon, 27 Oct 2025 17:06:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQfi-0000000EOWU-0iT9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:06:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC3F245A82;
	Mon, 27 Oct 2025 17:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9FDC113D0;
	Mon, 27 Oct 2025 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761584777;
	bh=s/IT6TeCl+sjf5XvyVpD9Mw0igDSnNsMN5YXPmOt6ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hte+cO7NPhaVJDDIfAVKI1hV2qvWp/BZOrVn4nCx8EITZsHbJfvwFspfHqo9MUAjL
	 ytrWPOsN3g7xsVML/nD92R9CWhzUz8wwNy5UeBt9BbcFAtYlYyY1UBVN1hGoU2YzS5
	 FXPIPG0iuPbf9Lg5l6i2TPd2IICLwxtQ4K33iiMfIyb3QYCZ0IMTfnhI1eQuV+JFSA
	 X261Gjluf2siziuhSfJhIaHZr0JQinCWu7N7yTXW9R3F9jUlnZ/ofVIDrhHflH/q83
	 iSTC6EyUvWK3SThUgxgKsa+wpjqxi16zzTaWqeTrp/m+GUXXQiQHhzXiCnyG7rNznG
	 sjuEa2T47zbYg==
Date: Mon, 27 Oct 2025 17:06:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	Frank Li <frank.li@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 2/3] dt-bindings: PCI: pci-imx6: Add external
 reference clock input
Message-ID: <20251027-marbles-tarot-92533cb36e1b@spud>
References: <20251024024013.775836-1-hongxing.zhu@nxp.com>
 <20251024024013.775836-3-hongxing.zhu@nxp.com>
 <20251024-unburned-lip-6f142d83ed76@spud>
 <AS8PR04MB8833DEEA9CB4CE4968B2B5F18CFCA@AS8PR04MB8833.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EsVnFdp8eh5fFMn5"
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8833DEEA9CB4CE4968B2B5F18CFCA@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_100618_276035_8BE57C5C 
X-CRM114-Status: GOOD (  31.23  )
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


--EsVnFdp8eh5fFMn5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 06:36:32AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 2025=E5=B9=B410=E6=9C=8825=E6=97=A5 1:07
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > bhelgaas@google.com; Frank Li <frank.li@nxp.com>; l.stach@pengutronix.d=
e;
> > lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v8 2/3] dt-bindings: PCI: pci-imx6: Add external re=
ference
> > clock input
> >=20
> > On Fri, Oct 24, 2025 at 10:40:12AM +0800, Richard Zhu wrote:
> > > i.MX95 PCIes have two reference clock inputs: one from internal PLL,
> > > the other from off chip crystal oscillator. The "extref" clock refers
> > > to a reference clock from an external crystal oscillator.
> > >
> > > Add external reference clock input for i.MX95 PCIes.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > index ca5f2970f217c..b4c40d0573dce 100644
> > > --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > @@ -212,14 +212,17 @@ allOf:
> > >      then:
> > >        properties:
> > >          clocks:
> > > +          minItems: 4
> > >            maxItems: 5
> > >          clock-names:
> > > +          minItems: 4
> > >            items:
> > >              - const: pcie
> >=20
> > 1
> >=20
> > >              - const: pcie_bus
> >=20
> > 2
> >=20
> > >              - const: pcie_phy
> >=20
> > 3
> >=20
> > >              - const: pcie_aux
> >=20
> > 4
> >=20
> > >              - const: ref
> >=20
> > 5
> >=20
> > > +            - const: extref  # Optional
> >=20
> > 6
> >=20
> > There are 6 clocks here, but clocks and clock-names in this binding do =
not
> > permit 6:
> > |  clocks:
> > |    minItems: 3
> > |    items:
> > |      - description: PCIe bridge clock.
> > |      - description: PCIe bus clock.
> > |      - description: PCIe PHY clock.
> > |      - description: Additional required clock entry for imx6sx-pcie,
> > |           imx6sx-pcie-ep, imx8mq-pcie, imx8mq-pcie-ep.
> > |      - description: PCIe reference clock.
> > |
> > |  clock-names:
> > |    minItems: 3
> > |    maxItems: 5
> >=20
> > AFAICT, what this patch actually did is make "ref" an optional clock, b=
ut the
> > claim in the patch is that extref is optional. With this patch applied,=
 you can
> > have a) no reference clocks or b) only "ref". "extref"
> > is never allowed.=20
> Hi Conor:
> Thanks for your review comments.
> Just same to "extref", the "ref" should be marked as optional clock too.

Right, your commit message should then mention that.

> > Is it supposed to be possible to have "ref" and "extref"?
> > Or "extref" without "ref"?
> > Neither "ref" or "extref"?
> "ref" and "extref" have an exclusive relationship of choosing one of the =
two,
>  and they cannot all exist simultaneously.

Right, please go test what you've produced, because extref is never
permitted by this binding.

> > I don't know the answer to that question because you're doing things th=
at
> > are contradictory in your patch and the commit message isn't clear.
> >=20
> Sorry for causing you confusion.


--EsVnFdp8eh5fFMn5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaP+mgwAKCRB4tDGHoIJi
0vsPAP4/9G1yr5mqtW4MMNEsBBmPhvBRbfc5pGtMSd6csOWCmQD+NIs3jfUzO2eC
odBrXrqWr/VCwksII7RTlqmdC42I+QM=
=+M2s
-----END PGP SIGNATURE-----

--EsVnFdp8eh5fFMn5--

