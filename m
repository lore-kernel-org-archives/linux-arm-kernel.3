Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AF7D4335C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 02:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+jyeFz5qLcpNF1wQeUyeaIh19p1lD8bQtGka/s8n1Q=; b=to5QBEkqIz2g15158mYwjnXltF
	TWh1Oxuffx/lKUmnRGOPVIOS3Pi31BVO6EuXoYqTx3+m4U/yGbjtuFD04ZaPx/jLnwOYpaNX2pzFY
	rd3nvtw5R7rEk1O+yRQnS8RjTJQGyVui3QhtdhgNs0oT2ZnUplDjyqradraSL6ELNCU8VU/EdpieL
	aDzxmO19udC/HhDI1svZaWb+Xj5d3lKLLCEYBshuIj3GZ52y+1JmnA5SF3OjFxhIrxOavybV6iSgE
	3MUSBPRqxWH6rs/8rgXjiTNcPJcOu3f/BfYngpjbVhqvcnRwW/lpVtZDNLNFL9n6X2g0/xbR7WHED
	fRkG9RUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Esp-000000092U3-28kH;
	Fri, 08 Nov 2024 02:37:59 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Er3-0000000928X-0D8r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 02:36:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-720be27db27so1298861b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 18:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1731033368; x=1731638168; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s+jyeFz5qLcpNF1wQeUyeaIh19p1lD8bQtGka/s8n1Q=;
        b=ic52Cr0hOiQp6pQqDrqTmSCyZNhOuAsxogdwvOA644yIgvsUsRbTSjeRdpSTFqME7s
         X6kLHXxQcS8U8ZqPlLNWxqi5zZMTO9xlTphAIO0t5aG0QhNezwObRoAEVkBk/mlcZbnU
         a3Rw/dXFiI0OngZnMvbplK7KgdLgLU8FgOtyx0lSJ+dGiYJVSccvbF2xx2GNGgfTaHLO
         9uo/HeCSiRk7cw4wPnJ81zcSYEaNlWiYbHbNHLw3cuULry09oUv4FZB1+fvZ0ba74SZR
         3+9Yjcazkr5ydrb5qoVoR9+DR8NeY+xAlRCohDwTNtsM57Jfx7Y/Pffb3V+CPaV6IuTG
         OZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731033368; x=1731638168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+jyeFz5qLcpNF1wQeUyeaIh19p1lD8bQtGka/s8n1Q=;
        b=PgoszcxY9FeRE4htXCe1ADK7crmC1ExvkAGeXBMLeeEhmnTe7dLs4U0W8IPXKGat+/
         10+fhOmdt7XUGISK3aSzBH7FvEiyv0ZkOlLhb/cYZn+afLVs5sis8Rx/+5dpsRGJ8upY
         qdOeM7SnmA2bPY3q8T57q9n4kDd2MMPPGwUZc+kbj3+TYXMZtPGkyMKRMt58tb0EVfYo
         bAJ947CuZGI59Tg51gFMlrL9i+9E1NJutVveC1m1Q1uEDjDxbim71g4I/c5hAggz6iU2
         bgk8F9NbSDh4eiyd6B1ChFc6Ukg9N7bcnVv4TnnbWLK5XQWQcBRpu7JTV5CxZvR1NlV0
         A/1w==
X-Forwarded-Encrypted: i=1; AJvYcCXCaLAewanTuEOVBT2nvTqaHq7r03a8+FaoVjbVMHTK8+4fne8h/eJG13g19CGgBsnLoxXUsBYWJKryrfQzxaR1@lists.infradead.org
X-Gm-Message-State: AOJu0YyJDAN9QphX3TjVDM6IeNzNz1CZialTkKnIDWQnZV6lCAC7lk+Z
	D/FR7Rm5BBmArOsNSxLcSWrOBiSQ1kp1YDHdHoTKMx9CJ6AwSTSWArA0AlXlnZc=
X-Google-Smtp-Source: AGHT+IFkTBYmvuaObrf/NhsL6bgy8VSLe5N8eK2nw/1LxrZ9F9SMeNiCvMwnlaaGOCdkpjvr4IsokQ==
X-Received: by 2002:a05:6a00:1819:b0:71d:f510:b791 with SMTP id d2e1a72fcca58-724132cd1b1mr1832008b3a.12.1731033367828;
        Thu, 07 Nov 2024 18:36:07 -0800 (PST)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a17ed3sm2541107b3a.142.2024.11.07.18.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 18:36:07 -0800 (PST)
