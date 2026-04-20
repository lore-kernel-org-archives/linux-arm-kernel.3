Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A9DF55805
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 10:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/iwnJVv3reJAXHirXo2xeiDddwF6fPZuxAT5DajGXY=; b=mxwjPvrE5TbALul7vuar4p8xDT
	Q+iwLB1sty2RwvA1hluKLR6qH7U1PVbNfy/zerbPYlGs6T59e25NIthKlTa08yQGdqvfTP30XO2kf
	/qyJXZSd3Mpze/aOnq1c+Uu8vMAEGGdiwq7HDy+7NMlbOp+YVa/E8LlB0nmm9jheiFvwY/T63WJjq
	SxTOQsLMJ/cg9T0CKahtwU2ztg9jqpNvSzgX6m6ApC5qchNV1bJjem8XO1zbNe4nUMBOYcyiivoTl
	qVXc6ERha3cJkwOLpV25S85Va2Mu+6wkomSxY+6Lv/At5XT4BZghD4gH9Alg3AiQM00eW6XZdOohn
	GpbMGDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElWt-00000006iOx-1lNQ;
	Mon, 20 Apr 2026 10:06:59 +0000
Received: from mail-norwayeastazon11013047.outbound.protection.outlook.com ([40.107.159.47] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElWq-00000006iO6-2dDP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 10:06:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X65iScHUxDBzn6EAKR/nXwQ+j81HOZw6f2tvfSXocTCm/Dco3bP6Y1IjG8Ve7h19rFTvZBqLJ6Tn7mzEwKGV3UBsF4MnmVGzxhiHCvDbW0jtigHBhP9XvkI7cuos9qtmkZ8RrMsQeqX4Zo+5d1BbVvPqeh55pUcO1QytfUkhzNmPg2n0JNfHxluOWfc/jlxATWCpa4CgqCnG4Saf8pFUWTg337//fHTGLLsAOdsdGkcNFLVhhCn/ATbsI3Xzi5xyujZ2YJ4c02Erq6ZW1Ppg4KrQ/IsbGK+J10EVglgFuD4erfInZyi8nu8B5zWggT4Q85uq2WISEaBHeTelM9GyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/iwnJVv3reJAXHirXo2xeiDddwF6fPZuxAT5DajGXY=;
 b=Iww0vZx5DiVjU225bRpt2bo6NCTSiyhxwqAOPKIi/XO7jph1mCNV7QCEEkdPTi4qREUepxqJ03fXs8T9/5pBEaIeukrInRvbPKmyciOqWmprltzyUwVAMOTcSsp2CoOhB9KGAJuN+YHvXo1icaZhOhTa65lg8xvVBChpkY63mowHKa4mEtFqQPhi5ETQEtMKF4LSoof/3AskWNIiPfrzxk8iM/rQLuqWMJF2ECgnv0HsV2c5r+qDYPCD+oyOBSIdGllIMRZWBfSBT5VmFWPqG7gxQXGgWbXizSZvO9ia0RoqSg+p/7UEjflP1UoHRQZIXDerCr2HLBSk8EaBju6CcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/iwnJVv3reJAXHirXo2xeiDddwF6fPZuxAT5DajGXY=;
 b=NaBBUZDzzPaF0lVzKXdDuxyD0wwDnaqDJ0c4Kjehx+Jgz6LvnWEflCxCOMOrRnAXsYMi+t+1HAXr62MoKxKxBQgJVW/gx7VvCrfE8PIEyBZjnvE3AxFtsDMhmCjUVehG98KGBgNyC/Q+HDyN0Qzi5yJl58rJPzwaVIFaQCxzXdO9pfsEp+cBiI3+lcsppPK085c6oZCAzwTGqUg2KRkfWulfzYX1XYDAiDcpmnT9XsGNSTiQIRHi9dplp5ZDzGPkWz7K8On5E8YELvsUryrCVIt70XCQxuDpmQOCebts+lPuVS2IQaA26k7BeDDHZ8sg6kP3nASMGpTLmxJD8T+A/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI2PR04MB11170.eurprd04.prod.outlook.com (2603:10a6:800:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 10:06:49 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 10:06:49 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3] dmaengine: imx-sdma: Fix SPBA bus detection on multi-SPBA platforms
Date: Mon, 20 Apr 2026 18:08:54 +0800
Message-Id: <20260420100854.2095549-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::27) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI2PR04MB11170:EE_
X-MS-Office365-Filtering-Correlation-Id: 4884be95-ed86-459a-c688-08de9ec48951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: yjNW/IRMMOQsx10VHLHQ3MMzycq+I5uJi95oNMbrLXJJuAiNfWQxwRH4PUKF2e0pMUgYndc90Mw7Vlwq8NNLtRE3ap8XJ3L4g+OPLQ1Q56PRP+zdV0Bar+OiPbh3rDAhdR9wD0o/YOz3SVf59iSZJXDv/3uX/LuLXxOtoLu1xBb1PwI5ShaCxSq++8CDLdlUraDxe5ncvhW1lIPtJq1qVVrxvRrmYgTMVXI1rIYy3wCyLsc5DNE45BG8tJmwIsD7/f/6JLP08VWFno5gRP9UJZawppBkHhdrKIaoqdXRsa1QHkb0/PbSnLPdRmNhp2VZgx3GgLPcGiJhD2/OVXOtfC0v6tJIQUMc3RQXvBKe2mQv99DXbJg+wGAxXR7Jd3i9BV8QBzIlLysaqyaLVEXzYEJ6k5FgpqbO3E1CXYOIbfUonShtvGu6oDyZpLxpZpxJUixhdRu6/sHXw4I6sZrnsIc3hsUEb50s9uiC1G9aYiLhVkzMSzCxX+6bpw9gxTU8f7uVQbTG5ij3qq9v5mYq6dCcb53LcCTc45z0+ZzqVE4KEI3BddebeKf1amdoa2shxL5amLbWiNfkA7P0yYvFb027hWQN5ipRcSLzmxbsNo4U2/jKXFYPMta/sVIFcLutq6X9LD+68a1oH88x4O+aCBa8AfBzTDnUYvGqqLaSx9Mt6hUsk5bdqgmHkw6xD+hYbDAyKQCDPZff8xmcZp6OxRjd8Fb5GHcYnvNDngsaxdOVjgyXnVK4p+VKX8+XgfA45SyDf6QACeVbRqaCkYCkCpXcnZLsg7/rvHFCtEGvlX4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pquazhtG9UDFULrodZfwsqV/btmd9dsklhDCG7S99pxot/grnha5j6qF+HFx?=
 =?us-ascii?Q?jna4kVlW3hgWXw6a65136tTBwueM/78nJ3ACc8+l+ECr/C9JKrjzt4p1c9vM?=
 =?us-ascii?Q?CQ5C8e/NLxorMKlWGg8qHJAn1deXG3F49F+wvzRBCW6YOsphEK/dDiKDRGTp?=
 =?us-ascii?Q?CZ6fRX81c0w/kAkqW4ldDojIC8h49jIICq5H7LN1viOq6U4qnLRtnxaKNdyD?=
 =?us-ascii?Q?KLQPWMovDVPwcetXo1IGQRK83QJFA83ZOAjz9B/SsdF7WWusVDighIIvFUyd?=
 =?us-ascii?Q?9ylO8TG9pHHqi87UHl0Kx5/yqZbYKqUOsZidOz8WTq0nzSNWTCK3n5JwOYKu?=
 =?us-ascii?Q?vGtl7BlogqB7e/lkG4dtLpTE/EDfUMzIE6mMXMvUOwY3PIGqppwMFKy63G++?=
 =?us-ascii?Q?tp8iIryIxZMTgbTHN8wNNmY4q3EMdyLD4OvHTRZmOx43dJGCSoc2ND80o6sJ?=
 =?us-ascii?Q?iYSofKAc5MS+/imZEYlygiqXRUgq22kIWq/igOICKZbAQk3YbtGowB+u+P2x?=
 =?us-ascii?Q?SjrhyxB4qpPVvXEf2VDIRnS3T9CNNNDXCpQKZLep6GOytQtKtoZJiYPxOeKo?=
 =?us-ascii?Q?zK+9vnu9CCwbYSszpPPoX2uUHrKi+Nt4IV5Hhfkzl888MTNMvRWeZBqacGBd?=
 =?us-ascii?Q?nrMHrXgwbON60EcpHz2xrPk399wmgOzxs8fJmLDabOJCzCzEbWzus+/XHW7E?=
 =?us-ascii?Q?H374GD8JlrVZzkEvvIJscCirrc9zgV1MlzjbqM20/IVRh/fZqZvvJwg/eWWv?=
 =?us-ascii?Q?q7MsO/uxszRotPKigUW0YUB/+lF81563ZuLg8Xk3CMfozAM0PUoDIkab4lp9?=
 =?us-ascii?Q?nu6x2XKG3hYrVUh54aL//nkATYUveIeJAb7a5OLGVzvY3zz9qq+hMDTbpHoW?=
 =?us-ascii?Q?Ajse3Sr8gTqZlJbtdGxVTx5Txf8mvm576q9WGUntTJ/hv/nXArXUSjwMdR0j?=
 =?us-ascii?Q?/QG6SR5Ls+lHEvFpJ1XZaGnmb9XDmRZK1mQvjukVel5tBOqljE4b4vqd+7Dg?=
 =?us-ascii?Q?534xwHO35q1L2Omtk1XYwAYsqCHn60fcJ7fo9fC+Fo0Ij49trx4ViKHy6FFZ?=
 =?us-ascii?Q?LwhigYVb8079n5UB6p9STAdu9BJ5A/iMXRkGx2kmfYN/thnNvdEQ/Xs8UCKd?=
 =?us-ascii?Q?hc2K7P/oDpX2MLqo6ob5i+cZ3TRoyKf+3ZUOv5Bt2FoO4XlxsKXEm8+VZdeL?=
 =?us-ascii?Q?imkfnSNU7z9lhkXaAdf7f/K6US/++h/7L8r3iaj9IkS3vWJhCnQjqRI03wg7?=
 =?us-ascii?Q?tL6GyAVoHCRhWZoknpWpbiytXSd1iPLVaw3eEg8CV8t614TIICsZQn5H8Bgq?=
 =?us-ascii?Q?GIDyGwNsEhN4tV7r//O/AwdgYdIXuA3oxcKzwPBWg1fL1HY8rVzaQWWcVfjT?=
 =?us-ascii?Q?0njdx+v2P+JoYI2HudCvCcaoAtuh9Al1popB6b8xOIRxUPZR6Q9B4WjEzDj5?=
 =?us-ascii?Q?bJYI2XE4W9Y/NRGnf7r1My5Mqbt6SCi8/cFLvbcXcaRsbWatMsjt1jaS4Sc3?=
 =?us-ascii?Q?+luTavZMX3IghU3ZFR8E/dPUPhLpl0b8q8NNK9nRPUDrcYuaLViw+4L3VRnt?=
 =?us-ascii?Q?op08+ehqqzbLb1h6kjaVRbxWmc7oVK9ik6WNPWCbHupu0WcODMotOkLPwHUK?=
 =?us-ascii?Q?fZ0sz8V7lQwfIeC3nDelJurNTMOiLfAE45XkXLSVkzvlrTSB2KJvv7x0oAG+?=
 =?us-ascii?Q?eqrHXfIlTaF+DFxoE0dFb4vZAeZ23/pPq4USlBS+XGEc4Btb6IBsi7L6Nk3F?=
 =?us-ascii?Q?DM6ywAwQOA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4884be95-ed86-459a-c688-08de9ec48951
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:06:49.0172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2tTA7R/QaRzm4iYi9VnPmKqTCT0skT5sNJmLzGPak/vNYZpn1P+nR5PDMkAqRo61TbfZ9s7JY8EFL+TTqPpHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_030656_730082_2CD5BBEA 
X-CRM114-Status: GOOD (  17.31  )
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

