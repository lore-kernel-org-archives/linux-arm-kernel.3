Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC89CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 02:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHvsIAgIBceF0OPDYR+D1Xr8Nu0CLjHXLYuecGFm7rY=; b=Cxn1fqmN1m9Ovtm/TMAMlehYDw
	69vrtKvis1Qa0tJgmJnvo/8IS6Z7UAJW0Qcv5MjjUbsAlW61FlQKBKHZR3PgCFOnfbVoaWG8m54Zj
	AOt+P6XIIQw71A82NXuzgjFBRJMJad84Ipyf0ujxU+3Xqkiz36SkqceZBGXljb/lX5Duy8mNF6gGP
	Tp4h9mgIbrUx1FCuVxz43bfBfBAJnKCjvXw9bMQI7TsPio2nZ91XB4+em2paKjwjg7m5Z/CZ+K+uj
	ShwDvDQcReiRIfW2NYJP9rsJCUIA68ycRAcat0i82hrlnkQAa94J8yEuzQ7zWPkJZ+AQ+GwE47Ii/
	oh9nuhPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa2fQ-00000000Wje-3NCk;
	Thu, 18 Jun 2026 02:39:44 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa2fN-00000000WjG-2PtZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 02:39:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9Orkoee0SHfN3xK9EGQ9VC7RWlYw0m5crFg0vEfzyg/NJq+gvGDNcMDgwW+usjJRASNA5CkKGl9kqC6j3xZCtGKmSvCD6BBWRswY/cmrCJP8Lsjefb0VwtOZuVur8Kn//7ok2e+ngXoqlhwRRxxFiGxWodVsCZs2UcGjyRefZjnczIjLu0vS8jQf9W7lGG9t+6FPhF+n4deBY0C6mQPWdBPYVoEgtMIqPCLeCoNkBR808F14mzuBD7bQnA2R0WlYK+9/drdcZ671nk154jga5SNQJlTMmOdIbpqsqhRMgUQzwwubNh7J/c0oK7gwszbcWIVi9ZNaUxSrCXhtxAbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHvsIAgIBceF0OPDYR+D1Xr8Nu0CLjHXLYuecGFm7rY=;
 b=NWacjJweOwsKg7Dn/tJf9L2oBzzqktBVe/PUIE4cdkpfzs8febYxd//STKvYbEM5awFYMEZC9bt01GrI+Clap0xBK0g273C0i6r29e61122je7YlmJRED/TUvmIyYDNahvqDAQsXnyhddmYNetIQshw8CRBAv14YvDNSF4vF5FWw2KHOmnGwjn3E5lm/pvaTtcdzB/asX+Yb0u01lY82H3ntxU850v+lGwEBPKmouebcLhIBdKtLbqFHFwNUXekJI2H4oyHZOrmJ23a1ki62aqk3drGjqI6Ak+vNLyTlEbTsE2u0ePbUx/b2t8AefAMVSv0RVLRbQUXkVGC65ZMkBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHvsIAgIBceF0OPDYR+D1Xr8Nu0CLjHXLYuecGFm7rY=;
 b=g/eXt4BSn29yVu7Y7xnRP1QCtNsvzSKzUqU7Jz4n+jUlvb2pYoeJqdlEerVFL2VYL0QNXrKKNOxNzeK0IgPU1jBxMKOelAFUCnZFTgI6/4SNsJ8UND35O5YpLH7xp9AnDeMnuxIheSxpwfDckWJmJAw8uzoVritQAar+v4w343Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10) by MW5PR12MB5622.namprd12.prod.outlook.com
 (2603:10b6:303:198::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 02:39:32 +0000
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3]) by SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3%4]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 02:39:31 +0000
Message-ID: <25155bd6-4348-4aa8-ba70-0a882fc84db9@amd.com>
Date: Thu, 18 Jun 2026 12:39:21 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/20] dma-direct: use DMA_ATTR_CC_SHARED in alloc/free
 paths
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>,
 Mostafa Saleh <smostafa@google.com>, Petr Tesarik <ptesarik@suse.com>,
 Dan Williams <dan.j.williams@intel.com>, Xu Yilun
 <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
 Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>,
 "Cheloha, Scott" <Scott.Cheloha@amd.com>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-4-aneesh.kumar@kernel.org>
 <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
 <20260617154101.GE3577091@ziepe.ca>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <20260617154101.GE3577091@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY6PR01CA0124.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::17) To SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB999228:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: fb695296-4ac9-4986-f8f3-08decce2d366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 6bhn0HZ4tXBeCfOqPBuOQF/DR4sbwgmHha8T6qIL9+6gcSNM2zT7k0k59vAwon5cG1DwuZqBokpUgLOQ2XZsRW9EpgJaTfxfJgFQcCkj0CV1aGdn0aPEWFNPOiDgp/vBMAt+d9u8ENj9N8vmzcoXgg/ve0SW1KPIIo7x6HYu7MhaOOEziaO3Y/RG6dEXykKpceOcl5nR+AzdOPJlTIUPKSNyLAhq42Er10e7qPQKj2ZYd6uLVPA1EHEmj8Fts8YRBw1UfAZXiQMyd4YHSoJTSxLtuIOQJDSIGWS8Cwqu/MgBARnanx8jEs7ma084J+qy9qwPNkCUSSKOkfWiJ/SfpvP/ARIqGPZpxUTTr/Gp6oouHd6v5qegLrvrJYg1O+L1p+nWCNZ0D3R66DDHx9dOHxMAD4JXCYJjU2HQB375hzyD3npz8GCf92kZxrI+8cZBvAWtCuLrvvCculsaOjOG7t0F4rMbJZh32NvcuLRKnlSVQRXJBe5gjqRZmdcTf6Q4cQyCTBVdhv6L9ZS6L3fr6QKOfKEjpT1rmZz8O3e+UnsGa6zI192UIzK7E1nES0s/Wwx/tt4+yKgsQNsVlwf3Cy4kVJLYWbjwHmx/3AoNd5EDqjhK9OvLtuDIKGKpyYN5HbjgRdqYoEj6qKkLBq8Y2BBy2F5ZqYtvMcMLQFjNbpLCVeYc9QKLNISAxDb69YTb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB999228.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9FY1g2WGk3SHFETGlXUVJTeFVmK1BhcVRsMjh6dThwTk1aVjI4Mjkydk90?=
 =?utf-8?B?MW5RQ0RrK1luQ0RPeVRqMGNwYjdHV3dsWFp4VWVtMjdiUVNPRHFKMFgyZlZt?=
 =?utf-8?B?eDNVTE5JYnYzRnBJQTYrdXVCS1ZCQmRrb1dhSWdRamNTbGF0VUV2VS93SEhm?=
 =?utf-8?B?Tklib3AyRjdNZTJpQzhvazhLU3B4aVFCZUh4MllNK1FZc2tzKzVHNWtsUnBF?=
 =?utf-8?B?ZzBSTncveGpGMklFbnhVeFplOVVTNUNPU2lLUWMxVVpHRXZ4bWY5bTVqeTJu?=
 =?utf-8?B?SlFJNjN5Ym5XMlhmeW9oNEk4N1FwZzNFMDM4MTJlOVRuUk1hMGZac3liekN2?=
 =?utf-8?B?NGdjTlpiSmdwbVM0NjNGbWVqbUJzbHFCQzA4N2hFTlI4NGNPTWxOZElqSTNU?=
 =?utf-8?B?ZExhZkNmR2wrKzVWc0VDYUNrV0N0eGpaSFdUMHZ1UTdpdU9nZlJkZkpZbDA5?=
 =?utf-8?B?ZGFQTnB5QzlrTjBFUTFzZ1M2bTNQd1pUMTNEUlV1Nks3Tzd4MVlTOW1hYU1Q?=
 =?utf-8?B?emVORmtyLys5bHR2WlZmUjdWcVZWdkFXRXhYVXVpaEt3WWU4dUNLWUZyNVJM?=
 =?utf-8?B?SnpQQlBjSm0vMVBCU0E1MzdySG5UNjZiR0h0V1ZTb0JUcitCY1dvelJ0Ni9w?=
 =?utf-8?B?KzBKR2c1NFUySm1zR0czNTRHZzJSdUZlZFNvWVdpeXRpVXV4MFRUb08wVGY4?=
 =?utf-8?B?dGo4NVNiTFltRitMQnA2WDB2MUtOY3RjVlhXbWM1ZEtwbGxMNTdadFBleXpu?=
 =?utf-8?B?ZW81RjR0WHl4eEZIbHRleTdzYlUyd3NiaFVpZE5naXpZQU5SekR2Wk5uVFov?=
 =?utf-8?B?elBiRmFhQ3BFOGNFTHBpZjlFVXYzU1UvUy9jMTZhSzZtbHFBZEJEajZNZ0RJ?=
 =?utf-8?B?SzE3WlV6Wk9GaG5pajhuL3FQVnYzM2hud3FtSmtVTUhyZ21SYksyMG5nWkNq?=
 =?utf-8?B?RlNEelROZUloZmROa2Vxcm40YmtLSEh2YlRMNUVQL2I2REw5WkVtVFArbm9v?=
 =?utf-8?B?MmVuODJNaUp6WFhMSXJ0aTBDL3BDMndOVjRyTlhPT2pxdFo4eWhlUTB5ZFhJ?=
 =?utf-8?B?MmpNVzc3UFYzMGZxcCtKRi9HNllTWGF1bjMyK3lOY2EwY0o0Z3ZOR3Q4UjJX?=
 =?utf-8?B?RDhuM1N1N1VmRUN1ZEJnckJqYVRsWHZyck9ZOHhsZEd1UEJGdVZyb29ienV5?=
 =?utf-8?B?M2RjS0dhaXdqeUQ1KzBpR2VxSmFPdU41dUdQNkJQRDVIVk1IOXIxQjdkL1Rh?=
 =?utf-8?B?MlIrQnU2K0VRcTA0WmpNVGdZcTZwY05SMHAvcHg3RDdwemlvcjdCaXNUd2g0?=
 =?utf-8?B?UVZ5WGlFSU0yalJoUVlqMFpTSkpxZGluOEhaLzBtSFJ3NG4yck5rVDQwdi9s?=
 =?utf-8?B?VHh0K0pXUmN5b24rRU9XSGVmdmdUWFlkV3J1blpxYS9aTjd0bDdZR0J4dXM5?=
 =?utf-8?B?aWtsODFWeHBRUFE1NnZJemhMM3ZuL1BVNndyL2UwbVZzK1RJM0N5ZUswV1pU?=
 =?utf-8?B?c0dlQTlZVDZQV29Ocnk5VGZWaEg0V0NCSEo0UzF3SGd5TFgySDR4WHhNckdj?=
 =?utf-8?B?Z2QvZHhsS254cC9OeW9GL0ljdDJzVnRFNkhQLzJxYWk5bVhDMm9ZN1pTdG9z?=
 =?utf-8?B?dzl0MFhOQmxtd2tVOHhPOCtjcXVLZHlqb3lxL2laZGUwUEY1T052eDkrNzBt?=
 =?utf-8?B?V3RKUU5Kakh4Yy9JYmZDME9JUmRQcVJyb1RZYXMrYm1QcFM3cElqeEgwOXpE?=
 =?utf-8?B?SXhhbHZXcFQxMVNDUXJMYWhMbEtQbVNEd2ZRNTZvVEViRGQ4SW1sK2V6bkdy?=
 =?utf-8?B?bFM4YmFrZ1I0RjVaMGVwU2VwZW5YS0NISEhoSVVQd3NLdDhWYjBMaHR6VS9D?=
 =?utf-8?B?N2M1YTFtaTFDS2RyeEhqQ1Z3aEdVak9SQ2E5bisrQXlMMUZtS0ZLdExrTHY5?=
 =?utf-8?B?NFYycmVJcG53VmRiWnJGRFJLbWxBTlhnRVhnS3ZlNW1XZklsRGh6TTRrOTJo?=
 =?utf-8?B?bUQ4M2JxbFQzdTlSTmNDajdnNGRqL0I4QUdkRm8yUlA0L01ZWWVaQ2ZRakxa?=
 =?utf-8?B?WEV0azF4UFMvOENpMStEdXlNeXVRZFZCSFpmU2NQdVcrWDVWQXdoMER4M2JS?=
 =?utf-8?B?TVdPWEN3VXNCRkdBZExNM2NacFE1cThjTHJYTkVTalZ3ck12YXRJb3pOM0NW?=
 =?utf-8?B?U2ZLSitYUitSUG5Hczd1NjZtRU5YdWMxU3A2ZmFBUWlvUTVwOEhCZEYzbWhC?=
 =?utf-8?B?S3U5UEE2UVJuTDNtWGVYa3p4a2JrR1d6K3Y2MCsxdTJSR1ErSVpIWXBuRS9r?=
 =?utf-8?Q?aUDdEisr5/hOEtDAhz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb695296-4ac9-4986-f8f3-08decce2d366
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB999228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 02:39:31.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3FFOQkpgvwqpgBtKFfaxKfgTS7bGPTHGpWwzO7JWqMY92thEWIeMQ0f55pi5T0wqS5sHqE9ILQtW6dgXovqJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_193941_694381_AB4A561C 
X-CRM114-Status: GOOD (  17.98  )
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



