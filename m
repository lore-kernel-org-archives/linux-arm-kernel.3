Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA011C47BE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOTWzOEPN+t/2zxOIk0sv3NpOevMB8UlhxBsXb//fWA=; b=zwBeJ6pbVtBzu50yRI7Ne8E1G2
	jyrWd/2r+zOcMB6TIf7Nm2k9B66Q7ZIm2vrkS2Cq/xoQsO6M0Emvk9dyL3hXIwT3ZJ74DfyhWE+xj
	/7WxgaCYeAemM+KqB9A3S/bEjBW8PLOUqhMBLIq9uNuG+tvw6+JjJ13q+geekodyQCc/yQ+pCMQjz
	oSJFkMIrnwiaZmnNJKub+zlvrWyJQD5lIFIVIPYxc2j3LMeEhg28pJKB2+aL/IizsHF4tqNrpapUo
	c4InKIrCuW7aVM3mqF/z4NmOUzOjb1LuJ5MiGgcucEELEyCHGSLsHT+g+IOkDzw2B3PzQuAQXjLZQ
	LezWuBqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4c1-0000000Cp0Y-3OXz;
	Tue, 06 Jan 2026 10:48:29 +0000
Received: from mail-centralusazon11011026.outbound.protection.outlook.com ([52.101.62.26] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4bw-0000000CoyS-3kF6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:48:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDWOyyOE9ajH3ON/b1e8tCQS8azzhSxLx+l0pKCgp0TTQphzS9+H6HzgjQLf6Ht7gvZketrowGHgf5a+IIVu2zQ55aon+MP8Lsz4hWkG9WvQOfoBnMMaMZuXvyPteTdqCvciiUCusxsY5vT8sSUZfl/hH9u96Bpu22P0zxGP0VN/+k0xSwy8Z1tEkQ4eSKP9vdMhffBRk9byeJRery81UsAjzVBqXWU9zTiE9Y/OVOqW7Nazl6uwBywdXLthcXkQjbCWl0KHKlRdllhcwL41B07/sAoFwvGoluycusxye+b448rMEYrBoHstD72aktVYWjQiV2AW6YyE9uN2t1xHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOTWzOEPN+t/2zxOIk0sv3NpOevMB8UlhxBsXb//fWA=;
 b=U9A9ciHwnOll5cnYVAVJUmL7qNyIW8khnVxEtdvwhDJFcyaedGJ7eurVl6NhT/4Q4+yRGllegPo/KJ0P8HAW+FdsyMX427nGnwQ+W/YmHNM9OexBsXAZB4zsy7wKYsR4ZAXSazoYuOyLaGF7bbV2bakGbGr5lLvLLd0os3jl2fWEHxN6CdL+IBsBohvkadLvjrNSjdQz6dZAfrlrLLMW+OhLdEk0s0JtjONessqwckrpZKyjigSXx76RAvX8mtNk5OCG+7E9166RAk8sonUvHibrpfLzLP1tgdVTuGutSpJ/CyXgHAm3PjEOrfcpYrGnythuFl6AfTV9OF9Q+2BGww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOTWzOEPN+t/2zxOIk0sv3NpOevMB8UlhxBsXb//fWA=;
 b=llDa92yCzEE2aygE1tYAIeqetjeiCYqdQ/tik3mjpUpOuHRXulIV7dKoyJML13ySK7ZLeFcCb3k4lqekTMvPhpyzg1oCyktCyX8x8DkmrgN1c4RUztRyDeH4yTIk2ehQjn873OOrRw5kHzuhu91lcakXkuuSkRnlCqcu48ha7LU=
Received: from CH2PR10CA0025.namprd10.prod.outlook.com (2603:10b6:610:4c::35)
 by IA3PR10MB8188.namprd10.prod.outlook.com (2603:10b6:208:502::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 10:48:19 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::e2) by CH2PR10CA0025.outlook.office365.com
 (2603:10b6:610:4c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 10:48:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 10:48:19 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 04:48:09 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 04:48:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 04:48:09 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606Aluwa2890257;
	Tue, 6 Jan 2026 04:48:05 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
Date: Tue, 6 Jan 2026 16:17:54 +0530
Message-ID: <20260106104755.948086-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106104755.948086-1-b-padhi@ti.com>
References: <20260106104755.948086-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|IA3PR10MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: d96ef016-47d7-43c0-90f8-08de4d111adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ljJ+yzWk+YDyxDBAU96Zx7EM/vxYjkHUTgBq7zYjeVasgM5sppxxsok/86H?=
 =?us-ascii?Q?ha29HfB8l0auAVJ0wAbZFr1oid03Uc1I5CnT/DA6ceVA1qVH7vOtS+4+DjlM?=
 =?us-ascii?Q?uozPAd7tEARbs8eWeSxxCM3RL+fxwU5lnZSLOsuP49Db2u/CkXiCKp+ieXm8?=
 =?us-ascii?Q?L6sk4z0eo0zb8r8dJ2iHAUsL9TEYclGZg9KUCMB7+WZMw3wCPRzK7viwSsXk?=
 =?us-ascii?Q?n4hpYV83uCQlX/eVz5f3efSYhZaO7XbFnXJcY7B4xMwBo04QB/5ruEtp6VkR?=
 =?us-ascii?Q?nUdNkzP7sWgMB+zSk9G931tMiZXWd/HT1ZxyznRG97WwYMiW4tcH/J5kTneD?=
 =?us-ascii?Q?oFwELVgfOF2z6/YH9hfsb2Ein8RzvSkiJnjjdSeWWGigxqI3dPjY3YzAhLTU?=
 =?us-ascii?Q?miJMx0M8/NU5e3dTJIkir7HQUHJSf6Ma/cCRKTVOl5PJEg21QH/YAtVeBI+A?=
 =?us-ascii?Q?Z3Y0lyV+ZE0++EqkhmtB1VWCNZ1aNs2qmzDuGjHpux0f2DMnaCz3Jg43vuN9?=
 =?us-ascii?Q?F7HTXziUgZv8A6hsbpU3B4Jwrr7mmDwNScPlk3IK1Iw4Qwm/seP7trVsMtnZ?=
 =?us-ascii?Q?X3RMBMWTzP+vyHh+bCOu7J+/hEqy00KUABxI1vBOqsaukpVOws6ez9rIXsEs?=
 =?us-ascii?Q?Syy4bKlP9SU+PeVjiivgLflpwcvGyDF8lsA0E5WeuSB3qV1iAcZijc8L+kB6?=
 =?us-ascii?Q?hFqCjTd8Qnf4KhBW4ny/9jr53YBWOYufGtUjIn5fHSbJGIdvFZzj0u2sBnYI?=
 =?us-ascii?Q?MSnH2mFZjMDRuXe0BVK7vk5KPUicRb8JAIsR4QrCPWlhuXSIqsgeA4kFVbcn?=
 =?us-ascii?Q?+pYqjXcDHUSF6MYdgQPfGgt5X6pqhYxJ8MwCqFjKRs/n+Jsmeb2n1BZPfLro?=
 =?us-ascii?Q?6z/mf/hil01LJlHcjK7yaLDwGxgi9XSCDUdtJJg2kneRW1hH5E5ii4Ph3c0w?=
 =?us-ascii?Q?UTSPKXNZSrbtzdsr0Zu3RIxfURk3BiTa2y36pjVFYlNW+UP00mh5yBE6MLFo?=
 =?us-ascii?Q?uMzAc5ebraUU/kkJufg0twi5ukz6UypVBaII/izO1rkCJzGG44nRkEIo3ARs?=
 =?us-ascii?Q?9bJscL8cdywVERa0W5vvMYs4X776b77rrH6/hjtbZ41gW8qlMzMZ3j4/A/VY?=
 =?us-ascii?Q?7eix8FKAOxNzptMX9A7bgJN8s6lKW361+8H2GIhY+VhaBWMpKH1oLjeidC+4?=
 =?us-ascii?Q?GR2Ep1OkpIiAa2xJQYMr0ck6QdoY5NLBoDERlfNAqK8Aqk7u+Jb4Cgmiskzj?=
 =?us-ascii?Q?9RY3pzhDayWfAuhDoW0TicfC2TS/ogfUC+fXjxD3bbcddO2Gjy/d3KRugZF+?=
 =?us-ascii?Q?XEQ+yR7OLlPqoc0Cuk9TS5WOBBJ5QQunwue//rpGyYGV/+GfWasFgmDUIq5H?=
 =?us-ascii?Q?ktyHPn1tU/XHDlbr5D6yxBul9whJuYGfV6OsJ+/FOdYb56k7sb700xRT6RnO?=
 =?us-ascii?Q?7pL297nU4vFD36Gg/v5faOGybbbdpb2ETPjQmG7M4z2AuM44VyzPWUW2CWK2?=
 =?us-ascii?Q?Dc+Fan1G9qS2RLw2OWNF6whIJvOCJxzCkI7gzdlqt7b1BWYKUmLAiT31V+92?=
 =?us-ascii?Q?yZ70v8jrFl7tqYAzrbY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 10:48:19.3205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d96ef016-47d7-43c0-90f8-08de4d111adf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_024824_932442_48791C75 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None

Link to v1:
https://lore.kernel.org/all/20251231165102.950644-3-b-padhi@ti.com/

 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi  | 15 +++++++++++++++
 .../ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi    | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index fd01437726ab4..c3d78d4a838a1 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -766,4 +766,19 @@ mcu_watchdog1: watchdog@40610000 {
 		/* reserved for MCU_R5F0_1 */
 		status = "reserved";
 	};
+
+	hsm_m4fss: m4fss@43c00000 {
+		compatible = "ti,hsm-m4fss";
+		reg = <0x00 0x43c00000 0x00 0x20000>,
+		      <0x00 0x43c20000 0x00 0x10000>,
+		      <0x00 0x43c30000 0x00 0x10000>;
+		reg-names = "sram0_0", "sram0_1", "sram1";
+		resets = <&k3_reset 304 1>;
+		firmware-name = "hsm.bin";
+		ti,sci = <&sms>;
+		ti,sci-dev-id = <304>;
+		ti,sci-proc-ids = <0x80 0xff>;
+		status = "disabled";
+		bootph-pre-ram;
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
index cc22bfb5f5996..42565f41b7bac 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
@@ -762,4 +762,19 @@ mcu_watchdog1: watchdog@40610000 {
 		/* reserved for MCU_R5F0_1 */
 		status = "reserved";
 	};
+
+	hsm_m4fss: m4fss@43c00000 {
+		compatible = "ti,hsm-m4fss";
+		reg = <0x00 0x43c00000 0x00 0x20000>,
+		      <0x00 0x43c20000 0x00 0x10000>,
+		      <0x00 0x43c30000 0x00 0x10000>;
+		reg-names = "sram0_0", "sram0_1", "sram1";
+		resets = <&k3_reset 371 1>;
+		firmware-name = "hsm.bin";
+		ti,sci = <&sms>;
+		ti,sci-dev-id = <371>;
+		ti,sci-proc-ids = <0x80 0xff>;
+		status = "disabled";
+		bootph-pre-ram;
+	};
 };
-- 
2.34.1


