Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC079CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjYtADUvROzundEKwkPFGu3IihgdEbXTEQhIjZMV8/A=; b=hnMjRYJyThVHQxPZNs2o7WVnE3
	Jmha0i2Rd2QB9sE7TkxY6J8A8Sl9ousGzePaGVwZGw6n7ZHMmO3JaPG03NcVw1AN4qatgXqhUwLEh
	77MTlTwkaAle6hcq+tx7fSTbF5F0yJlyPjWHb2e5fYd+5QACwKna8on1rK5wU92GKP2AKNpaM74L9
	pMYakDj1n4KDVx7UJdbfXrKVuo7OjjV41bwqte0b+acehLICG9+qS32C8X0TwN4TRLKDBOXqM2/4t
	jHi8/0+DliAntbAs28MerJtns6EvSD6xCb1G4t0nJs9Z/IeRPQ9gSXzjFopqyeyKFW8mAH2KWPioZ
	Urr0qbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUVM-0000000BXB1-0RQu;
	Mon, 24 Nov 2025 11:13:12 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUVG-0000000BXAB-0XhP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 11:13:10 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ZjYtADUvROzundEKwkPFGu3IihgdEbXTEQhIjZMV8/A=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763982720;
 b=Jq6rmA5CxoJlGudmCUIrzBYUXYqE6WuIQMNrAjTyqWqEb1vCAV2nyHbwCytBgAuHnVTXAk5c
 7UGaopzT4x+B4HqYoqmXqdlaNiFOJInffveAcq0bVkRg0uEbCXU21Ahe6VqhULVIyqjggecpK2v
 m9GdcdjGP527q6ukO73oK2Fk+CuOcKnyebQ6hWCUU2KeoDuvN3J/+dpVKw7cAwH+LDrL3lYE7Fv
 q1D9KBfUsY2BwNeElte438FAqIi9vB5MGeT/axdMHNaOCp2xX2UKU95rNkVI4iFRMvBn7RItwhC
 xRR0LDRGzyuA8RnN40ASYnLb9ouxKqxVyQB/Gye26KANQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763982720;
 b=dYjS+ifGv6w3YkmX6ObeB24L/rdCnkCYo1VOLbQg5ywhHGy3j3fJWZaUNKUud6HGw3ZEcmt0
 q436XNdXA8qPHoerX8nOTb/CYOYEo6/qBoHjo1DY+TEDKe+0hmhX5lGe5VKvWfA/FRBBpKGBwJ1
 EWdVXmCkEaODCalG9DOFC0rHPAGmkne3exdES1P9UVQc7CSDrhXiiPN5JanuwKr6BzN0xI83gSl
 zLmNOf6BnBFhU+ovgI2S0OdHSzIkiiCjELu+X3GeGDXkrBZdDrYHQOiUmfPlxuUcoUMwiAoTd0W
 8PhI0+J9M8t6m3ZMe7GaPw13/etmdKJ5Yafubgh1rWFmQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Mon, 24 Nov 2025 12:12:00 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 98B34A407A5;
	Mon, 24 Nov 2025 12:11:41 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 kernel@pengutronix.de, dongas86@gmail.com, krzk+dt@kernel.org,
 robh@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
 kernel@dh-electronics.com, linux@ew.tq-group.com,
 francesco.dolcini@toradex.com, Anson Huang <Anson.Huang@nxp.com>,
 Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file according to
 Rev.D RM
Date: Mon, 24 Nov 2025 12:11:41 +0100
Message-ID: <5946049.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251124095449.4027676-1-aisheng.dong@nxp.com>
References: <20251124095449.4027676-1-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6217920.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dFNSG3YTJz1kPSCd
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: d753f8f66d266273f65c8f8d6314a31b
X-cloud-security: scantime:1.842
DKIM-Signature: a=rsa-sha256;
 bh=ZjYtADUvROzundEKwkPFGu3IihgdEbXTEQhIjZMV8/A=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763982720; v=1;
 b=s0aQe5mMKPYyUOm/2V0OldZvLOAA9ojO1UHN5OHTCCuQi0k03jbZYB+FZlGyE2PYLD27TLg0
 wCvSGPKtkR02VBnF1bWbqoEuP/Abe3b132Lthep0cyht10lhKVVwqBYBMR9PhFojkdZHTH24YBP
 SK/L5dxMaf0xi5IAW8f/ZQlyp2jy1P7D6C0AevTjk6oh+dKM7Ao9gSYkXmC/Ysg2CkyqJLyGFZr
 5H/Gghj+mnNngEjJ3YHoNPf2KD/HhcqKOSuxdaDIWEMEV/gQ32n5u6C58lSCWqI4TIupJI/hT8U
 7TtN1oyp9ejxVCdQvm9o1Q/gGnp8vU4y0envMtJ8xlcIQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_031306_895470_D0B1D21F 
