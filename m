Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1FCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 22:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lO7Yif9xI0KI11ITjpHVGX4d1mbgQ6UJBD/g+Rb4okM=; b=GkQ04Lb/sKsSB7ENAXwjLq1UPy
	H/bgTfGstjlcUsv+TLmRQpptHJp7CU/x9J9W/popdeiS3lZusnemECs8uN4pQgZAvCPh+KyIXcirf
	ohaMCC+7WA+7+qTt87RUfhnTBQQwLoo4ScZxJSEdd77r8FTDZhhNDxIItKMQimMYNzJZv73IrP/wn
	Y3lgPa8n7rqIUDYn/ivXz1pL2QmM9BygG3Jq/BSesN8zHxvRlg0ZNz5gnZMOTBD0KU2Qol+s8W3NX
	NjFBzux8Y+/GiHHFOPa5DQSbp5jkFuXNfRzaC5K0HYMEsrJs/OhK+timmIBU1goc2eFq6d1TbP5bq
	Ev3LIgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdFQu-0000000Bzhf-3bfR;
	Fri, 26 Jun 2026 22:54:00 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdFQs-0000000Bzh8-2CFo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 22:53:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmRq3pAOipgB0gEHVei0VT5KA5d3Z5JRMHMuX8WSDwRZxn0jGUTfhJJ+ahFO4uGPlTeI9HG7YzY8IuLSH/sEIzT5U9M24gfBrwfLfuLoIgQpN8/wQva4vW8cucbcBzINgGVsH03yDJbBu98WqNJJx163E92r8HgL9hCPoN0zwRGQ8CPadgE6mgB7b40xipvFNInUjKivyz6cNwXz6u5ZR0Q2kEvoYs30uzOTnmdPqkJtJPAaKrQ5YU4nG7+NKUS+17sggpQs5f5e9sIDGFK0qs3ooHhK7JuipOzU+k0u6TxD/25xSNBcKmsHGOElihm9tmwGpoRGjxMVsOZlLCQ0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lO7Yif9xI0KI11ITjpHVGX4d1mbgQ6UJBD/g+Rb4okM=;
 b=XL3TOLnqaWHhYusI0XGw/+hcz3Uw0xhVc/rHb/rzXLbNZadY+gkuil8M1tGtHsRwqCHDZ/7FENu5HY0Lkkmoxs3sx/DlgqGnbBiT3/VBP2r/nCC86rPK0pjU32K2SvWh2xUbSUmGna958OuUsdGA7fF38Op/ZXsxUWLQWd+bLvt9qbwDa2H27G5+uuPfqOAcvIs5BaR8poP7lXu5n2eXBqUKg5ULx+kg8Uk7cIaM2VlwDlXfveJ2TUImiqELxauiM5Eikue1smvtoVfSX6I26u8gtireJLO/BgCJyMLZ749+DIAoFKpEBvgIjQ3TpEgsixixu/HljjWgA+httdtOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO7Yif9xI0KI11ITjpHVGX4d1mbgQ6UJBD/g+Rb4okM=;
 b=vFIsj0G6XDiasIETFCGPmqXA+L7m8iEhUKb3pDdYF+cq7g8Ny+jqy43JSTwf7IALCzBtlQVjChCuYX4VcUxLNi0zNUgsAZok/gK48RlA+/XXKQqFCDy5yTn3JtZSp67n4gfBuALQM6dVbYtfhfhbDwMnfYVzEsuggmGS0xCmmS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH7PR01MB7703.prod.exchangelabs.com (2603:10b6:510:1d6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Fri, 26 Jun 2026 22:53:51 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 22:53:51 +0000
Message-ID: <32e089d6-7832-4af3-87fc-c1d6bcdb5ba8@os.amperecomputing.com>
Date: Fri, 26 Jun 2026 15:53:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: refresh stale pmd snapshot after
 split_contpmd()
To: lirongqing <lirongqing@baidu.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625113953.2332-1-lirongqing@baidu.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20260625113953.2332-1-lirongqing@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8PR12CA0008.namprd12.prod.outlook.com
 (2603:10b6:930:4e::12) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH7PR01MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 0240443f-cbb0-403d-e979-08ded3d5ca49
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|921020|11063799006|56012099006|6133799003|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: m8M3osbClYo3c74vrdv1tXlYV4Ohs08ZIvjhDpWUiboh8ORoIXx0Eew9lIgO23fz86yglfVNPgldOIWnAMJipgYinBs3qD+OZSTFO3E2es8DWJxcXwvkV9fBp9QOlTrg3UosOvA1pAxCtNSS9ZT8gtaE9kvclJlPLuvvI2Oeso1ok0p+49d8M3OhG/xpaCQyKiwB+hQZIdBSFK9c9zeG/OPQMI2fJvuBCydkmfMgagAmwy9bHiPv/Wzhg+XIROKKVx1oceARJfDEW11xr37dWHpyAaqCHaG0L5GZ9g74Zcz2hhsD8vum2sZhURiRn3OSJ2fPPtXWuW38Z9BWPy9TmT7y0zZcJGQk51TrniUcqLPaRCjHHnIjzaD2Zr5Yrd334LmYFO0qyJXv5NpBv25AgZSG729g3jYk71Piro+izBgmh2jD/mQ0WQqd1DlNOsGv1uB9voSrxmDa1QMQPpb+nrlm6GapQu2TtXSt+msHLm2lKsRGlwSnnKN13pkgCiB98SZ2gW9HI/+8A3rcB0hfq7zaFUgI71lReMVTBEtipUaIJxVJK5JYA+XYzEfbwh2kG7qpe3gGDuqVQgLYwz5wN2bX8vUo43UWr52m3PWTFeBfDSi3J3P5C5xnYYEAN8upTTOzEtDzTMr+uz1noI3QxrgbTG9WmjrojDpF6FfMMsHTBG4oP5YIGkHGMF2cUOvrHqR831Vma+r+/Gu8UypIQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(921020)(11063799006)(56012099006)(6133799003)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWl4MUIwNVBsbUNEdHRFT1dlWXJOZWhFVmpMZW5BMEZYU3RrQms1cWJFcUQ5?=
 =?utf-8?B?TW9GenRSa1FSdDJCWjF6cWZkKzVXUEpTZHhUNlFVUFRmRHdFVFI1SUVvc2tI?=
 =?utf-8?B?OWVWOE9wcitrTncvUm5nMldFWDNKVTBhTnVQZzFidHRkYkUzQ3ZRbGZicmhw?=
 =?utf-8?B?ZXIrTTNlY1lkbWpQR3RzSjJ6Yk1pS2s2b0dJQmZ5MG5WK1JHd3FqQ0Y4R3g1?=
 =?utf-8?B?TGI4VVVwNFRDeUh0NXFLa0RUdk5CWDVXOUFtNENzYmZRaWtMeWExU1pHVERV?=
 =?utf-8?B?ZEU1STV3NGVyOFIraHJOWEM2b0xzWllBUEwzYXNWNS9XeFVPU0NmM0Z5OG1a?=
 =?utf-8?B?Mkl0cXN1YjloUzhna201VmZWbGt4NWZxSW5BUjMzVjNRaUxLaTJYL2dQRGxV?=
 =?utf-8?B?NWxWa2JqV3RBOTVmS2ZpbVMyTzk4SzFsSXZTSm5FNHMvTjdUeDRIRXNpc01i?=
 =?utf-8?B?a2JENFNLT2RManBTb0xaMVYrQ3dDUC9Sc3UxSmcwNlFTOXgwZlpEK244bmtV?=
 =?utf-8?B?SU5ZWFIyeUdrYnVlc04yUGt4RGhqSU44enMza0hyNHk0N1NubkphMTdaaEN1?=
 =?utf-8?B?QTNMV2tsc3U1a0laOGVyRWlodXUrQXB0ZWdUdTh5bGtyeHpkZEVMWmJ4YTRR?=
 =?utf-8?B?RnVNSEpwZWxFVk5LajNPdGx5THlUb0JpZ1hBRC91bzdOaUs2UENtMVY0Ly8w?=
 =?utf-8?B?c1A4OVhiZHpzd3NvMnp6Uk5IRTFjNDRvS0RURmV5ZndxM2M2end6TURlRDV0?=
 =?utf-8?B?YUNUOXNEeE9RTzMrS3o0WWEyQXh3WmhiTjNJTFJvOHgvNUJKck1Qc2pvOEpq?=
 =?utf-8?B?UUhWRDBJR2IwRHNsNytpbFlmY253VU5JR1dISDdwbkE5dHpKZTNMU28wa1k1?=
 =?utf-8?B?U3VjaFdIVThIaDVlV1RpTTdVMkdWVDRMWkl4Z0hyZXQ2ZHA3U3BCK3FWZmVC?=
 =?utf-8?B?YmU0MDlkcENvQVVYd09seG5QU29mN3FwZXlxQnk4ZEEyQXdaWi9IdGF5MkNp?=
 =?utf-8?B?NnVRSGdlUWxlay9zaXByTTcrSzF6NFFORVowN1Z6bm45encxNWUvT3BQQzFS?=
 =?utf-8?B?NzB4cHgyeUJLd0lsREkzM1ZZWWlzQjN2U1FjaEJIZTMrYzVROEoxRDJIOVpM?=
 =?utf-8?B?SThaOFF1OXlidzErZlZXVnBKdFdWTUhLbFZFTldGNDF3cTRmL2F2T2FOeFdO?=
 =?utf-8?B?SGJTUW9rZ2svUDVIQnpRZldwYkJ3aU9NZ0JBV2Z3WEJkUDN3U1Q3M29KYmtj?=
 =?utf-8?B?cnFIeDhwN21sR1UrSVB6Y0lNcnAxMjNib1d0Y0JYRzZZQmpWVUhXdWNuTHlG?=
 =?utf-8?B?NDBMN3ZLM1BVQ09jNzlPYkRXQlhZWUhpVUJxMUhkdHpOTzR0U2FqYjU3Tm1O?=
 =?utf-8?B?U3hGcjV6RW9tWWhsQzFZcVhyVHltclNjeWZrVUkzRXZQQXhaOGV6d1Fqd0JM?=
 =?utf-8?B?SmZ0a0VSRUMvM0M2RkpyYjhhNllHdTJCb01KM0cxR1oyQkxlMTdYVDEyd0tG?=
 =?utf-8?B?bGI0LzQ3SlRoN1I4Y3pkdEk2ZU5PdkhoM0M2cTZIc3c1WlRYL2RTcXhUUnhz?=
 =?utf-8?B?QmVXYlhzaHl3QmltaXQ1a2VtT3l4Vkt2TEw4bjdPd2l0aXdaSFRqR1ZFSEpa?=
 =?utf-8?B?V3oya1RIUzQyWjJxNUlDTm9Iem5oNmNhbUQ1ZkJ2TnJNZkxiL0Yyc0VIYnVz?=
 =?utf-8?B?NmhvRTI5SVErR1ovbFBmVWZpK1JTQnpKTVcrT1B5cnpaa08rTnRJSG5FWlpC?=
 =?utf-8?B?UTFoZWFVODVQVUJrY3hVc3ZVbTlPalV3NWQzSlZsUkZtSlRqWmYyUmxtQk9t?=
 =?utf-8?B?M0V4RVNBU0ozbUFnbDZyRUpkSFhMZ3pabmUvb3ZOajVuc1UrWVV6TWhNdUFs?=
 =?utf-8?B?WnBKeVJTbjI2YWtiaGQ0a1J6dE1nVlFuUlZOY2hJMnlGeDBnUkRqTHJnWEZ0?=
 =?utf-8?B?Q01KbCtyY3d4NXhUOXB0L2JGTGdJR0xZOW13SGk3aWR6ZEdLS1R5eHNLeFlk?=
 =?utf-8?B?ZGh1WDhML3g2Z2hWREpHOUVqUUZRSnFrVkNkL3IxZWtTY1krN2czbUM3OVlw?=
 =?utf-8?B?T0s1bGhkOUxZNXR4ZDBSbDB2SVFIQm8ycUNGOElPYVU1RU9jWUVKc25VMjQx?=
 =?utf-8?B?ZGdrOThTSHpvc0xKMERiS0R2OVNJOGt5cmJqRXdJblpodkRkcHlPSkNLQVBa?=
 =?utf-8?B?R21iQXBXVkN1UmdJcUJYeFNPRk1PTDRDQU9lUHkvdGRCeVdhc1FnbSt3eWlG?=
 =?utf-8?B?cGxIWFZ6b2tyeHdJTks4SzZWQkNBRFRETWc5ODlIQUU3U3QxMm44UWdmYUZu?=
 =?utf-8?B?RGlBNnI4MXRWeXBnNHRRUG9CU0hQVjhXZ0dCNkEwcVBacHYxanRPNW5ySXEy?=
 =?utf-8?Q?8hDx4cf99Dl5xtxE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0240443f-cbb0-403d-e979-08ded3d5ca49
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 22:53:51.0424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mALegiwGNmgKuJbVwf0EKaq1mnv1O3/Uh40+umdciveCT0xfsIhLRQKxKfN89lW79XIqiwbGBAOwD/hAsRRXiP4gHI2Wayx2KpeVQ9ez0xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_155358_576609_198E1BD0 
X-CRM114-Status: GOOD (  20.50  )
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



On 6/25/26 4:39 AM, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
>
> split_contpmd() modifies the pmd entries in-place by clearing the CONT
> bit, but the local 'pmd' variable still holds the old snapshot with CONT
> set. The subsequent split_pmd() call uses this stale value to derive the
> pgprot for the new PTE entries via pmd_pgprot(), causing the resulting
> PTEs to be populated with incorrect protection bits.

If I read the code correctly, CONT bit is cleared by split_pmd(), then 
the bit may be set again for PTEs if we want to have cont ptes. So I 
don't see any problem, did I miss something?

Thanks,
Yang

>
> Fix this by re-reading the pmd from memory after split_contpmd() returns
> in both call sites: split_kernel_leaf_mapping_locked() and
> split_to_ptes_pmd_entry().
>
> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>   arch/arm64/mm/mmu.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 12e862c..e510336 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -746,8 +746,10 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>   	if (!pmd_present(pmd))
>   		goto out;
>   	if (pmd_leaf(pmd)) {
> -		if (pmd_cont(pmd))
> +		if (pmd_cont(pmd)) {
>   			split_contpmd(pmdp);
> +			pmd = pmdp_get(pmdp);
> +		}
>   		/*
>   		 * PMD: If addr is PMD aligned then addr already describes a
>   		 * leaf boundary. Otherwise, split to contpte.
> @@ -891,8 +893,10 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>   	int ret = 0;
>   
>   	if (pmd_leaf(pmd)) {
> -		if (pmd_cont(pmd))
> +		if (pmd_cont(pmd)) {
>   			split_contpmd(pmdp);
> +			pmd = pmdp_get(pmdp);
> +		}
>   		ret = split_pmd(pmdp, pmd, gfp, false);
>   
>   		/*


