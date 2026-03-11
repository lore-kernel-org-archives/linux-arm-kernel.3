Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4B1FD064E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYKrCeV+MhTQzAkldGnfBMc/qasi6YGvmmlBuzZRAqM=; b=ufxUMePCxweZ4BAPSD95tezYIL
	OG6QiQSqAb76Loary3NuxG9553N7dG8Uw1F78yf02E2gRki8oq1mREt3FMhX5aPhz0ys2K3bk78X5
	sQVkWcviZAzO6ZY8i+AiEVUCrGRa7yVRxgoayak9XdTdDqQ85yZcSQURaNBeHR5H219k8fb10j/lC
	2SW9rs32yUgTojoff6QvjJ7E9yqK97jGhQPmb9u9JsUWE6UozecnB3nc6Rf9QnKbLqvgeVPp2by1g
	a+adRTyBHpl3fkKIy1Ff5omE5e6AUsVibh8LdWJvDNzLyvE356N0fT4ByV/PGK89S+RiDFe1hLQZv
	1ehbHv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EZg-0000000B7NA-1mVc;
	Wed, 11 Mar 2026 08:05:48 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EZe-0000000B7Ml-0kK7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:05:47 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-899a5db525cso129349886d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 01:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773216345; cv=none;
        d=google.com; s=arc-20240605;
        b=cSwB6zhMSGFjRAz5U3Y6Eb1NFNe3O1/onbn5KticWGC+qQqQTHBtLZjPBeDtzkS6H3
         aM6VpKYr+ZPY05aArzyPcu2ZgvghoUgNJNnlZlE0LwDB6g/frFcY56m1t845bq4CF6FT
         q6+ZmZ6BiQBRDYjSnW67gmblSTNkvbkheF4OMe2u0Z8ZreDuRqppIrOJd80UDA0fp3Vl
         XPmCCaGfKDD7UaXgbB8alqlmrLHeYpYE4GbZehNmcpwJpAwR7UUHVzCBU0KdrMuv5D2R
         97kYzg/oWO7tQwGpoq9mwuiaWLE3UnmK8IuSYxM82Nu7vm5z5e6p+vJrsHUgNWDmiZqp
         73AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYKrCeV+MhTQzAkldGnfBMc/qasi6YGvmmlBuzZRAqM=;
        fh=IKDm5vr+oOn9lF2OGCvFtZZNYc34wA1evwgdpL2WPU4=;
        b=SETr26BZ34y5jdGeYcYNgfc719FndzEIXKGTQ8wfrLQSr2oZJhUusRKiZJ2abuNn0W
         waoIFKEGNhsA2Jal5ZyIPUixdW0i1w/1nDhqZ6P0diXv19xnY+Uo1vRmtbpVT7T6sYpu
         pG6xTJNjej5xwDjLp8/RDeWGE1Buzz12j+i47sNjUjBIczOp16Ygki5PvSnlYWN8xo+y
         MhWmE+wj5IMC84KfOl5oGwZR/ye3EBrCrZBmTokXK6J6473V/xOHy9Qrbb6BLajlet8b
         R0la2jCvs+GTTD/H8P79EVNknaI9XYfXN/I4pj/WJci8Szbz00so5SCQX+lD7/2TPfft
         Cgjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773216345; x=1773821145; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYKrCeV+MhTQzAkldGnfBMc/qasi6YGvmmlBuzZRAqM=;
        b=TFgVOtO+v26u0tdm5Ua3x66/PNXit1Qoq+Ri8yJKskB/meWhIZaquh/VAXUACnAoZb
         BelsKuvv8TPzcB/Y7UK2QdW2LmZtE2VWmdOz/wQ3LJo9H95nFKUACa5Mpij64F4i8r0X
         N7AuMDmDdelaFyuFedGZ1oQ1UfOuMyEiLVL+1yQniL0bnAf0qtvbUBYHXoI4Tn5NUY9S
         YSmULdCbIWF1yh6k0aIkEqm+kBbCvwFmEGfzc31QaqUX/7Bi723YhqeFfS4I7OYDzhSR
         vBrLn0EEifKmj2Whm6uqoKCkeC6SK2Wr5BLbN+E9M8oBhFxdYSII/Y9K7THTRxZwYYAf
         XrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216345; x=1773821145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AYKrCeV+MhTQzAkldGnfBMc/qasi6YGvmmlBuzZRAqM=;
        b=StfiKGB/vkkTU4CiMv5TEgupkVF32Foa2Kg9ZwkqYlwyJMjFa+mnAsfnFnY1p2L4b9
         bPzi8MECAE6+dpTbV8EQ+TDw2h9FpNgIBCtJuhAYmgPeKZn7oZHa94sHnZMv+5IZZQfx
         jn8RlNPK5KTo9ZpJ/rR5vBX6QrkRmXgNKMBASWoLRSnvtQoLbHYRgreOMOhtRp42KTts
         4y1Uk7ZQ0wp303ARnd6rrSBHtzpoMnfdY0gjPopJ+IuMCXUXcJfPzZi1q5YNaKw+Zt6Q
         LE+BRSyvhON+BQEqWhPvkXSs0mN35Ht0ZUqr9REJzKBpgmfa9fOKzg0JpY+zPUbNKjkz
         a1lA==
