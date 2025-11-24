Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DDACFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 13:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYHTU8GxUy8As0pS0qbdZPY+PWc+6KU3SDmGq3Fa97M=; b=pIyvar5rTN1WRnoNqLdEIKqxd6
	vgB6fgNjDBfb/RJFTyH0VgcjJfTrBcR620gfCixTn4mBYRcF72pVbqwS1Kvrq7JscZISNSF6NhS+a
	0adVHgAzDpeRV4iNQJFnqV2oJVijFLGSfQfB3Cw+QPX3QHcC2YzlLRWUeVpHXIUCAEcJOdmn+0H9v
	d2D4LEvet8tBL9KPgJ8RBxsfdJmsiXTvFTF3HqbqBRuR20mgmpufo7L4GQ6btz6s6FX62o92RBd0m
	rckGBsXXZYa9q6l/cUOCDqRvcHCetpsEo0k9hRE1+jFxOxhNucIF6R9oxP0ONMwWMkJkSMg+B2Qhi
	x1L+1kSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNX49-0000000BnGI-37Wn;
	Mon, 24 Nov 2025 13:57:17 +0000
Received: from mx-relay186-hz1.antispameurope.com ([94.100.133.75])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNX44-0000000BnFj-2uxo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 13:57:16 +0000
ARC-Authentication-Results: i=1; mx-gate186-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=pYHTU8GxUy8As0pS0qbdZPY+PWc+6KU3SDmGq3Fa97M=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763992625;
 b=NcexyerGs+SsKx08A/k6AxQ/d3J0P6MMkqnjFhwcvP+ksOfD4wyJkWzGf+qcpQ1Z4zxibX+h
 qpzD866qOVsU9mzWqy7qoQSk3C2/d1o18rIKSjPny3DLDi8tsnr0TBQdZvJoYfGrgnhQtEyz1pa
 tThnFKnbJDGGuUomLbM+aEoHgD8e5wNFziGsabv5ub6PmsA86e7gp8luqhFp/hoPVb4y9vBdck/
 AMcLhQP71Df7frOrFxYbVQ1ozA1vVvRtIWpkF71YhitzrrYyKjuq82se0bg0scttKnXBxR+4PNy
 niY5PGS6mJuf18oPUXHFMYmSPGJHr2TFLKawep7NgLvIg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763992625;
 b=gwgUPTEC95vFimwjJ08Yp6TzrTIb3LAHuHrV1oSVHzVqMIgxQaz4c2SBdVmQkh4RnIBHMqZU
 ZGST/zMZT/P9DhapbSsmU+dlBZx9ooRui5dADQalNazuxVrE14opjjlbceYhOAYAxcIbVVlgvbB
 T5atAr7lGjhP4Rbbpi0vbMY1BJtD7/mLM/0xwQLb9+aU3YnnH8Sz25JYhJq0WXa5BMj8NCbABCI
 BY6ZvzMrD7JL89y4KXSF4ZOBnNWVbF8gLDPWiI1npy3+Q4w/++bKR68BMzxGUv5i9Os4w4AawTL
 IGStcxzeMzZ+Omqa6tBvfvI7mnVMGktzh5Fg4AZ8B1McA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay186-hz1.antispameurope.com;
 Mon, 24 Nov 2025 14:57:05 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 97A75A40134;
	Mon, 24 Nov 2025 14:56:46 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dongas86@gmail.com" <dongas86@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
 "linux@ew.tq-group.com" <linux@ew.tq-group.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Anson Huang <Anson.Huang@nxp.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file according to
 Rev.D RM
