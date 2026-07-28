Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC56C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUgbAcAqyGLxeEJv7qGz5zBTYPu6iUq9j4k2yvK0zDE=; b=Dqg+DN/hy3nqGk146Qne3DIywh
	5Gw3ckxoWkmTJH+AnjB54OedWwoy7bWw5D43NROirSxX2uwQ6Up4CkexLj/TMM6SJAsKE2xXX0/0J
	WbHa+xp+w59Y2LCZeUNUsxpulm9ienUul8na39uwQ0fKt0Yd7GlcrXL+o5DDiB+v+Mne376nE2G/F
	00QTl1sVi2RBPQ4trZczRNfMMZC1xCiaveyjSKnWe7p/MIB10WDIOmPDPmeE+mCQXMEHMBe4kHRVm
	vcj0kFgL/3MZAl3B/hfFj6OjNvgdBNUaO6n65R12/L5rb7Rh7V5ucpr+8ZQRCL+/D6hnVTCvYScIN
	8uHFx8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woliO-00000005yWX-1miz;
	Tue, 28 Jul 2026 17:35:40 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woliL-00000005yUs-206G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 17:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gc48cRzH9FQOUmEiTdepEBqybJcoSSFF+w74gwDQYiB6E++tC6q6k1Ra20dbDSGapdH9q3slh8Np8i0r3AWxNsaN22YlIMLp3jpAufMHIBnJpDf5LOnOAGQ0y18lyTMV7/93XNNaRiarIFcYBAob3/qhbWt1CUp/97RzZciI9pFD0ubvezKASepcZZDDG9ot7BnQLcFFrPFWvThHyUCzQtHv1SxPCBLvjz7iBVpizvviU8WPNqWBNyAkJChafZCov6G9vH8KqxRCXlkygdiwf5g7j7b4BmjKiNpas6K4m6+3msKX9R4SEy/rxuub4m5af33Nz+XrM74/66XSzg1i9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUgbAcAqyGLxeEJv7qGz5zBTYPu6iUq9j4k2yvK0zDE=;
 b=G2Zl8Girdt2BlgAfu0pJd7+0sGDhYAkjpDK2lQg6lNpG+Zgc6RtqmcWyVBiwNaN8eUPYm72rkGXnEkQfLw16K50JFuXLqIV9tQtfRpaBkpLErLYG0nxgerW7aROM7sFMz6ReXOFBWeASknC3N5zdimUXbsqujWuHCAPj8dt+Oo7HqqsRraRf5fsDduybdE+YXMjNjf3pL6kZFdqT0xOgS37orrNy6vytDR3cedhJWXw9q2T1B7SrGy5tDzXtOHv2JluyF1GAvDRYRNP0PtvbMu15aLVTgvqSS07uFpFhxDn4EuWTPQIlyRl84GEHtYJW7yBMmG+TYQ73bh/beUQLLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUgbAcAqyGLxeEJv7qGz5zBTYPu6iUq9j4k2yvK0zDE=;
 b=h30Ej/AEEryC8xJEA4c+/QRAAcQ3YSmnmp3phNy2lsYLPXg7P2bhGmVvDDa/K0x+oZ/PQc3anq1+AjhH9ZiemouYl5l8Nz+5leHRAMtfaiUOdcN/jhrhiuko2gCew5RP0N/i+D0KOaDAodik2XCuNQLXwVcfpot9ATJ9rDgHTCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CH0PR01MB7049.prod.exchangelabs.com (2603:10b6:610:10a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.12; Tue, 28 Jul 2026 17:35:29 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 17:35:28 +0000
Message-ID: <fbb62ab5-f8b9-4df0-b123-11c6609da21c@os.amperecomputing.com>
Date: Tue, 28 Jul 2026 10:35:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260609214205.1260279-1-yang@os.amperecomputing.com>
 <255744ec-2a58-492c-a69a-850357440183@os.amperecomputing.com>
 <amCqBzwIYDOvRI1S@willie-the-truck>
 <79d7069b-2895-4be3-a2a0-327ad3444bf3@os.amperecomputing.com>
 <amh19c6vtDNKsl3C@willie-the-truck> <amh96rPdlc7UEobt@lucifer>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <amh96rPdlc7UEobt@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:930:3::28) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CH0PR01MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 296dceee-7635-4f4f-67e9-08deecce9dbf
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|4143699003|11063799006|10067099003|6133799003|56012099006|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info: b7+fea1oPugTGccCkxqWsKus7xtH3s0tIFypK2g4zCnh+1QOqWNAQAGaSQmaBGNsa2mCJHCBxK06Cax6u+ZEYirQsXEFtzZpsTTHnaJ7yJfCVn7dLGmwRU/1RoSLAod35jL35sdssPKW9s12Iygli8a6W85Sjy5UaFbNEIMq1Ky50NWk20/NKF+EorRriH88z1qo4wQpGhIdy+YWS/F3lQgu5cKttk9JDrlkkWryZOGZ1VdKKBluhcvt00tVDdOd0sGxqt1voKAQfbAqvWmuEKzLINLQwlf6CtdVuS80zQcsBkBuYFEKXXh3MWMko6dLBpOcXenjwP/Pplav8FHAmj+79IJmQrKzX3oECjBhFn87xXouBGp4BpYJEXxxSQsiY2i30wsAl6hbgVDhBNCNx2DIKJ1MhgfM5wLNMMrt1REDxtaclMkELKkw4kyynUgnT+nK0OeTg5I8S+vaJbr5QPaoUfn7yyLYh/B9Z7K+bd0nr82xMTc6q+4WD5mVrZ0k+uvfKj4nuFs8poLTaO+kduIsz+2eWXjts4yIKMN5QV0Qnui/s60TiHYTjwruo+wdq5WE06+VtsNe+8Tv9NUo8zLd+JDmje5CdUn+/C6SjvudT/T+Om3s/zjaEgJ12G5Jd63Ue5/20LmQ8UWUa1JQcjQPeVYLYC+J07IBQ4/aPR8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1orblN2TEIrVWdUL2x4M1JzMjM2dzgxa0dKa2x1Ulg5ZGdXZFNNNEowck5h?=
 =?utf-8?B?dERDRDhMY25pS0dBcjlMM3ZnWTA4dDlNRTZsNnJsWVAzbDk2VkJuUWNtamdO?=
 =?utf-8?B?TFNaQkRrZEJWeTkyS0x4aTB1bGJKbFVJQ2YxaGFCOWVOMnl4cFBOME13bU9M?=
 =?utf-8?B?Q3IxVW5rWFlMbzB1UU9oYUNSeGZ0d3hkNnJLb21CYWJSSDR1a1FrM1NTTXda?=
 =?utf-8?B?RCtZcm5FOEZwZzhOMmVrMmEwcVZobE5HUHh1QWpjbWJTMjI3STdRZ3pubEdl?=
 =?utf-8?B?NTVyRDNHcU1Sd2RxTWlmSDZ3QUhMaVRPYnBwamJYRUU0WUhSOHlwKzFHZVFO?=
 =?utf-8?B?VmFFN0d6WFpDcEFtVmV6WmJUMVpaUGFJREdla2xpSDlTVzZOSWQwdzJOVmp6?=
 =?utf-8?B?TUt3ZXFnbkRhazBQakdPMWl1UHFwclFZdWxIOW1GZDRGTWJlRExQUFlVbVNR?=
 =?utf-8?B?VllsMXBUVWI3WG1aTWNLRllzT2o1aWdyTWJMVG1CSng3QWlCNW5BcW5VcjJi?=
 =?utf-8?B?Zzh5MXFjSFhSNmxaSWtQb3psWllUUDRndy9lWURhTlduVkxDNGVUSVREOEdo?=
 =?utf-8?B?VTBCbm4wSm9JaEVsT1l1Z25ZWnFJRXNSYnpXWDFxcUhBc0ZKRkxlUUVqNHI1?=
 =?utf-8?B?bXVmR05NeTF6NVJFWFpkM1NacnNTQ1NSczF1YzFVanBlUmx6dmdlVW9oVUpY?=
 =?utf-8?B?K0piSjRVRklHMDZsa3czd3B3NVV3MUlQbHkvc09iOTkyc1R5Ym9lNDM2eS9Z?=
 =?utf-8?B?WkV3TFN6R3VXcjVTR3R1aUFRR1luZEQrWUNEYmkvODJuWnVwdExLOHA4N3VB?=
 =?utf-8?B?TForRDczY0drTm5WQ0Y2VFJMSGcvRzgxYXE5MWh0Y0xEYStTOTBQNkdmM1VH?=
 =?utf-8?B?bjRRSkV5YncwN1BzanYvSm5nbHUxUWI4ekxWcEgvTVVDcEJRTEw0a21RWjNQ?=
 =?utf-8?B?bU9KeWV0U2xTL3oyRGRXT0ZmR0ZJRjdQMHFtNEM5U2xQdE8wdEJIV3ltVExN?=
 =?utf-8?B?VEhsbzVldmNpYlFRMTZFL3NJY080dTcwNDRENmxMV2pqcTY3ZWEyd2VLcHJH?=
 =?utf-8?B?MG0yT1hTelBZQmRIVTRTbUo2dnZKSEFIWTVxQjM2bmN5cXR3WlpxdU90T2hz?=
 =?utf-8?B?Y3BWUDNrcEI3WEQyMkM0aFJmM0REbjNvUU9NWGgrclE2U25QamtzZXJpMXcx?=
 =?utf-8?B?cUNFOWoxc1VmdFRQS2s0eTdYZHlOR25DN2ZLY3JiTU1OQjNtK09Ma3ZFaE11?=
 =?utf-8?B?V2V1QlNoaXpUYTBCUWtOeFBoYXpVWWUrWjhaSHVRV3VJWHdBakhPTDk4K2FD?=
 =?utf-8?B?WVR2R01aN2RvTmtON25DeVhSOU13aDNpQ2pEdzFqU1dUaUlFclRyZE42UEEw?=
 =?utf-8?B?UVpOTnlTS3BORm5vcWVoUWZZbzVHQW8zeHR0dFNSNVEvVEtFS1A4NXhDRHV5?=
 =?utf-8?B?TW1QWkpvM0J0Z3hmKzY0ZEVpNlNTSzgyRXZzRnRkdlN0YTVMVVJtNzFMdXEw?=
 =?utf-8?B?QnJyTCtjamQ1dHAraWxNait3R1hHR1RheXZZNmYrZDdpbGdQOXVoL0RDck1n?=
 =?utf-8?B?c2pITGRySW5Kak9RSUpnNUJVQjBSMUtWdmZaeDBDSGh0bm1zZWk0L0Q0OXZD?=
 =?utf-8?B?N2QrR3hIaXQ3NG5DTStEK0d3enRRMFNwR3R6eHFFUXFQNitsUUMwemxFUi9E?=
 =?utf-8?B?aXRGNVBiRjhFZDJ3ZHFVQ04wcXVZWUIzMzZvMHcxZDFWNkU4ZTBvVXJwNHJF?=
 =?utf-8?B?K2NaaHVNelNycC9kVUNFWnZSd3VXOVJremVmemt1Q0J0WmtzNlJIWnBZMHNJ?=
 =?utf-8?B?dWpYVHRGMDZnRkprZnhMUGhsRlprTU1ZQlJzZGJaOGM0Qy9jVVVCRytnVlRk?=
 =?utf-8?B?UjY2bUc0T2UyMUFHU2VySVNqa1YyNW02OEl2SkF6VUdVbFREK2YxcVdGMzhR?=
 =?utf-8?B?UnBLbGxRS0x1eXhUYjhnRXpEcnFvaEZGdkRHV1JyQnBSa3dYdU9OVC9pMStP?=
 =?utf-8?B?eUlaRnJ6SkV1cGcxY00wWXBhbEphZHF4Z3VxT09lYWVqL3MzOHQ1MmlwM0ZO?=
 =?utf-8?B?MjlxVGF4c2FEdUJ4bDdITm8xVTFKQlVKN01CSlVHWEpUT3ZxYXVNVWozTkVq?=
 =?utf-8?B?aFd3VDlJUWZpTjlFaG5EdmZyUlQ0NmQxUkVLUzhXcDZxV0VoYXd5OWJyNnJU?=
 =?utf-8?B?akhabmwrNmt3ODNNYThtcWt4T1ovenVLdHRLV2ZsYzBkbHpWckdkU3FWbzRX?=
 =?utf-8?B?TjB2RFJYK1FCQmNCY1RsL3JMenRKMWRwVmJoeTI5c2JkbFlSZGg2R3kzWHRL?=
 =?utf-8?B?bzVCSWVrMmxtZFJNTkd4U2hFT1lKWjBNZW1aZGpIVDNsS3dtM1FhNFc1bG44?=
 =?utf-8?Q?IwHLIDUy7/MdcG/o=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 296dceee-7635-4f4f-67e9-08deecce9dbf
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 17:35:28.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0gNIcgyUa0imrno1MpUGvLMK5JabJ4G0s9xY7F00a15rILrpmX4TS8hTaH6elFn5wyD00QvLb6H24WxELPwgosH+6h6aURdRB0IJ0yhmQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_103537_555095_A3C59DEC 
X-CRM114-Status: GOOD (  23.59  )
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



