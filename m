Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF006D58B21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDBfqkkR5+ttpLzhQpMfEVMO9lMbzRhzooj5gIZeZe4=; b=JN0zRBdvPIe8/L+OF/z8qw8ET4
	Znj5Ukdkj7q13kGL3zkHVIRML1ZayvTH/2S5b54n3NjnmRbHGp0ouLxDyBmr9HYB0zOoVu1k5LvDe
	feFW0V025dpyKJu8aWF3dpO5LSWIsMoAAeF269ajkG2tI+TsXhXezXT/rYi8EJVovfMKb24ta2yR5
	oTFFlUuA1DW/cX1Qi2oHWdPdF6XwdNdCLc5kBijI9DKq6aQoJSdenN4twRATErAnjSfpcFjtm2Pmc
	aNlnaRFs50kb0Bo6Wzikz9Fr5TRZGSAEWS3XApdKycR8nmag9hCT1yv5FUI1P5TOlt+XtRow49KTN
	f5Ij8K3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20TX-00000003LSF-3gv4;
	Mon, 16 Mar 2026 05:26:47 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20TS-00000003LPY-3hTM;
	Mon, 16 Mar 2026 05:26:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxGqP07AC2r4OZa2cp9BLgE+EQmwwmKhvb0vWjQ81Akp9v5tPTI36hszAaKnPXLHpkukXK6Z/q+FU7BlO37MP18K+ZrAJBJ3ZDF87kGt3mHbFBKwXyEksHphD9yEDCjclQhe6c6zu4prhZppx3F/GInyBZURkqYw+4wxia9sR770bYhrtKpJFjWX09hjmv+1U+nVCRxc1BJhWw9HwTHa6kgU2oqvmVex8bjzO7azC0t7IzypsKCe5scZi8RIcTJPRoZuEHccyrnQTmdmCMuI9zGXteM0ptSUclNR4yJkOu2/rfbHc2J1i01UwmPdeMY0BuOJV9JOVvzmmO2fP680vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDBfqkkR5+ttpLzhQpMfEVMO9lMbzRhzooj5gIZeZe4=;
 b=RJsbYVUY7WlkoETQM4y2m+Z6LzdgeV8IrccsCEmoefKIkNE97yKINrqtSD3Lpaef/+H+cqkqEwWHTDKYNN74nT9I9n+8hnYyFM0FK8dIBUUybMM8jtA6BLdoYg4Bfz27yp1MOHYzLlwqXOuMtJUsnBB6DidYW6WL7UX5Tv6zSfqS70eESeWNHhLWbHhzAavabchdPzqc+WHJVYRmjFfytF59yEio/gTMvvQRLDynPSKttGU8n7lP3gYcXWKtSDPeUsPK2XMQ5UxBioeZwgtsXO9cvT4M0X0e4u/Z0bzDnWnSJmW875biNR1m3+kYGMlTlGMA84CQnUUQcDFLn3Emtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDBfqkkR5+ttpLzhQpMfEVMO9lMbzRhzooj5gIZeZe4=;
 b=BmdOZjV/AaGfmSJoupduAZB9xnxKxS7Nu4uF1JNcF6FuaJkAixcrGmqZajB6Kd6xRiFUolqcZ0ci0IVUVuv+PnHTyrKLOHnpZgjmwdDN8Jod8NUpw5m555ICAIgm9AvQUjCrWWQD+a7/T1/MpTI70JYNLSZOD/g51ye5Vi2GJyo=
