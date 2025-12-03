Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A66D1268E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 02:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pg6JdOfQOboBnAh2kjx2w6/6hLnzOBYpDSQ1p1FHSuA=; b=2Yywwi4tlP9DQ9L40/QZoWh0p/
	4h/a7Cm61YtMbf/DOdxF3FPhrbXYMUPkpIF7mAIOZKm9vKUmfdvn4QjUtG1MAYwpJM4zUlaC6ptPp
	MV+N7xvtY5S8w4zjvDPjok9Ep4negbOpqGtx8OtaPNk/fCT4c39mocn4svrC+uPrlL5vPn0sEFye2
	F1Et2892vzxDWVNQq+NoY0jkj3zcdSXk3VnF4NPYcSUDAjGbhmvBw6cuJtxQAXxfEazv5xgaXNOlp
	bNWxglU+9MNY3f99vUjhzc9MPN+4d2iARGtWfdVLS2jgBwlBNOaLNIzY3Hs89kdDUNT7xivtDVf8e
	4/4rkv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQcAc-000000061Pg-1Qtd;
	Wed, 03 Dec 2025 02:00:42 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQcAZ-000000061PM-222w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 02:00:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nssXPbl35XWR9RtbAdbAAHdmjB1xf8Z8CzwPpPLgwGX5PJxtY6n7ALqlBKZmb3hhoAp3P7LO9GznJtTnKWDFTH8HKk3PeS2wLwbOJSok4hRa1sRro5P/d8OkIVWkSeCQrB4p22jx2UzARVPrID6roFn893sQXiXT6Ae01/ihTNEhre3fttACBJEax+qY0DMCm+JxreBJljL2wXMunkcBcaJXRo8PX/wA9uLJkeA78T04mxmwr69itRYFLwLxAhtafUyQLmE7kMtYqWYNeSZlqEg82u+4FUoKjHkihZ225QyrLrAVzHgTh4syOVpecvOIbIpKZp/k8r0vLHnIQV0BDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg6JdOfQOboBnAh2kjx2w6/6hLnzOBYpDSQ1p1FHSuA=;
 b=b45FkTW5xGlYyYzKg9Nk6oYklOmszPnjyv2NPYTYasRRuOxKyfybUApR780qmKo+8n5UW+zAIkUCEcwCZiLPjkzxa1SE2uqayil9MvlK9RV2alUi1XXNu82gzruNWkv8fJfQ++lqAYIrsm/ybWPW1SvKM5O9rZUUAHa39KS25RHUmpm2u4jXZMjLRG7Evc3Em99QNvCakZMF9cSWZlcj2hLLvh8QfNp4WePjxfUTvQ5+UFtIwXyWcnkV67vGRCfhqKS6SERD0jHMORGVVjBriLrU2ybm2PPo5ZCK/FlqVnEfQ1+1xoBEBS1Ei2KKsf2DUXI3a4Z53XvvXxjZRRJI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg6JdOfQOboBnAh2kjx2w6/6hLnzOBYpDSQ1p1FHSuA=;
 b=NoFMUKzuVf4nyruDS/V+4ghc8k0SptqLRF6HsW+4Vh+IJLDSHiSh0bGPKu2YEBTa171Z9MD+q2KFkRKDX39axsts//XJMXrYBgPmwB/WF/5F1cpJ8l7gXyba+QIxx7ktLfZ8s1xtZSedB9j47KPkTAQGCO7SqoazzFy8sj5ccsZUgrBjMFeYneW9SjP3jgOXKcLr5xh6BtarLXQd2am8yvDscN4PgSYe4B5LHvdFrvWBJcZbTIuIrAlGEGNRnp+iOSkJqiojBAp4RvLlg0iAZT8eo+UJCOJQuFuVA247EbcBHu1ar/Q4wLl+2VQykrN1yVYTOh1f0N0ksF1VbLZH5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8643.eurprd04.prod.outlook.com
 (2603:10a6:20b:42a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 02:00:27 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%3]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 02:00:27 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	frank.li@nxp.com
