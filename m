Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6318CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 06:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTkGtLaOp1Dk7UbUbREO9PsNtfreYaVK6p335C3wknI=; b=VpR5sBl86SVhZ9xWt7H2EG+AhN
	44JrvzYsxWC/IPAo1NBQkUhf7rGPrm77lIukgWLLqfVNmOKZ0pxDBKA0Y+jnOTVKrgamopRZBiq4X
	oxMHzKh8m09YImHJR2wOL65GYMjsqWJYcscqTYBISGut9V68oDXV9M00FiDGwJ8BC0kovzHeolFb0
	xBeJbP8dt81WUm0puh3nagyh35Zds1rKkQIXT6RL+2ZxmUr4nYvs7IQugAdn2yI+Vbt4b6Gwcj2ng
	W+OD7DRguslf1IBdkP1KuYeE9b3C45E+aD4C11xL9VxvXMrsOcnSWev+QDyiTj5HaGO5leZ5Ulfdq
	TMAb6XOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN36F-00000001RDX-1aUo;
	Wed, 13 May 2026 06:29:43 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN36C-00000001RCp-1fI7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 06:29:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yde0CNsSl6+vnyew8p0llU0Eek+xYRTHZNhbZdIvXjpR/na62GZ45nBxyqdchkFLOhxVgxpnC6mRCYHzdhvaDjJeEC1Zv5c/Uvl11FLCl6dxsSzStmqpmke6WkYYAyx7iky1H51YIyWmgkBEjOi6uOdvrl7xPEBIL16mYma2Nmeh6r4Df90aCteuPgOW+dsJQRsnoWS+g9D8KRs0KO/0DZ/iuw0zod1LOjfnWNWiqtqfSaVP6prRcUfiE9pwbk5w5JPxK6iPljtA/1ko44VZq1R4pGTmYULf3GXxX5xmJX8gNi2Q65SE9MGoTyo0SUzCaCpaPFbdINR+RPHLmfESbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTkGtLaOp1Dk7UbUbREO9PsNtfreYaVK6p335C3wknI=;
 b=Tnre0iyCezVkjaptmPofx2rzSdncTRo0HNfsLqLveGj1G+hS1sHsosBHn7x4na1OTVtGb0EZBJzCYuFrtRY47zeFFdnrcsM8ZW8uMUSKt3IQjOvlk5niWBfuELXlthCqyqfq+GuCKBXMHpO2KqmJf5yRDoK8xdCUbzQGGkXaZ1DLB3/9+IiB+khXFgjVx6BOANJ9O91CLgTz+NNja28kEhcgor1BU+IAUA6XQmCKmqUn971WULSulp58u7gTh7L/SfRktHxBzFVXxeKsN2qNjlJVQhslV990xra2dfDvLe7+Cdm2DE6SemNQgEh9+o7gVlf8WFGMAZV5Dg4Nj7xg1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTkGtLaOp1Dk7UbUbREO9PsNtfreYaVK6p335C3wknI=;
 b=paBcauauJM3AvJWaKIBehs52VqdRd2m/sAMFZZdp9g6hT/sCuR2UXyKERypztjv5xuTNK0DcqmzZmkF6Pkd8hrF74xbxO0e71uf1JIbcwufAmsMNvbhyPu9zXinSnMCv1mRiRPs8iLfLIdRD0qW5JIbDRpu9mVX3YyKn/48mLac=