i.MX8M platforms have multiple SPBA buses under different AIPS buses.
The current code searches the entire device tree and returns the first
SPBA bus found, which may not be under the same AIPS bus as the SDMA
controller.

This breaks SDMA P2P transfers because the SDMA script needs to know
if peripherals are on SPBA or AIPS to configure watermark levels
correctly. Using the wrong SPBA bus causes DMA timeouts and transfer
failures.

Fix by searching for the SPBA bus under the SDMA's parent node (AIPS)
first, then falling back to a global search for backward compatibility.

Example device tree showing the issue:
  aips1 {
    spba1 { sai@...; };      /* Correct SPBA for sdma1 */
    sdma1@...;
  };
  aips2 {
    spba2 { uart@...; };     /* Wrong SPBA - found first by old code */
  };

Fixes: 8391ecf465ec ("dmaengine: imx-sdma: Add device to device support")
Cc: stable@vger.kernel.org
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changs in v3:
- add fallback to a global search for backward compatibility, which is
  to address comments from sashiko.dev
- update commit subject and commit message
- add comments in code.
- add Cc stable tag
- Don't add Frank's RB on v2 as there are several other changes.

changes in v2:
- add fixes tag
- use __free(device_node) for auto release. 

 drivers/dma/imx-sdma.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 3d527883776b..592705af2319 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2364,7 +2364,18 @@ static int sdma_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "failed to register controller\n");
 
-		spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
+		/*
+		 * On i.MX8M platforms with multiple SPBA buses, we need to find
+		 * the SPBA bus that's under the same AIPS bus as this SDMA controller.
+		 * First check the SDMA's parent (AIPS bus) for a child SPBA bus.
+		 * If not found, fall back to searching the entire device tree for
+		 * backward compatibility with older platforms.
+		 */
+		struct device_node *sdma_parent_np __free(device_node) = of_get_parent(np);
+
+		spba_bus = of_get_compatible_child(sdma_parent_np, "fsl,spba-bus");
+		if (!spba_bus)
+			spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
 		ret = of_address_to_resource(spba_bus, 0, &spba_res);
 		if (!ret) {
 			sdma->spba_start_addr = spba_res.start;
-- 
2.34.1


