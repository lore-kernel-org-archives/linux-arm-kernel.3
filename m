Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A057BC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cET3jObhGhC9pd3hp1ldy8l2+nMGUvt7YDcBuTcsUA0=; b=kWTVHPYDnh8wRT
	cBxN54WDx2llAMSKEp8eyBYmNX+GRq2qd4Y0OC+DK2V8U0iJSxfoKOTM3lLReBKGHKjQdcNsYMZyo
	v16VZ1so4s6K1bUT7E2QAcDlKD08zltWOHwLL2e44f/+j7T+jleAUD01M43VBJK1fxKgiwSNpVJVT
	v394fLVhJPBIAhx7Q182VNCseLbuvu229h+ndsDqna9AOKiy1YsbU+zCEZBVQU+Wf0R6IEB+vRMzj
	lnjV6RvhscaT6Lo+/F/zCkc/uWEuJOcqJZqR14745jpCVrOZNWg4sQq+3ZqYPnGM7WruZat3U2ux+
	CwkQqbYWam+VNAc9UWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAwa-00000005w4T-10Hn;
	Tue, 08 Jul 2025 16:13:20 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAMK-00000005paD-2KIQ;
	Tue, 08 Jul 2025 15:35:53 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso4819751e87.2;
        Tue, 08 Jul 2025 08:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751988949; x=1752593749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cET3jObhGhC9pd3hp1ldy8l2+nMGUvt7YDcBuTcsUA0=;
        b=SVkuBOkUkBvTvZdZU4KPDQg2dyYdOCU964Fkjt8Jl0R62T+DktMPfDZtC8qOZoTMMi
         rD1yMK+ZJE/llcFwqzAOnnXtyxIRF+tWHiyxDMcoQ+bZEgeZLh8GuIPglI9QaLiH2N9a
         VnKw91KfWl6wOIyxcgGMu9Kyv+vzCY9wi53bxAfynvj0YRygEIvTTTXqsMUnC4T7/ofg
         epTjvmxuW2QHZhgDDCrAI3l7TcGT4h58tgG70nf5rKRKJsagy1WsZ80D+cJFoNHJWc7r
         8yq0VABvOAJNm6zrzyuPFW5p5bU/LYbSs9r2VzhaakyxTctAnJcy1ejusFfhBTCXTz+9
         Gw3g==
X-Forwarded-Encrypted: i=1; AJvYcCVmec56VOTjutN8s/edZKTzQV19mjZFzQlp+iWNvOhRLgAUa5Xfeb0V8SCfivwnc3zG7DDvo4mU2/ENpeuIhr1l@lists.infradead.org, AJvYcCVoXpNu7upG4E/OMP/GwE+bGvdLuNDfqbJroAu7kRxkxTRkiGDUm6E3RsXZSHAPnQ1vH9LLvn/a1cXEFNQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6sYqUD3QjUywk+Bypw/ZGTEKRQfNXHJn/Rp0Ic8ckoavZCnoV
	hEFedWN63y/iym9yj/mGKXNZgWEb/oPexPsLWYzbiVywhQ53T33s4SxQi8H/+Z6EW6A=
X-Gm-Gg: ASbGncstUrdkbd4C70vk5XlZ/3+HXBwqSfgyVxHNULFkk1IBoWM362kgmQjSAUzi4EH
	2z5ya/okbVMTLQL/LXlqyZYvVaJg1TL+KRrJdLGzgSZ7HNjN/4UKSrDMtVQkq8OYuSF90wXmWlD
	inRzOTbz3JO/Ck96kZCH35GmKrDhKesJoS6MmcPuTPXteOmCC/WMDZEwTWmpFXRiIGv2fHZAtnW
	oRPUjwGkuTfTs28SF0Gem1PZv1L8hfU48Wi6EtuYWGDNb812NsHEPO0oWBNt0t6ZxXxbC0Piayc
	JKboNoNxp5Mi076CYF2WCjD/uqmVL0CZ/ZX+f6HrV4SKVG4eCZSaL04Vf+JUZLNm7elT1dXEoil
	qevJLIPwGbkbX4frliNs=