Date: Mon, 24 Nov 2025 14:56:46 +0100
Message-ID: <5032333.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <DU0PR04MB929902EFA27FAC76B61349E480D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
References: <20251124095449.4027676-1-aisheng.dong@nxp.com> <5946049.DvuYhMxLoT@steina-w>
 <DU0PR04MB929902EFA27FAC76B61349E480D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay186-hz1.antispameurope.com with 4dFS6l3nTHz43ffH
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 249dd298a963cd4c070e81c75906a167
X-cloud-security: scantime:1.926
DKIM-Signature: a=rsa-sha256;
 bh=pYHTU8GxUy8As0pS0qbdZPY+PWc+6KU3SDmGq3Fa97M=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763992625; v=1;
 b=UrEs5DLpHbEOdhDusWSXvLBQ/n3kwezw8o1hm9AEFdjnAQY6UmNhCBYjgXQfDy8WPfQ9dSzt
 rtfeR1EWQHLWTGMDNn5ZcNkfov97wq1+0QvqDmKzs8Fs9AicLadGvMT/UfYkB0rYHGXV0odMYtb
 qafw9DBSxu/xUDPwHHEH5pq7l1CnmVnIk//BACsKyqrdfcwiZjEWBBeSTLxr7+d2bgdI8PYzjtW
 sbiXKt2xXgtvG0/w/zOvQIH/ZMy1MWxvxdmiXwj7CqrWVGMVimryWzqKba3H0dbDBsvvxU+dfIU
 NNVgFY/BUDQFqQ/Ez/ShV846SLPoOTfj8m+ZG1I/A8UJQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_055713_116772_CCABE4E1 
X-CRM114-Status: GOOD (  24.58  )
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

Hi Aisheng,

Am Montag, 24. November 2025, 14:46:36 CET schrieb Aisheng Dong:
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: Monday, November 24, 2025 7:12 PM
> >=20
> > Am Montag, 24. November 2025, 10:54:49 CET schrieb Dong Aisheng:
> > > From: Anson Huang <Anson.Huang@nxp.com>
> > >
> > > Update i.MX8MP imx8mp-pinfunc.h file according to reference manual
> > Rev.D.
> >=20
> > Latest officially available is reference manual 3. 11/2020.
> > I can't find Rev D.
>=20
> Rev.D is the previous version. The latest one I saw here is Rev 3. 08/202=
4.
> https://www.nxp.com/products/i.MX8MPLUS
> We only got the pinfunc.h update for Rev.D. No updates for newer version =
so far.
> Anyway, I can double check with the related team member.

You are right, I picked the wrong RM (imx8mm). Sorry for the noise.
Ahmad's points are still valid.

Best regards,
Alexander

