Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96143C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 08:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICpkuwnIB07t0a1LMiJBD/dY2z9XSzrmegYeMjwWFeY=; b=2kF+uHK7y+dW+XXJolfIWNDtSq
	G4oarPWTNoBgN6XDhOK4Z5ll+TgD0bh7ya9vIfpc7M5hpL16swHDMgLkiBQmAjxbLC4Y5voBuebw1
	7HX8sNae73Yq2aGFDGvctqQoD0VOGbVMpIhUZe14mvdh+z6iajFL3FAreBQfV1RepF/Ronh5TdQc/
	336ITUROLmN+TtoY6dGRSkI6x2MEYZOb9BLMYCtk1APRHYcc21KmGqZmVDBWxCpSwxJOf9oWJCzHY
	z1U/eaYvJp3rRElGnYRc6OOTKbhaMtA3o+pk6EqDvsILNQlubYBLAqu2C4mnw5QxG1Fb3qQpxHIBJ
	ujG5hn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKYQR-0000000FEqU-3uiG;
	Thu, 29 May 2025 08:15:43 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKYOK-0000000FEkz-1xzy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 08:13:33 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e7dd151f79eso563978276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 01:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748506411; x=1749111211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICpkuwnIB07t0a1LMiJBD/dY2z9XSzrmegYeMjwWFeY=;
        b=IfsTIKe3EnKAUmdkESYKmtBUf2AZv+5ueL+swAlrKfBjiRsZFyZTz59w98JTfFxfQR
         pagvvtPqQsXKBdeE81gAau4mIShadDjhGxhEbUY35mda29I90gf2Ztz2hUuweGK8WgHq
         dPVAVPkKco+Gj4ku5L3hWNvWjUVWEkbiC+XOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748506411; x=1749111211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICpkuwnIB07t0a1LMiJBD/dY2z9XSzrmegYeMjwWFeY=;
        b=szCFO+a82xzfgtXTkvF46P5V9Id9gCQsUMqcvNUjWj1GcmaoqcMDgkMPDd71yNd4Rp
         oyBRS3WMXQz4asVHYGZO9I2Tsb3RjKO7YXBmmiEC9A9B3A/XaxH2SMAwZBqLMxKAGX/Y
         DYu7cQ8NFMM5/DEtHnaAQmU0dq9UY2zaPxgdPbbeEDPTKI2a+rlciC4uObp57Xv5di9i
         q4H2r7fql8JhUlJ1o3/NA+jYwgWgdsOgn9yl65QzQTGJKD7FKequLo8IiP0o4/gvmknv
         5GGDcFefv+NpQSEvGl+vYEPslnZF/wYLM7fayu+skMKimumrcddJbLuc1r9bi/2s0k9y
         ndYg==
X-Forwarded-Encrypted: i=1; AJvYcCVTkuRPAf4mO29BucbTyK+UAFGcUTiSposb2l0w7Ys28MxQOXyEjuR0BvuH9YiE2C8a6X7ga1xY+DSyjeRc5Lcs@lists.infradead.org
X-Gm-Message-State: AOJu0YwNawC827hkdq9oNh8VfZL7XpQBs0yPpTNuTilASh1H4j1E9zWH
	qWqE+GbgCKn61NnJkO+9dRgnY2W5uD3Uq33V0Wsb6zsHYGIz6VtN7Cl94VQ1jCH1AeqaXCLxlWS
	96NGWdclkQ8n4piLk/Zh3hK54BI3rME7gpcIvILcaPA==
X-Gm-Gg: ASbGnct5jJw8fnnVHcI+Nw9CC6e51rG36KObSb19cy99igJZSpyqvdEQcA95/3FeVRv
	ucnH0zwoV65qMY1qYI2xNJAbaT2lmqO0bhUn67Pa8z0ttzwLEG2Ufn4FBAY+RZtswDqBPCgcmLy
	EFVtzfwOE8DZ8+EWdJhqH/3M1BNwv5eM0=
X-Google-Smtp-Source: AGHT+IFU5bz24+L9U9Lk3j0eXGd/ajUx6skYk6d365ox59VO9f0gJTHfBW+FNUqLd9X/ZJAVZxoazSQmYjLoy63FvbA=
X-Received: by 2002:a05:6902:1504:b0:e7d:6791:9c10 with SMTP id
 3f1490d57ef6-e7f744d5e2fmr1456637276.17.1748506410916; Thu, 29 May 2025
 01:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-5-dario.binacchi@amarulasolutions.com> <aDcmWddO3+q+4qI1@lizhi-Precision-Tower-5810>
