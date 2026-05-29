Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407CECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mclxCYWBsNP+CeHyjyBcSEw+srYJoeI/J5oSr2XOq3M=; b=kbDpAULLZykKAC4JVkL14+Gstw
	fmmKmg/rOwKft7Wfv8ymcifvMaJlVX8Ze921y+LPjoEGVfG6k+bCptXwDe1T7UN0YdxDdP4PruNvU
	Ok46p4Px/tBX4y10uxLLmYTLjTonRgwRWNp1/jLbjFd2w4txi6/mVv7iW6PpqOdspkGibRXLME5gh
	v3QRHQBS6B4UagPevWzJut+wf00/tvCX9P0DtOGkEJUs4omFJ0QlsGvuDpdLZbpXtUDjHLBUn/ax5
	39YfN+nUdIXH0kl5eVd/6S8UPg0vpWxxGDHR6zbn5JpOe80gdeRCY5FDVYf9Btk11rwQ1mcIM3/Nl
	j3q78fKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqRJ-00000006nFN-06Py;
	Fri, 29 May 2026 06:11:25 +0000
Received: from mail-westus3azon11010034.outbound.protection.outlook.com ([52.101.201.34] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqRG-00000006nEy-2aW0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:11:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLa9g9bpZBLSoBOmQLWE6eTsQNx1u/JolPaZmkHqoyeUkjMBVjkD0o3lmNOIkONqemLy74XtCQOrcCbeRB7y2N5n0Z+ykDR76iihBx3YKybC6MJWXrpXw6+pGCtE7dc5M3g9m7PyJAyIaO381kJKXgDTOGI5Q0HoUFsjqZ56DpG+qtWysdkvvgtzVniBJouyZooLJl1ECkFixi9x6ydX2P9Qg1ATkSRBcPN63wfm+nI+BxJXh2F/ISVBcauvOv3ApEmQPYhDGrX6ujnetO08SmpxYOoGavDRPYUbLyhPSSRN5rSmxiO2E1wksPwkxdWp4lcniFpA8hXzDNhyNien9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mclxCYWBsNP+CeHyjyBcSEw+srYJoeI/J5oSr2XOq3M=;
 b=g5QgptpHBPo4jQ9asi9KTXoNqE3B+mYOBbrXyjjSOrrlnCLhfSgGvjY+GW1qoFkzT5IxbRI/mXdhrRdd9zHc7EOfscQujDphBZrV+ovFdTB3zgo8+184qLSzS7uDDCk2NDY1++Bf0jJwZMuObOFcA3fX1OxPt5gjVPV8fl5G5jNGiEUD3ZNqJLPXDeCMfueq+tibUhFrMLMvyL5jUYR/sJQ6zBhuDRp5Lvr3ZqO0UxerVTM6jeuQDnzLmsVqQKngKq0WqS4uMzABUX7FkIoHvR5kpckhUnnfhVW2XHq7fkKtkA1BUNuqgpKQAXoI1oFDmEmSAwn19tkyChePgMAGtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mclxCYWBsNP+CeHyjyBcSEw+srYJoeI/J5oSr2XOq3M=;
 b=j5DQQ8fgn3Np1n+foCTqtlvMfp1sCmI/ePcHOhYC1xl/Tk7KQgilkeMjCrIaiMlLaYIq1xqY27YHYTELN7Oy7CNEiV8jTXhlUcDVFUO/VW69XIa2adXXFqx65RkCUPkL1Vpz0t37Y6jkgU+LuBkz3mh+gHIMdNfp9Ka9p4TZ2/aLL8q9sbwe6hveICrJJ3TR/ADN0f9bYs8siBle8ODD1qFCPabmb+jVjiNmkBIncNWNxcz6zHKbnY1sytb+eNoxZ8Pde+JJX7pFbmVOe42wLjtY4fOikj27QeX9gdGz8HfGSs7ioDQWVB72fv4KaSGx3iVMYJx01oR3rWPBEPn/+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 06:11:16 +0000
Received: from BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c]) by BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 06:11:15 +0000
Message-ID: <38683872-c41a-4706-954a-5d99e82d0742@nvidia.com>
Date: Fri, 29 May 2026 11:41:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu/arm-smmu-v3: Detect Tegra264 erratum
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, will@kernel.org, joro@8bytes.org,
 jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260528101617.4068249-1-amhetre@nvidia.com>
 <20260528101617.4068249-2-amhetre@nvidia.com>
 <f25b769a-d89f-46c6-a3d2-9fa35882b848@arm.com>
 <c9390279-24d9-46d4-a644-797395c2eb2c@nvidia.com>
 <ahiLoHUzuHHSw51d@Asurada-Nvidia>
