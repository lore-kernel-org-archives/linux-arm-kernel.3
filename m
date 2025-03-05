Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3559CC282E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+M/devNhKggk9xGA2aaAwxpdjt3DtZQOw5kUOA6e5g=; b=X7t0nWPHtfeRsTmL9nBR8X95D2
	nPw+Vab0n8+FVbzYMH64xhEO3fEwBKA3hw0W42kFNgqhVEHSNRRFbPmiAM+6LBBp0SgRkHuOpZkbc
	UB37VxDB2rup3CjQekp+Sau8mQGKyo8I5Z4KOhlJTiOJlybpbp7WkqE0bu1WbpsTDavxw+3S2UTVM
	uHxl8nobYb68xAprh9FaevWGhOhZI29cJXXBvXNnnSuwHeimwF7cvm5N+gb5gWpLeLTQaLahqwuj1
	8jzHLqTOOXuyRhXgtV5cwz36QdjX7HXwRUd5pmzShXGuFaaCi6E135RkixdNmzVT3aJ6NHUpdWNJO
	Z728gJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuy0-000000099wI-3q2T;
	Wed, 05 Mar 2025 20:03:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptlA-00000008xqa-1esB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:46:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3911748893aso1745392f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741200383; x=1741805183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+M/devNhKggk9xGA2aaAwxpdjt3DtZQOw5kUOA6e5g=;
        b=jf7sIz+ZQxUw6VvLA+a4hxfcG5kHzePXXspnGh51wU1E1nrI5JHIwsrTtn+tXjmPLZ
         6fVeasIpJlkQItgL4vqMa/jFTE4bW+jAAL0uHV1KCRB1xTjw16HAXRzaBSNsY9AAHqTC
         BLyvcG1VMaMdLytkpt1wKpmUZquQXdEDLVtryic1fNOxOJxy4T59Z0eLQrLtJy3yo/Yd
         UWghe2bx58H2EQceUOt1RSQcU6i3xLIwcUdO92PzySYz1W9MQXhlTRaMh9AmzQJ/5YKM
         BzeTLZMzUzgGtGCLUrmL8f/jFiLXqGiqiUnUEQYhO8fq2ulF+mBGHTkor1W4aHs/UQJj
         Wfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200383; x=1741805183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+M/devNhKggk9xGA2aaAwxpdjt3DtZQOw5kUOA6e5g=;
        b=BAfvP4sjpK7iCCYLPcQYgX7ZQxydFZx2lv+JtzIjQsDKnj24Do9kB8tFRwC1w113Kb
         TG5CYeioPSsNEQMouH5xs6brSe4o1LWyuemllye3i7CVTbiRbzGz5YJZrteC7AVPd3R/
         hADItOVOovo2iCDfW5rRhHR1VxpP54c8nCGmbs37kIblf1rbVKRuUvFojn+AL0EFhrsv
         bA7tEYai2x5gQVcq5Pn/2U7d5ywkc1HXBq47ZyjowxRfRmNCUkln5EdzTkwPz/f6WdUw
         HaRm0DGsGFMVSKCcpYJs0AfQ6cJTtl7KHZY9/4s6BVd/jRSh/ECmPpfySuuvU/5GxFPp
         lTVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGFLYpqCsnD17CoLs9r/eqvfJS3XPD/7y1za7sp/cYdM7OxdmPbZZTAJeQ1vgLupxX3n0zcPYT8yFxtIOuI5TC@lists.infradead.org
X-Gm-Message-State: AOJu0YwvLFu6LASBCsSYdLN7SCr7okWCvpD5Zg9bDrrzQA1IU0LOGcw+
	z+sYb3Pmptq1C5z+IEIDs3NHmcUmzoYgd5h7ym5FQkkX8s5jL2FJ
