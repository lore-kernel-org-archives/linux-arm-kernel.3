Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158AAF94CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rLQD/bHn08XpHg7HbA43UdSwR5dHTkh3qrSmQeO9Qxs=; b=ocVwLVrneq8f1C2uaxeggBtCCq
	ShmaHNOP6QqCevUKzmjOSqOar4tvGrV1kuLIgwpzSZnJmdPP+P2L4/6jBV9kzmKhPXPkVYNM0UDse
	USwVUFyWFvXJnauwEnxjVGMHjVBQlf44ZfCrFQW9G2WL0XgepCmk65kW0K4b9zWBpr75XKhLovHBH
	v1lUp8h/BPphc6M8VwOubTF1r+cfTEpVeasauVPfUActgaULFsIzp8s/XvzV3bPEt0UEoRcZ5hOro
	oj3NHhMNK9StKRZnKwBgHrNGKrqHsn5oxeShC7j4RojAIMwrhyUyKko07xe0jYGkOf0gd7RvNWnt7
	I66UpCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHsb-0000000992i-45C7;
	Tue, 21 Apr 2026 20:39:33 +0000
Received: from mail-southcentralusazon11012035.outbound.protection.outlook.com ([40.93.195.35] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHsZ-0000000992H-33On
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:39:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCzwOvP5Bf8x614IRmFjgL8QUY/FVCARJQx2YX7uVGoxehvTz76oa7xydGD9e2x0dMi1EhE9B6sCBZZgdy9MSOKSpnw0db82IgfeVXynY81zQ6P7aaCI/WFjBCU8xnYapXap6nTPTNGxbkoj7jEMuO14SKxUOym25OcAmp6x7bo0Uyp4GO4K+qOx5Ymn8mofAZ1kW7QR9vlnvjnknGjRT+oPASAMKrIj5lYiaZ3v5JMpngKYJC9a1h7o5FqWViWq/2wCWZ5sDGwICEdEniOSQ6oHHfjUr0isq7ZWsEnksoIBkAw8NMHTk1eo3PGl43LN35+AcTsL+zhz3usGU0Ns2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLQD/bHn08XpHg7HbA43UdSwR5dHTkh3qrSmQeO9Qxs=;
 b=h6gCxHNQdeNPSoYqZ3j65YhENp7yu4qHyC+JgeycKni20k1eIQ/i78jPm3JIejw97Wjwa3HlFzj+qXhWglC+JHdqi4ImxZEi0B6YTWeBALP7GPzkDogAkQ0v0vJ91gUl/04Zq9T/kwqfQZKsRENGFPUqtoGLjLiCrbrGrC7nvLgWVQR9qLkBFMTzchClI8pFYlqU/XJJaLwZ5BgCoNgrDrRaXgl8p/zerwcDAtcwQfMY9gxrZZiuaA8LuFLdGh5BTLBeyxHysE1OC2iP73lE4bOi7SRe2sdLSPPeT3BoisMx48+XAjlC2W+1bCVJllauNlkf5AalbD8KJGznD3Ya+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLQD/bHn08XpHg7HbA43UdSwR5dHTkh3qrSmQeO9Qxs=;
 b=oRNR9hgBXglum6LoRq897m8e22NziAdVz96sZOk2cEDwTl9b3njwZENvmh/OMez4XrVQbtX6ahIOcCa7Z5M+SaRFn/Qt/Zv+Yy+QoyfQRhjLInZnY7WjUKuExNFFJ1ZahuxqEtTTuvOWLgzeO4OojiloQVBP4O82ccNIgdHFs9P6dOincUWtusIW/QyxXsIeh0nxVB/J2GGIsGg5arimKmTZjsBwl8/1mQWosZWM/C6txYIKbzLMxbjavAuR0ote7Uhtvfb6Ml9AH0EJNVIhLoiUWAf9IF9JAlaOw9FSDoaD4iQMjiplgydtrwUk08Khy+/8YQr8wbhbT7Lpn06Vcw==
Received: from CY5PR04CA0006.namprd04.prod.outlook.com (2603:10b6:930:1e::8)
 by SJ5PPFFA661D690.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9ab) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Tue, 21 Apr
 2026 20:39:20 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:1e:cafe::5c) by CY5PR04CA0006.outlook.office365.com
 (2603:10b6:930:1e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 20:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 21 Apr 2026 20:39:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 13:39:01 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 13:39:01 -0700
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 21 Apr 2026 13:38:59 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <james.clark@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, <skelley@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v2] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Date: Tue, 21 Apr 2026 20:38:56 +0000
Message-ID: <20260421203856.3539186-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SJ5PPFFA661D690:EE_
X-MS-Office365-Filtering-Correlation-Id: 133db09d-71f4-4876-ef98-08de9fe6109a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: WXc5LZB8bkvMXw6BYm8Et+H5QdeNguJCX8AB0r2bDQHsvW9YMILVQIEtVnbUHo8DfLsWHL5jLIFwbKlWdB8aZYb+mzBHc7SvPW7rVN9W3sGqfN7nUpNjTsDF3ohT0LBQwCTe4Lax/P9lPs7O66foEVGRYd+m28YWJw3ATNcasRr+Xm3cDeXOrMZyDLpMi9Vn89rHWbXXPYecIeX4pImOtTTSisS4qOL1II3mALGKreZLG5IYPM4Bi6dYHa+z8e6WSMMcBAjWTTWPAWj+6Z8ts/3mz0U38pg8muW7k6srh77/zl7W8GTGCYWrHpAsVX+XtxPVYddLJZvt0IeGKuuMiohdllFMdRLFJTZaOJM6bX1E6fApgHdrrJ2IardzvTIuvOOs+Q1FvojoViGwd7VVEkILVw/9CAZ5L1NtsJK2fIlcAP3W/kTM9rHmFvstS+IXWwBFqJX2avDeTP3T1J9PHbCps9xYXvrGy0J0Px4tQqz03i3outesgOH115HkI9pfmWueNOlWjr9fFg4hzxoM0GO4d5GsK6l2bMcqzW7K1pHZlc/Hmajb98FyXlz5efYK+GzlIruWry9qPaBhYBIRS08esvggB/ddPti62SVbL9l0CuTDocsNSpPxJEFJIG75z5ThAm52FCdtUyrSY1g81UkmnChG1/ssBRxyywTEL5jj5Swc1smuVTjjEYySTJAxdj4K4331M6pO4aqwFGHmmBfPwN+6NcNU6oc452tMzf/uGws1kMaIMrhfqfMsnwdeG5EmBzZnvjT2v4RSnvkvrA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cocbFsb2GU6PKGP0KuzZMaxOfTNwBsqJ7tlKAjggLnKWu2LjnY/jRHWvar99VWE5/KYatWhY3fRywoPgL1VtW94B413GCAgwBUwBvVbtlRUsrjoh3nE+yz6EO+hc814R/mssidBzF/KTGKd35ME5NC0cZ7x6zvFoyxtaCKnAybN2byI756rEGpCqeeTwH7iSblXbLLe91pXWJTRgjKyB3pPSfsZuGbV2E+GwPW7SBIpRGUD1tBs7UmGw+lnA31X0rkJM8zfi13gAXR3/1dPv0Wkib4dzRTr7pFu70sypjRH5O6eSwhYTRVeN9UNMdTHzAhpCp81gQeDof4Vt4i+5JJhQChz6GCZW3CxjDTXijh0Lxi4KbhpmU0xUFwNqnlXb3k0sN23fEf+frBhOYK9I3K48e0VJgTpifBF23UtTHswVYEvv2SAihx6eqs+gsCw1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 20:39:20.1956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 133db09d-71f4-4876-ef98-08de9fe6109a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFFA661D690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_133931_801351_497DAA24 
X-CRM114-Status: GOOD (  16.19  )
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

