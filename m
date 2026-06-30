Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483C1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 04:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTolOlZv+b6oWNzFnrXujHuS0q+KtLfb5lQNnqsvg1g=; b=fi8w1s4C+wL/mlfz+n7HXr3fFY
	VYx0gOJ0Bn/L4sEs0znGIj0ZUCdk3FcrALI4eHbNjp/l+AMZWhJTFWbyung4mz1+qWez2bPVTW520
	9vqQDfRKTkQ72ocSaW7XaYvSyzHuF/JjyAsFqDiIk2gmXR4B3sQBscbTRgbLeyxA0EQ4J1EQbLIvi
	+py63znz65E9wzk89q0+TWv6U2Kq6xjC+G7u3eEdDcU1yUczRp+Qw6BmoGRKFRwTz+OvsIMy4jUZ3
	24z97pzUvPC0zAh8lWIqCgmZ0E0Yi3q6voFWJiOeYgAvDr2kGjIWofq3+JXNFIgWXpn/0mTH42fB7
	m9KnfwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQYT-0000000FoFc-1bu4;
	Tue, 30 Jun 2026 04:58:41 +0000
Received: from mail-westus3azon11012054.outbound.protection.outlook.com ([40.107.209.54] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQYQ-0000000FoCK-0ZWh;
	Tue, 30 Jun 2026 04:58:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfBxVTS7P9bUshESZXbNNk5+lklitr7R22MEDVZ1EeJ9wqnGFtbQ5AcpyO1zR/4/U60xi9l4IwGXdiuqAngrhl1cwN7LUt4iFzDvWKcIsETR1Akp8Uvqtqb6kIgcXI1YfQ1e6RKgo8GhcvWjrcvsz7S6QGp3HHt9p9D4hrByToh6T8zM/sNTLQILsQadBxGLw2IO9OaqhB0fGs6JQ6SjrSJx2lOWX/o0WtglFt/UiKk/fcw7uw7L0CjPb+inMRhcF1qiiNXmk+qJyJtZ/K2TaGMY6fVXE5UotdBha9X8wQWwZplmHqhp4hXVzXZpZQDStbMsnG0OUC/UvzpM58DIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTolOlZv+b6oWNzFnrXujHuS0q+KtLfb5lQNnqsvg1g=;
 b=Kq0f5+z7PFE3hFD5F8k8EQXhF+XzyI40w6aubX3ajJjpcmUWIynERDFdhQqi2a0COoDY44WbNCsEWZvL4T07jgxhjwwi0j4wyLJXIZjM7MCueSVLAOdtRihivR8HRmUj9/PN9bKrwwNMVd4iD2pmDnEgmUR50Mp+Ak4M5Xith8cFnegRKCuPaV8iUlAUGAqkqKMLyYDZHcUZoVhNikwlRSVPRfb58/nWjrmtBUO9c7FtRAw/bps0A2ljNA6oWICfuYkZSe2hY+v1ZdFvvqrCphA/nJ4FBoBlO6+Pd8MKFyQWvxLmlACscXWpo+PYzm/NrfzLNiiltxMpq07dVCQdYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arndb.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTolOlZv+b6oWNzFnrXujHuS0q+KtLfb5lQNnqsvg1g=;
 b=L/AlQii9QEqKPZPs+mCQ4Df1GqsY5bAF4s1PHqXubVY817rW85SvCwVT1RZbh8hj4sKEP7xepvYD5jg6nY7I35wWkiv+5C/fqM7Q/3DuW6YH0J0K+oTVtJlTgqBojDZlT9sHLQ5xF1mstk1GIgPozI49gG6+fjS5kSFwTinGkdY=
Received: from DS1P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::16) by
 CYXPR12MB9387.namprd12.prod.outlook.com (2603:10b6:930:e6::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Tue, 30 Jun 2026 04:58:30 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:8:453:cafe::6a) by DS1P223CA0001.outlook.office365.com
 (2603:10b6:8:453::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 04:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 04:58:30 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 23:58:21 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, <x86@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
	<gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>,
	"K Prateek Nayak" <kprateek.nayak@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Huth
	<thuth@redhat.com>, Sean Christopherson <seanjc@google.com>, Jisheng Zhang
	<jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH v5 8/8] futex: Use runtime constants for __futex_hash() hot path
