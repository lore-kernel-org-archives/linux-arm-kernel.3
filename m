Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D19C531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VON2fRioEr+TslOcAVnLaO0rV/n3EKwnwZPm48p6l/E=; b=5BxQP4OpMoB82gg1I3/okxxBXF
	QuaYBup1V0NQl0I24ggSkqmxJUXbzWfEV24GyfXSv5W2MvHeuEiyexRrosoqNQt+HLTcaWFoVTvKV
	XuolC39G+GoRV2q27DOhDvOK2pYqO7nwu+SjSpP9IL+TiOlSYcW4pa7pjKWHV5cSmxwD/WSPvADOd
	ZHIz9Fg1KAVAKCkjK5nGMab0D7qg+nCsUAelC+LJXVkFhLbpJ8EFLGc3SIXjuth8hevcVeggFl4mM
	4uZGoZgXCMgdDc9B4rF5deRv0ly9Y5n/L5H9KXpCoF7YkGM/oVDD5lVh0WXocVjWlbsvThWXdk/mh
	tlrVBjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpf5-0000000Dq2y-48hM;
	Thu, 23 Jul 2026 09:24:16 +0000
Received: from mail-westcentralusazon11010004.outbound.protection.outlook.com ([40.93.198.4] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpf3-0000000Dq2W-0WMj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfjqFiibcIYIft0bVF1J4AvbKqudIjlF6eqYV37rt61Cw0Wnz4W3skVcRhSHyPjziHEMbRC60tvdm9bVvnp1PYRdERH2+M/mYdAVd21n6/ZZ1MTVA/JUq9Y5uQxY0rH9eCJ67IZOiQSTNfm5PfVhoMJnsVgH5LtGH+tE5XhwtYeEJSKngu3fd6fTuhSzCd8sJ1EQbYfG/0Hfitk8muP526ay17doLgamtgjy6DCxvuSm/rg1h6f2k8iO5b7RkrbC49+DJQhAITNu30vCEvARgPH4Ez7yIm1lpK61D1X2nIenfNYbr2ehU+zpuZaxkviDyFeFu8oejBPPe+KSJoIMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VON2fRioEr+TslOcAVnLaO0rV/n3EKwnwZPm48p6l/E=;
 b=ZnsHJsg+blPOzvThL58QZrX25j9UXFShqFQdYFiKnFOP60tDbkO/Mz4Grs0/FeLAjUTIZRINLCZ5uKidY6daf8FunWnBkWE9CcWfKsJ2xQ+z4M1CwVRMzRQXVAortfSjbA+WzZzefKQu/hCd/QNahRDXl+IMca/TZHktXPdyey0zjSrIhIJEs+QILcNvxvIuTgLaiv/TbcL4NDS5BN8DsBjX6paLJjCJz4j7Z9Ls2wsRML+OVMBAClHz/Dg4TMcTqJcPbaHnJYTtaQJoT2CXwS4qze3EF9CuyogBDC/laIIjKsib9AZd8FhOfITPFUJTvBaGVGK8MxkiwAnV2MDBCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VON2fRioEr+TslOcAVnLaO0rV/n3EKwnwZPm48p6l/E=;
 b=TYxK0ewAK0ylx7ye4otP7YifyCRIgA17skOvA8mVfTo2QHjH4NXIaxBs/8V1yJCKdDiKtlgCTitbmIIdqac/KjTjOMRBgn4WHk/AvndRTyKXCO0dbZQdX8Mv/Bqu3qG6+nuYqDjlpvkOJGpr6FEJ9mJaXFFAA7ofAFljpAX797Ku6b2Eo282YwATpWTeqx3dI9qLhcJvnpxMNTciHirEh4io+Zr4+Z8QYoM4oYuV84euyQJI6PWtDEb7Y2JqDF4t+PmKEPsLnfhrU0X1krjb4uP+KHJ7YwDZSWtVdoJGST8ojmB/8TS2jNALh9Sy5GQmJF8Fa9cyUHzRTzsFrptNFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by DS5PPFC9877909A.namprd12.prod.outlook.com (2603:10b6:f:fc00::661) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:24:06 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 09:24:06 +0000
Message-ID: <325be874-bab9-464f-84ee-99e160259923@nvidia.com>
Date: Thu, 23 Jul 2026 10:24:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Workaround bcm2712
 broken EL2 virtual timer
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 John <therealgraysky@proton.me>, Daniel Drake <dan@reactivated.net>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260710080958.491620-1-maz@kernel.org>
 <325e86ea-d4d3-4c84-ae9b-f4a08c9b071b@nvidia.com>
 <878q72rcz6.wl-maz@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <878q72rcz6.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|DS5PPFC9877909A:EE_
X-MS-Office365-Filtering-Correlation-Id: b96dd018-5c9d-4ad7-7292-08dee89c2484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|7416014|10067099003|5023799004|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /8JZsrD8lSHWXfeaI5kcIMqqwuYwo53UUaR/eFkG5NZnsLkR6GXs9MPP2CgbtYyo0XiuwAX+qLhfYhi9FF2AuDK4jJrdsituiyabhByvtjok8ZNSIKWjRZPnxrE61HH13pQ7a7TYAMHOHM+3dp+crzqCAw3rfaA3w3Y+exSrC0xIxQ5LIYIroc2/RpEyUqHJ/ddySfEJ1EiccCfF5Tt4DF4+5KjEWgrD/D2D9FYhaLvvWNiYpSLJKra1O/3xLtgzpRP3fUY0rWX8XDngHF/IlwLaoLWsOljidD8oeb1t8tWT/EVfHNBgxpMnpeg5SJqhCNUHsIuCRAOCe4FdHHv5u57sXQz/18movK7PGW6CsZ57+YxeDbotgoncVgwYAVSDyLd+Yc9j3ClctIW50K1o4ZY+TkxNoGCREv+syyf0Dk5fF5Idg9SLTKRLRfdo93pwdRVHYdY25ANqUyOXYE1lwxJvjeAtuCI5p1+cXCkGF+4UgcKyb5n2qi6FO9ZRf4/t6Ifino4jQHKI0LjZoW5EUEGzMV4V2/96tlOI0SbmLOyURZ6XNcAfvpG9S2EpFAEOek6bBQQYPikXHBfSxDq2bzOc2ZYwyRabNLo5NOOm5Xp1sBE23CjnjzNPXewnqfjjZgzmU6S4181QtcsSUO0lb3mdH7Y+aIRNojzLpHUBPLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(7416014)(10067099003)(5023799004)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?citZaW5PWFAxVm9SbjZkeS9EWnlFTTNxTHg5Yk8rTml0QmdRVjc2bDZEU3BL?=
 =?utf-8?B?amxudk1yeWQ3SDZrK3FTajJBbGhLMWVwL05UQ1JIWmpRZDg5S1VKemVMSUl6?=
 =?utf-8?B?NkJtSGd4V2RQRkZxc25RVFdmQmNyaFYyQjdFa1ROdVVTTG9QQVpqamdLNUZH?=
 =?utf-8?B?aHlzQjR1TWVmMWdrbzhRV1Urdlh3bWF4OXlHRDVyZGdKcHJvQk40T3ZDOXVw?=
 =?utf-8?B?Rmg5ZVcwVHdOZkhiM0J4eHdYbmRielc4OXRGUTltM2JYc3dST0NTS3EvTFNQ?=
 =?utf-8?B?QVpBcGJYT3R3WmErS0dwSEZwRWJPVkFhTDZDYTl0OHJVaTJVR0k3QmpxSkpp?=
 =?utf-8?B?bVBLNCs4VCs4enJxNFMvaDVzKzRwbjl1eUxTcmNyVFprMVR6NEFwaWVtalg3?=
 =?utf-8?B?R0tLSG9RUXQyaDkyRnVoQi9LckVDTUZjeUNUaWNtUWd6VzdQSmdLVm9xYWdZ?=
 =?utf-8?B?Q1B2U1NkMGMvUjV6RFdvZVRybnlkUXZUeUZhYVYraWRXcTRta2Iwc0FjUHQz?=
 =?utf-8?B?SkNoc1BBTVNWWUhwZ1pnUjBvZkZHRkdBOW9qZ3RKVnVWcGR3K21TU3ZFM0tB?=
 =?utf-8?B?bWxVRGVnODhjMGNnKzJWN0tmRmtMUDUxTzFib24xaEhLVjRSVXljUkVFdWlr?=
 =?utf-8?B?d0svVm5tS1lJa28wS0s0bEp3SVFDaUNrZVZra3NxMnlxS08yN2lPL2tmQTVq?=
 =?utf-8?B?R1EwMlZXcGl3RXE5aGFGV3NTL01kTThpL2NhT1V2cEZLV3NRd2ZPeURiOG9V?=
 =?utf-8?B?VzY2RXVoTEF1T1piRjlmcXNQVFVvdUNMcVNYblVvcEo5ZHcySlpUODJFRjdu?=
 =?utf-8?B?S2xLUjYzM0cwd1FkemxIVmNsMFNvcy9adnJ6aTNPZTBIVmVEbzRCcW9hMUtQ?=
 =?utf-8?B?UHNCN2g4Nmh5K3JrVFg3Q1JUUitWUndyTjloampXbE9VWENuR3hUckdGdlVp?=
 =?utf-8?B?dUpYT09GbURKMGtVbmlOaU9sSmZLMDc2L0dneGs0Y3QrT3FPSC9JL1JGdWpC?=
 =?utf-8?B?MGNNTEM0MkRyOGtRNElYdFR2Y2NDanJia0pDa1dOUC9wOTJnNjhuakFWeGdv?=
 =?utf-8?B?VGZEaW5oWCtuWGdkaFA3S0dRV3c0Qk11QktYcmp0cHlSZllFZThqVEQ4QitT?=
 =?utf-8?B?TVl6V2M1YzEzZHk3SkNOV2l5M1NsY2VJUjBnQ1Y0TFkvT3dINEdRaEk3QjNF?=
 =?utf-8?B?SzNwcU9Wa0VTMHh4a2k3MHM0RWhkWm9waWNsS3J6NVB4cEEreEl2OFNPY0ds?=
 =?utf-8?B?dHlIU09meW1IMjYvVE5QR0RDVDVqVzU2NHBDa2RSaEcvazRQQ2svOVNSRS9U?=
 =?utf-8?B?WjE0amN3RVd4eDYwM2xyemVDN1pCaTV1alFDLzlPSkpENTYxSEl5MW9JWS9D?=
 =?utf-8?B?QzF5dXRrTUxGeC9NV3R4OFNqWWVYZWV2c1R0ZWFoMFFZUFhWV1BIZlp1SmRX?=
 =?utf-8?B?L0pKMDFBZlcyTVpiMkwxZEFYRWd3VkF4Vzk3Um44Wld4cWpVdEJRK3lYUjFX?=
 =?utf-8?B?Yy9md3F0RzNtWHJneW5SRUNsZHJHdUd4ZWRmY3Z5YXEydDlYQzFSTklqZlVU?=
 =?utf-8?B?MEFYR3dDL1VUMUk1Vm5GOFZRVVFuMmxoVmJyZ1BuUG1CcEpqMzA4U2ZNWGlm?=
 =?utf-8?B?SEVRUSs1TzRvWjFLcjhmN0xZdHoxeFMxRDlPRDdubG1iWUYvRlQyNHdtWXNH?=
 =?utf-8?B?b2pwL05OV2U4Q0ZGWU1aRTRhSUExTVJKU1RtNHNiREVNd3IxZWhkVGpqNXJP?=
 =?utf-8?B?dFdMalVqVWNmR0hjLyt2Q3Z6QVdvQ25PNlFzd2RUODIzMUNPZldVcEJWRUhq?=
 =?utf-8?B?Q2ZKTFZPeHQ2TlVhejhMek5RU2lWd0kzSVpJZXI5SHd4K3I1TGdCbGhMaU9N?=
 =?utf-8?B?MDNka1B6MndBelhXejExaUNKSlRIQ3lEZTJUWlJlYk9LSXRDNHNzN3FtOGRB?=
 =?utf-8?B?VFFBaER6QjQ5QWdwUGFwNjNFdnFVZm91em1GVnBHOStyTHZnQVB6cGNKc0lY?=
 =?utf-8?B?OVF2djBvbmgxNEYwL3VXSEJNZVV0aXh4elVOcEt6V2hoQ2FjK0thY25aTzAy?=
 =?utf-8?B?d3dtTlhKYmRkREJJQVc3ejZVZW4wa2p2R2wySGdMM2FSMG0zVWFLYjNqQThG?=
 =?utf-8?B?dEhiMlUwa1VSSTZvQmUwYkZlV2YxOHN1c0l6eWFVV0ZNNE5JVDJCYXUvSkc4?=
 =?utf-8?B?c1EyRGJoOHdMcGY3TlYrTjdUUmttakdrRUExdlY2QVBOS2JZWkJqM05SUTln?=
 =?utf-8?B?N0k2TDB1a1FUUERjalhGc0tjREhSaEp4K1NHOXZnQkxJMzFzbTRpUzdZVXEw?=
 =?utf-8?B?OHdzZzdabjRYN2tXM29zM3kvYzlRVzk2SDNyaHpxdHpxa1Q2T3NIdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96dd018-5c9d-4ad7-7292-08dee89c2484
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:24:06.0288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KXWjP41J/fc8BcNm2rCw2HrmCqfVVzE2zp2Nqxjk/SNfBSKRQO3cJwpHNRmTFu7Ln1gf8ki6jRkHj5xCRFKkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFC9877909A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_022413_198476_5B5AC1C2 
X-CRM114-Status: GOOD (  28.24  )
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


On 22/07/2026 21:22, Marc Zyngier wrote:
> On Wed, 22 Jul 2026 15:14:39 +0100,
> Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 10/07/2026 09:09, Marc Zyngier wrote:
>>> It appears that the bcm2712 SoC found in the relatively popular
>>> RPi5 has a broken EL2 virtual timer.
>>>
>>> We do not know the reason why the timer isn't working (the timer
>>> is ticking, but the interrupt never fires), and the SoC vendor
>>> doesn't communicate on the reason why this isn't working, leaving
>>> users and maintainers in the dark.
>>>
>>> Paper over the issue by detecting the broken HW, falling back to
>>> the physical timer instead, and let the user know about it.
>>> Also taint the kernel as the machine is definitely not compliant
>>> with the spec, and we don't know what else is wrong with it.
>>>
>>> Reported-by: John <therealgraysky@proton.me>
>>> Reported-by: Daniel Drake <dan@reactivated.net>
>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> ---
>>>    drivers/clocksource/arm_arch_timer.c | 24 +++++++++++++++++++++++-
>>>    1 file changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
>>> index 4adf756423de9..7b4a98df6962b 100644
>>> --- a/drivers/clocksource/arm_arch_timer.c
>>> +++ b/drivers/clocksource/arm_arch_timer.c
>>> @@ -1090,6 +1090,27 @@ static int __init arch_timer_common_init(void)
>>>    	return arch_timer_arch_init();
>>>    }
>>>    +static bool __init has_broken_el2_vtimer(void)
>>> +{
>>> +	/*
>>> +	 * SoCs described here have been found to be broken, though no
>>> +	 * explanation has been volunteered by the vendor. Let the user know
>>> +	 * we're papering over the vendor's lack of communication.
>>> +	 */
>>> +	static const char * const broken_el2_vtimer[] __initconst = {
>>> +		"brcm,bcm2712",
>>> +		NULL
>>> +	};
>>> +
>>> +	if (of_machine_compatible_match(broken_el2_vtimer)) {
>>> +		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
>>> +		pr_warn_once(HW_ERR "Known broken EL2 virtual timer, ignoring it\n");
>>
>> After this change you will now get two warnings; the above and the
>> below. Is this what you want?
> 
> Absolutely.
> 
>>
>>> +		return true;
>>> +	}
>>> +
>>> +	return false;
>>> +}
>>> +
>>>    /**
>>>     * arch_timer_select_ppi() - Select suitable PPI for the current system.
>>>     *
>>> @@ -1115,7 +1136,8 @@ static int __init arch_timer_common_init(void)
>>>    static enum arch_timer_ppi_nr __init arch_timer_select_ppi(void)
>>>    {
>>>    	if (is_kernel_in_hyp_mode()) {
>>> -		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI])
>>> +		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI] &&
>>> +		    !has_broken_el2_vtimer())
>>>    			return ARCH_TIMER_HYP_VIRT_PPI;
>>>      		pr_warn_once(FW_BUG "VHE-capable CPU without EL2
>>> virtual timer interrupt\n");
>>
>>
>> I have posted something similar for Tegra [0], but because this is not
>> expected to work, I wanted to avoid the warnings here. We test for
> 
> "not expected to work"? In which parallel universe is that a thing?

FWIU, at least for Tegra194, we have a CPU and GIC pairing where the CPU 
supports this but the GIC does not.

>> kernel warnings and ideally we would not warn if is known not to
>> work. We could always display an info level print if it is needed.
> 
> No. These warnings are required because the HW is broken, and violates
> the basics of the architecture, which the kernel relies on. That's
> important information that needs to be captured, and that's why the
> kernel also gets tainted.
> 
> This applies to any implementation that hasn't been bothered to follow
> the spec. Don't worry, you're in good company.

Well Tegra194 does not appear to have, but Tegra234 does (but we have a 
firmware issue which should be easy to fix but the current released 
firmware as this issue). I have also checked Tegra264 and that should be 
following the spec too.

Jon

-- 
nvpublic