Received: from CH0PR03CA0425.namprd03.prod.outlook.com (2603:10b6:610:10e::27)
 by DS0PR10MB7429.namprd10.prod.outlook.com (2603:10b6:8:15d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 06:29:31 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::69) by CH0PR03CA0425.outlook.office365.com
 (2603:10b6:610:10e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 06:29:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 06:29:30 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 01:29:10 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 01:29:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 01:29:10 -0500
Received: from [172.24.231.152] (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64D6T4lA3474869;
	Wed, 13 May 2026 01:29:05 -0500
Message-ID: <54fae7f6-fcb9-4520-a79a-569426ab96f1@ti.com>
Date: Wed, 13 May 2026 11:59:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: ti: icssg: Derive stats array lengths
 from ARRAY_SIZE
To: David CARLIER <devnexen@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Roger Quadros
	<rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Jacob Keller
	<jacob.e.keller@intel.com>, Meghana Malladi <m-malladi@ti.com>, Kevin Hao
	<haokexin@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	<netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
References: <20260512060627.3781329-1-danishanwar@ti.com>
 <20260512060627.3781329-2-danishanwar@ti.com>
 <CA+XhMqykBWcMdk+iNnOtUxM4MX6jpDyUwfuAVZFbjAShO9_v7Q@mail.gmail.com>
 <6a1f411c-d7ed-463b-abf1-277d8cc0c184@ti.com>
 <CA+XhMqzx9CUX5H7q1UqL=heGWLFjZVfyiTx6b45VW=E9t13Fow@mail.gmail.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <CA+XhMqzx9CUX5H7q1UqL=heGWLFjZVfyiTx6b45VW=E9t13Fow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|DS0PR10MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: a6daf508-ebe1-4427-1fa7-08deb0b8fd38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZKR+LKNtrIhLwPKC71ZjMgo4kBUUb0p98FGzE0BZ4lsQ0/03nBjUMEC4h0PGy/l9XxL3FIO19Zh++IgScnd3WkSgYmqTaey6OJI4Q5WFQuLq4Ycv023QpRVSGSUf11+LcOOYnON7YU15s1+4XJyoB6rz+MBZGd0W5l2RNg+btf4zu+mC1hhq4nuu2I+MTfijomto4JW5nw0Zywe975Ly2p1XAthRlPz4QgPmp7zXEVOx9uNytfnyBJONfpECAM03ESU8mQowmcmPZqk76uBsqW9Oozc7CLGMWuLtsZtNLt+3rprSCjem5P23VoRuHVQMeC6vdSsw0LMcMzDPw35HS8a7DPkYQPsygj27hCbwQOziOPPugpDgsUD/eGu/3MnFKO5BIk5gWkHSdmcnQaW1j9pPQHkpYfnWiRcgDdh7wUOEFotFOG8PrkJix2K7p4QKyzVmEpHZTVvC6EfagU5XtgUx1fp0hUeSB948jbT1zzYyqYhZtJ2qXoEtc+WWcJngzHHctiMGcinCjcXrxFu3he6iYetxiqg3SR3xT0Fv+CZeXn1sRb7QLfhEEhTXC3v/hPKjnqsDdGXfJWnIiPgqWhrwXDk4qF3YAgLdNqEIgJMs6TK+6nCESpt324Df/DhwbXCiPXjg9mybpxqIt61ytoAKQITEE0aMHXpA1fqPAFmd8lAO/wMPbSvZWBVfT3tN
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nCiuDAnJcC4Z6IEKNY6lM0R2JjZw+NEY9+ayI6bHWNm0pKRJOp+/THOOpS0zxPSX9nm6i8y+ilvJQk5K37ZjbL0hq+qrsrevvF+aUSIuOGZgR8gjhxSGp1HSFWUbqGu7D4aBrAx4Ga9rJiBhh6sNQwLWibFFRZq3OvRmsDGpcmpK1JD+5SpH/igtrKpLL9cuX/sFwzhoazgFQc+rr/Ux/T0J9bhQTw9FYHCqvvo+PDVvlU7tdmgiJndS3JOeF4cU+/eYG76J4LLWPbq4oKvtPlfmM/rEsckGuFhDt/jy89G3GzVQoz2CHvd1/JYVkBImiaLWcVMf54Qv/aBWZObTDfYtmOYauB2p0aRRROgEJT9ACLUZv4ykscGSWf2ax2KeMxgSuFX9gW9SMvSxMYYDLBp05XvWL35S41nXR4NhLXexS1gjnqBAruiEQ57n2WlV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 06:29:30.1063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6daf508-ebe1-4427-1fa7-08deb0b8fd38
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_232940_683119_8AA13D9B 
X-CRM114-Status: GOOD (  34.63  )
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

Hi David

On 12/05/26 3:33 pm, David CARLIER wrote:
> Hi Danish,
> 
> 
> On Tue, 12 May 2026 at 10:40, MD Danish Anwar <danishanwar@ti.com> wrote:
>>
>> Hi David,
>>
>> On 12/05/26 1:28 pm, David CARLIER wrote:
>>> Hi MD,
>>>
>>> On Tue, 12 May 2026 at 07:06, MD Danish Anwar <danishanwar@ti.com> wrote:
>>>>
>>>> Replace the manually maintained ICSSG_NUM_MIIG_STATS and
>>>> ICSSG_NUM_PA_STATS constants with ARRAY_SIZE() expressions derived
>>>> directly from the corresponding stat descriptor arrays, so that adding
>>>> new entries to icssg_all_miig_stats[] or icssg_all_pa_stats[] no longer
>>>> requires a separate update to a numeric constant.
>>>>
>>>> To make this self-contained, break the circular include dependency
>>>> between icssg_stats.h and icssg_prueth.h:
>>>>
>>>>   - icssg_stats.h previously included icssg_prueth.h (transitively
>>>>     pulling in icssg_switch_map.h and ETH_GSTRING_LEN).  Replace that
>>>>     with direct includes of <linux/ethtool.h>, <linux/kernel.h> and
>>>>     "icssg_switch_map.h".
>>>>
>>>>   - icssg_prueth.h now includes icssg_stats.h, giving it access to
>>>>     the ARRAY_SIZE-based ICSSG_NUM_MIIG_STATS and ICSSG_NUM_PA_STATS
>>>>     before they are used in the prueth_emac struct and ICSSG_NUM_STATS.
>>>>
>>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>>> ---
>>>>  drivers/net/ethernet/ti/icssg/icssg_prueth.h | 3 +--
>>>>  drivers/net/ethernet/ti/icssg/icssg_stats.h  | 7 ++++++-
>>>>  2 files changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>>>> index df93d15c5b78..e2ccecb0a0dd 100644
>>>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>>>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>>>> @@ -43,6 +43,7 @@
>>>>
>>>>  #include "icssg_config.h"
>>>>  #include "icss_iep.h"
>>>> +#include "icssg_stats.h"
>>>>  #include "icssg_switch_map.h"
>>>>
>>>>  #define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
>>>> @@ -57,8 +58,6 @@
>>>>
>>>>  #define ICSSG_MAX_RFLOWS       8       /* per slice */
>>>>
>>>> -#define ICSSG_NUM_PA_STATS     32
>>>> -#define ICSSG_NUM_MIIG_STATS   60
>>>>  /* Number of ICSSG related stats */
>>>>  #define ICSSG_NUM_STATS (ICSSG_NUM_MIIG_STATS + ICSSG_NUM_PA_STATS)
>>>>  #define ICSSG_NUM_STANDARD_STATS 31
>>>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net/ethernet/ti/icssg/icssg_stats.h
>>>> index 5ec0b38e0c67..b854eb587c1e 100644
>>>> --- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
>>>> +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
>>>> @@ -8,10 +8,15 @@
>>>>  #ifndef __NET_TI_ICSSG_STATS_H
>>>>  #define __NET_TI_ICSSG_STATS_H
>>>>
>>>> -#include "icssg_prueth.h"
>>>> +#include <linux/ethtool.h>
>>>> +#include <linux/kernel.h>
>>>> +#include "icssg_switch_map.h"
>>>>
>>>>  #define STATS_TIME_LIMIT_1G_MS    25000    /* 25 seconds @ 1G */
>>>>
>>>> +#define ICSSG_NUM_MIIG_STATS   ARRAY_SIZE(icssg_all_miig_stats)
>>>> +#define ICSSG_NUM_PA_STATS     ARRAY_SIZE(icssg_all_pa_stats)
>>>> +
>>>>  struct miig_stats_regs {
>>>>         /* Rx */
>>>>         u32 rx_packets;
>>>> --
>>>> 2.34.1
>>>>
>>>
>>> One thing that caught my eye: icssg_all_miig_stats[] and
>>>   icssg_all_pa_stats[] are 'static const' arrays in icssg_stats.h with
>>>   ETH_GSTRING_LEN name buffers per entry. Right now only icssg_stats.c
>>>   and icssg_ethtool.c pull them in. After this patch icssg_prueth.h
>>>   includes icssg_stats.h, so every .c in the driver (classifier,
>>>   common, config, mii_cfg, queues, switchdev, ...) ends up with its own
>>>   static-const copy of both tables.
>>>
>>>   Would a static_assert() work for what you're after? Something like:
>>>
>>
>> While adding more stats manually, The ARRAY_SIZE() approach was
>> explicitly requested by maintainer [1]:
>>
>> This patch is a direct response to that feedback. static_assert() would
>> still require updating the numeric constant on every array change. The
>> goal here is to eliminate the need of manually incrementing stats count
>> whenever new stats are added
>>
>> Your concern about multiple copies of table is noted and valid. Could
>> you advise on the preferred way to reconcile these two requirements? I
>> am happy to restructure if there is an approach that satisfies both.
>>
>> [1]
>> https://lore.kernel.org/all/20260112181436.4s5ceywwembn674r@skbuf/#:~:text=Can%27t%20this%20be%20expressed%20as%20ARRAY_SIZE(icssg_all_pa_stats)%3F%20It%20is%20very%0Afragile%20to%20have%20to%20count%20and%20update%20this%20manually.
>>
>>
>>>     static const struct icssg_miig_stats icssg_all_miig_stats[] = {
>>>         ...
>>>     };
>>>     static_assert(ARRAY_SIZE(icssg_all_miig_stats) == ICSSG_NUM_MIIG_STATS);
>>>
>>>   next to each array, keeping the numeric #defines as-is. Then 2/2 fails
>>>   to build the moment a new entry is added without bumping the count,
>>>   which is the case you're guarding against — without touching the
>>>   include graph.
>>>
>>> What do you think ?
>>>
>>> Cheers.
>>
>> --
>> Thanks and Regards,
>> Danish
>>
> 
> 
>   Thanks for digging up the context — fair point, I'd missed Vladimir's
>   earlier ask. Reading it again though, what he calls fragile is the
>   silent miscount, not the keystroke of typing a number. A static_assert
>   turns "forgot to bump" into a build error, which I think gets you
>   there.
> 

Thank you for the suggestion. I think your previous suggestion fits 	
better. I believe keeping the arrays in icssg_stats.h is preferable to
moving them to icssg_stats.c. Here is my reasoning:


Your binary-bloat concern was about icssg_prueth.h including
icssg_stats.h, which would drag the static const tables into every .c
that includes icssg_prueth.h (~11 translation units). That concern is
valid, but it is specific to the include direction of the previous
patch. If we simply revert to the original include graph —
icssg_stats.h includes icssg_prueth.h, not the other way around —
only the two files that have always included icssg_stats.h directly
(icssg_stats.c and icssg_ethtool.c) get a copy of the arrays. No
regression in binary size compared to the baseline.

>   What about moving the two arrays into icssg_stats.c, declaring them
>   extern in the header, and dropping a static_assert next to each
>   definition? Numeric #defines stay where they are, icssg_prueth.h
>   doesn't need to know about icssg_stats.h, and the tables live in one
>   TU instead of every .o in the driver. If the count and the array
>   disagree, you get a compile error on the spot.
> 

Moving the arrays to icssg_stats.c (approach #2) adds extern
declarations, splits the definition from the static_assert, and is a
larger restructuring for the same safety guarantee. Keeping the arrays
in the header with a static_assert immediately after each one is a
2-line diff and leaves the code easy to read in one place.

Please let me know if this sounds okay to you. I will send out a v2 soon
if this approach is fine with you.

>   Probably worth keeping Vladimir on Cc for v2 in case he had something
>   else in mind.
> 

I will CC Vladimir in v2.

-- 
Thanks and Regards,
Danish


