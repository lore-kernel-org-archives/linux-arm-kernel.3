Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92E8C44513
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqPy7+ky7gV23SiopGjOcwW6j11A2L5Q4P86X1V4LrI=; b=VALLQiO6nMT3RFwnXWYRs9gW21
	EyQ++boKrqLAryK1yb2BO04RWAXfm6YoftA+H7sPE3gGmvqoOqVwCpqRvbSuQljB5cdZdKnPQf+h7
	BzjGZU6AedJaAZ0k/6rEKTvx1i9uvB5DT05eXbKLh0CMWtcXpTK23ljyZP2LxTTJIPIcogyncQx36
	moIVREi6XxE8q4X1jdayhXKxkYGiR0i7GExgGLjlnqXafB69/LG5HQ3J7fH0n0SoxpbP8ndFlU/b5
	cHASKOXPhpk8wcPurm+Pm04rCPiKZhB864IUL3OSbDdL0XpIzeUWnH7+VCB8s8cZVtN/R6kkkrcls
	bk3Xf9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zq-0000000FchS-45jG;
	Wed, 15 Jul 2026 18:06:14 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zb-0000000FcOH-2j0n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:06:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKgCLVjlW8P2yKcp7hbPDAHKkrzmWUSgyzH9g/oFmjlsNTCjq7O+9RFBTxL7CmHNmNZg29Vkd1sNVXoH5jdleBRE80CEpv3GQhcuEZgQw/MDEtXA27SIVF+HvichkBtMxab+QKzq6DwDvkT2F4s0NrxqPLakCII8J3KW22FyPuWIrZx/SBRk2le5vJwNl3G9SZH4IN1JE4/jCQrvSTut7Gv2X3/ggMaEcvPrpHPoZyNE1VqmdYGRLwYS/rf+ZoAomYD17glAhcnUDRQnacwhJtAwJhI9VHP28JmHh7xrOtYJgXXPowTdolxYZEZ9hYKa7ieTzm+/0Qqj6CY4P/hbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqPy7+ky7gV23SiopGjOcwW6j11A2L5Q4P86X1V4LrI=;
 b=CG+n0K++vVZ5XahGwPzWipPSzVX47L7Ef7Gn+sJkJhBMsNLxqQEf4Q9Wvq2ITECtQpUOaJuj66somk81wPfIG0DsXfD212gYy15DEpK8MDjoUqUaEFelBI2cuh9nf8OHtRp9xrh8Xozzs3LbD6vyyihoJ0FHIjOopOQoKPC+yo93f6ptku9zKtJaf+sZB1kgfLfTuOQVVFWGd71ude8PxFZIS1JzOVmoc1qaU6oy5HediYvVmHV06fTagvgjaMUZFih4covIR5HItkELFR8/wAfs67xk2/OlO8xLZvB2SeeOBrQk4j/yTKYLkdzMl5kEKCInu20C5y2p8yAl00VRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqPy7+ky7gV23SiopGjOcwW6j11A2L5Q4P86X1V4LrI=;
 b=CLqhFtx75v0vMX1IIBg/c30Dj/q4aYEvbQn97iO77SYhiKmnb/F4D7uCkc023jtwjeDFOZ3OdGO2eazPhuh5qzKlM5ShwVB1nguEFdlCc9xp5w+EK+J/9SDA4CDMaqLmkhlqi+702cZr/z5AxooM+XKMmPtYtbKm2D1eGHqUwbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7767.prod.exchangelabs.com (2603:10b6:408:170::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Wed, 15 Jul 2026 18:05:46 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 18:05:46 +0000
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
Subject: [PATCH 11/16] arm64: mm: map local percpu first chunk
Date: Wed, 15 Jul 2026 11:04:13 -0700
Message-ID: <20260715180455.515692-12-yang@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7cbf1262-dbc3-465c-e4b1-08dee29bb1a8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|10067099003|22082099003|55112099003|18002099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info: 7K1iSLciUox6EMUZnEbPa7x9VSSUSC0MtsKvsjkFlOjdOz38fASuMcDPBBA85prS/fw6p82V30zr6KDNi1ej8o/CF9nKYCurJS9lHA1fsXwjQ9CsYs74WK9Ej3NhDWy+fNgOE24DCcB0TuaA0wEFaRNhaeg4jbMywU2dTow8aIAbrZuEiq61CZn2HqymV8IhXj3qJ24utVEroRi4Vyou3V7efKe/gY+o6Cuorhlxc+QdPCXYc0VnIBOwYfXFGhI7lfk22alPAUlwI9C9rIxIYiYEffVPyViiSAf4FwxwhuILs6fIohbhrdmB6Jt513JFj5U/K5vDjk9RjLup+groQIApm3AyQpy9PeJpI/OQ3p5BVH4FaWnLXBGvmo9JTK/5/HyDqaJkK41Nr2MmtxRo60Zh+zc0B+HwlQYTcLyoo9EvcxTu4c3iO0P0sBynoSxU2dxs9uIbcRHg2hmSJfG5h2iKgHWzrt6hhdern9LK3XI7i3XbVuMGgXfYJ6ou5b1XTyWoMU56iak3R8pG7jN8B0vVcrJ7ZEXX8PGkCz6/NJaV8okl7lXYutpbXAONYZQS3MDe/Fkk+/vY4AMmZ32SwMbcseQBowXkl6klsDhBxcl3XELt3gEI6daSyyi5ETV5axzPs4nB4r7kyXDXUQFSMFZEsiTd2zqY1UyvMiJw4vkOhhT6bdnjxZhK4ENMYqg+QLbsw5rtfDXK61DplLWepA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(55112099003)(18002099003)(6133799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MamGYGrNabTudSSFf9xtlMv6vcX1/cs6BifFNRy+qth2qWS9j7+1sQ+USQ8/?=
 =?us-ascii?Q?1HKkpn3qx7bbk4xRkB6Cbv+bRW6vb+I5ooE5HqQslyz1ZB76/LNXZMLxn5GO?=
 =?us-ascii?Q?ov52ky4nLUl+bu064X5dn1Y8s8/XBiXjj7+QAbhCgFOVjgXpKJUF2eUp2HX5?=
 =?us-ascii?Q?Drvm4iGMOBSD4b43nxVZF76noCixi0rsuSXXHiiAt2gNi1xVggTGMR8/0BwE?=
 =?us-ascii?Q?zGI7AbtgDx4lcK70Sm1T2ITWUnXHRzoW7dfSMleRuc+Lp+jhQdyLScvX0f+m?=
 =?us-ascii?Q?4AIeFNJbhjg8SDHMRHEE+lkoYJVp7FLY22Ne54iYhX+Omq5tcpydWE370Pw0?=
 =?us-ascii?Q?xjwHDuGwWpfrIFy3puoAZW+0ZN49fow5z9z1Y4NCR1W1wR+w9XXA7XNxa1QP?=
 =?us-ascii?Q?UOg4iUreuzLT5XgSORntlNU0dkP/XBlzOxsN0XjxPB/EzOmg2UI28EvKcEx+?=
 =?us-ascii?Q?yQfKb0x1CuSqjQ6uiYYPMYY5DY1hLzGfp6GQrmzHqRzkWO/z8Y+ZPlimSMPG?=
 =?us-ascii?Q?pmM7uJaZMIi9LwzMafOp8nqVV56b28mMPYD07M+eBCdQf/2UQCSIgHC16cHT?=
 =?us-ascii?Q?aYtEHa1YGjAIysV+8H8Qs9QdoacTuDzzKlnaP6bbVDblXojtvZF3dNA7MHJs?=
 =?us-ascii?Q?rnlOv/hhfuVVy4EY/bqMoOjzYC1VpigbG9hClSZTBood0YGGARJrTM4kUkCY?=
 =?us-ascii?Q?T4Gk1XKoqvI4L3bGltEw1ytZMmRp5uyT4nYA1qAM27NMieJhvtu2YWhVef1O?=
 =?us-ascii?Q?aUbvB6V31jSdmoTeKszNvAmCXHwVnWGy+p+HlcdZeTwEm/Jn6t1NHrmR4R8c?=
 =?us-ascii?Q?tHhP2tXavW3vlyAKrVfA3onpnP26lVEBZiKAu+R1SxLbvEqVyIRAVcirM/9d?=
 =?us-ascii?Q?ja4QPMkERUr1lysrMpxO0xRLxPpnDdrXO2GsrlThgNdsm0Koheop5yLBFleZ?=
 =?us-ascii?Q?1jsfIDbKEIWgpjj7ZHRIhPnjvHCTS/bjf/oO9rCx25K+cdJQXYUm3y2+eEPK?=
 =?us-ascii?Q?rLVyLl4TWUq4Yo7qgjvu/fRfI1ju6vf3OARVNxKaQOcUdB6ge8M7fT1n3bJV?=
 =?us-ascii?Q?urftIrvq1Uho9mqBcEEm1kJlG01qgZkYZhS09eZq6BIRrbtKjrqRPh5VDCzl?=
 =?us-ascii?Q?bCGuoRr/xDboXuMNEpsL2g/arMEUnNQezmsaKNqLv/EY9Zc8p4jeyUtpF82e?=
 =?us-ascii?Q?mdKV3TxPumg21PEBKCoINKvLS6qD/7o8tvSVWdjLVNiwCz6uLNpIVAjLWJiv?=
 =?us-ascii?Q?jIjLojNcP0brc+Kgv5tWEL7kZ9a54OfhiOkHctAQLMHEFIM4jLDg5ZfhiA9L?=
 =?us-ascii?Q?fSY0Ls/Yf4tf3qzW45KAKxA50aEmzxz+UPlxMcx0jcXS5yeUfo8rw2GLPcnt?=
 =?us-ascii?Q?XJfmRABo1y7YCsa5hEZpIqAT7WHEs9DxQkNlk7UKBQWYLIYWsQmSst8EK51I?=
 =?us-ascii?Q?6jD9mOSMAnQRXA2yH1n7+kF/jn7IF/CC+czFqAOVaI7mS/LOAp9D0qAVfa6l?=
 =?us-ascii?Q?g6UAl81fCHdcqaAeLOVg6fQbXm1CJBbul/GiQmpZ7Hchs10Py1lA7/by/O75?=
 =?us-ascii?Q?fJszHsRo+TpYq85NHwnPRSvJ1N53yYVk2ZEiJaQKmb3b7MfzBwjGYd+HFjKQ?=
 =?us-ascii?Q?0VtSEasZFz2JmMwbj7iUFWe8nSg8JURvxACjdAdRF0FTosdwUzKfnNhOGtFS?=
 =?us-ascii?Q?4m64eGf9th5T3ppciMNaP9WqtG+3gPGvJzqb9LcY2GybIpleRLxwNo05GRyV?=
 =?us-ascii?Q?FFdGjzmhX7qjFdIREdlIYPussCWcuyc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbf1262-dbc3-465c-e4b1-08dee29bb1a8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:05:46.2964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMz8Ssj0ZoCn56/42crDsbanlCFBdkkwZkBUb2jvZVjR5wy5P55xaO5V4U/BpzHX4dr0nzYjOG4TKnL8yi5mDF7nBfGQnmrQ8AjecmmYsJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_110600_231123_D13E5149 
X-CRM114-Status: GOOD (  19.82  )
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

Allocate local percpu area and map to percpu page table for the first
chunk.

It doesn't work for PCPU_FC_EMBED because the percpu base adddress may
be in linear mapping space in this case, it will result in returning huge
offset for percpu allocator.  So percpu local map just can work with
PCPU_FC_PAGE which allocates percpu variables from vmalloc area or the
dedicated percpu area.  So unselect NEED_PER_CPU_EMBED_FIRST_CHUNK if
the architectures support percpu local map.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/Kconfig           |  1 -
 arch/arm64/include/asm/mmu.h |  4 ++++
 arch/arm64/kernel/smp.c      | 25 ++-----------------------
 arch/arm64/mm/mmu.c          | 23 +++++++++++++++++++++++
 mm/percpu-internal.h         | 11 +++++++++++
 mm/percpu.c                  | 16 ++++++++++++++++
 6 files changed, 56 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 23cad9fc7046..df55e6bdf81f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -242,7 +242,6 @@ config ARM64
 	select LOCK_MM_AND_FIND_VMA
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE
-	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select NEED_SG_DMA_LENGTH
 	select OF
diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 8ed3b5f3cf84..aa0818f7ec58 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -73,6 +73,10 @@ extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
 extern void mark_linear_text_alias_ro(void);
 extern int split_kernel_leaf_mapping(unsigned long start, unsigned long end);
 extern void linear_map_maybe_split_to_ptes(void);
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+extern void map_local_percpu_first_chunk(unsigned int cpu, unsigned long virt,
+				struct page **pages, unsigned int nr);
+#endif
 
 /*
  * This check is triggered during the early boot before the cpufeature
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 49524a7176b2..4c112bab8356 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -840,36 +840,15 @@ int early_cpu_to_node(int cpu)
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
 
-static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
-{
-	return node_distance(early_cpu_to_node(from), early_cpu_to_node(to));
-}
-
 void __init setup_per_cpu_areas(void)
 {
 	unsigned long delta;
 	unsigned int cpu;
 	int rc = -EINVAL;
 
-	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
-		/*
-		 * Always reserve area for module percpu variables.  That's
-		 * what the legacy allocator did.
-		 */
-		rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
-					    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE,
-					    pcpu_cpu_distance,
-					    early_cpu_to_node);
-#ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
-		if (rc < 0)
-			pr_warn("PERCPU: %s allocator failed (%d), falling back to page size\n",
-				   pcpu_fc_names[pcpu_chosen_fc], rc);
-#endif
-	}
-
 #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
