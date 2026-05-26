Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B39CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 22:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xlSn/ASZpIQh0ZYHGii0yx1BE+FrhF+Z/Y9aY230zY=; b=ofb4HZqAl6niZf/Wi7h8FZ9koG
	IkuA27pmA1N8EQBZuSGeuhtZ45x1nDdnDxQIZct+MV/fRbaR+NwQhNtmiblgFbAESgpl3yfHCC4Jo
	6FjG56JOKFN2MM+jM85U8r+LgNNhE8CkT0elv6l8jaAHXc1ySggNLLSOmwcM+urksKl1gPVpMT0hP
	XTt+qOEm1yamjvL0HQWpbgE2uuYeKaK3ODJkF+Pa43aTdgtvjcAEA3l0q3cY0AauuWU32n8p7GTzp
	e6Y7lB1aYkNQm/pmJN6as2AP+m6QBgC8t9qxbmD1F9K++FHYGWnLTG2xdSCXngWvAKT3BHyBaxrrG
	ZNUAS3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS0O9-000000031e2-0UHm;
	Tue, 26 May 2026 22:36:41 +0000
Received: from mail-southcentralusazon11011054.outbound.protection.outlook.com ([40.93.194.54] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS0O4-000000031dV-1jJ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 22:36:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxQf2RUW7fPTOzh535xI/RZYL8Tw8l9qthiNB/vZXKc1vQkCIcLDy0Ztrog3oUfsToEuMlQTX0yC7QYwomvVqbgEBgdL+Ggt57EAGiYeY3qaAsqYEwmy4GlK1o3+Cu6+8FyU2v3qcSozAs/yifYRbfvq0xFRurt0ZMa3cTIbzrDUKFtT0DpXIBBXEQMj3Hfe8e6VrrOcZyp72+4rUMLUukihpI/XuuZv/bw2uo1f/lwUoY9qq0xX4Lpg//U4xXFfWCe79CeJ0GpHP3jI4T936EEnbP4zn5NcG61harMDuWJelRiqF4KUP2pOgqD5iIovtqj/SZDecYBV+3SvWZ5y+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xlSn/ASZpIQh0ZYHGii0yx1BE+FrhF+Z/Y9aY230zY=;
 b=VcF45LY3zmdbxHIOFWIr5RXYjMPjjSgkqQQgeXU5BN8lEPVp8QHrygE+J6CWy7jYMqLPaTmUqd614iEWHrEECsSZlhbJYZmbKFcUY5JzfmmZuwRtwnIeI7IFpPbcn+7EjEhBdnjSUKTmCNS2w0iI+WkCk95+ao9UMH3BaAR8uIxcoq/bREYqwpNPynLOip2CVQB2rNTqSn3EkRBAdNf2nRrxrKUehFO8zL3ENZFfL572nbn8S1hs3BpCkwHHxoqnbxwnYyGVH+U6TUVg5R1lOtTkDtNcFurXv6yZXeoP+498fgq1IR6GC2GjYrxuc/IJmQrwEmiSg0UWlhtrDVuPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xlSn/ASZpIQh0ZYHGii0yx1BE+FrhF+Z/Y9aY230zY=;
 b=jCvw7guZ0u3dpiakLCTMwxn7/275B0X18sGYDIG+y/n0b4YctrxNNBtFLxcfSub50bkE1acGo9nBzAmENeyfT/x0yjfWlj2DE67nGqpm5GxYIl1wffluOHdk9vTUpc5mwT2XA4MlUjOApzj2qMVCS0RtsNJHE5JjqQo6JWZ0/4o=
Received: from BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15)
 by PH0PR10MB997667.namprd10.prod.outlook.com (2603:10b6:510:382::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 22:36:30 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::a5) by BL0PR05CA0005.outlook.office365.com
 (2603:10b6:208:91::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 22:36:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 22:36:30 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 17:36:29 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 17:36:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 17:36:29 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QMaTXR2333587;
	Tue, 26 May 2026 17:36:29 -0500
Message-ID: <1d62e614-084b-456d-823b-21fc7d78c0c9@ti.com>
Date: Tue, 26 May 2026 17:36:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
From: Judith Mendez <jm@ti.com>
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
 <3c4c5104-97c4-4d5d-8bb4-21332e39c707@ti.com>
Content-Language: en-US
In-Reply-To: <3c4c5104-97c4-4d5d-8bb4-21332e39c707@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH0PR10MB997667:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f27f0b-0b75-40b2-6afe-08debb773b31
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|13003099007|22082099003|18002099003|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: 3357JyNefJQja9auSZwHN/bBUds+HTUQPN2Bud0oGepd1j+wioRsQ6xbRYvvcyaxXKESIdS7SRGv9lkfH5MzdOLW2EfiauIfowcfwCkMTKpZ/JBYB9m/taCMbfOhuJu7GgOy4KfHz+Z+oBK04yAvY4pxnvBjWN2fyL7F61QguE5xfTBAjGjYcxTU0Q2xhBzO2cj3u6rIsP+NF8dT2C8AoEAQmO0YPfegxDEu8DSX2UzEF37ENKaoYK9qFbF28t+y9Zn4dahMtAhFrHTdrQLwzwBHakh6QfS+snkSuBxjJRFLOKknd0YRpY8OVFgQAlcRWf1p+oaCZsByc9p/oCdst1PL9AiGLrLvSsXKHBu180La0qGLHiU5/PLg9OArCcRfgSk7wDqDQBCM0UB2O9u0QfMChBlLSoYIHER+7PxQFfy90dg2XmWRWD/kpOB1bPaOvzr9PM1pB3zfNmyVImEhqFnxC64h88j49buVsKm2KUBiSkvJ0gdSNA9Y3NjQuEYXWAsmqeUN6xKQn1SWXIC7eu9uUj3he9qXbqloTzk9II9rcZyHx9oSvJfdPY3eswTNAZt3xQsYW2lPC1sxi3f+0nbFOmuJcTbKR36geTd3JEEiUNM5CmIJCwOdUeWJgjO0g0/DlFgjSFsjTXLO2Tb9k2SVsmEJE+yAWzw4P3cYMIGCHo52KCvgDznyz6+3TSQn
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(13003099007)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jGYK5rOIhIc0Uh7pzWQ/wIIH6sFqUK1qo1UGYdB81HffxgGdjuybi7gClz4A581YBvMI74efbxz8hku8RoBZyu2nuh251dhh9O3XqL0v4pHmUY0vSOy7L5MtpfchY4LLV3SCdI+V8fKjA+wv5Unz7RDouEEc6VKFMY0ubJd/oLoesfhst8HvDiRfRNsHLSVIvFFIIgAtdoVm+BnK2o7N0uWL+ff9WlpOTsVXHwITheXs0Dc6QuYo7v2fKZo/bNOxzUA/ajHBt8mZcTL4xbRtf53p+V/AlAo3DnpKp88DAHrDB7fvMiLz7Y2ioBHZF/MrVn7a8Hy6pEkscd2u2sU25h/JMZucWEziq6ypNaOfMMLXJzwnoSGdBxPKyDsFluv7uHsyW0efaMbH5sgblhKaq2JRYkkoviIvYy/zcvIrXvDuyd9Iml32C+z9v4sOT72g
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 22:36:30.0510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f27f0b-0b75-40b2-6afe-08debb773b31
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_153636_461926_ADB09928 
X-CRM114-Status: GOOD (  15.55  )
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

Hi Nishanth,

On 5/26/26 4:53 PM, Judith Mendez wrote:
> On 5/18/26 8:11 AM, Nishanth Menon wrote:
>> On 10:35-20260515, Judith Mendez wrote:
>>> BeagleBoard.org BeagleBadge is a compact, affordable open source
>>> hardware single board computer based on the Texas Instruments AM62L3
>>> SoC designed for IoT and embedded applications with low power
>>> consumption. Expansion is provided over open standards based headers
>>> including QWIIC and GPIO interfaces.
>>>
>>> https://github.com/beagleboard/BeagleBadge
>>
>> Why not use https://www.beagleboard.org/boards/beaglebadge ?
> 
> Will switch link
> 
>>>
>>> Co-developed-by: Andrew Davis <afd@ti.com>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>> Changelog since v3:
>>> - Add missing newline in commit message
>>> - Drop beagleboard URL
>>> - Drop uneeded header files
>>> - Add boothph flags in wkup_i2c0 & PMC nodes
>>> ---
>>>   arch/arm64/boot/dts/ti/Makefile               |   1 +
>>>   .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 700 ++++++++++++++++++
>>>   2 files changed, 701 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ 
>>> ti/Makefile
>>> index 5269c9619b65c..4e377ca011cd8 100644
>>> --- a/arch/arm64/boot/dts/ti/Makefile
>>> +++ b/arch/arm64/boot/dts/ti/Makefile
>>> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
>>>   # Boards with AM62Lx SoCs
>>>   dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
>>> +dtb-$(CONFIG_ARCH_K3) += k3-am62l3-beaglebadge.dtb
>>>   # Boards with AM62Px SoC
>>>   dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/ 
>>> arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
>>> new file mode 100644
>>> index 0000000000000..30fc9c83b1f44
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
>>> @@ -0,0 +1,700 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * https://www.beagleboard.org/boards/beaglebadge
>>> + *
>>> + * Copyright (C) 2026 Texas Instruments Incorporated - https:// 
>>> www.ti.com/
>>
>> Seeing the tags, I assume no BeagleBoard.org member contributions?
> 
> Not yet ^.^
> 
>>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/input/input.h>
>>> +#include <dt-bindings/leds/common.h>
>>> +#include "k3-am62l3.dtsi"
>>> +#include "k3-pinctrl.h"
>>> +
>>> +/ {
>>> +    compatible = "beagle,am62l3-beaglebadge", "ti,am62l3";
>>> +    model = "BeagleBoard.org BeagleBadge";
>>> +
>>> +    chosen {
>>> +        stdout-path = &uart0;
>>> +    };
>>> +
>>> +    aliases {
>>> +        gpio0 = &gpio0;
>>> +        gpio2 = &wkup_gpio0;
>>> +        i2c0 = &i2c0;
>>> +        i2c1 = &i2c1;
>>> +        i2c2 = &i2c2;
>>> +        i2c4 = &wkup_i2c0;
>>> +        mmc1 = &sdhci1;
>>> +        mmc2 = &sdhci2;
>>> +        serial3 = &uart1;
>>> +        usb0 = &usb0;
>>> +        usb1 = &usb1;
>>
>> is this valid?
>> git grep of_alias_ driver/usb/
>>
>> am I missing something?


Missed this one, actually I had originally copied alias list from 
beagleplay [0], but checking once, seems like these aliases are not
needed, so will remove for Badge & beagleplay as well.

~ Judith

...


