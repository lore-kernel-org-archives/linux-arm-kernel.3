Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AD5E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJWmuXlWZoDFIVA6RqJ0g4hT8uIa09kZPqIh8U19ZTo=; b=IVhCUGOKyco1M2snh3usIAVkIJ
	Mno7nOuYLH56xTniSKU62m128NtlWG8s0j7ookmZRzcmfBnMWPsfnlHCTT5V3z5Yf34nibo2GDtRk
	NEN2zkypcplrgOPKk7bFBNg9QTOqcvBeVgxvYHQDsQ45JnCMRn8kEo9RWZgumoAcwgMHnHLEg9340
	yYGf/vGIfe0yX8+VdWHkMo1Y5Ts2nBckc/HYraYkp8HAFgrzY/Y86Mp6W1SERXHxoavFLEwINbFH2
	2C6tHru4GTa+uwKQh88WLaVKf+lSYF9Qz1zuioSD9OQCX/kvo5U2wU/J+paIeZY37qWITED58Yr1r
	A4UdFlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMBc-0000000Et3c-0OxY;
	Wed, 11 Dec 2024 12:51:28 +0000
Received: from mail-bn7nam10on20625.outbound.protection.outlook.com ([2a01:111:f403:2009::625] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLM2k-0000000Eqre-09Ed
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlxXXdYhmqISy4/V9a8eT4ku5+Jm7Nn9x8zkgbSbWkFHBMN+JlMdRK3Pm9HOtKjlBGt0RwLe9Z9MwpKlTWKqCQzTipoCR/N4BP+eIjIO1R54VJ6AiUYLgjlpeE/8/tSbstgf2AIit9JMbCOsQ9x1NsH4C1s4jgzulfN/4G4T6jioBPJf1dxkLWV5wKKHf15vQAY5EyLJqXz1FfsCDhuuFy9Or/Vitf0Ip9LKLiZVGJhhMOYUpyryYjGZwS89RP2a6xELYQJ3fUKIh3Qd1+Bo/+/0CdqlXYSd8iGSU5GqHEGec+2YR+tLzeWxJaIG73cKrc9oIhpRnwPyuc8lZa4kWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJWmuXlWZoDFIVA6RqJ0g4hT8uIa09kZPqIh8U19ZTo=;
 b=dYU7Qn6ALhZHW1UhztMJCEF9ToB/leErxMCkvPg2mhw/uyki5aJ/yBERFkKDc8EnqbvFJXZ9KsjjVKhWXDuuxGw+/EEsWT5H/ZX+8oDd6l3VnX7GHG22Q9RqKJIggkYgbddU9K39eDjdAl1t73GorExBYQ4Gn1lW9yfd0QKHtvqZnOyo6rnuxMqnu6UIPspGE3741HPS1R3PfRdzEY8Ggl5hxPYiscsLHO28RgvJNCF9pn0yNniv3A7gWcWj/T6bcpZXzHkyELpdVCfdII5Fu99OjXN6wmJiDvNcgMCGYvB4iw9q5deKEbrfNzUzHT5USTZH2TI9Q8Pbv8mmtow6lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJWmuXlWZoDFIVA6RqJ0g4hT8uIa09kZPqIh8U19ZTo=;
 b=edpe/ST4WHOGGlFgbq1hK7/BaCxR9bYTxmCMeAaO2vkGoU8TJZRv6GqmpRE07tsowYT9kRuZjWklZEVAccqLykl55qCV/2cG1EtRKgaOCJ1Gkz6VyGeRw7R3Qv7ndsFklojLomxCDB8GNxLERMTzHd9zp+oSS0FTRm9R91EXVws=
Received: from BN0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:408:e6::24)
 by BL3PR12MB6426.namprd12.prod.outlook.com (2603:10b6:208:3b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Wed, 11 Dec
 2024 12:42:12 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::b8) by BN0PR03CA0019.outlook.office365.com
 (2603:10b6:408:e6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.22 via Frontend Transport; Wed,
 11 Dec 2024 12:42:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 11 Dec 2024 12:42:12 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Dec
 2024 06:42:08 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 08/15] ARM: zynq: Define u-boot bootscrip addr via DT
