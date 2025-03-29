Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64310C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8aV5XPr6ImUB3IOdQYEYIOLXnDL8//GOv0UVJhYKUs=; b=eTFC44mcB7ZWB6bd4hr2gvFJme
	Emfp/4XRZrnZM36o6c5z5AeThndnX6caU6619BNBXpLSvoCfhmVqMkgqDFPj6laDazL//FsMdSwnP
	YskTz6ar3EeqQ8DbNkKoZp24xOETpMyXNs/kPi2yKoyL+/KC5Mjq2TPUiI320gafHGkYGgF+CsvCc
	DGLDsG8rW78+yG3x+Wu+1uoTWFyb6vB0TL5H32g5f0EQDFaU+FuIEia4wtxRR1IZ3ieJ4DwQaS4rG
	6ya5SmQpH8xBZGPPvAghLFlNcK3wayWkOTimly4cQCS68kKN41b9Eo9tcSemqS1H4zZP6sAGRjvh/
	IwHzCnnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyVIV-0000000F8e4-45Ik;
	Sat, 29 Mar 2025 12:28:23 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyVGl-0000000F8Ys-2BZx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 12:26:37 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52TCQNsO2392060
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Mar 2025 07:26:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743251183;
	bh=Q8aV5XPr6ImUB3IOdQYEYIOLXnDL8//GOv0UVJhYKUs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z94c6gKMTbNN1gKltoT/MiwDxsxzC2N8GT9NR5L7AdTYJixr40QBczJNPRPrAMvec
	 lSTfyy2Yd5o82Ex3V+NoiNdgTzvYqbOvbZnSfiBqiIRws71bmbuyM3hGHyms/WCYT/
	 X/Mp4VrQ3RztqgYUh11xr9yWJE4zHaI4AMq0G1Io=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52TCQNGk115406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 29 Mar 2025 07:26:23 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 29
 Mar 2025 07:26:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 29 Mar 2025 07:26:22 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52TCQLct049530;
	Sat, 29 Mar 2025 07:26:22 -0500
Date: Sat, 29 Mar 2025 17:56:21 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Parth Pancholi <parth105105@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Parth
 Pancholi <parth.pancholi@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-j784s4-main: Enable ACSPCIE
 outputs for PCIe interfaces
Message-ID: <20250329122621.jgydlrwi3gxesjw7@uda0492258>
References: <20250320122259.525613-1-parth105105@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250320122259.525613-1-parth105105@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_052635_692095_F4367339 
X-CRM114-Status: GOOD (  20.97  )
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

