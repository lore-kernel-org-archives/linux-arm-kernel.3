Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E22FD4609
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 02:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zfLTltYqSe/ND3M3BYUM8dCDtPCvqn6CcMqbwUsZ0UM=; b=XLzm4cZpGCavw6NlpNVYsOLPtn
	Tv5DCtJqvuktuLAXgggtUuCwx6hIuZY7bo3qZUVaf1uvDIJcjfEdRuR3o23VUXo5AukEEek2zJozR
	hhq0+BbmIBCfJ3B8VIXzj2ZegcJIkou24YMrmVmKiwZy2mVeNCeriXwa+4E78cS728ND6OgQiqpWn
	J7hr3Vg86CPJwOsbApLwP+12qxDYuHe9UDpRcGZhIXtif0Im5Hdq6mMO2speCILqqZ6C6/T1+fV/L
	5Dv3SVgHbIqv9pSwvJshw7BWM3O1tWUnFl6EMIRRtlhuYC67jf7AggWQC/4Kfp0F4zI9W9rSsBj3Y
	Hju+QUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQnl-00000005E55-304X;
	Thu, 26 Feb 2026 02:08:29 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQnh-00000005E4L-3jxd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 02:08:28 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PNvr2F3277797;
	Thu, 26 Feb 2026 02:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=zfLTltYqSe/ND3M3BYUM8dCDtPCvq
	n6CcMqbwUsZ0UM=; b=IOQR4tXiUC1j4gvEUcN3KhzVGh6WAPlmJxZXu857cC+vg
	5PL01Euf8NdwKbKiqdqgIAq3s9c75XcMeKEYcke2Ank55+gYeHVN2oux4zt4VfJb
	phB3Gu0hKo2cBI+TFtHbLOBcVfKLj/zYsBa2S3NiSxAhe34Qu6x6MLrM0EAH29aB
	h2wsXf8tRM0M5gOyhTH3OvouS80RVAnGlrXNMzn47JHszacU7JNQnJNmBjXFGngf
	fL8KGIG765ODOK7OaT9Jy/0gi9oHXUIMVIfSi+nhO0aYmlCxMyNmdvZM48T4P5En
	olT8Zg9T3IX5XGIQFHd43zW6/my49OdTx/GrTiAmQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf4k5ydtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 02:08:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61Q01ANr012453;
	Thu, 26 Feb 2026 02:08:15 GMT
Received: from imran-metabox.au.oracle.com (dhcp-10-191-70-123.vpn.oracle.com [10.191.70.123])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4cf35g4s58-1;
	Thu, 26 Feb 2026 02:08:15 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: glider@google.com, elver@google.com, dvyukov@google.com,
        catalin.marinas@arm.com, will@kernel.org
Cc: kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: move early allocation of kfence pool after acpi table initialization.
Date: Thu, 26 Feb 2026 10:07:48 +0800
Message-Id: <20260226020748.1282208-1-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2602260017
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNyBTYWx0ZWRfX2TM68zV1/Igv
 ZBcYjFroWrZvAlnjZ/KbBpt9iL1lUGHL9kDrje7zIejD/opofl1Y6AOsbbE+5GsTLnFENk41E2H
 NczCtDRCgedaQyUiURiYG7lUBQY2KvLkvdBD+bpLMU2Edrp4+ifaCFRm8XuZdqKinxUAGTxKymb
 IeqsbOe04gvLs6RrWPo36yEWi4FZUc9GzAnxI9RcPiALdgO9KeS2bO4ppqJnzYPzvNNcqIkl3//
 LBlYZIGGaTnTtAhc5zmkq6DEgI1sVDHokDMSI+KxR2geU+myPqTkz7UNl5qCOQ+X4M1Qd0pmgkY
 41HKcNznto3lnkDb4dCK14mu0jMk0l3VWHtB1b2Ugt14W1vmOO4v7g3AsNhs8/TvVefvo1C2Ikq
 LBU5PV3Wbt3mRbPlLEo7qHm4hYCeQfhC8s7VQjPy+kWTlgCR7SaH6EO/xXRkghJFOF+j/AyCv6p
 XVDhdhhPbZWE5cLJJlxgrcn6F6qZmgBIerMeMZq0=
X-Proofpoint-GUID: AihCWpVNfZLyPvFnjNs5e6EBuo6MKpnA
X-Authority-Analysis: v=2.4 cv=b9C/I9Gx c=1 sm=1 tr=0 ts=699fab10 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=U-mDAgou2R5dctFzu_EA:9 cc=ntf
 awl=host:13810
