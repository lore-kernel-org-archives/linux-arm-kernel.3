Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05405CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c5NxYvFvL/jndoxvRNa18qenlGhwJDkcbdhMzc8KF+4=; b=dTpjlw/KnXwpWSu/Z19SkDyMNY
	BC9Evhlcba+6pmngAIuDzAFa390FPYC1sbOSnEO4F2/KdAnWNXxlhfNQ/k9FMpCGVe7S02pNR+UTX
	nFe4c2+ga3rnUoC6JS9Lz9rA7+zs9Gya/SIGjp8YaEC63vjfGLx6zKawqy6952r7XfUKDfcwy/RCO
	Pt+7NYJAcES+i+5A9+IP7Ud/i+hybjihch+lxa54rxbDkUpAlnOfVHDydupI1I5DiVJU2+31eYBDb
	g7bbKmkybDmzC+D3OW1UXVRFVIgne9gAwJLBiwU+QtZBNaWnTwlCiaXiZ6wIINieIFgCWh1dsm71b
	Ctefkrtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuKC-00000002ZNx-12eG;
	Fri, 15 Aug 2025 13:18:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrfC-00000002CvI-3heR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 10:28:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B7D91691;
	Fri, 15 Aug 2025 03:27:50 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D7853F738;
	Fri, 15 Aug 2025 03:27:55 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	johan+linaro@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	quic_mdtipton@quicinc.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 1/2] firmware: arm_scmi: Rework quirks framework header
Date: Fri, 15 Aug 2025 11:27:35 +0100
Message-ID: <20250815102736.81450-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_032759_039489_EAFDD61C 
X-CRM114-Status: GOOD (  16.03  )
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

Split and relocate the quirks framework header so as to be usable also by
SCMI Drivers and not only by the core.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c  |  2 +-
 drivers/firmware/arm_scmi/driver.c |  1 +
 drivers/firmware/arm_scmi/quirks.h | 33 +++-------------------
 include/linux/scmi_quirks.h        | 44 ++++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+), 30 deletions(-)
 create mode 100644 include/linux/scmi_quirks.h

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index afa7981efe82..5599697de37a 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -7,11 +7,11 @@
 
 #include <linux/module.h>
 #include <linux/limits.h>
+#include <linux/scmi_quirks.h>
 #include <linux/sort.h>
 
 #include "protocols.h"
 #include "notify.h"
-#include "quirks.h"
 
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30000
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index bd56a877fdfc..6f5934cd3a65 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -34,6 +34,7 @@
 #include <linux/processor.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
+#include <linux/scmi_quirks.h>
 #include <linux/xarray.h>
 
 #include "common.h"
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index a71fde85a527..260ae38d617b 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -4,49 +4,24 @@
  *
  * Copyright (C) 2025 ARM Ltd.
  */
-#ifndef _SCMI_QUIRKS_H
-#define _SCMI_QUIRKS_H
+#ifndef _SCMI_QUIRKS_INTERNAL_H
+#define _SCMI_QUIRKS_INTERNAL_H
 
-#include <linux/static_key.h>
+#include <linux/device.h>
 #include <linux/types.h>
 
 #ifdef CONFIG_ARM_SCMI_QUIRKS
 
-#define DECLARE_SCMI_QUIRK(_qn)						\
-	DECLARE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn)
-
-/*
- * A helper to associate the actual code snippet to use as a quirk
- * named as _qn.
- */
-#define SCMI_QUIRK(_qn, _blk)						\
-	do {								\
-		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
-			(_blk);						\
-	} while (0)
-
 void scmi_quirks_initialize(void);
 void scmi_quirks_enable(struct device *dev, const char *vend,
 			const char *subv, const u32 impl);
 
 #else
 
-#define DECLARE_SCMI_QUIRK(_qn)
-/* Force quirks compilation even when SCMI Quirks are disabled */
-#define SCMI_QUIRK(_qn, _blk)						\
-	do {								\
-		if (0)							\
-			(_blk);						\
-	} while (0)
-
 static inline void scmi_quirks_initialize(void) { }
 static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 				      const char *sub_vend, const u32 impl) { }
 
 #endif /* CONFIG_ARM_SCMI_QUIRKS */
 
-/* Quirk delarations */
-DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
-DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
-
-#endif /* _SCMI_QUIRKS_H */
+#endif /* _SCMI_QUIRKS_INTERNAL_H */
diff --git a/include/linux/scmi_quirks.h b/include/linux/scmi_quirks.h
new file mode 100644
index 000000000000..11657bd91ffc
--- /dev/null
+++ b/include/linux/scmi_quirks.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * System Control and Management Interface (SCMI) Message Protocol Quirks
+ *
+ * Copyright (C) 2025 ARM Ltd.
+ */
+#ifndef _SCMI_QUIRKS_H
+#define _SCMI_QUIRKS_H
+
+#include <linux/static_key.h>
+#include <linux/types.h>
+
+#ifdef CONFIG_ARM_SCMI_QUIRKS
+
+#define DECLARE_SCMI_QUIRK(_qn)						\
+	DECLARE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn)
+
+/*
+ * A helper to associate the actual code snippet to use as a quirk
+ * named as _qn.
+ */
+#define SCMI_QUIRK(_qn, _blk)						\
+	do {								\
+		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
+			(_blk);						\
+	} while (0)
+
+#else
+
+#define DECLARE_SCMI_QUIRK(_qn)
+/* Force quirks compilation even when SCMI Quirks are disabled */
+#define SCMI_QUIRK(_qn, _blk)						\
+	do {								\
+		if (0)							\
+			(_blk);						\
+	} while (0)
+
+#endif /* CONFIG_ARM_SCMI_QUIRKS */
+
+/* Quirk delarations */
+DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
+
+#endif /* _SCMI_QUIRKS_H */
-- 
2.50.1


