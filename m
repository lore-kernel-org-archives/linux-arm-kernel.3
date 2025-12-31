Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7657EE645A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 16:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54h9KV4dyF94SXKay9EvKZUbLAF+U4sCwifUWv6Sfpo=; b=E5u3ZA/9MXIa7xuy4R6n/HQ0Wf
	GZD7OIViyvK4vPDuL3T6rno7Dm8kh3qoASGfMeyhOj+M0ZFfyjdDZdoC8hBvCpc7coDLoKQH0Lho+
	iMLKRqOcYFy2u1YtdoQBh6JlXL5+OWoV1hdvtfeoRE+6TPAiu4v+Hvf1D9g/oN58YkdLedMRDDWMs
	FcoTeIDejDH+U8xLm9L6MmaoMevPZZzpvtj6CjqRWwSatkIQxv/MgyykM6CjfParobrpVD9evs5nY
	10vzfmSQyNpij0t34qC8h+4ubXPo7+Hu4d/SB1pCS3D3Xxn85v4SDDheDHPny4c0nh9HA+onLeBSx
	6/OfNEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vazQ5-000000069zN-2fBf;
	Wed, 31 Dec 2025 16:51:33 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vazQ0-000000069xe-3Qsq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 16:51:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfLMADrIu1bLuaL670D7Ara9glKEHI9r7UmyKu2CeVeWI9isyPsbHD4Qq4ZhZsxGBoM1wP09HYBwwpfQOch+SBpgsWtTYGyX2mE7LPNW7198VeXvW0FiO1YiPlv+JCrV74a7HoYu3BSAwo8IjG2HCWfPwGJ25WTM5qCHwtWqkKM9IPcV97vNnmJvi7AFr0RNLIm8AFCXZB7fVuv5b07XlL96U0Z99j+maiRnYjNO4FajP4VDz04X03U164vLKinS+JEpP+K/1f98CJWZEIjVstfs8jMBJfv5bOH7PANF8PACWu0wFW4JpRgfQERT+bhDqFhxha1OuJv8PEr8evE0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54h9KV4dyF94SXKay9EvKZUbLAF+U4sCwifUWv6Sfpo=;
 b=miWORT+ICmMOe+yvf676YeIRlbHx2r78Sa4eMMGe9fpG42bixjUP3IBdowYzthwCrc3soGQdPqcRlz4bySxnk3asGQuoWmPdGHBaQZ5nHuH+EYcdv3xCKeJoLIpT2DEK5PiAzFm4bNfo+43/yRBRynAF7RY7D9HVYg4K9M1wluyRqJ9NlHBARXoThXQ4M/AEtkeSv68RM0AjydoGnS5D4qhR5yKd2+RLZGSYH0yWuZ7if1vH66/u58x2ggfX4nGtJOy/KDxyVDV1HKfaKWNXxqdQ9HcSXm4BLAktWeIhXfivd2fd0t1nw7wpPXvbGMQ3JYXAcB0TLN0jB+87O7dlHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54h9KV4dyF94SXKay9EvKZUbLAF+U4sCwifUWv6Sfpo=;
 b=hgYaxN5ZCo1sxIZrF+FKZvMeYfOX4bqUT1M6aIhldIZJwlpiPnbETr0uzq73HOQNO8p3W80ncsxEYI90XP2MX4rfrA1evv2bdXf+GDdItyqXuPk23CAMOLQMEfOXnvr5rIi84xb0N/+2668nGbqB0pFcETtrJz39OgPMS/jykwA=
Received: from CH2PR17CA0005.namprd17.prod.outlook.com (2603:10b6:610:53::15)
 by DM4PR10MB6110.namprd10.prod.outlook.com (2603:10b6:8:8b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 16:51:22 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::db) by CH2PR17CA0005.outlook.office365.com
 (2603:10b6:610:53::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 16:51:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 16:51:21 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 10:51:17 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 10:51:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 31 Dec 2025 10:51:16 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BVGp3Zl2583331;
	Wed, 31 Dec 2025 10:51:12 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/3] arm64: dts: ti: k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
