Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C22CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jMeb1ZKqldVROsPqlULq0pmp+Dr4cuGsBQBPI3bokCE=; b=H5ozEDWDOp6R4mY/c9n3baZREm
	wo2HwylAQM+bHnmvWkkIIk7hkrObNIDfiqBUjCIOTbxpNjulwtqnwR8e5S7Hv7lzCclRNUn5256ML
	8Ivt+y0LszXWnlxplnFAfmRf8wvIKI38pgsHL7gHLpBtwekX9tWGjDYT7tdhfwkMYpkpDUX19V6Wx
	eWHatRa10EXHS+h7gFVWUErursWDXw+qt7Evlov89pxNLAGO8bpADoO27K7uRF3+ogAx4Wu5w54YT
	1OHdKupxr1jboN47EYaZ3APO+RRZ56RUJsARBzPFgleQoklytCEU7aoJtKx+mJ6+2FEJRB7yTlgfn
	h1wqZ+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYO58-0000000CJTy-08C3;
	Sat, 13 Jun 2026 13:07:26 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYO54-0000000CJTH-2D2u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 13:07:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jMeb1ZKqldVROsPqlULq0pmp+Dr4cuGsBQBPI3bokCE=;
	b=KhGgTo6MbZ5FjaMBJzfhdvo0UPBmJ3rXnIc4Ha/PJQjv0pdc9fcPs651EyVf2R7g+hDcaKQoS
	VNWKsF06R59ny0ZyCfQveYwiPEgMmztgvECkrAGRPO4VzQNmBwSDw2HLJCxYs+9O84QkbG2D+AS
	KUrE2E/9FWbx5c7fM/hRaeE=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gcxK50s1CzcbPX;
	Sat, 13 Jun 2026 20:58:49 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jMeb1ZKqldVROsPqlULq0pmp+Dr4cuGsBQBPI3bokCE=;
	b=KhGgTo6MbZ5FjaMBJzfhdvo0UPBmJ3rXnIc4Ha/PJQjv0pdc9fcPs651EyVf2R7g+hDcaKQoS
	VNWKsF06R59ny0ZyCfQveYwiPEgMmztgvECkrAGRPO4VzQNmBwSDw2HLJCxYs+9O84QkbG2D+AS
	KUrE2E/9FWbx5c7fM/hRaeE=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gcxJx18gkz1T4HG;
	Sat, 13 Jun 2026 20:58:41 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id 98DD040538;
	Sat, 13 Jun 2026 21:07:06 +0800 (CST)
Received: from mdc.huawei.com (10.50.87.204) by dggpemf100008.china.huawei.com
 (7.185.36.138) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 13 Jun
 2026 21:07:05 +0800
From: Chen Jun <chenjun102@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <chenjun102@huawei.com>, <zhangyuwei20@huawei.com>
Subject: [PATCH] iommu/arm-smmu-v3: Add tracepoint for EVTQ events
Date: Sat, 13 Jun 2026 21:00:07 +0800
Message-ID: <20260613130007.18563-1-chenjun102@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.204]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf100008.china.huawei.com (7.185.36.138)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_060723_183103_F7CA20EA 
X-CRM114-Status: GOOD (  16.59  )
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

Events reported by the SMMU can severely impact accelerator
performance. Currently, only events that the SMMU fails to handle are
printed to the kernel log, leaving most events invisible to users.
To analyze and optimize accelerator performance, complete visibility
into all SMMU-reported events is required.

Add a tracepoint in the EVTQ interrupt handler to capture every
event record reported by the SMMU. This allows users to collect all
event information via ftrace/perf for further analysis, complementing
the existing event decoder and error dump which only cover a subset
of events.

Signed-off-by: Chen Jun <chenjun102@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile      |  2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  3 ++
 drivers/iommu/arm/arm-smmu-v3/trace.c       |  9 ++++
 drivers/iommu/arm/arm-smmu-v3/trace.h       | 53 +++++++++++++++++++++
 4 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/trace.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/trace.h

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 493a659cc66b..63a8d71bfc93 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
-arm_smmu_v3-y := arm-smmu-v3.o
+arm_smmu_v3-y := arm-smmu-v3.o trace.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..85e6c25b73ed 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -34,6 +34,8 @@
 #include "arm-smmu-v3.h"
 #include "../../dma-iommu.h"
 
+#include "trace.h"
+
 static bool disable_msipolling;
 module_param(disable_msipolling, bool, 0444);
 MODULE_PARM_DESC(disable_msipolling,
@@ -2271,6 +2273,7 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 
 	do {
 		while (!queue_remove_raw(q, evt)) {
+			trace_smmu_evtq_event(smmu, evt);
 			arm_smmu_decode_event(smmu, evt, &event);
 			if (arm_smmu_handle_event(smmu, evt, &event))
 				arm_smmu_dump_event(smmu, evt, &event, &rs);
diff --git a/drivers/iommu/arm/arm-smmu-v3/trace.c b/drivers/iommu/arm/arm-smmu-v3/trace.c
new file mode 100644
index 000000000000..77378698b1a3
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/trace.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM SMMUv3 trace support
+ *
+ * Copyright (c) 2026 OpenCloudOS / openEuler
+ */
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
diff --git a/drivers/iommu/arm/arm-smmu-v3/trace.h b/drivers/iommu/arm/arm-smmu-v3/trace.h
new file mode 100644
index 000000000000..7cec8d41745e
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/trace.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ARM SMMUv3 trace support
+ *
+ * Copyright (c) 2026 OpenCloudOS / openEuler
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM arm_smmu_v3
+
+#if !defined(_TRACE_ARM_SMMU_V3_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_ARM_SMMU_V3_H
+
+#include <linux/tracepoint.h>
+
+#include "arm-smmu-v3.h"
+
+TRACE_EVENT(smmu_evtq_event,
+
+	TP_PROTO(struct arm_smmu_device *smmu, u64 *evt),
+
+	TP_ARGS(smmu, evt),
+
+	TP_STRUCT__entry(
+		__string(iommu, dev_name(smmu->dev))
+		__field(u64, evt0)
+		__field(u64, evt1)
+		__field(u64, evt2)
+		__field(u64, evt3)
+	),
+
+	TP_fast_assign(
+		__assign_str(iommu);
+		__entry->evt0 = evt[0];
+		__entry->evt1 = evt[1];
+		__entry->evt2 = evt[2];
+		__entry->evt3 = evt[3];
+	),
+
+	TP_printk("%s evt: 0x%016llx 0x%016llx 0x%016llx 0x%016llx",
+		__get_str(iommu),
+		__entry->evt0, __entry->evt1,
+		__entry->evt2, __entry->evt3)
+);
+
+#endif /* _TRACE_ARM_SMMU_V3_H */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH ../../drivers/iommu/arm/arm-smmu-v3/
+#define TRACE_INCLUDE_FILE trace
+#include <trace/define_trace.h>
-- 
2.22.0


