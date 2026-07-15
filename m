Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EA4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOgFm9qhOLb+wxgXOI82bcxMevK7QfzP0zeD96Jih54=; b=MB1RDZ1mGhI7qj66vjcJHA5veq
	9L3Rpiz1WRx2ypYXmCw7hMqBskh5Rt1TXRg9ZdyJmb42ptwHxyaLfnDGnevirBzQTOzQ8H5UaWLLF
	qbsKlQ9YkDaWEOIzO5R3KcVzhSkmhoNI+bAyz8x0pAoBgtolzj8YXc7CBSYbRKoXUU5lrC+LzVqG7
	NyxL3mJhL96R+a9h7f6jPqN38OT4UBNGmCudkbuXhjNtcPvJ6SOrn4nKBHthvVol33PPcCQMLti6z
	ZaG53rot+MLlWdCGmDxCeblqqal9C/ynSG0nUe9HwRa5/4SM2IK8GhQK2HemT4l42dQGIJdezT9tV
	mYgsE1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zr-0000000FciM-1NtX;
	Wed, 15 Jul 2026 18:06:15 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zd-0000000FcOH-2wAb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:06:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpLzghd/1svgM+rZwR9kzPcSz+ZVTh4TGvRZU3jKuhbZomeKHH/LBVhbsnWjF6GYK7sf1JParV+14euWMEYblQ5Hs/90hrVqyW3UtA4xtM59C+HT+HSP+JNgN97QpCZ0N3NuSpfLitlnQHoziaDIOcUT38sTFEvN5prO4VRFQl2rLa3PYlp4tzw3QtKzBc4PSi4Js6vudnAmTDYWhp9OEtHk6TIA/NZuuMYkP5ixaWPnHEXfU3d07Xxqt6R86UF7unBak4PJHgSxBO7lL9rflEGCQITi+JM1tVqVoSp3LFL6+sQib7+Jntxx/937wQrRvgB+G87T6abfBpNL5k6m3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOgFm9qhOLb+wxgXOI82bcxMevK7QfzP0zeD96Jih54=;
 b=YvMd4yS9v60bXWRK+Vv5PPnF1MtCHXdMwGuTB96YgT3kBAGPTSxVU7ttObLTlrywsKBCoEPGSXMlz8zaoqCUeDFlr0MnbH9oVKynHuqYhwamobElHbeyQ5IcuyvDl7Oe4++z8E3JIbxD+LsQ9wW53XA+6WioQp3smEEvzCQQNake/0878G2aI1d/g1Mvu3qtq+44Shluz2J++s3fTDU/oydRgylNvJeMiV5mpe9N7bQR1pLoTxNjTe5t/YZPhuQrHwPcxouVJsBDUBs6pZR2ERRJQNqT1FfASSru44pSNOVkUdkaK/NnTFOQxisOad6JkrXe8QrvCxQhH0eO0+LT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOgFm9qhOLb+wxgXOI82bcxMevK7QfzP0zeD96Jih54=;
 b=i5k1ZoJNNbidHuxd9Adl2ansOnBTAHdB/K4arTm9npbffwCJP3pKSSziZGyqO0PKPoNzrZ/KLmsOEuKiUlY4YGk5d+efnkJiMWy+NQQ+8ZbOAcESrSk/JXRyf9Cnaww3jox5fVomdBIdsDyu2ZJGZmFSxVxAC6tjJjNv7gZXBYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7767.prod.exchangelabs.com (2603:10b6:408:170::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Wed, 15 Jul 2026 18:05:49 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 18:05:48 +0000
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
Subject: [PATCH 13/16] arm64: mm: introduce __per_cpu_local_off
Date: Wed, 15 Jul 2026 11:04:15 -0700
Message-ID: <20260715180455.515692-14-yang@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: e21ce412-e5f0-4652-c497-08dee29bb33b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|10067099003|22082099003|55112099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: MdJ9UsjtkFBgleoxW644LKL+3oVFm4lssz2WzXGXFa6+QEh4JzSiejElE/MiufYnHIxIUI98ARsFEBAzKdE/QrG+xRm3f9apK/LOYxMdcpR/ZuBiCyzz4v0cFvbwOvb/oaRXpvX+0wNnOUn/77E/iFVRpOHjCmdYlW7t5GiY30t1vuzaaddPcs/WZyAc+ifZCLv51sns2Z3tKXl0QMN75f/72nE/y0SwMcGSMJK3TDwDGEMzGYlGEDkxzsFdwqPysrRruzN14BI4GbZquJnoJMtsQiA1Mm5VBTTafI6Ku0l3L8C80yoqYwCbKIb0HRP/UhD7CEDtUmUb1As2ztVtd9dEqtriOZf6UwhidAsYAkBdG+2BmHY9m0dsmP3MDsBLYLOpVLimojADeN7ccuJ4h87YepNVqIP1qE35/GklZSlzCluid8ayeUXmVcDxVLn3tIa9iHeF+hQY3r8VguDnedGq/uavJ8vRBGX06Fqd0o5r0IwMWObYFU83+6dIyyd5wYOKsFt9mkMmpLxiEdYm7F46XiHn8dMkd+df5nc6p3tLmuSdK5ZMDoD1esVebdQFFsdxqXnA+6xCe+iBdSbmR759j8d4r5vk6pdsU8Fq+Y3KumZPzAvntYkoakVVAwgWrKzTzeKBPhEVs+Y8ETWBEZtSAzvcQKNZAIHu/kN6A9XMY8oANTfgC9yd2n7eQw+UqEzAksPL1OgjoC0lppSVzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(55112099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+t/BFO+ONFdzWcUepU9k+YbMQ7AZF7pgsU2yALztcMPGEJJ7BfQrlAjrVbiY?=
 =?us-ascii?Q?Iy8kDuxduZBgIEToNv5lBp345iLx/ra04PoYnXFpRP4rzIPB1Z0xm8mqidXg?=
 =?us-ascii?Q?tsCzXdThg+4+wrY9agjVHBMzsg6vQl7KxmsaMqC5U5z0Ox9uLz1ooiGUFNX7?=
 =?us-ascii?Q?nQRtuKYYpHu9DLwt7kHeoKDpECVLiRupnP5ux3QQP1sr4rTzqN2Bsjiex7Kd?=
 =?us-ascii?Q?Px63l+/J1n3y1XtemFD7Q/tOimdYfI9hCSryXCIXSvTCafCo8egov2YKXGTy?=
 =?us-ascii?Q?H/QLO5ra4yObRSy3hzoYKeCMbhjQAXyX/9qjNWtPyl22Ts0PM5G/o+Lnjdyi?=
 =?us-ascii?Q?Yj/DpdRMyHZYjK8asA//pqZ4sj2LLi7oAAu6LtiKxXAef7SjDyrlMJmxIe4d?=
 =?us-ascii?Q?PeyMMIM8mUpn3B+y0rum77a3xRwKi3D1byzYURuwVWwJWRvuQk3Z6Sm4NPqU?=
 =?us-ascii?Q?BaVLIcV5O77EjI/11eDRz4G0gjwewtNAoN48d2zdY79nu8/lXE6PO63V0Xa8?=
 =?us-ascii?Q?1j1u15v2rcMUxb0mP8dX0uUrZhJ2Gjo5MplnJTConIRFdy7D1kweCYOsTRUX?=
 =?us-ascii?Q?r5W6CrW4oco5A2rwF/vW0QDr9dbOVhcNHdZYN0mFjWXVkoOHgbemqBloEpTr?=
 =?us-ascii?Q?FLKuxIsQWpukrdtyou8ccQNDPBj5yXchSpet5EYxgRGlrHTdoRx3ycl13Xha?=
 =?us-ascii?Q?248vkipvghonUT3tFzyEBhAc9uvDl8wOa1VqUjfOA35C+s/9VhnLbJ5bDXSi?=
 =?us-ascii?Q?S9EkHEqlZd0zDSGLza5PZkDaAS1lbPXhcjoM4a/DfNhg4rGAVSI8k/iuyp5t?=
 =?us-ascii?Q?SiZHkk7booFHa3446SKlhzG0fFgcy7T2+kZD9V1iXCdR/qqhjSjm6ihA3W8g?=
 =?us-ascii?Q?TD1dcqNaAl0mHUr26bzPt5eRQm1uvDC7eDm3PRr/Cys6r9WjtY/IfEneKetv?=
 =?us-ascii?Q?bg3e7R1S1oepvHM4AoZgVvYVlyplJ4GAX+xK/2yNOT5gFZ97mcSzHUY+wQ/1?=
 =?us-ascii?Q?gjyiDyk+gHBQRzyoWZ4F0gGmfKezckUj2b5jXO80hdaKZRMoecoKxuV1znpW?=
 =?us-ascii?Q?wY948Tgf308UB+Jtnx/j60cm1ihSyAeJUxbrZw1UW78BfVyGOVrQyYm9qhpq?=
 =?us-ascii?Q?fDXP6vFXJ3VTXHN4AQ62s6N+3qV3bHgnYSvx4Rutlj/xuYHGtBpa4/Jgg5KT?=
 =?us-ascii?Q?dBKKSLU1HSjfJzGQ80VKKgEZrVO8If+Ec5rfj4sUS6gddmCqiv8iDxxgW4Nn?=
 =?us-ascii?Q?Q1RWMnPRN+m6w2xV5sjnjY5EDSATA8j4CuXW0/yV/jUXFI+4VbCErW3QyHeb?=
 =?us-ascii?Q?R8+WR9UpvTOl/pdB0lqZKhOE0XhJlzLhCptGzKg8iv1eruFCaL/i/SW2CmuS?=
 =?us-ascii?Q?nvIa7tcOi07/J0QZBKjxVHcL0Id24PwQ5gnMYBpTQl/amUpPb7bvazlLuqlD?=
 =?us-ascii?Q?wqe0K1bUzwlBRmwhX7rd/PWPanBdyPYA8pr1lIVorluKpHtdukypkpotZLFi?=
 =?us-ascii?Q?AR9+AXqeWPcdvG8Gc2hfuqMd8KwboqcxAS6c19euIj+CGiHMe5eyzGQt1glk?=
 =?us-ascii?Q?w7W1Ryj5LMQEBNwNJtPr6qzTVKITrZTio1uSuzoLu4JlXqwCsTjTREV1m3Pp?=
 =?us-ascii?Q?th+vP3VtGXsD+l0RH3BB5Pc8GaIZhR0iSESokWpS9L2+cBdpCK4HOJQPbxBU?=
 =?us-ascii?Q?M1hwy/IITz68Cq7f3koyCpLB0Z6U3c9x0snlZHQUqUJW9tPrQcFtY2+oBEwn?=
 =?us-ascii?Q?n1ZElq1G6Civb9gKE4yVO6qFqyyB/ag=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21ce412-e5f0-4652-c497-08dee29bb33b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:05:48.9304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6hCLL4v7z+ydJltN+7y+gZpwzXg0QA+t4kcK9OKlpD9CusUjD5C8sdyhkA/9oavAN6e1dkQfaCr7O6x5szZ7P/SIh2D+AyIQWRQUPUuYi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_110601_860578_8E2BA961 
X-CRM114-Status: GOOD (  13.18  )
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

this_cpu_*() ops will use it to get the local percpu address.  It has
the same value for all CPUs.

Also introduce pcpu_local_base, which is the base address of local
percpu map.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/kernel/smp.c | 4 ++++
 include/linux/percpu.h  | 2 ++
 mm/percpu.c             | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 4c112bab8356..4a811379c191 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -839,6 +839,9 @@ int early_cpu_to_node(int cpu)
 #ifdef CONFIG_HAVE_SETUP_PER_CPU_AREA
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
+/* Used to calculate pcpu local address, the offset is same for all CPUs */
+unsigned long __per_cpu_local_off __ro_after_init;
+EXPORT_SYMBOL(__per_cpu_local_off);
 
 void __init setup_per_cpu_areas(void)
 {
@@ -856,6 +859,7 @@ void __init setup_per_cpu_areas(void)
 	delta = (unsigned long)pcpu_base_addr - (unsigned long)__per_cpu_start;
 	for_each_possible_cpu(cpu)
 		__per_cpu_offset[cpu] = delta + pcpu_unit_offsets[cpu];
+	__per_cpu_local_off = (unsigned long)pcpu_local_base - (unsigned long)__per_cpu_start;
 }
 #endif
 
diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 2f0e190aca29..5a27031dff1a 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -75,6 +75,8 @@
 
 extern void *pcpu_base_addr;
 extern const unsigned long *pcpu_unit_offsets;
+/* percpu local mapping base */
+extern void *pcpu_local_base;
 
 struct pcpu_group_info {
 	int			nr_units;	/* aligned # of units */
diff --git a/mm/percpu.c b/mm/percpu.c
index 15303611ecaf..8b273ed8e5a8 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -145,6 +145,8 @@ static unsigned int pcpu_high_unit_cpu __ro_after_init;
 
 /* the address of the first chunk which starts with the kernel static area */
 void *pcpu_base_addr __ro_after_init;
+/* The address of the first chunk local mapping */
+void *pcpu_local_base __ro_after_init;
 
 static const int *pcpu_unit_map __ro_after_init;		/* cpu -> unit */
 const unsigned long *pcpu_unit_offsets __ro_after_init;	/* cpu -> unit offset */
@@ -3305,6 +3307,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t
 		ai->reserved_size, ai->dyn_size);
 
 	pcpu_setup_first_chunk(ai, vm.addr, pcpu_vm.addr);
+	pcpu_local_base = pcpu_vm.addr;
 	goto out_free_ar;
 
 enomem:
-- 
2.47.0


