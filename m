Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596A0EEF326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x29TSbD/9Rjft5iIHHQCYlLvvZ+GvP60F94LjzSbanc=; b=hSdc8LnYFAw0Q67r5jwiYSAlK0
	WcnFN+NN5yOgRaaJJmU3AKuCIRMEwK/rDuikdu+V4jm1x7sUrW9MgCf59/VpSBP29O+ucMexMYQau
	2W9PSBuQtB5eu4q+NDEsVCAY6k9oQT+DyuQsjPwCEX/BIJ8nl9T7h7PhfXJSFQxRNmIkREMdgL16p
	4zsrSyH3fMjNO0SBxRb8KmSq2x8cNLQ4sCHI8xcPgXdyG8EM3lfMCGVg+b852EzGtXO6HedpuiI+P
	S55xNGzeKtmHAXC1NjipeSSqOy+VxF6ECYOdQI4dBRVXUk2O2OZkzxs4Yl6oCwoVkKv7fDD/D3Ma9
	3vwaxKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4dC-00000001H5L-2qti;
	Thu, 05 Mar 2026 09:04:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4d7-00000001H49-0rFh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:04:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso557855f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772701463; x=1773306263; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x29TSbD/9Rjft5iIHHQCYlLvvZ+GvP60F94LjzSbanc=;
        b=nsClsLEydHE0roOcBsoFaCVPZEunoSrxa6UimmWjpIECcLJtNvehA6sYmAtUDDq3fg
         2A9BZkhKG7fmECda2ZaMkgU69sbTy0Pb9wjs6Wn3NXexrrCJl/rIlBShIAwOTREiUmw2
         ZJOOQyR4SNbFSRaWzLc2B9m0QcF2F8q0Rs7vAN47f3TGj2t3w3kSkUQG6ZUQ+9ZpZknj
         lGpSw/EcPdoOlqUwTNHQDUHqCzq38pKfM++MFpw1Gam8ziKQxzxB1mebDtrMh1PnMwDj
         Gx9lEkuQtjHNhzC2aioRDV+erUuX2KwNdxJERunu6RRRvOshVUb3g9NW0Y1BsIXj1mQv
         geNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701463; x=1773306263;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x29TSbD/9Rjft5iIHHQCYlLvvZ+GvP60F94LjzSbanc=;
        b=GedduQxzwX1V2+D79T3OO1IOYuybwXw5kSL+onyqu+4jsZXp4XBftIjX8tDEpZS4zT
         RQHDJqykXx5CXV0L7Bdpwd/YdYyqPcc0FjLPCu6r3MIs4DXFfdrd2CHzgzKd1Zr8aJ+P
         Q7f7xHx+b9rB40bsrITSoM7iP1SWAWJt5m18PBlR6/MvkXOHHdloys6JPBfJmlhFSAv5
         Qi0x9ZZfA5+fEMR+RZZNsC6Y1KOaxL8/KmcVSNX5ZxXYNSLK4pGYkpnvXkmGPv+hlaaq
         53k4hPFxK8bk+6U1TaW8skdGE8IavkyjHuavxdwObzBDd8MeWdGIDL3RQmylO0EkR/0I
         qFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbzSuP2916cFdBeAwEbteL0LqPMf/q6XLQDmmK14J0CpeWt3lLnhUJoBEEtnCYvBQ/pajynyT57jCBEOUsOSKJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwzCN5SzqvFSLFfGGHVzL58wavxoYgNckZoUQ/oHv6HqXrFo51x
	eI9+nQHddTo+xmHqkxq/pWLe3N0HbJDgt4V4u+CWmRrE2ml728u0ulhipY9h6O7GD/vKW30Ygqq
	hevKx
X-Gm-Gg: ATEYQzxg1RgfDBr7slKjdiqR/8j+M1Bpgk7ZT4h8+U9S4IDFYQJLmf3ti4MK6sfcRhR
	ZLWCSZfLjhHVy038jkkvRJ6+BhpVEc1DyHYOuaMkrBJyp+aCDGH6c/TRAgYnWZVLs3CdkPkxDCR
	HjasK43teDfogT0t9ooySYDfr8rR/s3wzjZcnM+gZS0xUR6gFUyXANvzhTeWclNR7mQot2dJvW8
	7YwGUmW2r+KF9mP+USiryFMNv85b73lYu8Ve2Q0bmxwIgRFCKCGh3vFADJa7MYOVY3YfwKyWlGf
	IB8pDy1W8g1pQ8cer019Xga4myZ6tJcVAk0Nuzo1+3CL/OwRhFJImEs/gCoVgchojwYco1l0ziy
	2TBxKvtvnLq8CtxtM/AHEM3ro9+h1k8qrQFafwqaewVhNlaCorfWuspfymxhkmGcvoeA6MULYf8
	APY49HlGb2eK9RWSA+SQl6+O6qyt/kqa4=
X-Received: by 2002:a5d:6409:0:b0:439:ca45:ae26 with SMTP id ffacd0b85a97d-439ca45af5cmr7015427f8f.18.1772701463400;
        Thu, 05 Mar 2026 01:04:23 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:5595:8450:af3:bbe3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439c6129017sm13508505f8f.31.2026.03.05.01.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:04:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  robh+dt
 <robh+dt@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  devicetree
 <devicetree@vger.kernel.org>,  linux-clk <linux-clk@vger.kernel.org>,
  linux-amlogic <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  Ronald Claveau
 <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
In-Reply-To: <20260305074328.639993-4-jian.hu@amlogic.com> (Jian Hu's message
	of "Thu, 5 Mar 2026 15:43:27 +0800")
References: <20260305074328.639993-1-jian.hu@amlogic.com>
	<20260305074328.639993-4-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 05 Mar 2026 10:04:21 +0100
