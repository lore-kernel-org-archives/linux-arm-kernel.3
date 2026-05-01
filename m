Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C82CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fqrx4/G9neZUtJe+pjUnbnkMpMVy5MofemBrqi7M3ls=; b=pkgiHh432Uav2sMyIdZRaVG4lZ
	oMVgGM2u5HfR34gBDyS42UySB0sklo/XEjcQpZaaLHeR4skfqgYaotvlvb1sWE9dnVwO1u4AklTKZ
	CyUWvsAx+bIQ3eylbftzbIn7K4Sx/5h+cdhhsEcse4sT6CzKBJlSEnwASDrd3GEZH6Ji4rp6wnU9U
	fvjvWWag4zuyLjsyU7Xw6XEI0pzWWdthn1iQvhwSJKSEtgSdLQco4aH9YvudKCZx7VvmC0foL5gTP
	gmxKvCxRuPbdWcM1r18m+4dfDEU3q6l8qr+8rOnMejlvVwZ0W3gMj7AIFh9yW2VvU5cR2N3fwUkiG
	rN2S1Lnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIuGQ-00000007eD1-2zrm;
	Fri, 01 May 2026 20:15:06 +0000
Received: from mail-eastus2azon11020092.outbound.protection.outlook.com ([52.101.56.92] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIuGN-00000007eCg-3pXL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 20:15:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDo2ImF0XK3sy6VLsm4mTek2wX0b+WVjP0/S1fycYXVGt1dQIoNmZQ4zijQQHGkUJqBCTijHVq2OON7FQQoVWk2ycI6IEXRfiOmHPAn/EZDXr67qT5F6mpCZrvbg3ZfwCSH4tc7xVE7TUPK65FAIo8p0E2R6KC5iRzptUE0DhX5qv6YPiUahA/8ImrW/zM8SSH2U3ADYIKnQC/epyFtmITLeHkbwtM6RjCuQ2qTTjzVjSUfJDRqu0+XCtizgTX5IhdBEar7qbnY9rZ0C74rEvwXLQP0ZNDTTDxgThAI4bo5vfLvEb7Xat5telr3nqHBKTqG5oU16TXC2ddHgBVrQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fqrx4/G9neZUtJe+pjUnbnkMpMVy5MofemBrqi7M3ls=;
 b=rv0xunFYvDjtdhJ1T3XONoz5y3EkjlS6QH00IU1hTW/wy1cTfFxUhciji5y0V9nyyQYB7tML+M313NYVLMkfxKQSwB0xTGhRLVQvLX3NDJG/WhnJTyebELp6khr3aPkuewDRJzRgMYBQtLTfqrT5/FSnlIo1KXOx5TvmQ2X6kQG5Nf2WqoEkhV3/SsN7uoOsjKvCkLEzGDT4sJHywT/u7abh8XC5iy+gaH8HdpW3Ni/vOVDPoqNqnDopuAMtScwMHKFaeTRY39mcuOrTieeI62qNjJ4OLxqbOQvcKf6tm+ZGO2h6HZ0HlKOHbEmDTYmsuQtXOaTLhStpP2i0Qu8YcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fqrx4/G9neZUtJe+pjUnbnkMpMVy5MofemBrqi7M3ls=;
 b=cFM+7+8M5iaPEPEe1BJjfcD58PXPuxQc5F+r2MBZl4QWQfkKoG8ZMuyTiHw8GobIDV2ZgtNxgvuOUJVXs+4R9gKwmhNj4WvGCHErq33WhyfSH3kLqJLvL8vdxef1uFEsv9EQIbTIAcKPTdTRdOPXfSiB5AIGv5yBToJf2N/VDZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SA1PR01MB8179.prod.exchangelabs.com (2603:10b6:806:330::14) by
 SA6PR01MB8903.prod.exchangelabs.com (2603:10b6:806:42d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.20; Fri, 1 May 2026 20:14:57 +0000
Received: from SA1PR01MB8179.prod.exchangelabs.com
 ([fe80::f091:2832:ffa:784d]) by SA1PR01MB8179.prod.exchangelabs.com
 ([fe80::f091:2832:ffa:784d%6]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 20:14:56 +0000
Message-ID: <c72b6d61-d532-48f0-add0-4f44051b4ae9@os.amperecomputing.com>
Date: Fri, 1 May 2026 16:14:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: Fix Arm SMCCC SOC_ID name call
To: Andre Przywara <andre.przywara@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250902172053.304911-1-andre.przywara@arm.com>
 <20250903-great-savvy-bloodhound-38c1ca@sudeepholla>
 <20250903-loutish-orangutan-of-experience-3dcfda@sudeepholla>
 <cc8000c0-e457-4bfc-94de-aeeddacab23b@os.amperecomputing.com>
 <20250904-powerful-futuristic-tench-bcebd4@sudeepholla>
 <c0bcef12-6837-414a-960c-da3cf3948308@arm.com>
Content-Language: en-US
From: Paul Benoit <paul@os.amperecomputing.com>
In-Reply-To: <c0bcef12-6837-414a-960c-da3cf3948308@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:b::16) To SA1PR01MB8179.prod.exchangelabs.com
 (2603:10b6:806:330::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR01MB8179:EE_|SA6PR01MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f19729-bd1f-4610-197b-08dea7be502d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|55112099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5T0Ja7M8MaKjrAmJADy9XxW9Uwmx9RZej1CnD8o6l1EzNkCqkgSdEPfhiYPCn8pEVuB7dItd2ObVXSTGfM4YqqTzAHlQ+foBx9vB2hxkS7FE4c1YcDCamLt1C/ED8z6NhNV6casYoGqrZMI0oLtbdgwY0WdFYWUDUlMUbhtE1stIXA8/grEfC/ZCF/4Yw9MPpzzXBfqN9S4rBifkvgaaVNyZH6GDXpzvdPCVqfmjdtNKerJk9u3KlRL12CpwkfvQ6K9o4IunuzwHZTXHzv8955A6OnRB/pOAv3phA3QjAdX9mBxpVuWazTB5nYg3d/0jQ4VOryGutlSh8A8GqlIfLs1zl82WADcE+S9V+6NQWiT+lX446ttCHH3vao6w4V7UHUdUjOeNzbmskTJQJhPlOfGVKUCpBdpSMme1248oLHflvgXFBTQbFQtE2flEIP8lCkABxRIBnn6ETNanhVK8k4zUOo33ZqP0ihlBHm5PfJsq1N+B8Qts8cDMDM3Gkqw+RsFaTw/GkHsZ2m2T1PIxBMkREgDFZKUcbSezX04HX9p+xQKJi4AEKVaSjcrI3VXQGWLX/9jrUlA32gb9pdeeRRTPsAJW0LvwB18V52cPNETs43qQyAJOP5wyWOc4maO0WWskkTnrI5dRq+WPOXgUeH6UlcGYLOsQMaV+YM57qj5anfPjZnp05KepBtgdQz3t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR01MB8179.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(55112099003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3pac2lsRWlqK3YzSkdBdVUzbXlQYldLRjlWSGI1MWZtc0ZrYll5WlBJMWtr?=
 =?utf-8?B?ZGR5TlV3b3FpUHdtRDU1eEx4KzNtUlpmMTNGWEhsV2hFdFkydlpxbHNNWEhJ?=
 =?utf-8?B?OFFNc3QyeE9iUTI2djZKK2QwQi8yd1VuaUFWS2ZUd3V2Tm1qdnJLbmJ0T3Q2?=
 =?utf-8?B?Zys3ZjkzUHZySG9BMTQvNVFmQUVoN0hHa1IrSDNpa3phbGNoemZqcUFDdUk1?=
 =?utf-8?B?c2tpdHV2QkIxQys1d3ROT3VrSXhSRks2eFV0MjhmeW9lVThxUEZXRlZmQ3JB?=
 =?utf-8?B?TllWWTlCT3NYV3lzYmhxYTVmZWx0V1QrTStMWVk5R1plbTNja3M2Z2gwQ2xq?=
 =?utf-8?B?QmIyT3N5WFNURlhtYzZmeTczZG1wYTdNNkxMSHl4TTNILytCT1d1VVREYzVm?=
 =?utf-8?B?dlhGUzRxWWFpN3Z0NDdJdnQrdHpMTFhUNjJtbXZ1SVBnM2pQeitoUStvMWt2?=
 =?utf-8?B?YVpzZjJycDU3cGFFY2hYVDZSNUxYT1hhZ2tPOUtFYUpFL1RSVTR6UWhmd2pO?=
 =?utf-8?B?b0ttQXNid3Z1bDFJbDU3WUZNTno0VjBhbGpmem4vTTh1K29OSmlOME5NQ0w3?=
 =?utf-8?B?ZEdZNXUvUS93eGMyblIzSjVxLzZCTjJRSW83WkJuNEdzS3RzVWZ3LzY1RTQy?=
 =?utf-8?B?bFovT0Q2RitHL1Q1a1dydXhLekI3RzVCVndscWZoWktaTGwvd3pmdDFqS2po?=
 =?utf-8?B?cjJSTlJLZ2V1RzRMTXphcW9MQzN6WWV5aHpoRW93VkZwaHZ5cTdMZjYvWmRp?=
 =?utf-8?B?amd1cFV1OU80SnVqVFZtb284WDJtamNEYVB4MEMyLzlxWUR6KzZidEJVcy9s?=
 =?utf-8?B?QWFBZUxYcG9FYTVoaDV2bkFtcG0xd3ZYTW9aLzloSXB2cW9TNmQyb0EvSVA0?=
 =?utf-8?B?Mis3bVA3RGVNKzBLZlZ0SGZ4RC91QkdLVnVWODlaVC9qYmp1QndwMW1hMmJK?=
 =?utf-8?B?d0FWcHZKdW1lVEhTMmdQS3FId0FLRE9pd21TZ0p1VmdubTBQbWYvRWNPY3Jx?=
 =?utf-8?B?aFAzWE4rNHJVREZqbCtmSlBWajcyOTN4emFselYxQXluQWNMcnVlTGRPQ3g5?=
 =?utf-8?B?a3FhamRKM2UzZkJqT2xQS1JMa3Z3MmNMeTlCMTUwdUxmUEJtbGgwVUJXTFNa?=
 =?utf-8?B?NHBrRXprVURqeVYwdUpwTElQcGlHMEYwMk9MLzZGK2dZNkVpNnJkdWFkaUtS?=
 =?utf-8?B?UjF3VEoxQW90cWVaVC9IODZqMHVvelZjWUZuNzdraUZyY3hIUWFEaHNsWnln?=
 =?utf-8?B?V0orNDVMUi9YN3RqMjRpS3ltNGZMUlUxQ3l5cDdxdDNPL05Yd3dqOGRteG81?=
 =?utf-8?B?R2VYdEZZNUtTSGhQWmVObzBpTDVLTEpQZFZITzFhd0lkOGYzTk14SVNhektv?=
 =?utf-8?B?U28rS3VUWU9zTWh0T3ZTdlArYWpDRHowaHVlNTViaHYvQ3E2VGkwZ0NyNmVT?=
 =?utf-8?B?MWdOMmY4SHpWYzgvWmkxNk4yVVljbk93YUNvY3JGVzV4UXVyazNlSVNtTlJQ?=
 =?utf-8?B?Qk51eHBBVGRyL1BRSVNlZHZadk05Zm9DMEZ0UUEyRGRjYk5hUUw3bkhUZXZI?=
 =?utf-8?B?c2Y0OURKSk5qdm5CZjdxVk1UY1k5RHc1eWtpTnJlU0c0K2VCNklxVC9kclRk?=
 =?utf-8?B?R2RZT0R4WWpFdmNUMjlqUHQwNS9rYXR3dXJLQkxwWDBxSHNXOHJnTlczL3Q2?=
 =?utf-8?B?VXcwRlR3dnFmTy96ZVQzQjlsU0l1MDRucmwveWo2cXM4WktIZzJHSC8xSWZS?=
 =?utf-8?B?elpNUjIvalNXdVEydUNEWk53KzNKZjBiZm52aFV1MkxNVlRPNVVRRXdCM3Ax?=
 =?utf-8?B?dU93VWhzMFlna1FWVkhVTjJnNTNJSHBxSDdWY2dGdmJGTVFva1N3RjlXVm9t?=
 =?utf-8?B?eTR2Q0dtNUVmTUJVRUFIaFF0SUpVcnBTRTI1T2x6TWlYOFZ4eEdKM2lraS9B?=
 =?utf-8?B?WG83Z0pNVVc4ckFHVmJiWkNBNTA2UXA0VlN0akdFSXN4OGtqSDFvWm9Tck1R?=
 =?utf-8?B?TmxIeTRCVU5TUjNaa2dUM2hreEowYVdZYmFFOThEb1RPeEFaOG5jTkxaRFJQ?=
 =?utf-8?B?NjdUZ0xDRmNaSWZwK1Z1b0xzN1paUGFmRTQvYzZ2Mk4wZ3VlVmhqWUZmbkJN?=
 =?utf-8?B?WFdYRnVVTVRKOXB0K3N4SzRjWGIwcmxvWHRMQWRUanNLaDRVd1VSYUh6b2dN?=
 =?utf-8?B?b094OXVwK252TVV5eXM1TnB3b2xQVFpxS2ZKNFN3YUNPcTAreDZWSkZCYVFO?=
 =?utf-8?B?QmpBckxYOVcrTGhJZzJuNkluVGZZYU5BWVJXU2JNODlBYVBPcEtORlBqRFZ0?=
 =?utf-8?B?b01QWXc2amIvby9XR0lkT0dNcW1Bb2lEQ250bVk3QTFvQktYbTB0QmlMbWlR?=
 =?utf-8?Q?jNibSZSc1hYn50e4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f19729-bd1f-4610-197b-08dea7be502d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR01MB8179.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 20:14:56.7173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2rsAuoRM21HzzCxWLqfxzMvS8Y/7Jd0vISN3KOAo2OprW7va4DJEW6TE/bCtWSHdsPxvQnRP72BV8kysP9N7897tHXYW7Fng6p0T6VgiCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB8903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_131503_989376_543B9823 
X-CRM114-Status: GOOD (  36.81  )
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

On 4/30/2026 10:59 AM, Andre Przywara wrote:
> [You don't often get email from andre.przywara@arm.com. Learn why this 
> is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Paul,
> 
> is there any update on this?
> One more thought below ...
> 

Hi Andre,

Using the incorrect SMC32 vs. the correct SMC64 interface, for SOC_ID
Name, was addressed by Ampere firmware some months back.

In addition to recent firmware now responding to a SMC64 CC SOC_ID Name
request, it will continue to respond to an incorrect/broken SMC32
request and return the SOC_ID Name string packed in 64-bit registers.
This will allow Linux kernels 6.15+, incorrectly using SMC32 to get the
SOC_ID Name, to continue to work with new Ampere firmware versions.

In other words, unless any other vendors also implemented SOC_ID Name as
SMC32 in their firmware, I think we can let the Ampere firmware handle
the SMC32 vs. SMC64 mix-up and keep the handling of it out of the Linux
kernel.

It should now be safe to make the SMC32->SMC64 SOC_ID Name change in
Linux.


> On 9/4/25 16:29, Sudeep Holla wrote:
>> On Wed, Sep 03, 2025 at 05:38:44PM -0400, Paul Benoit wrote:
>>> On 9/3/2025 10:49 AM, Sudeep Holla wrote:
>>>> On Wed, Sep 03, 2025 at 03:23:58PM +0100, Sudeep Holla wrote:
>>>>> On Tue, Sep 02, 2025 at 06:20:53PM +0100, Andre Przywara wrote:
>>>>>> Commit 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC 
>>>>>> SOC_ID
>>>>>> name") introduced the SOC_ID name string call, which reports a human
>>>>>> readable string describing the SoC, as returned by firmware.
>>>>>> The SMCCC spec v1.6 describes this feature as AArch64 only, since 
>>>>>> we rely
>>>>>> on 8 characters to be transmitted per register. Consequently the 
>>>>>> SMCCC
>>>>>> call must use the AArch64 calling convention, which requires bit 
>>>>>> 30 of
>>>>>> the FID to be set. The spec is a bit confusing here, since it 
>>>>>> mentions
>>>>>> that in the parameter description ("2: SoC name (optionally 
>>>>>> implemented for
>>>>>> SMC64 calls, ..."), but still prints the FID explicitly as 
>>>>>> 0x80000002.
>>>>>> But as this FID is using the SMC32 calling convention (correct for 
>>>>>> the
>>>>>> other two calls), it will not match what mainline TF-A is 
>>>>>> expecting, so
>>>>>> any call would return NOT_SUPPORTED.
>>>>>>
>>>>>
>>>>> Good catch and I must admit I completely missed it inspite of 
>>>>> discussing
>>>>> 32b vs 64b FID around the same time this was introduced.
>>>>>
>>>>>> Add a 64-bit version of the ARCH_SOC_ID FID macro, and use that 
>>>>>> for the
>>>>>> SoC name version of the call.
>>>>>>
>>>>>> Fixes: 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC 
>>>>>> SOC_ID name")
>>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>>> ---
>>>>>> Hi,
>>>>>>
>>>>>> as somewhat expected, this now fails on an Ampere machine, which
>>>>>> reported a string in /sys/devices/soc0/machine before, but is now 
>>>>>> missing
>>>>>> this file.
>>>>>> Any idea what's the best way to handle this? Let the code try the 
>>>>>> 32-bit
>>>>>> FID, when the 64-bit one fails? Or handle this as some kind of 
>>>>>> erratum?
>>>>>>
>>>>>
>>>>> Not sure about it yet. Erratum seems good option so that we can avoid
>>>>> others getting it wrong too as they might just run the kernel and 
>>>>> be happy
>>>>> if the machine sysfs shows up as we decided to do fallback to 32b FID.
>>>>>
>>>>> I will start a discussion to get the spec updated and pushed out 
>>>>> and see
>>>>> how that goes.
>>>>>
>>>>> The change itself looks good and happy to get it merged once we know
>>>>> what is the best approach(erratum vs fallback).
>>>>>
>>>>
>>>> Looking at the SMCCC spec(DEN0028 v1.6 G Edition) ->
>>>> Section 7.4.6 Implementation responsibilities
>>>>
>>>> If implemented, the firmware:
>>>> ...
>>>> • must not implement SoC_ID_type == 2 for SMC32.
>>>> • can optionally implement SoC_ID_type == 2 for SMC64 (Function ID 
>>>> 0xC000_0002),
>>>> ...
>>>>
>>>> So Ampere is not spec conformant here and hence I prefer to handle 
>>>> it as
>>>> erratum. Hopefully we can use SOC_ID version and revision to keep 
>>>> the scope
>>>> of erratum confined to smallest set of platforms.
>>>>
>>>> Paul,
>>>>
>>>> Thoughts ?
>>>>
>>>
>>> Am I correctly understanding that, if the SMC64 SOC_ID Name call fails,
>>> rather than an unconditional fallback to the SMC32 call, the SMC32
>>> fallback would only be occurring under the proposed erratum?
>>>
>>
>> Correct, if we have unconditional fallback to the SMC32 call, then there
>> is a chance that this issue gets carried into newer Ampere systems as f/w
>> gets copied as well as other vendors will also not notice the issue if
>> they make similar mistake as the kernel silent makes a SMC32 call.
>>
>> We do need details of  the SoC revision and version for which we need to
>> apply this workaround/erratum.
> 
> So this looks more like a firmware erratum than a SoC specific one,
> right? So I wonder if any SoC specific IDs are really appropriate here.
> Is there some firmware version we can read via DMI or so to identify
> affected systems?
> Or shall we use a probably much easier SoC or even MIDR check anyway,
> since it's just a fallback? As in: try smc64, if that fails and if it's
> a core that ever shipped with that affected firmware, try smc32? I think
> there is not much harm in trying those FIDs, so we just limit the scope
> to Ampere cores - even though that's technically not the right method by
> the book?
> 
> Cheers,
> Andre
> 
> 
> 
>>
>>> I brought this issue up at a weekly team meeting today, and I'll also be
>>> communicating with the Ampere Computing firmware team regarding this
>>> issue.
>>
>> Thanks!
>>
> 


