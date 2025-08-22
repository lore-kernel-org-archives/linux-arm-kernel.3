Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6EDCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDdnfXoloJINmIvwfPzsYTluOC1eKh/fWFgnitumSSw=; b=sHsfxp0ATeCnGHGfYZIP9OfU9L
	4xw1q8RAKyCEuE9VhlwBb5jnm5xBcn4ZFE+CC69tC37/USjwfuAfvRkR7VvBRHwHEo02L9V7T3VFi
	edOvT6OAasAHSXU4MgMoRYdGpGvNR9PAvkvoUBNqNJs1XPBnCHaS7MpR3pY1YMJL1UAarNR5631aC
	uZzUWjCOwA+NVh1iYxLU1TRWpytjB4VUlIhcHUu1XKydyBVC2RfeazhzpqDbxqLAXne62KWd3hiKH
	zx187/l3JS4G9gc/aJx6/xetQEO/rpxJKJkYLGsqJrmV+KGblr81WuUtPr4/juu0UBwfXHMlfj/SP
	kmWb8l6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphxV-00000004EnL-1kes;
	Sat, 23 Aug 2025 06:42:37 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upWWo-00000003JSb-3iJW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 18:30:20 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MIUFZF307579;
	Fri, 22 Aug 2025 13:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755887415;
	bh=aDdnfXoloJINmIvwfPzsYTluOC1eKh/fWFgnitumSSw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WTRApP/29ZNup8OZNgqOVK0SmeEKWVz8r/P0dgJH5Gk/fqzZsJ7BISEiCVTWtJsW0
	 PxqVMdcYemAm5ZbJnC6wmn7VUHd1TrTbLNkYBcJg4zw4QNAZnK7cIyZjfGGKokpbSi
	 MIwwyqvg7W8+ord4gn/dP4zbSQn7GifqaAvVKamk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MIUFx13467809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 13:30:15 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 13:30:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 13:30:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MIUEv5047367;
	Fri, 22 Aug 2025 13:30:14 -0500
Date: Fri, 22 Aug 2025 13:30:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <s-k6@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62d2-evm: Add support for OSPI flash
Message-ID: <20250822183014.apyvqws4afiqiymb@specks>
References: <20250813090300.733295-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250813090300.733295-1-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_113019_057224_CE63F2B5 
X-CRM114-Status: GOOD (  17.34  )
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

On 14:33-20250813, Paresh Bhagat wrote:
> AM62D2 EVM has S28HS512T 64 MiB Octal SPI NOR flash connected to the
> OSPI interface. Add support for the flash and describe the partition
> information as per bootloader.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
> Boot logs
> https://gist.github.com/paresh-bhagat12/262d8c64e692d22c4e48363d246fb083

We already have issues with am62d that needs fixing:
cpu cpu0: _of_add_opp_table_v2: no supported OPPs
cpu cpu0: OPP table can't be empty

and

Please enable defconfig for this device
arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:       typec_pd0: usb-power-controller@3f {

We can look at adding features for am62d after the above are done.
> 
> Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
> Schematics Link-https://www.ti.com/lit/zip/sprcal5
> 
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 86 ++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> index daea18b0bc61..aa943ef52fb5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -25,6 +25,7 @@ aliases {
>  		rtc0 = &wkup_rtc0;
>  		ethernet0 = &cpsw_port1;
>  		ethernet1 = &cpsw_port2;
> +		spi0 = &ospi0;
>  	};
>  
>  	chosen {
> @@ -367,6 +368,26 @@ usr_led_pins_default: usr-led-default-pins {
>  			AM62DX_IOPAD(0x0244, PIN_INPUT, 7) /* (D18) MMC1_SDWP.GPIO1_49 */
>  		>;
>  	};
> +
> +	ospi0_pins_default: ospi0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x0000, PIN_OUTPUT, 0) /* (L22) OSPI0_CLK */
> +			AM62DX_IOPAD(0x002c, PIN_OUTPUT, 0) /* (H21) OSPI0_CSn0 */
> +			AM62DX_IOPAD(0x0030, PIN_OUTPUT, 0) /* (G19) OSPI0_CSn1 */
> +			AM62DX_IOPAD(0x0034, PIN_OUTPUT, 0) /* (K20) OSPI0_CSn2 */
> +			AM62DX_IOPAD(0x0038, PIN_OUTPUT, 0) /* (G20) OSPI0_CSn3 */
> +			AM62DX_IOPAD(0x000c, PIN_INPUT, 0) /* (J21) OSPI0_D0 */
> +			AM62DX_IOPAD(0x0010, PIN_INPUT, 0) /* (J18) OSPI0_D1 */
> +			AM62DX_IOPAD(0x0014, PIN_INPUT, 0) /* (J19) OSPI0_D2 */
> +			AM62DX_IOPAD(0x0018, PIN_INPUT, 0) /* (H18) OSPI0_D3 */
> +			AM62DX_IOPAD(0x001c, PIN_INPUT, 0) /* (K21) OSPI0_D4 */
> +			AM62DX_IOPAD(0x0020, PIN_INPUT, 0) /* (H19) OSPI0_D5 */
> +			AM62DX_IOPAD(0x0024, PIN_INPUT, 0) /* (J20) OSPI0_D6 */
> +			AM62DX_IOPAD(0x0028, PIN_INPUT, 0) /* (J22) OSPI0_D7 */
> +			AM62DX_IOPAD(0x0008, PIN_INPUT, 0) /* (L21) OSPI0_DQS */
> +		>;
> +		bootph-all;
> +	};
>  };
>  
>  &mcu_gpio0 {
> @@ -613,3 +634,68 @@ &c7x_0 {
>  &main_rti4 {
>  	status = "reserved";
>  };
> +
> +&fss {
> +	status = "okay";
> +};
> +
> +&ospi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ospi0_pins_default>;
> +	status = "okay";
> +
> +	flash@0{
> +		compatible = "jedec,spi-nor";
> +		reg = <0x0>;
> +		spi-tx-bus-width = <8>;
> +		spi-rx-bus-width = <8>;
> +		spi-max-frequency = <25000000>;
> +		cdns,tshsl-ns = <60>;
> +		cdns,tsd2d-ns = <60>;
> +		cdns,tchsh-ns = <60>;
> +		cdns,tslch-ns = <60>;
> +		cdns,read-delay = <4>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "ospi.tiboot3";
> +				reg = <0x0 0x80000>;
> +			};
> +
> +			partition@80000 {
> +				label = "ospi.tispl";
> +				reg = <0x80000 0x200000>;
> +			};
> +
> +			partition@280000 {
> +				label = "ospi.u-boot";
> +				reg = <0x280000 0x400000>;
> +			};
> +
> +			partition@680000 {
> +				label = "ospi.env";
> +				reg = <0x680000 0x40000>;
> +			};
> +
> +			partition@6c0000 {
> +				label = "ospi.env.backup";
> +				reg = <0x6c0000 0x40000>;
> +			};
> +
> +			partition@800000 {
> +				label = "ospi.rootfs";
> +				reg = <0x800000 0x37c0000>;
> +			};
> +
> +			partition@3fc0000 {
> +				label = "ospi.phypattern";
> +				reg = <0x3fc0000 0x40000>;
> +				bootph-all;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.34.1
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

