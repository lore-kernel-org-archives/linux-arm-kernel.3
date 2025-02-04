Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087B1C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQ5++agd0QoEY64Wz7u8d59Bv8ZNS8ggDIsozpgsnM8=; b=TMJoiGcovOexZ/8TNLtNuUumz8
	PQnb85NsfUI9nCeY2YcaywSkikCNVWyIFYjMyi/EhnPfKB9W9p5zfBpsdYXcCuB2vV9TXBnUceBE3
	VbCAwRbdg3JCXx3dWtNCllZVGEA4C8iWNJrLIADAw+kaf+6sFnmChrQQTYkOIUn0z8s33KwDo6g1M
	tKRCA/7T+CO7mk9f1GIVWC/npk0WjZhnxEIu4ThbkkGhJPEkQdR6OEGAwukQ6GjPqhdp3LDZuORoK
	PAUGREtSkTuxhRRC0Nxe/C1EwiAGx7wrDHp1Juw4RuhFhQ8dwpQ9nB6ItxQwPec+dBemATQFxZtL7
	SPivxhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNaD-00000001Ckg-2LiE;
	Tue, 04 Feb 2025 18:23:37 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNYr-00000001CaT-3Rky
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:22:15 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5dca451f922so5063391a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 10:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738693332; x=1739298132; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQ5++agd0QoEY64Wz7u8d59Bv8ZNS8ggDIsozpgsnM8=;
        b=hYwKqB60X1cFprUksZCKp5MJVXF+hUj1PKNu1GDlbtaXyhUh8EEbUOmBiMV1VHmRv9
         cdj+BLlpl8hiRfIMkbHGfld0CWrfiyK2jKc46BQxnf/ywjFUw5fSxa8jUWV6Nh2kIdB0
         dAEAuBy+87MZ0mDgKHD6sm9Xa3XkiAlU52HEg4BPrBb8j55Jq4z3Grn9H8JKb8beQco7
         heq49aOB4QgRKK/xXR0FU/nMb+BAQqsaHnDEckXvgVz6MFUqTYqu6aya0MAizUKUsvmk
         RvUA1Va20G34d/Gz0GdLU7FcRUlinADXifchfDn5/jZSv/10DqbzqynrkddhLDOvtg+V
         WJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738693332; x=1739298132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQ5++agd0QoEY64Wz7u8d59Bv8ZNS8ggDIsozpgsnM8=;
        b=Ufvh7XSrskDtypIpSD0PS1xemuJOWo3DF2zvXFsH4jiGTCmmND0MZyoBwVor0AMcZo
         tqlby0BK6pfHF7lCF8UhVJuhwK//d3ItaBmAatyOEiYojpqx5qBlwph6WTlliDskqx8x
         /3N6v3kUnRpJ1A2g0ZmUggtsetSUkybN58IJ/8I8Jm+1sO83ghytXB1Tu4is0nibYhah
         Wwr9DTB9nmRqT21UKHZAyjVl5Ygf3j5M8c3Zej/9Qm/nCWPokTl2wmTFP/t1d3hXX1gu
         fYUVp8vZetjC+m7KIURIH9TDMkv4GDJXFyjRTe1T/GAJrBiILec7qIEbAWUl97DadBrQ
         93Og==
X-Forwarded-Encrypted: i=1; AJvYcCXWrI3IjP73LVYrclZvJWc37K5BAJL/TLuQrehVBU9Zd0ayOKskXvqR4ACKslTXZXy+x9o7KgYVIgRg/x/qpfre@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyw25ijvQBMikPRxhQEGtbE7OHCRz7/je+ZI3fSVwMixe/fg1N
	DeAiAtoChb7WhW0EaLUcfuHz7kfqNAn2ltYAzdl2wH4WqxFdS/Wt