On Thu, Mar 20, 2025 at 01:22:59PM +0100, Parth Pancholi wrote:
> From: Parth Pancholi <parth.pancholi@toradex.com>
> 
> TI J784S4-based devices, such as the AM69 SoC, provide PCIE_REFCLK outputs
> from the SoC, which can be used to clock external PCIe endpoint devices.
> Each PCIE_REFCLK output is enabled via the corresponding ACSPCIE clock buffer,
> with each buffer supporting two PADs to provide reference clocks for two
> associated PCIe instances. The mappings are as follows:
>         - PCIe0 -> ACSPCIE1 PAD0
>         - PCIe1 -> ACSPCIE0 PAD0
>         - PCIe2 -> ACSPCIE1 PAD1
>         - PCIe3 -> ACSPCIE0 PAD1
> 
> This patch enables each ACSPCIE module and its corresponding PADs to ensure
> that all PCIE_REFCLK outputs are functional.
> 
> This change have been tested on an AM69-based custom hardware platform,
> where all four PCIe instances (PCIe0, PCIe1, PCIe2, and PCIe3) with the
> internal PCIE_REFCLK are utilized with various endpoint devices such as
> a WiFi card, NVMe SSD, and PCIe-to-USB bridge.
> 
> Link: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1484211/am69-pcie-refclk-out-and-acspcie-mappings
> Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
> ---
> This change depends on https://lore.kernel.org/all/20241209085157.1203168-1-s-vadapalli@ti.com/
> ---
>  .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi      | 10 ++++++++--
>  arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi             | 10 ++++++----
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 591609f3194c..854fdf7b771e 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -132,6 +132,11 @@ acspcie0_proxy_ctrl: clock-controller@1a090 {
>  			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
>  			reg = <0x1a090 0x4>;
>  		};
> +
> +		acspcie1_proxy_ctrl: clock-controller@1a094 {
> +			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
> +			reg = <0x1a094 0x4>;
> +		};
>  	};
>  
>  	main_ehrpwm0: pwm@3000000 {
> @@ -1067,11 +1072,12 @@ pcie0_rc: pcie@2900000 {
>  		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
>  		device_type = "pci";
>  		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
> +		ti,syscon-acspcie-proxy-ctrl = <&acspcie1_proxy_ctrl 0x1>;

This should be set to 0x3 - Enable output from PAD0 and PAD1 of
ACSPCIE1. Otherwise, we are depending on PCIe0 being probed before
PCIe2. If PCIe0 is probed after PCIe2, it will result in:
1.  PCIe2 => Writes 0x3 to ACSPCIE1 CTRL register
    since ti,syscon-acspcie-proxy-ctrl within pcie2_rc is 0x3
2. PCIe0 => Writes 0x1 to ACPSCIE1 CTRL register
    since ti,syscon-acspcie-proxy-ctrl within pcie0_rc is 0x1
As a result, ACSPCIE1 PAD1 required by PCIe2 will be disabled.


To summarize, as done below for pcie2_rc and pcie3_rc,
ti,syscon-acspcie-proxy-ctrl should be set to 0x3 at all places.

>  		max-link-speed = <3>;
>  		num-lanes = <4>;
>  		power-domains = <&k3_pds 332 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 332 0>;
> -		clock-names = "fck";
> +		clocks = <&k3_clks 332 0>, <&serdes1 CDNS_TORRENT_REFCLK_DRIVER>;
> +		clock-names = "fck", "pcie_refclk";
>  		#address-cells = <3>;
>  		#size-cells = <2>;
>  		bus-range = <0x0 0xff>;
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> index 0160fe0da983..ebbc315649d0 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> @@ -34,8 +34,8 @@ pcie2_rc: pcie@2920000 {
>  		max-link-speed = <3>;
>  		num-lanes = <2>;
>  		power-domains = <&k3_pds 334 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 334 0>;
> -		clock-names = "fck";
> +		clocks = <&k3_clks 334 0>, <&serdes1 CDNS_TORRENT_REFCLK_DRIVER>;
> +		clock-names = "fck", "pcie_refclk";
>  		#address-cells = <3>;
>  		#size-cells = <2>;
>  		bus-range = <0x0 0xff>;
> @@ -45,6 +45,7 @@ pcie2_rc: pcie@2920000 {
>  		dma-coherent;
>  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
>  		ti,syscon-pcie-ctrl = <&pcie2_ctrl 0x0>;
> +		ti,syscon-acspcie-proxy-ctrl = <&acspcie1_proxy_ctrl 0x3>;
>  		status = "disabled";
>  	};
>  
> @@ -63,8 +64,8 @@ pcie3_rc: pcie@2930000 {
>  		max-link-speed = <3>;
>  		num-lanes = <2>;
>  		power-domains = <&k3_pds 335 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 335 0>;
> -		clock-names = "fck";
> +		clocks = <&k3_clks 335 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
> +		clock-names = "fck", "pcie_refclk";
>  		#address-cells = <3>;
>  		#size-cells = <2>;
>  		bus-range = <0x0 0xff>;
> @@ -74,6 +75,7 @@ pcie3_rc: pcie@2930000 {
>  		dma-coherent;
>  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
>  		ti,syscon-pcie-ctrl = <&pcie3_ctrl 0x0>;
> +		ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
>  		status = "disabled";
>  	};

Regards,
Siddharth.

