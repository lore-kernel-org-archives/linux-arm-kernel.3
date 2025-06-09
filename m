Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115A4C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fBa/D7ZSdkp1CcirJkKYMOK5Z9MjA4EI8lgY6/+9GI=; b=sEeQmlhAlMbSDdhG3zyMYQG4oB
	mcuXcfOVSUehF179roX9klTmD8rTFSf0hIF8rm53a/5+MhhQLGBRCeDg+4/sGC5BO8qa8nFygYz7b
	4ytI1luBy2NYJsZyc5rhe1a4l4WlrhpKPPuJywAwJY6REfW5wHlIgrQXRsqHPCHZVIOX9Wfjbh9C5
	PxD30M1UXXYH4TnMcqSUUF1g3F1EJbkGqqJqX5QoNQqfBcmtlmKFUK5nJqJd0KY0OoqMEmuCoJqRx
	g3lAn9NdlLzzm0BhfiX7k99kglEOksZwqL4JC7HPyqaoLJfPGaM3+n8v6tle4U5t0nMTA58DNB3sW
	/KvutmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfTX-00000004h2B-3zqx;
	Mon, 09 Jun 2025 16:35:55 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOevz-00000004bCp-2TXo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:01:16 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e817b40d6e7so3795438276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749484874; x=1750089674; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6fBa/D7ZSdkp1CcirJkKYMOK5Z9MjA4EI8lgY6/+9GI=;
        b=IfX8lBfiGfcVJP5Mele9v/CuRebmn05cHrMuUexrotLhf4WZRX4XI6s/iIRFzmk/2s
         iEgQiLWvC7tUtMvU9abaXTMjGXeB2WYWWMCHiB4gl2smHgORLmVN11W8XS6GX5AENndE
         TP5s61JQUNyM+x5Qws0TEZjvLcwqJkHLScedvI5298N5RSYATeRV0K0eQWYWmI3zdJN+
         WLl99p2mOCXXEBe4gecMqDR3e7eDDVgUrOqR0f4lUzuD5wiw+MA99NYJWJc3koGRAmLa
         58S8Ostc18ZfecnXNzND70vmhsxrh5yR0mLAROxOllVRBq0xpHd2jUqZAfAMrm7QOmKl
         8xkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484874; x=1750089674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fBa/D7ZSdkp1CcirJkKYMOK5Z9MjA4EI8lgY6/+9GI=;
        b=CUtOnVXFVnkZKw9hIzayyiS31MGBHpDI9qz6h1b4hFp1VdDqAtIrVKsGGBV9fS47y+
         E8QbUS7F3K+UNpphXhSZe4lJZlHIKBP5Y/zcBFMEfBoXhQZablcMmdiQnEUA4XKk9PPS
         vbOaaCYwkbMfWD8v2nHQ6Ujzt+7tgS+NfkMshuh9WB1SBmhNxm4hI0P/hx5ifRuFQgnY
         6lRJEzpeMMOdztwHdSjCzTCp7Lz1ycoKNuONtZDc42/wjEkwNFVj09p7VPjyfhjE9uvD
         ugcKyMsrVKnXXrH4djeUu+W8HzzQaNQf1QLlMeUVjbl96IVvlp0ADxqb+rYyvEt+wgzM
         t0aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYfxG0GAu5vS5x/58WKQYk/rs4MT2GdwT0QWX2GPlCcDYcXepYc+Prdb9RN6bAuRS0SR/4520YlY3K/agVGBIq@lists.infradead.org
X-Gm-Message-State: AOJu0YzgY1YmbjrA1C4WIGrKm5hjpl/Q6lYuhWpuhiYO34Cx6ajiY1fU
	mmB5C54ParjlEuefHVKCq9WezBeUvuKeLSv/SyTO5yVILZRIpoRCwPz+HLpP/l4XQ6WI0FM93yi
	8VsyPycRFI2bf456dunszpuKO4jsAc0Z1v4N5+tw=
X-Gm-Gg: ASbGncuzKavd5KVmpN3C1y+E5lmGmmn8tNG1Aq4sCSWenxbtOdb4vtzkytqK+BI5yy/
	tFTJa63LKQ8IvT4m85/lnDQeG7Vu4zTPiiEmiZOHa8K/2sIi6z821sntBbT4kOUL4zRnJOVHGU6
	Rx3GM7XnfCDKw8g9KSILzy8QPTp6ooDkJtbX5Rcde9pg==
X-Google-Smtp-Source: AGHT+IEIB8zpDCWcvtBAEzi9NFpxDUdLEsuaA1XVK7qwbkI8oYOnzL1Es6VPcyxBlIwHUkvGkUTGO5iDPTFdkAt7y3Y=
X-Received: by 2002:a05:6902:4911:b0:e81:992c:944d with SMTP id
 3f1490d57ef6-e81a214a687mr19372674276.29.1749484874113; Mon, 09 Jun 2025
 09:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250609140643.26270-1-stefano.radaelli21@gmail.com> <aEb5PHawmlhXs0xs@lizhi-Precision-Tower-5810>
In-Reply-To: <aEb5PHawmlhXs0xs@lizhi-Precision-Tower-5810>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Mon, 9 Jun 2025 18:00:56 +0200
X-Gm-Features: AX0GCFvjgcJAA-64XgvWKGj9tzVUxKIm25Rq28d_hMMp4iijhQyDQKRcAqF3GIk
Message-ID: <CAK+owoidpKXje+vbCSKRbHMZfiWUkp9oO=JDfe7UOoYu=jz+tQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
To: Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_090115_631512_CF7120E1 
X-CRM114-Status: GOOD (  26.99  )
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