X-Gm-Gg: ASbGncumX0rN5qFUJA/s1S6OH3OieAtgr0485of9SAkhEhVdOmw/4BnA0SSI7Z5YEvB
	qOhZkdllpSafSFq04D3+PCh3Lls/jkppadOYXqCBzm0gZ5CAFVXGg5f7qiSFGaJBe1M+Uffj5Vz
	RCH8P0jEHtk4pLNa2bZHXKpyU4B4Pyf/HrTtVSlHYClOgjUfMm4Zab8Pn5PqkI2WzTpQ+py0dsh
	lQM0aifub9xei/JyqZfQjq4H5AQMJsMmgE32ppi3jxe+vTLkMCsao0y1aPyMaGNMLrg7JMobOhr
	3Hed3zI4+P9ENqUDuFJqP4is4rzYRr/qFz234y8Tn6kkstKb9FTazVBNFqBFfi0k3EwSYWzlghf
	uFoJyhSFv5IBPYp+yWBGd
X-Google-Smtp-Source: AGHT+IGjlmuXCwnzPYU1DkboweTrCYKFu8lWTsrlq+6BCMUuE5+pEPGvvlaNUV+/LAnt3Pmuxe+aHA==
X-Received: by 2002:a5d:47a7:0:b0:391:5f:fa13 with SMTP id ffacd0b85a97d-3911f7c5584mr3619371f8f.47.1741200382359;
        Wed, 05 Mar 2025 10:46:22 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e484452asm22043376f8f.61.2025.03.05.10.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:46:21 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/15] arm64: dts: allwinner: Add Allwinner A523 .dtsi file
Date: Wed, 05 Mar 2025 19:46:20 +0100
Message-ID: <2646028.Lt9SDvczpP@jernej-laptop>
In-Reply-To: <20250304222309.29385-9-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_104624_441598_E041C520 
X-CRM114-Status: GOOD (  18.15  )
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