Cc: devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2] arm64: dts: imx8qm-ss-dma: correct the dma channels of lpuart
Date: Wed,  3 Dec 2025 09:59:56 +0800
Message-Id: <20251203015956.116364-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:3:17::21) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS8PR04MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: e6eee3e4-61d4-4aae-690f-08de320fbab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OSxXkulsf5b5EFsQRookVZVHYfO8fE0ROaZNkFygN9EUDoYfSkSQhMeSn/uu?=
 =?us-ascii?Q?k66bCDyIhBTTAK0QhRRL21YulaxybrmkmZ775V7wI4c1avgl+I3z2SzyNw7n?=
 =?us-ascii?Q?DO4wydHpqNSEz4zzfMehKaz6KzVas9bZv41yGo+/nVBYRp8DkmjyzY9TQQP7?=
 =?us-ascii?Q?c+Eb/fYNG+0JcF5xqJUAyrtU63R6uLu01NGvnzw7LpOcFh4c57RCsoLAWHsR?=
 =?us-ascii?Q?7qEBDLJa/Qa9iCEkUVAbBtP055wcC4/y9cLygvHnCO6bEyloyQlZcHS4DL63?=
 =?us-ascii?Q?W2s6Tmtla3VFRZa/XOkpZLZRITTKgxDHUihOv91RsFjx+2nKB1y0G5ZEv2or?=
 =?us-ascii?Q?X04Yab1DzOFJHxFwxooY5uIrSkEO6vh6HYDntpUaY6OaWEy329bYlb43kjjP?=
 =?us-ascii?Q?0mAcXBLCOZAWVHToZgtkW12iGis5Stj3xX/d4//1mrgWa0jIWgFgLeQkxbkq?=
 =?us-ascii?Q?h7H5IhLIgcPV5Y6gym7NyUZSCeyY3l7mZTAt7Ww9MZYUVeZNTuGPqeg0+Tco?=
 =?us-ascii?Q?G315Ksd4h+VVp/GJXXln6/8DLFwujaPXNLaNET+tT5cYM6PtvaNb1XEhL7M9?=
 =?us-ascii?Q?dSaSI7NeJb1/BFP2Apbsxnqiquy58RDpZDE9sLasUsxy+lVZsQhSh2Kkv5K9?=
 =?us-ascii?Q?ZRc/MbPGTy8oou82+lOkW47hAAHG7UWYjn7EpYzsy+jsborc70t7mdk7ne0z?=
 =?us-ascii?Q?wx1t1RZBvX+uEo54jyc83dcBSPoIHqPi6GfVR0gCwvhyvj29jilsPj8G8cCC?=
 =?us-ascii?Q?Li3KVlCEPMQ6CwXyoCQkRvgwBqMI4QtfotTX/2WHT9S9aemqi+HBuV0mkeJw?=
 =?us-ascii?Q?AIEcPIbIFQCpWoly+ptfmDWZbUk06zGOiuZ2h/GaXjq2kRdnfKPX++QK72FR?=
 =?us-ascii?Q?qxxMc3P0fGgk79n62OdUU408L4dYS0kF31fLSZweN28lL+YW/bbNE1vlnLTJ?=
 =?us-ascii?Q?VK1hKWa1MMnWxXv6n/ACBw9RT0aXeTCU9rXyOUIOmqCOIYNKH/Xq7ISquuR+?=
 =?us-ascii?Q?Bc+ru09DFnhonsAtZNyc4ikG5G7FLEfs6FkkV3aokz2eNOqEIUmnLOHDDsjN?=
 =?us-ascii?Q?V4bBX/gwJmhDpAeqsTv5/Dkfb7XlCg8eIpf8mlbvHiyimRRnCnbqWwHMhVC6?=
 =?us-ascii?Q?yC01X4TUOE6YuEGzes1/KWqoJgdp9aI2y4ge76MvFw2YIvWwic6UYmJbi4XQ?=
 =?us-ascii?Q?O49xHLNzO4GyKoxN0BAN0+mn/JRqVZaPmHV5Yoh+9NcRyiNsFy/9sF//nfHk?=
 =?us-ascii?Q?38AYFsoDEloAc/rvj9F5lKq/HxGapnBKbKRCL1BrozXk8dHzrOA/Ql7YV4gx?=
 =?us-ascii?Q?7yD6MV6/Xi4hgDuMOf4lV3KHg/t5mDl62osaFp8jS/m/SOqCZypSFaHe4oQI?=
 =?us-ascii?Q?1stj9iQYCSu5jw8ploBBuywW6mZSJ02JNVtq76dXs5xfSRYeDIr8BXy6pFX8?=
 =?us-ascii?Q?5DxOtxjf4VQf6v4gPSTXZUbxP0XFurXbPJNe4W5on5y7h56+0EqkhJjcIKyy?=
 =?us-ascii?Q?tXc1Y+s13lDIJkwetCI1UXmG0FScGGffBmnw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u6mPFTbipzB8zhHHHyd0Knkk04nMStztEwOcO6FPrXoAWH6gOOvp3upc5XOX?=
 =?us-ascii?Q?0/Zao2r8NcTOi7wJazBZzeeIxoKAn7+J3nz7CKM75j3e5s6WgrXxekpvKJkj?=
 =?us-ascii?Q?k/86cFtnm39GjYNVLQVavSJpF16/QSAIBN40jzsltjxzLs54dFGe+T73KBmG?=
 =?us-ascii?Q?5Oeg0QJSksFfzoZj37y1y2ayy4NhehtsVFory6y5LPv8TZVcCpWda54dV7Dl?=
 =?us-ascii?Q?5RSDdwIH2UTanR76rxScyybc6FhDyrTOvd5Z2tSyjB5exqa2vO4W20yxeM3C?=
 =?us-ascii?Q?J0cn8Qd+TfQSyMHZjHshBXcJ0Ag9MQZWkBsRr30IidagEjQrQVARkv1HD+lh?=
 =?us-ascii?Q?dkurIay/A6Hpdp9OXSzs7mKdthMzsxmXmJSzgrXU1dVmpJy9tHAgBRf+jGW/?=
 =?us-ascii?Q?lwoxtaGKamCRP77Cz8iOB3LJUv/9sRUmv16Te7ju1WNJgTbpMILR3N9UmZVE?=
 =?us-ascii?Q?tofdblwAbXXGHTuFjvgv+5HPdpqBDcS4TXfWJO8WTOPmceKzabtKCr0i3qUM?=
 =?us-ascii?Q?UlYYuu8SqVJLkFKYx08rlwoIVsvWAhyDhazPBCcOpuXn7XW0auX5uES2XXvT?=
 =?us-ascii?Q?xMPLSP/fRSe0uXQgLZgb9Kv3nQ5SRzWK6mCuSo/9hVgk1klPCWLllnYI6ZDj?=
 =?us-ascii?Q?Y4/IGfmtAPjSVPXdiA+80E1qS5C0GL6BB5isnfgMLvylpZdBNFZMHKgftatD?=
 =?us-ascii?Q?yG3xLbWxVw1wKmS0Ix69z/1S1X7W2uFCwEP2saZa64xy76NUabbzsfUZXFNF?=
 =?us-ascii?Q?JFBDt8+aX+SmXKV88iNVE9/DA+G+Ti0VPvOnVT6oyfa2eTG7TycZMNdDxmHK?=
 =?us-ascii?Q?G+aHvHM4g5F6lbpNU66rdR1E8VdFpEhoHWp2SxUbzDN2gzYX4/x6JPjUy0ZH?=
 =?us-ascii?Q?QXAVzZeJO3sw3ypaNyx1eXfL6E6UkcnQnynv+FogwWX8Vhoo9I+jjIs7CB8+?=
 =?us-ascii?Q?Hzow3kcq8EVsLUCybljr9n5dmPKPK5y1604DJYYdpqN9FjWExS4WNunnoWof?=
 =?us-ascii?Q?V6bta7WJSq8P1F5/y39mH4IzIvosuYh/TkpnI8/yxeCKfnB7ae8w2hxx3h2G?=
 =?us-ascii?Q?3SnLf12BApuJavxKGgmQBz5AGRL8CBfpMF3wfjrCarEuoCcd0bdJ5jZyACoh?=
 =?us-ascii?Q?dM0YZ9ocblcNZWeIwx/LPLcsQkKMESRPv6f9RWkNOcYk8M/KiYD4BZf9gsbH?=
 =?us-ascii?Q?Uv1Etj0tYNDQUUtQQtcdAt0/SfJwnPUCQfuez/VIUEli5zdIWbpTnm6YQWQB?=
 =?us-ascii?Q?PMi01r4Sililog57qLHItrYTbYovbFTmoKOuGNWK6rDk/u6yU6lXkFkmnCPC?=
 =?us-ascii?Q?xRM0vl52E7axz52dGP5TbuFg6CN0n/IzK2tJ5GYCNHnUPWI7Yfy77LSCrIyg?=
 =?us-ascii?Q?BlGEsZDNgU0/oBgfDfIc1fkGCLiIPyPJOLAezKsjcZ7taPMp+8LtlkrUVpFV?=
 =?us-ascii?Q?kFs7U/om70g/FI4iw4xejU+Un++QoqGNAh33qEjwlAYf70/eWXpPKS43l8Gz?=
 =?us-ascii?Q?gw54gXDIap1jx96mGIasNSCZSX/dE78MJ8GyoZnvwggcXgNZUfdmgG1cPm+3?=
 =?us-ascii?Q?5REBRMHLRyj7O5eZP7Wp59/C+H99QZa9Q+etHR0x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6eee3e4-61d4-4aae-690f-08de320fbab8
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:00:27.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HarCy6ohhjtOCJQty3LmVfT8emhlO1R40gQl/9X+GGiaPooMEPjbSusAlJX85hm84l3xYzzcDENbE5p+RmJTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_180040_272052_D0312E67 
X-CRM114-Status: GOOD (  10.06  )
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