>=20
> Regards
> Aisheng
>=20
> >=20
> > Best regards,
> > Alexander
> >=20
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > > NOTE: I met the following checkpatch error, could you advise how to
> > > handle it?
> > > ERROR: Macros with complex values should be enclosed in parentheses
> > > +#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K
> > 0x014 0x274 0x000 0x5 0x0
> > > ---
> > >  .../dts/freescale/imx8mp-data-modul-edm-sbc.dts  |  4 ++--
> > > .../boot/dts/freescale/imx8mp-debix-model-a.dts  |  2 +-
> > >  .../boot/dts/freescale/imx8mp-dhcom-som.dtsi     |  4 ++--
> > >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts     |  2 +-
> > >  .../boot/dts/freescale/imx8mp-iota2-lumpy.dts    |  2 +-
> > >  .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi |  6 +++---
> > >  .../imx8mp-nitrogen-enc-carrier-board.dts        |  2 +-
> > >  .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi  | 12 ++++++------
> > >  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h   | 16 ++++++++------=
=2D-
> > >  .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts  |  4 ++--
> > > .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi |  2 +-
> > > .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi |  2 +-
> > > .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi |  2 +-
> > > .../boot/dts/freescale/imx8mp-venice-gw74xx.dts  |  2 +-
> > > arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi |  2 +-
> > >  15 files changed, 32 insertions(+), 32 deletions(-)
> > >
> > > diff --git
> > > a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> > > b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> > > index 16078ff60ef08..7a05e0692d78d 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> > > @@ -1085,8 +1085,8 @@ MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01
> > 		0x4
> > >
> > >  	pinctrl_usb1: usb1-grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR
> > 		0x6
> > > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 		0x80
> > > +			MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR
> > 	0x6
> > > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC
> > 	0x80
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > > b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > > index 9422beee30b29..2df6434bde652 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > > @@ -485,7 +485,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX
> > 				0x49
> > >
> > >  	pinctrl_usb1: usb1grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> > 				0x10
> > > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR
> > 			0x10
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> > > index 68c2e0156a5c8..755ea967bb9cb 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> > > @@ -1061,8 +1061,8 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX
> > 		0x49
> > >
> > >  	pinctrl_usb1_vbus: dhcom-usb1-grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> > 		0x6
> > > -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC
> > 		0x80
> > > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR
> > 	0x6
> > > +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC
> > 	0x80
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > > b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > > index c6facb2ad9aaa..57accd33ec62c 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > > @@ -1088,7 +1088,7 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX
> > 	0x140
> > >
> > >  	pinctrl_usb1_vbus: usb1grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> > 	0x10
> > > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR
> > 	0x19
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> > > b/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> > > index f48cf22b423db..f66c6b9236fbe 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> > > @@ -363,7 +363,7 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX
> > 	0x0
> > >
> > >  	pinctrl_usb_host_vbus: usb1grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> > 	0x0
> > > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR	0x0
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> > > index b97bfeb1c30f8..6de4d4ace8a73 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> > > @@ -734,19 +734,19 @@ MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10
> > 		0x1c4 /* USB_A_ID */
> > >
> > >  	pinctrl_usb1_oc: usb1ocgrp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 		0x1c0 /* USB_A_OC# */
> > > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC
> > 	0x1c0 /* USB_A_OC# */
> > >  		>;
> > >  	};
> > >
> > >  	pinctrl_usb2_id: usb2idgrp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID
> > 	0x1c4 /* USB_B_ID */
> > > +			MX8MP_IOMUXC_GPIO1_IO11__USB2_ID
> > 	0x1c4 /* USB_B_ID */
> > >  		>;
> > >  	};
> > >
> > >  	pinctrl_usb2_oc: usb2ocgrp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC
> > 		0x1c0 /* USB_B_OC# */
> > > +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC
> > 	0x1c0 /* USB_B_OC# */
> > >  		>;
> > >  	};
> > >
> > > diff --git
> > > a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> > > b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> > > index 1df9488aaeb22..9ffeeb382bad4 100644
> > > ---
> > > a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.
> > > +++ dts
> > > @@ -406,7 +406,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX
> > 		0x140
> > >
> > >  	pinctrl_usb3_0: usb3-0grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 		0x1c0
> > > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC
> > 	0x1c0
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > > index 8b0e8cf86cadb..7b5c402ff9f27 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > > @@ -579,17 +579,17 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX
> > 	0x140	/* UART3_TXD */
> > >
> > >  	pinctrl_usb0: usb0grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR
> > 	0x106	/* USB1_PWR_EN */
> > > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 	0x106	/* USB1_OC */
> > > -			MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID	0x106
> > 	/* USB1_ID */
> > > +			MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR	0x106
> > 	/* USB1_PWR_EN */
> > > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x106
> > 	/* USB1_OC */
> > > +			MX8MP_IOMUXC_GPIO1_IO10__USB1_ID	0x106
> > 	/* USB1_ID */
> > >  		>;
> > >  	};
> > >
> > >  	pinctrl_usb1: usb1grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> > 	0x106	/* USB2_PWR_EN */
> > > -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC
> > 	0x106	/* USB2_OC */
> > > -			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID	0x106
> > 	/* USB2_ID */
> > > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR	0x106
> > 	/* USB2_PWR_EN */
> > > +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC	0x106
> > 	/* USB2_OC */
> > > +			MX8MP_IOMUXC_GPIO1_IO11__USB2_ID	0x106
> > 	/* USB2_ID */
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> > > b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> > > index 16f5899de4152..50f5e674a6b71 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> > > @@ -46,10 +46,12 @@
> > >  #define MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00                         =
 0x014
> > 0x274 0x000 0x0 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO00__CCM_ENET_PHY_REF_CLK_ROOT
> > 0x014 0x274 0x000 0x1 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO00__ISP_FL_TRIG_0                      =
 0x014
