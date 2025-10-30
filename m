Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66C7CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oz0ZhBQQWSFQZWJgTI1NfCDVGIjRIKKmdygZqOMsjqk=; b=fvEmES/HFDFnLxy1sFfgv7RRqS
	k0pSc4ZUqnkZXppZXMehvHiJyfDQs32uYKem4y/wMxSqf3pVzmBmnRIaJBH6kTMzqxWH3ZUcAs3su
	FwE772nfcPfsncblR3QIVxOugwDQEWGxo5p4NaG9MN2cfwPKP2vTLFSU7JL4lFmF/4bNdcdnzaZCH
	3iB6lMrJpPsXtUT0fXukQcFeRQw7Ke3bTJoxC9A1ue7ZeePH5yPDjMrOYA5wuiXN1+2ZUzFId/z/v
	LZVWkFQBxKA08Ol4QTLlVwWHp5hTsA1jQQ2dtTRNqPaocT4381vD6Tt2SH4Phe816ejjlTy7el4uW
	W/zlw+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQIy-000000041rY-0y9o;
	Thu, 30 Oct 2025 10:54:56 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQIq-000000041qm-1bTP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:54:55 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Oz0ZhBQQWSFQZWJgTI1NfCDVGIjRIKKmdygZqOMsjqk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761821671;
 b=fSxpj/g2OrSXjlM054LNC8yqqX4u49DttsfmP6+Zm3yeW8bsPmF3D7rCxsS6sjOkQtUoKHAz
 zZ1ScFAp/cEQJkRvfIyWQgQbosu60cwMdStOO+nD58Xu5wSuKfFrPAxRHogG9pOiKgJCKEynPih
 aGUOe1XdbqaiqusUV1g7Y7oUU6RHyj4Z0Tk6bEAovhYCSHcc5vzo+9XPQCw0vAX1e8w35ECk2hk
 N12eKQwpLNeYwl1oY97eeSBPV7FGATyMw5AK8z3LAjbRpQJbn2bc+eL3MJKJecHFBwOBZS7JMJL
 1D5pCERHcJhzSVA8Jg2QQMS4QstKIp2rJ9Zs3TlCtvzxA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761821671;
 b=oo2kLVJdvS8VXD/w/Jo28i4PTUYD8G8M8m9gPjO5pFzhWX3q9pOOFHhGX5043xgsmaicJQCj
 S38FUq6GMzLB78GY5rhOzx1kBGD/JPjHVpXGytwIy0Id2nRPlZ3wWity1Xdnp6WjnmRwH83UUNQ
 t5zUozKIZBPfhh4AoVtmtH0ic3Od3CNNh8hYKoKVjk1L/e3/eaTTwifI6+HHBbyG5R1Htze7D+a
 s9pdg8OGbxdMoQBsSZPtsPByLgFxN6RIurn4B+VQibm2uvlvGtd8APfN2sKSjhK2jkPwo1EadeR
 JTHv6AYBKnmgJegIYNHIySLny/P7XVeFcuLRJQF0Kpg6A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 30 Oct 2025 11:54:30 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 257195A0A3E;
	Thu, 30 Oct 2025 11:54:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
 Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v6 10/11] PCI: imx6: Add CLKREQ# override to enable REFCLK for
 i.MX95 PCIe
Date: Thu, 30 Oct 2025 11:54:11 +0100
Message-ID: <3022129.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251015030428.2980427-11-hongxing.zhu@nxp.com>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
 <20251015030428.2980427-11-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4cy1Fd1F7pz2nGYZ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 868febba0787f9587ee8ceef14de3c14
X-cloud-security: scantime:1.954
DKIM-Signature: a=rsa-sha256;
 bh=Oz0ZhBQQWSFQZWJgTI1NfCDVGIjRIKKmdygZqOMsjqk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761821670; v=1;
 b=Wqm2MaO6R4mH7aGCkUXzhDxxpzOtV2zwXMXqpB7d+Qr2+tYBQCfe2yto4YdMlUa6fmnqjUWS
 IbB64sU7qlF36zoFrMb+iHGtc1epKHQr9ljyxdxxyQ69R5jwS7TuMXoj+m87m4mwXHFMu/2AVhY
 /Ni5vsJlE+rVdKJAJgRGB7WS5IcKyGy5CKErw4t6KvZQEleg+AW2uJDaUUTzVoT9dXOv4HW4TAj
 lpmKaN936kg2bXPhtEb8nKSdvTKnKqjPUAKeudIAuVZW8o4YN34/8Nmla0I8TfQGHuiqLbmp+8i
 mCXkuV6I8atZP+PIKDm+MK79Jl07oIwn6vIDRV9ml/jCw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_035448_806492_4E778C29 
