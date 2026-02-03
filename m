Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D611E83042
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=641mfZC9UhARD4jrIgtik2gClfPhuW2WKmijqdYnG9Y=; b=CawF8EZ1vMHrR1UMqmkh9odptF
	/MC3rba93uh+HsZl+J4PjT58RtHoBvbpfEg40v1zxXv65XQtzfk2kpjKM87mMkdqmuG8vZ5uvKAA7
	09rTW2s2acndicVbKQ/wB9/pGyBjAqKESIs81GqlVpoQlTL1qxtLIkVOMfIg0+rUHo5bPfYdAp/LU
	QqROc5JUgvNfxxs8shsL/xbVn6cMuP0l4oU3X7GwZLkiF+88rzQV0vcNokE/frzEcKyUU/cMfAVmQ
	LWvuWy/0jW037RUZPFva0I9dcvsNGWCRZZjwz1S/gVLKU2AMvMayHqj7fUkr36cbqLnJDfsKv9y/p
	j2stju/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn621-00000005udZ-04Pb;
	Tue, 03 Feb 2026 02:20:45 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn61y-00000005ucG-2kqi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 02:20:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMQWEXZFOnpNZCG+CGECYUKCDOJNkwy1Auzlojdnnv026LxE0yS4NFfLKFIkGj5R/CUUjzf9ZaQXhuNXE4bF37z2uVVR8lbXqdRugCLo53kX7MMf8XJzkClfGgqdfWNxV7NCmdv4mpSNzMg6ZMBkO8RCza08HtB1YyecrNKEp4lncYaPQxCqArGQtxOpT7g8BvMTAwIGgR67PdTqs3wnXDnKJMMpNznq3UjoF7BnvtyzjSzpygxqGBsOr+kUuGMd//jXiRu4xxdwRvY3ox+kV/WKhlVgH5114Hkpi/Wqu7Bvn2OFdInXZIj2ZA4rq3tP97P6Cq+pTMHIOjftGGC3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=641mfZC9UhARD4jrIgtik2gClfPhuW2WKmijqdYnG9Y=;
 b=eaTG5fWOZCT25hlMcuLcQJPcRgBliHP0gk8YNOwm7l7NbDUfC2UgiXiCHSz3W7r+Ghb5REXlaslyHaDvfDLzIvrZDETlQswwtmVU2SI7pus575fSl+NaU/+5kpeMDhkseVf4szhpWbPNGA/gH5tLgDei98BMnp1TQEDfURkuIrJ/FeUVjE1QqVjMsn9U0IWhrDblTGE9ka5e1fW+jZju87NJn5VC6b0vZGnjuvw5qyNWTGVWXIR/o6eh3zuvAdMUTYhb8WQC7pJJ7gs7FEQQoOofJrJAJXZpeacMrhtJ5b8dgN1X2Y3CNUYFGQIokT0NS99pxaB6aarDTv+ZUktYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0081.apcprd02.prod.outlook.com (2603:1096:300:5c::21)
 by SI2PR06MB5290.apcprd06.prod.outlook.com (2603:1096:4:1e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:20:33 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::4a) by PS2PR02CA0081.outlook.office365.com
 (2603:1096:300:5c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 3 Feb 2026 02:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 02:20:32 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AD5F9435071D;
	Tue,  3 Feb 2026 10:20:31 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v6 3/3] arm64: dts: cix: add support for cix sky1 resets