> > 0x274 0x5D4 0x3 0x0
> > > +#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K
> > 0x014 0x274 0x000 0x5 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO00__CCM_EXT_CLK1
> > 0x014 0x274 0x000 0x6 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01                         =
 0x018
> > 0x278 0x000 0x0 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT                           =
 0x018
> > 0x278 0x000 0x1 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO01__ISP_SHUTTER_TRIG_0
> > 0x018 0x278 0x5DC 0x3 0x0
> > > +#define MX8MP_IOMUXC_GPIO1_IO01__ANAMIX_REF_CLK_24M
> > 0x018 0x278 0x000 0x5 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO01__CCM_EXT_CLK2
> > 0x018 0x278 0x000 0x6 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO02__GPIO1_IO02                         =
 0x01C
> > 0x27C 0x000 0x0 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B
> > 0x01C 0x27C 0x000 0x1 0x0
> > > @@ -91,26 +93,26 @@
> > >  #define MX8MP_IOMUXC_GPIO1_IO09__USDHC3_RESET_B
> > 0x038 0x298 0x000 0x4 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO09__SDMA2_EXT_EVENT00
> > 0x038 0x298 0x000 0x5 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10                         =
 0x03C
> > 0x29C 0x000 0x0 0x0
> > > -#define MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID
> > 0x03C 0x29C 0x000 0x1 0x0
> > > +#define MX8MP_IOMUXC_GPIO1_IO10__USB1_ID                            =
 0x03C
> > 0x29C 0x000 0x1 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO10__PWM3_OUT                           =
 0x03C
> > 0x29C 0x000 0x2 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11                         =
 0x040
> > 0x2A0 0x000 0x0 0x0
> > > -#define MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID
> > 0x040 0x2A0 0x000 0x1 0x0
> > > +#define MX8MP_IOMUXC_GPIO1_IO11__USB2_ID                            =
 0x040
> > 0x2A0 0x000 0x1 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT                           =
 0x040
> > 0x2A0 0x000 0x2 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO11__USDHC3_VSELECT
> > 0x040 0x2A0 0x000 0x4 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO11__CCM_PMIC_READY
> > 0x040 0x2A0 0x554 0x5 0x1
> > >  #define MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12                         =
 0x044
> > 0x2A4 0x000 0x0 0x0
> > > -#define MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR
> > 0x044 0x2A4 0x000 0x1 0x0
> > > +#define MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR                           =
 0x044
> > 0x2A4 0x000 0x1 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO12__SDMA2_EXT_EVENT01
> > 0x044 0x2A4 0x000 0x5 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13                         =
 0x048
> > 0x2A8 0x000 0x0 0x0
> > > -#define MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 0x048 0x2A8 0x000 0x1 0x0
> > > +#define MX8MP_IOMUXC_GPIO1_IO13__USB1_OC                            =
 0x048
> > 0x2A8 0x000 0x1 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO13__PWM2_OUT                           =
 0x048
> > 0x2A8 0x000 0x5 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                         =
 0x04C
> > 0x2AC 0x000 0x0 0x0
> > > -#define MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> > 0x04C 0x2AC 0x000 0x1 0x0
> > > +#define MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR                           =
 0x04C
> > 0x2AC 0x000 0x1 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO14__USDHC3_CD_B
> > 0x04C 0x2AC 0x608 0x4 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO14__PWM3_OUT                           =
 0x04C
> > 0x2AC 0x000 0x5 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1                          =
 0x04C
> > 0x2AC 0x000 0x6 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                         =
 0x050
> > 0x2B0 0x000 0x0 0x0
> > > -#define MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC
> > 0x050 0x2B0 0x000 0x1 0x0
> > > +#define MX8MP_IOMUXC_GPIO1_IO15__USB2_OC                            =
 0x050
> > 0x2B0 0x000 0x1 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO15__USDHC3_WP                          =
 0x050
> > 0x2B0 0x634 0x4 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO15__PWM4_OUT                           =
 0x050
> > 0x2B0 0x000 0x5 0x0
> > >  #define MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2                          =
 0x050
