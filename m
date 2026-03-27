Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEED10F286F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 20:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDVoZ9RCrZaQKlKjbwiR/UOIRXgYNWjNSKmEfkOgzPw=; b=QmOqp8Uw1wDDCLjdiE1RwQU9qB
	JnsIw+WzGINEP/3sfR+yChN+KaFPxR4z5B/4oYTIF9tasRs+9mtKuH9o/4DmhIfpK1eXFDqEAC3Pl
	4esI3D2M7qIHWK2NvF1ow8tn0PTapg9d17Rof/BucUCob5g64MRgIpKuDPzMHXWewlrt17nSXCb0z
	FYldL7BiMoV6azDn6WWb5CFCzGVjh2E8P11RZBWONMaNP9x1PQLGRyG62tB/hVzch2xNwHzuBS6fZ
	ccxHd+a+TMV4o5C4L/I5DAB4aMtTfTQyvZKjw2+iB7pncRFJ/gj7hVEdWO6+FbuY8ujHg7492uyD0
	ziEG0wAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6E7N-00000008CEf-0GVg;
	Fri, 27 Mar 2026 20:49:21 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6E7K-00000008CE9-0jXE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 20:49:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihlAazNndXBWzWy5V3aGijDf0XNjOsqKrL6LDTlGVxBVWT0GVvc1qZ2htExGoOSOXCrKYtSEjsv1CYEy9s7JziysFgzRpfVQ5p35a3U1fj3azYUkHtbBNCbeyIemDIyFGkG3OAZSkI5FeVdiwnjv0Op2r/x3y2YQK3fXvSCzGD8zuajt3y0cTNnGi7x8slyr9En1b6LwWvGv6s6jr5Mz/9OGf7ZiAUVDnkwVYeFxfc/zlQofBsivcMARwDCMlp7iDLDxyoeYnkIrQeD1kXuRZNvoT2Yiqg0jok1IVfdRZROO+JQznBTqe5o8vyIjEBdID4AAylh6p98nEA9UyYlt9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDVoZ9RCrZaQKlKjbwiR/UOIRXgYNWjNSKmEfkOgzPw=;
 b=hDl3LoCzQM8wGl1S/hQTBZIaVuEHVLrzbSUMAsFNLUptXaeoQsR49XB4Ezw+yn+qw3hIK8semaor7y30EbmM/dI6fI/7g7VusFzRJ6QPvXg5F6T6D+SEALhtoMH4aZSSQJS+pjPMdmucPRDDjznCLtXljxeKuf9HgzgCTUXD8+BfOz3o8A0C+4HUSXE3oE6z2EkkA1Kk14PVSr6wJqXW3XqNWxG/GJsp1QcKXWwwtLbdJtaVa9S+nRNTYVMn+XkJkOV/mdMtjjNp/Yqm3WCngb6z0UU5Na3ffyU7b7wW7ef7Fh5U4FQJMoCntbNGZP/AHWBsUEAhjB6WAKiS2YATxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDVoZ9RCrZaQKlKjbwiR/UOIRXgYNWjNSKmEfkOgzPw=;
 b=fr1wjagh/kRSMvai3o96LsOxd5lTmXmpRdLlUiqeNQ+ZU9TIuJZY0Eb2NlTPQr0oelLfoZ/ibjcSuB3iIpg0TMTNuNAqDS/pcDddFIXr7fZu8us1oKaWjOotBgnGxK/x9fe4jS1yeZUY41hoGxhOcoMIQx2MkJVVF9ozPaW0r1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BY3PR01MB6611.prod.exchangelabs.com (2603:10b6:a03:36a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.23; Fri, 27 Mar 2026 20:49:11 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 20:49:10 +0000
Message-ID: <48e46666-3e2f-454b-b1a7-ddd8a7dc5774@os.amperecomputing.com>
Date: Fri, 27 Mar 2026 13:49:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260323130317.1737522-1-ryan.roberts@arm.com>
 <20260323130317.1737522-2-ryan.roberts@arm.com>
 <a3766dfc-06ed-4cdc-9c55-0dcc3638746e@os.amperecomputing.com>
 <47d033cc-33dd-4fb2-9e8a-bc5762db6b6a@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <47d033cc-33dd-4fb2-9e8a-bc5762db6b6a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR22CA0098.namprd22.prod.outlook.com
 (2603:10b6:930:65::21) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BY3PR01MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: f50192d7-ca1b-4cd8-800e-08de8c424c32
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|18002099003|22082099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info: NekaVM26ESG81qVD48fInqD5IZT6u1EkrYS23aA372xgDeh4/VbVvJ4e58q7ewI7enwnZWAYfZVyOLRg+1AM2/HdD5jPNBTPb5upnPslFdk9TSgnF2AKqe10PZGZe7pIGDRDByhDcJq1ZO7H1SfgUHymbHQYpXifCO9Ho+fuLW367GDu8dM4j11QkVVNQOMdW61uVGHnOFDMkGJ2Z9SPa/AjUy0CQ4eVADb0cSHh0ADJ9pvSB8FozzyOfxycq3Wuz/JgGT1ptV2sN7nxCFXOz8RrlDWJIZZTkq+5Kk7ZgUEVKTf8uR07t43VFKTKqd8LBzrUIUpSsW6yEM5Sz8ysyvNK8D78nDj6gRDNlRX2yDHcQrY3wtO+Njh5UdLFSv66u+AfK7iocaINs6DV4eRgogJN8TMoNBXH3hZ5rjFFKbHk6lfgOl/V7bdGo6XgVlrSkARjlR/k3pps5ZFsIvO3iXBIkPwm1KH+OiFlHqRN8SfqJKEOep07qqKwOGei+K8nvcRBwWyKFPx9OZ383LWQuhnzkDics7SFMw4EkoJeRzv+2Qs5t44TCOWosfCgM/UuAnLTnWPNmc3gtN4dgy7LPZQ7ZEmvk/toR450LpcX7hinJEcYTgHhjgu3aaCo5FObFbMwIkosrmiBuvpf0OiX+Hup07jBCQDww6IoiaTDzA1qh4rwE+oo+tWn+kG/o7RN5oDOqflUkVidYXkb2y48NRIdGB2z8KyP/ITR1ofIp7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjkrVTF2bHR0b2FnbFljSk5mMnJUbHVKMHAxSDkrZUNxNGM2OUtNVEVuc1BV?=
 =?utf-8?B?MXRMenBvbEpDTkJCeW0rMVlITy9XM29yTXVCL29HQWw5TWJDc3VKeVZURzE2?=
 =?utf-8?B?cTRJT2ovVHl2R2VVNzF2Z2JGRThOYUNBWVpsaCtOWDllU0wwS2xKSW4rU0Rk?=
 =?utf-8?B?NThBbERvZWppVml5Q1BWNm0vM3NyQ0ZTT0FURjhzb1h5VTNRaHZPWHZGZkY2?=
 =?utf-8?B?ekQyRDEzS29jSzBCVmxBMEhySk44dnNDR0FnVksrZXpqeER5dy9BaXNXZEVQ?=
 =?utf-8?B?V1FCdjNpWXd4U2tRNmZCdGVYS3MwWW1ROHhiRHJqRHZYd0wyRzNZSVQwbFlz?=
 =?utf-8?B?ODdWb1ZoczBNN2xxM0pOQ3VUTjFKcGxtdTdCUlE4aGlESEgwcVJuQXVJVkFw?=
 =?utf-8?B?UjNGQmhUbmZMVWlQWXNFcDVmNktUN0Y1ZWtENjVZUDVpaVR1MGxwSG54b0Fw?=
 =?utf-8?B?a3lmYU9OL082ZlR0QjVSZUEra1FBZ1VoRE1kVnFQdXovV0tEeXcrZlhUSVdD?=
 =?utf-8?B?OEFIbUMwdElVaVJlYzQ2NndoZFlQQy9KNGJSc2x2bTcrSnRMdFF4K0YxTmJl?=
 =?utf-8?B?RHBkWGVJdmtQWFBvU3ZDU05HWnFieTBrWUw5UjlpOWc0bDdSZFM3MzlBQlVr?=
 =?utf-8?B?SW11blllMkxuM1BOV0l6eFcwTEQ5YTdlUFZ6Y3dhY2lzdGhTdzBoL3g3bXJT?=
 =?utf-8?B?SFc4c3VrRHJNY2NIWmtDSTJXbkxjMWhzS2ZYcTJDR0lycFA0bW53Q3RNcjNS?=
 =?utf-8?B?VExXVHVlSWc4RVk2a2R3R0MrNndsZlRvR0xLS2QvYWdNSmJONVhsejU2UTEy?=
 =?utf-8?B?K2tLTmR5YlhmZjB5QkNFSXFQcXk5cGpBNDVieWRUQXBWK1hIRlhVeUgwdDMw?=
 =?utf-8?B?RnRtN3Zva1ZIdEZLMTloRllpY0hGUjM5M2IrUzVHbEFpME8yamdoS1huc2J1?=
 =?utf-8?B?bDhVRG45ZWdBdjEzWWR1OHZSbTFaOUZsbVJodlVWa3cwTTJPaXQrYndVN2Vs?=
 =?utf-8?B?SEtDSm14SmFTNURNbkNja09nT0tjT3M2M1JDcHQrRUlxcFFKM2V0UFN0U0gw?=
 =?utf-8?B?RndKRWRlZ0M4OEpiSXY1TXBRSzhnQkJzK3phTXIyUEN0cFVrYVZ6S1lPYVRl?=
 =?utf-8?B?cERnSk9MN2lmTVA4TXNqOHk0MWlNZldzMllXdHZ6TUp5ZkEyWGNTUlYrNUtK?=
 =?utf-8?B?M0NQYUtUTzVVUVlBVVVEbU15L2U4d044WW9UUHlhWTZ1aERwcy9Rb21CWXlh?=
 =?utf-8?B?TnY1blFvSUdNL05Cc3I2SXV3WEYwVnhUdGZ4QkcvWG03MllEelJYelNNbVNm?=
 =?utf-8?B?VUZRcmxiQ3NndEpRTzVkbUxxb0ZZeWtlbGt2bkFPdnpsWmRDVU42SE43ZEpP?=
 =?utf-8?B?K1JiWnhTOWt2UDFOakJCQkd6ZGh3cVVKSzlCS2Q5NlEyRHI0MVp4dDJPM0Nn?=
 =?utf-8?B?eEw4WERMd2I1OEJNRXJxam0yaTNEYVl2VUZWWXVLdW40bXB1WUZDem52WHlH?=
 =?utf-8?B?TldxUzlpamFxakZRVTAzK21tTlpxczdBR0NWZUJ4TndDbGp0R3VQZ29hTmpY?=
 =?utf-8?B?dmx1eWNEQjVDZ2hUTDBhZnpUenozc2pLd3E0eUl3a21UdXZvSUoyMHNQRWFR?=
 =?utf-8?B?UnBVM1IrMjJuWC9JRWdmcC9SdklPM2ZJYXMrdC8zVVpjUDRGWWJpM0RTdkdk?=
 =?utf-8?B?TzUrUnJrRXlJTzRpa1pjYXlaV2paSmxrMktXekhoTXZjTzZBa1FZTEVsbEtR?=
 =?utf-8?B?YWwyN1N3L01QWkRDZkYyQjI5SjlBMFZiMFRyNnpBbU9nWDQ5M3FJUHArcS9t?=
 =?utf-8?B?bmlDOFhSd3B0djJ3SjlBWkNXTDBFRGFjT1RFUDBTRmNJQ1BaT29jNVVKWnZS?=
 =?utf-8?B?VjJYdDh6TWNRMllsRXJrYWEwZjlRY0J1MWdLOVBCMmJxMWNLNTdRdGZmaDFo?=
 =?utf-8?B?bmRBbmFWc05tZ1pXRXRxcjFKbVovclNqR2JzZWhvWGtLckVOZEJNTzlwV2JV?=
 =?utf-8?B?UjZzbFJjRmpmMlZrdGdaQUlMZzd0Tm9lRXhRTHlhRXBlbTI2SmxOYlozY3E3?=
 =?utf-8?B?V29LeFdON0xwOFJoTXZyY1FFaU8wU2dMa1E3RXJQZkEvRVM5eWZqYmovN3FU?=
 =?utf-8?B?a3pjc3dNZ3dxNE5qQlU3c2pZUGtvUUVoK2Z0dldodVBHWFd3SWEzYlZNQ2Nv?=
 =?utf-8?B?QVlHczh5eEFuRCtZaXJ4YnJ2ZXdTbVo4Z3phUG9yblZmaHpMZktRbGF2SzZC?=
 =?utf-8?B?QkR5eFJjNlRaK0FBVkNIVFRNNmdkaS85RCswVjhSRXZKR2VFNW5RWWRBTEFr?=
 =?utf-8?B?VmkxSEYzN2hDY3JIR1kycTNhWDNKZjk1enpZa3VadGtsQUhhZklKTHZIQy9j?=
 =?utf-8?Q?x8TpNi+N4/UuUv1Y=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50192d7-ca1b-4cd8-800e-08de8c424c32
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 20:49:10.8611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGNloX0vfpc4q5xLJdW0gPgJCn6xdhIo2k+7Lz8J9JnzWlZwFJTTnsj28GNC0GzRy2DQhX34Fo9x+Q1/mvZcwi1O0PUO1FHuxbrDJYp6kYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6611
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_134918_919612_64A5A713 
X-CRM114-Status: GOOD (  21.12  )
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



On 3/25/26 10:29 AM, Ryan Roberts wrote:
> On 23/03/2026 21:34, Yang Shi wrote:
>>
>> On 3/23/26 6:03 AM, Ryan Roberts wrote:
>>> Commit a166563e7ec37 ("arm64: mm: support large block mapping when
>>> rodata=full") enabled the linear map to be mapped by block/cont while
>>> still allowing granular permission changes on BBML2_NOABORT systems by
>>> lazily splitting the live mappings. This mechanism was intended to be
>>> usable by realm guests since they need to dynamically share dma buffers
>>> with the host by "decrypting" them - which for Arm CCA, means marking
>>> them as shared in the page tables.
>>>
>>> However, it turns out that the mechanism was failing for realm guests
>>> because realms need to share their dma buffers (via
>>> __set_memory_enc_dec()) much earlier during boot than
>>> split_kernel_leaf_mapping() was able to handle. The report linked below
>>> showed that GIC's ITS was one such user. But during the investigation I
>>> found other callsites that could not meet the
>>> split_kernel_leaf_mapping() constraints.
>>>
>>> The problem is that we block map the linear map based on the boot CPU
>>> supporting BBML2_NOABORT, then check that all the other CPUs support it
>>> too when finalizing the caps. If they don't, then we stop_machine() and
>>> split to ptes. For safety, split_kernel_leaf_mapping() previously
>>> wouldn't permit splitting until after the caps were finalized. That
>>> ensured that if any secondary cpus were running that didn't support
>>> BBML2_NOABORT, we wouldn't risk breaking them.
>>>
>>> I've fix this problem by reducing the black-out window where we refuse
>>> to split; there are now 2 windows. The first is from T0 until the page
>>> allocator is inititialized. Splitting allocates memory for the page
>>> allocator so it must be in use. The second covers the period between
>>> starting to online the secondary cpus until the system caps are
>>> finalized (this is a very small window).
>>>
>>> All of the problematic callers are calling __set_memory_enc_dec() before
>>> the secondary cpus come online, so this solves the problem. However, one
>>> of these callers, swiotlb_update_mem_attributes(), was trying to split
>>> before the page allocator was initialized. So I have moved this call
>>> from arch_mm_preinit() to mem_init(), which solves the ordering issue.
>>>
>>> I've added warnings and return an error if any attempt is made to split
>>> in the black-out windows.
>>>
>>> Note there are other issues which prevent booting all the way to user
>>> space, which will be fixed in subsequent patches.
>> Hi Ryan,
>>
>> Thanks for putting everything to together to have the patches so quickly. It
>> basically looks good to me. However, I'm thinking about whether we should have
>> split_kernel_leaf_mapping() call for different memory allocators in different
>> stages. If buddy has been initialized, it can call page allocator, otherwise,
>> for example, in early boot stage, it can call memblock allocator. So
>> split_kernel_leaf_mapping() should be able to be called anytime and we don't
>> have to rely on the boot order of subsystems.
> I considered that, but ultimately we would just be adding dead code. I've added
> a warning that will catch this usage. So I'd prefer to leave it as is for now
> and only add this functionality if we identify a need.

OK, fine to me. I don't have strong preference for either.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>
>> Thanks,
>> Yang
>>


