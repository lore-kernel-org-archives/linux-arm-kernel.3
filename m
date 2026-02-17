Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F229E68171
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZfTg+u0jIsnu+nrWJsyKGu7RanIgdyXfQ4lA/pnEw0=; b=N/H9kA+u/WsnZapg8wVjzJA4Le
	FvaDbCVUh2ZbUBFowxHWyEPPZ8zAXCPPZX3ExmKM8I9rxXYCbiefW9gP6smlebTUjCNrEU7UUteGd
	3BxtSZNJThlOjZWdVIaPK00OmlB+H7NuyH2AW249Wgoc71jzUTRtPEdThsXVsWNoxQkHfOq2+z4U5
	W9IZb3OqpEtgZ+08HPXHhRj8RVchXYq9XNSTeQHiSB92kN1vognC91IFNgtUxxH5yoO3TVn05lkt3
	h979ntX7pFsB5hJoQSQE8j3S61QbOx8BTyz2yulm0uy7Zws5cPUtwmb50RFw/Mj8EQwRmz8kGFJaq
	gvSl9L+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgV-00000008GDW-2JoL;
	Tue, 17 Feb 2026 13:00:11 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgQ-00000008G9N-05dY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:00:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWkhu/jPHBn33O2Rf7Rtfq4ue2RHXPt13B+AyfhhwbCpsWFJ9k0+KqCEXbETt8jyD6iPKl1+9hLHeeDoawW7Ynj1OMECo4e7t+ip7OExl/FIMeCfhF/I89yKARsI1cYyjgLeWdFQFoY/MdhCY8EhiM7l0gdi4d+XHm3mK++ps0dkGFGfYj1aBmMiRrObkLHtynKzgwEz1FCtAe2AHgm7xK+joSN60PWv4CMi5v8b00KI3VieeDMF6cw2q79bcsTO6eh6puNLAvby1UFoSlx3yjgi/psk68CQzrvARhMzaogoWIfGVEukhBoSeH0qnZj69pdDmtuX76GXBh8S8Kke8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZfTg+u0jIsnu+nrWJsyKGu7RanIgdyXfQ4lA/pnEw0=;
 b=eu3Reg4lzTj7lYYC3R1Cqg9UtnxMG0zEW4a+Fqysc/JtgOURigwWOwBx+A0IABnX0qlC9aG9u7k7094P6wRYOPDGkjpCvG7VvtUIWUkIYeVzQdZiwE0AEuUPcXZyec13Wsel/9SR3nL9onTn2wcQALI0tYer9D/UTB+YwOkYV9mlwxH+D1dpD0zIPirik6+lqNOdqrRm49qe9HvdhQJKyr27YDlFHc2xedOz/rQAv8EXSbU0MRKpbsbK0RqDWwerPjjyBmc3HwjWg8leHAQZhdR0NOWSOLS07e06YSpdbWkdym7NVQ2I93q+0u4X/ApcCSNnE9toTX4KRcQFOanPMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZfTg+u0jIsnu+nrWJsyKGu7RanIgdyXfQ4lA/pnEw0=;
 b=DYdD37Gjly2dXkMZ2AkAJsNO4grUUTKd5GTZR/Q7EALUBccM2j88waer33SM6DkY19SBvLxIA8x9ZOzg3W2lPmiSz7F/bVr6E8n6n3GYG+RMdlA80uzhClmrm+Yxw26KTGyIWsogpf3MT0Scl6S2zdf5JFBjYSrVP9mrAIJ5Kmy5s1ZDk8G49VJLqRpEB/9TelTw4+HwmXrx+D1+DsleHHUIQEcdUpO5AZl++CqdpajbCmi+ENY/2iUeirZUGtir7Q9/jRpHH+KmgHZXzGHPE7F1DvEkbrnhKgwWYLl1uZEwIhfICFm9eC7nlKoFixvdGaBPjsFPbE3F3bBb/9NVcA==
