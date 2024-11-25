Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB80BD58D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 16:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/SMneUlG+U+/tNBslNiwEKbHU6PijesxwJIBcLZUUM=; b=kYVpR/s0C28SG6E4nIgpJpMaFG
	pMX1OUpcXQcNA3pgthPe5Q+SQdF50GtBUpJ3Mx4QpZeinNsyuC2NVyxfPVVGt3xC7GokEl65Yp8xL
	ovXxkfTn3JaG5Tc9N/Dh4OF6KMg1rqlYt09HR3TM3IBRhAptmULnRAhxNbokVHQtdsbus/rOa9CxG
	M73dybXR1L9ulPLdPbmFgUCYrfGR5gB0o+1WODtccgT9p4dQRlg1C63np8e2xG8jcaf6x9o5mOIvM
	zK1O4L0wQJH98jNCpq5xG6QGHMidKhDfSqLofLdn3NrtlSIL0OwFC9Zcu7x9UA3IyDapign/cr202
	jrxoV2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcMJ-00000008fvc-0sjy;
	Mon, 25 Nov 2024 16:54:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcLL-00000008flK-4ABe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 16:53:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so43207635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 08:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732553626; x=1733158426; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/SMneUlG+U+/tNBslNiwEKbHU6PijesxwJIBcLZUUM=;
        b=F6yqfWnCbApwGVyYNXBjX0px2DMTbDqVqJdAA0IVTHhH/E8eJrRqYDb4xo7VTsHCEb
         cCkf43Q0G9/6g9o3drZBR3whDB6EltqegZCze4Ouktdu9QFIfcCdCV/fuMP3N5xqAPp8
         HuFFtvqWtWeSMeXiFpNIxrDPQPrHwEAypm20UTJBGx4K4qqg5xfWJ2ZgSJRAeq9dsMR+
         xsMx5UNHCkN00cTbwud5aHw98Q81ZZTRw2521Sgn8z8WWjb9tbJss5nXZyGPgll0pzRm
         pBtd5vq/mMNyPmB+BnAYuXMwZBf0vQsa8o0DNQAx52HDW0bsBESh3655TrEersORYw9q
         Axhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732553626; x=1733158426;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/SMneUlG+U+/tNBslNiwEKbHU6PijesxwJIBcLZUUM=;
        b=V1g/0JTBoiWk7HljUT/SqTAuJRj+N2z0ESymvGywfnoH8szTDBCBb5zbL7VnIO/+p5
         gwRPl1ot9PRhvP8hg3bd9G3NcXonyFDYzb4QndDtWrwcqelQl9EvKyMKcyATbujdTB/d
         5OBvcmyGM39mC0Y7khFzTOMiEEKwUjXPvhIwYdMPphwx6t+67gsm7qxkf1sFpxyV331E
         4MRohSRLe0pG73YNdvHB5KK1VsA3ERRPPcncpPOIEf40mBu7xYHoX7YyKmAcBQM5HAoo
         7W1DesbzXd81dj4eApgDsUpGipsONgldPuRIQDCoSVCTiLtQsi6TUNjFa6wtd7VnsIKX
         Q3rg==
X-Forwarded-Encrypted: i=1; AJvYcCW1V+Whq6MddJOh9ml7xYyqWL2Gt5YpnDZ05Zx0n+CWm/5qlA737pb1uRWo/WbVoUr93N94h3L0oGmgOcPKMjWK@lists.infradead.org
X-Gm-Message-State: AOJu0YxvK1XG7Pxog1J/Tp/ib3kk8x2xZxUJtWhG294H4rJGGxI/O1eR
	3KWmkJWLPYAsAowd2wTWDeH5RjSoR8u6HJQMRYFXwR1iPA4gJNvgxR56kMISCEw=
X-Gm-Gg: ASbGncsUn3jzPNhV4HuwKbYZIyv9qhqNYTKRvZhalAspKCLu/e0k2Vv9lb0aql1AEwO
	dcLVXwS4H0VPVHHFhsfqw7xinZ2D13rOmiXLF0TJ9cKj/DdMbMMsH0qIMdyDCGbNibX2r7o+eih
	s8LCxY6FFpJS9QiOobTEvLSYmV16E/+dh2oYOqFhoE+hDtJA6xDiWIHk12Qd8TrbUniQLahIypm
	4OA33uLo56X/jRobUuuQl+GcDA4J8X45alW6gJFSeiXcHHw
