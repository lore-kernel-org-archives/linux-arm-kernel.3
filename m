Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5850FF43848
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDNE2cqEOc4uL2Pdf+v7Wneo2kEZVPJUpyhD3IPa3Ok=; b=CUDaipdH6nRh+puOqkwYlSYgBS
	9FGt4pmLBR6SQm0WhswLx7B7JgnbWdOeRCHEk06WWii7akcji/e8rUuJXQRojzgozf6XT9+JBJ2Qu
	KkNI3mvGN7YvzlLewA3BobPH7wtHz2/KTtsvxcyREhTvaEgqc4DNwi8HXhcEjMcAdJVAH+mqvd2Sg
	0dgROvdrtnmwLG1fRdP6UVp48r6w8+BuaYMz1iiseQUu3440ogUoCLmmhk6aUv/AhceXgSLH+aYMl
	9wvMGNr/ktereDCWBZYuMQ6PQFXzRgWKKSlIingd8Mvyr1YxLqYt1UW3fJBQBGtC6xi2AgqCE7yPQ
	hPmLivdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3P1-00000001OXw-17dL;
	Wed, 15 Apr 2026 16:47:47 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Or-00000001OR9-1047
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:47:40 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fwn9J4N2czJ46DW;
	Thu, 16 Apr 2026 00:46:44 +0800 (CST)
Received: from mscpeml500003.china.huawei.com (unknown [7.188.49.51])
	by mail.maildlp.com (Postfix) with ESMTPS id 0334640570;
	Thu, 16 Apr 2026 00:47:28 +0800 (CST)
Received: from localhost.localdomain (10.123.66.205) by
 mscpeml500003.china.huawei.com (7.188.49.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Apr 2026 19:47:27 +0300
From: Fedorov Nikita <fedorov.nikita@h-partners.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Ajay
 Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
	<alexey.makhalov@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>, Arnd
 Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng
	<boqun@kernel.org>, Waiman Long <longman@redhat.com>, Darren Hart
	<dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	<andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost
	<matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim
	<rakie.kim@sk.com>, <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple
	<apopple@nvidia.com>, Anatoly Stepanov <stepanov.anatoly@huawei.com>
CC: Nikita Fedorov <fedorov.nikita@h-partners.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<virtualization@lists.linux.dev>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <guohanjun@huawei.com>, <wangkefeng.wang@huawei.com>,
	<weiyongjun1@huawei.com>, <yusongping@huawei.com>, <leijitang@huawei.com>,
	<artem.kuzin@huawei.com>, <kang.sun@huawei.com>, <chenjieping3@huawei.com>
Subject: [RFC PATCH v3 1/7] kernel: add hq-spinlock types
Date: Thu, 16 Apr 2026 00:44:53 +0800
Message-ID: <20260415164459.2904963-2-fedorov.nikita@h-partners.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415164459.2904963-1-fedorov.nikita@h-partners.com>
References: <20260415164459.2904963-1-fedorov.nikita@h-partners.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.205]
X-ClientProxiedBy: mscpeml500003.china.huawei.com (7.188.49.51) To
 mscpeml500003.china.huawei.com (7.188.49.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_094737_576864_BD54E855 
X-CRM114-Status: GOOD (  19.62  )
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

Introduce the type definitions used by Hierarchical Queued spinlocks.

Add the HQ-specific types definitions and extend qspinlock so
that a lock can be marked as using the HQ slowpath
while preserving the existing qspinlock layout

Co-developed-by: Anatoly Stepanov <stepanov.anatoly@huawei.com>
Signed-off-by: Anatoly Stepanov <stepanov.anatoly@huawei.com>
Co-developed-by: Nikita Fedorov <fedorov.nikita@h-partners.com>
Signed-off-by: Nikita Fedorov <fedorov.nikita@h-partners.com>
---
 include/asm-generic/qspinlock_types.h |  44 ++++++++--
 kernel/locking/hqlock_types.h         | 118 ++++++++++++++++++++++++++
 2 files changed, 157 insertions(+), 5 deletions(-)
 create mode 100644 kernel/locking/hqlock_types.h

diff --git a/include/asm-generic/qspinlock_types.h b/include/asm-generic/qspinlock_types.h
index 2fd1fb89ec..a97387ae48 100644
--- a/include/asm-generic/qspinlock_types.h
+++ b/include/asm-generic/qspinlock_types.h
@@ -43,11 +43,6 @@ typedef struct qspinlock {
 	};
 } arch_spinlock_t;
 
