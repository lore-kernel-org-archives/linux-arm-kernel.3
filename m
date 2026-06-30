Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C94C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5O8m2nbmklcuDm1xCIeTpqEt4OF2JkI8nXFjSRcVLY=; b=TC1H8qayeT+3UbNKZKLI7Leef8
	vIU7U7EswLh5Oa/aLR0DYpUeVRKqDpDMVyp8Sutm7gJrDHtb92+PKZMw4l4D28TrkNh0b+cixOKJj
	lWFmTDBW2LiSQna/25KCMQlhmTfeY9iwsD7SX+Xc1qfFF4/0GU54fBFh6Upbflx/ao+1E/cCHHHQ1
	pQc0qUsJVy4h1YRWlP/AO0aghG8/PVP2YQMmDSZK6uywMubipj+yQyD63k25PDREsrGh/hvxFVijc
	APN6xlm05z8NZBFxb5kAVibglJb11fqArCLbDX7j5XF9xl5cKQ80qPr1WCB96IkJOSKM5V1to+lOr
	4KSz5LHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHU-0000000GmE9-3w91;
	Tue, 30 Jun 2026 11:05:32 +0000
Received: from mail-francecentralazon11013039.outbound.protection.outlook.com ([40.107.162.39] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHO-0000000Gm8o-1voQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:05:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LB768qSKwgM+pSUszMio9/6soS22Tq8aiEVecSfNTfsOwt9aTwQ4K58dM8bgJ7472ntMPWZjLJEt21d+lfsaoCkjmD1Z82Ib7pUdNo+GyTFSFPVKK7HcHR3aXGVFrHn/v/kv36z7WdpCJ/cgJyvf2Vrcc9ugMO8qf6bY76hhl0xNu4XbxFc2ARuz0gbklDN8PLk3YtiNW4U4d0z2Z2cK8w4JZaTK/OWoQJZ+dTcWZlHPBeNTm53XPN0k9aT5TrPpLH+p4NePgyymkrJsdSFkiW7zZofkuUB7aFb8qgDTRTdoyPQpjSclgpQkxHmMOCXE+GYwNf2V3HCZjo3qLMT+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5O8m2nbmklcuDm1xCIeTpqEt4OF2JkI8nXFjSRcVLY=;
 b=D+v+M/6uRyXBOJugULYGlSNyeEf04/1jyH+2KGLGI17bbRP41sLYT3T1Al6axxPmCHyl8Rz6zzgxavh6GHTQRqX6ogJ2E8/xVxdilcFnpB6c2jEcs6diX+p1cyRUD1wDoFRLt2X/cfI6zYcqOTxfEh1cbboUWGPLQiQ9G3LEgO1OeCHDvMlZiL9K7AQP56y9McOrZiCcKv/FARA1CEntW1HXaRlfN5sQoOXgZTHnF1aaHNio0aCMTvisV2uTmhExGx+R9CAN0m3nd/iYP0Qs+oiNY6qO704/qh4mXoBXe4d00kUs+mn6YyAq7O7I5GY0r7PdSd8+GJ5KWqjINqsdUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5O8m2nbmklcuDm1xCIeTpqEt4OF2JkI8nXFjSRcVLY=;
 b=U4boUI3RHxJfhyqhTVgyXO3vCwdDcDxeNytGBX44iwLc4xzeUXJbSiSNA+ztEJL+kNCheaQi8e+IWXzgv+uPNKPLUJqV5vusH+shAWLiouygkN3umx2wy+CXKwqRKzz+YWVV/Zq7mI1oEq/1V/Xa1LM/EOCc2WrW5gsbu6pnzkUwktFnAZEEp0BUL6NQt9MeazUfm7bsjncegtn785AxljpkhVj40S+WyXfgnjfSSfCQbhvlVUZ8zK97WG+uleN7uZ051Q87iUQN/3uYh+olW0TYB3vS2MeoQKmLAunBiSHFh97AuDqYhlxlZgBPljfF21icJ3i/JefXHB7pr7tVKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DB9PR04MB9675.eurprd04.prod.outlook.com
 (2603:10a6:10:307::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 11:05:19 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:05:19 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: lx2160a: transition to device-specific SerDes compatible strings
Date: Tue, 30 Jun 2026 14:04:55 +0300
Message-Id: <20260630110459.516364-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630110459.516364-1-ioana.ciornei@nxp.com>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0342.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::20) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0dc424-ac69-4ad7-506c-08ded6977936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: /0DB6a85cdQOLLEObdATIEEdnFDDJd7KgiBqa4fSAc8jJ3f7flSxiD5MCosxACfmh0lzFJBJ3Xk5q2WcdItXe1Fl5UVz07mWA5KkoppeyxB0VXRSZ/dCTq2mF3AjqoeG/RBYYyUUW6nba5X+d81dkYtMAVCkf7q2u+kEmtA88poLTfgzRfWwyWndipZ1eDec9qMBzShyqsGfYhGYGXReYgdZMjwL9TNV6RiGNbOdTX3dBkYmUZdMkVWvJeIz2ArMRtqa2ZOkG4EnLfu08skB7Dl2K9CCbRkN+LHW6Z/BMf5n+tR9dtZNpAXsWI+WGj5Q6ElS2cWO4MkMb/cjZuEhdJD8eQ2YbQSLk7dPxNcgr8UMe8uQdx4+fT+iO1oT5huWdoMink2LblWLmEB59VHbrHzOaA3xfWYnt106um3qIF1B04NryXeGmX8QV102zb5XYpejUolucwfExqx2CTVxW5XHztgnM2qrjraucbZhHB9mSZPzj8DnyEuTK/cIHLGJGjwFecYKaAhKz42hR792HI0zzErhmxw/WGAB2zNHPU0oB4sowwss0mX3EPpgM7hiZ7K9ypsdtbBrwqqInMr4/xiyYFXt8UE+R5T0dqCUpYvFmV1JpMycEiDWsVs0JIyVel+xOE9iixu8A3NiCjn0z5S8EW/nTfzF5OO1FDZKxEc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IstaPQlg+3Qnw4ivKPD8g3t7kUoWcwlYgWQG4A5TPIH192AhHsWfRsGtM3/P?=
 =?us-ascii?Q?3KKCtJuOv5cjaeC5ohsZVeP0611xDM625+sLldv0OIHS2T9PV31KaQps5b/d?=
 =?us-ascii?Q?y3cFNg4XD8xliB1HmFkeszzHkKrIYSTVUoAkK62J81F3OBhdE6Jyf/p+PAJr?=
 =?us-ascii?Q?z8iDCV/C7d6QryzNXlHTg4+z58c7sQmynq163SL0RsqwvhGdOYvkNrGBRKz4?=
 =?us-ascii?Q?LSjUJ8Afgb7FU5tbIZIgBAFr6i9tgBm5m1HH1TsCVuZpeEevK6svJLkOgAFu?=
 =?us-ascii?Q?AmgqKyS8yUGK+QWFIgGqFYTEwmkFHgUPJ8v8dwGAXnM8CbPCoW1em6U/u8kK?=
 =?us-ascii?Q?n4PECgFxC2XZxCtOvZRPVl+EZ6+AE0+hMrneQuHrjPfIAHbMSTQ+L18reAfD?=
 =?us-ascii?Q?8U8B+MqdDFgxLYR+yI0uYpaxG6C7t0pAVvoJXXJtYqwR+2fxMVIqEXRQJ+t8?=
 =?us-ascii?Q?16mM2BV6ijJV7QzhUc/WEy8/e7emn/rD1KV5TQyhURztuYsuf7d3fJ8/tDCO?=
 =?us-ascii?Q?JzePVbA0SUrfcJh50tRz2pQR3I+8l4NxxL+BEC/ER6O4lQ8Tf93VNg35mLx+?=
 =?us-ascii?Q?9+d8Jfj1Oe8pvLcpWSADnoQXk0R65XgJxrEHiwCG7/8iAE9dKy1wC1zZRfyo?=
 =?us-ascii?Q?QDXvRJ81pB4uXesp7VWo/alB29ELKlKmji5eWmxRgqt+wCyvTNTmmpx2nm5t?=
 =?us-ascii?Q?5PBbeNzyZrjTABzn/nFCfidZWt+d0RxuoG5RzC6XIv0Tg9elCPQFdLgc65dk?=
 =?us-ascii?Q?rIziHp1m1jZyVXflxYIxkXYNowJeb6fObsZO5sQEXW/bFSvkTS0MUIrVYGz4?=
 =?us-ascii?Q?PZvedF3bMdPuED05UpvoALDtKWpUZL+RYmeouvEcg8O8cw7Q3u+ezJG5Z44C?=
 =?us-ascii?Q?9mfhQ+NPcqe4Idago5tk+ph8GRBQc4L3VHjmC/AFurWlg9G37JrGRcrMmdKY?=
 =?us-ascii?Q?W86lOp7apNmBxULoHLxHkm3rHOvLdI5T2sJypS3RtKZc0x1lmihaDiTYizp8?=
 =?us-ascii?Q?MKYLc0stDcxRxVQy/nrvUTDXQFOyZydgRxSGbUzaVSDxYe6LaSTItcFjTn/h?=
 =?us-ascii?Q?RyO+Ht03QsGRY00muxjlBohd/P9JilTHvycfY77fz66IinrL6FPvgyOOKgrw?=
 =?us-ascii?Q?YNMRYVnByTnV+mHX+LCztoLoD4eQNLovyM2sSSEQaKUf25p2j0pLtyT21yQq?=
 =?us-ascii?Q?95CedgZ1szDs58jJIkmh2zB5eP6HLzpNK20v8EyTypoTwIfVAlxBkOsJwDrV?=
 =?us-ascii?Q?49XslWkAvjejjNt+qZg4Dw/wuR6LYShi/Rxj70ayxm8ysfNc8lVU71ZtuERJ?=
 =?us-ascii?Q?m8T7KRtnQ5gOXAJ/MUWurKNWdJr9Lpvjng08VH7HOWx9hluIuT1N3GqVYNXt?=
 =?us-ascii?Q?cx3xY53NQ9SYBXyYhJA+lBAtZACroYuqVCkitQT5PvBCRuxrH4oz5nJ1z/O2?=
 =?us-ascii?Q?TZzJ/5GrmqzcLgc9h60NJvWmLJJJJXJvJC8PyL0YtoBgyVorr7HLwIt72+7Q?=
 =?us-ascii?Q?+KJoYPbzZuQwbOZjpFCLs/AC98hr9fDUaDWXdm8OssKlJuHQj9NYETNGolVd?=
 =?us-ascii?Q?LfZIq68fAHiA0cmE76blX9TZslAS9DHzo7/tCsOfqL+k++Y6R0j/IqK21hvA?=
 =?us-ascii?Q?ZMLgnvXlQmTGxAVIMiNhGn4QaKPeDW6RmeR2CMEDkD1Vr35J2XjPZOu0PsPf?=
 =?us-ascii?Q?/9j5nWdsi1uPYHbUAjkleeMCpdvODH7wdgF7/NUoybD5fmgkmvEPhcqr6pZI?=
 =?us-ascii?Q?7N8qB/OwJg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0dc424-ac69-4ad7-506c-08ded6977936
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:05:19.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +68zeMmmikN3aI4pWwrHOgDkRAmPYqkGdqn8SFpA0/IL3ZHdHxziWcqIEAhGkf0wLBfEzS/qs3MHijbaxipkoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_040526_510894_68865C1A 
X-CRM114-Status: GOOD (  19.89  )
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

Align to the modern fsl,lynx-28g.yaml binding, where the SoC and SerDes
instance is present in the compatible string, to allow reliable per-lane
capability detection and per-lane customization of electrical properties.

These new bindings have #phy-cells = <0> in per-lane PHY providers, so
we need to update consumer phandles as well.

The modern bindings are backward-incompatible with old kernels, due
to the consumer phandles being either in one form or in another, as
explained here:
https://lore.kernel.org/lkml/20250930140735.mvo3jii7wgmzh2bs@skbuf/

One of the major differences between the LX2160A and LX2162A is the
SerDes. So far, LX2162A has used fsl-lx2160a-rev2.dtsi, but we need to
split that up even further, and derive a fsl-lx2162a.dtsi which
overrides the SerDes properties.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |   4 +
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |   4 +
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 150 +++++++++++++++++-
 .../dts/freescale/fsl-lx2162a-clearfog.dts    |   2 +-
 .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
 .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |  24 +++
 6 files changed, 182 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index 4bc151d721dd..1f946d3a4ec0 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -135,6 +135,10 @@ &sata3 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 935f421475ac..a40a968b9533 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -329,6 +329,10 @@ &uart0 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &uart1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 1d73abffa6b7..a687eb3e3190 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -621,17 +621,163 @@ soc: soc {
 		ranges;
 		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
 
+		/* Note on the interpretation of SerDes lane numbering from
+		 * LX2160ARM lane mappings for RCW[SRDS_PRTCL_S1]:
+		 * The letters (A-H) correspond to logical lane numbers in the
+		 * SerDes register map (lane A's registers start with LNAGCR0),
+		 * while the numbers (0-7) correspond to physical lanes as
+		 * routed to pins.  SerDes block #1 is flipped in the LX2160A
+		 * floorplan (logical lane A goes to physical lane 7's pins),
+		 * while SerDes blocks #2 and #3 are not.  The lanes below are
+		 * listed right to left when looking at that table.
+		 * Both the numbers and the letters are according to the logical
+		 * numbering scheme, and do not account for the flipping.
+		 */
 		serdes_1: phy@1ea0000 {
-			compatible = "fsl,lynx-28g";
+			compatible = "fsl,lx2160a-serdes1", "fsl,lynx-28g";
 			reg = <0x0 0x1ea0000 0x0 0x1e30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes_1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
 		};
 
 		serdes_2: phy@1eb0000 {
-			compatible = "fsl,lynx-28g";
+			compatible = "fsl,lx2160a-serdes2", "fsl,lynx-28g";
 			reg = <0x0 0x1eb0000 0x0 0x1e30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			#phy-cells = <1>;
 			status = "disabled";
+
+			serdes_2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes_3: phy@1ec0000 {
+			compatible = "fsl,lx2160a-serdes3";
+			reg = <0x0 0x1ec0000 0x0 0x1e30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+			#phy-cells = <1>;
+
+			serdes_3_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
 		};
 
 		crypto: crypto@8000000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 99ee2b1c0f13..61e70e9c6e80 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -8,7 +8,7 @@
 
 #include <dt-bindings/leds/common.h>
 
-#include "fsl-lx2160a-rev2.dtsi"
+#include "fsl-lx2162a.dtsi"
 #include "fsl-lx2162a-sr-som.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
index 7a595fddc027..0ba56b9819ac 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a-rev2.dtsi"
+#include "fsl-lx2162a.dtsi"
 
 / {
 	model = "NXP Layerscape LX2162AQDS";
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
new file mode 100644
index 000000000000..b9629e074d94
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree Include file for Layerscape-LX2162A family SoC.
+//
+// Copyright 2025 NXP
+
+#include "fsl-lx2160a-rev2.dtsi"
+
+&serdes_1 {
+	compatible = "fsl,lx2162a-serdes1", "fsl,lynx-28g";
+
+	/delete-node/ phy@0;
+	/delete-node/ phy@1;
+	/delete-node/ phy@2;
+	/delete-node/ phy@3;
+};
+
+&serdes_2 {
+	compatible = "fsl,lx2162a-serdes2", "fsl,lynx-28g";
+};
+
+&soc {
+	/delete-node/ serdes@1ec0000;
+};
-- 
2.25.1