In-Reply-To: <aDcmWddO3+q+4qI1@lizhi-Precision-Tower-5810>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 29 May 2025 10:13:20 +0200
X-Gm-Features: AX0GCFslQFsmjgK20Th0LuWMG0L2ISJsdlKwxt0PnxTJnAi4jbI-fa627EQHTkE
Message-ID: <CABGWkvrY+27C=Ds8uCWBp4seQiV1RNs2dp1jNRPpUNxgNOSxYg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_011332_528585_D6D56C2B 
X-CRM114-Status: GOOD (  25.00  )
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

On Wed, May 28, 2025 at 5:06=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, May 28, 2025 at 02:11:41PM +0200, Dario Binacchi wrote:
> > The board includes the following resources:
> >  - 256 Mbytes NAND Flash
> >  - 128 Mbytes DRAM DDR2
> >  - CAN
> >  - USB 2.0 high-speed/full-speed
> >  - Ethernet MAC
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v2:
> > - In imx28-amarula-rmm.dts:
> >   - Replace '-' with '@' for the pinctrl sub-nodes.
> >   - Replace edt,edt-ft5x06 with edt,edt-ft5306.
> >   - Drop LCD reset hog pin.
> >   - Add correct #address-cells and #size-cells to gpmi node.
> >   - Replace edt-ft5x06@38 with touchscreen@38.
> > - Drop from commit messages all references to LCD display.
> > - Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
> >   json-schema".
> >
> >  arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
> >  .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 303 ++++++++++++++++++
>
> please run https://github.com/lznuaa/dt-format to keep nice node/property
> order for new dts file.

Thank you for the suggestion. I made some changes, although I didn=E2=80=99=
t follow the
dt-format output for imx28-amarula-rmm.dtsi to the letter. In some cases, w=
hen
I had to choose between alphabetical order and the =E2=80=9Ccustomary=E2=80=
=9D conventions of
DTS files, I opted for the latter.

Thanks and regards,
Dario

