Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A57EC54FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXVtdJQYeGUC65Qk/gSmgjLdFbOA96uPFkCJHUNbnfs=; b=aR4PLRSGIHgkxlkKvlq4Gy42eW
	GVHFZAwEuJerUVNi/OPyBxa7sKA4LC6TsT6xri/OoJvK7wQpVJiTs8nPWXh/tQ+mcDXDcuc4ymVJE
	NztI1h49WOhGZgDISaCzgDE28nk781U6SUtbxF85WJVYwz8HKobcNK1Y2vv/xeMWjrIAObJQPdxpv
	tJ/FoNAl7G8v/8PgZCHnyH/hJ3EDn1ZXC1PpmDLx2v1b/6L+wW+LyUU6gX/RCIzQ74NlOBrmGp6ra
	xWPqBbQLXEvGO5vw31QoEq9SdfkJ0lQoM0pf1I+g9Qijnc041qNcbsxmQ41M/BQ/Il4dFUrG1LdRJ
	T6QVWZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQmY-0000000EYry-1J5P;
	Fri, 20 Feb 2026 13:42:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQmW-0000000EYqZ-1W3L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:42:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94FC9497;
	Fri, 20 Feb 2026 05:42:47 -0800 (PST)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3184E3F7D8;
	Fri, 20 Feb 2026 05:42:52 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Fri, 20 Feb 2026 13:42:19 +0000
Subject: [PATCH v2 01/11] ACPI: APEI: GHES: share macros via a private
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-1-347fa2d7351b@arm.com>
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
To: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, Dmitry.Lamerov@arm.com, 
 catalin.marinas@arm.com, bp@alien8.de, robh@kernel.org, rafael@kernel.org, 
 will@kernel.org, conor@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, krzk+dt@kernel.org, Michael.Zhao2@arm.com, 
 tony.luck@intel.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771594970; l=7188;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=dvbQfB6ZlDaodR1DrdPEPcuvVpuLLup8bCkgaMdmscw=;
 b=JPUg/6C2Fi0vSO6APHLpzN2Xs8F7JQ/kLC0oi9hpHgHBQ0zLR5cd/E4m3DTPhnmTRkGi5bZy+
 CUXMkLjAKxrCRASolvauc+Aka2pGZxE9rxhUE0VDwKzApNuruArX9l2
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_054256_483780_A5D529D8 
X-CRM114-Status: GOOD (  16.48  )
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

Carve the CPER helper macros out of ghes.c and place them in a private
header so they can be shared with upcoming helper files. This is a
mechanical include change with no functional differences.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/acpi/apei/ghes.c | 60 +-----------------------------
 include/acpi/ghes_cper.h | 95 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 59 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index f96aede5d9a3..07b70bcb8342 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -49,6 +49,7 @@
 
 #include <acpi/actbl1.h>
 #include <acpi/ghes.h>
+#include <acpi/ghes_cper.h>
 #include <acpi/apei.h>
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
@@ -57,40 +58,6 @@
 
 #include "apei-internal.h"
 
-#define GHES_PFX	"GHES: "
-
-#define GHES_ESTATUS_MAX_SIZE		65536
-#define GHES_ESOURCE_PREALLOC_MAX_SIZE	65536
-
-#define GHES_ESTATUS_POOL_MIN_ALLOC_ORDER 3
-
-/* This is just an estimation for memory pool allocation */
-#define GHES_ESTATUS_CACHE_AVG_SIZE	512
-
-#define GHES_ESTATUS_CACHES_SIZE	4
-
-#define GHES_ESTATUS_IN_CACHE_MAX_NSEC	10000000000ULL
-/* Prevent too many caches are allocated because of RCU */
-#define GHES_ESTATUS_CACHE_ALLOCED_MAX	(GHES_ESTATUS_CACHES_SIZE * 3 / 2)
-
-#define GHES_ESTATUS_CACHE_LEN(estatus_len)			\
-	(sizeof(struct ghes_estatus_cache) + (estatus_len))
-#define GHES_ESTATUS_FROM_CACHE(estatus_cache)			\
-	((struct acpi_hest_generic_status *)				\
-	 ((struct ghes_estatus_cache *)(estatus_cache) + 1))
-
-#define GHES_ESTATUS_NODE_LEN(estatus_len)			\
-	(sizeof(struct ghes_estatus_node) + (estatus_len))
-#define GHES_ESTATUS_FROM_NODE(estatus_node)			\
-	((struct acpi_hest_generic_status *)				\
-	 ((struct ghes_estatus_node *)(estatus_node) + 1))
-
-#define GHES_VENDOR_ENTRY_LEN(gdata_len)                               \
-	(sizeof(struct ghes_vendor_record_entry) + (gdata_len))
-#define GHES_GDATA_FROM_VENDOR_ENTRY(vendor_entry)                     \
-	((struct acpi_hest_generic_data *)                              \
-	((struct ghes_vendor_record_entry *)(vendor_entry) + 1))
-
 /*
  *  NMI-like notifications vary by architecture, before the compiler can prune
  *  unused static functions it needs a value for these enums.
@@ -102,25 +69,6 @@
 
 static ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
 
-static inline bool is_hest_type_generic_v2(struct ghes *ghes)
-{
-	return ghes->generic->header.type == ACPI_HEST_TYPE_GENERIC_ERROR_V2;
-}
-
-/*
- * A platform may describe one error source for the handling of synchronous
- * errors (e.g. MCE or SEA), or for handling asynchronous errors (e.g. SCI
- * or External Interrupt). On x86, the HEST notifications are always
- * asynchronous, so only SEA on ARM is delivered as a synchronous
- * notification.
- */
-static inline bool is_hest_sync_notify(struct ghes *ghes)
-{
-	u8 notify_type = ghes->generic->notify.type;
-
-	return notify_type == ACPI_HEST_NOTIFY_SEA;
-}
-
 /*
  * This driver isn't really modular, however for the time being,
  * continuing to use module_param is the easiest way to remain
@@ -165,12 +113,6 @@ static DEFINE_MUTEX(ghes_devs_mutex);
  */
 static DEFINE_SPINLOCK(ghes_notify_lock_irq);
 
