Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D77EC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTAuTtGwawgYUWRMW6b5e5TNoCDw/n7whvhIjfGbY0A=; b=MhgLdl+PTvy5AmPYJvK278iYqY
	5TAPLxqPQESaGXTK6GkordKPqndL1Nhljwc2LENekTGrUSZAOLU7PONzkyOaVis/zrWahCnj8EtpP
	UeenejjX82x7YOdd1lVOuC5ijjn2Cc+TLyZIvRNqLD5nafnc2306p0QbHSLMVB7EjmzNNGNaAYU1l
	rMy4KtU9AllBcZaAdlsT/GUR5d/Vs9KtvsdlSuytMuvAJNX40UP8XzKuu9D4FcuHg1ol1h5bSvevZ
	KEP1HjLvExCuXF/16Sxyu053385IK5AJ8KKsW7nHh+aFmymjXi1lHd6j4OGBlzBJyfTk92Thjtjr6
	yvF+/nLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRM7-00000003mhd-0vlk;
	Mon, 27 Jul 2026 19:51:19 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRM5-00000003mh3-06y1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xfk9ikrXFImE9tmCF/YPYBOgzsy44Hz5w0ONMkwUizwHSLrVaJbOav2c/wrkuSb9SNEhnkkp+XsPnfKRiiPEjX7oR+p2NYMltDar3j1O8LU0/h6AL71PFzpp6ZF8IxJeCn/yfQBRP3NmMp/RKCtaor4ITcF4GRq5WlJ2og5DcMEVL78xlEVHHwyos27BOPU4TzKlv4zc+1HgpieXdxpR7ut5Ti+gLSn45Yir+kmUq0qp1RXBPYlYu9BSCkuV2C7MiqEkCFXIIBOzumIP3cETRMxOPewZvSZ20Q/Xqu6rX70Fgvy98k2iu6jPbhNyIh7nWILC+3PRjiWWtWLfobOsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTAuTtGwawgYUWRMW6b5e5TNoCDw/n7whvhIjfGbY0A=;
 b=PL30gJS4iGwU9HwVzzDNF2uLqxKA9a3NQYee9TTmgvyZjl+74tDoQWAuMvC1wF3poTKnipn42R2atvocwxWrh1/Se2aOTaYYVVX1ZAoZ1KcxNpDyZ1O3iXYV6n9k3fcfpXiIOnAHkPTl7NBG7ye/c4yoe8CsTh/y7DNoZcR1S26MejLsfgp+bvOs/PiI+s4wlELBmp802UIIX3oJkRqbLZbdnHBE7jRA2dJHqkl7zRO/AHF/8g/4lsIRFlTbDuWJKUCV+D3zLhPCI/LdMS4BcLGnLA5ARANK3NI36+ofUURP3Jdk5eIujAE/sFzZPBvOkZnIGvc6/3JLX502W117Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTAuTtGwawgYUWRMW6b5e5TNoCDw/n7whvhIjfGbY0A=;
 b=r0ogAPdjSbjI83JQF3rETBDJFVp6AxbjKpXB1lPlgQOmF0fY+ZVz/M6ACQJrmRIVNOMMiL361Y04YbMREmqGkJMISkx9iGfeReJlKU/PTyaO+rE5FoeU7k7vNFrjjHH2AayyvCahX8+edPZseV52fvHUjP8VZHT5o2BoedZ3K/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BL1PR01MB7674.prod.exchangelabs.com (2603:10b6:208:395::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.13; Mon, 27 Jul 2026 19:51:02 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:51:02 +0000
Message-ID: <79d7069b-2895-4be3-a2a0-327ad3444bf3@os.amperecomputing.com>
Date: Mon, 27 Jul 2026 12:50:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ljs@kernel.org
References: <20260609214205.1260279-1-yang@os.amperecomputing.com>
 <255744ec-2a58-492c-a69a-850357440183@os.amperecomputing.com>
 <amCqBzwIYDOvRI1S@willie-the-truck>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <amCqBzwIYDOvRI1S@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0373.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::18) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BL1PR01MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 8679e541-49f5-44ca-93d4-08deec186316
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|5023799004|10067099003|11063799006|56012099006|4143699003|6133799003|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info: VJaNfNQGrcQj3VzVx044ewBJjXSLZ53m7fotO/hakJUt17VBKrJck9Vr3SMJHhPP6PDhZZPREOPRqagbdYSHPmR1TVf7VQzOKg0rxC8+F90S5PbjR5pFvVBPoVulEvmFlufLI7qei0z6DV2oaiilA/Ow05ULJRpnNN/WGsuIsBmRdm5HyYZfStKhGcHE0wehusRyZH6s8Qr8Z7+RTz0ZxqTb6AcWEbe6SHu9XCudz3tMAhMvoSuJMSO1pkWIIxJkqL6buDmdNpBfnoQ+KRA0UMHLta7CGDixbkpEK8Ji26zr2dHkhiQ4RqVOJXZyjODEX9e1XDuUWQZe/ycu0YZSWR0iflifQp8/DGaO0y1VP9wPKpeMhpbdrAO0hWKeoXXSimLBgkO7WXmWG2VKvYQxx7MyCsDoBwGvSjozmt0SqZXWK4/F1Wn4U+y42oCHAzqUsdAWZRrDzw7Q+RGC9Gl3BwFL8DkSElpiAP7TjGh2gsH/uBMEKBY+ckgX1P4NsQF4eRJ+vA3Lsw+8WHvbIxACOxAcUw7s0op23z6ZvZ58F6ixVItC55GJ/OFByv524WwBg30A28K2nYQ4DUwjZKo4zKBFERvsBjCGeRapmG8ISC5QBLEvl4jvNUzKQv5PpmapMyjX+yTGk/v40jdy3SClLThbztExk8F9qmYfcd1DKrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(5023799004)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2tIdUtxa3JtQ3hzRDg3aDNHWWtDb0UxV2Rqa0hrcHJybGoza2NlWmRXMFN3?=
 =?utf-8?B?N3hjdE5KQllad05zcjNDWWNxYnNqVnB4M0xOSmdiRHdlU256UlBpM1JKb1ZB?=
 =?utf-8?B?K0pkNE1ieU40bjJQSnZuRmxQbWxlM2pPd3pRZCtUV2RYYUI2V0s3K1UxcEFP?=
 =?utf-8?B?VDR4OGR3U0FRcEpWaDZjbEovSXhRRTdTV3FVdklZNmVVSmx0YnEvTStWUEcw?=
 =?utf-8?B?UmRtdjVMeEFzeHRHZ1JSaFQ0Yk0vY1YwSVdkMVZ2YXRRVm10OFVScnpaTHF0?=
 =?utf-8?B?MHNoRnAxQjdDaDIrdnJHcXhndHhIM2VZc0o3YXFTR21RYkpnL05ZdTM5SXJO?=
 =?utf-8?B?cWtXN3p6MFBOV2FsSWxhd2xWekw5WUZPNnpYWjNGeDVXcWUvRnZQK2F0VXBH?=
 =?utf-8?B?UDk5T0t4cG9rTVo5bWhZbk0rcWFaWG1NTnJzaWFaV0k1ZWdPdWgxQjUxY1J6?=
 =?utf-8?B?RXFuNDBVeE5HcCtxQ1NpUVJrTms4ZGxOREMwOFlibnQvNnIzVDNSVWc4cUtX?=
 =?utf-8?B?b2VQazdHVUhiaEhvYWQ0VDNVUk5TUCtNV0gxWENnZ2owQmR0cE5FbjZTZXFh?=
 =?utf-8?B?VHhwNlpRSVQ5dmFkdGhVMTJQQlg2RElNQWlOTjAvTy9VbHplRUdrR0lnMVZl?=
 =?utf-8?B?MDlzR1VkenZrRXE4d1pwdmZLTlgyN1FFcXZ0ZzYzOXdWaTBMcGwxWXk2QWlY?=
 =?utf-8?B?WDd1L2NVWVRHRXNCQ2pORzBJUmRlTUxCbkVacEhrMWRsY0MzRVVldThLSkdO?=
 =?utf-8?B?Y0lPeUJvWjdXektaNEQvYktCQURsNkNuTEhSN0xSTms3UGRMUGVTa25FZ1VD?=
 =?utf-8?B?M0ZWU2ZpaldUb3JBYTNBQldhRlN6Q1ZRZ0ZLQ01ORWhVZ0l4c2tYSnZjTnFH?=
 =?utf-8?B?bUVxSGhoUHlkNjlNd01vUkpVU1BRNjBYWHo3S1Y4TUhIdnZJODZwV3JtM0hj?=
 =?utf-8?B?dzVwaGFMams1b0NKang4dUFOTld2QWJTQ0ppLytiNjNhYk1wQnM4K2NiaHox?=
 =?utf-8?B?SzEvamJBR01qdldDR0llcUFLN3JWamNBVXFhS2NDVmtza1JWYWNTeDRyY0hr?=
 =?utf-8?B?RmNhM0gycWxLbmQxVFBXbU4zTVlIeUh4WDJrOXUySGdCcnd6ZGpwbTd6dkdG?=
 =?utf-8?B?RmhScFM5cGFmYXpTNFFUU3pHMHZTNDJpbnVZSVlKL2FodVBueGRwb2R3Mm5j?=
 =?utf-8?B?aW03amJQZ05JM0FWdStaTitnQ015M0IyS0Y4K0V3dmFiU1RSNFprbzEwNWlx?=
 =?utf-8?B?TmIxRGdBb2dHOTEydDE0UFY5YXVWNG51M2tKR3hCeGRtcUdqaG1lMExKU1h2?=
 =?utf-8?B?aW93NjNuM0w0bmx2QVZkUEZjdlQ1M0dBOCtlN1drM1l6clFWRnkzWUxpM2dv?=
 =?utf-8?B?OUpJTXhFWjJlMVdBb3lJRU5xdHkzWXZwV0pZQS9mK05aazRsY0R2cnExUFdM?=
 =?utf-8?B?ZERSVnFXVmplQklIc2QzWVZzY3ZyYUQwOGtPcSt1UTQybEpwMXE1a1hBWkJ5?=
 =?utf-8?B?R1VBanQ1WXdjWFIyQ0lBbTdCb09BYVVvaTN6Um9qRExLM3RkRW9hakdOWkhj?=
 =?utf-8?B?ejNsN29xUGZlU0hkcUNCcDcxOXRBcE16TFVZZ0FOVUsvSTFFNjkzM040aXYw?=
 =?utf-8?B?WWlLYVRNSzAxUUFHNnN5aHFjbG8ydVA2QlkzVXluZkU1Vk04d292ak9uSkFJ?=
 =?utf-8?B?a2dURWJrTXVjdUJRN1JtTUFyL0hRMmh0RU55bFY2VWRlSzVNVHhySjgvdjNl?=
 =?utf-8?B?NFZSTmdZRHlaSjJDR3BxSCszYThpc2N3MTBUdEdLNGZYeUJRQ2xiNXE4aHor?=
 =?utf-8?B?WmhYOFZCOFNDZzdJQWwxbUtLTnFCalM5TFVmMU0vQnhaK0hGUERJeTJlTW5N?=
 =?utf-8?B?ckx3allLMEFHMDdJNzk4SkZHV3gxV2wra3lkS1lpSC9ZSW51NlRFeUxMZy85?=
 =?utf-8?B?dGFlMkpDTjJhalBJcDB0UU04eTZMekhrVFZWYmxGMlJUamFoMzJZUVFnRjJX?=
 =?utf-8?B?L3I3Z1lObzZNdXlHd3M1d0p5MTBsMUlmQWFxMlJuc01IWkJjaXhNR2ZmTWZz?=
 =?utf-8?B?Y1htK0xjVU5OSVQwKys3RGphanFsQ01zMEVNc1NGV3pMQW9taDRMWndOS1Ez?=
 =?utf-8?B?L2Y1RGJHemJLZUV2aXZMVll5ZFRwZXArWlc5SGZMNjZUbFJLbzYxOGloakor?=
 =?utf-8?B?a2Y3WHBXNHBYaXQ0bkJQdjRuVHl0TTRlMENaQU5XVHNVV0d3cGROTkJXVFJ2?=
 =?utf-8?B?U1NzMXhZYlJjcDBWd3I2elFiL2huQ0pWTjY1TlQ4ak1QT0JsMWNQbFpmVGRh?=
 =?utf-8?B?SSt0UlA3akd2NVFpWTBaSmZmcHZEcFgvVUgzNVczbENSd0JXWE1RcldzellG?=
 =?utf-8?Q?eRXo3Wi6hes8O44o=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8679e541-49f5-44ca-93d4-08deec186316
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:51:02.0887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hjy0rnvFn+L/MbLkhqWHF09b9pcYH7TiD369B+XPqOH9bAs0TSb5/ZLv79B2fVs3Y5NkurFyQlaDfWTvp7KEuVqqifOLcykikhiQIWesiHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7674
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_125117_104893_817208F6 
X-CRM114-Status: GOOD (  22.82  )
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



