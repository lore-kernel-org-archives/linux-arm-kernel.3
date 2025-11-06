Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F752CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niNE352IkGkIrvc5Dyg3+WvbmS/2kObJo6TSjxa1OBs=; b=vTi8Q1HyF600/SzNjT+csMG0Zm
	F3gohNDEs5H0yzvjYXE2Rl+WlUG4v/VWHPppOqOMBrbjDFdvZbis9Vb3RsXvadr2106vYUFd4cFH+
	XE84ZTztSEVfD/2lNyRI5uBnkLqegOA+PsLCXRHUsScD5mnZr8NV5AOoW/g2NygD7pJH+sK5i3ZRj
	V5RwWAJHdSL5Yn5cg4jhCpryBfRG0f68YgONiu79e7ZKZzcSwSdxDQp1x20a6v4cxiKQZrcojgGyn
	bPYkWSiaG+oMKT3n8+qIHAglFGlsbTsm6Mqrg/+LEaLmTnSL/UD2crKTAURq1+VlFuA97TSug8/TW
	CHGGWBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0ji-0000000FfUD-3nuG;
	Thu, 06 Nov 2025 14:13:14 +0000
Received: from mail-eastusazhn150120001.outbound.protection.outlook.com ([2a01:111:f403:d900::1] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0je-0000000FfR3-1xRX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:13:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfoPGzPfT8a95eGWZtkLQ6qwFXk12kW1LAqylx8RuG95Jsu8Q71SSmmL8Gq0aV44HW392EGecm+zMV7paTpad4jq9gTM6E/eKCf6HDE2chRiuaYbrqwAoNiC2E53SbHX6eLMsULrJdc4bz1sjpZbuFGzE3zs7mglfDLBjg/I1tqZ1ALG7FdcAIy5mLxymPsaZUahlm12uQX0Rl0Ha79997ELrfq7EeNq/SMTEk7WoDE3ETvfoe+Qk4ZWjvo/SIxSbg1M2deSeko+IHjiWmKt03pna3L3rJovf/CzWPr+VZ4ijRtHsNyRp1n9LAj2TJ7Iqp16Ed2uP2w2rt0QlgmEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niNE352IkGkIrvc5Dyg3+WvbmS/2kObJo6TSjxa1OBs=;
 b=APFjHqAJNnJZd52/S5V18ucrVZJ64GfNSub4Txa06i5dWDH6eeFule96nsV5YhpdXCUWiK0n/UDAVjH8hDqS+Pr1dY/ghwFXx/lw5Gjz4rOJdk8oS4utGwVHlNDe4c1uL9GQIwSL5qUvaBPQdc21BZp9QkBmBjRu5YKRQ/lP6O8p3VvwW49ugF29oUbQSGMtoz/mn+RzjeiVfh2VMV7Xd6hTGsY+bqBZfw6qkubbFOb3xpzuBFu7BnQaB0EPx85JTfj0BqqS2wPIMIXo4DtS22vAo8iu/nZKUpBIA0ODT0HkhFhOmHhljIzu2TgWq0VVdjEn8hDwuhFObN2heVCwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niNE352IkGkIrvc5Dyg3+WvbmS/2kObJo6TSjxa1OBs=;
 b=dWagYD6jcztcp1/Tcr9+uAr6DKgmzfm3Z+JTuZhLlx7RHw0uEXTZ5HjOSeNkHxdizxrTL/nV6kbDRkfRCwze6iUxZWihRQP+D2ekJqfSMJWHN39wCgYabeLVuEOdh4y6Oa4vjcOTIaJE2swmETJQ2LciIse57PxEIRBFkGGLJBE=
Received: from MN0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:52f::27)
 by SJ2PR10MB7583.namprd10.prod.outlook.com (2603:10b6:a03:537::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 14:13:03 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::bd) by MN0PR03CA0020.outlook.office365.com
 (2603:10b6:208:52f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 14:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 14:13:00 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:52 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 08:12:52 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6ECREQ1335893;
	Thu, 6 Nov 2025 08:12:46 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 3/5] arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl property
