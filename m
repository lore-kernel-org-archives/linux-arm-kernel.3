Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65344CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 04:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9AkB3HTQ5eeJHv0ulhyPaK6DEM+pi6U8U60+RmwISE=; b=4kxpDZl1SYgnDn5G6fz4FyhU3P
	nJ0kkXKo1CVhsSmkyJfzXoVzkJgjb4lm3aqCQtFBm81qyPehrldchiTfKNoZQ5BGWnEqS4JI/hg7N
	AvPFuad0Z6cyzlDdhw0owg5A19rNBRxJjosYGMXG/bok2KFGX5VCkXDvMUw6MWT3Wg83jDpY8w17y
	wc84qFjwHSvoIQ5ixdo6zKqlppY6UFVhgSCX9LJ41CDj1aL9ZUZwwvlTzCv/j1rS/AqxKI9lBF0S0
	OTJ7M2060pdC+O//JDDHNefMyt8W5UQuDxu7KpWTGt6fCDEZRSKvPc2NLWTGzetIV3gR230/MX1/5
	h7GtL0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNO7z-00000004Ztq-47v3;
	Thu, 14 May 2026 04:56:55 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNO7w-00000004ZtR-1mTT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 04:56:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBfUIFalWRtYFyIKHk7G/ISyhwKd9bke4aNcEG5mqudXK8jv8BP8MSJsczXDakKnpmqPfTetaBCVYGzKFZawvw7/KY8OxXHVzok107RaS5B5tzyHHeAcpsrfdnbMzQM6BC80GPMdSNU4HmUpkgMPSi8JOleqWX1ZxjG0Cap8Yo5fsf0iEinF07KU11IGtzkExWTKOoZyIvMcQiY3wTwYZAiNxkEze6qpnkzplD1EeVRhrpX6R/XTl64kIvC+HVdxEb5skOaB0MPP6i8LdaIfQJL2v1pbgZCCFEglLS1KC5x6VfztzPvAAhj/3C6Ql/zAPIFFihA8OjiFR4+Tb+sgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9AkB3HTQ5eeJHv0ulhyPaK6DEM+pi6U8U60+RmwISE=;
 b=GIYGHGEhBt3rJxBUbIpi8h0ZQn8Ndq1/65a8U2Wpx8FhpJnapU07dfOdmaDvpQWPRh3BhDvGvdgLLerxgKCy67r005xJgh5ynyLMSA12w2V/aWcQFsDCRCNaxTeAViB+CiXGMOwb9CglUQiFsTZ3BKSTdrdv5oVE8/MMzZX6xDfD4qtFSjHhkcP0tYUz/NfjQ16dnQQlW+crTw1RPpRMnpgzVRuFXKa1yhZWwvby0CPdk/VnktPxsl4n5GSL9opDRxsZH47fcnQr5GXCNKAMxxQcFZTiVDx/osyJwJpzcINuQKlM/Gg94cNDmGgv7EoYP6NGT0IqHO/Tz8fl1dKZTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9AkB3HTQ5eeJHv0ulhyPaK6DEM+pi6U8U60+RmwISE=;
 b=G3nlmlLWSikgHQO1tED7dQrUEUiJ8D+NuqbSvPJNSu6Ee1pCbv/h+e3Sbhk09KQfBFUuqTHSUodGZFIwYcAyzpbXy0px7W6fv6pSKjYGZKVTakyWUO9rcqqZ0yjGQkVQNXdpngmQZ3eOjZE7MBxcY+uQhlJ1IpV8UbhMPRdLcV8=
