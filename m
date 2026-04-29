Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF27ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llOt8myS0tVUljaZQijMKsneO7ZccgsFHtUA/Ox/uU4=; b=2khV0dVUH+bnIzJJsC8d3o7Zla
	9SWxBMPYCSl8dboUDTaT2Rvpfq/vbG9bIO2u8N2j8AjtsqpCMaxCuca4AabsPDYG/gbuibTn4+5sn
	FE92gguOgaMfV3RFhGV3k94xVd0++0tJutGPuL+XGEBDJbYy3eeFBcKvMZ5kuNx9ThS6WvgYPsNmj
	cgFykZLz41JM9RhuFdcC0g52uT8IjGhTdUr+of1ELciicQoWpPBR16qD+ummP++lD4Ia75qttEFCa
	h9dGZMV4UTg0wGRdxhKlVORWuAzDV8WvfEUzQAC56oBhxdVIAITgelazzFv7V+QA1lgDsdMswtZOE
	UUj8iuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PU-00000003wDh-0r0d;
	Wed, 29 Apr 2026 17:09:16 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PJ-00000003w7G-0xPa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLDowJcavj6La5m0eCvUUklchtVrq7I5IM4iuzZ5viRXb6FrJ24kqebjGRFTH91VvDTLPNsSh3YhN5DvQM/QykDIaGIPOSp49il9uJM2zYabWaDCFO5gsho9/LhYuIiA5fHDK7ZN0MG+DRXq+gmy7uHpFMr+mMxw2pu2tdZrIkjUWmjvkNw2G5K6XIDkV/Bbm1RzIfA8fcBIDl5djCYs7c+WbEi3SZbTz2i5dOaZz0Fy7b4DtFRG/cmw1j8SmBRVhTVo6L/VqdmcQwQQr0YAlwM47CFcX44+mupaXua9b0Dh1vz2jrMLNjpKWqqhOX9+cgVn77MConLzaluRq44C0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llOt8myS0tVUljaZQijMKsneO7ZccgsFHtUA/Ox/uU4=;
 b=Sn7v4TCiKuLxFqQHXKyMtkXODrLA8CbfDsjhcVLulDtO1zC6b6xAsbSVkxSg4ICjeIUwnaPs4bKiq9nxx3jzVDRqrcWIIm54dP53VjHxNCdB1atrzI5ifcFhPVXqpgnVXsUa25nL+9HEVpuzMx7yXKGdTsF0RTb8qeo9qrB3yjybAQhqL/riUBElkYniwTaccGRLkH0KNkFJ4oqIhY3peimbhwAPwX9m5DZUiHb5iYjhjEp15CpOb9zejzuzp6g1nGmsNDLLc9BjAM4t1c/0IDVhKL9qfcZkVs5USER4Mpcxl4QYaR8j/CZnCLShDxt5Sws+DxWENJqFtkBLpEB00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llOt8myS0tVUljaZQijMKsneO7ZccgsFHtUA/Ox/uU4=;
 b=TikVcGlyAYFhG+goqEXAWCdhR3Bl1vyfBN6LE4psUJqGQBqrkM1JuXyAKjb+Mu+EsZBFY/gK12h57QuosXW8r5fqjfzj9bUNVtQM4RfItrcFvFo4PPwLNlQhC0eWgh2+tYkBaWBDdpZ4i6R6xwTlqA1PCYsaE0bPQ+SsOgf1bVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB6671.prod.exchangelabs.com (2603:10b6:806:18b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.26; Wed, 29 Apr 2026 17:08:57 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 17:08:57 +0000
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
Subject: [PATCH 03/11] arm64: smp: define setup_per_cpu_areas()
Date: Wed, 29 Apr 2026 10:04:31 -0700
Message-ID: <20260429170758.3018959-4-yang@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0ffee449-9840-4092-3ac9-08dea611ffb7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info: 5+7eRN0r4eDMqkaqSnOU3LgQKOlMWxyCv20DxgklCCF9PqqaOv+agKNKS1nkudHvss1BISm4JYM5gCjDVuiYGFvbdaERK3ylnD93UcuzTrOXohHDtT8nH9n3BZOIPdYifhiCuK40B6e9Nwb2D7sZGU2zUHQqCHar78dMo6IGrtyYkw4Zg42aUCGGJV5viqTYWUwnTjRYAHR1FTK1yjkT8EhuGjJsjUOTjdnLQUe+NWCglvKvRvUhDr618npvsVXBaEjfjtg8mAtmKg3iz/YWlcRrVmZNbaZ7qY2XKiM/LCAgbMEbPXy1RAgyd4aGqCfq4YkJodgzfYKJ08Hjamax54nNfuHr/k3T9L9aGSnBmkEx9/CDG02t1evNkXJQQ31ebsrvRrr0RAGieH1JkCU6sMHLryb1ofbE3LGzwRsTr6LWG7CUdiCuqXy6/QEE4swWd3XOTG1GsGub4DakQYtWmNxcqePMdJreat/5Haa9SQk+ovl1ub4eOueESsoJaICfk9cC4Nc0zOnMPpdh0JHKKkNGBU5r9ojEK1TwKM7anAzfx2dxQRFqwOEVt5Z522aLTTtWsfRngf89AFRtyJlPXuABj/PaBRkSE0D/krOcSH0pS8buxQ4iZzuD4P8Pd47NdRIGybfRaPYSVPAobczthngPHirPuFYywx4WE04iLiWPjhFFVd4wAP1mjT6tX/gszMzTUCJDr9uPbEARdEUAkC87O8CFuvxsYCTdh6qIznQYnwKKsAs/HIRYj9R9EL0JVT/1t28yVIKuqrtvjMMrVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f5Bf+y9j+M9/o4NoxQlec2r1/fxhUmWWK0cPyn4M/sWafdk9sKjJD6lW1vpw?=
 =?us-ascii?Q?joWKiuINOkPS3n/wB+nrItBaB7UtAEQiPzdgtnLk+x/dEyppUHobaD2ziWwV?=
 =?us-ascii?Q?PQ7Rk2rBaRXLRgX4IWhLJBKafYaf07K5qytRBlC1MMKjALKOozH/Hu8gz5qW?=
 =?us-ascii?Q?ZGezwYWi9t4hYEw+3w8lBHSwxgm21A0t5kd0X/ohOp14rRNGlr388xhA3PZa?=
 =?us-ascii?Q?pIPblRgSOSg48pz6GilFWtSo7KUqB/V6pwBW/x66Tbu+ZG5b7wAXBmYHd9SO?=
 =?us-ascii?Q?+crGtGRYTXchN8G/3WfuMb2/ISB5LhC3ogXpvpwSK2jVs3HeOESOxOZLMN6H?=
 =?us-ascii?Q?o8A9+COBmgOaxqBo251ltxKuVH0GYdwe6JuewLlCupIfDmnmY2Ej7CdaQ6wT?=
 =?us-ascii?Q?Xn2Xzc0h/ITX8Nx6T++hnd/dYJOY/Wr4Vf9FW5YjLY7byOIoiQJYKREdAhpF?=
 =?us-ascii?Q?o07Nafe+eac0kX8VCxWgE9a1laSUC0YgRbuwy1ajR0y8LI8VJqZzvncTCGNR?=
 =?us-ascii?Q?hfysAzaREuoa7630F7fevn3QGbbUO9AxyCALZreL3Jv3vp1at9uLFHqhXd1u?=
 =?us-ascii?Q?3KhZ7ijje9JGF5h5kiiUw7ivEJc8C2BgTwtgEFgXU4vQzWIYg6dD3nTWOGBl?=
 =?us-ascii?Q?/jwbft7KHDqY1DaWD4d28ibT8bthdAQRTpPo+IdIRh9XOtreIW+O7Hv4dE41?=
 =?us-ascii?Q?10a/pBhnTo6Fle6YATJqbelFiERk9L62VuOn6mkXfwdQyU/Bx3Pv2Z0cbkAt?=
 =?us-ascii?Q?s1YluFSuEvFg/Umz0XXcctUE34wEqdelxg2yifIXn//Um82vi+ifI2uEbWgs?=
 =?us-ascii?Q?4vv9g+wfb30ieIX6U93meVvIapgQjQkLm0s4YjcH8QE3NJsmaFcnBfn+1RnU?=
 =?us-ascii?Q?rahhobGpW3OdOU+v248tOqHA5GfXyUNUQjJi8REugSqqmmDjdvgVISHMk9DR?=
 =?us-ascii?Q?rE4m9OamnyZVG5E0daVaBKqEZROOuhcJyDUA2VfFUY+uq9+BKXCESegkknJm?=
 =?us-ascii?Q?DT5Yc+CwkspDadFUA+5vdHo1EcJNEdP4Vc1gjiTP05Z0lPa/ZK93wnP4rlts?=
 =?us-ascii?Q?vamFx7jMBRgtq1eyVU5edDu5N9E+g+VmMrnOKEMhrNL5bL/3wBwsq7QULAyt?=
 =?us-ascii?Q?xKNy2hOZui058yZ/9HMcn6ixnp8Fuq84JxSexXOaUN2TrPK3rG0fl47v4XIU?=
 =?us-ascii?Q?E81oXz23XwNeqfuf0Bl2gw3v3gi1iukHAmAAkOs3bt2+wiFf7fGP4dF98CZs?=
 =?us-ascii?Q?XA6ZkE/7uWcA96TQrmiVYZ6zxeX97tBXPXgJ7XQ6S3OE4tG1aluTadqYWOQj?=
 =?us-ascii?Q?9pxejxeU0fFZj7jutH8MInlB5RmHoJFJ8l0f5lT5atS4dmDyWBcTnQWRiPc2?=
 =?us-ascii?Q?KEYIzBjeEsSXYkh3g52uG42D7c8it9oTUSXGCFeylHOvajCwItmjGPYA9mwK?=
 =?us-ascii?Q?IHpDdIx7Yq576jzwlHqVWt0j+P1Z6oiZLhu4GDDsBHX+9CqK0kRcbK4S7L3X?=
 =?us-ascii?Q?y8WNX6lHF5CfM1Io/z1FH7OCbrAu0XEwrdrBZCG4PgUcOUOkznCuh5n4Y1pM?=
 =?us-ascii?Q?XA3vkKUv5Naa/7XZG9inIM+HqUF0RVUEn3wnn/ashPPP57zS/CQtnsuKBMlI?=
 =?us-ascii?Q?7cFjobYpJgraEShaEAwQ8AtI5B6BaeDdoPfE2TN/J2jL4C2LoVZmz8xKBeIV?=
 =?us-ascii?Q?/5SkGjvMQdNakLH//rxxr9KwOu3nSw/WQfJRXTtcHdvrcQgG8iiMBRgmh4AZ?=
 =?us-ascii?Q?J0jVA/yJGxQZWUd6DtBrnsya/lORLmg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffee449-9840-4092-3ac9-08dea611ffb7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:08:56.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94EIXaMcCNVVJX9vXxMBfKORZDfl60eJaudOcqnphwG8H991kHyG9bDSmkq8R7ySmf01Bez+dRfo2MLWvntPL3bZWL7Vy0FJJT0msKCjfT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_100905_271504_77D50897 
X-CRM114-Status: GOOD (  15.20  )
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

We need to modify setup_per_cpu_areas() to set up local percpu area for
arm64, the drivers/base/arch_numa.c implementation won't work anymore, so
moved it to the arm64 directory.  No functional change.

It looks like riscv is the only user of it after this change.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/kernel/smp.c  | 49 ++++++++++++++++++++++++++++++++++++++
 drivers/base/arch_numa.c | 51 +---------------------------------------
 2 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 88a82eb56fb3..0cc8f4a9efa7 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -821,6 +821,55 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
+extern int cpu_to_node_map[NR_CPUS];
+
+unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
+EXPORT_SYMBOL(__per_cpu_offset);
+
+int early_cpu_to_node(int cpu)
+{
+	return cpu_to_node_map[cpu];
+}
+
+static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
+{
+	return node_distance(early_cpu_to_node(from), early_cpu_to_node(to));
+}
+
+void __init setup_per_cpu_areas(void)
+{
+	unsigned long delta;
+	unsigned int cpu;
+	int rc = -EINVAL;
+
+	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
+		/*
+		 * Always reserve area for module percpu variables.  That's
+		 * what the legacy allocator did.
+		 */
+		rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
+					    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE,
+					    pcpu_cpu_distance,
+					    early_cpu_to_node);
+#ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
+		if (rc < 0)
+			pr_warn("PERCPU: %s allocator failed (%d), falling back to page size\n",
+				   pcpu_fc_names[pcpu_chosen_fc], rc);
+#endif
+	}
+
+#ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
+	if (rc < 0)
+		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE, early_cpu_to_node);
+#endif
+	if (rc < 0)
+		panic("Failed to initialize percpu areas (err=%d).", rc);
+
+	delta = (unsigned long)pcpu_base_addr - (unsigned long)__per_cpu_start;
+	for_each_possible_cpu(cpu)
+		__per_cpu_offset[cpu] = delta + pcpu_unit_offsets[cpu];
+}
+
 static const char *ipi_types[MAX_IPI] __tracepoint_string = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		= "Function call interrupts",
diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index c99f2ab105e5..b3b91ceed6a9 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -16,7 +16,7 @@
 
 #include <asm/sections.h>
 
-static int cpu_to_node_map[NR_CPUS] = { [0 ... NR_CPUS-1] = NUMA_NO_NODE };
+int cpu_to_node_map[NR_CPUS] = { [0 ... NR_CPUS-1] = NUMA_NO_NODE };
 
 bool numa_off;
 
@@ -140,55 +140,6 @@ void __init early_map_cpu_to_node(unsigned int cpu, int nid)
 		set_cpu_numa_node(cpu, nid);
 }
 
-#ifdef CONFIG_HAVE_SETUP_PER_CPU_AREA
-unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
-EXPORT_SYMBOL(__per_cpu_offset);
-
-int early_cpu_to_node(int cpu)
-{
-	return cpu_to_node_map[cpu];
-}
-
-static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
-{
-	return node_distance(early_cpu_to_node(from), early_cpu_to_node(to));
-}
-
-void __init setup_per_cpu_areas(void)
-{
-	unsigned long delta;
-	unsigned int cpu;
-	int rc = -EINVAL;
-
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
-#ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
-	if (rc < 0)
-		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE, early_cpu_to_node);
-#endif
-	if (rc < 0)
-		panic("Failed to initialize percpu areas (err=%d).", rc);
-
-	delta = (unsigned long)pcpu_base_addr - (unsigned long)__per_cpu_start;
-	for_each_possible_cpu(cpu)
-		__per_cpu_offset[cpu] = delta + pcpu_unit_offsets[cpu];
-}
-#endif
-
 /*
  * Initialize NODE_DATA for a node on the local memory
  */
-- 
2.47.0


