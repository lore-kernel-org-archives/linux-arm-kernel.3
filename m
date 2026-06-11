Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB44CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=; b=R79L2QuXkIl7axRlrTWaL+Vg7D
	YGl4G9rAZFaI1NVwsfHED2VYv8KH6uyDpBcJFF6ApMeV7J1V5KPRoX7h8Dlih5LdBd+wYo0AoOEqy
	jkYAiBJIV+pVSLI25X0c02GZF8A9CfS3xRJInuqHcyXANMMGDly7k3Zny+/AbPbeYUYvwB4+OPN0y
	ax0a9KXGiumGmj6E3fNFXeq7rPzn9E5FM9FYFReBZ6Sm8DlPE94EtxlX5wY4cTfZM8NpnJdX6lD5W
	sfnYWEqQy9+5/23meKzN2zX/vdcPOIypXuNeooejtk+p1LLcNTWgZHHfB0aNl+p/jPa/q88aTgqsP
	URaSMq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXY8s-00000008kkQ-31CZ;
	Thu, 11 Jun 2026 05:39:50 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXY8q-00000008kk2-0QmO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:39:49 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-39676d82b7fso75383331fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 22:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781156386; cv=none;
        d=google.com; s=arc-20240605;
        b=iCsA0NKENYvEmUreI3F7PG/OkYbE4fzJA1p2DK2tJfJDV1vKdWphhq/aekQ7vgpDQH
         pXAj8G9uHH/a1n4DFfFy5J8Bn3v8r1yf22AOVd4fY/Hr1iPP80fpCa9yDZuYnuFrlDBu
         L3/7FEsOQGjhRA/dYLtI968HK+Y8aTlwNXyG3npRQiNJwJSZl34ZYrkTiuxdTQ/696fc
         82HemsiqnWjFEQXxpHtRLlcXvXcfHwVMwdOPxN3N2rLVk+NH4yGXAgFWsLsFu7hEVmnD
         82jvR1Qx7l6GbfCflgTKWW82YhKRII0vGPcI8H4oLEaAkhRy0EZ9GzZ7d817HwLCgVpJ
         btAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=;
        fh=CKfmMfRwCThigYJ1VjiesLVXK2MOdI7V6SV8PTSotps=;
        b=kZLiDzx8zHUrGoO1+tsamv+/tM2XOpbNlEZuT2OCo5aD72z8aUue7vaFMiZtN/5h5L
         lFeGliiOBxM1wuap0f7xIxp+ZCOYQwVvdmpAECh66JwuuVXPRPZYFldK932Cn2g8an5K
         1RijRgCZpP/RxZfVVj2znJ8VyTlworTqNOpgdI4+uUgD2yzJHUS912aUtVvgQhdj7Ekv
         IU/7aK1/ci0shQ9s7EYZtcQ7KyC/3d9NweY+q3gi+BlG/hB8qOGHKv9OXZxsTuXTOBGi
         z1/kq4B91lAd54Y4WKIYk2ZjJSlEPxGC+4KtzqoLZT4tIACqMwgZS5iAhQVS0JWDbUF7
         cStQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781156386; x=1781761186; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=;
        b=H7AUATA5iPSIO3e+kgk+DTb2QjnbP/4BwisOJ3y6e5BJ9Usj2bEsvmPrnnC6RgaEB0
         8qgKdxpnt3hoWTwCN3buSEV2tkDHGvrL3XWAbQuQY4sd68lu9Sk6p0e2BF4d7CFRcoBP
         yIQl1RB7Nthiq/ReyFZkIblGEabYf3eHAGCh7lPfAGKltjht/YdeTql4T8sGxM14a49Y
         fhjTAYOPANsxq6NL7ccSf/sgR/ix2IIoAixNI7YHHH1zkOeCieWCbIyiM1iqrZj0HdJJ
         DnMDJa0Z03nsxw8VFLLdJ8cirvz9J1X/sGL6UOC1rBgXGuq+Q7vM1w8I6lTEpatVcOxo
         YhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781156386; x=1781761186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=;
        b=diMthn8tef3p0u2LtG+EfflbWWBr8RkQLbhjrCiQZC3j9P4NUMAVCAszSvaLuxFO1O
         HMxnG96Ri4HtDvQZll3E9Prtd7u3tuaSEHSxjAB/B+04mDKUVSxkR1qQ1bcY307IfDK5
         e/mCk06xX0bkCu9OniAIQNaFN/JFjn23zq/zvuW3qjCT56/Z85DwLo+bNLf61ZtH6O6F
         rPkbUNA+MuedoArt4VvO40Y18/RfiQiFmWHRlD6WDxky5p1RJuRt3Q9VUb2hSB8fUYtf
         HS2ZOif/WYH1S4sAbI6KL23Osz5RqLQlGNrYpdVxLeWw5UIBKaH+Yw8WWGENFr5bo5iq
         HynQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HauUBGQdZH4w3P3RhCmBqwFYGy78OCvrPAq1XWRztwZ6P9qzm7QHybHvLj2F8IJQt2kGind9t8p/IZ1RM1hVw@lists.infradead.org
