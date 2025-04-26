Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4EDC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 18:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVcoo1mtrEIxAkDVtPwCzS7ht72ZpjUdTEadzPQJIvk=; b=dULRbNjwWZw3TJqqdla7ymDaUN
	YM7z2JeckqPHEfn3NJX+KmFQUecF6LowOD1jRVEDhZS0mgqobCA/ZaNUw5IN6N4AEUSXEmTVKr6QH
	WDsYhCThKWJa8TdJNnWFoGouhIp+bsGDeQ+8b7wY4nqZv+UWo/+623+K7OTJzEmg8z8S/sXkylIb8
	g4ict9pGdZQWj9/oo8a8gZbFeDFwe+5HQkfwxut3QrKhki3IP0sYj+InfbYMdOaITKvnnNG5e1ym1
	pf70rv5DeGoj5JuXrmR382KPLbGFBo5os9dHxdQuXDUoS1+f+406qKGj/G3mQYqwZeaDh9QAJyf63
	Drdft/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8kGW-00000002OUD-3RQY;
	Sat, 26 Apr 2025 18:28:40 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8kEf-00000002OOn-06pV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 18:26:46 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so5625249a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 11:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745692003; x=1746296803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVcoo1mtrEIxAkDVtPwCzS7ht72ZpjUdTEadzPQJIvk=;
        b=LtXKe2lcP+AoPwRFqFtgeL0NXAtfXc8NMsN5IXezeh4prMf70kSIDDw6kxkiEdVtqw
         rM+wZ3KuoFQu7xzbrSK+dOV/K/Lk1XPmLsEXnDRE1W3QdnrX5U797xGnePq3PsxFLAFl
         NiRxLTJFnh+RyUQHOLdaYiKC5d4ZOEixBTyj1Qt4BdXZcX9BlpAFYOq9qGCeBBmtyTjL
         CDnygJdqjMg0+ooYHR4dgtO4peGuk/FF9+DRo9NMDMM16OlAmylPwVQuap0y/OVxaSDo
         zMEhkqOnZgZAyfdQfhUgUR7YDpvDQH41UvSu/eRD0TLlJXhXD48gbd6T7aliRqLszuwD
         7iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745692003; x=1746296803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVcoo1mtrEIxAkDVtPwCzS7ht72ZpjUdTEadzPQJIvk=;
        b=txllI3oyObd+GH02k6xeT3LyzobUGe+5q+qmO/hgbV9TU5yZbhvMuFN2seNp8R8VWt
         EKho5pD9XrPg2+TYL9MSmjgUTdoNaJF5XkUA5JiTtZVUEoRqxwXI0hCPyt9jFEhKLirz
         CSGdxgilEikvRyktZb9NFaMYZayMx1z9EDU6zj8CmpJr/3Bqhzj/CN6pe3QDAXkqJIOW
         xSEV+O1RYZUNLcNhoD4qlRK4aaWoo0gsx8h6mmX8DWCV/Z0NKOtq6XlnTm0HCRDjLsJv
         m0laQRGYTcYlw5IjLGIXOgqVtfihoJr/cJ1wseK5dg1jZM8JX1wxgd7ZFbM5+AX9Pudi
         sA9w==
X-Forwarded-Encrypted: i=1; AJvYcCWnykYzpwLyZkVGciljA//INjzPwHcMDYl5e523VkciLhBsvrCji81eYSZk26DJm38+moKcvAFEDAbNsa7FEdyp@lists.infradead.org
X-Gm-Message-State: AOJu0YyBwTPQIKFJDTD8361xixMoA54q1dKkfvdmRX5iRI6yC0JcbGyd
	3rLBeL8dYyW/nnzDgPEZ3FDO4zB6BmhZmEHNhwdWvTm+6F8VvAcC
