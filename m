Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378F6FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65fmKFc/YUBtTZqGlvPmOW94abexm7bABd5b3onQ56U=; b=FE6iswowjBlz6D1sghu13l8ZYW
	+IL0H3eeuj1c26T9ANzHsUW0ScCtxXGCkw0ms1jxDhUuQq4u4zbiX8p7Q5R0TEwu1Wi1nGDU++QLO
	Z5J7K5QA64b7jDI/XyRmHr3hs8q/dS+RI3ntvuIp12CyDfP7BpMdtpbub0eYJPeCjClQvQeWF0XE8
	qfymUTh/EElOTZyIMUFJxdzHyiBMEo6xgsfWeHsFofUlHS6UmSnFKFoj0hotg4+yWqnc4ipU2qmOn
	LnKLvP+8n3F6OJRmbGiDZ9XqU3AV+02U/K0+zs1GMUEpnrSJulK1vwjKii43OsXVwcrIE2PrmD8RN
	IfgyuWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKI1N-0000000GicK-1gGy;
	Tue, 05 May 2026 15:49:17 +0000
Received: from mail-eastus2azon11011041.outbound.protection.outlook.com ([52.101.57.41] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKI1K-0000000GibN-1qZQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:49:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tv30cVRqY3TdXhfiwyzz2Regza9Gl7wKMwNqMVMNAw+ZPaKELTSLC7unJ3P+CqTIbXDlDhiLegqGiZTkXovjTX5HJPQ0EYwzDKGDrUB/yhR755yOkOkXGbhR3XbVAk23xF72cwAMfv6ZnvNvwXxt+XPYSt0F5Stooh78OEe3d9u1DhMLxLHwG3VlkFUkmRjZiCnPLU9X2fMx2qg+68kQcBf5JUMGAPk7NAb+QTrEBuCX93uux/5NMqAphi2SmfZd0HVCAQN4BspGOYG8Px81XgK94sbn7vkyyef8J4Ypo6P0bgFGRdDcePtV/W/r4sLn3ef+7QNA4WbAXUURec9KAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65fmKFc/YUBtTZqGlvPmOW94abexm7bABd5b3onQ56U=;
 b=d5MVqRyYbAnoMcNTEH6U8p/WiqldUi7mcQSwWpeeDVwCX0ByekU1HbkhOqDUIvymtZY0BTbsdcK4Hb3ytt4I7wTqWjdg6aa5a78LO/lhh1rh6CYlXs8u5+t4NfGQKq+H+S5j91AqX7bNV1EXDbcxPPIGxOkGm1/gRTgvVCeEUAu0IK+x6Bt6hQF7DGtsvjL4V8caFmOOsOpoiVd17dgb2A56irMTl7zL6+gVlg34f1EZlQtf6aAFjUFbr+gXxw/9BC2RBWGlioHjS+ugot6MV8Ex08HF+ESfOdyp7w79MKzDfRvPQIn6fRufYCyOByHd6ZAbW5P/3eOeZ3zu6Rrd/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65fmKFc/YUBtTZqGlvPmOW94abexm7bABd5b3onQ56U=;
 b=wbTZ2c5OfxS4WWPBRhlQ2wQSyHMeWc3kV/ahqCz1WEnnZKi6ujsISXgWOPxrwdlkf0PSVDlOY9UcDqZnxj3aw7Tgd7/8Hv1s9LKaKlpP++WRyJQWUEJ/5tKpXWhCL8usmPugVP43XqMaWZW0Diitspg7FXdhIcAjnQLwGxbrI6E=
Received: from PH7P220CA0042.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::25)
 by SA1PR10MB6639.namprd10.prod.outlook.com (2603:10b6:806:2b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 15:49:07 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::18) by PH7P220CA0042.outlook.office365.com
 (2603:10b6:510:32b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 15:49:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 15:49:06 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 10:48:50 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 10:48:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 10:48:50 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645FmoZk3576046;
	Tue, 5 May 2026 10:48:50 -0500
Message-ID: <073e52f1-f5d0-43aa-b9f0-d4f179838f10@ti.com>
Date: Tue, 5 May 2026 10:48:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add k3-am62l3-beaglebadge
To: Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
References: <20260501233148.4180391-1-jm@ti.com>
 <20260501233148.4180391-3-jm@ti.com>
 <20260504161900.sivd2s4roiqtnsc7@bryanbrattlof.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260504161900.sivd2s4roiqtnsc7@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|SA1PR10MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb7345c-9a30-447e-ecc6-08deaabdd6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: e2VE3nRdgsQSM0piiNQr19oz9deCeARtU2EWkhxbyr9SR8irJvfQIG2xUHV+aXIuNNGwn69PplGx5H9uJGmAtL/Q9q4Ev+dwLbSMR10/WRkFcOTNfIz5kKroSb0QcETbTh+DZLPahjBgy8W66IRp+Lr+bPDiJcAsQ6gGkshqzMeDkON+/eu8DSEQ85yy45Xg6Zu7ZhkXEwMjBhrimbBR4XHJPn93rGd+4cObgQDaBXorlUP17BTttzyfXljMqCtj7Gz4LEszIQ27Vvq2lFbae6HF9EFk6RBVv+w50gpLuaAqHUoVDXXwFytp4qw41/zSyGoQiulkRnMPZxT/QylDHfMYb30uV35oPuYBwiNI2pTv9dtOqgEn5dltepwb+rYdWvtl3OwG2cbob7V3JdqPW0Xv/uNMWzTCnTF1aW6Yt9u1d/3V4fWzxZW1CGduCitHbpX+JPS8hql/oar3w0GYl0CFCG8cVDQ/4KYNAWlkbixiDzuJCxVJOlI3o5C2ghNQpVod/cdIWKM1Qo45VEtI0sg67zcwsNgoQHXP7Ych5ImLCVtc1GzZ32Eed/HkQMjaQ38q1cNr/rJipjvX31lv5AgjJIjKmrNIaNtVUBJFP8b8Bh7kSW5f5lh66rm5F6ktT0brKeYruIf2LUgJ1hgaGMQLXWDLJtagR3G9xGv4GJM=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2DJsJ2Ih+iJt263VUPfESUfgQ4sjK03NYB1GpgOVlLvRvH5eRuaOCh6BzhNmI+VbqPlE8X5VBL6CjXG+1WFZdPtL0nS63hq7p5j/GDgJYSv4UJXo34fdX2+txkwZVWm4c03xhf9R8YQHtDRjvbzIqGO3TCK8R/PloK6gwQE9D/uXhDKZw3kH49Wk01P2TpRjsaUwcolTWaKPqYVvi+jTMyKb2yG7pJ8mAj0rSee/h4vgfD4iHJn2m1ol+Z2LhUYjDBCoyE5wXH4af4t2dCVEG+w9HYnNNa5sy8f2742MDhvD9Da8jNmjh+dnUvXF06zJgJ6jnXsgPu0HoZWkKmS3zXOTDLh0DoFWVi1h2fbv5Zk1eN+B1SMskydLNRMZnerraBt9On8vi+XDMGOShic0Kq5YwKAe6aHopqcnJ8Uz1lgvACIzEwF60wlSFRHfIyCp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 15:49:06.1550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb7345c-9a30-447e-ecc6-08deaabdd6ca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_084914_489259_28336FDA 
X-CRM114-Status: GOOD (  18.96  )
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

Hi Bryan, all,

On 5/4/26 11:19 AM, Bryan Brattlof wrote:
> On May  1, 2026 thus sayeth Judith Mendez:
>> BeagleBoard.org BeagleBadge is a compact, affordable open source
>> hardware single board computer based on the Texas Instruments AM62L3
>> SoC designed for IoT and embedded applications with low power consumption.
>> Expansion is provided over open standards based headers including
>> QWIIC and GPIO interfaces.
>>
>> https://beagleboard.org/
>> https://github.com/beagleboard/BeagleBadge
>>
>> Co-developed-by: Andrew Davis <afd@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/Makefile            |   1 +
>>   arch/arm64/boot/dts/ti/k3-am62l3-badge.dts | 655 +++++++++++++++++++++
> 
> ...
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>> b/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>> new file mode 100644
>> index 000000000000..0125d3fec5e9
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>> @@ -0,0 +1,655 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * https://www.beagleboard.org/boards/beaglebadge
>> + *
>> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
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
>> +	compatible = "beagle,am62l3-badge", "ti,am62l3";
> 
> I noticed the $subject calls it the k3-am62l3-beaglebadge do we want to
> name the DT that as well?
> 
>> +	model = "BeagleBoard.org BeagleBadge";
>> +
> 

So I see other beagle boards have the following:

beagle,am67a-beagley-ai in k3-am67a-beagley-ai.dts
beagle,am625-beagleplay in k3-am625-beagleplay.dts
beagle,am62-pocketbeagle2 in k3-am62-pocketbeagle2.dts
beagle,j721e-beagleboneai64 in k3-j721e-beagleboneai64.dts

so I think we should be using:

beagle,am62l3-beaglebadge in k3-am62l3-beaglebadge.dts

so if it is fine with everyone will update compatible
& DT filename accordingly.

> 
>> +&sdhci2 {
>> +	vmmc-supply = <&wlan_en>;
>> +	bus-width = <4>;
>> +	non-removable;
>> +	cap-power-off-card;
>> +	keep-power-in-suspend;
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mmc2_pins_default>;
>> +	ti,driver-strength-ohm = <50>;
>> +	ti,fails-without-test-cd;
>> +	status = "okay";
>> +
>> +	wlcore: wlcore@2 {
>> +		compatible = "ti,cc3300";
> 
> Sadly this only exists on our evil vendor tree :/

So sure, I saw that the WIFI driver is not in mainline,
but I also referenced beagleplay series & it seems
like as long as the hardware is described properly,
the node can be upstreamed. Please correct me if I
am wrong here..

> 
>> +		reg = <2>;
>> +		interrupt-parent = <&gpio0>;
>> +		interrupts = <52 IRQ_TYPE_EDGE_RISING>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wlirq_pins_default>;
>> +	};
>> +};
>> +
> 
> Scanning over the bootlog it looks like the VTM driver is active but
> we're missing the thermal-zones{} node which is causing it issues.

Opps, will add. thanks.

~ judith

