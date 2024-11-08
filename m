Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4438AD5E147
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hu0/FhjKhA/lis5ZBlmGPYb3eKmuShEvoOlYSx3peuI=; b=ycAbxk5WTKjimQIQDPaz8iKDzY
	iXxxDJ/KXU/arGE6DwkAMDbDYRSVkwrdUt+ExI5Qw1ZlhNCWsKpHEjmPjOnz98cL3l0ZTwou8DOOt
	XmRNkcVkYaoBXajz5ByhnpK+3gZ3dRoQPGfk9SJnP7IWDp5fEFdrA1h4P23h1WfWMIL0/2XVDQ6Ga
	plMZWlJySR2iGNdx9uNQl96Pc0C5p+xNxZ3rtHoERszmxXoR+E+4HVUKRR0khFjeoqMoEayRDrfF+
	VvmNuD+QJL7ZjDHeYmEctmXvpfP6RUWDdoNbcVpskKoyRvAO5d89fy9si7HXSgDeI2rh0J1hHpxbN
	O07cNQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KjM-00000009qn9-1gGy;
	Fri, 08 Nov 2024 08:52:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KWv-00000009oXi-1qwR;
	Fri, 08 Nov 2024 08:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5B3DA45192;
	Fri,  8 Nov 2024 08:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6248C4CECD;
	Fri,  8 Nov 2024 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731055184;
	bh=UlGOyf95Tqv2jGt1kj9WSLI/Dth3v1V/vK03dzxrLyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iBfTwJwa3yInD3+o2R/DhrWukhY1pwYWzi5G24em5fKoeeHX5cotFNEQwqiCKBng5
	 PErfUmjfsILTjzIlSWNVgePHtqw5Ixap4/e7QDI0qvLt9RWRM1vGXUeKWTDpViKtn5
	 62XlMfmVIaUMqJZEQdogbDqGnSks9+9XjgGFaLJErFl4dAu5urihuS8Po4B4ArTHW0
	 /2Z2Gak+9mXLnwyq3E0qPOiFgKL/MghovcmFB00Q4EXY2/PucqXH4wO6FEe69aRZBT
	 sMkyiHFL3MCrsXUVNMKhNTrnqkD5pSbO5hziaold0L9yBEiLMLCH/L+6cW6JzGUuSt
	 Z5vSnVpQhH1Yg==
Date: Fri, 8 Nov 2024 09:39:41 +0100
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: "helgaas@kernel.org" <helgaas@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <Zy3OTQ5CwPqtaeLU@lore-desk>
References: <20241107-pcie-en7581-fixes-v1-3-af0c872323c7@kernel.org>
 <20241107152705.GA1614612@bhelgaas>
 <ZyzmFyRYDHX0W6bB@lore-desk>
 <5c04ba80ef7a280bf2925282173802a8b2f40f3a.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uae1GSDO0BCp98kB"
Content-Disposition: inline
In-Reply-To: <5c04ba80ef7a280bf2925282173802a8b2f40f3a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_003945_639190_6076835A 
X-CRM114-Status: GOOD (  32.92  )
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