X-CRM114-Status: GOOD (  21.77  )
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

Hi,

Am Mittwoch, 15. Oktober 2025, 05:04:27 CET schrieb Richard Zhu:
> The CLKREQ# is an open drain, active low signal that is driven low by
> the card to request reference clock. It's an optional signal added in
> PCIe CEM r4.0, sec 2. Thus, this signal wouldn't be driven low if it's
> reserved.
>=20
> On i.MX95 EVK board, the PCIe slot connected to the second PCIe
> controller is one standard PCIe slot. The default voltage of CLKREQ# is
> not active low, and may not be driven to active low due to the potential
> scenario listed above (e.x INTEL e1000e network card).
>=20
> Since the reference clock controlled by CLKREQ# is required by i.MX95
> PCIe host too. To make sure this clock is ready even when the CLKREQ#
> isn't driven low by the card(e.x the scenario described above), force
> CLKREQ# override active low for i.MX95 PCIe host to enable reference
> clock.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Thanks, this is actually required on TQMa95xxSA.
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controll=
er/dwc/pci-imx6.c
> index a60fe7c337e08..aa5a4900d0eb6 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -52,6 +52,8 @@
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
>  #define IMX95_PCIE_SS_RW_REG_1			0xf4
> +#define IMX95_PCIE_CLKREQ_OVERRIDE_EN		BIT(8)
> +#define IMX95_PCIE_CLKREQ_OVERRIDE_VAL		BIT(9)
>  #define IMX95_PCIE_SYS_AUX_PWR_DET		BIT(31)
> =20
>  #define IMX95_PE0_GEN_CTRL_1			0x1050
> @@ -711,6 +713,22 @@ static int imx7d_pcie_enable_ref_clk(struct imx_pcie=
 *imx_pcie, bool enable)
>  	return 0;
>  }
> =20
> +static void  imx95_pcie_clkreq_override(struct imx_pcie *imx_pcie, bool =
enable)
> +{
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
> +			   IMX95_PCIE_CLKREQ_OVERRIDE_EN,
> +			   enable ? IMX95_PCIE_CLKREQ_OVERRIDE_EN : 0);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
> +			   IMX95_PCIE_CLKREQ_OVERRIDE_VAL,
> +			   enable ? IMX95_PCIE_CLKREQ_OVERRIDE_VAL : 0);
> +}
> +
> +static int imx95_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool ena=
ble)
> +{
> +	imx95_pcie_clkreq_override(imx_pcie, enable);
> +	return 0;
> +}
> +
>  static int imx_pcie_clk_enable(struct imx_pcie *imx_pcie)
>  {
>  	struct dw_pcie *pci =3D imx_pcie->pci;
> @@ -1918,6 +1936,7 @@ static const struct imx_pcie_drvdata drvdata[] =3D {
>  		.core_reset =3D imx95_pcie_core_reset,
>  		.init_phy =3D imx95_pcie_init_phy,
>  		.wait_pll_lock =3D imx95_pcie_wait_for_phy_pll_lock,
> +		.enable_ref_clk =3D imx95_pcie_enable_ref_clk,
>  	},
>  	[IMX8MQ_EP] =3D {
>  		.variant =3D IMX8MQ_EP,
> @@ -1974,6 +1993,7 @@ static const struct imx_pcie_drvdata drvdata[] =3D {
>  		.core_reset =3D imx95_pcie_core_reset,
>  		.wait_pll_lock =3D imx95_pcie_wait_for_phy_pll_lock,
>  		.epc_features =3D &imx95_pcie_epc_features,
> +		.enable_ref_clk =3D imx95_pcie_enable_ref_clk,
>  		.mode =3D DW_PCIE_EP_TYPE,
>  	},
>  };
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



