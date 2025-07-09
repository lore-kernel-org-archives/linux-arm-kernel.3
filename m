Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A622AC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yATPmOJ9OWkUtgidVpJWhXW/bSTBOOmlD2hct+WSePs=; b=AeQYeduAz19za7DmWaUSyvbL4n
	YHK1qwp0LKPzWK+c2NrUgxYWvQEiSds8++NI9aR3ayf5jbRXhKhLvxdpqksvPPxXGWjdazrC+LczY
	2ik3dGZvK7PSdG+l9kN43UQKScquEgmBZp+WCdyi+NlazPnHGG9jXVy19EZMRXGfllpasyxvgrPb3
	c/s4he8kYYDAXtD8qAmOpqpunqjdx4Wa1f4+Tz9XdzClw6FUi2oLU9WTkYFUNUdoYBTwtxFO56glB
	SeTQuY24Jcl4ZmOCTvPX7zH6V+0tRk78WQRm5Pza9zC2U+QIypJ5zhQaNMLc6id2gv8oAfNXOIREz
	Ecf75J7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRhm-00000008FHL-2Ok8;
	Wed, 09 Jul 2025 10:07:10 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPlP-00000007shG-1Ysd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:02:48 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-712be7e034cso46377577b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 01:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752048166; x=1752652966; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yATPmOJ9OWkUtgidVpJWhXW/bSTBOOmlD2hct+WSePs=;
        b=dGwwTelV5i/YxZ7neOqT+8l9u69iiumC4ei8e+V1InDjFuPIPBI0gFDSMiRw1/jm/6
         Ux4Nu1tRsfgg+ub1JTsxpjmLSfddNywmrRrO3iSi0dYFHVT1Tja6khbacMTV6smddgak
         mYlVk+GdfSEqaimN6xbyn+vh/BV8QjMuUGVGsEbXdbulwKJioUiP7KtEHDPbBfC8qeim
         VlAZMy+xqorVlbvZZ6KooQdvSnZCEsGCV8LdLBAqrYFLiA7duxLV9Vzy/oIAPwAq4MBt
         W9q8NTKHaO3dT4CGoFoIPZXO7PJs0XbiTQcWje6axUYPNZoxld+PICwTYtvvIcuf1hVZ
         z0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752048166; x=1752652966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yATPmOJ9OWkUtgidVpJWhXW/bSTBOOmlD2hct+WSePs=;
        b=BYxaTnq3H9qTyJFV95sBOK2Eh5L978rlbqVH5qDd95ReK0Y7l5Ku4rzZSqI/I7ss0X
         +idP65bkJxBPqrHxitUgtrO8F1zqXNRTEYZ7YHe3lFTQ1wiJphJWuwG9SkeDaSzao+k7
         47sQgZWJRlqJqBLbJnIdVQpAIeWsgHfa+2zhQ0y+7MXaloeJpoLK14KhS8kIkBLfL+U9
         x+8szL41y4SrgSu+mqYZWXhVoLr5yBFlP1S2rtBc9w2r0Z3gSpvMa7YWuJEOFgG4I5+A
         KJDJpHxQvOo8EuxSGsCFIA9f9ry6d8ZJqyO1zTVdcIlmGqusZfokQ59xo3/HJYWmFrDG
         GhVA==
X-Forwarded-Encrypted: i=1; AJvYcCWn/T60dCjbinJAvEH3AVU7Pmx7ws0GThWm+Js+LuQz7bhFLy3gEFSu7SUKCW1mSH8MxRryU5bAfFmZBM7rx8ec@lists.infradead.org
X-Gm-Message-State: AOJu0YwGggyQ47UuRA9CWsnQK5KW4DTmJBZnQsxn4XbV447YomHXQYlR
	E8LhbsJd8WRySwey1Mvyyrn5tpybZTYhwCnAjhpVhlS5K10mizxrSd4jic1hn11FQf7lOUF0gZr
	V32+EE8kgwkXtPWuzFNPD2tHH8x/vync=
X-Gm-Gg: ASbGncsPHjam3XjXfuWtjMvYStSfFkqQ5Q1g4qR3KfcmfxClB6P2Z7J6PI4E8eR+hLJ
	WinLu1qz2RqmvgAc0oT+cRGOGRS0dYa6PcU/S9E4/9TudoiAOxgrIlqPxapu2vEBxxcAQKb5H0s
	62N/1033wRmDV2IFTX+psGqsb3rJV51xxIMR2U00PgEuoNfqRJbpor
