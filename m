Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0A7C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7HLgQOnZ4t9OA2DiVyqG0r2WrkKM5Fs2gIjWmGHD3s=; b=PXp1RVhnFkE4VdKBCVCgBr0XoR
	U7ZthFj+sb1EJ42tL7iN/+sqj+VfjdtNMJS8OfL38IUCUysMtU+o9l+dXSpVDJcxKyQk/UDG7+8Vm
	T/QY1jqtD4oShkKLCcSMLgWcpQlnh8Ln5E944cnD9VPqDwpUXx+s0Z5hcqV4Xot5PV1Xz1VcGri2k
	aDEaJspAoyj5I48ery5XfjZ/7jpZolg/hLRwebcIpjXbUgUn8h9Wkuc0YvPDUPdFFhXmPPxiDsl76
	WFHj9Jy7MHnBEBoLRkmGxJ1VdoGU2i7Y+x70TCMC2SeNTavky/XuaIz3Ic6GFe0LcQCx7bMM3VPYF
	MJ7VJogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1kl-0000000Bigg-1bCE;
	Wed, 15 Jan 2025 11:40:07 +0000
Received: from mail-dm6nam11on20601.outbound.protection.outlook.com ([2a01:111:f403:2415::601] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1hi-0000000Bi0H-44Hj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:37:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWd0DZlmb47A0ziDAPITYWQ+kd5kvGaILzoBZvSkukeICeOuOgsMVxkEIeDHbP0w+N0NVSXULf6/ES1Bn3SzbwrfDC7Fzjo+P8tGnKjki93Sb7bDI1cxErKb55nCDbxA8WlINjk47IMG/ObQ5IO3c53TKvI5PUEvKikP/gqwaDBjf27Z2ZQd20yrN1eK6AdbQzvGKGhBwLuvE3809V4ROd9wxTRHKKnltSDelX/QubUq0ijEcCEG8HLq9MWXlksNulK26CMOFYaSg+242yC+OGkc0WnGocjmVTsbS953FHMs5+uZPMtFfBx1fStpqITrptGSg3q7cT4vhb/7eA6YpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7HLgQOnZ4t9OA2DiVyqG0r2WrkKM5Fs2gIjWmGHD3s=;
 b=jofuufHg0n7b1RWDk2WUfXJCoan0kjBnnp9N0Mhm0dsmoT8IjsZyMzxOW3z41TU7XCOTlSTfVbQg5C3u98ABXjmrOkZ0UvqoVV5tfi9j+kqf0e2hOJgxuxXDIk/kr167TspxcA2OkjRJ5LBi6IN5w2TBRTfPYmgLMTi2U4MkClFV2xCPHUEMV3xf4IH+k5uPWLMc9fEa/fKliwCMJiW1ti831nFS5mImMFruVAqLvxHAgzL2u8lzmlnmu4P8TqNRI6VVKr6aDYunIRxzH1O+eI4EIzc3zPFydqqt5IBKAV1JfZZ3C9b+iz6hvFQdXc2BrbnaNm/NNgOuDa38DyaJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7HLgQOnZ4t9OA2DiVyqG0r2WrkKM5Fs2gIjWmGHD3s=;
 b=1uI+oJEmYXMKvyiLfGdPY2yr1W3e68IVYEISnvcat8G73YBkd1AXnC5eIBBw91RchKlAZHRdNpgOKrCL5XXGKku0TKlBqRIAOoUxrAUlbcX+q5Crv6wsG+tLkh/XSKoDpsfTupoMf2afmj5BT5on6O4Eamki+hk9a4WdiNqhCJ4=
Received: from SA0PR11CA0107.namprd11.prod.outlook.com (2603:10b6:806:d1::22)
 by SN7PR12MB7023.namprd12.prod.outlook.com (2603:10b6:806:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 11:36:51 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::d4) by SA0PR11CA0107.outlook.office365.com
 (2603:10b6:806:d1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 11:36:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 11:36:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 05:36:50 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 05:36:49 -0600
Received: from xhdmubinusm40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 05:36:46 -0600
From: Mubin Sayyed <mubin.sayyed@amd.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <daniel.lezcano@linaro.org>,
	<tglx@linutronix.de>, <michal.simek@amd.com>, <ukleinek@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <git@amd.com>, Mubin Sayyed
	<mubin.sayyed@amd.com>
Subject: [PATCH v4 1/3] clocksource: timer-cadence-ttc: Prepare to support TTC PWM
Date: Wed, 15 Jan 2025 17:05:54 +0530
Message-ID: <20250115113556.2832282-2-mubin.sayyed@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115113556.2832282-1-mubin.sayyed@amd.com>
References: <20250115113556.2832282-1-mubin.sayyed@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|SN7PR12MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: b2028124-b51e-4b19-64b9-08dd3558e75b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3CRobntB6O37lGhFo562cZWCM/tav0iVphr2lDSJfd9mt2LqDA8ffVZ3R6B8?=
 =?us-ascii?Q?Lpaf2IuLJFsGOtCnRPN/mVwPPklSb4sYZfa3mGjX8nO3zNgR5NKT3O4pZWRd?=
 =?us-ascii?Q?4ZK0lZDQuhFRdqXE0QxEIoFBqeQKBKpjJCrtphzIFqJwf8CU9894fEEJcvlm?=
 =?us-ascii?Q?SZrC4O2cJV52qFBYTZhoBIuGET75yTNuWDTNdTjSgI9bGj2R85I7Bh7PNM0+?=
 =?us-ascii?Q?+M6WfU/TnFChZEFgfqElHcNQ5v9AlFHjVBdz8NyFNmdiGsIuE1vD+JfTFgTS?=
 =?us-ascii?Q?EKVm90XUixQKiRYkh97vlAiSGrY8kH1yMm/TXVuq5D8t8//roEnCoqSTbPxh?=
 =?us-ascii?Q?YBetObUJPlx12H3U40bV28j+Yc1HoySRg5q90BP2FD+GNzq//z9wUey10oKs?=
 =?us-ascii?Q?mhyAbvC+aW5DP3eprrqtUpKTnCVWJ/RlUfntpXvLzlv+YGe89Dl3gzKbRWsP?=
 =?us-ascii?Q?SOeZZ9A0QYdc9oz95wXy8QzGWM5qU4a5MgxOel0sl3jkrm1vVbR9AWdkT8zN?=
 =?us-ascii?Q?udNMdM+ivnp2Z2kN+4s/3Jl/1gSFIrzts1Us1l0AVCG0cSJzpbc9V5i8Y98G?=
 =?us-ascii?Q?iP+3jmSXlVJvgnhU3QtxBZy88qqOqrsrN8wBsrQvLvw7NnSKHln67xXxcoRR?=
 =?us-ascii?Q?xkEahRfvaZtOp9HFL5o0bih6OqL1/Ttwvj3q25SBX271UhFkwR3RtTPNgyJX?=
 =?us-ascii?Q?Peyx7N4eB1Ml44ZYt0RQC/+dukbLyWrjQeSd1PXlQkRrnexfdE/AOsqVglNc?=
 =?us-ascii?Q?1AeM9HhRfxc5Lgh03TJujYN1bsHhNWeBeH4DonHpv9uIEikcawpguuXuYSOl?=
 =?us-ascii?Q?A3bg+dfHVpB/7jXR3bzKVTl2MfLTLMablvQPMm9cJf6sPy8LP1Whk9Um5rFi?=
 =?us-ascii?Q?Gt825/9SNqehAE+PC0uN+xRvI1vDpNlNCtoLPSQ4+iAl5A/L+XNZUJ+ft+ho?=
 =?us-ascii?Q?ZmdZorg9cJj9r7rbz3n/qxp+VroqI09qDh1oHhG3TOl0rNJ3S9pAA3GZeeKZ?=
 =?us-ascii?Q?hjOYvHFnrqUesMeRrqNbTDoJEKigBFB3k0p8DGAd5St2ySXwPWk468LV8yM3?=
 =?us-ascii?Q?1Iztg8pG98WHLXB0nwgmRQC6AdxbA+MhY18Rs45lRyiY/WSfggO4HZwwyT9k?=
 =?us-ascii?Q?S8zprL0l3lP8C9xCYfYvKkM5+QlVX4i1hr0YxZ6J8ymG/sbdciCki8WWIXd9?=
 =?us-ascii?Q?ryOY30BrMkv+djs2vK+idWVxB8MiCEmhsku3NQRc7dIHAUWvLj7GOPjZuwL5?=
 =?us-ascii?Q?m7txD0h890ofRpKmw3GtlkhvnKGRVt5/qKxlNmRZ9MKjylVSqA8EvIYu7MFp?=
 =?us-ascii?Q?6F4neFr9iPbesyp8NtYqp/LH+cszJleVbMWvJ/wC0lraIp3IBT6i0Kh3c55y?=
 =?us-ascii?Q?hYKTEaJgUjrZslOk1sfPgpS4qXhep2cIVFLgKFIP88FJmSdvveYY4KzK6ETp?=
 =?us-ascii?Q?Av8PHydzQEM8bB525g2c+oRTnGtjTMwlnVRSnVLMRNyJCOyjEJy9Zz5IwrTi?=
 =?us-ascii?Q?iy33oy4uaTtjWuU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:36:51.0461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2028124-b51e-4b19-64b9-08dd3558e75b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_033659_011840_4E710BC7 
X-CRM114-Status: GOOD (  18.75  )
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

Cadence TTC IP supports timer as well as PWM feature.Existing driver
supports only timer functionality. PWM feature would be exposed through
separate file which is going to be added in drivers/pwm directory.
Move #defines related to TTC IP to timer-cadence-ttc.h, so that they
can be re-used by PWM part of the driver.

Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
---
Changes for v4:
  - New patch
---
 drivers/clocksource/timer-cadence-ttc.c | 30 +--------------------
 include/linux/timer-cadence-ttc.h       | 35 +++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 29 deletions(-)
 create mode 100644 include/linux/timer-cadence-ttc.h

diff --git a/drivers/clocksource/timer-cadence-ttc.c b/drivers/clocksource/timer-cadence-ttc.c
index b8a1cf59b9d6..2f33d4c40153 100644
--- a/drivers/clocksource/timer-cadence-ttc.c
+++ b/drivers/clocksource/timer-cadence-ttc.c
@@ -18,6 +18,7 @@
 #include <linux/sched_clock.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
+#include <linux/timer-cadence-ttc.h>
 
 /*
  * This driver configures the 2 16/32-bit count-up timers as follows:
@@ -34,35 +35,6 @@
  * obtained from device tree. The pre-scaler of 32 is used.
  */
 
-/*
- * Timer Register Offset Definitions of Timer 1, Increment base address by 4
- * and use same offsets for Timer 2
- */
-#define TTC_CLK_CNTRL_OFFSET		0x00 /* Clock Control Reg, RW */
-#define TTC_CNT_CNTRL_OFFSET		0x0C /* Counter Control Reg, RW */
-#define TTC_COUNT_VAL_OFFSET		0x18 /* Counter Value Reg, RO */
-#define TTC_INTR_VAL_OFFSET		0x24 /* Interval Count Reg, RW */
-#define TTC_ISR_OFFSET		0x54 /* Interrupt Status Reg, RO */
-#define TTC_IER_OFFSET		0x60 /* Interrupt Enable Reg, RW */
-
-#define TTC_CNT_CNTRL_DISABLE_MASK	0x1
-
-#define TTC_CLK_CNTRL_CSRC_MASK		(1 << 5)	/* clock source */
-#define TTC_CLK_CNTRL_PSV_MASK		0x1e
-#define TTC_CLK_CNTRL_PSV_SHIFT		1
-
-/*
- * Setup the timers to use pre-scaling, using a fixed value for now that will
- * work across most input frequency, but it may need to be more dynamic
- */
-#define PRESCALE_EXPONENT	11	/* 2 ^ PRESCALE_EXPONENT = PRESCALE */
-#define PRESCALE		2048	/* The exponent must match this */
-#define CLK_CNTRL_PRESCALE	((PRESCALE_EXPONENT - 1) << 1)
-#define CLK_CNTRL_PRESCALE_EN	1
-#define CNT_CNTRL_RESET		(1 << 4)
-
-#define MAX_F_ERR 50
-
 /**
  * struct ttc_timer - This definition defines local timer structure
  *
diff --git a/include/linux/timer-cadence-ttc.h b/include/linux/timer-cadence-ttc.h
new file mode 100644
index 000000000000..d938991371e5
--- /dev/null
+++ b/include/linux/timer-cadence-ttc.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ *Copyright (c) 2025 Advanced Micro Devices, Inc.
+ */
+
+/*
+ * Timer Register Offset Definitions of Timer 1, Increment base address by 4
+ * and use same offsets for Timer 2
+ */
+#define TTC_CLK_CNTRL_OFFSET            0x00 /* Clock Control Reg, RW */
+#define TTC_CNT_CNTRL_OFFSET            0x0C /* Counter Control Reg, RW */
+#define TTC_COUNT_VAL_OFFSET            0x18 /* Counter Value Reg, RO */
+#define TTC_INTR_VAL_OFFSET             0x24 /* Interval Count Reg, RW */
+#define TTC_ISR_OFFSET          0x54 /* Interrupt Status Reg, RO */
+#define TTC_IER_OFFSET          0x60 /* Interrupt Enable Reg, RW */
+
+#define TTC_CNT_CNTRL_DISABLE_MASK      0x1
+
+#define TTC_CLK_CNTRL_CSRC_MASK         (1 << 5)        /* clock source */
+#define TTC_CLK_CNTRL_PSV_MASK          0x1e
+#define TTC_CLK_CNTRL_PSV_SHIFT         1
+
+/*
+ * Setup the timers to use pre-scaling, using a fixed value for now that will
+ * work across most input frequency, but it may need to be more dynamic
+ */
+#define PRESCALE_EXPONENT       11      /* 2 ^ PRESCALE_EXPONENT = PRESCALE */
+#define PRESCALE                2048    /* The exponent must match this */
+#define CLK_CNTRL_PRESCALE      ((PRESCALE_EXPONENT - 1) << 1)
+#define CLK_CNTRL_PRESCALE_EN   1
+#define CNT_CNTRL_RESET         (1 << 4)
+
+#define MAX_F_ERR 50
+
-- 
2.25.1


