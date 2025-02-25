Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A5EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4R+xBHnzCZjZW3BWCqcH9jicmXAMCRJy503Na1AlqrM=; b=DHA12+o/RU8S58ZF7Crnu9Lein
	E7iEBxq+ZLLV+ZxwnSdFEuCCMaff5AV6loqtzy8ASHeMWxgvyT1pElNqf0osiNA7BUSqfEEWQcch0
	je5XF6ZnWu9Xynxt/BfINv/ZO0D1cmnTZvz/5E0G8RBlmOnVxqa52HY5WDTvFS4bo6Cl562jzEkh1
	24kUFG4QT40Iu0nSrPMOf7AZxkU8QFzJ/n1dhSW30Sw7Y/R1qKim1I2xTBbLMCGgg+u/4lfkzRahm
	ca4w1J+YnA+C1l7hI3xzHDd/yzngT8BiQPImXuX7CFUBC+jYoUenTTeGGjUNmeISHdzh+DZI1HmMg
	DUfH8oHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eo-000000019fT-3RJ3;
	Tue, 25 Feb 2025 19:31:54 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0ZJ-0000000187m-07At
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 19:26:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kewEfTl6qDQUVo2AulH1hYYHOrD6r2dse2pKEnild2q9/agmsnJQhCzS4MaoZ7O5X0BUvX5m4DcV2ZAen2f8yKo773sUo58+05FBOCuXv61WtQUftq/fD3IgNMP3ioKWwqMRxWmutE1VXUecQ9Q2YI+gE4yGdGHdQEoh/Bo0mDa/7hjgZGxn5OpBqDTj1UqT7YU2dOez34dJY15EARyv2TxiT/je9W8AuL0cap5p/cKIIbwdrxOg144flxjoO8XE+JQSIL707HaFZMnQTIrNIHXM34sSytJKHKZgdboSIGR4pIpI7sxzPWNmsqlvuFFPGOHxUB9YS+kcLcKxnDprdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4R+xBHnzCZjZW3BWCqcH9jicmXAMCRJy503Na1AlqrM=;
 b=Mz3fHGscExB4jfBA1wy8/5BlQn5cO5QjmzOk6XKPgMmvrwxCaO3uY+3XMzDVh1HpH1fgp+0+2qbS9hVY8H+5o/zE88MZN/2ADN2v+CleWx+Gv8ZnjJquUvuw/3f7c7RGPE3CQXFG+ocUuVWMufYwNdYfyfd4+x812EJCFh5ykm6kvdKAVYT3EjlnHwGMpu7QZB/3oVzHNJBVSz4XODPcbPJVRA2fiOKJds3kdpAEqEhRHiyhqfFDqj1Z4lcBzea/L8Co3GNZ0yuOUNNITO2qPX0IRvm5SNaznHQYUXIqKwG2uhKh36y7mVrUteLxZGcQzFeLFsEIgdH+u6wt81lxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4R+xBHnzCZjZW3BWCqcH9jicmXAMCRJy503Na1AlqrM=;
 b=gegX5Smwd4hGQ8F4d816gyyOIOVzoIstreGH+BJUHLbrN+WzIk+FQbtomUWswy1oS+9BVG5MI53Df00MkN0jF6bgpbj68hXmb997p6Lxv2J0fuU+YDx4c59AbEwmGKF4qJvWLe3RhwW5UhfS+d63ufOu1gBYaIxHFkrQxHZZ6E9TPCohHLpmNUH094gjgUdK0AHs1R2itbuszAI2270kXP49NVt16Qmn6AOLimYC0NW95hwMjI1FFcpCXJAtgKvwwM8vYyJQ9esgRKoW63VtuWHBPSvZNMhKEK/BSHPy3lbsVKKocdE1MqKA3M8CIVjIpKw6CGZuEeg0Je8f1Xl5Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB7177.eurprd04.prod.outlook.com (2603:10a6:10:127::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 19:26:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 19:26:09 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 1/1] arm64: dts: imx93: Add the 'fsl,ext-reset-output' property for wdog3
