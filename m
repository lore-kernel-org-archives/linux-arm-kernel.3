Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F38CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWhguA2NJNqjk4wcLYWQIH0QVhcTicPth/pBkXixokQ=; b=FtK/kXIA/Wqfg290SCYBg8tQf2
	/VUwrAWwPnVTyntXfVZff2jD4DYK8sWti+CfJ2Ls5IXghB2HdEUjC16WHKajSeGaWsX7WKt3cKvzJ
	eYjwMGH/RVUQ6eApMDO/13ANW0aUpnDhTkEGyJmXwxw0aKx5GPneIMS8LfgW9G+OeXhFcJPMitI7g
	7YJI1H3WdigfRD40Hj2uSVLdZwt5Tj/9FnkOtYoQZ08rjjCPr4j79QE/qEo+qxWYVUYeUo2ZCsNLb
	ANpGrHFgD86rwh5iyxZ46K9GbgijfU89f6bt9TE1zgJpS/9J4EYakL9k267SKS9GmTkCRAPuvak1y
	rPXCvDsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIRC-00000007g8V-2klJ;
	Wed, 10 Jun 2026 12:53:42 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIR9-00000007g85-39rp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:53:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYGsRoLmNhRcy18pxMqsVnvnbLmN4lnDiwqaKwb1gUHJAI68HxL8MbhceFTAjtkjbMRKoSBuLmvQA8vMRdBw7HUYq7iwPbfyVdNfhUCmF6ix2b56wp8pqKCXYBi2Ta61KoEIO1iT36027irhgkYwq3bnUjjoY8F9+uRl2E7RkhKkEZHPdZf4bZAAHXsvmH/a7W/zvDjYjSGrzkyH+ooe5cZnee48Ipn9TwcxCSJcJZfsDpVr3+xi81mnPQG+/+znSTNTaSJz+J4/me4fb2RwiCmdYyUpMwPvdB/GS3x4rI3xfQz4wzNy2UBiVmetCkD2R2BEoYFOqiyuo//rkD3YVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWhguA2NJNqjk4wcLYWQIH0QVhcTicPth/pBkXixokQ=;
 b=zHSctqAnOBlFWTR8mcOu0AW6lXvQUC6SZ0R+9SAUpNRVOF4pVanJ3iVggRlsPNjavVg+0Lj1mExyPkVXAdeB7D5v/gUeV/ET/x7pHzpZeIIBZjjWPMG8xGPp7IGhlOnpRpnCB5Z2UBgxne6HbMVX4dGlAp9IntVUkvg5aH3YPyMsnMELAHXJsNPAAi1Dpi3hgkOq+syVBi3JIa8WaU0DHZ6THh5qyksArhXBAnKVt2wQ3lwC0HxLDVNLJcBVyRXL9+n7ApKHj4PE9bLt6Lt+dOUzMar+ykZZKeBYsV33yAy5AmbE2ewG3Hi6kRlEQ9WiafyS48HkTbCw1QgsWe30mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWhguA2NJNqjk4wcLYWQIH0QVhcTicPth/pBkXixokQ=;
 b=e/7yFRiUeLBSVmWLfKY7Mo/xrOnkMZ4Z0SeQQo+pft400NNDFMUDF/tJRq/a+BgBknoQQStKeIfsm6oqntYzmCpCUbgs1RAfER3XbPrveKl0cbsq2YwixpWrZLst6md8GTeye0V9USStUw35pvSAsaVawXygAiexs72ruoPmM5eDI/UIZKwyZnrbqVMwGWActrWqUMyzxItJSOJQNDcmcoQuWR8ndLU6WSouCxNtQCO8FjD0U3T2Ig9YTd/k2XVkK68DgTuxLAPlzUvW3vrM669hoLVJGCoO2KhzH3cgJoIJLLpgcaoST1K4ujbfEVviHL/L9bdIQqFznU3eKE+dgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 by DS4PR12MB9707.namprd12.prod.outlook.com (2603:10b6:8:278::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 12:53:31 +0000
Received: from IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c]) by IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c%3]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 12:53:30 +0000
Message-ID: <d12cfd71-3917-4834-9912-404baeca213c@nvidia.com>
Date: Wed, 10 Jun 2026 07:53:15 -0500
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
X-ClientProxiedBy: SA9PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:806:23::10) To IA1PR12MB6089.namprd12.prod.outlook.com
 (2603:10b6:208:3ef::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6089:EE_|DS4PR12MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: c55a7450-9d95-4b28-40a1-08dec6ef45ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|4143699003|6133799003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: Dap7Ib4iWHKYpAz4y+t7OOaqATHXaDqaNYNoHtaiBIznOYUcIvu8P+DUn7+2H7Sa68vHxFfGgIN9pNi2fgCDINT2aRSEue5CKBwgb0XKjIyK+KEsYlR82v7Dv5LADt/AiuR9dix9JJfc//pmtJ75Qi0hNzlTy8RXlTqrBcU9bQJg5qfhzigmTlwcTNo9sy5ALf1S5iT873DKBy/d4bvcXz3PYTUdMru2193FHl6wxKACAORDHLTAVnSIx049rFLLafn3J8YhKwjdWICVpFRAcNPKy5bR7DhCTAS/yCQ4+O488/syJ1ol+PDZ0Lo4wu5NPWH/7z4AnUS1ZLTrCOeG1iB4etzc7zqgDZAFHWpxa57HTDQSb+b3yeUmOFvfLVMDvtADrrmn6OHG84Z6hbVJmz2jr9ZXfrEiuDc9JnOmw0OVdGAWIWIHAtutfUMcl75O3uAASYssPFVEBtR3YrcsFZozZVMZR+8Uyyv3d/kBZjKV07ytJIT+uWg+a+26Owi4tUIc6dAwSdp+sd6dl6ZbSFTQNLYqzNf9+AIT79K8amVYieDEQWAvYqJX6d/t+la0SOWxv0ldcWDP28PuCW0quh/bbgbfNwFyI1sJRUqnIgsPv1bJnp6KaJuMe6xd3UpDEPdNyYEJ8m9YbkbitXUMwW9C1U3ecPN+obFjmo7y4W9f06lMq5es5qJ0Da4RNsjO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFVUek1NWWJlM2JyOWFvZUU0dDk2bUgvdHNEbXhsNHdNY2VOaGEvdG9QOHZs?=
 =?utf-8?B?b2pzTEhKVjNEUWRFeW1xNUc4SkNmOS9waVJ4MlNTQ2l5RE95VEdCZEc0MG9Q?=
 =?utf-8?B?SVRUU3EyUFJ6c1hRQmsyUFhxRHMwTExOOFg5VnB6SHV2dk9qWVViNm0rNGhi?=
 =?utf-8?B?UjI0NjVrak9TY1QvWjlFQTFmY1E0QjBxTVN1Wm1VMG9xREZuVnpjWkl0bmZo?=
 =?utf-8?B?OGhBQXFmeWJ4M0h1TEpnSmVKSWU0Q3NzQVQ5Q3VyaFFhK0hLQXdMRkZPL251?=
 =?utf-8?B?bmJ1Uk1Xb0hZQXV2Q0d3YVFEQ3FoOE5zSlBwRVlhcXNjdXVZTmVPMnFqZVl6?=
 =?utf-8?B?UDl0a1lQS2hlYXppVkI4bjI5WUlZNld0ZkJXV0ViWmpHemhOaENGaGR5UGJ3?=
 =?utf-8?B?YUtJZmVjb0x2S3VzN2JTcXJNYmFqdFZuY1F0QUMrUGdJa1l2ZkIyNVRReUE0?=
 =?utf-8?B?UWpHMkYxUHJuYkFXaWJzdEN6RnU4Q2hFTlV3QWFUaWY5aThlUkd0SEFqUG11?=
 =?utf-8?B?RW81ZUFqMGd2Y0hVZThLQnlzQlg5OUJPdmZLZERPL3hNeThDdkVYWkcwQmhT?=
 =?utf-8?B?ODVJL0lyUkFNdHNFdEFQbHZuS3FQVVFqOXNMRm5kWitpbFZzNkI5YUxFSm9x?=
 =?utf-8?B?QTl3cmtGMkM3aVp5UFFJaVpmODViOHZ0WWNibzM2OWZIOHR0cFBjOGN4cDVv?=
 =?utf-8?B?RDNvOWQ3RVpJUk1FV3pEM3BvQXg0OGtibUlkNWFzaDJ4THdneWNaY0hYYlJv?=
 =?utf-8?B?dHhxci9HeUs4N3dGcnoxKzZ1R25BQWdsckRkVWtDZ3p2NWhDTVVzZUNYcnFj?=
 =?utf-8?B?UGJ0cnZFZENrZU55aEFoRk9yNWxZWVEvZWdGTXhRT3pkOFVkV3pPTXZxTk53?=
 =?utf-8?B?QXIvamVHRFJOV3MvU1Z0VUVFM3hhRnR6Q0Iyc1o5S3pHUkhjdkFCWFh6UDJW?=
 =?utf-8?B?VTdmN1R1Z3BDQ1lCUWZwb2d3ZEE4R1d3WWhGaFRlSUlMQ3pDRmpIY2lkM3A3?=
 =?utf-8?B?enZTV1FkancwQ2RXS2ZTbktvVndZbWJtdFZzMHNRdERaU0Qrcnl6QTMzSzdz?=
 =?utf-8?B?M0hkWTBWcngrUzEzeWlYS0h6cHFzVHlpUTBvaEg4cUFpVEt1ckVVLy9jQjlo?=
 =?utf-8?B?ZkkxUXRLamJSQkpxY0xQVHp0T1RQZHNWK0txK0E1R2NQem5SRWQ0czFpK21T?=
 =?utf-8?B?TUdYbUNEN0hDRDk3dWMrejRjZWNObFE1QWZPS1BDWVNkY1owd21RNlJ3T1Ns?=
 =?utf-8?B?UE1xQzNySHJVOUtzNzdoSElqVDhyOGRyMHBPeVEyWVBUaENmRCt2MHkvdE0y?=
 =?utf-8?B?L0VGNWU4VHAvLzQxNXFqN3BUNWRrMjZqRzEzTEV3cGlhSDliT1FBbTZNbTJB?=
 =?utf-8?B?enFoOHA3YzZvUlNFM2VDajJ3bEZKTzJVamgrZ3MwSGVjTG1LQTVDbnhWcVNE?=
 =?utf-8?B?Z3ZMNmJtYTJpK2diZ2VoRG1QaHdvVVpKeHRRWjBOQlFrZm01UkNBc3pDb0Qy?=
 =?utf-8?B?cEhwZS9UVHhUemszRGZZQUR4Ky9Scy8yQ1haYldlWlZtSXQranliRlQzN1Zj?=
 =?utf-8?B?eUhtQklPRnYvRnVUeFp3TlNhQVhIelBRcDhiVU1TYzRmQmRqTmlWR2NNYkk3?=
 =?utf-8?B?V2xZaFoyL1RHRm9WeG4ybHcxUmV4RkY4NGJnVDB5UUFJbU5QTUpnZTFhMjVh?=
 =?utf-8?B?WDlRRy9rUTJDcW83TDFwYmJqbkVGbk1KTkJhUDVhRHZ6ODRSMlp4WGdxS0Q2?=
 =?utf-8?B?eUJDSVlKeGpzcE1BZnBiTTdFem5oRnlpZUlsWWdaZDg3YnhYS2V2MzVwWURV?=
 =?utf-8?B?Sm9GWWYwbkhkNzRCTExVUndabzQyM1VndlNCblhxUmRLWTMvbGZQVjhGWmhR?=
 =?utf-8?B?SnhLNllmdTNVS09pNVlYeDc3ZjYvS1Z2VXk3T0dvcEFQT1BNWlJvZGRXV1FC?=
 =?utf-8?B?TFdwU3FlQjR0blBpd1ZES2E4L214Y1IyRGhQNlpFL1NTR3ZqbEsvdWJoMjEw?=
 =?utf-8?B?VlFWVkNMMm8vSlNZa0tRRGtWckRrTGJwQmlLWEN6SFp3ekozbnZ6Qm5qSVEy?=
 =?utf-8?B?QnI3V2hTai9uTmliekk5L1RjTkVIUzNCbTc5bHFZNnVWQS9hVHlxYmU0Zzlp?=
 =?utf-8?B?SUVmS0FqdmFBckVQb3NRYUNEdVRiWEtNSU8zR1lrQVdUSmIrK3JtNGR0eHdz?=
 =?utf-8?B?QkNuRGJnWmhTWWk4Vm92bUZwTjIvRXZoVW5zdTVOUUpXbVM3emFjUHNpdVNk?=
 =?utf-8?B?N1J2L2ZEM2RoRlJmRUllWVp5N1lQbWNIUS84YUFzWXFKSGUyYTlPbkt2ejFo?=
 =?utf-8?B?SVhpY2ZCaXVNMWt0Z1NFTzRzWW9EdVFudUtZblJ1Y3gzdjBKMW5Cdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55a7450-9d95-4b28-40a1-08dec6ef45ef
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:53:30.7698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPqkiZusKBhFAEySqre5/0yKjcdYcB7zJq5bkq8w1PcKFfzQHmEMGbcRA4d0noLxm6hdHSH7hMdKKBD2RTTqPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_055339_866002_94CE35A1 
X-CRM114-Status: GOOD (  27.43  )
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

Thanks, Will. I’ll drop paragraph and avoid describing store-release
as an architectural ordering mechanism here.

>> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
>> to stlr* (Store-Release), which removes the "store is not a
>> store-release" condition for every device write the kernel issues.
>> Because writel() and writel_relaxed() are both built on __raw_writel()
>> in asm-generic/io.h, patching the raw variants covers both the
>> non-relaxed and relaxed APIs without touching the higher layers. Note
>> that writel()'s own barrier sits before the store, so it does not order
>> the store against a subsequent readl(); the store-release promotion is
>> what provides that ordering.
> Sashiko points out that you're missing __const_memcpy_toio_aligned32().

I’ll also cover __const_memcpy_toio_aligned32(); it currently emits plain
STRs directly and can bypass the raw write helper workaround. I’ll audit
the aligned64 path at the same time.

>> Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
>> ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
>> parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
>> the plain str* sequence.
>>
>> Note: stlr* only supports base-register addressing, so the raw accessors
>> can no longer use the offset addressing introduced by commit d044d6ba6f02
>> ("arm64: io: permit offset addressing"). The str* and stlr* alternates
>> share a single inline-asm operand and the sequence is selected at boot,
>> so the operand form is fixed at compile time; unaffected CPUs keep using
>> str* but also revert to base-register addressing. This keeps the store
>> side as simple as the existing load-side patching (load-acquire) and
>> avoids adding complexity to the device write path; retaining offset
>> addressing only for str* would otherwise require a runtime branch on
>> every write.
> I seem to remember Jason caring about that, possibly because some CPUs
> are very picky about write-combining?

For the offset-addressing concern, I’ll rework the raw accessors so
unaffected CPUs keep the existing offset-addressed STR sequence, and
only CPUs with ARM64_WORKAROUND_DEVICE_STORE_RELEASE take the base-register
STLR path.

I’ll post a v3 using the patched branch from alternative_has_cap_unlikely(),
and include the memcpy_toio() aligned-helper coverage as shown below.


--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -22,10 +22,46 @@
  /*
   * Generic IO read/write.  These perform native-endian accesses.
   */
+static __always_inline bool arm64_needs_device_store_release(void)
+{
+       return alternative_has_cap_unlikely(
+                               ARM64_WORKAROUND_DEVICE_STORE_RELEASE);
+}
+
+static __always_inline void __raw_writeb_stlr(u8 val,
+                                             volatile void __iomem *addr)
+{
+       asm volatile("stlrb %w0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
+static __always_inline void __raw_writew_stlr(u16 val,
+                                             volatile void __iomem *addr)
+{
+       asm volatile("stlrh %w0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
+static __always_inline void __raw_writel_stlr(u32 val,
+                                             volatile void __iomem *addr)
+{
+       asm volatile("stlr %w0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
+static __always_inline void __raw_writeq_stlr(u64 val,
+                                             volatile void __iomem *addr)
+{
+       asm volatile("stlr %x0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
  #define __raw_writeb __raw_writeb
  static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
  {
         volatile u8 __iomem *ptr = addr;
+
+       if (arm64_needs_device_store_release()) {
+               __raw_writeb_stlr(val, addr);
+               return;
+       }
+
         asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
  }
@@ -33,6 +69,12 @@ static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
  static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
  {
         volatile u16 __iomem *ptr = addr;
+
+       if (arm64_needs_device_store_release()) {
+               __raw_writew_stlr(val, addr);
+               return;
+       }
+
         asm volatile("strh %w0, %1" : : "rZ" (val), "Qo" (*ptr));
  }
@@ -40,6 +82,12 @@ static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
  static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
  {
         volatile u32 __iomem *ptr = addr;
+
+       if (arm64_needs_device_store_release()) {
+               __raw_writel_stlr(val, addr);
+               return;
+       }
+
         asm volatile("str %w0, %1" : : "rZ" (val), "Qo" (*ptr));
  }
@@ -47,6 +95,12 @@ static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
  static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
  {
         volatile u64 __iomem *ptr = addr;
+
+       if (arm64_needs_device_store_release()) {
+               __raw_writeq_stlr(val, addr);
+               return;
+       }
+
         asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
  }
@@ -147,6 +201,12 @@ static __always_inline void
  __const_memcpy_toio_aligned32(volatile u32 __iomem *to, const u32 *from,
                               size_t count)
  {
+       if (arm64_needs_device_store_release()) {
+               while (count--)
+                       __raw_writel_stlr(*from++, to++);
+               return;
+       }
+
         switch (count) {
         case 8:
                 asm volatile("str %w0, [%8, #4 * 0]\n"
@@ -204,6 +264,12 @@ static __always_inline void
  __const_memcpy_toio_aligned64(volatile u64 __iomem *to, const u64 *from,
                               size_t count)
  {
+       if (arm64_needs_device_store_release()) {
+               while (count--)
+                       __raw_writeq_stlr(*from++, to++);
+               return;
+       }
+
         switch (count) {
         case 8:
                 asm volatile("str %x0, [%8, #8 * 0]\n"

I'll post v3 patch with jump instruction patch.

--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -22,10 +22,46 @@
  /*
   * Generic IO read/write.  These perform native-endian accesses.
   */
+static __always_inline bool arm64_needs_device_store_release(void)
+{
+       return alternative_has_cap_unlikely(
+                               ARM64_WORKAROUND_DEVICE_STORE_RELEASE);
+}
+
+static __always_inline void __raw_writeb_stlr(u8 val,
+                                             volatile void __iomem *addr)
+{
+       asm volatile("stlrb %w0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
+static __always_inline void __raw_writew_stlr(u16 val,
+                                             volatile void __iomem *addr)
+{
+       asm volatile("stlrh %w0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
+static __always_inline void __raw_writel_stlr(u32 val,
+                                             volatile void __iomem *addr)
+{
+       asm volatile("stlr %w0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
+static __always_inline void __raw_writeq_stlr(u64 val,
+                                             volatile void __iomem *addr)
+{
+       asm volatile("stlr %x0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
  #define __raw_writeb __raw_writeb
  static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
  {
         volatile u8 __iomem *ptr = addr;
+
+       if (arm64_needs_device_store_release()) {
+               __raw_writeb_stlr(val, addr);
+               return;
+       }
+
         asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
  }
@@ -33,6 +69,12 @@ static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
  static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
  {
         volatile u16 __iomem *ptr = addr;
+
+       if (arm64_needs_device_store_release()) {
+               __raw_writew_stlr(val, addr);
+               return;
+       }
+
         asm volatile("strh %w0, %1" : : "rZ" (val), "Qo" (*ptr));
  }
@@ -40,6 +82,12 @@ static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
  static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
  {
         volatile u32 __iomem *ptr = addr;
+
+       if (arm64_needs_device_store_release()) {
+               __raw_writel_stlr(val, addr);
+               return;
+       }
+
         asm volatile("str %w0, %1" : : "rZ" (val), "Qo" (*ptr));
  }
@@ -47,6 +95,12 @@ static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
  static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
  {
         volatile u64 __iomem *ptr = addr;
+
+       if (arm64_needs_device_store_release()) {
+               __raw_writeq_stlr(val, addr);
+               return;
+       }
+
         asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
  }
@@ -147,6 +201,12 @@ static __always_inline void
  __const_memcpy_toio_aligned32(volatile u32 __iomem *to, const u32 *from,
                               size_t count)
  {
+       if (arm64_needs_device_store_release()) {
+               while (count--)
+                       __raw_writel_stlr(*from++, to++);
+               return;
+       }
+
         switch (count) {
         case 8:
                 asm volatile("str %w0, [%8, #4 * 0]\n"
@@ -204,6 +264,12 @@ static __always_inline void
  __const_memcpy_toio_aligned64(volatile u64 __iomem *to, const u64 *from,
                               size_t count)
  {
+       if (arm64_needs_device_store_release()) {
+               while (count--)
+                       __raw_writeq_stlr(*from++, to++);
+               return;
+       }
+
         switch (count) {
         case 8:
                 asm volatile("str %x0, [%8, #8 * 0]\n"

-Shanker


