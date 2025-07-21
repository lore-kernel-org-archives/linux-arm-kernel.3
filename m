Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1889C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lawGmDdTh4PjP4bEM50BqsTt70z6b7WCYBt8JDwh/Ws=; b=MwBrZpvSHRql77WH2DKl3z8kRm
	9+AxqOGae0/V1YB5RUyDgi4iWCX1LmR+tw6627+FMKuu6rQpp5AOQBD74UODcdNWz7IBlFw2/eHco
	482XFPm8s/TIT/3ZsSNY90rFObXKdtWFJEgeAozHmmOtmTya3fjTfkrOezB1wjnvM5I140GaJnt15
	26BUz91m/sUGhsJWh7w2WJ7rAa05ESr9cwoCkzX+xw6cvHzB9ZknQKqU9mFB0uhG8oohfSqVu2Pv7
	lgCtvtiKrXmlxZG54FU/XiedMogxnnIsSxnj4qEiYFPgk1eC8KkXxSvGtEkfWytoLOfTw4g7ujxJh
	YTw0UELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnm4-0000000GxiY-3XcI;
	Mon, 21 Jul 2025 10:29:36 +0000
Received: from mail-bn8nam12on20630.outbound.protection.outlook.com ([2a01:111:f403:2418::630] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnEC-0000000GswL-05Ck
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 09:54:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xra1FOsEWCBuB2wx30+lPH26WTbcAnEQNgG4mH/yB8pFnzZzX5vCb8hRoUvrflKGw44CR9WljxUu3EgYL1TqR1wy3ZcvWeXV7TqogihGPIT9TQUxDSjxehJUVGjS2PhPo5yMpIhATSXgANKWO9YZ891/H0/Yo19Kx0aP7+5QW4fbnFq2YRyvYIlTr+piRiNVESOlSOBpkwrvBWUrk9ioXA12FIk43TQwZVqeshnCveyHVQzC/bkTcdqq7sCPfnPabXgz9uZb1IG0CHStZ1E1Sppr4jZ6H3GXvrpoe7mhs+HaoQmfTqI28r2SUXswEsTazmqw0P7nPg+VU8vrqdlI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lawGmDdTh4PjP4bEM50BqsTt70z6b7WCYBt8JDwh/Ws=;
 b=wDlz7G1RYpu1Ve9evl/lLfVWEJaZeF8T0GWgQI35v7qnSJpVAmIeDmfy8jaZl38pyQdDzngbi6whDfJ9eOCrj0NktSnFKDkJxWGAIIe+VS8bNJrVSMEkYb9k5DhX4hQZVRE5YPfXza0zXWGIpqTcdDS6vgbu8yTwqq5snwc4uH/4P1bjEuhTfjY4CSnH2TsIfet0HZpJrK+GFkI9x6ScguJZYsptaT8YF1tw5Fdid60hCayLYAnbGovyieR+CtCd6rD1OtT2J5r8NskLlcwhWdbs86HK3iYbWORR5BFy4Ez/k+btfjctotYgBP6jRu9oaK9ej+oQYL5nqpq+hLHYtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lawGmDdTh4PjP4bEM50BqsTt70z6b7WCYBt8JDwh/Ws=;
 b=WRwvfsGmkUN3Tg2hYEkpl4EowyQdnHIh5hrdVuj0EYhmrkt4VzaB1kgXolPZSn6EMDCQxoJIMGDQqy6ESUpwXqJTn3JNwsLEIgKlQLXImjkNTW4hu+rn328gS6BwzSYaPo0ARhcZ25DLti8cgI3se4VUfOYdlNCq+2gOUsNrkOs=
Received: from MW4PR04CA0119.namprd04.prod.outlook.com (2603:10b6:303:83::34)
 by MN2PR12MB4158.namprd12.prod.outlook.com (2603:10b6:208:15f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 09:54:28 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::35) by MW4PR04CA0119.outlook.office365.com
 (2603:10b6:303:83::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 09:54:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 09:54:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 04:54:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 04:54:25 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Jul 2025 04:54:23 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Michal Simek
	<michal.simek@amd.com>, Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <saikrishna12468@gmail.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: [PATCH] mmc: sdhci-of-arasan: Ensure CD logic stabilization before power-up
Date: Mon, 21 Jul 2025 15:23:57 +0530
Message-ID: <20250721095357.3783222-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|MN2PR12MB4158:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cab4684-c9a4-4260-e350-08ddc83c94e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vDZQjHBtnnE9N9Cbr6znhF5lPiLh7F8BDFR4La+iMuvMDatmW0pB7p0rwEwe?=
 =?us-ascii?Q?dDE9JuXQPYcOtaluttJv6QxEX/54HuI5j9ulH0EChBhfgiTQMEHsAgrVfawM?=
 =?us-ascii?Q?d5Ot8ARfbzavv6HKKTrJceVELFfY/GrUZ/qUlinKwOjOYmg1A3peK82vDMZi?=
 =?us-ascii?Q?CelWyk0zUoqmYRZxLbXsB3jFzztg/SVEmY+/yhiN8RJR0zQNP4E94Y0yB2Lm?=
 =?us-ascii?Q?fdYT6DayH4M2B+miiPFO95DnMr3z95H6vDVcJhNflAYcq+OmwGKLFj+VxPQM?=
 =?us-ascii?Q?rSaNVCrFFpNuBjZEB6EIyHR9fCJ+zYamodhivtupUa70TWdprng0n925wdzW?=
 =?us-ascii?Q?Khb5QYnLh1W9ATy5D7yFRxN8IOUEpBm8QnTx973D7UxHBYia+n1v6TyQ4mC1?=
 =?us-ascii?Q?ds0e9WkDX1g76rNOzy5WV08Ki4/bVIUVgR6O8rnAIzowF4iWiCQkAgg15Ofc?=
 =?us-ascii?Q?p66pWQDh+/W52GgG2hG7FQ6wXM/Rn1+KPK8RCabOtX7nEf0Un0QhrWe0EZlj?=
 =?us-ascii?Q?1mJLsSDJTHg6STmMZjW8JyG1X67X5cDcJ2y85BqbkVwVvDDXsmg0O3GOON2F?=
 =?us-ascii?Q?xQRkee2Qjj6gmGhKtCiJu2lyYc6pt42eYFSWMxuUlxYsNWGPCQ0GQIYne6oB?=
 =?us-ascii?Q?D5ZcAW/dPB7Zgm7NaRAzAVJmrXNOU5Pk0V76SDVam6gJo4eX2seeB2ABju2n?=
 =?us-ascii?Q?G4fZonJtVq5b4uhZniIzyytVAVmNw3AZdbtOGbZrDThwfYxxsmDeKHCttXdI?=
 =?us-ascii?Q?iUXFwSWAvrC+7xOjrYKcujUyZbRFOe5646NyWlgrFSP2VA9zsPSov2gudZOV?=
 =?us-ascii?Q?IlsSN5VNZrgCTrRM+IjfxkHNO+cQS35j+EuzL0Onnd+CcLFWj4OFqdPG9aVt?=
 =?us-ascii?Q?CJg+onYRwqIUDMhoqCLM0lwiChnaNefDLwXJh8hQH6CRXvZUQP8tsFciPXDr?=
 =?us-ascii?Q?0z4XnO0mSaYT7SVyv3JBbsq5ilHV/lgGa97WcKn4c3YQrviCEtBzeCffw4F6?=
 =?us-ascii?Q?TH6HRYJbEIPAp1y4tiPzPUW+SQA0cxnMQPEQYcH2Llx65s4asbQDUvvo1AcJ?=
 =?us-ascii?Q?Er9ksDdZUqB+4EZcNqlJ3HiuSPOgx3ANVoMex/C++4tNAjLsVnRBUGc6dzq7?=
 =?us-ascii?Q?HXXJ/8Gh8qdjnANbnmRDVdzrCVDhjRaywEBTT+RRbZVAEmr6rAAth1ttTOL5?=
 =?us-ascii?Q?Tc3aDuuFn2uIUs2xDA4XvVSHYIrwQmD3O5Ma+h7C+8s076FTW1bGkIGXocGr?=
 =?us-ascii?Q?oksp84wN+csjlc9ALv/TooXpHwo5HTQZJZcFr+l3YJOcmk8Mv7c1J1LVc7MN?=
 =?us-ascii?Q?5FcgQqAPcOxsOfyMRzwkhYOGfLrAI+HrLuoSd7glpZwxebDAO5plEQGYMMK5?=
 =?us-ascii?Q?NY1vu7X8bJNr6T+mr5b1dwybhAbbl7FDDJSo6tdAJrzUZKMuX4WNmwO1zNi0?=
 =?us-ascii?Q?Ev38mZPUH76Fr3cw7FYaLR47OzJ7DK/0uzy3ZlEd7sfTm3Szl3ScIpiJ4juz?=
 =?us-ascii?Q?l7oj7/HkVNk/DVfTIh4pxstJFrjZeeKPi1tB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:54:27.6819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cab4684-c9a4-4260-e350-08ddc83c94e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_025436_063544_DB5A3315 
X-CRM114-Status: GOOD (  15.84  )
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

During SD suspend/resume without a full card rescan (when using
non-removable SD cards for rootfs), the SD card initialization may fail
after resume. This occurs because, after a host controller reset, the
card detect logic may take time to stabilize due to debounce logic.
Without waiting for stabilization, the host may attempt powering up the
card prematurely, leading to command timeouts during resume flow.
Add sdhci_arasan_set_power_and_bus_voltage() to wait for the card detect
stable bit before power up the card. Since the stabilization time
is not fixed, a maximum timeout of one second is used to ensure
sufficient wait time for the card detect signal to stabilize.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 drivers/mmc/host/sdhci-of-arasan.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index 42878474e56e..3ce55009ba4a 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -99,6 +99,9 @@
 #define HIWORD_UPDATE(val, mask, shift) \
 		((val) << (shift) | (mask) << ((shift) + 16))
 
+#define CD_STABLE_TIMEOUT_US		1000000
+#define CD_STABLE_MAX_SLEEP_US		10
+
 /**
  * struct sdhci_arasan_soc_ctl_field - Field used in sdhci_arasan_soc_ctl_map
  *
@@ -514,6 +517,23 @@ static int sdhci_arasan_voltage_switch(struct mmc_host *mmc,
 	return -EINVAL;
 }
 
+static void sdhci_arasan_set_power_and_bus_voltage(struct sdhci_host *host, unsigned char mode,
+						   unsigned short vdd)
+{
+	u32 reg;
+
+	/*
+	 * Ensure that the card detect logic has stabilized before powering up, this is
+	 * necessary after a host controller reset.
+	 */
+	if (mode == MMC_POWER_UP) {
+		readl_poll_timeout(host->ioaddr + SDHCI_PRESENT_STATE, reg, reg & SDHCI_CD_STABLE,
+				   CD_STABLE_MAX_SLEEP_US, CD_STABLE_TIMEOUT_US);
+	}
+
+	sdhci_set_power_and_bus_voltage(host, mode, vdd);
+}
+
 static const struct sdhci_ops sdhci_arasan_ops = {
 	.set_clock = sdhci_arasan_set_clock,
 	.get_max_clock = sdhci_pltfm_clk_get_max_clock,
@@ -521,7 +541,7 @@ static const struct sdhci_ops sdhci_arasan_ops = {
 	.set_bus_width = sdhci_set_bus_width,
 	.reset = sdhci_arasan_reset,
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
-	.set_power = sdhci_set_power_and_bus_voltage,
+	.set_power = sdhci_arasan_set_power_and_bus_voltage,
 	.hw_reset = sdhci_arasan_hw_reset,
 };
 
@@ -570,7 +590,7 @@ static const struct sdhci_ops sdhci_arasan_cqe_ops = {
 	.set_bus_width = sdhci_set_bus_width,
 	.reset = sdhci_arasan_reset,
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
-	.set_power = sdhci_set_power_and_bus_voltage,
+	.set_power = sdhci_arasan_set_power_and_bus_voltage,
 	.irq = sdhci_arasan_cqhci_irq,
 };
 
-- 
2.25.1


