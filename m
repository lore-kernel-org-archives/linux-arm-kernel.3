Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A69C44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4SQ1OkMBXr1bngrnGIqekWhTZhQE9Hn1YHVXUaJOBY=; b=vj4aA/+fYPIawbngi9/+4PKENe
	7NYtj0NXQEtdfUUwJrTCFNmkBTjKp5UBqamOzIubz7GUSuMzbrBepClchj/TRZZOkviJ1P+TYktYE
	GbxhySN9tY7CbFc2zwzMb8QNCGockXgfdxGrX+ie61rP6CLBhQSg0tWAcW4SmBvVKpNc2fObTszIn
	lSqbOCrGj31SfxWFwHT9v/XaP8KR0Z6wTIztMFLo64k6GC9RWXJO84tRBrF+BpOZYh3G9OBtRkbA4
	4f/7TH6XlheE6PEc8JJealXUlavYICfzt6HTHR+KiGB8DcjZWkiYeZntJryOOueoU1sDVNXU3ymlJ
	etbIixSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhLI-00000002DyD-3z9R;
	Fri, 17 Jul 2026 12:07:00 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhLF-00000002Dur-3gTu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:06:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFGoNB0UOCtk2MUZMUwiKPdj2uwL7dFgrV7MgytE9yH7F70D56P5/o4me7Yjpa43RWcNqE6HJciAT13/YB3xboASqNJaNc0VJkYTRrNNc8FcG/Aeh9qAmRhJatyh1O5RypXPFwkCbt+9nfAaPYXyDRs+wsuoZswF44etMomHKmiGz/23CVzeyYx6pwIB2y411hu/jstik4Vvr2j+5KI3HzXU+zXAgnftgNdgKzgo/lSF7tWtMuV8HR5ScRzwnJA5eXIsJB5N0+Q89EWQD6mb8P3nsoRkh/rpDJpifRcgXiXyhGtTTAd9brw8Mw9nRdqBGVyxG8456TYk4IZ4w6KhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4SQ1OkMBXr1bngrnGIqekWhTZhQE9Hn1YHVXUaJOBY=;
 b=Ocg5QtkEbx0kqo6Wdfj+mqGZs6gBY+13xBXSETgvXOBtnBYdvV+mvMk5vBfKxKQ9cixL4xkxJuj02hy7KUp5ehg8T/dQpseUdXpg1Xju5OowtNlgW2NVBYrnj+YmKKdHVdyJSA9UF3FewLdWA6ACvlEQkTHXlGNgglsQ1Eh16+7lLTYSOSqaz9sgEw+13BxUI4+BVK13/+3ql4l0VhbUdbn/PL3vZ8j0OSNlfpiL4QlghSmCoLbjd4XJvHot2/yMNYiOReOHx3WROLa7Xi3lfRAoTmFppMrex/LKV50p64bbkWVqIklgTcu0jF4Ih3EfCs5zmQtOgQoIbGtCj6WYGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4SQ1OkMBXr1bngrnGIqekWhTZhQE9Hn1YHVXUaJOBY=;
 b=nJbp/LVNgFwftxUqg+oOG+r0B9Qi/EC3C+a93TWl1Zc+meV2SGBM/PyuATrNFJpV2oy2kRmLZc1wrgSs+XGjNRAi8UzTNGYIrco6babawOKQGpkHPVk+x7sfKw186bWxqXLInSuPvyhQPRmxNeZLzfNsUFhDZEueLILk/cfyupIKiezhp6CVZ3ogw7L8shEZPDpS4s9UfAMTiO7HtIT0w199jJjBCN6I9W7XAx1UXp8LpLNnGujD6mJiNrhP1PZoEfD2JMzVOL59Lb4Ed1i4HrF/yqnGgGSZoYoyiX7k5XFbhYAJfGDKDPyKJiMcvjOjbtd1pQEuymzg8CRyHvEo3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA4PR04MB7645.eurprd04.prod.outlook.com
 (2603:10a6:102:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:06:53 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:06:53 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 03/11] arm64: dts: lx2160a: extract the SerDes nodes into a separate dtsi
