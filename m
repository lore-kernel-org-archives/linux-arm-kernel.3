Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E47DC4450F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2t0BTW0L0KAqYei4Xv/1VSaBkyJwgz1/HwudPiGu9Y=; b=1mpt114KiSGtzT7IRzzcvbOFpM
	0qwipq3dMVELDYnAHqqk55Kmx0w5w5JGuhE1oSguh+lIyE0LlSiMYujzBcpWMeMh1c80mKnitoUJe
	gbz77xeiiK8nYDmCV9n1s0xtgSmfthDCGLe9DM1OApO0DhaPjCpngpvQtwYKeRo6Wy5TFhlK73h93
	9MZvr1mAvxUyRjJmp9Yfj8kaYfzGQoL6KCQ9f6zEu3UzO5fJ9k1Z+30SUztvUwlKZtgGizjl7PmBE
	jL+NybuPxBzE2YOxoINJTbJYJZaqZNOx5cRkgRqAhHW2BlFeLAPGOx+ASFQAnV6+LR7O6CLNy8b/S
	xh8ffilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zU-0000000FcLW-1RX4;
	Wed, 15 Jul 2026 18:05:52 +0000
Received: from mail-centralusazon11020137.outbound.protection.outlook.com ([52.101.61.137] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zO-0000000FcHk-2h70
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:05:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHnASWd8vyBC8va4caUr6TiSAo+5XhvERLlvBrjlJVz+l66uh8CSW2AJSrREIy0/24LJU6aHxws458zLMFm5p6yxpbQxPvqxw5KJkLWqmGlBw83+fSrybbjXBuQ1i32Dr6bMqVNzdflqdDLf6xiLI+T16BOybwIzZCxSlO6E/jrDBMIK+wWJZ3IzzlYWPGz7VdOjWAEcPpJaN5+dEOhXrjOg20/FwBt4tFQ84FTVFVWH/55KNRzzDVDlWlEhbSLjYpS1IitOVYgEvvsx541zdLELs5D2mZAT/xV+7c0t2e/Pidu4OE6ynxP9zjmx9ex0fCHDxGGZaYUXkJhbNxSVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2t0BTW0L0KAqYei4Xv/1VSaBkyJwgz1/HwudPiGu9Y=;
 b=UazEXMSm+Vj8e7bgTyjtpQX1nCa19+AsVoCLWZbLVDINvDVPtTD4DJV5FJOliQ/fqu67OESeV0LNgEmtcwibQtw1UthRMJ5yYpN4xqdaJrEN62B2By9FDLb93oP+JCGapovy2Djl6CPQYnM7zmUrzOTN4VSewERpyhbODQK53eSZQy/jvkd9+ODS+H2j9YgOUesq8pH23uZ9VqsYcB8GV3TftUp5TH9P9+aqe5moLsUob4u+DKtVku5ZNL65nqWWh0faEdbZ8PXX3tMuaghwK6Q3tfM0waXR/cmoXB8F4H5PNIHFObJ/Tx/rJa+zXHTEzOXT140IFzlyb5K/wExpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2t0BTW0L0KAqYei4Xv/1VSaBkyJwgz1/HwudPiGu9Y=;
 b=vGEY361Q8Ha5nj1T+MJfsCVXK1y1S59gyrDxOuN/rEBIRfDt3rs4sm9ZWD9YXaKGMqYsTbadoZNyZiA6oQaVttEAskCNAMYVBmfbACdZNILjVUjgq1Y/FD2cAQADxrWzgR1wShjHiDoptFTPz8oU1/2aXU9I0uW7eFRxf/HRZuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SJ0PR01MB6207.prod.exchangelabs.com (2603:10b6:a03:29d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.12; Wed, 15 Jul 2026 18:05:34 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 18:05:34 +0000
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
Subject: [PATCH 02/16] arm64: kconfig: make percpu related configs not depend on NUMA
Date: Wed, 15 Jul 2026 11:04:04 -0700
Message-ID: <20260715180455.515692-3-yang@os.amperecomputing.com>
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
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SJ0PR01MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb3fa7a-2e40-498c-3e96-08dee29baaaa
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|55112099003|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: bvw3/TQKLJ9gglh9ntO/D9ggaUYgfbwBQ7ejbyCdpdL5G7TFH/JQmNsZ5CwVi1dG15dPCUcrEGbAgKUv0iNEQ7ay+ZUfeOj/eMJyjR+RavckxdpTLb31Hn1Bi2G7myt/tF1lGGS8Nd5SEYkZBFuxepIOWWbPrFPmAd7MTwbw897B0eXLMEoWBi8VjxoQ9i3Ar8+QTk72uyC40wZ2MikV1B7RwsIBGib/rP3NLGsvs0owzJuEz6vt87b/vCntvzGNvHmRf17nm5HftNQsBnXlkuEuTkT3Hm4o7o1LAypmMbi2v5Xn1lWdTxK0/o0yYw0xYh74S3rgcnpdK4NWmlG+h+JbHSyii1FbTl2AcKeCa9MKfkKUJjyT8iqTRviRFkpyp0W4GKY1mF7emoeE2+vDJ3adfmZNlp7N+t2aDrDEtIf/VbOS2T8+sqs9hVB0HojVHhlDmltD39zBK6htAuqyQ0StJ6QenbFg9JlPeWCq9z9o0DgIPI5ZpO1oXF0I42tBxWfSZvHLObAKtYdS2xgQ3hZD7zv0CAXXZLdg0uHg2f8NzbopPaFhtw/HXhGlz1muXzVBxqjV0dvYWvL3IpHIt2axvZVx+eHkUqEQRWbVeZfy2wHSrbJV2mZIwX6XLoExKz76fH7x7hR/5wwArWY+xHsTJMC6KuY2nRtTwVxeqOUPYY+3QFNWS040AIc9lvma4VaracfLrjXMbn2uwsPZ/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(55112099003)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8sIQaHKMbPBNFzkR7JW9TdMpiyEs1UEylBb9Aza00mlUJSkM6WvuO7g42jam?=
 =?us-ascii?Q?Q9iR3vD5c5mPitO/eRSX6UAY7N8EwcVjdC/m6ira/SSFxL+jU1r3I7vzNIIC?=
 =?us-ascii?Q?KDCbX5NIa4v8XXz6XQxSOlakkXnKpvDBLDWVNRbjEIyHGwroiGe2pG+3A1iX?=
 =?us-ascii?Q?Hfunv/tRvgFrIF/PfEV0gX5DryQbRp9194RJNxnZ/byJUEUYVFqnpDAkoAKd?=
 =?us-ascii?Q?Z4VuUPGvd5DK0vS/wCP2qejZ92lhMZuIay+xt0GzZbtV2upt9cnMEXsmyJ10?=
 =?us-ascii?Q?xb/rfRv5UFzBp3dhdeV1tZMz+hqGKgAddSpPjXtPoMFAFP2YJ+MGFFTTJNiw?=
 =?us-ascii?Q?FzLIThYrCM4U+0CIpnNHzMlMZwpuztpLeSahuW9gK9EKOlA2v2f+hEl+CqXR?=
 =?us-ascii?Q?w/YcgpvUdk/Ddjqlr9hdgiSsfZi1eeNHC0R6u8mxNvJkBzfs5v3YaiwgW8KU?=
 =?us-ascii?Q?kexuET8bx4tAACTeuaNyGIxUJleN0qp5yFyOu+zgsxxERvKGd8CdykFdz2+8?=
 =?us-ascii?Q?OimmMd/VZadOyyIfESLx4d+8y1SixsB/dWNZWGysPEayhgR/R68nll2Ac4S/?=
 =?us-ascii?Q?Cs2VHLFLljO2ZaqYSVGNNCDS1cHnqG4F0v7QNx90uBMCdsCILAaDjcL2bbZR?=
 =?us-ascii?Q?XqWWq/vg9LPKJXOlJMECnnMoykZNVYFGikwVkyHUt5FQA5Px766OzBST6JZ2?=
 =?us-ascii?Q?Rr5z5h7jP/G2P8MC2zPiqQAKFCO4BNYsdtKEB02lNrdhyzMv9sAFFkVk5Mtp?=
 =?us-ascii?Q?CaqM91FwrG+KE2wCdQ+fXIQa7SS9vDWufIYazsDclT71tCcumb+iASLq0j4N?=
 =?us-ascii?Q?MVCyZpabJqE3DhGGEdC0tUBBDF0x21R27LCmEuS7Bs38aIy1zh74u7Y5tP4t?=
 =?us-ascii?Q?pMR07I4XW0231qfG1FCwN2lS1gggIhJ7hvU8uUB0XYxZoz8gX6NncWbjqT5Q?=
 =?us-ascii?Q?GPh6rBIzeBiURr6qXT66tnRiY2/Ugk/U4DPKFZydurQGiRpCYRJeaaHEt1cc?=
 =?us-ascii?Q?VMBvoxw1sq9ygCYqo7sm6YAfCm1JK1mVUyw8AmG0GucfOjkyxNkT1VnUNuNJ?=
 =?us-ascii?Q?IiWCuCSjK2tRRw0eShDFqx10koCj5eApi5tSw/m6BQvbm89BS8tKojjD5UPW?=
 =?us-ascii?Q?xjgr+uP78Y+vHyqNQKybDw5sAnQSh5ZaKvNC5GB0lMe3PDyyQ/aso+ku0qUw?=
 =?us-ascii?Q?XhyY8HDwwzQ/vg+UgzGE2Ioe8alfvspc2kFf7sIX9l+zDnOeRZGmj0pYSLBi?=
 =?us-ascii?Q?67xQxxwbUJQ8SgmcoVYBMokIOuqddA0D6l9NkBtQBPLPzxEPLvemO4O1PiXe?=
 =?us-ascii?Q?li+E/DA6hp4YHaUg4JDA131nzirTO1YLObpETzq7N5TlacR4lBKzrMoZDo7O?=
 =?us-ascii?Q?HjJS9DtfrdH0ALHgduog3B0MYnhx66jSmfiUqEctLHSD11UYoSR/7km4mwmt?=
 =?us-ascii?Q?2HREAr8htkDotTIRPsGxBvVTTZXF48SVaIzUiNJ3dqE31w0uzcMIGr4qhFDq?=
 =?us-ascii?Q?hKHNprJsUSklXvOt1Xak5a/9ua4of5D+Hap6IQnfvyquQIpQbi4pOb7xbpOE?=
 =?us-ascii?Q?13k+Cr1EMuB2i06bXJPGewVh6HdCtq89sPgXFGhl7qnqVXRoeDLl7uo3DR+u?=
 =?us-ascii?Q?eqgjuARFZul+ibNxEBtmjAGbTJDU1TEdpsA1X7kBDqSJgKiu66JxLe1adju4?=
 =?us-ascii?Q?+zBLQkTmz6D7WS0ttnw9Oc2Wvd1ILqhdkht3jzDGstzo7Mq4H624UwZ4Q36J?=
 =?us-ascii?Q?yzeSluiTCHv/fy+zHEqCSjFImlziLz8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb3fa7a-2e40-498c-3e96-08dee29baaaa
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:05:34.5653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33VfcPOiSP9nmCRigjHinJoK+xKOcPHTTZBZls7rqS794WA/RKCvsz6/SBvre48/Uqn6E/5emdDe9pAR0NnhYDJJDgjUN/icj1xw448xJH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_110547_109783_3FF14092 
X-CRM114-Status: GOOD (  10.29  )
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

The percpu set up code has been moved out of arch_numa.c, so it is
unnecessary to have percpu related kernel configs depend on NUMA.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/Kconfig      |  6 +++---
 arch/arm64/kernel/smp.c | 10 ++++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..2e1bd79a579c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -224,6 +224,7 @@ config ARM64
 	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_RSEQ
 	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
+	select HAVE_SETUP_PER_CPU_AREA
 	select HAVE_STACKPROTECTOR
 	select HAVE_STATIC_CALL if CFI
 	select HAVE_SYSCALL_TRACEPOINTS
@@ -239,6 +240,8 @@ config ARM64
 	select LOCK_MM_AND_FIND_VMA
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
+	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select NEED_SG_DMA_LENGTH
 	select OF
 	select OF_EARLY_FLATTREE
@@ -1581,9 +1584,6 @@ config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
 	select GENERIC_ARCH_NUMA
 	select OF_NUMA
-	select HAVE_SETUP_PER_CPU_AREA
-	select NEED_PER_CPU_EMBED_FIRST_CHUNK
-	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select USE_PERCPU_NUMA_NODE_ID
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 0dab4e9c97e4..28ff889658d3 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -819,16 +819,18 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
-#ifdef CONFIG_HAVE_SETUP_PER_CPU_AREA
+#ifdef CONFIG_NUMA
 extern int cpu_to_node_map[NR_CPUS];
 
-unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
-EXPORT_SYMBOL(__per_cpu_offset);
-
 int early_cpu_to_node(int cpu)
 {
 	return cpu_to_node_map[cpu];
 }
+#endif
+
+#ifdef CONFIG_HAVE_SETUP_PER_CPU_AREA
+unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
+EXPORT_SYMBOL(__per_cpu_offset);
 
 static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
 {
-- 
2.47.0