X-Proofpoint-ORIG-GUID: AihCWpVNfZLyPvFnjNs5e6EBuo6MKpnA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_180825_936693_8CE83536 
X-CRM114-Status: GOOD (  16.21  )
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

Currently early allocation of kfence pool (arm64_kfence_alloc_pool) happens
before ACPI table parsing (acpi_boot_table_init) and hence the kfence pool
can overlap with area containing ACPI data.
For example on my setup I see that kfence pool of size 32MB is getting
allocated at physical address 0xc3c570000 and BGRT table is present at
0xc3e512018.
This is causing KFENCE to generate false positive reports.
For example trying to access BGRT binary attributes, reports errors like:

[  101.153638] ==================================================================
[  101.153639] BUG: KFENCE: use-after-free read in __pi_memcpy_generic+0x14c/0x230
[  101.153639]
[  101.153642] Use-after-free read at 0x000000002b4fde1e (in kfence-#252):
[  101.153643]  __pi_memcpy_generic+0x14c/0x230
[  101.153645]  sysfs_kf_bin_read+0x70/0x140
[  101.153647]  kernfs_file_read_iter+0xac/0x220
[  101.153649]  kernfs_fop_read_iter+0x30/0x80
[  101.153651]  copy_splice_read+0x1f0/0x400
[  101.153653]  do_splice_read+0x84/0x1a0
[  101.153655]  splice_direct_to_actor+0xb4/0x2a0
[  101.153657]  do_splice_direct+0x70/0x100
[  101.153659]  do_sendfile+0x360/0x400
[  101.153661]  __arm64_sys_sendfile64+0x70/0x1c0
[  101.153663]  invoke_syscall+0x70/0x160
[  101.153664]  el0_svc_common.constprop.0+0x108/0x140
[  101.153666]  do_el0_svc+0x24/0x60
[  101.153667]  el0_svc+0x38/0x160
[  101.153669]  el0t_64_sync_handler+0xb8/0x100
[  101.153670]  el0t_64_sync+0x19c/0x1a0
[  101.153671]
[  101.153672] kfence-#252: 0x00000000e0140f78-0x00000000451bb320, size=256, cache=maple_node
[  101.153672]
[  101.153674] allocated by task 8328 on cpu 0 at 99.989222s (1.164452s ago):
[  101.153679]  mas_alloc_nodes+0x138/0x180
[  101.153682]  mas_store_gfp+0x198/0x3e0
[  101.153684]  do_vmi_align_munmap+0x168/0x320
[  101.153687]  do_vmi_munmap+0xb8/0x1c0
[  101.153689]  __vm_munmap+0xdc/0x1e0
[  101.153691]  __arm64_sys_munmap+0x28/0x60
[  101.153693]  invoke_syscall+0x70/0x160
[  101.153695]  el0_svc_common.constprop.0+0x108/0x140
[  101.153696]  do_el0_svc+0x24/0x60
[  101.153697]  el0_svc+0x38/0x160
[  101.153699]  el0t_64_sync_handler+0xb8/0x100
[  101.153701]  el0t_64_sync+0x19c/0x1a0
[  101.153702]
[  101.153702] freed by task 0 on cpu 0 at 100.057612s (1.096089s ago):
[  101.153722]  __rcu_free_sheaf_prepare+0x11c/0x260
[  101.153723]  rcu_free_sheaf+0x2c/0x140
[  101.153725]  rcu_do_batch+0x158/0x560
[  101.153727]  rcu_core+0x110/0x220
[  101.153728]  rcu_core_si+0x18/0x40
[  101.153729]  handle_softirqs+0x128/0x340
[  101.153731]  __do_softirq+0x1c/0x34
[  101.153732]  ____do_softirq+0x18/0x38

The place of warning remains the same but freer and allocator stacks can
differ.

Moving early allocation of kfence pool, after ACPI table initialization,
avoids the above mentioned overlap and prevents false positive reports
such as the one above.

Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
---
 arch/arm64/include/asm/kfence.h |  9 +++++++++
 arch/arm64/kernel/setup.c       |  7 +++++++
 arch/arm64/mm/mmu.c             | 13 ++-----------
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kfence.h b/arch/arm64/include/asm/kfence.h
index 21dbc9dda7478..25c66f8059d6d 100644
--- a/arch/arm64/include/asm/kfence.h
+++ b/arch/arm64/include/asm/kfence.h
@@ -19,6 +19,11 @@ static inline bool kfence_protect_page(unsigned long addr, bool protect)
 
 #ifdef CONFIG_KFENCE
 extern bool kfence_early_init;
+
+extern phys_addr_t arm64_kfence_alloc_pool(void);
+
+extern void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp);
+
 static inline bool arm64_kfence_can_set_direct_map(void)
 {
 	return !kfence_early_init;
@@ -26,6 +31,10 @@ static inline bool arm64_kfence_can_set_direct_map(void)
 bool arch_kfence_init_pool(void);
 #else /* CONFIG_KFENCE */
 static inline bool arm64_kfence_can_set_direct_map(void) { return false; }
+
+static inline phys_addr_t arm64_kfence_alloc_pool(void) { return 0; }
+
+static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) { }
 #endif /* CONFIG_KFENCE */
 
 #endif /* __ASM_KFENCE_H */
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2a..2e9ec94cd4d5b 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -32,6 +32,7 @@
 #include <linux/sched/task.h>
 #include <linux/scs.h>
 #include <linux/mm.h>