--uae1GSDO0BCp98kB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 2024-11-07 at 17:08 +0100, Lorenzo Bianconi wrote:
> > > On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wrote:
> > > > In order to make the code more readable, move phy and mac reset
> > > > lines
> > > > assert/de-assert configuration in .power_up callback
> > > > (mtk_pcie_en7581_power_up/mtk_pcie_power_up).
> > > >=20
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >  drivers/pci/controller/pcie-mediatek-gen3.c | 24
> > > > ++++++++++++++++--------
> > > >  1 file changed, 16 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > index
> > > > 8c8c733a145634cdbfefd339f4a692f25a6e24de..c0127d0fb4f059b9f9e8163
> > > > 60130e183e8f0e990 100644
> > > > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > @@ -867,6 +867,13 @@ static int mtk_pcie_en7581_power_up(struct
> > > > mtk_gen3_pcie *pcie)
> > > >  	int err;
> > > >  	u32 val;
> > > > =20
> > > > +	/*
> > > > +	 * The controller may have been left out of reset by the
> > > > bootloader
> > > > +	 * so make sure that we get a clean start by asserting resets
> > > > here.
> > > > +	 */
> > > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > > +				  pcie->phy_resets);
> > > > +	reset_control_assert(pcie->mac_reset);
> > >=20
> > > Add blank line here.
> >=20
> > ack, I will fix it.
> >=20
> > >=20
> > > >  	/*
> > > >  	 * Wait for the time needed to complete the bulk assert in
> > > >  	 * mtk_pcie_setup for EN7581 SoC.
> > > > @@ -941,6 +948,15 @@ static int mtk_pcie_power_up(struct
> > > > mtk_gen3_pcie *pcie)
> > > >  	struct device *dev =3D pcie->dev;
> > > >  	int err;
> > > > =20
> > > > +	/*
> > > > +	 * The controller may have been left out of reset by the
> > > > bootloader
> > > > +	 * so make sure that we get a clean start by asserting resets
> > > > here.
> > > > +	 */
> > > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > > +				  pcie->phy_resets);
> > > > +	reset_control_assert(pcie->mac_reset);
> > > > +	usleep_range(10, 20);
> > >=20
> > > Unrelated to this patch, but since you're moving it, do you know
> > > what
> > > this delay is for?  Can we add a #define and a spec citation for
> > > it?
> >=20
> > I am not sure about it, this was already there.
> > @Jianjun Wang: any input on it?
>=20
> This delay is used to ensure the reset is effective. A delay of 10us
> should be sufficient in this scenario.

ack, so we can introduce a marco like:

#define PCIE_RESET_TIME_US	10
=2E..

usleep_range(PCIE_RESET_TIME_US, 2 * PCIE_RESET_TIME_US);

what do you think?

Regards,
Lorenzo

>=20
> >=20
> > >=20
> > > Is there a requirement that the PHY and MAC reset ordering be
> > > different for EN7581 vs other chips?
> > >=20
> > > EN7581:
> > >=20
> > >   assert PHY reset
> > >   assert MAC reset
> > >   power on PHY
> > >   deassert PHY reset
> > >   deassert MAC reset
> > >=20
> > > others:
> > >=20
> > >   assert PHY reset
> > >   assert MAC reset
> > >   deassert PHY reset
> > >   power on PHY
> > >   deassert MAC reset
> > >=20
> > > Is there one order that would work for both?
> >=20
> > EN7581 requires to run phy_init()/phy_power_on() before deassert PHY
> > reset
> > lines.
> >=20
> > Regards,
> > Lorenzo
> >=20
> > >=20
> > > >  	/* PHY power on and enable pipe clock */
> > > >  	err =3D reset_control_bulk_deassert(pcie->soc-
> > > > >phy_resets.num_resets, pcie->phy_resets);
> > > >  	if (err) {
> > > > @@ -1013,14 +1029,6 @@ static int mtk_pcie_setup(struct
> > > > mtk_gen3_pcie *pcie)
> > > >  	 * counter since the bulk is shared.
> > > >  	 */
> > > >  	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets,
> > > > pcie->phy_resets);
> > > > -	/*
> > > > -	 * The controller may have been left out of reset by the
> > > > bootloader
> > > > -	 * so make sure that we get a clean start by asserting resets
> > > > here.
> > > > -	 */
> > > > -	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > > pcie->phy_resets);
> > > > -
> > > > -	reset_control_assert(pcie->mac_reset);
> > > > -	usleep_range(10, 20);
> > > > =20
> > > >  	/* Don't touch the hardware registers before power up */
> > > >  	err =3D pcie->soc->power_up(pcie);
> > > >=20
> > > > --=20
> > > > 2.47.0
> > > >=20

--uae1GSDO0BCp98kB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZy3OTQAKCRA6cBh0uS2t
rJxpAP9ZXmnP7lu21ic9O/cS1HIr4Nc/+7vYc54mxu50fzCzqwEA0VgHyeIHISW/
ELjp8Qmv2Hot9OAiCuWq98qkpHzsQwE=
=pefi
-----END PGP SIGNATURE-----

--uae1GSDO0BCp98kB--

