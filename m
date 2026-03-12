Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8915A106ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkVIqASBvUB6MvCP9opWtLwJbXnMP6r+Pw/l8BiZ+VU=; b=sJm+WcN8/aX6JH5Va7BPhtKOCf
	aKQuPfT8bZDeuQDC2F7kVnBlq/jNSsUMR7CmboA0zlQUVI1CM4wp1fQbLLXrSWwX5NBfdfx2yLn24
	mBGudi0gyFrcTIk0zcd0S4w9QfRqe1KwXAmAIK2jv8phagiFqrtCUeIpjwjUuJGVhXpKaNCAYX189
	47CEyeAokr1tAnnIeH3ZP+QBQOv31fDcDvUge260sIJkMkBNYAC7lkGth/Ae4ZELwhphJc0sdXIVz
	AnSBXYwBaFdlBIjLM+oA2xM+TMaFAMC6rgUEh0W+EV9GRMn/BkD63CciUroSg49uaiHJdb2Cpg+Ht
	v5O0oTvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kDF-0000000Emia-3tQs;
	Thu, 12 Mar 2026 17:52:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kDD-0000000Emhw-2xMd;
	Thu, 12 Mar 2026 17:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 54DA1442C5;
	Thu, 12 Mar 2026 17:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5449C4CEF7;
	Thu, 12 Mar 2026 17:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337963;
	bh=juOBK+JARNjtYHa7J953QFJ72MkXtnPKnRQL0PoJjKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPJz/bB6+glHH73SLx8hGVkx0l9tUzG4IFNHUsdfn+5UCoebZ+uR4mv6v1CnqPIoz
	 +B2pxRgvYNrsL/0J23iTIW9Zlr/htHthdACzdZAMooiqtbicFqzZ4X7jx18CuwAiWs
	 Tug1XH6nyPGz4KBj+gWi0FbyZQPHv21fOSan6TYRqPC7GU0x7JzvkvVKeaxCn6ghqi
	 4+I9gEJ6s9YY0QNQ4BiOZA1smBIBW7wcRDmbXcHHny97X3nIEHKHPP+VPFTmxZVLSs
	 SaPwreBDXUS2iGNaCuxJnS0FhCu7ATagW8j7ocQLb+M73YP28zMsfhf9OgAVce+iYa
	 b1C4M1bG1AQmQ==
Date: Thu, 12 Mar 2026 17:52:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
	ardb@kernel.org, ebiggers@google.com, martin.petersen@oracle.com,
	tytso@mit.edu, cristian.birsan@microchip.com,
	jarkko.nikula@linux.intel.com, kees@kernel.org, npitre@baylibre.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the appropriate quirk
Message-ID: <20260312-ricotta-unusable-44c25a03eff8@spud>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
 <20260312042056.309237-4-manikandan.m@microchip.com>
 <a41378a0-d2f1-4fa4-ac6d-1d0916590b47@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aXc9ewpzkSl2ifoe"
Content-Disposition: inline
In-Reply-To: <a41378a0-d2f1-4fa4-ac6d-1d0916590b47@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_105243_783116_ADB27E29 
X-CRM114-Status: GOOD (  23.49  )
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


--aXc9ewpzkSl2ifoe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 11:29:25AM +0200, Adrian Hunter wrote:
> On 12/03/2026 06:20, Manikandan Muralidharan wrote:
> > Add support for microchip sama7d65 SoC I3C HCI master only IP
> > with additional clock support to enable bulk clock acquisition
> > for Microchip platforms using HCI_QUIRK_CLK_SUPPORT quirk.
> > Introduce MCHP_I3C_CLK_IDX to define the maximum peripheral
> > clock index
> >=20
> > Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> > ---
> > Changes in v3:
> > - Make use of existing HCI_QUIRK_* code base
> > - Introduce HCI_QUIRK_CLK_SUPPORT to handle/enable the required Periphe=
ral
> > and system generic clk in bulk
> >=20
> > Changes in v2:
> > - Platform specific changes are integrated in the existing mipi-i3c-hci
> > driver by introducing separate MCHP_HCI_QUIRK_* quirks and vendor
> > specific quirk files
> >=20
> > ---
> >  drivers/i3c/master/mipi-i3c-hci/core.c | 12 ++++++++++++
> >  drivers/i3c/master/mipi-i3c-hci/hci.h  |  4 ++++
> >  2 files changed, 16 insertions(+)
> >=20
> > diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/maste=
r/mipi-i3c-hci/core.c
> > index 5879bba78164..6b7716bd517e 100644
> > --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> > +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> > @@ -8,6 +8,7 @@
> >   */
> > =20
> >  #include <linux/bitfield.h>
> > +#include <linux/clk.h>
> >  #include <linux/device.h>
> >  #include <linux/errno.h>
> >  #include <linux/i3c/master.h>
> > @@ -918,6 +919,7 @@ static int i3c_hci_probe(struct platform_device *pd=
ev)
> >  {
> >  	const struct mipi_i3c_hci_platform_data *pdata =3D pdev->dev.platform=
_data;
> >  	struct i3c_hci *hci;
> > +	struct clk_bulk_data *clks;
> >  	int irq, ret;
> > =20
> >  	hci =3D devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
> > @@ -946,6 +948,13 @@ static int i3c_hci_probe(struct platform_device *p=
dev)
> >  	if (!hci->quirks && platform_get_device_id(pdev))
> >  		hci->quirks =3D platform_get_device_id(pdev)->driver_data;
> > =20
> > +	if (hci->quirks & HCI_QUIRK_CLK_SUPPORT) {
> > +		ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
> > +		if (ret < MCHP_I3C_CLK_IDX)
>=20
> Is MCHP_I3C_CLK_IDX really needed?  Why not just:
>=20
> 		if (ret <=3D 0)
>=20
> i.e. don't you anyway have to assume DT has the clocks defined
> correctly.

Ye, I think this is kinda silly. Trust dtbs_check to have the correct
number for your platform set, and let this be specific.

--aXc9ewpzkSl2ifoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL9ZAAKCRB4tDGHoIJi
0mFzAQD8sb5isGyPPaQE3kYoakuj+6ep/IS3t3IZhJUaZ7Z3dAD/Vw8LKqh45H8H
HpMjIeSZSkof2M251PwPTxeNv7o5Bwk=
=LkO0
-----END PGP SIGNATURE-----

--aXc9ewpzkSl2ifoe--