+#include <linux/kfence.h>
 
 #include <asm/acpi.h>
 #include <asm/fixmap.h>
@@ -54,6 +55,7 @@
 #include <asm/efi.h>
 #include <asm/xen/hypervisor.h>
 #include <asm/mmu_context.h>
+#include <asm/kfence.h>
 
 static int num_standard_resources;
 static struct resource *standard_resources;
@@ -280,6 +282,8 @@ u64 cpu_logical_map(unsigned int cpu)
 
 void __init __no_sanitize_address setup_arch(char **cmdline_p)
 {
+	phys_addr_t early_kfence_pool;
+
 	setup_initial_init_mm(_text, _etext, _edata, _end);
 
 	*cmdline_p = boot_command_line;
@@ -341,6 +345,9 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	if (acpi_disabled)
 		unflatten_device_tree();
 
+	early_kfence_pool = arm64_kfence_alloc_pool();
+	arm64_kfence_map_pool(early_kfence_pool, swapper_pg_dir);
+
 	bootmem_init();
 
 	kasan_init();
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a6a00accf4f93..5a7215daa9ce5 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1048,7 +1048,7 @@ static int __init parse_kfence_early_init(char *arg)
 }
 early_param("kfence.sample_interval", parse_kfence_early_init);
 
-static phys_addr_t __init arm64_kfence_alloc_pool(void)
+phys_addr_t __init arm64_kfence_alloc_pool(void)
 {
 	phys_addr_t kfence_pool;
 
@@ -1068,7 +1068,7 @@ static phys_addr_t __init arm64_kfence_alloc_pool(void)
 	return kfence_pool;
 }
 
-static void __init arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp)
+void __init arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp)
 {
 	if (!kfence_pool)
 		return;
@@ -1107,11 +1107,6 @@ bool arch_kfence_init_pool(void)
 
 	return !ret;
 }
-#else /* CONFIG_KFENCE */
-
-static inline phys_addr_t arm64_kfence_alloc_pool(void) { return 0; }
-static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) { }
-
 #endif /* CONFIG_KFENCE */
 
 static void __init map_mem(pgd_t *pgdp)
@@ -1120,7 +1115,6 @@ static void __init map_mem(pgd_t *pgdp)
 	phys_addr_t kernel_start = __pa_symbol(_text);
 	phys_addr_t kernel_end = __pa_symbol(__init_begin);
 	phys_addr_t start, end;
-	phys_addr_t early_kfence_pool;
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
 
@@ -1137,8 +1131,6 @@ static void __init map_mem(pgd_t *pgdp)
 	BUILD_BUG_ON(pgd_index(direct_map_end - 1) == pgd_index(direct_map_end) &&
 		     pgd_index(_PAGE_OFFSET(VA_BITS_MIN)) != PTRS_PER_PGD - 1);
 
-	early_kfence_pool = arm64_kfence_alloc_pool();
-
 	linear_map_requires_bbml2 = !force_pte_mapping() && can_set_direct_map();
 
 	if (force_pte_mapping())
@@ -1178,7 +1170,6 @@ static void __init map_mem(pgd_t *pgdp)
 	__map_memblock(pgdp, kernel_start, kernel_end,
 		       PAGE_KERNEL, NO_CONT_MAPPINGS);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
-	arm64_kfence_map_pool(early_kfence_pool, pgdp);
 }
 
 void mark_rodata_ro(void)

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.34.1


