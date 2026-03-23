Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287D1D58B02
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 06:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tziJeOEw/BS+e7YU+4V7x/VXYezCf1g2NlxkGwA58ng=; b=AXojTftVi2z49xy6Clsu3AuN9h
	lhrgJ60YuDiBOuCKSWU+JPV4RmUs3P4Mcq3oK/nGy836axaftj6ifC9qtcYR6E86FBRL+5NCyCdXl
	/WSCmqrEM7mbLhebX5bbJTDO3+eceIMlHm24/2cOu+hi98tPIKuv1F/C4MFV2gzj6u4HK8r0b9jpg
	fV3gRml+5wFrwfSjI8/U/HV64yrWaQKpgaAWyp3LVxJ4Med+dCy2zHWhh+Muk6CkaGHaR9neZ6x15
	t/hBFIbmYhU//JCpQaih0f0pNzD0Xuyml3DVS7lHZG6bXl/HUFDRhbggDvZmiA1gQgqA8UVWRf4GS
	PyAkFUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4YQu-0000000G5Ew-0nIY;
	Mon, 23 Mar 2026 06:06:36 +0000
Received: from mail-westeuropeazon11010047.outbound.protection.outlook.com ([52.101.69.47] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4YQr-0000000G5DI-2qtz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 06:06:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBd6ugO9f8jnjrI7POfMqY0s/TzDI60bfLBYmHhTzCZdepqa2/jT08FM371N2LCfjXGukos3ZP3Rj8+KAPg3+jLBmA1B2I2QOKFkQ3V0/ZpDWvY3DCRqu3NSNJS11ed4gqdAamyurDd5XnOni3UxGLhUb5QNhmzBJw5DaBB6HufJIZkl4Ln4Lp8cHs5LqMdXB1NNk4FRUxedq5Mf/3VP7ADTOo75Tk+JZqMrZye6fyIbeqWJmo/aS4wiySX8Uz9vvFwR2URe6IxaT/RoQoiLchUKXG6tgfJOebZyTbCiN2LA3WxazxIafTK1veQNb/pkqedZ7Vlq8yog3QEkTnHgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tziJeOEw/BS+e7YU+4V7x/VXYezCf1g2NlxkGwA58ng=;
 b=RcPeG1X9ee/j6bpmm9D9N8cWdXv7UI8AKlitn82VLerUxweE5YK61uiqWz2cwpvZS+sLzc4jGmG0d8EvLC/TrftHTipMEMJRBJbjWda2IFWnKihde49im49Ej+Mx4aeGEBSxvzzJXWFz9mEd6wrvxS3v42HOxtek4NiHMAl92FK7arw/TNwYBPGKpP1ZnSj3wec46pzxBSW5WHGs2vegVahJdQeGyIlwgylyyiONn/WHaZvvnEGUu855IQxyRMCYimtxLiBhlzb9hoZ5fMI8P514WEGpEAZ9QIa7TeVwHR/0GMQbCl4W/UngqfAkT0054h8StsVeEFHnjfHJfTaOnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tziJeOEw/BS+e7YU+4V7x/VXYezCf1g2NlxkGwA58ng=;
 b=jiL3XSZQEqlcDmKBLW0QXfgAQ/f5hOXQ7iWE03SWiDbkMdQzlQTYbQ1QqV8RNNO0qwuicb9826NfWeWXQcFp41/H5dDH11xxq1fUu1A9gnTG/3/AzBkW9ZwblT86GrplBmY9yjQWvejBsRwB6dFllWf2kiMzgKOt+ZMIvnxNVmjQ5zwQu3FlSL/A+ATymJsDYM7UBChqs3sk7kGL3O1zk+z7isWPzlnSvFeaARniPVQwS7d91LtYcmjYHjid0D72CxzfrS3Rxj2yVseOKiki++YGytih2TLdkCP5ey88d5Co1PXqpg9v0LxGck0bXu8BYbWlrixrtoNU94iygIQ90g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by PAXPR04MB8911.eurprd04.prod.outlook.com (2603:10a6:102:20e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 06:06:01 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::dc5a:b0aa:4a1b:c55e]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::dc5a:b0aa:4a1b:c55e%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 06:06:25 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.fainelli@gmail.com,
	frank.li@nxp.com,
	chleroy@kernel.org,
	horms@kernel.org,
	linux@armlinux.org.uk,
	andrew@lunn.ch
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2 net-next 03/14] net: enetc: add pre-boot initialization for i.MX94 switch
Date: Mon, 23 Mar 2026 14:07:41 +0800
Message-Id: <20260323060752.1157031-4-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323060752.1157031-1-wei.fang@nxp.com>
References: <20260323060752.1157031-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|PAXPR04MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b3d3a5-3a0d-4a60-7a65-08de88a25071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0j8U1IU8TzxbJMHo1OBQa6IxtgDY4VeclcJGqqsHNwZJpLHd7xDU2EYOwnTsKfhFAUZUHWlIG1IvxCjcMobv+DHYkhlheOxgE2tz3vgK8vP1FUllCs61sBlyfECviHubzUAIJcYntG7f7ieNavQAI1TmHAzoj+GoMbTgIMYJ9cy7SL8g8blbofQBtZdriRXEDVGPtJvWCmJXgJonnHskhQONBjKUpffidqN0e5B1SUo88/RnLJlWQdsiVydupgjYHs2C06GKeCggnw1YuccYM0Prr4MI1Dd6jrEsqJqptbuDcPxF06Ttm9VbJVgeCIo/UEnb9yZdn1NSp79HIylJFgejzqg3iILrz1lYEkYuGzmT8bf2zQQ5naiYUuVCzT4is/cgiHnZjlXsbUMy2PAfWIlCqpHaI+E/J4QAJb93mb5ncPjeDtar/kVfo0GFpPp1JaYRIQ8sHlD7OXFhFhUcX+mMTWNnFewdA7ZrPbpQk6591RwwpCWwHZYJm1nR4gaAQglC2JQP3WuYnvEy+oI2msoylfxVmM6HKDuQBXOCUX/VoqHAmsr3mGF7tnOOJ2e2M0k3+Rs/S0D0KEMhpD3E/L1aMmwmSHJHlPQubcfXiZxIED/l2qeMLdFqmUqcrUb9FGzhoumeytK5giAwgqcjmPlURqzaB4zoGRwE3oWHcdFYkKqS/uZOtPloshCqBq9Xlx0nil5GlWS/fzNoKYh4hKGnCiWTqlA/Dky6aRVHqb4opPoFVQjnvSbzt8t99SJvYjsvkvEQg5St8/ZkSA+nG6xr+EwowRZ3cqoXrMZIBU2LvNwnuinN7mbqUYM2gNE2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b/JdZXzPL8mJq3Xgy86xlCQeCZOmIhXxg39IRE9HEl7Ez2+5yjMolleoLbjx?=
 =?us-ascii?Q?1JfvpsCsbhDVqFYC8RHm67g87aO3dhnektt2gEBlAYTL29911k61p97iWV97?=
 =?us-ascii?Q?lk9XpqghP71dVraUwy2sHugiwvFMfdOFqC8gypS3rDsCBGWAiTCxu9sDWPaW?=
 =?us-ascii?Q?Nh1JCB9iP0UAohYsJE5XLZHvG3ajrcHTaGS/AU6Slehb9QxAvTIRf2O4hnQQ?=
 =?us-ascii?Q?/13MF0FloEo2UM45HjnPKbKojP76iPo4ET66kEegx//WFkSGMaWgQt8xf5iF?=
 =?us-ascii?Q?uzvaqDy+dHnqGQYEapslhMoBRCgjbyo1uaLWNXm/TQSglcOnObzHoeAGGYAH?=
 =?us-ascii?Q?m1hejmnhsToPiQI0KWLSD03cN/yM0cUe4xTTlgB+dQhmhAekW5MCF0ETy5dP?=
 =?us-ascii?Q?tRMB0RrjGswf81zodgubrYUV0uXnWt5WjTx8FaSwvAyHXcGJl+88hiVF9XWy?=
 =?us-ascii?Q?AxxuscsWMSOjz+TwnquAZdMPk/mAQ7RFmtpIdnpIE5/kzZeK7rPcF5rZH9U0?=
 =?us-ascii?Q?rt9SKNtpr3TZIQxfb9lqOOy2ZTmkaYlFjyNPR6GCCFhLIPK6WHqhXVPTF1x2?=
 =?us-ascii?Q?too0t4FFbfiZLVkE4rUTuBziffXwECLW3dXfeXmdIag+0F2Xu+1Fi/Xh085T?=
 =?us-ascii?Q?vAW1BMqq6dcddRoDYaE7mke7mXkGszWKJxZkdPW/AhJ763pCC8i1l0ULQhWm?=
 =?us-ascii?Q?UKxJAUcz+oXNcUwFVdA1dwYGsWs6RgWPF519WhVLy7XQ7MuuFya7J7yxw199?=
 =?us-ascii?Q?MpF6Z4hgewx49PSzI6QYWZHsG0ea10ABLHUywLgswJksOxwGM86e5NszVl/l?=
 =?us-ascii?Q?EdSsHKL3wQPiPUhdivoW4i/EKsajrZLx78ex6eVyG6DRWu+RBBLUGwV108ug?=
 =?us-ascii?Q?QwxxuRrqQmVRuXIijAygKb+bMSdjctTk4CVOPSaJ0jZSkHG5HGoKlHH2u9gN?=
 =?us-ascii?Q?JBkbh3QXykYaGZh224EpmO7cPdfSVH9Heb+v8aKyqRGibF6DLjbZG5Pc364C?=
 =?us-ascii?Q?b57Ye3bJKhNJ7evVP7UhMc8PWycFfLNYH62dL3MYbg7EcbcT5S0AW3Acab3p?=
 =?us-ascii?Q?6jPeQkBGM2POoM1CYgmCEgTLy/KwRx5V1XdEcgywZkUvsH8Nygth4aVz+wNB?=
 =?us-ascii?Q?gJcncUVM//tXJxZSeD3poEKqBGKqUJBkjrcdQtW6sgW2yXpPvqvw+9FGXA//?=
 =?us-ascii?Q?GaR+gSNYjZ82BtRL8j2oldLTSWFajc1y4c3+Ix6P1HE1tfsDiD6Qtf4VP2D8?=
 =?us-ascii?Q?pk3HWVWcERmZtnLsSalAzQLoyOE+k7+XEIECWFmcKAQ7xW7V0o3CG8BSAT2G?=
 =?us-ascii?Q?ywFxL39Zk9Y057J+v1w3iHjjwX9IzKXAxWjfFU4ECeZQRiU5HUlpgKwa2FB5?=
 =?us-ascii?Q?TaxHB1AJ1+Y+qH5ek8zeTMeorzBRVuiGYBjf4j6mlMldyyRy9LKyzulNJwwK?=
 =?us-ascii?Q?jhc3gdqxqPcHozcGoITJFqErGuNErVgsq/vk690F8qmXkCHNTHKtPiF/teaX?=
 =?us-ascii?Q?ojBtAzdwdhpbxjzglt2MuWWZIO01jo8j/ZZCYGLCjEvw835gFWJZV3TaS2TT?=
 =?us-ascii?Q?f31/xI6W2vYE2pMy/UsIP6bnpt/rfrmnHybREU3RngrS1XNdCfn26bo1xkLT?=
 =?us-ascii?Q?h8VTqQCeV0Y82V0A/+iC1QQp67ZgA+TMMm4JQwEq8mHuQIJqOaEMsLJ8CoMD?=
 =?us-ascii?Q?r4TuQaGB2kwjMBZzID0B+4gZZwvg4ZGUvNZp2Ug5+8buMJKU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b3d3a5-3a0d-4a60-7a65-08de88a25071
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 06:06:25.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pr+726ofhtiG2L7D165f9m5N36um3JGfGnx+FXHgonYnMMfbjMLo7AlsIq6StFXO2q7qo9cLxNg0LFKwnZodA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_230633_870340_FA7AC35D 
X-CRM114-Status: GOOD (  26.50  )
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

