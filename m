Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08015CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mw98UDti+w23bYsqEoXHV6+vUXcKMaT+r/hqgm+CvE=; b=Qj4Myi4m6uEjbyox+6zqp7FK84
	skji3Wr+rv9U/4Uq13ABdJqRLLoXnVSZss8XbJUQRMfP9ZzGiHusQtlQwnMOsNKH7yszhNhsekEvO
	RIQDXoQbMsDzH30s7hQa2d0bb1gL6C+U2w58ptRMshGGOqXOhSnRDj57xhuzHsTjKCsLTf2lgmZ1u
	Q2IYmZOrS35kpMLiM5QhvoOhfozkxRQhCwCg40IR/7vhTRaBXS234Pj6ZrW733h0nH4d1dZangn3o
	gmy61wLiI+GKA5SNiL8zv2hRlkSdC3/zV8PGjoFLgh4KUHRT7rwVz6pnASZrSMteTCmF4HQz6YEzt
	eUYW2PDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIrU-00000007kfg-0kPS;
	Wed, 10 Jun 2026 13:20:52 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIrS-00000007kf8-0j1K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:20:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyMUHL0TFcIFQynk30bOQjtn9cxIl6Rv+vntX84r+7C625TCYbxKQpghae/z58+1fVhtHOAyXJzcTIVtaCoYtaQk+IRRc/Z9vSuJsRyKa7J3L5Pq07JBMxRuJFJcgnYhynJ8YQJk/7j5/nQNTZh3LlQsymhW7D7LmTkfk8oo7K4GztH7od7kcKQdhPwhVx2ZXZ/myqZhqM8WVg/XupFUJXaarZoC2WXhv9X/OfJyC8oYUsAiLK/cciArLjU3XNVGTTlxdK4zmuEBreyV2wylLLtTIgNqYUHj1luLm+aV7tM14ygFIDfXNtBw1QSSE5xh4ank9UzGxAAw5clg4BQaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mw98UDti+w23bYsqEoXHV6+vUXcKMaT+r/hqgm+CvE=;
 b=QCM/suTfjCgTFjaGp/zozt+fUOTom/AquZVLGoa14hiXUQiJPYk3MjCPa7AlkJWuftsHRBe72u2BRX9ow5skzDVWSQQavxbfbDzqlIVdyh+TWTBiNDNq26fhsWcx8mnHqN4NSYB0DrTFUJiTTA54+G9TA+tgk7JNNaZeZQb6iGFgurwjSklCvjaI6D/mrv4Jfc6FG8P1Nxv3FKKzskmAYT8Z7UEgFjeR7GJ0hNFQRAbEe5PEGdk2ZTo/vBH+a6mZrmDUqrEKWG/puEoKrdBinMPHQHKe2Spuzive5TzWfxfEaUf+J59nBz1pIFDHvhbEP0rrnLDfPK+HVg52RThFGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mw98UDti+w23bYsqEoXHV6+vUXcKMaT+r/hqgm+CvE=;
 b=Zsq6I8mRZv15CXs+J5jl12R5LcU0RAZZ5sFCu8qIom4c8Gcc9aq2qjQceEwW1xzERcvHwgWkS9+LN5CYzdNPP+baX7qJBstxXwY8knlpdYrrFiWBxD8fUWJ6TLsVNQPGetEBo8z3n/IE/93bZBAzMHg1XMw3CkRqqr+393Z14RFnedgmL0APX64bIbSk8jwpNPfXFoxFbALa/z5ihmLQVFN6+12e7JIjGuRxtBh1givLsNjVYjH6aFjXiReNTay0MRVW3xggg/cz9yjzl5u3vS7FqbNr6gajJ39GkZGxb+97/uGoXKsd3krDuf4U7JN5EuclXZ4xyAbPvdnrCUIaJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 by BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 10 Jun 2026
 13:20:44 +0000
Received: from IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c]) by IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c%3]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 13:20:44 +0000
Message-ID: <223c49ee-528c-4750-9885-fd8e0247151e@nvidia.com>
Date: Wed, 10 Jun 2026 08:20:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
 Jason Sequeira <jsequeira@nvidia.com>, jgg@nvidia.com
References: <20260605144551.2004391-1-sdonthineni@nvidia.com>
 <ailKYTOX23EMnJsK@willie-the-truck>
