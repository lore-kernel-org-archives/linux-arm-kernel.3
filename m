Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE15AD39000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esm9WrD4BKpKvvKYouyabdzOJD1xFs4WzI7btg4LvbY=; b=IPoFfadcWkKBBy24ye98PlQIn9
	PbC0HM84WsUrFVnX2e4spmgngrE8HDs4zXqMsZoBtsl/EPEyXG0jo4Tn+aHttKsSH9Yrm7BfjmufI
	qSgLxvtPnviUmS8wgN2AtIO8oiA6fn3zfEhPjwq11y+VW29aHdGmX8HA5fuOF4p3VLng1b6SBDhnu
	wP0y2EnhFYUP3/Q6tx6b4BA9bdMYXkqaf+dYHJq2CaOeuVsPlh6wluF7wL4zw1D/j/XpIgBe5MUJ7
	0nj7eyr6mtCmx8+YrX/9U0P7B6IdlKsyCcUip0MPlWXsoRD5zkwR3stCw/0YamIkk2nY18xx3qigm
	YUpdiYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4nG-0000000A9kv-0a3d;
	Wed, 14 Jan 2026 17:36:30 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4nD-0000000A9jL-3gBP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrAerts/KZAITCY7izQmEiIOd33+70cqTA1ff7s/+O7E2Sc6yYfbRyptlw7UdBOTt8N61CYWxSRj2GYKkkK2QXGgh030TxUc7gcqkXtbzjYRsMbZZoec/qp/G5aJ5aOY08Ojvu0Lw3ks1QULTmhdJSHm5XXOSkk+kg9csPV6alRgzTOpCuZckQ8f6c7t/0HFX7AEok8kmABRKhtWxFmJWX8qTS/OzkMgwZBPX4I31bHmke5c0QxAw8ywHNwG+ntQiD2ywV2tWfrEy+iFgdTUWliK2k94FOTet4y9ZY8mD9ygby9uq+p0sBVt8n/j4Jd3gDMEQZdY7IU5O0fqDzGyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esm9WrD4BKpKvvKYouyabdzOJD1xFs4WzI7btg4LvbY=;
 b=EP9YFL+yXQBnf19OhQlUqoMR1WTOkeUNkIHIMmiTFu7ooF00Nt9v28Na9KezynnEKusQlZJNakUXVDCCCU2tk/ESyZ8y2YSSsWizyTyiYsbl+3gu5uSApgXyETILcvv4zAE2SfkFmJmN5lo1Vc90DRbmd3WmO0GX4aRMxSRqxooSKtm/SiEHkJQyqAPsvmvp/8Q+KxYzQEdTCx5uP8Y417KMa1duZxIQhh0abV51NetCdb5g/RVvHs0eZXi6Ci9mIhURl5hC9NE2pHqIYiV+/uc6bRiTSMmM981PqrLjxXL/tmrLCEvap91C/sOlyi9RsJ00d3wotoUTLvR86CaDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esm9WrD4BKpKvvKYouyabdzOJD1xFs4WzI7btg4LvbY=;
 b=kfHtQhvksLk+/197JPo1GxLf8rWio1TRdp8dg+sNxzf3FzxChSYOEyTkdUjvxRvuvsRkQSJumw2EJ4zjeziWizp4Ef3d6tL3B7bydj897+FM9FP3GobQthJQE/g6oEMPpXV/3lu6ZwfOQHi+supqHS9SQOihisw22RXS1PDSUPo=
Received: from MN0PR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:52c::31)
 by CH3PR10MB6738.namprd10.prod.outlook.com (2603:10b6:610:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 17:36:20 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::d8) by MN0PR05CA0006.outlook.office365.com
 (2603:10b6:208:52c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Wed,
 14 Jan 2026 17:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 17:36:18 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:36:00 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:36:00 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 11:36:00 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60EHZpkN040370;
	Wed, 14 Jan 2026 11:35:56 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/2] arm64: dts: ti: k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
