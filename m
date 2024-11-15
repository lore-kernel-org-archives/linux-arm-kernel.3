Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD50D6DDFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbyO1AHv2SrrjDMufGe/qPlv7KoAstD0OvUVZ7mbUvQ=; b=yJkeCCtksoH6dIIgihvrlAADsR
	6uia5lfaYrycMrydftU3pUIqLcvGchHbBbwYpN0VMhyVHc1FgCCXvLoofvTnQcJphfxikLV1/81mC
	Hhxf5OCuBBegwbwF+UQSb38l2/UFkAWb1mxSikm5sXb+FsIhwdEfGthd1VmZ9GQbCTbMmBRRjpUBg
	wvXqDWJlTDte7AkTChmHEGSyoBXSmn1Mfuf/m/gN5ajWNyYIdxpCJNdETVyfwsqEaS6T1XeJUMpgF
	4TWWXNdDksTv2i16MKlUGcj5weTrfyH+l64Qu3VmYADkLiFey7i98RbSemXAwTGuEDPAm2KxNex9y
	XpuYO4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwBr-00000002ljX-0B0x;
	Fri, 15 Nov 2024 13:16:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwAw-00000002lf7-1Z26;
	Fri, 15 Nov 2024 13:15:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A383F5C61CA;
	Fri, 15 Nov 2024 13:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4795C4CECF;
	Fri, 15 Nov 2024 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731676549;
	bh=70ptQYo30UwVusaCHZRa/EN+gh7OcDEFJVb5k9kd/W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PqRWThO4yBC11BlqCVLdvCdiqntr2dtVg/ncjFDMvzDXzSMfdrNqx6YfIslFKNN+Y
	 0taDWV3MkBOsEZJn2Hq93JcBQ5L/EguelK7R/c6ye/N6bJwLFIKFZ1tAXovsdR55QR
	 Qg+hVCXH6nmQi4t9nyJtCIU2jWY3zUrsJ72DWfdI0CSpiVwI4oYgxW+NPX2Div5FA1
	 Z4oU/RwvHbVlBjkC562ZQwZh9wbMkcyaqCCjXUFcaQ/LxAE8gTOo72U9V2cb9Kbtuk
	 u9D12+eeLHqFr7hWWMWy9LW/82SL6w7jBGbCaAo12g4sc3p+Hqz1gYudvh+jSfXM6n
	 bR5s+IFutX9oQ==
Date: Fri, 15 Nov 2024 14:15:45 +0100
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
Message-ID: <ZzdJgeX2dp_z1QmJ@lore-rh-laptop>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
 <20241109-pcie-en7581-fixes-v2-3-0ea3a4af994f@kernel.org>
 <20241115090231.nwmxl6acspxqflpc@thinkpad>
 <ZzcRG3OInXZ2TP-Z@lore-rh-laptop>
 <20241115123707.in4x27ub4wtwdggh@thinkpad>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Az29kcYdHjsISUBm"
Content-Disposition: inline
In-Reply-To: <20241115123707.in4x27ub4wtwdggh@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_051550_511712_F94C46C4 
X-CRM114-Status: GOOD (  33.36  )
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


--Az29kcYdHjsISUBm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 15, Manivannan Sadhasivam wrote:
> On Fri, Nov 15, 2024 at 10:15:07AM +0100, Lorenzo Bianconi wrote:
> > > On Sat, Nov 09, 2024 at 10:28:39AM +0100, Lorenzo Bianconi wrote:
> > > > In order to make the code more readable, move phy and mac reset lin=
es
> > > > assert/de-assert configuration in .power_up() callback
> > > > (mtk_pcie_en7581_power_up()/mtk_pcie_power_up()).
> > > >=20
> > >=20
> > > I don't understand how moving the code (duplicting it also) makes the=
 code more
> > > readable. Could you please explain?
> >=20
> > Hi Manivannan,
> >=20
> > this has been requested by Bjorn in
> > https://patchwork.kernel.org/project/linux-pci/patch/aca00bd672ee576ad9=
6d279414fc0835ff31f637.1720022580.git.lorenzo@kernel.org/#26110282
> >=20
>=20
> Ok. The description needs to state the reason i.e., the
> reset_control_bulk_assert() is moved to make it pair with
> reset_control_bulk_deassert() in mtk_pcie_setup() and
> mtk_pcie_en7581_power_up().

