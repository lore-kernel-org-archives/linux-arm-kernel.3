Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7052C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZFpKX74QzSf8VwJzMeMYNzZlpQCIYkfWvyMSBUV5s8=; b=H9gX2AMznbJxt4Z/V00uq08Eyu
	v8wfAVhplKxotJWkJxUfLtfGnetgvr8cZkYwwCaaOzY3hzIxfDbjn+UI++1H1Qac8jJdIS9VmfYzg
	C+UgE4GpRHEEO3DpNDFksvSeYtOq5l6LkOBxdB2bFjME5Y3my+129mvIxfiaPGdmcdHvhuJ4fa+VY
	dNgpYRYZFS2JNaaALE+/7z+Z/+2jccO1xlYefdCJ+TRYZaJGoQINb0WiO6VAndsc4EP/ACQXZx12i
	H6+5TStJ8iB67fomodjPxvsJ/elKNchO1k0xBAY8ljj5qpsoRn91XzfVzhAW6t/gI3FwPewL1dAjh
	orqgizMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ql1-00000000wS6-2a9U;
	Fri, 25 Apr 2025 21:38:51 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QX9-00000000v54-3lFK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:24:33 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLOS9F2260395
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745616268;
	bh=7ZFpKX74QzSf8VwJzMeMYNzZlpQCIYkfWvyMSBUV5s8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yULMhK4dtdTYcFwHCKm9wCcRfaT3nzN1SuxrCShWIdL6Hd07clLQngbTqYCI/fOCN
	 JmqYybR3DT5vrlxnLLuzeR6gMuh0NB07+BcwXTwAajkaBTSi5s+UOTPvdLfPqpSFof
	 JCb6Ufr9eWPDfT1ndOzhgq6e0DYf4AOFiUOrKPmE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLOSRd130571
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:24:28 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:24:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:24:27 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PLOR9v118465;
	Fri, 25 Apr 2025 16:24:27 -0500
Date: Fri, 25 Apr 2025 16:24:27 -0500
From: Nishanth Menon <nm@ti.com>
To: Chintan Vankar <c-vankar@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] arm64: dts: ti: k3-am68-sk/k3-j721s2-mcu: Add
 bootph-all property to enable Ethernet boot
Message-ID: <20250425212427.vvyocc4mmne5g3vq@vividly>
References: <20250425051055.2393301-1-c-vankar@ti.com>
 <20250425051055.2393301-2-c-vankar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250425051055.2393301-2-c-vankar@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_142432_021658_DDEA1D91 
X-CRM114-Status: GOOD (  18.09  )
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

On 10:40-20250425, Chintan Vankar wrote:
> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
> stage. Add bootph-all property to required nodes to enable Ethernet boot
> on AM68-SK and J721S2-EVM.
> 
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> ---
> 
> Link to v2:
> https://lore.kernel.org/r/20250302153502.181832-2-c-vankar@ti.com/
> 
> Changes from v2 to v3:
> - Removed "bootph-all" property from "mcu_cpsw" node as suggested by
>   Vignesh since child node already has that.
> 
>  arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 3 +++
>  arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 3 +++

Why does every board that uses j721s2 need to have bootph-all for
cpsw? Is network boot mandatory boot mode for all boards? That does
not sound right. Just do them in the board file please.

>  2 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> index 5fa70a874d7b..c402d5e288b0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> @@ -344,6 +344,7 @@ J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
>  			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
>  			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
>  		>;
> +		bootph-all;
>  	};
>  
>  	mcu_mdio_pins_default: mcu-mdio-default-pins {
> @@ -351,6 +352,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
>  			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
>  			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
>  		>;
> +		bootph-all;
>  	};
>  
>  	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
> @@ -626,6 +628,7 @@ &mcu_cpsw {
>  &davinci_mdio {
>  	phy0: ethernet-phy@0 {
>  		reg = <0>;
> +		bootph-all;
>  		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>  		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>  		ti,min-output-impedance;
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
> index bc31266126d0..218290b1840a 100644
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
> @@ -562,6 +564,7 @@ cpsw_port1: port@1 {
>  				label = "port1";
>  				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
>  				phys = <&phy_gmii_sel 1>;
> +				bootph-all;
>  			};
>  		};
>  
> -- 
> 2.34.1
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

