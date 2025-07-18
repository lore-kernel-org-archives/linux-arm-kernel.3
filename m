Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24142C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuAzRdc+9z919FeQ0BazoVshxWb5KkBZl09pmcyjD+s=; b=4hpd3PJ0tYJJD9w7r/DDZQYbuo
	6guD1j61z4YsED6Og1DxS2jXv5AqhVp3LO6Hy+FjkfE9K3s2JLHRFvOVl92HqirxtPVhKBgXCMJsI
	OiThlZ6QsKROEFWB4yz2QK3BDIxFDxm+APkawTuktj2reAZZuwwRKpLgOyUWteiWaPKtAFVPwPZyC
	cBQ5bAuhY9pbz2+Oxtu1w+LjkYAZ1MOXHAuJOXrKU3O3X+ieABzf9ZYoNu2e5J52tzsJkt2cGG4BW
	phH/nJOfLsSASTVBf893ldlgmo3RKEvXTmi20SAvgfJXZAlWUuS7DE0KMNcMcNbXIVI9UpX7P0ICp
	CxQFXfuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucj7q-0000000CQAQ-3j57;
	Fri, 18 Jul 2025 11:19:38 +0000
Received: from mail-dm6nam10on2062d.outbound.protection.outlook.com ([2a01:111:f403:2413::62d] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucib3-0000000CKwr-20l2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:45:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHQoqeEs7Nt3xWINi3pAGAmxvtDMPzTtcZ+ttxaKsJUGspOlMTO1VPtm9mGDuD62n+ov1MLYVLfdZDu4dnUBQ4dGs4V1GsPwCigEna2YO8p/4uWP8BdjIlf4jkU35GiqjXudnb9FEhk0AmWK1V9gNwUu46FREN4htbTuVeGLkAAjVdxnJ7GfFGPKkit8AwYcrrusuirKMOvxolftwl3tpjJ7HztkhueDJATbIj72GfI+FwRNUiRYUdQv9YHqrlo728yRYZLlxsdh43RuTabU+A0B4zqXXSUe+NA6URH1ytWIOQyJ+JHIV2RspxVZzRSbR35VG1A5dW9gQ627IsDuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuAzRdc+9z919FeQ0BazoVshxWb5KkBZl09pmcyjD+s=;
 b=SDrXxZvBDovv0u40pVO69WPPjKnLBgPb+97eQK9xWtKnP89zjLYRYAWac9SSN8rH8+tl/Eck8xq5LLn1b44RocDRYf0OUE/SfXLmJOIY0dgLQX7l1indX/YM9S7w6bMMrIHSO9p7uH7Hz61FKtSgx2vLlp03l0NX11u2BMaLW/hDHSo+7dycbngbCAbM0sk+a+uRTVkejD4HmSowujV3C0JR6UQQCIU0CGL4Z840CtZ1nx0U1hKS/XITOPnJ6Y5VXzV3mykE93CgYud7caCn4QTzmFC8Kom8IK/osTtTfuYLOe9oYRW+achxSqFLNWTSQ5mYnYTSka6G7bYyumrUeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuAzRdc+9z919FeQ0BazoVshxWb5KkBZl09pmcyjD+s=;
 b=wamtYogDk3Qz+RiwUm9H+vhguf34MusSAvw9PSpyQAuiajIXPx5vsiXRy54LQCUt16LWR5RofibWOnyjy3Cm/rF6nipqFqAZ/QvrcIl6L60vuUG2fnZ5Apfg1/HVIPu9VHRV+jUZZB9MPBNyqkukyY5I3AmhsekE1CvcRscR3T8=
Received: from CH2PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:52::34)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 10:45:41 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::f5) by CH2PR04CA0024.outlook.office365.com
 (2603:10b6:610:52::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 10:45:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 10:45:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 05:45:39 -0500
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Jul 2025 05:45:38 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Vishal Patel <vishal.patel@amd.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 5/7] arm64: zynqmp: Fix pwm-fan polarity
Date: Fri, 18 Jul 2025 12:45:10 +0200
Message-ID: <e6dc9ce1e0b97c9d9b073c323cc94a5d7a88b94a.1752835502.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752835501.git.michal.simek@amd.com>
References: <cover.1752835501.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1192; i=michal.simek@amd.com; h=from:subject:message-id; bh=d+EwN/DberzJ8tnfOqJOftFoSI+joEKqTjph90npp0Y=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRUqe6K+C1lJxMfWjXpQ1ZaoO7b50e6dErdVVqPzVyZt 6Prm0p2RykLgxgHg6yYIst0Jh2HNd+uLRVbHpkPM4eVCWQIAxenAExk8WdGhi/qvx8yvjmaJcUg ZX/kDse5HtPEE9NiL26JVuY8Ktt11oSRYeKBvKtcWtw3vpZ2rDm92sTV6N1u7Rq1wDb177s7F9y +xQ4A
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.simek@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|CH2PR12MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: c563f5cf-003f-4b8f-a0bd-08ddc5e83d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sarBHT11clj1yOH7U2YUy3AWcIhA5CsJmg1vI5akdWmNuvqddoUBHyTos46t?=
 =?us-ascii?Q?ZDn8axKsf5kTA8xTuXI7wVvH6ujq2M34OiQ+PTDpGG+RzRk3m3c7V4uJDUrt?=
 =?us-ascii?Q?teenDwAKzqBK/tHJKbDsdTr2mx+ng9BUMyyA/Lk0kfq4CRhwArk18JLxfd8o?=
 =?us-ascii?Q?+D+o32Uhhfa/B1g19D5odgJLCKqKypdeA7BF1r1KPjilJWKCk+W2HSs1WkMA?=
 =?us-ascii?Q?Al+Rxn6/SJvJK4TgSeZeaWhs5JPhvpOCg6rAscBBHZlHIwLeVK0lXTaKKbyQ?=
 =?us-ascii?Q?ydy3fmMLu4CYtbOQWnLS4E1jg24u+WRdzsR/UG1oHcreoOyFN5F7gpE1gZ++?=
 =?us-ascii?Q?11Wz4GKcueZ3N+ESl70fapIfhhp45Yf2HXbsmdiAfdzE3mMR9afXqIIX5wi1?=
 =?us-ascii?Q?tjc5pk6hfv9oQAMG8+G2yDN8QeQ1aX3zdN8dwlzAiv9+0HGPKr8kDnyR3+WU?=
 =?us-ascii?Q?T2JBA4/gvhv9n/VzKgztB+GfFv4Gw0BBcqxtSbYXhX0+zqlobts4uZ4AOXYV?=
 =?us-ascii?Q?SnWqo9g2qHvDPXLBgALDYXf4yqiIs55IWmyuJeXdUE0KXpLUavJDbKzs57vQ?=
 =?us-ascii?Q?HA9NOD3bCeGl2VfdlPai3z5esL1kP91s4pAJ/VRdxDabvQNgjRpndRTQ9h2Z?=
 =?us-ascii?Q?N0lpsDEmZav0QmHzgDaraVIJLcyV1jt9rRQJiW+7GwjZ7cu1K6QaZXXlKTcY?=
 =?us-ascii?Q?pwBt4b8CCXv1dHumPiOAeBqC5ZVWIdVDmkz4g1PBN3iEQPI0ingzsUycCj9T?=
 =?us-ascii?Q?eCRdZjoouLFQt3GNe+FMWdeZXGihkUcelv0ZJ2Lpws56ndcUkk8NzghZ9zyN?=
 =?us-ascii?Q?Cg4dAXQf7gbfcTsG4D8WR+0tcfRq+a0MxuD1vcdaaaX9dXEwTaF4D+WuUXDz?=
 =?us-ascii?Q?ZHN/ZcnVhlweD2kkVq0x07WUfCtN00sdZmBe+b3EoIExaaqa9QHnUfCqGhk5?=
 =?us-ascii?Q?xgLrefUUqcMzHTUpChyxxB3Md0Nd7LqMUAlSOB5tiWsVn0G0UAadM5EcC3dK?=
 =?us-ascii?Q?SBg6D1RAeAWkXnTbo/Bq4eIqrFEXgtpBevEHRsQPSn/WMvi8GeOFRvHMGHHL?=
 =?us-ascii?Q?q5kaNX9wVu5wT0HhqCnoSRQ1G3VdlB4qklggxNJKSxqQymQ9x+dqsbUUivMx?=
 =?us-ascii?Q?DZRlcFLegJaQdaJNCnWFX63hlM7myTA6zGfELE8WpTssliR/WIQjk99SPKam?=
 =?us-ascii?Q?H/OEu/B3p6KQz/VHaobxFdMvSuHDOZHCovFLTX+u7c7bLXT2HHnUU1vPsyNm?=
 =?us-ascii?Q?dKP1QRvzrt8Gr6I3osgA+n5AgzubH0nVc66XUR+d8yrKR4Srv8Y5xLX+UCFK?=
 =?us-ascii?Q?YLkSv8zsrFTre2cJKnWGrKR57z7gKnGRRDEdbvsFXCNzNi+/LQJE4LPmWEfg?=
 =?us-ascii?Q?SKhXnyd4pyitAsca6gnWPIc8mffmRFPAn49uWIXyq8kcgIWFqvZAazeVePGv?=
 =?us-ascii?Q?YoAyhHTzVE4g4bUKn6FxhtAThaNVEWO1EghezwhSoPO6wZc4WFJAFfFc+Ae6?=
 =?us-ascii?Q?edBLG3vtJWspi+X7Vy6RTlMCXEmMHQOPv5Q8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:45:40.8628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c563f5cf-003f-4b8f-a0bd-08ddc5e83d5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_034545_521046_BE0A828C 
X-CRM114-Status: GOOD (  13.34  )
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

From: Vishal Patel <vishal.patel@amd.com>

The correct operating mode for the fan is inversed (1). The previous pwm
driver implementation had a bug and the polarity information was propagated
incorrectly to the kernel. The normal (0) polarity specified in the device
tree was incorrectly clearing the polarity bit in the counter control
register. After the bug fix, setting the polarity to inversed (1) in the
device tree will clear the polarity bit.
Also provide label for custom description based on this SOM.

Signed-off-by: Vishal Patel <vishal.patel@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
index 51778df5540c..500af1d2232f 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
@@ -90,10 +90,10 @@ ds36-led {
 		};
 	};
 
-	pwm-fan {
+	pwm_fan: pwm-fan {
 		compatible = "pwm-fan";
 		status = "okay";
-		pwms = <&ttc0 2 40000 0>;
+		pwms = <&ttc0 2 40000 1>;
 	};
 };
 
-- 
2.43.0