On 7/28/26 4:37 AM, Lorenzo Stoakes (ARM) wrote:
> On Tue, Jul 28, 2026 at 10:27:17AM +0100, Will Deacon wrote:
>> On Mon, Jul 27, 2026 at 12:50:59PM -0700, Yang Shi wrote:
>>> On 7/22/26 4:31 AM, Will Deacon wrote:
>>>>> Yes, it may race with memory hotplug. I missed memory hotplug for v7
>>>>> Sashiko. Two options to solve it:
>>>>>
>>>>> 1. Use atomic variables. Make lm_meminfo[NR_LM_TYPE] atomic_long_t, then
>>>>> manipulate it with atomic ops.
>>>>> 2. Protect it with a spin lock.
>>>>>
>>>>> The contention for the cache line or the spin lock should be rare since
>>>>> memory hotplug should happen rarely. Any preference?
>>>> I'd vote for keeping it simple and using a lock. Might be worth looking
>>>> at the ongoing work from Lorenzo:
>>>>
>>>> https://lore.kernel.org/all/20260717-series-vmap-race-fix-v5-0-606a0ac6d3e5@kernel.org/
>>> Thanks, Will. Took a look at Lorenzo's work. IIUC he used init_mm mmap_lock
>>> to protect vmalloc area and linear mapping collapse on x86 in order to
>>> serialize against ptdump. I don't think we should use init_mm mmap_lock. We
>>> want to serialize linear mapping counter update between split and memory
>>> hotplug, but neither of them takes init_mm mmap_lock. We can let them take
>>> init_mm mmap_lock, but it sounds too overkilling.

