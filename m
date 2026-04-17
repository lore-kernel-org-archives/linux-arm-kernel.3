Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33287F433D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=drHDymCWpvc3sbhDRK7SJeJv4ip5FFYCjVL+uqV6g1c=; b=WXZNm6QRnuQh+miuVzWDyembY5
	Epwh8J0WRuBi4PoA4hy79AxP47+7PKB/lbfpLZ6W0roqOtjo+m1lh04INWid009Xxdlv8RTFg0HZl
	DAv4jbhU3YQIqMmE1QtE8FPoaLrxs8VVFuIJAMgc5wjVjKDwFVsXoW1c1dbZJzGnpqa25OGBt3K82
	IpKPG4tFvyIff8+ENV7NLJyqU52XpTJGbZ/ZbSJ1UqCSyRZW/fAD9LdOo6Em4Nuqu5EwpwDYa93iM
	hNeypq6cjTIjjvuw76ZuskfqLurddO8dIo9FZsNx0QnnONsz6u+mm6lWDfERewP4A740jmYlIJ8cP
	RbWxG3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeE8-00000003eIn-0HBb;
	Fri, 17 Apr 2026 08:07:00 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeE5-00000003eIO-0DiS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 08:06:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UM6gE2LmU5x3O2NW6yWZT/hCA2N3F9uZ2kaNauiaas85WihqdxCKlESy82+W3tJhLdZJYtReSMUkmR3N5AuBggPCNm2feZ0lbZynAOpeJn9BwVuLN6KXLugiIi4oz4iMk5OrbPRCeOjDv8jOVf5O8GIjpeTh89UPxbnx9xKWoSq4Pfb7w2DGiZU2bwcfkKR8jSyqi1NQk9r+9DIextJpUxb/ZVef++9+4NmhVZdTy1N8FhOX1Ien8hwRgWRFV+lRbkdax/RvIdDplF2pJPRrjJ5gYbRQfhBFNLqX4TGmzffN2KXHkvVtA+G9ma7+XVFLjlTyDl3xDz9vbbHV573uTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drHDymCWpvc3sbhDRK7SJeJv4ip5FFYCjVL+uqV6g1c=;
 b=htniT6iCaJt8JbUVIH9+WxInW5gpSkMBQjc6sLuGlJ7eE2axL6zNs0fQivip1hCc5ud21Nb0o4kPJpyxRJIjfLtjf3JGFzL4+AuION0v0o3VCaiVamORqTKUrRuWdXEvhAffd5LSkAT7LiOaRkpajU1+MymGmNJSu9AX0Xj28STt88nCCeB+n2bQ3WXgpyscCnyxmgy932IySnxv6am1P4njmdv1PULe2ndsMjNJJpWOMUkJdxM4AKOCbhK66kyXQq79VJ4o/8y9zr8SuGYsLmXy14vYQj42HrC5tMz6J2GMX/ezOJ26vmlTJt6AxDhRQ4Q0y9wDM/jl3dFO1hZd0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drHDymCWpvc3sbhDRK7SJeJv4ip5FFYCjVL+uqV6g1c=;
 b=lBl42riFp9pLyiII2sQKOjS/V9qa2TQiRwtZ+CL18ra9wUAqoM71L8nlJQmOERPEFSZzWZurTindnN6bUNBlag7b4yBrC0A+/9EMeGP2UqYjrivqg6lZ1DK5oWSLVJjCAwai0MBEbb4IGGUSZm+hFhlnm6QhBhdCosAweM3Lso7ORMsfdB9ZWh8izVAQ0TNu/UrzXu9R9asY0R+p8pOXQUmZv+m++ADtMTuj/rZbZ5h1tceiAAnvDrTrbRPUv0I+fBim61Ii26B3999DtwdjW/YDVzczIJaoi5LJuRsfUCECbpuHYsaymtvgzOf9Ajz5LD6t+vDeEHWyi9GoHG/XDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by PA2PR04MB10158.eurprd04.prod.outlook.com (2603:10a6:102:404::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:06:50 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:06:50 +0000
From: Robby Cai <robby.cai@nxp.com>
To: p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: krzk+dt@kernel.org,
	andrew.smirnov@gmail.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com,
	guoniu.zhou@nxp.com
Subject: [PATCH v2 1/1] reset: imx7: Correct polarity of MIPI CSI resets on i.MX8MQ
Date: Fri, 17 Apr 2026 16:08:51 +0800
Message-Id: <20260417080851.489303-1-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|PA2PR04MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b67f2f-addb-49e4-8c4f-08de9c58476d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: y6lJOoOd2mwszVm6+EOh3aFs04JIiDUTDEQ0z+LKfb4rrKtBMyXYCXdm/XGxOTwb0jMkcDHDJYTsdIMdPLQm4wjdXhR/3dvB1Ckki2HVe0wY4X0TorUbPYoACVBT2XlEct2MS2Ck6n5IN83bxYdP7dBZ4ptZS7xdaYdxA6Obl+PDi6bnEHFJIy74rlEKHSRoX+CDl4UMxt5yNFVFESCvSmmOIAaNIh3yAX3sMeL+pKN4sT8uFKdbDOR5W9iyC5FDvCznBKRuRjI+aTlrrOdZFZq8eawr69Qh+xmkcYvn7OBFKYKDfgybUCKdNZh2ipgK6vTafFDE3DzIMvZsd8wfprE9aCquPhwQgpYiJ1k+0Es3vJLCIZXaxa3wTx2GNQ73s3n0/+/j8XOCPJzEq+gT/zmhTBCkk+IFZYqAKjX2/rWVsgvby1UC42K3uo/DlVv+soz26YiOPplrF6Hrqlf2UqAV5zEoJ+5JwiBbT/xmRW1w54Fc3GZsxnalRMZ9mhHdU3jX6+sCVs0SrQLff3hZ/2KiVPX2F2FDvKs1QaU0dkjazlUU+MzDtJLaXySHXeTZ89zZb/4KTvtmtGEZ95PDZpzKukKWHNdiaU52Tpd2U4uMk1zWyXQpT7VHVhM4vDmCrTbB8P4lPt18gytvK1naDkXMrbjyzMNzU0wts5gLPNihbXvs0V9IFJ5bmG0EQqQNnUECkEHQADvl02AUBBVUp+88gkfk7zoZjLyDJ+0zfnD60aS/PmYFQy6NHNgpuHTPGopIz6GEGJPWT4tM5tyWVgh4J/fN/oqkSSecNTtiWr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OB27sD15BBRIAT6vtEYCKJwLekLBrd9B8cQENudIoczkNlEHRSc8I20GDZae?=
 =?us-ascii?Q?wxSeICcr8/emc2aF8sV2Xs6FIoKPV1K5e8fVvXKfausulmXBlRX9Xasl9SyR?=
 =?us-ascii?Q?4GnKIseHc7s92UNCyi9TTVjFCauqymCgt6F/oq+xadtF3PQydXQ2nyBca6zR?=
 =?us-ascii?Q?yfDFZG/39eHJ/TvcFtclVf3yQTQ6dYx+lSpmKpZ2UTcUZb2OdBWbefNiENsT?=
 =?us-ascii?Q?s4AR6mQ8aBQIqp8eryFKiBPUKdwkXPn9Ufo0sZgggCs7XEEP6hP1eCSovbBS?=
 =?us-ascii?Q?mBJ4EkVkIaF3Z3NgXaqou+qoTXFqt4YRSsNWbir64Pp1WKBeZOq0Pn5X0k3x?=
 =?us-ascii?Q?5994cCu1omL6x6FlkWbQBF/mNqHIZSYwLDtPpk74iJsOeWPHfkk1AentX2+h?=
 =?us-ascii?Q?c4rh4IlSd9TMbXk3Ozpiyc9X/UdC/54V2swUwqHWYXFAtMvHGYnay9HPnUEg?=
 =?us-ascii?Q?H01pyeTG4vcs8FhADUmFj0wmaWipx9DbzZ4iVsbkd7+PCdQEVhVM7X866A+M?=
 =?us-ascii?Q?fe5CmIdIVch9gYDUp/sCnn2SSp5L0ZdLfE0Cz4jI5csRg+ZmerLr5XxL1ulG?=
 =?us-ascii?Q?w+8BE5CjfBa+ZScnZ0X4C2RYC2xk9phFmI6w0DczB4+LS/ww2K5f/OrJVEUo?=
 =?us-ascii?Q?ec7adF6o7F7Q63A/VzGRMHxt7mGVV0L4Qr4vmuGH6gRDe//tWqJA1TE1A4pi?=
 =?us-ascii?Q?Lztu2DJSWpL1YxWNwsb5cn6xHbHkVj7OjjSs3GIPpc8bWzrKl9u0h/Qu5+os?=
 =?us-ascii?Q?gVomtwIb5ntyIQugHVkJdGdnrcOmOEmtvUzQqIwU1o7RvtvXt1BXlDdnMLiv?=
 =?us-ascii?Q?9OhWz1/4/gFpT9qm4ZC5ZZFb7QPUWl+bijbKeSrI83OU6nFHqLJtyqajGpp6?=
 =?us-ascii?Q?R9oFaGwK5l4G7715Wvc3sIiTJucX4Xy2wVpKJFEsPdazDyyKS5aJ4qyY8rYx?=
 =?us-ascii?Q?LFv9rpzQqOMcfzHpaA9J94UGwvNGTFl0fSzpNlcii+js/xPAVOORwbK7WzID?=
 =?us-ascii?Q?/zJHnzh93BBXWWi73/m1k8Q9siUX16X94xbC9MIOkxq6nrO4C/O7ux1YRcN8?=
 =?us-ascii?Q?wV6d3Rmr/5dgcuI/te5L3Y1L6x37NkBTsgTeD30+Ye3ptT8BFX0pyoU5qvk/?=
 =?us-ascii?Q?zfJhPl9cY1j6xkHXspJ2M1iOXPrlQrY3xlSVAgL+JR++AMr2rO6yVvXZAbnx?=
 =?us-ascii?Q?1d/7DIscKXAnrrgmq5oKfY0fgbKzg7AH1SbcVkQ6/pe2yMCCHma3XdMQ58jL?=
 =?us-ascii?Q?0Dtz0YduhxPr3aJb2vAhedj1sXledNISBgD1MVTStalGkxcQG240iVTWpqOP?=
 =?us-ascii?Q?6FSFJijJk7levc1X1we1AAQEVzAhyVA169DDwmDSYbMezQbcpyKTkqWrgcgj?=
 =?us-ascii?Q?F5oqp3LN9f+d1zKCqTR5sNcECuqGEP8UTtOt7U2DYe6oLmCnhtzd9WoXSFfU?=
 =?us-ascii?Q?Jg3a6YzF0OMcSnTvr9hVHQUy+M4oM1GZCPCv/EMlRYaO/+Nbz/bbjvl8q43Z?=
 =?us-ascii?Q?4Vy4ZiFr/jN/mUWNrLdUCiLoqBeCQSphP8d7faBI/dzdwdr0vlTZ0ybd+5K2?=
 =?us-ascii?Q?G4OvPr/qcGwYRx+sB90WLFQqZ8orQ772iVUYAB7Zz5dTw4xOpLL/opDQeTAy?=
 =?us-ascii?Q?5bOfb5r5QzkZTtmnAMANqLfyhCbbAEi8oGh2CtiOuA8par4d6p9VWPbPFmcf?=
 =?us-ascii?Q?cE8X4ZiGmx5wHI5RiNEfDapZVF1x9K2Tq3HaK56FbVfR/52KZUiFiNmXn6TK?=
 =?us-ascii?Q?lvILlbR1qw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b67f2f-addb-49e4-8c4f-08de9c58476d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:06:50.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KP50CJ+BzXnbCXhcuM/kNnysGUGZ1s+QZXKVsA6ce/QUrsP2j2nIwy67oSXTX8L+z4xiClyQM/O4Z9qNhxPcFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_010657_129124_98A80839 
X-CRM114-Status: GOOD (  11.05  )
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

On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clearing.
Writing '0' asserts reset and it remains asserted until explicitly
deasserted by software.

This driver previously treated the MIPI CSI reset signals as active-high,
which led to incorrect reset assert/deassert sequencing. This issue was
exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
release reset").

Fix this by reflecting the correct reset polarity and ensuring proper
reset handling.

Fixes: c979dbf59987 ("reset: imx7: Add support for i.MX8MQ IP block variant")
Signed-off-by: Robby Cai <robby.cai@nxp.com>
---

Changes in v2:
 - Drop the naming change in response to feedback from Krzysztof Kozlowski
 - Refine the patch subject and commit message

Link to v1: https://lore.kernel.org/imx/20260331101331.1405588-1-robby.cai@nxp.com/

---
 drivers/reset/reset-imx7.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index dd01fe11c5cb..a3cb8244d76a 100644
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@ -236,6 +236,12 @@ static int imx8mq_reset_set(struct reset_controller_dev *rcdev,
 
 	case IMX8MQ_RESET_PCIE_CTRL_APPS_EN:
 	case IMX8MQ_RESET_PCIE2_CTRL_APPS_EN:
+	case IMX8MQ_RESET_MIPI_CSI1_CORE_RESET:
+	case IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET:
+	case IMX8MQ_RESET_MIPI_CSI1_ESC_RESET:
+	case IMX8MQ_RESET_MIPI_CSI2_CORE_RESET:
+	case IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET:
+	case IMX8MQ_RESET_MIPI_CSI2_ESC_RESET:
 	case IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N:
 	case IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N:
 	case IMX8MQ_RESET_MIPI_DSI_DPI_RESET_N:
-- 
2.37.1