Date: Fri, 17 Jul 2026 15:06:27 +0300
Message-Id: <20260717120635.2118610-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::14) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 0013cb49-2de1-493b-7a37-08dee3fbe425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LOyZSL0McwlReKYee4psVr/oIJck8yWECz6Bn0ChZ/iMdIIawOhyyArB/38ZwoZx9p1wyYfTA6UmJ0RaNZ3fGuAENu+lVDMnflSx0p065+IHd8Oh+8c4XQfsGKdRamRAlszMwqemO6gO73V62uuF5FnPqrzjaUrvovH7mYzv5OgDzHBMZasMNpS2Bu3T2n95wX9ROIDurBrafHGpmSn/lhVZNxvEsahzSzVGbxZKZ+uDaI4h6sN+IeP1Q5mkZRjnY53SEnN8X6cen5MwiBmD5J7/qnpqeWwCtSLUGz/ITtG9xw2Am3uIYLRbuS8W5KHDCl4kkpHJ+wexJIFr+gY2SXH9Jukfcq1yQIhid6UxVa1gcAymYfKADWgUgB/kepb/GLqXjLeA27CI5T1SnjoUyx3vvDH3U0HsInPGN2cKNsaAb7bjUdicdjFe0GddePaMgjDT0kupdfsNhpk/aw6OyfKQO8Vew58CSkpGLOXb98ufYh+MKJm6DUU+nfEipmwviPTi3nZnGPWdyoCZjc5BOQqiO5pZcmB1xAPzraWfGkGaBG4H5FlKtbfUbKqjW3xic/XiFb3Dz5MsVtSPS0kjcwylPgJ5tjeMzmYWhyFb8yPdX3EG6t5Ea7NOZF9T6yj2fwlV/qh9Jc9JRObR256Kty65YIgEgmdIFGTXGsZk9Eg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+dKll0onT5OqnCi4EbyQW3avlG2TAjKwykKD6oKIQjaZL+UsKc7GUuc/XqGS?=
 =?us-ascii?Q?MZsJ7sOQAFh/u+8Bu0Xkci574X/+f0uwg2+1pnENMv9LmYbQ83SWHihCz1s8?=
 =?us-ascii?Q?cwjs+1IM8rV0IxiqcOczAIbNSsm3fnPrsVrd6Gk3bjw3dhYA7zJRQ+Qwt61L?=
 =?us-ascii?Q?CjK0Stxb3lGa/de/XsgIb8oRr6BtvroVPq4+O5QJBVDqrWLK38XnutgyKG25?=
 =?us-ascii?Q?86XFoSjXMC99VJbHbge6RnAQ0I/XfO7DtdfxuGdhEjFmAb1UCVdehZZ21O0i?=
 =?us-ascii?Q?UDehUIaNcRUdhfn/Ha+POyhXkYwCRd4/1OslfVuN1Z4SgIF4j6Meus5Y/3OX?=
 =?us-ascii?Q?AO1rsGMt6JiGEO9Mkkdy7erwANlBfy/AvwJ/lVC4logKqLqNvVUU6BJEUiDJ?=
 =?us-ascii?Q?ENYRt/GpHXx4KbVisLOQkmwXPNf+w8MaN0tnZmqacLNJEHPDDtb2WS1+0fHk?=
 =?us-ascii?Q?Wl/wHDKsdzMN8pFv8060cJUU7+0VK06cqDmS5Tq1MJ8ofMk9LBbz///Hy5kg?=
 =?us-ascii?Q?+Xeh4GJisrqiE1PuDywIg1SZK3e8mFsCWE01QC4gU4tUPF74uiG1yoNYHjl6?=
 =?us-ascii?Q?FyOaAljxkr+XSop8U4TddmupDqhdHAa9F+MPXdV42ZsqPH02HRJwSarzpZef?=
 =?us-ascii?Q?ZOA4oxWVU65VuUJKaGG9Y5hw+jNruPxMldfehMgFTwVucrZ9gTkDimfhicTW?=
 =?us-ascii?Q?kfW1/cULigkDeXpU1Iv1DounWKAp2e6zxbFkybra/SNqNFe3TWRsusxRnPaj?=
 =?us-ascii?Q?vgnraQ48TsnQ+C/jqaDbZY4RiTXyJbVM/eWNPneDISGMEjRGPGIxgMdU5Br8?=
 =?us-ascii?Q?epwaT63UXn7a5XTO6fG6BeevcfpLsNMl0Sk0NYs1yyEOnhiCS59WlGnmd9fw?=
 =?us-ascii?Q?DTssom649nDsl40FKpa7R7+wsY8IqZuuRrnwr0br04jmLXxeC7lY54eaPjTW?=
 =?us-ascii?Q?R0qXnJzJ+S4nMRgFIxviOiqhtIvpw0M5NHhaN0H3qSC3vEVITtqF2L/T49pD?=
 =?us-ascii?Q?WH4yFafA3yqzsB6IW1Z+9Me+Gk3koi1x8EfyzMpg47ggLQOvBxlZ6vazMCZB?=
 =?us-ascii?Q?bFURzQ9bfVXbs5TK7QhEk8r7uJehchSM/r9IGAppiKoAclFxCHsWDf2TYadh?=
 =?us-ascii?Q?5kohyHA+hEFyjJw3aju0Js+WiP94q4PDv2oRZwHfGeXOum21apSJjcnz3cam?=
 =?us-ascii?Q?nC70ac4UepwaI71wvnHFC5OV82wYfOgm4HTHAhEBQWfcQHhGuqzca5VNHQpZ?=
 =?us-ascii?Q?2FyIgOJMWUE8vwdjvIJLz6AkGC5Jb4/kx1qz615cSQB3xV+jMeAeFygStC6F?=
 =?us-ascii?Q?lnQgRVeFbU6vjazy1LfK7F1AIrMfw+aI+Fj2w0SpV8T7yic8+sPId/6envxX?=
 =?us-ascii?Q?TNMp4NIqyK22iew9IXUkfcqZjKgoDm+SuPe1daUxYk3w8oLz80Pc0gAkwLsd?=
 =?us-ascii?Q?npCoLmaMzTtl7rrLIGun8U5PreIgzu5YbsXBiszp/Tx771D/5KFDKGgDmTh2?=
 =?us-ascii?Q?gEhDEpCTVp1p9KwA7d8sSTAVjc1EE6HVrPHsCBWJonSDSEg5ONV4syE6Gb23?=
 =?us-ascii?Q?kTbyYVhu84czPEdEIh6kuqIj7MZkYvSUFLkCH5SW1+VR5HQigTIekrK7YYv6?=
 =?us-ascii?Q?M0mGlCviVJfoI84diZKafVxx4eI1qETO931EbUIY7Gk3wJULTEPLaTQt8cVn?=
 =?us-ascii?Q?w4mjMZKnYuMKQMa86zgAcgO56zHcwU6A3L/sSUHZm5t0E+j8BsBJS4MSq7Rb?=
 =?us-ascii?Q?bWk8tdu5rA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0013cb49-2de1-493b-7a37-08dee3fbe425
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:06:53.8011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UF3kY2+5YGRa89kCv0irCOMHsBc56Jkzgk14BXQBWY/ch7vX8e77FePl0bBO7f0vfNVjMThnlVA7ps8boq+JoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_050657_927199_79F2DD90 
X-CRM114-Status: GOOD (  16.25  )
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

