Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480F8C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+p1xIxTjoB0R0HJG+ptBAqBKACDiWuuaM4HcrMn0Dlc=; b=bX5ovL6+TrhhGtFfghPPZFuO1V
	b1XnG8xb03hYWG+6o5ExoWnbinnTz6qZXsItsP3cKjczuF0OLszSiLxMIfXXjWon9nyVxeZXe/5J4
	8t93HYdpdSyom9n0JqfW2QWIGeWOmd9D0y1Ngr9JGF4lXoFgeBN34yH+v3mCO8Wzwf+zKRBo4g1oZ
	I5kJPLGbwmEiLzpROlInsTviJllHifgRj00TMJHInjhLyNQLxtnMIlmjYfeZttW0crlHCe7cSqJi9
	K8TagnwzAlozicipTDUCUO1xOCxU0dh/7tWGkrytO9rBBs5A5GJ73Cdvr30LPim75sXn6wgq6sNGI
	KE+IqVTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHV-0000000GmEN-0IWq;
	Tue, 30 Jun 2026 11:05:33 +0000
Received: from mail-francecentralazon11013039.outbound.protection.outlook.com ([40.107.162.39] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHQ-0000000Gm8o-1tNh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:05:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgqjjdNsTnAiFd5/R97yrRotnq8W5Its/LyNbVk92NMaOstc0UuQYjIumFxVesRdxz4pPMUgVS99lhXxB1ilgP0lUVnzjlV3xEUNV1/yMg7fezP1SUffTFteOJG/GGSqktlYKzof2hqTfbpVtImokAoaR/DEyFxG56nWVSlfzWpmyLgO/YftFz0NjdBWAMfFqn8cIJOSbwt2sCuv/73eVInao+POLCTfjS7wTsXm2Od79v/mnSUW2Vd/68GKJXKkwDYVMcW0YBMnZj63J4PWPPRxwQL99je1suzobbEr9xlOPqmATWHURbPaP9hATvZI9gMiKpA2ugxIdfcraGXICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+p1xIxTjoB0R0HJG+ptBAqBKACDiWuuaM4HcrMn0Dlc=;
 b=F4q7iQYAjb1xQfuJ/8nlIeuOjPoq7HkQNjxyE285Wu6EAFx4i3IGYfcIIdyBR2bYM8/nndxItVrlYomyvLfrH1x6r6mMuGM929Ct65JBmV7RB1rsDAZKONNdG6FQVuKROOw2VdSj5UshNG59sVtfrWtFq0YB/x5qLccIg7UWtHEipyBuWN+OCt0SmBzphR61Z8BJFqGOwGGYIykKF4IWeRJQobqywNkwpxx3PmQ2aL0+sPkv8lSjHDbiRb+sagznLJztPoib2A2mDAhHJIVAnrtBmR8qWjsRnaYxVT6N/AGhfZC1ssCJ3IaALOW+aY8+A0OPmZLjI9lqvl+3/07erA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+p1xIxTjoB0R0HJG+ptBAqBKACDiWuuaM4HcrMn0Dlc=;
 b=AnKN2k5okSRK4AHCSALW2RuiBfHZBcU1opeRSRWGK4/e/v40bkeb/kwqMcSHTOp0wGTKJ0DmKUcfCagbncQcbJ4zOaOXl176WlPlvB88e2Q3sJib4UKM3LnPXP+Yv4zrEFaGeE4KBXUyPZanj22SUb/GLJjfQ23OUHODD4cjOfwAL/QMEtFzOhbi4lj/7uhGQjrPbYUYVTfXYPuWrQ2mzTCcw9+Kn2CDRq78eu6lvA4IExRwEjougQA2iwoJSBvEPutzB3edsKyrRmQMOUj/aXE+4pQmukqOb2No6n+QRkFpBN/6ToJ5PAudpoxF236DMRponb2T8TE2DDLsNdamYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DB9PR04MB9675.eurprd04.prod.outlook.com
 (2603:10a6:10:307::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 11:05:22 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:05:22 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: ls1028a: describe the Lynx 10G SerDes
Date: Tue, 30 Jun 2026 14:04:56 +0300
Message-Id: <20260630110459.516364-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630110459.516364-1-ioana.ciornei@nxp.com>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0331.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::17) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: 218f0472-bf31-4d46-1147-08ded6977ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: gN2/51pQiP95einQoM1NX+ado1XrBQ9o1851iKJMkckfULx0WoyRGD5Jq73RkNMy2h3GBpRjQx22ReADpFlGZERklpqbPgdpUpiWhT2pmOIkEgPzdqNMZUfNaUZSlS7aEoONmHwK7eezJOBhFB/dRBIPre49rIeTFS733zpxs5me6C52AuGoTb1o8usBr3qBK0SRI3pLWYRVAwXaKybdtzbfbm0bP19QaDsTcUwoFBevMirUK6boe/VekkDWL+wczLCAgka8mRG+aJw1GnFTQXMb1nAx4a/gSafWQ8fdDwbGHHZixp8f3IsI9pWh1KbY92m7/625EZZFn5uRKPLQN5DI+rqAOs4eRiyIaXhdUDAE1Cr1YheV8OEXrz6BbgL9tHUSXgNjNYd6IPMNbG1ATwt+r4FAuppTeNTnWTWXrmI040VkaqMK02GskVuR2Xcek+PgOfCwH1VVu7IdYJgIQ3dfnUGYXy0Ua4HTk1B+WsSzfbKXIUHkWcIlCBWAmylMf/JvPKzg4Gu2m50CFZ/V7VTSsXJThEAzSJG7PeQOO1FLCc1GFA12wPzpwD32VnylSaqnHgjSgSpcILY3H0irV3VLxQOmlGPSgbXYSFgyKHZyE4hjducQMgOZjJdj/p+ANXXeuAZ877HY8AXvI3U/keQFew5d5q4Nfu5Fuw/zxXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AAKYrnEjjcvg+XxwaCVUBojYkdfI0Yx2YRkaEh/affN2D08gXFQ8mPzH5ous?=
 =?us-ascii?Q?54GrcX9erge6k20Ijyz8gsfoe+NDDj9F8C+/h4fYHHyalkcwQr6PhSxoybXb?=
 =?us-ascii?Q?cB0Og3IkvEVm8n3M14XBktXitD7T6d8+EgLGVY1LTe3GsteOdxTB7Sh++Al3?=
 =?us-ascii?Q?Vl9BufyX82/CwFavv7DOgQvOiB9xcpg+Em3Tx5H2Y9tBec4+M7REAfMCllVQ?=
 =?us-ascii?Q?+ZyZ60XfeYvwVkisNvbO1pKTQCD9qythcxVk56mdhhcOIc6snnCzBr2rhIgu?=
 =?us-ascii?Q?qFBwNx66tf6W4kqdckzhZQ5g7jbd2ROurlnd6+J07ejrY8XG0216roRWOETh?=
 =?us-ascii?Q?wDn9Jq698sv1uIvwAWrLgkLU3ulRgMmyqNe7D+nYIkiNppoETig1V4EOpBAL?=
 =?us-ascii?Q?uxFJ9kSHqrWOegVBTQbHmZmFgL/lenNyuL1T7KIbR0B4hL74Tl4cuit33wLc?=
 =?us-ascii?Q?ghIKTNyOY5OdKENqs0nogYPwsNl22qgTRbq8v1TJPTSVji65IsoCRXKW/g4a?=
 =?us-ascii?Q?4D67Ehex1Lxej5+zFzjYny4LkZmMZBai5fd8s+D+0NleiBokievfT+Tk7Bed?=
 =?us-ascii?Q?TQx2PApqFI3VCJA5tLxNyMeNoxBZpewmJBVzcN4oGedzEZWigt0T+qXHBBD5?=
 =?us-ascii?Q?yDBf58xTBw7upmAudffELJ++zl+N2D9jRZi6Z6uAtBf5yH+eEneuEGEKyhAj?=
 =?us-ascii?Q?l/GukiOQKivXZKXCLvFjYXBTITh55laMdToLP75jmlmYVyiRvnn06tgpYQCH?=
 =?us-ascii?Q?I26fie41axdibrs5sgvyiWflP+xOkNFHA2nb4j0syO+FePIlAlWcCmZdrA4J?=
 =?us-ascii?Q?Wgq83uwLXUX/yFaLk7jbRxgYKOfc0IxHyGQsGlq+x/0MPMcSU90Ux79/ZuwH?=
 =?us-ascii?Q?7oQLTXftqIBD1sNMhJdJtgSOBa+fLR+JppbkKXBPQt7avfKI7L9Gb5+bJm/A?=
 =?us-ascii?Q?aF2QwB9ZKwKdwRSQNyQ0lAtnIJUxwIrhxTuNHpn2V/rJX1AYANJclJSnBbnh?=
 =?us-ascii?Q?QL9OGSDDlNhgotq6MQ7xgxeFhJWgGWkW8yESXjFRmi5mN2TaQcNRr19XHOyQ?=
 =?us-ascii?Q?O6DAV+HBH0JDXzcUwaF3f4NYh30rtP1uIewT1xi+zCB7Ls970SuJwV4a+inV?=
 =?us-ascii?Q?XTVKvoVI1LMha11vxRDQwpERjvzayHBJpgtBXvsK+ZsBvsLcPDRdgMDYg4+X?=
 =?us-ascii?Q?nFwTTmfGWIIJkIMTqJadeHfUgMDO8u4QJkTY6QryijcnEVNAwYOBc3NRN9gQ?=
 =?us-ascii?Q?L98fJXtCHjiOw0YakmqUTRzV9NICAnVirZzpZ60RCrXx4jvqWhmG+ui63l2L?=
 =?us-ascii?Q?XewF2eQxUNtFxQwaXAJXzUMiSINM76MS1m2IfOMruZ3tfg7Y8odoypyWAFpk?=
 =?us-ascii?Q?ZXDZkxBwijf/NdXoWYe1pfnOBu25Rk8xyd5oBtmOntTuSNef2ToxDW0rFg9r?=
 =?us-ascii?Q?CWa2nwKOSZqKyPmK+Y90e45fkLk7cP8hIaCWWWKerYTauf8BLEhI6Q/5qGk0?=
 =?us-ascii?Q?yV89EOuESRwG+F6wmTd9wZgBmebedXApb/QGCaFUhRYdx/zy8kJyEzybTDM0?=
 =?us-ascii?Q?P0pR5MS2smgdOHcm0wa9S8TJLcAtYRH6Ab9qymCQV43sFuyLqQm/hzuov3/B?=
 =?us-ascii?Q?6P1qZ7HnnXNZk+mrv4NsQL6b6ciJBmyPA6dbQqBahfALx1E2sqLCMsAPKmY0?=
 =?us-ascii?Q?OYVHPi9+dPflfqfjGN5X0gWPcBo2hMI6ukrKdgOlhgUdVrt7xNQnmW4TVanE?=
 =?us-ascii?Q?P86PKk9rKA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218f0472-bf31-4d46-1147-08ded6977ac2
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:05:22.2887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yvrVSVPw+P4q4XK/l09BawVM4q+ageD8mw62xabeD12WR6hgLlxAWQU177DO0hju1uSWMoJR5KUgJFmjlCEgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_040528_499176_90143A2A 
X-CRM114-Status: GOOD (  10.31  )
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the Lynx 10G SerDes block and its 4 SerDes lanes found on the
LS1028A SoC. The node is left disabled at the SoC level; board DTs will
be expected to enable it once the consumer Ethernet nodes use it.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index f4ba3d16ab86..b4abdb5f906a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -250,6 +250,35 @@ ls1028a_uid: unique-id@1c {
 			};
 		};
 
+		serdes: phy@1ea0000 {
+			compatible = "fsl,ls1028a-serdes";
+			reg = <0x00 0x1ea0000 0x0 0xffff>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		scfg: syscon@1fc0000 {
 			compatible = "fsl,ls1028a-scfg", "syscon";
 			reg = <0x0 0x1fc0000 0x0 0x10000>;
-- 
2.25.1


