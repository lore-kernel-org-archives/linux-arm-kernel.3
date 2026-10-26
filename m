Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5FC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 05:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bakAQFv2;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=XfSR8CFQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gVZ29hv4mBXSdN0ytSbR9uZGNe1W3DPBcdCDlxG+NCg=; b=bakAQFv2PLWWY4bB+s54FC3aKP
	X09ZLECpznZWpqgvgQc4bf+YNJ20Z/5aa79sHVOOkY9Qmi8BY+Cg3+5Jdocpbi2w4F3xjIQlsyd82
	Ekt71V+UDuuwAJJBFgvHRI7ObX6QOSneSmdV6d1tF+wlLxlHof2P4H+XL+5F92P6v4Tq2YRVs/tbU
	cDHu9HIPULgLUYfdeR2WGugVqV0m3B1Jj+O3hZE6gJtZvoNB083H7rJn0UBgM+M7g3ku4VYlZGOiR
	spDRP9R6n6X+6Lkem2ggun54uTw1Gd1GqHSYqDXRYP2HP/KuXA8TD4ug/91JgGgbHnWHQ1Pt6Hnk+
	n0tkH1kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDa6-00000001l0t-042z;
	Mon, 26 Oct 2026 05:49:14 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDZo-00000001kup-0Z0B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 05:48:57 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4v3ww1908862;
	Sun, 25 Oct 2026 22:48:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=gVZ29hv4mBXSdN0ytSbR9uZGNe1W3DPBcdCDl
	xG+NCg=; b=XfSR8CFQYBNgdpJaa6uQ9ZDRGdKD8mfZd0hDGNt0/HQ1RR2j68A5E
	AJTGVPiQQ/UIb0OCle+9aVo+IYSL3CocAC+f/npRnUdCTHGPjplSvtdTag65XjqR
	Qo9hAUfKbxcYYrXT5UTffCAowYGRprZaNhVIjgbWqIE/Y5TRDjVa1aGR+ewGyzXV
	rr3HWolMURhdIGM0bfFx2zQFycYsX/vQu1YaVA/SUYFUMSyInE03QsToQIHqsvko
	a4N8J+Mp5VINYwFFUKVCyl9HdF/1BmOyGU0o8y+vpJQPZt0zPVt48fSccBJU1+5N
	QP2sTPEDHUB0YiVGBHyaJfqRYNKh3xh2g==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgr03fmcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 25 Oct 2026 22:48:42 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:fe::f072) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 26 Oct
 2026 05:48:41 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel
 Pereira <danielmaraboo@gmail.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 7/7] coresight: Add pmu_pulse/extout_pulse
Date: Sun, 25 Oct 2026 22:48:27 -0700
Message-ID: <02268c4958153f6d2e549e4bd7b93f11ed79fa90.1792989860.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792989860.git.aaupov@fb.com>
References: <cover.1792907332.git.aaupov@fb.com> <cover.1792989860.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX6wJsAXK5ehnz
 cfr/lLFbFBBoVyxUWzhMa34fsL2ScwIAxcpBeh2nw8Y3e2Jhh3cMoOFJiu65p/eqGohDA+4ptWk
 I/YzVFyAb+3adBUIpussSY/Kg5Vkol5KX47ltYVTBfibPdDZjYiygZdyx3HPgQv08WlkebkIWND
 TCzinPctxzOmWK9CKvzsIEMY0pjq82894PwFckPaPtDUirjG7voxTYaylEVJ+8pXKi+se7sP5nU
 U4WTUWlXKAyi54Nge/KVYGwPb6OHH1FxURU8FyqO/Cc8QmW88HR7sNM/MKFrFwlBK4Og27KTzDC
 WdE8h2PsidOgsPXwJLhz6y57CjoOiOgkRVplgpY2s6xwNJUvRwCYAeMCPj7lPC1KHqdxWozWoau
 9cClUt8itYeJ2f4bGVXagD8Rphe7x+Rn9f+vbCZ3hsyixvbJmw1P7m8lszY66EqkffvnNsmmSyH
 sisp+egH7Lmn68rldrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX3bIzD7J2tuSI
 IGvOnGk5N0uKTdufxM0EFBYcprH6/zd5bddtWVLfk47/e/gu+E6Vxg0tu9MfSW6o5NgrA3Ipn0/
 0jQUEmhvFspwF2+oY5xGZhYAvd2JqP0=