Received: from CH3P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::29)
 by PH7PR22MB5088.namprd22.prod.outlook.com (2603:10b6:510:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Tue, 17 Feb
 2026 12:59:59 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::a) by CH3P220CA0023.outlook.office365.com
 (2603:10b6:610:1e8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 12:59:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 12:59:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 35285FD318;
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
Subject: [PATCH 3/4] ARM: dts: imx: b850v3: Define GPIO line names
Date: Tue, 17 Feb 2026 14:59:50 +0200
Message-ID: <20260217125952.53997-4-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217125952.53997-1-ian.ray@gehealthcare.com>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|PH7PR22MB5088:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4a013be4-b711-4275-2c0f-08de6e24745f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8WLhfNtgIjvodHHuuz1S8X9zPVj1NL4mFtp8IgLi7MXEbWXL9Qgo2Ef/Vlak?=
 =?us-ascii?Q?aascTlbbka/Q30Ccy616sONtSjGU0+9uI+Z0KESyMGA+Txo9wQbjllFqL9xV?=
 =?us-ascii?Q?FlQaH1jUaeTMcWQbU416hWcUwnivH+RBRrE+3LyjHlmSXRvIlft2sdh/xAHb?=
 =?us-ascii?Q?3AUvipN9MTub/HqyNJ4nV7niZcJizaqExjPFvKo9XZn3iBaYM6adZTEvcUPq?=
 =?us-ascii?Q?9NeKtDkkCFf1XSpDoz2fzDjEy8P/1+34RLclqx2s8z9yx3KH/lrZO3ZZbfPM?=
 =?us-ascii?Q?u9D6OWaG/9GILGMyReWBMfj5ngsvlj+1LPhQEjNFMfivjqPP3ZknsgZufA5N?=
 =?us-ascii?Q?NPIaznQNEOoE2kliwktsgBHNrK8TZUmvwpL48qTmVea3PC3LxAaq23sEv5wy?=
 =?us-ascii?Q?pbW6KSFXs87mXyFZY/Dfuz/ueO1udS/0w24JQRBIosFUxKZCCpS48Jy+vn3X?=
 =?us-ascii?Q?fYnOvL1oKaz6Bdmj7dbZA4RQOK7xHSYHfIrBG+szQtL8kBbtzpK6knRgru1V?=
 =?us-ascii?Q?CqQsXsDnlJVpU8G/0JQcyXBu1zRiCPw9xaoGFpDEJWQK0BZgcimACpUhJ+cQ?=
 =?us-ascii?Q?ecAjcz0extVe0w8s58nQU7ukrAlHHGPKiJ7ovk30QttTtHugp/6OyLOBgOzV?=
 =?us-ascii?Q?Xs6G4yQpAd6gm1UkMHxtOWqLm+ChZ0uuwyz0obmOews4AlhOi2UkPSAvQktD?=
 =?us-ascii?Q?CwGMFoCO5kZ31OaQwGJanvOt3DEOD385w7ivkvy54EMRThbRj8HAJhn25w5w?=
 =?us-ascii?Q?Z5LjfuDF4ZSQ0b7Tbugf/UBaNMqbPNHfI0bE0LweQ7nuActV2zmP/bMYvGsj?=
 =?us-ascii?Q?Z7j8U1/FodlACAgs1GuyQgoBuWy6yGjae1Okv9ARMLPPjaELbPWdaCoH5ULo?=
 =?us-ascii?Q?HD+a88A1mSDXvVFTebruS8Zt/a0fc5awPe/FGavm+F2yo8hCxHqNlRRO1jO7?=
 =?us-ascii?Q?vRAj5S9oddH0+w05pcg0BwbVJ5ubVT1M8idSlZdAga4MWaahsnE2P7qwKSHv?=
 =?us-ascii?Q?cCbqHNZqoRgi1n021WTzecDiBt0ZwNjCtUhXXHchjTWlAZodG2+3P01u6qqj?=
 =?us-ascii?Q?4c59eW9RUTleisjZstw4UhRbL0t73ubOKNrtnrGqcM6KGh47W5c5rkX3He+5?=
 =?us-ascii?Q?Fa+seIwJWdO6+HWfGQP03JLVQ14W9YVl5SwMVG121XExIQUuwLpAiXcCfZF3?=
 =?us-ascii?Q?ATRerjlZklctSpI9fwILKE0g7Oe5spylqArC0VInst85fwPznJ1cUdo02qY9?=
 =?us-ascii?Q?y43XGndBk2uZuqS0pwUwREgFHSZXry1im+eYCyvi3HmdzNw+jIAFBdTdYa7P?=
 =?us-ascii?Q?h+s5uWTrK9qCP7Z+3wGkW35hFOnxLu7kp2iCAUAHIFV8FgaAYWebHXyteSem?=
 =?us-ascii?Q?ebYywF7p3ZhtxI+wqFdfNZzMcJ/pcyhd/dWsIwgIZYEMomeXjxbFLWfL2UT4?=
 =?us-ascii?Q?DRojAb7elBJtz4TsqPVX+XjbRat1hSRRx+SuEAlNyR8ep4klr8rWWrsHm/IH?=
 =?us-ascii?Q?/27kzZeUAUky3rrNG/4qzvUz8wq4bl9QNMtJofFYoZUsjSQUSrEwuUxc8DJA?=
 =?us-ascii?Q?f5+Kc/mFHcXikyxIFJDIROlVp/W51pJxEeGGFrtTfYOn+FKyUdamm4W0WpAt?=
 =?us-ascii?Q?olFk16tnHETtlq5V1ZmGZXVDj6Zh3DiC6xV/hHzi+vDleN8D/ItnvaRBD6VV?=
 =?us-ascii?Q?HK3y0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WC/pL4AvZACiShZyLFX8/kqyH4/BI0kw3sA2ltRC5R5JgIYCMxLxvpB81Vj8yksfaIqvFX6Nyi0hRI0l/y0g+ID6/GMy0mKI4maYKpT/nt5thUto33K/fp/NeksbrHaS2QfmG+npZcT0KsPI9rqfANdsALFdjG8MLV2Vdam2+UUDjNshrEWNcNXm9M44hETfKkz3EEu7XN4w08QrAjsfwBec9l0SmJp7LfrEi1l+zDFnJ0vP2VPHt7cotWAgsxQvKSlVSU6P/j3BPeeuuAYmXQDLwSOrlooMtRUqaWKoWXiYbqGyqNVmGbCDnhRLh+5lmnfYTSr5WMoj330lmgP0f1IOeeL9fKESzjTVOPTuzG7cozENDReDbiI5nUNGVE2lqqife98bDOzOZCSR5HYBQZEw28pE+dJ4X8wpr9cqDGu7u6gR/8pIMwbMSdpVYPNX
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 12:59:58.1817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a013be4-b711-4275-2c0f-08de6e24745f
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR22MB5088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_050006_058636_A7310596 
X-CRM114-Status: UNSURE (   8.16  )
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

Define GPIO line names for gpio4.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index e7ccdcba2d5c..30181b5132a9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -72,6 +72,18 @@ lvds0_out: endpoint {
 	};
 };
 
+&gpio4 {
+	gpio-line-names =
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "PWGIN", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "";
+};
+
 &i2c2 {
 	pca9547_ddc: mux@70 {
 		compatible = "nxp,pca9547";
-- 
2.49.0