Date: Tue, 30 Jun 2026 04:55:31 +0000
Message-ID: <20260630045531.3939-9-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630045531.3939-1-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|CYXPR12MB9387:EE_
X-MS-Office365-Filtering-Correlation-Id: 76210976-ced6-4e61-d308-08ded6643ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|7416014|376014|18002099003|921020|13003099007|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0vtIDEPoK8tzbqqNLAmFhV2OPPTDRo4EZNrnt/nxIj7cwSrVSbdFIgIhpOeDbthkh6dMubOB3KH3iPnrknB8lRbUmwzLEtK4eE4Dzgvlwl30qIiqsCNSlPKNX0ShxFbrHDc3BUmzfXViA7QE+Dz2SKllIWvGdTlNGlG3ojYpNmqoCQ+l5Kknf5h+fQ5lgthmUOewfmO5t4HXHSlymx6ry464G8wbXJ79idxmX65totegpwhqkdLEKYzWphshKZTJTcNTEMtTMXuzzU7kdEzc7L66sdDxbr4TDxx1oYhTkrjTw3Jf9fsRrOA/iYkK/9LMHr8bknf81wIPGda91UkOzshaS13NcuQsYhoOb5jfMN6MGCV1Hbb4rWyplj3isy6Jh53IdOdVonEhy7Hq0W7uEBNPsNR3L1SqauO+NgC4brzULty/PWCnY+hZ3UBOHoJK4s2WHXObW5aD3evjJQ82CfIPH7QvttnGuNcIosMeliGD3Xcjoca7sDQDaBD2o4a5uV24bUgKNTdYO4jJE7ecekDBaN9vnAiPE0Ob6+y8hDMY0+qIfHLVQtzABZDaFH3ehgXIODWTzQ8M4sDubN07+CuJalFO82qlNQwI0CYhNhAfKL9B67UnZHh0m9oraoWBlw5jAhV504biDS5iu9ReFtMqS2XFDWUsZzuERhFNn3Hok7CbBqpiytYa4GOnHK0HIlYgIRdB6m1w65oU+ezZtg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(7416014)(376014)(18002099003)(921020)(13003099007)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sw6mvVTcyK4oiXcXLyZOZaUagiRpsRjME2NyXnXraVJPl23A6YlFzashsdr17N7e2bYdsTtXrd7HbqOFCOCV86o8Q593lVOYX43Hy1JM5gg+CKm8n21UlT6AnQ1yzNHQXrNNx6qkjKKyAWjU08ik/6zV/90L4SHk7GsVDFN5yd18T5teeHTjGS35LVfGUPDwXKje3wiiS8h56meeIBwEVHoTeX0yvwj5T/2HijRf5yyUmCqz2OAgwnyAhwXnyDHkKi0+AeULI2+q0cmp1JqeuolP3/dCo57OIIelm9jELHHzW4mjabhUA6D1dKF7CFcMwRG7kK/D+S+tw0ovpJ+Dq4HAVo1UiPGYYBoPMkIzaGG1X37UtROuAYpD5EnIOWlsVfRlkTdJcjSSqcS/Vx1dDIH5Ri6azVCvLppX9UHy9upreAdF571x9I4QK8V6R+62
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 04:58:30.3434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76210976-ced6-4e61-d308-08ded6643ac0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9387
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_215838_185305_2509E0A7 
X-CRM114-Status: GOOD (  17.14  )
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

From: Peter Zijlstra <peterz@infradead.org>

Runtime constify the read-only after init data  __futex_shift(shift_32),
__futex_mask(mask_32), and __futex_queues(ptr) used in __futex_hash()
hot path to avoid referencing global variable.

This also allows __futex_queues to be allocated dynamically to
"nr_node_ids" slots instead of reserving config dependent MAX_NUMNODES
(1 << CONFIG_NODES_SHIFT) worth of slots upfront.

Runtime constants are initialized before their first access and
runtime_const_init() provides necessary barrier to ensure subsequent
accesses are not reordered against their initialization.

No functional changes intended.

  [ prateek: Dynamically allocate __futex_queues, mark the global data
    __ro_after_init since they are constified after futex_init(). ]

Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de> # MAX_NUMNODES bloat
Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
changelog v4..v5:

o Rebased on latest tip:master.
---
 include/asm-generic/vmlinux.lds.h |  5 +++-
 kernel/futex/core.c               | 42 +++++++++++++++++--------------
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 5659f4b5a1252..53207901d4c15 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -970,7 +970,10 @@
 		RUNTIME_CONST(ptr, __dentry_cache)			\
 		RUNTIME_CONST(ptr, __names_cache)			\
 		RUNTIME_CONST(ptr, __filp_cache)			\