Date: Thu, 7 Nov 2024 18:36:04 -0800
From: Drew Fustini <drew@pdp7.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v4 3/3] riscv: dts: thead: Add TH1520 ethernet
 nodes
Message-ID: <Zy15FJZrOFA2t687@x1>
References: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
 <20241020-th1520-dwmac-v4-3-c77acd33ccef@tenstorrent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020-th1520-dwmac-v4-3-c77acd33ccef@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_183609_336428_80E68440 
X-CRM114-Status: GOOD (  18.93  )
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

On Sun, Oct 20, 2024 at 07:36:02PM -0700, Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add gmac, mdio, and phy nodes to enable the gigabit Ethernet ports on
> the BeagleV Ahead and Sipeed Lichee Pi 4a boards.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: change apb registers from syscon to second reg of gmac node,
>        add phy reset delay properties for beaglev ahead]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++++++++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 119 +++++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi              |  50 +++++++++
>  3 files changed, 260 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 86feb3df02c8..21c33f165ba9 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -15,6 +15,7 @@ / {
>  	compatible = "beagle,beaglev-ahead", "thead,th1520";
>  
>  	aliases {
> +		ethernet0 = &gmac0;
>  		gpio0 = &gpio0;
>  		gpio1 = &gpio1;
>  		gpio2 = &gpio2;
> @@ -98,6 +99,25 @@ &emmc {
>  	status = "okay";
>  };
>  
> +&gmac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_pins>;
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&mdio0 {
> +	phy0: ethernet-phy@1 {
> +		reg = <1>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
> +		reset-delay-us = <10000>;
> +		reset-post-delay-us = <50000>;
> +	};
> +};
> +
>  &padctrl_aosys {
>  	led_pins: led-0 {
>  		led-pins {
> @@ -116,6 +136,77 @@ led-pins {
>  };
>  
>  &padctrl0_apsys {
> +	gmac0_pins: gmac0-0 {
> +		tx-pins {
> +			pins = "GMAC0_TX_CLK",
> +			       "GMAC0_TXEN",
> +			       "GMAC0_TXD0",
> +			       "GMAC0_TXD1",
> +			       "GMAC0_TXD2",
> +			       "GMAC0_TXD3";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <25>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		rx-pins {
> +			pins = "GMAC0_RX_CLK",
> +			       "GMAC0_RXDV",
> +			       "GMAC0_RXD0",
> +			       "GMAC0_RXD1",
> +			       "GMAC0_RXD2",
> +			       "GMAC0_RXD3";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <1>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		mdc-pins {
> +			pins = "GMAC0_MDC";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <13>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		mdio-pins {
> +			pins = "GMAC0_MDIO";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <13>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +
> +		phy-reset-pins {
> +			pins = "GMAC0_COL"; /* GPIO3_21 */
> +			bias-disable;
> +			drive-strength = <3>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		phy-interrupt-pins {
> +			pins = "GMAC0_CRS"; /* GPIO3_22 */
> +			function = "gpio";
> +			bias-pull-up;
> +			drive-strength = <1>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
>  	uart0_pins: uart0-0 {
>  		tx-pins {
>  			pins = "UART0_TXD";
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> index 724d9645471d..8e76b63e0100 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -11,6 +11,11 @@ / {
>  	model = "Sipeed Lichee Module 4A";
>  	compatible = "sipeed,lichee-module-4a", "thead,th1520";
>  
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +	};
> +
>  	memory@0 {
>  		device_type = "memory";
>  		reg = <0x0 0x00000000 0x2 0x00000000>;
> @@ -45,6 +50,22 @@ &emmc {
>  	status = "okay";
>  };
>  
> +&gmac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_pins>, <&mdio0_pins>;
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&gmac1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_pins>;
> +	phy-handle = <&phy1>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
>  &gpio0 {
>  	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
>  			  "", "", "", "", "", "", "", "", "", "",
> @@ -78,6 +99,104 @@ &gpio3 {
>  			  "GPIO10";
>  };
>  
> +&mdio0 {
> +	phy0: ethernet-phy@1 {
> +		reg = <1>;
> +	};
> +
> +	phy1: ethernet-phy@2 {
> +		reg = <2>;
> +	};
> +};
> +
> +&padctrl0_apsys {
> +	gmac0_pins: gmac0-0 {
> +		tx-pins {
> +			pins = "GMAC0_TX_CLK",
> +			       "GMAC0_TXEN",
> +			       "GMAC0_TXD0",
> +			       "GMAC0_TXD1",
> +			       "GMAC0_TXD2",
> +			       "GMAC0_TXD3";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <25>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		rx-pins {
> +			pins = "GMAC0_RX_CLK",
> +			       "GMAC0_RXDV",
> +			       "GMAC0_RXD0",
> +			       "GMAC0_RXD1",
> +			       "GMAC0_RXD2",
> +			       "GMAC0_RXD3";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <1>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	gmac1_pins: gmac1-0 {
> +		tx-pins {
> +			pins = "GPIO2_18", /* GMAC1_TX_CLK */
> +			       "GPIO2_20", /* GMAC1_TXEN */
> +			       "GPIO2_21", /* GMAC1_TXD0 */
> +			       "GPIO2_22", /* GMAC1_TXD1 */
> +			       "GPIO2_23", /* GMAC1_TXD2 */
> +			       "GPIO2_24"; /* GMAC1_TXD3 */
> +			function = "gmac1";
> +			bias-disable;
> +			drive-strength = <25>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		rx-pins {
> +			pins = "GPIO2_19", /* GMAC1_RX_CLK */
> +			       "GPIO2_25", /* GMAC1_RXDV */
> +			       "GPIO2_30", /* GMAC1_RXD0 */
> +			       "GPIO2_31", /* GMAC1_RXD1 */
> +			       "GPIO3_0",  /* GMAC1_RXD2 */
> +			       "GPIO3_1";  /* GMAC1_RXD3 */
> +			function = "gmac1";
> +			bias-disable;
> +			drive-strength = <1>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	mdio0_pins: mdio0-0 {
> +		mdc-pins {
> +			pins = "GMAC0_MDC";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <13>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		mdio-pins {
> +			pins = "GMAC0_MDIO";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <13>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &sdio0 {
>  	bus-width = <4>;
>  	max-frequency = <198000000>;
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index cd835aea07d2..acfe030e803a 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -223,6 +223,12 @@ aonsys_clk: clock-73728000 {
>  		#clock-cells = <0>;
>  	};
>  
> +	stmmac_axi_config: stmmac-axi-config {
> +		snps,wr_osr_lmt = <15>;
> +		snps,rd_osr_lmt = <15>;
> +		snps,blen = <0 0 64 32 0 0 0>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -274,6 +280,50 @@ uart0: serial@ffe7014000 {
>  			status = "disabled";
>  		};
>  
> +		gmac1: ethernet@ffe7060000 {
> +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> +			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
> +			reg-names = "dwmac", "apb";
> +			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC1>;
> +			clock-names = "stmmaceth", "pclk";
> +			snps,pbl = <32>;
> +			snps,fixed-burst;
> +			snps,multicast-filter-bins = <64>;
> +			snps,perfect-filter-entries = <32>;
> +			snps,axi-config = <&stmmac_axi_config>;
> +			status = "disabled";
> +
> +			mdio1: mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		gmac0: ethernet@ffe7070000 {
> +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> +			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
> +			reg-names = "dwmac", "apb";
> +			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC0>;
> +			clock-names = "stmmaceth", "pclk";
> +			snps,pbl = <32>;
> +			snps,fixed-burst;
> +			snps,multicast-filter-bins = <64>;
> +			snps,perfect-filter-entries = <32>;
> +			snps,axi-config = <&stmmac_axi_config>;
> +			status = "disabled";
> +
> +			mdio0: mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		emmc: mmc@ffe7080000 {
>  			compatible = "thead,th1520-dwcmshc";
>  			reg = <0xff 0xe7080000 0x0 0x10000>;
> 
> -- 
> 2.34.1
> 

The dwmac-thead driver and dt binding have been applied to net-next [1]
so I have now applied this dts patch to thead-dt-for-next [2].

-Drew

[1] https://lore.kernel.org/linux-riscv/173085843050.764350.5609116722213276708.git-patchwork-notify@kernel.org/
[2] https://github.com/pdp7/linux/commit/7e756671a664b73b2a3c0cc37fd25abf6bcd851e