Date: Wed, 14 Jan 2026 23:05:50 +0530
Message-ID: <20260114173551.2545088-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114173551.2545088-1-b-padhi@ti.com>
References: <20260114173551.2545088-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|CH3PR10MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: a099397b-739b-431c-c733-08de53936d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|34020700016|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uX5QEKoQPCN+57+iicSzd0X5YgSFht90Z7laOi2lylLwvL0ug7YJd8K5ld9f?=
 =?us-ascii?Q?YB5Kz/YIg++MM2gRmDcFVIfrYNOW/1TH2bg2F1SRyb3GrI9A4fKdtzakaAL9?=
 =?us-ascii?Q?PnfCFa5przGhvLmid0M1epaq/Z3lw+OH6dOcQ4VAY2M/KWAl1bTPEfJa7NEm?=
 =?us-ascii?Q?iPMirFhSAcHjb2nhbxMyD1Y+Lb1cVcQLSdIWg7GGN+zUyW+EXh6MZx/66m5/?=
 =?us-ascii?Q?zzOcKHHp4NOD/NHe71OEHDa9f2IY+VWxqoKZ2HnzyU47P4gLMZ4tZwvirQxS?=
 =?us-ascii?Q?5CAa9NNBN3nztq6GRR4uZ+vbVBFw72MJqh7xEXgA7dT3Lr4jfcAf/C3vst91?=
 =?us-ascii?Q?JhQd3RqFoda5nSpTMsWtiTIxg/fc+5FSy12YiJuzhpBwkRJRaR8a9bE3KF8a?=
 =?us-ascii?Q?SrBOTXHcDGwlzYUfp1xTOyO6TjbPQCH3SjUaR/qho8hablanis0w0OjKvliF?=
 =?us-ascii?Q?HZK3HjPmzQkgUdMqWV3AUmcjXHVX3iTGWUdW1osSvdjeJRRlQ+V251Oxrip3?=
 =?us-ascii?Q?b4LQTot+rdkFAbelVw/dtqdAG1bZYznE67OxrYXBaIidkIw8PlmVP9XsQdSj?=
 =?us-ascii?Q?7HX4PR2NPEUg3yptEvVSSH4LgL2HxdFu6/JdNIJO5IVtZwwVGa56MPyKVc+L?=
 =?us-ascii?Q?a7gUhbK555L3PaP49EimxJa744tTFY4RbtuuwTKxIdRt5u73xSUOJwMY/Q/T?=
 =?us-ascii?Q?SOJdoh/bKh7AUn8VQJrJH233tqjHEaJFnOaoW+LZjmU6YoJMA+SF+lQTRI1t?=
 =?us-ascii?Q?2oe8Af4/W6e1334b3b/TQVbd1opfnFiHPhajhUFujj3FBuFvEWmikPMvwLHx?=
 =?us-ascii?Q?mMH1ikV3m4sTDgaaJxTxGtA5Ry4PvrSvJIlue2QjSDIeqNUWVId0YfZyse2R?=
 =?us-ascii?Q?RIGV4L4ZmR6HIlnpXa6B2VGFhI/v66pDE6yRZb9MdoxoUWhDBvNaza7Uz5XP?=
 =?us-ascii?Q?6wOdUxKgs5J0M/oPR7w9VTph13zpL2NrZpLLucnTpW8FCUJBnnymy7Tpqe5w?=
 =?us-ascii?Q?dsVxJ4wVJ6yZeTZY6lCQ3WALqeOeI1XPTaqjAwXjJtiX+3WbfciIWKgNV0sh?=
 =?us-ascii?Q?SeVYJD0vJ4MSs/BzwfeSjSDUvciQ6pgmTUWoQhd90QSh9iDtTU9gVnhOli0q?=
 =?us-ascii?Q?bYScRl0KjCUC/Bobst+KVj8byPuxNbHwEvPNrc0q1wlYOVONz3+DgVJ9fSji?=
 =?us-ascii?Q?d2uaes+Ch6VAa7n59OzFWWGwXRZic4kjheRM71ZrHAu90SH6kc/bu+4OSeD1?=
 =?us-ascii?Q?0ZCYMR901exwK8d1b65SYciQCvaFjbV0HICnjjbKFnSBLl514udG/FCuSJi9?=
 =?us-ascii?Q?05CGu3SUGJhI7nnXKD46IYkS4QWTqg/ndTQBm1zrv/cifnLJifGAjUhwIMQv?=
 =?us-ascii?Q?POucPvP3PR767XRHmTdwNR67OW0nLJPo4X6kpTiiUc5N+OquOJrRv/R5JW80?=
 =?us-ascii?Q?YbouVn5oIuvUuc1FRhDK13IqlHHkuS+7p7phTHdFYKNbe5BRfU+/N1qfpZOT?=
 =?us-ascii?Q?/70VHxbczDDcUYetVSHx/5SL0L2nJz3DxjD8v9GB2uzgCWolYWfLj9fzJQU2?=
 =?us-ascii?Q?/dRy0pZH/vl4sKpTNpIUSYljZzq622C7/0QrgvVfgu9Hi2LVqDo7cMCru6Zc?=
 =?us-ascii?Q?xiGXPUMhkCGc7NvF0YwHnCvl89iBNCCnP9UyhmL1hV98+8sXJ/QJZg36lsyS?=
 =?us-ascii?Q?lhIlQuXkTma0pdXSC3ttCVUbNyo=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:36:18.5944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a099397b-739b-431c-c733-08de53936d0b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_093627_922543_FBAC1A41 
