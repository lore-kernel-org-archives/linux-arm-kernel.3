Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5AECD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 03:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waS3W5jjM6PENBtP2m2XRbQsLXPLIjfp10mdmvF50Bg=; b=Xi52k/5udUAKhHtyFD+OVLV16t
	ywOpdVvHSJrjxGs1koAqJmLlzHSoYpipJE0pbbyIOyk+865geS/iN0AIFEVOMRQrBMcfPJIXY5eoN
	sCuJvz3UelgDfoV2r2EtOPv7NH0VnCEnKSvnBwfGxfLPN5lAFB5oNDHDC0T9u9r8sPxX/EyG9ZCND
	fxo3KtvznvTitA84WbQ4JlIDgZHS75bKhzIJYW9tPiURb/81gG9ZfEe5oraiRzUZvz2SoyDFz+tGc
	oieZeGpkHbNonxFkfKpLRnwxNWvQhkueAqeh+IQh0fHtD5E0iPegCFapMBYW5ezVAJAnc6rAaltDO
	axi/IQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVLSa-000000002eh-2Lcg;
	Fri, 05 Jun 2026 03:43:04 +0000
Received: from mail-westeuropeazon11011012.outbound.protection.outlook.com ([52.101.70.12] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVLSY-000000002di-0Hqf;
	Fri, 05 Jun 2026 03:43:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7TyS0hSZIXo2ISM8suMuJvw6YzseaJDdEk2U8qddGdMhU9zG1LdJYvr4yekTF79UcZbYw029nv/ZkPySnBI34fQ+mab/ZlUvTrcmQTd0GepcHiRgdt6PKSPTZXTwqtA2MHWtoXaxSqNMhccyMIlJ/Yjx9rAZyDDV2XzrMC/VzyWWbVuivAMFF9U1gKjL6Z02rEsjXajmFFMGz6Ovtj37CQ613+K4DbpZnyQnGo4G215UQb/9qW1RnmRw/3Wb+/8M4MDM084jItJR05aXwi+l/tGapdugHhZRcsLHS0mbWvUXOKOtalMh85WbPvgQrIBP9QOvntgiwVArCvWKOlIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waS3W5jjM6PENBtP2m2XRbQsLXPLIjfp10mdmvF50Bg=;
 b=BU3LgSFm6ltgDakEx0nrMb5o48+oQ3A0fNwfJrUrQZ+oiv2WD8WQyq/XRKbjmrizQtHs/Uhqty5MZLEk3y/fvCVXh4HeixYPKiL8LMILWcZn9dAjEjFE05GdcnSRHEjv3HyqiZuAfZYBRDCbK9BQsk2CWfnl8VKTbrf73sCzuyClPV66y4eWAvN9ojb/kvRum6/p4PTDXE+cAsGk5qpUfWr7ce0WsT6yfcphY1F8EpjLXzpVDDy12Ld46prIhgzAGElUkxYUEEodtiZNUl5iwgCI8kXqzTo7eP08sACjIR0KeK5aXlhDo1yPDN0uVtmwA+FD/N04/fRWcJvL6cmhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waS3W5jjM6PENBtP2m2XRbQsLXPLIjfp10mdmvF50Bg=;
 b=PCwsFAW0+8pAe43Cx4IzsE4f/2mBMAI9pCxBNGo/qxELfKP7fCUHAcGYrIBHE6xRaszRPfwYJTS5sU8gC11WE9WzJ5sPTAV12JuzMwRaPQQAPuicsd2IhzRzesC47vrv/sqkIdqLrRY8oGqjF2TJr85ks7GwAVJMY2XFio7XFO92npLAEmeWrd5GmnjUEY+ifz4FwONRF6xOQ9BJI1GN85A/eQsb0zXqoM0qz8/Dg6mv6uoZ41+CixLIH30Fs5+02SAacjV5oGx13XafgFcwDAqWRSNYrdsD0WLqoQ1eARUx84IbKS3quF5epHtA+wLAU60pm3Ur/h87mwnXKBRrWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by GVXPR04MB10755.eurprd04.prod.outlook.com (2603:10a6:150:220::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 03:42:54 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 03:42:54 +0000
Date: Fri, 5 Jun 2026 11:44:25 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: freescale: imx8qm-lvds-phy: Fix missing
 pm_runtime_disable() on probe error path
Message-ID: <aiJGGVXC4IZgmbSo@raspi>
References: <20260604-lvds-v1-1-b8e1ff1bdee7@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-lvds-v1-1-b8e1ff1bdee7@gmail.com>
X-ClientProxiedBy: MA5PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::13) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|GVXPR04MB10755:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bcf6760-fe81-4313-c11e-08dec2b486a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|366016|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dd39grSb5htmlwxmGHUvNKNyS0nOCfT+1oT+NF66jwKwYOIEH8N0fkfqQE7FtSwzZJ1nl0CJ2EcPOuqTzPYuocMZ7dDnO8M2pxABpTDa3NFjf7/tqcNYiRDcCDgQ/tcENCQyZGg2byOFw3gHugrzE8d1EbBHleoObN+WEm1NJKwxzWIzGeEtqOAR8+kMK+CMZ0aAOhSgEJ9unnr2rk2ZDJScaJFW+J0CFGTVyMYrkEev4Yea+FY2xBlpY9wk5ghK95hAlc+8qgirCsmtVN8HaZUJWd8MxFua7KqRc3qjArfJkruy73mp6QFtp5QcqfsG1L7IiSj2To97aaxLbzcC4yRlVf5WB28BVCMZAJt49f5vBjIU8/RzYUdda0c3mBYiIsbhlBHTkD69NJnCeLh4m/25nVgxDytXb8/JJ2666WiWyuKUM13sACUpZqcKG0+Z6xP8pWtuB+qnA+bWS4ccLjBrRIsjhCBqBEPFLiTBFY0YX8+rWG2EYJkGEgj9YxiHvWMypEp9sSWiUGTLTXCRne/evY8/C9nBoBBVU1/EnPj7HSOm5uY9ynT1Dmxo06ep3hstXynp2IStUWdcp2c1+AixE5jE7S8/8zUnu00MV4TnXIQG4dk8s6HPjlWlisx+m6WsTovrYhu4/sSKAtiqqEMzUfb61PVqfGJDv+T9YGSKKr1RXe3iG7Ca2+Trvh2s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(366016)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wT5tgtZyHd/zFuWkafx6qBa6fIGNRvGC6AkwUKrFFtx5U6NuPstBEleJPk0t?=
 =?us-ascii?Q?ho48BsDzW3qZA9PLqNMWFcraZcThtxEgOBWDZuJe2FT8EjrGl3Tje1dnB8Ex?=
 =?us-ascii?Q?iC6sumZirDgllgYdfvTF+9ie133hGd8wusQ+Ij61/uXj1huSlCt7iW2JB+S7?=
 =?us-ascii?Q?q5I2CGX329R3BLTZd0UnO7lVhkuzNW+nmdM4zPqvd32l1k/UXbfN4l1gs0Ax?=
 =?us-ascii?Q?BCoQXwTEJQa9VQfg8h2tua2BIY7Y3oOKfeNmvQKwTtGCjKZEP7OdEFmpK0/v?=
 =?us-ascii?Q?2uf5LgPp2+NYaX5f60soLJWFuHZWsr6LB1zgryNkmpcv9VU5HA1w0nbTrSTO?=
 =?us-ascii?Q?Ghx8uje2Z3yntnY93RFzRFmlqZeXPuRf+HjVNNYkWAGD08QjnZhpdbc35ARb?=
 =?us-ascii?Q?v4tSMkqq/XTh7SmapOK9aSSoHkaaYHCuWGg8ev6iotOOcmfEqIwpl9ebk3ZD?=
 =?us-ascii?Q?bI1abWOdgwXDrd6v+2LpcGXM9sbWULNr8i8BljIJqRsq8PzcGK9hYlxy27Ve?=
 =?us-ascii?Q?z+klnlN85COYPYzoNF+S4EKWoQ/9BVf8TMUcgCGK5ieWy/y4NaWXHJxkdW91?=
 =?us-ascii?Q?L65DPqWMMk7GRwKPPc30oLpDaB/n9fuu9W8at1IaB2IyFIaGmH7JwYkiKzpo?=
 =?us-ascii?Q?/I6XOTrpsJZYfNO2gD4R5E1xdgaIHx81UwBo7CmXhiwdaczsPkK0Fwd54lyb?=
 =?us-ascii?Q?xGpERMwA+T8YKwfB4ujmxR3XOByvO2xDmlx3u7nGSbl9zy6A6qdnWftSVMc4?=
 =?us-ascii?Q?vEq8hFrvNTP8vYKWX5xheRZOPW9MYYm17AD54WK+i+G46p2c8Ez7ToH4kbO3?=
 =?us-ascii?Q?ovOwdbH4iMgWtSI+Ss9pgY2izq7h0E2pbEMv+QV5M7VA2xb046Uwk+hOGrDw?=
 =?us-ascii?Q?xKNPtJAezaMtQ/a3d1ctUpX2wfrYQhR7wQ4UyfV980/TGz0vjuSsw3uKxBa+?=
 =?us-ascii?Q?i6nOvngCKfIefBbL8+rRUsmc9/LhQyiKqkB1zTqDTox/LgCnAgvvv5modDeY?=
 =?us-ascii?Q?EWd/KKsymqMDXrWvCXZ8LKYd/M3tKbhxx31MkdJJCiHaUMCix9CBABVfab3x?=
 =?us-ascii?Q?Xqsqfu/9lb5+xBMcmiRJvL/N1SetFI2Jn2Neo4j4StbYziogYB0SHw9O3Hx/?=
 =?us-ascii?Q?IQf3AC5jBmFhLg68sLMuY1jM9nQbf42EGGpEARENmKdAv/4Jdep1uH9HbZhx?=
 =?us-ascii?Q?D3bcMjXqjDZu4T/pgU5DdpqQYUelhilo1wM5eKdejVR1UfVnns0mEitByTqN?=
 =?us-ascii?Q?o7zmL+DBJunPu242wPGfnQ2XHF1ieKfqUh+oEJ58ResD2/czY4yRv6o6isXt?=
 =?us-ascii?Q?c5qKckRnnIYfJG7bx6pJGkIXZovfPVr1ni7tkuFwHALJdb0mQfsRVXzX3fJC?=
 =?us-ascii?Q?+fSaTIptV8JpgRUXsTq5WHHusW61RRCmPOo41xw9KdWKIc0UqJhNiSlCQ57P?=
 =?us-ascii?Q?fBkiLJN6kLgNdY9b/6inDcLedV8GDRtBcQ0EYuUfeSUHDE2Ciav2nPWd6XXL?=
 =?us-ascii?Q?lm/c+ORxq3pPf6ZLJWiufH+FulbURnPOp16FnZ0gvPoRPntlk+47GKtZO46h?=
 =?us-ascii?Q?ew97fE8PnuoXLQBpinpx4J/6BUP0OU1JrxXVPWttcSS52lyWjRQ2VI7CSp0A?=
 =?us-ascii?Q?qNXz+/Kp176jMXMIcMjZ++Ehpp0YNB8N95J5/vMph4rUYDzmfRID52Apdk9A?=
 =?us-ascii?Q?pt5jorWX0+aSMclFGUm07orYmMHIMeAskNcdfhN0DqMqFy9oBiQ1AWkWntvO?=
 =?us-ascii?Q?ZRUG3I5D/w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcf6760-fe81-4313-c11e-08dec2b486a5
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 03:42:54.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMmBwiE8twdtdpo/yxh6g6SG7O9gov0n5SIZ5cTzSsAfSlHfWn/WtoJmIW4VWuTz+WqkohD1z3SL2gFdPddGPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_204302_118973_60D91494 
X-CRM114-Status: GOOD (  12.71  )
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

On Thu, Jun 04, 2026 at 10:39:07PM +0800, Felix Gu wrote:
> If mixel_lvds_phy_reset() fails in probe after pm_runtime_enable(),
> the function returns directly without calling pm_runtime_disable(),
> leaving runtime PM permanently enabled for the device.
> 
> Fix this by using devm_pm_runtime_enable() so that cleanup is
> automatic on any probe failure or driver unbind. This also allows
> removing the manual err label and the .remove callback.
> 
> Fixes: 06ff622d61d2 ("phy: freescale: Add i.MX8qm Mixel LVDS PHY support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)

It would be good if the patch subject prefix can be changed to
"phy: freescale: phy-fsl-imx8qm-lvds-phy:".

With that done:
Acked-by: Liu Ying <victor.liu@nxp.com>

-- 
Regards,
Liu Ying

