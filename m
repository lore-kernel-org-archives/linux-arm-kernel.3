Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CC0CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 06:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6+9KPfEJ5h+OEIBame0A/5A0RWvWSnYqew22Xfcc/w=; b=Sf8DI7svGf+XFPbqLu5++liLdI
	2rNEIQiVm7wynEW10SXM71ftMGT4d8+OjjqmDEdGauHY0T11U/jcy0uw5K9afl5KZ3P61d8xEV3kt
	hW0rdnITkEEwsHuVC8S4CwW7xaDsbkhEBWvJOyL64oHV2SIeGbESVcUTWAafxUSSmZsZgUSzSt8IH
	DJQR7lSWT9VLTDl33eWc2md6HG52xkkC5hBMkeBjcvM5BcPUCB6EsZVEsB5g0vKnIW78EZ0GNazc7
	7po5leOExTOSC6V7P/VrpM+grF1vAkKPNvwYqS/8icduSHgpRYBekd3eL48Yyrnnwgzgan3cVv/nt
	+Yk6jcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXDy-0000000D5X7-1Lfz;
	Wed, 05 Nov 2025 06:42:30 +0000
Received: from mail-westusazhn150120001.outbound.protection.outlook.com ([2a01:111:f403:d800::1] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXDt-0000000D5Ve-2UCN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 06:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgUqongUnsDUJVckLYdaQMSWh0V5dQsb7fsw3XKg1PDdirsav44pKZ56c22zbA8I7vaLkHvLKKoaMQCCvOhj+CGds7gdbkOH92jE/U0EKwfpd1GvpTKnpoFCSZhEmFFlOiJ1s8tPexJDolPvxeKsplVKORl7BQl5p0mx1hpPJPJuJyjcv1ICS1DO+tjbXEbcfLJ15TPRgq5TMtvWBBeEisS2cNtps9trzrJCM7xibN3ivVPbiGN4kyRFtSxXz74AAjzCfNxMQTMvWSwEJNlZ3BykrGEmQ76pOChRi5I4hCGHjnWL27PNTUIeab4LWYtv3mHOVeapsubaa1efbajMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6+9KPfEJ5h+OEIBame0A/5A0RWvWSnYqew22Xfcc/w=;
 b=B8HX07GtNjm3toJVmMCVJBVCwLYDp0RLACaaItsJSs3MuNIWuO7JFk/m2BonPBAGMlktZBHJikP06xNb+kSdy7cSMuVoMWdASfxGebUANRcLuWpZIoSeoCI8eT6ZycuxUc84UVx7G9voSFgrxqp+YmWRw4N+KvW95i9tDd7QecadLSZSJTl9wKQ3KxmwGxIDO4S56XpOiLt6gE4U1w2k0l0uLE2xwGDJdY3kvwrYXsSIyu4f90zMTx6WiNGFJ/l8oKNacUMoTHl3UJpN7VRke7wEXYG3psQN8yZvbSynwiRS9VdesEMxUYhAa0xrArDVI30V/mqzn6v0hjQNpoOkcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6+9KPfEJ5h+OEIBame0A/5A0RWvWSnYqew22Xfcc/w=;
 b=mmZJ2AqhkC75CdWKwaXBR+vJIXZWJFUxHmbsYUQVdnCvK43bViOSztfm0iAL5PK6QMxtttizoVGBkIbdp4dGzRWX5e2Raia2P8odwZULq04Mku6vJRvMwyVtlqUAItCLueYLnIvVgfsbPTTpyvalhuTw3oRDzUDadiXeFgct54k=
Received: from BN0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:408:e6::20)
 by CY5PR10MB5939.namprd10.prod.outlook.com (2603:10b6:930:e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 06:42:20 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::52) by BN0PR03CA0015.outlook.office365.com
 (2603:10b6:408:e6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 06:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 06:42:17 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 00:42:14 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 00:42:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 00:42:14 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A56g7JC3271680;
	Wed, 5 Nov 2025 00:42:07 -0600
Message-ID: <7fcb1434-2ff1-408c-934b-9b87cee926c8@ti.com>
Date: Wed, 5 Nov 2025 12:12:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net-next v4 2/6] net: ti: icssg-prueth: Add
 XSK pool helpers
