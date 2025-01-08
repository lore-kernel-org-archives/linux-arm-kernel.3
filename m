Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88FCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn3AnsWhqBgv8hcueIuiEwqJryPTQCqYb9D4mwqFG34=; b=CePKrkjPobPEdPqiN5hmvAqEC/
	xBealDSNZCe8XGXaCfg1KNtwROYfZlL6tKoOhtOEMCPNarCNktww51fEfXJHyDBHk6rhNfM6rv3RK
	wrH42P8Y2VmExmlEEnF8QJ1eAf0g1ASKOuvEeA/NWSJBd6ETz2Io++qMINpWVS35BonjyuO7B3O+S
	LlP4QCq9K7lcldbyVLiFgfWHdWXeC7srN5uXbSec9zHgqU5AaKjykTpA5nqdk0M4gQEcYDbwMOxl/
	AEnhq1oEhwj562+iU3KuWTJAhGcoMHCpCvo6w68H2Ka89A7GPn9jkCCSDRF4UvKqsA2dSiLg7TutI
	+zKub+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSlY-00000007sYj-0fSw;
	Wed, 08 Jan 2025 09:54:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSZW-00000007puM-09ji;
	Wed, 08 Jan 2025 09:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6B785C2735;
	Wed,  8 Jan 2025 09:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF3EC4CEE0;
	Wed,  8 Jan 2025 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736329312;
	bh=EntXp4xoflKbAqPs1HYoj7ukYN+nnJIPOzYENz4cHvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZmBJBt3ye5TWgQ2ebPu+INxrnEO7li5c1DTwrmISGqEEPqqEJbpeHBgfqe+0wxPYb
	 l/sISxNY67Y+aQ85lTp78YdVXn7i3WjvUjRjOqIaVWyp9l42NN2lnJGlJX6LSwbHkP
	 FKRQq/N4Gg6pE0NgXR9vPAi7cl9RuLQwKKR/kUOQeleLZ+8pNAYZLJTjci/2zlxh0G
	 ajkzB8tcdSN9v7z5QOl6TlroM9nC4lhKTuD1F6hQeR/1d0oIYpuGHESFsCjseXxmtp
	 dIcziBACMLrsq9c7A3mn6gHWqWohkKzW7L4WD8IiboSaDR1A8e8rqNGGMqsHFH5jwf
	 zVwMC/GGy2BmQ==
Date: Wed, 8 Jan 2025 10:41:49 +0100
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
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 5/6] PCI: mediatek-gen3: Add reset delay in
 mtk_pcie_en7581_power_up()
Message-ID: <Z35IXRLX0xDX7Kr7@lore-desk>
References: <20241130-pcie-en7581-fixes-v5-5-dbffe41566b3@kernel.org>
 <20250103183527.GA3959656@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UfOoG4Z6S4fyWZJw"
Content-Disposition: inline
In-Reply-To: <20250103183527.GA3959656@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_014154_159777_6CC288D9 
X-CRM114-Status: GOOD (  26.00  )
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


--UfOoG4Z6S4fyWZJw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> If you repost this series, here are a few comments/typos.  Otherwise
> we can do the trivial updates on the branch.
>=20
> In subject: this patch doesn't *add* a delay; it *moves* it.

ack, I will fix it.

>=20
> On Sat, Nov 30, 2024 at 12:20:14AM +0100, Lorenzo Bianconi wrote:
> > Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> > causing occasional PCIe link down issues. In order to overcome the
> > problem, PCIe block is reset using REG_PCI_CONTROL (0x88) and
> > REG_RESET_CONTROL (0x834) registers available in the clock module
> > running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
>=20
> Add parens after clk_bulk_prepare_enable.

ack, I will fix it.

>=20
> > In order to make the code more readable, move the wait for the time
> > needed to complete the PCIe reset from en7581_pci_enable() to
> > mtk_pcie_en7581_power_up().
> > Reduce reset timeout from 250ms to the standard PCIE_T_PVPERL_MS value
> > (100ms) since it has no impact on the driver behavior.
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/clk/clk-en7523.c                    | 1 -
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 7 +++++++
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 22fbea61c3dcc05e63f8fa37e203c62b2a6fe79e..bf9d9594bef8a54316e28e5=
6a1642ecb0562377a 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -393,7 +393,6 @@ static int en7581_pci_enable(struct clk_hw *hw)
> >  	       REG_PCI_CONTROL_PERSTOUT;
> >  	val =3D readl(np_base + REG_PCI_CONTROL);
> >  	writel(val | mask, np_base + REG_PCI_CONTROL);
> > -	msleep(250);
> > =20
> >  	return 0;
> >  }
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 01e8fde96080fa55f6c23c7d1baab6e22c49fcff..da01e741ff290464d28e172=
879520dbe0670cc41 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -977,6 +977,13 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen=
3_pcie *pcie)
> >  		goto err_clk_prepare_enable;
> >  	}
> > =20
> > +	/*
> > +	 * Airoha EN7581 performs PCIe reset via clk callabacks since it has a
> > +	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
> > +	 * complete the PCIe reset.
>=20
> s/callabacks/callbacks/

ack, I will fix it.

Regards,
Lorenzo

>=20
> > +	 */
> > +	msleep(PCIE_T_PVPERL_MS);
> > +
> >  	return 0;
> > =20
> >  err_clk_prepare_enable:
> >=20
> > --=20
> > 2.47.0
> >=20

--UfOoG4Z6S4fyWZJw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ35IXQAKCRA6cBh0uS2t
rNfuAP95qW2o5+5pMdA45lJJrd8AAwCrPov/N/UcDypJjjfnsQEAlJiNopVu7YmP
HOKH4pXQZe272nswX6233GV357WPqwk=
=k4Zn
-----END PGP SIGNATURE-----

--UfOoG4Z6S4fyWZJw--

