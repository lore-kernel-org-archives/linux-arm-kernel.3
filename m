Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA957CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqZkejEpj7nilH9mKjPMxCw9IdcRez2O8jHjWC+E3jg=; b=0FejmTvvL2Em87
	Fj0Zpn4d7iKH0Jp/FxRWlPu2rzdcDVTrhaLFT6m+fUAAH89Dl5+CWq17DcxulrrV1hlGT+cx80QFi
	mkvDfVm2946R3wf1hDemFG75sPG0nf6G9ghsDrL1jYdBtNBQadClf0xToZis4PKOlo40TQJ2Ex/SS
	V8tFYLn4SqYTLzDRczNdVun8Hezdl30onVe3UJxsiBI0v93zZuxdDbYWEMQT0SDHZMqf7bY2OnIH9
	RT/yYfri7oQjn3tdzJbywpmOpnPvGQdR2R0cojGgjD+OXgonc1SH2519j8VLcaGUiaw1FYVcbuWTZ
	fZxvvF4D878ZIdyu78zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMgK-0000000E8Q1-1dDB;
	Sat, 13 Sep 2025 09:36:32 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMgH-0000000E8PA-3TvI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 09:36:31 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f6507bd53so2847536e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 02:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757756186; x=1758360986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqZkejEpj7nilH9mKjPMxCw9IdcRez2O8jHjWC+E3jg=;
        b=DsE4cbFxaahsCqdymupdxuLxcJqQ7Iu/vI4FGNwfj/kvdSFi6hAExmA+Tiyn9T2thB
         VjiS7CzAth15VBwgXfNgNqvveQPXwDkI1AjiS6Ex/ASUGmHIB9QWRqmg7AuJ+iqpNxnm
         tRnEiA14+9SyA6CLKhUTcoC8ilSssVcgzRAOSLNdw34pmSRbd9OY5T+cfek2ODSivvKr
         zaAYO2Vi9QJGyrDESFJkkLPvMRsswApaS/SSHmV/G6kLiBkffYV8tRPvDT4pvw5nZn0f
         Yf3o+K+3UPkasrFiUW69gV1zxa0n/ciQiMvbz2OFfxxWv8/hOJSy4Z9BHnveusZwbuDx
         dEiw==
X-Forwarded-Encrypted: i=1; AJvYcCW7iI1XrYpktI3bler2cUkZpOv/JRVI+AEFN2jDgVQgggadO9PeLPNUj5BkqhqJgDC2Nzjxec66LyJwvEquogfP@lists.infradead.org
X-Gm-Message-State: AOJu0YxyTNL0DaqY9wg8t+b2oU82E8ek7nutoeXJx5lIZkaDj8eNyv5x
	+HzWqW2AeSN4qboGnCfnn+fmrVqXC5bSUCQMEPCweIs8e7HTScG3EUpANJ8j8iPZOdA=
X-Gm-Gg: ASbGnctGI4AU+WPnge+v2ki2Lc9/fgPspi81a82tx3T26+HNHXGiJBvLRXMkmlG8+l/
	yMmmWGjX9Yz3tK5G9MaMLdw9+1tMVrt+7OiihwYmKiaBjMR3ohaZruxz1ikCTHN/P3aJZzDWEei
	KAy+woomixzT5bLFsk0KDvGp/SuSgyooYheKAQLMvx1ePIcYKQYOLiFLGnGERXj2XuCnM2aH1y6
	vkkHkneEDHI1dl+a1Z3nQxZ5Qtljw0wikAamcLS3m3/ev/zxxIpbTpCkUgzDdshUCZrvvDI2iYB
	zSy839JqOJ0NuXjEkxpNDWoJu1GeHnNBSxdbR8y9pc0hJF5o2w3wNFu1FjhSPk9C0/nvE7EZWbp
	NTJuEksfa2M1ZEEeio7hJvBAoABCja12zay1jvbzobUplV5PCs4AelwI=
X-Google-Smtp-Source: AGHT+IGor2o7tCzac4sEm4ex8CPSuYCc8S0uanR9061P/Xv7QK2Pxp0drZQK5R2yJZnNn0SaLcEYJA==
X-Received: by 2002:ac2:4bcd:0:b0:571:3afa:33dc with SMTP id 2adb3069b0e04-5713afa35f7mr1808927e87.16.1757756186043;
        Sat, 13 Sep 2025 02:36:26 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b5fadsm1860937e87.6.2025.09.13.02.36.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 02:36:25 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336a85b8fc5so23190891fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 02:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXM1gaS6aMIyBuUwbj3KQNltTh6A1QfnAGdgN87VwV/wbI48eENhn5G9FzpptI9pep+eTqVHjA5fibjaPmd3cCB@lists.infradead.org