Before probing the NETC switch driver, some pre-initialization needs to
be set in NETCMIX and IERB to ensure that the switch can work properly.
For example, i.MX94 NETC switch has three external ports and each port
is bound to a link. And each link needs to be configured so that it can
work properly, such as I/O variant and MII protocol.

In addition, the switch port 2 (MAC 2) and ENETC 0 (MAC 3) share the same
parallel interface, they cannot be used at the same time due to the SoC
constraint. And the MAC selection is controlled by the mac2_mac3_sel bit
of EXT_PIN_CONTROL register. Currently, the interface is set for ENETC 0
by default unless the switch port 2 is enabled in the DT node.

Like ENETC, each external port of the NETC switch can manage its external
PHY through its port MDIO registers. And the port can only access its own
external PHY by setting the PHY address to the LaBCR[MDIO_PHYAD_PRTAD].
If the accessed PHY address is not equal to LaBCR[MDIO_PHYAD_PRTAD], then
the MDIO access initiated by port MDIO will be invalid.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../ethernet/freescale/enetc/netc_blk_ctrl.c  | 188 ++++++++++++++++--
 1 file changed, 166 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
index 92a0f824dae7..c21230f7a7fb 100644
--- a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
+++ b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
@@ -261,40 +261,112 @@ static int imx94_link_config(struct netc_blk_ctrl *priv,
 }
 
 static int imx94_enetc_link_config(struct netc_blk_ctrl *priv,
-				   struct device_node *np)
+				   struct device_node *np,
+				   bool *enetc0_en)
 {
 	int link_id = imx94_enetc_get_link_id(np);
 
 	if (link_id < 0)
 		return link_id;
 
+	if (link_id == IMX94_ENETC0_LINK && of_device_is_available(np))
+		*enetc0_en = true;
+
 	return imx94_link_config(priv, np, link_id);
 }
 
