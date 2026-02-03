Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B43E8783A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8LAyPmO+VzQkVLEDy1YMMHHGNzE7ifB/R8XYQ60wPvQ=; b=tWMIDsR8/gAa7zcLUVi0s08ixF
	j5MBId2eLiIz/4xMVPiY8MAVPFfpyeCVN3sTzjf5oKTfVUQb/Cbg1XBaUP84WVCiQmpSJiOvCh1cx
	NHSVB4Dz9l8Tb98/zCyinlxPIaC60SYYjAet+9+SdXtz6FkYMhQuwgBwlFGueD/BFL+CDRSXD+tBj
	AByTrzgDmye2iMsjs96l6LgRsJBLIyQasxcAjAKUlBtZfN64Y9+gaYvSOwJeOi5tWVubvIGs3BG44
	BnfhJcRExdTsjdl9Z+KjZ8COadfLtV2vajzVOmkN+xEAunqI6KOcp3h9OQP/u/GImdyKDqP80rwGv
	x8ok1clQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHIc-00000006kaL-2cxA;
	Tue, 03 Feb 2026 14:22:38 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHIZ-00000006kZy-1A9Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:22:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBZjRiACyxJQVfS2+tw4uMHFeIh2ffRj/ZCYT/tJpxxv12mYJB4kwpWBErsLo+d2xt5pbrGjRwsxnXj5d0g4C5B5yRwauPBSWwBIAZV5ml58QGnNia4IPa4yJX72dZrvLjZw5SWULV9t0TtdeGnlDETIqNMKPoMido6Bx7BA7WItHq0Ip7ZG7bum7q1wCHMCh3BVBZkle5uJueRed5K8KnzFmQ/SULP7KdHD2hvdfbNb8W5VCfJWfZIjHyk6ye9slgzeXI7sIYs/DC1okqEPCetz0bpnjrDl/MEOh0P8UVIXlIrP6ROYne8Eg5L1o2xOR79B5Yeg3SK+TV/XgzVNeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LAyPmO+VzQkVLEDy1YMMHHGNzE7ifB/R8XYQ60wPvQ=;
 b=oHNVOlpR9UnSfVVlq09JEmDGH0e1W9SRx7Pva5/ctAJVinPJvpQsBCqsOCqkigj4LKkDiCw+NZU5uZ7iwKha9cuj882j6QsLHdN8Kb9AaeW3vRtwnaV/U1/b5qldrkRfa74/7ClDqzwt6vLpAKFtMx2aRnZ/Oek5DEB8w32b/deIBiU5jCgxWnrbxnPRD9LqBriRvXSm1dtOFBPdZ0hDnzaLrCP/XGdzMSdlwtjtK4KiRlSMi6YbfhMqASaGUedq3q48uCmu7dERi/MEbv0i/ur1P6mKopXESdOqlfe64UZlPm2tLUGvg9xjfQT//0ODUOUkzaq/m/BQFdwMBXEVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LAyPmO+VzQkVLEDy1YMMHHGNzE7ifB/R8XYQ60wPvQ=;
 b=G7/tU0hZIbZdsdHKlp9uLUS0vuaHY3ElTYZTquiHR71VFPZqbuorzqiaAPUswNzSuoKzMJTqzJ3sBSa1uqkaB/Bz1pcPwZHxAJTWuZjRGicfCXIBdtr7o/FKlzVkIhatiZI90MwF6wVD6XlkH23G51SV1XR0CwGDU9FN+9IFwAY=