X-CRM114-Status: GOOD (  17.47  )
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

--nextPart6217920.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Mon, 24 Nov 2025 12:11:41 +0100
Message-ID: <5946049.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251124095449.4027676-1-aisheng.dong@nxp.com>
References: <20251124095449.4027676-1-aisheng.dong@nxp.com>
MIME-Version: 1.0

Am Montag, 24. November 2025, 10:54:49 CET schrieb Dong Aisheng:
> From: Anson Huang <Anson.Huang@nxp.com>
>=20
> Update i.MX8MP imx8mp-pinfunc.h file according to reference manual Rev.D.

Latest officially available is reference manual 3. 11/2020.
I can't find Rev D.

Best regards,
Alexander

>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> NOTE: I met the following checkpatch error, could you advise how to
> handle it?
> ERROR: Macros with complex values should be enclosed in parentheses
> +#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K                  0x0=
14 0x274 0x000 0x5 0x0
> ---
>  .../dts/freescale/imx8mp-data-modul-edm-sbc.dts  |  4 ++--
>  .../boot/dts/freescale/imx8mp-debix-model-a.dts  |  2 +-
>  .../boot/dts/freescale/imx8mp-dhcom-som.dtsi     |  4 ++--
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts     |  2 +-
>  .../boot/dts/freescale/imx8mp-iota2-lumpy.dts    |  2 +-
>  .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi |  6 +++---
>  .../imx8mp-nitrogen-enc-carrier-board.dts        |  2 +-
>  .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi  | 12 ++++++------
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h   | 16 ++++++++--------
>  .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts  |  4 ++--
>  .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi |  2 +-
>  .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi |  2 +-
>  .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi |  2 +-
>  .../boot/dts/freescale/imx8mp-venice-gw74xx.dts  |  2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi |  2 +-
>  15 files changed, 32 insertions(+), 32 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts =
b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> index 16078ff60ef08..7a05e0692d78d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> @@ -1085,8 +1085,8 @@ MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01		0x4
> =20
>  	pinctrl_usb1: usb1-grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR		0x6
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x80
> +			MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR		0x6
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x80
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arc=
h/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> index 9422beee30b29..2df6434bde652 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> @@ -485,7 +485,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x49
> =20
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR				0x10
> +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR				0x10
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> index 68c2e0156a5c8..755ea967bb9cb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> @@ -1061,8 +1061,8 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x49
> =20
>  	pinctrl_usb1_vbus: dhcom-usb1-grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR		0x6
> -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC		0x80
> +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR		0x6
> +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC		0x80
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mp-evk.dts
> index c6facb2ad9aaa..57accd33ec62c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -1088,7 +1088,7 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
> =20
>  	pinctrl_usb1_vbus: usb1grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x10
> +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR		0x19
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts b/arch/=
arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> index f48cf22b423db..f66c6b9236fbe 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> @@ -363,7 +363,7 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x0
> =20
>  	pinctrl_usb_host_vbus: usb1grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x0
> +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR	0x0
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> index b97bfeb1c30f8..6de4d4ace8a73 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> @@ -734,19 +734,19 @@ MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x1c4 /* USB_A=
_ID */
> =20
>  	pinctrl_usb1_oc: usb1ocgrp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c0 /* USB_A_OC# */
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c0 /* USB_A_OC# */
>  		>;
>  	};
> =20
>  	pinctrl_usb2_id: usb2idgrp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID		0x1c4 /* USB_B_ID */
> +			MX8MP_IOMUXC_GPIO1_IO11__USB2_ID		0x1c4 /* USB_B_ID */
>  		>;
>  	};
> =20
>  	pinctrl_usb2_oc: usb2ocgrp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC		0x1c0 /* USB_B_OC# */
> +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC		0x1c0 /* USB_B_OC# */
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-bo=
ard.dts b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.d=
ts
> index 1df9488aaeb22..9ffeeb382bad4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> @@ -406,7 +406,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
> =20
>  	pinctrl_usb3_0: usb3-0grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c0
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c0
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi b/arc=
h/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> index 8b0e8cf86cadb..7b5c402ff9f27 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> @@ -579,17 +579,17 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140	/* UART3=
_TXD */
> =20
>  	pinctrl_usb0: usb0grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR	0x106	/* USB1_PWR_EN */
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x106	/* USB1_OC */
> -			MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID	0x106	/* USB1_ID */
> +			MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR	0x106	/* USB1_PWR_EN */
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x106	/* USB1_OC */
> +			MX8MP_IOMUXC_GPIO1_IO10__USB1_ID	0x106	/* USB1_ID */
>  		>;
>  	};
> =20
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x106	/* USB2_PWR_EN */
> -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC	0x106	/* USB2_OC */
> -			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID	0x106	/* USB2_ID */
> +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR	0x106	/* USB2_PWR_EN */
> +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC	0x106	/* USB2_OC */
> +			MX8MP_IOMUXC_GPIO1_IO11__USB2_ID	0x106	/* USB2_ID */
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/=
boot/dts/freescale/imx8mp-pinfunc.h
> index 16f5899de4152..50f5e674a6b71 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -46,10 +46,12 @@
>  #define MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00                          0x0=
14 0x274 0x000 0x0 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO00__CCM_ENET_PHY_REF_CLK_ROOT           0x0=
14 0x274 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO00__ISP_FL_TRIG_0                       0x0=
14 0x274 0x5D4 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K                  0x0=
14 0x274 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO00__CCM_EXT_CLK1                        0x0=
14 0x274 0x000 0x6 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01                          0x0=
18 0x278 0x000 0x0 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT                            0x0=
18 0x278 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO01__ISP_SHUTTER_TRIG_0                  0x0=
18 0x278 0x5DC 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO01__ANAMIX_REF_CLK_24M                  0x0=
18 0x278 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO01__CCM_EXT_CLK2                        0x0=
18 0x278 0x000 0x6 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO02__GPIO1_IO02                          0x0=
1C 0x27C 0x000 0x0 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B                        0x0=
1C 0x27C 0x000 0x1 0x0
> @@ -91,26 +93,26 @@
>  #define MX8MP_IOMUXC_GPIO1_IO09__USDHC3_RESET_B                      0x0=
38 0x298 0x000 0x4 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO09__SDMA2_EXT_EVENT00                   0x0=
38 0x298 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10                          0x0=
3C 0x29C 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID                         0x0=
3C 0x29C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO10__USB1_ID                             0x0=
3C 0x29C 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO10__PWM3_OUT                            0x0=
3C 0x29C 0x000 0x2 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11                          0x0=
40 0x2A0 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID                         0x0=
40 0x2A0 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO11__USB2_ID                             0x0=
40 0x2A0 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT                            0x0=
40 0x2A0 0x000 0x2 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO11__USDHC3_VSELECT                      0x0=
40 0x2A0 0x000 0x4 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO11__CCM_PMIC_READY                      0x0=
40 0x2A0 0x554 0x5 0x1
>  #define MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12                          0x0=
44 0x2A4 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR                        0x0=
44 0x2A4 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR                            0x0=
44 0x2A4 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO12__SDMA2_EXT_EVENT01                   0x0=
44 0x2A4 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13                          0x0=
48 0x2A8 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC                         0x0=
48 0x2A8 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO13__USB1_OC                             0x0=
48 0x2A8 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO13__PWM2_OUT                            0x0=
48 0x2A8 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                          0x0=
4C 0x2AC 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR                        0x0=
4C 0x2AC 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR                            0x0=
4C 0x2AC 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO14__USDHC3_CD_B                         0x0=
4C 0x2AC 0x608 0x4 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO14__PWM3_OUT                            0x0=
4C 0x2AC 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1                           0x0=
4C 0x2AC 0x000 0x6 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                          0x0=
50 0x2B0 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC                         0x0=
50 0x2B0 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO15__USB2_OC                             0x0=
50 0x2B0 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO15__USDHC3_WP                           0x0=
50 0x2B0 0x634 0x4 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO15__PWM4_OUT                            0x0=
50 0x2B0 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2                           0x0=
50 0x2B0 0x000 0x6 0x0
> @@ -291,10 +293,8 @@
>  #define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_SPDIF1_IN                   0x0=
D4 0x334 0x544 0x3 0x1
>  #define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_PDM_BIT_STREAM03            0x0=
D4 0x334 0x4CC 0x4 0x2
>  #define MX8MP_IOMUXC_SD2_DATA3__GPIO2_IO18                           0x0=
D4 0x334 0x000 0x5 0x0
> -#define MX8MP_IOMUXC_SD2_DATA3__SRC_EARLY_RESET                      0x0=
D4 0x334 0x000 0x6 0x0
>  #define MX8MP_IOMUXC_SD2_RESET_B__USDHC2_RESET_B                     0x0=
D8 0x338 0x000 0x0 0x0
>  #define MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19                         0x0=
D8 0x338 0x000 0x5 0x0
> -#define MX8MP_IOMUXC_SD2_RESET_B__SRC_SYSTEM_RESET                   0x0=
D8 0x338 0x000 0x6 0x0
>  #define MX8MP_IOMUXC_SD2_WP__USDHC2_WP                               0x0=
DC 0x33C 0x000 0x0 0x0
>  #define MX8MP_IOMUXC_SD2_WP__GPIO2_IO20                              0x0=
DC 0x33C 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_SD2_WP__CORESIGHT_EVENTI                        0x0=
DC 0x33C 0x000 0x6 0x0
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts =
b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> index 59642a8a2c445..50c8a7c2a7bd3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> @@ -976,8 +976,8 @@ pinctrl_uart4: uart4grp {
>  	};
> =20
>  	pinctrl_usb0: usb0grp {
> -		fsl,pins =3D <MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x1c0>,
> -			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR	0x1c0>;
> +		fsl,pins =3D <MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c0>,
> +			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR		0x1c0>;
>  	};
> =20
>  	pinctrl_usbcon0: usb0congrp {
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> index 4bf818873fe3c..162329b403d30 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> @@ -219,7 +219,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x146
> =20
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140 /* USB1_FLT# */
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140 /* USB1_FLT# */
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> index 76020ef89bf3e..02ea0e8bcc6ff 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> @@ -318,7 +318,7 @@ MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x146 /* USB1_EN =
*/
> =20
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140 /* USB1_FLT# */
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140 /* USB1_FLT# */
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> index 5eb114d2360a3..2b6bb9fcbc7a9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> @@ -359,7 +359,7 @@ MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x146 /* USB1_EN =
*/
> =20
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140 /* USB1_FLT# */
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140 /* USB1_FLT# */
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arc=
h/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> index 7662663ff5dad..6d752fe0d1bf5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> @@ -1060,7 +1060,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140
> =20
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins =3D <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
>  		>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8mp-verdin.dtsi
> index d43ba00871269..28f5983a78469 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> @@ -1316,7 +1316,7 @@ pinctrl_usb_1_id: usb1idgrp {
>  	/* USB_1_OC# */
>  	pinctrl_usb_1_oc_n: usb1ocngrp {
>  		fsl,pins =3D
> -			<MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c4>;	/* SODIMM 157 */
> +			<MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c4>;	/* SODIMM 157 */
>  	};
> =20
>  	pinctrl_usb2_vbus: usb2vbusgrp {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart6217920.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmkkPW0ACgkQaS+g2M0Z
/iUdXwf/biaEhMgyFdY/0NZJiAZTa6dyI5J/ZF7ZXpFTnyjCqUwYisY37OaGbn28
MqEYaxLu3lZPLd9YIrM7JWaU1T2euIRluW1u53IAlXb32lQoqPP7sPLhCavWijOC
s79sK1HVeLEoOI4drKRPCXtRlBHvCItPZIZ4T1QHCgDWBJNUu24jTdDM2PENh9Ti
Dz1PAZr0BKXYhKMXJiisYOY+BGGxrxgKcFGktxGpVz+eB5w/S6u4Ca9DA5zj82Ux
wMt0ragdQh5fyshc5LZZwrC4tTBu6AsOih6BxwK8pjG0IwMcKXGhM0ILE264KIbD
c/XruFWnugZqQkK5Gjr100sVLhBTRg==
=xmhk
-----END PGP SIGNATURE-----

--nextPart6217920.lOV4Wx5bFT--




