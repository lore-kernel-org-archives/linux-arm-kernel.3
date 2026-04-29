Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5194FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d12rL33oYPWs6hkOPrbUd5zKN0MZLKvD1Y+BEQecPwg=; b=xeVQ5d7BrCfkpgNsKrI+oIFfVu
	2xScdFyNFHt9XWSiWf8rps4t+kTVLhppgsNPdLT2ilolN6t2g0ZdCokulAhmVUFK2WYgowz7eWZhP
	SR5YP9BPRKmsDOqy56wWiX7XSV88surldgb2izbYwmItj64MmqM2JRZP++HrNngjfTQoDrlTB/fY6
	nIXdus/j1tFbMAhNTGhUOqlYzwzy8ROA+ZTWFJcKpVGwR/Oqmxk1ivaRUX6Q0AXC/oq6Oq6jFByUk
	I2Rlljstg2ZaAizv598TfeJq0BJpT4itHrzT7th5/WcGB0iOxdkO/GOXdxuPPfeSwzoa74rnv1VcG
	sDLZQG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PK-00000003w9D-2PmU;
	Wed, 29 Apr 2026 17:09:06 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PF-00000003w7G-3hOH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6nme3mcP4BGY7I0xBDP0lL2uIZ2b93ZcEJcbNygFZkeAFCQ2XyPeug145JOTAyQh51IyFTeNT7Gi97EklII6MXEjunt0PsYur1ci+kIsFhkPHhi3rTHViTzp0n/LvxhX2Vjqvs5YjP3LEMmx/ofUvWoppXvP3gttrftrWIG6wh/Mdu4zdDETj9PN+42cYDK6QbuCRFEoGW5iuD/fz1h+01R06J3KGINRhW/nsacfxPLSmVrk6tLPxXnquLJFs/eT9IJ6vY4Ao+d+tiNTzNoSODFLdzDxDmmsckFivveP/zr4uqW4NEz00suxxm/UODRL6AOUWX+hxNzJd41QshteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d12rL33oYPWs6hkOPrbUd5zKN0MZLKvD1Y+BEQecPwg=;
 b=MpRfbY5G+pqCjfWGmMOGdojXl/U5hCsqwAXuZQqjHnVn+yVmevZR6bCi/pbUI6qLDQjP2uf/Bi+Ru/6bs6eVIGCA6/PnkNzR4d01gYKZihC2b40dakZfHrL90bN4dbQJw3Hepu9Gh5YsN3M6HHWiYwfts25pLFaN405pw9wUREaobFuM1O4TjiTVe2KArD2QadFZCpMjXH/URwKSa0TZ6ZK/WtW+RrYBe48tg+wfQfxINPmmTTG7GIjXn3fAm/GaLJYCnsSxKpQ+SMfMsbTb56CVH/PZxcF3HH2g1tHDij8jewiWRspa61DrGjPAwoRMlSR3eVqPLdtrP4CUqwSr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d12rL33oYPWs6hkOPrbUd5zKN0MZLKvD1Y+BEQecPwg=;
 b=iuMEXLCcwDjCOxb7L4O0kLhv2f3TUpbsMbjFa67IXepqCrgjq20+dYvR+rH3mABpyG+RVILkcV5c66VSdKwrzleDC+GG8EeFeDMtJw1wT2YtzPiFnh8Ac/tOwTAtz4cNWkX1LAFWQu7LprMY+ps30b7J/KzQ1dGMi65IwhMtJfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB6671.prod.exchangelabs.com (2603:10b6:806:18b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.26; Wed, 29 Apr 2026 17:08:53 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 17:08:53 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: cl@gentwo.org,
	dennis@kernel.org,
	tj@kernel.org,
	urezki@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	david@kernel.org,
	akpm@linux-foundation.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com
Cc: yang@os.amperecomputing.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] arm64: mm: enable percpu kernel page table
Date: Wed, 29 Apr 2026 10:04:29 -0700
Message-ID: <20260429170758.3018959-2-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260429170758.3018959-1-yang@os.amperecomputing.com>
References: <20260429170758.3018959-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:806:130::13) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA1PR01MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f421c8-5812-4495-fd6a-08dea611fd73
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info: 1DsDaLyYAM4NunAKMcDMLPYvQ9CYzgS6QTVUfTQ8bGybUGAsgd2oj67HucZ0EGE1TECfPtixIc9limc4Tauz2Ox7rzpL63OLKPs2i1I6f4omyJthletAMMR/eUgTgzHJy3A4+ogZ1T4/SxPAI6YE8x8geoCKg0Galr5ri6ZcBXLUlW2cnAeI5Z+FQAeGi4H+GMzjUcgj5Mg/qrqxiRQlpVi6w4fcQDs4FngX2IbRabL0DAtHwDYg8Uj0Rrna3nmAuyBJixQ1JWfGsMqjs7mJVliy0OV7Av1v0F820FyURycHcXlVTd8Kg6Jx824gmJHbb+ZORthu884dHQBip2YrJWI3Oq0DZ4qIGA0OsmE/0zI9JYIO4vKHtwDJjlLeopSa207y6dE46dHAZJvFXcPb1J59qIXfNu271Ie9V7qLn1Xf33IuT0uTs67sv9mTNhl3EmHPw4+leIziHSlK1/J6pEI+fXcXxBogOqjNtIlB5A4Z+m7UWKDqyY0GKUqDq8yLQRLMKyxE3c0s29519mj83luC9KW7+Jahun7FWjX11bOhYNHTKUuUFv4veol9mjsy3nTwfQJ4C1pX3dqWQR4rVPOZ+rEXXX8QkMyfARs/wiHQpJMHIKRqE6Jv21+oOvqN8Pb+eWXTKNKuoW7vAZuCWNY5LS9JYNpJVrZ94GPg5ZW1krgknKBierL5o25p8jlNFIlrMrzMZnQyYV2KLkCz7t8u0/LSS0oIV7imrNo7uQQ5+qCDFau0oZeUMukMWJRwOvAzyjiSbiZhuygkLQn6Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bnvfJxATqch3zoFTkN2iKbQ3KOhVJ6xj75ITm77I4x1L6DL4u9WpQ6ujZufy?=
 =?us-ascii?Q?8vGXBFf2kDPNPOA4bGv5/JmI3zq2tf+xq9F0QDxsh64W4OfKVtRHR3/gri8f?=
 =?us-ascii?Q?GroV3ojqxDmY+cugGQsbVbGTSFewJp9LOaXSGVjYKylIPLDl0BmkcGiPMzIf?=
 =?us-ascii?Q?j9IRwYbuUyYv1OxaXfJ0V2I3D76g+gdz5gVoaecYyFhbz51W1Y1aQi4Cjw/j?=
 =?us-ascii?Q?cP4UpcChMJv4OQ91jtrUYEjxR7HlMRqO/mrhthwBmdaZXww32u2N79Y9fbjU?=
 =?us-ascii?Q?3wRoxDVCaWDsLPTUxId8Kpm0J6OF+nOiMeiJ2jACrUPtMjG/7XaxG9Za8SRJ?=
 =?us-ascii?Q?lN0sw+5Ggb48tjDiBnTqeGR+j3RXSNO2yz8DvxYaMH75c1OifG7xkv4v2cjX?=
 =?us-ascii?Q?NHe52UL4jP/z5LZb2sQHOoVkVcT3w2eEaLbvsxMFtNZuPcuIStyWgx1tXwtv?=
 =?us-ascii?Q?1YwYrrDxOrmc/fNwhMqSbwv/aMxvPG+R/5Th8YSOdum8/X0t+YAZ5BGFSyWX?=
 =?us-ascii?Q?RTktPNS4vs5UCRMwrtlUNJ31BCZfohjJ1Yzl/JTSd9Ku6TujYEge7RfCvRsk?=
 =?us-ascii?Q?HvxW1cq2DWKA/Qqv+VrAIWunIQ5sxc1sjBQWgyPyjuLzQz9u/5SSZ3OIzpwa?=
 =?us-ascii?Q?EpbefJCfvyFtNNt9Y1536wbs3+lcGOZXWDuI4Wv00oSULHj7KLVUNf9S+m+b?=
 =?us-ascii?Q?POoyJFdI9G4/KyYgAyPyvbuJBD51qnHk0HHR819FqPWh9uyEQpVYLkhMc4md?=
 =?us-ascii?Q?XM/L2XmfSpcub9o0iN2zAzBCQGwZHdqUQSdqS07ppGrsC+HpzdMSfoept8Bw?=
 =?us-ascii?Q?l8IHMWKH2I8cJkGY3uBOrFK0aHaxg60Azw5Tj5956lkD1Am67FN1u7W1bbbe?=
 =?us-ascii?Q?W10gCvOFjD0ICoKeOZD5kaq14sVKBvlPauI76g54aENJ56rHC9iVGWarVnJ4?=
 =?us-ascii?Q?cQ8LKT3YdvfHYvVLaORN5nsk3ozeY4IJRFcunfzSab7c3uygYF9WbUpL8d0h?=
 =?us-ascii?Q?ZZ8Vwjh60jIRpWS1kRVXL4p2liKZy7XGh4gJPG23EdzSRDXapxJswJYzIo9/?=
 =?us-ascii?Q?fBtrHKjrNLsSd7R2og/Tm5jaG39XVO8CVUZbR0cNucVyEsH/bPC+6aBKWKQJ?=
 =?us-ascii?Q?k8kvbQzc33Dq7nYqVY5VifNxTtk9VG9q8ZytXuhjbWtSVPhub82NLTs1/YiR?=
 =?us-ascii?Q?IQzq6Orv1vatH93FsPQ51lcyGEzan9Li1nU9eMwG7cjKJo/mOwfd6bvGj/Mx?=
 =?us-ascii?Q?y9p/ylOn1uwgIqLn+D4Me5nujvNIQ2YqbrYJij+kWRnXAL/s/WERcETOuL32?=
 =?us-ascii?Q?rgjzUbs8l+TL/8Eh0rYaBz+CSMoD8Adsm7PxGwJZSpwhJfuUQ2BJ/VfFjcHg?=
 =?us-ascii?Q?rYrZfLSchR7qgTMysIJPreMY9jGYXGkFNYAu3nUR20SV2ljeZy1EVNv+XmE1?=
 =?us-ascii?Q?0ZSDVeuw3ygvf8U87vHXA/JjmmEnLwExSSGaGWTrCAcyBRJYG1MuvK2JV1Fj?=
 =?us-ascii?Q?Tlo1MHeI9aagsXb8ynIPe2hL4/jy8xAi99UFkrQDjiWHy7ZVgMfLWnx8zGgX?=
 =?us-ascii?Q?1WkbfWxQieaMsIeUpcbX1Pyo5r0is0TfkaCKeeqX0aGymVpPuJownVRy4k5L?=
 =?us-ascii?Q?/btXQaha7pSZEye3o3ETateBp3ZqwcybV7DOaiFc2aKy86iiBEHe1xMgdM7j?=
 =?us-ascii?Q?wC7amyOm8h/OirJQLugTkUa/cFw/1NpFgcePistdH3t4YYQbmba16ExsCFrr?=
 =?us-ascii?Q?MaAsUkoPz3jF2TmUNLN8xnC8RF8ZK/0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f421c8-5812-4495-fd6a-08dea611fd73
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:08:53.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/N7FKy+bWUEy2y9ESDl81SelqrfMOvqCvATCyFsMWw+PkuyIWrtGFYJCFf3AurBVFMbM1F4sK4cgnbdZYjVXchy3tir4UNSyvMcCVDlLgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_100901_924522_0B9422F3 
X-CRM114-Status: GOOD (  20.26  )
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