Content-Language: en-US
From: Shanker Donthineni <sdonthineni@nvidia.com>
In-Reply-To: <ailKYTOX23EMnJsK@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:5:337::8) To IA1PR12MB6089.namprd12.prod.outlook.com
 (2603:10b6:208:3ef::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6089:EE_|BL1PR12MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f33852c-c1f4-424b-13d9-08dec6f3139c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: yr77mem8kLNL63bU5Iv1vheGL7H/32BYe5ID+RYDS9lIYqj3OGQE3apmlOPOlnRzYgDl39l0S1norHyzRFjdvsG73YQt8slVj7Z4DP1bYRasC/SjwY1NpQQAfKJmzc4dhrxbCSjupd1GOxsLvi27NVzKC9G1bySVn6Y2So61S+tSy2bKlcd5hcv4T9GMSv6HAnKdW+RjiBfOlbVMznMVN4VwdIOeTWQ2k8mHQb8yJWWAEUz4U7Ib+fWGeVvouJBFhjANWX8YToRzs+D2U1syBe8OkvshIz5QSNx6yhbo7WZrlttQiivrVE0fZe4NuAZb31h7d76fI4xEPhdzkAD5CsUpxSQTvtTu2NSq6J17wDb3cgE0oRs57lvpXZe3VTEkdtNvaE6rWk4cmb0rkK9/KYxGjvHT6ZBavj1/S6S6ikR34nG4z0hYEOzAWN6Eb9rWoWoNDWmWsBrGXQyRcBkZR8z0POH3398iBcMqxW7gs3t3lz8TIh2awDQRHeIht6YrPMIqVjaEKQKyuRTIzngfGmgLGibnlaKGsw4aw8rDZznRywIzpz9KNwx2z1dI0EwU5z/IQ6fIEdCCCZNaGvkKldTER8Hwjwfo/g/npXQRoZr7Dn06p2Qq4Kwz8mHWsjs5IZFeqAzLzBECb4pISIRg1R4UISSBUs8ZN/OwJXyg0Ohq93I3hQmT7aJcQNRPgCRP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHhXSU5jQ2dzanhhV3oxcXA4Z1AwSjRKdTVZK0wwNGE1cDN3cU8zTmtIZHIv?=
 =?utf-8?B?VVh6TExZbEJNaG0yRlB4Wkl5dFFKeTJEQlRDNWhqMlkrSU9HUXArUFRQY0w1?=
 =?utf-8?B?WExjREZkZGQ0Z0dmM2NROThQY1FadVJjZ1MyUCs3T1dvdjF3VEpndmtIbWhM?=
 =?utf-8?B?NWRnWjBjQmhyWExsTHNTcnNrZWFTRGRYTjZXTWxJcmczZ01BRUNHWmRWNWNi?=
 =?utf-8?B?Y080UXRUZEZYMHF2dTZuMm5GQi91c0owVVgyREtLM0p0QnlTMDU3Mm85OTJP?=
 =?utf-8?B?R1lUeE5QRkRRb0ZBSnJCMm1sK0NsMWw4amhzYmJKcHRQb1RWaWtYRUJIZHlS?=
 =?utf-8?B?MnZEVnVwWDRRYzE4dGJHdGFUL3pta2RYVDd3YXN0ZlJWUVRyOUJ5T284akxm?=
 =?utf-8?B?SWZrd1A4Z1ZFRXZrelFyMGw0QUtMSTBOT2dKSGNrcFAyR2lXZWtXVXNJR01q?=
 =?utf-8?B?MU0za3ErWXRRRFVWSC9TLzN6S210RnZLNzk5czBrU3FZblViWkVoUnBJNE02?=
 =?utf-8?B?aktXaDk3ekMvdHVtUVQwYU5ROVBFcENVSm9aVFREY1BKMVAwRFkxd0hvU0Vj?=
 =?utf-8?B?V1N5SG9PaTI4T1NzRGlaR2hvMkJiWkRPZTExRG83UTVKOGlmeTd6SDZBNlhO?=
 =?utf-8?B?MHpIVWlsS0htS2tNQnJUakovZG5RRS9qR0Q4RnlyY1dNMnRtblpnTmhKQkhV?=
 =?utf-8?B?OVVNMG9qSkpYc2F6VjZKc2p5SmNRU0xDRHA3RjVhREswa2lqM0FvTkE1ZFZj?=
 =?utf-8?B?OWlyd3M2SVJMSldFY2piMEdCMHgxMjZBcDRIOWI2cnlqcUtqZjdmcUl2UjBZ?=
 =?utf-8?B?a3d6UnlxbkVsVy8za1JnSVRDb2drUWh3ODd4TjRMTUgzc3RSZ1RzaEtWMTlO?=
 =?utf-8?B?K1ZGOUljRnBnbXNMd0dCUitac0JZa3J2RXZ4S0lBQWEvWDVOTjhNS1AyLzFz?=
 =?utf-8?B?TE45cFFBWVpmTVlNeW8xSGhqT1Y2QVhnNVB4b3h3RlF5Z2FlS01zZm55QVBP?=
 =?utf-8?B?UFlZVEdnWjRCaUVpR2lpVUI2T1pIQ3h1RGkraUNaMnlhSXZic09BaTVPMnZs?=
 =?utf-8?B?cjhUcm9MNEhYRktVQnFqam1ocjBwd0ZtMjhOVWpQYzV1bHVINUdMREtXcStQ?=
 =?utf-8?B?azV0VjdzZ2FxSE50cHZZZXJsUkVCenFjSlc0SjJWMmM2MG9MbnRlL3FxMlBG?=
 =?utf-8?B?N1BtdlhQSXNPT3RHZEZmZEFXVWh5YlNvMVphYTVtWVQvZkJzUnFuZHRETmJ6?=
 =?utf-8?B?RDk2c0o0KzNxVHdWWkg5RHFlbXowUElkWTVuTFZDdjZaSENQaUsvMzc0bklH?=
 =?utf-8?B?cTZ6d3A5bk1GeHJwbWtDNWRUZVNMcVlIY1Q2VFd6SjFUaGY0ZFJCckxFMlZC?=
 =?utf-8?B?ZjRXVUNVaHZnYXViV2IwN3NiZDQxR2pGd0ZzRFhmQVVmbFViWUR6N1BMRHlI?=
 =?utf-8?B?bEJCT1FhT0E2UGZCd3dwZENNZlUxOVRIeCtEZ3lHZDcvMWoydFYzZEorR3Qx?=
 =?utf-8?B?NFZ0UngvN05WY2tCWTRmRG5IQVJINUFBS0hEd3czSk1ha2RFejkzNmRrUFZB?=
 =?utf-8?B?YVpqVjRUS2ZHQ1o4ZE1aTmRQK3RHRTFkeGFqSjZoVEJiS1RORGVUREN6NGUy?=
 =?utf-8?B?RCtzVzdhT25YbDB5R29kSjNDQllmZWJJWEJ2aldBMTRpckJJUTlFU1JtWlZx?=
 =?utf-8?B?RUlENnZMbWtKSEpWZU9VWWV1YlkzcDA4Q09Ud0djZ21QdXNkZGVOTDhLWi9v?=
 =?utf-8?B?ZjhmVFUxTExOWm1McGF5Y09YYlJKS2R2ODRtOGttTTRIZ2ZYOFJqblMyZW1y?=
 =?utf-8?B?YVd6ZFdUbU00QVh0L0EwL3RBck5rUHpMUElMRmR5bzFwU0lPZ1BzZmEvWUZo?=
 =?utf-8?B?WDBJL3hlT2ErWmJGbzB6N0Q1YitvRmE2Wk9wTWNhcWRtTWRPOUdpUjVtSDYx?=
 =?utf-8?B?Q05meVFNN01Ia0R2TENQVEhRMzROVGNodEZCbVhXQ3A2MndTRmZKdS94VWZt?=
 =?utf-8?B?WEVDbm8vekY4TmFRQzREd2wzTlR2UkFrNHFDYUhuZDBpWjAxUUMwcGRqTUpy?=
 =?utf-8?B?eGVwMW1XdXFxK205bzA3ZEw5SlFkOXEreVdFb0s0UUdJc3BBNWtxN2kyU0g2?=
 =?utf-8?B?NkpJU0NVamwvYmo3TXpoRjd0NWc0RGRPWVlxY1ZVS3hIUHdnT00zZFg2YW5v?=
 =?utf-8?B?dENmRnVFRFM0NGtPM0RzQkc3a2N6bzNJM0U5WkxhSVV4VXJ2NytnYWNadmN6?=
 =?utf-8?B?ZERqcHlNT1lOazloYmZGQW9UUDNzZ2dKeFlZZkJzSDhXQnRIdlFDM0dyajY0?=
 =?utf-8?B?S2NlaWxqVktJS25RekNudUsydmVyelhmM3hreHZxNkw1Y0NuOGhuQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f33852c-c1f4-424b-13d9-08dec6f3139c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:20:44.2922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcMBVnoglsY7PbpHLA7M1eN8NstLCETbcxKn364WfVRuS56VYCXHkHriPLTRncxccBrKW4dz4kFEKykwbi1l2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_062050_235235_EDDF3202 
X-CRM114-Status: GOOD (  21.78  )
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

Hi Will,

On 6/10/2026 6:28 AM, Will Deacon wrote:
> External email: Use caution opening links or attachments
>
>
> [+Jason G]
>
> On Fri, Jun 05, 2026 at 09:45:51AM -0500, Shanker Donthineni wrote:
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
> I think you can drop the paragraph above. A store-release isn't enough
> to order against a later load in the architecture either, so we're
> clearly in micro-architecture territory and I don't think you need to
> describe mechanisms that don't work here.
>
>> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
>> to stlr* (Store-Release), which removes the "store is not a
>> store-release" condition for every device write the kernel issues.
>> Because writel() and writel_relaxed() are both built on __raw_writel()
>> in asm-generic/io.h, patching the raw variants covers both the
>> non-relaxed and relaxed APIs without touching the higher layers. Note
>> that writel()'s own barrier sits before the store, so it does not order
>> the store against a subsequent readl(); the store-release promotion is
>> what provides that ordering.

Based on the existing code comments and after reviewing this path again,
__const_memcpy_toio_aligned32() and __const_memcpy_toio_aligned64()
appear to be intended for WC regions. Since the erratum is scoped to
Device-nGnR* accesses, and WC mappings are Normal-NC on arm64, I don’t
think the STLR workaround should apply to these helpers by default.

Applying it there would also break the contiguous STR grouping that
this path relies on for write combining.

-Shanker



