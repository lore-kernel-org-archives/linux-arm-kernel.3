Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E307D38FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+DBbvvsjSacZfh+vdqxQk3ZYT1PpuyeaAD7nC6BeRs=; b=4yWLh+pofX0PynmeJLW5zlGMI4
	HrtnSCNBfY3OItdIpifvGHwIPOxg7R29CU7aR03K/q0PMBx3INczYHOkll411CEoGw7sEGVHYMR45
	BpT23zmp7tSK5aWjkRBeuRjNvSUb3ubCpMwCa2eep8zPXirC/pjbZ6zzRFhWpKrxMCmG6TuWmv9x1
	UPMITsUtcYO/X56Oz9wxNse/N2I49JaeXbGb9x3JaAemR2RyBywR3+U7HuL7ZWwHCoS1YGirMG2gu
	lAfRLu1koDGOiU3DOv9F9G8V4ecdQpS1RiNT+E4Z+G/RCLLAloPIo/Az9WHYmvCXTjzSXBv0/jaFO
	Mc0F0QEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4nJ-0000000A9mw-40AV;
	Wed, 14 Jan 2026 17:36:33 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4nD-0000000A9jU-3W2A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sB5u0lW/J4engVAPbDaVHWlLNAwrbDkZfRFXlXlNOWsmGO79+I7yNZPiygI3G7ZAV3Eq5+8vMG33GZqqzbj3wwpMLc1E7apM+vJjP0sQgvukweLRdmOvPghFOJ1zUpGKQxEMRZS7FJTgzHPoDJBUG8rNqCajHqaprI9cN0wfFvssaK7HuzcWmuMYxZHcCQMpn+dYP9H0QXiVKYPzVH6Ueb1wi5TwD/u8iPsweagt6Hx8nBQ0jomSntmw7SYS32fC3IzBL0OzKzYkM8rV6zErKj22oylijlr5ftFvW7da+GHbOd2EOcXUQpdKUZNc67cLg1MhoZNRm8Gtta7BtFa3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+DBbvvsjSacZfh+vdqxQk3ZYT1PpuyeaAD7nC6BeRs=;
 b=vWhAcF3vFYJgFVg7RPQw9DGyLSfge1rDjhyY4JvzB1NBmT6A81QlgjnSfhwQASDSSf17t3WrNEj72PRr0zOwSuD0ENvxr7JJeehF4Ojhjbf6dE8j7atD4tAMXZ7IiLeXgHivotV622q2frVVxZWPePPDKy9BhugnKFsyl8OtTA/JB2deO3f0LwKCxyogLzO71nvSlclcqTECtLeYFC3VrKpbI2AJCdxIdKaz4XrFnYeO6RI+n44f3wkIxORrBPgIXO5c//C+WDMy6E2mw3M7mtD8SlqClRc/AGuECsXtAOnE9BXUplYGenrhfc08GwGOdIZdwBLIVsyC2b1/Hh7kEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+DBbvvsjSacZfh+vdqxQk3ZYT1PpuyeaAD7nC6BeRs=;
 b=HN7eehvbNwnD+2nU8OhhjeDpGhdr/hwoZpeVetRVKtOwJLyDwriBKNIbQhb6BJMN38AeKQD4OK3YJyZevxUZHURSei/NGRfs42n6se5XWsLtC7D8zgXiKquIUbcc03+fHJuwcm6e8isN76DU483yoNlqVSrhLTEZXPLo08dWlCs=
