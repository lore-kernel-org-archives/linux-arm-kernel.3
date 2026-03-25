Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9851093176
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFE4IdhrhQ4/jt1l7Oh2DkjYFkz0UvJ0Wc/Jqw5MvzU=; b=wJpXBIciJv81kJDnaSa5i9zLmG
	zQZC6lkN3jkqyPR0vK+l+gCP5BFxpA5xtpygvum9Ej2l4/auCSKQ5JL8JSa2y8xJNKyOjrFEW3yc0
	nMbbjoiUdNWQqzQcuXr52ZZiHCPGWcb5deECXxTSv1EG7AE/s7a/ruP+qRupzFT+kJJCNVJ1+wd6q
	Jdv/Pk2ZTB+iypzZMKNpOTk/hW3QUPcWHjw3CmszZI187gD/ykgCfXrMdQkBSvCRY8ugwMZPuhdvx
	6//A0Rz/eYFuCpaCiUDopO1ITrg6FJctMPEn0fAAKlvz4DO7gXj8rf+ETOTZ5kG1FXmqX+W6AR65r
	sZSg/B+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5P4R-00000003Ydr-1vCX;
	Wed, 25 Mar 2026 14:18:55 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5P4O-00000003YdS-34s6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:18:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGCSYVsGqg4K+3t3VVX0Ma8OGN39Q2oKQ+F7UV4+MiuHBuUz8+IQ3gmQUcrmBbBJVKwfinP5BhVoJbkkqoezVMZqqAeV07UZJGfna+gD1eJHsHtb4vDIgLm0s8/PIjruRnkn4Wmgoi2z7Mj8gCFqLPmPJA0o9rF2SzB+X9gE3ucZ0vrIxdTMDXt6oOEwHDsHQGpJpWqOm2XIqgnAkaB3G6gRt7iOxmhEd8yMHNAHjKGUAeTn7hfUhB/NI1vMXPOO6YOp46+2mI9cXth0xfv5m4Fft52gSbbA4tUSOPE1YEqnGk3sn0OHcMyjmyeJ4oXMytg55z9weSD6W/tRslCmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFE4IdhrhQ4/jt1l7Oh2DkjYFkz0UvJ0Wc/Jqw5MvzU=;
 b=MqJMmbDkh/huDs1AQbKaQ/2L3VcBJJpO0Zb6HlplmpMCByFLeoXPJSLJI4kIikCHObNN8MGiYZigEa2tOmUzkFivuILRcb5+2cZTawyzoW50z6rimIA0DzoZy3sOA+DYrJCcXLXM5TwG9BFsXd9k3XeLDuxFcr+uYfa1oD0eQ8YgVtUbJaNOJec4AJ8vdWcRnUyfJssQ4lXkP6re9B1R6z1lSNLF000KoqrqcXc6pbyR9kxh1Wd1T2DkZWk4DvKl2sTW7/hRGWVql16i0vDlCG7PUKt2zizPHORvLZ6m9CzL6HpSlGhjoa9hvHcUiwPOPpBhGBosl2OJ7kG9tx1+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=denx.de smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFE4IdhrhQ4/jt1l7Oh2DkjYFkz0UvJ0Wc/Jqw5MvzU=;
 b=BFUwxH1hsF9lJt1HROyslaC2RYewdVdY+uZ79JXjLjoopIMp+BK1WuKWl82BA9RQoKzYofoAArIrcZ6zGXTL+v1j0XZwjeNti0X9lWOuTkX3VTIyYnSr5l6LrEg0nc3l05Rgo8x93mjMmYxmsGKxQAHGg9UpT7mdN2SgwKm8KsrxSvctdy5J9y5WDuSkzZB+WUu4XsBWHKsTcAdHnIJrqjcnarX2NU6W0bYrh/BrwsV265QZ3S60UVfNgmPE32WpdtaiZ1PEIlF+n6j847RDwAW0GWTH8SvNQAOWqhkW8xG4SUUadMymo8WOC6gVj9rVrGVGSef9/DgW3jF62w/tPA==
