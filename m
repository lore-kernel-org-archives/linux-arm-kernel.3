Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23993CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyOYTUE4l1t+MKZP+bda4vZAMLmmZZddCtk7fNRMW8o=; b=OuBfkSktUVNmPwZhTcK0YmPpOX
	Dtb3R3YXIb9o3ASPZRqrRlJ/8M+oSjJ3XMkz7vevDj8X/iM1s7875dGxQTGeXJpkquMOyYLVA/d7f
	ibAG5aWwgtx6zwrKS2mspf2ZBdz4j7c74Y5mSm7CWpS9vijBR0Zkdn2jU31oHZfTRh02tcArP/wZy
	K1Rbyf0hhbzS3W3DovKxD2SFooD6HKZWmXE03dvTpbLZDzenfZqkNl4g3Lh4CkI+8qEeDBkG/onbd
	x8cs41XllHuO6pAeUr9H30VmSOpczsdOGPjD3iPL4NwASNK3l9QBrSoSp2iqKd31BSJx/iNchSUI5
	a/HJXyag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHOF-0000000Gc8H-3n3Y;
	Tue, 05 May 2026 15:08:51 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHOD-0000000Gc7X-1Obu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:08:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVNvuauA9n6MNqlomJjozE/YmcsRjhw1wazDsuQYo0hVUdbSqAwNpLi/1FfZwktxRBwZCudzzONzwC2niYbZImbM5rK0YeIbo6c3jrmGkixa0nyxLd4wbfgI73Mjim5gtSpafEOI+8Hh6W0ywk5Kdn5/GReRDy5NaDIepURH6ntJNG95ZhHMHw+OAhaVfYWi09FoYFfNkuL+dhqenBTc0EasVx8FIr4npSsI34n7B6k2HjppCqPjcFp0eljnTKCMMqHDcJ39FCOfsbYNtZnCG+HaqGjB5LC5PFOzGKD0S61pcgXG1YRwSwxg1eRQUeG1RbigeqHV0ScixGd7pA6eyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyOYTUE4l1t+MKZP+bda4vZAMLmmZZddCtk7fNRMW8o=;
 b=tn8P0klLvLvUuX9wcNoTbRbBTdvX0Bd9+hl85Y27PDAMkjwoNh8E0MsJRe/teLC4gn8tsLhL9nndx7tsAX4H+TWVn/AhgTy/zwHHPPIxh2wtCOu9WdD78+qxlIVmRPGxXYUjJsACw4OWA+uImjXzntXoLwHUvaDaPcM5mX34/ppneyEjTOUuLDobO7IS6gQae//yvrViHn1wEry3oqaK7P3+sCHDLgT/vwRpwmsW376ZuOvAT7WqPy+6j3rvJN3Z7/Fpyt/9YF4hz8xumcCMU0U/B1+9tkhzUF37Ip2edT0tCs2t1GN7YLRxygP057suwPKf/DZGAVLbgVSR+Ynl0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyOYTUE4l1t+MKZP+bda4vZAMLmmZZddCtk7fNRMW8o=;
 b=qeGUWAgklMvLcMQV1XlAr/1RTVHNvVLbWNuy2RzkO2dy/2m5D6VJi5M+PUlTc1HfUOAHX4rXdMDgAHF+11ojXJhYtTNffBFXBBjoFFpqr8Gsx9PI6pn8ZJgu6sR4BSlBN8W6zII+tt+ypOxxgi7B4yennVIOXxl2rvU463DpZsQ=