X-Google-Smtp-Source: AGHT+IFGpt6J0H8CQUxjwUxnTBiD6rrHmvp65uaeZMHRsJnS4HxRTMA6MZltFxevyxDt5SjC3aYf6BLRImSwy75tylw=
X-Received: by 2002:a05:690c:dc8:b0:70e:29af:844a with SMTP id
 00721157ae682-717b19647bdmr22238557b3.18.1752048166224; Wed, 09 Jul 2025
 01:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250708184841.72933-1-stefano.radaelli21@gmail.com>
 <20250708184841.72933-3-stefano.radaelli21@gmail.com> <3ab061ca-1d2e-468f-a1c8-ac0ad0433103@ti.com>
In-Reply-To: <3ab061ca-1d2e-468f-a1c8-ac0ad0433103@ti.com>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 9 Jul 2025 10:02:30 +0200
X-Gm-Features: Ac12FXzoqijcYZPvK1vcDVnyFQdExXLKeRuIBSKjGuodjwZO7s0cTmbkEfYlPKc
Message-ID: <CAK+owojKH8H30r=xm6BDM-i0mf4e+CnTERpu2YrOD7gZyY6n0w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_010247_534992_FDBDA01C 
X-CRM114-Status: GOOD (  26.22  )
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

Hello Vignesh,

thank you for your corrections, I completely forgot to compile with
the W=1 flag.

I'll take care of everything,

Best Regards,

Stefano

