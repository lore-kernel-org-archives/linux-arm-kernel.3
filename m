Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835DFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 23:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOJkdR880M2PvVuP1jx/N7v4IUkhUGtCavXAyOFBFiQ=; b=FB52R5YeDFK4D/JXYuofuxbgxw
	IS7UH6//GApXFf00pYWw4WjFhF/N3W5SgKCHMteZYHyW5/zV7Nrt/ljYvMQ6dZj2WDA3cwVEnWaz3
	UIWyyUNld6tO2OO//9RBv73Bw4bNuRlBLzYJ56RQrIs/fU6gC+fzbhV0gwRT2fGLfmR428Ze32b7Q
	Wfr4FUnxe8Mal9ZDMGJY23WedRX86KYoWEAFrtE4064FXF011CoLQJ68FMJGKJJFkJxfy8DoeXuTp
	ilRC9EWNkfMiSns094Sztv9wj6T1Xzj9IqkGrjPA31F5iBVeDfx1LTUBZsIyievLJekuUVZ5jDzxB
	N2cBP6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weL6b-0000000FZnm-39G6;
	Mon, 29 Jun 2026 23:09:33 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weL6Y-0000000FZmb-1fJJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 23:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t34sKxDELcSg0h5MYsmjX/MiijpIaCoNKFFw89820VqrYCqNOGbz1MkJkJOIRFaCHa0HUszoDtbBwTLIMJFjoBocCtQvELUcyVq7FGQ2v6bHnYthhIO/wH8kPdP9iRhm919ewxAqeuzhaO0hKr4i+6YGJx3DudgqBHkfjXsX7qTlkx25kd0aJo/QtgFimqvmsDb/0LWu9V1xEQXVierw3FHkdMeFEKX97TdzSU/1Bnwszgd1sYxFoNVNQqNNCiraIZZyU7FjSSW77xBDJWGNzS1YwtPgTK5KCKZwvaCdar2UMazLeojDvmZR0CVY7rxAqnbxjdb3KJVOsZLg1fOcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOJkdR880M2PvVuP1jx/N7v4IUkhUGtCavXAyOFBFiQ=;
 b=T4Qx0sBAuzzjchRv/oR/1bH6hlu14PJoh7rRZlr1AsYjx1ETTKevBlcHHsa4ncFSEF70IFoHQUFTIy1MIN2gf9vb4t52Et8tkTfTA1DfV2TbZnxxkao5WEia1INgXCBpqbvJTPdwUA50vk6B1LDOXTOcS+h8N3ZUsfO7gGIlmRwwtS+cSsonxoFSsdv1OPYtgkhumCVV1XAyFaE2jN8RS/SxaaRFwALTJ0VDzZvx8XtP934T2RhqFhxerVRuHt5HvGxPQrRRT/oKBI90A90VB5wAVY8mexNvq0PQTaxyf1ZccMCEsR7YOOtlHFT+cgkafwfHtDA1xAYNAYX5aa0rkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOJkdR880M2PvVuP1jx/N7v4IUkhUGtCavXAyOFBFiQ=;
 b=JkHwNrVW2h15GdbUQ/76qVkAnDbI0GTug5WOLYDyC/hxOuTqQIW6/yipe7Mq/aA/Ec5gV87sa6bC/561O39VTfNk86w9GSrKYoYBpWrRCZ+vPgoH5g7IC7MYEc18zpWMMW8ZxGTA/BChxaYRdYxYhRp9c9YvutGrrGs9dWqspMC9aulZBIe/sVuHXyGqmsAZWtxQXAviOkqfBZn9mpdtSDHyznYzqBMRTkQOAdl7vdgY238Hbl9NRJAAjkPvXbztZsXoglSK8oEMBilcqw062R6GmrwmloViU+f8x91Xgrtt7WDatHPBhIECs6bQ80JW+Pkg5QRm2dEEObkTYaWhjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 by DS0PR12MB9421.namprd12.prod.outlook.com (2603:10b6:8:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 23:09:23 +0000
Received: from IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c]) by IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 23:09:23 +0000
Message-ID: <d75592c9-5292-4704-b024-6450ea0e8278@nvidia.com>
Date: Mon, 29 Jun 2026 18:09:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: io: apply the device store-release
 workaround once per block write