Received: from DM6PR02CA0104.namprd02.prod.outlook.com (2603:10b6:5:1f4::45)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 05:26:35 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:1f4:cafe::57) by DM6PR02CA0104.outlook.office365.com
 (2603:10b6:5:1f4::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Mon,
 16 Mar 2026 05:26:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:26:34 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 00:26:25 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>,
	Alexandre Ghiti <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>, "Kiryl
 Shutsemau" <kas@kernel.org>, Sean Christopherson <seanjc@google.com>,
	"Charlie Jenkins" <charlie@rivosinc.com>, Charles Mirabile
	<cmirabil@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Jisheng
 Zhang <jszhang@kernel.org>
Subject: [RFC PATCH v2 7/7] futex: Use runtime constants for __futex_hash() hot path
Date: Mon, 16 Mar 2026 05:24:01 +0000
Message-ID: <20260316052401.18910-8-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316052401.18910-1-kprateek.nayak@amd.com>
References: <20260316052401.18910-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|CH2PR12MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: 444e9b96-91a5-49d3-6b51-08de831c9703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|921020|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: W7g6S+pmG+E8HIBtlz+E2DuWisYTt+JH37Yjq4UKv92aR5pYqFhio0PipnXEtuwlrRpDWavm7O36WdBUcGQ1PW8qdYvZY/UWIxTUdC8Deve9n+wWjkXSDWamcG4Cp/HacjCtdkGHyhk+4bZiw+PH4zXcIYZ17Q0BIK1UkxgbZKDFNKe71hrBODGVhqn4ZX1sqfBL88WW2zXeDrZexc9GS03QlL/5VupMHqWz7U9ytJvPZR7neclkXZ9wY+cn+1mhoMTOXnORsKn77tij2y9pMcKpVtoJ9ptm041Wu4K0thHw4YYd2F7durirUKQLLiT08c6LfumHGCgVvlV0ixSO50do835L2GAF/J7G8WHqUbG+mXoTKu3cA/854fl70/B8DKdXkH+J88Ebd8y9dJzLHERz4nyI/iiZWu5PCyDq4zvSv4QBz6qY3avIBT/UD0pOwb6WU1nKpEwF0u4ubZQo/iNJI7CQrdXZY4duReBWjszJ9v4dyixe8/B8Tdc5Ka5eti+ztIbixmYg2VbH3Kugq06sH3AUrS5fyW/H8xftrXNCcscptkV2yn+NbSg354JUwpmpmMCmmVjP38tXg4ypX5XNM6JjPpVUCMAca5R6MhlgXQAcqnN3i6rzr0FJToJuCujOKlxlF056P3745lureGNFKeiJ1v38fW4BjMuDNWdbWob7cgndQp06WxolQKSZ1pYQW06nIUB0xMwV5D70F75TuDOWK/N0nJhFpNz3R8QLd7yCX9JXqoAtvjD1kuoP+eNstSiLGrjVXxRUqVCKRw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(921020)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LSwOuTaQiPv9/2iIEMpHIlLZ8J5r53hrH/Tjq5/RMXyNakZszAE0smxTYYFQFEXeyI6sUIpf74LW86Yp2JlGGtkoGyeSGFTLWuXXKWHFjof1k1NccR42Iv3NvWfSamF01EPsNTrPBqmwzMZMGblizqCwxeqeN6w4oXDUs8hJCP5lIk0zXDPX0Cy69DY5L56C5fv4PwJvRmLiVV96dBsKRtck0Pf4eQFk8I7hkV4bBOpleVFu3hlvNuUd3fqnuu3hgzY1/jkfi/GuxC/c3wrZWdoDvAtu4ziP+nSyDu5ARqCzly+Fmq+ob0RBby6v3p4kZ1qD5DAh6okZjGy0sKP5xaaDVbm/KdrRJn8ngKe2Vnq7iMYL1JHHt6xnGi67s9/FHHOr4v6TjdqETMsyCq52Jy5raHNZjVAImG1NdH9oiUhMlUHwuZ9LZQt003pCuSkN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:26:34.8317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 444e9b96-91a5-49d3-6b51-08de831c9703
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_222642_932076_9DECC962 
X-CRM114-Status: GOOD (  17.48  )
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

No functional chages intended.

  [ prateek: Dynamically allocate __futex_queues, mark the global data
    __ro_after_init since they are constified after futex_init(). ]

Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de> # MAX_NUMNODES bloat
Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 include/asm-generic/vmlinux.lds.h |  5 +++-
 kernel/futex/core.c               | 42 +++++++++++++++++--------------
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 1e1580febe4b..86f99fa6ae24 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -975,7 +975,10 @@
 		RUNTIME_CONST(shift, d_hash_shift)			\
 		RUNTIME_CONST(ptr, dentry_hashtable)			\
 		RUNTIME_CONST(ptr, __dentry_cache)			\
-		RUNTIME_CONST(ptr, __names_cache)
+		RUNTIME_CONST(ptr, __names_cache)			\
+		RUNTIME_CONST(shift, __futex_shift)			\
+		RUNTIME_CONST(mask,  __futex_mask)			\
+		RUNTIME_CONST(ptr,   __futex_queues)
 
 /* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
 #define KUNIT_TABLE()							\
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index cf7e610eac42..6b5c5a1596a5 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -45,23 +45,19 @@
 #include <linux/mempolicy.h>
 #include <linux/mmap_lock.h>
 
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
@@ -439,14 +435,14 @@ __futex_hash(union futex_key *key, struct futex_private_hash *fph)
 		 * NOTE: this isn't perfectly uniform, but it is fast and
 		 * handles sparse node masks.
 		 */
-		node = (hash >> futex_hashshift) % nr_node_ids;
+		node = runtime_const_shift_right_32(hash, __futex_shift) % nr_node_ids;
 		if (!node_possible(node)) {
 			node = find_next_bit_wrap(node_possible_map.bits,
 						  nr_node_ids, node);
 		}
 	}
 
-	return &futex_queues[node][hash & futex_hashmask];
+	return &futex_queues()[node][runtime_const_mask_32(hash, __futex_mask)];
 }
 
 /**
@@ -1913,7 +1909,7 @@ int futex_hash_allocate_default(void)
 	 *   16 <= threads * 4 <= global hash size
 	 */
 	buckets = roundup_pow_of_two(4 * threads);
-	buckets = clamp(buckets, 16, futex_hashmask + 1);
+	buckets = clamp(buckets, 16, __futex_mask + 1);
 
 	if (current_buckets >= buckets)
 		return 0;
@@ -1983,10 +1979,19 @@ static int __init futex_init(void)
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
 
@@ -2000,10 +2005,9 @@ static int __init futex_init(void)
 		for (i = 0; i < hashsize; i++)
 			futex_hash_bucket_init(&table[i], NULL);
 
-		futex_queues[n] = table;
+		futex_queues()[n] = table;
 	}
 
-	futex_hashmask = hashsize - 1;
 	pr_info("futex hash table entries: %lu (%lu bytes on %d NUMA nodes, total %lu KiB, %s).\n",
 		hashsize, size, num_possible_nodes(), size * num_possible_nodes() / 1024,
 		order > MAX_PAGE_ORDER ? "vmalloc" : "linear");
-- 
2.43.0