Il giorno mer 9 lug 2025 alle ore 06:14 Vignesh Raghavendra
<vigneshr@ti.com> ha scritto:
>
>
>
> On 09/07/25 00:18, Stefano Radaelli wrote:
> > Add device tree support for the Variscite VAR-SOM-AM62P system on module.
> > This SOM is designed to be used with various carrier boards.
> >
> > The module includes:
> > - AM62Px Sitara MPU processor
> > - Up to 8GB of DDR4-3733 memory
> > - eMMC storage memory
> > - PS6522430 chip as a Power Management Integrated circuit (PMIC)
> > - Integrated 10/100/1000 Mbps Ethernet Transceiver Analog Devices ADIN1300
> > - Resistive touch panel interface controller TI TSC2046
> > - I2C interfaces
> >
> > Only SOM-specific peripherals are enabled by default. Carrier board
> > specific interfaces are left disabled to be enabled in the respective
> > carrier board device trees.
> >
> > Link: https://www.variscite.it/product/system-on-module-som/cortex-a53-krait/var-som-am62p-ti-sitara-am62px/
> >
> > Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 379 ++++++++++++++++++
> >  1 file changed, 379 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> > new file mode 100644
> > index 000000000000..1d4ebc484d55
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> > @@ -0,0 +1,379 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Common dtsi for Variscite VAR-SOM-AM62P
> > + *
> > + * Copyright (C) 2021-2022 Texas Instruments Incorporated - https://www.ti.com/
> > + * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include "k3-am62p5.dtsi"
> > +
> > +/ {
> > +     compatible = "variscite,am62p-var-som", "ti,am62p5";
> > +
> > +     iw612_pwrseq: iw612_pwrseq {
>
> No underscore in node names please
>
> > +             compatible = "mmc-pwrseq-simple";
> > +             post-power-on-delay-ms = <100>;
> > +             power-off-delay-us = <10000>;
> > +             reset-gpios = <&main_gpio0 54 GPIO_ACTIVE_LOW>, /* WIFI_PWR_EN */
> > +                           <&main_gpio0 59 GPIO_ACTIVE_LOW>; /* WIFI_EN */
> > +             status = "okay";
> > +     };
> > +
> > +     emmc_pwrseq: pwrseq@0 {
>
> There isnt a reg property to have a unit addresss
>
> > +             compatible = "mmc-pwrseq-emmc";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&emmc_pwrseq_pins>;
> > +             reset-gpios = <&main_gpio0 49 GPIO_ACTIVE_LOW>;
> > +     };
> > +
> > +     memory@80000000 {
> > +             /* 8G RAM */
> > +             reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
> > +                   <0x00000008 0x80000000 0x00000001 0x80000000>;
> > +             device_type = "memory";
> > +             bootph-pre-ram;
> > +     };
> > +
> > +     opp-table {
> > +             /* Add 1.4GHz OPP for am62p5-sk board. Requires VDD_CORE at 0v85 */
> > +             opp-1400000000 {
> > +                     opp-hz = /bits/ 64 <1400000000>;
> > +                     opp-supported-hw = <0x01 0x0004>;
> > +                     clock-latency-ns = <6000000>;
> > +             };
> > +     };
> > +
> > +     reserved_memory: reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +
> > +             rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x00 0x9b500000 0x00 0x00300000>;
> > +                     no-map;
> > +             };
> > +
> > +             mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x00 0x9b800000 0x00 0x00100000>;
> > +                     no-map;
> > +             };
> > +
> > +             mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x00 0x9b900000 0x00 0x00f00000>;
> > +                     no-map;
> > +             };
> > +
> > +             wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x00 0x9c800000 0x00 0x00100000>;
> > +                     no-map;
> > +             };
> > +
> > +             wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x00 0x9c900000 0x00 0x01e00000>;
> > +                     no-map;
> > +             };
> > +
> > +             secure_tfa_ddr: tfa@9e780000 {
> > +                     reg = <0x00 0x9e780000 0x00 0x80000>;
> > +                     no-map;
> > +             };
> > +
> > +             secure_ddr: optee@9e800000 {
> > +                     reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
> > +                     no-map;
> > +             };
> > +     };
> > +
> > +     vcc_3v3: vcc-3v3 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc_3v3";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +     };
> > +
> > +     vcc_1v8: vcc-1v8 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc_1v8";
> > +             regulator-min-microvolt = <1800000>;
> > +             regulator-max-microvolt = <1800000>;
> > +             vin-supply = <&vcc_3v3>;
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +     };
> > +
> > +     vdd_phy_3v3: regulator-8 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vdd_phy_3v3";
> > +             gpios = <&main_gpio0 45 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-always-on;
> > +             status="okay";
> > +     };
> > +};
> > +
> > +&cpsw3g {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&main_rgmii1_pins_default>;
> > +};
> > +
> > +&cpsw3g_mdio {
> > +     status = "okay";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&main_mdio1_pins_default>;
> > +     cpsw3g_phy0: ethernet-phy@4 {
> > +             reg = <4>;
> > +             compatible = "ethernet-phy-id0283.bc30";
> > +             reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
> > +             reset-assert-us = <10000>;
> > +             reset-deassert-us = <100000>;
> > +     };
> > +};
> > +
> > +&cpsw_port1 {
> > +     /*
> > +      * The required RGMII TX and RX 2ns delays are implemented directly
> > +      * in hardware via passive delay elements on the SOM PCB.
> > +      * No delay configuration is needed in software via PHY driver.
> > +      */
> > +     phy-mode = "rgmii";
> > +     phy-handle = <&cpsw3g_phy0>;
> > +     status = "okay";
> > +};
> > +
> > +&main_i2c2 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&main_i2c2_pins_default>;
> > +     clock-frequency = <400000>;
> > +     status = "okay";
> > +};
> > +
> > +&main_i2c3 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&main_i2c3_pins_default>;
> > +     clock-frequency = <400000>;
> > +     status = "okay";
> > +};
> > +
> > +&main_pmx0 {
> > +     emmc_pwrseq_pins: pinmux_emmc_pwrseq_pins {
>
> Same here
>
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x00c8, PIN_OUTPUT, 7) /* (AB23) VOUT0_DATA4.GPIO0_49 */
> > +             >;
> > +     };
> > +
> > +     main_i2c2_pins_default: main-i2c2-default-pins {
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (T22) GPMC0_CSn2.I2C2_SCL */
> > +                     AM62PX_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (U25) GPMC0_CSn3.I2C2_SDA */
> > +             >;
> > +     };
> > +
> > +     main_i2c3_pins_default: main-i2c3-pins-default {
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x01d0, PIN_INPUT_PULLUP, 2) /* (A23) UART0_CTSn.I2C3_SCL */
> > +                     AM62PX_IOPAD(0x01d4, PIN_INPUT_PULLUP, 2) /* (C22) UART0_RTSn.I2C3_SDA */
> > +             >;
> > +     };
> > +
> > +     main_mcasp1_pins_default: main-mcasp1-pins-default {
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x0090, PIN_INPUT, 2) /* (U24) GPMC0_BE0n_CLE.MCASP1_ACLKX */
> > +                     AM62PX_IOPAD(0x0098, PIN_INPUT, 2) /* (AA24) GPMC0_WAIT0.MCASP1_AFSX */
> > +                     AM62PX_IOPAD(0x008c, PIN_OUTPUT, 2) /* (T25) GPMC0_WEn.MCASP1_AXR0 */
> > +                     AM62PX_IOPAD(0x0084, PIN_INPUT, 2) /* (R25) GPMC0_ADVn_ALE.MCASP1_AXR2 */
> > +                     AM62PX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (P24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
> > +             >;
> > +     };
> > +
> > +     main_mdio1_pins_default: main-mdio1-pins-default {
>
> This fails make dtbs_check (node name needs to end in -pins)
>
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x0160, PIN_OUTPUT, 0) /* (F17) MDIO0_MDC */
> > +                     AM62PX_IOPAD(0x015c, PIN_INPUT, 0) /* (F16) MDIO0_MDIO */
> > +             >;
> > +     };
> > +
> > +     main_mmc2_pins_default: main-mmc2-pins-default {
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x0120, PIN_INPUT_PULLUP, 0) /* (K24) MMC2_CMD */
> > +                     AM62PX_IOPAD(0x0118, PIN_INPUT_PULLDOWN, 0) /* (K21) MMC2_CLK */
> > +                     AM62PX_IOPAD(0x011C, PIN_INPUT_PULLUP, 0) /* () MMC2_CLKLB */
> > +                     AM62PX_IOPAD(0x0114, PIN_INPUT_PULLUP, 0) /* (K23) MMC2_DAT0 */
> > +                     AM62PX_IOPAD(0x0110, PIN_INPUT_PULLUP, 0) /* (K22) MMC2_DAT1 */
> > +                     AM62PX_IOPAD(0x010c, PIN_INPUT_PULLUP, 0) /* (L20) MMC2_DAT2 */
> > +                     AM62PX_IOPAD(0x0108, PIN_INPUT_PULLUP, 0) /* (L21) MMC2_DAT3 */
> > +             >;
> > +     };
> > +
> > +     main_rgmii1_pins_default: main-rgmii1-default-pins {
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x014c, PIN_INPUT, 0) /* (B15) RGMII1_RD0 */
> > +                     AM62PX_IOPAD(0x0150, PIN_INPUT, 0) /* (B16) RGMII1_RD1 */
> > +                     AM62PX_IOPAD(0x0154, PIN_INPUT, 0) /* (A14) RGMII1_RD2 */
> > +                     AM62PX_IOPAD(0x0158, PIN_INPUT, 0) /* (B14) RGMII1_RD3 */
> > +                     AM62PX_IOPAD(0x0148, PIN_INPUT, 0) /* (A16) RGMII1_RXC */
> > +                     AM62PX_IOPAD(0x0144, PIN_INPUT, 0) /* (A15) RGMII1_RX_CTL */
> > +                     AM62PX_IOPAD(0x0134, PIN_INPUT, 0) /* (A18) RGMII1_TD0 */
> > +                     AM62PX_IOPAD(0x0138, PIN_INPUT, 0) /* (C17) RGMII1_TD1 */
> > +                     AM62PX_IOPAD(0x013c, PIN_INPUT, 0) /* (A17) RGMII1_TD2 */
> > +                     AM62PX_IOPAD(0x0140, PIN_INPUT, 0) /* (C16) RGMII1_TD3 */
> > +                     AM62PX_IOPAD(0x0130, PIN_INPUT, 0) /* (B17) RGMII1_TXC */
> > +                     AM62PX_IOPAD(0x012c, PIN_INPUT, 0) /* (B18) RGMII1_TX_CTL */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     main_spi0_pins_default: main_spi0-pins-default {
>
> Same here
>
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x01bc, PIN_OUTPUT, 0) /* (B21) SPI0_CLK */
> > +                     AM62PX_IOPAD(0x01b4, PIN_OUTPUT, 0) /* (D20) SPI0_CS0 */
> > +                     AM62PX_IOPAD(0x01c0, PIN_OUTPUT, 0) /* (B20) SPI0_D0 */
> > +                     AM62PX_IOPAD(0x01c4, PIN_INPUT, 0) /* (C21) SPI0_D1 */
> > +             >;
> > +     };
> > +
> > +     main_uart5_pins_default: uart5-pins-default {
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x00ec, PIN_INPUT, 4) /* (AC21) VOUT0_DATA13.UART5_CTSn */
> > +                     AM62PX_IOPAD(0x00e8, PIN_OUTPUT, 4) /* (AD21) VOUT0_DATA12.UART5_RTSn */
> > +                     AM62PX_IOPAD(0x00d0, PIN_INPUT, 4) /* (AC23) VOUT0_DATA6.UART5_RXD */
> > +                     AM62PX_IOPAD(0x00d4, PIN_OUTPUT, 4) /* (AE23) VOUT0_DATA7.UART5_TXD */
> > +             >;
> > +     };
> > +
> > +     pinctrl_bt: btgrp {
>
> More such issues
>
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x00f4, PIN_OUTPUT, 7) /* (Y20) VOUT0_DATA15.GPIO0_60 (BT_EN) */
> > +             >;
> > +     };
> > +
> > +     pinctrl_restouch: restouchgrp {
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x00c4, PIN_INPUT_PULLUP, 7) /* (Y23) VOUT0_DATA3.GPIO0_48 */
> > +             >;
> > +     };
> > +
> > +     pinctrl_wifi: pinctrl-wifi-default {
> > +             pinctrl-single,pins = <
> > +                     AM62PX_IOPAD(0x00dc, PIN_OUTPUT, 7) /* (AC22) VOUT0_DATA9.GPIO0_54 - WIFI_PWR_EN - */
> > +                     AM62PX_IOPAD(0x00f0, PIN_OUTPUT, 7) /* (AA20) VOUT0_DATA14.GPIO0_59 - WIFI_EN - */
> > +             >;
> > +     };
> > +};
> > +
> > +&main_spi0 {
> > +     status = "okay";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&main_spi0_pins_default>;
> > +     ti,pindir-d0-out-d1-in = <1>;
> > +
> > +     /* Resistive touch controller */
> > +     ads7846@0 {
> > +             compatible = "ti,ads7846";
> > +             reg = <0>;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_restouch>;
> > +             interrupt-parent = <&main_gpio0>;
> > +             interrupts = <48 IRQ_TYPE_EDGE_FALLING>;
> > +             spi-max-frequency = <1500000>;
> > +             pendown-gpio = <&main_gpio0 48 GPIO_ACTIVE_LOW>;
> > +             ti,x-min = /bits/ 16 <125>;
> > +             ti,x-max = /bits/ 16 <4008>;
> > +             ti,y-min = /bits/ 16 <282>;
> > +             ti,y-max = /bits/ 16 <3864>;
> > +             ti,x-plate-ohms = /bits/ 16 <180>;
> > +             ti,pressure-max = /bits/ 16 <255>;
> > +             ti,debounce-max = /bits/ 16 <10>;
> > +             ti,debounce-tol = /bits/ 16 <3>;
> > +             ti,debounce-rep = /bits/ 16 <1>;
> > +             ti,settle-delay-usec = /bits/ 16 <150>;
> > +             ti,keep-vref-on;
> > +             wakeup-source;
> > +             status = "okay";
> > +     };
> > +};
> > +
> > +&main_uart5 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&main_uart5_pins_default>, <&pinctrl_bt>;
> > +     uart-has-rtscts;
> > +     status = "okay";
> > +
> > +     bluetooth_iw61x: bluetooth_iw61x {
>
> Please run
> make dtbs W=1
> make CHECK_DTBS=y
>
> and fix all the issues
>
> > +             compatible = "nxp,88w8987-bt";
> > +             status = "okay";
> > +     };
> > +};
> > +
> > +&mcasp1 {
> > +     status = "okay";
> > +     #sound-dai-cells = <0>;
> > +
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&main_mcasp1_pins_default>;
> > +
> > +     op-mode = <0>;          /* MCASP_IIS_MODE */
> > +     tdm-slots = <2>;
> > +
> > +     serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
> > +            1 0 2 0
> > +            0 0 0 0
> > +            0 0 0 0
> > +            0 0 0 0
> > +     >;
> > +     tx-num-evt = <0>;
> > +     rx-num-evt = <0>;
> > +};
> > +
> > +&mcu_pmx0 {
> > +     wkup_clkout0_pins_default: wkup_clkout0_pins_default {
> > +             pinctrl-single,pins = <
> > +                     AM62PX_MCU_IOPAD(0x0084, PIN_OUTPUT, 0) /* (F13) WKUP_CLKOUT0 */
> > +             >;
> > +     };
> > +};
> > +
> > +/* eMMC */
> > +&sdhci0 {
> > +     status = "okay";
> > +     ti,driver-strength-ohm = <50>;
> > +     mmc-pwrseq = <&emmc_pwrseq>;
> > +     disable-wp;
> > +     bootph-all;
> > +};
> > +
> > +/* WIFI */
> > +&sdhci2 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&main_mmc2_pins_default>, <&pinctrl_wifi>;
> > +     bus-width = <4>;
> > +     disable-wp;
> > +     non-removable;
> > +     keep-power-in-suspend;
> > +     mmc-pwrseq = <&iw612_pwrseq>;
> > +     ti,fails-without-test-cd;
> > +     status = "okay";
> > +};
> > +
> > +&usbss0 {
> > +     ti,vbus-divider;
> > +};
> > +
> > +&usbss1 {
> > +     ti,vbus-divider;
> > +};
>
> --
> Regards
> Vignesh
> https://ti.com/opensource
>