To: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>, <horms@kernel.org>,
	<namcao@linutronix.de>, <vadim.fedorenko@linux.dev>,
	<jacob.e.keller@intel.com>, <christian.koenig@amd.com>,
	<sumit.semwal@linaro.org>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
	<hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
	<edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
	<linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20251023093927.1878411-1-m-malladi@ti.com>
 <20251023093927.1878411-3-m-malladi@ti.com>
 <05efdc9a-8704-476e-8179-1a9fc0ada749@redhat.com>
 <ba1b48dc-b544-4c4b-be8a-d39b104cda21@ti.com>
 <c792f4da-3385-4c14-a625-e31b09675c32@ti.com>
 <20251104154828.7aa20642@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <20251104154828.7aa20642@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|CY5PR10MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 001f4920-7315-47c4-f26e-08de1c3676d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|34020700016|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1RsTGZSQ0tUc211MUdJWGhNWUkyNFc2ekp5MG05MEcvQlBRSFUvdHR1VnFi?=
 =?utf-8?B?Yzk3NFJHM2NpTVpiVDJmOVdpM1RKaGZ2K29YZUlhdVlWdElDK2FpVEQ0N1pw?=
 =?utf-8?B?Q0tseGdsalF4VDlBS2VUSFdjR2wyUjcwWkZKOHBMbDNVYzdwUHFGdE1mY2hS?=
 =?utf-8?B?UThmbytvK3FqRys4RE9NVmFVSDNVZWdubDUvZlJFYVZvWFcxTFVsbHducS9l?=
 =?utf-8?B?NTV3ZXp6RXpGemQ1Z08rODQ2VFNzMU1kMmtTNTlEYmljZDBHTDFBMXYxaDk0?=
 =?utf-8?B?MzBjM1laaXhPVmtJeVBjbkhWZEh0YUFWWGNGcUxoUlpybFRiaEJRdklIN1Fr?=
 =?utf-8?B?L1ROUUJjUGVHb3E1QmRxb1phRy9yYzJtRUxtaER3T2NDTFpocW1mMENHdHh2?=
 =?utf-8?B?QmtxaXcxY2dkRHM1QWNGZTJKSUdLSjluMXYyZEhnTlZXNWZVMFQ1QlR2NlZJ?=
 =?utf-8?B?bnptZjc1ZE5ZUjZFaGYwanpvNENIVFhTUTBlMnY4bkx4OTdpeDQrdE5vVjNF?=
 =?utf-8?B?cUEvSWw5T0VDTGcxMU1XWEhQd1EwMDJRbzFaRk1sallLWGtQbXIxcHVXUXRC?=
 =?utf-8?B?WnAwTitOWStpT2NlZjMxVUtKYWhTbjRkY0Z2ZG5DdmZmc2hweVgxSzFUeVNj?=
 =?utf-8?B?a2lCc1l1UDlFTUJ6MmxiU0JSYjdQdWFSNHNaY292eDBQOWpLcEk2Vzh5dm91?=
 =?utf-8?B?R2hPeVVEZTBCUUt2MTJWSmkzb2p6djIzRlBsU2VEQWk0LzJYNC9od3p1anpC?=
 =?utf-8?B?NCtyM0Y0bGFQZEEwVldyMkJsZjlHZ0JLN2JjQ0s4L0pPQ0NmZ1JpY2w4T1NI?=
 =?utf-8?B?ZFNyWndoMUlzRW1zN1c2VEpRazZvVzlQY3RUYnY2VmVneXM3TUljampiNHJD?=
 =?utf-8?B?OXoxeFdJSTBhbzhpZFc4YmlHWEllVnZGVmtUVE1QRkpIUGpkOTg5b1NXcTh5?=
 =?utf-8?B?MjNpQ0FTSDlnZFl5aXdUa2Z4R050NzlMeDd4eDV6UkQrUDJNRW53OElSck84?=
 =?utf-8?B?Ry9YUEVRVEkwZnhCd1c4YkdZd0lVYWF2YVY4SVBoZXJFazk0bDJUTmRXYW9o?=
 =?utf-8?B?ZlZkQ0pHSmJXaGtEQXkzWjlDS2hNTzBmU0FEb2tUQTBuTnhxaXBQK0JWVEpK?=
 =?utf-8?B?UzdYQk1POFRiaDNOeUJONFBzNTU2d0tVQzNOeFNSRGZmU3lNL0FqQm5uSG4v?=
 =?utf-8?B?di9hYlpJWlFtVWZoczhML1h6eDlYMEkzbTB3bkhuVWlSY2cvd1psN0ZaWDlv?=
 =?utf-8?B?cHozSmJMeDFJY1M4d3FucU56dm9QSk1xSG4wV0dINE52enF2b0lybEIyQ1lQ?=
 =?utf-8?B?aGVjbHJXLzE3L0hXRGVHRGM4ZzJ2WFB2ajVvUUxHTXVobXpsOTJpUlVqa0RV?=
 =?utf-8?B?aVdTaFpHNVlnbHJnZmpzMEoxVGIzVzZ5WEJmaDBKcDN2R2E1VnFLQlBRaW9h?=
 =?utf-8?B?Z3JoVG9rS3lXRDAzVGNWU3FpSkVvakJ0c2pUaDRucDliWGhkWjBiL1c4Ui9a?=
 =?utf-8?B?ZFdROWQ3WWw5bkZZbDNza1lWNk9OSzhzdy8ycmxlc1pYRWR2d2poc0U2Vk01?=
 =?utf-8?B?M3AvemZmQUJwU0tYTlJhMmZ4NzRUMHRTbnluRHZlY0FORmd1RUl1Z09YVTZP?=
 =?utf-8?B?aXBrUWE3dVFiaVpyb0lzbDZ1VURjb1FKMVZYcjNBQmh0Q084aU9XY2h1MUdz?=
 =?utf-8?B?WWMwSXVySGxoNGFWSkEzVU9wNDZMOXo4S3Q3R0loTkRKdndacEZ5cVlQUGVK?=
 =?utf-8?B?dmpYVjQ3TVF2VXg1dTZId0pEaVoxMEYxclNnN1Ywc2UwVy9Cd2Zock43OG16?=
 =?utf-8?B?RmcxdWtUVXEzRDJTcHBEMU5iWUlpR1J1UDdjUDJINGdRbTZzTElBQ0tBdlA1?=
 =?utf-8?B?b2k4Y29yRGNQdnJQWEF4a2lyM2dpd215SVE5VGgwK0s3cWJBbHJxclkyTDFa?=
 =?utf-8?B?SWhheUdBUDh0MTV6WWFWeVA2UFl5TlhRdXRsN0xYaW85djFPM1lyalg0Y2pN?=
 =?utf-8?B?aGVCWnJlVXVSN0dOeTlqbndUeEFjVFcwQi94Smp2U1BpSTlsRGZqT3R0b1Az?=
 =?utf-8?B?S0psUlh0dHZiM1FJYTZuZnNaN01HSnZyWnk5bnRJNlNEZm1ZcjVXanlLMEhr?=
 =?utf-8?Q?l0t4=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(34020700016)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 06:42:17.9367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 001f4920-7315-47c4-f26e-08de1c3676d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5939
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_224227_349119_F40C9088 
X-CRM114-Status: GOOD (  15.99  )
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

