Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF321061B21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDil+NYsv1aPjJjs8ClD+KDA4JkaiZ0WwI+0mI+BaZw=; b=TKyV4vOcaqSGqFS6UCcZKu6kpW
	ozk6sohXp/q8V99OaK1AohndhI8XBz+Y4MgYykRnlfZmaMUwjZYeO1Xi0/+NCInFT/HU+0kbJ72Tl
	HEFcIvNzYcdEDa6ys0TI7aVmCG4ezpV3dvXI39cWFGrNmGFeHtS2WTmePpJAn8aJTosKvAR4UJkYp
	eZh9MnE8xWLNi0ifrPJUGZu6BZ3gqN885OghU9FCQQWJzNephptZViMFHkaxT2F3BIBscuc2A+3YL
	eT9aTqaPD/F47CjdwxCCQF+Lr0vSgsjwSx7wrTz/GyP/aq/KIQFXE1Zj4V9BVUCMm8FJaKWqrBiCu
	N5TbW3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WKn-0000000CmXr-1PYd;
	Tue, 31 Mar 2026 10:28:33 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WKl-0000000CmWf-1E7r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:28:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3cDjOkqpwvgX+N9e9leAo326ySdUIf1i8X+ycCTaNvflY/H7p+xJxIgl8XhtOa0OMqD/kaHWzautULKmlru9zEjrBd08NSWSZDbbmU+XTfv/EUCjNVPPNp5nS1u+hS2ZwmuKlig0tiUTkYXMa/kwkw3W8XxzCkD6NF9bxdU+iOqLGfbY4l+LC2W8QAh+ZYq/kprHuw4xu4LyoMHrYGDVWEOZ22FMZ/jOiBJhXKMmfwm/Edlhp5cz+usxJrQhodnVdEb9u9GTVQ4hVpQh+0cqtBeSySf0GCUfWMxQeBzEHRsWAd/Bfhx/fiOHJ+ivOnVgV2Y1Hf6WkvV/RGRL3Rqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDil+NYsv1aPjJjs8ClD+KDA4JkaiZ0WwI+0mI+BaZw=;
 b=UAZkkwDY+521Kh2ad/5UC4dSxTIYB8CQU7iZhgwFKYRXPsaZ53EQUk8/LDCYmptTgd/Y5EBX+2PrF9xH77BDDwkJCcvARqlRGqVQ+9kRhR5yYprwLsExIfWW5+XqphNuyOTMVojbVmidW3jn1WSrx1idAI349z52G0HgtWItiqJdpZZitu3IFlwln2P6CG5XQSrjNR5J2gICBLw2qaoiLF3aI8r7D/oDrdruW6H1YYDJ1QNwwHhJR1x4pawD73gWlesJGUKqwY281iS1hCalGM1/2D3EvUQsfPpjrtsFlRnM/y9CBZAvxRPPQRbPEQmA3gDjTAMZHuSq5CDJ7tLwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDil+NYsv1aPjJjs8ClD+KDA4JkaiZ0WwI+0mI+BaZw=;
 b=dhHYCxTWaaDNC+bKyrIO1BYUn0HfaT8tY1mT+BNHZhHQaymsLwpVli8IunaFMHZgjDVTmlalNUfXkQzQ7U6NmTu+LoFU8j5istFJdEFdDA0x8HutaRRHFdfOkQgf0gWlxP4gQ/6OyGGAr/R0Bv8Cunz1TmjYe3q9D5MUIrkMs3gSOhIVZRaZYH72ec3laBwMC+3gfCHh4I1AmVDNa3y2V1H+TchUHYpbK7/Q9JcRaM0858itVJFY+QuAUKTF3TJcCTDordWNhzMaa1PPX/1h5B79wJO2s+8DeZYOz3MpGfpNNyTkKeHCz+QhT18HTzgxNV/JN8/P9Ts7dPncmjeZ/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by MRWPR04MB12354.eurprd04.prod.outlook.com (2603:10a6:501:81::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 10:13:25 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 10:13:25 +0000
From: Robby Cai <robby.cai@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com
Subject: [PATCH 2/2] reset: imx7: Fix handling of MIPI CSI resets on i.MX8MQ
Date: Tue, 31 Mar 2026 18:13:31 +0800
Message-Id: <20260331101331.1405588-3-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260331101331.1405588-1-robby.cai@nxp.com>
References: <20260331101331.1405588-1-robby.cai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0094.apcprd03.prod.outlook.com
 (2603:1096:4:7c::22) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|MRWPR04MB12354:EE_
X-MS-Office365-Filtering-Correlation-Id: d69ab4f3-00bc-4935-5957-08de8f0e2517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: gCwuVxHWGgQOcPjAWbWYS6oCtqbUZTTXSEpWDsO737BOMFoxORQWXjeXSKgjivpnJZdNLrO7WJvCiRzyH2nqmvlSAFb5RK63bgLCk5bICDW3lExPQf/9hKdagpLy5ACuTzCnshFp6OcOuR0V6cY2Xr9zYLt0Gt5sHK+6HSeUvyWWejUVohASJnq/bOs80JYXB80Ag4QmDZU6sgAZ7ldbYkJZdZuyYffYjT8pwag584Eeoqg9jh03O/YDoKuvE3cEWZqa4BbMrUl3arb8HNERaFKtWM+5TieEsF+AlClzhpin7xXKXJMPLXSM6Z5BmoK0a5ZG77lMnblxiO1IUazsTvGGbqoDpL2ZCEe7/vRnG++G3AlZGBDXtoK9NsDDSKjK0Yc4brjO0pCorpz382RlEiVj2/1FItrMUi5X8aSfdIbx7PZ7McBky1iQktEaUwLm6jTNMWmAOYI/3p2Uf8+MoLgcnqH8tosyFa0Ff+ICX50x6NoloW+ZefvlNnx/9zL9StT7VEF+17pGXyEsGZotKz1qRuFdMUAA6GRUGwO1GWRxRgYeTXKativN15E+FKjOCNRj3jEKclJRucTsDbuoXgZ3+aa6vSZ4cW52q1FIFG7kaZuc7YnrLd8iWKdVJki4byuYqM3iGocuqjx/XCZKnt1IOY86wIlcZWDrcDey3k1eg1qfB/vjZuCloX3n5EUoD0/WFQAGhccsH+BZorOT+1ifNYgzeUaglmuAnBRiyRTOJD/TkXtbmYak0m6xuYQfvrUKrQ8rtBOqDMcta2A3OeUkxSTGqZGQmBk+eK4U1qA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qcPiXLbOL26GWcQncTEZJb0DoX1CBaBRTiy9wQV66yUEIHTTF6jSLMND7vNW?=
 =?us-ascii?Q?IrfL5KIUEdx2yykg3WeXv3JXHJlNQEeuxpEDd9OaRoLeVQcAHu7HxhFH3tEU?=
 =?us-ascii?Q?8mQIcu6ljM+l1P3l6w8YkslwbuXzhOhxtKBJUG9LFSHccX0b9kCtqbswxJYF?=
 =?us-ascii?Q?Z7R6/plFfx09a4OGPQt0u/+MQJIqTWvbRzWZcE2CjJZiExjcQ5wUpgj2UQUd?=
 =?us-ascii?Q?RAykpHkKT5ubXF0xUC6E+0TO4IIngtOXvtAUoSc9HO+OPX06Ys1B0QlqlkAU?=
 =?us-ascii?Q?xEMJAqfIDSLx5O5239J1MROfFaFk31q67Rc3XtrJgtf0cmUZyWqO5uHxzICL?=
 =?us-ascii?Q?MWss+eMi7r8/6XBWMG9cRDF+1HQ2KXmtXQJQEmV3T5HPji8urqK2GL9QS156?=
 =?us-ascii?Q?sy+qBgsJznN/bly107eG6AzKu+OjDQkq6gTRJRl6iz5Ro+oH7W0z0K4Le4xG?=
 =?us-ascii?Q?2PiqsXmk9VYeB4xA/pHprNOF1hH9plMydFSWiLm+1bwlYMiI2dtecglg0oGd?=
 =?us-ascii?Q?41mo//9Mjsb/H4/RqbZ1KWepZxVqD6eYscD5RVDlO8/1mJmaNdd6WatsgmOU?=
 =?us-ascii?Q?UGVBpYTEXSOuFHntmuxkj00DT9+6VRlShiFyTwHBf/uJLAEMmwJEmLtTYjJ9?=
 =?us-ascii?Q?hGiIyk9Rxbyiyc3A+EkXOat2t6qilhUlOiOxu4VNp0tEAcN50/6/3pZFeJ50?=
 =?us-ascii?Q?zFwcxWLiiNBSCce5B4AsOw+F0Uv35BfsENCxP/4Y8drXQNjFiv0TFMWW+Xx1?=
 =?us-ascii?Q?R2/cuQDIu4JVAyZNQ7w86/9YW42RdV3+7fSqjyz81z5acbNvV5s6RzaMFc7Z?=
 =?us-ascii?Q?5faF8AZDOKaVd9VU417oMtPZGodXvsCkgk5cc5UDVpaSKkfK6UjmIRbzh7MS?=
 =?us-ascii?Q?mIl646ZrM8/PYWy/MrEp1NgMGH2K9dXNV/oCXnAxBWYYw4H1IXsAnBnIMdFf?=
 =?us-ascii?Q?Willau2Wt12OIeK8/0d8fD15273HwVLkCG0NxoCquAOS8Ud68BYLP+yOtvtm?=
 =?us-ascii?Q?dJTzrWfhQcZhKKod8XpXwwgSzUyAWIOvwtEIicRxDZa07FSIa3KH2Bm9viGR?=
 =?us-ascii?Q?r/UjTm73sIphs+yejB/MItlVOPD85/r8N/yJqSJYtTSqhYYmNst7At0ps3Ds?=
 =?us-ascii?Q?MAPCSV6pw+ekGZ+a6Cj4FsimoDAF/WmaJTjgp98tY+2e97dyEPYNawtzAlUa?=
 =?us-ascii?Q?f5r+YWuUb/uZOKb3Y8Zf+gLHlhJX74TA6zQKi++gohmtr54L5+n1+5Iwkz7f?=
 =?us-ascii?Q?Ta/lFG+8XJbhjaQIYud4v6DOVRms5sdKvXyHKdUvahREY7Vm8tf3H0ZReBHS?=
 =?us-ascii?Q?Fb8+uz1tHSsCLDBAXCZqANjfYEoJtSXCFsQF1oncDvfkC2i+VuoVYuqoDseQ?=
 =?us-ascii?Q?H8XdIHID5XOrrQ4xRFN1YZNSRB3YQE4MVHpFECrNFbP7uPay/IajxzWAONzn?=
 =?us-ascii?Q?1B6fl0KNUjcEnAHHx+vfyVljjeDXV4X1ozrB+Mp9vOyJgEHScQJzXH8ByN0T?=
 =?us-ascii?Q?JIay1an715/jX6J1FLZdWWxTElNf7B0iBPiMoYKyDCqfg4MfOYSKA9ZKEbXg?=
 =?us-ascii?Q?LLaALfY+DKKVrmItZR+WhAvD0r+bsqoxq/MZPIVQkpDpwD/DXslf2PrzPF3x?=
 =?us-ascii?Q?e8ewVIEAzluGbAmP5x4f2kcIVS2z0+7vEeQ4Pg8ziKHrHXKPMIhfWGwhzvwU?=
 =?us-ascii?Q?579kTNixw7bL+8m+3LgOivuIKiUDHJpErn/ec8W9e5ZPzp1VziKl4BTMeYTQ?=
 =?us-ascii?Q?oZ2X+I5IJw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69ab4f3-00bc-4935-5957-08de8f0e2517
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 10:13:24.9989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiPkLY5q/UH52+cMMzIBiNEdr40b1rGHOGaCUso7HnYBQYfJOL/kKKmiIfJlKhfjYAonDq/e8CFdb0R7/AMNKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_032831_328790_863BB194 
X-CRM114-Status: GOOD (  10.98  )
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

The MIPI CSI reset signals on i.MX8MQ are active-low, but the reset
controller driver previously treated them as active-high, resulting in
incorrect assert/deassert behavior. Update the reset handling logic to
correctly process these active-low reset lines.

Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 drivers/reset/reset-imx7.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index dd01fe11c5cb..b7048e1f10df 100644
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@ -202,12 +202,12 @@ static const struct imx7_src_signal imx8mq_src_signals[IMX8MQ_RESET_NUM] = {
 	[IMX8MQ_RESET_PCIEPHY2_PERST]		= { SRC_PCIE2_RCR, BIT(3) },
 	[IMX8MQ_RESET_PCIE2_CTRL_APPS_EN]	= { SRC_PCIE2_RCR, BIT(6) },
 	[IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF]	= { SRC_PCIE2_RCR, BIT(11) },
-	[IMX8MQ_RESET_MIPI_CSI1_CORE_RESET]	= { SRC_MIPIPHY1_RCR, BIT(0) },
-	[IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET]	= { SRC_MIPIPHY1_RCR, BIT(1) },
-	[IMX8MQ_RESET_MIPI_CSI1_ESC_RESET]	= { SRC_MIPIPHY1_RCR, BIT(2) },
-	[IMX8MQ_RESET_MIPI_CSI2_CORE_RESET]	= { SRC_MIPIPHY2_RCR, BIT(0) },
-	[IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET]	= { SRC_MIPIPHY2_RCR, BIT(1) },
-	[IMX8MQ_RESET_MIPI_CSI2_ESC_RESET]	= { SRC_MIPIPHY2_RCR, BIT(2) },
+	[IMX8MQ_RESET_MIPI_CSI1_CORE_RESET_N]	= { SRC_MIPIPHY1_RCR, BIT(0) },
+	[IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET_N] = { SRC_MIPIPHY1_RCR, BIT(1) },
+	[IMX8MQ_RESET_MIPI_CSI1_ESC_RESET_N]	= { SRC_MIPIPHY1_RCR, BIT(2) },
+	[IMX8MQ_RESET_MIPI_CSI2_CORE_RESET_N]	= { SRC_MIPIPHY2_RCR, BIT(0) },
+	[IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET_N] = { SRC_MIPIPHY2_RCR, BIT(1) },
+	[IMX8MQ_RESET_MIPI_CSI2_ESC_RESET_N]	= { SRC_MIPIPHY2_RCR, BIT(2) },
 	[IMX8MQ_RESET_DDRC1_PRST]		= { SRC_DDRC_RCR, BIT(0) },
 	[IMX8MQ_RESET_DDRC1_CORE_RESET]		= { SRC_DDRC_RCR, BIT(1) },
 	[IMX8MQ_RESET_DDRC1_PHY_RESET]		= { SRC_DDRC_RCR, BIT(2) },
@@ -236,6 +236,12 @@ static int imx8mq_reset_set(struct reset_controller_dev *rcdev,
 
 	case IMX8MQ_RESET_PCIE_CTRL_APPS_EN:
 	case IMX8MQ_RESET_PCIE2_CTRL_APPS_EN:
+	case IMX8MQ_RESET_MIPI_CSI1_CORE_RESET_N:
+	case IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET_N:
+	case IMX8MQ_RESET_MIPI_CSI1_ESC_RESET_N:
+	case IMX8MQ_RESET_MIPI_CSI2_CORE_RESET_N:
+	case IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET_N:
+	case IMX8MQ_RESET_MIPI_CSI2_ESC_RESET_N:
 	case IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N:
 	case IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N:
 	case IMX8MQ_RESET_MIPI_DSI_DPI_RESET_N:
-- 
2.37.1


