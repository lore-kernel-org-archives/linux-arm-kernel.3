Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1F9CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tv+HFheUg03EfuoN4T+QaHYdh9A1PWG93ECLbXxMf3g=; b=ckJLHV43N8+vt6kGm+t0pfLdKF
	pfCox1Lt/PmCqUiHcQSi6gGYhJO2uk5QdgetOL/e5EjV163c3cF5OYaI6CHeS2JQpB/OxPH2Fz1M6
	fvEnKgjR98uxA82MLfbalJ8as7smnh5Fi9APTltnNHsLOsuHulkbmLFxzcvz6yff/Tri0iepwxM2+
	gxYouE1ZvT5BJp4qk7GV68Wtnj9ZBcPYHS4FfbapOPBC5EjwNQEw0bzqaARIlxc9sH+m+FBXgoD00
	7C2+C0hwEnBAg7xZ9L/16EFZ6opo+m/9jpmo17ZOJcRTQg/ru2LwSVMnGOgRklsKtL1MVk11qohXB
	xOV34e6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3A7-00000006Xum-2GHe;
	Tue, 23 Jun 2026 15:35:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3A5-00000006XuS-19Zt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:35:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49241896317so91165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782228939; x=1782833739; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv+HFheUg03EfuoN4T+QaHYdh9A1PWG93ECLbXxMf3g=;
        b=KDeciYf0ntIaZ7m5IadG4LtKci6ACKdR7+sMSxUnLZqwlkmRxjH5HAiLhQiy/56YGa
         3ALGNWwHIoGsYwX3x7V9nottHJgn8h4haHqqXY/V3eyxzOru5KK8jn5YlV59x3yLBYHB
         CFKSwX2exMaTAL1ZN+Z1XQStrUejz77uxPIm9uF1CCwgI7rHXCIbNbtyJYVG2B8+Vv3b
         R5esqCxSik1JS04Em90yDp4weMBZ2Rhix+crrMGyoh0n2KS5tB9grt63DnmW7Z3WFCWC
         3eNDc2Q+8aCPeBN5oSvVZ2195abLMIyeGnZXdSrMxNcjfJZ70aVVmBfjJpLQFI2FuNkT
         Ud3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782228939; x=1782833739;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tv+HFheUg03EfuoN4T+QaHYdh9A1PWG93ECLbXxMf3g=;
        b=reB3SsF9zBOW0LqESEUvzEllOwAZNbWdkWO+QhXsMHhdIUewkMt3ZAc2mwB9o4n2KW
         5SahyzIaOBvvZPIni8aIeKyLCBqXEIcUifwVX/IxFipT+1mTK0bIrUmZ/DSDeDseE20P
         PQ2RPSLsf7eUHHmW5zQ9VX6ilKlNdQAqjzlWLFaR9533RHCkyPoNEt6dCkAV1Vcy1/V+
         4q/7IFq8Q+VksTdGbYkiPbllxqTWYWnYusrLOCWoLCwmuonT0rGaOiPBjynq0fFV+OjK
         E+4DwYP3YU8jqmftJ33UjZS93qm32wFf4Ikysam3C3ywyxGgFIUoW4hmsMDCKsZh2HEn
         S+rw==
X-Forwarded-Encrypted: i=1; AFNElJ9jCMAVnyuNZ5yfOm68bg9OguZWf2G7FRLafr8s+Hzs/YXUztxN8Zjt7YbgoK19l2erwniUdX9Fy9DATf3erchY@lists.infradead.org
X-Gm-Message-State: AOJu0YxVms81PCgzrL08csijMXE2dRjj5zEyNEcPahfqFfd17ly9AXoo
	m7zjKTrUN9z3qcGQ+JPE2trjFSk7unkp9jtWAHsbxYqdsjizEYcDYU92eGuVWs5YpFE=
X-Gm-Gg: AfdE7ckW54mX57DdDfE1m7O/YysY4CzzTgAIoEOIaSqg/2x4A4L5i36EG6NfHS8Fpia
	6+hdARHbzDNd0CERNpVvB8lN9IhUG3jQ1z6A9rBvWpxWkwcjhBkn0O2zxZNunN/lcZyOLQ7AE9U
	zShnvzksgZTYrEHN2S0aJh1lZZD1mSg7vho1pgB0A87cFzlxqGnpf4lchLIE8/mWgpgHunm4qQv
	n1bX6xbuMmcs7cSotEcJHwDgNeO78aQuTPS1nuyYDkkSopEClcRpPWKLEBD0tGVTdaTLIf9pUp0
	2EeFfNCdrEGVa7ORt/tlIvFW+h3SxzvvYch0SR3rgpwPQWrrd7ktt4WILG2U4Pe3YH/FOlmt+EG
	3Qp2lv0amJaBibojAio5E2gsbfUkdwh8q8D23vVtuoPNYV0QzORsXmobSbswqhHihw89Fi/2KZN
	2N+0OxLr8AVQ==
