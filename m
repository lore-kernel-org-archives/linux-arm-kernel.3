Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FBED6DDEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fDwDNM7o8FXIhZ37SVln/r0aKzC8vbsyhHAxKHRvSc=; b=2XM0Z6j+rQ4jcAO/GTvd82RuIR
	hb5cHpj1nGNNbOE/fT6CPb4U3VM0+1bYt/R+AGpIpzrnG2CVubNfu/NHIXPsyUmUvfmMzqaU1B5+3
	mtoES5V95XVCXyLfyXH545hjjh5n57Xsn4yYCHnHCbLe0XnzaSLvIu6y7ZTPH0Xy18ONVPf8J1tsl
	F7YNkt64IQVISBwhgoQjuevU9GcFxywmED8FeDPjNyGfUWC7qxmql+Da1ZCZZ1JdZeOS5IF9zMAZB
	6mw0MMl0FozjBoIKCuleFOd4PU0shLrKChAVzrc+4BwuIGiTKpVsTJWM7OHkBEfHZLKaaKYXgi9E/
	XV2wQxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsR2-000000029vL-2bdv;
	Fri, 15 Nov 2024 09:16:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsQ6-000000029mF-1y88;
	Fri, 15 Nov 2024 09:15:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3BE0EA42558;
	Fri, 15 Nov 2024 09:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AB1C4CECF;
	Fri, 15 Nov 2024 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731662112;
	bh=JGcQJOfvTUFJj/MD2Hu4QlmPKdgk9EdvvQsKVG943GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UghehhMvUJ5PBZM8CrNVwIFy42gb08UP6dc0/9g2YGdqdREUxGWlj12E1EGdUUVPF
	 uJFPsXWpSbxPIhvHFlmimdk6iP1KNt0fqFSkjXNKYP2pgiL+bPNfYpC3wLCpTb7Web
	 EU2qGkQs4zIggLYPL1g3bNap5ezDYxfSOS/xxxqGm06CNxzM8Z8BQjK+UK2gzbLI+J
	 HclkiEy+zyTvy5GbJlG05s4qwrf9R2LRDGNZuR0BVnlC0EsmPbSirMVhledONdtGjN
	 FQxCBSbA/legB2u5Z6L15iNfUHOVTClLWuvxY6bhyDgyPsc1bmd7aRGc3WNJ39vQi3
	 Ps8e8KNwg5YXA==
Date: Fri, 15 Nov 2024 10:15:07 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] PCI: mediatek-gen3: Move reset/assert callbacks
 in .power_up()
Message-ID: <ZzcRG3OInXZ2TP-Z@lore-rh-laptop>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
 <20241109-pcie-en7581-fixes-v2-3-0ea3a4af994f@kernel.org>
 <20241115090231.nwmxl6acspxqflpc@thinkpad>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SrMGir1++zYv7uQM"
Content-Disposition: inline
In-Reply-To: <20241115090231.nwmxl6acspxqflpc@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_011514_682757_ABCF6694 
X-CRM114-Status: GOOD (  26.38  )
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


--SrMGir1++zYv7uQM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, Nov 09, 2024 at 10:28:39AM +0100, Lorenzo Bianconi wrote:
> > In order to make the code more readable, move phy and mac reset lines
> > assert/de-assert configuration in .power_up() callback
> > (mtk_pcie_en7581_power_up()/mtk_pcie_power_up()).
> >=20
>=20
> I don't understand how moving the code (duplicting it also) makes the cod=
e more
> readable. Could you please explain?

Hi Manivannan,

this has been requested by Bjorn in
https://patchwork.kernel.org/project/linux-pci/patch/aca00bd672ee576ad96d27=
9414fc0835ff31f637.1720022580.git.lorenzo@kernel.org/#26110282

>=20
> > Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> > complete PCIe reset on MediaTek controller.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 28 ++++++++++++++++++++-=
-------
> >  1 file changed, 20 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 8c8c733a145634cdbfefd339f4a692f25a6e24de..1ad93d2407810ba873d9a16=
da96208b3cc0c3011 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -120,6 +120,9 @@
> > =20
> >  #define MAX_NUM_PHY_RESETS		3
> > =20
> > +/* Time in us needed to complete PCIe reset on MediaTek controller */
>=20
> No need of this comment. Macro name itself is explanatory.

ack, I will fix it.

Regards,
Lorenzo

>=20
> - Mani
>=20
> > +#define PCIE_MTK_RESET_TIME_US		10
> > +
> >  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
> >  #define PCIE_EN7581_RESET_TIME_MS	100
> > =20
> > @@ -867,6 +870,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen=
3_pcie *pcie)
> >  	int err;
> >  	u32 val;
> > =20
> > +	/*
> > +	 * The controller may have been left out of reset by the bootloader
> > +	 * so make sure that we get a clean start by asserting resets here.
> > +	 */
> > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > +				  pcie->phy_resets);
> > +	reset_control_assert(pcie->mac_reset);
> > +
> >  	/*
> >  	 * Wait for the time needed to complete the bulk assert in
> >  	 * mtk_pcie_setup for EN7581 SoC.
> > @@ -941,6 +952,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie =
*pcie)
> >  	struct device *dev =3D pcie->dev;
> >  	int err;
> > =20
> > +	/*
> > +	 * The controller may have been left out of reset by the bootloader
> > +	 * so make sure that we get a clean start by asserting resets here.
> > +	 */
> > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > +				  pcie->phy_resets);
> > +	reset_control_assert(pcie->mac_reset);
> > +	usleep_range(PCIE_MTK_RESET_TIME_US, 2 * PCIE_MTK_RESET_TIME_US);
> > +
> >  	/* PHY power on and enable pipe clock */
> >  	err =3D reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets,=
 pcie->phy_resets);
> >  	if (err) {
> > @@ -1013,14 +1033,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *=
pcie)
> >  	 * counter since the bulk is shared.
> >  	 */
> >  	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->p=
hy_resets);
> > -	/*
> > -	 * The controller may have been left out of reset by the bootloader
> > -	 * so make sure that we get a clean start by asserting resets here.
> > -	 */
> > -	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy=
_resets);
> > -
> > -	reset_control_assert(pcie->mac_reset);
> > -	usleep_range(10, 20);
> > =20
> >  	/* Don't touch the hardware registers before power up */
> >  	err =3D pcie->soc->power_up(pcie);
> >=20
> > --=20
> > 2.47.0
> >=20
>=20
> --=20
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

--SrMGir1++zYv7uQM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZzcRGAAKCRA6cBh0uS2t
rIZRAP9lkLZ21zAHZX2cmYhCDHsB3Dka4V3SIPgL3D0ExpmzTgEAoZVmGhfQHuM2
iBl8NcVaLGfGiQ8tT+Uf+4pk+FqFTgw=
=ZgWM
-----END PGP SIGNATURE-----

--SrMGir1++zYv7uQM--