X-Gm-Gg: ASbGncvAWqxpFxmEQecchF3YC0/6gVzIxyVz+eNKel7djLKCGuFcvuuNPTIGGVQryoW
	/6PIlL68hWhQZKuSzb5KYcBGHhNw50ftxU3GFFHoy7H7JbE5Qzc/aOn/TocR7pM00LYA0QZDOcD
	kocSKfz7mrzIFjF/6TykkrujEVVxqskHdkF0+M2triYN4wrISAIe9qzP0NJxGt0GBqLMTdYpJdj
	pe061gy7HtA3jRGDNCFlzhA/rPuKpNODBnQ1RuwJfKiv9mEiNmfFepJasv9hScBCYFXirnuZCTP
	3aKe2OrPdg0sNWfAVE1WYjr7LRFS1MS91V4yAPgeyxi0FyuxCbB9ssbBQ01q/+H+b0MrQw==
X-Google-Smtp-Source: AGHT+IEQ4DMWF7roCrp5EJD85FGwjsBCdu+Kca8lx2Hj1i97FM9pySSYNrsTVSCzOrQrFS6BR/FM0Q==
X-Received: by 2002:a17:906:9c8c:b0:ab3:3bab:c533 with SMTP id a640c23a62f3a-ab6cfcc2e94mr2804249166b.21.1738693331664;
        Tue, 04 Feb 2025 10:22:11 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a2f90asm954865966b.129.2025.02.04.10.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 10:22:11 -0800 (PST)
Message-ID: <00aa901b-5de9-4b72-a157-c54ad29df458@gmail.com>
Date: Tue, 4 Feb 2025 20:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: exynos: add initial devicetree support
 for exynos7870
Content-Language: en-US
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250204-exynos7870-v2-0-56313165ef0c@disroot.org>
 <20250204-exynos7870-v2-2-56313165ef0c@disroot.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250204-exynos7870-v2-2-56313165ef0c@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_102213_871400_6FBEF640 
X-CRM114-Status: GOOD (  22.72  )
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