Content-Language: en-US
From: Ashish Mhetre <amhetre@nvidia.com>
In-Reply-To: <ahiLoHUzuHHSw51d@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:217::8) To BN5PR12MB9511.namprd12.prod.outlook.com
 (2603:10b6:408:2a9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PR12MB9511:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: c5dc12c4-0cd8-49f9-bd01-08debd491759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: M+HWfVqandgYzQUWyHcZBKCqCcxXfK7hyzklrRbIncfcmOjRStwNi+8jMH7L6XkG+y+xL5bKvsn5L+xU39s/jEdt+jzXJP+XewFT4D1eWh1FQk1Toqsh49ayaJARJF+696MuSvczCBx30cpAlrIWJQ8jr+lSjC/pfMMVrr4jlqr7JanwAE/3MIlXfPDrriLTkO9TtPLKqy3/2jsvQqOa52t0sMD2OeT2HrpvM5gCkFSZQzcXEE2wClQarqes5YakHtNc5OL/uHqaBNnCftFT7UK1pbdmdopCLPKI6qRUEd9WEh02hjhpJh7axOUXmoRYBzh62f8r3s9vbNSUarTldjVKhhzXs9ZBCCjlMMp4oAoo9ISix0aag2hZ1YVzzgAwtVuUUx48/l8xpJXLClad4W0arKfJyhOgu+09XD7yWLcsb7VqwP131KTuuGF97uBC2o6Vqbuzt3Xxz4lLDLukJv1Syiufgb2u9jJKtZNa5mag8hNauK/GiNFRuLtQhlF591zYAvBz1NXCvcyrhr84+iYTdtsYYP/w4sd+jn9xC8ukPDVobjyV31xjmlO23O1/Dk+GLs6K/rb//iFIbSpqz38/avyt7Nd51AcnzGFpLfJaMRXUxzq4jXOmv6y1Wt8BdfWoCXsIqJRECLWBoOY+So6qkYcPznb+TXLFqlzB9xrw1ytGyjsT6mGHJdB4CjufJ4ZUN6Xrd6RCxEvbmZtXDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN5PR12MB9511.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2R4RDRTVit2QU9LRElDYmx1emxXT3lEZDlJOEhxSkxLYTFraXlpa3BVSS90?=
 =?utf-8?B?VWFiQmRxTkhRejUwNTltTTN4dmlvTFkyem5PdmFvb3RCOExYeWtqcHJkK2hn?=
 =?utf-8?B?ZVZIYVgzbnRubzhINkhTMVdrbzVlcDZzWnVzaTR1enU0WWFjOWYyeUx3OVZa?=
 =?utf-8?B?NUp5ejhVSE1nTGwxQTNNYW5HelVrZTVCVFJSMGVic3Y4VVk1dXFDN0RORGNk?=
 =?utf-8?B?M0d3aVVLM1dRRCtybHNyajNXbzlMMThvUTBMdG1JZEhyc29FTE1nYzl5cWcz?=
 =?utf-8?B?ckFQVnNZd0ZwYVdpTHJqTVpBT2QyR2JVdHcrNk9KbmpyVVJJT2ZjM3JwaDV5?=
 =?utf-8?B?SFdVL09nSHVSdEM1Z1IycTJxbzVSMU80d3U5WWs5SlAyVTBlb0lLZWwxT2Nv?=
 =?utf-8?B?QnJsbkxrc3NsdWFTZ2F3UnV5RkR0Z25ibVEyMGI2SEhaTDhSS01zR3JRUEhs?=
 =?utf-8?B?TC9qNjRsRGY5eGRMUHpKemZic3ZIcmxMOU43eVdkdUNIbmZpMDB2dW50NHlL?=
 =?utf-8?B?QWI3cHF0WUlBeXdWeEdLZTM5ck1VaFk3TEJPTm0zUmZLZGFpK3lnQzdLV3lB?=
 =?utf-8?B?dHZNU0FaZm9FNnNGNTczSXFNdkJOS1dSUWtKVUV2NXQ3MUpiRVBBdHBvOEtF?=
 =?utf-8?B?Tm56Z256MlA5NXFGcStUczBtRVBjWWJSNXdkdWE1WkhFSVB3T1FISXZUSkJT?=
 =?utf-8?B?UU5aRmt6aTVNTEU2YkR1OXRNZ09mZlkxNGl6WmRBb3BSZmhha1JCZ0s4MzR1?=
 =?utf-8?B?U20rMzFTK3NLWGJkZVJwMExZbmFVU3UzSk1vU3ZzeG1NcXRJejdrY1BLcWRp?=
 =?utf-8?B?R1o1V1dPZ2VEVjZoeHR0UjEzTHZ4SUZQdm1qQlJZeEZaOVNQMktjNnhwYWI4?=
 =?utf-8?B?R2N2R3F1aDBlSzFpdGNWMEJQcXpiZDRSYXhjenE4UjVwQ3E3ZWlsWWhoaUgw?=
 =?utf-8?B?NE0rZzdyWU95QWI2Q0phaS9xdGJBVHE3d2FJNWRhNzZyRnVaSGt2RnhKZ2lB?=
 =?utf-8?B?T2E0bStZWEljaGZkYXQ0ekMxZjROdjVVWmJva1AvUUU3OTBIY2dISE1lLzUy?=
 =?utf-8?B?aEk3OUNLbnJXTkMzTU5mYXFiVmwvVUxXZnd5RUJEMWdaQnQ5bTJ6S1R5VjMz?=
 =?utf-8?B?WWVIK0w1c1JOVHNuS3JvSGx6YVJ0ZDVraFlBTks3d0pvR1NhK2NMRzJSNTYv?=
 =?utf-8?B?SkJpcUIvTGVQQjNtU0c0N0dLbkxKaGFMMDFGVkV6TGtyckFBMHQwYkpTZXE3?=
 =?utf-8?B?U0sxOWVpTTFqTXR1S0FGS3VWRWg3TG1zQzhmTXRVVEpWS3V5VDVLd0lrQjhh?=
 =?utf-8?B?Q3FsQmpaNmg1ME1ia1FhMlNOUlRzNFFlRkhERSsrWmdyQytqWW93SkFWZ3VD?=
 =?utf-8?B?ei9kRVllejVtNmZiM1lRV3piYkJQdE5OVW9wdC9JalpwK2VUUHVnRzVlMVQ0?=
 =?utf-8?B?NWJJZU9wVExzQ082MWYyM2cxUE50L2ovZ0d3TTVjSFNVVk5QeEl1dTJydUw1?=
 =?utf-8?B?a0FaOWhBb0NxaVpwcEtxR2JGeHd1WVlkOE5YbDNKdW1GRkpOZVlnb0FjeWEv?=
 =?utf-8?B?bDNYaEQxc2dDUks2RUZBRjR5SVNDZFhUbDJoZ0Q5ZnFkejhzQ1BYMU5LQzZj?=
 =?utf-8?B?MzN1TExyek5oS2ZGczNPUTVCWGRLa0xVOW44Y3FDNWFXMTlnYmR5VG9XeWwx?=
 =?utf-8?B?ckU4WEd4RlNqSW9oY3BQU2xubXBzU2QwQlRyR2tDNUdINGh3bDJ2QmdGQnc2?=
 =?utf-8?B?WWZXTEVPSUMwSjFMRFJsZS9qc3c3WGk2T1lHblh4TWx2RFlqajdoaHd6UUdj?=
 =?utf-8?B?cExTQ2pPRVhXc3R6bGNRVGIvS291aDNFbWlvK096OTROUDV2ZXc5MlFlMFhi?=
 =?utf-8?B?ZlRoSmROck9MTmlob21mNVh2YUt6N0tHelo5T1BlT05jR2k5Q1g0Q3FlUkpp?=
 =?utf-8?B?YTZjVGJZcUpsUWtMZmlaNkVrZTd6Z3NDQnRrbVBOYlJIUUE4dXVUNE9MelJw?=
 =?utf-8?B?Qmg2WGg3eUhtcDVyKzlRekc5Mkxza05WS3BsTG9OSFF0QW1HOXFPeFQycVNX?=
 =?utf-8?B?SU9Bam03WHB4V0RvazF4SGJlaDlWNFgwVkUzMElaQysrT3U0N09rUDIwY0p5?=
 =?utf-8?B?N0xicEliTjZpbVJIaEFGdkhhWXNFL1NpSmN3VlUxcnlyM045dFErM2drNzlL?=
 =?utf-8?B?RDg1R1lhRnhOckJsMXFuaUdoWjA4ZlJUc3hKM2E0dmhzU1h1dVBwTHBOelhH?=
 =?utf-8?B?RmF3UjBJSklQWFpTSjk1c3hHd281Sm9RR1QxenNNR1JYdnJ6MUxEU2M0RWhu?=
 =?utf-8?B?OXRGczlHcHhIejZucHdBYnVyS3VnMjZWdFN2em9BZTlhZWNJZHhQZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dc12c4-0cd8-49f9-bd01-08debd491759
X-MS-Exchange-CrossTenant-AuthSource: BN5PR12MB9511.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 06:11:15.6679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IZGpPH4SF4MqG3Kl3k4pFOgb92UTuWLGYcpK/lwW9L2Pw7mSFVFCKV5e8SV7YFqGvBxff4qpH0ap7vdAIQghQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_231122_687523_783F6CC5 
X-CRM114-Status: GOOD (  13.12  )
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



On 5/29/2026 12:08 AM, Nicolin Chen wrote:
> On Thu, May 28, 2026 at 09:36:34PM +0530, Ashish Mhetre wrote:
>> On 5/28/2026 4:04 PM, Robin Murphy wrote:
>>> On 2026-05-28 11:16 am, Ashish Mhetre wrote:
>>>> Tegra264 SMMU is affected by erratum where a TLB entry can survive an
>>>> invalidation that races with concurrent traffic targeting the same
>>>> entry. The hardware-recommended software workaround is to issue every
>>>> CFGI/TLBI command (each followed by CMD_SYNC) twice. The second issue is
>>>> guaranteed to evict the entry. ATC_INV is not affected and must not be
>>>> doubled.
>>>>
>>>> Add the ARM_SMMU_OPT_TLBI_TWICE option and set it on instances matching
>>>> the existing "nvidia,tegra264-smmu" compatible. No callers consume the
>>>> option yet, next patch wires the workaround into the CMDQ issue paths.
>>> Can you not detect this implementation from IIDR like for our other
>>> workarounds? Otherwise what about ACPI?
>> Neither IDR nor IIDR flags this Tegra264-specific bug. We cannot
>> detect it from any HW register, so we have to rely on the Tegra264
>> device tree.
>> Regarding ACPI, the bug is in Tegra264 only, and Tegra264 is
>> device-tree-only. It doesn't support ACPI/IORT as of now.
> Let's add a note in the commit message.
>
> Nicolin

Sure, will do and resend.

Thanks,
Ashish Mhetre