Date: Tue,  3 Feb 2026 10:20:31 +0800
Message-ID: <20260203022031.4075627-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203022031.4075627-1-gary.yang@cixtech.com>
References: <20260203022031.4075627-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|SI2PR06MB5290:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ea640566-aebf-4044-b469-08de62cacf26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H0Kzw7Y/nyxqkR4086G5lbxlFHh6iJs/VVovaS4kXvGMhcEcvTeofeEsGhUY?=
 =?us-ascii?Q?vb0FdQzW7yK1WS6YngHTryR562oMICGmGiDnjcDNxMPP0zJBZQLKce22PQ+H?=
 =?us-ascii?Q?MekeXKNAZS0tcKACIhCsrIt3IXCBvWPf4NqkfEUITCsUad+BIg9ghRtAFXee?=
 =?us-ascii?Q?SeDF8BiDisrCVIfL+zerqeg8vTziO1PUHjNDcG5jpptGdC0oH5ssHslI1oYp?=
 =?us-ascii?Q?FsYXtWzjtyYA6lUvE6uafj0YXKagFCJldx+wHAJhOGblVosYWzVrAZnUtGKl?=
 =?us-ascii?Q?XpSDrwVvD7MH3/dcaNCu0NvF0i7dqNtxmzpB1hqbIkVi164CVnLTqt9knkSB?=
 =?us-ascii?Q?62WBPalkWUSov3Y5zFFlNQp+IRa6ULb2OXzKe9zbdXSHhkFz3tqHmWd6L/Fv?=
 =?us-ascii?Q?Wjb/z9G27E3mAq2PB93t3kq8a7fclT46fQkrgYLXjAQeHkApuJZVmbTd480S?=
 =?us-ascii?Q?HlTSyDoBHk29AzL8iELBfEpU/B19Qf8tkXYirX2bvQBVLSHK4Hkb0prmvEtV?=
 =?us-ascii?Q?cDfoHpAdKitXR+FNS3VPeIioasxcp+G+8ggIf5ptXoo10fMUecA00Q/UkEop?=
 =?us-ascii?Q?OLdjPfCXXEYGE7DMQUuhJ2Mg28IgNRiuupKD6s4LFt7oSdfRT3EqAP4W05EM?=
 =?us-ascii?Q?iABcU3rB/zZjKpZT1yG18fu5KYz1dBAPIqsllM3ZTKWJvWyaPjwKIcJwP6A8?=
 =?us-ascii?Q?aGpb3AGlSPpEQaKP9tQggnqa6g/sEMTjuwFraq06nziUbxSkhhnuC1rAsbMP?=
 =?us-ascii?Q?03FW8bqSb6MM2q0SFXXEL0o0PgToJOT275/OSUYtrmj48s3tv4ePVlJERnfs?=
 =?us-ascii?Q?H/4WgkNegZ4Ejj2MSXyZwoOKwRMoJsqv3189kACdic4wiSuM6Sj4C0RrL+rw?=
 =?us-ascii?Q?J89Pi0KPbxVbHm0f8aGqeDs01DNlEMVqHTxXp+yzw9PNgUlRTYJoHxzrHNPd?=
 =?us-ascii?Q?w7Mn/P3PcK+ECnRuC9+48gqQhOwIAYIn8yt4Oi/oMPmXKAUKiYV5Wgy6bqSk?=
 =?us-ascii?Q?5++L8unbleTMpCLQSWSA+YC7S8SFVIoo7PYHwXfCUVqIYLd7JL2UpKaQ2AuU?=
 =?us-ascii?Q?XY0I+GRQWbuoSKkXYfqFhgmjdrCwosSM6/8AirWpw4CUHVXrG00tFHWw+479?=
 =?us-ascii?Q?YHuZUbI5IJ3yz1aT7iLY9P0Q5bhooxA6JZ84jLo+JRTp6Auz6rjvvfg9lo/o?=
 =?us-ascii?Q?o4r2Dcfs71lbxyhDNUmz65An+URkMPaVUzUyMHKoogMA9Xg4TWywW2k+5AgB?=
 =?us-ascii?Q?jiKGHeSCOsDsqdOiD9jqZEsEze+ZHQlVpaB9qucN5xqaQtzXvbSDOVDOyVb6?=
 =?us-ascii?Q?xbWad+BB7L8Lj3KCGbXxePwyOWnVvSgjn8qeNKk2UaERbOG4ufl4EiheAOPI?=
 =?us-ascii?Q?VBfSTyu6iQBn6LS4Zixbv+w72TupSBk3oHzTh2N7pd5jIJoATxLqHk+YLGZ0?=
 =?us-ascii?Q?17LE2bnKxWZwX7REO9oBJwMnjERST2QEaFyr4z189Yv98gwJWHlrvfQw55r/?=
 =?us-ascii?Q?AJlmcpWV8SqSITMsW3CYqfE8K8WYXdq++gRLIZ4DgdsTeJZfTHRiHLz/ds9z?=
 =?us-ascii?Q?3kCXzKkooduSdrNPBefx2Sf19RP2kttzrhAytOcXIBR8Q2ga8/UY7qNolKrQ?=
 =?us-ascii?Q?A3vAKjjw5H3zPKQQ43XWLDKuLm8rLlYe8h9pG+/JKX35jPctv+HGYLAI4ihJ?=
 =?us-ascii?Q?rSdAKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cLPOTCGOXRCKr+QqF3nQHBbGxHDo2Ieg5r9GRFrH5wZysK2iD8JQY3HFqQ1/5yCmW6/qcOYCAKSZ2BoTTF0xaAoW+kXufUh+9Gz/eeOighqrwDvkTA1612/pGka3CuGiCTBD8SnUinete1G7XPzUsA3OFo1OfVWKFZk/enV5OM7G20IDKpR23blcTBmfoBBa5U1rlP7+lo0Agmz1nN34l1JsKPGuYX1S/fvq68UJkPrQ2WjXWhxmYxEj6GnQ/EtBMNJRikTL2evYnMndH0HRWcEoDydm6Wq18siJ6diSSF/ZbpyholcYpESz4RPBmVW5yjOO5FoEoRezU7xlKjmnKGq7o9ehUq0O6+K5iZ7JnrJGmAeR6k28OMQ8LGkYikDMp9fcjEl0pU82zv5PZdyUERmJ7jFFBisDwrcuIAI6mMmxtkUV8J2AG41A7NmvJeuP
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 02:20:32.9092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea640566-aebf-4044-b469-08de62cacf26
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5290
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_182042_697772_75208928 
X-CRM114-Status: UNSURE (   9.15  )
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

There are two reset conctrollers on Cix Sky1 Soc. One is located in S0
domain, and the other is located in S0 and S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 64b76905cbff..37dca97b6b67 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -348,6 +348,13 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		syscon: syscon@4160000 {
+			compatible = "cix,sky1-system-control", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x4160000 0x0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-pinctrl";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -568,6 +575,13 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		s5_syscon: s5-syscon@16000000 {
+			compatible = "cix,sky1-s5-system-control", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x16000000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.49.0