Received: from MN2PR19CA0010.namprd19.prod.outlook.com (2603:10b6:208:178::23)
 by DS7PR10MB5039.namprd10.prod.outlook.com (2603:10b6:5:3a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 04:56:46 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::1c) by MN2PR19CA0010.outlook.office365.com
 (2603:10b6:208:178::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 04:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 04:56:44 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 23:56:44 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 23:56:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 23:56:43 -0500
Received: from [172.24.231.152] (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64E4ubrp1324074;
	Wed, 13 May 2026 23:56:38 -0500
Message-ID: <e28d2931-004e-4935-a0b5-d554ece76fb2@ti.com>
Date: Thu, 14 May 2026 10:26:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: ti: icssg: Derive stats array lengths
 from ARRAY_SIZE
To: Jacob Keller <jacob.e.keller@intel.com>, David CARLIER
	<devnexen@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Roger Quadros
	<rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Meghana Malladi
	<m-malladi@ti.com>, Kevin Hao <haokexin@gmail.com>, Vadim Fedorenko
	<vadim.fedorenko@linux.dev>, <netdev@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20260512060627.3781329-1-danishanwar@ti.com>
 <20260512060627.3781329-2-danishanwar@ti.com>
 <CA+XhMqykBWcMdk+iNnOtUxM4MX6jpDyUwfuAVZFbjAShO9_v7Q@mail.gmail.com>
 <6a1f411c-d7ed-463b-abf1-277d8cc0c184@ti.com>
 <9fbf6682-b521-4b7e-b5b6-af91694ed051@intel.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <9fbf6682-b521-4b7e-b5b6-af91694ed051@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|DS7PR10MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: ab92c710-df13-47c9-62be-08deb175324a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|7416014|82310400026|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kdIoP8eySbRw+UYdKGdqZd14bX3pCma90ZOtpkX44ExC2aoLmFgYiakk+5PKCxMsCgyTv9BKcf+EXiUhcBbbful0IO6FbcbQfMvReDtYdjXYsgf9v0t5aQqYeqFdrISG8XUhyNV2aSWb04OGgj02fW+BnpqjXnbJPCLyHdPRKGa7mu+jssTq/Sz7u92rdBwSFgGSZ/Ei7C2Kxqkfzabv2K22O1sRRAK9gIIGSJ1gI0p5jlMfzSa/KuwVjkNvTZ5ZWSheYrFnor0fYbmOaBJNTJAaNpYrugAii5WM1ezfNGQEW9C/NbfJWzxm2RDzC5nrkirVwK/l5J9BlWnR/aiY6YZUjBYLzUXojgvgUbMIiDxb7ZePaCWDOqW0ogkS9ZA5EQStnE5pLz0cnd5aF+ClUhmUCaNRPzcKXLDvDOgPPHADvbtXCMJ7mWr/wdQeONN0sxEXxUhQdG/iLmC+3P4gD9oTu5XCIo0O+GMR0UQoaTPI2Olg2dhoNvvs4l3qVcSuU2qPLeZs0LhUQKMufaB2FCLI2nzNR9febJF+2XbCIrpW+t0jxaj91DAl0UQCXxRkqry7lZMjIzEQXIILtt9/GHHb9IXtCTfhcItViL2jR9hsCGu6RrPCfZz5qL93r8/BHRlaB+MFIAW7phDJTKPnHeRDXf4Y8U7pzJo3e8LJIHLH4dAqYr4EFC1q8FyNE607RKkNOF5tELWsvdn3nQdyoqpxTFq2KIwpT9cG1A7XmNs=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(7416014)(82310400026)(4143699003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KfLJPr2XVouiuaBvxEq2Hhjprp4DuZxl/1rQGG2ZSp7mKoWA7z5DCRQRp4EIUjCsUIy9Xym8o1VvfcR6O95s2oN+7mJjun6RTp9GdNNdV7S0A8jtyhSWRKZTjzdWcKjK2KQHNT4LzZhDFKBbNey6ShQv3G5hLz8t8SkYMuLJA1RigcEh3e1YC1SYTxR1aNlIqICkyekJDqmRQCNhvEouqJVu1V9gtPzoCxR4OdIV0BdH478RbQNm13tFGAuCshpKz0WLV4SKnj459QpxYCh9OuSl70sJJsJBLVGc15e2zI2MMUvCVXxYpqcs+3oenPk93eI5S+6RbCEDP9w25+tDpxyUDg6L1dumUPceX39O9vx5Yw7Ih1A5foNuZCbu+IkmErcDLfqUZDGN2uCbJs3v8mI3JRxZRyfw4O6xOjVhEP2W6j6eP6u4w4tt9GMKIvPU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 04:56:44.5018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab92c710-df13-47c9-62be-08deb175324a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_215652_647765_5E23FCB1 
X-CRM114-Status: GOOD (  33.93  )
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

Hi Jacob,

On 14/05/26 1:30 am, Jacob Keller wrote:
> On 5/12/2026 2:40 AM, MD Danish Anwar wrote:
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
> The way we solved this in the Intel drivers is to use a single array
> which contains both the stat name as well as the offset from the
> structure where the stat resides.
> 
> The stat string code just iterates over the stat list for the strings,
> while the stat value code iterates the array and computes the stat
> address from the offset and size and base structure pointer. Each object
> that has stats has its own stat array structure.
> 
> This is probably overkill, but the advantage is that the strings and
> their values are stored together and adding a new stat is as simple as
> adding a new entry to that list.
> 
> I.e.
> 
> struct ice_stats {
>         char stat_string[ETH_GSTRING_LEN];
>         int sizeof_stat;
>         int stat_offset;
> };
> 
> #define ICE_STAT(_type, _name, _stat) { \
>         .stat_string = _name, \
>         .sizeof_stat = sizeof_field(_type, _stat), \
>         .stat_offset = offsetof(_type, _stat) \
> }
> 
> #define ICE_VSI_STAT(_name, _stat) \
>                 ICE_STAT(struct ice_vsi, _name, _stat)
> #define ICE_PF_STAT(_name, _stat) \
>                 ICE_STAT(struct ice_pf, _name, _stat)
> 
> 
> Then the stats for the individial arrays are defined like this:
> 
> static const struct ice_stats ice_gstrings_vsi_stats[] = {
>         ICE_VSI_STAT(ICE_RX_UNICAST, eth_stats.rx_unicast),
>         ICE_VSI_STAT(ICE_TX_UNICAST, eth_stats.tx_unicast),
>         ICE_VSI_STAT(ICE_RX_MULTICAST, eth_stats.rx_multicast),
>         ICE_VSI_STAT(ICE_TX_MULTICAST, eth_stats.tx_multicast),
>         ICE_VSI_STAT(ICE_RX_BROADCAST, eth_stats.rx_broadcast),
>         ICE_VSI_STAT(ICE_TX_BROADCAST, eth_stats.tx_broadcast),
> 	...
> };
> 
> (Note, ICE_RX_UNICAST is a macro that defines the string value.. I don't
> recall who changed this to macros or why vs just having the strings be
> directly in the definition...)
> 

Thanks for sharing the ice driver pattern — that's a clean design.

> This is probably a lot bigger refactor to make work, and may not be
> exactly suitable for your driver. I've considered "upgrading" these data

Yes, I need to see if refactoring is applicable to ICSSG or not. I will
look into this and send a separate patch / series in future if
applicable. For this series I will stick with what David Carlier suggested.

> structures and logic as helpers to the core ethtool code (or perhaps
> now, to libeth) but never got around to it.


-- 
Thanks and Regards,
Danish