On 7/22/26 4:31 AM, Will Deacon wrote:
> On Tue, Jun 09, 2026 at 05:06:31PM -0700, Yang Shi wrote:
>>
>> On 6/9/26 2:42 PM, Yang Shi wrote:
>>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>>> rodata=full"), the direct mapping may be split on some machines instead
>>> keeping static since boot. It makes more sense to show the direct mapping
>>> use in /proc/meminfo than before.
>>> This patch will make /proc/meminfo show the direct mapping use like the
>>> below (4K base page size):
>>> DirectMap4K:       94792 kB
>>> DirectMap64K:     134208 kB
>>> DirectMap2M:     1173504 kB
>>> DirectMap32M:    5636096 kB
>>> DirectMap1G:    529530880 kB
>>>
>>> Although just the machines which support BBML2_NOABORT can split the
>>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>>> that the users have consistent view in order to avoid confusion.
>>>
>>> Although ptdump also can tell the direct map use, but it needs to dump
>>> the whole kernel page table. It is costly and overkilling. It is also
>>> in debugfs which may not be enabled by all distros. So showing direct
>>> map use in /proc/meminfo seems more convenient and has less overhead.
>>>
>>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>>> ---
>>>    arch/arm64/mm/mmu.c | 200 +++++++++++++++++++++++++++++++++++++++-----
>>>    1 file changed, 179 insertions(+), 21 deletions(-)
>>>
>>> v8: * Fixed the double accounting per Sashiko
>>>       * Responded the review comments from Sashiko
>>> v7: * Rebased to v7.1-rc4
>>>       * Changed "dm" to "lm" to follow ARM convention per Will
>>>       * Used __is_lm_alias() instead of reinventing a new helper per Will
>>> v6: * Rebased to v7.0-rc3
>>>       * Rebased on top of Anshuman's v5 "arm64/mm: Enable batched TLB flush
>>>         in unmap_hotplug_range()"
>>>       * Used const for direct map type array per Will
>>>       * Defined PUD size for 16K/64K even though it is not used per Will
>>>       * Removed the misleading comment in init_pmd() per Will
>>> v5: * Rebased to v6.19-rc4
>>>       * Fixed the build error for !CONFIG_PROC_FS
>>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>>       * Used shorter name for the helpers and variables per Ryan
>>>       * Fixed accounting for memory hotunplug
>>> v3: * Fixed the over-accounting problems per Ryan
>>>       * Introduced helpers for add/sub direct map use and #ifdef them with
>>>         CONFIG_PROC_FS per Ryan
>>>       * v3 is a fix patch on top of v2
>>> v2: * Counted in size instead of the number of entries per Ryan
>>>       * Removed shift array per Ryan
>>>       * Use lower case "k" per Ryan
>>>       * Fixed a couple of build warnings reported by kernel test robot
>>>       * Fixed a couple of poential miscounts
>> Aha, Sashiko is so fast. 2 comments this time.
>>
>> #1
>>> Will these updates suffer from data races?
>>> The lm_meminfo array tracks direct mapping statistics and is updated using
>>> non-atomic += and -= operations. These updates are invoked from multiple
>>> independent code paths that do not share a common lock.
>>> For example, runtime page permission changes call
>>> split_kernel_leaf_mapping_locked() which executes under
>>> pgtable_split_lock,
>>> while memory hotplug operations like arch_remove_memory() execute under
>>> mem_hotplug_lock. Because these paths can run concurrently on different
>>> CPUs,
>>> the non-atomic arithmetic could result in data races and lost updates.
>> Yes, it may race with memory hotplug. I missed memory hotplug for v7
>> Sashiko. Two options to solve it:
>>
>> 1. Use atomic variables. Make lm_meminfo[NR_LM_TYPE] atomic_long_t, then
>> manipulate it with atomic ops.
>> 2. Protect it with a spin lock.
>>
>> The contention for the cache line or the spin lock should be rare since
>> memory hotplug should happen rarely. Any preference?
> I'd vote for keeping it simple and using a lock. Might be worth looking
> at the ongoing work from Lorenzo:
>
> https://lore.kernel.org/all/20260717-series-vmap-race-fix-v5-0-606a0ac6d3e5@kernel.org/

Thanks, Will. Took a look at Lorenzo's work. IIUC he used init_mm 
mmap_lock to protect vmalloc area and linear mapping collapse on x86 in 
order to serialize against ptdump. I don't think we should use init_mm 
mmap_lock. We want to serialize linear mapping counter update between 
split and memory hotplug, but neither of them takes init_mm mmap_lock. 
We can let them take init_mm mmap_lock, but it sounds too overkilling.

So a dedicated spin lock may be better IMHO, which just protects linear 
mapping counter.

Yang

>
> Will