X-Google-Smtp-Source: AGHT+IGxE3zRVbPqY8INek5khiab4ZRu7R/qLqwNhfQB+DSnH1x467/pjXCJwwWdsk/DybYvTTbxnA==
X-Received: by 2002:a05:6512:a92:b0:553:2f8c:e615 with SMTP id 2adb3069b0e04-557f82ffd74mr1212896e87.11.1751988949122;
        Tue, 08 Jul 2025 08:35:49 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1844eesm14756771fa.114.2025.07.08.08.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 08:35:47 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b43846e8cso36874251fa.0;
        Tue, 08 Jul 2025 08:35:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUs6kwzsYNDsBjhRsBvMYZkBLiPKlQmrRrqyyxkIl01rBQ0unhj1IqFoZg0Kvx0HaVKiEUGb6nG8EbfMJM=@lists.infradead.org, AJvYcCVpMcqCWlQOIcjdq8nfgC17BndLTmtsbU2sM/+CCkxQG8ENMAa97oRAyzL3nYcxkXbAoBZ2EQn0/Z4tVYmN8B79@lists.infradead.org
X-Received: by 2002:a2e:8e3c:0:b0:32f:1c0f:fb74 with SMTP id
 38308e7fff4ca-32f39b2409amr12043771fa.22.1751988946848; Tue, 08 Jul 2025
 08:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250707184420.275991-1-lukas.schmid@netcube.li>
 <20250707184420.275991-4-lukas.schmid@netcube.li> <20250708002205.70ec9097@minigeek.lan>
 <3700020.R56niFO833@lukas-hpz440workstation>
In-Reply-To: <3700020.R56niFO833@lukas-hpz440workstation>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 8 Jul 2025 23:35:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v66U+EOtoSGnidSj99eHRuJ5cNNvyiXZgrNHRTxA9tQ31w@mail.gmail.com>
X-Gm-Features: Ac12FXy2b3ug2Nx7hYcRFPu4coJNNKjGD_uoNgiL2GNaAFUP-Gc_JmvX8AQlazg
Message-ID: <CAGb2v66U+EOtoSGnidSj99eHRuJ5cNNvyiXZgrNHRTxA9tQ31w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_083552_598017_672D9433 
X-CRM114-Status: GOOD (  45.04  )
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

Hi,

