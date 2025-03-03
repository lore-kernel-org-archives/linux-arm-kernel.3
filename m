Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABF5C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjPB87iikfu9izwaLqCSsdnIg9W8kOp9vImsqtjmRP4=; b=KD5YrOIoIYCZ9m5cuuAIfy1Z/q
	AUJ017NQO4T7xzIVLUF4wqcy9jB8W7VYH3Z1zYaPFzGzqFCCkO790trZem5oYnXKPim1uiIyQRoGb
	2f6bR1sSX4GjZn0TCDk4ikq3JEPh4l6SAhECoXm9cHCWUYtSwTIthcafDvET5QteVrQaGp2LMm5jJ
	oa/ksLSMQa/4jrKw/fJUBt4HYDwcvAfuQF7fSEa4QpDKHfTNAuxA7pBjBTfZq1YE81ooOO7TFHYa0
	XSnXYLhjobnV187TxGyjwQvapqGYww4iZ7Ch/YLAfq33aILEevlUMXwrkblv05VMB0qx0XQ4vtIF5
	WNEO17pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0ym-0000000HUlJ-070i;
	Mon, 03 Mar 2025 08:16:48 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0xC-0000000HUWq-025d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:15:12 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5238F37i3211325
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 02:15:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740989703;
	bh=YjPB87iikfu9izwaLqCSsdnIg9W8kOp9vImsqtjmRP4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MlPoNGwASaKO0WGFJJHt0Ifukx+kTqShmpvITTdrXq5ch3bjxXw0mc3NmRNH8ugMh
	 scGEkTc5lmKWiI6JizGCwNn/nLp1kCNVHYOpST/Ely4L4sAP2keJZUZOtRu5CjzkZO
	 CevEWz3RM/DtborZkJhNMO3SShEwxaheAOetsbtE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5238F2Zs025001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Mar 2025 02:15:03 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Mar 2025 02:15:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Mar 2025 02:15:02 -0600
Received: from [10.24.69.250] (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5238Evsr042138;
	Mon, 3 Mar 2025 02:14:58 -0600
Message-ID: <6b5839b3-84cb-42ee-8336-81ebf9b2e40d@ti.com>
Date: Mon, 3 Mar 2025 13:44:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am68-sk/k3-j721s2-mcu: Add
 bootph-all property to enable Ethernet boot
To: Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero
 Kristo <kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>
CC: <s-vadapalli@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250302153502.181832-1-c-vankar@ti.com>
 <20250302153502.181832-2-c-vankar@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250302153502.181832-2-c-vankar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_001510_148781_84DAB503 
X-CRM114-Status: GOOD (  14.40  )
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



On 02/03/25 21:05, Chintan Vankar wrote:
> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
> stage. Add bootph-all property to required nodes to enable Ethernet boot
> on AM68-SK and J721S2-EVM.
> 
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> ---
> 
> Link to v1:
> https://lore.kernel.org/r/20250106123122.3531845-2-c-vankar@ti.com/
> 
> Changes from v1 to v2:
> - No changes.
> 
>  arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 3 +++
>  arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> index 11522b36e0ce..8e9101dd2152 100644
> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> @@ -333,6 +333,7 @@ J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
>  			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
>  			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
>  		>;
> +		bootph-all;
>  	};
>  
>  	mcu_mdio_pins_default: mcu-mdio-default-pins {
> @@ -340,6 +341,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
>  			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
>  			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
>  		>;
> +		bootph-all;
>  	};
>  
>  	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
> @@ -615,6 +617,7 @@ &mcu_cpsw {
>  &davinci_mdio {
>  	phy0: ethernet-phy@0 {
>  		reg = <0>;
> +		bootph-all;
>  		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>  		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>  		ti,min-output-impedance;
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
> index bc31266126d0..29cd4b1ffbbf 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
> @@ -154,12 +154,14 @@ mcu_conf: bus@40f00000 {
>  		cpsw_mac_syscon: ethernet-mac-syscon@200 {
>  			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
>  			reg = <0x200 0x8>;
> +			bootph-all;
>  		};
>  
>  		phy_gmii_sel: phy@4040 {
>  			compatible = "ti,am654-phy-gmii-sel";
>  			reg = <0x4040 0x4>;
>  			#phy-cells = <1>;
> +			bootph-all;
>  		};
>  
>  	};
> @@ -538,6 +540,7 @@ mcu_cpsw: ethernet@46000000 {
>  		clocks = <&k3_clks 29 28>;
>  		clock-names = "fck";
>  		power-domains = <&k3_pds 29 TI_SCI_PD_EXCLUSIVE>;
> +		bootph-all;
>  

Since a child node has bootph-all, no need to put the same in the parent
hierarchy.

>  		dmas = <&mcu_udmap 0xf000>,
>  		       <&mcu_udmap 0xf001>,
> @@ -562,6 +565,7 @@ cpsw_port1: port@1 {
>  				label = "port1";
>  				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
>  				phys = <&phy_gmii_sel 1>;
> +				bootph-all;
>  			};
>  		};
>  


-- 
Regards
Vignesh
https://ti.com/opensource