Currently all cpus share the same kernel page table (swapper_pg_dir),
this patch creates kernel page table for each cpu and each cpu uses its
own kernel page table.  The cpu 0 keeps using swapper_pg_dir.  All the
kernel page tables share the same content.  So we don't have to
duplicate the whole page table for all cpus, we just need to have
different pgd page for each cpu.  All kernel page table modification (split,
creation, deletion, etc) actually still happens on swapper_pg_dir, the
modification needs to be synchronized to other cpu's page tables when
the pgd level is modified.

The percpu page table can't be shared across cores, so clear cnp bit
too even though CNP is supported.

Some features may not work with it for now, for example, KPTI.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/mmu.h         |  1 +
 arch/arm64/include/asm/mmu_context.h |  6 +++-
 arch/arm64/include/asm/pgtable.h     |  3 ++
 arch/arm64/kernel/setup.c            |  3 ++
 arch/arm64/kernel/smp.c              |  8 +++++
 arch/arm64/mm/mmu.c                  | 53 ++++++++++++++++++++++++++++
 6 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 5e1211c540ab..8ed3b5f3cf84 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -63,6 +63,7 @@ static inline bool arm64_kernel_unmapped_at_el0(void)
 extern void arm64_memblock_init(void);
 extern void paging_init(void);
 extern void bootmem_init(void);