Received: from DUZPR01CA0219.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::16) by PAXPR10MB5255.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:28e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 14:18:44 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::a6) by DUZPR01CA0219.outlook.office365.com
 (2603:10a6:10:4b4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 14:18:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 25 Mar 2026 14:18:44 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:20:56 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:18:04 +0100
Message-ID: <e5bdb8fb-0dfe-4a78-bca9-89f060cd2886@foss.st.com>
Date: Wed, 25 Mar 2026 15:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp13 boards
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
	<marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>
References: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
 <20260123-upstream_uboot_properties-v5-4-5167929d5af5@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260123-upstream_uboot_properties-v5-4-5167929d5af5@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|PAXPR10MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e57442-6974-4081-2606-08de8a796c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ueDbsInH6X63WdVv+MOmH2eJVsns875d+Zag8kdxrD9cOm1OYX7+fGcVSRVw3Z5SeSxm3mV56aPKbnPlSDzr6zLf/QGlpQK93S+UDkNagi9ut6X3GPGk9Ca8trGgPXG+X6pIY9M8/3Oho2paFacVcX4bmh075FXRnyc8I1N2+wFHl1VowdgYkIpvU5L0OfRqi76immRa+0ym3DGLpL/6D2TAx8urEiOPvF2Kj48qIBDToJrFBO+lGFuQ8wUMtXumz5qejiZBEfZgfMMtbIj9O8dKxgLm4LoY2nACOXmoCWXsD2nVfD4QFdp/EFa8eoVKRaDOsJQfQhjTqU4bYaqM1V2fveomdr0U81DMZFGsIf5iyDQEeSgMUkeDI8xYvQAQhnvEE9pHWcs3M3qIVj8FnS53Qg9YhC0mLarGiPJKal7QhuC9EFTRiIN0oLcv0hN1jwybS4xqix2qBAjSgWchI6nxpgfPNbwX6IFSX0xREoCW0qVsrpI1J31KawOJe3yYlezf9QWGUoPAuTthSteNIONCOgusOhdlG7ZAt+lhJ/rodLbMQ3ikkA2c1DgeaLBTAEHzUf2cfG7kj5JXDcy+Ux6CzfMqyqTJEAcQfYzn5uS2eYVwlFpwu/pnIcnFK3nl7KauQqrvLyPthJTz/9balVxlRddrXmFlCEN5BKDpP4gPU2ImfoByU0FZ6dCFDuPrkKw6X/cvvNQcHhtCKmXgxdsGogyeLQuv5Tzj63vF6rewfDvSribLAnkLB2mvX0i7rZlDVDxAlEZttEjG3ywapw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wZebRlwG1BS7z0F5+tcGYEHhTJnz6AErBughDK64JBjE2lXpraaeEZyE5oOzcjGzgrGEL5Rs8HHRevkjOGqHaRqcxTB/WOYFZ3UDOdN1S8tqLpSgdw6xesDT3jp5vFKhnFDPwu6+2F1l+x/URr+tAWYjnD173jPfNzJXTa1AmCYFYV7rAaI1E5PLT68WRlLZr2tGSNy7+TG/4eg8ajR7d+zQrq7W5TDzkKQ7J3Ja7/t4/whNEpicKFAfjyx4XjHJhcAjb3XK4ZfQjwnYPJghe0rABKYIF2E9I69taEvhTOL8AQO2gb8f1fRolyTWaju3gcw0DV1RWeMRAJ4COpIVYyDCk5xVx5OB02VG8w5RmLoa7cdCAdqePMJH01GHRGTkDaDV9YIXh8XEWpRchG7Zq7n4WUVc3rMgip1xYo8kGbunNU/4YLIvUFkLE9aSYqgH
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:18:44.1721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e57442-6974-4081-2606-08de8a796c20
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_071852_925534_6E015C7D 
X-CRM114-Status: GOOD (  15.97  )
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

Hi Marek

Have you some remarks about DHCOR DT update ?

Thanks
Patrice

On 1/23/26 11:14, Patrice Chotard wrote:
> The bootph-all flag was introduced in dt-schema
> (dtschema/schemas/bootph.yaml) to define node usage across
> different boot phases.
> 
> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
> present in all boot stages, so add missing bootph-all phase flag
> to these nodes to support SD boot.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  arch/arm/boot/dts/st/stm32mp131.dtsi             |   4 +-
>  arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts |  21 ++++
>  arch/arm/boot/dts/st/stm32mp135f-dk.dts          | 101 ++++++++++++++++
>  arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi  | 145 +++++++++++++++++++----
>  4 files changed, 247 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
> index fd730aa37c22..80c97bc830eb 100644
> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
> @@ -30,7 +30,7 @@ arm-pmu {
>  	};
>  
>  	firmware {
> -		optee {
> +		optee: optee {
>  			method = "smc";
>  			compatible = "linaro,optee-tz";
>  			interrupt-parent = <&intc>;
> @@ -85,7 +85,7 @@ intc: interrupt-controller@a0021000 {
>  		      <0xa0022000 0x2000>;
>  	};
>  
> -	psci {
> +	psci: psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";
>  	};
> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> index 9902849ed040..526ab2e1a93c 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> @@ -350,6 +350,21 @@ timer@12 {
>  	};
>  };
>  
> +&uart4 {
> +	bootph-all;
> +};
> +
> +&uart4_pins_b {
> +	bootph-all;
> +
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};
> +
>  &usart1 { /* Expansion connector: RX:pin33 TX:pin37 */
>  	pinctrl-names = "default", "sleep", "idle";
>  	pinctrl-0 = <&usart1_pins_b>;
> @@ -367,6 +382,10 @@ &usart2 { /* Expansion connector: RX:pin10 TX:pin8 RTS:pin11 CTS:pin36 */
>  	status = "okay";
>  };
>  
> +&usbphyc {
> +	bootph-all;
> +};
> +
>  &usbh_ehci {
>  	phys = <&usbphyc_port0>;
>  	status = "okay";
> @@ -432,6 +451,7 @@ connector {
>  
>  /* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
>  &vdd_ldo2 {
> +	bootph-all;
>  	regulator-always-on;
>  	regulator-boot-on;
>  	regulator-min-microvolt = <3300000>;
> @@ -440,6 +460,7 @@ &vdd_ldo2 {
>  
>  /* LDO5 is carrier board 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
>  &vdd_sd {
> +	bootph-all;
>  	regulator-always-on;
>  	regulator-boot-on;
>  	regulator-min-microvolt = <3300000>;
> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> index 9764a6bfa5b4..83bc5ea90c3a 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> @@ -161,6 +161,10 @@ channel@12 {
>  	};
>  };
>  
> +&bsec {
> +	bootph-all;
> +};
> +
>  &crc1 {
>  	status = "okay";
>  };
> @@ -208,6 +212,42 @@ phy0_eth1: ethernet-phy@0 {
>  	};
>  };
>  
> +&gpioa {
> +	bootph-all;
> +};
> +
> +&gpiob {
> +	bootph-all;
> +};
> +
> +&gpioc {
> +	bootph-all;
> +};
> +
> +&gpiod {
> +	bootph-all;
> +};
> +
> +&gpioe {
> +	bootph-all;
> +};
> +
> +&gpiof {
> +	bootph-all;
> +};
> +
> +&gpiog {
> +	bootph-all;
> +};
> +
> +&gpioh {
> +	bootph-all;
> +};
> +
> +&gpioi {
> +	bootph-all;
> +};
> +
>  &i2c1 {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&i2c1_pins_a>;
> @@ -342,6 +382,7 @@ goodix: goodix-ts@5d {
>  
>  &iwdg2 {
>  	timeout-sec = <32>;
> +	bootph-all;
>  	status = "okay";
>  };
>  
> @@ -349,6 +390,7 @@ &ltdc {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&ltdc_pins_a>;
>  	pinctrl-1 = <&ltdc_sleep_pins_a>;
> +	bootph-some-ram;
>  	status = "okay";
>  
>  	port {
> @@ -358,6 +400,22 @@ ltdc_out_rgb: endpoint {
>  	};
>  };
>  
> +&optee {
> +	bootph-all;
> +};
> +
> +&pinctrl {
> +	bootph-all;
> +};
> +
> +&psci {
> +	bootph-some-ram;
> +};
> +
> +&rcc {
> +	bootph-all;
> +};
> +
>  &rtc {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&rtc_rsvd_pins_a>;
> @@ -369,6 +427,14 @@ rtc_lsco_pins_a: rtc-lsco-0 {
>  	};
>  };
>  
> +&scmi {
> +	bootph-all;
> +};
> +
> +&scmi_clk {
> +	bootph-all;
> +};
> +
>  &scmi_regu {
>  	scmi_vdd_adc: regulator@10 {
>  		reg = <VOLTD_SCMI_STPMIC1_LDO1>;
> @@ -392,6 +458,10 @@ scmi_v3v3_sw: regulator@19 {
>  	};
>  };
>  
> +&scmi_reset {
> +	bootph-all;
> +};
> +
>  &sdmmc1 {
>  	pinctrl-names = "default", "opendrain", "sleep";
>  	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
> @@ -402,9 +472,24 @@ &sdmmc1 {
>  	st,neg-edge;
>  	bus-width = <4>;
>  	vmmc-supply = <&scmi_vdd_sd>;
> +	bootph-pre-ram;
>  	status = "okay";
>  };
>  
> +&sdmmc1_b4_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&sdmmc1_clk_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
>  /* Wifi */
>  &sdmmc2 {
>  	pinctrl-names = "default", "opendrain", "sleep";
> @@ -436,6 +521,10 @@ &spi5 {
>  	status = "disabled";
>  };
>  
> +&syscfg {
> +	bootph-all;
> +};
> +
>  &timers3 {
>  	/delete-property/dmas;
>  	/delete-property/dma-names;
> @@ -517,9 +606,20 @@ &uart4 {
>  	pinctrl-2 = <&uart4_idle_pins_a>;
>  	/delete-property/dmas;
>  	/delete-property/dma-names;
> +	bootph-all;
>  	status = "okay";
>  };
>  
> +&uart4_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};
> +
>  &uart8 {
>  	pinctrl-names = "default", "sleep", "idle";
>  	pinctrl-0 = <&uart8_pins_a>;
> @@ -583,6 +683,7 @@ usbotg_hs_ep: endpoint {
>  };
>  
>  &usbphyc {
> +	bootph-all;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> index c18156807027..4efaca84a72c 100644
> --- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> @@ -54,6 +54,46 @@ vin: vin {
>  	};
>  };
>  
> +&bsec {
> +	bootph-all;
> +};
> +
> +&gpioa {
> +	bootph-all;
> +};
> +
> +&gpiob {
> +	bootph-all;
> +};
> +
> +&gpioc {
> +	bootph-all;
> +};
> +
> +&gpiod {
> +	bootph-all;
> +};
> +
> +&gpioe {
> +	bootph-all;
> +};
> +
> +&gpiof {
> +	bootph-all;
> +};
> +
> +&gpiog {
> +	bootph-all;
> +};
> +
> +&gpioh {
> +	bootph-all;
> +};
> +
> +&gpioi {
> +	bootph-all;
> +};
> +
>  &i2c3 {
>  	i2c-scl-rising-time-ns = <96>;
>  	i2c-scl-falling-time-ns = <3>;
> @@ -216,9 +256,18 @@ eeprom0wl: eeprom@58 {
>  
>  &iwdg2 {
>  	timeout-sec = <32>;
> +	bootph-all;
>  	status = "okay";
>  };
>  
> +&pinctrl {
> +	bootph-all;
> +};
> +
> +&psci {
> +	bootph-some-ram;
> +};
> +
>  &qspi {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&qspi_clk_pins_a
> @@ -229,6 +278,7 @@ &qspi_bk1_sleep_pins_a
>  		     &qspi_cs1_sleep_pins_a>;
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> +	bootph-all;
>  	status = "okay";
>  
>  	flash0: flash@0 {
> @@ -238,37 +288,35 @@ flash0: flash@0 {
>  		spi-max-frequency = <108000000>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> +		bootph-all;
>  	};
>  };
>  
> -/* Console UART */
> -&uart4 {
> -	pinctrl-names = "default", "sleep", "idle";
> -	pinctrl-0 = <&uart4_pins_b>;
> -	pinctrl-1 = <&uart4_sleep_pins_b>;
> -	pinctrl-2 = <&uart4_idle_pins_b>;
> -	/delete-property/dmas;
> -	/delete-property/dma-names;
> -	status = "okay";
> +&qspi_clk_pins_a {
> +	bootph-all;
> +	pins {
> +		bootph-all;
> +	};
>  };
>  
> -/* Bluetooth */
> -&uart7 {
> -	pinctrl-names = "default", "sleep", "idle";
> -	pinctrl-0 = <&uart7_pins_a>;
> -	pinctrl-1 = <&uart7_sleep_pins_a>;
> -	pinctrl-2 = <&uart7_idle_pins_a>;
> -	uart-has-rtscts;
> -	status = "okay";
> +&qspi_bk1_pins_a {
> +	bootph-all;
> +	pins {
> +		bootph-all;
> +	};
> +};
>  
> -	bluetooth {
> -		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
> -		max-speed = <3000000>;
> -		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
> -		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
> +&qspi_cs1_pins_a {
> +	bootph-all;
> +	pins {
> +		bootph-all;
>  	};
>  };
>  
> +&rcc {
> +	bootph-all;
> +};
> +
>  /* SDIO WiFi */
>  &sdmmc1 {
>  	pinctrl-names = "default", "opendrain", "sleep";
> @@ -312,3 +360,56 @@ &sdmmc2 {
>  	vqmmc-supply = <&vdd>;
>  	status = "okay";
>  };
> +
> +&syscfg {
> +	bootph-all;
> +};
> +
> +/* Console UART */
> +&uart4 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart4_pins_b>;
> +	pinctrl-1 = <&uart4_sleep_pins_b>;
> +	pinctrl-2 = <&uart4_idle_pins_b>;
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "okay";
> +};
> +
> +/* Bluetooth */
> +&uart7 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart7_pins_a>;
> +	pinctrl-1 = <&uart7_sleep_pins_a>;
> +	pinctrl-2 = <&uart7_idle_pins_a>;
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
> +		max-speed = <3000000>;
> +		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&vdd {
> +	bootph-all;
> +};
> +
> +&vddcpu {
> +	bootph-all;
> +};
> +
> +
> +&vddcore {
> +	bootph-all;
> +};
> +
> +&vdd_ddr {
> +	bootph-all;
> +};
> +
> +&vref_ddr {
> +	bootph-all;
> +};
> 