On 2/3/25 22:46, Kaustabh Chakraborty wrote:
> Exynos7870 is an arm64 SoC manufactured by Samsung and announced in
> 2016. It is present in multiple mid-range Samsung phones and tablets.
>
> Add basic devicetree support for the SoC, which includes CMUs, pin
> controllers, I2C, UART, DW-MMC, and USB-DRD.
>
> Co-developed-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1035 ++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  722 ++++++++++++++
>  2 files changed, 1757 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..28ff409c4fdc5f766d92617ea2df7be2112c28d1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
> @@ -0,0 +1,1035 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos7870 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "exynos-pinctrl.h"
> +
> +&pinctrl0 {

I haven't had enough time to look deeper, but these are my 2 cents:


Can you label them according to their block name rather than numbers?
For example, pinctrl_abox (make sure to keep them alphabetically sorted
as well).

> +	etc0: etc0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	etc1: etc1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpa0: gpa0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa1: gpa1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa2: gpa2-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpq0: gpq0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	uart2_bus: uart2-bus-pins {
> +		samsung,pins = "gpa1-1", "gpa1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart2_sleep: uart2-sleep-pins {
> +		samsung,pins = "gpa1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	bt_btwake: bt-btwake-pins {
> +		samsung,pins = "gpa1-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	bt_hostwake: bt-hostwake-pins {

Sort these alphabetically, so you have:
all a-z-gpio-bank, after which all a-z-pin.

In this case bt_* can be first after all gpio bank nodes.

> +		samsung,pins = "gpa1-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	gnss_sensor_irq: gnss-sensor-irq-pins {
> +		samsung,pins = "gpa2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_6>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	gnss_sensor_i2c: gnss-sensor-i2c-pins {
> +		samsung,pins = "gpa2-5", "gpa2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_6>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
...
> +		#interrupt-cells = <2>;
> +	};
> +
> +	hs_i2c0_bus: hs-i2c0-bus-pins {

s/hs_i2c/hsi2c/g

> +		samsung,pins = "gpm0-1", "gpm0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
> +	};
...
> diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..11129e37fc86ebaee01684ed6841c932dd6cbc8a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
> @@ -0,0 +1,722 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos7870 SoC device tree source
> + *
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/clock/exynos7870.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/samsung,boot-mode.h>
> +
> +/ {
> +	compatible = "samsung,exynos7870";
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +
> +	/* Samsung's bootloader (S-BOOT) checks for these DT properties */
> +	model_info-hw_rev = <0>;
> +	model_info-hw_rev_end = <255>;
> +	model_info-chip = <7870>;

You could skip the properties with a shim bootloader like uniLoader. Up to
Krzysztof to decide if you should keep these.

> +

...

> +	};
> +
> +	oscclk: oscclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +
> +		clock-frequency = <26000000>;

Frequency must be defined in the board device tree.

> +	};
> +
> +	timer {

S is before T, so this goes after soc {}

> +		compatible = "arm,armv8-timer";
> +		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +
> +		/* Samsung's bootloader (S-BOOT) doesn't set CNTFRQ_EL0 */
> +		clock-frequency = <26000000>;
> +	};
> +
> +	gic: interrupt-controller@104e0000 {
> +		compatible = "arm,cortex-a15-gic";
> +		reg = <0x0 0x104e1000 0x1000>,

So it should be @104e1000 and not @104e0000

> +		      <0x0 0x104e2000 0x1000>,
> +		      <0x0 0x104e4000 0x2000>,
> +		      <0x0 0x104e6000 0x2000>;
> +		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> +		interrupt-controller;
> +		#address-cells = <0>;
> +		#interrupt-cells = <3>;
> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		ranges = <0x0 0x0 0x0 0x20000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		chipid@10100000 {
> +			compatible = "samsung,exynos7870-chipid",
> +				     "samsung,exynos4210-chipid";
> +			reg = <0x10100000 0x100>;
> +		};
> +
> +		pmu_system_controller: system-controller@10480000 {
> +			compatible = "samsung,exynos7870-pmu",
> +				     "samsung,exynos7-pmu", "syscon";
> +			reg = <0x10480000 0x10000>;
> +			#clock-cells = <1>;
> +
> +			clock-names = "clkout8",
> +				      "clkout9",

Could fit more than one per line.

> +				      "clkout10",
> +				      "clkout11",
> +				      "clkout12";
> +			clocks = <&oscclk>,
> +				 <&oscclk>,
> +				 <&oscclk>,
> +				 <&oscclk>,
> +				 <&oscclk>;
> +
> +			reboot-mode {
> +				compatible = "syscon-reboot-mode";
> +				offset = <0x080c>;
> +				mode-bootloader = <EXYNOS7870_BOOT_BOOTLOADER>;
> +				mode-download = <EXYNOS7870_BOOT_DOWNLOAD>;
> +				mode-recovery = <EXYNOS7870_BOOT_RECOVERY>;
> +			};
> +		};
> +
> +		cmu_mif: clock-controller@10460000 {

Sort all of these by address.

> +			compatible = "samsung,exynos7870-cmu-mif";
> +			reg = <0x10460000 0x1000>;
> +			#clock-cells = <1>;
> +
> +			clock-names = "oscclk";
> +			clocks = <&oscclk>;
> +		};
> +
> +		cmu_dispaud: clock-controller@148d0000 {
> +			compatible = "samsung,exynos7870-cmu-dispaud";
> +			reg = <0x148d0000 0x1000>;
> +			#clock-cells = <1>;
> +
> +			clock-names = "oscclk",
> +				      "gout_mif_cmu_dispaud_bus",

bus

> +				      "gout_mif_cmu_dispaud_decon_eclk",

decon_eclk

> +				      "gout_mif_cmu_dispaud_decon_vclk";

decon_vclk

Clock names here shouldn't be long. You'll still describe them in the
clock YAML either way. Check other SoCs like 8895, autov920, 990.

> +			clocks = <&oscclk>,
> +				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_BUS>,
> +				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK>,
> +				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK>;
> +		};
> +

...

> +
> +		i2c1: i2c@13880000 {
> +			compatible = "samsung,exynos7870-i2c",
> +				     "samsung,s3c2440-i2c";
> +			reg = <0x13880000 0x100>;
> +			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";

Status always comes last. Make sure to sort all properties as per the DT
Coding Style [1].

[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c1_bus>;
> +
> +			clock-names = "i2c";
> +			clocks = <&cmu_peri CLK_GOUT_PERI_I2C1_PCLK>;
> +		};

...

> +		};
> +	};
> +};
> +
> +#include "exynos7870-pinctrl.dtsi"
> +#include "arm/samsung/exynos-syscon-restart.dtsi"

Didn't this already include a reboot node?

Best regards,
Ivaylo

>