X-Proofpoint-ORIG-GUID: UHPxfzEKCypr77HWTSnlaXHauvkGnsIJ
X-Proofpoint-GUID: UHPxfzEKCypr77HWTSnlaXHauvkGnsIJ
X-Authority-Analysis: v=2.4 cv=DLUacCNb c=1 sm=1 tr=0 ts=6adee9ba cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=8elwO82fXORLTBIkMd32:22 a=FOH2dFAWAAAA:8 a=pGLkceISAAAA:8
 a=KoH9M_b8ny-f6M6y6wgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_224856_175388_DCC242B1 
X-CRM114-Status: GOOD (  21.74  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add ETMv4 configuration 'pmu_pulse' with 'extout_pulse' feature which
requires an ETE whose PMU counts its external outputs
(CS_CFG_MATCH_CAP_TRCEXTOUT): event 1 selects the always-true
resource and drives TRCEXTOUT1 PMU event which pulses on every cycle
while the trace unit is enabled.

Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../trace/coresight/coresight-config.rst      |  5 ++
 .../trace/coresight/coresight-perf.rst        | 15 +++++
 drivers/hwtracing/coresight/Makefile          |  1 +
 .../coresight/coresight-cfg-pmu-pulse.c       | 55 +++++++++++++++++++
 .../coresight/coresight-cfg-preload.c         |  2 +
 .../coresight/coresight-cfg-preload.h         |  2 +
 6 files changed, 80 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c

diff --git a/Documentation/trace/coresight/coresight-config.rst b/Documentation/trace/coresight/coresight-config.rst
index 6d5ffa6f73471..3eed728bf0de1 100644
--- a/Documentation/trace/coresight/coresight-config.rst
+++ b/Documentation/trace/coresight/coresight-config.rst
@@ -129,6 +129,11 @@ The following steps take place in the operation of a configuration.
 
 5) At the end of the perf session, the configuration will be disabled.
 
+The built-in 'pmu_pulse' configuration pulses ETM external output 1 for a PMU
+event to count. It only pulses while the ETM is enabled, so combined with AUX
+pause and resume the PMU event can time each trace window (see
+coresight-perf.rst).
+
 
 Viewing Configurations and Features
 ===================================
diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
index 0a77741a431ef..6770a455c6b59 100644
--- a/Documentation/trace/coresight/coresight-perf.rst
+++ b/Documentation/trace/coresight/coresight-perf.rst
@@ -109,6 +109,21 @@ Example for triggering AUX pause and resume with PMU event::
         -e cycles/aux-action=pause,period=10000000/ \
         -e cycles/aux-action=resume,period=1050000/ -- sleep 1
 
+ETM-timed pause events
+~~~~~~~~~~~~~~~~~~~~~~
+
+The built-in ``pmu_pulse`` configuration pulses ETM external output 1 on every
+cycle of allowed trace, and a PMU event counting that output pauses trace after
+``N`` pulses, here 1000 cycles::
+
+  perf record -a -e cs_etm/pmu_pulse,aux-action=start-paused/u \
+    -e cycles/aux-action=resume,period=10000000/u \
+    -e trcextout1/aux-action=pause,period=1000/u \
+    -- sleep 1
+
+Each window is about ``N`` traced cycles plus the pause interrupt latency.
+The configuration only loads on an ETE whose PMU counts its external outputs.
+
 Perf test - Verify kernel and userspace perf CoreSight work
 -----------------------------------------------------------
 
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a57..568e797ac5a17 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_CORESIGHT) += coresight.o
 coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
 		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
 		coresight-cfg-preload.o coresight-cfg-afdo.o coresight-cfg-pstop.o \
