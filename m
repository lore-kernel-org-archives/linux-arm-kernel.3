Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ECACD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAq6p65QubB9vfTVgCHCzx+pAcdilChZqqPV9hs2AEw=; b=XDwHpzFG8tBhcHnR99m9tnS9oz
	H2CJk0gLO0HogeEXWghJ52xmkIXZ9HEFP/dGFjVV8yMVZA29C3ov7BUczUEiWw83+6yH1nau6rTJ6
	FUjSEIdUr7JQYvysQt9wmfjU8wf/2I9b7lvo/0WbcWZu8Q59l+tNb6pLnl7mp58+0BSU7scLgZEpC
	xpuyQ5rlfUiUZZq0ULmDtdLzki1ArlOsY3VJM3ZE+jfbxB9kKuSXNoTG9DCyS9FaPC1g6uO7cNFZC
	dlM183D79IzR9N3bF8RqURIRsYGPl63zJ1T5c3pIo8o35EcbEToQUbfN1cCd1D/dwMujH6WJzcQ9+
	aJbKTX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6T1-00000006XmG-05IM;
	Wed, 10 Jun 2026 00:06:47 +0000
Received: from mail-westusazon11020096.outbound.protection.outlook.com ([52.101.85.96] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6Sx-00000006Xli-3JnV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7XWBkBSFQiNuELos0ged4yee9Xf8P89c79/Syu5C82IxnaoBweyxPQkHYXjoCUJmtjS4lQpBPbmUq0HYm87rfW+X5CRlMwg7GHZD4X3LyDFS8cUusCGxZ1Nm+Vv1Sy2sXoqBA7Fe1ssR81hUmh2bw7hky8hSnnwBvZNvQpncAFjXK0cdGPNa835THC98x1X2UaTvzU2hKHp7+zvusWzU+x1XIP7i3RvmqVN83mt1yEdt5ehVI5cWeL83hw9m1OIitHXbltF7+wqJMawT44U8qstCb7og7OG5GTdpBc5Lzp39yEZ97XFtQSo9XY2ua7ZWFqMU3dZDIQFAIVtBwR86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAq6p65QubB9vfTVgCHCzx+pAcdilChZqqPV9hs2AEw=;
 b=QQe54r5px3QtcKVE+xLihJODMpWXTe/xgX8tBAJuTahaqSmM3ufjKJCS5SySKAU+d8U/2dg696MZ96VSD5HrBy+PLWdX0nGXG+uUjSvNQ+CeahyeZxHop3I1kHj6NM+sJD1XY3iuKXDwh7Y6X/2txbexbup0naR5f0wRqeQW6P34pYwck5P+damCNczM6GeWb8H7b3w+KmxuCHJH8XTM87mito2A3DrfOhg3lIDNGeyNqrhNA5bg7l0hDT38n669CWtD0w3ITs/RNh+n/NeoA0G/uww3gO2itSbWY9MNElIhdw59ILudG1i2cbse0uRU8vO4Xwi2hosxZ2Fsz/saVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAq6p65QubB9vfTVgCHCzx+pAcdilChZqqPV9hs2AEw=;
 b=sevQ4cUwTz2zB6lW0IVmXyAk2RDwHidi/Grpgm1YhAvQ2Pm4umVIoJQSrmT4tSR6acND5sfLxQxsPq0sCKchFqKmnEFMDGOlykdLnURfke4tUhRwIvDLOThrXt4yI64D/YX/rHwB6jyQSHolQIikaXfr4NSIHd7fmf13CXvaHjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 MN7PR01MB468348.prod.exchangelabs.com (2603:10b6:208:5f7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.12; Wed, 10 Jun 2026 00:06:37 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 00:06:35 +0000
Message-ID: <255744ec-2a58-492c-a69a-850357440183@os.amperecomputing.com>
Date: Tue, 9 Jun 2026 17:06:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
 cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260609214205.1260279-1-yang@os.amperecomputing.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20260609214205.1260279-1-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::33) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|MN7PR01MB468348:EE_
X-MS-Office365-Filtering-Correlation-Id: 882d28d1-494b-4d17-68e1-08dec6842273
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|5023799004|18002099003|22082099003|6133799003|55112099003;
X-Microsoft-Antispam-Message-Info: 328SzWZgB2BYGPSfcWEznHBwkcTY1J1x4VN6J0cHHKwaZGBppukWlV0ZpHOSgx16qNXKym33FS64hKnASgAouXh1SGfNnhyzye6pkF8gLoKg5XJ/GBmjbQlh89sQpT9olMgKW0zF98bbNHfmKY1XyKRptEH4Vwyi8H9y0W6Em2FuQcKUJ3nRbTzxnSs+fwvtNid8xKwIMMiaPHIStD1v4b9HN/+xndFmubUzhLqiuCSLLUAlKQ0EEa9wVYj88/VcJL9pXe9FkrzA6agp5yPThOAqAbkaOVyONJMR/sgPJc8iU2ptPj1ydZM3tobD3b2H1ea8xOs+W+1QLLPP9CSEia8gwO2dd70JZpxxCxyc7D36bAgLXuXOpUyHcMN1mcB4+SR6n0OTWkXhK6A9O2ONM7J3ub2el+T23b3Ra6K84YmbNwrn/KtpAvwhjzaja9g0fyZ+XXiDVP3BEHbFVynN8YdsTrE4GYCtkB+QOywOFcM8gpFWrGzW+i33lBNl4+/ecSCdBG5xneKzElsokmHyrs67tJhE3dsdAX8EeomD8V99w0MqbWGjxgnPYpKtSEC/HvSFuMvT0yJpsj76+Al3ZvcjCB1/Yaw5UQrmVyMxeDWCkKYc01uegBkK1qp92M0gnsA7kSXuPmC+M4+TxQ9G9VJsel7GiRenk97vqTcHGmCsyTma0umpcs7bIDWDtde7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003)(6133799003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2xtKzZnR1ZlM0tLeFd5VTZpZ3NUbkloRWMrL0FwQ0gwWTVlODd6L2VqRkJZ?=
 =?utf-8?B?WGo5NjhPMDZQYjJuTWJIWUV5QlJ3Y2pYZ1drTTR1ZEVrNEp4S2xhdWJJd2hw?=
 =?utf-8?B?ckJPYWRzejAwdk5uM1BHQWVUU3JpS09xc3E0Um15RUk5WW1yQVJuUzRjU1JK?=
 =?utf-8?B?VHhaWGVqdnBRNUZ1bHJ3anNzYXY3NWhQd0laVUxLZ0tvSFhkNm5jME5pbk1v?=
 =?utf-8?B?Q2IvdDNwVjI4K240VUp0QjRTUmRYTnYrdHJBczNqYUhnT093ckxkWitYbkVE?=
 =?utf-8?B?dThEQXR5OWY1TDhRSCtrRVRRczd4blA2RDdXNUwwTUFZQnN2RHdjUkR0OHBl?=
 =?utf-8?B?NnlmdGlnWExjd0pKbTduNGgzdERiUzdaYWpDbjFFL1I2WTBxM2YzbE92VHFO?=
 =?utf-8?B?d0RHSXFiVUQ5ckZoYmxSdmdjU0hGaHU2dW8xOUdIRkdiZS9VWG0raTMwUDhD?=
 =?utf-8?B?T1UzY0NEZE81ZTA0Zm5wRFh6MERCeXJzZU9zZy84c2x3RFJFSmlLMnpXTVVp?=
 =?utf-8?B?aWFldlpJSDZIY3lYc1ZLc1UwWUl4aHlCMzVuTUdOS3lpMW9NM2QwNjZRZDlH?=
 =?utf-8?B?NnVJODJtZTdZNFpjeG44OHlzQVhhNWYyNUZMREF2WUtjeGdBbUhoay9XQmYy?=
 =?utf-8?B?MXZ6TkkreG5ISWQyRDBQV2p1ZnRlOGxCQmtxTVlSamVJTEQvekd6T29Ncmh4?=
 =?utf-8?B?aXp0V1dxdk9zc29yUGRsYTgzS2t3b2xsTDFrQzE1SEh3OFBza0xGYWdoZ3Nn?=
 =?utf-8?B?UHA5RWs3K3hZUjdNazRwaW1Ja0UreUJmazBEREpKYjRESnp6TEFHQXdZbmti?=
 =?utf-8?B?eWt0RXM5ZFB2VmhiOVpzTFFJQlVVaEZCR3FFUFVZbnBUR2pXUE5waiswcE5u?=
 =?utf-8?B?U1ZJL0FWblRMbHZtQklVOStlRzMzUlpUSDRsejZNOXppVkoxNVRWQStpRExp?=
 =?utf-8?B?Tmx0dG9ZQVF2bVFsVXhicmdzaDNEL0lsOFV5b1R5dzNkODdrMmhSSTRCenY3?=
 =?utf-8?B?OFkyU0lyZEI2WGt0ZVdCVWc1Umcvb0dTQVd0WTRhemFnQi9WOUZqL2VScjdq?=
 =?utf-8?B?dzZkVTRSVHEyOVVQaGx1ajcwdmI1cmZCYlBvL0E3ck50NmVoM01YTHpwNnN4?=
 =?utf-8?B?SmJ5WWdIdm95SGdORzRGVzJnMnI5T0xTMG1lZTRuVmtXYjUrT29GMk1QbW9X?=
 =?utf-8?B?VE9ZeGRIVGtsMUVRQnRLcVVJOVh0YmVYTlF3VGZvZU5uSHZ3YWhEVUFTV2pE?=
 =?utf-8?B?dGxtMjBWV3lvVXYxaWpwdzJXcGY1VW1abWdqRjZ6RTBxbmJtWVhyVmRPU3Jq?=
 =?utf-8?B?bk1lZUdHWFN5OWZMRFFsRGdsUUFTZ2I3Ump5UnFJbXQrUnVIYWJTUkRvRTZH?=
 =?utf-8?B?V3pTNEJKb2d2NWdCaU9DRXMydXl5Vk5pQ2dBc2ZTem8wTldlbk1QR3UyUUxn?=
 =?utf-8?B?Wkp4RG5UaDg2ZzVoNEFjWnZaUHJTazJ5SFJ6d0lpckVIRDFrR3pITDVyRmpl?=
 =?utf-8?B?RTJqbzZJOEVQWU9PeWlUeXZzSlZVeFlSWTZRdTFHbTRoVlA1SXZnV3hrczFI?=
 =?utf-8?B?bE11b2RFRDI2dzNEWFFMMGIwNlZIZU1sTm9nWXA2V1IwZjlSTXFPektmc29X?=
 =?utf-8?B?VUlFM2hSbUxSUVpneExON0xOaWY3aWVITmlzNTNEUHNpbWFIRVB0UVlsblF5?=
 =?utf-8?B?TlpWcFh6aFhsOTdTUFZYZHg4YmM5aUtEamlsTDgvZW5nNTZibHJHNERaYW12?=
 =?utf-8?B?a0c5MjZ3Q2JPL3Q4QnN6Q3FDVjJ0SWJGd2MxSzU1RzlYeFJNOGZscGtzWWZM?=
 =?utf-8?B?TE1wQ2FjQ2IxSVllT0RiWkFtRlVsdndzd0Y5ZU9PMWZOVlFZOXVRemM0aGFL?=
 =?utf-8?B?V2xxTUxQaUpOejNubk42U0ZteWVwTDdISkN6aWwwM3M4SkRjRWx1eGxuYjlT?=
 =?utf-8?B?MEFaR2FwR1lESGV0WkFTMGVrYklIZmRIc3h1cFhGNlcybm9aUnZDM2ZUYnFP?=
 =?utf-8?B?c2hMUWVkZ1NXR0Z5aTFuSFFyN2tZSkI2MWlkMEx4SFY2ZERIOGtaZjJOL2V6?=
 =?utf-8?B?czFQdXFXSWFJWUZISUxXSHVVRFB6VWRSL2d4RlBodmgvM2V6YWdsb3NJS2RH?=
 =?utf-8?B?emtvQUZCTVdGWlFrZjNLQTlHNm1qbStkYlNsU1p2MkhKVkZiSlNWcFFZeGpW?=
 =?utf-8?B?NDlTa2dKTFlKQTI0cGRwWDQrMG9mcUpWMS90NW5UbE55SEpDS21UU3RmdmtJ?=
 =?utf-8?B?SmN1SmtxRTZhSTI2eGtXK0NLRFpBb3Q0bkNqRjI5b0xLVE0zVzZMRC9HbWpk?=
 =?utf-8?B?azZiK204YWZPTG9kWHIzazRENlhpNHhDc0NVeGlZaStqMklhZUtTRXFmaytm?=
 =?utf-8?Q?M7s10eC8uPf7bljQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882d28d1-494b-4d17-68e1-08dec6842273
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 00:06:35.1290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRc/lOZdWCua3aUrhOZ5feO9OWO5BsyTFtbNiyD19iy1rem6W43rH7OP8egQnwig8wEEjAOGK+uDppP4r/1a1Ccd7cT8kUNR//2x8NkfU6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR01MB468348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_170643_853288_37AC5242 
X-CRM114-Status: GOOD (  35.98  )
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



On 6/9/26 2:42 PM, Yang Shi wrote:
> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"), the direct mapping may be split on some machines instead
> keeping static since boot. It makes more sense to show the direct mapping
> use in /proc/meminfo than before.
> This patch will make /proc/meminfo show the direct mapping use like the
> below (4K base page size):
> DirectMap4K:       94792 kB
> DirectMap64K:     134208 kB
> DirectMap2M:     1173504 kB
> DirectMap32M:    5636096 kB
> DirectMap1G:    529530880 kB
>
> Although just the machines which support BBML2_NOABORT can split the
> direct mapping, show it on all machines regardless of BBML2_NOABORT so
> that the users have consistent view in order to avoid confusion.
>
> Although ptdump also can tell the direct map use, but it needs to dump
> the whole kernel page table. It is costly and overkilling. It is also
> in debugfs which may not be enabled by all distros. So showing direct
> map use in /proc/meminfo seems more convenient and has less overhead.
>
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>   arch/arm64/mm/mmu.c | 200 +++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 179 insertions(+), 21 deletions(-)
>
> v8: * Fixed the double accounting per Sashiko
>      * Responded the review comments from Sashiko
> v7: * Rebased to v7.1-rc4
>      * Changed "dm" to "lm" to follow ARM convention per Will
>      * Used __is_lm_alias() instead of reinventing a new helper per Will
> v6: * Rebased to v7.0-rc3
>      * Rebased on top of Anshuman's v5 "arm64/mm: Enable batched TLB flush
>        in unmap_hotplug_range()"
>      * Used const for direct map type array per Will
>      * Defined PUD size for 16K/64K even though it is not used per Will
>      * Removed the misleading comment in init_pmd() per Will
> v5: * Rebased to v6.19-rc4
>      * Fixed the build error for !CONFIG_PROC_FS
> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>      * Used shorter name for the helpers and variables per Ryan
>      * Fixed accounting for memory hotunplug
> v3: * Fixed the over-accounting problems per Ryan
>      * Introduced helpers for add/sub direct map use and #ifdef them with
>        CONFIG_PROC_FS per Ryan
>      * v3 is a fix patch on top of v2
> v2: * Counted in size instead of the number of entries per Ryan
>      * Removed shift array per Ryan
>      * Use lower case "k" per Ryan
>      * Fixed a couple of build warnings reported by kernel test robot
>      * Fixed a couple of poential miscounts

Aha, Sashiko is so fast. 2 comments this time.

#1
> Will these updates suffer from data races?
> The lm_meminfo array tracks direct mapping statistics and is updated using
> non-atomic += and -= operations. These updates are invoked from multiple
> independent code paths that do not share a common lock.
> For example, runtime page permission changes call
> split_kernel_leaf_mapping_locked() which executes under 
> pgtable_split_lock,
> while memory hotplug operations like arch_remove_memory() execute under
> mem_hotplug_lock. Because these paths can run concurrently on 
> different CPUs,
> the non-atomic arithmetic could result in data races and lost updates.

Yes, it may race with memory hotplug. I missed memory hotplug for v7 
Sashiko. Two options to solve it:

1. Use atomic variables. Make lm_meminfo[NR_LM_TYPE] atomic_long_t, then 
manipulate it with atomic ops.
2. Protect it with a spin lock.

The contention for the cache line or the spin lock should be rare since 
memory hotplug should happen rarely. Any preference?


#2 is repeated one from v7. I don't see any difference, so the response 
for v7 is still valid.

Thanks,
Yang

>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index dd85e093ffdb..783a473c71ed 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -29,6 +29,7 @@
>   #include <linux/mm_inline.h>
>   #include <linux/pagewalk.h>
>   #include <linux/stop_machine.h>
> +#include <linux/proc_fs.h>
>   
>   #include <asm/barrier.h>
>   #include <asm/cputype.h>
> @@ -164,6 +165,82 @@ static void init_clear_pgtable(void *table)
>   	dsb(ishst);
>   }
>   
> +enum lm_type {
> +	PTE,
> +	CONT_PTE,
> +	PMD,
> +	CONT_PMD,
> +	PUD,
> +	NR_LM_TYPE,
> +};
> +
> +#ifdef CONFIG_PROC_FS
> +static unsigned long lm_meminfo[NR_LM_TYPE];
> +
> +void arch_report_meminfo(struct seq_file *m)
> +{
> +	const char *size[NR_LM_TYPE];
> +
> +#if defined(CONFIG_ARM64_4K_PAGES)
> +	size[PTE] = "4k";
> +	size[CONT_PTE] = "64k";
> +	size[PMD] = "2M";
> +	size[CONT_PMD] = "32M";
> +	size[PUD] = "1G";
> +#elif defined(CONFIG_ARM64_16K_PAGES)
> +	size[PTE] = "16k";
> +	size[CONT_PTE] = "2M";
> +	size[PMD] = "32M";
> +	size[CONT_PMD] = "1G";
> +	size[PUD] = "64G";
> +#elif defined(CONFIG_ARM64_64K_PAGES)
> +	size[PTE] = "64k";
> +	size[CONT_PTE] = "2M";
> +	size[PMD] = "512M";
> +	size[CONT_PMD] = "16G";
> +	size[PUD] = "4T";
> +#endif
> +
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[PTE], lm_meminfo[PTE] >> 10);
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[CONT_PTE],
> +			lm_meminfo[CONT_PTE] >> 10);
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[PMD], lm_meminfo[PMD] >> 10);
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[CONT_PMD],
> +			lm_meminfo[CONT_PMD] >> 10);
> +	if (pud_sect_supported())
> +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[PUD], lm_meminfo[PUD] >> 10);
> +}
> +
> +static inline void lm_meminfo_add(unsigned long addr, unsigned long size,
> +				  enum lm_type type)
> +{
> +	if (__is_lm_address(addr))
> +		lm_meminfo[type] += size;
> +}
> +
> +static inline void lm_meminfo_sub(unsigned long addr, unsigned long size,
> +				  enum lm_type type)
> +{
> +	if (__is_lm_address(addr))
> +		lm_meminfo[type] -= size;
> +}
> +#else
> +static inline void lm_meminfo_add(unsigned long addr, unsigned long size,
> +				  enum lm_type type)
> +{
> +}
> +
> +static inline void lm_meminfo_sub(unsigned long addr, unsigned long size,
> +				  enum lm_type type)
> +{
> +}
> +#endif
> +
>   static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>   		     phys_addr_t phys, pgprot_t prot)
>   {
> @@ -219,6 +296,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>   
>   	do {
>   		pgprot_t __prot = prot;
> +		bool count_lm = pte_none(__ptep_get(ptep));
>   
>   		next = pte_cont_addr_end(addr, end);
>   
> @@ -229,6 +307,13 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>   
>   		init_pte(ptep, addr, next, phys, __prot);
>   
> +		if (count_lm) {
> +			if (pgprot_val(__prot) & PTE_CONT)
> +				lm_meminfo_add(addr, (next - addr), CONT_PTE);
> +			else
> +				lm_meminfo_add(addr, (next - addr), PTE);
> +		}
> +
>   		ptep += pte_index(next) - pte_index(addr);
>   		phys += next - addr;
>   	} while (addr = next, addr != end);
> @@ -251,6 +336,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>   
>   	do {
>   		pmd_t old_pmd = READ_ONCE(*pmdp);
> +		bool count_lm = pmd_none(old_pmd);
>   
>   		next = pmd_addr_end(addr, end);
>   
> @@ -259,6 +345,12 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>   		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>   			pmd_set_huge(pmdp, phys, prot);
>   
> +			if (count_lm) {
> +				if (pgprot_val(prot) & PTE_CONT)
> +					lm_meminfo_add(addr, (next - addr), CONT_PMD);
> +				else
> +					lm_meminfo_add(addr, (next - addr), PMD);
> +			}
>   			/*
>   			 * After the PMD entry has been populated once, we
>   			 * only allow updates to the permission attributes.
> @@ -371,6 +463,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>   
>   	do {
>   		pud_t old_pud = READ_ONCE(*pudp);
> +		bool count_lm = pud_none(old_pud);
>   
>   		next = pud_addr_end(addr, end);
>   
> @@ -382,6 +475,8 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>   		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>   			pud_set_huge(pudp, phys, prot);
>   
> +			if (count_lm)
> +				lm_meminfo_add(addr, (next - addr), PUD);
>   			/*
>   			 * After the PUD entry has been populated once, we
>   			 * only allow updates to the permission attributes.
> @@ -571,16 +666,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_level pgtable_level)
>   	return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, pgtable_level);
>   }
>   
> -static void split_contpte(pte_t *ptep)
> +static void split_contpte(unsigned long addr, pte_t *ptep)
>   {
>   	int i;
>   
> +	lm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
> +
>   	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
>   	for (i = 0; i < CONT_PTES; i++, ptep++)
>   		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
> +
> +	lm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
>   }
>   
> -static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
> +static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
> +		     bool to_cont)
>   {
>   	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
>   	unsigned long pfn = pmd_pfn(pmd);
> @@ -604,8 +704,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>   	if (to_cont)
>   		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>   
> +	lm_meminfo_sub(addr, PMD_SIZE, PMD);
>   	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
>   		__set_pte(ptep, pfn_pte(pfn, prot));
> +	if (to_cont)
> +		lm_meminfo_add(addr, PMD_SIZE, CONT_PTE);
> +	else
> +		lm_meminfo_add(addr, PMD_SIZE, PTE);
>   
>   	/*
>   	 * Ensure the pte entries are visible to the table walker by the time
> @@ -617,16 +722,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>   	return 0;
>   }
>   
> -static void split_contpmd(pmd_t *pmdp)
> +static void split_contpmd(unsigned long addr, pmd_t *pmdp)
>   {
>   	int i;
>   
> +	lm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
> +
>   	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
>   	for (i = 0; i < CONT_PMDS; i++, pmdp++)
>   		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
> +
> +	lm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
>   }
>   
> -static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
> +static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
> +		     bool to_cont)
>   {
>   	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
>   	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
> @@ -651,8 +761,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>   	if (to_cont)
>   		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>   
> +	lm_meminfo_sub(addr, PUD_SIZE, PUD);
>   	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
>   		set_pmd(pmdp, pfn_pmd(pfn, prot));
> +	if (to_cont)
> +		lm_meminfo_add(addr, PUD_SIZE, CONT_PMD);
> +	else
> +		lm_meminfo_add(addr, PUD_SIZE, PMD);
>   
>   	/*
>   	 * Ensure the pmd entries are visible to the table walker by the time
> @@ -707,7 +822,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>   	if (!pud_present(pud))
>   		goto out;
>   	if (pud_leaf(pud)) {
> -		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
> +		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
>   		if (ret)
>   			goto out;
>   	}
> @@ -725,14 +840,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>   		goto out;
>   	if (pmd_leaf(pmd)) {
>   		if (pmd_cont(pmd))
> -			split_contpmd(pmdp);
> +			split_contpmd(addr, pmdp);
>   		/*
>   		 * PMD: If addr is PMD aligned then addr already describes a
>   		 * leaf boundary. Otherwise, split to contpte.
>   		 */
>   		if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>   			goto out;
> -		ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
> +		ret = split_pmd(addr, pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>   		if (ret)
>   			goto out;
>   	}
> @@ -749,7 +864,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>   	if (!pte_present(pte))
>   		goto out;
>   	if (pte_cont(pte))
> -		split_contpte(ptep);
> +		split_contpte(addr, ptep);
>   
>   out:
>   	return ret;
> @@ -856,7 +971,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>   	int ret = 0;
>   
>   	if (pud_leaf(pud))
> -		ret = split_pud(pudp, pud, gfp, false);
> +		ret = split_pud(addr, pudp, pud, gfp, false);
>   
>   	return ret;
>   }
> @@ -870,8 +985,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>   
>   	if (pmd_leaf(pmd)) {
>   		if (pmd_cont(pmd))
> -			split_contpmd(pmdp);
> -		ret = split_pmd(pmdp, pmd, gfp, false);
> +			split_contpmd(addr, pmdp);
> +		ret = split_pmd(addr, pmdp, pmd, gfp, false);
>   
>   		/*
>   		 * We have split the pmd directly to ptes so there is no need to
> @@ -889,7 +1004,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>   	pte_t pte = __ptep_get(ptep);
>   
>   	if (pte_cont(pte))
> -		split_contpte(ptep);
> +		split_contpte(addr, ptep);
>   
>   	return 0;
>   }
> @@ -1463,20 +1578,20 @@ static bool pgtable_range_aligned(unsigned long start, unsigned long end,
>   	return true;
>   }
>   
> -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>   				    unsigned long end, bool free_mapped,
>   				    struct vmem_altmap *altmap)
>   {
> -	pte_t *ptep, pte;
> +	pte_t pte;
>   
>   	do {
> -		ptep = pte_offset_kernel(pmdp, addr);
>   		pte = __ptep_get(ptep);
>   		if (pte_none(pte))
>   			continue;
>   
>   		WARN_ON(!pte_present(pte));
>   		__pte_clear(&init_mm, addr, ptep);
> +		lm_meminfo_sub(addr, PAGE_SIZE, PTE);
>   		if (free_mapped) {
>   			/* CONT blocks are not supported in the vmemmap */
>   			WARN_ON(pte_cont(pte));
> @@ -1485,19 +1600,39 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>   						PAGE_SIZE, altmap);
>   		}
>   		/* unmap_hotplug_range() flushes TLB for !free_mapped */
> -	} while (addr += PAGE_SIZE, addr < end);
> +	} while (ptep++, addr += PAGE_SIZE, addr < end);
> +}
> +
> +static void unmap_hotplug_cont_pte_range(pmd_t *pmdp, unsigned long addr,
> +					 unsigned long end, bool free_mapped,
> +					 struct vmem_altmap *altmap)
> +{
> +	unsigned long next;
> +	pte_t *ptep, pte;
> +
> +	do {
> +		next = pte_cont_addr_end(addr, end);
> +		ptep = pte_offset_kernel(pmdp, addr);
> +		pte = __ptep_get(ptep);
> +
> +		if (pte_present(pte) && pte_cont(pte)) {
> +			lm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
> +			lm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
> +		}
> +
> +		unmap_hotplug_pte_range(ptep, addr, next, free_mapped, altmap);
> +	} while (addr = next, addr < end);
>   }
>   
> -static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
> +static void unmap_hotplug_pmd_range(pmd_t *pmdp, unsigned long addr,
>   				    unsigned long end, bool free_mapped,
>   				    struct vmem_altmap *altmap)
>   {
>   	unsigned long next;
> -	pmd_t *pmdp, pmd;
> +	pmd_t pmd;
>   
>   	do {
>   		next = pmd_addr_end(addr, end);
> -		pmdp = pmd_offset(pudp, addr);
>   		pmd = READ_ONCE(*pmdp);
>   		if (pmd_none(pmd))
>   			continue;
> @@ -1505,6 +1640,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>   		WARN_ON(!pmd_present(pmd));
>   		if (pmd_leaf(pmd)) {
>   			pmd_clear(pmdp);
> +			lm_meminfo_sub(addr, PMD_SIZE, PMD);
>   			if (free_mapped) {
>   				/* CONT blocks are not supported in the vmemmap */
>   				WARN_ON(pmd_cont(pmd));
> @@ -1516,7 +1652,28 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>   			continue;
>   		}
>   		WARN_ON(!pmd_table(pmd));
> -		unmap_hotplug_pte_range(pmdp, addr, next, free_mapped, altmap);
> +		unmap_hotplug_cont_pte_range(pmdp, addr, next, free_mapped, altmap);
> +	} while (pmdp++, addr = next, addr < end);
> +}
> +
> +static void unmap_hotplug_cont_pmd_range(pud_t *pudp, unsigned long addr,
> +					 unsigned long end, bool free_mapped,
> +					 struct vmem_altmap *altmap)
> +{
> +	unsigned long next;
> +	pmd_t *pmdp, pmd;
> +
> +	do {
> +		next = pmd_cont_addr_end(addr, end);
> +		pmdp = pmd_offset(pudp, addr);
> +		pmd = READ_ONCE(*pmdp);
> +
> +		if (pmd_leaf(pmd) && pmd_cont(pmd)) {
> +			lm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
> +			lm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
> +		}
> +
> +		unmap_hotplug_pmd_range(pmdp, addr, next, free_mapped, altmap);
>   	} while (addr = next, addr < end);
>   }
>   
> @@ -1537,6 +1694,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
>   		WARN_ON(!pud_present(pud));
>   		if (pud_leaf(pud)) {
>   			pud_clear(pudp);
> +			lm_meminfo_sub(addr, PUD_SIZE, PUD);
>   			if (free_mapped) {
>   				flush_tlb_kernel_range(addr, addr + PUD_SIZE);
>   				free_hotplug_page_range(pud_page(pud),
> @@ -1546,7 +1704,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
>   			continue;
>   		}
>   		WARN_ON(!pud_table(pud));
> -		unmap_hotplug_pmd_range(pudp, addr, next, free_mapped, altmap);
> +		unmap_hotplug_cont_pmd_range(pudp, addr, next, free_mapped, altmap);
>   	} while (addr = next, addr < end);
>   }
>   