X-Received: by 2002:a05:600c:8b18:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4925b38cfa9mr49681285e9.13.1782228939052;
        Tue, 23 Jun 2026 08:35:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:20f1:5c9:8a6d:48a1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fe7b9e5sm370653045e9.10.2026.06.23.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:35:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Enzo Adriano via B4 Relay <devnull+enzo.adriano.code.gmail.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,  Ulf
 Hansson <ulfh@kernel.org>,  enzo.adriano.code@gmail.com,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-mmc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: add Allwinner A733 SoC
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com>
	(Enzo Adriano via's message of "Sat, 13 Jun 2026 05:42:15 -0400")
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
	<20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 23 Jun 2026 17:35:36 +0200
Message-ID: <1j33ydb77b.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_083541_371402_ACA1097C 
X-CRM114-Status: GOOD (  17.68  )
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

On sam. 13 juin 2026 at 05:42, Enzo Adriano via B4 Relay <devnull+enzo.adriano.code.gmail.com@kernel.org> wrote:

> From: Enzo Adriano <enzo.adriano.code@gmail.com>
>
> Add the initial A733 SoC description with CPUs, timers, interrupt
> controller, clocks, pinctrl, UART0, and MMC0.
>
> Keep peripherals disabled by default. Board DTS files can enable only the
> devices that are proven on their hardware.
>
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi | 198 +++++++++++++++++++++++++
>  1 file changed, 198 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 000000000000..3721aa9e8573
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sun60i-a733-ccu.h>
> +#include <dt-bindings/reset/sun60i-a733-ccu.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x000>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu4: cpu@400 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x400>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu5: cpu@500 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x500>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu6: cpu@600 {
> +			compatible = "arm,cortex-a76";
> +			device_type = "cpu";
> +			reg = <0x600>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		cpu7: cpu@700 {
> +			compatible = "arm,cortex-a76";
> +			device_type = "cpu";
> +			reg = <0x700>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +	};
> +
> +	osc24M: osc24M-clk {

Note A733 supports 19.2MHz, 24MHz and 26MHz xtals apparently.
The A7S and A7A do have a 26MHz xtal according to the schematics.

While this might be fine in the SoC dtsi, your are missing something in
your board dts to change the xtal rate, at least.

Also the node and clock name are a bit misleading now.

> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "osc24M";
> +	};
> +
> +	osc32k: osc32k-clk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		clock-output-names = "osc32k";

I think this is the ext32k supposed to feed the rtc ccu ...

> +	};
> +
> +	iosc: internal-osc-clk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <16000000>;
> +		clock-output-names = "iosc";
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0", "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		arm,no-tick-in-suspend;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x40000000>;
> +
> +		pio: pinctrl@2000000 {
> +			compatible = "allwinner,sun60i-a733-pinctrl";
> +			reg = <0x02000000 0x600>;
> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_APB1>, <&osc24M>, <&osc32k>;
> +			clock-names = "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +
> +			mmc0_pins: mmc0-pins {
> +				pins = "PF0", "PF1", "PF2",
> +				       "PF3", "PF4", "PF5";
> +				function = "mmc0";
> +				drive-strength = <30>;
> +				bias-pull-up;
> +			};
> +		};
> +
> +		ccu: clock-controller@2002000 {
> +			compatible = "allwinner,sun60i-a733-ccu";
> +			reg = <0x02002000 0x2000>;
> +			clocks = <&osc24M>, <&osc32k>, <&iosc>;
                                                ^
... not directly the main CCU.

> +			clock-names = "hosc", "losc", "iosc";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		uart0: serial@2500000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x02500000 0x400>;
> +			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART0>;
> +			resets = <&ccu RST_BUS_UART0>;
> +			status = "disabled";
> +		};
> +
> +		gic: interrupt-controller@3400000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0x03400000 0x10000>,
> +			      <0x03460000 0x100000>;
> +		};
> +
> +		mmc0: mmc@4020000 {
> +			compatible = "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04020000 0x1000>;
> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC0>;
> +			reset-names = "ahb";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc0_pins>;
> +			max-frequency = <200000000>;
> +			cap-sd-highspeed;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};

-- 
Jerome