Date: Wed, 31 Dec 2025 22:21:01 +0530
Message-ID: <20251231165102.950644-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231165102.950644-1-b-padhi@ti.com>
References: <20251231165102.950644-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|DM4PR10MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8dbdcb-2a49-4be5-edd5-08de488cd355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bPaJyL9FLfj1WpMPX4M1dvTAtwMZGwvMq8NgTNMfrb5B+G7NV/NPoYJa9y7Y?=
 =?us-ascii?Q?qjzTN/IrJEif9UT7ZbfVx2Jq4WME1QeMls88Fzp1btFMALN4Eue7dBdf1FU4?=
 =?us-ascii?Q?7wwYwUlJvm52afMWTkbBBprEGFACby76Uc6NFgc7Q+YEtDUEdh5oZfQ6+cnm?=
 =?us-ascii?Q?KDmJPigNl2bHB4EQciZNQA/JYkDSSvV1D75ACjcCd7S5xK4OIXhi5VPQBAwn?=
 =?us-ascii?Q?7BdLC9tp7pCeWgqUpBAIe+PAcHjOnKykK3kDmTjhvOJ4aKZYEqYQquBI0/LT?=
 =?us-ascii?Q?sPdBHjKC1PcGBqrrDX7tXX8d7rvquJLO+pYZRvBtQvn59sExxoXBOgnYQN3z?=
 =?us-ascii?Q?ki+CNLvmmlzUKYp50cWl3Fe1G7So56CKAYvOPqOPAwHxQfzD6b2/IEUm5KXB?=
 =?us-ascii?Q?KF1JimC//OoxtHy/bChOjeR4/oduZH76mb2V1Yf/n69EOotC4IeGOd2c358P?=
 =?us-ascii?Q?2W/9g4uaZRt2ZGQ022wlfOwm4D1WeWpZMFwIMNOuq1iBJs5N0+kE8Dr/Rvuj?=
 =?us-ascii?Q?SDOkQvyN0g5BH1GG6bwz7bjYESKvVDVsG/7d1601zVHGheJ/Fd2YBN71a8gX?=
 =?us-ascii?Q?JQLc8Xa4s6xtH5KJw9JuI7C1znkL4Imv3liFb6HGWUmaUYIUp1C2QpLMkj69?=
 =?us-ascii?Q?Eiq4Vmjt0XYTITFc56N+mzDAKu/joI6pgmonuC9YzTyVwkj44bm8E/x3bIci?=
 =?us-ascii?Q?rgxa/I6MHOqbvGianOR68rTDYnQ+/ozdGdFVuwl8fXDQMsq4dEFuWEwHm1S3?=
 =?us-ascii?Q?YTfJSXkdlMo8a8dd8CGHLPbZCZAKogS9kvNaTvBsW6JAZqF348N4cjQoffqI?=
 =?us-ascii?Q?x8n9UvUtIFTnBUWByZFKVaXJM47gTo5fAO9pXh6yFB5op2fxoh1TSl8Tn2Ao?=
 =?us-ascii?Q?Q8fuW2wZE2LUfYzHCN1dndjIrKB0bTCHiIqDK3Ga+jSZxYOhDruyKwg2xJZI?=
 =?us-ascii?Q?AGlet/BlnH4B4RMWILNCaGGBa6WFUa6GEM0LpYU6AP63Z8EGUY5MRaPafuNn?=
 =?us-ascii?Q?HKBTQyodyx2Dar/PmlVMJHnm8No795ziCLNvYhDnn2TcTeO3KH6l+Nj5z4fZ?=
 =?us-ascii?Q?3ZTEowbMw0NchKBORcCFFR7mACs1FYfea7Dy8tJ++KT7yBx6wTUN8hPSlcRF?=
 =?us-ascii?Q?HyYRnkVgokCE7V9LKaBVIsvlh2J20YHOzqUymL9jUyC5WrDhMG0pWVE7xIca?=
 =?us-ascii?Q?KEkAzdBF05I4p0wxhWnwKui4pNPbFNqBr8eIqc2XCCcrNjDfbh3iR1HqwfQ0?=
 =?us-ascii?Q?6c+yMn/SuALsPqoRI8NOmXay7CZto33yhUkUEEqayBFYxBu99xGSb61qWXl4?=
 =?us-ascii?Q?CHbeXPvn80nMadWvWixVZoeXIxyuv0Z6+S9A4Cz/x8bFKRgiP2gmYfmSYsP0?=
 =?us-ascii?Q?kU/ZIA3N2w4/KpE1bIN3+rbcBCF59FA9xW4w3FmPvjcj6897Yfd32akii+d6?=
 =?us-ascii?Q?NMUJphKmhm/YxgroOZ8XNaebuRFRv1N8G6WBtwK86UqXdGeFZaKYIw+RUPl5?=
 =?us-ascii?Q?NEzeM/MmYT1eKj5aTPse9oQ8W85798qUcRaRASSN3E7tfMVARbxXYpLcTpFX?=
 =?us-ascii?Q?t904FEhq7+fkkrxMa3k=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 16:51:21.0714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8dbdcb-2a49-4be5-edd5-08de488cd355
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_085128_858316_B48281CF 
X-CRM114-Status: UNSURE (   9.34  )
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
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi  | 15 +++++++++++++++
 .../ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi    | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index 2a7f9c519735a..712c3bcbb6f84 100644
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