>
> Frank
>
> >  2 files changed, 304 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> >
> > diff --git a/arch/arm/boot/dts/nxp/mxs/Makefile b/arch/arm/boot/dts/nxp=
/mxs/Makefile
> > index 96dd31ea19ba..d72ba702b6fa 100644
> > --- a/arch/arm/boot/dts/nxp/mxs/Makefile
> > +++ b/arch/arm/boot/dts/nxp/mxs/Makefile
> > @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_MXS) +=3D \
> >       imx23-sansa.dtb \
> >       imx23-stmp378x_devb.dtb \
> >       imx23-xfi3.dtb \
> > +     imx28-amarula-rmm.dtb \
> >       imx28-apf28.dtb \
> >       imx28-apf28dev.dtb \
> >       imx28-apx4devkit.dtb \
> > diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm=
/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> > new file mode 100644
> > index 000000000000..5daa9e22715d
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> > @@ -0,0 +1,303 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacch=
i@amarulasolutions.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include "imx28.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +     model =3D "Amarula i.MX28 rmm";
> > +     compatible =3D "amarula,imx28-rmm", "fsl,imx28";
> > +
> > +     memory@40000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x40000000 0x08000000>;
> > +     };
> > +
> > +     reg_5v: regulator-5v {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "5v";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_3v3: regulator-3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_1v8: regulator-1v8 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "1v8";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +     };
> > +
> > +     reg_fec_3v3: regulator-fec-3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&fec_3v3_enable_pin>;
> > +             regulator-name =3D "fec-3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpios =3D <&gpio3 27 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             startup-delay-us =3D <300000>;
> > +             vin-supply =3D <&reg_5v>;
> > +     };
> > +
> > +     reg_usb0_vbus: regulator-usb0-vbus {
> > +             compatible =3D "regulator-fixed";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&usb0_vbus_enable_pin>;
> > +             regulator-name =3D "usb0_vbus";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             gpio =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_usb1_vbus: regulator-usb1-vbus {
> > +             compatible =3D "regulator-fixed";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&usb1_vbus_enable_pin>;
> > +             regulator-name =3D "usb1_vbus";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             gpio =3D <&gpio2 6 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-always-on;
> > +     };
> > +
> > +     backlight {
> > +             compatible =3D "pwm-backlight";
> > +             pwms =3D <&pwm 4 5000000 0>;
> > +             brightness-levels =3D <0 255>;
> > +             num-interpolated-steps =3D <255>;
> > +             default-brightness-level =3D <255>;
> > +             power-supply =3D <&reg_5v>;
> > +     };
> > +
> > +     beeper {
> > +             compatible =3D "pwm-beeper";
> > +             pwms =3D <&pwm 7 100000 0>;
> > +     };
> > +
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&leds_pins>;
> > +
> > +             led-0 {
> > +                     label =3D "status";
> > +                     gpios =3D <&gpio2 7 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-1 {
> > +                     label =3D "x22_5";
> > +                     gpios =3D <&gpio3 16 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-2 {
> > +                     label =3D "x22_4";
> > +                     gpios =3D <&gpio3 17 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +     };
> > +};
> > +
> > +&auart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&auart0_2pins_a>;
> > +     status =3D "okay";
> > +};
> > +
> > +&auart1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&auart1_pins_a>;
> > +     status =3D "okay";
> > +};
> > +
> > +&can0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&can0_pins_a>;
> > +     xceiver-supply =3D <&reg_3v3>;
> > +     status =3D "okay";
> > +};
> > +
> > +&duart {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&duart_pins_b>;
> > +     status =3D "okay";
> > +};
> > +
> > +&duart_pins_b {
> > +     fsl,voltage =3D <MXS_VOLTAGE_LOW>;
> > +};
> > +
> > +&gpmi {
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&gpmi_pins_a &gpmi_status_cfg>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c0_pins_a>;
> > +     status =3D "okay";
> > +
> > +     touchscreen: touchscreen@38 {
> > +             compatible =3D "edt,edt-ft5306";
> > +             reg =3D <0x38>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&edt_ft5x06_pins &edt_ft5x06_wake_pin>;
> > +             interrupt-parent =3D <&gpio0>;
> > +             interrupts =3D <19 IRQ_TYPE_EDGE_RISING>;
> > +             reset-gpios =3D <&gpio0 21 GPIO_ACTIVE_LOW>;
> > +             wake-gpios =3D <&gpio0 18 GPIO_ACTIVE_HIGH>;
> > +     };
> > +};
> > +
> > +&lradc {
> > +     status =3D "okay";
> > +};
> > +
> > +&mac0 {
> > +     phy-mode =3D "rmii";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&mac0_pins_a>;
> > +     phy-supply =3D <&reg_fec_3v3>;
> > +     phy-handle =3D <&ethphy>;
> > +     status =3D "okay";
> > +
> > +     mdio {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             ethphy: ethernet-phy@0 {
> > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
> > +                     max-speed =3D <100>;
> > +                     reset-gpios =3D <&gpio3 28 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us =3D <4000>;
> > +                     reset-deassert-us =3D <4000>;
> > +             };
> > +     };
> > +};
> > +
> > +&pinctrl {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&hog_pins_a>;
> > +
> > +     hog_pins_a: hog@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <
> > +                     MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power *=
/
> > +             >;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +
> > +     edt_ft5x06_pins: edt-ft5x06@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <
> > +                     MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
> > +                     MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
> > +             >;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_ENABLE>;
> > +     };
> > +
> > +     edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_16mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +
> > +     fec_3v3_enable_pin: fec-3v3-enable@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_SPDIF__GPIO_3_27>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +
> > +     leds_pins: leds@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <
> > +                     MX28_PAD_SSP0_DATA7__GPIO_2_7
> > +                     MX28_PAD_PWM0__GPIO_3_16
> > +                     MX28_PAD_PWM1__GPIO_3_17
> > +             >;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +
> > +     usb0_vbus_enable_pin: usb0-vbus-enable@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +
> > +     usb1_vbus_enable_pin: usb1-vbus-enable@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +};
> > +
> > +&pwm {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pwm4_pins_a &pwm7_pins_a>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ssp0 {
> > +     compatible =3D "fsl,imx28-mmc";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
> > +     status =3D "okay";
> > +     bus-width =3D <4>;
> > +     broken-cd;
> > +};
> > +
> > +&usb0 {
> > +     status =3D "okay";
> > +     vbus-supply =3D <&reg_usb0_vbus>;
> > +     dr_mode =3D "host";
> > +};
> > +
> > +&usb1 {
> > +     status =3D "okay";
> > +     vbus-supply =3D <&reg_usb1_vbus>;
> > +     dr_mode =3D "host";
> > +};
> > +
> > +&usbphy0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&usbphy1 {
> > +     status =3D "okay";
> > +};
> > --
> > 2.43.0
> >



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

