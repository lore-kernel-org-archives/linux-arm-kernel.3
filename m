Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899AAD5E124
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 04:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vBA9/YIjtC9NXvu1JNHv6kTYHCKQnYXVoCmc4mw7mw=; b=x00PjZ7mg/IsFuq5fwhS02ayTn
	IIwpZj1esgZOW+jXzXTkxMYfwPLCxTXjJAYEhouq9sl7Jys8Q5IgQpNEWP0nBfRmTpRHdTOMxFf/0
	wkhJixpVluQGoMjQc4FDINSFN+2q9Em+vHhJbyNriCOeKs++/mqIv++5Brb6MENQ1fJmms7THspXx
	2IA85QwIr8dmSFGpdbvjD5TdS9b6eQJGcfzBkun5JF3t6uiO5FZqoyf2UA/kC0RnY4RdqExMK5pyp
	qtxNsndfUu+lWXn2eOPmDX7mhOAOBrbRUCeC/B9WiWQc2422r2fX6BFD4fYIGnpApyiZZsYR/KJpJ
	paGPvmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GQS-00000009FK2-0Lv9;
	Fri, 08 Nov 2024 04:16:48 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GJd-00000009DaN-0f3M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 04:09:46 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7MbeZ8022679;
	Thu, 7 Nov 2024 20:07:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=2
	vBA9/YIjtC9NXvu1JNHv6kTYHCKQnYXVoCmc4mw7mw=; b=N1EKDyUO5i393bkRi
	8nYFezF17Ifsr9oQ3mahp2e1uZdflglCAz5elBGa1yfiG9q/8BMr4JxMXQZNnSC2
	UUYvHogG0K8Kv98jnxecj2CKzMHKzf1j+yyIUNLL0X+ITTfBhqCOScoxxqGyxemT
	hkOPv2yj63masvHiE3DnN2Wr9P2uj6yztPmjoda2NJlgKp4CcE6iwAeeaFBMUBSP
	+Zr/86Up59zOi7qgRW07rvO6WsukemJR4HWTo8SCjCC0kY3XmIdxQ91d+P+Ml6jo
	nwq1c9jjA5cy3ZB/HQRXJf7oibJ9is+QWeFBzDt7BAjB2QTQ/c0NjexwvXuq9Fqj
	l8gvg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 42s6gu8m2q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 20:07:31 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 7 Nov 2024 20:06:46 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 7 Nov 2024 20:06:46 -0800
Received: from IPBU-BLR-SERVER1.marvell.com (IPBU-BLR-SERVER1.marvell.com [10.28.8.41])
	by maili.marvell.com (Postfix) with ESMTP id 958F05B6926;
	Thu,  7 Nov 2024 20:06:43 -0800 (PST)
From: Gowthami Thiagarajan <gthiagarajan@marvell.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <bbhushan2@marvell.com>, <gcherian@marvell.com>, <sgoutham@marvell.com>,
        <jonathan.cameron@huawei.com>,
        Gowthami Thiagarajan
	<gthiagarajan@marvell.com>
Subject: [PATCH v10 5/5] perf/marvell : Odyssey LLC-TAD performance monitor support
Date: Fri, 8 Nov 2024 09:36:19 +0530
Message-ID: <20241108040619.753343-6-gthiagarajan@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108040619.753343-1-gthiagarajan@marvell.com>
References: <20241108040619.753343-1-gthiagarajan@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IDRVywGm_Ra8IZHu8LtpM_G_u9d_UC4S
X-Proofpoint-GUID: IDRVywGm_Ra8IZHu8LtpM_G_u9d_UC4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_200945_229806_6D9362B4 
X-CRM114-Status: GOOD (  20.26  )
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

Each TAD provides eight 64-bit counters for monitoring
cache behavior.The driver always configures the same counter for
all the TADs. The user would end up effectively reserving one of
eight counters in every TAD to look across all TADs.
The occurrences of events are aggregated and presented to the user
at the end of running the workload. The driver does not provide a
way for the user to partition TADs so that different TADs are used for
different applications.

The performance events reflect various internal or interface activities.
By combining the values from multiple performance counters, cache
performance can be measured in terms such as: cache miss rate, cache
allocations, interface retry rate, internal resource occupancy, etc.

Each supported counter's event and formatting information is exposed
to sysfs at /sys/devices/tad/. Use perf tool stat command to measure
the pmu events. For instance:

perf stat -e tad_hit_ltg,tad_hit_dtg <workload>

Signed-off-by: Gowthami Thiagarajan <gthiagarajan@marvell.com>
---
 Documentation/admin-guide/perf/index.rst      |  1 +
 .../admin-guide/perf/mrvl-odyssey-tad-pmu.rst | 37 +++++++++++++++++++
 drivers/perf/marvell_cn10k_tad_pmu.c          | 35 ++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/mrvl-odyssey-tad-pmu.rst

diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index f9be610b2e6d..0aecdc3e4efa 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -15,6 +15,7 @@ Performance monitor support
    qcom_l3_pmu
    starfive_starlink_pmu
    mrvl-odyssey-ddr-pmu
+   mrvl-odyssey-tad-pmu
    arm-ccn
    arm-cmn
    arm-ni