X-Gm-Message-State: AOJu0YyiD0oDhwFZGgyRgVpRVBFYaCmJwpaJgcEVqSw+CpEot480qtG7
	4ckSkWE/mdEx41HctBzbpELbsOe7+XjzEOaOWFcbpAxTAfe0DX1iwNMA0BPgdyPJNxSuq/Y9djD
	G7+FKK8ccCs34ZXVp4rFpdwDwn8f+Dwo=
X-Gm-Gg: Acq92OHNTyudtJN1vKeeJXq41AC6T6jxmD3s6AvCUIntkphEtCfds4g9+SIxgyB9XqG
	Z1+6564l7+8mIEiKhyCLPpEIbXk4z0OqYnREDz1zEj+IiFxmPsSyR0Bon0fBQuqgMmcLQT87ECY
	43FpuFfzpVQ02vv3L7BzAJS0ZXcA2BJwF3FMMH4naELmyo0uxd01LLGVq3L63NIOh1v2vd6XYNn
	XAbFBIxVJuowWWI9vSJwqqR9PiWLiGfmVS1T0kJ9KXPU3POwWMSuipOD+MzaFNnT4swP+6GEVXq
	jalDVkNmQIJW50AYnPM=
X-Received: by 2002:a2e:a107:0:b0:393:975b:5635 with SMTP id
 38308e7fff4ca-39919fb6857mr2532671fa.12.1781156385590; Wed, 10 Jun 2026
 22:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com>
 <20260608-ventura2_initial_dts-v5-2-37ee5bcf58b6@gmail.com> <3d56889c004fc2d11b76ace6033c7ccfb8a37d03.camel@codeconstruct.com.au>
In-Reply-To: <3d56889c004fc2d11b76ace6033c7ccfb8a37d03.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 11 Jun 2026 13:41:15 +0800
X-Gm-Features: AVVi8Ccm0DC9rSjRQJdBWLuBDknFZNLKxN-D90VWvba6LpRXnzFxGYFIhU7-HJk
Message-ID: <CAF7HswNYvs73zoCDdVq_E11H82Djy=2OY-k8=zq+G6EGrV_6Qg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_223948_217451_069721CC 
X-CRM114-Status: GOOD (  30.02  )
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

On Wed, Jun 10, 2026 at 7:15=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kyle,
>
> On Mon, 2026-06-08 at 10:42 +0800, Kyle Hsieh wrote:
> > Add linux device tree entry related to the Meta(Facebook) rmc-node.
>
> This is redundant as it is evident from the patch itself. Can you
> please remove it?
>
> > The system use an AT2600 BMC.
> > This node is named "ventura2".
>
> Can you provide some more detail about the platform in the commit
> message? What's it's purpose? Can you describe some interesting
> features or details about its design?
>
Hi Andrew,

To briefly answer your question: Ventura2 is Rack Management
Controller. It is a modular device primarily designed to manage liquid
cooling systems and monitor rack-level hardware states. Its key
hardware features include an extensive I2C/GPIO topology for
tray-level and rack-level liquid leakage detection, as well as MCTP
over I2C support for asynchronous device communications.

