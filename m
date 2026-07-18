Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE25EC44521
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 23:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m44U+6L1O4z8Hmzgx+tNoydLhfUwaRmZxDdeJwg1qDo=; b=STBsLwTpbE2Lh/CZVo9NYqNVnU
	TU40zS0wE5r1jloo2MgZphwuc7sitQ3HLjQWZfcnyJKaQlYLKXmNN8rcxtS3jfHeuWYExs29brbYH
	BtLpy0jIvjKJ9oz5NujPs+zGHKjU91ANxQ9Q1irX9JNP2dZeiW4Bl0Gif+gzbliUalJngsI4k343+
	NBzHc50Q5eRoKD5KzsO8tNNgeqiTS5iyOP9etFw8PrIkMYj6N3t909WqGN5vaz2OA/Wd2D6+kicYa
	Mr29uleubxUnQgiyCm2j+6rB3ibzyZZiIkqnWoIfupBMbtmkMBoOPUpSUOwkew5F9KrsNnJJVYQ0X
	OevfLxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEGY-00000004amo-1CWp;
	Sat, 18 Jul 2026 23:16:18 +0000
Received: from mail-eastus2azon11010058.outbound.protection.outlook.com ([52.101.56.58] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEGV-00000004alX-0Fn6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 23:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMAJ970jcb/BYG7mj9hwJ7JG+hQqNSlrNbo6HOW0MV2zLcnIThMhiWa6NKqLvHkSKOx4WMfm2GP+fHLIHbfNLQfMlSzb8M5utekmS+uAnPed6DnhqC2KQ1WwAEwV9fs5Wd1Pwz/QpS73Jy8xyPH9/ryryfl99wB9YeKNqGYtgS/68o8n9F/8d/RJYa2Lm1Ef+bj5CnMbUEmM2EuIhnumYEvL85b9oRG1q32NFBgbdFyVswnzaQnO3qrvLjQ4VfOIrd/kc8mTXPizJAKEUZVzijFfO2ussVsYzjuV/l+bEfr52Lc7GBPjWhenLrpD6CkUZ1BTI8XkcOHvpl+gg8+Z5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m44U+6L1O4z8Hmzgx+tNoydLhfUwaRmZxDdeJwg1qDo=;
 b=wdsGg689lht5dXktE3EC8UwR/khHXR85QNrbH4GNtSlc9Yt0+KOtos1SCZOU8jApjAUkO6WrD4Gt1JLNB8HGoGdR9sjoUi3n8feL3uc6bnH5qvXOVMuRYPUPDF75bbdPKgrkL7GG16eNKlEilsrGt00JZS7xzFw0cjJMjbmeTF+BMgL6mRikUG9pp3rp1VmqrwaktZ5ioBq0cZ0nZEwqtiZRlXEOXkv3Hj0aEOnwVgbQo0chMl9EbjOiSokZeYAFF2nyWnGkQ91WCSQfIuGrvL2TmOp/mD56X25d5lSw2fpMzMPtjQ+GatHKvdTXVLB6ZHart2SJWf82GLWTgxEBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m44U+6L1O4z8Hmzgx+tNoydLhfUwaRmZxDdeJwg1qDo=;
 b=q3G21gisNqjulR24bMHGvmdU0lWe8k1lGAifcbyHToKupdOy5GP9Q6LRCXWZq+ab59rTW+1+iblreht8bBKBdiNx+2h2SIoohb6B7mXIsPLCHEr+XBBm+5cAKJTsNbNvUnOrmPgqXIt6aZGay0GWVOqxiKlV1hYfFzMGjb6gsjO/+b/T8niFjZfIUtMIMYD8M7e4B/8kz9O35Hymjb2wS10IFT6qGUhvOG43PaAh33WK0LtvGy2MjYTaqCyZ0amvRnhRUzKQUlBY4N/JV2mPsEALfGT9T9NTsaQAfEAi++rEOXzY0BMw/QH4gUQScibo4f9OVaqd2oXwSYrRwf65aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Sat, 18 Jul
 2026 23:16:07 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Sat, 18 Jul 2026
 23:16:07 +0000
Date: Sat, 18 Jul 2026 13:20:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, kevin.tian@intel.com,
	smostafa@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH v8 0/9] iommu/arm-smmu-v3: Adopt the crashed kernel's
 stream table for kdump
