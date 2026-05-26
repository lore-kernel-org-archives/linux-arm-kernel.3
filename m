Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E1CCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 21:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWmDfUoUxhXZd/fkYU4u0VqaMt04Qm8oDwjOUCgfzn0=; b=IL26rAGW306UtEzUzG2rTZparc
	Fh979/apVdNgr8GpQd+Ryc00oYCjJmqG3CVUoej0RFA2wBH0UQyZtq+o9VsvEb8HaF/Q3OqxyqmJH
	ZvsWWktp96Ix42xOgF0rasqQf4h9p2OXjM1L6PhXeBoN7bjo6nSKHdI9Pd+RV3yEo8IzTEH/9BVNA
	XwGvLn2EIBkrCXBRS09VVGxY6K8ynjpTNIYHPlDudFZ02l/GMKZUIHtVeQ54DEsXq01JQbwYOlBmL
	gyAZpLvKFiNEpwFvGjALb77+0CA10qmsJwvnOui7onwwIoes2tnC1i9Fnieim3FWtMGzskFL49plc
	sjxg4rlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRziZ-000000030AC-0h6W;
	Tue, 26 May 2026 21:53:43 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRziU-00000003091-3G8x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 21:53:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPBS8S53cr2AQiuveCDV+jmWPbVGYblSfFJgFaL692BEXF/waQXSVAdeu4z+qYqz99Wh4LjVq1qOIy3KaRMuAEZ4xdIIL5z+X8WeX9CWs7XaaEPjVhrVo1RgzjWaNaUFeRSD3ljOddDKkzxWe8ezFdJ4Vo6obsv9Q+A1uhCFzw9ocRz9078LeHnMvLYn2pZ9nx26n4wS3omHirHaTs76L/xEx7VuABHTGGNoHc/SfRsljsmKmFKc+dyavITT1Om7b139MmBvIrDG6El+Rjx1JU8CQtN5h29OfJ+ev5g2F++ZzuQFUKcfoswBi8rEm69faaTlyVfI957lNgPMp9Tw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWmDfUoUxhXZd/fkYU4u0VqaMt04Qm8oDwjOUCgfzn0=;
 b=KCAKkLPhWcJxlflkbTBpI8trO0mKoGfxUGDsn8xAKH+ARTDBbT1YnJCpVfBYX4bcoqIdOi+tqaex8MSgqyqW9J5ILUP5x7/Cg0dIc/mVeAlidom/nObQ0aE2ef4DdCWV9bqKwQhCGmcvn9boKCjmbrvRxTaieOPtEUpGf43kg7YhBNuH2T+T84j3+Hcj1e21+WXhPk+g2smwj0TkCW0tIa3FnzUMVK7hHvTHbBPJ0DlPFj87NTWxiS7jANu7uWLVD86p3mMYZBxAoHe1ntYaZ7oWfhV1jAHE6aUqvb9Gxlrmo3r9H2AEWG13NNChaFaEqFyrk4IlKimElxoR0Zl3yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWmDfUoUxhXZd/fkYU4u0VqaMt04Qm8oDwjOUCgfzn0=;
 b=awLiMpMpE60GYS/ZydAhfglaVE4Ie69l3lTJdSSDduf/dR1U3XH903BFmAZ8d7kpVC76ppf19xwj4xE1JftqSu/5XMLyTDzPYh1KldFA0M+AuljNyeaOnx1J9/X09WJUxx4/Vq7LyTeLSW46Bp2VB7uHTPlVU83uJFuWzSw+mEY=