The commit 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel
order") swap uart rx and tx channel at common imx8-ss-dma.dtsi. But miss
update imx8qm-ss-dma.dtsi.

The commit 5a8e9b022e569 ("arm64: dts: imx8qm-ss-dma: Pass lpuart
dma-names") just simple add dma-names as binding doc requirement.

Correct lpuart0 - lpuart3 dma rx and tx channels, and use defines for
the FSL_EDMA_RX flag.

Fixes: 5a8e9b022e56 ("arm64: dts: imx8qm-ss-dma: Pass lpuart dma-names")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
Changes in V2:
1. Correct the fixes commit as Frank and Alexander suggested.
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
index 5f24850bf322..974e193f8dcb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
@@ -172,25 +172,25 @@ &flexcan3 {
 
 &lpuart0 {
 	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
-	dmas = <&edma2 13 0 0>, <&edma2 12 0 1>;
+	dmas = <&edma2 12 0 FSL_EDMA_RX>, <&edma2 13 0 0>;
 	dma-names = "rx","tx";
 };
 
 &lpuart1 {
 	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
-	dmas = <&edma2 15 0 0>, <&edma2 14 0 1>;
+	dmas = <&edma2 14 0 FSL_EDMA_RX>, <&edma2 15 0 0>;
 	dma-names = "rx","tx";
 };
 
 &lpuart2 {
 	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
-	dmas = <&edma2 17 0 0>, <&edma2 16 0 1>;
+	dmas = <&edma2 16 0 FSL_EDMA_RX>, <&edma2 17 0 0>;
 	dma-names = "rx","tx";
 };
 
 &lpuart3 {
 	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
-	dmas = <&edma2 19 0 0>, <&edma2 18 0 1>;
+	dmas = <&edma2 18 0 FSL_EDMA_RX>, <&edma2 19 0 0>;
 	dma-names = "rx","tx";
 };
 
-- 
2.34.1