In terms of its SerDes blocks, the LX2162A is not properly described
since it just inherits the LX2160A SerDes nodes, which is not correct.
In order to fix this but also avoid the usage of delete-node, we need to
first extract the SerDes nodes currently found in fsl-lx2160a.dtsi into a
separate dtsi.

This patch does not intend to do any actual changes in the final dtb
files, only a dt node move.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- New patch
---
 .../dts/freescale/fsl-lx2160a-serdes.dtsi     | 21 +++++++++++++++++++
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 14 +------------
 2 files changed, 22 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi
new file mode 100644
index 000000000000..307824eda6d6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file describing the Lynx 28G SerDes blocks found on the LX2160A
+// Rev1 and Rev2
+//
+// Copyright 2026 NXP
+
+&soc {
+	serdes_1: phy@1ea0000 {
+		compatible = "fsl,lynx-28g";
+		reg = <0x0 0x1ea0000 0x0 0x1e30>;
+		#phy-cells = <1>;
+	};
+
+	serdes_2: phy@1eb0000 {
+		compatible = "fsl,lynx-28g";
+		reg = <0x0 0x1eb0000 0x0 0x1e30>;
+		#phy-cells = <1>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 387cd677cdc7..da139e7fa30c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -621,19 +621,6 @@ soc: soc {
 		ranges;
 		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
 
-		serdes_1: phy@1ea0000 {
-			compatible = "fsl,lynx-28g";
-			reg = <0x0 0x1ea0000 0x0 0x1e30>;
-			#phy-cells = <1>;
-		};
-
-		serdes_2: phy@1eb0000 {
-			compatible = "fsl,lynx-28g";
-			reg = <0x0 0x1eb0000 0x0 0x1e30>;
-			#phy-cells = <1>;
-			status = "disabled";
-		};
-
 		crypto: crypto@8000000 {
 			compatible = "fsl,sec-v5.0", "fsl,sec-v4.0";
 			fsl,sec-era = <10>;
@@ -1855,3 +1842,4 @@ optee: optee {
 };
 
 #include "fsl-lx2160a-pcie-mbvl.dtsi"
+#include "fsl-lx2160a-serdes.dtsi"
-- 
2.25.1


