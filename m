Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A21FE81A26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6EZdjdOBRPE6p/IMq+rwytd79S4yFPyGgvWh6elfD0=; b=cWaVYjxfyjzGZDcuJ++QyPgrA9
	QGKD6huDwdOF3pNSoZs33164UffDD6AvkHivtR2ex4pQ3aBwwUthrwCLap4/WNxd16ORejlXjpHk5
	3DxymymJwVvt714SpbrMQDjCN+a+04vKuWM8JAa3SONR6PTe0/IUbt3UmtsKUL97Oy5J3vEuEScUF
	h8NQVE0g2E73USPas+JtW/1fRFBpkQgKgyKkW9frehTAOr0q0WEkdOhtn9S4u6Pm4B/LVfW1rxHzm
	SaJ2uro/DvQllMWAW0t15B6AzWT7ghzrd1oTwtQeoHpP6KZsE8iCGlPrfMqdiZCIi3dCobTOsEh1N
	mtfe4CfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgU-00000008GCh-44Lx;
	Tue, 17 Feb 2026 13:00:10 +0000
Received: from mail-westus3azon11010062.outbound.protection.outlook.com ([52.101.201.62] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgO-00000008G8M-3Y0T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTMsyz6237Uz6X/uRfrOMf9QCgrOC110ZfH+XmTvVNj76OVS3sP5Uy1MiCqtYwJPa6pomMcfj7ab8BOtd34nnpNwk1X1rjuf9e2ixqRy6LHDAJlb92yenBCuA+cvocn2kNoKV3oliXQLod8DDicw6tOS+iHYvhK3sSr9v660hfh7NudQNgyc5bbc/Gc2F9FnHUj0gv5HCUlnQICC8HGXHtUD4vgtUjw6v/deYriNxPPUgONpSdhPwy3+2dkbA4+bQa1OZyyHZawT6KV5JEJC2Gw3Y7STPMilFd4aWKAi9+WckRmX4CGjNlYM3wdjQ1n6YMC31PxEOSE0B+uePBvANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6EZdjdOBRPE6p/IMq+rwytd79S4yFPyGgvWh6elfD0=;
 b=M2YWCaV0kLe7kUfsBdTF1ZwGhJIPoISQ5gDxFHO48Y6MpJ0sFasV3ilg2VVW52t1FqdekS6UI1xbPAGi7Ik1p5Dm+4lZky9F7IQx8MquXPYJEcXxrvNk10KWHAqcejafgpbTud/njs3CMi77E8WsNDzM0B03EWHmxUnJS4t7LfsjvkxVAZpLHBZYUfnCEm/krBYdqFUf/viAwK2ZfaDiQN+Ah7Uj8GbTdQVdfH8siOMpK1BVEk8peBWxhYXLa/D4PXovoM8ve0Aq33ehTuBWab40mNs6PwjbUSsNqeajNNn0HTxCHZGKtGv194zEwdjQLw1bk26sNgu3stLwHqJFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6EZdjdOBRPE6p/IMq+rwytd79S4yFPyGgvWh6elfD0=;
 b=HHeudQeXAMhKOUyIVsVmd4MVQb/fKwB+ORSn7CShstd9VBC7cyWCvutkUdOB5Qn8f7HDdCf7W3emtwms93MD7xOluYa9mHE8ktlkiPpIr7v9c/TKxg8+75WWReAXH+cfv0LOOGZ5JOAkZHNtazEUd0lgN8qLvwXM1E0JpzjemFsxNHU/k7pZQekbD5bxWnSD74iwY2f6jkdpw3xNhr+WaXxSUDmfJGi6z9ZY2CB9CKanqKnRyjfrfcczeDNZldBk9H1beEmHey2Y2stnLdGotxh+v7zyYiZoYM9wP8BTCwK9gPQVBtaa6dFoufAh/KSgH4YiQiqfuJOyWtP4aYQXyQ==
Received: from SJ0PR13CA0034.namprd13.prod.outlook.com (2603:10b6:a03:2c2::9)
 by DS0PR22MB6080.namprd22.prod.outlook.com (2603:10b6:8:294::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 13:00:00 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::fe) by SJ0PR13CA0034.outlook.office365.com
 (2603:10b6:a03:2c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 12:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 12:59:59 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 29827F884B;
	Tue, 17 Feb 2026 14:59:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: imx: bx50v3: Configure switch PHY max-speed
Date: Tue, 17 Feb 2026 14:59:48 +0200
Message-ID: <20260217125952.53997-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217125952.53997-1-ian.ray@gehealthcare.com>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DS0PR22MB6080:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 76686027-a57f-45c0-fa6d-08de6e247524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oxKCe9rYE8xeWt7gvH5bxeOdQYXnKEcTrl7xKDqdXgG1dXfu/nVWRok1pq15?=
 =?us-ascii?Q?KyNPRrj0fMcyyOJeb60HOBaGmFQlp4agyaOj3fAS66EcpbiWyT4aK95YivDJ?=
 =?us-ascii?Q?2zre8LEKqvl5IrOBpUNHUi6Kw0+lmC8LO4YuiyYKmA0gxcueCZzwo0/sxP/X?=
 =?us-ascii?Q?25VEt/f7um+jiZzEjgVXoysHxMIBg1MHJfKHrDBkfxGB7NfK0BBB1xpS7EEz?=
 =?us-ascii?Q?nQBXqnkD7oWkyJtqtOkNPxj1u4yMtIPYtRq+MkOrbHM8m2snazgtat0e9ZnL?=
 =?us-ascii?Q?GjdCY1az1kERkssJS5wm8efif0506gXHG9G9evCWQQkCq4NyeIOMqIrZX2Mu?=
 =?us-ascii?Q?zC68Sbuotx0itJxfq4TzdfNcCcueosIwJVYrZbLyp08qZW71lNqpIypHqqgb?=
 =?us-ascii?Q?OQ1WvpjL90kewKad7U3Vv87FvxaW8sTFAG5CyO4r7L9nywRy3Vn3WrS+9YxX?=
 =?us-ascii?Q?rPnqw+u+hBfwGKUI3JAhoxoYepLe2GVLMrruuhUWs5L/Yzbw0EWvbFgfpjbs?=
 =?us-ascii?Q?bKyKM5LeIjDtdmdKK6xpgOQNeC+LqOXUSqTXPooN01SllNWp+ZOdxIoqJFDF?=
 =?us-ascii?Q?dCAtSuxbXNwaPJjlPAsBId/u6b+mupeSMwhNK1rCW9nNK3f3XfBWoFiEnhqq?=
 =?us-ascii?Q?XKVkTPa04j/tNU0WWJE8Gl9J7X+Y2aRl7KykF+RLe29UnzgwqAMejJpwKFtL?=
 =?us-ascii?Q?WrxM8iryhhaSk8tXaEQck4hOXbwhjclb3mYxafrGtiqGizh06NNkF92rPDfM?=
 =?us-ascii?Q?6Pi23UzY1I//to1woAFmkMbIZk7g2R7RLe1WYShaj9Eegk7i6xTD3Cfa/+cv?=
 =?us-ascii?Q?FUEuYpBmudTMfFPcnBZjjjzGySIW5Wcla4/lC9ypKepa0+oAg1qNHGhQbDai?=
 =?us-ascii?Q?qdh19uYTH8P2D/46ZU91Ra8sglgqXqsB6fcyuGQSY9Dv0fBVG81ZRDwZTSU3?=
 =?us-ascii?Q?lG7NA58bv2kkS5kURRPPEqEQnLv16+g8n7mTnt2yGrp47tlvi1AGWjCmm4TI?=
 =?us-ascii?Q?4EaIjJ7TM3+4q20IIuYhWX7TtLNG2HvR6RPEXzzX7MeiYjSjTBZrXdcInVlT?=
 =?us-ascii?Q?HRTPjal9B0MYA8xzaL/mwA1tKeRl80ajM+xe4SjCnpCtMamYnYqJtHISrHE4?=
 =?us-ascii?Q?LPYjK2p8HeSMT1zsSHG/RynhN2RI+KfvHzUQyaeekbAKhxSSBUEnHp1bLwn3?=
 =?us-ascii?Q?IXDqevAyyxJh7bCgEwnTKhYKq1JfKgxzv56/xKkMjtXHr+j6GAqpFP5gwKGk?=
 =?us-ascii?Q?+ezvOx8OhMFBRO3Klif0zksvPS1P54B68AVniXa4gxJiu5o8MT8DwbWWbvnU?=
 =?us-ascii?Q?qZvlGUYPGRpe8ss4FALhWUxxtMc0aW5+jS4+KzVfNG899cyqpD1As7vRz6bo?=
 =?us-ascii?Q?/+zaHP9JZvUzmiWt/srJT4lopqbhm5G/i3oWxWIPU/eMhWoGbKZ4+eoc9FkS?=
 =?us-ascii?Q?LmowSopptasim9/4M1UzpeCPh8ww83OrAAFUb8Bl1NoqQTinZoqHNlG80Omm?=
 =?us-ascii?Q?yRn2vOELRTo9a2nTAGxXibsC/h6clUGyUED86VareFdhxK8/ir3iJsWyR0eo?=
 =?us-ascii?Q?H2gS3e6UeN79N79cePx7rqGwfZYYkLRKLCfm0YX/GJi7ci0LxOylyxpmxhsn?=
 =?us-ascii?Q?yghWtCAsmOs8h/9BLXrmY7xvESvJepKTI6VuFbT4XpDdj3l4YS/gj62jx9U7?=
 =?us-ascii?Q?Q5HKWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fS1Fn3Ht7BB8MEzqMOk4cwxemeH5D/sk77Ri4JZpCXuVR6w4wZHQZOxjLSwl8RFVT1TtHp9iWvOoTRRXCv3PrMa1NysyE7n6+48k1LAK3KtxAIHED6tjFLhDam7N3akoMIpcwvnxNtqL7L++CXuaV7iSKNLSUjdOH4oIreQzuxXLuWIvnBLfDC+ULEfTn51ThsGOS7pkjY0unvh4z9FZZPuFUjr9NP03KcLL5uZ1YBlFm1bIcNNHTEdAZoVkOXimt73ipHT1LdXBoW2E7+6egk1+vFaytjrtC77dzaodrMZZ1AG64/5QqpCX+H3nwcVhhhk5npLHnVgq2CVd5oRva3Wzsz60FJaEIE9/WE563sa+ns5rEoqNWJ1ocjuh6cSV+GMO6Y+XF0J3LuFqJ1z3E81pCT1rfNoC1QjVT5MhaUjo0m1DFseMDk++dJl4nXgS
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 12:59:59.4074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76686027-a57f-45c0-fa6d-08de6e247524
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR22MB6080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_050004_882199_5AEB439A 
X-CRM114-Status: UNSURE (   8.83  )
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

Configure maximum speed for the switch PHYs according to the electrical
connections from PHY to RJ45 connector.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index 1e2266a2368b..2c8d2ab8cda1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -124,24 +124,28 @@ switchphy0: switchphy@0 {
 					reg = <0>;
 					interrupt-parent = <&switch>;
 					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy1: switchphy@1 {
 					reg = <1>;
 					interrupt-parent = <&switch>;
 					interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy2: switchphy@2 {
 					reg = <2>;
 					interrupt-parent = <&switch>;
 					interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy3: switchphy@3 {
 					reg = <3>;
 					interrupt-parent = <&switch>;
 					interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy4: switchphy@4 {
-- 
2.49.0


