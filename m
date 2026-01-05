Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E658C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Cc5jKflp9TlkxD7MiDANYT80vnx7M1outrulGRToH4=; b=ao9zkoo9vvSk3yA+XAXsdLa5kT
	R7fJ01s4D5ws774Vgz581TM4Bzu42xnhCbr+q9xze5127IlSON51OpJ2VmnLYZrlPuVDgCeYIEZjf
	pEGMcFNaeOTtWjOmVEtEPS4LHQm80Bpyf2YIJMYEuhCzn9OnzKM/mKj5v6UWCQ1NoVp+5GdLyBdjI
	qQ0bGPubb8dbGMshW4Eazp5XBpbJWndPDLGQ4M7NxDR8t1I+/zfTJQKt+2Oy/0bQDjHpA6hZP8OjM
	sByKENZtGOUiOo6jOE5lvsAiIZm8EdhLRxn4+HZwe6wAEdQdi5mibEGcEuljrIMJYVkHARkxaKOJr
	og7rg12A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcco6-0000000AilM-2iK9;
	Mon, 05 Jan 2026 05:07:09 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcco3-0000000Ail0-1NkH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 05:07:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6xASHvqSeCL+uauU3TYn9DzCIIS1726vebFQ2QoPnxcuz1rv5DhRHYb7/8PYPGpaCM1froN0wqEk9tjMI5UDTPg4qLYgWSjADtCWorU/oQDLlCpwygznGmqRHFJsOnDOoH3XbbzAMNNUpRsXiuooavDfvGAdysTQGXjCmVSWKdWgxutnMq3tI+HVANKXf5m5q+NMzFx5fdO1E9SD+LXynVrOCAWRAMmwhcVboxPdt5qko3/chHR4Tm8zPb34c+KbnA4uVZ/rJQj9Au3STA87jdwT91VoNenCFNyNx3rdNw/3ZBibxD5oB6fpqhkAEVaUHXvj3J+XPhIH/J7cHnzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Cc5jKflp9TlkxD7MiDANYT80vnx7M1outrulGRToH4=;
 b=aHp92S+8r2mbR2Iok6TooQJ68uCZQ2Oq8+XHo+CuA1yYYSmrIQYPNIvMBm/qkp4udRoeQAPPUSOwCnJ/ckZqz/xPuRksRmc0b1GSyT9JtOFby2U18MnEI80rSNhZN68Cgo/AWr+NcQ8vXOrudZSGf8KYF25/c4gYlRhiqretlC90k5pVDZO/1yQyVKJZlHkKQ8ug1vPqWXboss+Hk+iNH5UOONSylXLC6IjY1kQIoVzdALqmVdTSU/ZHIKuVbTCXxLEGIkufGk7d0FQpQHcZvjdwpTKF8uta4nYmYbCZ6oF0fazobn6nJGG4q+JtBSYexUGKp69quewWIwCb/9py4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Cc5jKflp9TlkxD7MiDANYT80vnx7M1outrulGRToH4=;
 b=NwYlYWhjPJ0hzxXSNjVDQqzwtFdVEWEMFUL6B5u0yJ1QGWQumJUo3LSPN9lrBCwJfuOSv4EVcUL4FbI/Yhe3gkK482ckreWvMzF3Il4oILL1z26qh56tLiqXfsIUwv1h0keUlJ/sEorX8mVX08lCfmp8AEMvznyh3rbzQLMJJ1U=
