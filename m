Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30255CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/MK1ao9zPl4RAYelaqHVYdscWhgWXiO+OZmvWUbBz0=; b=d8IY0CSp/P97sP3DLAl5z/szSz
	obYMPpWO9RCwZ1hdEr7Q9uOmc3il4ve/i7PVPqIpngG+aktZriGSIbIQfTfKjn0sBETSoN5v+O8sK
	ZPXovroW4CrGSnmm4Bs9W/h6jQAMaKO80pczXgOoq7LyqjObyLosR3UrCmVEyMsfO9N6UUItZwM7P
	rV+pmiBBXtuk4wFBKYJZcDKPsOM4R34TcoJJAZYQIrV34z6Wl8TL8IvWV5iQCu9WfxRGGAWTmclqo
	YbkhmSFAP7lfPVbmKK+k/aejsU+HxMzv+7AM1P0KWvBPpk/CvzW1ULYLRol1TTv5qDDvoMnabscu+
	B8MVnQdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhpp-00000009j79-1lRh;
	Thu, 11 Jun 2026 16:00:49 +0000
Received: from mail-westus3azon11010047.outbound.protection.outlook.com ([52.101.201.47] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhpm-00000009j6R-1GRy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 16:00:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zr25G2+Jvf8rzC9bls3X4ZuLjBRoa9vmEMJueIlvXrlYRTUUB7vFQ538at5K/+FywU0gaLwRME0y9lGaU57hy11xBmCfDN/5HhNZUEIDXLE0tT7HqAu4w81IhxYop5/70ACPe+W1hu9R+Gbt3wVCcuV0Hv0WVUoGkHoSQp+Ai0jfCGjzO0FT9BnR+pAG6gwZzE2DAgh//2syhyWJZrmlyT4o1sHWnXhpYdjUBipmDhKlRpDQfp3fryd2SNf5vLOKp98shXmDK7IoJU0f3NMD3I7B3Nzo0v43uc9qOR9t903zdfTyxYoy+Mf/SRM2lYC0wtwOMYS5jhNWGDXyyIbZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/MK1ao9zPl4RAYelaqHVYdscWhgWXiO+OZmvWUbBz0=;
 b=EY9tkpi5d8ypk2oly56d+DRWP0fLXBY+X2ISabu2i36WQD6ppArluG0GIrVkvuvPJFqZ5INEecgQq5FL73yowo2FV8Ivr17fFPiKOLbeIgmqQh3PBSNQybw7M5rCbXJdAZUKEAwFZbr/pInWCRufe02ReapwtjETKdR8YeZqMjqaAr0LkeOH/ugVAprHxbxTnPX3a6PsNem6FtnUVGyS9YMXdhaI861ENrYhSySCOjxVyFeypdo7FKfKIZIOEUyA3o2lNc9nVPYYqE6dmutcucrgCLBtshCgMGF3si77BvgAVDecHCWkFUCktpu968Jwf+pXkjKFEaRF8XXhEtfT0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/MK1ao9zPl4RAYelaqHVYdscWhgWXiO+OZmvWUbBz0=;
 b=X5CXXDJ1mneOg8HvrV+f9TH1zbIJp4gfyTNQvlRgozEMwnVZ5wP9HGvewEDw5S6t0XjktTT0OAJ+xvWOoimmbLv+89VpYGXDbn/aEvnjkBZl2hTgkIt0AIkTTDVegr+ma7GBbYioEnSPhFicQcCoK5YgzCcMCcNiT/hOLuOVIHzn/a1xCapvOQynAQ63tpe+eAQ7y7x2eK9+4/4TzkRYKlG5z6YrpWGZOfHhPas3Z7pjKzsrSm25M/MqBDu3a+PY1fuELjvEzHRw0xSse19Jqsxl7jEqpaBzspY999GSzv9KWLo3kqX1Gs8LD73hShGtAqiO65iRbiUJIDni5DlklA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 16:00:28 +0000
Received: from IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c]) by IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c%3]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 16:00:28 +0000
Message-ID: <1ac28eb7-99d1-434c-b0d9-0dff1814c807@nvidia.com>
Date: Thu, 11 Jun 2026 11:00:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
To: Vladimir Murzin <vladimir.murzin@arm.com>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Jason Gunthorpe <jgg@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
 Jason Sequeira <jsequeira@nvidia.com>