Date: Tue, 25 Feb 2025 14:25:56 -0500
Message-Id: <20250225192557.2914684-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1502e40c-bbe8-4103-c422-08dd55d241f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GzWoUwtmhk7542BSXlOnPbtf6HR9m+4sQUv2RQFfb7o6pba8uox7ThpS9Z1f?=
 =?us-ascii?Q?su1tcJ99ljQZNu+LSrjg3ejXlVA5+NV/tIoL8kpQa715jm7vLxtALDR9Txmu?=
 =?us-ascii?Q?QbUpkZqbrzPiU7WLaLsxoEolWRNsRyiB0s43pcHPMyS8obyctbwyf/dqfCel?=
 =?us-ascii?Q?JcOYywopfUnzUMjyNRjGAwls/o4mBWooSNNyz/av8Zr8XRjnvGrbnNXiDpon?=
 =?us-ascii?Q?BsEE9HtznieGh6/wIw3kbBt9mGC77MG5HRxqavXQw8nYlQpAYuVkQyEHc1mq?=
 =?us-ascii?Q?jF2tN7QIZWDRSsAlJ3P/TSH3Ey+QW4f1SBwJznH01Ei9S6W4ebeEvgwiKnTG?=
 =?us-ascii?Q?VwlrlA4XySNd9C3kDPacsqwVqJHvyqenq8HF6X/0Emh+xpgqwIUrTK5YlpuJ?=
 =?us-ascii?Q?sXSl4j+MKsuZ9GCHL5vDiMtCTp/l3cO8YyTZslD21BXlsOaRd52Y34hIlSy0?=
 =?us-ascii?Q?mVnuQF8DnP5ZE1SaEVyvXxXEsQahUJnhVA6KmCx47PP9mA6Bx1PzDEAgWFYt?=
 =?us-ascii?Q?zT6Yu+GZLJDhF1zXGNBJGu2H4AZmJ2CRiniIyUyDzWbe7T7xdmY3nwe7gitV?=
 =?us-ascii?Q?a1LLxChgTDum025TOU1Sf6P6rfEg4AJ5TTvqytVFY6BFmbGalf683u5WtHTN?=
 =?us-ascii?Q?O2sVzQ0OLGtS8A/QVoOKnwGW49Ab1dbYszTByiq8WT4IUHqds91mwu7BafQQ?=
 =?us-ascii?Q?957PvieW4YhvlA1KgcbH+VotIZKFJdQSqZYtWZLnEJRDzGYRzMTMZRr7MEAK?=
 =?us-ascii?Q?LuRBE4/54M1038H5JsEZ2E7/AKMCaPcZFNs8GUDatB6MnjpK033ulcVr8+yf?=
 =?us-ascii?Q?Np/b5r33fuc5Og/N6aATc8ytK5QTozadI+XGNuHAvmP+WBBe3f5KDGxiDsPf?=
 =?us-ascii?Q?m/txV5khEV4jCtayx/W7VbC25dGBIqCqy2nwMMt5MnFqC7bdJf/ox8/R/4EF?=
 =?us-ascii?Q?PRdDTxz4dCLUFUFFFBtPleCTVqOcpapBDp5uvF0OvdMD1ADy7CFs7CCu/CWU?=
 =?us-ascii?Q?DWL7krA9M5KDFA6XftMcN6T/jwljGM82rPfmXN9cSTG/o3nNv68xkyLAhLHU?=
 =?us-ascii?Q?RJO2E90pV/PfusB9fiIkF9e67dr4maqiK2tvgLK+SDp0g4FVg525g6uw4Kfo?=
 =?us-ascii?Q?R/q715T9pzne3CyUo0ok/9lthzLQNXZAbVJHdqsKDFRwxtZIuZNLMkUlTsnj?=
 =?us-ascii?Q?GDGZvFHi1b9SsYBxcKy1UZxdZUmMGk6Ln6mTua/Z4MMqYIdsFdkuS8Iud5SH?=
 =?us-ascii?Q?bIwVkAPaQT/uGITqkX6q2YP/D+uKJacswo+fq7Wx5CWE2RsJewAKXbR5VBMi?=
 =?us-ascii?Q?waTXYWmL34PTJemp9bXORbgmhrEu73jzTc93I3t4cR2EXUgRcQ1cXN0hbt+7?=
 =?us-ascii?Q?TP5WvZxWMZeKsYvxI1FeDB4IrIQjvHjD+DOmN0ugHfSgWtOO7yK4ndu1MGXg?=
 =?us-ascii?Q?fxnG1KqIart/W6T7Z/wVEkl0eTxNLXNtD4n03PGss7SIFMlfmf+9lA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?shWZizcKCkk/sQfKf4AsraPHvnuS0AJiCyVYX+g8rVJTlAnkY6rLhOZ3rIr8?=
 =?us-ascii?Q?hBE0pS/COXc6UfOT21fdl6c2Gne6jXhZQZg/YkRyfk1xHvIUO4GhEhnRLU0l?=
 =?us-ascii?Q?qblJYNoeFuN+nngNxle8/GCDrVjDqMTTGrGiK/S7q6EV82PuS79dPMdMqEjV?=
 =?us-ascii?Q?cNDhOFDi6YbpvmiN2PRk1NCKqx/JHN1UjVCd1PNXFuvXBvgOjQJb4dvzEpe6?=
 =?us-ascii?Q?LrstjHtJEhNawgO3pZvHPb1IGJoCxjXXeTB4YQFu+dK6E3VJb//ieAVD/qge?=
 =?us-ascii?Q?AorCODQinTl7N1ZASH0RuV3r/7gN5UlirGQHsVf5sOzoQLiAw2DU7wbd3gZz?=
 =?us-ascii?Q?LmvrJ91sQ9lnU/UM+wa++EHYS4NRLau/GLHdxIS9TbodRMhSuGJriHY+G/tr?=
 =?us-ascii?Q?rqBwdHn7SMf9fH6cLcLOIJZ3xQQJh+PNEmLBe0gHVricNKic5izVUAi2JxZq?=
 =?us-ascii?Q?xSMua437CLNHkbQy+NIRFillGQ7s9ugEk7RjHDT9R3Qd/QQXI0oglXkIanP7?=
 =?us-ascii?Q?+xr8k8b38kTIlM+rLRjuG3O7sPI88Ckx0kvkLXVA3V3oYPEBQawUx36wVmlc?=
 =?us-ascii?Q?Y0EkpWUKpuzmNYVxfxHKCU20tHXTzzro2afaBirkEQCm7LKgj3wYFSkoMFqn?=
 =?us-ascii?Q?leU+28qqE1PU4MnHrKmMWlxikfptLhQYozTk+PS/vkPIjvkAZYyGR2lI0xou?=
 =?us-ascii?Q?wFP0+vjwGaoxNa8nknrrv/a20Yj0Se4hEOuKigjpLhK9uvnSwbWl6GG1k6Yc?=
 =?us-ascii?Q?Es4bYyXp2jW8tXEylfwFwRB0GuMbZXOtMcY232UFf2pM/MxnVxwnPeNCbpsp?=
 =?us-ascii?Q?39nA+EIFGbRhj+at7wWjGDLuZk9u+I3FtUJG53wsQwVf6MSo48Lh4yFRgH2h?=
 =?us-ascii?Q?sEaeNClddY/1YPQAH7sJZnHQP43KdBti1R0RVs63IPdgit/Ac4gsC2ExoL2v?=
 =?us-ascii?Q?cp7bJU+UjKjAG3Isq6RhRYDxafApn+MF1OwgZjtHLzyRVc4Ia19a9mGsawoh?=
 =?us-ascii?Q?qzjzkw/XhXEs4aj7Ki0mOpIebZGatryEOcyNKoV2tixCvyoXzAb2VRA9YR2/?=
 =?us-ascii?Q?9RPGtOCxCZ/GA97U2owgh+p9XJ7G2SruDQwtB1ZJDEhXBMnHP+tmTHki2Q5j?=
 =?us-ascii?Q?4CVoq1AUWkCE28bzidVfgDM2ZrKGU/W0ZmPQPyU1b/TOCo0zR/q/bkQu0raO?=
 =?us-ascii?Q?lovigJL8rc53LM+z0Kkme8iONfyLA4RCxSU87BzbCKsyKR9Kcb/IH/NQZTPf?=
 =?us-ascii?Q?5+ksGMl4IYZcY7feq+p2P2rLnk1vAdTiLZG7wxheqFHMf+7jZ4MRHetB+3Xu?=
 =?us-ascii?Q?+FBne5Gk95J/hH88zfzPwy9464zPh9ifca6BtR/0OCF9I+XnAaYxZjdf03b/?=
 =?us-ascii?Q?G5qh5uQQxPPdjo3Oeqeahzly44+k4vWzC/oQTBeepamlmfHXjJSNGVR+lm5U?=
 =?us-ascii?Q?TXbgOJ8eQla8iwRiBDjhZFxUulWKLDess58Fpup0BIk1KJr/GpZs4YYlG3OA?=
 =?us-ascii?Q?N1XKXZ1wdfcU/0i66LmgT0sltEI1ryHZXRRqKGZzi2OTyksNRMoF2xy3bFte?=
 =?us-ascii?Q?yxvWjy8d6a7iqDPhpQTk5l1pgC3ZcmaeTiik3HGE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1502e40c-bbe8-4103-c422-08dd55d241f0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 19:26:09.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtRFruCzQc3e0plUegpv55JGRLibnwpCTWfgamRW4iPhA0LdwTA9eON3WPjdTfpm/a2jtryAm72U4sM/vok8Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_112613_068347_DB5A1B4A 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Jacky Bai <ping.bai@nxp.com>

Add 'fsl,ext-reset-output' property for wdog3 to let it to trigger
external reset through wdog_any pin.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 64cd0776b43d3..ddfd57cedff73 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -692,6 +692,7 @@ wdog3: watchdog@42490000 {
 				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX93_CLK_WDOG3_GATE>;
 				timeout-sec = <40>;
+				fsl,ext-reset-output;
 				status = "disabled";
 			};
 
-- 
2.34.1