Received: from MN0PR05CA0004.namprd05.prod.outlook.com (2603:10b6:208:52c::10)
 by BN0PR10MB5205.namprd10.prod.outlook.com (2603:10b6:408:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Wed, 14 Jan
 2026 17:36:26 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::39) by MN0PR05CA0004.outlook.office365.com
 (2603:10b6:208:52c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 17:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 17:36:25 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:36:05 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:36:04 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 11:36:04 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60EHZpkO040370;
	Wed, 14 Jan 2026 11:36:01 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-am62p-j722s-common-main: Add HSM M4F node
Date: Wed, 14 Jan 2026 23:05:51 +0530
Message-ID: <20260114173551.2545088-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114173551.2545088-1-b-padhi@ti.com>
References: <20260114173551.2545088-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|BN0PR10MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fac0e3-aefe-4a16-db42-08de539370f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|34020700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p8p6UXAE3wU9+iKgTSQpufESnq8ljqHdbtkd6ulC1lzR51W4T8MmOjJID1rA?=
 =?us-ascii?Q?YQRTrTqeczrc+pytOF8xME/KBmm8HlgaPQILdeULvTEAWiEiHTGhRAHV99ht?=
 =?us-ascii?Q?9ou9Y302FWNyy4JT+1AM8HofwD2F3tZJNK7cDGVvyT9VA0AHVG+tbxhcMgyz?=
 =?us-ascii?Q?JXqfAN9PXEWV0p0s/kBdyZUL+xgpTWL1ipS2gpQqDplckvYZ1lhuh9D+CbRm?=
 =?us-ascii?Q?uhhuMXlMabLjmCTq46wYZ24ogF9SAZTmpiYcWWJntdLQImW0ZI6cNuX+yYNw?=
 =?us-ascii?Q?Lzk19u4kTuaQ1KxYUTuZgBI9OwyBf5fbZpvjXy7HX0g8pLuqOR+o4fuVsHL7?=
 =?us-ascii?Q?3gEthwm6ziNXA0eGQnQAi+DjzeSWNQbMNh6VJH7t8KFiMBJo4y7tRvBVYaiE?=
 =?us-ascii?Q?Mrz5FSbWC9sLvuFPHF4a9PzEEFdjXqDQLDFRaIhbHHbzlvohzzUrDXfuZJKw?=
 =?us-ascii?Q?phRjXPSmTo9YC/ivK3geVfjfjJ7QsiGZ6MFxCAcdy+nrbHVuDrom1VinaPKG?=
 =?us-ascii?Q?gyw5nx6iNE3jNnILweFrF+hhD6FFEHUdMQi6sPXgJxzuvO7aO7A5LF4TYRtJ?=
 =?us-ascii?Q?sQxdEVwUJl+DecW2aEwsNA7qlm+U8GzjVrZRreh2Vc5H1sh7UALnmUu06vl/?=
 =?us-ascii?Q?ST2c93/dcTCUIHbA0VsZKYNmKHgi6iB5PsUXpZelJWj/k2jB9tT+eFUM1NMK?=
 =?us-ascii?Q?ClVYeHpM0x4KBNjT28sWn4ICOq8RlAzFYxqLhYVLBGxed70L6SbOV/TvesUr?=
 =?us-ascii?Q?qWQyn23NCTgC3XlxEuX0spkNIj4HkIm2TQVx9w05zFrhBaiUy6VP/4QVCQzY?=
 =?us-ascii?Q?3l5sxLxKpmTX+adJVy9+MhZ0/6Z5wYfZik26lRj97phIZCINlXHWmTxlqSMJ?=
 =?us-ascii?Q?IENvA0nnSb4jdAcXh1YdvQXjHvExz8P3H8ADo7AU+hw1QN3OvDmCoCRnt7T1?=
 =?us-ascii?Q?vnV8Oz0zUm2iEY1rrqIKVR8wbxA0+m9tbpDRzU8P17eV+nHJ+Tn1kUp1OaI8?=
 =?us-ascii?Q?iB9tX2BpHFDzwcPah6X44Ry9csm+l/p283mh3snx0DFMQelyE9a6WIaRFzZ+?=
 =?us-ascii?Q?ZLCFmqvQNwfnYyLVvEwo3Rcpjp6abHR7DJLucPzNbMN1VMN0/PO8L2dARdnG?=
 =?us-ascii?Q?dLS7auBnT6pUS4YsOem4mMKf6R73UzBUXqO5UyEMn1fr27CTcyP+ZM4yJK1h?=
 =?us-ascii?Q?Foi3OLsu2CP0wfOyW66azFEAN8CeOO4D5+nZNdoJhMOL2EOuPYbnCXx2tB5K?=
 =?us-ascii?Q?LcZQ2Yvp+bykzImukadsljWE5cQSX2G3mJ4PoS0OshnRc1IulHznfdExJe21?=
 =?us-ascii?Q?KYHLOd1u40j5+Pq5DCJlimzOvdESuGftL+ZW577CGcs8zNkmXZ1wiv99q9k6?=
 =?us-ascii?Q?yn9hmAJfXIndQ7bRD0Ug6LkWZJRERZhCXIAWcYHmObw6VOsdwOmimIbKj+eL?=
 =?us-ascii?Q?uyq9UmQlvIItUM4z6MNuU8Oxhcy1Mfw0Lca3E/uKLndj0BiYyQZDLtBNGVdW?=
 =?us-ascii?Q?KTlQp99MteUf6DSFowu1szNIzWtC1PZJJTfSVo7GychPEVVRrvsH7ZxoASwj?=
 =?us-ascii?Q?bFwgvQryF9KGWP4tfQ9d7mjvCHCtHZiLET3cYW8Q/d/Jhg3MA1A8VTDVryF5?=
 =?us-ascii?Q?Y32EtqGW1z8iwXQSUs+64nhrTp2BFueH3x7OzsuZwg2y01+VnKw0V2vIYazK?=
 =?us-ascii?Q?pbcw+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:36:25.2245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fac0e3-aefe-4a16-db42-08de539370f2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_093627_884872_C8EB2FDD 
X-CRM114-Status: GOOD (  14.61  )
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

The TI K3 AM62P and J722S SoCs have a HSM (High Security Module) M4F
core in the MAIN Voltage Domain which could be used to run secure
services like Authentication. Add Device Tree Node definitions for the
HSM core in the respective SoC common main dtsi file.

The HSM node is reserved to be loaded and booted by the early-stage
bootloader. The firmware-name property is defined at the SoC level
since the HSM is not a general-purpose remote core and boards are
unlikely to use separate firmware. If needed in exceptional cases,
board-specific device trees can override this property.

The corresponding reg ranges of HSM node has also been added to its
parent node's (cbass_main bus) ranges property.

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
https://lore.kernel.org/all/20260106104755.948086-4-b-padhi@ti.com/

v2: Changelog:
1. None

Link to v1:
https://lore.kernel.org/all/20251231165102.950644-4-b-padhi@ti.com/

 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi            |  1 +
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi       |  5 +++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi            |  1 +
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 3cf7c2b3ce2dd..0e1af2a69ca2e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1117,4 +1117,21 @@ vpu: video-codec@30210000 {
 		clocks = <&k3_clks 204 2>;
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
 	};
+
+	hsm: remoteproc@43c00000 {
+		compatible = "ti,hsm-m4fss";
+		/* contiguous regions but instantiated separately in HW */
+		reg = <0x00 0x43c00000 0x00 0x20000>,
+		      <0x00 0x43c20000 0x00 0x10000>,
+		      <0x00 0x43c30000 0x00 0x10000>;
+		reg-names = "sram0_0", "sram0_1", "sram1";
+		resets = <&k3_reset 225 1>;
+		firmware-name = "am62p-hsm-m4f-fw";
+		bootph-pre-ram;
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <225>;
+		ti,sci-proc-ids = <0x80 0xff>;
+		/* reserved for early-stage bootloader */
+		status = "reserved";
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index e2c01328eb298..9d6266d6ddb82 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -96,6 +96,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* USB1 DWC3 Core window */
 			 <0x00 0x40900000 0x00 0x40900000 0x00 0x00030000>, /* SA3UL */
 			 <0x00 0x43600000 0x00 0x43600000 0x00 0x00010000>, /* SA3 sproxy data */
+			 <0x00 0x43c00000 0x00 0x43c00000 0x00 0x00040000>, /* HSM SRAM ranges */
 			 <0x00 0x44043000 0x00 0x44043000 0x00 0x00000fe0>, /* TI SCI DEBUG */
 			 <0x00 0x44860000 0x00 0x44860000 0x00 0x00040000>, /* SA3 sproxy config */
 			 <0x00 0x48000000 0x00 0x48000000 0x00 0x06408000>, /* DMSS */
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 873415ec4fa37..9ee5d0c8ffd1e 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -429,6 +429,11 @@ &wkup_r5fss0_core0 {
 	firmware-name = "j722s-wkup-r5f0_0-fw";
 };
 
+/* MAIN domain overrides */
+&hsm {
+	firmware-name = "j722s-hsm-m4f-fw";
+};
+
 &main_conf {
 	serdes_ln_ctrl: mux-controller@4080 {
 		compatible = "reg-mux";
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index c8b634c346779..059c65ece183f 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -173,6 +173,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x31200000 0x00 0x31200000 0x00 0x00040000>, /* USB1 DWC3 Core window */
 			 <0x00 0x40900000 0x00 0x40900000 0x00 0x00030000>, /* SA3UL */
 			 <0x00 0x43600000 0x00 0x43600000 0x00 0x00010000>, /* SA3 sproxy data */
+			 <0x00 0x43c00000 0x00 0x43c00000 0x00 0x00040000>, /* HSM SRAM ranges */
 			 <0x00 0x44043000 0x00 0x44043000 0x00 0x00000fe0>, /* TI SCI DEBUG */
 			 <0x00 0x44860000 0x00 0x44860000 0x00 0x00040000>, /* SA3 sproxy config */
 			 <0x00 0x48000000 0x00 0x48000000 0x00 0x06408000>, /* DMSS */
-- 
2.34.1


