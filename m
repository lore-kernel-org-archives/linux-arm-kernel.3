Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CBAD29FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqJx/AaxPTRH/AP1mgD6YXLV2DiWeP8nE2+BhXNwMT4=; b=t4gez0URlMErOg/Hv+Vplepe1c
	0bRsYkGe3qYJzVe6EpUJu8HWIzSMKQLhdgB+EdTob1f5mSSBAc+RzVnNRFMi7cajaxQjRVFT4X/Uf
	Ip2GOE1AL8mael7XWr5l/ki5oPlv5DVgCDTlAzdLqKw5tW5uotPoZUplEMAxeLlcJLCUvyp8MfHCE
	buoQBLg7JGAx6YOw7uxNihTWrHIFzrOGsCiBxPlvZFamXEv/hyzvaknUbmAkhZQXcloKOCyY3r3jk
	dXsNawp7b2LMRUymRks7ZyPCDtPSdQRI+7lSNuEfu65MXFnKSpWJJMXdgLuikxs6Q7a9bESZDCvU4
	/anXR2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bx4-00000002OVo-14fJ;
	Wed, 06 Nov 2024 09:03:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8btp-00000002Npk-2Xt8;
	Wed, 06 Nov 2024 09:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 381D65C110D;
	Wed,  6 Nov 2024 08:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2688DC4CECD;
	Wed,  6 Nov 2024 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730883624;
	bh=i4Ev19x4r1KpbvsNuBMn0gkQ2RGKLU2bi+TU9lP0swg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HuPtxo8QtJejlT7FWdhi+ZC8IzeIO6l6ngKU++Yr3bMu61u89/BFVWM6IkuiRj/tm
	 Pcyis3k88IwX3dPVP2WNjsUvuCDp9/kbzDSbJOMjjmgvcJ0ztAF4VQ5OncpJFfKHTI
	 3xIin/lcTQZxfqEXjsC+Qy2VbsLIHiOpgkk4xZpPEA9JR1c9qs8lkr7FRdyfQthBHd
	 6pFnyVA/w6D/J/KXtUrDJdPf84Ax5yJ/fuqknn3rD5/+I+C97Wk/4YOGfuMH2YiPCp
	 Ijt8Pmj9rhEJpOo5qZoKzdp3QlD4QlQS+aypv2rW5yO+gSSEm8kCDhF80YZ1GCuF3/
	 P0Y6ON40TqL9g==
Date: Wed, 6 Nov 2024 10:00:21 +0100
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"ansuelsmth@gmail.com" <ansuelsmth@gmail.com>,
	Hui Ma =?utf-8?B?KOmprOaFpyk=?= <Hui.Ma@airoha.com>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	upstream <upstream@airoha.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Avoid PCIe resetting via
 PCIE_RSTB for Airoha EN7581 SoC
Message-ID: <ZyswJbwWOaElvpdr@lore-desk>
References: <20241104-pcie-en7581-rst-fix-v2-1-ffe5839c76d8@kernel.org>
 <f827f7c45094722aa3c254eda32ada157156444a.camel@mediatek.com>
 <Zynlw7wzyeucc2iT@lore-desk>
 <d6faf3f169c33d3c9c392c0cc4ef9efe517fdcdf.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="27J7gfKq5EBYskZa"
Content-Disposition: inline
In-Reply-To: <d6faf3f169c33d3c9c392c0cc4ef9efe517fdcdf.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010025_758120_C054AF2B 
X-CRM114-Status: GOOD (  40.56  )
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