-/*
- * Initializier
- */
-#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val = ATOMIC_INIT(0) } }
-
 /*
  * Bitfields in the atomic value:
  *
@@ -76,6 +71,26 @@ typedef struct qspinlock {
 #else
 #define _Q_PENDING_BITS		1
 #endif
+
+#ifdef CONFIG_HQSPINLOCKS
+/* For locks with HQ-mode we always use single pending bit */
+#define _Q_PENDING_HQLOCK_BITS	 1
+#define _Q_PENDING_HQLOCK_OFFSET (_Q_LOCKED_OFFSET + _Q_LOCKED_BITS)
+#define _Q_PENDING_HQLOCK_MASK		_Q_SET_MASK(PENDING_HQLOCK)
+
+#define _Q_LOCKTYPE_OFFSET	(_Q_PENDING_HQLOCK_OFFSET + _Q_PENDING_HQLOCK_BITS)
+#define _Q_LOCKTYPE_BITS	1
+#define _Q_LOCKTYPE_MASK	_Q_SET_MASK(LOCKTYPE)
+#define _Q_LOCKTYPE_HQ			(1U << _Q_LOCKTYPE_OFFSET)
+
+#define _Q_LOCK_MODE_OFFSET	(_Q_LOCKTYPE_OFFSET + _Q_LOCKTYPE_BITS)
+#define _Q_LOCK_MODE_BITS	2
+#define _Q_LOCK_MODE_MASK	_Q_SET_MASK(LOCK_MODE)
+#define _Q_LOCK_MODE_QSPINLOCK_VAL	(1U << _Q_LOCK_MODE_OFFSET)
+
+#define _Q_LOCK_TYPE_MODE_MASK	(_Q_LOCKTYPE_MASK | _Q_LOCK_MODE_MASK)
+#endif //CONFIG_HQSPINLOCKS
+
 #define _Q_PENDING_MASK		_Q_SET_MASK(PENDING)
 
 #define _Q_TAIL_IDX_OFFSET	(_Q_PENDING_OFFSET + _Q_PENDING_BITS)