Dne torek, 4. marec 2025 ob 23:23:02 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The Allwinner A523, and its siblings A527 and T527, which share the same
> die, are a new family of SoCs introduced in 2023. They features eight
> Arm Cortex-A55 cores, and, among the other usual peripherals, a PCIe and
> USB 3.0 controller.
>=20
> Add the basic SoC devicetree .dtsi for the chip, describing the
> fundamental peripherals: the cores, GIC, timer, RTC, CCU and pinctrl.
> Also some other peripherals are fully compatible with previous IP, so
> add the USB and MMC nodes as well.
> The other peripherals will be added in the future, once we understand
> their compatibility and DT requirements.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 598 ++++++++++++++++++
>  1 file changed, 598 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> new file mode 100644
> index 0000000000000..01e662bdf5521
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -0,0 +1,598 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +// Copyright (C) 2023-2024 Arm Ltd.
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sun6i-rtc.h>
> +#include <dt-bindings/clock/sun55i-a523-ccu.h>
> +#include <dt-bindings/clock/sun55i-a523-r-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-r-ccu.h>
> +
> +/ {
> +	interrupt-parent =3D <&gic>;
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x000>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu1: cpu@100 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x100>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu2: cpu@200 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x200>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu3: cpu@300 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x300>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu4: cpu@400 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x400>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu5: cpu@500 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x500>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu6: cpu@600 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x600>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu7: cpu@700 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x700>;
> +			enable-method =3D "psci";
> +		};
> +	};
> +
> +	osc24M: osc24M-clk {
> +		#clock-cells =3D <0>;
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <24000000>;
> +		clock-output-names =3D "osc24M";
> +	};
> +
> +	pmu {
> +		compatible =3D "arm,cortex-a55-pmu";
> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci-0.2";
> +		method =3D "smc";
> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		arm,no-tick-in-suspend;
> +		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0x0 0x0 0x0 0x40000000>;
> +
> +		pio: pinctrl@2000000 {
> +			compatible =3D "allwinner,sun55i-a523-pinctrl";
> +			reg =3D <0x2000000 0x800>;
> +			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_APB1>, <&osc24M>, <&rtc CLK_OSC32K>;
> +			clock-names =3D "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells =3D <3>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +
> +			mmc0_pins: mmc0-pins {
> +				pins =3D "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
> +				allwinner,pinmux =3D <2>;
> +				function =3D "mmc0";
> +				drive-strength =3D <30>;
> +				bias-pull-up;
> +			};
> +
> +			/omit-if-no-ref/
> +			mmc1_pins: mmc1-pins {
> +				pins =3D "PG0" ,"PG1", "PG2", "PG3", "PG4", "PG5";
> +				allwinner,pinmux =3D <2>;
> +				function =3D "mmc1";
> +				drive-strength =3D <30>;
> +				bias-pull-up;
> +			};
> +
> +			mmc2_pins: mmc2-pins {
> +				pins =3D "PC1" ,"PC5", "PC6", "PC8", "PC9",
> +				       "PC10", "PC11", "PC13", "PC14", "PC15",
> +				       "PC16";

I guess PC0 should be also included, for HS400 capable cards.

With that fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +				allwinner,pinmux =3D <3>;
> +				function =3D "mmc2";
> +				drive-strength =3D <30>;
> +				bias-pull-up;
> +			};
> +
> +			uart0_pb_pins: uart0-pb-pins {
> +				pins =3D "PB9", "PB10";
> +				allwinner,pinmux =3D <2>;
> +				function =3D "uart0";
> +			};
> +		};
> +
> +		ccu: clock@2001000 {
> +			compatible =3D "allwinner,sun55i-a523-ccu";
> +			reg =3D <0x02001000 0x1000>;
> +			clocks =3D <&osc24M>, <&rtc CLK_OSC32K>,
> +				 <&rtc CLK_IOSC>, <&rtc CLK_OSC32K_FANOUT>;
> +			clock-names =3D "hosc", "losc",
> +				      "iosc", "losc-fanout";
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
> +
> +		mmc0: mmc@4020000 {
> +			compatible =3D "allwinner,sun55i-a523-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg =3D <0x04020000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names =3D "ahb", "mmc";
> +			resets =3D <&ccu RST_BUS_MMC0>;
> +			reset-names =3D "ahb";
> +			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc0_pins>;
> +			status =3D "disabled";
> +
> +			max-frequency =3D <150000000>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			cap-sdio-irq;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		mmc1: mmc@4021000 {
> +			compatible =3D "allwinner,sun55i-a523-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg =3D <0x04021000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
> +			clock-names =3D "ahb", "mmc";
> +			resets =3D <&ccu RST_BUS_MMC1>;
> +			reset-names =3D "ahb";
> +			interrupts =3D <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc1_pins>;
> +			status =3D "disabled";
> +
> +			max-frequency =3D <150000000>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			cap-sdio-irq;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		mmc2: mmc@4022000 {
> +			compatible =3D "allwinner,sun55i-a523-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg =3D <0x04022000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
> +			clock-names =3D "ahb", "mmc";
> +			resets =3D <&ccu RST_BUS_MMC2>;
> +			reset-names =3D "ahb";
> +			interrupts =3D <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc2_pins>;
> +			status =3D "disabled";
> +
> +			max-frequency =3D <150000000>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			cap-sdio-irq;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		wdt: watchdog@2050000 {
> +			compatible =3D "allwinner,sun55i-a523-wdt";
> +			reg =3D <0x2050000 0x20>;
> +			interrupts =3D <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc24M>, <&rtc CLK_OSC32K>;
> +			clock-names =3D "hosc", "losc";
> +			status =3D "okay";
> +		};
> +
> +		uart0: serial@2500000 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x02500000 0x400>;
> +			interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART0>;
> +			resets =3D <&ccu RST_BUS_UART0>;
> +			status =3D "disabled";
> +		};
> +
> +		uart1: serial@2500400 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x02500400 0x400>;
> +			interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART1>;
> +			resets =3D <&ccu RST_BUS_UART1>;
> +			status =3D "disabled";
> +		};
> +
> +		uart2: serial@2500800 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x02500800 0x400>;
> +			interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART2>;
> +			resets =3D <&ccu RST_BUS_UART2>;
> +			status =3D "disabled";
> +		};
> +
> +		uart3: serial@2500c00 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x02500c00 0x400>;
> +			interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART3>;
> +			resets =3D <&ccu RST_BUS_UART3>;
> +			status =3D "disabled";
> +		};
> +
> +		uart4: serial@2501000 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x02501000 0x400>;
> +			interrupts =3D <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART4>;
> +			resets =3D <&ccu RST_BUS_UART4>;
> +			status =3D "disabled";
> +		};
> +
> +		uart5: serial@2501400 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x02501400 0x400>;
> +			interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART5>;
> +			resets =3D <&ccu RST_BUS_UART5>;
> +			status =3D "disabled";
> +		};
> +
> +		uart6: serial@2501800 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x02501800 0x400>;
> +			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART6>;
> +			resets =3D <&ccu RST_BUS_UART6>;
> +			status =3D "disabled";
> +		};
> +
> +		uart7: serial@2501c00 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x02501c00 0x400>;
> +			interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART7>;
> +			resets =3D <&ccu RST_BUS_UART7>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c0: i2c@2502000 {
> +			compatible =3D "allwinner,sun55i-a523-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x2502000 0x400>;
> +			interrupts =3D <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C0>;
> +			resets =3D <&ccu RST_BUS_I2C0>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c1: i2c@2502400 {
> +			compatible =3D "allwinner,sun55i-a523-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x2502400 0x400>;
> +			interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C1>;
> +			resets =3D <&ccu RST_BUS_I2C1>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c2: i2c@2502800 {
> +			compatible =3D "allwinner,sun55i-a523-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x2502800 0x400>;
> +			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C2>;
> +			resets =3D <&ccu RST_BUS_I2C2>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c3: i2c@2502c00 {
> +			compatible =3D "allwinner,sun55i-a523-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x2502c00 0x400>;
> +			interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C3>;
> +			resets =3D <&ccu RST_BUS_I2C3>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c4: i2c@2503000 {
> +			compatible =3D "allwinner,sun55i-a523-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x2503000 0x400>;
> +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C4>;
> +			resets =3D <&ccu RST_BUS_I2C4>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c5: i2c@2503400 {
> +			compatible =3D "allwinner,sun55i-a523-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x2503400 0x400>;
> +			interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C5>;
> +			resets =3D <&ccu RST_BUS_I2C5>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		gic: interrupt-controller@3400000 {
> +			compatible =3D "arm,gic-v3";
> +			#address-cells =3D <1>;
> +			#interrupt-cells =3D <3>;
> +			#size-cells =3D <1>;
> +			ranges;
> +			interrupt-controller;
> +			reg =3D <0x3400000 0x10000>,
> +			      <0x3460000 0x100000>;
> +			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-noncoherent;
> +
> +			its: msi-controller@3440000 {
> +				compatible =3D "arm,gic-v3-its";
> +				reg =3D <0x3440000 0x20000>;
> +				msi-controller;
> +				#msi-cells =3D <1>;
> +				dma-noncoherent;
> +			};
> +		};
> +
> +		usb_otg: usb@4100000 {
> +			compatible =3D "allwinner,sun55i-a523-musb",
> +				     "allwinner,sun8i-a33-musb";
> +			reg =3D <0x4100000 0x400>;
> +			interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "mc";
> +			clocks =3D <&ccu CLK_BUS_OTG>;
> +			resets =3D <&ccu RST_BUS_OTG>;
> +			extcon =3D <&usbphy 0>;
> +			phys =3D <&usbphy 0>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
> +		usbphy: phy@4100400 {
> +			compatible =3D "allwinner,sun55i-a523-usb-phy",
> +				     "allwinner,sun20i-d1-usb-phy";
> +			reg =3D <0x4100400 0x100>,
> +			      <0x4101800 0x100>,
> +			      <0x4200800 0x100>;
> +			reg-names =3D "phy_ctrl",
> +				    "pmu0",
> +				    "pmu1";
> +			clocks =3D <&osc24M>,
> +				 <&osc24M>;
> +			clock-names =3D "usb0_phy",
> +				      "usb1_phy";
> +			resets =3D <&ccu RST_USB_PHY0>,
> +				 <&ccu RST_USB_PHY1>;
> +			reset-names =3D "usb0_reset",
> +				      "usb1_reset";
> +			status =3D "disabled";
> +			#phy-cells =3D <1>;
> +		};
> +
> +		ehci0: usb@4101000 {
> +			compatible =3D "allwinner,sun55i-a523-ehci",
> +				     "generic-ehci";
> +			reg =3D <0x4101000 0x100>;
> +			interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_OHCI0>,
> +				 <&ccu CLK_BUS_EHCI0>,
> +				 <&ccu CLK_USB_OHCI0>;
> +			resets =3D <&ccu RST_BUS_OHCI0>,
> +				 <&ccu RST_BUS_EHCI0>;
> +			phys =3D <&usbphy 0>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
> +		ohci0: usb@4101400 {
> +			compatible =3D "allwinner,sun55i-a523-ohci",
> +				     "generic-ohci";
> +			reg =3D <0x4101400 0x100>;
> +			interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_OHCI0>,
> +				 <&ccu CLK_USB_OHCI0>;
> +			resets =3D <&ccu RST_BUS_OHCI0>;
> +			phys =3D <&usbphy 0>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
> +		ehci1: usb@4200000 {
> +			compatible =3D "allwinner,sun55i-a523-ehci",
> +				     "generic-ehci";
> +			reg =3D <0x4200000 0x100>;
> +			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_OHCI1>,
> +				 <&ccu CLK_BUS_EHCI1>,
> +				 <&ccu CLK_USB_OHCI1>;
> +			resets =3D <&ccu RST_BUS_OHCI1>,
> +				 <&ccu RST_BUS_EHCI1>;
> +			phys =3D <&usbphy 1>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
> +		ohci1: usb@4200400 {
> +			compatible =3D "allwinner,sun55i-a523-ohci",
> +				     "generic-ohci";
> +			reg =3D <0x4200400 0x100>;
> +			interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_OHCI1>,
> +				 <&ccu CLK_USB_OHCI1>;
> +			resets =3D <&ccu RST_BUS_OHCI1>;
> +			phys =3D <&usbphy 1>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
> +		r_ccu: clock-controller@7010000 {
> +			compatible =3D "allwinner,sun55i-a523-r-ccu";
> +			reg =3D <0x7010000 0x250>;
> +			clocks =3D <&osc24M>,
> +				 <&rtc CLK_OSC32K>,
> +				 <&rtc CLK_IOSC>,
> +				 <&ccu CLK_PLL_PERIPH0_200M>,
> +				 <&ccu CLK_PLL_AUDIO0_4X>;
> +			clock-names =3D "hosc",
> +				      "losc",
> +				      "iosc",
> +				      "pll-periph",
> +				      "pll-audio";
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
> +
> +		nmi_intc: interrupt-controller@7010320 {
> +			compatible =3D "allwinner,sun55i-a523-nmi";
> +			reg =3D <0x07010320 0xc>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			interrupts =3D <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		r_pio: pinctrl@7022000 {
> +			compatible =3D "allwinner,sun55i-a523-r-pinctrl";
> +			reg =3D <0x7022000 0x800>;
> +			interrupts =3D <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&r_ccu CLK_R_APB0>,
> +				 <&osc24M>,
> +				 <&rtc CLK_OSC32K>;
> +			clock-names =3D "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells =3D <3>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +
> +			r_i2c_pins: r-i2c-pins {
> +				pins =3D "PL0" ,"PL1";
> +				allwinner,pinmux =3D <2>;
> +				function =3D "r_i2c0";
> +			};
> +		};
> +
> +		r_i2c0: i2c@7081400 {
> +			compatible =3D "allwinner,sun55i-a523-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x07081400 0x400>;
> +			interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&r_ccu CLK_BUS_R_I2C0>;
> +			resets =3D <&r_ccu RST_BUS_R_I2C0>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&r_i2c_pins>;
> +			status =3D "disabled";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		rtc: rtc@7090000 {
> +			compatible =3D "allwinner,sun55i-a523-rtc",
> +				     "allwinner,sun50i-r329-rtc";
> +			reg =3D <0x7090000 0x400>;
> +			interrupts =3D <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&r_ccu CLK_BUS_R_RTC>,
> +				 <&osc24M>,
> +				 <&r_ccu CLK_R_AHB>;
> +			clock-names =3D "bus", "hosc", "ahb";
> +			#clock-cells =3D <1>;
> +		};
> +	};
> +};
>=20