X-Gm-Gg: ASbGncvLuC4T+pBqG1FIgM0rE6O44MtxlW7W9XbeJtWFOA5gNAKTvklcuV1BZ16k+p5
	BvK7J9iniWGY5enqYvmQrOvi3uZQatGb7lHVRbNJB1CXo56MMk8XG2kECjNQowict5jr2RMYAsn
	d7E7wvqyiEUB25W+ebGqvP/Qj5uO6FwFvER6KTH0A4M2zYLeYkIcYIqkdX5UOy1EF7v/ca3KoLt
	/tTcMPOO64241bJl2xYzTSBx6cXUHMnrIYSTbqZSkZzRkW9y+OvCqwSuX7UXgnOvYN2Ne+tD+po
	ls2iy4dDLUpwIdLh4B4qh+lYjXaNe3fz9pWh+Z+dwwfrPTx+vjqxcNzeLXedyA==
X-Google-Smtp-Source: AGHT+IEppHRvWEveyC3/206Lz0zFwcVRdumb33qo/JxRksc/cZ3JRFT5TS9vvyFsFenspZEciurdNw==
X-Received: by 2002:a17:907:c10:b0:acb:5f17:623d with SMTP id a640c23a62f3a-ace711177bbmr513462766b.24.1745692002917;
        Sat, 26 Apr 2025 11:26:42 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa33csm318228766b.119.2025.04.26.11.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 11:26:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Sat, 26 Apr 2025 20:26:41 +0200
Message-ID: <7794863.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20250425135429.174a1871@donnerap.manchester.arm.com>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <20250413134318.66681-3-jernej.skrabec@gmail.com>
 <20250425135429.174a1871@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_112645_071486_D8B23256 
X-CRM114-Status: GOOD (  37.36  )
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

