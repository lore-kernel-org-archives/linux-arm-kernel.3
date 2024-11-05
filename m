Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6529DD3177B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLt1Ng3h3DOybqZ9j6JAkI9vGXELqWVzuQskNeMkCyU=; b=m7mWipLTFPcY1fKMi7XgKGhOnE
	VgpGcYDr/yafIHs599zHiYCCecQl9VEsEbSlrj1693zS2xSAqlrErC8ovPBMKduC/XtjLORg2fuju
	fUcmLhcXWxU3u/LBemwlFlXzz2G27dC232rCUv47jjoySTKINwfZJuOnYP1vWnmM+uiE5xnmKf6KW
	VyHNa4Tpc6xmtfhBLjXoljIUtYbRz2WxnvI6p3A15NYDejZ3kdX2yVbHZQcngfY/Cqkixy5LoVzJm
	wY4WvR3rzNYjcbeoYGvIOH7f89i2JiNh6lK+ejps9q9AhupXaCK6KsDzQEjCGz1bwBoSoASZjvYTr
	vfggcxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8O6y-00000000LdR-1JYP;
	Tue, 05 Nov 2024 18:17:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8O3w-00000000LA7-28qf;
	Tue, 05 Nov 2024 18:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3BBE5C53DF;
	Tue,  5 Nov 2024 18:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD60C4CED1;
	Tue,  5 Nov 2024 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830435;
	bh=Xen1diBQCGTGkPai9ifyoSgzJwfYP1crTTlWxSXYi88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqSCKavngCVgtakBFoK/QNvcJ95y8UC2eRzb2nESbNueDZokzXwbZhNU6eXkXGDIE
	 PmbAaOwf33zXa3RPAIQnzyiJ/RiZlzbVC8kX/ByVVWiUEFrmMENr1ZX06kWa3OFlg7
	 Dxy3Zp/ruYbsfdTCbPXEoHeuxSMzhwAASoZQsAD0LDuFY37y2oDkVl1cjET1dPJl3e
	 fnnWCUK7WOyKctQABU15LbyG4ZhFemim+6MEvOW22b9MnmvDzR93XHU/oPnWhfVZmZ
	 HjVV7nGe3krmgq14Iv5e6kwqk/FdaL1XQuitcu87xe1YT4s9mi1uK45zfPkinl4CBy
	 Scj+bvKXgmu7w==
Date: Tue, 5 Nov 2024 19:13:52 +0100
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
Message-ID: <ZypgYOn7dcYIoW4i@lore-desk>
References: <20241104-pcie-en7581-rst-fix-v2-1-ffe5839c76d8@kernel.org>
 <20241105172254.GA1447085@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vqWK8aRdzgQTTEkC"
Content-Disposition: inline
In-Reply-To: <20241105172254.GA1447085@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_101356_691001_BF67E73D 
X-CRM114-Status: GOOD (  38.35  )
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


--vqWK8aRdzgQTTEkC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Nov 04, 2024 at 11:00:05PM +0100, Lorenzo Bianconi wrote:
> > Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> > causing occasional PCIe link down issues. In order to overcome the
> > problem, PCIE_RSTB signals are not asserted/released during device prob=
e or
> > suspend/resume phase and the PCIe block is reset using REG_PCI_CONTROL
> > (0x88) and REG_RESET_CONTROL (0x834) registers available via the clock
> > module.
> > Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
> > specify per-SoC capabilities.
>=20
> Add blank lines between paragraphs so we know where they end.

ack, I will fix it in v2.

>=20
> Where does this alternate way of doing reset (using REG_PCI_CONTROL
> and REG_RESET_CONTROL) happen?  Why isn't there something in this
> patch to use that alternate method at the same points where
> PCIE_PE_RSTB is used?

REG_RESET_CONTROL (0x834) is already asserted/released in the following flo=
w:

mtk_pcie_en7581_power_up() -> reset_control_bulk_deassert() -> en7523_reset=
_update()
https://github.com/torvalds/linux/blob/master/drivers/clk/clk-en7523.c#L470

REG_PCI_CONTROL (0x88) is already asserted/released in the following flow:
mtk_pcie_en7581_power_up() -> clk_bulk_enable() -> en7581_pci_enable()
https://github.com/torvalds/linux/blob/master/drivers/clk/clk-en7523.c#L385


>=20
> If we don't need to assert reset for Airoha EN7581, why do we need to
> do it for the other SoCs?

I guess the other SoCs (mtk ones) do not have the same hw issue with
PCIE_PE_RSTB (but I am not sure about it).

Regards,
Lorenzo

