Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD66109190D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Mklnx57YIr1iiDE3OlGnFRnz50EoccTLYXpJqKwHiI=; b=IlWqlTOXU3LISsapq456i4ap1X
	Dckucc2GnR2W3JRr5vNYQzOmPXig6uaOMyYLkg7HeGRHoLg7hnQuFwQO7jgVknzJfskBvrq7hNS9j
	ET/owQwHTqQLHhCsFXYjkiPRFE5/F9R2BNRAlep52Ot7jrQUuOdvhEGFIO0PVYF/xsLQheW/dWKCy
	nvGwz3g6GPh3u8hBYoiVv5F7zg0HgVG9zPQIPQ4Op/bSck6bk/n8ta9AHM5s2vlRUf4aBSyz2eYBF
	rTkwFY6OongJ0M9aE2/1TWqczLoe1kUkYjdQiY0CNhba1a59WNftKBTwItn7EXCLj/xuKv+QC0Tst
	u03tW08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2z-0000000BJeT-3jJy;
	Thu, 19 Mar 2026 18:24:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2j-0000000BJE2-3E9d;
	Thu, 19 Mar 2026 18:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2Mklnx57YIr1iiDE3OlGnFRnz50EoccTLYXpJqKwHiI=; b=hjbPoGHnLPXkPinBf+P/7OZeX8
	+gdLkLgY07zzzSdOmWZjjFHQo3HwHrQfbUaKIxoFykPPfACqgFJLQDjXKv7Y/UJuT0L4azilFImMj
	RsgzKL84OlX/D5QOIdE8a6BqYrvDEGyTFDOBYH1nuAgRyhLE4dsl4NFOCSfWaikkHD0gJNOngMMfE
	E/CSjS8s9QwimtEtyg6RENDUaRYUJsoq1oaNA3znl7ZSCYAALHvav/03AnxyIqYxIvk9HnVOxE9pd
	tSrbTl1pBjCpwGCDnB3clPqSSru67shwr5p+rQ2IZhKWaw9AyNfGEw+x+9pq2dRkxvoABrnaagnGt
	ISrtEAFA==;
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2g-0000000EDx7-2xRD;
	Thu, 19 Mar 2026 18:24:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkEGhQGcGTFPDDixQgXShefw65STgtRoc02vCMiNZ5WgBaE1e7BFEa44aTK0WHpMZgxw+wE4JtfsloF327jTDptmE3LldPTsNgfNGVJEzCcHOKd8FRd05U0P2nYxJ8vE/N+QBracAQPc5nDsMSmekulJlub35IHOPNLJ6Upj+zQ0nWFiRl00crM+cqqDyGTumYz4v4itPTxPR8KF/mpCjg6rPzNfCsXZ8g3HuFYaCet1DSjrQFg8LClJoGO4tiOkLifMtE2J+8KUbZXA7KBUGLKEYFXSIMkONSXCoO5dCVJBgW24QS3qZbjsTCtsQngeAcV5UgHz8dCzTl/d588RaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Mklnx57YIr1iiDE3OlGnFRnz50EoccTLYXpJqKwHiI=;
 b=PGU1mW9Lb98DPemX4T6vzE7FeHsJqZ4zu0bb+qeTBKuvA5BhpX2tTt3PamAPj2xkC/ggagt7PxsKVhaW36z7rWeQEc/sb+T78FTrRtgOmdWRRiPT8YAZoJZ4iDZba8Rx2P/EiHWkTHt9uMk7/m6eTiJAR8lIHI8kvxUnOeM6vL6t/TMVLgRn8NbGpMBBKnVZcHIPxMHsTvHgF1H1Ny3tSd1CVY2leOCL4/ucxaLSRH7+CYBTB8IDHWHrdvsgaz9Xk6DiI7WAxN5g5Jq+aIH9Jk97aNKiP9hMBNeeo1XHlOCATcHRAUidNv6yhRmfmOqvV9zGY6YQ45KEEhCKFXHWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Mklnx57YIr1iiDE3OlGnFRnz50EoccTLYXpJqKwHiI=;
 b=UQVEcaTu2nQhz5aQoW11LBUxQQwhINeBEs7XSsiv/nQTHNEvy/QkfLZrclhwJlwIvPDbtf5eO52g5m1MFoZjJiNfz9kgHJ0yA4AVY+BefvJ7uve2GBOjX/IwM+gJ/v9tgp/V7stDgPutwZ0BwPfVXvD0LOWTz5fxQirM6DTzP9VC8veDTbOLOUOjCGnlKoL+Zbe8oc2U6xNcEznGUo87mGm+5/cfoaz5BFcmJrzyMm+57RPhdJl5183+ffkjeQQlv0clEUk+/yR23apr7KAUHz3JhLv3plUNMoxiuduDOyxFmwiJSudDKe3Dv8+46iMsPYvcfoBBR7skj2sZnmTWSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH1PR12MB9624.namprd12.prod.outlook.com (2603:10b6:610:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Thu, 19 Mar
 2026 18:24:06 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9723.016; Thu, 19 Mar 2026
 18:24:06 +0000
From: Zi Yan <ziy@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Gregory Price <gourry@gourry.net>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-mm@kvack.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Date: Thu, 19 Mar 2026 14:23:57 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <285BC754-4B98-481E-96CD-72F7865423D2@nvidia.com>
In-Reply-To: <feaf8a33-c716-418a-af32-aae4f1949a4b@kernel.org>
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
 <20260319-config_migration-v1-1-42270124966f@kernel.org>
 <abwVK8nLpSLVcT5G@gourry-fedora-PF4VCD3F>
 <e166588e-036c-4fa3-81fc-d7aca9f02c29@kernel.org>
 <1559C268-444B-4A64-A0B8-21B2FE49A5E2@nvidia.com>
 <feaf8a33-c716-418a-af32-aae4f1949a4b@kernel.org>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH1PR12MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: c3929525-cded-4ba0-1c6c-08de85e4b4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: LxKPkTxJ1bhknFa4fJVEkGLLvi5YFKTcFn15QjHv6y+byqTs4269HRrnHk8jZIZh9RdZ8KplUOV2Xg+w5ZLzAGaxsHEgLqGLWWsZgcFYRJra2nkUW3nyLHWWVGPy7KkAtKh5+iZamTlH6OXgW8wgzpR85w1sG9/rpTOeMz/D3pf823wUhS9/ajXzM/BVdA1xSDXpHAnHQICyRfi+B6GXh6w2eHFDUJwd5cUU8KAVNa9NylgtDoTKtYH8Bf4fs8hHapvjoSEMRkVMfQvnPpEgPDyWNA+Gsonm+OxjzCjxAW2RrGWKZ+j5WpTGB7CjIG4Vn2/Q1ytYs8E3eAj0wHO5XqBJboc4cMiaNgm+BurzAzC9KPrnNoXvXjiQbRZzIWlryQE4QjD3SfPKDQt7lRxO6NonpgmeAY/ZUdxvTmzwdNC1d+MzJsd3HPn56YKu3OhtB5IRAAb8vXlNDYBqbTv9Y1F9fvJ0MYpXimERXYyt+vPsPon8DgPRvfBuEAXyDpNbsBx9+zVCo2+e20GgXzBaV8WS+YDlvJtuqo4oGlLL4E8P1RgFdL2j0c/PAwF47TYpc5rt+N8FIs1D9OOZFlrMCscoIFrSNP1MSK3Q73X8NYrbArH6oZAr6M17bDsD6pGuUWlm/RyNA2nBUhnHJ9Wm/ZKnJY1yu2pDGvhN31POgNcaqgnG9xPf1QEneqL1wBeqyL5iMnzHLYaN+/jeJQv6IsKK8spzEnhisvs/UPYcAVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MprU0HWyElJKuIqYkXE5BjXyF/Jq2nahQsjDK4NBSFW6rCpJK/Pr0g1uJalj?=
 =?us-ascii?Q?+KaQ94KpyQvUElM6Jt6ZkhetNzmtxNc7sJGPYIx5rLGBLpU8RMApJv9gxXbW?=
 =?us-ascii?Q?82kXpcQWup8wCho6IlbBwZFi6FlcpwTZb3kBIAKbqTRhWNY9XHdwcUB+VaGR?=
 =?us-ascii?Q?kwsQnk+TUhYPSFwnZX8oggShYUZMysDoW73CSgjyZdY7pkAR4NO25QAmm5Gx?=
 =?us-ascii?Q?3iz4lZk9/pqpqTTZNlzVwtHt7mHdpo+wgVbPuzZKP04gRS7zg/l0P2AL3dLg?=
 =?us-ascii?Q?4sVeMtm+KSSgBZLla5ePfc0UTHbYIckHc53p0BhY2rY1QBiv3kHvUBW8cPHc?=
 =?us-ascii?Q?mgZ+YOBU2fK/p49Hc0UsKhBKQHZEjOrjunEfy0bt7k7Nj+3GFmap0OBfmRzY?=
 =?us-ascii?Q?ff8Ey5WDQ4B0VffacDSJQGWRAOlgrWOr6oLQaY8ULgPq2rPCXORWspVSVsxS?=
 =?us-ascii?Q?ux1CSzXvIXpwmnKMJ/XVALGSZ30FjObvRxywuh75VOfgBegk8QxtnuOH0Adj?=
 =?us-ascii?Q?XvA1j9IFN9FhuQSR76Amk0yaGe2UFzsQEMRbNubVYbK3wJxptzUchSRAI5fx?=
 =?us-ascii?Q?t3lvIIU/p8+34aS3/OFRMyLvKUf+RolqbCUkGnth5js+KH/DCz+s2/ci9qOE?=
 =?us-ascii?Q?H2kJWzU1fmUkqHJdGW7aNHySh+HN9T1xkQaEWc2iflnivHRVESxKS5SpNiB3?=
 =?us-ascii?Q?JlkN1YTwdwun0h9rI33gur6bbw7+3bKL3c/6EnDdGFY8hSxyA24US5atFX5o?=
 =?us-ascii?Q?7aj8EH/E/lxl63/qXUMIFppo2DvQw46ewu7/mIJ0FtTvY4I3vFwFSYI/UpZ1?=
 =?us-ascii?Q?LMI9rZwMcvk97ywItWfvGXOCAIjCp6Ewpi2Ua+YPb6YjJW4sEZML9V/JQBvk?=
 =?us-ascii?Q?TOPfzO8cphMcSrFS9v3DZSqHcmddjq0nu1RZO/oI6MzhBO/VeIhoVFJ1smrI?=
 =?us-ascii?Q?hBhMvJDcoRnxHllj9fnG6cqjOJsC8Ma6Y7yO0SEa+Dz9hyQhSNFnipateTU5?=
 =?us-ascii?Q?s3HuRr7fy5goG37mbhZq+iSPFRLM3XgQp3BPq0Aq/76e9C32mfD1bRK0ETer?=
 =?us-ascii?Q?we21FJOO29wMsO9b+WcbvXPUgs0dq12kjEJ8+OvDI1PB0BPm1Q6wPyWph02v?=
 =?us-ascii?Q?XSgazbGbBUZnEc00dMr+w5dln/vW9q6YDdDfY9VfrAWaWgmFXfK/bvffTlXJ?=
 =?us-ascii?Q?VwQ1XY0z6yihktEJ9zYk9vEN6BSoaHLZuYBqBfGzLfoZgUIaabfljxercqbe?=
 =?us-ascii?Q?O5LnlVVMN1itNlLHQWIuGcth4dh+fwhoVBn12QfzLHYTCStoT6QqRvpYnUrf?=
 =?us-ascii?Q?XgkPVx2MBHQ5BMJpPEAB87edQxmoOXYnDgX81QwruIJ4MoV9i4bs7oAyoPkF?=
 =?us-ascii?Q?hVlvOyJJ6izp2nF2vlN/BqbMS3GXVZmazGn62ubCU0ro6G3zSWCV2S5fo7sy?=
 =?us-ascii?Q?282OhlZ0/TfpqjWZ1OLfsDV8/R4TDMDycPRo/bbb0IXtlEYbFhFDrs/vXV4O?=
 =?us-ascii?Q?bYDvlsfb/k6ZngPj3tiOmUzA0Gs4Uby03atUaRzAHVq41azlu27gDf9Pi4qx?=
 =?us-ascii?Q?Ji8S0oHd2Q3Q/IFdllp4siEqw7LTnLdjeITNSr4N8CTC5qNc/kOV6VTF5fMp?=
 =?us-ascii?Q?iHnL99sTWzat6fd70yD8q2UlD1ow0cP8oOuMrygYa2bcxrgBRnwgOyJ1I+rU?=
 =?us-ascii?Q?VPHfbANyqKZ2MPhAS6e0pG7yMAZmYKYiGqMuLVKpqdFYvb0C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3929525-cded-4ba0-1c6c-08de85e4b4b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 18:24:06.6686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TlZZYiDcUu5D5bgdyLdrnKcTSvVjIkGwNDCy+HWpoRVWVd3DPchXAXDBnH5bUKqQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_182422_803504_C3604AF2 
X-CRM114-Status: GOOD (  14.21  )
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

On 19 Mar 2026, at 14:15, David Hildenbrand (Arm) wrote:

> On 3/19/26 19:12, Zi Yan wrote:
>> On 19 Mar 2026, at 14:08, David Hildenbrand (Arm) wrote:
>>
>>> On 3/19/26 16:24, Gregory Price wrote:
>>>>
>>>> HOTREMOVE has long been a thorn in my side, I appreciate you cleaning
>>>> this up.
>>>
>>> On a long cardrive today I was wondering: do we still need a separate
>>> MEMORY_HOTREMOVE
>>
>> You mean merge HOTREMOVE into HOTPLUG?
>
> Yes, only have a single config.
>
>> I wondered the same. Is there
>> a reason to only have HOTPLUG without HOTREMOVE?
> In the past some architectures (e.g., s390x) did not support HOTREMOVE.
> Then it made sense. I'm not sure if someone would want to build a kernel
> with HOTPLUG but not have the bit of overhead for unplug+migration.
>
> So I would guess nothing major speaks against it.

Sounds reasonable to me.

Best Regards,
Yan, Zi