Hi Frank,

> +                     reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +                     reset-assert-us = <10000>;
> +                     reset-deassert-us = <100000>;
> +                     vddio-supply = <&reg_phy_vddio>;
> extra empty line here.

Ack, will add the empty line before the leds block.

> +                     at803x,eee-disabled;
> +                     eee-broken-1000t;
> are you sure eee broken? recently we found it wrong copy from fec.

You're absolutely right. I checked the MXL86110 datasheet and it clearly states
that EEE is properly supported for both 100BASE-TX and 1000BASE-T operations.
These properties were indeed copied incorrectly from other configurations.
I'll remove both at803x,eee-disabled and eee-broken-1000t properties in v2.

Thanks for catching this!

Il giorno lun 9 giu 2025 alle ore 17:10 Frank Li <Frank.li@nxp.com> ha scritto:
>
> On Mon, Jun 09, 2025 at 04:06:42PM +0200, Stefano Radaelli wrote:
> > Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> > integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> > MDIO bus at address 4.
> >
> > This patch adds:
> > - EQOS controller configuration with RGMII interface.
> > - Proper reset timings.
> > - PHY power supply regulators.
> > - RGMII pinmux configuration for all data, control and clock signals.
> > - LED configuration for link status indication via the LED subsystem
> >   under /sys/class/leds/, leveraging the support implemented in the.
> >   mxl86110 PHY driver (drivers/net/phy/mxl-86110.c).
> >   Two LEDs are defined to match the LED configuration on the Variscite
> >   VAR-SOM Carrier Boards:
> >     * LED@0: Yellow, netdev trigger.
> >     * LED@1: Green, netdev trigger.
> >
> > The RGMII TX/RX delays are implemented in SOM via PCB passive
> > delays, so no software delay configuration is required.
> >
> > Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> > ---
> >  .../boot/dts/freescale/imx8mp-var-som.dtsi    | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> > index b59da91fdd04..3be59692849f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> > @@ -55,6 +55,24 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
> >               states = <3300000 0x0 1800000 0x1>;
> >               vin-supply = <&ldo5>;
> >       };
> > +
> > +     reg_phy_supply: regulator-phy-supply {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "phy-supply";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             regulator-enable-ramp-delay = <20000>;
> > +             gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_phy_vddio: regulator-phy-vddio {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vddio-1v8";
> > +             regulator-min-microvolt = <1800000>;
> > +             regulator-max-microvolt = <1800000>;
> > +     };
> >  };
> >
> >  &A53_0 {
> > @@ -73,6 +91,54 @@ &A53_3 {
> >       cpu-supply = <&buck2>;
> >  };
> >
> > +&eqos {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_eqos>;
> > +     /*
> > +      * The required RGMII TX and RX 2ns delays are implemented directly
> > +      * in hardware via passive delay elements on the SOM PCB.
> > +      * No delay configuration is needed in software via PHY driver.
> > +      */
> > +     phy-mode = "rgmii";
> > +     phy-handle = <&ethphy0>;
> > +     status = "okay";
> > +
> > +     mdio {
> > +             compatible = "snps,dwmac-mdio";
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             ethphy0: ethernet-phy@4 {
> > +                     compatible = "ethernet-phy-ieee802.3-c22";
> > +                     reg = <4>;
> > +                     at803x,eee-disabled;
> > +                     eee-broken-1000t;
>
> are you sure eee broken? recently we found it wrong copy from fec.
>
>
> > +                     reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us = <10000>;
> > +                     reset-deassert-us = <100000>;
> > +                     vddio-supply = <&reg_phy_vddio>;
>
> extra empty line here.
>
> Frank
> > +                     leds {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             led@0 {
> > +                                     reg = <0>;
> > +                                     color = <LED_COLOR_ID_YELLOW>;
> > +                                     function = LED_FUNCTION_LAN;
> > +                                     linux,default-trigger = "netdev";
> > +                             };
> > +
> > +                             led@1 {
> > +                                     reg = <1>;
> > +                                     color = <LED_COLOR_ID_GREEN>;
> > +                                     function = LED_FUNCTION_LAN;
> > +                                     linux,default-trigger = "netdev";
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >  &i2c1 {
> >       clock-frequency = <400000>;
> >       pinctrl-names = "default";
> > @@ -239,6 +305,27 @@ &wdog1 {
> >
> >  &iomuxc {
> >
> > +     pinctrl_eqos: eqosgrp {
> > +             fsl,pins = <
> > +                     MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC                             0x2
> > +                     MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO                           0x2
> > +                     MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0                       0x90
> > +                     MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1                       0x90
> > +                     MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2                       0x90
> > +                     MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3                       0x90
> > +                     MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK       0x90
> > +                     MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL                 0x90
> > +                     MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0                       0x16
> > +                     MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1                       0x16
> > +                     MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2                       0x16
> > +                     MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3                       0x16
> > +                     MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL                 0x16
> > +                     MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK       0x16
> > +                     MX8MP_IOMUXC_SD2_WP__GPIO2_IO20                                 0x10
> > +                     MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10                             0x150
> > +             >;
> > +     };
> > +
> >       pinctrl_i2c1: i2c1grp {
> >               fsl,pins = <
> >                       MX8MP_IOMUXC_SD1_DATA4__I2C1_SCL                                0x400001c2
> >
> > base-commit: e271ed52b344ac02d4581286961d0c40acc54c03
> > prerequisite-patch-id: 2335ebcc90360b008c840e7edf7e34a595880edf
> > --
> > 2.43.0
> >

