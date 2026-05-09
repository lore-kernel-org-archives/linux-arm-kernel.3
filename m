Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE60CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 01:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FgjmJeN3DRBZXfeI0Fm/mkQkblj8Nrt2vmNxgYZSUog=; b=rW3q5tAECscN9WahffTkyIWivG
	Xfy8iLhKgJwOJRz8f2OgEj5LZsotv4hDkfyVdod2drllm5pbvMELXzxhtX36FD+q7jT9R2KEGx/D5
	Dpnzo1cgzdQq+wVm+aoOFeVyzO96zA7J7zhX8tVQXUhTROUE+iFIXXZDB3sb5e4lFfRR3+lUUoOQt
	ABhwymrBzaYhtUJwRXyTdPdYD1tMwPywD9ivMwsoH8GtlRdFYbUM/lanDx44gFD6yTbkkP9GahXZO
	idHFOQYUc6aZwPuXeVneKAgh1LN11IUsWeXq0ln1PP/Vo0JHQI2lcaCVJ7AleoJsQ+5OHjum6ekum
	Yu/w9Jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWra-00000007wbr-34eC;
	Sat, 09 May 2026 01:52:18 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWrY-00000007wax-1IeE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 01:52:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyvgdB1bVk+GrHf93bb0L6umbSILVCVgF+QZkCGPeTysZoDREl7KZ4JHulxGZgOYOjqWyUaaPRZRW/mxyKonZDiB14+735/wihhIbmwYIaGksn/G0bFHLGHfHHGpN4VVvAsh6PvZ23vaSzrE18K0HmNitMpUGrgQDjXeC9iEF+mytgDA0xLlwVl09pU8fmCUcr50XPbFMsq/9Al+d/KWwu8fPRWVJCicmsDzh4us5hNSjR5b+iRFroRHuCM5qfFfuV3TVW89SIV9PVW7b42NIWA0XowP7WgoinZznG2YEkS0RuIVoY06hS7XEQxXNCxdCzWBpDZILuDaVwLL7M1K2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgjmJeN3DRBZXfeI0Fm/mkQkblj8Nrt2vmNxgYZSUog=;
 b=TLXwGBCFmo0YRFkXuKe8JbdSKdu7qh3nzkkvPtA4jsMeCruModb/TBuzha8IN29svfPiWkAzBcPIWri395JtNACa/wlDhYbrxf4nQ+z/Nhi0cmjckUAmjk8Fh9NSg68jucO617zW5Wcs0WHRynEa4F7kGcu+/N49FuenAhFA8cwhHg7M9/iFTLmnMbViBBwvDcG35d6uwLvDGz6Jyv7djVp3Khpala0ITyxVGfSCPoQo09hkwpVLKMQMUrQsyP8Vy3L71zzt5CSSk6TP7j39LNMYkSAkM15Xs92Gcw/WMNeBJ2risBey2SA7krT/SN9OCx4tRXltrvLg7EAPt1NR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgjmJeN3DRBZXfeI0Fm/mkQkblj8Nrt2vmNxgYZSUog=;
 b=YpUNJwkE9ouwLhKjcvE5aboe33/uhuNdlUuwOjTOmKSIAzKBGxLOzcIbhErQl4JEcTCT47sgwe53KY4MyPMsFN4F0XHMVO31Qbgvf1dnYygSaqkApIlWEux9QU7kmChpTxxNTWB0pTe5shC2K97eRle8dL+AzocOiw1oFiwEbh+5RCGj8k3xFZkoXVLBEn6zW7Ti158WINy5tnWhOachGg9MeWLPMPR1gFGziR/Sv47WIO5kQMj2/j+jiRyhB9vpwjOgJ3PbNItZW3FafgGYRBPb9w+f9zNjyEUId7SVRbZsIuGc+JTinq+8DUTQvxeEvpMLSdetbOQnwZuFKYI/wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI2PR04MB11027.eurprd04.prod.outlook.com
 (2603:10a6:800:276::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 01:52:08 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9891.016; Sat, 9 May 2026
 01:52:08 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com,
	shawnguo@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: imx: Fix PCIe EP vpcie-supply properties
Date: Sat,  9 May 2026 09:54:08 +0800
Message-Id: <20260509015411.3218700-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI2PR04MB11027:EE_
X-MS-Office365-Filtering-Correlation-Id: a0315a90-fb71-42f6-7655-08dead6d93dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: amfM/cN5uABK3KfU9EQKYRkvCvuc2OljJmuMRq41Nsps1++TxFKhCoKC5WWjfIehkcVLgRuK2cZyXpgISduf2t52+KlwZDLDK2oCggtl+GHuh46oYC+FFIHmzh3V5NcIi/FxW/8XZTLtXAPzN8kS3EUjIf2/VS/Vv4MtBapBJ3rw7/Kjmdgl4ecf4CroN52Zk+Pl723lrUPtBCkyYsi6uJuEEH0NtAwPPkceqQ6AZiAT17usDgSt7JRaFRjzR2/DorIkTWB+xM6ef4nvFpcwbIhAc0EYD6kiQzBgh5nX4tcFH8Okr1MJGdlGK2D/evvMKrJrZ53APQQBhtqBrjZVVVnuAhdoHWD7/sUkF2P6BCA/JYOYjNk+uAMrrb4CS+HG9q4UArsKjV6xhcRiwyFVJXTdBNyL5P0ISZTIUg9XJRo4R0e8/lAx8ZZ/kkLQHC0iQRa3vJQF6Tk1mhGsT6h6Ygw0kaSPhwqM8jMH4nM7vRNrzqNzGPWuwjul/O5WQoUC9xNbrmc2xsj22OtS5RTFs0xBYB94NL6ZW8LSkLM8gltfsNcXLA2cQNn3LWor79UEjN7DUgMEtKPph3KUAeEfKjdvtdPw9BlVLhHq/GNyInzOy8AwGF+tT4EaMi3tG6luG4JTICDLsRuWXdvgbMIr14V+09+vjPfkch7P4srDVAP3MyI1KEePgRE1+D6N33a0c9nouZ4vCYpkSF3gvvlbG/NbBMnTvVVeo2lBenNWyy/XjYJjUtY4KPnrofXJ3VQ7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+jrzMF/nBfxwh8df33nzw4i7sl2i4oLfma2q6sUX/TwYDzBLQhNlm67hYNvB?=
 =?us-ascii?Q?pqtc5JcNMUpQKzWY2EhzMY8gKDnBPY4dpm/2X05OvKL78ytOASli/5FKuKNz?=
 =?us-ascii?Q?p/SI0E87ot4HUfwtZBNkVZ9MZo/fi5t9mysnIfA//HU/JBSNm0nANEFWTliG?=
 =?us-ascii?Q?yBUJaLQ/jJHp6C08wT3Vk+faIBCjVBCDfLldwYy8lAZ0picabz6Z4dxCg1+W?=
 =?us-ascii?Q?GbnGQuN/tOa587OGpmPAXiWiPB6AvGQmZQk9KtZ//x/VJbPwdSbDQnQjM9td?=
 =?us-ascii?Q?0+CUdYxVqsHkp6p4Zd+6dAMiLonwV6dFYLuDTpL78AiXaMX8s9Kt53p4caXc?=
 =?us-ascii?Q?zjSBPmqAtC7MORBkmDtxK1gc1gCtEjIfbxP2m+BQyT2SyScYKjyMEhGJK+hR?=
 =?us-ascii?Q?93hh0tYDE95ghTC7d0v7gncJUj3PJRVRgqp5zHPs5R8NttAz2SkprGeygSbX?=
 =?us-ascii?Q?DV2njx7aPmkomYDqy1iFFfIKoWQAkk2jpjOEnMatOpn/71y4bNy+WJSYlgLN?=
 =?us-ascii?Q?06oF003Bi0TpEP/Zvod9IEP8Or7P4FQ8+7u2vPIgDhEdnq7/x3U8ZQwd1ZfL?=
 =?us-ascii?Q?I/flSXnQ24pTPmpPiTISa6hUEikHqFhqmGeWWQ+Edx/pa3RFrvSQudBvdg3r?=
 =?us-ascii?Q?B6+NtbSuCzY/mxylmJcv4LwofxNmzXOuGngkMVlul+fVLb99ZeVG4zGVCM6f?=
 =?us-ascii?Q?zNbXNhlh20m6mH99HpXkwldipduhz2rAMAtnCywfbJ0eWTxh8JDNcxdxooPP?=
 =?us-ascii?Q?POURBJo/IbDLuAuGD5d2Jr6Wd+MlY8VEt18ruxlRSVowK731hUi/J+uHf8zE?=
 =?us-ascii?Q?r9CwFGWGoyqMrgREnH6WQLV46YdUW9uO4RclbU2RM9VRf+Ecl6PDWgA39kR4?=
 =?us-ascii?Q?uI3WkjrEEfPWHKDM833+mjfZeP9Vg7lwHQwE7pQgPpi7XfpM7OjIJiLPKrrD?=
 =?us-ascii?Q?zJoNc3/klAJ6Qp/wL4TRsZwDaIVUfypMi2yODKTdgewctf9FP2xk6bLrclnd?=
 =?us-ascii?Q?vqSe5+sGPn2zFZpSn0Jo+t/jdNgz//GK2syNpTqbghBVk5ANbfo9suZG7DAh?=
 =?us-ascii?Q?kC0ddR4lI2EDaOT2iuiLLz3RwSCJ3MBXspR0sjnMs70UHPASjhlXJzwWzh7K?=
 =?us-ascii?Q?usISbprB0tjIPDNWltYyCkw17kCWgI2k/2yeVhxHEd/D7V9yEdZJGrRE9ni7?=
 =?us-ascii?Q?10IozfarjFz2aZaxKwT24nbux/dYwjOwqdriLF2osJrJU/ONHLEjEEQQ0Um+?=
 =?us-ascii?Q?ADYAJPOE4iF0D21oTq5ysWlykcnpnHGNKKzIhNoaQHYxpJC3JolYfHZNVxe2?=
 =?us-ascii?Q?P9AFA6+z64yuhomzTNkAhIaZAG+2HrgVnvdGH/mAp/IiKGA8WbQdZdJsn7mZ?=
 =?us-ascii?Q?ZuAFFQF5UUqdRoKITlZG9jW7dkNZKUY599PzHdcLkewWjc+VJIrQyxiH2TsP?=
 =?us-ascii?Q?rmnoDVQ9jPEL54tv1PUDVo+0SLPcjoOXFeYmv+a5qyP2YKlIdXBf/6qWpFn5?=
 =?us-ascii?Q?fXfeXtaimwcvVgkapKMJ28E2y6PQSwzWJK0WXGFaxA6MzgvwK6n6Fj/yq5IM?=
 =?us-ascii?Q?tL99kRNkF8WQRd476ZJcdhpXQNHR1B1fkeAb6LTnUVgrBB+zBTWP8E4lWafW?=
 =?us-ascii?Q?nOXUBCBbbHttIDHje99Wt+xzsuZVt8PK9SFkD2EeKpyQk+xPnYhW9uTbZXFy?=
 =?us-ascii?Q?MsjUurd00KJ1SBkfi+z4AxvsRrYhR7eYwNkTvXu1AyflCJMuV1gvNycjc6JI?=
 =?us-ascii?Q?ay+bpQcN2w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0315a90-fb71-42f6-7655-08dead6d93dd
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 01:52:08.0018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+iOwM7+vXEV4hAU234JC8/NgMHRzpq75Y0So2jq9+5EYCi4WxFkJ8pVaGNT0IYz4PX8F/q8xYOaqrzSo6OJ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_185216_385333_18645316 
X-CRM114-Status: GOOD (  10.03  )
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

This series fixes PCIe endpoint mode vpcie-supply properties across
multiple i.MX platforms.

For PCIe endpoint mode, the vpcie-supply should either control the
actual M.2 power supply or be omitted if the power is always on and
uncontrollable.

Current issues:
- imx8dxl-evk and imx8qxp-mek: vpcie-supply references regulators that
  only control W_DISABLE1# signal, not actual power (which is always on)
- imx95-19x19-evk: vpcie-supply references wrong regulator (W_DISABLE1#
  instead of actual M.2 power)

So remove unnecessary properties for imx8dxl-evk and imx8qxp-mek, also
fix vpcie-supply to use correct regulator on imx95-19x19-evk.

Sherry Sun (3):
  arm64: dts: imx8dxl-evk: Remove unnecessary PCIe EP properties
  arm64: dts: imx8qxp-mek: Remove unnecessary PCIe EP vpcie-supply
  arm64: dts: imx95-19x19-evk: Fix PCIe EP vpcie-supply

 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts     | 2 --
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts     | 1 -
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
 3 files changed, 1 insertion(+), 4 deletions(-)


base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
-- 
2.37.1