ack, I will update the commit log.

>=20
> Btw, could you explain why reset_control_bulk_deassert() is present in
> mtk_pcie_setup()?

it is because the clock is shared for Airoha EN7581 and we need to be sure
rstc->deassert_count is not 0 running reset_control_bulk_assert().

https://github.com/torvalds/linux/blob/master/drivers/reset/core.c#L483

Regards,
Lorenzo

>=20
> - Mani
>=20
> > >=20
> > > > Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> > > > complete PCIe reset on MediaTek controller.
> > > >=20
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >  drivers/pci/controller/pcie-mediatek-gen3.c | 28 +++++++++++++++++=
+++--------
> > > >  1 file changed, 20 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/=
pci/controller/pcie-mediatek-gen3.c
> > > > index 8c8c733a145634cdbfefd339f4a692f25a6e24de..1ad93d2407810ba873d=
9a16da96208b3cc0c3011 100644
> > > > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > @@ -120,6 +120,9 @@
> > > > =20
> > > >  #define MAX_NUM_PHY_RESETS		3
> > > > =20
> > > > +/* Time in us needed to complete PCIe reset on MediaTek controller=
 */
> > >=20
> > > No need of this comment. Macro name itself is explanatory.
> >=20
> > ack, I will fix it.
> >=20
> > Regards,
> > Lorenzo
> >=20
> > >=20
> > > - Mani
> > >=20
> > > > +#define PCIE_MTK_RESET_TIME_US		10
> > > > +
> > > >  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
> > > >  #define PCIE_EN7581_RESET_TIME_MS	100
> > > > =20
> > > > @@ -867,6 +870,14 @@ static int mtk_pcie_en7581_power_up(struct mtk=
_gen3_pcie *pcie)
> > > >  	int err;
> > > >  	u32 val;
> > > > =20
> > > > +	/*
> > > > +	 * The controller may have been left out of reset by the bootload=
er
> > > > +	 * so make sure that we get a clean start by asserting resets her=
e.
> > > > +	 */
> > > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > > +				  pcie->phy_resets);
> > > > +	reset_control_assert(pcie->mac_reset);
> > > > +
> > > >  	/*
> > > >  	 * Wait for the time needed to complete the bulk assert in
> > > >  	 * mtk_pcie_setup for EN7581 SoC.
> > > > @@ -941,6 +952,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_p=
cie *pcie)
> > > >  	struct device *dev =3D pcie->dev;
> > > >  	int err;
> > > > =20
> > > > +	/*
> > > > +	 * The controller may have been left out of reset by the bootload=
er
> > > > +	 * so make sure that we get a clean start by asserting resets her=
e.
> > > > +	 */
> > > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > > +				  pcie->phy_resets);
> > > > +	reset_control_assert(pcie->mac_reset);
> > > > +	usleep_range(PCIE_MTK_RESET_TIME_US, 2 * PCIE_MTK_RESET_TIME_US);
> > > > +
> > > >  	/* PHY power on and enable pipe clock */
> > > >  	err =3D reset_control_bulk_deassert(pcie->soc->phy_resets.num_res=
ets, pcie->phy_resets);
> > > >  	if (err) {
> > > > @@ -1013,14 +1033,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pc=
ie *pcie)
> > > >  	 * counter since the bulk is shared.
> > > >  	 */
> > > >  	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pci=
e->phy_resets);
> > > > -	/*
> > > > -	 * The controller may have been left out of reset by the bootload=
er
> > > > -	 * so make sure that we get a clean start by asserting resets her=
e.
> > > > -	 */
> > > > -	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie-=
>phy_resets);
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
> > >=20
> > > --=20
> > > =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D
>=20
>=20
>=20
> --=20
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

--Az29kcYdHjsISUBm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZzdJfgAKCRA6cBh0uS2t
rAc+AP9ub7dajbYVmtXzENOojOgxYKgGlbym8v7JFbk2MDEf7AEA72IU0ALoGmk1
Uh4ep6rnZJgFC0aB3YAo3lXmumLpxww=
=VKZA
-----END PGP SIGNATURE-----

--Az29kcYdHjsISUBm--