Received: from BL1P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::30)
 by CY8PR10MB7316.namprd10.prod.outlook.com (2603:10b6:930:7a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 15:08:42 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:208:2c7:cafe::85) by BL1P222CA0025.outlook.office365.com
 (2603:10b6:208:2c7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 15:08:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 15:08:41 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 10:08:41 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 10:08:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 10:08:41 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645F8fpj3514968;
	Tue, 5 May 2026 10:08:41 -0500
Message-ID: <177b9d86-c9d3-4161-bd31-7c9f03d3b7ff@ti.com>
Date: Tue, 5 May 2026 10:08:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add k3-am62l3-beaglebadge
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
References: <20260501233148.4180391-1-jm@ti.com>
 <20260501233148.4180391-3-jm@ti.com>
 <1403a0f5-995f-4002-adb0-c7c9b8479da1@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <1403a0f5-995f-4002-adb0-c7c9b8479da1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|CY8PR10MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: ae019e4f-9143-43f9-2633-08deaab831dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: AGVf71maQZHNNR22n0VNXbAwu+aTozUowtDZblCQ91TxAU9Ehs9JfTGiOdcOxPZXBeIWlYHVo2t/MN9pO4wb7m9zJ+EVavUbd5UtvJGrm9BL0V+6Heo3+lEodMbdA3ZS8/Ijl3r+YS/jgVyneM3LjMG8qlOeOrrLoxPONAmtVe8OSNPGyK0ifbWFtyxNhUbigZU2aexOpP93ow+vUnTQ+KQ21OpMPYXMBnhCeY3QfJbkt8rfMv6y2I+Lo0sTB4kHGbGwXtzlOh4eVeZvGMokxMYM9yU7i4GHCrn8h/wwB8T3KxY5gSJhL54QER/aR2MhJbHzmGGXmiadXzbRpHukZyPpUTtFbxSTETONubLCLCDYUq/C5TVNx/xnzYaSjwDxUYUhYCBR5XP+jgle6HJ4nK/MSFFcuW/beMNvjsL5kz5wn4buTNyXi+YwJW5maxO4Wcwt048wkpNteF6z7CTs+Au4uHXmn7/Or4WRpgQx9VWQiGx+25aTtDYe0dpgFaIdQLgQRdOm3p/Z24RJRW37AWkTsomD1aZi6/PGkS3YWPNdot3C1hCQKihcyer34ou4lUe6fYmFX9H9l5FVHlLHtfZtxG9ZKWMu1G/1ABDUJu41Qbe88JHUaa0QuFStpsQUGPvB0FG4AG4PgayNQJyfbC8nZ+DvhDubCZpBHF7m2fUc4NKHAuN4fqRKOnVUUX3f
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1vfBm3qaCxxkbeObXWApt+V24ijbzfwOoJzNW4VpCAkksaVyDqZawppnOxelEFJv4DG0UDmti+GRLcASX2KnJRnP2WTCDxpY4QK3b5ENRXgfKC8JepCEteZUxKl63U/yTEgZgllsBBR2VJp+7V/BxnuOazxcZ+ergSMEq5cGCCjxiAfXWpRp0k+jiiBkkc0UjYLTfV4IvUqx2GEHu8D/gbjbAbSRJYniEFMbphAeaUPQ7Ia7i9tTtB3VsPmoJ+i7DhTUmH5LiEPn6uGZA07CbSo797CIh1/+6NvdK1OmLEGVJr8zgzO3fvNH21cgri5QjnZGEyL8VU6B5kdXKR8FWQra1OU9wAioMQhr/Kez0v8s6LbAOdPJ57Dtj645/+JimIsCOl7Qzyf348DJmTR3xyLdT7dITolV/9IVfJxQMK9bwDlv/bPuv8lKJeI9scE7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 15:08:41.9326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae019e4f-9143-43f9-2633-08deaab831dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_080849_407337_FDB528AD 
X-CRM114-Status: GOOD (  13.31  )
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

Hi Andrew,

On 5/4/26 10:18 AM, Andrew Davis wrote:
> On 5/1/26 6:31 PM, Judith Mendez wrote:
>> BeagleBoard.org BeagleBadge is a compact, affordable open source
>> hardware single board computer based on the Texas Instruments AM62L3
>> SoC designed for IoT and embedded applications with low power 
>> consumption.
>> Expansion is provided over open standards based headers including
>> QWIIC and GPIO interfaces.
>>
>> https://beagleboard.org/
>> https://github.com/beagleboard/BeagleBadge
>>
>> Co-developed-by: Andrew Davis <afd@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/Makefile            |   1 +
>>   arch/arm64/boot/dts/ti/k3-am62l3-badge.dts | 655 +++++++++++++++++++++
>>   2 files changed, 656 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>>
>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/ 
>> Makefile
>> index 5269c9619b65..aa714777a3a0 100644
>> --- a/arch/arm64/boot/dts/ti/Makefile
>> +++ b/arch/arm64/boot/dts/ti/Makefile
>> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
>>   # Boards with AM62Lx SoCs
>>   dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
>> +dtb-$(CONFIG_ARCH_K3) += k3-am62l3-badge.dtb
>>   # Boards with AM62Px SoC
>>   dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts b/arch/arm64/ 
>> boot/dts/ti/k3-am62l3-badge.dts
>> new file mode 100644
>> index 000000000000..0125d3fec5e9
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>> @@ -0,0 +1,655 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * https://www.beagleboard.org/boards/beaglebadge
>> + *
>> + * Copyright (C) 2026 Texas Instruments Incorporated - https:// 
>> www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/net/ti-dp83867.h>
>> +#include "k3-am62l3.dtsi"
>> +#include "k3-pinctrl.h"
>> +
>> +/ {
>> +    compatible = "beagle,am62l3-badge", "ti,am62l3";
>> +    model = "BeagleBoard.org BeagleBadge";
>> +
>> +    chosen {
>> +        stdout-path = &uart0;
>> +    };
>> +
>> +    aliases {
>> +        gpio0 = &gpio0;
>> +        gpio1 = &gpio2;
>> +        gpio2 = &wkup_gpio0;
>> +        i2c0 = &i2c0;
>> +        i2c1 = &i2c1;
>> +        i2c4 = &wkup_i2c0;
>> +        mmc1 = &sdhci1;
>> +        mmc2 = &sdhci2;
>> +        serial3 = &uart1;
>> +        usb0 = &usb0;
>> +        usb1 = &usb1;
>> +    };
>> +
>> +    memory@80000000 {
>> +        /* 256MB */
>> +        reg = <0x00000000 0x80000000 0x00000000 0x10000000>;
>> +        device_type = "memory";
>> +        bootph-all;
>> +    };
>> +
>> +    gpio_keys: gpio-keys {
>> +        compatible = "gpio-keys";
>> +        autorepeat;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&usr_button_default_pins>;
>> +
>> +        button-select {
>> +            label = "SELECT";
>> +            linux,code = <KEY_SELECT>;
>> +            gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
>> +        };
>> +
>> +        button-back {
>> +            label = "BACK";
>> +            linux,code = <KEY_BACK>;
>> +            gpios = <&gpio0 104 GPIO_ACTIVE_LOW>;
>> +        };
>> +
>> +        button-up {
>> +            label = "UP";
>> +            linux,code = <KEY_UP>;
>> +            gpios = <&gpio0 32 GPIO_ACTIVE_LOW>;
>> +        };
>> +
>> +        button-down {
>> +            label = "DOWN";
>> +            linux,code = <KEY_DOWN>;
>> +            gpios = <&gpio0 42 GPIO_ACTIVE_LOW>;
>> +        };
>> +
>> +        button-left {
>> +            label = "LEFT";
>> +            linux,code = <KEY_LEFT>;
>> +            gpios = <&gpio0 31 GPIO_ACTIVE_LOW>;
>> +        };
>> +
>> +        button-right {
>> +            label = "RIGHT";
>> +            linux,code = <KEY_RIGHT>;
>> +            gpios = <&gpio0 95 GPIO_ACTIVE_LOW>;
>> +        };
>> +    };
>> +
>> +    multicolor-led {
>> +        compatible = "pwm-leds-multicolor";
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&rgb_led_default_pins>;
>> +
>> +        multi-led {
>> +            color = <LED_COLOR_ID_RGB>;
>> +            max-brightness = <255>;
>> +
>> +            led-red {
>> +                pwms = <&ecap2 0 255 0>;
>> +                color = <LED_COLOR_ID_RED>;
>> +            };
>> +
>> +            led-green {
>> +                pwms = <&ecap1 0 255 0>;
>> +                color = <LED_COLOR_ID_GREEN>;
>> +            };
>> +
>> +            led-blue {
>> +                pwms = <&epwm1 1 255 0>;
>> +                color = <LED_COLOR_ID_BLUE>;
>> +            };
>> +        };
>> +    };
>> +
>> +    seven-segment-left {
>> +        compatible = "gpio-7-segment";
>> +        segment-gpios = <&mcp23s18 0 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 1 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 2 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 3 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 4 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 5 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 6 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 7 GPIO_ACTIVE_LOW>;
>> +    };
>> +
>> +    seven-segment-right {
>> +        compatible = "gpio-7-segment";
>> +        segment-gpios = <&mcp23s18 8 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 9 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 10 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 11 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 12 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 13 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 14 GPIO_ACTIVE_LOW>,
>> +                <&mcp23s18 15 GPIO_ACTIVE_LOW>;
>> +    };
>> +
>> +    pwm-beeper {
>> +        compatible = "pwm-beeper";
>> +        pwms = <&epwm0 1 1000000 0>;
>> +        amp-supply = <&sensor_3v3>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&pwm_beeper_default_pins>;
>> +    };
>> +
>> +    vsys_out: regulator-0 {
>> +        /* output of BQ24070 */
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VSYS_OUT";
>> +        regulator-min-microvolt = <4400000>;
>> +        regulator-max-microvolt = <4400000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        bootph-all;
>> +    };
>> +
>> +    vcc_3v3_main: regulator-1 {
>> +        /* output of TPS62A06 */
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VCC_3V3_MAIN";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        vin-supply = <&vsys_out>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        bootph-all;
>> +    };
>> +
>> +    vdd_3v3: regulator-2 {
>> +        /* output of TPS22965 */
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VDD_3V3";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        vin-supply = <&vsys_out>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        bootph-all;
>> +    };
>> +
>> +    vdd_3v3_sd: regulator-3 {
>> +        /* TPS22918DBVR */
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VDD_3V3_SD";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        vin-supply = <&vdd_3v3>;
>> +        regulator-boot-on;
>> +        enable-active-high;
>> +        gpio = <&gpio0 16 GPIO_ACTIVE_HIGH>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&vdd_3v3_sd_ena_default_pins>;
>> +        bootph-all;
>> +    };
>> +
>> +    sensor_3v3: regulator-4 {
>> +        /* TPS22918DBVR */
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "Sensor_3V3";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        vin-supply = <&vdd_3v3>;
>> +        regulator-boot-on;
>> +        regulator-always-on;
>> +        enable-active-high;
>> +        gpio = <&wkup_gpio0 1 GPIO_ACTIVE_HIGH>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&sensor_3v3_ena_default_pins>;
>> +        bootph-all;
>> +    };
>> +
>> +    wlan_en: regulator-5 {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "wlan_en";
>> +        regulator-min-microvolt = <1800000>;
>> +        regulator-max-microvolt = <1800000>;
>> +        enable-active-high;
>> +        gpios = <&gpio0 51 GPIO_ACTIVE_HIGH>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&wlan_en_pins_default>;
>> +    };
>> +};
>> +
>> +&pmx0 {
>> +    uart0_default_pins: uart0-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
>> +            AM62LX_IOPAD(0x01b4, PIN_INPUT, 0) /* (D13) UART0_RXD */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    uart0_wakeup_pins: uart0-wakeup-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
>> +            AM62LX_IOPAD(0x01b4, PIN_INPUT | PIN_WKUP_EN, 0) /* (D13) 
>> UART0_RXD */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    uart1_default_pins: uart1-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x019c, PIN_OUTPUT, 2) /* (A12) UART1_TXD */
>> +            AM62LX_IOPAD(0x0198, PIN_INPUT, 2) /* (C11) UART1_RXD */
>> +            AM62LX_IOPAD(0x0180, PIN_INPUT, 2) /* (A8) UART1_CTS */
>> +            AM62LX_IOPAD(0x0184, PIN_OUTPUT, 2) /* (B10) UART1_RTS */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    usr_button_default_pins: usr-button-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x00a4, PIN_INPUT, 7) /* (H18) 
>> GPMC0_AD11.GPIO0_26 */
>> +            AM62LX_IOPAD(0x01e4, PIN_INPUT, 7) /* (D16) 
>> EXT_REFCLK1.GPIO0_104 */
>> +            AM62LX_IOPAD(0x00c0, PIN_INPUT, 7) /* (N19) 
>> GPMC0_ADVn_ALE.GPIO0_32 */
>> +            AM62LX_IOPAD(0x00e8, PIN_INPUT, 7) /* (L19) 
>> GPMC0_CSn1.GPIO0_42 */
>> +            AM62LX_IOPAD(0x00b8, PIN_INPUT, 7) /* (L21) 
>> GPMC0_CLK.GPIO0_31 */
>> +            AM62LX_IOPAD(0x01c0, PIN_INPUT, 7) /* (B13) 
>> UART0_RTSn.GPIO0_95 */
>> +        >;
>> +    };
>> +
>> +    i2c0_default_pins: i2c0-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x01cc, PIN_INPUT_PULLUP, 0) /* (B7) 
>> I2C0_SCL */
>> +            AM62LX_IOPAD(0x01d0, PIN_INPUT_PULLUP, 0) /* (A7) 
>> I2C0_SDA */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    i2c1_default_pins: i2c1-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x01d4, PIN_INPUT_PULLUP, 0) /* (D7) 
>> I2C1_SCL */
>> +            AM62LX_IOPAD(0x01d8, PIN_INPUT_PULLUP, 0) /* (A6) 
>> I2C1_SDA */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    vdd_3v3_sd_ena_default_pins: vdd-3v3-sd-ena-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (L23) 
>> GPMC0_AD1.GPIO0_16 */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    sensor_3v3_ena_default_pins: sensor-3v3-ena-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x004, PIN_OUTPUT, 7) /* (AA23) 
>> WKUP_UART0_TXD.WKUP_GPIO0_1 */
>> +        >;
>> +    };
>> +
>> +    mmc1_default_pins: mmc1-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x0230, PIN_INPUT, 0) /* (Y3) MMC1_CMD */
>> +            AM62LX_IOPAD(0x0228, PIN_OUTPUT, 0) /* (Y2) MMC1_CLK */
>> +            AM62LX_IOPAD(0x0224, PIN_INPUT, 0) /* (AA1) MMC1_DAT0 */
>> +            AM62LX_IOPAD(0x0220, PIN_INPUT, 0) /* (Y4) MMC1_DAT1 */
>> +            AM62LX_IOPAD(0x021c, PIN_INPUT, 0) /* (AA2) MMC1_DAT2 */
>> +            AM62LX_IOPAD(0x0218, PIN_INPUT, 0) /* (AB2) MMC1_DAT3 */
>> +            AM62LX_IOPAD(0x0234, PIN_INPUT, 0) /* (B6) MMC1_SDCD */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    mmc2_pins_default: mmc2-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x010c, PIN_INPUT, 0) /* (U23) MMC2_CMD */
>> +            AM62LX_IOPAD(0x0104, PIN_OUTPUT, 0) /* (R23) MMC2_CLK */
>> +            AM62LX_IOPAD(0x0108, PIN_INPUT, 0) /* () MMC2_CLKLB */
>> +            AM62LX_IOPAD(0x0100, PIN_INPUT, 0) /* (U22) MMC2_DAT0 */
>> +            AM62LX_IOPAD(0x00fc, PIN_INPUT, 0) /* (T22) MMC2_DAT1 */
>> +            AM62LX_IOPAD(0x00f8, PIN_INPUT, 0) /* (T23) MMC2_DAT2 */
>> +            AM62LX_IOPAD(0x00f4, PIN_INPUT, 0) /* (R22) MMC2_DAT3 */
>> +        >;
>> +    };
>> +
>> +    wlan_en_pins_default: wlan-en-pins-default {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x0110, PIN_OUTPUT, 7) /* (T20) 
>> MMC2_SDCD.GPIO0_51 */
>> +        >;
>> +    };
>> +
>> +    wlirq_pins_default: wlirq-pins-default {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x0114, PIN_INPUT, 7) /* (T21) 
>> MMC2_SDWP.GPIO0_52 */
>> +        >;
>> +    };
>> +
>> +    usb1_default_pins: usb1-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x0248, PIN_INPUT | PIN_DS_PULLUD_ENABLE | 
>> PIN_DS_PULL_UP, 0) /* (A5) USB1_DRVVBUS */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    pwm_beeper_default_pins: pwm-beeper-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 4) /* (F22) 
>> GPMC0_AD14.EHRPWM0_B */
>> +        >;
>> +    };
>> +
>> +    pmic_irq_default_pins: pmic-irq-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x01e8, PIN_INPUT, 0) /* (C8) EXTINTn */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    wkup_i2c0_default_pins: wkup-i2c0-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x0010, PIN_INPUT_PULLUP, 0) /* (AB22) 
>> WKUP_I2C0_SCL */
>> +            AM62LX_IOPAD(0x0014, PIN_INPUT_PULLUP, 0) /* (AA22) 
>> WKUP_I2C0_SDA */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    rgb_led_default_pins: rgb-led-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x0190, PIN_OUTPUT, 2) /* (A11) 
>> MCASP0_ACLKX.ECAP2_IN_APWM_OUT */
>> +            AM62LX_IOPAD(0x0188, PIN_OUTPUT, 2) /* (A9) 
>> MCASP0_AXR1.ECAP1_IN_APWM_OUT */
>> +            AM62LX_IOPAD(0x018c, PIN_OUTPUT, 5) /* (B9) 
>> MCASP0_AXR0.EHRPWM1_B */
>> +        >;
>> +    };
>> +
>> +    spi1_pins_default: spi1-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x008c, PIN_OUTPUT, 4) /* (H22) 
>> GPMC0_AD5.SPI1_CLK */
>> +            AM62LX_IOPAD(0x0088, PIN_OUTPUT, 4) /* (K23) 
>> GPMC0_AD4.SPI1_CS0 */
>> +            AM62LX_IOPAD(0x0080, PIN_INPUT, 4) /* (K22) 
>> GPMC0_AD2.SPI1_D0 */
>> +            AM62LX_IOPAD(0x0084, PIN_OUTPUT, 4) /* (J23) 
>> GPMC0_AD3.SPI1_D1 */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    spi3_pins_default: spi3-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 5) /* (P22) 
>> GPMC0_BE1n.SPI3_CLK */
>> +            AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 5) /* (P23) 
>> GPMC0_BE0n_CLE.SPI3_CS0 */
>> +            AM62LX_IOPAD(0x00d4, PIN_INPUT, 5) /* (N23) 
>> GPMC0_WAIT0.SPI3_D0 */
>> +            AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 5) /* (N22) 
>> GPMC0_WAIT1.SPI3_D1 */
>> +        >;
>> +    };
>> +
>> +    mcp23s18_reset_pins_default: mcp23s18-reset-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 4) /* (H21) 
>> GPMC0_AD10.GPIO0_25 */
>> +        >;
>> +    };
>> +
>> +    lora_control_pins_default: lora-control-default-pins {
>> +        pinctrl-single,pins = <
>> +            AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 7) /* (M19) 
>> GPMC0_WEn.GPIO0_34 */
>> +            AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 7) /* (L20) 
>> GPMC0_CSn0.GPIO0_41 */
>> +            AM62LX_IOPAD(0x01a4, PIN_INPUT, 7) /* (D11) 
>> SPI0_CS1.GPIO0_88 */
>> +            AM62LX_IOPAD(0x01bc, PIN_INPUT, 7) /* (B14) 
>> UART0_CTSn.GPIO0_94 */
>> +        >;
>> +    };
>> +};
>> +
>> +&uart0 {
>> +    wakeup-source;
>> +    pinctrl-0 = <&uart0_default_pins>;
>> +    pinctrl-1 = <&uart0_wakeup_pins>;
>> +    pinctrl-names = "default", "wakeup";
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&uart1 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&uart1_default_pins>;
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +    clock-frequency = <400000>;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c0_default_pins>;
>> +    bootph-all;
>> +    status = "okay";
>> +
>> +    /* EEPROM */
>> +    eeprom@50 {
>> +        /* FT24C32A-ELRT */
>> +        compatible = "atmel,24c32";
>> +        reg = <0x50>;
>> +    };
>> +
>> +    /* Fuel Gauge */
>> +    fuel-gauge@55 {
>> +        compatible = "ti,bq27541";
>> +        reg = <0x55>;
>> +    };
>> +
>> +    /* IMU Sensor */
>> +    accelerometer@6a {
>> +        compatible = "st,lsm6ds3tr-c";
>> +        reg = <0x6a>;
>> +        vdd-supply = <&vcc_3v3_main>;
>> +        vddio-supply = <&vcc_3v3_main>;
>> +    };
>> +
>> +    /* T&H Sensor */
>> +    th-sensor@44 {
>> +        compatible = "sensirion,sht4x";
>> +        reg = <0x44>;
>> +    };
>> +};
>> +
>> +&i2c1 {
>> +    clock-frequency = <400000>;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c1_default_pins>;
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&wkup_i2c0 {
>> +    clock-frequency = <400000>;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&wkup_i2c0_default_pins>;
>> +    status = "okay";
>> +
>> +    tps65214: pmic@30 {
>> +        compatible = "ti,tps65214";
>> +        reg = <0x30>;
>> +        interrupt-parent = <&gic500>;
>> +        interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
>> +        buck1-supply = <&vcc_3v3_main>;
>> +        buck2-supply = <&vcc_3v3_main>;
>> +        buck3-supply = <&vcc_3v3_main>;
>> +        ldo1-supply = <&vcc_3v3_main>;
>> +        ldo2-supply = <&vcc_3v3_main>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&pmic_irq_default_pins>;
>> +        ti,power-button;
>> +
>> +        regulators {
>> +            buck1_reg: buck1 {
>> +                regulator-name = "VDD_CORE";
>> +                regulator-min-microvolt = <750000>;
>> +                regulator-max-microvolt = <750000>;
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +            };
>> +
>> +            buck2_reg: buck2 {
>> +                regulator-name = "VDD_1V8";
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +            };
>> +
>> +            buck3_reg: buck3 {
>> +                regulator-name = "VDD_LPDDR4";
>> +                regulator-min-microvolt = <1100000>;
>> +                regulator-max-microvolt = <1100000>;
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +            };
>> +
>> +            ldo1_reg: ldo1 {
>> +                regulator-name = "VDDA_1V8";
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +            };
>> +
>> +            ldo2_reg: ldo2 {
>> +                regulator-name = "PMIC_VDD_RTC";
>> +                regulator-min-microvolt = <750000>;
>> +                regulator-max-microvolt = <750000>;
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&gpio0 {
>> +    gpio-line-names ="","","","","","","","","","",                /* 
>> 0-9 */
>> +             "","","","","","","VDD_3V3_SD_ENA","","","",        /* 
>> 10-19 */
>> +             "","","","","","MCP23S18_RESET","USR0","","","",    /* 
>> 20-29 */
>> +             "","USR1","USR2","","LORA_RESET","","","","","",    /* 
>> 30-39 */
>> +             "","LORA_RFSW","USR3","","","","","","","",        /* 
>> 40-49 */
>> +             "","VDD_WLAN_EN","WL_IRQ","","","","","","","",    /* 
>> 50-59 */
>> +             "","","","","","","","","","",                /* 60-69 */
>> +             "","","","","","","","","","",                /* 70-79 */
>> +             "","","","","","","","","LORA_BUSY","",        /* 80-89 */
>> +             "","","","","LORA_DIO","USR4","","","","",        /* 
>> 90-99 */
>> +             "","","","","USR5","","","","","";            /* 100-109 */
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&lora_control_pins_default>;
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&gpio2 {
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&wkup_gpio0 {
>> +    gpio-line-names 
>> ="","SENSOR_3V3_ENA","","","","","","";            /* 0-7 */
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&sdhci1 {
>> +    /* SD/MMC */
>> +    vmmc-supply = <&vdd_3v3_sd>;
>> +    disable-wp;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&mmc1_default_pins>;
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&sdhci2 {
>> +    vmmc-supply = <&wlan_en>;
>> +    bus-width = <4>;
>> +    non-removable;
>> +    cap-power-off-card;
>> +    keep-power-in-suspend;
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&mmc2_pins_default>;
>> +    ti,driver-strength-ohm = <50>;
>> +    ti,fails-without-test-cd;
>> +    status = "okay";
>> +
>> +    wlcore: wlcore@2 {
>> +        compatible = "ti,cc3300";
>> +        reg = <2>;
>> +        interrupt-parent = <&gpio0>;
>> +        interrupts = <52 IRQ_TYPE_EDGE_RISING>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&wlirq_pins_default>;
>> +    };
>> +};
>> +
>> +&epwm0 {
>> +    status = "okay";
>> +};
>> +
>> +&epwm1 {
>> +    status = "okay";
>> +};
>> +
>> +&ecap1 {
>> +    status = "okay";
>> +};
>> +
>> +&ecap2 {
> 
> No pinmux here? Even if you are using the default muxing, you should 
> still add
> the pinmux info for both completness and to prevent accidental pin reuse by
> some future addition. Same for EPWM above and USB nodes below.

Will missing pinmux nodes & respin, thanks.

~ Judith

> 
> Andrew
> 
>> +    status = "okay";
>> +};
>> +
>> +&usbss0 {
>> +    ti,vbus-divider;
>> +    status = "okay";
>> +};
>> +
>> +&usb0 {
>> +    usb-role-switch;
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&usbss1 {
>> +    ti,vbus-divider;
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&usb1 {
>> +    dr_mode = "host";
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&usb1_default_pins>;
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&spi1 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&spi1_pins_default>;
>> +    status = "okay";
>> +
>> +    mcp23s18: gpio@0 {
>> +        compatible = "microchip,mcp23s18";
>> +        reg = <0>;
>> +        spi-max-frequency = <10000000>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        reset-gpios = <&gpio0 25 GPIO_ACTIVE_LOW>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&mcp23s18_reset_pins_default>;
>> +        microchip,spi-present-mask = <0x01>;
>> +    };
>> +};
>> +
>> +&spi3 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&spi3_pins_default>;
>> +    status = "okay";
>> +
>> +    sx1262_lora: lora@0 {
>> +        compatible = "rohm,dh2228fv";
>> +        reg = <0>;
>> +        spi-max-frequency = <10000000>;
>> +    };
>> +};
> 


