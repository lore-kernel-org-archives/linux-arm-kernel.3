Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E53FD6EBEE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 08:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtxDteUQANuXWDuPp+gVVeXvVFPALeCpP0k9WCF8cZg=; b=wbRNMXrTvzdvefsaluBo0i8id4
	Z0EqtqmCiSZSqFzwiqgR4fxVhDqOiQgrSxgptKVjPkvjyqBmpMg1I1FW2amXxUUPWPbQ8MDB8eG7K
	ND0m+vRVmM2G0oJqumD2ciKl8Z3I+J2p04R7JgO2IA+IInYYWLSTg3MMR/aqhLmPzJ8IErRqJTYIr
	R/nZPYaOYCw7gpX7oLKVdz3QaXK3M76qOQF8lx6FkqRhRfUNUqtSYALKlcbjHoQ7mc8Tn/714PAkd
	ZlzOIqKth/pCPVOdu36AKxZX3A3zoUnDKZbh2m42opEf7BVq/mxFjbdxnYNbLKWx+cKRLbo06QByq
	tZ7Z8kbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwnC-0000000HFnK-2s6N;
	Fri, 29 Nov 2024 08:56:02 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwfh-0000000HECD-29df
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 08:48:18 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT5L4uH018091;
	Fri, 29 Nov 2024 00:48:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=r
	txDteUQANuXWDuPp+gVVeXvVFPALeCpP0k9WCF8cZg=; b=hEQh3H8LCeCEKIMZb
	abAHQiywzYYVD8YxRDhwDbg+4bP5ad/EOiOO02Kben9BNBx6NJ150UzpmgtZCuG7
	F1nY1+oFpkXr07B0veXl3v7zOqCWpWDJaBwKWlMKRu8Shqg7B+coCWuQb2QoQB9p
	D5GfiIs3G9/XF2Z5lhcVdN8mvv3MNnXuUm8QhrcuRj8Lk0L6K50UMkZ59acYbaXX
	UZtfdzfWeTRx+7xmLB5XBbSwwIVybaqIuKBWIQWfLjS0vhNjUGASGigApIUFiHzM
	lO1bxfB4yja4DCxIy89f2Q3H1C8C2bBWXdHEwwPpv64e7c8I5vqQgDw6eSWxoDEZ
	3yyfA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 43771jgbnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 00:48:11 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 29 Nov 2024 00:48:10 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 29 Nov 2024 00:48:10 -0800
Received: from virtx40.. (unknown [10.28.34.196])
	by maili.marvell.com (Postfix) with ESMTP id CDD135C68F3;
	Fri, 29 Nov 2024 00:48:06 -0800 (PST)
From: Linu Cherian <lcherian@marvell.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <james.clark@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>, Linu Cherian <lcherian@marvell.com>
Subject: [PATCH v12 7/8] coresight: config: Add preloaded configuration
Date: Fri, 29 Nov 2024 14:17:13 +0530
Message-ID: <20241129084714.3057080-8-lcherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129084714.3057080-1-lcherian@marvell.com>
References: <20241129084714.3057080-1-lcherian@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: hJyUGlFAWlqzt-4PuWXq3t6Bjwj8m6ow
X-Proofpoint-GUID: hJyUGlFAWlqzt-4PuWXq3t6Bjwj8m6ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_004817_556245_1C90F9E2 
X-CRM114-Status: GOOD (  21.19  )
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

Add a preloaded configuration for generating
external trigger on address match. This can be
used by CTI and ETR blocks to stop trace capture
on kernel panic.

Kernel address for "panic" function is used as the
default trigger address.

This new configuration is available as,
/sys/kernel/config/cs-syscfg/configurations/panicstop

Signed-off-by: Linu Cherian <lcherian@marvell.com>
Reviewed-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/Makefile          |  2 +-
 .../coresight/coresight-cfg-preload.c         |  2 +
 .../coresight/coresight-cfg-preload.h         |  2 +
 .../hwtracing/coresight/coresight-cfg-pstop.c | 83 +++++++++++++++++++
 4 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pstop.c

diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b31..46ce7f39d05f 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -25,7 +25,7 @@ subdir-ccflags-y += $(condflags)
 obj-$(CONFIG_CORESIGHT) += coresight.o
 coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
 		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
-		coresight-cfg-preload.o coresight-cfg-afdo.o \
+		coresight-cfg-preload.o coresight-cfg-afdo.o coresight-cfg-pstop.o \
 		coresight-syscfg-configfs.o coresight-trace-id.o
 obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o
 coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o \
diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.c b/drivers/hwtracing/coresight/coresight-cfg-preload.c
index e237a4edfa09..4980e68483c5 100644
--- a/drivers/hwtracing/coresight/coresight-cfg-preload.c
+++ b/drivers/hwtracing/coresight/coresight-cfg-preload.c
@@ -13,6 +13,7 @@
 static struct cscfg_feature_desc *preload_feats[] = {
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	&strobe_etm4x,
+	&gen_etrig_etm4x,
 #endif
 	NULL
 };
@@ -20,6 +21,7 @@ static struct cscfg_feature_desc *preload_feats[] = {
 static struct cscfg_config_desc *preload_cfgs[] = {
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	&afdo_etm4x,
+	&pstop_etm4x,
 #endif
 	NULL
 };
diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.h b/drivers/hwtracing/coresight/coresight-cfg-preload.h
index 21299e175477..291ba530a6a5 100644
--- a/drivers/hwtracing/coresight/coresight-cfg-preload.h
+++ b/drivers/hwtracing/coresight/coresight-cfg-preload.h
@@ -10,4 +10,6 @@
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 extern struct cscfg_feature_desc strobe_etm4x;
 extern struct cscfg_config_desc afdo_etm4x;
+extern struct cscfg_feature_desc gen_etrig_etm4x;
+extern struct cscfg_config_desc pstop_etm4x;
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-cfg-pstop.c b/drivers/hwtracing/coresight/coresight-cfg-pstop.c
new file mode 100644
index 000000000000..c2bfbd07bfaf
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-cfg-pstop.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2023  Marvell.
+ * Based on coresight-cfg-afdo.c
+ */
+
+#include "coresight-config.h"
+
+/* ETMv4 includes and features */
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+#include "coresight-etm4x-cfg.h"
+
+/* preload configurations and features */
+
+/* preload in features for ETMv4 */
+
+/* panic_stop feature */
+static struct cscfg_parameter_desc gen_etrig_params[] = {
+	{
+		.name = "address",
+		.value = (u64)panic,
+	},
+};
+
+static struct cscfg_regval_desc gen_etrig_regs[] = {
+	/* resource selector */
+	{
+		.type = CS_CFG_REG_TYPE_RESOURCE,
+		.offset = TRCRSCTLRn(2),
+		.hw_info = ETM4_CFG_RES_SEL,
+		.val32 = 0x40001,
+	},
+	/* single address comparator */
+	{
+		.type = CS_CFG_REG_TYPE_RESOURCE | CS_CFG_REG_TYPE_VAL_64BIT |
+			CS_CFG_REG_TYPE_VAL_PARAM,
+		.offset =  TRCACVRn(0),
+		.val32 = 0x0,
+	},
+	{
+		.type = CS_CFG_REG_TYPE_RESOURCE,
+		.offset = TRCACATRn(0),
+		.val64 = 0xf00,
+	},
+	/* Driver external output[0] with comparator out */
+	{
+		.type = CS_CFG_REG_TYPE_RESOURCE,
+		.offset = TRCEVENTCTL0R,
+		.val32 = 0x2,
+	},
+	/* end of regs */
+};
+
+struct cscfg_feature_desc gen_etrig_etm4x = {
+	.name = "gen_etrig",
+	.description = "Generate external trigger on address match\n"
+		       "parameter \'address\': address of kernel address\n",
+	.match_flags = CS_CFG_MATCH_CLASS_SRC_ETM4,
+	.nr_params = ARRAY_SIZE(gen_etrig_params),
+	.params_desc = gen_etrig_params,
+	.nr_regs = ARRAY_SIZE(gen_etrig_regs),
+	.regs_desc = gen_etrig_regs,
+};
+
+/* create a panic stop configuration */
+
+/* the total number of parameters in used features */
+#define PSTOP_NR_PARAMS	ARRAY_SIZE(gen_etrig_params)
+
+static const char *pstop_ref_names[] = {
+	"gen_etrig",
+};
+
+struct cscfg_config_desc pstop_etm4x = {
+	.name = "panicstop",
+	.description = "Stop ETM on kernel panic\n",
+	.nr_feat_refs = ARRAY_SIZE(pstop_ref_names),
+	.feat_ref_names = pstop_ref_names,
+	.nr_total_params = PSTOP_NR_PARAMS,
+};
+
+/* end of ETM4x configurations */
+#endif	/* IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) */
-- 
2.34.1