> > 0x2B0 0x000 0x6 0x0
> > > @@ -291,10 +293,8 @@
> > >  #define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_SPDIF1_IN
> > 0x0D4 0x334 0x544 0x3 0x1
> > >  #define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_PDM_BIT_STREAM03
> > 0x0D4 0x334 0x4CC 0x4 0x2
> > >  #define MX8MP_IOMUXC_SD2_DATA3__GPIO2_IO18                          =
 0x0D4
> > 0x334 0x000 0x5 0x0
> > > -#define MX8MP_IOMUXC_SD2_DATA3__SRC_EARLY_RESET
> > 0x0D4 0x334 0x000 0x6 0x0
> > >  #define MX8MP_IOMUXC_SD2_RESET_B__USDHC2_RESET_B
> > 0x0D8 0x338 0x000 0x0 0x0
> > >  #define MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19                        =
 0x0D8
> > 0x338 0x000 0x5 0x0
> > > -#define MX8MP_IOMUXC_SD2_RESET_B__SRC_SYSTEM_RESET
> > 0x0D8 0x338 0x000 0x6 0x0
> > >  #define MX8MP_IOMUXC_SD2_WP__USDHC2_WP                              =
 0x0DC
> > 0x33C 0x000 0x0 0x0
> > >  #define MX8MP_IOMUXC_SD2_WP__GPIO2_IO20                             =
 0x0DC
> > 0x33C 0x000 0x5 0x0
> > >  #define MX8MP_IOMUXC_SD2_WP__CORESIGHT_EVENTI
> > 0x0DC 0x33C 0x000 0x6 0x0
> > > diff --git
> > > a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > > b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > > index 59642a8a2c445..50c8a7c2a7bd3 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > > @@ -976,8 +976,8 @@ pinctrl_uart4: uart4grp {
> > >  	};
> > >
> > >  	pinctrl_usb0: usb0grp {
> > > -		fsl,pins =3D <MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 	0x1c0>,
> > > -			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR
> > 	0x1c0>;
> > > +		fsl,pins =3D <MX8MP_IOMUXC_GPIO1_IO13__USB1_OC
> > 	0x1c0>,
> > > +			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR
> > 	0x1c0>;
> > >  	};
> > >
> > >  	pinctrl_usbcon0: usb0congrp {
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> > > index 4bf818873fe3c..162329b403d30 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> > > @@ -219,7 +219,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x146
> > >
> > >  	pinctrl_usb1: usb1grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 	0x140 /* USB1_FLT# */
> > > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
> > /* USB1_FLT# */
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> > > index 76020ef89bf3e..02ea0e8bcc6ff 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> > > @@ -318,7 +318,7 @@ MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x146
> > /* USB1_EN */
> > >
> > >  	pinctrl_usb1: usb1grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 	0x140 /* USB1_FLT# */
> > > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
> > /* USB1_FLT# */
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> > > index 5eb114d2360a3..2b6bb9fcbc7a9 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> > > @@ -359,7 +359,7 @@ MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x146
> > /* USB1_EN */
> > >
> > >  	pinctrl_usb1: usb1grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 	0x140 /* USB1_FLT# */
> > > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
> > /* USB1_FLT# */
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > > b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > > index 7662663ff5dad..6d752fe0d1bf5 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > > @@ -1060,7 +1060,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX
> > 	0x140
> > >
> > >  	pinctrl_usb1: usb1grp {
> > >  		fsl,pins =3D <
> > > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 	0x140
> > > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > > index d43ba00871269..28f5983a78469 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > > @@ -1316,7 +1316,7 @@ pinctrl_usb_1_id: usb1idgrp {
> > >  	/* USB_1_OC# */
> > >  	pinctrl_usb_1_oc_n: usb1ocngrp {
> > >  		fsl,pins =3D
> > > -			<MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> > 		0x1c4>;	/* SODIMM 157 */
> > > +			<MX8MP_IOMUXC_GPIO1_IO13__USB1_OC
> > 	0x1c4>;	/* SODIMM 157 */
> > >  	};
> > >
> > >  	pinctrl_usb2_vbus: usb2vbusgrp {
> > >
> >=20
> >=20
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