Message-ID: <1jy0k6abqi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010425_268062_13A78994 
X-CRM114-Status: GOOD (  14.71  )
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

On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:

> Add the required clock controller nodes for Amlogic T7 SoC family:
> - SCMI clock controller
> - PLL clock controller
> - Peripheral clock controller
>

Again I think you should credit Ronald.

> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 125 ++++++++++++++++++++
>  1 file changed, 125 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 6510068bcff9..6ea1b583b13d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -6,6 +6,9 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/amlogic,t7-pwrc.h>
>  #include "amlogic-t7-reset.h"
> +#include <dt-bindings/clock/amlogic,t7-scmi.h>
> +#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
> +#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
>  
>  / {
>  	interrupt-parent = <&gic>;
> @@ -201,6 +204,33 @@ pwrc: power-controller {
>  		};
>  	};
>  
> +	sram@f7042000 {
> +		compatible = "mmio-sram";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x0 0xf7042000 0x100>;
> +
> +		scmi_shmem: sram@0 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0x0 0x100>;
> +		};
> +	};
> +
> +	firmware {
> +		scmi: scmi {
> +			compatible = "arm,scmi-smc";
> +			arm,smc-id = <0x820000c1>;
> +			shmem = <&scmi_shmem>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			scmi_clk: protocol@14 {
> +				reg = <0x14>;
> +				#clock-cells = <1>;
> +			};
> +		};
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -224,6 +254,42 @@ apb4: bus@fe000000 {
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>  
> +			clkc_periphs:clock-controller@0 {
> +				compatible = "amlogic,t7-peripherals-clkc";
> +				reg = <0x0 0x0 0x0 0x1c8>;
> +				#clock-cells = <1>;
> +				clocks = <&xtal>,
> +					 <&scmi_clk CLKID_SYS_CLK>,
> +					 <&scmi_clk CLKID_FIXED_PLL>,
> +					 <&scmi_clk CLKID_FCLK_DIV2>,
> +					 <&scmi_clk CLKID_FCLK_DIV2P5>,
> +					 <&scmi_clk CLKID_FCLK_DIV3>,
> +					 <&scmi_clk CLKID_FCLK_DIV4>,
> +					 <&scmi_clk CLKID_FCLK_DIV5>,
> +					 <&scmi_clk CLKID_FCLK_DIV7>,
> +					 <&hifi CLKID_HIFI_PLL>,
> +					 <&gp0 CLKID_GP0_PLL>,
> +					 <&gp1 CLKID_GP1_PLL>,
> +					 <&mpll CLKID_MPLL1>,
> +					 <&mpll CLKID_MPLL2>,
> +					 <&mpll CLKID_MPLL3>;
> +				clock-names = "xtal",
> +					      "sys",
> +					      "fix",
> +					      "fdiv2",
> +					      "fdiv2p5",
> +					      "fdiv3",
> +					      "fdiv4",
> +					      "fdiv5",
> +					      "fdiv7",
> +					      "hifi",
> +					      "gp0",
> +					      "gp1",
> +					      "mpll1",
> +					      "mpll2",
> +					      "mpll3";
> +			};
> +
>  			reset: reset-controller@2000 {
>  				compatible = "amlogic,t7-reset";
>  				reg = <0x0 0x2000 0x0 0x98>;
> @@ -234,6 +300,7 @@ watchdog@2100 {
>  				compatible = "amlogic,t7-wdt";
>  				reg = <0x0 0x2100 0x0 0x10>;
>  				clocks = <&xtal>;
> +
>  			};
>  
>  			periphs_pinctrl: pinctrl@4000 {
> @@ -269,6 +336,64 @@ uart_a: serial@78000 {
>  				status = "disabled";
>  			};
>  
> +			gp0:clock-controller@8080 {
> +				compatible = "amlogic,t7-gp0-pll";
> +				reg = <0x0 0x8080 0x0 0x20>;
> +				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			gp1:clock-controller@80c0 {
> +				compatible = "amlogic,t7-gp1-pll";
> +				reg = <0x0 0x80c0 0x0 0x14>;
> +				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			hifi:clock-controller@8100 {
> +				compatible = "amlogic,t7-hifi-pll";
> +				reg = <0x0 0x8100 0x0 0x20>;
> +				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			pcie:clock-controller@8140 {
> +				compatible = "amlogic,t7-pcie-pll";
> +				reg = <0x0 0x8140 0x0 0x1c>;
> +				clocks = <&scmi_clk CLKID_PCIE_OSC>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			mpll:clock-controller@8180 {
> +				compatible = "amlogic,t7-mpll";
> +				reg = <0x0 0x8180 0x0 0x28>;
> +				clocks = <&scmi_clk CLKID_FIXED_PLL_DCO>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			hdmi:clock-controller@81c0 {
> +				compatible = "amlogic,t7-hdmi-pll";
> +				reg = <0x0 0x81c0 0x0 0x20>;
> +				clocks = <&scmi_clk CLKID_HDMI_PLL_OSC>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			mclk:clock-controller@8300 {
> +				compatible = "amlogic,t7-mclk-pll";
> +				reg = <0x0 0x8300 0x0 0x18>;
> +				clocks = <&scmi_clk CLKID_MCLK_PLL_OSC>,
> +					 <&xtal>,
> +					 <&scmi_clk CLKID_FCLK_50M>;
> +				clock-names = "in0", "in1", "in2";
> +				#clock-cells = <1>;
> +			};
> +
>  			sec_ao: ao-secure@10220 {
>  				compatible = "amlogic,t7-ao-secure",
>  					     "amlogic,meson-gx-ao-secure",

-- 
Jerome