Received: from DS7PR05CA0104.namprd05.prod.outlook.com (2603:10b6:8:56::16) by
 SA1PR10MB7855.namprd10.prod.outlook.com (2603:10b6:806:3a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 05:06:59 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::bb) by DS7PR05CA0104.outlook.office365.com
 (2603:10b6:8:56::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Mon, 5
 Jan 2026 05:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 05:06:58 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 23:06:56 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 23:06:56 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 4 Jan 2026 23:06:56 -0600
Received: from uda0543015.dhcp.ti.com (uda0543015.dhcp.ti.com [10.24.69.9])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60556qme566425;
	Sun, 4 Jan 2026 23:06:53 -0600
From: Abhash Kumar Jha <a-kumar2@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <u-kumar1@ti.com>, <p-mantena@ti.com>,
	<m-chawdhry@ti.com>
Subject: [PATCH v2] arm64: dts: ti: Remove 4 watchdogs from common file and move them to J784S4
Date: Mon, 5 Jan 2026 10:35:57 +0530
Message-ID: <20260105050557.3459321-1-a-kumar2@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|SA1PR10MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 66114cfa-2af6-4c18-539d-08de4c184111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O7z+o+1cKCFLu0Z+ZMoLod+nkV4yGCXEqtPoxyqmseQsDf1BOuX1cPnac5vS?=
 =?us-ascii?Q?P1ItAyx0ryY1m+ejpB38govCQwOqcbib/0j6kdNvhBd0MegeTEdcmYiF88Sx?=
 =?us-ascii?Q?SnPuCXEzUDxHf+XJxOcZ71FHuTVY6TiEqpPy7A8RCc69pd0SM65JryQ5yOcZ?=
 =?us-ascii?Q?4lvB0n/pbeEiRETdwTOVXrK7gQ18yTLZZGtWfLWu4vrvnD5bc5rMic2/50YW?=
 =?us-ascii?Q?Vr/2x5UW2+t75ABgxeewmy/dcuFHR0d08ARuwQ3VQmZULt9gYxDx+ZgA92zJ?=
 =?us-ascii?Q?mI37r4f5RpPISPqSgAi+yI2/+c3wy7rIUKr07qOIJtilB0g2R1XFZhulotY5?=
 =?us-ascii?Q?K3C3USs65IVRxLKXEDlqowbE7ITW7onmjnxDLQHbQRiZR4MLmnMikcIpe28o?=
 =?us-ascii?Q?hqS1hZGO8JnKFP58lMgGvj2prfHtjFH6vqpZYU2fcqZtFwfFlL3gjA4jIgnD?=
 =?us-ascii?Q?4c4xPfQWEd1ajdrKcvrc+9DKJm6UMi3KRVLf2IuGf+kgCAKlW5pcBVADdm1w?=
 =?us-ascii?Q?PR/WBU4o71CVL+ME0usGNzeJVu5wb5WST3ZHj7sOOYNxiCGm091rlaTFErrn?=
 =?us-ascii?Q?hqp+b9wXkU6EjFeYKYgR6tyMEPU9xgq7FtKF/Cpjk0GyiCc3qImkmxMPrSLC?=
 =?us-ascii?Q?tShnhNuITTS/laoNyJXk8zLhITcdpEiABjG/58AZDI9uQVf48nKKIUUD/rPa?=
 =?us-ascii?Q?1sZ3j+zAEWE+EcigzE3YxhUFqM1w4rHRIN+vzGobQPZr1ZbVTdkuE1Fu0jzH?=
 =?us-ascii?Q?vEbL+/+CEJpo/rLnYGYL1sU02Ux4wmilbIys7rE3GTCYZl/bnvHfx5CBDGse?=
 =?us-ascii?Q?w7xY0CWPlMuZ1qXOB64piHaQ4oG9whxEYQJlpqXgiSlWGqiGsW7/cd7wvogN?=
 =?us-ascii?Q?3xIhKVBwmGKPPyAtOV/7Fy6KkaPSfzpiVQUHxIvrxiCtuPemqPJTqyYmyBJl?=
 =?us-ascii?Q?uQY07vhKe5Ys+pQuYJO4qjleX7F4USoTnowNGcvPFREZBqcjnhoBVmXHv2hX?=
 =?us-ascii?Q?S/Kahixuwovw71qJWi9HKlTxkg21KgUcUyt1negWO8Dd3XI2I3yTyal03poU?=
 =?us-ascii?Q?h9wRWgEJcXzk2Q2OwW3XHx/QrDfJ45ViYeYDREk7XR2dXp5b/dvewM8ueSrR?=
 =?us-ascii?Q?yuqNE+eEqX7O1uTDQ/F90I06L3341tE3Yf9ABIaAjhZeNoZfPDYDSxpFT+Ek?=
 =?us-ascii?Q?ZSO6lR/E+nL/+2JG87FNkaHSIN+9Udea4sU504NRnk+a/mOMwAyW9auBwTlT?=
 =?us-ascii?Q?C4sH8ALhXAsuld+HaNZnHNjkZzL/DlNsZhxlJifEHv2BBABGtq66YP56qUfJ?=
 =?us-ascii?Q?Z394UkbSr4DunSXJBaxvFrd7cq28/v+YwbrxcXwxLY4K11ee3L8D2LwJ7mHE?=
 =?us-ascii?Q?71dooapLTUMhRrkPzT7Kd2TsmJ4EdHdluJB6lVMtcXd7GeCQwtGqH7n+Bmk2?=
 =?us-ascii?Q?JZxJJUR5KRUjC9W28E70wVrlnpu5e8ImQ2NkhOgbScrW2mhBrLiIW+3jZdI8?=
 =?us-ascii?Q?yhwujzD8+UNkxcOHYudhPDEYvuXVjLMgxxiqbTO03yZ4wzrQ8anPuXwan5Vx?=
 =?us-ascii?Q?kIbosMwogKaUFepkCUnrnENFNvxPhNCux5ivkEx0?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 05:06:58.6729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66114cfa-2af6-4c18-539d-08de4c184111
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_210703_473326_17885F6D 
X-CRM114-Status: GOOD (  10.94  )
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

As the J742S2 SOC has only 4 cores, remove the extra watchdogs and add
them only for J784S4 SOC.

Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a common file")
Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
---
Changes in v2:
- Added fixes tag in the commit message.
- Link to v1: https://lore.kernel.org/all/20251224055410.208516-1-a-kumar2@ti.com/T/#u

 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 36 -------------------
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 9cc0901d58fb..c2636e624f18 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2378,42 +2378,6 @@ watchdog3: watchdog@2230000 {
 		assigned-clock-parents = <&k3_clks 351 4>;
 	};
 
-	watchdog4: watchdog@2240000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2240000 0x00 0x100>;
-		clocks = <&k3_clks 352 0>;
-		power-domains = <&k3_pds 352 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 352 0>;
-		assigned-clock-parents = <&k3_clks 352 4>;
-	};
-
-	watchdog5: watchdog@2250000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2250000 0x00 0x100>;
-		clocks = <&k3_clks 353 0>;
-		power-domains = <&k3_pds 353 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 353 0>;
-		assigned-clock-parents = <&k3_clks 353 4>;
-	};
-
-	watchdog6: watchdog@2260000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2260000 0x00 0x100>;
-		clocks = <&k3_clks 354 0>;
-		power-domains = <&k3_pds 354 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 354 0>;
-		assigned-clock-parents = <&k3_clks 354 4>;
-	};
-
-	watchdog7: watchdog@2270000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2270000 0x00 0x100>;
-		clocks = <&k3_clks 355 0>;
-		power-domains = <&k3_pds 355 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 355 0>;
-		assigned-clock-parents = <&k3_clks 355 4>;
-	};
-
 	/*
 	 * The following RTI instances are coupled with MCU R5Fs, c7x and
 	 * GPU so keeping them reserved as these will be used by their
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 0160fe0da983..ffc61ec77635 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -113,6 +113,42 @@ serdes2: serdes@5020000 {
 			status = "disabled";
 		};
 	};
+
+	watchdog4: watchdog@2240000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2240000 0x00 0x100>;
+		clocks = <&k3_clks 352 0>;
+		power-domains = <&k3_pds 352 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 352 0>;
+		assigned-clock-parents = <&k3_clks 352 4>;
+	};
+
+	watchdog5: watchdog@2250000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2250000 0x00 0x100>;
+		clocks = <&k3_clks 353 0>;
+		power-domains = <&k3_pds 353 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 353 0>;
+		assigned-clock-parents = <&k3_clks 353 4>;
+	};
+
+	watchdog6: watchdog@2260000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2260000 0x00 0x100>;
+		clocks = <&k3_clks 354 0>;
+		power-domains = <&k3_pds 354 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 354 0>;
+		assigned-clock-parents = <&k3_clks 354 4>;
+	};
+
+	watchdog7: watchdog@2270000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2270000 0x00 0x100>;
+		clocks = <&k3_clks 355 0>;
+		power-domains = <&k3_pds 355 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 355 0>;
+		assigned-clock-parents = <&k3_clks 355 4>;
+	};
 };
 
 &scm_conf {
-- 
2.34.1