Date: Wed, 11 Dec 2024 13:41:27 +0100
Message-ID: <9252bb464c5c82fda6018ea450c6f453a5d8412c.1733920873.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733920873.git.michal.simek@amd.com>
References: <cover.1733920873.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=michal.simek@amd.com; h=from:subject:message-id; bh=4/vrP59J09kHMXgyv2HJjVBHZRWZSQKTYNEFdQ/kCV0=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvTIjpqgJYYuk5T6JvOd3LVB2deb3feqU/gKJ4UdU9YK/ z9y7qFoRywLgyATg6yYIou0zZUzeytnTBG+eFgOZg4rE8gQBi5OAZhISyvD/KjcKKVbVw7bHz9u 7HbOZv4f8x8WcxnmWUvoGrPcSNtUtdDu18fJSXWrY4SyAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|BL3PR12MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: c37eb3b4-a684-4b72-be47-08dd19e13c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pfAvdjLmD/lGrsHuAkxYGlXb1vTh2TfwANbPyF0a/PFwFP+j1vtbiNtncj2z?=
 =?us-ascii?Q?16RdZ0/z5so8kp9v4+YrtDRNeG4ezaQ+7L18QSmn7hw15Ix+2V3QiY+20DB3?=
 =?us-ascii?Q?usAqVCREANzHKqn6k1uK/9LDrEooBxB90TwEghILTS0wA+W5RyX8r0nuE+Ej?=
 =?us-ascii?Q?jn/FmeFm1BkBVvhoRORTQOJUikDpsJwq57+2ZKEqc3h6y2J7QO5J0mu3BiJK?=
 =?us-ascii?Q?lblb9Op7tZvyyqDMDe7yB5iPdDJX75d8pYA8f0ge0Iqj9Fjf/XiewVuaToAP?=
 =?us-ascii?Q?Ceg2F7gfS1JY0aOBM0lKsRvi+b/fSN0WYVrKdHjjFI6bNC99H6yzwGhhoMdk?=
 =?us-ascii?Q?dwnuvlI/7GCF0bHCJmwV6lKgv1Y/a/KRYXPTjb4gVncinNDdNDlAEdS+FLbw?=
 =?us-ascii?Q?nQjm6wx5nw4dZTl4CoGc8xPbBks8bw/ZcI1sSfDMyQpKIg/g1CNFfalBd+Oc?=
 =?us-ascii?Q?RHCk2+2NinRozcAWTx+D4IzEMJ7MIBKgd3AfswOCWBYzRRZtNX/buuXsy+ZZ?=
 =?us-ascii?Q?XfFNM5S+qgSQcJfiwC+1Q9VJzX+8Bm6NySmwktBsqRJGxTrpmgaEHXce6n6+?=
 =?us-ascii?Q?jh2CeUnerJRPzD2T+VfpGT7sOxjq6mNXMQ2+mL/PI+R0DD1f0tyZ+5f75oy3?=
 =?us-ascii?Q?j64WYBCm9sRhH37ToIWgwsMSMShgiwbr3fSSAzimgWaS0gET5wa4HRCs6RD0?=
 =?us-ascii?Q?QjKcuIpumFC3MkEWCLbgdyPMcTlmthvPnuti7qGZLSdcs5fpD+zb/yu5aV3j?=
 =?us-ascii?Q?YXOw1rNGx1IjxIeLMowswcZ+abBsVJgFLxsG7Qeq5do/8F2Fe6E8tgIFzEnZ?=
 =?us-ascii?Q?/jch1Yjjrzv+2zugY0XHM41VtZ56ViKEtqFRmLJALwcSS5lW0jmzphfDpmzg?=
 =?us-ascii?Q?5t4cD521U8g+Ps3kXAL9JhX+DVqp66xv4hDk6+Y6u+7cn9+nD/RV8KEJiHOk?=
 =?us-ascii?Q?zhTSAKCCy1lu6mbz3rKNW+lTE/Z9vHllVhGRiNBSeFJ7mrBmnL2eZNI09J51?=
 =?us-ascii?Q?mP9zjRFCkmF3JfkoeBkNQZK28FAvy4AtHNT8JSS7+2IJ5AYse0JCqNVRTVLm?=
 =?us-ascii?Q?m8elPe2ymohMbKdq5J+rRtTFFuBtuV9iH+GjtWJlRrGbXbbglQE7rZqF5Amk?=
 =?us-ascii?Q?jRYUNz2Yy35xGz86lwM/WT72XSksoTOiP50lXRqiGa5msjv9qxugw5UTURDZ?=
 =?us-ascii?Q?Z+paZ1wQtX96brUMu6ehkU7lkeR16X+fRB91IHIfjlMjagaFUrZ/sMm6XSgf?=
 =?us-ascii?Q?HzwMMPiB4SYkeuVVszpRfPjxvWUvzuL5jzFJn6RDXbQygq0i6AWgV/Y3PaRH?=
 =?us-ascii?Q?42JH0Y82KN+f8IO+b65fQzaPcR716R48fIdadhE5TwH/0ySj251kEBoDSxF1?=
 =?us-ascii?Q?F3bri9mwRZpu6wLtn/uBREyMlnqa0kr1lpWvj3OV9cSSbDuHPzETshUBDsWz?=
 =?us-ascii?Q?h+P+EDMSFOIJNL8v/aanS7xX+DXt0WlU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 12:42:12.3558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c37eb3b4-a684-4b72-be47-08dd19e13c29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_044218_072132_79200A13 
X-CRM114-Status: GOOD (  11.02  )
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

Define bootscript address in RAM via DT property. Adding default value to
common DTSI. Platform DT description can remove this property or rewrite
it.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

bootscr-address is documented in dt-schema already.
---
 arch/arm/boot/dts/xilinx/zynq-7000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
index 268647668db2..46182a5690b8 100644
--- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
@@ -8,6 +8,13 @@ / {
 	#size-cells = <1>;
 	compatible = "xlnx,zynq-7000";
 
+	options {
+		u-boot {
+			compatible = "u-boot,config";
+			bootscr-address = /bits/ 64 <0x3000000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.43.0