Hi Will and Lorenzo,

I will reply both of you in the same thread because both your replies 
are discussing the same thing.

>> Hmm, but if split and hotplug don't take the mmap_lock, how are they
>> serialised against ptdump? From what I understood, Lorenzo's patches
>> change ptdump to take it for write in order to serialise against other
>> walkers.

hotplug and ptdump is serialized by mem_hotplug_lock. We actually don't 
serialize between split and ptdump because ptdump should either see 
block or table. Split doesn't free any page table. There may be race, 
but it sounds harmless IMHO.

> As for memory hotplug - ptdump already takes that lock in
> ptdump_walk_pgd() so you'd need to add that on split I think?

You mean mem_hotplug_lock, right? I don't recall memory hotplug takes 
mmap_lock. Did I miss something?

>
> So I think you need to take it in the split code and in
> arch_report_meminfo.
>
> So that solves that, you can get ptdump serialisation by ALSO taking the
> init_mm read map on split.

If I read your patch correctly, taking read mmap_lock in CPA is used to 
serialize between page table attributes change and page table collapse, 
right? We don't do page table collapse for linear mapping in ARM64 yet. 
There is ARM64 ROX cache patchset ongoing which added page table 
collapse, but the existing code doesn't.

Shall we serialize between split and ptdump by mmap_lock? Maybe, but it 
sounds harmless to me as I mentioned above.

Even though we take mmap_lock for split, it still can't protect linear 
mapping counter update between split and memory hotplug because memory 
hotplug doesn't take mmap_lock if my memory is correct. The linear 
mapping counter on x86 is protected by pgd_lock IIRC.

Thanks,
Yang

>
> That way you can rely on core ptdump stuff without having to add new
> locking in arm64-specific ptdump.
>
> And would you also need the pgtable_split_lock in arch_report_meminfo() to
> serialise lm_meminfo access?
>
> (Side-note: I am going to try to implement RCU kernel page table freeing at
> some point... so then maybe ptdump won't need the init_mm lock any
> more. But we could still take it there for this at least :)
>
>> Will
> Cheers, Lorenzo


