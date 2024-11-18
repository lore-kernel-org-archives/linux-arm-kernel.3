Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C388D43FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeKhPCZl6Wlt7zHeNRgAX3Um/fWLm252kst2JLNcWms=; b=qVvx4sMC5ucfz997z7ODIJTUMt
	CgiLzK2OOzBxxQ0rPfDQihotD2qugRq1YH3TtTSKK0CZzwqzLUydh7Jrhi/n2VXs+eEnoPz1YrW2d
	pMnEKdmpqV8GpdYKM0TTPRSucjfEHUEn6p6yrN7nZyB16G3PqFFlZefJ8ELwrsQ9CA9C1PdpKUWWP
	VhR5rEwo/VAaMUtWAsmgwcKz/ZN1gYPbrzm54XfjHpz/etCgTSCFFqWpJlfo7yoC7cB7IBdsFG0QS
	mXGP2MLfvuPSLrpubVU3Ucnk5TRg9lCUGyldDGROxfYB3/ao8joQDk8DYBeScdHrBxJ5WTAMIlrdy
	b9DEulEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxgq-00000008rgI-17u8;
	Mon, 18 Nov 2024 09:05:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxft-00000008rUL-1Iuv;
	Mon, 18 Nov 2024 09:04:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C0005C4649;
	Mon, 18 Nov 2024 09:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A98C4CECC;
	Mon, 18 Nov 2024 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731920640;
	bh=P5sIKzs/KRb7twfVQbeFNIj0OlBGFYmJTsbOaM700Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j1awaDW7I2HmOorHfgieEGe08kt3rRmR2JuTKMHI/weyLcE46tVGp3iY/KX3veLYb
	 5YmLhsGnyM1ifpdu95apl0CrzhRADRVLR1rBmP2kVk4gw5y6C1iZhw5YtX0uelsRpb
	 cXNlIuJwNVJ0nLC1tHkvFaSfpf/3as3a1xrGTNGOWCjM+mFC6k8oPYJw/v9EwjYXiU
	 zhk3c2aods5K+1EXoBNrkQgslC6/d1KygJXzncEsvmEhijlZhr2p1h1nP+eaBI9R7T
	 pBKgOpdACdUB2nNV50Z6VAhN3zwaYcWSZa+aAu1n0oZ4ioX9jvY2XxrLeyjxB6xK+p
	 rhdZN4peeGZIg==
Date: Mon, 18 Nov 2024 10:03:58 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 3/6] PCI: mediatek-gen3: Move reset/assert callbacks
 in .power_up()
Message-ID: <ZzsC_hW-w6WSMYSO@lore-desk>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-3-24bb61703ad7@kernel.org>
 <2d7e1e5e09babb468199ac44520683fcb87d697c.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mYzXfOMc+FsagSoK"
Content-Disposition: inline
In-Reply-To: <2d7e1e5e09babb468199ac44520683fcb87d697c.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_010401_436535_DF0BD2A7 
X-CRM114-Status: GOOD (  23.54  )
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


--mYzXfOMc+FsagSoK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 18, Philipp Zabel wrote:
> On Mo, 2024-11-18 at 09:04 +0100, Lorenzo Bianconi wrote:
> > In order to make the code more readable, the reset_control_bulk_assert()
> > for PHY reset lines is moved to make it pair with
> > reset_control_bulk_deassert() in mtk_pcie_power_up() and
> > mtk_pcie_en7581_power_up(). The same change is done for
> > reset_control_assert() used to assert MAC reset line.
> >=20
> > Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> > complete PCIe reset on MediaTek controller.
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 27 +++++++++++++++++++--=
------
> >  1 file changed, 19 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 3cfcb45d31508142d28d338ff213f70de9b4e608..2b80edd4462ad4e9f2a5d19=
2db7f99307113eb8a 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -125,6 +125,8 @@
> > =20
> >  #define MAX_NUM_PHY_RESETS		3
> > =20
> > +#define PCIE_MTK_RESET_TIME_US		10
> > +
> >  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
> >  #define PCIE_EN7581_RESET_TIME_MS	100
> > =20
> > @@ -912,6 +914,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen=
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
>=20
> This comment is not correct anymore.

I agree naming is hard, but I guess we can assume with 'bulk' we refer to b=
oth
phy and mac reset (similar to what we have in mtk_pcie_power_up()),
what do you think?

Regards,
Lorenzo

>=20
>=20
> regards
> Philipp

--mYzXfOMc+FsagSoK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZzsC/QAKCRA6cBh0uS2t
rNbVAP9GogJHVFI9oDywFF8WM3UumsuYzIPMFozrmAv43ScovAEA1Kpt3C0B2zdJ
PR0FSxnt4lm7ujysgm0no3wwfOXN8ws=
=CRKQ
-----END PGP SIGNATURE-----

--mYzXfOMc+FsagSoK--

