Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A242C107760E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 20:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vLJ7M4gZlujjahiAjIgjbH4+EWEAQmxbWGoZLLs4ts=; b=UlFWxEDXW6vLNfcnf/IIxRPrzB
	UAPvesTT82hSz42541953N58rD7Loa0SuuU5vReXWJR84C+8sH77itnWkEa+bQ79jhlRD0Gd3ozex
	ApUxATcRKBVW+bVKF2+2MBrBJGjae7bquLSK2alLOb3jopcVQqzxsPW2KuYd8Dr7N7oaVxqu/vCc2
	Kcwegf003Vm+MZGuFRIkwk8M4sjp7tDP4bSzD+R/fnu8Qt+EBo/t231d1coJTFTcSIHBD3KgQddcY
	bK2qs3+WS/h/LpWvxK0pS2clfeYrkU9QXhcppedNGCWlxM/44fu+rOY2YWdJT9fL7OVJFoEnlgn4W
	Y/gRPk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xpR-00000009KSl-2Hj0;
	Wed, 18 Mar 2026 20:49:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xpM-00000009KRB-1ZxN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 20:49:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9FE21C00;
	Wed, 18 Mar 2026 13:49:06 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E363E3F7BD;
	Wed, 18 Mar 2026 13:49:10 -0700 (PDT)
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Wed, 18 Mar 2026 20:47:58 +0000
Subject: [PATCH v3 01/10] ACPI: APEI: GHES: share macros via a private
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-1-48e6a1c249ef@arm.com>
References: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
In-Reply-To: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-cxl@vger.kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, Michael.Zhao2@arm.com, robh@kernel.org, 
 linux-arm-kernel@lists.infradead.org, Dmitry.Lamerov@arm.com, 
 rafael@kernel.org, conor@kernel.org, will@kernel.org, bp@alien8.de, 
 catalin.marinas@arm.com, krzk+dt@kernel.org, linux-doc@vger.kernel.org, 
 mchehab+huawei@kernel.org, tony.luck@intel.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866948; l=10958;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=AvvGZoPLgLyPZXejC3LPLI3Akhe3+YJBBIYt3h0/TZk=;
 b=d1UUi1xWUZC9+f6G9kYCugJ8Bil36IYnwJZBTLsaHIbf4YTp/43SB4VfPg/W7ZiqsYXyjefvG
 +t47C8mt5fSBPkSSMaqTBIw/4+92bFGBO7hpPeGF3SgkM2ZtGNlAwWR
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_134916_506330_796E3A5D 
X-CRM114-Status: GOOD (  21.33  )
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
 drivers/acpi/apei/ghes.c |  94 +++++++++---------------------------------
 include/acpi/ghes_cper.h | 103 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 76 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 8acd2742bb27..a0b5ee79a09c 100644
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
@@ -266,7 +208,7 @@ static void ghes_ack_error(struct acpi_hest_generic_v2 *gv2)
 	apei_write(val, &gv2->read_ack_register);
 }
 
-static struct ghes *ghes_new(struct acpi_hest_generic *generic)
+struct ghes *ghes_new(struct acpi_hest_generic *generic)
 {
 	struct ghes *ghes;
 	unsigned int error_block_length;
@@ -313,7 +255,7 @@ static struct ghes *ghes_new(struct acpi_hest_generic *generic)
 	return ERR_PTR(rc);
 }
 