I will remove the redundant sentence and include this detailed
description of the platform's purpose and architecture in the commit
message for v7.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
> >  .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2888 ++++++++++++=
++++++++
> >  2 files changed, 2889 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspe=
ed/Makefile
> > index 9adf9278dc94..6b96997629d4 100644
> > --- a/arch/arm/boot/dts/aspeed/Makefile
> > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > @@ -32,6 +32,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       aspeed-bmc-facebook-minipack.dtb \
> >       aspeed-bmc-facebook-santabarbara.dtb \
> >       aspeed-bmc-facebook-tiogapass.dtb \
> > +     aspeed-bmc-facebook-ventura2.dtb \
> >       aspeed-bmc-facebook-wedge40.dtb \
> >       aspeed-bmc-facebook-wedge100.dtb \
> >       aspeed-bmc-facebook-wedge400-data64.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts =
b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > new file mode 100644
> > index 000000000000..9bf7d6e52e40
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > @@ -0,0 +1,2888 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2023 Facebook Inc.
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +#include <dt-bindings/i2c/i2c.h>
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +
> > +/ {
> > +     model =3D "Facebook Ventura2 RMC";
> > +     compatible =3D "facebook,ventura2-rmc", "aspeed,ast2600";
> >
>
> ...
>
> > +};
> > +
>
> ...
>
> > +&gpio1 {
> > +     gpio-line-names =3D
> > +     /*18A0-18A7*/   "","","","","","","","",
> > +     /*18B0-18B7*/   "","","","",
> > +                     "FM_BOARD_BMC_REV_ID0","FM_BOARD_BMC_REV_ID1",
> > +                     "FM_BOARD_BMC_REV_ID2","",
> > +     /*18C0-18C7*/   "SPI_BMC_BIOS_ROM_IRQ0_R_N","","","","","","","",
> > +     /*18D0-18D7*/   "","","","","","","","",
> > +     /*18E0-18E3*/   "FM_BMC_PROT_LS_EN","AC_PWR_BMC_BTN_R_N","","";
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "okay";
> > +
> > +     i2c-mux@77 {
> > +             compatible =3D "nxp,pca9548";
> > +             reg =3D <0x77>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             i2c-mux-idle-disconnect;
> > +
> > +             i2c0mux0ch0: i2c@0 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0>;
> > +             };
> > +
> > +             i2c0mux0ch1: i2c@1 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <1>;
> > +             };
> > +
> > +             i2c0mux0ch2: i2c@2 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <2>;
> > +             };
> > +
> > +             i2c0mux0ch3: i2c@3 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <3>;
> > +                     status =3D "okay";
> > +             };
> > +
> > +             i2c0mux0ch4: i2c@4 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <4>;
> > +                     status =3D "okay";
> > +             };
> > +
> > +             i2c0mux0ch5: i2c@5 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <5>;
> > +                     status =3D "okay";
> > +
> > +                     eeprom@56 {
> > +                             compatible =3D "atmel,24c128";
> > +                             reg =3D <0x56>;
> > +                     };
> > +             };
> > +
> > +             i2c0mux0ch6: i2c@6 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <6>;
> > +
> > +                     eeprom@56 {
> > +                             compatible =3D "atmel,24c128";
> > +                             reg =3D <0x56>;
> > +                     };
> > +
> > +                     fan_io_expander0: gpio@20 {
> > +                             compatible =3D "nxp,pca9555";
> > +                             reg =3D <0x20>;
> > +                             gpio-controller;
> > +                             #gpio-cells =3D <2>;
> > +                     };
> > +
> > +                     fan_io_expander1: gpio@21 {
> > +                             compatible =3D "nxp,pca9555";
> > +                             reg =3D <0x21>;
> > +                             gpio-controller;
> > +                             #gpio-cells =3D <2>;
> > +                     };
> > +
> > +                     adc@1d {
> > +                             compatible =3D "ti,adc128d818";
> > +                             reg =3D <0x1d>;
> > +                             ti,mode =3D /bits/ 8 <1>;
> > +                     };
> > +
> > +                     adc@35 {
> > +                             compatible =3D "maxim,max11617";
> > +                             reg =3D <0x35>;
> > +                     };
> > +             };
> > +
> > +             i2c0mux0ch7: i2c@7 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <7>;
> > +
> > +                     fanctl0: fan-controller@20 {
> > +                             compatible =3D "maxim,max31790";
> > +                             reg =3D <0x20>;
> > +                             #address-cells =3D <1>;
> > +                             #size-cells =3D <0>;
> > +                             channel@2 {
>
> Can you make sure that you consistently use a blank line to separate
> child nodes from each other and from properties in their parent?
>
> Please fix throughout.

I will recheck the whole file to satisfy the rule in the next patch v7, tha=
nks.
>
> > +                                     reg =3D <2>;
> > +                                     sensor-type =3D "TACH";
> > +                             };
> > +                             channel@5 {
> > +                                     reg =3D <5>;
> > +                                     sensor-type =3D "TACH";
> > +                             };
> > +                     };
> > +
> > +                     fanctl1: fan-controller@23 {
> > +                             compatible =3D "nuvoton,nct7363";
> > +                             reg =3D <0x23>;
> > +                             #pwm-cells =3D <2>;
> > +
> > +                             fan-9 {
> > +                                     pwms =3D <&fanctl1 0 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x09>;
> > +                             };
> > +
> > +                             fan-11 {
> > +                                     pwms =3D <&fanctl1 0 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0B>;
> > +                             };
> > +
> > +                             fan-10 {
> > +                                     pwms =3D <&fanctl1 4 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0A>;
> > +                             };
> > +
> > +                             fan-13 {
> > +                                     pwms =3D <&fanctl1 4 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0D>;
> > +                             };
> > +
> > +                             fan-15 {
> > +                                     pwms =3D <&fanctl1 6 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0F>;
> > +                             };
> > +
> > +                             fan-1 {
>
> Can you please sort the fan nodes in ascending order?
I will reorder the fan node in next patch v7.
>
> > +                                     pwms =3D <&fanctl1 6 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x01>;
> > +                             };
> > +
> > +                             fan-0 {
> > +                                     pwms =3D <&fanctl1 10 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x00>;
> > +                             };
> > +
> > +                             fan-3 {
> > +                                     pwms =3D <&fanctl1 10 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x03>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> >
>
> ...
>
> > +
> > +     // Marvell 88E6393X EEPROM
>
> Please try to be consistent with the comment style (prefer /* */).
I will fix this in the next patch v7, thanks for your suggestion.
>
> > +     eeprom@50 {
> > +             compatible =3D "atmel,24c64";
> > +             reg =3D <0x50>;
> > +     };
> > +
> > +     rtc@51 {
> > +             compatible =3D "nxp,pcf8563";
> > +             reg =3D <0x51>;
> > +     };
> > +};
> > +