Received: from SJ2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:a03:505::21)
 by CO1PR10MB4484.namprd10.prod.outlook.com (2603:10b6:303:90::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 21:53:33 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:505:cafe::8a) by SJ2PR07CA0019.outlook.office365.com
 (2603:10b6:a03:505::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 21:53:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 21:53:32 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 16:53:31 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 16:53:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 16:53:30 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QLrU521736851;
	Tue, 26 May 2026 16:53:30 -0500
Message-ID: <3c4c5104-97c4-4d5d-8bb4-21332e39c707@ti.com>
Date: Tue, 26 May 2026 16:53:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>, Bryan Brattlof <bb@ti.com>, Jason Kridner <jkridner@gmail.com>,
	Robert Nelson <robertcnelson@gmail.com>
References: <20260515153541.294698-1-jm@ti.com>
 <20260515153541.294698-3-jm@ti.com>
 <20260518131137.zazw4xf6n7ftil6l@predator>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260518131137.zazw4xf6n7ftil6l@predator>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|CO1PR10MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: 5858de7e-7907-4565-0b6f-08debb713af3
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|13003099007|18002099003|22082099003|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: hvF/5+XanNFXmRfzzSXMW+NYAZUVomuZAdjsMKMnI1dfhOZdQPPaVe/m3ctSosOK1We78e4aznl8qKBxtMzLJoN1Z4S0pFV/PrcQ6Us/swXJvfV+bFwMGxcU3ZDhZwUpmeBHAQOkU06UJf0HOjL+1pGMIDAFHwXi1o/SDky3THTB7Wzj3NJCZxADqJAgMyoPBbDxDmDsV9D6BsSDMhyk9k3hhZ5/SRd3SOFqcvjJEAJP9MUvWI7nEzgJ362iHsPIbDs9gzm7ncv8oecv5IrbmzH9chv4aD6GM5SYyTX9F/noFku6SlMssYRZ7o08/48UIB1A6wttUPBQStj/dy35exfmCxl/HGRitiwbStzc9+7oR/KgD/RdAUgOQzr4WBtG7QALWbQJ3oKw3spjHhNsLLup8M4mmzKqz+YL1G47E+F2N0lityJlWHDaFJnAvqrQP2FcP/+rGGs+kL9p3wVYg+5/zYgsT+tEEjooRid/qTrGKvIeUQou1ZEPRkTqeD8GoKcWuOvSY0hJXDm8Q25H/5mt7FXuRzavJF9jt5xNSegHpUx+oFJqAb6mIQbH84xoLwrtLAPxu9eKZYU2eSyJBNriecZRce3UZYssmsTjIa+6LNCI8RBYklbDiW+peMF3vv10drwecUsaazdrVW0yJDSmbUCbApqpNOrzdrwmD/Q=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(18002099003)(22082099003)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: n27b7MA50CNLB1Sv4sdtyKMWtODaz+E1N/gPtQH0x2lHzunXlQJ/vn7nLPbJ/oHPODJ9gFCJ/Qqc9sAOsAiwtpfqHU6lXmMaU6KZTnHPx97gwNcPT60EdXSGgsHfxWOtozves3Kt7aS1U1qNnfoKZ79cyHK2z2y/1Psl499sItKknh/2TyG1DXY/ohog6w/g0yiB8RDeEgLiH9QeyIv2xCydjyLbZWpiGEZ3S1w1lNHRY2tzBp+ufEFtGIzCT3yq9GaL1UMPLsNP45Lgg9w7imWOi/YVZ3OWn7h75lO8STOjViGLDciQy8QsxOrjSYjoBAl+Hi7bVsuMwZ1ZPH88lkM0f4Htq2NK3ybJdYA8Virmyad0mSQ/bd+AUlaOZNr+OM/5H8ZUu3ZqT4b2FGWVHkCAKXpz73l/JwVC7O220ZdOKyFGTficNHA5uWh8jS1T
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 21:53:32.6607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5858de7e-7907-4565-0b6f-08debb713af3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4484
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_145339_053622_8D9A665A 
X-CRM114-Status: GOOD (  24.17  )
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

On 5/18/26 8:11 AM, Nishanth Menon wrote:
> On 10:35-20260515, Judith Mendez wrote:
>> BeagleBoard.org BeagleBadge is a compact, affordable open source
>> hardware single board computer based on the Texas Instruments AM62L3
>> SoC designed for IoT and embedded applications with low power
>> consumption. Expansion is provided over open standards based headers
>> including QWIIC and GPIO interfaces.
>>
>> https://github.com/beagleboard/BeagleBadge
> 
> Why not use https://www.beagleboard.org/boards/beaglebadge ?

Will switch link

>>
>> Co-developed-by: Andrew Davis <afd@ti.com>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Changelog since v3:
>> - Add missing newline in commit message
>> - Drop beagleboard URL
>> - Drop uneeded header files
>> - Add boothph flags in wkup_i2c0 & PMC nodes
>> ---
>>   arch/arm64/boot/dts/ti/Makefile               |   1 +
>>   .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 700 ++++++++++++++++++
>>   2 files changed, 701 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
>>
>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
>> index 5269c9619b65c..4e377ca011cd8 100644
>> --- a/arch/arm64/boot/dts/ti/Makefile
>> +++ b/arch/arm64/boot/dts/ti/Makefile
>> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
>>   
>>   # Boards with AM62Lx SoCs
>>   dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
>> +dtb-$(CONFIG_ARCH_K3) += k3-am62l3-beaglebadge.dtb
>>   
>>   # Boards with AM62Px SoC
>>   dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
>> new file mode 100644
>> index 0000000000000..30fc9c83b1f44
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
>> @@ -0,0 +1,700 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * https://www.beagleboard.org/boards/beaglebadge
>> + *
>> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
> 
> Seeing the tags, I assume no BeagleBoard.org member contributions?

Not yet ^.^

> 
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include "k3-am62l3.dtsi"
>> +#include "k3-pinctrl.h"
>> +
>> +/ {
>> +	compatible = "beagle,am62l3-beaglebadge", "ti,am62l3";
>> +	model = "BeagleBoard.org BeagleBadge";
>> +
>> +	chosen {
>> +		stdout-path = &uart0;
>> +	};
>> +
>> +	aliases {
>> +		gpio0 = &gpio0;
>> +		gpio2 = &wkup_gpio0;
>> +		i2c0 = &i2c0;
>> +		i2c1 = &i2c1;
>> +		i2c2 = &i2c2;
>> +		i2c4 = &wkup_i2c0;
>> +		mmc1 = &sdhci1;
>> +		mmc2 = &sdhci2;
>> +		serial3 = &uart1;
>> +		usb0 = &usb0;
>> +		usb1 = &usb1;
> 
> is this valid?
> git grep of_alias_ driver/usb/
> 
> am I missing something?
> 
>> +	};
>> +
>> +	memory@80000000 {
>> +		/* 256MB */
>> +		reg = <0x00000000 0x80000000 0x00000000 0x10000000>;
>> +		device_type = "memory";
>> +		bootph-all;
>> +	};
>> +
>> +	thermal-zones {
>> +		wkup0-thermal {
>> +			polling-delay-passive = <250>;	/* milliSeconds */
>> +			polling-delay = <500>;		/* milliSeconds */
>> +			thermal-sensors = <&vtm0 0>;
>> +
>> +			trips {
>> +				crit0 {
>> +					temperature = <125000>;
>> +					hysteresis = <2000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +	};
> 
> This is better done by having something like
> arch/arm64/boot/dts/ti/k3-am62l-industrial-thermal.dtsi

I am following what k3-am62l3-evm.dts is doing [0], we moved
thermal-zones node to the board file instead of defining in thermal.dtsi

[0] 
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts#L61

> 
> [..]
> 
>> +
>> +	sensor_3v3: regulator-4 {
>> +		/* TPS22918DBVR */
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "Sensor_3V3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		vin-supply = <&vdd_3v3>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
> 
> Why sensor supply is always on?

No special reason, I can remove to help with power saving.

> 
>> +		enable-active-high;
>> +		gpio = <&wkup_gpio0 1 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&sensor_3v3_ena_pins_default>;
>> +		bootph-all;
>> +	};
>> +
>> +	wlan_en: regulator-5 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "wlan_en";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		enable-active-high;
>> +		gpios = <&gpio0 51 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wlan_en_pins_default>;
>> +	};
>> +};
>> +
> 
> [..]
> 
>> +
>> +	usr_button_pins_default: usr-button-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62LX_IOPAD(0x00a4, PIN_INPUT, 7) /* (H18) GPMC0_AD11.GPIO0_26 */
>> +			AM62LX_IOPAD(0x01e4, PIN_INPUT, 7) /* (D16) EXT_REFCLK1.GPIO0_104 */
>> +			AM62LX_IOPAD(0x00c0, PIN_INPUT, 7) /* (N19) GPMC0_ADVn_ALE.GPIO0_32 */
>> +			AM62LX_IOPAD(0x00e8, PIN_INPUT, 7) /* (L19) GPMC0_CSn1.GPIO0_42 */
>> +			AM62LX_IOPAD(0x00b8, PIN_INPUT, 7) /* (L21) GPMC0_CLK.GPIO0_31 */
>> +			AM62LX_IOPAD(0x01c0, PIN_INPUT, 7) /* (B13) UART0_RTSn.GPIO0_95 */
>> +		>;
>> +	};
> 
> no wakeup from usr buttons?

RTC wakeup node is not in upstream tree, so no, user button wakeup
support is not enabled yet.

> 
> [...]
> 
>> +};
>> +
>> +&gpio0 {
>> +	gpio-line-names ="","","","","","","","","","",									/* 0-9 */
> 
> space after that =

Will fix.

> 
>> +			 "","","","","","BOOST_5V_ENA","VDD_3V3_SD_ENA","","","",					/* 10-19 */
>> +			 "","","","","","MCP23S18_RESET","BTN_SELECT","","","",						/* 20-29 */
>> +			 "","BTN_LEFT","BTN_UP","","LORA_RESET","","","","","",						/* 30-39 */
>> +			 "FUEL_GAUGE_BATLOW","LORA_RFSW","BTN_DOWN","USB_HUB_RST","MIKROBUS_INT","","","","","",	/* 40-49 */
>> +			 "","WLAN_EN","","","","","","","","",								/* 50-59 */
>> +			 "","","","","","","","","","",									/* 60-69 */
>> +			 "","","","","","","","","","",									/* 70-79 */
>> +			 "","","","","MIKROBUS_RST","","","","LORA_BUSY","",						/* 80-89 */
>> +			 "","","","","LORA_DIO","BTN_RIGHT","","","","",						/* 90-99 */
>> +			 "","","","","BTN_BACK","","","","","",								/* 100-109 */
>> +			 "","","","","","","","","","",									/* 110-119 */
>> +			 "","","SD_CD","","","";									/* 120-125 */
> 
> Could you keep these under 100 chars?

I could for most of these lines I believe, but it will completely mess
up the alignment in comments, If that is fine, I will fix. (:

> 
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&gpio0_pins_default>, <&usr_button_pins_default>, <&lora_control_pins_default>;
>> +	bootph-all;
>> +	status = "okay";
>> +};
>> +
>> +&wkup_gpio0 {
>> +	gpio-line-names ="","SENSOR_3V3_ENA","","","","","","";								/* 0-7 */
> 
> same
> 
>> +	bootph-all;
>> +	status = "okay";
>> +};
>> +
>> +&sdhci1 {
>> +	/* SD/MMC */
>> +	vmmc-supply = <&vdd_3v3_sd>;
>> +	disable-wp;
>> +	cd-gpios = <&gpio0 122 GPIO_ACTIVE_LOW>;
>> +	cd-debounce-delay-ms = <100>;
>> +	ti,fails-without-test-cd;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mmc1_pins_default>;
>> +	bootph-all;
>> +	status = "okay";
>> +};
>> +
>> +&sdhci2 {
>> +	vmmc-supply = <&wlan_en>;
>> +	bus-width = <4>;
>> +	non-removable;
>> +	cap-power-off-card;
>> +	keep-power-in-suspend;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mmc2_pins_default>;
>> +	ti,driver-strength-ohm = <50>;
>> +	ti,fails-without-test-cd;
>> +	status = "okay";
>> +};
> 
> Why not introduce the sdhci2 and supplies once we get wlan driver in
> upstream?

I can do that. NP.

~ Judith

...