+		coresight-cfg-pmu-pulse.o \
 		coresight-syscfg-configfs.o coresight-trace-id.o
 obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o
 coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o \
diff --git a/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
new file mode 100644
index 0000000000000..61472154dd02a
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Pulse ETM external output 1 on every traced cycle for a PMU event to count.
+ * Based on coresight-cfg-afdo.c
+ */
+
+#include "coresight-config.h"
+
+/* ETMv4 includes and features */
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+#include "coresight-etm4x-cfg.h"
+
+/*
+ * extout_pulse feature: event 1 selects the always-true resource, so ETM
+ * external output 1 pulses on every cycle while the trace unit is enabled. A
+ * PMU event counting that output (TRCEXTOUT1), for example with
+ * aux-action=pause, then fires after as many traced cycles as its sample
+ * period. Event 0 is avoided because it is the trace unit trigger, and the
+ * TRBE driver treats a detected trigger as fatal.
+ */
+static struct cscfg_regval_desc extout_pulse_regs[] = {
+	/* event 1: resource selector 1 (always true), drives external output 1 */
+	{
+		.type = CS_CFG_REG_TYPE_STD | CS_CFG_REG_TYPE_VAL_MASK,
+		.offset = TRCEVENTCTL0R,
+		.val32 = 0x0100,
+		.mask32 = 0xff00,
+	},
+	/* end of regs */
+};
+
+struct cscfg_feature_desc extout_pulse_etm4x = {
+	.name = "extout_pulse",
+	.description = "Pulse external output 1 on every traced cycle.\n",
+	.match_flags = CS_CFG_MATCH_CLASS_SRC_ETM4 | CS_CFG_MATCH_CAP_TRCEXTOUT,
+	.nr_regs = ARRAY_SIZE(extout_pulse_regs),
+	.regs_desc = extout_pulse_regs,
+};
+
+/* create a pmu_pulse configuration */
+
+static const char *pmu_pulse_ref_names[] = {
+	"extout_pulse",
+};
+
+struct cscfg_config_desc pmu_pulse_etm4x = {
+	.name = "pmu_pulse",
+	.description = "Pulse ETM external output 1 on every traced cycle for the PMU\n"
+	"to count as TRCEXTOUT1\n",
+	.nr_feat_refs = ARRAY_SIZE(pmu_pulse_ref_names),
+	.feat_ref_names = pmu_pulse_ref_names,
+};
+
+/* end of ETM4x configurations */
+#endif	/* IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) */
diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.c b/drivers/hwtracing/coresight/coresight-cfg-preload.c
index 4980e68483c5b..a9a60a1c40845 100644
--- a/drivers/hwtracing/coresight/coresight-cfg-preload.c
+++ b/drivers/hwtracing/coresight/coresight-cfg-preload.c
@@ -14,6 +14,7 @@ static struct cscfg_feature_desc *preload_feats[] = {
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	&strobe_etm4x,
 	&gen_etrig_etm4x,
+	&extout_pulse_etm4x,
 #endif
 	NULL
 };
@@ -22,6 +23,7 @@ static struct cscfg_config_desc *preload_cfgs[] = {
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	&afdo_etm4x,
 	&pstop_etm4x,
+	&pmu_pulse_etm4x,
 #endif
 	NULL
 };
diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.h b/drivers/hwtracing/coresight/coresight-cfg-preload.h
index 291ba530a6a52..0058627f65ae5 100644
--- a/drivers/hwtracing/coresight/coresight-cfg-preload.h
+++ b/drivers/hwtracing/coresight/coresight-cfg-preload.h
@@ -12,4 +12,6 @@ extern struct cscfg_feature_desc strobe_etm4x;
 extern struct cscfg_config_desc afdo_etm4x;
 extern struct cscfg_feature_desc gen_etrig_etm4x;
 extern struct cscfg_config_desc pstop_etm4x;
+extern struct cscfg_feature_desc extout_pulse_etm4x;
+extern struct cscfg_config_desc pmu_pulse_etm4x;
 #endif
-- 
2.52.0