+static struct device_node *netc_get_switch_ports(struct device_node *np)
+{
+	struct device_node *ports;
+
+	ports = of_get_child_by_name(np, "ports");
+	if (!ports)
+		ports = of_get_child_by_name(np, "ethernet-ports");
+
+	return ports;
+}
+
+static int imx94_switch_link_config(struct netc_blk_ctrl *priv,
+				    struct device_node *np,
+				    bool *swp2_en)
+{
+	struct device_node *ports;
+	int port_id, err = 0;
+
+	ports = netc_get_switch_ports(np);
+	if (!ports)
+		return -ENODEV;
+
+	for_each_available_child_of_node_scoped(ports, child) {
+		if (of_property_read_u32(child, "reg", &port_id) < 0) {
+			err = -ENODEV;
+			goto end;
+		}
+
+		switch (port_id) {
+		case 0 ... 2: /* External ports */
+			err = imx94_link_config(priv, child, port_id);
+			if (err)
+				goto end;
+
+			if (port_id == 2)
+				*swp2_en = true;
+
+			break;
+		case 3: /* CPU port */
+			break;
+		default:
+			err = -EINVAL;
+			goto end;
+		}
+	}
+
+end:
+	of_node_put(ports);
+
+	return err;
+}
+
 static int imx94_netcmix_init(struct platform_device *pdev)
 {
 	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
 	struct device_node *np = pdev->dev.of_node;
+	bool enetc0_en = false, swp2_en = false;
 	u32 val;
 	int err;
 
 	for_each_child_of_node_scoped(np, child) {
 		for_each_child_of_node_scoped(child, gchild) {
-			if (!of_device_is_compatible(gchild, "pci1131,e101"))
-				continue;
-
-			err = imx94_enetc_link_config(priv, gchild);
-			if (err)
-				return err;
+			if (of_device_is_compatible(gchild, "pci1131,e101")) {
+				err = imx94_enetc_link_config(priv, gchild,
+							      &enetc0_en);
+				if (err)
+					return err;
+			} else if (of_device_is_compatible(gchild,
+							   "pci1131,eef2")) {
+				err = imx94_switch_link_config(priv, gchild,
+							       &swp2_en);
+				if (err)
+					return err;
+			}
 		}
 	}
 
-	/* ENETC 0 and switch port 2 share the same parallel interface.
-	 * Currently, the switch is not supported, so this interface is
-	 * used by ENETC 0 by default.
+	if (enetc0_en && swp2_en) {
+		dev_err(&pdev->dev,
+			"Cannot enable swp2 and enetc0 at the same time\n");
+		return -EINVAL;
+	}
+
+	/* ENETC 0 and switch port 2 share the same parallel interface, they
+	 * cannot be enabled at the same time. The interface is set for the
+	 * ENETC 0 by default unless the switch port 2 is enabled in the DTS.
 	 */
 	val = netc_reg_read(priv->netcmix, IMX94_EXT_PIN_CONTROL);
-	val |= MAC2_MAC3_SEL;
+	if (!swp2_en)
+		val |= MAC2_MAC3_SEL;
+	else
+		val &= ~MAC2_MAC3_SEL;
 	netc_reg_write(priv->netcmix, IMX94_EXT_PIN_CONTROL, val);
 
 	return 0;
@@ -610,6 +682,77 @@ static int imx94_enetc_mdio_phyaddr_config(struct netc_blk_ctrl *priv,
 	return 0;
 }
 
+static int imx94_ierb_enetc_init(struct netc_blk_ctrl *priv,
+				 struct device_node *np,
+				 u32 phy_mask)
+{
+	int err;
+
+	err = imx94_enetc_update_tid(priv, np);
+	if (err)
+		return err;
+
+	return imx94_enetc_mdio_phyaddr_config(priv, np, phy_mask);
+}
+
+static int imx94_switch_mdio_phyaddr_config(struct netc_blk_ctrl *priv,
+					    struct device_node *np,
+					    int port_id, u32 phy_mask)
+{
+	int addr;
+
+	/* The switch has 3 external ports at most */
+	if (port_id > 2)
+		return 0;
+
+	addr = netc_get_phy_addr(np);
+	if (addr < 0) {
+		if (addr == -ENODEV)
+			return 0;
+
+		return addr;
+	}
+
+	if (phy_mask & BIT(addr)) {
+		dev_err(&priv->pdev->dev,
+			"Found same PHY address in EMDIO and switch node\n");
+		return -EINVAL;
+	}
+
+	netc_reg_write(priv->ierb, IERB_LBCR(port_id),
+		       LBCR_MDIO_PHYAD_PRTAD(addr));
+
+	return 0;
+}
+
+static int imx94_ierb_switch_init(struct netc_blk_ctrl *priv,
+				  struct device_node *np,
+				  u32 phy_mask)
+{
+	struct device_node *ports;
+	int port_id, err = 0;
+
+	ports = netc_get_switch_ports(np);
+	if (!ports)
+		return -ENODEV;
+
+	for_each_available_child_of_node_scoped(ports, child) {
+		err = of_property_read_u32(child, "reg", &port_id);
+		if (err)
+			goto end;
+
+		err = imx94_switch_mdio_phyaddr_config(priv, child,
+						       port_id, phy_mask);
+		if (err)
+			goto end;
+	}
+
+end:
+	of_node_put(ports);
+
+	return err;
+}
+
 static int imx94_ierb_init(struct platform_device *pdev)
 {
 	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
@@ -625,17 +768,18 @@ static int imx94_ierb_init(struct platform_device *pdev)
 
 	for_each_child_of_node_scoped(np, child) {
 		for_each_child_of_node_scoped(child, gchild) {
-			if (!of_device_is_compatible(gchild, "pci1131,e101"))
-				continue;
-
-			err = imx94_enetc_update_tid(priv, gchild);
-			if (err)
-				return err;
-
-			err = imx94_enetc_mdio_phyaddr_config(priv, gchild,
-							      phy_mask);
-			if (err)
-				return err;
+			if (of_device_is_compatible(gchild, "pci1131,e101")) {
+				err = imx94_ierb_enetc_init(priv, gchild,
+							    phy_mask);
+				if (err)
+					return err;
+			} else if (of_device_is_compatible(gchild,
+							   "pci1131,eef2")) {
+				err = imx94_ierb_switch_init(priv, gchild,
+							     phy_mask);
+				if (err)
+					return err;
+			}
 		}
 	}
 
-- 
2.34.1