X-Forwarded-Encrypted: i=1; AJvYcCVBuBCmM7YCrYQijGTrTyULl/Who3cT5jFJDGGUbOFsJKXDA1L0UvvzfEF9eeT7M1BC8hgoa2PgHhvrGpmb+GYX@lists.infradead.org
X-Gm-Message-State: AOJu0YwHkXWk5ehzbLwib7nSH+cXIGSomxiBpapsJ4jdrczimCZbbNoo
	B5C/Yp+TnSpoOAz3X/xKqRXMMe3z1KD1P02OqjAzVg3v3CU6vpTNZC55KIRrQELXajmOU22otHo
	KOLaV29bBfk2/lBIC5OM6QEyWJ9eUelI=
X-Gm-Gg: ATEYQzxIQrCNVd4rpmu6AK4Y5HWzHyvDdWurVI2mvzNe3GPpcRYlCIdW2xmlNjakLZV
	u/9r1s2WIMb0a8htwPb9YkWidErQRupfG87KbDAmvabT1hWHEKxfs8qYyQDZ7FWon3PMJ7GIh6D
	WVqvQSd8yPsvrTDzewf0q5jxv6l+s4iu46CMDtUKdRRiZcsjezM5WTUlIqTCL7qjyUZbYuBbq+o
	kiMZej4QXCEHZO/O3FBMgvCml/GUATT/AXmyF2DBY4v0jkGc4NxlEnR7lEVllUG5HM1oocU6Y4D
	nFIxq3J5
X-Received: by 2002:a05:6214:c44:b0:899:f5a4:8110 with SMTP id
 6a1803df08f44-89a66ad1f80mr18466396d6.56.1773216344645; Wed, 11 Mar 2026
 01:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260202-sanmiguel_init_dts-v1-0-c0023ae41899@gmail.com>
 <20260202-sanmiguel_init_dts-v1-2-c0023ae41899@gmail.com> <d7c03808b09b4cb3994a9de2eff156ec589ab581.camel@codeconstruct.com.au>
In-Reply-To: <d7c03808b09b4cb3994a9de2eff156ec589ab581.camel@codeconstruct.com.au>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 11 Mar 2026 16:05:33 +0800
X-Gm-Features: AaiRm52tmf-PMV2NqwBvW-Vb0NrLbQv85M7D1YR9rJ6D6ErXgN13_VbO5sEQOD0
Message-ID: <CAGfYmwVdUJLUhjgyPUcOw2eTRxndba4Czb7rdw10cABBN2GRuQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add Meta SanMiguel BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Patrick Williams <patrick@stwcx.xyz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
	Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
	Roger Kan <Roger.Kan@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_010546_295301_0AB6A1E0 
X-CRM114-Status: GOOD (  25.23  )
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

On Mon, Feb 9, 2026 at 2:40=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Potin,
>
> Regarding the patch subject, can you please capitalise the start of the
> description after '... aspeed:'?
>
>    ARM: dts: aspeed: Add Meta SanMiguel BMC
>
Hi Andrew,

Thank you for reminding.
Updated in v3.

