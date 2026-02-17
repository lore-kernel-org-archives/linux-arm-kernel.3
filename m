Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3D8E909A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6EZdjdOBRPE6p/IMq+rwytd79S4yFPyGgvWh6elfD0=; b=lzx6cbwiv7WdjcGHZGiqdI/kta
	qze/HyNWSFPsgHGTdckgWreLZ6H7QEFVwKEsJ3hA2fqY3o1R+I4rX/nR2oxRxtBgOTZVOcFquuPWB
	s081zXakfHVK+OdUUCehO+gLuUMP7qYt3YK7S2lVXFrJ+jddpfmwiNkaWPyro/SGMHffC2x1SNCQ/
	agpGzEU6yDbXI5aBcZ5XU03/mvRPXJ+oRkgw/skmbpf8MwxsDproAPhR3ZDxBmeQ+guM5N4hEQk+B
	CTY5PIOV0YmaXsop1Ab0qWZjRx5x9NzG/JRrgZBr5CLiz/ELTe5h3W2iPfoQ/ly1szKhkSSBja74X
	7oIX42aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLYD-00000008Mx0-0xFz;
	Tue, 17 Feb 2026 13:55:41 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLY6-00000008Msx-0x15
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:55:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6N8wwIdtXGKTe4Lbq8HWxHkk7ZW1FABiTS1sWaQOK54URbkL4JVMdeoa81boRdwc36W50c+o/q3tkX8z4Q/kNtn2iiv/ZRF8wZ7DB2M1k+HAgqlnAmyjcwVp1Hpnmia0zFSUI2tMkg6vyi+7dT+7Er2vGqbqG6x2KakR0TFkG4uUZzjuc4NaSngToJMzvJQre8cK00EpjZXlhlwgNjUPoCoXlPwyIuvtocATJmiYd/zg3zl88h11aD1CjcxWqaAHSb0akzL0P5rDfOZQYpzMgQ6qsYZVVxeiB+sG2v7D/RzGQTt1GtCtYwl3ev37AMyLNbG++GMFgLcbu72muElqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6EZdjdOBRPE6p/IMq+rwytd79S4yFPyGgvWh6elfD0=;
 b=X7edVW2JT42Lm3XryLbVLUxwT5/nDEU8R6rBploElBcroeksnSqyROiOxFX2len3NYoci2t1TB3w8+flUjbVRsSN/qffwnRp980fhRqjGwdIN6y2SJKZdGiwTlKBqjIpOjiMtVQD1Gky6E1qujhQgkcDe2hIzKezdQX4INsGT9hJp4QJPNPfTqMGfypd8VqUVpaBoPYRQ++/uWoG96TRXJuV8v3xRZDvLMNj95wxYBakOKgct7iCCbZranNn8Ybp5K8cV9ldBRzTQMzfIcU+JvqpxhXfG1p2tVLL0pKGLt4tuGOAiWKkc3wHZfsP+pWYd1Z6HY8eLzkYMbVVvernOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6EZdjdOBRPE6p/IMq+rwytd79S4yFPyGgvWh6elfD0=;
 b=Fmcousvd2/HtEsnpiTaGBKcI242nJMK6e8b0tAIunBgcx5dxfHAiaIFxxwnVdlKzRcm2+8GYCeLz5HI/CzjyfdcT3tbv4425WYwdt1Dv2YB51o4Qjivk1YEDwMTO1JjTr0hLs/ac8CRcuJDQ6XrPEnOBSCozMys9ycb5Sk69ouK9pe73Zt2IhPe/kw9fl0Ki9AqxsUoNmsUe6/ZA9GWxjLW2UcCvaz3YCGLFwbBktnzjIQFYyL9h7x0i4ag/TgLfj9jLU3arSbRtYnjcHXwTKZYgT9R+jdAa4m2fWW7WpZx7rPUTtQq9ZzxyZOT65Opyoy3/bj0ok6mPCJT/7Qn1xA==