References: <20260610164822.4157248-1-sdonthineni@nvidia.com>
 <aiq5VigmtZq9GlAm@willie-the-truck>
 <aee00047-81b9-4562-be47-500b2643f7f6@arm.com>
Content-Language: en-US
From: Shanker Donthineni <sdonthineni@nvidia.com>
In-Reply-To: <aee00047-81b9-4562-be47-500b2643f7f6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::35) To IA1PR12MB6089.namprd12.prod.outlook.com
 (2603:10b6:208:3ef::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6089:EE_|IA1PR12MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 1231cc31-af52-44e5-0682-08dec7d28e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|3023799007|56012099006|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: /M3t0uqc1x9qcEBIATfFKHazhAnQeA/jclMU5qLCyIqCtIWOrprfIFSL2p7ODLUjj+h49e9Xez9syFJCaW1qqnkxGCUTZTyXDT75+PoipCKkvgQ67IZJP2X2xpxnuihvw6nz1eYBLMX31vbHdRHtbFN/DUcyrIrvLT8TpgzusFkpI/RZ+W6P0TzQKmoIUww6OAhS4bLdUh4TBqejZnjdYGrxdYuH3bwrUCrpDh4TkXedkDS99xyjOcSxLtcntlPsufnBm9YE9OgPYdNxAj8dNA4/rKIKubAPuGIdvc3o7pvEPL7bBb8BskD9havygnGr2gRnJeRDXL3DVh3iZtYmgGFCR0uxaCStLnuJujasfWCY72hCHXGV0rjm2Y6tkBX5JVIIJRzkQXsCU/c74Zm4RJwo2eG8uoT6h/UQzNS/e48lILcV490ThdfS4gLVoWXtzmU+h8DKS7bgTgPtDuJwWpRTy1OBN4x4l7xE37bCHKN5FuaAwFFfEAzE+t4xeC68eIekF+kzh6Kw8hWiWZXSd/mTwv+oAqZ3aMf8IJXo9kYPZ8CQ2XYIv3Mh03iH9wRd4ez2tNiVj+C2ca1K86gOgkJPtJkVkK47W6TJMbV7ZU5GzwDJZQMcnz4+m8x3+XkC2jGPR1w9s7TZ1eDP6nY+an88LvUsMhzJHVbmehhSERQLFFz2GlaKcKUpVrE0JwOv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjQ0Y3QrVjF6RG82amtHd2NEaTJ6aWZPekRtVzF4R3h2TnB4dXZrQkRNRFN5?=
 =?utf-8?B?enlJa0VsaldadmpxbWo1RVdiL29CUmc1VThDNGVEYkErK0h0MitkekgrTFJY?=
 =?utf-8?B?L2YvMnJqWWNxK01ycFg1N3VRRUZOZklSRnh6UEIrZzVPSFF6b2lpeis0NTJq?=
 =?utf-8?B?YlNyRjJtaWJVNEk1U1NxV2NSanJCVFAxV1Q0U2RrUnZqeHJlNDZ4UGlzWGZD?=
 =?utf-8?B?MVNCbThLNitDTHRiUVB6QXU5WGNqVmNjMyt0bXRXNWlQelZZb0xBeG9GNmZH?=
 =?utf-8?B?MkRHMngrRFU4K09OdDNLZ1luU3VBd0NPRnFCK1pET2hCTlIvSnJsSlljTzl4?=
 =?utf-8?B?NDVrOHdiMmhtd3IrQTdGODM1TlRTSWRtVmgvbGtVdi9lNjZocWo2VlI2SzZp?=
 =?utf-8?B?d2V1K2NONEJXUnp4eFdXVU0waHJCOHE4U3JBTU5lQ0NXcnhjN0NkMWdRbzVT?=
 =?utf-8?B?WmlFZnNLVzViNGNZaDliUmN3NGRkZHpmbjUrZEZTT3d2QXFqSEYyelZpcEpq?=
 =?utf-8?B?THBvY2pQM1liZlRucjlMcDhBZWRjWERKengyNUJnMW40YmtGTTZpNHBMRThU?=
 =?utf-8?B?azlKNXRqbENRTjY4M3ZtUWloTWRBakNXWlFWcnFEaSt6eHNMcDJMYjNDUUJJ?=
 =?utf-8?B?bUJwVG5Yd0ZRakdmc0IzWjE4dURqNzhQYkFHOVJtcElkRHp6Vng1ZjQyZGlK?=
 =?utf-8?B?ckNiWkxIelAvSUF0aUl5dGFFZ3hZVlU4cDdZVlA5cDYzQjRxZk1pY0xxcmJo?=
 =?utf-8?B?YzJEVG44MFFleStKYkhyaXQ2UVJLL1p6V0ZQMnFXbXJsS3U0aitSRzc3VTIx?=
 =?utf-8?B?SkxFcVBYRG1jang3dmkxRlJHRkpEb3hqT0RTY21YZFVJN25mTVVRbEpVOHdx?=
 =?utf-8?B?UlJFMVAzWktVempzTWpGWmNlMlFXL3U3WlM0MHJSZmh6R1pWaGNpVFpCTFY0?=
 =?utf-8?B?YkpIRTV3ZzJFYnRic3JNbGNGTVV2VDdFQnZGTnRkWVhhODE2RFpMK3pDWVBT?=
 =?utf-8?B?Ykh2TVhXQ3RyQVk1ODUyMHZEUGRpL0xGSitJdlBIZDhzN1hHVGMxUmtwYnh6?=
 =?utf-8?B?dTRNWlRoejhpNitxa2J1eWFqT2wvTERTb3JiMFYvOG03Ymd4OUFNckdsL3ZK?=
 =?utf-8?B?VlBDNjJzdUVsNFFWUm1qSXRicXBaUEQ4WDk5bzk2b3lsQXgyTVJaR1VKdncr?=
 =?utf-8?B?cDN5dFBjdlJtVGVhbHJraHdPTi9VMVgrbEZKUjV1VjI1dnc3QjhwQlk2K2Rm?=
 =?utf-8?B?MmFtcTRrb1hNZThzMW9VU1dYdjRtNlc0NUdFdytTQkVKc01ZZnJEdFR2aUp1?=
 =?utf-8?B?cWc3Mlh6dTFVa25kc1cvRjhlUlg4bkJIOHJjOVBrS0JrQlQweGg2WkoyampR?=
 =?utf-8?B?NHFQV3ZWREdjaEZKZTlSUXc2cWZPSFBWVWU4MVFlUVptMXdTdDZEdC8rUFlC?=
 =?utf-8?B?Y0tLU3IzVGplT2hhVXpKVWFWUTY3Y2FNdGpWU3pBczZhUnFSSXpZU1VHdnND?=
 =?utf-8?B?RXN6NnpjbGpLRWV3Y09nZzNOM1U1cnRucW1RVlF3Z1BWOUJ2ODNlNm8wTFBO?=
 =?utf-8?B?RW5UT0xmSG44bzRJWjZSdGh4SlJrTVJZd0RhZlBwZ2lEZ25oSFVvSEVzeHRV?=
 =?utf-8?B?dm1DbDFKbXhRdE02QzFTVkRpOGNaaTU4bW1lTUluWml1ZW5ZQTNrQytBbk1n?=
 =?utf-8?B?MkFOeWFkK01lYTFvN21SUDFoc3NwcmFvaGtGaXEwajJGaHRpSjdIWWdNaW9Y?=
 =?utf-8?B?Zm90NXRJY2xGeldISG1uYktWV1ZBWEZ5WjlHNFpiMTFoSlNGVEJLMk41Tzhk?=
 =?utf-8?B?YUdmTDg1NWw5anFZZ0txZk1HTHpobnR5WWZlT0ZIVUE0eWo2WDVHRGlqNWkz?=
 =?utf-8?B?eVhkd3RIUngyNGRZMzl2dXU4bmJyUVNNWFdpMFVLa09zYkc0NDNiVDhOZDVq?=
 =?utf-8?B?dW1yQTdEUFptWEF3VnNxT01QZ0JvOGkxNWxzeW1WL3U4L2VrUHBLK2kxZXVl?=
 =?utf-8?B?OXFId0JYN2daMVk4Q0pFQUd1MGZ2MnJJcW5lMStRbE1JYkFmSTJJUmhuajlV?=
 =?utf-8?B?WDhrcHRWT1lJZFU2QldDdFErcjNPNm0vY1YxWDFqbzlDVzVTK2lFeEt1Vk9C?=
 =?utf-8?B?eHM0MFVvWmMwNFp6QUJ3YXZXVmx0TVV3OVhFaHUyOHZvdW9SMkNPRys3WkhQ?=
 =?utf-8?B?c2FiWUJmbmRteVRaWUhQcGlqelMrRFRiUEVEZURnTDJxQ1MyRjAyUE1iMG1r?=
 =?utf-8?B?YzVuNC8wZ3JEa3hNbWtFTDlWMHZzWWQ4YWZQcWh3OERocExDdnpaczc4Z2lo?=
 =?utf-8?B?a1dJdXJOTW84WnZVNEUzM09VSVAvWVlNTDgrRWo0T2RGanhBTThRUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1231cc31-af52-44e5-0682-08dec7d28e98
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:00:28.4611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHwy0leU2Md2Ycm3STaMfcbjrQqdncTXm3PebByHm3S80HRH1aD34BmupfFVt2dKnRnHr/QuVjf4fjHbLZaf1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_090046_350617_04AA69C0 
X-CRM114-Status: GOOD (  21.28  )
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

Hi Vladimir,

On 6/11/2026 10:08 AM, Vladimir Murzin wrote:
> External email: Use caution opening links or attachments
>
>
> Hi,
>
> On 6/11/26 14:34, Will Deacon wrote:
>> On Wed, Jun 10, 2026 at 11:48:22AM -0500, Shanker Donthineni wrote:
>>> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
>>> observed by a peripheral before an older, non-overlapping Device-nGnR*
>>> store to the same peripheral. This breaks the program-order guarantee
>>> that software expects for Device-nGnR* accesses and can leave a
>>> peripheral in an incorrect state, as a load is observed before an
>>> earlier store takes effect.
>>>
>>> The erratum can occur only when all of the following apply:
>>>
>>>    - A PE executes a Device-nGnR* store followed by a younger
>>>      Device-nGnR* load.
>>>    - The store is not a store-release.
>>>    - The accesses target the same peripheral and do not overlap in bytes.
>>>    - There is at most one intervening Device-nGnR* store in program
>>>      order, and there are no intervening Device-nGnR* loads.
>>>    - There is no DSB, and no DMB that orders loads, between the store and
>>>      the load.
>>>    - Specific micro-architectural and timing conditions occur.
>>>
>>> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
>>> to stlr* (Store-Release), which removes the "store is not a
>>> store-release" condition for every device write the kernel issues.
>>> Because writel() and writel_relaxed() are both built on __raw_writel()
>>> in asm-generic/io.h, patching the raw variants covers both the
>>> non-relaxed and relaxed APIs without touching the higher layers. Note
>>> that writel()'s own barrier sits before the store, so it does not order
>>> the store against a subsequent readl(); the store-release promotion is
>>> what provides that ordering.
>>>
>>> Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
>>> ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
>>> parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
>>> the plain str* sequence.
>>>
>>> Note: stlr* only supports base-register addressing, so affected CPUs use
>>> a base-register stlr* path. Unaffected CPUs keep the original
>>> offset-addressed str* sequence introduced by commit d044d6ba6f02
>>> ("arm64: io: permit offset addressing").
>>>
>>> The __const_memcpy_toio_aligned32() and __const_memcpy_toio_aligned64()
>>> helpers are left unchanged. These helpers are intended for
>>> write-combining mappings, which are Normal-NC on arm64. Replacing their
>>> contiguous str* groups would defeat the write-combining behavior used to
>>> improve store performance.
>>>
>>> Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
>>> Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
>>> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>> ---
>>> Changes since v2:
>>>    - Reworked the raw MMIO write helpers so unaffected CPUs keep the
>>>      existing offset-addressed STR sequence, while affected CPUs use the
>>>      base-register STLR path.
>>>    - Updated the commit message to match the code changes.
>>>    - Rebased on top of the arm64 for-next/errata branch:
>>>      https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/errata
>>>
>>> Changes since v1:
>>>    - Updated the commit message based on feedback from Vladimir Murzin.
>>>
>>>   Documentation/arch/arm64/silicon-errata.rst |  2 ++
>>>   arch/arm64/Kconfig                          | 23 ++++++++++++++++
>>>   arch/arm64/include/asm/io.h                 | 30 +++++++++++++++++++++
>>>   arch/arm64/kernel/cpu_errata.c              |  8 ++++++
>>>   arch/arm64/tools/cpucaps                    |  1 +
>>>   5 files changed, 64 insertions(+)
>>>
>>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>>> index ad09bbb10da80..fc45125dc2f80 100644
>>> --- a/Documentation/arch/arm64/silicon-errata.rst
>>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>>> @@ -298,6 +298,8 @@ stable kernels.
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>>   | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>> +| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
>>> ++----------------+-----------------+-----------------+-----------------------------+
>>>   | NVIDIA         | Olympus core    | T410-OLY-1029   | ARM64_ERRATUM_4118414       |
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>>   | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>> index c65cef81be86a..d633eb70de1ac 100644
>>> --- a/arch/arm64/Kconfig
>>> +++ b/arch/arm64/Kconfig
>>> @@ -564,6 +564,29 @@ config ARM64_ERRATUM_832075
>>>
>>>         If unsure, say Y.
>>>
>>> +config NVIDIA_OLYMPUS_1027_ERRATUM
>>> +    bool "NVIDIA Olympus: device store/load ordering erratum"
>>> +    default y
>>> +    help
>>> +      This option adds an alternative code sequence to work around an
>>> +      NVIDIA Olympus core erratum where a Device-nGnR* store can be
>>> +      observed by a peripheral after a younger Device-nGnR* load to the
>>> +      same peripheral. This breaks the program order that drivers rely
>>> +      on for MMIO and can leave a device in an incorrect state.
>>> +
>>> +      The workaround promotes the raw MMIO store helpers
>>> +      (__raw_writeb/w/l/q) to Store-Release (STLR), which restores the
>>> +      required ordering. Because writel() and writel_relaxed() are built
>>> +      on __raw_writel(), both are covered without changes to the higher
>>> +      layers.
>>> +
>>> +      The fix is applied through the alternatives framework, so enabling
>>> +      this option does not by itself activate the workaround: it is
>>> +      patched in only when an affected CPU is detected, and is a no-op on
>>> +      unaffected CPUs.
>>> +
>>> +      If unsure, say Y.
>>> +
>>>   config ARM64_ERRATUM_834220
>>>       bool "Cortex-A57: 834220: Stage 2 translation fault might be incorrectly reported in presence of a Stage 1 fault (rare)"
>>>       depends on KVM
>>> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
>>> index 8cbd1e96fd50b..801223e754c90 100644
>>> --- a/arch/arm64/include/asm/io.h
>>> +++ b/arch/arm64/include/asm/io.h
>>> @@ -22,10 +22,22 @@
>>>   /*
>>>    * Generic IO read/write.  These perform native-endian accesses.
>>>    */
>>> +static __always_inline bool arm64_needs_device_store_release(void)
>>> +{
>>> +    return alternative_has_cap_unlikely(
>>> +                            ARM64_WORKAROUND_DEVICE_STORE_RELEASE);
>>> +}
>>> +
>>>   #define __raw_writeb __raw_writeb
>>>   static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>>>   {
>>>       volatile u8 __iomem *ptr = addr;
>>> +
>>> +    if (arm64_needs_device_store_release()) {
>>> +            asm volatile("stlrb %w0, [%1]" : : "rZ" (val), "r" (addr));
>>> +            return;
>>> +    }
>>> +
>>>       asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
>>>   }
>> Use an 'else' clause instead of the early return? (similarly for the other
>> changes).
> Perhaps I'm missing something, but it is not clear to me why all that
> complexity is required.
>
> IIUC, benefits coming with d044d6ba6f02 ("arm64: io: permit offset
> addressing") are from better code generation, so we:
>   - save code
>   - open opportunity for  write-combining
>
> d044d6ba6f02 ("arm64: io: permit offset addressing") comes with simple
> benchmark to measure effect of code generation:
>
> | void writeq_zero_8_times(void *ptr)
> | {
> |        writeq_relaxed(0, ptr + 8 * 0);
> |        writeq_relaxed(0, ptr + 8 * 1);
> |        writeq_relaxed(0, ptr + 8 * 2);
> |        writeq_relaxed(0, ptr + 8 * 3);
> |        writeq_relaxed(0, ptr + 8 * 4);
> |        writeq_relaxed(0, ptr + 8 * 5);
> |        writeq_relaxed(0, ptr + 8 * 6);
> |        writeq_relaxed(0, ptr + 8 * 7);
> | }
>
> which compiles to
>
> | <writeq_zero_8_times>:
> |        str     xzr, [x0]
> |        str     xzr, [x0, #8]
> |        str     xzr, [x0, #16]
> |        str     xzr, [x0, #24]
> |        str     xzr, [x0, #32]
> |        str     xzr, [x0, #40]
> |        str     xzr, [x0, #48]
> |        str     xzr, [x0, #56]
>
>
> v1/v2 compiles to
>
> | <writeq_zero_8_times>:
> |        str     xzr, [x0]
> |        add     x1, x0, #0x8
> |        str     xzr, [x1]
> |        add     x1, x0, #0x10
> |        str     xzr, [x1]
> |        add     x1, x0, #0x18
> |        str     xzr, [x1]
> |        add     x1, x0, #0x20
> |        str     xzr, [x1]
> |        add     x1, x0, #0x28
> |        str     xzr, [x1]
> |        add     x1, x0, #0x30
> |        str     xzr, [x1]
> |        add     x0, x0, #0x38
> |        str     xzr, [x0]
>
> were alternatives are swapping str with stlr. In other words, we are
> rolling back to the pre-d044d6ba6f02 implementation.
>
> v3 compiles to:
>
> | <writeq_zero_8_times>:
> |        nop
> |        str     xzr, [x0]
> |        add     x1, x0, #0x8
> |        nop
> |        str     xzr, [x1]
> |        add     x1, x0, #0x10
> |        nop
> |        str     xzr, [x1]
> |        add     x1, x0, #0x18
> |        nop
> |        str     xzr, [x1]
> |        add     x1, x0, #0x20
> |        nop
> |        str     xzr, [x1]
> |        add     x1, x0, #0x28
> |        nop
> |        str     xzr, [x1]
> |        add     x1, x0, #0x30
> |        nop
> |        str     xzr, [x1]
> |        add     x0, x0, #0x38
> |        nop
> |        str     xzr, [x0]
> |        ret
>
> where static branch swapping nop with branch to stlr and back to add.
>
> So it looks to me that we're losing an opportunity for write
> combining, but in terms of code size, v1/v2 seems to be the lesser of
> two evils.

Thanks, that makes sense.

My intent with the v3 change was to keep the offset-addressed STR sequence on
unaffected CPUs and use the base-register STLR sequence only on affected CPUs.
However, as you point out, because STLR only supports base-register addressing,
the affected path still forces the address to be materialized in a register, and
the alternative_has_cap_unlikely() check adds another instruction at each write
site. So the generated code no longer preserves the benefit from d044d6ba6f02 in
practice.

Given that, I agree the extra complexity is not justified. I’ll simplify the raw
MMIO write helpers back to the direct ALTERNATIVE() form from v1/v2, where both
the STR and STLR paths use base-register addressing. That is still a regression
from the offset-addressed STR sequence on unaffected CPUs, but it avoids the
additional static-branch/nop overhead and is the smaller of the two options.

-Shanker