+extern void setup_percpu_pgd(void);
 extern void create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
 				   phys_addr_t size, pgprot_t prot);
 extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 803b68758152..0ee900eed612 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -27,6 +27,7 @@
 #include <asm/tlbflush.h>
 
 extern bool rodata_full;
+extern pgd_t *percpu_pgd[NR_CPUS];
 
 static inline void contextidr_thread_switch(struct task_struct *next)
 {
@@ -138,7 +139,10 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp);
 
 static inline void cpu_enable_swapper_cnp(void)
 {
-	__cpu_replace_ttbr1(lm_alias(swapper_pg_dir), true);
+	unsigned int cpu = smp_processor_id();
+	pgd_t *ttbr1 = percpu_pgd[cpu];
+
+	__cpu_replace_ttbr1(ttbr1, false);
 }
 
 static inline void cpu_replace_ttbr1(pgd_t *pgdp)
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4dfa42b7d053..38eec71ec383 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1216,6 +1216,9 @@ p4d_t *p4d_offset_lockless_folded(pgd_t *pgdp, pgd_t pgd, unsigned long addr)
 
 #endif  /* CONFIG_PGTABLE_LEVELS > 4 */
 
+#define ARCH_PAGE_TABLE_SYNC_MASK \
+	(pgtable_l5_enabled() ? PGTBL_PGD_MODIFIED : PGTBL_P4D_MODIFIED)
+
 #define pgd_ERROR(e)	\
 	pr_err("%s:%d: bad pgd %016llx.\n", __FILE__, __LINE__, pgd_val(e))
 
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2..6d420ad59af4 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -360,6 +360,9 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	smp_init_cpus();
 	smp_build_mpidr_hash();
 