Received: from BYAPR21CA0003.namprd21.prod.outlook.com (2603:10b6:a03:114::13)
 by BL1PR22MB3658.namprd22.prod.outlook.com (2603:10b6:208:395::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 13:55:28 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::5b) by BYAPR21CA0003.outlook.office365.com
 (2603:10b6:a03:114::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.8 via Frontend Transport; Tue,
 17 Feb 2026 13:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:55:28 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 97A93F884B;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
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
Subject: [PATCH V2 1/5] ARM: dts: imx: bx50v3: Configure switch PHY max-speed
Date: Tue, 17 Feb 2026 15:55:16 +0200
Message-ID: <20260217135521.65742-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|BL1PR22MB3658:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f31870a5-de9f-4cf1-aa49-08de6e2c3529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7NrozrKks3H7TOWKA96HELE4V4QPkcrL2/JVJFhCu/h4hhYJeGLlxdqA0KhU?=
 =?us-ascii?Q?+vfvDunVdyhlmxXhCJG3jT+vifDQXJDQ5+IfWbzZt8SNJfSarQEkbr6PyTCm?=
 =?us-ascii?Q?iO+ZK2fjh+HWhM1y3jV3+zHolH4uVp5k7lFH78fuMU0id5UfBnF6tuytkzSW?=
 =?us-ascii?Q?blQEI+YZl0d5sVJlGMXg8QdWyTFsiZQBbfRn+M8FAr0ETOZW9hwKLh4LHROs?=
 =?us-ascii?Q?iCghnQeMOgiqc0Yk8X1gmpvcKEnZsTJZth5DvntSQUalTC5S+SjcRc8Ugvg1?=
 =?us-ascii?Q?jayF8ekNVC4ku2QFXCKB/k2s0cEjrXNbmC0V88B3odGLYhDeA8yqavIDf3J3?=
 =?us-ascii?Q?h6X1ByLkbFujaLiwyx+VR4YkUg9t+sJMa0+CFaqnCscRowefA0pxnat3P//o?=
 =?us-ascii?Q?GraTOYPfRSu2zEkfNktmY7ZmHXsUIoBs8l3arJpfCFomqUEjSPhMbbDLlU73?=
 =?us-ascii?Q?va3kv1R1mZzty/TfWDI4AFGpjA2N2bc5oQYUj3N62NvP1Ubn3ZcyHLrl24mx?=
 =?us-ascii?Q?Njk0I5GOq+h1AdnDF7nv4g5wCc58kULUqykNtUeNii9aUVr/seVXNOQ77miJ?=
 =?us-ascii?Q?FEOF2Xu64ji06hpIfP/C0ipLDQVp/ZlLlCgeYCEkyKHkqh32QciIzV3R25tN?=
 =?us-ascii?Q?xK1GZCn6vNhBp+BDQV4xk4qTsV9Cdha80oKhVk3+dWqkE1czSEeKc2EyMVFY?=
 =?us-ascii?Q?SesgWRB5rt7QLOuc02wy8O4xIfO8kX7+HelbEcegtt4LbWvVl85XGzARj1vn?=
 =?us-ascii?Q?JoZVEpSrq4DQbb0XsM/2stEX2GzfY7DgXwl9D6HaIWVa8id4TzsowadUJZtU?=
 =?us-ascii?Q?QygzaXa6pCBbOcLAVdma6uGv42wFEw05br+mTzYrQ1rxKeE8ky1ra8mQBkNt?=
 =?us-ascii?Q?Vc0FNRupE+WUWWeD3P4cUP1UMxZSahSBLClhQDJFjJ8C6qyQOiyNUU/1U5dC?=
 =?us-ascii?Q?A5/7Gy3bFxFnp2lXCvfyCPdaPoH3xPen5Wc5APeVi9/PHOH4YznQuNP8kXLa?=
 =?us-ascii?Q?sxfKTq4f3812nbN7myMrJslqX//ZwH4mZdfPYU+x2ug64MRz3ZxzmUQBwqPi?=
 =?us-ascii?Q?jta0tAUf02znYx9Fpk/+38D1gzwHiqw7vTDCDNpzAzEONfu+BcJj1eJHPCxZ?=
 =?us-ascii?Q?tSUAf+6ic9nf1EPr0uvDJxkFIgbioBaq4Wy6BFY1tX1W21oOXPLKY5o2AFWD?=
 =?us-ascii?Q?SC6SPh4FXMcxVP7Z29YKqYFWd141hmoLxWYy5fEPx/wlh446SeVlF3byy6IW?=
 =?us-ascii?Q?KrnSzKnX0dZdGg5hNatOPkZT0yjKB9Qw4ZwO6S5n/Z+FMpKxejET42mAfmRB?=
 =?us-ascii?Q?vUk1RP8nuG6ywytrbKK+CAMJ3KvhpDeQFBz9N2Rfh1R0vynTelkppPrd7U/6?=
 =?us-ascii?Q?+86B+xgBCJuJovhK5ozWyOMfaoH+GHDYp3zRQ28x3UlQ5OFox+uC5Y+jtwAM?=
 =?us-ascii?Q?UJcHUhZjTIayQlKX/Wxm43OndmqxagmJfUrIvXAeaSdTz9fOJKh+YyZg+/1Q?=
 =?us-ascii?Q?h+eJ0sHRgqurCNffJCgA1V+1jp0ZUSCXOzEXUU7L/szBaMcc4TbMxZjFGux6?=
 =?us-ascii?Q?uZCWt8drLvVo15tqFJ0qRM6YupH35AfBZTufZ3s551sk718R/O7PAW/IqFe/?=
 =?us-ascii?Q?t0D/EDRGp5VtHBbndide0HdeYQMTwGeFK4aHOoQZjJI0MyJNgDI0BJ7VVchS?=
 =?us-ascii?Q?J40nnw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HZE1vDK17E4MFkOAPaYq/tdOwWhZGfaIEG44Q90p4yfuG+Af95X0LM658inKJ0ay6z2JDAF/BZm9J0z0Npzz9/A6oVwQt3Vxpe19ab+vNV/HdwlDlwOQOuamOOV7V+G61+3d4CaK+XNvdfkVS0C7SLZqOVhkuyPH2Jlo7s/fSTMZm8Ex7L8yNFznljZgPUFZxa5Tv3YQqt+OgRAdX1/XWATqnes562aQS6QRYu6Brd6fJU7xP0RBf2KgOo9uydx8vjYyg2Vx4kniWvErv58HRz7yuZ5dmO+hUK9qQI/e/BeVT0hP8bPiaX5zhqfvZzsuKMnjXLU+cMGV21roqafQRTBR/k8CsPUScQjzD73CBWDui61tTU3GtWoso4QQFW7zmGIrsGJKB9BFiw05JlIK8JqRoj99vqcm2DHtpub48g/UvcSnsLm618OO/GNIIBIn
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:28.0518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f31870a5-de9f-4cf1-aa49-08de6e2c3529
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR22MB3658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_055534_259320_07875FA0 
X-CRM114-Status: UNSURE (   8.62  )
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