> On Mon, 2026-02-02 at 14:03 +0800, Potin Lai wrote:
> > Add linux device tree entry for Meta (Facebook) SanMiguel compute-tray
> > BMC using AT2620 SoC.
> >
> > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
> >  .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   | 1163 ++++++++++++=
++++++++
> >  2 files changed, 1164 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspe=
ed/Makefile
> > index 9adf9278dc94..ab2effc29f6f 100644
> > --- a/arch/arm/boot/dts/aspeed/Makefile
> > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > @@ -30,6 +30,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       aspeed-bmc-facebook-harma.dtb \
> >       aspeed-bmc-facebook-minerva.dtb \
> >       aspeed-bmc-facebook-minipack.dtb \
> > +     aspeed-bmc-facebook-sanmiguel.dtb \
> >       aspeed-bmc-facebook-santabarbara.dtb \
> >       aspeed-bmc-facebook-tiogapass.dtb \
> >       aspeed-bmc-facebook-wedge40.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> > new file mode 100644
> > index 000000000000..bcf857835b23
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> > @@ -0,0 +1,1163 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +// Copyright (c) 2025 Facebook Inc.
> > +
> > +/dts-v1/;
> > +#include "aspeed-g6.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +#include <dt-bindings/usb/pd.h>
> > +#include <dt-bindings/leds/leds-pca955x.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/i2c/i2c.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +     model =3D "AST2600 VR NVL144 BMC";
> > +     compatible =3D "aspeed,ast2600";
>
> This is missing the platform compatible string defined in the previous
> patch.
>
Updated in v3.