+	/* Must be called after smp_init_cpus */
+	setup_percpu_pgd();
+
 #ifdef CONFIG_ARM64_SW_TTBR0_PAN
 	/*
 	 * Make sure init_thread_info.ttbr0 always generates translation
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..88a82eb56fb3 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -55,6 +55,8 @@
 
 #include <trace/events/ipi.h>
 
+extern void idmap_cpu_replace_ttbr1(phys_addr_t pgdir);
+
 /*
  * as from 2.5, kernels no longer have an init_tasks structure
  * so we need some other way of telling a new secondary core
@@ -198,6 +200,12 @@ asmlinkage notrace void secondary_start_kernel(void)
 	struct mm_struct *mm = &init_mm;
 	const struct cpu_operations *ops;
 	unsigned int cpu = smp_processor_id();
+	typedef void (ttbr_replace_func)(phys_addr_t);
+	ttbr_replace_func *replace_ttbr;
+
+	phys_addr_t ttbr1 = phys_to_ttbr(virt_to_phys(percpu_pgd[cpu]));
+	replace_ttbr = (void *)__pa_symbol(idmap_cpu_replace_ttbr1);
+	replace_ttbr(ttbr1);
 
 	/*
 	 * All kernel threads share the same mm context; grab a
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dd85e093ffdb..ed1545baa045 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -67,6 +67,59 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
 static DEFINE_SPINLOCK(swapper_pgdir_lock);
 static DEFINE_MUTEX(fixmap_lock);
 
+pgd_t *percpu_pgd[NR_CPUS] __ro_after_init;
+bool percpu_pgd_setup_done __ro_after_init = false;
+
+void __init setup_percpu_pgd(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		void *addr;
+
+		if (cpu == 0) {
+			percpu_pgd[cpu] = swapper_pg_dir;
+			continue;
+		}
+
+		addr = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+		if (!addr)
+			panic("Can't alloc percpu pgd\n");
+
+		memcpy(addr, (void *)swapper_pg_dir, PAGE_SIZE);
+		percpu_pgd[cpu] = (pgd_t *)addr;
+	}
+
+	dsb(ishst);
+
+	percpu_pgd_setup_done = true;
+}
+
+void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
+{
+	unsigned long addr, next;
+	int cpu;
+	pgd_t *pgdp = pgd_offset_k(start);
+	pgd_t pgd;
+	unsigned int index = pgd_index(start);
+
+	BUG_ON(start > end);
+
+	if (!percpu_pgd_setup_done)
+		return;
+
+	addr = start;
+	do {
+		pgd = READ_ONCE(*pgdp);
+		next = pgd_addr_end(addr, end);
+		for_each_possible_cpu(cpu) {
+			if (cpu == 0)
+				continue;
+			set_pgd(percpu_pgd[cpu] + index, pgd);
+		}
+	} while (pgdp++, index++, addr = next, addr != end);
+}
+
 void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
 {
 	pgd_t *fixmap_pgdp;
-- 
2.47.0