X-Received: by 2002:a05:651c:b23:b0:337:f9d1:2d4b with SMTP id
 38308e7fff4ca-35140dad226mr15003881fa.43.1757756185533; Sat, 13 Sep 2025
 02:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net> <20250912-x96q-v1-2-8471daaf39db@posteo.net>
 <20250912105449.70717d80@donnerap>
In-Reply-To: <20250912105449.70717d80@donnerap>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 13 Sep 2025 17:36:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v67dp8V4A86yyaixN9oOgBzMpLJ0ZxnDLng8mO2tkEqYUg@mail.gmail.com>
X-Gm-Features: Ac12FXy8fzV4FQejnH6LBzMMS9T4T_cC2xTKZN88l5j4V4okWfzi1q9Hfy1IowY
Message-ID: <CAGb2v67dp8V4A86yyaixN9oOgBzMpLJ0ZxnDLng8mO2tkEqYUg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
To: Andre Przywara <andre.przywara@arm.com>, 
	=?UTF-8?Q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>, 
	j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_023629_944537_3BBA6BCB 
X-CRM114-Status: GOOD (  39.29  )
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

On Fri, Sep 12, 2025 at 5:54=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Fri, 12 Sep 2025 01:52:10 +0200
> J. Neusch=C3=A4fer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrot=
e:
>
> Hi,
>
> many thanks for posting the DT, I really wish more people would do that!
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
> > - analog video output (requires AC200 driver)
> > - HDMI audio/video output
> >
> > Untested:
> > - "OTG" USB port in device mode
> > - built-in IR receiver
> > - external IR receiver
> > - WLAN (requires out-of-tree XRadio driver)
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
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> >  arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts | 235 +++++++++++++=
++++++++
> >  2 files changed, 236 insertions(+)
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
> > index 0000000000000000000000000000000000000000..9534eb03b89557f2545af5a=
f7cf43390be722cf0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
> > @@ -0,0 +1,235 @@
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
> > +             mmc0 =3D &mmc0;
> > +             mmc1 =3D &mmc1;
> > +             mmc2 =3D &mmc2;
>
> We don't do mmc aliases in the upstream DTs. Long story, but you should
> not need them. I guess you want to disagree ;-), in this case U-Boot has
> you covered, by adding the aliases during build time: just use
> $fdtcontroladdr, as you should do anyway.
>
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
> > +     vmmc-supply =3D <&reg_aldo1>;
> > +     cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > +     disable-wp;
> > +     bus-width =3D <4>;
> > +     max-frequency =3D <150000000>;
>
> That line is already in the .dtsi file, so redundant.
>
> > +     status =3D "okay";
> > +     /* =C2=B5SD */
>
> If we really need this comment, it should be above, right after the
> "&mmc0 {". And I wonder if it should be "microSD" instead.

Yes. Please use ASCII in the code if possible, since some of us have
setups that don't quite work well with extended character sets.

> > +};
> > +
> > +&mmc1 {
> > +     /* TODO: XRadio XR819 WLAN */
>
> Either you just keep the comment, an mention mmc1, but don't reference th=
e
> node, or you add the properties that you know of already, like
> vmmc-supply, vqmmc-supply, mmc-pwrseq, bus-width, non-removable.
> But this "empty reference with a comment" is somewhat odd.

I'd say just fill it in completely so that the mmc host is enabled and
the SDIO card is detected. Missing driver support for the chip is a
different issue, but since this is an enumerable bus it shouldn't prevent
you from describing everything already.

> > +};
> > +
> > +&mmc2 {
> > +     vmmc-supply =3D <&reg_aldo1>;
> > +     vqmmc-supply =3D <&reg_bldo1>;
> > +     non-removable;
> > +     cap-mmc-hw-reset;
> > +     mmc-ddr-1_8v;
> > +     mmc-hs200-1_8v;
> > +     bus-width =3D <8>;
> > +     max-frequency =3D <100000000>;
>
> Are you sure you need that?
>
> > +     status =3D "okay";
> > +     /* eMMC */
>
> Please move that comment up.

I don't think it's necessary though. hs200 and 8-bit width would make
it obvious that it's an eMMC.

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
>
> Why is this always on? What happens if you remove that line or turn it of=
f?
> For always-on regulators we either need a comment saying why, or, better,
> have an explanatory regulator-name (like above).
> Is that for DRAM, by any chance (1.5V for DDR3 chips)?
>
> Cheers,
> Andre
>
> > +                             regulator-min-microvolt =3D <1500000>;
> > +                             regulator-max-microvolt =3D <1500000>;
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