Date: Thu, 6 Nov 2025 19:42:25 +0530
Message-ID: <20251106141227.899054-4-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106141227.899054-1-s-jain1@ti.com>
References: <20251106141227.899054-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SJ2PR10MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b717ee-0fa2-4f35-636f-08de1d3e97d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|34020700016|36860700013|7416014|376014|1800799024|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8OPW2CtZ2pWTyEwOUmYq/PHjsEmHic3fwmGohT5S2D+cvDci+47in/fcJk4A?=
 =?us-ascii?Q?mCstN5zpmMBAqTkPPRS7tFptvONImVAhBqFhSN/Nsd9QhgOrBY/dY5f8H1+O?=
 =?us-ascii?Q?3vV7lgiCiq0KBcv3hNVGZW1oQTyjvpuepQJkVVEZ8V2Zjg9t9W/t+qIrJjNQ?=
 =?us-ascii?Q?eQ5amj48Sx8P4iUVuzWxScjfvzFk/odQgDBxMMK6ri3FN2eE6wxTkY6B77pf?=
 =?us-ascii?Q?hDS8MMzCQtIH6khjk7ZG+BBBhJww48m3l8lpc4ufzb29doxVERcnO+oQ0g5C?=
 =?us-ascii?Q?KG3x4ouORpXTULV5BJJHiyOYzIiq60cY4gHR7XZPOUB3dUUg6GGWjcF7NIEu?=
 =?us-ascii?Q?OKrR+AKrNByEZRdR0popIC8uoYw57u9snawnjKucvmI5Ten+kH5+5NO1KF+U?=
 =?us-ascii?Q?fgNHayIg70c0FVtABp+MyQVgOAiOTHNnp/nzeNV56+sO3xBLTCbA5DI6JBKx?=
 =?us-ascii?Q?ErsoTfmKSKcwLuNgSsRXGvTu9bE0vG7oH5/VqpZmUMT6TLBs1X5tFPdJaM1n?=
 =?us-ascii?Q?tYkMcUjFJX519XqCtGgWSVV/hnM7x/OuRJnhBueuXyvqPiVzS3EHcCiUYwzU?=
 =?us-ascii?Q?r3TV+7okE9LZwBLz+3qPF+XFwE5NiOfWfdYNL+YHDHfZy62+L+7CpDSqhckF?=
 =?us-ascii?Q?FG0uTulmcCjfrKnbmUWwz5dK0878n/LEIhjoCP2HsU+n1Ju/qfkF0R9lrhLe?=
 =?us-ascii?Q?k81T8gYCpE8qttLd3SLE14FgY/8bStGd5U6xcW+nqTgm6bcMqkpckx3x31ct?=
 =?us-ascii?Q?RzZ2xJiEDTYIID+psvLNc+T5tVgOgEprBQjiO5MPA/DdcXmIpY2EBf5+jGRm?=
 =?us-ascii?Q?2aHYrjCRxIVxKaln1fWtdBeMo36dPgh2zPOEbIcFE5UTaHRntvRzqunOAIQk?=
 =?us-ascii?Q?SHCDWUKTl/lQuquMRgQXrjQdJc5dtxPx11WUKb1FLbpZoCp2SX1nokC29WNq?=
 =?us-ascii?Q?ph073whE68xNc3bjxWVOnglDpV+ocejZN7UF41I79wXmnW2efnGGqHxGMW0l?=
 =?us-ascii?Q?JZTS+T1RhWPRgRqHyABU0pTsRy0VxHevTU2OObqFdlTBP6LXGrwIUmYJQT+1?=
 =?us-ascii?Q?DviB9qYJBX98sW5X8ETm2qXJOTBaBu5EwXRYEgZbVuJg9xils8faG6lr0vJl?=
 =?us-ascii?Q?4+7Iz36H7SpdE+P5eFv5kwomL6S20tLOXl3SpkzZYqee5yndy2LgKWwR4piN?=
 =?us-ascii?Q?VX+3OA6x/wN8k/22oxw1PmTZSiumwrbuA+xykq2KbQ/xcD47eh8VcbU8wd24?=
 =?us-ascii?Q?cZLMBn6ytYlmxd4sMyy091tn2YU3p/MULhiDPIoJzf0PtZhTaxReiNyZWZYG?=
 =?us-ascii?Q?B+aU1X5seak4fWVabVyGyW2w/wH5wAUCYt9SCl0fA49h3Mg3457R4+ZOrYLx?=
 =?us-ascii?Q?XI3r2rm1xQhQAeqgfJCT69qb3qlZxNep/NeP8AKYG3jewum2I7nZyl5L/FoC?=
 =?us-ascii?Q?ZLdt/lFYmCuv4k/aT7IlDQZQ84jyue5wwF7bLRD7EcAC8exe7TrcIs5BGDQs?=
 =?us-ascii?Q?IVditEhGNm8TSFa3yY1WWEj1UHRbUJiW5MMYafSIjtyYiPnSOnFVlgWCsD/P?=
 =?us-ascii?Q?fuqwto1IrfCYWMSBenbiyFJfjHswp2Sglv2WFgCt?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(7416014)(376014)(1800799024)(921020)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:13:00.4654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b717ee-0fa2-4f35-636f-08de1d3e97d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7583
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_061310_503506_C954DB09 
X-CRM114-Status: UNSURE (   9.27  )
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

For am62 processors, we need to use the newly created clk-ctrl property to
properly handle data edge sampling configuration. Add them in the main
device tree.

Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index a290a674767b..2b6c033ae393 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -77,6 +77,11 @@ audio_refclk1: clock-controller@82e4 {
 			#clock-cells = <0>;
 		};
 
+		dss_clk_ctrl: dss-clk-ctrl@8300 {
+			compatible = "ti,am625-dss-clk-ctrl", "syscon";
+			reg = <0x8300 0x4>;
+		};
+
 		dss_oldi_io_ctrl: oldi-io-controller@8600 {
 			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
 			reg = <0x8600 0x200>;
@@ -801,6 +806,7 @@ dss: dss@30200000 {
 			 <&k3_clks 186 2>;
 		clock-names = "fck", "vp1", "vp2";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		ti,clk-ctrl = <&dss_clk_ctrl>;
 		status = "disabled";
 
 		oldi-transmitters {

