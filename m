Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF984D6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zl7/1rExuU1sck6Yj6OK3zUURvMQpnT89RtkeeETrw=; b=pnqou9ognN7Aa9mS6AC2ZiA/Ij
	8GxoOFohqhJXx3F1wBDyfNAh7fBKlcVnYpXQeyHiCD7zW7UEhyYOs4jcRyyTVZhuBkEyxfcERijUR
	802xSeK6bsx/r7VyT0BlPCMcmvLo/L5FHX5rARZA7mtWzJ1/unk9gbYYvWA18TXgkntc3N/pYmSWF
	wGDKce0U6PQfyLqPL2DF78PPCHftPon5bpmnMJvv/DFyvHtPDFVmr7t9ikCjyXBiHaRF+mHtI+WVq
	tzZfdzxmbxpxEfVKHyN1fmRhkYQsF6h9yPqlYqwfh2avg6q5O79knnGwPWrrm9R6SD1o734PlFatD
	l8bWFXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpjy-00000006j1u-2d1U;
	Wed, 17 Dec 2025 11:30:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpjv-00000006j09-3vQK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:30:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 043F31684;
	Wed, 17 Dec 2025 03:30:36 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A6B83F73B;
	Wed, 17 Dec 2025 03:30:41 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	ahmed.tiba@arm.com
Subject: [PATCH 07/12] ghes: prepare estatus hooks for shared handling
Date: Wed, 17 Dec 2025 11:28:40 +0000
Message-ID: <20251217112845.1814119-8-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217112845.1814119-1-ahmed.tiba@arm.com>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_033044_098866_7AE0BEC0 
X-CRM114-Status: GOOD (  12.95  )
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

Introduce struct estatus_source inside struct ghes and export thin
wrappers around the existing GHES estatus helpers. These helpers are
not ACPI-specific, so moving them behind a common interface is the
first step toward reusing the logic for other firmware providers.
Behaviour stays the same for GHES in this patch.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/acpi/apei/Kconfig      |  1 +
 drivers/firmware/efi/estatus.c |  3 +--
 include/acpi/ghes.h            | 17 +++++++++++++----
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 070c07d68dfb..90cb8360988b 100644
--- a/drivers/acpi/apei/Kconfig
+++ b/drivers/acpi/apei/Kconfig
@@ -24,6 +24,7 @@ config ACPI_APEI_GHES
 	select IRQ_WORK
 	select GENERIC_ALLOCATOR
 	select ARM_SDE_INTERFACE if ARM64
+	select RAS_ESTATUS_CORE
 	help
 	  Generic Hardware Error Source provides a way to report
 	  platform hardware errors (such as that from chipset). It
diff --git a/drivers/firmware/efi/estatus.c b/drivers/firmware/efi/estatus.c
index 8043d68f907b..259122730303 100644
--- a/drivers/firmware/efi/estatus.c
+++ b/drivers/firmware/efi/estatus.c
@@ -654,9 +654,8 @@ static bool estatus_handle_arm_hw_error(estatus_generic_data *gdata, int sev, bo
 	int sec_sev, i;
 	char *p;
 
-	log_arm_hw_error(err);
-
 	sec_sev = estatus_severity(gdata->error_severity);
+	log_arm_hw_error(err, sec_sev);
 	if (sev != ESTATUS_SEV_RECOVERABLE || sec_sev != ESTATUS_SEV_RECOVERABLE)
 		return false;
 
diff --git a/include/acpi/ghes.h b/include/acpi/ghes.h
index 022c0325f1e0..7dc6acde3e2e 100644
--- a/include/acpi/ghes.h
+++ b/include/acpi/ghes.h
@@ -5,6 +5,7 @@
 #include <acpi/apei.h>
 #include <acpi/hed.h>
 #include <linux/estatus.h>
+#include <linux/notifier.h>
 
 /*
  * One struct ghes is created for each generic hardware error source.
@@ -22,6 +23,7 @@ struct ghes {
 		struct acpi_hest_generic_v2 *generic_v2;
 	};
 	struct acpi_hest_generic_status *estatus;
+	struct estatus_source estatus_src;
 	unsigned long flags;
 	union {
 		struct list_head list;
@@ -30,6 +32,7 @@ struct ghes {
 	};
 	struct device *dev;
 	struct list_head elist;
+	char name[32];
 };
 
 struct ghes_estatus_node {
@@ -47,10 +50,10 @@ struct ghes_estatus_cache {
 };
 
 enum {
-	GHES_SEV_NO = 0x0,
-	GHES_SEV_CORRECTED = 0x1,
-	GHES_SEV_RECOVERABLE = 0x2,
-	GHES_SEV_PANIC = 0x3,
+	GHES_SEV_NO = ESTATUS_SEV_NO,
+	GHES_SEV_CORRECTED = ESTATUS_SEV_CORRECTED,
+	GHES_SEV_RECOVERABLE = ESTATUS_SEV_RECOVERABLE,
+	GHES_SEV_PANIC = ESTATUS_SEV_PANIC,
 };
 
 #ifdef CONFIG_ACPI_APEI_GHES
@@ -73,6 +76,12 @@ void ghes_unregister_vendor_record_notifier(struct notifier_block *nb);
 struct list_head *ghes_get_devices(void);
 
 void ghes_estatus_pool_region_free(unsigned long addr, u32 size);
+int ghes_register_vendor_record_notifier(struct notifier_block *nb);
+void ghes_unregister_vendor_record_notifier(struct notifier_block *nb);
+void ghes_register_report_chain(struct notifier_block *nb);
+void ghes_unregister_report_chain(struct notifier_block *nb);
+
+void estatus_pool_region_free(unsigned long addr, u32 size);
 #else
 static inline struct list_head *ghes_get_devices(void) { return NULL; }
 
-- 
2.43.0


