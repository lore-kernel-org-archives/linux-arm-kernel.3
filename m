Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B7F1077612
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 20:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gq8UslYK5xtWqV3A1+ae8aY+sThW9IqAg0/n/q9jLlA=; b=zjN53aiv4IcaOM9/8qktNWi2w4
	FyKeF4Sl9AK2AK8r9bzI9IbhdyN3lc9fO8h8kyGfgYG/r8Ygy0A0lkti95qBW+nuCQpIOMmkqyEGQ
	G/7MxEGUXXFyHS5u4ipJOKaxTv5RUJx+KCMvYznWjCy+zf8TBTEqjqrHTYGm/sMQlPuVG0vz8MKrS
	5Qi3thG5vJz9tWhFJh8JzdmqIL3gfUWnuEQJo2HBFJKxPVfpPoFLnV609f33N9UcMIo97M7oLnN/d
	KvMYloWnxLfGvGk9LW9eC4cPjLUXa6WMwbh4hkdq5q/eGBs7+csjnlqgGEyqtUMS/5+/jl/TtRi5/
	SCF0Ot4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xpa-00000009KYN-3Neu;
	Wed, 18 Mar 2026 20:49:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xpS-00000009KTD-2suT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 20:49:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 600AA1BF7;
	Wed, 18 Mar 2026 13:49:15 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 849313F7BD;
	Wed, 18 Mar 2026 13:49:19 -0700 (PDT)
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Wed, 18 Mar 2026 20:48:02 +0000
Subject: [PATCH v3 05/10] ACPI: APEI: GHES: move vendor record helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-5-48e6a1c249ef@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866948; l=5704;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=n1fM29r4nuASTUHjHGhOCx77QdCEEOEgi8pNrgOqOLY=;
 b=MbC9LDgfo3k+E88lGzvGVrrqmdTJmvhilKaaxuunBzgcUB79Xdb4VDFcQ08KJnZ99GSPWFKy5
 /onGrfHdHMZATORliLlIYjw6lZQgh1cIqXWG/lA9+Zl4o48k3YbA2tT
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_134922_820016_6B633ED3 
X-CRM114-Status: GOOD (  12.34  )
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

Shift the vendor record workqueue helpers into ghes_cper.c so both GHES
and future DT-based providers can use the same implementation. The change
is mechanical and keeps the notifier behavior identical.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/acpi/apei/ghes.c      | 50 ---------------------------------------
 drivers/acpi/apei/ghes_cper.c | 55 +++++++++++++++++++++++++++++++++++++++++++
 include/acpi/ghes_cper.h      |  2 ++
 3 files changed, 57 insertions(+), 50 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 8a9b4dda3748..9703c602a8c2 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -383,56 +383,6 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
 #endif
 }
 
-static BLOCKING_NOTIFIER_HEAD(vendor_record_notify_list);
-
-int ghes_register_vendor_record_notifier(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_register(&vendor_record_notify_list, nb);
-}
-EXPORT_SYMBOL_GPL(ghes_register_vendor_record_notifier);
-
-void ghes_unregister_vendor_record_notifier(struct notifier_block *nb)
-{
-	blocking_notifier_chain_unregister(&vendor_record_notify_list, nb);
-}
-EXPORT_SYMBOL_GPL(ghes_unregister_vendor_record_notifier);
-
-static void ghes_vendor_record_work_func(struct work_struct *work)
-{
-	struct ghes_vendor_record_entry *entry;
-	struct acpi_hest_generic_data *gdata;
-	u32 len;
-
-	entry = container_of(work, struct ghes_vendor_record_entry, work);
-	gdata = GHES_GDATA_FROM_VENDOR_ENTRY(entry);
-
-	blocking_notifier_call_chain(&vendor_record_notify_list,
-				     entry->error_severity, gdata);
-
-	len = GHES_VENDOR_ENTRY_LEN(acpi_hest_get_record_size(gdata));
-	gen_pool_free(ghes_estatus_pool, (unsigned long)entry, len);
-}
-
-static void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
-					  int sev)
-{
-	struct acpi_hest_generic_data *copied_gdata;
-	struct ghes_vendor_record_entry *entry;
-	u32 len;
-
-	len = GHES_VENDOR_ENTRY_LEN(acpi_hest_get_record_size(gdata));
-	entry = (void *)gen_pool_alloc(ghes_estatus_pool, len);
-	if (!entry)
-		return;
-
-	copied_gdata = GHES_GDATA_FROM_VENDOR_ENTRY(entry);
-	memcpy(copied_gdata, gdata, acpi_hest_get_record_size(gdata));
-	entry->error_severity = sev;
-
-	INIT_WORK(&entry->work, ghes_vendor_record_work_func);
-	schedule_work(&entry->work);
-}
-
 /* Room for 8 entries */
 #define CXL_CPER_PROT_ERR_FIFO_DEPTH 8
 static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
