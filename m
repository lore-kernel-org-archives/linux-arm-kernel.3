Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5882ECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 04:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73UL61+9pLCpRMWx7q6mvFEg7F186Qu7dLluxWn/Eb0=; b=dFFibqM9sA+Uaa
	TYVt6tV+RViePNkMv2pG8FSVEvFBY6nilZ0f5wfmMp7T49h/t/31mb5s+hJX2BVS8KoO+D4r0u5MK
	AY30YDmD9dwgYgkTrUeamFLNmqN8ku3LpdYpqxWc7kLPCQBY1ZFc7CDSHgzmqRTab4b2ODvLMxhwM
	uyxRq/EONKBh8/FhEOO3H0ryOPtukL1Orl5+I7ZZiF8F+ZDzDv7zEL92f2hjOh9QLB2rj2WchOExV
	jiZfXvN/exDuqRW2GwrFAHcIdD+BH5YdBK7Gvq8cnz5JAGcmDVWLq4HXilYbATxfF6qcU4/91y2RH
	ZZUJxqrr11Zp/w6mUu5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzSl9-00000001o4H-3uYM;
	Fri, 19 Sep 2025 04:30:11 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzSl6-00000001o3T-1q2j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 04:30:10 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-579c95a2be2so869856e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 21:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758256206; x=1758861006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73UL61+9pLCpRMWx7q6mvFEg7F186Qu7dLluxWn/Eb0=;
        b=b6ccXn4Qis7yKeNJQNLagBUdg0HLAMgkej8hZbCyKi2IySNcC0naoSDi+sx7bsCNmR
         Y8hvpwMBGVgptwNFayL339MYmdzPj2/F9sc6xlEGOXAVuVw0gKCLVQ3YU+l/JRL5/VGo
         xDOLIBdayNb4MXH7vQfGPbdn75J1FlRzC64ZVOlTQQKkOZJV7Pvq8+6Uti/wW141+AlY
         l6rqmM6t2O9ZEGO9GJHkcXOFT/0pCo0I0B/6OShqnDqmHv8h/TkphgNhOPMQgnIFVAFq
         b1OKcgGo2gsriB573xoK9dqDzZo4GpjA69QZXQMpGlqlaDpkxHnonP+L2hb1utg0wzA9
         0DpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHP4GPAcD10OwnDyPoIIf7Jh4pQ2KJVlsus6SkM26qaikEiyaF+LMREtWuAL4Wb93pP0Axsjoa6SjMxp8SgCqq@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk5ZQtUUJXasuboBUheTI6DGImQpPZ/rHUj/lq9Z7T3xzCkXNC
	TOWK8aFiuYMZUCeuO9So7nwVmJrMpGsZtJTWZGDL+EpLhnVHJ/u2zJ9wtdtHft2E
X-Gm-Gg: ASbGnctq9EqRaz6KUuD9hygNgjFPcUw+21uBQ+0ScK+yn0r3lXjnHv2MMfFqqEIzAOB
	CaLeR5uMRvIY1ITKs0euXYBZIcptm2H/jYXquY1cbEdno3wkrCglLnNigDAgT+EuWE3OeLCE7Hr
	6oMp4cKYXKTwCDXxr69cSfXCjdeFWuXz/zxJZuPTMFBjN4cB8xY+GFu/YU6hc/Qv9JtCgwZ81w2
	/wZoK8FFm4hdCNqudmRn+lefbOWih2iQSOqjm12Qn+/uSJnAGNmIfkVx0szxi1jjkNy6qhlQPoC
	l1O8as2yR4F6TfAVRFFSn6Y/mtNkL/yXl8TOKnyPK7BhHTjdyvIgOYaqzXhVio+vc2qQmDBU8xp
	oswObnpkS2rCcX7pPsepc7Fg6Ey0utIaaHNFMGhAr7at8Zdcqt/40XGf4URK+0g==
X-Google-Smtp-Source: AGHT+IEEh0OQYbZGi0WxJo3pWrVtDD5x3k44VoIGelki5wdPTG/QYIj/PLt2WhMjtuhTZEUwiEZPeg==
X-Received: by 2002:a05:6512:440d:b0:572:19fb:3619 with SMTP id 2adb3069b0e04-579e148e53dmr543046e87.17.1758256205301;
        Thu, 18 Sep 2025 21:30:05 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-579e7d087edsm409685e87.10.2025.09.18.21.30.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 21:30:04 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57a59124323so190112e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 21:30:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYqpWmerDnevDk/0CvXuGUwge2LiCQgbj2ait8Z+Ev8k6LMI7PO+ZHts3kp9N+zkcLRKy7wwjwC83RnnZDEw6B@lists.infradead.org