> > +
> > +     aliases {
> > +             serial0 =3D &uart1;
> > +             serial1 =3D &uart2;
> > +             serial2 =3D &uart3;
> > +             serial3 =3D &uart4;
> > +             serial4 =3D &uart5;
> > +             i2c16   =3D &imux16;
> > +             i2c17   =3D &imux17;
> > +             i2c18   =3D &imux18;
> > +             i2c19   =3D &imux19;
> > +             i2c20   =3D &i2c20;
> > +             i2c21   =3D &i2c21;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial4:57600n8";
> > +     };
> > +
> > +     memory@80000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x80000000 0x80000000>;
> > +     };
> > +
> > +     iio-hwmon {
> > +             compatible =3D "iio-hwmon";
> > +             io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3=
>,
> > +                           <&adc0 4>, <&adc0 5>, <&adc0 6>;
> > +     };
> > +
> > +     spi2_gpio: spi {
> > +             compatible =3D "spi-gpio";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             sck-gpios =3D <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>=
;
> > +             mosi-gpios =3D <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH=
>;
> > +             miso-gpios =3D <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH=
>;
> > +             cs-gpios =3D <&gpio0 ASPEED_GPIO(X, 2) GPIO_ACTIVE_LOW>;
> > +             num-chipselects =3D <1>;
> > +
> > +             tpm@0 {
> > +                     compatible =3D "infineon,slb9670", "tcg,tpm_tis-s=
pi";
> > +                     spi-max-frequency =3D <33000000>;
> > +                     reg =3D <0>;
> > +             };
> > +     };
> > +
> > +     standby_power_regulator: standby-power-regulator {
> > +             status =3D "okay";
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "standby_power";
> > +             gpio =3D <&gpio0 ASPEED_GPIO(M, 3) GPIO_ACTIVE_HIGH>;
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +             enable-active-high;
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +     };
> > +
> > +     scm-leds {
> > +             compatible =3D "gpio-leds";
> > +             led-0 {
> > +                     label =3D "bmc_heartbeat_amber";
> > +                     gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_L=
OW>;
> > +                     linux,default-trigger =3D "heartbeat";
> > +             };
> > +     };
> > +
> > +     fio-leds {
> > +             compatible =3D "gpio-leds";
> > +             led-0 {
> > +                     label =3D "power_blue";
> > +                     gpios =3D <&fio_ioexp 4 GPIO_ACTIVE_HIGH>;
> > +             };
> > +             led-1 {
> > +                     label =3D "power_amber";
> > +                     gpios =3D <&fio_ioexp 5 GPIO_ACTIVE_LOW>;
> > +             };
> > +             led-2 {
> > +                     label =3D "id_blue";
> > +                     gpios =3D <&fio_ioexp 6 GPIO_ACTIVE_HIGH>;
> > +             };
> > +             led-3 {
> > +                     label =3D "id_amber";
> > +                     gpios =3D <&fio_ioexp 7 GPIO_ACTIVE_LOW>;
> > +             };
> > +     };
> > +};
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +     flash@0 {
> > +             status =3D "okay";
> > +             m25p,fast-read;
> > +             label =3D "bmc";
> > +             spi-max-frequency =3D <50000000>;
> > +#include "openbmc-flash-layout-128.dtsi"
> > +     };
> > +     flash@1 {
> > +             status =3D "okay";
> > +             m25p,fast-read;
> > +             label =3D "alt-bmc";
>
> Perhaps include the alt layout for 128M as well (which I recently
> applied).
>
This will be added in the next submission (v4).

> > +             spi-max-frequency =3D <50000000>;
> > +     };
> > +};
> > +
> > +&uart1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&uart3 {
> > +     status =3D "okay";
> > +};
> > +
> > +&uart5 {
> > +     status =3D "okay";
> > +};
> > +
> > +&uart_routing {
> > +     status =3D "okay";
> > +};
> > +
> > +&mdio0 {
>
> The DTS coding style allows label references to be ordered
> alphabetically, which is my preference. Can you please fix this
> throughout?
>
Sorry, v3 has not applied with the DTS coding style.
I will update it in the next submission (v4).

> > +     status =3D "okay";
> > +     ethphy0: ethernet-phy@0 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <0>;
> > +     };
> > +};
> > +
> > +&mac0 {
> > +     status =3D "okay";
> > +     pinctrl-names =3D "default";
> > +     phy-mode =3D "rgmii-rxid";
> > +     max-speed =3D <1000>;
> > +     phy-handle =3D <&ethphy0>;
> > +     pinctrl-0 =3D <&pinctrl_rgmii1_default>;
> > +};
> > +
> > +&ehci1 {
> > +     status =3D "okay";
> > +     hub@1 {
> > +             reg =3D <1>;
> > +             hub@2 {
> > +                     reg =3D <2>;
> > +                     hub@1 {
> > +                             reg =3D <1>;
> > +                             device@1 {
> > +                                     reg =3D <1>;
> > +                                     cp2112a: interface@1 {
> > +                                             reg =3D <1 1>;
> > +
> > +                                             gpio-controller;
> > +                                             interrupt-controller;
> > +                                             #gpio-cells =3D <2>;
> > +                                             #interrupt-cells =3D <2>;
> > +
> > +                                             i2c20: i2c {
> > +                                                     #address-cells =
=3D <1>;
> > +                                                     #size-cells =3D <=
0>;
> > +                                             };
> > +                                     };
> > +                             };
> > +                             hub@3 {
> > +                                     reg =3D <3>;
> > +                                     cp2112c: device@2 {
> > +                                             reg =3D <2>;
> > +                                             gpio-controller;
> > +                                             #gpio-cells =3D <2>;
> > +                                             interrupt-controller;
> > +                                             #interrupt-cells =3D <2>;
> > +
> > +                                             gpio-line-names =3D
> > +                                                     "IOB0_MCP_P0_2-B"=
,
> > +                                                     "IOB0_MCU_RST_L-O=
",
> > +                                                     "IOB0_MCU_RECOVER=
Y_L-O",
> > +                                                     "IOB0_GLOBAL_WP-O=
",
> > +                                                     "IOB0_GLOBAL_ADDR=
_L_R-O",
> > +                                                     "IOB0_GLOBAL_ADDR=
_U_D-O",
> > +                                                     "IOB0_PWR_EN-O",
> > +                                                     "IOB0_MCU_READY_S=
TATUS-I";
> > +                                     };
> > +                             };
> > +                             hub@4 {
> > +                                     reg =3D <4>;
> > +                                     cp2112d: device@2 {
> > +                                             reg =3D <2>;
> > +                                             gpio-controller;
> > +                                             #gpio-cells =3D <2>;
> > +                                             interrupt-controller;
> > +                                             #interrupt-cells =3D <2>;
> > +
> > +                                             gpio-line-names =3D
> > +                                                     "IOB1_MCP_P0_2-B"=
,
> > +                                                     "IOB1_MCU_RST_L-O=
",
> > +                                                     "IOB1_MCU_RECOVER=
Y_L-O",
> > +                                                     "IOB1_GLOBAL_WP-O=
",
> > +                                                     "IOB1_GLOBAL_ADDR=
_L_R-O",
> > +                                                     "IOB1_GLOBAL_ADDR=
_U_D-O",
> > +                                                     "IOB1_PWR_EN-O",
> > +                                                     "IOB1_MCU_READY_S=
TATUS-I";
> > +                                     };
> > +                             };
> > +                     };
> > +                     hub@2 {
> > +                             reg =3D <2>;
> > +                             device@1 {
> > +                                     reg =3D <1>;
> > +                                     cp2112b: interface@1 {
> > +                                             reg =3D <1 1>;
> > +
> > +                                             gpio-controller;
> > +                                             interrupt-controller;
> > +                                             #gpio-cells =3D <2>;
> > +                                             #interrupt-cells =3D <2>;
> > +
> > +                                             i2c21: i2c {
> > +                                                     #address-cells =
=3D <1>;
> > +                                                     #size-cells =3D <=
0>;
> > +                                             };
> > +                                     };
> > +                             };
> > +                             hub@3 {
> > +                                     reg =3D <3>;
> > +                                     cp2112e: device@2 {
> > +                                             reg =3D <2>;
> > +                                             gpio-controller;
> > +                                             #gpio-cells =3D <2>;
> > +                                             interrupt-controller;
> > +                                             #interrupt-cells =3D <2>;
> > +
> > +                                             gpio-line-names =3D
> > +                                                     "IOB2_MCP_P0_2-B"=
,
> > +                                                     "IOB2_MCU_RST_L-O=
",
> > +                                                     "IOB2_MCU_RECOVER=
Y_L-O",
> > +                                                     "IOB2_GLOBAL_WP-O=
",
> > +                                                     "IOB2_GLOBAL_ADDR=
_L_R-O",
> > +                                                     "IOB2_GLOBAL_ADDR=
_U_D-O",
> > +                                                     "IOB2_PWR_EN-O",
> > +                                                     "IOB2_MCU_READY_S=
TATUS-I";
> > +                                     };
> > +                             };
> > +                             hub@4 {
> > +                                     reg =3D <4>;
> > +                                     cp2112f: device@2 {
> > +                                             reg =3D <2>;
> > +                                             gpio-controller;
> > +                                             #gpio-cells =3D <2>;
> > +                                             interrupt-controller;
> > +                                             #interrupt-cells =3D <2>;
> > +
> > +                                             gpio-line-names =3D
> > +                                                     "IOB3_MCP_P0_2-B"=
,
> > +                                                     "IOB3_MCU_RST_L-O=
",
> > +                                                     "IOB3_MCU_RECOVER=
Y_L-O",
> > +                                                     "IOB3_GLOBAL_WP-O=
",
> > +                                                     "IOB3_GLOBAL_ADDR=
_L_R-O",
> > +                                                     "IOB3_GLOBAL_ADDR=
_U_D-O",
> > +                                                     "IOB3_PWR_EN-O",
> > +                                                     "IOB3_MCU_READY_S=
TATUS-I";
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&adc0 {
> > +     aspeed,int-vref-microvolt =3D <2500000>;
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_adc0_default &pinctrl_adc1_default
> > +             &pinctrl_adc2_default &pinctrl_adc3_default
> > +             &pinctrl_adc4_default &pinctrl_adc5_default
> > +             &pinctrl_adc6_default>;
> > +};
> > +
> > +&wdt1 {
> > +     status =3D "okay";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_wdtrst1_default>;
> > +     aspeed,reset-type =3D "soc";
> > +     aspeed,external-signal;
> > +     aspeed,ext-push-pull;
> > +     aspeed,ext-active-high;
> > +     aspeed,ext-pulse-duration =3D <256>;
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "okay";
> > +     aspeed,enable-byte;
> >
>
> ... Have you run `make dtbs_check`? A quick grep suggests this isn't a
> valid property.
>
I think v3 has fixed most of the failures in this DTS file.
The remaining failures originate from other included DTSI files.

> > +
> > +     ssif-bmc@10 {
> > +             compatible =3D "ssif-bmc";
> > +             reg =3D <0x10>;
> > +             alert-gpios =3D <&gpio1 ASPEED_GPIO(D, 7) GPIO_ACTIVE_LOW=
>;
> > +             timeout-ms =3D <5000>;
> > +     };
> > +};
> > +
> > +&i2c1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c2 {
> > +     status =3D "okay";
> > +
> > +     hpm0_ioexp_20: gpio@20 {
> > +             compatible =3D "nxp,pca9555";
>
> Is this a true nxp,pca9555, or a CPLD-based reimplementation? Same
> query for other instances...
>
There are physical IO expander chips on the module, not CPLD-based.

> Andrew

Potin

