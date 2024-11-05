Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B7BD1266B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBxVe74TUW4Sa40fftaBabwsgDofK+9kbApN0kNzAQM=; b=O9j6GRB+lAcZO1bO/8xOH0hTa/
	cyKyKEBRdqXhO06Fz7Eqh501xPM6ndSeSY3ibFeMlAs9/a/c7TvC7qv5C8O3AbSY1Qt0MWRm1+bZT
	nu5B0k1S7+TcaDyWRwHYCVyEnluOfFLEtbzBMHJa+fX/VoSBJbCd+fY2Lf86/WBpy4QMOK0pZ/Qx2
	J80PJoHe3zjnC1xBF3GSW1GU75E6GEOklvoVxNbjkoS0sKNsk4g5fAR209GhGyG5+whPkJ8vl5bv/
	BU+86ZxBqjXbEMmTUd7G3AEDZ5xOW4H4t02IaunYC4WOqQGQc3FIyAkmjvFAXZFhu5kazo5w5KURw
	lP5KTOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FvU-0000000GWAw-0KXc;
	Tue, 05 Nov 2024 09:32:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Ftf-0000000GVhR-4Abn;
	Tue, 05 Nov 2024 09:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6645A42AC3;
	Tue,  5 Nov 2024 09:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2ECC4CED0;
	Tue,  5 Nov 2024 09:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730799046;
	bh=wD7Ku+dp3TRfaC33XVIacX8vDPJh3iGoX10yurCvEc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSAkGpNhRVn3zeOKfWHkwe5uQKY9m7tlGbb8qImA8uEDWbNCc2ZQdM5cKi6iEDua7
	 RJNwXM8FsR5CcS9epTO95fu+uO5Q1A19gZKeU4WPCCPw8wttld0ipr2kuxK3bp1tYk
	 vcR2nrd8vFbOmj8evFhs7vWTvEF3fz/oNMNvQHwfu3fK9qxDHFp96/AQ6ssIjujPuR
	 J6AU39fEcSJn1EBMg/reOC18IOVI/f+Y79EMYNdHLoLRlFi/FcYU4b8SV/vFsKvUVN
	 zATOqvitxI2XuADyMmiWYOotjUMYcyw906uaOIucy7T9+Q21t9qRdEGtpGE5uuzHPk
	 1KpVubyxGK3zA==
Date: Tue, 5 Nov 2024 10:30:43 +0100
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"ansuelsmth@gmail.com" <ansuelsmth@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Hui Ma =?utf-8?B?KOmprOaFpyk=?= <Hui.Ma@airoha.com>,
	upstream <upstream@airoha.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Avoid PCIe resetting via
 PCIE_RSTB for Airoha EN7581 SoC
Message-ID: <Zynlw7wzyeucc2iT@lore-desk>
References: <20241104-pcie-en7581-rst-fix-v2-1-ffe5839c76d8@kernel.org>
 <f827f7c45094722aa3c254eda32ada157156444a.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L6mUGOkmvFBV9Ceu"
Content-Disposition: inline
In-Reply-To: <f827f7c45094722aa3c254eda32ada157156444a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_013048_199788_2631BED8 
X-CRM114-Status: GOOD (  33.88  )
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