To: Vladimir Murzin <vladimir.murzin@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
 Jason Sequeira <jsequeira@nvidia.com>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <20260625182425.3194066-3-sdonthineni@nvidia.com>
 <97b62a6f-a514-46bb-9ee8-81f563220f6a@arm.com>
Content-Language: en-US
From: Shanker Donthineni <sdonthineni@nvidia.com>
In-Reply-To: <97b62a6f-a514-46bb-9ee8-81f563220f6a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0151.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::6) To IA1PR12MB6089.namprd12.prod.outlook.com
 (2603:10b6:208:3ef::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6089:EE_|DS0PR12MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: c210ad20-e1ff-40e9-ce5d-08ded633752c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|11063799006|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: LRtsXxwsihvZL87TgX/000O/TL05vzhSSjXVkUxxb3t/eTsJplBv2jHH5MRSfDq3aVjR+BYXV19Q0HJWWS0o5r7VUx65uCmiz/NVFPqFLiRN8AiUfAuABNhojEl7ZKgQhN3GSImpv58Zw29zpHWwHg4wQONM0QeFaH+Pbt3yjMcyBUFzaQWsMRzKV0Dxx8T8jywiZhO1adr583uhRF0sSWwf1rQG15j+qPUXN5Vx6RESVJ+1G89KTR09bMSMPgqPABsAML4mb6tqx70S1cc5A5v/zeAZJ4cPDo7K2ncP1NB1w4QcDDkmuivt+P/xMEZCmR0+/uAEO2E0DcafL9j3SC//tbmoxVAEdrGc8X+4GjEC4uGmvv4XwHuF6/mGdqMndZVuCKikJaP9mJqq1MqybnCFwjEfIp4RZgIHFEKy8IobHoUyssjLp6ebrE+eL+66hcp36Ff4wiwBYpG6+b04DtoNi06C4N7CEJE0/BkzA3PIgLGZM2FFT6h+RCFnOQc3ImpbNnDM8bRFSJ5V958ePuHvtKvvXlnV/RC1D0e2JIOWLrp+EV+ld8r3K64FE7ANjZHyR42PciuM5xvbFNGfmiCKMKhO/faDrBz6s0mFIN5HzeVWYwvnSx1kaAkFrbdK4p0QBNdSf6Nnr27ExBexkyEdzFEmZ2m8IkKCuvFxr9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjZjZmVrc3Q3Y093T0d3NXdLMTZkcjZrMkQ1Yk1JbnQ2MTU4N1VKN1NMS2l2?=
 =?utf-8?B?dmUxK2RqRm05UDFvb3FHYmxzZDZBVVJYSmdiNkxDcjM3UTA4Y01qY2tDcXRo?=
 =?utf-8?B?Z3JxWDMxVit1MnMycDBYVUEwcHNlN0FUaitKVXdiNm1ZQkM2SzFhMC85dWtn?=
 =?utf-8?B?UWlqc0FMeTk2bjZyRllVL0I4d3F0Ty9STlR4MXF0MFZzMUpYN0xNR2FLeUtp?=
 =?utf-8?B?Yjg3Q1hkSjlvcUtzNFNuMmtualJQaXpNdjlWSzRDYmxrWVh4b2pjejl2R21v?=
 =?utf-8?B?bkt3cWlrTk9XeUp5eWZrMGE5SllBZVFyTVdJV3ppU3JXTHVEdTNUNk9vSXdt?=
 =?utf-8?B?c0hTclpUSFk4TjBlYXM1b1FGNEMyVWM2YUpoZ2lFRFN1cXZBVUNRdnllakNG?=
 =?utf-8?B?Z1pZR3JnRGx6WUZCMUQ5TGludWFNZ0lYazY5N1JEcVNnTzljNTdEUzlDcElz?=
 =?utf-8?B?NHBOV0NDRGUwQlpWeGQwa08wUmlhTlMyck95MmZ0NWRhTE5ES3pOcFRlR0JI?=
 =?utf-8?B?TVp5OFVBemZYa0NKT3RvVEszdFZnQTFpRUJ6UXk1c0xtUWZ3OW5aaE92RnZp?=
 =?utf-8?B?ZlZXVDdZbGV5RTdhL3JCaURzQ21sQ3cyam43cDBjWTl3NmxxQnl2eHFkMldJ?=
 =?utf-8?B?S3V2am5aRmdNSWhlMXhJb0VrM1BCRURwclkvOGxWNkphSEZ6NkpLZTlvaFJi?=
 =?utf-8?B?NldCWUh5cDc5MzFScTV6d3NuamVwbXlKY3hIU2lYaW5rNjVkcGR2c3N5bnpv?=
 =?utf-8?B?SHdsdEFaRFk4alVKWlVUS3BLU1UrZE5DYTRRaDJIVVcrU0VzTFVmRS9UMTFj?=
 =?utf-8?B?WkIxbVowQmdyUUo2dnloOW5aYWtIVVZMbWYvbjBwanp5b2M5ZGd2VGRFQnlO?=
 =?utf-8?B?REU2YlQwTS96cVZRUjNFU1htaThCbkpoTXJvMTl3VzZiTVkvcHpEUXF4REpy?=
 =?utf-8?B?SFVkMG1rWm1jc1ZWMk9UeHlRRU4zQ2RWRFdFSnhwOXNsV3BGWnlCblhod1Zt?=
 =?utf-8?B?R2xXakExWXVwQWUvaVlUZVNtQzkxME9KK1B3T3U3OXp3QVA0TDI3dHFjMk00?=
 =?utf-8?B?QjdRaUh5MlBSczNPUGFPMi83NFh4eW0wcGxJS0lxbFppam10VFhGVytzK1Yx?=
 =?utf-8?B?di81MVAzS056NUt1THpPb0tCbmxmaGFDY2d5MUVla1pKTGlhaTQ1Vmp3bjE3?=
 =?utf-8?B?YWxsUTB2b3JWNXJHZnA2SEVaNWNBNE5uM1RwdFdMc2lrd1ZHVTZqSlR2NGRI?=
 =?utf-8?B?MjE5ekNXNGdLcngxQ0w4bnBHVDNHdEVCUGdpUHFjMTFlcXpxaWtRS1krcFVa?=
 =?utf-8?B?S2xWWHBIakgyZkRZaU5sNzV3N3JoR2VjTTVtNHpVcnNITDNoTW43Y0tiSktv?=
 =?utf-8?B?Vm5NYzIrcElIWENLQ2daT2FQZ3dmYUEvVDJRNXhhVi91dGo5dnB5Z203Yi9a?=
 =?utf-8?B?MWRzMmZLazJNVm9FZzFOZU5SV2FHT2gzU1ZZTW9iMFF5MEphQW4xcXV3emRD?=
 =?utf-8?B?VHB2cGI1MTRTWUpNZmRyY3ZnQWszbUtsVCtZbjZaL3NheHdJd0poSEd3bkZY?=
 =?utf-8?B?VkV0cjFrVlVYb0lRbnczZXdtNTd0cGp0OVFtdE9IMDNyLzM4VWlTNmg5RHdP?=
 =?utf-8?B?TW4zYUNLWDJZT2swRHd0WEMyb1dBNW9HbFNOMXh1ODZIUGdnUXJPdGdhZFVQ?=
 =?utf-8?B?d0NWdmpYbHlJdnYrS3RJK2dsVlVlQ0ZMOU90MSsrZWUyTEhiaHNScEJ1UVMz?=
 =?utf-8?B?QU83dkhqYnJvSkwrWTR4SzQ1ZVMrNUdRZllPdXpoVEhDTVhLWXhLcWN6SjZx?=
 =?utf-8?B?RGJHdThqUDFhSHRqZnE0dTQ1L0J6NWk4Y2c3UzdOQmoybVJaNERWZ2lYK0tZ?=
 =?utf-8?B?VGR0MmNqamtRbTA5RUwyZ0JjTXN1NkZEY2JEMWlxNnBKSjIvOEpMMzF3UExO?=
 =?utf-8?B?U01iYTA1VmZ1eFFVWENLZFJ4MzlBN3dEZXZCNmZEc3BEdmpaM3h0MjYzcUU3?=
 =?utf-8?B?b1FWZ1ZBM1hOSXFBY25URGVrb2dVTU9yS1Vrc2xVa1FXT3JHcjBRb0Zxb1Vr?=
 =?utf-8?B?NFJRWGMvaGxMS24xcEJqVEoxVEpQYlpIc2x0L1E1Y2dlWFR5UW15MytsdDIx?=
 =?utf-8?B?cVlHMnUrQmNhK1R1WXMzUXprZXNkSXdRN1VFVlZ2MWtjNi84SHZrakEzaWVD?=
 =?utf-8?B?ZHBVamV4aWNreG5KNml3eXdrS2h5dDJCdmt3cTZWYi9vWStNa1pva0lBckJM?=
 =?utf-8?B?d0tWaUZacWl2VHVNeXBMQkFEVTZFNXhDUnBQQUNITHBuVEhRRXcybFFtMTNR?=
 =?utf-8?B?VU1nblVOMnNqZnhiaFNGYUZPMlA0UzVwenVTYndKVFZ4ZDBDYU1EUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c210ad20-e1ff-40e9-ce5d-08ded633752c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 23:09:23.1908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FwpmJ1vBPM2sWz35umBtbTrHZLiqzAHtKkmSGwFpdzt0OxPeHOVxgr5U/N9JQ3jYyGE209TJqDzEB6mL+SE/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_160930_469643_650C3347 
X-CRM114-Status: GOOD (  18.69  )
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

On 6/29/2026 5:48 AM, Vladimir Murzin wrote:

> External email: Use caution opening links or attachments
>
>
> Hi,
>
> On 6/25/26 19:24, Shanker Donthineni wrote:
>> The generic memset_io()/memcpy_toio() are built on __raw_write*(), so on
>> parts with the NVIDIA Olympus device store/load ordering erratum the
>> ARM64_WORKAROUND_DEVICE_STORE_RELEASE workaround promotes every store in
>> the block to a store-release. Each stlr* carries a barrier cost, so block
>> MMIO becomes O(n) store-releases, making a block copy many times slower
>> than a single ordered burst and growing with the transfer size.
>>
>> Provide arm64 memset_io()/memcpy_toio() that emit plain str* in the loop
>> and order the whole block against subsequent loads with a single
>> trailing dmb osh on affected CPUs (a no-op elsewhere, preserving the
>> relaxed contract of these helpers). This keeps block MMIO writes at
>> one-barrier cost rather than scaling with the transfer size.
>>
>> Performance (NVIDIA Olympus, write-combining MMIO to a device BAR, single
>> PE pinned; per-call cost in ns; consecutive writes ping-pong between two
>> buffers so repeated stores are not coalesced; iowrite64/iowrite32 =
>> __iowrite{64,32}_copy()):
>>
>> Table 1 - arm64 memset_io/memcpy_toio (this patch)
>> +-------+-----------+-----------+-----------+-------------+
>> |  size | iowrite64 | iowrite32 | memset_io | memcpy_toio |
>> +-------+-----------+-----------+-----------+-------------+
>> |    8B |  231.6 ns |  231.6 ns |  232.4 ns |  232.4 ns   |
>> |   16B |  231.7 ns |  231.9 ns |  232.7 ns |  232.6 ns   |
>> |   32B |  231.9 ns |  232.7 ns |  232.9 ns |  232.9 ns   |
>> |   64B |  232.7 ns |  235.0 ns |  233.7 ns |  233.6 ns   |
>> |  128B |  233.6 ns |  235.8 ns |  234.4 ns |  234.3 ns   |
>> |  256B |  237.7 ns |  276.8 ns |  264.0 ns |  276.7 ns   |
>> |  512B |  237.7 ns |  277.1 ns |  238.1 ns |  277.6 ns   |
>> |   1KB |  253.7 ns |  279.3 ns |  276.1 ns |  294.1 ns   |
>> |   2KB |  295.0 ns |  318.7 ns |  288.5 ns |  308.3 ns   |
>> |   4KB |  365.9 ns |  381.4 ns |  365.7 ns |  381.3 ns   |
>> +-------+-----------+-----------+-----------+-------------+
>> all four helpers end with a single trailing barrier (dmb osh).
>>
>> Table 2 - generic per-store memset_io/memcpy_toio
>> +-------+-----------+-----------+-------------+--------------+
>> |  size | iowrite64 | iowrite32 |   memset_io |  memcpy_toio |
>> +-------+-----------+-----------+-------------+--------------+
>> |    8B |  231.6 ns |  231.6 ns |    229.0 ns |    229.0 ns  |
>> |   16B |  231.7 ns |  231.9 ns |    458.4 ns |    458.5 ns  |
>> |   32B |  231.9 ns |  232.7 ns |    917.4 ns |    917.5 ns  |
>> |   64B |  232.7 ns |  234.8 ns |   1835.4 ns |   1835.5 ns  |
>> |  128B |  233.6 ns |  235.8 ns |   3670.9 ns |   3670.8 ns  |
>> |  256B |  237.7 ns |  276.7 ns |   7341.6 ns |   7341.6 ns  |
>> |  512B |  237.7 ns |  279.4 ns |  14001.4 ns |  14001.3 ns  |
>> |   1KB |  253.7 ns |  279.1 ns |  28631.5 ns |  28631.8 ns  |
>> |   2KB |  279.4 ns |  317.9 ns |  57276.3 ns |  57275.2 ns  |
>> |   4KB |  365.7 ns |  381.5 ns | 114564.4 ns | 114563.6 ns  |
>> +-------+-----------+-----------+-------------+--------------+
>> the generic memset_io()/memcpy_toio() build on __raw_write*(), which the
>> workaround promotes to store-release, so every store is individually
>> ordered - hence O(n) in the store count.
>>
>> The arm64 versions stay flat at one-barrier cost while the generic
>> per-store writers collapse to O(n): at 4KB ~314x slower (~115 us vs
>> ~366 ns).
>>
>> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
>> ---
>>   arch/arm64/include/asm/io.h |  5 +++
>>   arch/arm64/kernel/io.c      | 82 +++++++++++++++++++++++++++++++++++++
>>   2 files changed, 87 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
>> index 69e0fa004d31..649503f347bc 100644
>> --- a/arch/arm64/include/asm/io.h
>> +++ b/arch/arm64/include/asm/io.h
>> @@ -266,6 +266,11 @@ __iowrite64_copy(void __iomem *to, const void *from, size_t count)
>>   }
>>   #define __iowrite64_copy __iowrite64_copy
>>
>> +void memset_io(volatile void __iomem *dst, int c, size_t count);
>> +#define memset_io memset_io
>> +void memcpy_toio(volatile void __iomem *dst, const void *src, size_t count);
>> +#define memcpy_toio memcpy_toio
>> +
>>   /*
>>    * I/O memory mapping functions.
>>    */
>> diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
>> index fe86ada23c7d..b5fd9ee6d9eb 100644
>> --- a/arch/arm64/kernel/io.c
>> +++ b/arch/arm64/kernel/io.c
>> @@ -5,9 +5,91 @@
>>    * Copyright (C) 2012 ARM Ltd.
>>    */
>>
>> +#include <linux/align.h>
>>   #include <linux/export.h>
>>   #include <linux/types.h>
>>   #include <linux/io.h>
>> +#include <linux/unaligned.h>
>> +
>> +#include <asm/alternative.h>
>> +
>> +/*
>> + * ARM64_WORKAROUND_DEVICE_STORE_RELEASE promotes every raw MMIO store
>> + * (__raw_write*()) to a store-release on affected CPUs. The generic
>> + * memset_io()/memcpy_toio() are built on those helpers, so the workaround would
>> + * emit one store-release per element and turn a block write into O(n) ordered
>> + * stores - far more costly than the single barrier a block actually needs.
>> + *
>> + * Provide arm64 versions that emit plain STR in the loop and order the whole
>> + * block against subsequent loads with one trailing DMB OSH, patched in only on
>> + * affected CPUs (a no-op elsewhere, so the relaxed contract of these helpers is
>> + * preserved).
>> + *
>> + * This capability is currently enabled only for the NVIDIA Olympus device
>> + * store/load ordering erratum, where a Device-nGnR* load may be observed before
>> + * an older, non-overlapping Device-nGnR* store to the same peripheral.
>> + */
>> +static __always_inline void iomem_block_store_barrier(void)
>> +{
>> +     asm volatile(ALTERNATIVE("nop", "dmb osh",
>> +                              ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
>> +                  : : : "memory");
>> +}
>> +
>> +void memset_io(volatile void __iomem *dst, int c, size_t count)
>> +{
>> +     u64 qc = (u8)c;
>> +
>> +     qc *= ~0ULL / 0xff;
>> +
>> +     while (count && !IS_ALIGNED((__force unsigned long)dst, sizeof(u64))) {
>> +             asm volatile("strb %w0, [%1]" : : "rZ"((u8)c), "r"(dst) : "memory");
>> +             dst++;
>> +             count--;
>> +     }
>> +     while (count >= sizeof(u64)) {
>> +             asm volatile("str %x0, [%1]" : : "rZ"(qc), "r"(dst) : "memory");
>> +             dst += sizeof(u64);
>> +             count -= sizeof(u64);
>> +     }
>> +     while (count) {
>> +             asm volatile("strb %w0, [%1]" : : "rZ"((u8)c), "r"(dst) : "memory");
>> +             dst++;
>> +             count--;
>> +     }
>> +
>> +     iomem_block_store_barrier();
>> +}
>> +EXPORT_SYMBOL(memset_io);
>> +
>> +void memcpy_toio(volatile void __iomem *dst, const void *src, size_t count)
>> +{
>> +     while (count && !IS_ALIGNED((__force unsigned long)dst, sizeof(u64))) {
>> +             asm volatile("strb %w0, [%1]"
>> +                          : : "rZ"(*(const u8 *)src), "r"(dst) : "memory");
>> +             src++;
>> +             dst++;
>> +             count--;
>> +     }
>> +     while (count >= sizeof(u64)) {
>> +             asm volatile("str %x0, [%1]"
>> +                          : : "rZ"(get_unaligned((const u64 *)src)), "r"(dst)
> Why do we need get_unaligned() here? I understand this came from
> the generic implementation, where it needs to handle architectures
> that do not support unaligned accesses. But IIUC this is not an
> issue for arm64, and there was no special handling in memcpy_toio()
> before 0110feaaf6d0 ("arm64: Use new fallback IO memcpy/memset").
> Am I missing something?

Thanks for the review.

I used get_unaligned() because I was trying to keep the arm64 implementation
as close as possible to the generic memcpy_toio() implementation in
lib/iomem_copy.c. However, you are right that before commit 0110feaaf6d0
(“arm64: Use new fallback IO memcpy/memset”), the arm64 implementation
used a direct u64 load and did not explicitly handle source alignment. I
can restore the previous arm64 form in v5 if that is preferred.

>> +                          : "memory");
>> +             src += sizeof(u64);
>> +             dst += sizeof(u64);
>> +             count -= sizeof(u64);
>> +     }
>> +     while (count) {
>> +             asm volatile("strb %w0, [%1]"
>> +                          : : "rZ"(*(const u8 *)src), "r"(dst) : "memory");
>> +             src++;
>> +             dst++;
>> +             count--;
>> +     }
>> +
>> +     iomem_block_store_barrier();
> It is perhaps a matter of taste, but having the inline assembly
> here (and in memset_io()) might make the code clearer. To a
> casual reader, it would be obvious that the barrier is not
> guaranteed and is only applicable to ARM64_WORKAROUND_DEVICE_STORE_RELEASE,
> without having to jump back and forth through the code.
>
> Obliviously maintainers might have different preference ;)

Regarding the barrier, iomem_block_store_barrier() is declared
static __always_inline, so it does not add a function call. The nop/dmb
osh alternative is emitted directly in each caller. I used the helper to
avoid duplicating the alternative sequence.

I understand that placing the assembly directly in both functions could
make its conditional nature more obvious. I do not have a strong preference
and am happy to follow Will’s and Catalin’s preference here.

-Shanker