@@ -92,4 +107,23 @@ typedef struct qspinlock {
 #define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
 #define _Q_PENDING_VAL		(1U << _Q_PENDING_OFFSET)
 
+#ifdef CONFIG_HQSPINLOCKS
+#define _Q_LOCK_INVALID_TAIL	(_Q_TAIL_IDX_MASK)
+
+#define _Q_SERVICE_MASK		(_Q_LOCKTYPE_MASK | _Q_LOCK_MODE_QSPINLOCK_VAL | _Q_LOCK_INVALID_TAIL)
+#else // CONFIG_HQSPINLOCKS
+#define _Q_SERVICE_MASK		0
+#endif
+
+/*
+ * Initializier
+ */
+#define	__ARCH_SPIN_LOCK_UNLOCKED		{ { .val = ATOMIC_INIT(0) } }
+
+#ifdef CONFIG_HQSPINLOCKS
+#define	__ARCH_SPIN_LOCK_UNLOCKED_HQ	{ { .val = ATOMIC_INIT(_Q_LOCKTYPE_HQ | _Q_LOCK_MODE_QSPINLOCK_VAL) } }
+#else
+#define	__ARCH_SPIN_LOCK_UNLOCKED_HQ	{ { .val = ATOMIC_INIT(0) } }
+#endif
+
 #endif /* __ASM_GENERIC_QSPINLOCK_TYPES_H */
diff --git a/kernel/locking/hqlock_types.h b/kernel/locking/hqlock_types.h
new file mode 100644
index 0000000000..32d06f2755
--- /dev/null
+++ b/kernel/locking/hqlock_types.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _GEN_HQ_SPINLOCK_SLOWPATH
+#error "Do not include this file!"
+#endif
+
+#define IRQ_NODE (MAX_NUMNODES + 1)
+#define Q_NEW_NODE_QUEUE 1
+#define LOCK_ID_BITS		(12)
+
+#define LOCK_ID_MAX			(1 << LOCK_ID_BITS)
+#define LOCK_ID_NONE		(LOCK_ID_MAX + 1)
+
+#define _QUEUE_TAIL_MASK (((1ULL << 32) - 1) << 0)
+#define _QUEUE_SEQ_COUNTER_MASK (((1ULL << 32) - 1) << 32)
+
+/*
+ * Output code for handoff-logic:
+ *
+ * ==  0 (HQLOCK_HANDOFF_LOCAL) - has local nodes to handoff
+ *  >  0 - has remote node to handoff, id is visible
+ * == -1 (HQLOCK_HANDOFF_REMOTE_HEAD) - has remote node to handoff,
+ *         id isn't visible yet, will be in the *lock_meta->head_node*
+ */
+enum {
+	HQLOCK_HANDOFF_LOCAL = 0,
+	HQLOCK_HANDOFF_REMOTE_HEAD = -1
+};
+
+typedef enum {
+	LOCK_NO_MODE = 0,
+	LOCK_MODE_QSPINLOCK = 1,
+	LOCK_MODE_HQLOCK = 2,
+} hqlock_mode_t;
+
+struct numa_qnode {
+	struct mcs_spinlock mcs;
+
+	u16 lock_id;
+	u16 wrong_fallback_tail;
+	u16 general_handoffs;
+
+	u16 numa_node;
+};
+
+struct numa_queue {
+	struct numa_qnode *head;
+	union {
+		u64 seq_counter_tail;
+		struct {
+			u32 tail;
+			u32 seq_counter;
+		};
+	};
+
+	u16 next_node;
+	u16 prev_node;
+
+	u16 handoffs_not_head;
+} ____cacheline_aligned;
+
+/**
+ * Lock metadata
+ * "allocated"/"freed" on demand.
+ *
+ * Used to dynamically bind numa_queue to a lock,
+ * maintain FIFO-order for the NUMA-queues.
+ *
+ * seq_counter is needed to distinguish metadata usage
+ * by different locks, preventing local contenders
+ * from queueing in the wrong per-NUMA queue
+ *
+ * @see set_bucket
+ * @see numa_xchg_tail
+ */
+struct lock_metadata {
+	atomic_t seq_counter;
+	struct qspinlock *lock_ptr;
+
+	/* NUMA-queues of contenders ae kept in FIFO order */
+	union {
+		u32 nodes_tail;
+		struct {
+			u16 tail_node;
+			u16 head_node;
+		};
+	};
+};
+
+static inline int decode_lock_mode(u32 lock_val)
+{
+	return (lock_val & _Q_LOCK_MODE_MASK) >> _Q_LOCK_MODE_OFFSET;
+}
+
+static inline u32 encode_lock_mode(u16 lock_id)
+{
+	if (lock_id == LOCK_ID_NONE)
+		return LOCK_MODE_QSPINLOCK << _Q_LOCK_MODE_OFFSET;
+
+	return LOCK_MODE_HQLOCK << _Q_LOCK_MODE_OFFSET;
+}
+
+static inline u64 encode_tc(u32 tail, u32 counter)
+{
+	u64 __tail = (u64)tail;
+	u64 __counter = (u64)counter;
+
+	return __tail | (__counter << 32);
+}
+
+static inline u32 decode_tc_tail(u64 tail_counter)
+{
+	return (u32)(tail_counter & _QUEUE_TAIL_MASK);
+}
+
+static inline u32 decode_tc_counter(u64 tail_counter)
+{
+	return (u32)((tail_counter & _QUEUE_SEQ_COUNTER_MASK) >> 32);
+}
-- 
2.34.1