-static void ghes_fini(struct ghes *ghes)
+void ghes_fini(struct ghes *ghes)
 {
 	kfree(ghes->estatus);
 	apei_unmap_generic_address(&ghes->generic->error_status_address);
@@ -363,8 +305,8 @@ static void ghes_copy_tofrom_phys(void *buffer, u64 paddr, u32 len,
 }
 
 /* Check the top-level record header has an appropriate size. */
-static int __ghes_check_estatus(struct ghes *ghes,
-				struct acpi_hest_generic_status *estatus)
+int __ghes_check_estatus(struct ghes *ghes,
+			 struct acpi_hest_generic_status *estatus)
 {
 	u32 len = cper_estatus_len(estatus);
 	u32 max_len = min(ghes->generic->error_block_length,
@@ -389,9 +331,9 @@ static int __ghes_check_estatus(struct ghes *ghes,
 }
 
 /* Read the CPER block, returning its address, and header in estatus. */
-static int __ghes_peek_estatus(struct ghes *ghes,
-			       struct acpi_hest_generic_status *estatus,
-			       u64 *buf_paddr, enum fixed_addresses fixmap_idx)
+int __ghes_peek_estatus(struct ghes *ghes,
+			struct acpi_hest_generic_status *estatus,
+			u64 *buf_paddr, enum fixed_addresses fixmap_idx)
 {
 	struct acpi_hest_generic *g = ghes->generic;
 	int rc;
@@ -400,7 +342,7 @@ static int __ghes_peek_estatus(struct ghes *ghes,
 	if (rc) {
 		*buf_paddr = 0;
 		pr_warn_ratelimited(FW_WARN GHES_PFX
-"Failed to read error status block address for hardware error source: %d.\n",
+				    "Failed to read error status block address for hardware error source: %d.\n",
 				   g->header.source_id);
 		return -EIO;
 	}
@@ -417,9 +359,9 @@ static int __ghes_peek_estatus(struct ghes *ghes,
 	return 0;
 }
 
-static int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
-			       u64 buf_paddr, enum fixed_addresses fixmap_idx,
-			       size_t buf_len)
+int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
+			u64 buf_paddr, enum fixed_addresses fixmap_idx,
+			size_t buf_len)
 {
 	ghes_copy_tofrom_phys(estatus, buf_paddr, buf_len, 1, fixmap_idx);
 	if (cper_estatus_check(estatus)) {
@@ -431,9 +373,9 @@ static int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
 	return 0;
 }
 
-static int ghes_read_estatus(struct ghes *ghes,
-			     struct acpi_hest_generic_status *estatus,
-			     u64 *buf_paddr, enum fixed_addresses fixmap_idx)
+int ghes_read_estatus(struct ghes *ghes,
+		      struct acpi_hest_generic_status *estatus,
+		      u64 *buf_paddr, enum fixed_addresses fixmap_idx)
 {
 	int rc;
 
@@ -449,9 +391,9 @@ static int ghes_read_estatus(struct ghes *ghes,
 				   cper_estatus_len(estatus));
 }
 
-static void ghes_clear_estatus(struct ghes *ghes,
-			       struct acpi_hest_generic_status *estatus,
-			       u64 buf_paddr, enum fixed_addresses fixmap_idx)
+void ghes_clear_estatus(struct ghes *ghes,
+			struct acpi_hest_generic_status *estatus,
+			u64 buf_paddr, enum fixed_addresses fixmap_idx)
 {
 	estatus->block_status = 0;
 
diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
new file mode 100644
index 000000000000..a38e3440b927
--- /dev/null
+++ b/include/acpi/ghes_cper.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Shared GHES declarations for firmware-first CPER error handling.
+ *
+ * This header groups the GHES declarations that are needed by the shared
+ * CPER handling path.
+ *
+ * The split lets GHES and other firmware-first error sources use the same
+ * code for reading status blocks, caching records, handling vendor data,
+ * and reporting errors, so the non-ACPI path follows the same behavior as
+ * GHES instead of carrying a separate copy.
+ *
+ * Derived from the ACPI APEI GHES driver.
+ *
+ * Copyright 2010,2011 Intel Corp.
+ *   Author: Huang Ying <ying.huang@intel.com>
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
+struct ghes *ghes_new(struct acpi_hest_generic *generic);
+void ghes_fini(struct ghes *ghes);
+
+int ghes_read_estatus(struct ghes *ghes,
+		      struct acpi_hest_generic_status *estatus,
+		      u64 *buf_paddr, enum fixed_addresses fixmap_idx);
+void ghes_clear_estatus(struct ghes *ghes,
+			struct acpi_hest_generic_status *estatus,
+			u64 buf_paddr, enum fixed_addresses fixmap_idx);
+int __ghes_peek_estatus(struct ghes *ghes,
+			struct acpi_hest_generic_status *estatus,
+			u64 *buf_paddr, enum fixed_addresses fixmap_idx);
+int __ghes_check_estatus(struct ghes *ghes,
+			 struct acpi_hest_generic_status *estatus);
+int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
+			u64 buf_paddr, enum fixed_addresses fixmap_idx,
+			size_t buf_len);
+
+#endif /* ACPI_APEI_GHES_CPER_H */

-- 
2.43.0


