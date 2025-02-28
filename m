Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25646C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNrbcB2R1ATgVtCqT427JSezaKE4B2HsXYpYiE1JF2Q=; b=QaHsqvydJKT5sXfQogMC4H718p
	PPC+f4tMluTH1wvrAL0jXFtP7wG3Vl8jx00sQYJZibiH1eHza2lZ0rOw7I1llBMkdRzgn6Dysp/hf
	TmKzQN9tImMCtW+h1cpAeQHAhAb8BKhho6y80pnw+oDKwLETcr90SDkQ4TaqnFphy8q9eom3wO/Fq
	39yKUYM60iYjE7JQztEaNMo+wHdtDdodhQT0292mCJ3iZccBJE7aNY7UzGjSWghiBqqILfCFps6J1
	K5nAEobSZ7DV39OZ390Zjddzs+yDAaqHAZbfgh+QnSLmLafmtSWPNErvu+ESnPlhz/4V7iE3s9E6f
	duZYRFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzer-0000000Awez-3PJa;
	Fri, 28 Feb 2025 12:40:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzdI-0000000AwEf-3q5e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 12:38:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnzd7-0000HS-GM; Fri, 28 Feb 2025 13:38:13 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnzd7-003IP3-0u;
	Fri, 28 Feb 2025 13:38:13 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnzd7-0007DC-0c;
	Fri, 28 Feb 2025 13:38:13 +0100
Message-ID: <77fc8298ec2c214cef39c956bbf484b6229888f3.camel@pengutronix.de>
Subject: Re: [PATCH v1 2/2] phy: freescale: imx8m-pcie: assert phy reset and
 perst in power off
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan Eichenberger <eichest@gmail.com>, vkoul@kernel.org, 
	kishon@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tharvey@gateworks.com, 
	hongxing.zhu@nxp.com, francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
	Eichenberger <stefan.eichenberger@toradex.com>, stable@vger.kernel.org
Date: Fri, 28 Feb 2025 13:38:13 +0100
In-Reply-To: <20250228103959.47419-3-eichest@gmail.com>
References: <20250228103959.47419-1-eichest@gmail.com>
	 <20250228103959.47419-3-eichest@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_043824_945165_3321D507 
X-CRM114-Status: GOOD (  17.98  )
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

On Fr, 2025-02-28 at 11:38 +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>=20
> Ensure the PHY reset and perst is asserted during power-off to
> guarantee it is in a reset state upon repeated power-on calls. This
> resolves an issue where the PHY may not properly initialize during
> subsequent power-on cycles. Power-on will deassert the reset at the
> appropriate time after tuning the PHY parameters.
>=20
> During suspend/resume cycles, we observed that the PHY PLL failed to
> lock during resume when the CPU temperature increased from 65C to 75C.
> The observed errors were:
>   phy phy-32f00000.pcie-phy.3: phy poweron failed --> -110
>   imx6q-pcie 33800000.pcie: waiting for PHY ready timeout!
>   imx6q-pcie 33800000.pcie: PM: dpm_run_callback(): genpd_resume_noirq+0x=
0/0x80 returns -110
>   imx6q-pcie 33800000.pcie: PM: failed to resume noirq: error -110
>=20
> This resulted in a complete CPU freeze, which is resolved by ensuring
> the PHY is in reset during power-on, thus preventing PHY PLL failures.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 1aa97b002258 ("phy: freescale: pcie: Initialize the imx8 pcie stan=
dalone phy driver")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/fre=
escale/phy-fsl-imx8m-pcie.c
> index 00f957a42d9dc..36bef416618de 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> @@ -158,6 +158,17 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
>  	return ret;
>  }
> =20
> +static int imx8_pcie_phy_power_off(struct phy *phy)
> +{
> +	struct imx8_pcie_phy *imx8_phy =3D phy_get_drvdata(phy);
> +
> +	reset_control_assert(imx8_phy->reset);
> +	if (imx8_phy->perst)

This check is not necessary, reset_control_assert(NULL) is a no-op:

> +		reset_control_assert(imx8_phy->perst);
> +
> +	return 0;
> +}

regards
Philipp