--27J7gfKq5EBYskZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 2024-11-05 at 10:30 +0100, lorenzo@kernel.org wrote:
> > > On Mon, 2024-11-04 at 23:00 +0100, Lorenzo Bianconi wrote:
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > >=20
> > > >=20
> > > > Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB
> > > > signal
> > > > causing occasional PCIe link down issues. In order to overcome
> > > > the
> > > > problem, PCIE_RSTB signals are not asserted/released during
> > > > device
> > > > probe or
> > > > suspend/resume phase and the PCIe block is reset using
> > > > REG_PCI_CONTROL
> > > > (0x88) and REG_RESET_CONTROL (0x834) registers available via the
> > > > clock
> > > > module.
> > > > Introduce flags field in the mtk_gen3_pcie_pdata struct in order
> > > > to
> > > > specify per-SoC capabilities.
> > > >=20
> > > > Tested-by: Hui Ma <hui.ma@airoha.com>
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > > Changes in v2:
> > > > - introduce flags field in mtk_gen3_pcie_flags struct instead of
> > > > adding
> > > >   reset callback
> > > > - fix the leftover case in mtk_pcie_suspend_noirq routine
> > > > - add more comments
> > > > - Link to v1:=20
> > > >=20
> https://lore.kernel.org/r/20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@=
kernel.org
> > > > ---
> > > >  drivers/pci/controller/pcie-mediatek-gen3.c | 59
> > > > ++++++++++++++++++++---------
> > > >  1 file changed, 41 insertions(+), 18 deletions(-)
> > > >=20
> > > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > index
> > > > 66ce4b5d309bb6d64618c70ac5e0a529e0910511..8e4704ff3509867fc0ff799
> > > > e9fb
> > > > 99e71e46756cd 100644
> > > > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > @@ -125,10 +125,18 @@
> > > >=20
> > > >  struct mtk_gen3_pcie;
> > > >=20
> > > > +enum mtk_gen3_pcie_flags {
> > > > +       SKIP_PCIE_RSTB  =3D BIT(0), /* skip PCIE_RSTB signals
> > > > configuration
> > > > +                                  * during device probing or
> > > > suspend/resume
> > > > +                                  * phase in order to avoid hw
> > > > bugs/issues.
> > > > +                                  */
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct mtk_gen3_pcie_pdata - differentiate between host
> > > > generations
> > > >   * @power_up: pcie power_up callback
> > > >   * @phy_resets: phy reset lines SoC data.
> > > > + * @flags: pcie device flags.
> > > >   */
> > > >  struct mtk_gen3_pcie_pdata {
> > > >         int (*power_up)(struct mtk_gen3_pcie *pcie);
> > > > @@ -136,6 +144,7 @@ struct mtk_gen3_pcie_pdata {
> > > >                 const char *id[MAX_NUM_PHY_RESETS];
> > > >                 int num_resets;
> > > >         } phy_resets;
> > > > +       u32 flags;
> > > >  };
> > > >=20
> > > >  /**
> > > > @@ -402,22 +411,33 @@ static int mtk_pcie_startup_port(struct
> > > > mtk_gen3_pcie *pcie)
> > > >         val |=3D PCIE_DISABLE_DVFSRC_VLT_REQ;
> > > >         writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
> > > >=20
> > > > -       /* Assert all reset signals */
> > > > -       val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > > > -       val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> > > > PCIE_PE_RSTB;
> > > > -       writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > > > -
> > > >         /*
> > > > -        * Described in PCIe CEM specification sections 2.2
> > > > (PERST#
> > > > Signal)
> > > > -        * and 2.2.1 (Initial Power-Up (G3 to S0)).
> > > > -        * The deassertion of PERST# should be delayed 100ms
> > > > (TPVPERL)
> > > > -        * for the power and clock to become stable.
> > > > +        * Airoha EN7581 has a hw bug asserting/releasing
> > > > PCIE_PE_RSTB signal
> > > > +        * causing occasional PCIe link down. In order to
> > > > overcome
> > > > the issue,
> > > > +        * PCIE_RSTB signals are not asserted/released at this
> > > > stage
> > > > and the
> > > > +        * PCIe block is reset using REG_PCI_CONTROL (0x88) and
> > > > +        * REG_RESET_CONTROL (0x834) registers available via the
> > > > clock module.
> > > >          */
> > > > -       msleep(100);
> > > > -
> > > > -       /* De-assert reset signals */
> > > > -       val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> > > > PCIE_PE_RSTB);
> > > > -       writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > >=20
> > > What will happen if the EN7581 use this reset flow? Will it still
> > > work
> > > after this link down?
> >=20
> > Hi Jianjun Wang,
> >=20
> > This has been described here by Hui Ma:
> >=20
> https://lore.kernel.org/r/20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@=
kernel.org
> >=20
> > Setting PCIE_PE_RSTB bit on EN7581 SoC during reset triggers
> > occasional PCIe link
> > down issues caused by a hw problem.
>=20
> Hi Lorenzo,
>=20
> I'm wondering if we can ignore the previous reset and take this one as
> the initial reset?