X-Google-Smtp-Source: AGHT+IFplvSQW/AK3neE/bqS0bgzqZVofphwlQzp3Xvyc4WU40Cdle5aRvyQbnke4EIH2nhLl5gphA==
X-Received: by 2002:a05:600c:4e91:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-433ce417b2amr111604955e9.6.1732553626360;
        Mon, 25 Nov 2024 08:53:46 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:97f5:4cdc:1888:403])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b463ab5fsm202102845e9.27.2024.11.25.08.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 08:53:45 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Chuan Liu <chuan.liu@amlogic.com>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  xianwei.zhao@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: add Amlogic A5 peripherals
 clock controller
In-Reply-To: <20241120-a5-clk-v2-3-1208621e961d@amlogic.com> (Xianwei Zhao
	via's message of "Wed, 20 Nov 2024 15:01:15 +0800")
References: <20241120-a5-clk-v2-0-1208621e961d@amlogic.com>
	<20241120-a5-clk-v2-3-1208621e961d@amlogic.com>
Date: Mon, 25 Nov 2024 17:53:45 +0100
Message-ID: <1jmshntfty.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_085348_033858_99D82D58 
X-CRM114-Status: GOOD (  18.16  )
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

On Wed 20 Nov 2024 at 15:01, Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Add the peripherals clock controller dt-bindings for Amlogic A5 SoC family.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../clock/amlogic,a5-peripherals-clkc.yaml         | 130 ++++++++++++++++++++
>  .../clock/amlogic,a5-peripherals-clkc.h            | 132 +++++++++++++++++++++
>  2 files changed, 262 insertions(+)
>
> diff --git
> a/Documentation/devicetree/bindings/clock/amlogic,a5-peripherals-clkc.yaml
> b/Documentation/devicetree/bindings/clock/amlogic,a5-peripherals-clkc.yaml
> new file mode 100644
> index 000000000000..0f15e104fd12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a5-peripherals-clkc.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,a5-peripherals-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A5 series Peripheral Clock Controller
> +
> +maintainers:
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +  - Chuan Liu <chuan.liu@amlogic.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a5-peripherals-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 18
> +    items:
> +      - description: input oscillator (usually at 24MHz)
> +      - description: input oscillators multiplexer
> +      - description: input fix pll
> +      - description: input fclk div 2
> +      - description: input fclk div 2p5
> +      - description: input fclk div 3
> +      - description: input fclk div 4
> +      - description: input fclk div 5
> +      - description: input fclk div 7
> +      - description: input mpll2
> +      - description: input mpll3
> +      - description: input gp0 pll
> +      - description: input gp1 pll
> +      - description: input hifi pll
> +      - description: input sys clk
> +      - description: input axi clk
> +      - description: input sys pll div 16
> +      - description: input cpu clk div 16
> +      - description: input pad clock for rtc clk (optional)
> +      - description: input ddr pll (optional)
> +      - description: input source from clk-measure (optional)
> +
> +  clock-names:
> +    minItems: 18
> +    items:
> +      - const: xtal_24m

You should not mention the rate here. xtal is fine.

> +      - const: oscin
> +      - const: fix
> +      - const: fdiv2
> +      - const: fdiv2p5
> +      - const: fdiv3
> +      - const: fdiv4
> +      - const: fdiv5
> +      - const: fdiv7
> +      - const: mpll2
> +      - const: mpll3
> +      - const: gp0
> +      - const: gp1
> +      - const: hifi
> +      - const: sysclk
> +      - const: axiclk
> +      - const: sysplldiv16
> +      - const: cpudiv16
> +      - const: pad_osc
> +      - const: ddr
> +      - const: clkmsr
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@0 {
> +            compatible = "amlogic,a5-peripherals-clkc";
> +            reg = <0x0 0x0 0x0 0x224>;
> +            #clock-cells = <1>;
> +            clocks = <&xtal_24m>,
> +                     <&scmi_clk 0>,
> +                     <&scmi_clk 7>,
> +                     <&scmi_clk 15>,
> +                     <&scmi_clk 17>,
> +                     <&scmi_clk 19>,
> +                     <&scmi_clk 21>,
> +                     <&scmi_clk 23>,
> +                     <&scmi_clk 25>,
> +                     <&clkc_pll 6>,
> +                     <&clkc_pll 8>,
> +                     <&clkc_pll 10>,
> +                     <&scmi_clk 5>,
> +                     <&clkc_pll 12>,
> +                     <&scmi_clk 1>,
> +                     <&scmi_clk 2>,
> +                     <&scmi_clk 9>,
> +                     <&scmi_clk 10>;
> +            clock-names = "xtal_24m",
> +                          "oscin",
> +                          "fix",
> +                          "fdiv2",
> +                          "fdiv2p5",
> +                          "fdiv3",
> +                          "fdiv4",
> +                          "fdiv5",
> +                          "fdiv7",
> +                          "mpll2",
> +                          "mpll3",
> +                          "gp0",
> +                          "gp1",
> +                          "hifi",
> +                          "sysclk",
> +                          "axiclk",
> +                          "sysplldiv16",
> +                          "cpudiv16";
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/amlogic,a5-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,a5-peripherals-clkc.h
> new file mode 100644
> index 000000000000..74e740ebe6bd
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,a5-peripherals-clkc.h
> @@ -0,0 +1,132 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Chuan Liu <chuan.liu@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_A5_PERIPHERALS_CLKC_H
> +#define _DT_BINDINGS_CLOCK_AMLOGIC_A5_PERIPHERALS_CLKC_H
> +
> +#define CLKID_RTC_XTAL_CLKIN			0
> +#define CLKID_RTC_32K_DIV			1
> +#define CLKID_RTC_32K_MUX			2
> +#define CLKID_RTC_32K				3
> +#define CLKID_RTC_CLK				4
> +#define CLKID_SYS_RESET_CTRL			5
> +#define CLKID_SYS_PWR_CTRL			6
> +#define CLKID_SYS_PAD_CTRL			7
> +#define CLKID_SYS_CTRL				8
> +#define CLKID_SYS_TS_PLL			9
> +#define CLKID_SYS_DEV_ARB			10
> +#define CLKID_SYS_MAILBOX			11
> +#define CLKID_SYS_JTAG_CTRL			12
> +#define CLKID_SYS_IR_CTRL			13
> +#define CLKID_SYS_MSR_CLK			14
> +#define CLKID_SYS_ROM				15
> +#define CLKID_SYS_CPU_ARB			16
> +#define CLKID_SYS_RSA				17
> +#define CLKID_SYS_SAR_ADC			18
> +#define CLKID_SYS_STARTUP			19
> +#define CLKID_SYS_SECURE			20
> +#define CLKID_SYS_SPIFC				21
> +#define CLKID_SYS_DSPA				22
> +#define CLKID_SYS_NNA				23
> +#define CLKID_SYS_ETH_MAC			24
> +#define CLKID_SYS_RAMA				25
> +#define CLKID_SYS_RAMB				26
> +#define CLKID_SYS_AUDIO_TOP			27
> +#define CLKID_SYS_AUDIO_VAD			28
> +#define CLKID_SYS_USB				29
> +#define CLKID_SYS_SD_EMMC_A			30
> +#define CLKID_SYS_SD_EMMC_C			31
> +#define CLKID_SYS_PWM_AB			32
> +#define CLKID_SYS_PWM_CD			33
> +#define CLKID_SYS_PWM_EF			34
> +#define CLKID_SYS_PWM_GH			35
> +#define CLKID_SYS_SPICC_1			36
> +#define CLKID_SYS_SPICC_0			37
> +#define CLKID_SYS_UART_A			38
> +#define CLKID_SYS_UART_B			39
> +#define CLKID_SYS_UART_C			40
> +#define CLKID_SYS_UART_D			41
> +#define CLKID_SYS_UART_E			42
> +#define CLKID_SYS_I2C_M_A			43
> +#define CLKID_SYS_I2C_M_B			44
> +#define CLKID_SYS_I2C_M_C			45
> +#define CLKID_SYS_I2C_M_D			46
> +#define CLKID_SYS_RTC				47
> +#define CLKID_AXI_AUDIO_VAD			48
> +#define CLKID_AXI_AUDIO_TOP			49
> +#define CLKID_AXI_RAMB				50
> +#define CLKID_AXI_RAMA				51
> +#define CLKID_AXI_NNA				52
> +#define CLKID_AXI_DEV1_DMC			53
> +#define CLKID_AXI_DEV0_DMC			54
> +#define CLKID_AXI_DSP_DMC			55
> +#define CLKID_12_24M_IN				56
> +#define CLKID_12M_24M				57
> +#define CLKID_FCLK_25M_DIV			58
> +#define CLKID_FCLK_25M				59
> +#define CLKID_GEN_SEL				60
> +#define CLKID_GEN_DIV				61
> +#define CLKID_GEN				62
> +#define CLKID_SARADC_SEL			63
> +#define CLKID_SARADC_DIV			64
> +#define CLKID_SARADC				65
> +#define CLKID_PWM_A_SEL				66
> +#define CLKID_PWM_A_DIV				67
> +#define CLKID_PWM_A				68
> +#define CLKID_PWM_B_SEL				69
> +#define CLKID_PWM_B_DIV				70
> +#define CLKID_PWM_B				71
> +#define CLKID_PWM_C_SEL				72
> +#define CLKID_PWM_C_DIV				73
> +#define CLKID_PWM_C				74
> +#define CLKID_PWM_D_SEL				75
> +#define CLKID_PWM_D_DIV				76
> +#define CLKID_PWM_D				77
> +#define CLKID_PWM_E_SEL				78
> +#define CLKID_PWM_E_DIV				79
> +#define CLKID_PWM_E				80
> +#define CLKID_PWM_F_SEL				81
> +#define CLKID_PWM_F_DIV				82
> +#define CLKID_PWM_F				83
> +#define CLKID_PWM_G_SEL				84
> +#define CLKID_PWM_G_DIV				85
> +#define CLKID_PWM_G				86
> +#define CLKID_PWM_H_SEL				87
> +#define CLKID_PWM_H_DIV				88
> +#define CLKID_PWM_H				89
> +#define CLKID_SPICC_0_SEL			90
> +#define CLKID_SPICC_0_DIV			91
> +#define CLKID_SPICC_0				92
> +#define CLKID_SPICC_1_SEL			93
> +#define CLKID_SPICC_1_DIV			94
> +#define CLKID_SPICC_1				95
> +#define CLKID_SD_EMMC_A_SEL			96
> +#define CLKID_SD_EMMC_A_DIV			97
> +#define CLKID_SD_EMMC_A				98
> +#define CLKID_SD_EMMC_C_SEL			99
> +#define CLKID_SD_EMMC_C_DIV			100
> +#define CLKID_SD_EMMC_C				101
> +#define CLKID_TS_DIV				102
> +#define CLKID_TS				103
> +#define CLKID_ETH_125M_DIV			104
> +#define CLKID_ETH_125M				105
> +#define CLKID_ETH_RMII_DIV			106
> +#define CLKID_ETH_RMII				107
> +#define CLKID_DSPA_0_SEL			108
> +#define CLKID_DSPA_0_DIV			109
> +#define CLKID_DSPA_0				110
> +#define CLKID_DSPA_1_SEL			111
> +#define CLKID_DSPA_1_DIV			112
> +#define CLKID_DSPA_1				113
> +#define CLKID_DSPA				114
> +#define CLKID_NNA_CORE_SEL			115
> +#define CLKID_NNA_CORE_DIV			116
> +#define CLKID_NNA_CORE				117
> +#define CLKID_NNA_AXI_SEL			118
> +#define CLKID_NNA_AXI_DIV			119
> +#define CLKID_NNA_AXI				120
> +
> +#endif  /* _DT_BINDINGS_CLOCK_AMLOGIC_A5_PERIPHERALS_CLKC_H */

-- 
Jerome

