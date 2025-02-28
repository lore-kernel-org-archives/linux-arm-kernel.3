Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AE3C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AYUM1ue2TI7dVh8rSX496agwxXm7ZjH1O/xvY21wAI=; b=hVeeUVIKBk3B+dImLDQY06httg
	XTVDp5d3ejoW2NCI1R/MzPZSLjjxqvIw/FrLZ9C4ZtAw8FMImdXFVOC6WZUWFjOCCCokLwt4RrqAB
	dSqHbPMCc0hQ6H34ces7sUGRMF+bh7JlVisPH6xIXShLv5ybLzRQg0tUKqRID5S3WjwrOXRmJWlnB
	Cqh4FFW+mb+kmbJVlzYLfiYNH7lNWqH4OMQnxqsALxjS1uV4jmRjTs6rm0d/OVeIYoci2gZ1Q9Wfv
	bZTGHvICwCwnFfrfOKbbLyj4Uw/QbjzxAI5F6UxQo7q/hU6V6VyAm2f5LJwsFVl3FQ5JKRVJr8IGY
	6ZWTQM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzhw-0000000AxPF-1B7r;
	Fri, 28 Feb 2025 12:43:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzdJ-0000000AwEs-3IUK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 12:38:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnzd6-0000H9-Kc; Fri, 28 Feb 2025 13:38:12 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnzd5-003IOz-2H;
	Fri, 28 Feb 2025 13:38:11 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnzd5-0007Cv-20;
	Fri, 28 Feb 2025 13:38:11 +0100
Message-ID: <c965906ea8797385399534e974cabdba5564ae0f.camel@pengutronix.de>
Subject: Re: [PATCH v1 1/2] phy: freescale: imx8m-pcie: cleanup reset logic
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan Eichenberger <eichest@gmail.com>, vkoul@kernel.org, 
	kishon@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tharvey@gateworks.com, 
	hongxing.zhu@nxp.com, francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
	Eichenberger <stefan.eichenberger@toradex.com>
Date: Fri, 28 Feb 2025 13:38:11 +0100
In-Reply-To: <20250228103959.47419-2-eichest@gmail.com>
References: <20250228103959.47419-1-eichest@gmail.com>
	 <20250228103959.47419-2-eichest@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_043825_815194_9F74D374 
X-CRM114-Status: GOOD (  16.73  )
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
> Remove the switch statement and base perst release on whether it is
> found in the device tree. The probe function fails without the reset
> property, making it mandatory. Therefore, always release reset
> independent of the variant.
>=20
> This does not change the behavior of the driver but reduces driver
> complexity and allows for easier future modifications.
>=20
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/fre=
escale/phy-fsl-imx8m-pcie.c
> index e98361dcdeadf..00f957a42d9dc 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> @@ -141,15 +141,11 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
>  			   IMX8MM_GPR_PCIE_REF_CLK_PLL);
>  	usleep_range(100, 200);
> =20
> -	switch (imx8_phy->drvdata->variant) {
> -	case IMX8MP:
> +	if (imx8_phy->perst)

This check is not necessary, reset_control_deassert(NULL) is a no-op:

>  		reset_control_deassert(imx8_phy->perst);

regards
Philipp