-struct ghes_vendor_record_entry {
-	struct work_struct work;
-	int error_severity;
-	char vendor_record[];
-};
-
 static struct gen_pool *ghes_estatus_pool;
 
 static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS_CACHES_SIZE];
diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
new file mode 100644
index 000000000000..2597fbadc4f3
--- /dev/null
+++ b/include/acpi/ghes_cper.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * APEI Generic Hardware Error Source: CPER Helper
+ *
+ * Copyright (C) 2026 ARM Ltd.
+ * Author: Ahmed Tiba <ahmed.tiba@arm.com>
+ * Based on ACPI APEI GHES driver.
+ *
+ */
+
+#ifndef ACPI_APEI_GHES_CPER_H
+#define ACPI_APEI_GHES_CPER_H
+
+#include <linux/workqueue.h>
+
+#include <acpi/ghes.h>
+
+#define GHES_PFX	"GHES: "
+
+#define GHES_ESTATUS_MAX_SIZE		65536
+#define GHES_ESOURCE_PREALLOC_MAX_SIZE	65536
+
+#define GHES_ESTATUS_POOL_MIN_ALLOC_ORDER 3
+
+/* This is just an estimation for memory pool allocation */
+#define GHES_ESTATUS_CACHE_AVG_SIZE	512
+
+#define GHES_ESTATUS_CACHES_SIZE	4
+
+#define GHES_ESTATUS_IN_CACHE_MAX_NSEC	10000000000ULL
+/* Prevent too many caches are allocated because of RCU */
+#define GHES_ESTATUS_CACHE_ALLOCED_MAX	(GHES_ESTATUS_CACHES_SIZE * 3 / 2)
+
+#define GHES_ESTATUS_CACHE_LEN(estatus_len)			\
+	(sizeof(struct ghes_estatus_cache) + (estatus_len))
+#define GHES_ESTATUS_FROM_CACHE(estatus_cache)			\
+	((struct acpi_hest_generic_status *)				\
+	 ((struct ghes_estatus_cache *)(estatus_cache) + 1))
+
+#define GHES_ESTATUS_NODE_LEN(estatus_len)			\
+	(sizeof(struct ghes_estatus_node) + (estatus_len))
+#define GHES_ESTATUS_FROM_NODE(estatus_node)			\
+	((struct acpi_hest_generic_status *)				\
+	 ((struct ghes_estatus_node *)(estatus_node) + 1))
+
+#define GHES_VENDOR_ENTRY_LEN(gdata_len)                               \
+	(sizeof(struct ghes_vendor_record_entry) + (gdata_len))
+#define GHES_GDATA_FROM_VENDOR_ENTRY(vendor_entry)                     \
+	((struct acpi_hest_generic_data *)                              \
+	((struct ghes_vendor_record_entry *)(vendor_entry) + 1))
+
+static inline bool is_hest_type_generic_v2(struct ghes *ghes)
+{
+	return ghes->generic->header.type == ACPI_HEST_TYPE_GENERIC_ERROR_V2;
+}
+
+/*
+ * A platform may describe one error source for the handling of synchronous
+ * errors (e.g. MCE or SEA), or for handling asynchronous errors (e.g. SCI
+ * or External Interrupt). On x86, the HEST notifications are always
+ * asynchronous, so only SEA on ARM is delivered as a synchronous
+ * notification.
+ */
+static inline bool is_hest_sync_notify(struct ghes *ghes)
+{
+	u8 notify_type = ghes->generic->notify.type;
+
+	return notify_type == ACPI_HEST_NOTIFY_SEA;
+}
+
+struct ghes_vendor_record_entry {
+	struct work_struct work;
+	int error_severity;
+	char vendor_record[];
+};
+
+static struct ghes *ghes_new(struct acpi_hest_generic *generic);
+static void ghes_fini(struct ghes *ghes);
+
+static int ghes_read_estatus(struct ghes *ghes,
+		      struct acpi_hest_generic_status *estatus,
+		      u64 *buf_paddr, enum fixed_addresses fixmap_idx);
+static void ghes_clear_estatus(struct ghes *ghes,
+			struct acpi_hest_generic_status *estatus,
+			u64 buf_paddr, enum fixed_addresses fixmap_idx);
+static int __ghes_peek_estatus(struct ghes *ghes,
+			struct acpi_hest_generic_status *estatus,
+			u64 *buf_paddr, enum fixed_addresses fixmap_idx);
+static int __ghes_check_estatus(struct ghes *ghes,
+			 struct acpi_hest_generic_status *estatus);
+static int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
+			u64 buf_paddr, enum fixed_addresses fixmap_idx,
+			size_t buf_len);
+
+#endif /* ACPI_APEI_GHES_CPER_H */

-- 
2.43.0