Hi Jianjun Wang,

according to my understanding from Hui Ma's description, EN7581 has a hw is=
sue
with PCIE_PE_RSTB and it can't rely on it.

Regards,
Lorenzo

>=20
> Thanks.
>=20
> >=20
> > Regards,
> > Lorenzo
> >=20
> > >=20
> > > > +       if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> > > > +               /* Assert all reset signals */
> > > > +               val =3D readl_relaxed(pcie->base +
> > > > PCIE_RST_CTRL_REG);
> > > > +               val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB |
> > > > PCIE_BRG_RSTB
> > > > >=20
> > > >=20
> > > > +                      PCIE_PE_RSTB;
> > > > +               writel_relaxed(val, pcie->base +
> > > > PCIE_RST_CTRL_REG);
> > > > +
> > > > +               /*
> > > > +                * Described in PCIe CEM specification sections
> > > > 2.2
> > > > (PERST# Signal)
> > > > +                * and 2.2.1 (Initial Power-Up (G3 to S0)).
> > > > +                * The deassertion of PERST# should be delayed
> > > > 100ms
> > > > (TPVPERL)
> > > > +                * for the power and clock to become stable.
> > > > +                */
> > > > +               msleep(PCIE_T_PVPERL_MS);
> > > > +
> > > > +               /* De-assert reset signals */
> > > > +               val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB |
> > > > PCIE_BRG_RSTB |
> > > > +                        PCIE_PE_RSTB);
> > > > +               writel_relaxed(val, pcie->base +
> > > > PCIE_RST_CTRL_REG);
> > > > +       }
> > > >=20
> > > >         /* Check if the link is up or not */
> > > >         err =3D readl_poll_timeout(pcie->base +
> > > > PCIE_LINK_STATUS_REG,
> > > > val,
> > > > @@ -1160,10 +1180,12 @@ static int mtk_pcie_suspend_noirq(struct
> > > > device *dev)
> > > >                 return err;
> > > >         }
> > > >=20
> > > > -       /* Pull down the PERST# pin */
> > > > -       val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > > > -       val |=3D PCIE_PE_RSTB;
> > > > -       writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > > > +       if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> > > > +               /* Pull down the PERST# pin */
> > > > +               val =3D readl_relaxed(pcie->base +
> > > > PCIE_RST_CTRL_REG);
> > > > +               val |=3D PCIE_PE_RSTB;
> > > > +               writel_relaxed(val, pcie->base +
> > > > PCIE_RST_CTRL_REG);
> > > > +       }
> > > >=20
> > > >         dev_dbg(pcie->dev, "entered L2 states successfully");
> > > >=20
> > > > @@ -1214,6 +1236,7 @@ static const struct mtk_gen3_pcie_pdata
> > > > mtk_pcie_soc_en7581 =3D {
> > > >                 .id[2] =3D "phy-lane2",
> > > >                 .num_resets =3D 3,
> > > >         },
> > > > +       .flags =3D SKIP_PCIE_RSTB,
> > > >  };
> > > >=20
> > > >  static const struct of_device_id mtk_pcie_of_match[] =3D {
> > > >=20
> > > > ---
> > > > base-commit: 3102ce10f3111e4c3b8fb233dc93f29e220adaf7
> > > > change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4
> > > >=20
> > > > Best regards,
> > > > --
> > > > Lorenzo Bianconi <lorenzo@kernel.org>
> > > >=20
> > > >=20

--27J7gfKq5EBYskZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZyswJQAKCRA6cBh0uS2t
rAcUAQCfSbnSXBZoz2p99kl/DLMEJDu8StYkAzJCea9jv4M2zQEA3NVek08N+ECj
QkLXfccmP+v5A3BTdmoXxyivSYp55QU=
=SGcr
-----END PGP SIGNATURE-----

--27J7gfKq5EBYskZa--