X-CRM114-Status: GOOD (  13.57  )
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

The TI K3 J721S2, J784S4 and J742S2 SoCs have a HSM (High Security
Module) M4F core in the Wakeup Voltage Domain which could be used to run
secure services like Authentication. Add Device Tree Node definitions
for the HSM core in the respective SoC wakeup dtsi files.

The HSM node is reserved to be loaded and booted by the early-stage
bootloader. The firmware-name property is defined at the SoC level
since the HSM is not a general-purpose remote core and boards are
unlikely to use separate firmware. If needed in exceptional cases,
board-specific device trees can override this property.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
[Nishanth]:
 1. Use generic node name 'remoteproc'
 2. Use label 'hsm' instead of 'hsm_m4fss'
 3. Add a comment for separate SRAMs
 4. Update firmware-name property to match existing naming conventions
 5. Change status to 'reserved' and add a commment
 6. Re-order bootph-pre-ram property before vendor properties
 7. Update commit msg adding rationale for firmware-name in SoC.dtsi

Link to v2:
https://lore.kernel.org/all/20260106104755.948086-3-b-padhi@ti.com/

v2: Changelog:
1. None

Link to v1:
https://lore.kernel.org/all/20251231165102.950644-3-b-padhi@ti.com/

 .../arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 17 +++++++++++++++++
 .../arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi |  4 ++++
 .../ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi  | 17 +++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index fd01437726ab4..32ee8031cfcb6 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -766,4 +766,21 @@ mcu_watchdog1: watchdog@40610000 {
 		/* reserved for MCU_R5F0_1 */
 		status = "reserved";
 	};
+
+	hsm: remoteproc@43c00000 {
+		compatible = "ti,hsm-m4fss";
+		/* contiguous regions but instantiated separately in HW */
+		reg = <0x00 0x43c00000 0x00 0x20000>,
+		      <0x00 0x43c20000 0x00 0x10000>,
+		      <0x00 0x43c30000 0x00 0x10000>;
+		reg-names = "sram0_0", "sram0_1", "sram1";
+		resets = <&k3_reset 304 1>;
+		firmware-name = "j721s2-hsm-m4f-fw";
+		bootph-pre-ram;
+		ti,sci = <&sms>;
+		ti,sci-dev-id = <304>;
+		ti,sci-proc-ids = <0x80 0xff>;
+		/* reserved for early-stage bootloader */
+		status = "reserved";
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi
index 61db2348d6a47..2f40afcfa67c4 100644
--- a/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi
@@ -15,3 +15,7 @@ &mcu_r5fss0_core0 {
 &mcu_r5fss0_core1 {
 	firmware-name = "j742s2-mcu-r5f0_1-fw";
 };
+
+&hsm {
+	firmware-name = "j742s2-hsm-m4f-fw";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
index cc22bfb5f5996..df37902c963ff 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
@@ -762,4 +762,21 @@ mcu_watchdog1: watchdog@40610000 {
 		/* reserved for MCU_R5F0_1 */
 		status = "reserved";
 	};
+
+	hsm: remoteproc@43c00000 {
+		compatible = "ti,hsm-m4fss";
+		/* contiguous regions but instantiated separately in HW */
+		reg = <0x00 0x43c00000 0x00 0x20000>,
+		      <0x00 0x43c20000 0x00 0x10000>,
+		      <0x00 0x43c30000 0x00 0x10000>;
+		reg-names = "sram0_0", "sram0_1", "sram1";
+		resets = <&k3_reset 371 1>;
+		firmware-name = "j784s4-hsm-m4f-fw";
+		bootph-pre-ram;
+		ti,sci = <&sms>;
+		ti,sci-dev-id = <371>;
+		ti,sci-proc-ids = <0x80 0xff>;
+		/* reserved for early-stage bootloader */
+		status = "reserved";
+	};
 };
-- 
2.34.1


