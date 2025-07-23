Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B61C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7lja2ibWXfiVo4eDJLx4tgeIggbs4JL9GjrFt29DoI=; b=ibD9ul0APuMyKAL9WvCtXJ6ugo
	RyFkAXT3zNy8JIfv/V3y08D0P/JADBIBeLW211WPi4JIbYnSOI746/XgXkn0uWRlZL+miDbkIC69b
	B47tJOiSxpf+kZcvAgOOpz0wa0PIZC25CLd+ihSVqBaJ8S65msr6H443TsaYW9QVFu5AlYnLcRbuo
	whvKzt/C1R0d4j+N+iQnPv/596RTIad+EUM0Ybsi1V3Y0qGS/uF1SMJVoTca9KXNqTlBhs8n3oOzs
	qzMqL6L4khGK06hUthxi/YY6E1nUUmZNeEpw0P/ceOQN2jsc/rFIimQK+SEEPPXwvfwAfEm6463sz
	O9Y71/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uea33-000000058RS-2CWU;
	Wed, 23 Jul 2025 14:02:21 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZEH-00000004zy0-0M9N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 13:09:54 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NCdO5W011745;
	Wed, 23 Jul 2025 15:09:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	W7lja2ibWXfiVo4eDJLx4tgeIggbs4JL9GjrFt29DoI=; b=niq1B1UcvtkaFScT
	JoFyOheTj9Ip9/P8C4s7OrCp6QF9AsZSseEODrLHfe8IWKf3vuySXTEu/bAkNFVr
	NagjkNNCHdr6kVdcAPtmsN7V6zSgwEdAwptyNY9kkgOM221yJ0WVQM106y0/VgtV
	xMYGuMK+cWfCMih3NgKx0v3b2Gn13+LbLg0WXWN//3otJX4tHRShrF7JVi/5yCLe
	UskRG3nMvmxzl3+C+XVOu8tj/pB3RLoAmqmpnrhxsjXxZXg1xmmuIoxe9NJcbrJe
	DAFykVGpVt8PyjQ7zOg5wPiZzYTy5M77VV61+EsIaaAAveDeUWKhOjem31+jxYKV
	Tz4Wgg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8uvd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 15:09:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 34B3540052;
	Wed, 23 Jul 2025 15:07:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92D57778887;
	Wed, 23 Jul 2025 15:06:13 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 15:06:13 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 23 Jul 2025 15:05:58 +0200
Subject: [PATCH v4 14/20] Documentation: perf: stm32: add ddrperfm support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250723-ddrperfm-upstream-v4-14-1aa53ca319f4@foss.st.com>
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
In-Reply-To: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Le
 Goffic <legoffic.clement@gmail.com>,
        Julius Werner <jwerner@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-8018a
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_060953_393981_29DA76F4 
X-CRM114-Status: GOOD (  16.57  )
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

The DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.

This documentation introduces the DDRPERFM, the stm32-ddr-pmu driver
supporting it and how to use it with the perf tool.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 Documentation/admin-guide/perf/index.rst         |  1 +
 Documentation/admin-guide/perf/stm32-ddr-pmu.rst | 86 ++++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index 072b510385c4..33aedc4ee5c3 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -29,3 +29,4 @@ Performance monitor support
    cxl
    ampere_cspmu
    mrvl-pem-pmu
