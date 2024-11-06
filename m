Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB64D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Co4Cm7o+722Vwic3G4+40A8vpdc/bQliumeCrtxevao=; b=T7f7MQV4RMr5XdDZJ+P6ywM+65
	dM8178DiTqBmilAp7ag6vP258zjuJvgVaTzrxCi1MeLqHzg1ce7brDSQdm1O8T8lVkJ/7cdHC/8LN
	G2IxKquuvgdTMKZRWS7Pr10PKHW8BjNend83KlPQB3LpI3tVKiWgNj8Y9FaDEK6FdVTLpIzqovL71
	+zpTgdNkDkZnkE3EiFcKXBKiaErPeCOTaMGbovdmQtsyprpygDpKLrUKfWoR4O1S0J08dAT1rE2es
	pxALND0d1RxOQyqK5ns0ahid5tBIV6125fxUGn/EsFtUkFP/ZeiOeBJDbvUivHkP4YVNPf96Y6gQY
	kaCfAl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cj9-00000002dG7-3HnD;
	Wed, 06 Nov 2024 09:53:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cB1-00000002TZR-0NFP;
	Wed, 06 Nov 2024 09:18:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 570D6A42B69;
	Wed,  6 Nov 2024 09:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972DDC4CECD;
	Wed,  6 Nov 2024 09:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730884689;
	bh=4NMKth/+tbq9G9afQXTfm7cy85P47LqxOouOqVfZs1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDEhK9dBQa10BBr5wtDZqdVJA8bS/eSLMaeRQUS9pkzteq6yS1EWPPJaoIh1qR/XJ
	 4pDiuI8um12Mvaqxra6zF2EVHhbgHx759vBgncXdJXwCYgTGvHWusoeZwdXTPeeBs3
	 zUD1Qw0qhplRnGMAF76ym23PzBu9yeV4Ph1TwcvWaN5DCRIDUn/LUCYNd+yK5IO65f
	 lrA7+HhbfyePkV8TDM3yD6h/5A4XDPNsWE9iUuMEdQX7SLlLTLXAtld27jDJcse18e
	 5jqbQIhk5EezNYY4+jYDpc7ZbNq/WZ3tqgT3GSNCuejkkjSB93lb9YalZdAafoQJyw
	 EGr+b7KD3sq+g==
Date: Wed, 6 Nov 2024 10:18:07 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Avoid PCIe resetting via
 PCIE_RSTB for Airoha EN7581 SoC
Message-ID: <Zys0T-aDIilOpq0I@lore-desk>
References: <ZypgYOn7dcYIoW4i@lore-desk>
 <20241105205748.GA1484220@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qV7Iu35SJTZV/AHc"
Content-Disposition: inline
In-Reply-To: <20241105205748.GA1484220@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_011811_279390_B1859758 
X-CRM114-Status: GOOD (  26.35  )
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


--qV7Iu35SJTZV/AHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, Nov 05, 2024 at 07:13:52PM +0100, Lorenzo Bianconi wrote:
> > > On Mon, Nov 04, 2024 at 11:00:05PM +0100, Lorenzo Bianconi wrote:
> > > > Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> > > > causing occasional PCIe link down issues. In order to overcome the
> > > > problem, PCIE_RSTB signals are not asserted/released during device =
probe or
> > > > suspend/resume phase and the PCIe block is reset using REG_PCI_CONT=
ROL
> > > > (0x88) and REG_RESET_CONTROL (0x834) registers available via the cl=
ock
> > > > module.
> > > > Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
> > > > specify per-SoC capabilities.
> > >=20
> > > Where does this alternate way of doing reset (using REG_PCI_CONTROL
> > > and REG_RESET_CONTROL) happen?  Why isn't there something in this
> > > patch to use that alternate method at the same points where
> > > PCIE_PE_RSTB is used?
> >=20
> > REG_RESET_CONTROL (0x834) is already asserted/released in the following=
 flow:
> >=20
> > mtk_pcie_en7581_power_up() -> reset_control_bulk_deassert() -> en7523_r=
eset_update()
> > https://github.com/torvalds/linux/blob/master/drivers/clk/clk-en7523.c#=
L470
> >=20
> > REG_PCI_CONTROL (0x88) is already asserted/released in the following fl=
ow:
> > mtk_pcie_en7581_power_up() -> clk_bulk_enable() -> en7581_pci_enable()
> > https://github.com/torvalds/linux/blob/master/drivers/clk/clk-en7523.c#=
L385
>=20
> So IIUC, you're saying that on EN7581, the PCI hierarchy is reset by
> the soc->power_up() callback, mtk_pcie_en7581_power_up(), via
> REG_PCI_CONTROL and REG_RESET_CONTROL.

yes, correct.

>=20
> I assume the hierarchy is also reset by the non-EN7581 .power_up()
> callback, mtk_pcie_power_up()?

as pointed out by Jianjun Wang, non-EN7581 family is reset via PCIE_RSTB
signals and .power_up() callback is used just for initialization.
For EN7581 family we need to reset the device via .power_up() callback
since we have a hw issue with PCIE_PE_RSTB signal (at least this is my
take-away :))

>=20
> And prior to this patch, we reset the hierarchy *again* in
> mtk_pcie_startup_port() via PCIE_RST_CTRL_REG, but this causes
> occasional "link down" issues because of a EN7581 hardware defect.

yes, correct

>=20
> So for EN7581, this patch skips the PCIE_RST_CTRL_REG reset in
> mtk_pcie_startup_port().

yes, correct

>=20
> .power_up() and mtk_pcie_startup_port() are used both at probe time
> and in mtk_pcie_resume_noirq().  So after this patch, I assume:
>=20
>   - EN7581 resets the hierarchy once at probe and resume instead of
>     twice.

yes, correct

>=20
>   - Non-EN7581 resets the hierarchy twice at probe and resume.

nope, just once since .power_up() does not reset the device.

Regards,
Lorenzo

>=20
> I assume I'm missing something (maybe mtk_pcie_power_up() doesn't
> actually reset the hierarchy?) because I don't see why we would reset
> the hierarchy twice for either controller.
>=20
> Bjorn

--qV7Iu35SJTZV/AHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZys0TwAKCRA6cBh0uS2t
rOs7AP9NYd+xfPZYqk/9uJmxY7WUn9qLDa6qujJG0QUeuNH09wD+IXpITgFNY5yk
GuelOGXgAUV65fTPir1SMcf5eaviiAY=
=XurC
-----END PGP SIGNATURE-----

--qV7Iu35SJTZV/AHc--