Hi Jakub,

On 11/5/25 05:18, Jakub Kicinski wrote:
> On Tue, 4 Nov 2025 14:23:24 +0530 Meghana Malladi wrote:
>>> I tried honoring Jakub's comment to avoid freeing the rx memory wherever
>>> necessary.
>>>
>>> "In case of icssg driver, freeing the rx memory is necessary as the
>>> rx descriptor memory is owned by the cppi dma controller and can be
>>> mapped to a single memory model (pages/xdp buffers) at a given time.
>>> In order to remap it, the memory needs to be freed and reallocated."
>>
>> Just to make sure we are on the same page, does the above explanation
>> make sense to you or do you want me to make any changes in this series
>> for v5 ?
> 
> No. Based on your reply below you seem to understand what is being
> asked, so you're expected to do it.
> 

Yes, this series currently implements whatever Paolo mentioned below.

>>>> I think you should:
>>>> - stop the H/W from processing incoming packets,
>>>> - spool all the pending packets
>>>> - attach/detach the xsk_pool
>>>> - refill the ring
>>>> - re-enable the H/W
>>>
>>> Current implementation follows the same sequence:
>>> 1. Does a channel teardown -> stop incoming traffic
>>> 2. free the rx descriptors from free queue and completion queue -> spool
>>> all pending packets/descriptors
>>> 3. attach/detach the xsk pool
>>> 4. allocate rx descriptors and fill the freeq after mapping them to the
>>> correct memory buffers -> refill the ring
>>> 5. restart the NAPI - re-enable the H/W to recv the traffic
>>>

Sorry for the confusion. Whatever I mentioned below might have given an 
impression that there was additional required work; that wasn’t my 
intention. What I described is only a possible design enhancement and 
not mandatory. The current patch series is complete and does not have 
gaps in its design.

>>> I am still working on skipping 2 and 4 steps but this will be a long
>>> shot. Need to make sure all corner cases are getting covered. If this
>>> approach looks doable without causing any regressions I might post it as
>>> a followup patch later in the future.




