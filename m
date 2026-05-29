Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FBACD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkiMttwIgoXhZi/gH2oKGVSeMrrm1y6acVuy0L04MRs=; b=IR6tvFV0r7u4WqhEf8VzHZ1J0b
	G4//A2YNLlgl9qHx6IjXMnY2lJoaMhLWenE0fLRNzdt/FuiyKrMCCM9946a8iAFgbgeBCapgAE8wr
	3FvA4bdcVOWfug2WhhryAKXpmoI/gDgZcrNaODsMbEkcYtTsE6nFqcpkCR3btPNhpj6N+C/oxMhga
	0h7FEre7arE/BlWGHmOz5d6U8XLEQ+JlzTKrKjB5EENVxgv/EGlVny4Xd6UScBBRw3dT/iN1OOfzW
	KglNeiOBMYUlM2f8plAbpKqT2GmRwlN/9c+fIDE600cyhxvNfXZ5b//cqaYcfyJXNHNqbAyGWSziI
	4O5iyIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStsX-000000076eX-3zzt;
	Fri, 29 May 2026 09:51:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStsQ-000000076ZH-1Obl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:51:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEB3A22D7;
	Fri, 29 May 2026 02:51:32 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BB113F905;
	Fri, 29 May 2026 02:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780048297; bh=GmkCj4OmkhZ+C8RQK5gSKhS8oTWK81IqKjqv4BAeWFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jPChF0w2ThAMptcfhQc729JlCBStycoP9pNFHoBh+sFE7JnyusHAqMuePqhDxX9cL
	 Yl6VzT+73zjl36EV8at8RGG3ciD+t6Z/UNTx5yGdgUrqgHJ8vLuxSL4AC0/dGpx4Q8
	 WEp4rOh7ZloaCdyY6mwIrzvQ8+cgpzbopQol+l50=
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Fri, 29 May 2026 10:50:45 +0100
Subject: [PATCH v5 05/10] ACPI: APEI: GHES: move vendor record helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-5-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
To: will@kernel.org, jic23@kernel.org, xueshuai@linux.alibaba.com, 
 saket.dumbre@intel.com, mchehab@kernel.org, dave@stgolabs.net, 
 djbw@kernel.org, bp@alien8.de, tony.luck@intel.com, guohanjun@huawei.com, 
 lenb@kernel.org, skhan@linuxfoundation.org, vishal.l.verma@intel.com, 
 rafael@kernel.org, corbet@lwn.net, ira.weiny@intel.com, 
 dave.jiang@intel.com, krzk+dt@kernel.org, robh@kernel.org, 
 catalin.marinas@arm.com, alison.schofield@intel.com, conor+dt@kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, linux-arm-kernel@lists.infradead.org, 
 Michael.Zhao2@arm.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, 
 Dmitry.Lamerov@arm.com, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, 
 acpica-devel@lists.linux.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780048269; l=6986;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=GmkCj4OmkhZ+C8RQK5gSKhS8oTWK81IqKjqv4BAeWFY=;
 b=KYRHDopWA2jNC6aRw2sm23yL35zhS2/aRndc8n6oRzMg8zJgGINYWaozijmn6Iv+o7C8Ef0iD
 X4Q0q9JnPfYApW6w8sB9qhEULNwYr6g9ZtjRdHphF2QG+Su1ZN3iDWo
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_025138_475913_3D2D3F33 
X-CRM114-Status: GOOD (  14.02  )
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
 drivers/acpi/apei/ghes.c      | 86 +++++++++----------------------------------
 drivers/acpi/apei/ghes_cper.c | 55 +++++++++++++++++++++++++++
 include/acpi/ghes_cper.h      |  2 +
 3 files changed, 75 insertions(+), 68 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index adab7404310e..81ac51632f21 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -383,74 +383,6 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
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
-static void ghes_vendor_record_notifier_destroy(void *nb)
-{
-	ghes_unregister_vendor_record_notifier(nb);
-}
-
-int devm_ghes_register_vendor_record_notifier(struct device *dev,
-					      struct notifier_block *nb)
-{
-	int ret;
-
-	ret = ghes_register_vendor_record_notifier(nb);
-	if (ret)
-		return ret;
-
-	return devm_add_action_or_reset(dev, ghes_vendor_record_notifier_destroy, nb);
-}
-EXPORT_SYMBOL_GPL(devm_ghes_register_vendor_record_notifier);
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
@@ -514,6 +446,24 @@ int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data *wd)
 }
 EXPORT_SYMBOL_NS_GPL(cxl_cper_prot_err_kfifo_get, "CXL");
 
+static void ghes_vendor_record_notifier_destroy(void *nb)
+{
+	ghes_unregister_vendor_record_notifier(nb);
+}
+
+int devm_ghes_register_vendor_record_notifier(struct device *dev,
+					      struct notifier_block *nb)
+{
+	int ret;
+
+	ret = ghes_register_vendor_record_notifier(nb);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, ghes_vendor_record_notifier_destroy, nb);
+}
+EXPORT_SYMBOL_GPL(devm_ghes_register_vendor_record_notifier);
+
 /* Room for 8 entries for each of the 4 event log queues */
 #define CXL_CPER_FIFO_DEPTH 32
 DEFINE_KFIFO(cxl_cper_fifo, struct cxl_cper_work_data, CXL_CPER_FIFO_DEPTH);
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
index 1b5dbeca9bb6..51725f25c516 100644
--- a/include/acpi/ghes_cper.h
+++ b/include/acpi/ghes_cper.h
@@ -104,5 +104,7 @@ int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
 int ghes_estatus_cached(struct acpi_hest_generic_status *estatus);
 void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
 			    struct acpi_hest_generic_status *estatus);
+void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
+				   int sev);
 
 #endif /* ACPI_APEI_GHES_CPER_H */

-- 
2.43.0