The PMCCNTR_EL0 in NVIDIA Olympus CPU may increment while
in WFI/WFE, which does not align with counting CPU_CYCLES
on a programmable counter. Add a MIDR range entry and
refuse PMCCNTR_EL0 for cycle events on affected parts so
perf does not mix the two behaviors.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---

Changes from v1:
  * add CONFIG_ARM64 check to fix build error found by kernel test robot
  * add explicit include of <asm/cputype.h>
v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-bwicaksono@nvidia.com/

---
 drivers/perf/arm_pmuv3.c | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8014ff766cff..7c39d0804b9f 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -8,6 +8,7 @@
  * This code is based heavily on the ARMv7 perf event code.
  */
 
+#include <asm/cputype.h>
 #include <asm/irq_regs.h>
 #include <asm/perf_event.h>
 #include <asm/virt.h>
@@ -978,6 +979,41 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 	return -EAGAIN;
 }
 
+#ifdef CONFIG_ARM64
+/*
+ * List of CPUs that should avoid using PMCCNTR_EL0.
+ */
+static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
+	/*
+	 * The PMCCNTR_EL0 in Olympus CPU may still increment while in WFI/WFE state.
+	 * This is an implementation specific behavior and not an erratum.
+	 *
+	 * From ARM DDI0487 D14.4:
+	 *   It is IMPLEMENTATION SPECIFIC whether CPU_CYCLES and PMCCNTR count
+	 *   when the PE is in WFI or WFE state, even if the clocks are not stopped.
+	 *
+	 * From ARM DDI0487 D24.5.2:
+	 *   All counters are subject to any changes in clock frequency, including
+	 *   clock stopping caused by the WFI and WFE instructions.
+	 *   This means that it is CONSTRAINED UNPREDICTABLE whether or not
+	 *   PMCCNTR_EL0 continues to increment when clocks are stopped by WFI and
+	 *   WFE instructions.
+	 */
+	MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
+	{}
+};
+
+static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
+{
+	return is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus);
+}
+#else
+static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
+{
+	return false;
+}
+#endif
+
 static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 				     struct perf_event *event)
 {
@@ -1011,6 +1047,14 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (cpu_pmu->has_smt)
 		return false;
 
+	/*
+	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
+	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
+	 * prevent inconsistency in the results.
+	 */
+	if (armv8pmu_is_in_avoid_pmccntr_cpus())
+		return false;
+
 	return true;
 }
 
-- 
2.43.0


