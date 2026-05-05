Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C612FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw/Nfny8q6dDNldcRTJ0lsQdgdGzgbYWHUg/apYZhas=; b=kUTpYR/1+BP0DvgG5TplUBaDq9
	fDp8bhjxd5VFnJHPc3RXEFXZEjK9kP5WwAgRS3kGjNvR7hS4MvsAYvkWhBtWb6RQHrQKy5/r50oCj
	AXkPqMXvH9FO3nCYUd5TH5XnHgc4hg7unJ7jZQdA9/k1dsiWsX2DBi5uuHUcEH/ViuaUpNrJ2dUqv
	L4ue/gkSiZk/CstLDwEomj6+cl5sWrsKVUdbfPlsThOvzG4J2bdCfgA9XADhF1S0XGzdDwQ4kHx6r
	KOkTSbMpmNNU9Bc5/zPqWsMaujucG+LE/eYSKyBvZ922fudM/yIT4t2uGnzEeW7xfhu5bq4MDpay9
	oWSMzx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIbo-0000000GshF-2fX1;
	Tue, 05 May 2026 16:26:56 +0000
Received: from mail-westus2azon11012006.outbound.protection.outlook.com ([52.101.48.6] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIbm-0000000Gsex-0Vkj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUr8GGUouMQ6MRdQLRK6bnwgdh7YR5bOLiOknzBNm8N6C5MAaiWeufDj2iRAyXFj3c5oGp2u+ZDXyYsVxFH7FvJ1Jtm+Y4TrbuVlvYcVnb0s4ZYB1i7+B8/OMlO6oRvPEdXw89PHqdHD5FZkE5kz18RNYqJyKd7ks5n2+MP9o3QfBb5KLY9zPaEkzup5fpV3vaRU5OhbdP5LnNZHAW+vwYnoNZC7ScXKp380OivvOL7kw3qS3x/o3sprWxorbu/29zPA/Mp52+uyKXeBKNIvie5aqAPBzPUkwVyKf2Z7phnXruYvzI3Yx0VVnHz8Kf2WEGtMBTT+i5f1UkosCnsxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zw/Nfny8q6dDNldcRTJ0lsQdgdGzgbYWHUg/apYZhas=;
 b=fK0yy1n5fbRFXM3arkbiwzZTJd0NBeLcOe3EeXmGSi24BOBE+0P6OClJRO6BVPtddH7KmHhgfJ3TiAYhNy0LL2vYCwwsq4UpsAPu0YrYN6Qx8EbYAhrUY1hhxjfk5s7y603Mh1nQthdK4cZrt0kI8J4ZjmMItpet6lNJsy5fAIf3W/Su19YsmGMj8YCNgY/CD4/NGoV+W5D8VN/V2lcL6VQkt1DDgeFe/PWHqNMl8Zgtd9hmisx88J1N7eOMQj66x5Eyt1rHCgZwe5GBrv1CpDM4XqFw1L4XYi/lHu8Gx31zz5ExLg6yOmg4qF0aRNj4P7q2IWIks7ICzf6cSKhaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw/Nfny8q6dDNldcRTJ0lsQdgdGzgbYWHUg/apYZhas=;
 b=OAJZ1bh3RyNCLiSaG5Go3GiVjhe9cAyu68ON6tC41o/5ecpKpkllDbj3J5Vx8hpn5Wfvk1LxgJAPv3UBsyRdTOkRhkpMhFcD4nd3K9LCw9Igh2haOnrzuUhxD9NQF+ZZ10NSwTFSMXRMyMVMa2dapNSNqq4pxtzAWqI8pL27TMY=
Received: from SJ0PR03CA0377.namprd03.prod.outlook.com (2603:10b6:a03:3a1::22)
 by SN7PR10MB6329.namprd10.prod.outlook.com (2603:10b6:806:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 16:26:15 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::76) by SJ0PR03CA0377.outlook.office365.com
 (2603:10b6:a03:3a1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 16:26:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 16:26:13 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 11:26:10 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 11:26:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 11:26:10 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645GQAGZ3352059;
	Tue, 5 May 2026 11:26:10 -0500
Message-ID: <a8d8e93d-fa20-4175-a615-27876960a175@ti.com>
Date: Tue, 5 May 2026 11:26:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add k3-am62l3-beaglebadge
To: Andrew Davis <afd@ti.com>, Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260501233148.4180391-1-jm@ti.com>
 <20260501233148.4180391-3-jm@ti.com>
 <20260504161900.sivd2s4roiqtnsc7@bryanbrattlof.com>
 <073e52f1-f5d0-43aa-b9f0-d4f179838f10@ti.com>
 <c8cf753b-f542-40bd-b1ef-a06720b2106c@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <c8cf753b-f542-40bd-b1ef-a06720b2106c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|SN7PR10MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 66948387-3ea1-4474-7e3b-08deaac3066f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6aQp/+cezrrdr6EKTlkC1ZkJXU6hX0LxS71GtXFnVquObWBC2xJSuBVyQOjbYyxokG9AQ7I+FnEvbQhYr5RGOHvQLkMZ1CYbsLLCAcmXatXNnduJ/1ijnEaL3zaPxFLoGeC/ufacRVSiDnLAFv0i6yznsgtYJN5EZ+bgSb+pzWMdlMeHmHPHqyzPgFHS8I682LJlT6/WSiM9z1ZnAU1zCcv9ss1vE2YIUpkZJQY81nrmg3lHtLIvbLnBFqygoxqXLTAbcqPVPY4S6B1/KuxArcCU1yKgpJVWCdgaCPxNzEB1XnlCn7Stzxt+tnhUX/UeFQ8275xdvOlfohlE4VaIF8/5sEQVgOKQY7NaHTssebpSKaspaeydnxEMlBVkjIBBjiev8tpDtu+TmCJPxh3OBb5LedS7n6TwqnZ8rw8ugVjsHSjiEBfVoQwfEEnwFdAaG8zzYEqbPbeGgJWLJnqJ5kDrbco9bJgRdnpFdPrESKqwFoY1dhSKDHVMcPHDM73yXH47RXSi49p9jva2I4F8aO0mdP5npRvI8s9ErmKuFrcQysr83AjBsn8KKCdgOYbFvNml3XB8UMmmRVBKFmo5ySojfhlziFuAHpX+KEM/p72W4DIACkkfakeBZlKiYQPizOQkcPmGHekfr4i1mbXNQ9JF/OFIli5ONLqddpsOS6E=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4j4ZdsuRJnDcjJFNnZwFpQUBjmyL4dMRA6gPeOsGWLu1+WkYb3Ell6FBzbiOlZMuLV7tecQLxRSk5qwjCVVjI7RSjg74Bm/JjUuyhAdYEaZSVRmNskFsn4OgNwdnNjJZVB2FnFHwLPiyHsbLRHNjOgcsI7xmDX3xocgOD5PoV9Ib407T3Ml9URb6RCxk/oQLjm5jWwuZdl1qHvm+xViuNv6WJRM4Uj+Vr6LZAISDJC/XXEik60jHKLO6oDNluqg65qtgwwU7yDGzjll/h6UwiaZKPzrImIIuCaDwX/rK1xuA8cRdlTbdVRTPaylGFcond0jb7xuSve9cjNtHntchxnW//QcS9UMmXFEhFja9ssioF/seuKIO53NQoFNKIWgyhSbsBHErgnb43m5SRY7regsJNEn4DoDjqeA5L2/Beijfj0h9dct5eVSEt+Yh5JUp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:26:13.4838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66948387-3ea1-4474-7e3b-08deaac3066f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_092654_163746_BF6020B6 
X-CRM114-Status: GOOD (  21.63  )
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

On 5/5/26 11:01 AM, Andrew Davis wrote:
> On 5/5/26 10:48 AM, Judith Mendez wrote:
>> Hi Bryan, all,
>>
>> On 5/4/26 11:19 AM, Bryan Brattlof wrote:
>>> On May  1, 2026 thus sayeth Judith Mendez:
>>>> BeagleBoard.org BeagleBadge is a compact, affordable open source
>>>> hardware single board computer based on the Texas Instruments AM62L3
>>>> SoC designed for IoT and embedded applications with low power 
>>>> consumption.
>>>> Expansion is provided over open standards based headers including
>>>> QWIIC and GPIO interfaces.
>>>>
>>>> https://beagleboard.org/
>>>> https://github.com/beagleboard/BeagleBadge
>>>>
>>>> Co-developed-by: Andrew Davis <afd@ti.com>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>> ---
>>>>   arch/arm64/boot/dts/ti/Makefile            |   1 +
>>>>   arch/arm64/boot/dts/ti/k3-am62l3-badge.dts | 655 +++++++++++++++++ 
>>>> ++++
>>>
>>> ...
>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>>>> b/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>>>> new file mode 100644
>>>> index 000000000000..0125d3fec5e9
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>>>> @@ -0,0 +1,655 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * https://www.beagleboard.org/boards/beaglebadge
>>>> + *
>>>> + * Copyright (C) 2026 Texas Instruments Incorporated - https:// 
>>>> www.ti.com/
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/input/input.h>
>>>> +#include <dt-bindings/leds/common.h>
>>>> +#include <dt-bindings/net/ti-dp83867.h>
>>>> +#include "k3-am62l3.dtsi"
>>>> +#include "k3-pinctrl.h"
>>>> +
>>>> +/ {
>>>> +    compatible = "beagle,am62l3-badge", "ti,am62l3";
>>>
>>> I noticed the $subject calls it the k3-am62l3-beaglebadge do we want to
>>> name the DT that as well?
>>>
>>>> +    model = "BeagleBoard.org BeagleBadge";
>>>> +
>>>
>>
>> So I see other beagle boards have the following:
>>
>> beagle,am67a-beagley-ai in k3-am67a-beagley-ai.dts
>> beagle,am625-beagleplay in k3-am625-beagleplay.dts
>> beagle,am62-pocketbeagle2 in k3-am62-pocketbeagle2.dts
>> beagle,j721e-beagleboneai64 in k3-j721e-beagleboneai64.dts
>>
>> so I think we should be using:
>>
>> beagle,am62l3-beaglebadge in k3-am62l3-beaglebadge.dts
>>
>> so if it is fine with everyone will update compatible
>> & DT filename accordingly.
>>
> 
> Looks correct to me.
> 
>>>
>>>> +&sdhci2 {
>>>> +    vmmc-supply = <&wlan_en>;
>>>> +    bus-width = <4>;
>>>> +    non-removable;
>>>> +    cap-power-off-card;
>>>> +    keep-power-in-suspend;
>>>> +    #address-cells = <1>;
>>>> +    #size-cells = <0>;
>>>> +    pinctrl-names = "default";
>>>> +    pinctrl-0 = <&mmc2_pins_default>;
>>>> +    ti,driver-strength-ohm = <50>;
>>>> +    ti,fails-without-test-cd;
>>>> +    status = "okay";
>>>> +
>>>> +    wlcore: wlcore@2 {
>>>> +        compatible = "ti,cc3300";
>>>
>>> Sadly this only exists on our evil vendor tree :/
>>
>> So sure, I saw that the WIFI driver is not in mainline,
>> but I also referenced beagleplay series & it seems
>> like as long as the hardware is described properly,
>> the node can be upstreamed. Please correct me if I
>> am wrong here..
>>
> 
> Only in some special cases, but in general the driver needs
> to be upstreamed first. And even in those special cases a
> DT binding is always needed first. Otherwise how would we know
> if the node is described properly.
> 
> For Beagleplay I only see the CC1352P7 radio in DT upstream,
> and it has a proper binding[0]. For now drop the CC3300, we
> can simply add it when the driver gets upstream.
> 

got it, will drop wlcore node, thanks.

~ Judith


