Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D677CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHQEy22dR29lDsyV2x6IqTzwto8wTW3FheHhdqT4hjA=; b=2qy2vt3qzXqHp5MGG3Pr1xijT2
	CYU/NwR4RjKmlZS6tqb/GA+DapU3TGmiEmLmjzZf3qt0CXNQEr7TPjajD3nvQ9Ghbu3bvy/ecDEYa
	CTudOeIWCUPseJveu5y0Ao+yD7OMepicZM8gjORUhkLYltA8J3rEoPXLBc+fbh+zJm0EdopyacCLx
	8B7BlZfCUIqVn6EDGp0Tuy+iXEn3TU1jd/bixCCq51ABUe2bGmdVrO8TP46q9Sg0oIVBhjBUChJ6P
	0RyEj+JQA5j9pWp0UZhpihJ8xXEGWj8bSy+U1uFgtjuqbXcrXd/Iuc5gJHeK1ipaH6qYO4a2AYMWL
	ojdBjX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVcr-00000000jMQ-0Wz6;
	Fri, 05 Jun 2026 14:34:21 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVco-00000000jM2-1Kks
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 14:34:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8wuLWulQUKBIg4/cyR/wfh7h6PMOe71sG1ZpHR+b6xWxiys1/YjBYQSU26AajqPLPFXCFxKH1jSjeVnaHrQ4Z4rG1FIjop5pSSrDT2EUtaNPpO2j3Y1Tc0+K8e7C9ZimSCciDWRWeESf6Fsbc+bjp7qHrX4k1esLcJmnCp5yIC6lAjr3f6kJSNWCFwzqqmHQS4Kw5BTsXQZYfUktTdxtoWoz2PSkaZd8lEl4RABUCAByF1Bh/3JtR0Rr6fdH0/rr1HmANRE6EmoJa9nE6iVrW9VukkOy42vRPSltiJ4IaP4USNsTlQ1jJT3Iw3m//4ZKoHMy/tuDLsW1/FCdXamJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHQEy22dR29lDsyV2x6IqTzwto8wTW3FheHhdqT4hjA=;
 b=Pch2vqB+79f0ijmuO84/ZkK0AKt4pHq/kmq0Av4IjQTTYA1XIsEsYfjq059YQYGCa3yz1WNKviqLzO2xciMOutRlQoIyBpiSnAcF+CHtgRTPTznX0A4dbZv1fCBCjQ9VP03prqVycPYatzNDtiOXy9wGIWHg+32lhvuGzS1MO9ftHaOEBTmoMuw+1HNIqpjr1CrM4gNr7zKRcLfgWwJ5ufvv64KJJ57e6mxERIjXTvctC7r041dBjnp28UBq1g7sQrJCVGoyQi+FfiNm46mvCvVW1AAHE1qTFqvkK5DuUhPmUMF9R5YJxVLUVfk0O8VHDF98mf2c2dUS9LbJ2kNRSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHQEy22dR29lDsyV2x6IqTzwto8wTW3FheHhdqT4hjA=;
 b=WDAaor51fNkcO3BFntRIF5waS5H13uCItsz3Tg5VN3K+AAz8w2SZXxqjdLJyOKTV2ZKPDSFMvx56wSPBoNJUe35IS5do5kP7g4MJNKZBnyBsxXYKTTgeq4fElIlwNw/0NSxXW6qJ0uOMBVm7WiZtjQcuJezLpqDqp1fqSgvyWFJgPkDOSWAXBJ4dMSha6+7egwRVxIu+EhqhE8vYEDTqB497f+eDe/vIAK2yiuAbz7f+ryyqxFhFhulrKGg1woBZ+SKaF8xASs6V/zQ34ETD/ZosnbaXd7IVUztc59CM2cnOaiFEsk+++q0kJ6XSMYxFF4wzGgvz/rFpBVaHN3MmgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB9516.namprd12.prod.outlook.com (2603:10b6:806:45b::16)
 by SA3PR12MB7880.namprd12.prod.outlook.com (2603:10b6:806:305::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 14:34:11 +0000
Received: from SA1PR12MB9516.namprd12.prod.outlook.com
 ([fe80::16bc:1d1d:88e3:6a2b]) by SA1PR12MB9516.namprd12.prod.outlook.com
 ([fe80::16bc:1d1d:88e3:6a2b%5]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 14:34:11 +0000
Message-ID: <f3fd520e-9412-473e-a7e8-4ebff097e809@nvidia.com>
Date: Fri, 5 Jun 2026 09:34:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
To: Vladimir Murzin <vladimir.murzin@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
 Jason Sequeira <jsequeira@nvidia.com>
References: <20260604231254.1904988-1-sdonthineni@nvidia.com>
 <fd729256-07e8-46eb-8473-74ae6ec3a07e@arm.com>
Content-Language: en-US
From: Shanker Donthineni <sdonthineni@nvidia.com>
In-Reply-To: <fd729256-07e8-46eb-8473-74ae6ec3a07e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR06CA0073.namprd06.prod.outlook.com
 (2603:10b6:5:336::6) To SA1PR12MB9516.namprd12.prod.outlook.com
 (2603:10b6:806:45b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB9516:EE_|SA3PR12MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 10465124-18b2-44b0-48e4-08dec30f8223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: kWZyrk9KHzkHgo14zkc7zsvxo9cTQdItE0s38nqOhvsyxLgcQNypqjeokkHfymKvd38barGNMbl29k3W1VftVqRKuYbwOwLsf4XXlmYSpsWTUh35SaLn7PNTvgfR/PK8xJHYdtqF2Ypy68+8Wh4AsRGl6OC0MEclK9rXEk9rZBjHvVhRCXWtbFczyOL/rLiCbyWwjRTnEFgv9278RUoESXCJwPopCeEl+HOMSonhyelegN717i3dpaCOioS7eYN4LDc5Xjnxq7CzFUhJ3wHP7VYb9Y0hnHH2oqzjx5kGWk2qV3BmGria7vT5k06ItgLp7l+ian5S9S46ZRarsHj261OZENwFmrol++by7UNO1fo7iQjpskCR8jxpGj94DzJLvJKuHT2O3d63Z3tAjipKpsWYRXo0NquQaXexNehi7cULbfWuNXGVh4oPPR4kZn8GVafrfjmfjr31GevsJe1r2cPTaIbRYiCK4VxysTw0OfQ7lYhaUQvq4cAa6GzCZK/B9cM/KJzZecl2HqyYc0hzYVon/Xql9l/ig0GNsSNE5w7AC9qAc6cZwqFQIiO8zDGDY5hoWyB6k6REPIEA8i6A634iSH/zegr9Q3QPWS0Iv1AkJlcKAJBTz9ZWcs0gyikEs+bZ2ncEtA+q3SSfSkeucu/+BM+gierPalYsITf+L3k81KmlO4iy2uE7iGmFppBg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB9516.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUNEOFkvcC83eloybTR1b1F0b29ESlpoUFZld212MTBQek81dldZakhEdTJX?=
 =?utf-8?B?TUJlS1hQaVlGOG9rbmJwaGdjQUVBUTVNbXk0LzkxUmV1akl2akYvSmt5OFZz?=
 =?utf-8?B?ZVgvdVY2aG1TQ09RN0c1ODdSZjVIVENRMCtXbHFsYVNibG81bGV5MmhweHhr?=
 =?utf-8?B?a3NwYSs2YkgrZ0s5WWMvRDB3UHZzMWRyaDBqQzdoU0NlUFNQQTRlRG1ZZlRh?=
 =?utf-8?B?eUJ4eUlLbkdMNFcwSzlJSUlyUkFtZEMrSGVzYUVNdHBPaFJ5MThRTDYwRWph?=
 =?utf-8?B?eE9BazZhRmdwaEJtSU5JN2FPei9NM2NUUURzamFYaTJiOHI5M29lS0ZiSnNM?=
 =?utf-8?B?bnMzRXFaT2E5T2x2Y3h1OUMwbkM1ZjVFcmY3aU40a3E2MFpIVWVhbURTTmtS?=
 =?utf-8?B?QVlPcUNWaEEzYlB1MjRwVmd4N1RlV3lQbXZWaWxzd09vMUgzTE9sYzZtY001?=
 =?utf-8?B?TkNiOEIwNEJQOFIzSnlweFZnb3dIUXV2THUzQ0V0SnlwcGxHUDdKWmU0eW41?=
 =?utf-8?B?djVzT3d3NzVQU1pOWUN2dVpBVllqczBWeHlsRmhXWm9EWGRUeitFOVNJcEVl?=
 =?utf-8?B?aFk2bnRFNmxCSlJpRW5sODVvM01OQkpvWDJxS045QWpaL3h6MkZSYjFHTFI1?=
 =?utf-8?B?dGFmL3RFdUpGMlZHL2Jod3FUYmRLUisxQ1Z2WndqZGJZZllDSExGWnE3elVm?=
 =?utf-8?B?ZHA5NzkySzJqMEljODRKU1ZmVE1nSHVNbnFFeHorOEVTVlNPODhkMHJBWHZa?=
 =?utf-8?B?Yk9FYkNiYlRQRXJVZ3MvSEpaM0dXdkRPTEs0V1FHVlhqaXFUS2FSY1k0eXlX?=
 =?utf-8?B?dGZuM256YzdYajZWNEZkV1JhcWNDM2ZpVTlmdlFTZWxuR3o2a2Naa2ZhKytV?=
 =?utf-8?B?cmR2cDBtYWw0aXZydzNMc2ZIRCtzK1JoL1dGUzBaYWJPNEZMem4wNFA1UHRy?=
 =?utf-8?B?MGJ3L0pvMlhaR05PSndBcXhqMVU5eW8rVWJ5U2R2bDJXMExnWHo1Z0NxaDY4?=
 =?utf-8?B?TWd5MHR4OU5KNW00Q1I2Z0xvZ0xhUjNXN3MvSTdrMDJkR1pFTzdneWhObncx?=
 =?utf-8?B?SG0rOGZVQmFIK2FsZE85aWZsK2RzS2lkaEtSVmEyRzdKN3IwMldoWEYxU1ZV?=
 =?utf-8?B?SHRoNGlSY3RHSE9qK3NQVDVQNnF5Qkl0bVJhakNhUjlXQlNWdXhpRGNmdnBI?=
 =?utf-8?B?bkl2SmJoNVNoRHNrejZtRkM1MWs5L2c1UkhRZ2Zxd3B2bU81VTkvM1pCTk1r?=
 =?utf-8?B?Zmp2WStOTzJMVHBTQUh3bkhVczEraGwxZmRjSlBGeCtORkFrK2JzVnVpanQr?=
 =?utf-8?B?Zk1HaTBBdlJBcVhoeUwwaUpyRUV0WVVBbnJlQm5BWU54OCtpcTBiaGFKZjhX?=
 =?utf-8?B?RUpnZVMza3FsWDRXQS90WEhacjY5WjlTeFNDTEpzUndjUGN4SXRMdGt5VjVL?=
 =?utf-8?B?S1NyTWRkcFBjcmEzclhoeHdxWk11NFAyckptN2xkUndOcDM0eThBcDk0Y0lG?=
 =?utf-8?B?eGVnUzVQQ2RhYTd1bW1WYU5KNWJML1hTNGhmaHJiNkJIU1ZsWlRnQklSTHBt?=
 =?utf-8?B?L2Jjdnk4ckgwSzFMOG9HcVpOR2VOK3JoRmhsRVJ2Zzg0dmxySW9zQ3VTVzQ3?=
 =?utf-8?B?Wm1PZFhvc21mRXRjQlh0dXZqTkVyNHFIcklCMGluMStzZ2lBTGRIMXpDZ0ZQ?=
 =?utf-8?B?TkdXNUY1L3Z2MHY5Q0dmNFZ5MnUxVDNWV2g1NFd5eHlRRnZ2M2M3TnZIU2Y3?=
 =?utf-8?B?SEF3WlBLTWdRQjdwSnlIVW1KUVpBaVJvWnpYTm9pMSsraDJNL05VWmt6bUZY?=
 =?utf-8?B?UHpBdzhXczYzUUc2Q0ZsYjRtRGhoUm5vTU1teE50cHRFY2RHbHhCc0QyUkpi?=
 =?utf-8?B?WXl4N3ZhTEY4Ri9XSGdoNFhnWVgrT2RmUVgxS1JXckR3ZzlYMFA3UEgrVGdN?=
 =?utf-8?B?TWFhZUQ5SWhpRk5kVGUyWHBweFVhOWJyQUFDQnpxOUl5WWpPa1U1L1ZZZVdl?=
 =?utf-8?B?L2hvdzVxV0U1UG5Fa1NSckVjTnFObnBHMTN2RW0xTEhKUkNud3lHc2lMWURF?=
 =?utf-8?B?UmtSTG50QWdJUkdFRXlScDcyUWRVQWVJcGNRWEdyajNUVzlqSmZmZUpoNU5p?=
 =?utf-8?B?RnBubi9mbk1BeGdiUFErRG1UQ1hRYkNxZk1UZkVCM1hTdFVnZmF3QWdvYXNl?=
 =?utf-8?B?bENTa1dxWXhMTDh3YWFVczZmb2wwSWxwT0Z2aUUwVWxxNWhkMmI0MlErSVEv?=
 =?utf-8?B?ZVd6REtUMnBjRjRPSndiZjBuSzFxS25ZbE50aVZzSTNkQzlFemFIdktLdSs0?=
 =?utf-8?B?VzVoNFdUWXg0VkM0SHlTbzNqQnVtM2h1Skg5MTBEbHQzek9BY1hDZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10465124-18b2-44b0-48e4-08dec30f8223
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB9516.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:34:11.1243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52eYQfdpgMj6f81fT4xXBUMW4qGx7jpixiRqjmHpcpIZ+bPdE2zir/SzqUdrmiH8ODKUZbr/XQ7VwDeZ8UeXrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_073418_404803_545134E3 
X-CRM114-Status: GOOD (  30.29  )
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

Hi Vladimir Murzin,

On 6/5/2026 4:26 AM, Vladimir Murzin wrote:
> External email: Use caution opening links or attachments
>
>
> On 6/5/26 00:12, Shanker Donthineni wrote:
>> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
>> observed by a peripheral before an older, non-overlapping Device-nGnR*
>> store to the same peripheral. This breaks the program-order guarantee
>> that software expects for Device-nGnR* accesses and can leave a
>> peripheral in an incorrect state, as a load is observed before an
>> earlier store takes effect.
>>
>> The erratum can occur only when all of the following apply:
>>
>>    - A PE executes a Device-nGnR* store followed by a younger
>>      Device-nGnR* load.
>>    - The store is not a store-release.
>>    - The accesses target the same peripheral and do not overlap in bytes.
>>    - There is at most one intervening Device-nGnR* store in program
>>      order, and there are no intervening Device-nGnR* loads.
>>    - There is no DSB, and no DMB that orders loads, between the store and
>>      the load.
>>    - Specific micro-architectural and timing conditions occur.
>>
>> Two ways to restore ordering: insert a barrier (any DSB, or a DMB that
>> orders loads) between the store and the load, or make the store a
>> store-release. A load-acquire on the load side would not help, because
>> acquire semantics do not prevent a load from being observed ahead of an
>> older store; only the store side (release or a barrier) closes the
>> window.
>>
>> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
>> to stlr* (Store-Release), which removes the "store is not a
>> store-release" condition for every device write the kernel issues.
>> Because writel() and writel_relaxed() are both built on __raw_writel()
>> in asm-generic/io.h, patching the raw variants covers both the
>> non-relaxed and relaxed APIs without touching the higher layers. Note
>> that writel()'s own barrier sits before the store, so it does not order
>> the store against a subsequent readl(); the store-release promotion is
>> what provides that ordering.
>>
>> Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
>> ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
>> parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
>> the plain str* sequence.
>>
>> Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
>> Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
>> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
>> ---
>>   Documentation/arch/arm64/silicon-errata.rst |  2 ++
>>   arch/arm64/Kconfig                          | 23 ++++++++++++++++++++
>>   arch/arm64/include/asm/io.h                 | 24 ++++++++++++++-------
>>   arch/arm64/kernel/cpu_errata.c              |  8 +++++++
>>   arch/arm64/tools/cpucaps                    |  1 +
>>   5 files changed, 50 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>> index 211119ce7adc..899bed3908bb 100644
>> --- a/Documentation/arch/arm64/silicon-errata.rst
>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>> @@ -256,6 +256,8 @@ stable kernels.
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>>   +----------------+-----------------+-----------------+-----------------------------+
>> +| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
>> ++----------------+-----------------+-----------------+-----------------------------+
>>   | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index fe60738e5943..a6bac84b05a1 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -564,6 +564,29 @@ config ARM64_ERRATUM_832075
>>
>>          If unsure, say Y.
>>
>> +config NVIDIA_OLYMPUS_1027_ERRATUM
>> +     bool "NVIDIA Olympus: device store/load ordering erratum"
>> +     default y
>> +     help
>> +       This option adds an alternative code sequence to work around an
>> +       NVIDIA Olympus core erratum where a Device-nGnR* store can be
>> +       observed by a peripheral after a younger Device-nGnR* load to the
>> +       same peripheral. This breaks the program order that drivers rely
>> +       on for MMIO and can leave a device in an incorrect state.
>> +
>> +       The workaround promotes the raw MMIO store helpers
>> +       (__raw_writeb/w/l/q) to Store-Release (STLR), which restores the
>> +       required ordering. Because writel() and writel_relaxed() are built
>> +       on __raw_writel(), both are covered without changes to the higher
>> +       layers.
>> +
>> +       The fix is applied through the alternatives framework, so enabling
>> +       this option does not by itself activate the workaround: it is
>> +       patched in only when an affected CPU is detected, and is a no-op on
>> +       unaffected CPUs.
>> +
>> +       If unsure, say Y.
>> +
>>   config ARM64_ERRATUM_834220
>>        bool "Cortex-A57: 834220: Stage 2 translation fault might be incorrectly reported in presence of a Stage 1 fault (rare)"
>>        depends on KVM
>> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
>> index 8cbd1e96fd50..b6d7966e9c19 100644
>> --- a/arch/arm64/include/asm/io.h
>> +++ b/arch/arm64/include/asm/io.h
>> @@ -25,29 +25,37 @@
>>   #define __raw_writeb __raw_writeb
>>   static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>>   {
>> -     volatile u8 __iomem *ptr = addr;
>> -     asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
>> +     asm volatile(ALTERNATIVE("strb %w0, [%1]",
>> +                              "stlrb %w0, [%1]",
>> +                              ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
>> +                  : : "rZ" (val), "r" (addr));
>>   }
>>
> Nitpick:
>
> The change has the side effect of undoing d044d6ba6f02 ("arm64:
> io: permit offset addressing"), since stlr* do not support
> offset addressing. Unaffected CPUs would continue to use str*,
> but would lose the benefit of offset addressing :(
>
> Not sure if this needs to be mentioned in the commit message...
>
Thanks for your feedback, You're right that this reverts the 
offset-addressing benefit of d044d6ba6f02 for the str* path too, because 
stlr* has no offset form and both alternates must share one compile-time 
operand form (alternatives are patched at boot). Keeping offset 
addressing only for the unaffected str* path would need a runtime branch 
per str operation, which isn't worth it for this optimization. I'll call 
this out explicitly in the commit message in the v2 patch. -Shanker


