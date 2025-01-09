Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5873E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 07:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUGcnIf9cYi8+pwx5gvvWyExvmGZh22RpY5DnhGmN30=; b=Nc4CDv/YLnLJeyoc7lfZY62dpk
	2exgtq4p2jPcaolIhK5LAGlv32yNOgGMbDDszkHIaeCW1emdxPvs8K/FmKrXE7zLqBWmO+XKRf7Pz
	eRk9Qj/bJEzyD8mkaWI0YdQhMqqMaGjZ+LCRiEtYABNkHRirGuSpQdTKib2z6aekQK31O7An+Tq8r
	ip6uJ9sTTKuRn7eIJ4DwP7Xubqkc49qemkxlLKVdduj4QAFFE3xfe8QoK3PKHKUkArD7CeZZAU8iR
	/OO/3RlAA7aUZFYpNe8AGMRCcja8mjk9swjaP7L9NGzWhQrI9ifSZ+iTa2eB+pCHE8UgJrjh2P2T6
	bwY3Rt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVmZD-0000000Az9C-1bje;
	Thu, 09 Jan 2025 07:02:55 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVmXs-0000000Az0y-2H4x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 07:01:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50971Ivu3126024
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 9 Jan 2025 01:01:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736406079;
	bh=NUGcnIf9cYi8+pwx5gvvWyExvmGZh22RpY5DnhGmN30=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PQSPyify1XyAiM5RZo1Hja1JZtp5sZjeP5MfwE/aw+7/+Gac2od7adF0qC2SK/sui
	 aOhsLp/BbNR/67A+I33fIPePhMUv3FMUi4CRJzKxAPOHcW5jDI18cjl+LmyPLMREy1
	 xI8kQ5JcDWC5QDjcW+FMFpC2B+OGNqSFuEMHZmOc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50971ICM126441;
	Thu, 9 Jan 2025 01:01:18 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 01:01:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 01:01:18 -0600
Received: from [10.249.135.49] ([10.249.135.49])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50971D7I056033;
	Thu, 9 Jan 2025 01:01:14 -0600
Message-ID: <05c79a3d-e185-453a-9071-4e830d0dae6b@ti.com>
Date: Thu, 9 Jan 2025 12:31:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am68-sk*: Add bootph-all property
 to necessary nodes to enable Ethernet boot
To: Roger Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero
 Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth
 Menon <nm@ti.com>
CC: <srk@ti.com>, <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250106123122.3531845-1-c-vankar@ti.com>
 <20250106123122.3531845-2-c-vankar@ti.com>
 <dcbda522-eeed-43a9-ab34-a41e5239c6e8@kernel.org>
Content-Language: en-US
From: "Vankar, Chintan" <c-vankar@ti.com>
In-Reply-To: <dcbda522-eeed-43a9-ab34-a41e5239c6e8@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_230132_792562_486AA66E 
X-CRM114-Status: GOOD (  13.29  )
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



On 1/7/2025 7:34 PM, Roger Quadros wrote:
> 
> 
> On 06/01/2025 14:31, Chintan Vankar wrote:
>> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
>> stage. Add bootph-all property to necessary nodes for CPSW to enable those
>> nodes during SPL stage along with later boot stages for AM68-SK.
>>
>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 5 +++++
>>   arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 2 ++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> index 11522b36e0ce..f1f8b228926d 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> @@ -333,6 +333,7 @@ J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
>>   			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
>>   			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
>>   		>;
>> +		bootph-all;
> 
> Shouldn't bootph-all be the first property in the DT nodes?

Hello Roger, You are correct that we used to add 'bootph-all' property
as the first property in DT nodes, but after seeing this comment of
Vignesh at here:
https://lore.kernel.org/r/79bc9fe7-0a35-4f07-b34e-367a4b1e1755@ti.com/,
I have moved it to the end of all required property.

> 
>>   	};
>>   
>>   	mcu_mdio_pins_default: mcu-mdio-default-pins {
>> @@ -340,6 +341,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
>>   			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
>>   			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
>>   		>;
>> +		bootph-all;
>>   	};
>>   
>>   	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
>> @@ -610,11 +612,13 @@ &main_sdhci1 {
>>   &mcu_cpsw {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
>> +	bootph-all;
>>   };
>>   
>>   &davinci_mdio {
>>   	phy0: ethernet-phy@0 {
>>   		reg = <0>;
>> +		bootph-all;
>>   		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>>   		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>>   		ti,min-output-impedance;
>> @@ -624,6 +628,7 @@ phy0: ethernet-phy@0 {
>>   &cpsw_port1 {
>>   	phy-mode = "rgmii-rxid";
>>   	phy-handle = <&phy0>;
>> +	bootph-all;
>>   };
>>   
>>   &mcu_mcan0 {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> index bc31266126d0..cfae226d3c63 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> @@ -154,12 +154,14 @@ mcu_conf: bus@40f00000 {
>>   		cpsw_mac_syscon: ethernet-mac-syscon@200 {
>>   			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
>>   			reg = <0x200 0x8>;
>> +			bootph-all;
>>   		};
>>   
>>   		phy_gmii_sel: phy@4040 {
>>   			compatible = "ti,am654-phy-gmii-sel";
>>   			reg = <0x4040 0x4>;
>>   			#phy-cells = <1>;
>> +			bootph-all;
>>   		};
>>   
>>   	};
> 