+   stm32-ddr-pmu
diff --git a/Documentation/admin-guide/perf/stm32-ddr-pmu.rst b/Documentation/admin-guide/perf/stm32-ddr-pmu.rst
new file mode 100644
index 000000000000..5b02bf44dd7a
--- /dev/null
+++ b/Documentation/admin-guide/perf/stm32-ddr-pmu.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================================
+STM32 DDR Performance Monitor (DDRPERFM)
+========================================
+
+The DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
+The DDR controller provides events to DDRPERFM, once selected they are counted in the DDRPERFM
+peripheral.
+
+In MP1 family, the DDRPERFM is able to count 4 different events at the same time.
+However, the 4 events must belong to the same set.
+One hardware counter is dedicated to the time counter, `time_cnt`.
+
+In MP2 family, the DDRPERFM is able to select between 44 different DDR events.
+As for MP1, there is a dedicated hardware counter for the time.
+It is incremented every 4 DDR clock cycles.
+All the other counters can be freely allocated to count any other DDR event.
+
+The stm32-ddr-pmu driver relies on the perf PMU framework to expose the counters via sysfs:
+
+On MP1:
+
+    .. code-block:: bash
+
+        $ ls /sys/bus/event_source/devices/stm32_ddr_pmu/events/
+        cactive_ddrc                 perf_lpr_req_with_no_credit  perf_op_is_wr
+        ctl_idle                     perf_lpr_xact_when_critical  perf_selfresh_mode
+        dfi_lp_req                   perf_op_is_activate          perf_wr_xact_when_critical
+        dfi_lp_req_cpy               perf_op_is_enter_powerdown   time_cnt
+        perf_hpr_req_with_no_credit  perf_op_is_rd
+        perf_hpr_xact_when_critical  perf_op_is_refresh
+
+On MP2:
+
+    .. code-block:: bash
+
+        $ ls /sys/bus/event_source/devices/stm32_ddr_pmu/events/
+        dfi_is_act       perf_hpr_req_with_nocredit   perf_op_is_spec_ref
+        dfi_is_mpc       perf_hpr_xact_when_critical  perf_op_is_wr
+        dfi_is_mrr       perf_lpr_req_with_nocredit   perf_op_is_zqcal
+        dfi_is_mrw       perf_lpr_xact_when_critical  perf_rank
+        dfi_is_mwr       perf_op_is_act               perf_raw_hazard
+        dfi_is_mwra      perf_op_is_crit_ref          perf_rdwr_transitions
+        dfi_is_preab     perf_op_is_enter_powdn       perf_read_bypass
+        dfi_is_prepb     perf_op_is_enter_selfref     perf_war_hazard
+        dfi_is_rd        perf_op_is_mwr               perf_waw_hazard
+        dfi_is_rda       perf_op_is_pre               perf_window_limit_reached_rd
+        dfi_is_refab     perf_op_is_pre_for_others    perf_window_limit_reached_wr
+        dfi_is_refpb     perf_op_is_pre_for_rdwr      perf_wr_xact_when_critical
+        dfi_is_wr        perf_op_is_rd                time_cnt
+        dfi_is_wra       perf_op_is_rd_activate
+        perf_act_bypass  perf_op_is_ref
+
+
+The perf PMU framework is usually invoked via the 'perf stat' tool.
+
+
+Example:
+
+    .. code-block:: bash
+
+        $ perf stat --timeout 60000 -e stm32_ddr_pmu/dfi_is_act/,\
+        > stm32_ddr_pmu/dfi_is_rd/,\
+        > stm32_ddr_pmu/dfi_is_wr/,\
+        > stm32_ddr_pmu/dfi_is_refab/,\
+        > stm32_ddr_pmu/dfi_is_mrw/,\
+        > stm32_ddr_pmu/dfi_is_rda/,\
+        > stm32_ddr_pmu/dfi_is_wra/,\
+        > stm32_ddr_pmu/dfi_is_mrr/,\
+        > stm32_ddr_pmu/time_cnt/ \
+        > -a sleep 5
+
+         Performance counter stats for 'system wide':
+
+                    481025      stm32_ddr_pmu/dfi_is_act/
+                    732166      stm32_ddr_pmu/dfi_is_rd/
+                    144926      stm32_ddr_pmu/dfi_is_wr/
+                    644154      stm32_ddr_pmu/dfi_is_refab/
+                         0      stm32_ddr_pmu/dfi_is_mrw/
+                         0      stm32_ddr_pmu/dfi_is_rda/
+                         0      stm32_ddr_pmu/dfi_is_wra/
+                         0      stm32_ddr_pmu/dfi_is_mrr/
+                 752347686      stm32_ddr_pmu/time_cnt/
+
+               5.014910750 seconds time elapsed

-- 
2.43.0


