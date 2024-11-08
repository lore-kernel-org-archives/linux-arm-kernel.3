Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A16D5E124
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 04:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAtqfK18bqkWqQhnv6yYiL7WiABU3MORyiAWLFBdySI=; b=YicU48ja4qg993DQ8Y5+M4W64V
	ylVYAtzOXSsTpeCjp30rTfAl96qajOqTOj7vAMDtA0XZr3qD6tUu2AOq8gk5Hv/DDHn7Y3SlqOQWj
	z0vbVvN77ca1DKy1jA5eD8kSwMDJxpvBfMQ6KOlby4nUfWkk7mfpajAPUdY5wqpz+RMGTntRqgfnS
	+Omm3lW81osFkTtkHipaQDS7UwB/4LKJFmIgTCMHzGW7Qe+rM7ri1ceCHnJQledpIAzR8RCYRKaxI
	Gw1kfSEoLGbYIdqtLMYzymODuW7Fu6B96r31p+TTviJCLnmXtcFCoVPKr6k92NILuvHb9/wVD7yNw
	AjQSd/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GLD-00000009EH0-1IAy;
	Fri, 08 Nov 2024 04:11:23 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GHh-00000009DaM-0sfo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 04:07:47 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7MbeZ5022679;
	Thu, 7 Nov 2024 20:07:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=m
	AtqfK18bqkWqQhnv6yYiL7WiABU3MORyiAWLFBdySI=; b=bjEN4Ug+MdbUtfse7
	UkoU/WuxhgEhJGYhwDUN5dPB8Kc/sutTP8X/VqkzQ8YBveOxKnsApJ2m3JbBgiAz
	5tWPUJ12E3PMdEkfpEaKCTkG9zPulFgAwNJ/Py4IP3mA5vL7J3tidFF6AwlBx2+A
	sNQE6yB8sfKC6yA5j9j7oVE3Ecn2GZwDA4r6jbhcVjD3kP93okFYlvs1fxAnODDn
	imguFJPGf/O1gHdpbLz3d0g9lBaBOk5YcCoCZnD3BctvUcCz8ymWpHaekv2IqXj1
	NeQZNkov5YobDH2qZPvPquT7E2ummZQnnwXsaSAK5hbSLrJG2nzdrkZMQOusfhPn
	wF9MA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 42s6gu8m2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 20:07:31 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 7 Nov 2024 20:06:37 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 7 Nov 2024 20:06:37 -0800
Received: from IPBU-BLR-SERVER1.marvell.com (IPBU-BLR-SERVER1.marvell.com [10.28.8.41])
	by maili.marvell.com (Postfix) with ESMTP id 11B3B5B6926;
	Thu,  7 Nov 2024 20:06:34 -0800 (PST)
From: Gowthami Thiagarajan <gthiagarajan@marvell.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <bbhushan2@marvell.com>, <gcherian@marvell.com>, <sgoutham@marvell.com>,
        <jonathan.cameron@huawei.com>,
        Gowthami Thiagarajan
	<gthiagarajan@marvell.com>
Subject: [PATCH v10 3/5] perf/marvell: Odyssey DDR Performance monitor support
Date: Fri, 8 Nov 2024 09:36:17 +0530
Message-ID: <20241108040619.753343-4-gthiagarajan@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108040619.753343-1-gthiagarajan@marvell.com>
References: <20241108040619.753343-1-gthiagarajan@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6n1B4zL2lKsBr8_nF7jf3rKjRaCuAiy1
X-Proofpoint-GUID: 6n1B4zL2lKsBr8_nF7jf3rKjRaCuAiy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_200745_299051_B3914BFD 
X-CRM114-Status: GOOD (  18.65  )
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

Odyssey DRAM Subsystem supports eight counters for monitoring performance
and software can program those counters to monitor any of the defined
performance events. Supported performance events include those counted
at the interface between the DDR controller and the PHY, interface between
the DDR Controller and the CHI interconnect, or within the DDR Controller.

Additionally DSS also supports two fixed performance event counters, one
for ddr reads and the other for ddr writes.

Signed-off-by: Gowthami Thiagarajan <gthiagarajan@marvell.com>
---
 Documentation/admin-guide/perf/index.rst      |   1 +
 .../admin-guide/perf/mrvl-odyssey-ddr-pmu.rst |  80 +++++
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 273 +++++++++++++++++-
 3 files changed, 349 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/admin-guide/perf/mrvl-odyssey-ddr-pmu.rst

diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index 8502bc174640..f9be610b2e6d 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -14,6 +14,7 @@ Performance monitor support
    qcom_l2_pmu
    qcom_l3_pmu
    starfive_starlink_pmu
+   mrvl-odyssey-ddr-pmu
    arm-ccn
    arm-cmn
    arm-ni
diff --git a/Documentation/admin-guide/perf/mrvl-odyssey-ddr-pmu.rst b/Documentation/admin-guide/perf/mrvl-odyssey-ddr-pmu.rst
new file mode 100644
index 000000000000..2e817593a4d9
--- /dev/null
+++ b/Documentation/admin-guide/perf/mrvl-odyssey-ddr-pmu.rst
@@ -0,0 +1,80 @@
+===================================================================
+Marvell Odyssey DDR PMU Performance Monitoring Unit (PMU UNCORE)
+===================================================================
+
+Odyssey DRAM Subsystem supports eight counters for monitoring performance
+and software can program those counters to monitor any of the defined
+performance events. Supported performance events include those counted
+at the interface between the DDR controller and the PHY, interface between
+the DDR Controller and the CHI interconnect, or within the DDR Controller.
+
+Additionally DSS also supports two fixed performance event counters, one
+for ddr reads and the other for ddr writes.
+
+The counter will be operating in either manual or auto mode.
+
+The PMU driver exposes the available events and format options under sysfs::
+
+        /sys/bus/event_source/devices/mrvl_ddr_pmu_<>/events/
+        /sys/bus/event_source/devices/mrvl_ddr_pmu_<>/format/
+
+Examples::
+
+        $ perf list | grep ddr
+        mrvl_ddr_pmu_<>/ddr_act_bypass_access/   [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_bsm_alloc/           [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_bsm_starvation/      [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_cam_active_access/   [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_cam_mwr/             [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_cam_rd_active_access/ [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_cam_rd_or_wr_access/ [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_cam_read/            [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_cam_wr_access/       [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_cam_write/           [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_capar_error/         [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_crit_ref/            [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_ddr_reads/           [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_ddr_writes/          [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_dfi_cmd_is_retry/    [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_dfi_cycles/          [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_dfi_parity_poison/   [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_dfi_rd_data_access/  [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_dfi_wr_data_access/  [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_dqsosc_mpc/          [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_dqsosc_mrr/          [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_enter_mpsm/          [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_enter_powerdown/     [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_enter_selfref/       [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_hif_pri_rdaccess/    [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_hif_rd_access/       [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_hif_rd_or_wr_access/ [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_hif_rmw_access/      [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_hif_wr_access/       [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_hpri_sched_rd_crit_access/ [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_load_mode/           [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_lpri_sched_rd_crit_access/ [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_precharge/           [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_precharge_for_other/ [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_precharge_for_rdwr/  [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_raw_hazard/          [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_rd_bypass_access/    [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_rd_crc_error/        [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_rd_uc_ecc_error/     [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_rdwr_transitions/    [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_refresh/             [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_retry_fifo_full/     [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_spec_ref/            [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_tcr_mrr/             [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_war_hazard/          [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_waw_hazard/          [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_win_limit_reached_rd/ [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_win_limit_reached_wr/ [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_wr_crc_error/        [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_wr_trxn_crit_access/ [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_write_combine/       [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_zqcl/                [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_zqlatch/             [Kernel PMU event]
+        mrvl_ddr_pmu_<>/ddr_zqstart/             [Kernel PMU event]
+
+        $ perf stat -e ddr_cam_read,ddr_cam_write,ddr_cam_active_access,ddr_cam
+          rd_or_wr_access,ddr_cam_rd_active_access,ddr_cam_mwr <workload>
diff --git a/drivers/perf/marvell_cn10k_ddr_pmu.c b/drivers/perf/marvell_cn10k_ddr_pmu.c
index 45da37e702a2..ee327c545472 100644
--- a/drivers/perf/marvell_cn10k_ddr_pmu.c
+++ b/drivers/perf/marvell_cn10k_ddr_pmu.c
@@ -16,23 +16,28 @@
 
 /* Performance Counters Operating Mode Control Registers */
 #define CN10K_DDRC_PERF_CNT_OP_MODE_CTRL	0x8020
+#define ODY_DDRC_PERF_CNT_OP_MODE_CTRL		0x20020
 #define OP_MODE_CTRL_VAL_MANUAL	0x1
 
 /* Performance Counters Start Operation Control Registers */
 #define CN10K_DDRC_PERF_CNT_START_OP_CTRL	0x8028
+#define ODY_DDRC_PERF_CNT_START_OP_CTRL		0x200A0
 #define START_OP_CTRL_VAL_START		0x1ULL
 #define START_OP_CTRL_VAL_ACTIVE	0x2
 
 /* Performance Counters End Operation Control Registers */
 #define CN10K_DDRC_PERF_CNT_END_OP_CTRL	0x8030
+#define ODY_DDRC_PERF_CNT_END_OP_CTRL	0x200E0
 #define END_OP_CTRL_VAL_END		0x1ULL
 
 /* Performance Counters End Status Registers */
 #define CN10K_DDRC_PERF_CNT_END_STATUS		0x8038
+#define ODY_DDRC_PERF_CNT_END_STATUS		0x20120
 #define END_STATUS_VAL_END_TIMER_MODE_END	0x1
 
 /* Performance Counters Configuration Registers */
 #define CN10K_DDRC_PERF_CFG_BASE		0x8040
+#define ODY_DDRC_PERF_CFG_BASE			0x20160
 
 /* 8 Generic event counter + 2 fixed event counters */
 #define DDRC_PERF_NUM_GEN_COUNTERS	8
@@ -56,6 +61,15 @@
  * DO NOT change these event-id numbers, they are used to
  * program event bitmap in h/w.
  */
+#define EVENT_DFI_CMD_IS_RETRY			61
+#define EVENT_RD_UC_ECC_ERROR			60
+#define EVENT_RD_CRC_ERROR			59
+#define EVENT_CAPAR_ERROR			58
+#define EVENT_WR_CRC_ERROR			57
+#define EVENT_DFI_PARITY_POISON			56
+#define EVENT_RETRY_FIFO_FULL			46
+#define EVENT_DFI_CYCLES			45
+
 #define EVENT_OP_IS_ZQLATCH			55
 #define EVENT_OP_IS_ZQSTART			54
 #define EVENT_OP_IS_TCR_MRR			53
@@ -105,6 +119,7 @@
 
 /* Event counter value registers */
 #define CN10K_DDRC_PERF_CNT_VALUE_BASE	0x8080
+#define ODY_DDRC_PERF_CNT_VALUE_BASE	0x201C0
 
 /* Fixed event counter enable/disable register */
 #define CN10K_DDRC_PERF_CNT_FREERUN_EN		0x80C0
@@ -113,15 +128,21 @@
 
 /* Fixed event counter control register */
 #define CN10K_DDRC_PERF_CNT_FREERUN_CTRL	0x80C8
+#define ODY_DDRC_PERF_CNT_FREERUN_CTRL		0x20240
 #define DDRC_FREERUN_WRITE_CNT_CLR	0x1
 #define DDRC_FREERUN_READ_CNT_CLR	0x2
 
+/* Fixed event counter clear register, defined only for Odyssey */
+#define ODY_DDRC_PERF_CNT_FREERUN_CLR  0x20248
+
 #define DDRC_PERF_CNT_VALUE_OVERFLOW	BIT_ULL(48)
 #define DDRC_PERF_CNT_MAX_VALUE		GENMASK_ULL(48, 0)
 
 /* Fixed event counter value register */
 #define CN10K_DDRC_PERF_CNT_VALUE_WR_OP		0x80D0
 #define CN10K_DDRC_PERF_CNT_VALUE_RD_OP		0x80D8
+#define ODY_DDRC_PERF_CNT_VALUE_WR_OP		0x20250
+#define ODY_DDRC_PERF_CNT_VALUE_RD_OP		0x20258
 
 struct cn10k_ddr_pmu {
 	struct pmu pmu;
@@ -163,6 +184,7 @@ struct ddr_pmu_platform_data {
 	u64 cnt_value_wr_op;
 	u64 cnt_value_rd_op;
 	bool is_cn10k;
+	bool is_ody;
 };
 
 static ssize_t cn10k_ddr_pmu_event_show(struct device *dev,
@@ -240,6 +262,85 @@ static struct attribute *cn10k_ddr_perf_events_attrs[] = {
 	NULL
 };
 
+static struct attribute *odyssey_ddr_perf_events_attrs[] = {
+	/* Programmable */
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_hif_rd_or_wr_access, EVENT_HIF_RD_OR_WR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_hif_wr_access, EVENT_HIF_WR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_hif_rd_access, EVENT_HIF_RD),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_hif_rmw_access, EVENT_HIF_RMW),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_hif_pri_rdaccess, EVENT_HIF_HI_PRI_RD),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_rd_bypass_access, EVENT_READ_BYPASS),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_act_bypass_access, EVENT_ACT_BYPASS),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_dfi_wr_data_access,
+				 EVENT_DFI_WR_DATA_CYCLES),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_dfi_rd_data_access,
+				 EVENT_DFI_RD_DATA_CYCLES),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_hpri_sched_rd_crit_access,
+				 EVENT_HPR_XACT_WHEN_CRITICAL),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_lpri_sched_rd_crit_access,
+				 EVENT_LPR_XACT_WHEN_CRITICAL),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_wr_trxn_crit_access,
+				 EVENT_WR_XACT_WHEN_CRITICAL),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_cam_active_access, EVENT_OP_IS_ACTIVATE),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_cam_rd_or_wr_access,
+				 EVENT_OP_IS_RD_OR_WR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_cam_rd_active_access,
+				 EVENT_OP_IS_RD_ACTIVATE),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_cam_read, EVENT_OP_IS_RD),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_cam_write, EVENT_OP_IS_WR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_cam_mwr, EVENT_OP_IS_MWR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_precharge, EVENT_OP_IS_PRECHARGE),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_precharge_for_rdwr,
+				 EVENT_PRECHARGE_FOR_RDWR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_precharge_for_other,
+				 EVENT_PRECHARGE_FOR_OTHER),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_rdwr_transitions, EVENT_RDWR_TRANSITIONS),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_write_combine, EVENT_WRITE_COMBINE),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_war_hazard, EVENT_WAR_HAZARD),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_raw_hazard, EVENT_RAW_HAZARD),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_waw_hazard, EVENT_WAW_HAZARD),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_enter_selfref, EVENT_OP_IS_ENTER_SELFREF),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_enter_powerdown,
+				 EVENT_OP_IS_ENTER_POWERDOWN),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_enter_mpsm, EVENT_OP_IS_ENTER_MPSM),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_refresh, EVENT_OP_IS_REFRESH),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_crit_ref, EVENT_OP_IS_CRIT_REF),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_spec_ref, EVENT_OP_IS_SPEC_REF),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_load_mode, EVENT_OP_IS_LOAD_MODE),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_zqcl, EVENT_OP_IS_ZQCL),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_cam_wr_access, EVENT_OP_IS_ZQCS),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_dfi_cycles, EVENT_DFI_CYCLES),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_retry_fifo_full,
+				 EVENT_RETRY_FIFO_FULL),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_bsm_alloc, EVENT_BSM_ALLOC),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_bsm_starvation, EVENT_BSM_STARVATION),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_win_limit_reached_rd,
+				 EVENT_VISIBLE_WIN_LIMIT_REACHED_RD),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_win_limit_reached_wr,
+				 EVENT_VISIBLE_WIN_LIMIT_REACHED_WR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_dqsosc_mpc, EVENT_OP_IS_DQSOSC_MPC),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_dqsosc_mrr, EVENT_OP_IS_DQSOSC_MRR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_tcr_mrr, EVENT_OP_IS_TCR_MRR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_zqstart, EVENT_OP_IS_ZQSTART),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_zqlatch, EVENT_OP_IS_ZQLATCH),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_dfi_parity_poison,
+				 EVENT_DFI_PARITY_POISON),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_wr_crc_error, EVENT_WR_CRC_ERROR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_capar_error, EVENT_CAPAR_ERROR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_rd_crc_error, EVENT_RD_CRC_ERROR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_rd_uc_ecc_error, EVENT_RD_UC_ECC_ERROR),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_dfi_cmd_is_retry, EVENT_DFI_CMD_IS_RETRY),
+	/* Free run event counters */
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_ddr_reads, EVENT_DDR_READS),
+	CN10K_DDR_PMU_EVENT_ATTR(ddr_ddr_writes, EVENT_DDR_WRITES),
+	NULL
+};
+
+static struct attribute_group odyssey_ddr_perf_events_attr_group = {
+	.name = "events",
+	.attrs = odyssey_ddr_perf_events_attrs,
+};
+
 static struct attribute_group cn10k_ddr_perf_events_attr_group = {
 	.name = "events",
 	.attrs = cn10k_ddr_perf_events_attrs,
@@ -285,6 +386,13 @@ static const struct attribute_group *cn10k_attr_groups[] = {
 	NULL,
 };
 
+static const struct attribute_group *odyssey_attr_groups[] = {
+	&odyssey_ddr_perf_events_attr_group,
+	&cn10k_ddr_perf_format_attr_group,
+	&cn10k_ddr_perf_cpumask_attr_group,
+	NULL
+};
+
 /* Default poll timeout is 100 sec, which is very sufficient for
  * 48 bit counter incremented max at 5.6 GT/s, which may take many
  * hours to overflow.
@@ -297,9 +405,18 @@ static ktime_t cn10k_ddr_pmu_timer_period(void)
 	return ms_to_ktime((u64)cn10k_ddr_pmu_poll_period_sec * USEC_PER_SEC);
 }
 
-static int ddr_perf_get_event_bitmap(int eventid, u64 *event_bitmap)
+static int ddr_perf_get_event_bitmap(int eventid, u64 *event_bitmap,
+				     struct cn10k_ddr_pmu *ddr_pmu)
 {
+	int err = 0;
+
 	switch (eventid) {
+	case EVENT_DFI_PARITY_POISON ...EVENT_DFI_CMD_IS_RETRY:
+		if (!ddr_pmu->p_data->is_ody) {
+			err = -EINVAL;
+			break;
+		}
+		fallthrough;
 	case EVENT_HIF_RD_OR_WR ... EVENT_WAW_HAZARD:
 	case EVENT_OP_IS_REFRESH ... EVENT_OP_IS_ZQLATCH:
 		*event_bitmap = (1ULL << (eventid - 1));
@@ -310,11 +427,12 @@ static int ddr_perf_get_event_bitmap(int eventid, u64 *event_bitmap)
 		*event_bitmap = (0xFULL << (eventid - 1));
 		break;
 	default:
-		pr_err("%s Invalid eventid %d\n", __func__, eventid);
-		return -EINVAL;
+		err = -EINVAL;
 	}
 
-	return 0;
+	if (err)
+		pr_err("%s Invalid eventid %d\n", __func__, eventid);
+	return err;
 }
 
 static int cn10k_ddr_perf_alloc_counter(struct cn10k_ddr_pmu *pmu,
@@ -382,11 +500,33 @@ static int cn10k_ddr_perf_event_init(struct perf_event *event)
 	return 0;
 }
 
+static void cn10k_ddr_perf_counter_start(struct cn10k_ddr_pmu *ddr_pmu,
+					 int counter)
+{
+	const struct ddr_pmu_platform_data *p_data = ddr_pmu->p_data;
+	u64 ctrl_reg = p_data->cnt_start_op_ctrl;
+
+	writeq_relaxed(START_OP_CTRL_VAL_START, ddr_pmu->base +
+		       DDRC_PERF_REG(ctrl_reg, counter));
+}
+
+static void cn10k_ddr_perf_counter_stop(struct cn10k_ddr_pmu *ddr_pmu,
+					int counter)
+{
+	const struct ddr_pmu_platform_data *p_data = ddr_pmu->p_data;
+	u64 ctrl_reg = p_data->cnt_end_op_ctrl;
+
+	writeq_relaxed(END_OP_CTRL_VAL_END, ddr_pmu->base +
+		       DDRC_PERF_REG(ctrl_reg, counter));
+}
+
 static void cn10k_ddr_perf_counter_enable(struct cn10k_ddr_pmu *pmu,
 					  int counter, bool enable)
 {
 	const struct ddr_pmu_platform_data *p_data = pmu->p_data;
+	u64 ctrl_reg = pmu->p_data->cnt_op_mode_ctrl;
 	const struct ddr_pmu_ops *ops = pmu->ops;
+	bool is_ody = pmu->p_data->is_ody;
 	u32 reg;
 	u64 val;
 
@@ -405,6 +545,22 @@ static void cn10k_ddr_perf_counter_enable(struct cn10k_ddr_pmu *pmu,
 			val &= ~EVENT_ENABLE;
 
 		writeq_relaxed(val, pmu->base + reg);
+
+		if (is_ody) {
+			if (enable) {
+				/*
+				 * Setup the PMU counter to work in
+				 * manual mode
+				 */
+				reg = DDRC_PERF_REG(ctrl_reg, counter);
+				writeq_relaxed(OP_MODE_CTRL_VAL_MANUAL,
+					       pmu->base + reg);
+
+				cn10k_ddr_perf_counter_start(pmu, counter);
+			} else {
+				cn10k_ddr_perf_counter_stop(pmu, counter);
+			}
+		}
 	} else {
 		if (counter == DDRC_PERF_READ_COUNTER_IDX)
 			ops->enable_read_freerun_counter(pmu, enable);
@@ -486,7 +642,7 @@ static int cn10k_ddr_perf_event_add(struct perf_event *event, int flags)
 	if (counter < DDRC_PERF_NUM_GEN_COUNTERS) {
 		/* Generic counters, configure event id */
 		reg_offset = DDRC_PERF_CFG(p_data->cfg_base, counter);
-		ret = ddr_perf_get_event_bitmap(config, &val);
+		ret = ddr_perf_get_event_bitmap(config, &val, pmu);
 		if (ret)
 			return ret;
 
@@ -631,6 +787,66 @@ static void ddr_pmu_overflow_hander(struct cn10k_ddr_pmu *pmu, int evt_idx)
 	cn10k_ddr_perf_pmu_enable(&pmu->pmu);
 }
 
+static void ddr_pmu_ody_enable_read_freerun(struct cn10k_ddr_pmu *pmu,
+					    bool enable)
+{
+	const struct ddr_pmu_platform_data *p_data = pmu->p_data;
+	u64 val;
+
+	val = readq_relaxed(pmu->base + p_data->cnt_freerun_ctrl);
+	if (enable)
+		val |= DDRC_PERF_FREERUN_READ_EN;
+	else
+		val &= ~DDRC_PERF_FREERUN_READ_EN;
+
+	writeq_relaxed(val, pmu->base + p_data->cnt_freerun_ctrl);
+}
+
+static void ddr_pmu_ody_enable_write_freerun(struct cn10k_ddr_pmu *pmu,
+					     bool enable)
+{
+	const struct ddr_pmu_platform_data *p_data = pmu->p_data;
+	u64 val;
+
+	val = readq_relaxed(pmu->base + p_data->cnt_freerun_ctrl);
+	if (enable)
+		val |= DDRC_PERF_FREERUN_WRITE_EN;
+	else
+		val &= ~DDRC_PERF_FREERUN_WRITE_EN;
+
+	writeq_relaxed(val, pmu->base + p_data->cnt_freerun_ctrl);
+}
+
+static void ddr_pmu_ody_read_clear_freerun(struct cn10k_ddr_pmu *pmu)
+{
+	const struct ddr_pmu_platform_data *p_data = pmu->p_data;
+	u64 val;
+
+	val = DDRC_FREERUN_READ_CNT_CLR;
+	writeq_relaxed(val, pmu->base + p_data->cnt_freerun_clr);
+}
+
+static void ddr_pmu_ody_write_clear_freerun(struct cn10k_ddr_pmu *pmu)
+{
+	const struct ddr_pmu_platform_data *p_data = pmu->p_data;
+	u64 val;
+
+	val = DDRC_FREERUN_WRITE_CNT_CLR;
+	writeq_relaxed(val, pmu->base + p_data->cnt_freerun_clr);
+}
+
+static void ddr_pmu_ody_overflow_hander(struct cn10k_ddr_pmu *pmu, int evt_idx)
+{
+	/*
+	 * On reaching the maximum value of the counter, the counter freezes
+	 * there. The particular event is updated and the respective counter
+	 * is stopped and started again so that it starts counting from zero
+	 */
+	cn10k_ddr_perf_event_update(pmu->events[evt_idx]);
+	cn10k_ddr_perf_counter_stop(pmu, evt_idx);
+	cn10k_ddr_perf_counter_start(pmu, evt_idx);
+}
+
 static irqreturn_t cn10k_ddr_pmu_overflow_handler(struct cn10k_ddr_pmu *pmu)
 {
 	const struct ddr_pmu_platform_data *p_data = pmu->p_data;
@@ -740,6 +956,33 @@ static const struct ddr_pmu_platform_data cn10k_ddr_pmu_pdata = {
 };
 #endif
 
+static const struct ddr_pmu_ops ddr_pmu_ody_ops = {
+	.enable_read_freerun_counter = ddr_pmu_ody_enable_read_freerun,
+	.enable_write_freerun_counter = ddr_pmu_ody_enable_write_freerun,
+	.clear_read_freerun_counter = ddr_pmu_ody_read_clear_freerun,
+	.clear_write_freerun_counter = ddr_pmu_ody_write_clear_freerun,
+	.pmu_overflow_handler = ddr_pmu_ody_overflow_hander,
+};
+
+#ifdef CONFIG_ACPI
+static const struct ddr_pmu_platform_data odyssey_ddr_pmu_pdata = {
+	.counter_overflow_val = 0,
+	.counter_max_val = GENMASK_ULL(63, 0),
+	.cnt_base = ODY_DDRC_PERF_CNT_VALUE_BASE,
+	.cfg_base = ODY_DDRC_PERF_CFG_BASE,
+	.cnt_op_mode_ctrl = ODY_DDRC_PERF_CNT_OP_MODE_CTRL,
+	.cnt_start_op_ctrl = ODY_DDRC_PERF_CNT_START_OP_CTRL,
+	.cnt_end_op_ctrl = ODY_DDRC_PERF_CNT_END_OP_CTRL,
+	.cnt_end_status = ODY_DDRC_PERF_CNT_END_STATUS,
+	.cnt_freerun_en = 0,
+	.cnt_freerun_ctrl = ODY_DDRC_PERF_CNT_FREERUN_CTRL,
+	.cnt_freerun_clr = ODY_DDRC_PERF_CNT_FREERUN_CLR,
+	.cnt_value_wr_op = ODY_DDRC_PERF_CNT_VALUE_WR_OP,
+	.cnt_value_rd_op = ODY_DDRC_PERF_CNT_VALUE_RD_OP,
+	.is_ody = TRUE,
+};
+#endif
+
 static int cn10k_ddr_perf_probe(struct platform_device *pdev)
 {
 	const struct ddr_pmu_platform_data *dev_data;
@@ -747,6 +990,7 @@ static int cn10k_ddr_perf_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *base;
 	bool is_cn10k;
+	bool is_ody;
 	char *name;
 	int ret;
 
@@ -771,6 +1015,7 @@ static int cn10k_ddr_perf_probe(struct platform_device *pdev)
 
 	ddr_pmu->p_data = dev_data;
 	is_cn10k = ddr_pmu->p_data->is_cn10k;
+	is_ody = ddr_pmu->p_data->is_ody;
 
 	if (is_cn10k) {
 		ddr_pmu->ops = &ddr_pmu_ops;
@@ -794,6 +1039,23 @@ static int cn10k_ddr_perf_probe(struct platform_device *pdev)
 		};
 	}
 
+	if (is_ody) {
+		ddr_pmu->ops = &ddr_pmu_ody_ops;
+
+		ddr_pmu->pmu = (struct pmu) {
+			.module       = THIS_MODULE,
+			.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
+			.task_ctx_nr = perf_invalid_context,
+			.attr_groups = odyssey_attr_groups,
+			.event_init  = cn10k_ddr_perf_event_init,
+			.add         = cn10k_ddr_perf_event_add,
+			.del         = cn10k_ddr_perf_event_del,
+			.start       = cn10k_ddr_perf_event_start,
+			.stop        = cn10k_ddr_perf_event_stop,
+			.read        = cn10k_ddr_perf_event_update,
+		};
+	}
+
 	/* Choose this cpu to collect perf data */
 	ddr_pmu->cpu = raw_smp_processor_id();
 
@@ -844,6 +1106,7 @@ MODULE_DEVICE_TABLE(of, cn10k_ddr_pmu_of_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cn10k_ddr_pmu_acpi_match[] = {
 	{"MRVL000A", (kernel_ulong_t)&cn10k_ddr_pmu_pdata },
+	{"MRVL000C", (kernel_ulong_t)&odyssey_ddr_pmu_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, cn10k_ddr_pmu_acpi_match);
-- 
2.25.1