Dne petek, 25. april 2025 ob 14:54:29 Srednjeevropski poletni =C4=8Das je A=
ndre Przywara napisal(a):
> On Sun, 13 Apr 2025 15:42:57 +0200
> Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
>=20
> Hi Jernej,
>=20
> thanks for sending this, I now went through this in more detail and
> compared against the schematic, so some more nits below.
> I added the two comments from my other email before, so you can ignore th=
at
> one now.
>=20
> > OrangePi 3 LTS is quite similar to original OrangePi 3, but it has a lot
> > small changes that makes DT sharing unpractical with it.
> >=20
> > OrangePi 3 LTS has following features:
> > - Allwinner H6 quad-core 64-bit ARM Cortex-A53
> > - GPU Mali-T720
> > - 2 GB LPDDR3 RAM
> > - AXP805 PMIC
> > - AW859A Wifi/BT 5.0
> > - 2x USB 2.0 host port (A)
> > - USB 3.0 Host
> > - Gigabit Ethernet (Motorcomm YT8531C phy)
> > - HDMI 2.0 port
> > - soldered 8 GB eMMC
> > - 2x LED
> > - microphone
> > - audio jack
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../allwinner/sun50i-h6-orangepi-3-lts.dts    | 351 ++++++++++++++++++
> >  2 files changed, 352 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-=
lts.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index 00bed412ee31..72c43bd0e2ab 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero=
=2Dplus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > new file mode 100644
> > index 000000000000..c8830d5c2f09
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > @@ -0,0 +1,351 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h6.dtsi"
> > +#include "sun50i-h6-cpu-opp.dtsi"
> > +#include "sun50i-h6-gpu-opp.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +	model =3D "OrangePi 3 LTS";
> > +	compatible =3D "xunlong,orangepi-3-lts", "allwinner,sun50i-h6";
> > +
> > +	aliases {
> > +		ethernet0 =3D &emac;
> > +		ethernet1 =3D &aw859a;
> > +		serial0 =3D &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	connector {
> > +		compatible =3D "hdmi-connector";
> > +		ddc-en-gpios =3D <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
> > +		type =3D "a";
> > +
> > +		port {
> > +			hdmi_con_in: endpoint {
> > +				remote-endpoint =3D <&hdmi_out_con>;
> > +			};
> > +		};
> > +	};
> > +
> > +	ext_osc32k: ext_osc32k_clk {
>=20
> For the sake of completeness, as mentioned in the other mail, I think we
> want dashes in the node name.

Right.

>=20
> > +		#clock-cells =3D <0>;
> > +		compatible =3D "fixed-clock";
> > +		clock-frequency =3D <32768>;
> > +		clock-output-names =3D "ext_osc32k";
>=20
> Should the output name also contain dashes instead?
>=20
> > +	};
> > +
> > +	leds {
> > +		compatible =3D "gpio-leds";
> > +
> > +		led-0 {
> > +			function =3D LED_FUNCTION_POWER;
> > +			color =3D <LED_COLOR_ID_RED>;
> > +			gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
> > +			default-state =3D "on";
>=20
> Maybe something for a follow up patch, but I noticed that the schematic
> does not show current limiting resistors for the LEDs. This probably works
> because the default drive strength is 0b01, so level 1 (in a range from 0
> to 3, which we map to 10, 20, 30, 40 mA). The exact LED is not mentioned,
> but I would imagine that more than 20 mA would not be healthy, and even
> this might be a stretch over longer times.
>=20
> So should we force the drive-strength to <10> or <20> somewhere? How does
> this even work for those gpios references?

Interestingly, this was already done for "allwinner,auxtek-t003" board and
others with strength 20. I doubt that's 20 mA, since that would certainly
kill LED.

>=20
> > +		};
> > +
> > +		led-1 {
> > +			function =3D LED_FUNCTION_STATUS;
> > +			color =3D <LED_COLOR_ID_GREEN>;
> > +			gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
> > +		};
> > +	};
> > +
> > +	reg_gmac_3v3: gmac-3v3 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "gmac-3v3";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		startup-delay-us =3D <150000>;
> > +		enable-active-high;
> > +		gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
>=20
> Can you please add a "vin-supply =3D <&reg_vcc5v>;" line here, to chain t=
hem
> up nicely?

Ok.

>=20
> > +	};
> > +
> > +	reg_vcc5v: vcc5v {
> > +		/* board wide 5V supply directly from the DC jack */
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vcc-5v";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	reg_wifi_3v3: wifi-3v3 {
> > +		/* 3.3V regulator for WiFi and BT */
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "wifi-3v3";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		enable-active-high;
> > +		gpio =3D <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
>=20
> Same vin-supply here, please, this discrete regulator is fed by DCIN 5V.
>=20
> > +	};
> > +
> > +	wifi_pwrseq: wifi-pwrseq {
> > +		compatible =3D "mmc-pwrseq-simple";
> > +		clocks =3D <&rtc 1>;
>=20
> As mentioned yesterday, please use CLK_OSC32K_FANOUT.

good catch.

>=20
> > +		clock-names =3D "ext_clock";
> > +		reset-gpios =3D <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
> > +		post-power-on-delay-ms =3D <200>;
> > +	};
> > +};
> > +
> > +&cpu0 {
> > +	cpu-supply =3D <&reg_dcdca>;
> > +};
> > +
> > +&de {
> > +	status =3D "okay";
> > +};
> > +
> > +&dwc3 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ehci0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ehci3 {
> > +	status =3D "okay";
> > +};
> > +
> > +&emac {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > +	phy-mode =3D "rgmii-rxid";
>=20
> So relating to what Andrew said earlier today, should this read rgmii-id
> instead? Since the strap resistors just set some boot-up value, but we
> want the PHY driver to enable both RX and TX delay programmatically?

As explained in other email, no. This setting reflects strap resistors
and that extra delay is needed. PHY driver sets this delay based on
this mode.

>=20
> > +	phy-handle =3D <&ext_rgmii_phy>;
> > +	phy-supply =3D <&reg_gmac_3v3>;
> > +	allwinner,rx-delay-ps =3D <0>;
> > +	allwinner,tx-delay-ps =3D <700>;
> > +	status =3D "okay";
> > +};
> > +
> > +&gpu {
> > +	mali-supply =3D <&reg_dcdcc>;
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi {
> > +	hvcc-supply =3D <&reg_bldo2>;
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi_out {
> > +	hdmi_out_con: endpoint {
> > +		remote-endpoint =3D <&hdmi_con_in>;
> > +	};
> > +};
> > +
> > +&mdio {
> > +	ext_rgmii_phy: ethernet-phy@1 {
> > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > +		reg =3D <1>;
> > +
> > +		motorcomm,clk-out-frequency-hz =3D <125000000>;
> > +
> > +		reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> > +		reset-assert-us =3D <15000>;
> > +		reset-deassert-us =3D <100000>;
> > +	};
> > +};
> > +
> > +&mmc0 {
> > +	vmmc-supply =3D <&reg_cldo1>;
> > +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> > +	disable-wp;
> > +	bus-width =3D <4>;
> > +	status =3D "okay";
> > +};
> > +
> > +&mmc1 {
> > +	vmmc-supply =3D <&reg_wifi_3v3>;
> > +	vqmmc-supply =3D <&reg_bldo3>;
> > +	mmc-pwrseq =3D <&wifi_pwrseq>;
> > +	bus-width =3D <4>;
> > +	non-removable;
> > +	status =3D "okay";
> > +
> > +	aw859a: wifi@1 {
> > +		reg =3D <1>;
> > +	};
> > +};
> > +
> > +&mmc2 {
> > +	vmmc-supply =3D <&reg_cldo1>;
> > +	vqmmc-supply =3D <&reg_bldo2>;
> > +	cap-mmc-hw-reset;
> > +	non-removable;
> > +	bus-width =3D <8>;
> > +	status =3D "okay";
>=20
> Given that it's 1.8V on the I/O lines, I think we would need the
> mmc-ddr-1_8v and mmc-hs200-1_8v properties, for higher speed modes? Or
> does that not work?

It's untested so I wouldn't risk it now.

>=20
> > +};
> > +
> > +&ohci0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ohci3 {
> > +	status =3D "okay";
> > +};
> > +
> > +&pio {
> > +	vcc-pc-supply =3D <&reg_bldo2>;
> > +	vcc-pd-supply =3D <&reg_cldo1>;
> > +	vcc-pg-supply =3D <&reg_bldo3>;
> > +};
> > +
> > +&r_ir {
> > +	status =3D "okay";
> > +};
> > +
> > +&r_i2c {
> > +	status =3D "okay";
> > +
> > +	axp805: pmic@36 {
> > +		compatible =3D "x-powers,axp805", "x-powers,axp806";
> > +		reg =3D <0x36>;
> > +		interrupt-parent =3D <&r_intc>;
> > +		interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> > +		interrupt-controller;
> > +		#interrupt-cells =3D <1>;
> > +		x-powers,self-working-mode;
> > +		vina-supply =3D <&reg_vcc5v>;
> > +		vinb-supply =3D <&reg_vcc5v>;
> > +		vinc-supply =3D <&reg_vcc5v>;
> > +		vind-supply =3D <&reg_vcc5v>;
> > +		vine-supply =3D <&reg_vcc5v>;
> > +		aldoin-supply =3D <&reg_vcc5v>;
> > +		bldoin-supply =3D <&reg_vcc5v>;
> > +		cldoin-supply =3D <&reg_vcc5v>;
> > +
> > +		regulators {
> > +			reg_aldo1: aldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <3300000>;
> > +				regulator-max-microvolt =3D <3300000>;
> > +				regulator-name =3D "vcc-pl-led-ir";
> > +			};
> > +
> > +			reg_aldo2: aldo2 {
> > +				regulator-min-microvolt =3D <3300000>;
> > +				regulator-max-microvolt =3D <3300000>;
> > +				regulator-name =3D "vcc33-audio-tv-ephy-mac";
> > +			};
> > +
> > +			/* ALDO3 is shorted to CLDO1 */
> > +			reg_aldo3: aldo3 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <3300000>;
> > +				regulator-max-microvolt =3D <3300000>;cl
> > +				regulator-name =3D "vcc33-io-pd-emmc-sd-usb-uart-1";
> > +			};
> > +
> > +			reg_bldo1: bldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <1800000>;
> > +				regulator-max-microvolt =3D <1800000>;
> > +				regulator-name =3D "vcc18-dram-bias-pll";
> > +			};
> > +
> > +			reg_bldo2: bldo2 {
> > +				regulator-min-microvolt =3D <1800000>;
> > +				regulator-max-microvolt =3D <1800000>;
> > +				regulator-name =3D "vcc-efuse-pcie-hdmi-pc";
> > +			};
> > +
> > +			reg_bldo3: bldo3 {
> > +				regulator-min-microvolt =3D <1800000>;
> > +				regulator-max-microvolt =3D <1800000>;
> > +				regulator-name =3D "vcc-pm-pg-dcxoio-wifi";
>=20
> As you mention in the name, this rail is connected to VCC_DCXO, which IIUC
> is an essential supply, for the crystal oscillator circuit. So I think th=
is
> needs to be always on?

It most likely is enabled from boot and since it powers pin banks, it's
always enabled. I'll add it anyway, just to make it more explicit.

>=20
> > +			};
> > +
> > +			bldo4 {
> > +				/* unused */
> > +			};
> > +
> > +			reg_cldo1: cldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <3300000>;
> > +				regulator-max-microvolt =3D <3300000>;
> > +				regulator-name =3D "vcc33-io-pd-emmc-sd-usb-uart-2";
> > +			};
> > +
> > +			cldo2 {
> > +				/* unused */
> > +			};
> > +
> > +			cldo3 {
> > +				/* unused */
> > +			};
> > +
> > +			reg_dcdca: dcdca {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <800000>;
> > +				regulator-max-microvolt =3D <1160000>;
> > +				regulator-ramp-delay =3D <2500>;
> > +				regulator-name =3D "vdd-cpu";
> > +			};
>=20
> Can you maybe add a comment here to say that DCDCB is polyphased to DCDCA?

sure.

>=20
> I went through the whole rest and compared against the schematic
> (looking at GPIOs and power rails), and that looks OK from what I can see.

Thanks for checking!

Best regards,
Jernej

>=20
> Thanks,
> Andre
>=20
>=20
> > +
> > +			reg_dcdcc: dcdcc {
> > +				regulator-enable-ramp-delay =3D <32000>;
> > +				regulator-min-microvolt =3D <810000>;
> > +				regulator-max-microvolt =3D <1080000>;
> > +				regulator-ramp-delay =3D <2500>;
> > +				regulator-name =3D "vdd-gpu";
> > +			};
> > +
> > +			reg_dcdcd: dcdcd {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <960000>;
> > +				regulator-max-microvolt =3D <960000>;
> > +				regulator-name =3D "vdd-sys";
> > +			};
> > +
> > +			reg_dcdce: dcdce {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <1200000>;
> > +				regulator-max-microvolt =3D <1200000>;
> > +				regulator-name =3D "vcc-dram";
> > +			};
> > +
> > +			sw {
> > +				/* unused */
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&rtc {
> > +	clocks =3D <&ext_osc32k>;
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart0_ph_pins>;
> > +	status =3D "okay";
> > +};
> > +
> > +&usb2otg {
> > +	dr_mode =3D "host";
> > +	status =3D "okay";
> > +};
> > +
> > +&usb2phy {
> > +	usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15 */
> > +	usb0_vbus-supply =3D <&reg_vcc5v>;
> > +	usb3_vbus-supply =3D <&reg_vcc5v>;
> > +	status =3D "okay";
> > +};
> > +
> > +&usb3phy {
> > +	status =3D "okay";
> > +};
>=20
>=20





