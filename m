Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C00C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T82x0+tqCac5WC2NVMzpold+Q4C9KwJqzoGnFI9+n5E=; b=UvgMoMlOhs3oeQjD2toMuhVeIm
	H3se7ec/jB/aypNY2biRNKZ9UKt5Oq8ufwbyuGeim4oAOceN6mIg66FLw1XNZR37BPukMazeLf/4s
	F+LAl70RKDHXC6VwFNDGKY9QBuwzDfTa74hmQB8X8TC3qQKkmIOabkJhMl4DCfWh8+t1M0wiXOp/W
	HTg/bo+izrFryC4Ry91Hc1cgJiCnUM2nnqKBHBUeJOdYFeAS5nIRASO8LC7UiPi8iXRrw84ycyC+w
	AL/oXYvmLu0s1vGY6IEMWIW8TyhosxGlncbNRWbD+j/dXeKEGnxeZda2PzTF7oCosY+n87CWwGxtc
	wsTEi7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zq-0000000FcgQ-2NJB;
	Wed, 15 Jul 2026 18:06:14 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zX-0000000FcJK-1Nzw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:05:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUUoyg3iN1UgAZ+kb/P/e1Sjsex48PPTR6ERKqJn8t5CjHIMiuY5aFUZx5ch73y9fY4I+zsRgv3Byhckdo3VHZnwVZdflWwKv3rvQGVvHuLkJZ6BHFnb/wLNFnAvgBe0h2PYCC69Ntso969DavXJv4P885V21V4KJi/0sMzn7NxSDpLBlgBw0XHXr/HgkVj6ePh7DSWbaMU45LBLK+CvqgkjDxITLs+iAcYNwHO8oQ6LsCiqc+GI+vHCCdXW3CrZusuXFfVx4k34GHLKmD3teK4+0tL2FOx2/xIeGENXPGFKR6gyjpFn7x7kADjhT6j5XPWmrRO5W9vZ8iDqr5x8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T82x0+tqCac5WC2NVMzpold+Q4C9KwJqzoGnFI9+n5E=;
 b=G9Adg47TsPQAmnrI3F+4rEhmFBaHeorjElEtDVWX6vIQddWpD3n44EI2yUMiI6CBBbbjqGMkRZWSXQIg6X+o3kVROBZU/ID9dPkq9ARlmooswpLIsiQ/WTnl2fVrF1J10G+a8KA8sn3DLsklVG7Zfr0DjYinXBPsGbitAsNST6v68E6BEFuhn000d9ydISdKCB0xNYQmiuEFyzpqW/0yARWdOxf/hIt7d2KM+8VvSMiwXAeYARrcUDXA28lfYJ36QkLXV4p2vgCeU8NO9wa1Js+tPWWh5FTCiQ5/znHwJPMYUuJN277S6te8eBTItm2mZu77Ffe2DrbDuwxq4kZivA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T82x0+tqCac5WC2NVMzpold+Q4C9KwJqzoGnFI9+n5E=;
 b=EgrEr9BB4TUqXKZWfr2HxiLyHlxb4Dqchhq8WVCLOm4vnzqqJtuZkacYk+5kgNUPj/1ToDo8FIovl+ivMRZTv1HepOMMahChKp6iozsI/LaaFGBQHrFv7fMHZI5AVIKuLhzsUOcWapL6cNMQ7+QJYzcEkQr1CtR34aifmYNKpcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7767.prod.exchangelabs.com (2603:10b6:408:170::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Wed, 15 Jul 2026 18:05:43 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 18:05:43 +0000
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
Subject: [PATCH 09/16] arm64: mm: define percpu virtual space area
Date: Wed, 15 Jul 2026 11:04:11 -0700
Message-ID: <20260715180455.515692-10-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260715180455.515692-1-yang@os.amperecomputing.com>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:930:89::18) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV2PR01MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f093f5-5e61-4ce0-77b3-08dee29bb01b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|10067099003|22082099003|55112099003|18002099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info: Urdzy9ROeXGPhNuPLFw6vFTq8mdBBAo+2KSOcHQ9VwAOwFyJZ8SpkJNjGvUkjtfkldkqkKiYrFMLDx8s+15OeX3dYHPCk8fom4dyLuvSR+77RNVHBlfPga3UuoCxBv0w4sFeg0MfeBGdFXKXSqYhBLhFnCAvSyhOt1WNNhLbvGo42klamENjdc5dpWifzm0hm2jss90jVhzI11i1l4VAumYV/eMX9QK/NdIz4O3UGBiHjHglr0v/3jUIGq+1aexvkKWF2z6HRsSZ19fVA3sqdowgsKvrOWF5EewyaOuIqJVpbJEnWLF8zH+td3yAG+/jFPBVFK3j7AcSgCM0dZ8DYahVz89vv925CoRd4xD/ZfFET42WzlB7wGgt4Uk2CgQz191HO5qCE+HJb7M4f4mMvXYMFDfYUSAcNK2B/UvcKCuKzIXm5A7BJbcLT+egWCTdHgpeZUqn2n1tqDlK7Ob1Q4IFyBEhQyAwzkYEh2BTLzl/BBBxllEFkK1ehSwPzdCrVrO4AIj/QHJUkrqwTR3+A4Hvk0cjSIm5thFsooHWmO/7o71MWQwsdHVqvJ1iWbqHNVcQOupjyRKj0PXF6ScxGAsY9h1rxKPNJdheQLwoA0ux1QdeStIIQnGbnc5C3SP/pQmMMaPDyeGdD0MoTlm2byeDqmUEyqI4RSPnCAIh3G9l1/HORvoF4ttKhyliwc1DZ+sPMvq8XTELTy7D8/qmtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(55112099003)(18002099003)(6133799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/qUSn12XcCqHkJyVSLSpGtEfrAhmFaDFOY00PPrcSmdiaeE2sSEjZ1gAnFKh?=
 =?us-ascii?Q?RJ2guRDPMXrfoi8/wXxbHlfV1wpPvsaDJCOEonxtVOftrvFuNSXea9VfcAGe?=
 =?us-ascii?Q?+TcCf6uaJQnp3QXZIYUezf1MQSbtLpQqb7XNvYwOLX+60SAMvvObC0q/afN3?=
 =?us-ascii?Q?sqJrmmDRZumIzzaujlh0Vtrd61+bArabN3IbfeaH1RXUwd3D5863aaH+pjAw?=
 =?us-ascii?Q?FheOMjgOUYGYHPT7LO8LuRs+kgMPbHxzeLGOnjkV6c/kzlGA7lx9R/R9WXup?=
 =?us-ascii?Q?Leq1Saz+bRjGopFUNuGYFztJIP5g6PJqIGcYvfuJLJLsbTjYV9Yd2h6SiBv/?=
 =?us-ascii?Q?bpwa5TDch5xeZJHiecfaYg/3UdAzlPUvVUQsjoQhRBatHZMW5wHj/x/KrVFP?=
 =?us-ascii?Q?0tyVNtCQutH2woROOqY8DcEERdfv52gU8blJQ+WCQkUObgnIueXW+w1D34vj?=
 =?us-ascii?Q?IZL6wxqgnyE7taSDZsNX6ZKaoe8aqy+9qPsjwnaR3NkAYtHK3ILzW6FknqEn?=
 =?us-ascii?Q?XyToORVWDuNHmcPKPZt3LGrf8s5wSEfbbaK6xvqjg76bJsX0M5LwgAhM6Kbt?=
 =?us-ascii?Q?OCSwtRq13vDNkLe7NeDM5+z5+rqx9rd0AZaOqcsh9m7YLCR/yXqQz7jwM7v3?=
 =?us-ascii?Q?U1M3E7yNEgSUvoZ2vh2TEvAs/wHuPDGuRaHVx8O0o6keo1LJARPJNfWCtlzq?=
 =?us-ascii?Q?PCOOsc8vaB5ARyk/CRIhzJuLIggQJYwckQtoZz++SR9eQoKITnszvmt/SqWw?=
 =?us-ascii?Q?nj55YBpgBUXsVbL9SrgHjBHbtLHoChp41s6FTei079lbN0e+reNmajr8Phlf?=
 =?us-ascii?Q?UY7lUUAn9ayqegTmpR8uTLK1KoZfq4fGFgeNuRoqbn/Y8/OImHvPVyIJ3QxH?=
 =?us-ascii?Q?idu4EfzXImr9DwS/8dLlWJPiKAFBPMA2LjMHEQ+SNN0yn+ZlyWwqFwNWhPIk?=
 =?us-ascii?Q?kYWtYM4Pj+vr6ob5MC0Ejnddg3pfNwGTHwMiCJj2Fg51keyxNKbRJFXrYq+o?=
 =?us-ascii?Q?QRkPTVSeN9Jxt7G3Ag0+KPLbY7I/QyPRqiuXrepEFydJCu/tRH9iVyMH3ErM?=
 =?us-ascii?Q?hAVl3xOZnGrf0aNVCa3jyHFbbAE1esSB/U6rnoh/as5kNbaOTtoxkznV2Mu6?=
 =?us-ascii?Q?kVw0/SKMrB+Gpt4DNSQEB3RogbySrWVeLwIoI3Hsu76MuWd+bJ+bbo7PnlWl?=
 =?us-ascii?Q?hS2M4vYX8Dkwi+ExkL6uWd9Em1OSdfSTRo2CtDm2Akcd8mYcpCTb+xdbwbMx?=
 =?us-ascii?Q?QcWN/5nH/yGJMuBSUNwur5UoTMKfAF1GbSX04o2t77sMsucnLrqTNzvqHWJ0?=
 =?us-ascii?Q?f3hXCtj6SCecTKtwUuqh3BTLTrBc1msE50vy2sFp/i8Ob1iqWffH3AKOmn3H?=
 =?us-ascii?Q?Eu0VSHj39dUeD4A7Lj+lz3z0dwC67MIRfRDAzIOtpDPy4iMfYNquaQPFu8Or?=
 =?us-ascii?Q?D7rrnIyOpo5M6sUPeOH5KQS/lqne20RxT6YZ1AkIEXhFsc49bk32NY2DP8nw?=
 =?us-ascii?Q?gqAc/IRsblPHTrBVT88Msqt81fwmvAF4jEo7KXa8U7cagIUlAkjqU8d0OImO?=
 =?us-ascii?Q?71c7zHOLqJijr87OabOieZ9yQT0J2Ta8Va4Y3h7cH+fE9tbkn3RMpVTsZP/Y?=
 =?us-ascii?Q?wlAPouNzwgDV0Lbeowsjxnt4u816tAge4nZ4tUqA9ivPCsclJhvPPjzfaZHT?=
 =?us-ascii?Q?HLFtHgMI5WfQZ2y+AsWzJNfSyiEfviij7QAGLaBKW2BJXIZ5tl6y5msslbWN?=
 =?us-ascii?Q?VfPPXGL3GePp0Me1ciGwb2T/oHK4sEc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f093f5-5e61-4ce0-77b3-08dee29bb01b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:05:43.7917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZ4ndr603TnkDWJAsr8nBerlwEIcJtVQcvhuwoh2ABbWup9g74P80h+fYvrEzXZetzWY2si/w9JkxhLI36doqdI4+q0/kyY7jdpqMKbRfC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_110555_384332_77A86C6B 
X-CRM114-Status: GOOD (  18.25  )
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

The percpu allocator returns offset from percpu base address.  The
percpu base address is determined by the first chunk which is typically
in the low address of vmalloc space, however percpu varriables are
typically allocated from the high address of vmalloc space.  So the offset
could be quite big.  It may be the whole size of vmalloc space.  To support
local percpu mapping in order to optimize this_cpu_*() ops, the percpu
allocator needs to allocate memory from local percpu area too in the following
patch and the offset to local percpu base address must be same because
the offset returned by percpu allocator must be used to access both
global percpu and local percpu.

We can half vmalloc space to have either half dedicated to local percpu,
but it wastes too much address space.  So carve out dedicated global percpu
and local percpu areas.  Each area size is 2 * PGDIR_SIZE if page size is 4K.
It is 1TB with 4K page size, should be big enough for percpu.  It has different
size for 16K and 64K page size respectively.

The percpu areas are aligned to top level page table entry size in order to
just need to sync percpu page table at pgd level to minimize page table sync
overhead.

The kernel virtual address space layout now looks like:

+-----------------+
|  Linear mapping |
+-----------------+
|  Modules        |
+-----------------+
|  Vmalloc        |
+-----------------+
|  Global Percpu  |
+-----------------+
|  Local Percpu   |
+-----------------+
|  Vmemap         |
+-----------------+
|  PCI I/O        |
+-----------------+
|  Fixed map      |
+-----------------+

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/pgtable.h | 27 ++++++++++++++++++++++++---
 arch/arm64/mm/kasan_init.c       |  2 +-
 arch/arm64/mm/mmu.c              |  4 ++++
 arch/arm64/mm/ptdump.c           |  4 ++++
 4 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 13e069b01600..83cd65610d7f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -18,14 +18,35 @@
  * VMALLOC range.
  *
  * VMALLOC_START: beginning of the kernel vmalloc space
- * VMALLOC_END: extends to the available space below vmemmap
+ * VMALLOC_END: extends to the space below global percpu area
  */
 #define VMALLOC_START		(MODULES_END)
+#define VMALLOC_END		(PERCPU_START - SZ_8M)
+
+/*
+ * PERCPU range
+ *
+ * PERCPU_START: beginning of global percpu area
+ * PERCPU_END: end of global percpu area
+ * LOCAL_PERCPU_START: beginning of local percpu area
+ * LOCAL_PERCPU_END: end of local percpu area, extend to the available
+ *                   space below vmemmap
+ */
+#if defined(CONFIG_ARM64_4K_PAGES)
+#define PERCPU_SIZE		(2 * PGDIR_SIZE)
+#elif defined(CONFIG_ARM64_16K_PAGES)
+#define PERCPU_SIZE            (16 * PUD_SIZE)
+#elif defined(CONFIG_ARM64_64K_PAGES)
+#define PERCPU_SIZE            (PGDIR_SIZE)
+#endif
+#define PERCPU_START		(PERCPU_END - PERCPU_SIZE)
+#define PERCPU_END		(LOCAL_PERCPU_START)
+#define LOCAL_PERCPU_START	(LOCAL_PERCPU_END - PERCPU_SIZE)
 #if VA_BITS == VA_BITS_MIN
-#define VMALLOC_END		(VMEMMAP_START - SZ_8M)
+#define LOCAL_PERCPU_END	(ALIGN_DOWN(VMEMMAP_START, PERCPU_SIZE))
 #else
 #define VMEMMAP_UNUSED_NPAGES	((_PAGE_OFFSET(vabits_actual) - PAGE_OFFSET) >> PAGE_SHIFT)
-#define VMALLOC_END		(VMEMMAP_START + VMEMMAP_UNUSED_NPAGES * sizeof(struct page) - SZ_8M)
+#define LOCAL_PERCPU_END	(ALIGN_DOWN((VMEMMAP_START + VMEMMAP_UNUSED_NPAGES * sizeof(struct page)), PERCPU_SIZE))
 #endif
 
 #define vmemmap			((struct page *)VMEMMAP_START - (memstart_addr >> PAGE_SHIFT))
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 960020343760..a8e272bfefe1 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -324,7 +324,7 @@ static void __init kasan_init_shadow(void)
 
 	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
 
-	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
+	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)LOCAL_PERCPU_END);
 
 	/*
 	 * We are going to perform proper setup of shadow memory.
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e1290ccaa5be..f14ba512fd8f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -108,6 +108,10 @@ void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
 	if (!percpu_pgd_setup_done)
 		return;
 
+	/* Don't sync local percpu area page table */
+	if (start >= LOCAL_PERCPU_START && end < LOCAL_PERCPU_END)
+		return;
+
 	addr = start;
 	do {
 		pgd = READ_ONCE(*pgdp);
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 1c20144700d7..dd293319823e 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -389,6 +389,10 @@ static int __init ptdump_init(void)
 		{ MODULES_END,		"Modules end" },
 		{ VMALLOC_START,	"vmalloc() area" },
 		{ VMALLOC_END,		"vmalloc() end" },
+		{ PERCPU_START,		"Global percpu start" },
+		{ PERCPU_END,		"Global percpu end" },
+		{ LOCAL_PERCPU_START,	"Local percpu start" },
+		{ LOCAL_PERCPU_END,	"Local percpu end" },
 		{ vmemmap_start,	"vmemmap start" },
 		{ VMEMMAP_END,		"vmemmap end" },
 		{ PCI_IO_START,		"PCI I/O start" },
-- 
2.47.0