index 0a117f478afb..131980d36064 100644
--- a/drivers/acpi/apei/ghes_cper.c
+++ b/drivers/acpi/apei/ghes_cper.c
@@ -14,12 +14,17 @@
 
 #include <linux/err.h>
 #include <linux/genalloc.h>
+#include <linux/irq_work.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/math64.h>
 #include <linux/mm.h>
+#include <linux/notifier.h>
+#include <linux/llist.h>
 #include <linux/ratelimit.h>
 #include <linux/rcupdate.h>
+#include <linux/rculist.h>
 #include <linux/sched/clock.h>
 #include <linux/slab.h>
 
@@ -266,6 +271,56 @@ void ghes_clear_estatus(struct ghes *ghes,
 		ghes_ack_error(ghes->generic_v2);
 }
 
+static BLOCKING_NOTIFIER_HEAD(vendor_record_notify_list);
+
+int ghes_register_vendor_record_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&vendor_record_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(ghes_register_vendor_record_notifier);
+
+void ghes_unregister_vendor_record_notifier(struct notifier_block *nb)
+{
+	blocking_notifier_chain_unregister(&vendor_record_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(ghes_unregister_vendor_record_notifier);
+
+static void ghes_vendor_record_work_func(struct work_struct *work)
+{
+	struct ghes_vendor_record_entry *entry;
+	struct acpi_hest_generic_data *gdata;
+	u32 len;
+
+	entry = container_of(work, struct ghes_vendor_record_entry, work);
+	gdata = GHES_GDATA_FROM_VENDOR_ENTRY(entry);
+
+	blocking_notifier_call_chain(&vendor_record_notify_list,
+				     entry->error_severity, gdata);
+
+	len = GHES_VENDOR_ENTRY_LEN(acpi_hest_get_record_size(gdata));
+	gen_pool_free(ghes_estatus_pool, (unsigned long)entry, len);
+}
+
+void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
+				   int sev)
+{
+	struct acpi_hest_generic_data *copied_gdata;
+	struct ghes_vendor_record_entry *entry;
+	u32 len;
+
+	len = GHES_VENDOR_ENTRY_LEN(acpi_hest_get_record_size(gdata));
+	entry = (void *)gen_pool_alloc(ghes_estatus_pool, len);
+	if (!entry)
+		return;
+
+	copied_gdata = GHES_GDATA_FROM_VENDOR_ENTRY(entry);
+	memcpy(copied_gdata, gdata, acpi_hest_get_record_size(gdata));
+	entry->error_severity = sev;
+
+	INIT_WORK(&entry->work, ghes_vendor_record_work_func);
+	schedule_work(&entry->work);
+}
+
 /*
  * GHES error status reporting throttle, to report more kinds of
  * errors, instead of just most frequently occurred errors.
diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
index 627fb1a5a121..6a37c03397fc 100644
--- a/include/acpi/ghes_cper.h
+++ b/include/acpi/ghes_cper.h
@@ -105,5 +105,7 @@ int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
 int ghes_estatus_cached(struct acpi_hest_generic_status *estatus);
 void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
 			    struct acpi_hest_generic_status *estatus);
+void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
+				   int sev);
 
 #endif /* ACPI_APEI_GHES_CPER_H */

-- 
2.43.0