Message-ID: <20260718162052.GF699082@nvidia.com>
References: <cover.1783729633.git.nicolinc@nvidia.com>
 <alqh_NVatGn84o0i@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alqh_NVatGn84o0i@google.com>
X-ClientProxiedBy: BL1PR13CA0396.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: acb19f81-75f2-476d-29e7-08dee5228bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|10067099003|56012099006|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: UYfyhE0BQ8btnpWOLadtFBOjFTQu+1bjYay7Khh3BuvxbcJzbaZV1caZ/TenHjKW6nNs8jBkUpAlszWABPOB/rNfl6NEHj5mMRLHG7IzAM8FzngSanwWr4R1cVTLYAHbyI8piP0kjDPGJX05vp66C7hJ7Q5qb0J0DNWm274PwSUiUJelzOWTZgew0eTS17GPU19xFmTgjhMrgC+7tCaVaH6x4Tiqk7IN/1lGg/Ei2RgkD/py56No+AI752hCWPAVZG6kscEc1pFoAjUT0KMnmS72MBnr0Qr6AvM4VOw8n4nzwiGnM4QhS2UxxYUKPi+OULfQouDEMnR9bCr1bppbLL2Scb8EOgOWyXDSdhkgCCiZ9jYgo/WrFZIwJxxBS/RuFekddHvQ0RA9j8Mj5tC2v6IXLIIfxEHFhsgZCjuBB4GhcFVLyTcCZQc44V00J724Jsk9d0J7eJXGnoQmBrt9WM9pmA9mFgj47lMYZPabBg9tfGpomfcuyMiX8YyMiC9QqqXXf6xZazxg/Vx4owWUeHClObLB4z8RYUMnveR+JoMNdWhcGpKnt/pRI50kJuuE1n66vJSfph95/QIyx4wtqGls0AWkPIVzd4NxYyzZe923ru33Qjzq3B9eZ9b9SZOwZQ7dQY2BBDdc59vDngkKahVuhtZHCRAqMsa7RNvkvxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2SX2RFzfi7kUDbM2L9K/KfykjoQhoRJ2/lz5tEbv0al+gmMorACLKAlLF7wy?=
 =?us-ascii?Q?NPQs5geRgkxR/zNBpj8A3v/l00pWQUsv46Kzfh2yHeVZWcw/10/kpm+mCLne?=
 =?us-ascii?Q?xx4VRp6iS8rNrnO/kDkLUkzSxPiBltN9W80gIHxlcWoNsiYLDoT0c9C/HbL1?=
 =?us-ascii?Q?Bo9TBHTUZ+7VRVBQOLaLJapAuDfGH8zo0wbppshkWDRJ6bK1ExD/tpaQ6Vyp?=
 =?us-ascii?Q?M7LtgJxhYlM6PxEuDUV/tlb3lqcwvQ5IDkprgfXAzc2vow9Yb/l/tBV9p3OP?=
 =?us-ascii?Q?g7ZP+IAIlGodv+j6OA0JfHbC5ABqkPXvB+PXIT6MB7W0P6ULtINxHU4yWX6X?=
 =?us-ascii?Q?u03PtyjuNKRXCnHpGoN5IuwZR+RWInXMvuUwulJyA5HVzprOnrzOhKbTGvyA?=
 =?us-ascii?Q?qLtdsSpR7F6e04VZ1DJRFvuJaVg8M4lw74PMzOUhpEL02onyFcKPmwYcQgjT?=
 =?us-ascii?Q?6COudLG5mPOqPd6XWwwNZI6mKDlAAtXrHua/XtYK8bJuJb9INTDrCcOuA+Qg?=
 =?us-ascii?Q?MrOC77LtwDrbI0HbSDqjGhBLr8VQD6IqUTnWR/lcZWyfTlksRd64NgwOsTri?=
 =?us-ascii?Q?apXjhI4uorpzDyQTU0WZ89ZeZQi9Mpg5tSvch/jtzhoHG0k3hz9qBDIpB89w?=
 =?us-ascii?Q?niDx7iWVILlwnzsFBqLM9KDgw3y6R73lnJ3jmRyamcJRSSRugdsYUe4pExk0?=
 =?us-ascii?Q?vzQctjkEhIm8QYgimtsX95ysZDGdMgccPcE46dsUQuO3ujcCUn3GKkvIukS+?=
 =?us-ascii?Q?YgnfaYuBTj9LgVJHK7dGVSdH16424iW2Fp9KBIGjTOUXGConoT60t7MBrCXu?=
 =?us-ascii?Q?CbGM8AnmhVrNQvRoEDKRyw9oSMYewxDNN+/ExpZdtzGjJ9/Yl7hhI/jGucNV?=
 =?us-ascii?Q?bI65uCoD1CDfG//f8yU9FWbg+qdNY3Cn9Gzt8MRMsQfE+p1shfqc215wi0zo?=
 =?us-ascii?Q?M159wFX9DZ0YCamVonIrsPGcAZUFtZHudbV5VtH8E+uk3ibn1y11DxiQT4GX?=
 =?us-ascii?Q?1swatE7AzbGSoY5JwaB4HrwA4I0UWSHxw6cyJoH9mvpLwovOh+iXTIERK591?=
 =?us-ascii?Q?z696S1/dZYdsybRsRxIQEx2kTg2q6BjGFs10p9tDz4capg8TWF8NdP6jPvGA?=
 =?us-ascii?Q?qs8df+m/hux+7cXtowUlgfZmyn24nTy74aHHvxkTR8aY7xt9Du+UONFIxjdv?=
 =?us-ascii?Q?mQ4J6Z9hsYknamE33xc7H2VUe1BUrlX5YqQVtaj1VvgKbl/l3FB5iTTrFW7R?=
 =?us-ascii?Q?dcE44IO4x1/YU7bSJHCJRfkC2xWTgucEWIyYbBB2rSyyoepZr0VbOVpr0w/i?=
 =?us-ascii?Q?7+YYQTJoOPIUx0pgV5tID/1nA0Mc5jf90VJ9GGUK+v1rLePabNvyNefPJGAu?=
 =?us-ascii?Q?uy207zXOa2PewUG+gBOJBXqMWjHMuMtn/LwrTa1tgj/PcIxKRFk/tqtTcqDI?=
 =?us-ascii?Q?f/dkR/zhg9miAwF/ArV3dp1Kgc2QrJLn3xY1SqCdBQ2hjzCXBOHLkZTUjjFW?=
 =?us-ascii?Q?am1ajgaTDAyQ7/Vzztk2Ek4rX2YS8+VBeCCfG+Odn4QJH/1evKeq7LMCcrFW?=
 =?us-ascii?Q?lIMYN2doMA/rJ4p3L7a+wBNgOlzPZzof5TkQfsPcTwqYE6ST5IXLegV7U4F2?=
 =?us-ascii?Q?8FLVTbFA67uztPrC3rWdWcpV60xkhOHqoKlQubQTtopeluoQaBCNxnWiLVtT?=
 =?us-ascii?Q?rZj0j6DNukb6vJtEtRwlMt3Q5BUzq25A4zw00N3Afd+k25c6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb19f81-75f2-476d-29e7-08dee5228bef
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 23:16:07.4009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oulWE3ZS/Zrgz2KJoh83pbg0ki0PEI920M7+HotYQ0J5ZiTqiaanQZPpFR1fOlwB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_161615_124304_ED62A967 
X-CRM114-Status: GOOD (  11.90  )
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

On Fri, Jul 17, 2026 at 09:43:24PM +0000, Pranjal Shrivastava wrote:

> However, looking at your approach, I think I can slightly rework my 
> preservation logic and instead of bloating the KHO ABI with physical
> addresses, I could re-use your exact table-walking logic during probe
> to parse the live L1/L2 structures directly from registers, identify 
> the valid tables, and kho/dma_restore them. There could me small 
> differences though, for example instead of memremap stuff, we'd have to
> use the kho/dma_restore API (which can be done by passing some op like 
> the data structure writers we have?) Similarly, maybe reserving ASID/VMID 
> can be potentially re-used as well..

I think this will be true for all the iommu drivers as they pretty
much all have this same kind of kdumpish adoption logic in one way or
another.

> for KHO), I wanted to start a discussion to see if it makes sense to 
> factor this common code out into an arm-smmu-v3-kexec.c (or similar)?

Yeah maybe so

It sounds great this helps the live update project as well!

Jason