>=20
> > Tested-by: Hui Ma <hui.ma@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> > Changes in v2:
> > - introduce flags field in mtk_gen3_pcie_flags struct instead of adding
> >   reset callback
> > - fix the leftover case in mtk_pcie_suspend_noirq routine
> > - add more comments
> > - Link to v1: https://lore.kernel.org/r/20240920-pcie-en7581-rst-fix-v1=
-1-1043fb63ffc9@kernel.org
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 59 ++++++++++++++++++++-=
--------
> >  1 file changed, 41 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 66ce4b5d309bb6d64618c70ac5e0a529e0910511..8e4704ff3509867fc0ff799=
e9fb99e71e46756cd 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -125,10 +125,18 @@
> > =20
> >  struct mtk_gen3_pcie;
> > =20
> > +enum mtk_gen3_pcie_flags {
> > +	SKIP_PCIE_RSTB	=3D BIT(0), /* skip PCIE_RSTB signals configuration
> > +				   * during device probing or suspend/resume
> > +				   * phase in order to avoid hw bugs/issues.
> > +				   */
> > +};
> > +
> >  /**
> >   * struct mtk_gen3_pcie_pdata - differentiate between host generations
> >   * @power_up: pcie power_up callback
> >   * @phy_resets: phy reset lines SoC data.
> > + * @flags: pcie device flags.
> >   */
> >  struct mtk_gen3_pcie_pdata {
> >  	int (*power_up)(struct mtk_gen3_pcie *pcie);
> > @@ -136,6 +144,7 @@ struct mtk_gen3_pcie_pdata {
> >  		const char *id[MAX_NUM_PHY_RESETS];
> >  		int num_resets;
> >  	} phy_resets;
> > +	u32 flags;
> >  };
> > =20
> >  /**
> > @@ -402,22 +411,33 @@ static int mtk_pcie_startup_port(struct mtk_gen3_=
pcie *pcie)
> >  	val |=3D PCIE_DISABLE_DVFSRC_VLT_REQ;
> >  	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
> > =20
> > -	/* Assert all reset signals */
> > -	val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > -	val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> > -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > -
> >  	/*
> > -	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> > -	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> > -	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> > -	 * for the power and clock to become stable.
> > +	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> > +	 * causing occasional PCIe link down. In order to overcome the issue,
> > +	 * PCIE_RSTB signals are not asserted/released at this stage and the
> > +	 * PCIe block is reset using REG_PCI_CONTROL (0x88) and
> > +	 * REG_RESET_CONTROL (0x834) registers available via the clock module.
> >  	 */
> > -	msleep(100);
> > -
> > -	/* De-assert reset signals */
> > -	val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RS=
TB);
> > -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> > +		/* Assert all reset signals */
> > +		val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > +		val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> > +		       PCIE_PE_RSTB;
> > +		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +
> > +		/*
> > +		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> > +		 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> > +		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> > +		 * for the power and clock to become stable.
>=20
> Blank line between paragraphs.
>=20
> > +		 */
> > +		msleep(PCIE_T_PVPERL_MS);
> > +
> > +		/* De-assert reset signals */
> > +		val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> > +			 PCIE_PE_RSTB);
> > +		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +	}
> > =20
> >  	/* Check if the link is up or not */
> >  	err =3D readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
> > @@ -1160,10 +1180,12 @@ static int mtk_pcie_suspend_noirq(struct device=
 *dev)
> >  		return err;
> >  	}
> > =20
> > -	/* Pull down the PERST# pin */
> > -	val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > -	val |=3D PCIE_PE_RSTB;
> > -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> > +		/* Pull down the PERST# pin */
> > +		val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > +		val |=3D PCIE_PE_RSTB;
> > +		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +	}
> > =20
> >  	dev_dbg(pcie->dev, "entered L2 states successfully");
> > =20
> > @@ -1214,6 +1236,7 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_=
soc_en7581 =3D {
> >  		.id[2] =3D "phy-lane2",
> >  		.num_resets =3D 3,
> >  	},
> > +	.flags =3D SKIP_PCIE_RSTB,
> >  };
> > =20
> >  static const struct of_device_id mtk_pcie_of_match[] =3D {
> >=20
> > ---
> > base-commit: 3102ce10f3111e4c3b8fb233dc93f29e220adaf7
> > change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4
> >=20
> > Best regards,
> > --=20
> > Lorenzo Bianconi <lorenzo@kernel.org>
> >=20

--vqWK8aRdzgQTTEkC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZypgYAAKCRA6cBh0uS2t
rPhYAP9axhSDdzxRbZRh8iXInGX5fkpcShFz0VS//r43s9MZfgEAoiTiyWcze16t
KArG5YUlc0vzQp3pjMwBStrRVcFhVQA=
=qiMV
-----END PGP SIGNATURE-----

--vqWK8aRdzgQTTEkC--