-	if (rc < 0)
-		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE, early_cpu_to_node);
+	/* PCPU page table just can support PCPU_FC_PAGE */
+	rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE, early_cpu_to_node);
 #endif
 	if (rc < 0)
 		panic("Failed to initialize percpu areas (err=%d).", rc);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index f14ba512fd8f..ee4ab031ebf8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1080,6 +1080,29 @@ void __init linear_map_maybe_split_to_ptes(void)
 	}
 }
 
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+void __init map_local_percpu_first_chunk(unsigned int cpu, unsigned long virt,
+			    struct page **pages, unsigned int nr)
+{
+	int i, ret;
+	pgtbl_mod_mask mask = 0;
+
+	arch_enter_lazy_mmu_mode();
+
+	for (i = 0; i < nr; i++) {
+		phys_addr_t phys = page_to_phys(pages[i]);
+		ret = __create_pgd_mapping(percpu_pgd[cpu], phys, virt, PAGE_SIZE, PAGE_KERNEL,
+					   early_pgtable_alloc, NO_EXEC_MAPPINGS, &mask);
+		if (ret)
+			panic("Failed to create local percpu first chunk\n");
+
+		virt += PAGE_SIZE;
+	}
+
+	arch_leave_lazy_mmu_mode();
+}
+#endif
+
 /*
  * This function can only be used to modify existing table entries,
  * without allocating new levels of table. Note that this permits the
diff --git a/mm/percpu-internal.h b/mm/percpu-internal.h
index 8cbe039bf847..6d0542fb9e49 100644
--- a/mm/percpu-internal.h
+++ b/mm/percpu-internal.h
@@ -162,6 +162,17 @@ static inline size_t pcpu_obj_full_size(size_t size)
 	return size * num_possible_cpus() + extra_size;
 }
 
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+extern void __init map_local_percpu_first_chunk(unsigned int cpu, unsigned long virt,
+                            struct page **pages, unsigned int nr);
+#else
+static inline void __init map_local_percpu_first_chunk(unsigned int cpu, unsigned long virt,
+                            struct page **pages, unsigned int nr)
+{
+	return;
+}
+#endif
+
 #ifdef CONFIG_PERCPU_STATS
 
 #include <linux/spinlock.h>
diff --git a/mm/percpu.c b/mm/percpu.c
index b27828602c32..df2daa57309b 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3194,6 +3194,7 @@ void __init __weak pcpu_populate_pte(unsigned long addr)
 int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
 {
 	static struct vm_struct vm;
+	static struct vm_struct pcpu_vm;
 	struct pcpu_alloc_info *ai;
 	char psize_str[16];
 	int unit_pages;
@@ -3249,6 +3250,12 @@ int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t
 	vm.size = num_possible_cpus() * ai->unit_size;
 	vm_area_add_early(&vm);
 	kasan_populate_early_vm_area_shadow(vm.addr, vm.size);
+
+	pcpu_vm.flags = VM_ALLOC;
+	pcpu_vm.addr = (void *)ALIGN(LOCAL_PERCPU_START, PAGE_SIZE);
+	pcpu_vm.size = ai->unit_size;
+	vm_area_add_early(&pcpu_vm);
+	kasan_populate_early_vm_area_shadow(pcpu_vm.addr, pcpu_vm.size);
 #else
 	vm.flags = VM_ALLOC;
 	vm.size = num_possible_cpus() * ai->unit_size;
@@ -3256,6 +3263,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t
 #endif
 
 	for (unit = 0; unit < num_possible_cpus(); unit++) {
+		unsigned int cpu = ai->groups[0].cpu_map[unit];
 		unsigned long unit_addr =
 			(unsigned long)vm.addr + unit * ai->unit_size;
 
@@ -3272,6 +3280,14 @@ int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t
 
 		/* copy static data */
 		memcpy((void *)unit_addr, __per_cpu_start, ai->static_size);
+
+		/*
+		 * Map percpu data to PERCPU map.
+		 *
+		 * PCPU_FC_EMBED can't support it.
+		 */
+		map_local_percpu_first_chunk(cpu, (unsigned long)pcpu_vm.addr,
+				&pages[unit * unit_pages], unit_pages);
 	}
 
 	/* we're ready, commit */
-- 
2.47.0