X-Received: by 2002:a05:651c:3257:10b0:337:e238:8bd6 with SMTP id
 38308e7fff4ca-3641c633c1dmr4999071fa.40.1758256204053; Thu, 18 Sep 2025
 21:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250918-x96q-v2-0-51bd39928806@posteo.net> <20250918-x96q-v2-2-51bd39928806@posteo.net>
 <20250918221424.638a5367@minigeek.lan>
In-Reply-To: <20250918221424.638a5367@minigeek.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 19 Sep 2025 12:29:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v67qa6YoZQMoGHhawKHZxsBOiS6ThQrsaCwaGS+oRn58xQ@mail.gmail.com>
X-Gm-Features: AS18NWBfBPM-6yBxX4UPX9zTJX4DDBDlwTc17hVW51BvbFP6qSbAx0_vOFVNPZI
Message-ID: <CAGb2v67qa6YoZQMoGHhawKHZxsBOiS6ThQrsaCwaGS+oRn58xQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?UTF-8?Q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>, 
	j.ne@posteo.net, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_213008_546105_4C8E0339 
X-CRM114-Status: GOOD (  29.53  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 19, 2025 at 5:15=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Thu, 18 Sep 2025 12:58:44 +0200
> J. Neusch=C3=A4fer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrot=
e:
>
> Hi,
>
> > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> >
> > The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM=
,
> > 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> > output, and infrared input.
> >
> >   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
> >
> > Tested, works:
> > - debug UART
> > - status LED
> > - USB ports in host mode
> > - MicroSD
> > - eMMC
> > - recovery button hidden behind audio/video port
> > - analog audio (line out)
> >
> > Does not work:
> > - Ethernet (requires AC200 MFD/EPHY driver)
> > - WLAN (requires out-of-tree XRadio driver)
> > - analog video output (requires AC200 driver)
> > - HDMI audio/video output
> >
> > Untested:
> > - "OTG" USB port in device mode
> > - built-in IR receiver
> > - external IR receiver
> >
> > Table of regulators on the downstream kernel, for reference:
> >
> >  vcc-5v      1   15      0 unknown  5000mV     0mA  5000mV  5000mV
> >     dcdca    0    0      0 unknown   900mV     0mA     0mV     0mV
> >     dcdcb    0    0      0 unknown  1350mV     0mA     0mV     0mV
> >     dcdcc    0    0      0 unknown   900mV     0mA     0mV     0mV
> >     dcdcd    0    0      0 unknown  1500mV     0mA     0mV     0mV
> >     dcdce    0    0      0 unknown  3300mV     0mA     0mV     0mV
> >     aldo1    0    0      0 unknown  3300mV     0mA     0mV     0mV
> >     aldo2    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     aldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     bldo1    0    0      0 unknown  1800mV     0mA     0mV     0mV
> >     bldo2    0    0      0 unknown  1800mV     0mA     0mV     0mV
> >     bldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     bldo4    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     cldo1    0    0      0 unknown  2500mV     0mA     0mV     0mV
> >     cldo2    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     cldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> >
> > Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
>
> Looks good now, thanks for the changes!
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> Chen-Yu: any chance you can still push that, if you agree? U-Boot
> depends on DTs in tagged releases to get this imported.

I can try, but it's also up to Arnd and whether he wants to take a
really late PR or not.

ChenYu

> Cheers,
> Andre
>
> > ---
> >
> > v2:
> > - remove mmc aliases, &mmc0/max-frequency property (Andre Przywara)
> > - document reason for &mmc2/max-frequency property
> > - clean up mmc-releated comments (Andre Przywara)
> > - rename dcdcd regulator to vdd-dram, because it's the only source of
> >   1.5V (needed by the Micron MT41J256M4 DDR3 RAM), and the system halts
> >   when it's turned off.
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> >  arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts | 230 +++++++++++++=
++++++++
> >  2 files changed, 231 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index 780aeba0f3a4e14d69c9602e37b8d299165507b9..2edfa7bf4ab31c4aa934da9=
8e5e042edc9aaf600 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-mode=
l-b.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h313-tanix-tx1.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h313-x96q.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-cb1-manta.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-pi.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts b/arch/=
arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b2275eb3d55b9dacbd9006b=
93795a8011e06bf2f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
> > @@ -0,0 +1,230 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > +/*
> > + * Copyright (C) 2025 J. Neusch=C3=A4fer <j.ne@posteo.net>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h616.dtsi"
> > +#include "sun50i-h616-cpu-opp.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +     model =3D "X96Q";
> > +     compatible =3D "amediatech,x96q", "allwinner,sun50i-h616";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     reg_vcc5v: vcc5v {
> > +             /* board wide 5V supply directly from the DC input */
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc-5v";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     gpio-keys {
> > +             compatible =3D "gpio-keys";
> > +
> > +             key-recovery {
> > +                     label =3D "Recovery";
> > +                     linux,code =3D <KEY_VENDOR>;
> > +                     gpios =3D <&pio 7 9 GPIO_ACTIVE_LOW>;
> > +             };
> > +     };
> > +
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     color =3D <LED_COLOR_ID_BLUE>;
> > +                     gpios =3D <&pio 7 6 GPIO_ACTIVE_LOW>;
> > +                     default-state =3D "on";
> > +             };
> > +     };
> > +};
> > +
> > +&codec {
> > +     allwinner,audio-routing =3D "Line Out", "LINEOUT";
> > +     status =3D "okay";
> > +};
> > +
> > +&cpu0 {
> > +     cpu-supply =3D <&reg_dcdca>;
> > +};
> > +
> > +&ehci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci3 {
> > +     status =3D "okay";
> > +};
> > +
> > +/* TODO: EMAC1 connected to AC200 PHY */
> > +
> > +&gpu {
> > +     mali-supply =3D <&reg_dcdcc>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ir {
> > +     status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +     /* microSD */
> > +     vmmc-supply =3D <&reg_aldo1>;
> > +     cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > +     disable-wp;
> > +     bus-width =3D <4>;
> > +     status =3D "okay";
> > +};
> > +
> > +/* TODO: XRadio XR819 WLAN @ mmc1 */
> > +
> > +&mmc2 {
> > +     /* eMMC */
> > +     vmmc-supply =3D <&reg_aldo1>;
> > +     vqmmc-supply =3D <&reg_bldo1>;
> > +     non-removable;
> > +     cap-mmc-hw-reset;
> > +     mmc-ddr-1_8v;
> > +     mmc-hs200-1_8v;
> > +     max-frequency =3D <100000000>; /* required for stable operation *=
/
> > +     bus-width =3D <8>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ohci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ohci3 {
> > +     status =3D "okay";
> > +};
> > +
> > +&r_i2c {
> > +     status =3D "okay";
> > +
> > +     axp305: pmic@36 {
> > +             compatible =3D "x-powers,axp305", "x-powers,axp805",
> > +                          "x-powers,axp806";
> > +             interrupt-controller;
> > +             #interrupt-cells =3D <1>;
> > +             reg =3D <0x36>;
> > +
> > +             x-powers,self-working-mode;
> > +             vina-supply =3D <&reg_vcc5v>;
> > +             vinb-supply =3D <&reg_vcc5v>;
> > +             vinc-supply =3D <&reg_vcc5v>;
> > +             vind-supply =3D <&reg_vcc5v>;
> > +             vine-supply =3D <&reg_vcc5v>;
> > +             aldoin-supply =3D <&reg_vcc5v>;
> > +             bldoin-supply =3D <&reg_vcc5v>;
> > +             cldoin-supply =3D <&reg_vcc5v>;
> > +
> > +             regulators {
> > +                     reg_dcdca: dcdca {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <810000>;
> > +                             regulator-max-microvolt =3D <1100000>;
> > +                             regulator-name =3D "vdd-cpu";
> > +                     };
> > +
> > +                     dcdcb {
> > +                             /* unused */
> > +                     };
> > +
> > +                     reg_dcdcc: dcdcc {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <810000>;
> > +                             regulator-max-microvolt =3D <990000>;
> > +                             regulator-name =3D "vdd-gpu-sys";
> > +                     };
> > +
> > +                     dcdcd {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1500000>;
> > +                             regulator-max-microvolt =3D <1500000>;
> > +                             regulator-name =3D "vdd-dram";
> > +                     };
> > +
> > +                     dcdce {
> > +                             /* unused */
> > +                     };
> > +
> > +                     reg_aldo1: aldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc3v3";
> > +                     };
> > +
> > +                     aldo2 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     aldo3 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     reg_bldo1: bldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc1v8";
> > +                     };
> > +
> > +                     bldo2 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     bldo3 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     bldo4 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     cldo1 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     cldo2 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     cldo3 {
> > +                             /* unused */
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&uart0_ph_pins>;
> > +     status =3D "okay";
> > +};
> > +
> > +&usbotg {
> > +     dr_mode =3D "host";       /* USB A type receptacle */
> > +     status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +     status =3D "okay";
> > +};
> >
>
>

