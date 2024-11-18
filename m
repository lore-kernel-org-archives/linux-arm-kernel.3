Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC200D49211
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 11:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkzu4Es+6KWf/CG+T0YJGrQciYkiR71LzqnCQoenq4I=; b=sEfu/k9w4FCuhUNPpVua8V7QYI
	LTHwrZfGD36PwM6yB0k4KLdsJDztVjYwMv+r/NM4hJMIoozdx8p5TlWWaq0dBkuwY8jX0U+yXcfM8
	hgLbd5rctN6NuucmDWsF200dqaOGYRIC8DsuMo0oV78d7ZeX6ubLmHGIyFy5TwmTqutmfA4NNsjxk
	DKurhwCPfvRT0zv6EmGzw9AyZEB2fcogX3OIOyu54t17wjTMqUgBPDJzVug5EXFL50mRDmeQ6Aqak
	C4/ScxG4JLMFhMk4TpYzVw5mx8tEjZy+6ULTjmt6G3SPQqtqhtaeBLGMGaGQ0sGXwE8XmM8EzkRjc
	S3NSzc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0Fx-00000009JV5-2fkg;
	Mon, 18 Nov 2024 11:49:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0Ex-00000009JKp-1L7g;
	Mon, 18 Nov 2024 11:48:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D56FDA41AB9;
	Mon, 18 Nov 2024 11:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E999C4CED0;
	Mon, 18 Nov 2024 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731930502;
	bh=ECmU6i0EoWAMf6OCxHfH8eVo80Ipk+BYiYRJhQaeKac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTpJ5ajVOfRRaDI6EaOGtHKvEFFK42O9bDNFT6YXzErr5QDRmCMkt/1yCxq3CFxIt
	 wX5ptQSEB+fISDyrm3e1uPIzcY5HOyCHFNqjiZOfQd/c1QFQ3iI/ay+1ecsh+573ZR
	 7pDUFVsJ2DaZC74ziiN9jdBk776uenwViMRH9qnrfNN92q09QUDVX/Wym+2/BdmeAW
	 EsCm++is/mID3hABxcFufYrqDht4UOqB4tprWocfiUzVGU30e8KfqrxMB4vCHkeYiy
	 w9LyvuzbXPlNaFijUYSAUw3MpRVhpalYmAE2d0jvyDE1ytylWkv2vvqa7pQL4oyaVF
	 TXoqKbZImK88A==
Date: Mon, 18 Nov 2024 12:48:19 +0100
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
Message-ID: <ZzspgzXCyds04gTY@lore-desk>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-3-24bb61703ad7@kernel.org>
 <2d7e1e5e09babb468199ac44520683fcb87d697c.camel@pengutronix.de>
 <ZzsC_hW-w6WSMYSO@lore-desk>
 <1fb3166c1f520a57c19bd3103b4585eee1e57fec.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ri31TOsdNIkAAenH"
Content-Disposition: inline
In-Reply-To: <1fb3166c1f520a57c19bd3103b4585eee1e57fec.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_034823_489395_368330BC 
X-CRM114-Status: GOOD (  31.54  )
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


--ri31TOsdNIkAAenH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mo, 2024-11-18 at 10:03 +0100, Lorenzo Bianconi wrote:
> > On Nov 18, Philipp Zabel wrote:
> > > On Mo, 2024-11-18 at 09:04 +0100, Lorenzo Bianconi wrote:
> > > > In order to make the code more readable, the reset_control_bulk_ass=
ert()
> > > > for PHY reset lines is moved to make it pair with
> > > > reset_control_bulk_deassert() in mtk_pcie_power_up() and
> > > > mtk_pcie_en7581_power_up(). The same change is done for
> > > > reset_control_assert() used to assert MAC reset line.
> > > >=20
> > > > Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> > > > complete PCIe reset on MediaTek controller.
> > > >=20
> > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >  drivers/pci/controller/pcie-mediatek-gen3.c | 27 +++++++++++++++++=
++--------
> > > >  1 file changed, 19 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/=
pci/controller/pcie-mediatek-gen3.c
> > > > index 3cfcb45d31508142d28d338ff213f70de9b4e608..2b80edd4462ad4e9f2a=
5d192db7f99307113eb8a 100644
> > > > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > @@ -125,6 +125,8 @@
> > > > =20
> > > >  #define MAX_NUM_PHY_RESETS		3
> > > > =20
> > > > +#define PCIE_MTK_RESET_TIME_US		10
> > > > +
> > > >  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
> > > >  #define PCIE_EN7581_RESET_TIME_MS	100
> > > > =20
> > > > @@ -912,6 +914,14 @@ static int mtk_pcie_en7581_power_up(struct mtk=
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
> > >=20
> > > This comment is not correct anymore.
> >=20
> > I agree naming is hard, but I guess we can assume with 'bulk' we refer =
to both
> > phy and mac reset (similar to what we have in mtk_pcie_power_up()),
> > what do you think?
>=20
> My point is that the referenced (bulk) assert isn't in mtk_pcie_setup()
> anymore - it was just moved right above this comment.

ok, thx. I got what you mean now, I will fix it.

>=20
> I wonder why that delay is required at all, though. Does the reset
> controller driver return from reset_control_ops::assert before the
> reset line to the PCI controller is asserted?

We discussed it in a previous revision and Bjorn requested to have the requ=
ired delaies=20
in the PCIe driver.

https://patchwork.kernel.org/project/linux-pci/patch/aca00bd672ee576ad96d27=
9414fc0835ff31f637.1720022580.git.lorenzo@kernel.org/#26110282

Btw this the same approach we had in mtk_pcie_setup() before this series (u=
sleep_range(10, 20)).

Regards,
Lorenzo

>=20
> regards
> Philipp

--ri31TOsdNIkAAenH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZzspgwAKCRA6cBh0uS2t
rKN+AP9HOIPKClruDDjt4RHUOUvciZA0G8k4YuUoY/eDGjzeGQEAiAvQ9k7T4Sn6
rCEM7srXIMeT10dO19v/QyOYmkvLXQQ=
=kXhO
-----END PGP SIGNATURE-----

--ri31TOsdNIkAAenH--

