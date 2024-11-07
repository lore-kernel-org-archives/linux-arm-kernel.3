Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52453D43376
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smyCZkdt1G224vyQetc/B8UVBdbkLtuKLtN7Kbg7WhU=; b=YoHC10nZDlHfy+cT9BpYccRAI8
	nyvAXE4xggBll+BYnTFIS7QpLtfvgMH3IuVQlrMtjjAsMRlqzqrF8hkSW3DkF35rGdGpyt5WhWzXq
	BDweAysAEQkPyGPt6jRwvGClieXfBL9RvMz1QNuOEjaOcVkdP5V9SSfmqHqk62HTYzdVQqSjWuFKm
	DTPD006lU8EgMm/aH01cEoFc1z20btIGnR0zMy7pAsQyrhc9ZmksGP7M9tXx7fFz3rLuU1Grd4+im
	0QqNW4UhyCBwUKKvhhSuysiBrWud/GJrCveYBsvmYghHTpG84IbnEOJxTfbfwt6FXT2pmBjEYU3Mg
	2QJdyJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95E5-00000007b9Z-1CZT;
	Thu, 07 Nov 2024 16:19:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9546-00000007YLN-2jAf;
	Thu, 07 Nov 2024 16:08:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D55EDA44840;
	Thu,  7 Nov 2024 16:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1CDC4CECC;
	Thu,  7 Nov 2024 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730995737;
	bh=2kfDzCF2FTIpUblvZc5XYIV2ThC+IH83w30h+YUuXeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOd5rAg7WV3sqakpt10TCF77pYU3hD42gWDftaTsiigNEUMjLWofCSse7Hw5UZRqL
	 BX2hmQmS8B3aDdwaLJRX2VMoyqGXFmJ7lI8+wr61iRal930vGZJSyIAnCdniJqVjI5
	 BTUpyE5thtqJK39JCBiPpjAGK1Iy3ZVLg1uQKBfCfCHOI2bPF0/L6vPocT2W3526mk
	 SIaAABNPLH2dIhNUuh2abKzQeush4RQ//k27YRie/Qvs37wXw4Z35QRxUhFkujvf/S
	 kf6+DM6oo8QlWwT/hW/rOOoRy4JiC+49cxwiwE8hAeRTj6Ph4qlnQUcv1EURHBdAl6
	 nyGFWbGcc4Yeg==
Date: Thu, 7 Nov 2024 17:08:55 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <ZyzmFyRYDHX0W6bB@lore-desk>
References: <20241107-pcie-en7581-fixes-v1-3-af0c872323c7@kernel.org>
 <20241107152705.GA1614612@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SEGJF8oLAoHyV+28"
Content-Disposition: inline
In-Reply-To: <20241107152705.GA1614612@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_080858_848235_17C8B21B 
X-CRM114-Status: GOOD (  27.19  )
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


--SEGJF8oLAoHyV+28
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wrote:
> > In order to make the code more readable, move phy and mac reset lines
> > assert/de-assert configuration in .power_up callback
> > (mtk_pcie_en7581_power_up/mtk_pcie_power_up).
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 24 ++++++++++++++++-----=
---
> >  1 file changed, 16 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 8c8c733a145634cdbfefd339f4a692f25a6e24de..c0127d0fb4f059b9f9e8163=
60130e183e8f0e990 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -867,6 +867,13 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen=
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
>=20
> Add blank line here.

ack, I will fix it.

>=20
> >  	/*
> >  	 * Wait for the time needed to complete the bulk assert in
> >  	 * mtk_pcie_setup for EN7581 SoC.
> > @@ -941,6 +948,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie =
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
> > +	usleep_range(10, 20);
>=20
> Unrelated to this patch, but since you're moving it, do you know what
> this delay is for?  Can we add a #define and a spec citation for it?

I am not sure about it, this was already there.
@Jianjun Wang: any input on it?

>=20
> Is there a requirement that the PHY and MAC reset ordering be
> different for EN7581 vs other chips?
>=20
> EN7581:
>=20
>   assert PHY reset
>   assert MAC reset
>   power on PHY
>   deassert PHY reset
>   deassert MAC reset
>=20
> others:
>=20
>   assert PHY reset
>   assert MAC reset
>   deassert PHY reset
>   power on PHY
>   deassert MAC reset
>=20
> Is there one order that would work for both?

EN7581 requires to run phy_init()/phy_power_on() before deassert PHY reset
lines.

Regards,
Lorenzo

>=20
> >  	/* PHY power on and enable pipe clock */
> >  	err =3D reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets,=
 pcie->phy_resets);
> >  	if (err) {
> > @@ -1013,14 +1029,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *=
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

--SEGJF8oLAoHyV+28
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZyzmFgAKCRA6cBh0uS2t
rC27AP4tuw1cRLqfjmkC6G4jGSyF1HjTNsNO87nv1lpG3MnOaAEA35d0jQr6E29i
cgQIDpKcqDw9XEiX4XP7uSUhAd15GQg=
=ioqx
-----END PGP SIGNATURE-----

--SEGJF8oLAoHyV+28--