diff --git a/Documentation/admin-guide/perf/mrvl-odyssey-tad-pmu.rst b/Documentation/admin-guide/perf/mrvl-odyssey-tad-pmu.rst
new file mode 100644
index 000000000000..ad1975b14087
--- /dev/null
+++ b/Documentation/admin-guide/perf/mrvl-odyssey-tad-pmu.rst
@@ -0,0 +1,37 @@
+====================================================================
+Marvell Odyssey LLC-TAD Performance Monitoring Unit (PMU UNCORE)
+====================================================================
+
+Each TAD provides eight 64-bit counters for monitoring
+cache behavior.The driver always configures the same counter for
+all the TADs. The user would end up effectively reserving one of
+eight counters in every TAD to look across all TADs.
+The occurrences of events are aggregated and presented to the user
+at the end of running the workload. The driver does not provide a
+way for the user to partition TADs so that different TADs are used for
+different applications.
+
+The performance events reflect various internal or interface activities.
+By combining the values from multiple performance counters, cache
+performance can be measured in terms such as: cache miss rate, cache
+allocations, interface retry rate, internal resource occupancy, etc.
+
+The PMU driver exposes the available events and format options under sysfs::
+
+        /sys/bus/event_source/devices/tad/events/
+        /sys/bus/event_source/devices/tad/format/
+
+Examples::
+
+   $ perf list | grep tad
+        tad/tad_alloc_any/                                 [Kernel PMU event]
+        tad/tad_alloc_dtg/                                 [Kernel PMU event]
+        tad/tad_alloc_ltg/                                 [Kernel PMU event]
+        tad/tad_hit_any/                                   [Kernel PMU event]
+        tad/tad_hit_dtg/                                   [Kernel PMU event]
+        tad/tad_hit_ltg/                                   [Kernel PMU event]
+        tad/tad_req_msh_in_exlmn/                          [Kernel PMU event]
+        tad/tad_tag_rd/                                    [Kernel PMU event]
+        tad/tad_tot_cycle/                                 [Kernel PMU event]
+
+   $ perf stat -e tad_alloc_dtg,tad_alloc_ltg,tad_alloc_any,tad_hit_dtg,tad_hit_ltg,tad_hit_any,tad_tag_rd <workload>
diff --git a/drivers/perf/marvell_cn10k_tad_pmu.c b/drivers/perf/marvell_cn10k_tad_pmu.c
index 15f9f67cb3bd..29976b435417 100644
--- a/drivers/perf/marvell_cn10k_tad_pmu.c
+++ b/drivers/perf/marvell_cn10k_tad_pmu.c
@@ -39,6 +39,7 @@ struct tad_pmu {
 
 enum mrvl_tad_pmu_version {
 	TAD_PMU_V1 = 1,
+	TAD_PMU_V2,
 };
 
 struct tad_pmu_data {
@@ -222,6 +223,24 @@ static const struct attribute_group tad_pmu_events_attr_group = {
 	.attrs = tad_pmu_event_attrs,
 };
 
+static struct attribute *ody_tad_pmu_event_attrs[] = {
+	TAD_PMU_EVENT_ATTR(tad_req_msh_in_exlmn, 0x3),
+	TAD_PMU_EVENT_ATTR(tad_alloc_dtg, 0x1a),
+	TAD_PMU_EVENT_ATTR(tad_alloc_ltg, 0x1b),
+	TAD_PMU_EVENT_ATTR(tad_alloc_any, 0x1c),
+	TAD_PMU_EVENT_ATTR(tad_hit_dtg, 0x1d),
+	TAD_PMU_EVENT_ATTR(tad_hit_ltg, 0x1e),
+	TAD_PMU_EVENT_ATTR(tad_hit_any, 0x1f),
+	TAD_PMU_EVENT_ATTR(tad_tag_rd, 0x20),
+	TAD_PMU_EVENT_ATTR(tad_tot_cycle, 0xFF),
+	NULL
+};
+
+static const struct attribute_group ody_tad_pmu_events_attr_group = {
+	.name = "events",
+	.attrs = ody_tad_pmu_event_attrs,
+};
+
 PMU_FORMAT_ATTR(event, "config:0-7");
 
 static struct attribute *tad_pmu_format_attrs[] = {
@@ -260,6 +279,13 @@ static const struct attribute_group *tad_pmu_attr_groups[] = {
 	NULL
 };
 
+static const struct attribute_group *ody_tad_pmu_attr_groups[] = {
+	&ody_tad_pmu_events_attr_group,
+	&tad_pmu_format_attr_group,
+	&tad_pmu_cpumask_attr_group,
+	NULL
+};
+
 static int tad_pmu_probe(struct platform_device *pdev)
 {
 	const struct tad_pmu_data *dev_data;
@@ -350,6 +376,8 @@ static int tad_pmu_probe(struct platform_device *pdev)
 
 	if (version == TAD_PMU_V1)
 		tad_pmu->pmu.attr_groups = tad_pmu_attr_groups;
+	else
+		tad_pmu->pmu.attr_groups = ody_tad_pmu_attr_groups;
 
 	tad_pmu->cpu = raw_smp_processor_id();
 
@@ -385,6 +413,12 @@ static const struct tad_pmu_data tad_pmu_data = {
 };
 #endif
 
+#ifdef CONFIG_ACPI
+static const struct tad_pmu_data tad_pmu_v2_data = {
+	.id   = TAD_PMU_V2,
+};
+#endif
+
 #ifdef CONFIG_OF
 static const struct of_device_id tad_pmu_of_match[] = {
 	{ .compatible = "marvell,cn10k-tad-pmu", .data = &tad_pmu_data },
@@ -395,6 +429,7 @@ static const struct of_device_id tad_pmu_of_match[] = {
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id tad_pmu_acpi_match[] = {
 	{"MRVL000B", (kernel_ulong_t)&tad_pmu_data},
+	{"MRVL000D", (kernel_ulong_t)&tad_pmu_v2_data},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, tad_pmu_acpi_match);
-- 
2.25.1