On 18/6/26 01:41, Jason Gunthorpe wrote:
> On Wed, Jun 17, 2026 at 10:50:39AM +1000, Alexey Kardashevskiy wrote:
>>> @@ -193,16 +193,31 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>>>    		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>>>    {
>>>    	bool remap = false, set_uncached = false;
>>> -	bool mark_mem_decrypt = true;
>>> +	bool mark_mem_decrypt = false;
>>>    	struct page *page;
>>>    	void *ret;
>>> +	/*
>>> +	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
>>> +	 * attribute. The direct allocator uses it internally after it has
>>> +	 * decided that the backing pages must be shared/decrypted, so the
>>> +	 * rest of the allocation path can consistently select DMA addresses,
>>> +	 * choose compatible pools and restore encryption on free.
>>
>> Why this limit?
>>
>> Context: I am looking for a memory pool for a few shared pages (to
>> do some guest<->host communication), SWIOTLB seems like the right
>> fit but swiotlb_alloc() is not exported and
>> dma_direct_alloc(DMA_ATTR_CC_SHARED) is not allowed.  Thanks,
> 
> Then setup your struct device so that the DMA API knows the
> guest<->host channel requires unecrypted and it will work correctly.
> 
> I think this is a reasonable API to use for that, and I was just
> advocating that hyperv should be using it too.
> 
> But it all relies on a properly setup struct device.

Sounds good but how do I do that in practice? DMA_ATTR_CC_SHARED is not externally available so I'll have to trick the DMA layer into using SWIOTLB (which is still all shared, right?) as I specifically want to skip page conversions. Setting low DMA mask won't guarantee that the DMA layer won't allocate a page outside of SWIOTLB and convert it. Manually do

dev->dma_io_tlb_mem->force_bounce = true;
dev->dma_io_tlb_mem->for_allow = true;

?
Or follow the Aneesh'es genpool approach? Thanks,


> 
> Jason

-- 
Alexey


