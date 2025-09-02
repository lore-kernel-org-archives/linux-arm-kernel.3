Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDB3CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=womn/cs3TdQoezC2RlAIkgCelkfCXrOZgXUdBjtwd5s=; b=Yw+1iH0JBdYxL7H+A5bOoVrONw
	LONOeK6TFH9tmBxb0Ez1msauljQUFnzUpjYACji0HaaDTzTow2LpB49n/Cc26V4VPOveDWdPeToIL
	AeTqZmaV6HpqxKaInyVSb4S1Lr2ona2YmMrYNEV6RsvWe+Tx6P2m/AZOECaAe9nKkxJ8hP98/YIxw
	yMmtvfqxp8hDV9Ut7M+hcFx1xsHXus/nL5PgJk3vAr1Rsy74nh1KatiC4LFyrnO2Q4UhTFrzy/8dU
	CtYiXal+VL5bwLO9OkhUN1ZzB7iWGHlyDIkrMAHaVLp2flWL7bHy5miNkI+u9OnPLWRi3074dILuW
	MS+Z94MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utM5W-0000000FwmH-2ZvT;
	Tue, 02 Sep 2025 08:09:58 +0000
Received: from mail-co1nam11on20616.outbound.protection.outlook.com ([2a01:111:f403:2416::616] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLsh-0000000FrXB-347y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:56:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwGGFY8beBlX+abB8TNUJHOld4WVyDaz/STExDZs6d0v01WIhG9davtMc8qe40rmfZhkiYHpaePrLqfjORIyTH+troOKvn7wIxNbkJlJtkcYn82r2EAgoTGsapOtKzaG9E76vEqIj3XmL1L3P/y8ZruHM+Cf0eOKxzdfirXj5gxQrl0nwVKclJz6PvOcyOxKiKB3Hxyw0g3EmxzC58c+P2gw5YpcWNdHf/M2b/I936k6E7yXNqGzJHysE1WygDhLqgx88wxJtuaiPp0WhcEYKxMRoM2AARuNlGukIvp2Yadmo3SrZEFEsULRHlb7WuqZCqzHc9hCYMNxz05uusu7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=womn/cs3TdQoezC2RlAIkgCelkfCXrOZgXUdBjtwd5s=;
 b=msQ6hVzAbTxVYtp/k6Cp6GmmOTeVRnPhyan/wM1Noh+79fZ/WMwfn+Mw8vO/ZoxcyuQxL8Px09ErQXtFMNrtC/NcL/c+y5Ta3Qa4JTPgWtrKV++cfwOPcD/Rg5grY16WjuWCr+WP11DbP7ZGDcsNpPXPnm6f1KD653QOXOGsk2X7oqBNIar/GmntKsWJfDEOHb2Dn7iq+6CvJ29/9C43yo+casZRzrr3FOcxJiO8SUIEFdkNFyj5lQBZcuKe2YSXurBeiKbM6qJL6gN4kZdkyjKh1OE3BhTX5TtlzZPdefnnD1oL4xZhWNI8EXOMUgllyiwkCjbrZ9U5KmzcO4XAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=womn/cs3TdQoezC2RlAIkgCelkfCXrOZgXUdBjtwd5s=;
 b=Onk7ESwMAFRrsnmYCgs3YX2ZnQWW9Thu/EcByurSkCOt/tMK1/Ml4PRdr7GpVDqoqGEfCKw4v/BbuwUXn1Pnko429Pos0h0UnOo+Mt7qHorQMYjY/V/DvqVHprANk1jKf967zVAfmhT1381iopRHkDEQ5nFCBe+WOGrF3NXpI9A=
Received: from SA1P222CA0084.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::25)
 by BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:56:37 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::33) by SA1P222CA0084.outlook.office365.com
 (2603:10b6:806:35e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 07:56:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 07:56:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 02:56:35 -0500
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 02:56:35 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/4] arm64: zynqmp: Revert usb node drive strength and slew rate for zcu106
Date: Tue, 2 Sep 2025 09:56:19 +0200
Message-ID: <85a70cb014ec1f07972fccb60b875596eeaa6b5c.1756799774.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756799774.git.michal.simek@amd.com>
References: <cover.1756799774.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=michal.simek@amd.com; h=from:subject:message-id; bh=jyqCdRkSQqfJNGPsAY3AgwXVR+ZSi8DWj5UzFA3k0W8=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRsW6y88uPsSbqqx9UYvXL2bnm+wNs4LaY/eM/fvRNru 43d9mvf6yhlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJcK9k+MPLcqx4U5rrKYGV 5o8rU7a/lFr09/n6FP2WqUU+yfUn139hZJi+76jGVKdJjOE8/zumzv0ktWH3+r9z78pebfhXE5f w6TkbAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.simek@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 1317296e-d0c7-4bf6-ac9a-08dde9f63e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AiqT6QGMDqJ8CkjZlqLnIP3z7Hem+PxAOXQATUwjbPVFeRCfpGknWymJzrNq?=
 =?us-ascii?Q?sgXv7fCenKXALjzkB5rHrFZmu/FByBU8xPKw7tbpd5ZK795VdhEx/VY4YHk0?=
 =?us-ascii?Q?IoEc3+hF+prhrtrtykZkmjG+EIV0LKNPV0PF3f+spZeL1Laaiqd8FhvzbACf?=
 =?us-ascii?Q?40aw2GWK1H+Jq1vOTXl1X5VIs1xRBhi2E+9zbsogHgZVPozbCGd+KiY/Pm8e?=
 =?us-ascii?Q?C5BlMOoJA170PMebkmVjzYbDjZomHnrom4oEl492YGfYgHNerGjWN0nHQzDv?=
 =?us-ascii?Q?Ldjq7fhYD+BivyLyHuqlS6FXlKhEmSA5DITowI1w+yQNqZ7tcIyOyIUJ79Us?=
 =?us-ascii?Q?4XqpKdsQ+Tc23uW6HNBA9OThHyM1oQr5RnSQ+x3KvMlJKoVrpTcr/C2yYyQy?=
 =?us-ascii?Q?yYc68XAF+ncY3KtgnbnCVxIsg3P19WtgMiuzsMjNCCWihnrwJESaQtWtD8pA?=
 =?us-ascii?Q?TrhgEhol+Imcw3dcZZwmwcKlgNlQpIYpflZaXAvRnqJjfBhD0VX2OS+Sj8uL?=
 =?us-ascii?Q?96jeZlwTVJhvG6ISdZ184+DX5vaAaHa+VQ3El1TyolsfA46J8yGnQs6sOb1a?=
 =?us-ascii?Q?+yKspwP3XgAcR0q5LGVPLo3VNAAUbv09YMj0rlNHeLr4dvFYzpI6D79vtxJ+?=
 =?us-ascii?Q?4c0kYIXB4t9M7Z4bqqFnpA2LbY0ucStIL+ALZOnbyGAyU7zj7b3QIiBz9GpY?=
 =?us-ascii?Q?KnammZGrulvw/CIoMLRjeFVoJz8XYqKdmAUO+DuF7Jw6y5FwZLqFLFMyye9s?=
 =?us-ascii?Q?xs0tsYzX/uAq+OEKvfwT2G0pT4jQT6r4B+a3sk0KfGB+3ULbUwj9N1aqJyBI?=
 =?us-ascii?Q?6GCwMryHtusFx82IbUQ4xW1ghrOX1ZRyHSFh4986mc76BOLqudc77FAlYqjG?=
 =?us-ascii?Q?bx3n00LqCHlb8FGfTtLcdlCRbYUGp6YUJtY2WeH7vxVcWusCjr1dNEv6hn6t?=
 =?us-ascii?Q?A+3/PZtlQkawMRZIzhKdJaxub/aQyPsbUAZvTrMLPBwOs35S+hkIbVsAjuFE?=
 =?us-ascii?Q?PUuLdCogbUxngpOppPKHClOy36WmDoCuwG4rHPNM140uG1vqEVsuaDa89Dtk?=
 =?us-ascii?Q?0YGK7s1u3hmgaJ3bcuppTLltqTKKU0PsYo5ZTflRY4f7nhQBO40iAoQVkE0o?=
 =?us-ascii?Q?N46vypka9ELQFrLH1oveHurS41pfHe5KgJG0CreOrSuahbR+nmsjosTxUXqa?=
 =?us-ascii?Q?PgSfE1lNufYitLJiXbFzM1ECJt6ZzRA6Eg65OpSFZyD3McLeVky2klRJuJYx?=
 =?us-ascii?Q?kRSm+KKlpc+srbo5Ua8QaUyvc2ncf23GsXZ5g7kGXpGM/944cTB20k5hegwt?=
 =?us-ascii?Q?Zos36qyBNo5LFuynp0aX3wqZa2vL1qcGUlWGTl5+IJJ2b+KWSbFBIYgP8yuA?=
 =?us-ascii?Q?bhTIH3e2mI9CBAcmECWHtwFSwc9TsTitjqu1vq8Eqy1h7Fs0fnKVsmzzrvgp?=
 =?us-ascii?Q?5jcpGocIfI/RSqhHQgPZyTZ/qGxy1Grz5rCuKBlga5zWZLOBnZgOrzlHOoIj?=
 =?us-ascii?Q?+SJcIwxDaVq/joUnLl0vxFMPeucP6rzcrWQJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:56:37.3864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1317296e-d0c7-4bf6-ac9a-08dde9f63e65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005643_776942_BCE692FC 
X-CRM114-Status: GOOD (  13.23  )
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

From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

On a few zcu106 boards USB devices (Dell MS116 USB Optical Mouse, Dell USB
Entry Keyboard) are not enumerated on linux boot due to commit
'b8745e7eb488 ("arm64: zynqmp: Fix usb node drive strength and slew
rate")'.

To fix it as a workaround revert to working version and then investigate
at board level why drive strength from 12mA to 4mA and slew from fast to
slow is not working.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index cd132abf6e00..7f6c87d4d77e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -808,8 +808,8 @@ conf-tx {
 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
 			       "MIO60", "MIO61", "MIO62", "MIO63";
 			bias-disable;
-			drive-strength = <4>;
-			slew-rate = <SLEW_RATE_SLOW>;
+			drive-strength = <12>;
+			slew-rate = <SLEW_RATE_FAST>;
 		};
 	};
 
-- 
2.43.0