Received: from AS4P251CA0025.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::12)
 by DBAPR06MB6725.eurprd06.prod.outlook.com (2603:10a6:10:183::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:22:28 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::41) by AS4P251CA0025.outlook.office365.com
 (2603:10a6:20b:5d3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 14:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 14:22:27 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 3 Feb 2026 15:22:27 +0100
From: Mario Peter <mario.peter@leica-geosystems.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>
Subject: [PATCH v1] arm64: dts: freescale: imx8mm-evk: share usdhc3 setup
Date: Tue,  3 Feb 2026 14:21:58 +0000
Message-ID: <20260203142158.3929433-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Feb 2026 14:22:27.0767 (UTC) FILETIME=[86355C70:01DC9518]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A61:EE_|DBAPR06MB6725:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a37e7e72-9c61-48d3-a3af-08de632fa8ce
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LGstO3ZOk33OQ84IN6Yu+SAyYdUv3foq9AD0WE15BMjCu5N+OOHkb6gVvPNY?=
 =?us-ascii?Q?EhMgAfIvwtccfz4FWJ5bwm9HImIala7WNCxxobiIT6Ll4kXKMPIuQr+tzK9K?=
 =?us-ascii?Q?aBdiJ5Ag3cFPXp3ddMeWl9Z0eIoF55MT/+KF0DTXW8SQneHsZndVIEPdzapr?=
 =?us-ascii?Q?BKJCsBRyLs57zLqu/gcd8haNoxPzk5b8pJCc4MXsfxo+JvyA9L56ElHG+gVN?=
 =?us-ascii?Q?Tkb0w9gQPzSO6A+Yqe6zDRM6qkFGKsiT1/Lv5pJP+fnCrFIjNviXAvI4ErL5?=
 =?us-ascii?Q?NJNeJPYtvNsY6X1/fu2R8eCKhS6CD8soibMxKFTKCToyJ4bAtvNJBB9L6gSH?=
 =?us-ascii?Q?Q+DRJIFCUWbAP2GvFTNgvgfxs+yggJUCYGnuy1L7D5HGVr0iQ2DNSwnN5meC?=
 =?us-ascii?Q?Q27TvvQWx4MgyxhfoRiNjcNp1zLGNxRWRWUTxtgwfASOyA7Z9F3XSoMTI2zf?=
 =?us-ascii?Q?SUoOjXJiG/BfYIAqQsZtYOw16DJNBk7o2N7LQ3A7t0fNxeHRB2O2rAozCAxo?=
 =?us-ascii?Q?xJHgCFImfW3IFbkURCP9IsfTnv/l/Gq4wUe9YFRnSXJ29oXGHfFCdAOK0S4y?=
 =?us-ascii?Q?MXM/tFWKbtFBh5+Cf1YZnZ8rafDJvI4ETuzyys0KPwGTOf21inaXirFORFXT?=
 =?us-ascii?Q?BPwAtjpYkwc2VbMUIwxS+yQ6Imu1/kYTwAuZnpbkNslDivn68Qz2F+YhJ21g?=
 =?us-ascii?Q?8sNJlEUVuTosg7bUrM9gaIrxaO32HM8DG/c7AMnhv+QE2Y93lZmjOhp4ZMjt?=
 =?us-ascii?Q?LYny8UlJGLNauqyQD5qzVWDX8nZjCaZUyCysoIBb3dXl2wG3ybXz+GhljZvA?=
 =?us-ascii?Q?Kfpr1cQFxpRHAPpDIlGHzBZ2Z7G3BAlm9MqompsgFpF+a3+0G8kGgFL5oay/?=
 =?us-ascii?Q?08GgOCH+KQMl09wkvjmWSTussnaVLg0sMZ0XtkQYknd9qnG0ujyA3O/jV5x5?=
 =?us-ascii?Q?0F0qLfKwxSXZIVsIc+vqmggub7u9sSn55S/hdeGN7URwix+8tdwlJ5fOYZk8?=
 =?us-ascii?Q?dBBNwOgpiUf92wy1lolCoIT3F4q57sYiHLSskYdSuL9PcEzN7e0ugyPaNaaB?=
 =?us-ascii?Q?kyFCI2yxYxLh1bd2+o+6SzcqmOMuN7iKYyOVkTRx1/mg2ZX6A4lH5/y2tacO?=
 =?us-ascii?Q?SYCmYWzzthsdS/eSm7r3+9lmfMz9j1lv5Gcjxpx4X6Rzk2xUC3ETI2TW29QE?=
 =?us-ascii?Q?ueMLNH7w5zZay6p3r70XqVUuS2mDhTBnBmsNRxvKED6TBz42YWAg/sWz6S5R?=
 =?us-ascii?Q?DbuV9V5XRIkEOqSm5bY0egj3LGzcyRnE/fJyANwlLne8vWg1x/UqLaQaRcB1?=
 =?us-ascii?Q?tWzxZUiqgK10JbF9XhxsaGvqMqJEOADv+jneaNVY3DIITs84y8uyaIyQGphQ?=
 =?us-ascii?Q?GjzDkBvLz4rZ0PiWHsHDV+0rI0ZGn2Z9sZ3nFonR633vnNSjq4C8m7LxN4XA?=
 =?us-ascii?Q?V9pyeADl92FexQ/s+kL6X669mfS/K7Zwv4KqvPykZQBUwb6yxDU/kb0rhj3C?=
 =?us-ascii?Q?QWrgrWlCvCsfbQxVnaQhXXCpnYK9rYEkm6U1pjEDyBMzw/C1CywGizIwBxLw?=
 =?us-ascii?Q?hmIv6sv62MwwbHAIwA1WevDMn08aP+03reFxlenG4UKbvcIb/W2ceH0KtlLr?=
 =?us-ascii?Q?UJRV/zr2o5FvinH7i37ijl9CGPwm3Vbak4SSdLvFMHI9bjaKlHf1yysHvrwX?=
 =?us-ascii?Q?PufaEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EbUq151PiZYjq5WkQfNT4KGAIVUW3WzqjytN6gQ96pIns0mmbMhHqlrCLOh2jSAA5GOnMZNBT6owpCUIZ323k3LQcd7uDA2EK7yNlrHCNzB5bNqJKi0r/GqhI0Zg5iiSYqxOtKUQKzsFvD0fMZL2DZbWo9nloAH1A4MsweNIfDwyRbYhKG/j0uK5euziCG51A/pbeAh/3KaJOAs4e6i/V2eZttnoUZJFDicH+/RGKTDThmbr6tBqAFwcUuXyY7ybTemDn2mobbZkuBnP+WoQfqlwHq1XJkgbThJ7jtl+5ubKVG1UZx+cCFjeYF83BT407MMPXPRkn90uG8n7oRbicuulVwlaz5kffgpWDLaVQkzSPYEaK0oYw20ZdLqcGMwU7jQrzuAh3jjrpQlekdik8MoOlxGaOcCOdSgPKb6Kssb3CHRhBsYg6e7VCtV4dojy
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:22:27.9562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a37e7e72-9c61-48d3-a3af-08de632fa8ce
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_062235_519502_8C9FD077 
X-CRM114-Status: UNSURE (   9.88  )
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

The eMMC controller on EVK and EVKB uses the same usdhc3
configuration and pinmux. Move the common node and pinctrl groups
into imx8mm-evk.dtsi so both boards inherit the shared setup and
avoid duplication in the board DTS files.

Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
---
v1: submitted

 arch/arm64/boot/dts/freescale/imx8mm-evk.dts  | 61 -------------------
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
index b68954bcc383..002ebdeeb2d6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
@@ -53,18 +53,6 @@ flash@0 {
 	};
 };
 
-&usdhc3 {
-	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
-	assigned-clock-rates = <400000000>;
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc3>;
-	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
-	bus-width = <8>;
-	non-removable;
-	status = "okay";
-};
-
 &iomuxc {
 	pinctrl_flexspi: flexspigrp {
 		fsl,pins = <
@@ -76,53 +64,4 @@ MX8MM_IOMUXC_NAND_DATA02_QSPI_A_DATA2           0x82
 			MX8MM_IOMUXC_NAND_DATA03_QSPI_A_DATA3           0x82
 		>;
 	};
-
-	pinctrl_usdhc3: usdhc3grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
-		>;
-	};
-
-	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
-		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
-		>;
-	};
-
-	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
-		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
-		>;
-	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 6eab8a6001db..6e53828b5d30 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -649,6 +649,18 @@ &usdhc2 {
 	status = "okay";
 };
 
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
+	assigned-clock-rates = <400000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
 &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
@@ -839,6 +851,55 @@ MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
 		>;
 	};
 
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
+		>;
+	};
+
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166
-- 
2.43.0