--L6mUGOkmvFBV9Ceu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 2024-11-04 at 23:00 +0100, Lorenzo Bianconi wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> > causing occasional PCIe link down issues. In order to overcome the
> > problem, PCIE_RSTB signals are not asserted/released during device
> > probe or
> > suspend/resume phase and the PCIe block is reset using
> > REG_PCI_CONTROL
> > (0x88) and REG_RESET_CONTROL (0x834) registers available via the
> > clock
> > module.
> > Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
> > specify per-SoC capabilities.
> >=20
> > Tested-by: Hui Ma <hui.ma@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> > Changes in v2:
> > - introduce flags field in mtk_gen3_pcie_flags struct instead of
> > adding
> >   reset callback
> > - fix the leftover case in mtk_pcie_suspend_noirq routine
> > - add more comments
> > - Link to v1:=20
> > https://lore.kernel.org/r/20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc=
9@kernel.org
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 59
> > ++++++++++++++++++++---------
> >  1 file changed, 41 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> > b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index
> > 66ce4b5d309bb6d64618c70ac5e0a529e0910511..8e4704ff3509867fc0ff799e9fb
> > 99e71e46756cd 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -125,10 +125,18 @@
> >=20
> >  struct mtk_gen3_pcie;
> >=20
> > +enum mtk_gen3_pcie_flags {
> > +       SKIP_PCIE_RSTB  =3D BIT(0), /* skip PCIE_RSTB signals
> > configuration
> > +                                  * during device probing or
> > suspend/resume
> > +                                  * phase in order to avoid hw
> > bugs/issues.
> > +                                  */
> > +};
> > +
> >  /**
> >   * struct mtk_gen3_pcie_pdata - differentiate between host
> > generations
> >   * @power_up: pcie power_up callback
> >   * @phy_resets: phy reset lines SoC data.
> > + * @flags: pcie device flags.
> >   */
> >  struct mtk_gen3_pcie_pdata {
> >         int (*power_up)(struct mtk_gen3_pcie *pcie);
> > @@ -136,6 +144,7 @@ struct mtk_gen3_pcie_pdata {
> >                 const char *id[MAX_NUM_PHY_RESETS];
> >                 int num_resets;
> >         } phy_resets;
> > +       u32 flags;
> >  };
> >=20
> >  /**
> > @@ -402,22 +411,33 @@ static int mtk_pcie_startup_port(struct
> > mtk_gen3_pcie *pcie)
> >         val |=3D PCIE_DISABLE_DVFSRC_VLT_REQ;
> >         writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
> >=20
> > -       /* Assert all reset signals */
> > -       val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > -       val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> > PCIE_PE_RSTB;
> > -       writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > -
> >         /*
> > -        * Described in PCIe CEM specification sections 2.2 (PERST#
> > Signal)
> > -        * and 2.2.1 (Initial Power-Up (G3 to S0)).
> > -        * The deassertion of PERST# should be delayed 100ms
> > (TPVPERL)
> > -        * for the power and clock to become stable.
> > +        * Airoha EN7581 has a hw bug asserting/releasing
> > PCIE_PE_RSTB signal
> > +        * causing occasional PCIe link down. In order to overcome
> > the issue,
> > +        * PCIE_RSTB signals are not asserted/released at this stage
> > and the
> > +        * PCIe block is reset using REG_PCI_CONTROL (0x88) and
> > +        * REG_RESET_CONTROL (0x834) registers available via the
> > clock module.
> >          */
> > -       msleep(100);
> > -
> > -       /* De-assert reset signals */
> > -       val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> > PCIE_PE_RSTB);
> > -       writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
>=20
> What will happen if the EN7581 use this reset flow? Will it still work
> after this link down?

Hi Jianjun Wang,

This has been described here by Hui Ma:
https://lore.kernel.org/r/20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@ke=
rnel.org

Setting PCIE_PE_RSTB bit on EN7581 SoC during reset triggers occasional PCI=
e link
down issues caused by a hw problem.

Regards,
Lorenzo

>=20
> > +       if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> > +               /* Assert all reset signals */
> > +               val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > +               val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB
> > |
> > +                      PCIE_PE_RSTB;
> > +               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +
> > +               /*
> > +                * Described in PCIe CEM specification sections 2.2
> > (PERST# Signal)
> > +                * and 2.2.1 (Initial Power-Up (G3 to S0)).
> > +                * The deassertion of PERST# should be delayed 100ms
> > (TPVPERL)
> > +                * for the power and clock to become stable.
> > +                */
> > +               msleep(PCIE_T_PVPERL_MS);
> > +
> > +               /* De-assert reset signals */
> > +               val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB |
> > PCIE_BRG_RSTB |
> > +                        PCIE_PE_RSTB);
> > +               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +       }
> >=20
> >         /* Check if the link is up or not */
> >         err =3D readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG,
> > val,
> > @@ -1160,10 +1180,12 @@ static int mtk_pcie_suspend_noirq(struct
> > device *dev)
> >                 return err;
> >         }
> >=20
> > -       /* Pull down the PERST# pin */
> > -       val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > -       val |=3D PCIE_PE_RSTB;
> > -       writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +       if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> > +               /* Pull down the PERST# pin */
> > +               val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > +               val |=3D PCIE_PE_RSTB;
> > +               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +       }
> >=20
> >         dev_dbg(pcie->dev, "entered L2 states successfully");
> >=20
> > @@ -1214,6 +1236,7 @@ static const struct mtk_gen3_pcie_pdata
> > mtk_pcie_soc_en7581 =3D {
> >                 .id[2] =3D "phy-lane2",
> >                 .num_resets =3D 3,
> >         },
> > +       .flags =3D SKIP_PCIE_RSTB,
> >  };
> >=20
> >  static const struct of_device_id mtk_pcie_of_match[] =3D {
> >=20
> > ---
> > base-commit: 3102ce10f3111e4c3b8fb233dc93f29e220adaf7
> > change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4
> >=20
> > Best regards,
> > --
> > Lorenzo Bianconi <lorenzo@kernel.org>
> >=20
> >=20

--L6mUGOkmvFBV9Ceu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZynlwwAKCRA6cBh0uS2t
rFxWAP9PUHO0llmItHlvgbjEkcGgwOKr6G17jWbaL4PQFfCyCAEAm31MqrwoAdHZ
Hbkh0lxa4mw3Sc4xDrNDcCn9vaLtrwg=
=N7oE
-----END PGP SIGNATURE-----

--L6mUGOkmvFBV9Ceu--