-		RUNTIME_CONST(ptr, __bfilp_cache)
+		RUNTIME_CONST(ptr, __bfilp_cache)			\
+		RUNTIME_CONST(shift, __futex_shift)			\
+		RUNTIME_CONST(mask,  __futex_mask)			\
+		RUNTIME_CONST(ptr,   __futex_queues)
 
 /* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
 #define KUNIT_TABLE()							\
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 179b26e9c9341..b2a63ceb6ce98 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -48,23 +48,19 @@
 
 #include <vdso/futex.h>
 
+#include <asm/runtime-const.h>
+
 #include "futex.h"
 #include "../locking/rtmutex_common.h"
 
-/*
- * The base of the bucket array and its size are always used together
- * (after initialization only in futex_hash()), so ensure that they
- * reside in the same cacheline.
- */
-static struct {
-	unsigned long            hashmask;
-	unsigned int		 hashshift;
-	struct futex_hash_bucket *queues[MAX_NUMNODES];
-} __futex_data __read_mostly __aligned(2*sizeof(long));
+static u32 __futex_mask __ro_after_init;
+static u32 __futex_shift __ro_after_init;
+static struct futex_hash_bucket **__futex_queues __ro_after_init;
 
-#define futex_hashmask	(__futex_data.hashmask)
-#define futex_hashshift	(__futex_data.hashshift)
-#define futex_queues	(__futex_data.queues)
+static __always_inline struct futex_hash_bucket **futex_queues(void)
+{
+	return runtime_const_ptr(__futex_queues);
+}
 
 struct futex_private_hash {
 	int		state;
@@ -395,13 +391,13 @@ __futex_hash(union futex_key *key, struct futex_private_hash *fph, struct futex_
 		 * NOTE: this isn't perfectly uniform, but it is fast and
 		 * handles sparse node masks.
 		 */
-		node = (hash >> futex_hashshift) % nr_node_ids;
+		node = runtime_const_shift_right_32(hash, __futex_shift) % nr_node_ids;
 		if (!node_possible(node)) {
 			node = find_next_bit_wrap(node_possible_map.bits, nr_node_ids, node);
 		}
 	}
 
-	return &futex_queues[node][hash & futex_hashmask];
+	return &futex_queues()[node][runtime_const_mask_32(hash, __futex_mask)];
 }
 
 /**
@@ -1922,7 +1918,7 @@ int futex_hash_allocate_default(void)
 	 *   16 <= threads * 4 <= global hash size
 	 */
 	buckets = roundup_pow_of_two(4 * threads);
-	buckets = clamp(buckets, 16, futex_hashmask + 1);
+	buckets = clamp(buckets, 16, __futex_mask + 1);
 
 	if (current_buckets >= buckets)
 		return 0;
@@ -2020,10 +2016,19 @@ static int __init futex_init(void)
 	hashsize = max(4, hashsize);
 	hashsize = roundup_pow_of_two(hashsize);
 #endif
-	futex_hashshift = ilog2(hashsize);
+	__futex_mask = hashsize - 1;
+	__futex_shift = ilog2(hashsize);
 	size = sizeof(struct futex_hash_bucket) * hashsize;
 	order = get_order(size);
 
+	__futex_queues = kcalloc(nr_node_ids, sizeof(*__futex_queues), GFP_KERNEL);
+
+	runtime_const_init(shift, __futex_shift);
+	runtime_const_init(mask,  __futex_mask);
+	runtime_const_init(ptr,   __futex_queues);
+
+	BUG_ON(!futex_queues());
+
 	for_each_node(n) {
 		struct futex_hash_bucket *table;
 
@@ -2037,10 +2042,9 @@ static int __init futex_init(void)
 		for (i = 0; i < hashsize; i++)
 			futex_hash_bucket_init(&table[i]);
 
-		futex_queues[n] = table;
+		futex_queues()[n] = table;
 	}
 
-	futex_hashmask = hashsize - 1;
 	pr_info("futex hash table entries: %lu (%lu bytes on %d NUMA nodes, total %lu KiB, %s).\n",
 		hashsize, size, num_possible_nodes(), size * num_possible_nodes() / 1024,
 		order > MAX_PAGE_ORDER ? "vmalloc" : "linear");
-- 
2.34.1