On Tue, Jul 8, 2025 at 11:19=E2=80=AFPM Lukas Schmid <lukas.schmid@netcube.=
li> wrote:
>
> On Dienstag, 8. Juli 2025 01:22:05 CEST Andre Przywara wrote:
> > On Mon,  7 Jul 2025 20:44:15 +0200
> > Lukas Schmid <lukas.schmid@netcube.li> wrote:
> >
> Hi Andre,
>
> > Hi Lukas,
> >
> > please try to refrain from sending subsequent patches too quickly, that
> > might just put off and confuse reviewers. To acknowledge a change
> > request, it is probably sufficient to just reply to the mail with a
> > confirmation.
>
> Sorry about that. I'm still trying to get the hang of this whole "submitt=
ing
> patches" thing. What is a good time/reason to send the next revision/vers=
ion
> of a patchset?
>
> >
> > > NetCube Systems Nagami SoM is a module based around the Allwinner T11=
3s
> > > SoC. It includes the following features and interfaces:
> > >
> > > - 128MB DDR3 included in SoC
> > > - 10/100 Mbps Ethernet using LAN8720A phy
> > > - One USB-OTG interface
> > > - One USB-Host interface
> > > - One I2S interface with in and output support
> > > - Two CAN interfaces
> > > - ESP32 over SDIO
> > > - One SPI interface
> > > - I2C EEPROM for MAC address
> > > - One QWIIC I2C Interface with dedicated interrupt pin shared with EE=
PROM
> > > - One external I2C interface
> > > - SD interface for external SD-Card
> > >
> > > Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> > > ---
> > >
> > >  .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 233 ++++++++++++++++=
++
> > >  1 file changed, 233 insertions(+)
> > >  create mode 100644
> > >  arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi>
> > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.d=
tsi
> > > b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi new fil=
e
> > > mode 100644
> > > index 000000000..0db867b47
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
> > > @@ -0,0 +1,233 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "sun8i-t113s.dtsi"
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +/ {
> > > +   model =3D "NetCube Systems Nagami SoM";
> > > +   compatible =3D "netcube,nagami", "allwinner,sun8i-t113s";
> > > +
> > > +   aliases {
> > > +           serial1 =3D &uart1; // ESP32 Bootloader UART
> > > +           serial3 =3D &uart3; // Console UART on Card Edge
> > > +           ethernet0 =3D &emac;
> > > +   };
> > > +
> > > +   chosen {
> > > +           stdout-path =3D "serial3:115200n8";
> > > +   };
> > > +
> > > +   /* module wide 3.3V supply directly from the card edge */
> > > +   reg_vcc3v3: regulator-3v3 {
> > > +           compatible =3D "regulator-fixed";
> > > +           regulator-name =3D "vcc-3v3";
> > > +           regulator-min-microvolt =3D <3300000>;
> > > +           regulator-max-microvolt =3D <3300000>;
> > > +           regulator-always-on;
> > > +   };
> > > +
> > > +   /* SY8008 DC/DC regulator on the board, also supplying VDD-SYS */
> > > +   reg_vcc_core: regulator-core {
> > > +           compatible =3D "regulator-fixed";
> > > +           regulator-name =3D "vcc-core";
> > > +           regulator-min-microvolt =3D <880000>;
> > > +           regulator-max-microvolt =3D <880000>;
> > > +           vin-supply =3D <&reg_vcc3v3>;
> > > +   };
> > > +};
> > > +
> > > +&cpu0 {
> > > +   cpu-supply =3D <&reg_vcc_core>;
> > > +};
> > > +
> > > +&cpu1 {
> > > +   cpu-supply =3D <&reg_vcc_core>;
> > > +};
> > > +
> > > +&dcxo {
> > > +   clock-frequency =3D <24000000>;
> > > +};
> > > +
> > > +&emac {
> > > +   nvmem-cells =3D <&eth0_macaddress>;
> > > +   nvmem-cell-names =3D "mac-address";
> > > +   phy-handle =3D <&lan8720a>;
> > > +   phy-mode =3D "rmii";
> > > +   pinctrl-0 =3D <&rmii_pe_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +};
> > > +
> > > +/* Exposed as I2C on the card edge */
> > > +&i2c2 {
> > > +   pinctrl-0 =3D <&i2c2_pins>;
> > > +   pinctrl-names =3D "default";
> >
> > I wonder if this belongs here. In general we don't describe
> > pins/devices that are on generic connectors (like pin headers), because
> > the connection is determined by the user, not by the board.
> > In this case PD20 and PD21 could be used as generic GPIOs or as PWMs.
> > IIUC, even for the basic carrier those pins end up on headers, so even
> > there I wouldn't describe it. On the keypad carrier it's of course a
> > different story, since the MCP23008 is apparently soldered there.
>
> I get that part. However the module's description (as of yet unreleased)
> specifies those pins for this exact function as they are meant to be avai=
lable
> on our modules using the same connector but other CPU/SoC. The Module's s=
tate
> that this is the default option but other function's can be reconfigured =
or
> they can be used as IO.
>
> If it's an issue I can remove those here, but I would still add them into=
 the
> basic carrier as, even though they are only pin header, they are marked w=
ith
> the dedicated function of said pin. For example the headers there are
> specifically for "SPI", "I2S", "I2C" and the SD-Card slot.

For dedicated but otherwise unpopulated pins, we have in the past have
everything described as you already have, but with an explicit

    status =3D "disabled";

along with a comment stating that it is normally unpopulated and up to the
end user to enable if they intend to use it. You can see examples of this
in the dts files of the Pine64.

I wouldn't say it's a preference, but it's been done for some development
boards.


ChenYu

> >
> > > +};
> > > +
> > > +/* Exposed as the QWIIC connector and used by the internal EEPROM */
> > > +&i2c3 {
> > > +   pinctrl-0 =3D <&i2c3_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +
> > > +   eeprom0: eeprom@50 {
> > > +           compatible =3D "atmel,24c02";             /*
> actually it's a 24AA02E48 */
> > > +           reg =3D <0x50>;
> > > +           pagesize =3D <16>;
> > > +           read-only;
> > > +           vcc-supply =3D <&reg_vcc3v3>;
> > > +
> > > +           #address-cells =3D <1>;
> > > +           #size-cells =3D <1>;
> > > +
> > > +           eth0_macaddress: macaddress@fa {
> > > +                   reg =3D <0xfa 0x06>;
> > > +           };
> > > +   };
> > > +};
> > > +
> > > +/* Exposed as I2S on the card edge */
> > > +&i2s1 {
> > > +   pinctrl-0 =3D <&i2s1_pins>, <&i2s1_din_pins>, <&i2s1_dout_pins>;
> > > +   pinctrl-names =3D "default";
> >
> > Same story here, what prevents a user from using those edge pins as
> > GPIO or PWM?
> >
> > > +};
> > > +
> > > +/* Phy is on SoM. MDI signals pre-magentics are on the card edge */
> > > +&mdio {
> > > +   lan8720a: ethernet-phy@0 {
> > > +           compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +           reg =3D <0>;
> > > +   };
> > > +};
> > > +
> > > +/* Exposed as SD on the card edge */
> > > +&mmc0 {
> > > +   pinctrl-0 =3D <&mmc0_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   vmmc-supply =3D <&reg_vcc3v3>;
> > > +   broken-cd;
> > > +   disable-wp;
> > > +   bus-width =3D <4>;
> > > +};
> >
> > I think this node doesn't belong into the SoM .dtsi, as many details
> > are not set here, but on the carrier board: card detect, write protect,
> > Vmmc supply, and even bus width (could be 1 as well). So please move
> > this node to where the SD card connector sits. You might want to keep
> > the pinctrl nodes in here.
>
> Totally agree here, I will move this definition to the basic carrier, as =
it's
> currently the only one with the SD-Interface connected. However my questi=
on
> from above about the default function still applies here.
> >
> > > +
> > > +/* Connected to the on-board ESP32 */
> > > +&mmc1 {
> > > +   pinctrl-0 =3D <&mmc1_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   vmmc-supply =3D <&reg_vcc3v3>;
> > > +   bus-width =3D <4>;
> > > +   non-removable;
> > > +   status =3D "okay";
> > > +};
> > > +
> > > +/* Connected to the on-board eMMC */
> > > +&mmc2 {
> > > +   pinctrl-0 =3D <&mmc2_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   vmmc-supply =3D <&reg_vcc3v3>;
> > > +   vqmmc-supply =3D <&reg_vcc3v3>;
> > > +   bus-width =3D <4>;
> > > +   non-removable;
> > > +   status =3D "okay";
> > > +};
> > > +
> > > +&pio {
> > > +   vcc-pb-supply =3D <&reg_vcc3v3>;
> > > +   vcc-pc-supply =3D <&reg_vcc3v3>;
> > > +   vcc-pd-supply =3D <&reg_vcc3v3>;
> > > +   vcc-pe-supply =3D <&reg_vcc3v3>;
> > > +   vcc-pf-supply =3D <&reg_vcc3v3>;
> > > +   vcc-pg-supply =3D <&reg_vcc3v3>;
> > > +
> > > +   gpio-line-names =3D "", "", "", "", // PA
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "CAN0_TX",
> "CAN0_RX", // PB
> > > +                                     "CAN1_TX",
> "CAN1_RX", "UART3_TX", "UART3_RX",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "eMMC_CLK",
> "eMMC_CMD", // PC
> > > +                                     "eMMC_D2",
> "eMMC_D1", "eMMC_D0", "eMMC_D3",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "", //
> PD
> > > +                                     "", "", "", "",
> > > +                                     "", "", "SPI1_CS",
> "SPI1_CLK",
> > > +                                     "SPI1_MOSI",
> "SPI1_MISO", "SPI1_HOLD", "SPI1_WP",
> > > +                                     "PD16", "", "", "",
> > > +                                     "I2C2_SCL",
> "I2C2_SDA", "PD22", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "ETH_CRSDV",
> "ETH_RXD0", "ETH_RXD1", "ETH_TXCK", // PE
> > > +                                     "ETH_TXD0",
> "ETH_TXD1", "ETH_TXEN", "",
> > > +                                     "ETH_MDC",
> "ETH_MDIO", "QWIIC_nINT", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "SD_D1", "SD_D0",
> "SD_CLK", "SD_CLK", // PF
> > > +                                     "SD_D3", "SD_D2",
> "PF6", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "ESP_CLK",
> "ESP_CMD", "ESP_D0", "ESP_D1", // PG
> > > +                                     "ESP_D2", "ESP_D3",
> "UART1_TXD", "UART1_RXD",
> > > +                                     "ESP_nBOOT",
> "ESP_nRST", "I2C3_SCL", "I2C3_SDA",
> > > +                                     "I2S1_WS",
> "I2S1_CLK", "I2S1_DIN0", "I2S1_DOUT0",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "";
> > > +};
> > > +
> > > +/* Remove the unused CK pin from the pinctl as it is unconnected */
> > > +&rmii_pe_pins {
> > > +   pins =3D "PE0", "PE1", "PE2", "PE3", "PE4",
> > > +              "PE5", "PE6", "PE8", "PE9";
> > > +};
> > > +
> > > +/* Exposed as SPI on the card-edge */
> > > +&spi1 {
> > > +   #address-cells =3D <1>;
> > > +   #size-cells =3D <0>;
> > > +   pinctrl-0 =3D <&spi1_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   cs-gpios =3D <0>;
> > > +};
> >
> > I wonder if this belongs here as well, since it's again just generic
> > edge pins.
>
> Same here too
> >
> > Cheers,
> > Andre
> >
> > > +
> > > +/* Connected to the Bootloader/Console of the ESP32 */
> > > +&uart1 {
> > > +   pinctrl-0 =3D <&uart1_pg6_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +};
> > > +
> > > +/* Exposed as the Console/Debug UART on the card-edge */
> > > +&uart3 {
> > > +   pinctrl-0 =3D <&uart3_pb_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +};
>

