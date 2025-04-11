Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09040C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQt1LKmj/+qjMj0wrgFFc+//+1h0SOGHI/boMynvsHQ=; b=lQEuoy+91QppkECfWsV4jZhNn4
	46QHsAS+H6mix6cz2An3lBy4mLXXxI0jp91LHved+nrfXSUYlWNSq8Ex6fCm2n/rUvQaxZeJ8KXEL
	zhgzGOEk4YPpkldty2EOR+ST1Lv6u27WGW6knVjALvWOpEfTj1LzD+TQDVfTgD37sFdoqykyac3Xj
	+TQUCRSqrHKuz/27N6H6qU0ZIGILkxp4Aqpm9fUpzSv9yg/gW1DGC9+aGsccAa0xIjpaVI+uP+lA4
	YIq2vjEnfDPn1vhuo5YLBbkeGZMG4uSa7zuaDkyqMRNsrEwMlM5iTorig0Xl3/bzHdQ0/pRDHswEZ
	IZWFPTrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DXn-0000000Dkfl-1OAR;
	Fri, 11 Apr 2025 12:31:39 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DVy-0000000DkPN-1wrG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:29:48 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BCTgBg1562585
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 07:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744374582;
	bh=rQt1LKmj/+qjMj0wrgFFc+//+1h0SOGHI/boMynvsHQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rB7B1R3i3tIqzJqqnUlAGxkjDL0V2iq4DIQvl6uPh4yjHSTMQOpij0p0+yfCSYqtC
	 0gjg91tcuYXY/YJ9FMcK7Mnd9sRgutdupL7H+luKGcXweg/Vryye2WthNhHFf/HUsj
	 J5YTRjtlWr67xudcDg5ZpZJH+Q6AiJuij96+cuL8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BCTgBO002481
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 07:29:42 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 07:29:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 07:29:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BCTgSG012041;
	Fri, 11 Apr 2025 07:29:42 -0500
Date: Fri, 11 Apr 2025 07:29:42 -0500
From: Nishanth Menon <nm@ti.com>
To: Dominik Haller <d.haller@phytec.de>
CC: <robh@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vigneshr@ti.com>, <m-chawdhry@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <upstream@lists.phytec.de>
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add basic support for
 phyBOARD-Izar-AM68x
Message-ID: <20250411122942.3gh2prc6cqrynfva@darkish>
References: <20250411101004.13276-1-d.haller@phytec.de>
 <20250411101004.13276-2-d.haller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250411101004.13276-2-d.haller@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_052946_597468_518DFDF2 
X-CRM114-Status: GOOD (  16.30  )
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

Quick look comments below.

On 12:10-20250411, Dominik Haller wrote:
> The phyCORE-AM68x/TDA4x [1] is a SoM (System on Module) featuring TI's
> AM68x/TDA4x SoC. It can be used in combination with different carrier
> boards. This module can come with different sizes and models for DDR,
> eMMC, SPI NOR Flash and various SoCs from the AM68x/TDA4x (J721S2) family.
> 
> A reference carrier board design, called phyBOARD-Izar is used for the
> phyCORE-AM68x/TDA4x development kit [2].
> 
>     Supported features:
>       * Debug UART
>       * 2x SPI NOR Flash
>       * eMMC
>       * 2x Ethernet
>       * Micro SD card
>       * I2C EEPROM
>       * I2C RTC
>       * 2x I2C GPIO Expander
>       * LEDs
>       * USB 5 Gbit/s
>       * PCIe

Can we drop the whitespace prefix?

> 
> For more details see the product pages for the SoM and the
> development kit:
> 
> [1] https://www.phytec.eu/en/produkte/system-on-modules/phycore-am68x-tda4x/
> [2] https://www.phytec.eu/en/produkte/development-kits/phyboard-izar/
> 
> Signed-off-by: Dominik Haller <d.haller@phytec.de>
> ---

Could you share the bootlog in the diffstat along with output of
deferred_devices Using the default defconfig -> I want to make sure
there are no defconfig updates needed.

>  arch/arm64/boot/dts/ti/Makefile               |   1 +
>  .../boot/dts/ti/k3-am68-phyboard-izar.dts     | 576 +++++++++++++++++
>  .../boot/dts/ti/k3-am68-phycore-som.dtsi      | 594 ++++++++++++++++++
>  3 files changed, 1171 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
> 

[...]

> +
> +#include "k3-serdes.h"
> +
> +/ {
> +	compatible = "phytec,am68-phyboard-izar", "ti,j721s2";
> +	model = "PHYTEC phyBOARD-Izar-AM68x";
> +
> +	aliases {
> +		ethernet0 = &cpsw_port1;
> +		mmc1 = &main_sdhci1;
> +		serial0 = &wkup_uart0;
> +		serial1 = &mcu_uart0;
> +		serial2 = &main_uart8;
> +		serial3 = &main_uart1;
> +		serial4 = &main_uart2;


Could you order this slightly differently:
serial
mmc
ethernet

> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:115200n8";

= &main_uart8

> +	};
> +
> +	transceiver1: can-phy1 {
> +		compatible = "ti,tcan1043";
> +		#phy-cells = <0>;
> +		max-bitrate = <8000000>;
> +	};
> +

[...]

> +
> +&serdes_refclk {
> +	clock-frequency = <100000000>;
> +};
> +
> +&serdes0 {
> +	status = "okay";

Documentation/devicetree/bindings/dts-coding-style.rst
	Add an EoL

> +	serdes0_pcie_link: phy@0 {
> +		reg = <0>;
> +		cdns,num-lanes = <1>;
> +		#phy-cells = <0>;
> +		cdns,phy-type = <PHY_TYPE_PCIE>;
vendor specific properties come last



> +		resets = <&serdes_wiz0 1>;
> +	};
Add an EoL

> +	serdes0_usb_link: phy@1 {
> +		reg = <1>;
> +		cdns,num-lanes = <1>;
> +		#phy-cells = <0>;
> +		cdns,phy-type = <PHY_TYPE_USB3>;

Same.

> +		resets = <&serdes_wiz0 2>;
> +	};
> +};
> +

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

