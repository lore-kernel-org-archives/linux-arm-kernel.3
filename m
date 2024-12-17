Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96420E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HykrNY9NSthTTf0kFyI1HYl4I2q6Nft6zAy69gUAtg=; b=HVxq5YP02tKSyJCYUf8itHf2m4
	Ts6J6uZ/uRGYcU7zH6mE+md7JXmcp5jTG+Ex791Nl7bSfGKRWpNGxQa1j4Wtz1+MzyRR+3+az0r2b
	WhYqalMH9/lIy6Smgw7pwMN3DH76aYrWZhcITj78ncEtztqQJMkJwYCpMDR/JUs5FAqAbWMdl7mlg
	5GdnI5hTgsHPgW9ZQc48Qfc1QCamDgNf3lesq7WuMSrhoNMWqsyK9ROf9I3xrS4ZWDaAvI8FBI/PA
	ViiXnelZgorXP1s8rrm9G+NDMZnWVGWtCdSetUkCq4mvr1pI/0AU6Npn7ZrVoZv20M20ai5TT0IAw
	7IvkjV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRnd-0000000CXsv-0SWA;
	Tue, 17 Dec 2024 07:15:21 +0000
Received: from mail-vi1eur05on2061a.outbound.protection.outlook.com ([2a01:111:f403:2613::61a] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRTG-0000000CUGd-0z6T;
	Tue, 17 Dec 2024 06:54:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGJXCUq1sJOWI74gcHmWD5qMywO5D8cZAkBWbUD1HJT1N9DsSvJlc9P5r9kvTWERavF+JhnW5xMWyFunvHNso7wkqQWotjxOLst15MsTgHQchTnTQ/S6qUooyPqaRYpNOGLATfJLPy95b/e5mJnL10mCvYh1qbYB/Z5qJAZ5QwFuYACFgu5t5jBTQccfSk0KTp806bNPjDdo8088qx+hEf1wQW7XlqSi4Ux+Xrc0vAYx5x+o7uWeiPeRAxdh6DmgR3UjC8UOehk/A3pAPs1cHzzRgKjJykcGj6eqYP8VK3C2oE7zwdzBejRGuV9DfqIpromzOYBzM0c7QCJXKkm9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HykrNY9NSthTTf0kFyI1HYl4I2q6Nft6zAy69gUAtg=;
 b=wvyVP3Vb4pI2ey9wKeWZYGSJF/YaC6bg9ue9/G0SZl+u6KUspHaOkXTUhQ1UUV+r8FYtzbCrXG3sl6HCK9P1xpfpRmPnMJs5Bu3ySXABsRaLjy9e9WyN52bbGJqpaF5qkFZoAXkUu/cjtL2eeq6kPt7/5zix57/RNvDqeqj0M8oFe+K5kTXArAHAkEDYqkAhsHK8Hlgj3soJaj5bG1Ev73o6CvkIHvw/qABIlqqSCTVyo3pdaOnLboxTGqh1H5UA+2cy7FIiNidKcg7BrbKSr9qgoHvDiNlS4GlLjxQ5iMM+8THpIYQ+LLaVp75wRuVYHpBj4xzrtvJpj6sUoYX9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HykrNY9NSthTTf0kFyI1HYl4I2q6Nft6zAy69gUAtg=;
 b=L7IcSThIeRnTQYb6cr2bp9Cr78xJbwWk/hktZW5/6w6lvDQTF8uYrNM5X0/oTPmLRcEmI4AZMKrSMWrZedty35zxao1NUc0eMDpohtAk3qwGUPHtxbyYswDe5eUIGWInXvlcD96891MWwgDGHEERhqV+CoewVermMjJgzkBjyHBi9cE41fSzzYJ1URYqiNh7s6r79UGYnOGjzDLiMrDaDdbMXOv8VS6AhyfWT43ARA2jOXEcJk/YEcHYTbHKBubRBlLhwCLGjvG6kGNMhxbJtwfG73sfRKsZLNUTZcEL8qFl9VuyMBhZmC/VsO7YNm/LvBkwMY2qb0QK6wmQ62VUKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB9009.eurprd04.prod.outlook.com (2603:10a6:20b:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 06:54:14 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 06:54:14 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	vkoul@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	mripard@kernel.org
Cc: kernel@pengutronix.de,
	linux-imx@nxp.com,
	Sandor.yu@nxp.com,
	oliver.brown@nxp.com,
	alexander.stein@ew.tq-group.com,
	sam@ravnborg.org
Subject: [PATCH v20 8/9] arm64: dts: imx8mq: Add DCSS + HDMI/DP display pipeline
Date: Tue, 17 Dec 2024 14:51:50 +0800
Message-Id: <b730433022fc3af7b271827e86fc4193229862e7.1734340233.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734340233.git.Sandor.yu@nxp.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a14fd8c-58e3-4361-131b-08dd1e679e44
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iWse8idPEmH67WgmrsgWDK/qnxYlD1tN6avyCd/1WvLm4BNfNKDWNv4yPCme?=
 =?us-ascii?Q?OGiGbbwRBLNjbdIDIPV7F9GtkM+yUr+OSDdYmCA+8KConz5CvjB+hRZ5Th7B?=
 =?us-ascii?Q?hKliGRpNyFsGBhtgj1SJNqO4kBFv1YStXr7N6WzzoiPMM0F63u12WDwl+Siq?=
 =?us-ascii?Q?OKAx0lx39ztybgQX4A0OwK46R2+qpJkAxRpThtTUBU159MFH5dYHc6Inu5Z/?=
 =?us-ascii?Q?akNh26oEqSmSf0av0QeYLcllWiqUI5ZLIlKGxWq/BLTCWpCS9i/jHF60kWv7?=
 =?us-ascii?Q?0COTllcdnydBF0f5guzfD7zsryvznO/9cu646VDHWL8SnbhjiC6OS6w7Z5g+?=
 =?us-ascii?Q?/Iop4Lyo027Nr+dPZ4YR918IK6Arvm7kikc+clWZ3wwo3YBWxusDr04HkKen?=
 =?us-ascii?Q?F2XRc82j0Q7KBjF8wwUVH+qu7QhYTnZY0cB8XwWX2uiaVUr3XJv7634pQQ18?=
 =?us-ascii?Q?ziwWLJUvEbzB2rulVekCgcCm32XwuGmDIka1COsjZOd62LolNhNPfZsWygZ8?=
 =?us-ascii?Q?4JTvQ12Z5iwjESPtVTACDK3EDnbac2ImiLdms2qflHfTGJaBAB6FBQ56S2cK?=
 =?us-ascii?Q?9WoWdMkDY6FK7+vTA7Nugd8OwJm+Nrx+JlisqPrY/drLSHP3cuUOWGPG3k0f?=
 =?us-ascii?Q?LK/r+n7eYBM2t4FG27XSX3HW+ZG30HENt8auvGYjiw4LpIQ70GBdo0pSHsB0?=
 =?us-ascii?Q?KjPzsVZGMTfwsgzUC7BQsjhtOvi+fgMPfCrgOiWv/qkCqBjuEoE8ql9uAYJF?=
 =?us-ascii?Q?lq2RP8tzkYCQ7adYr8Sq+7IgZE6FHKSBbvYH8O1Ycz0t8MA8PuSzeHcxMUYU?=
 =?us-ascii?Q?eBnc8ejuGuo2Q6lWqD4W4/gtb3ohGJazflc+r8WOigrdIUn15P8djJkeqWvv?=
 =?us-ascii?Q?i06FJ7wGHdt6Piyxaishn9GxMn/1BMtsCyulh+ckWNjg4cqLZXYvkpwciGtb?=
 =?us-ascii?Q?MqR0lqJ/sT9oyMhodC19h1vPG9ecOQM+APMIr1xwZsbiviD1n/qQKXEG0MSH?=
 =?us-ascii?Q?LyQpu9jGQQXyKVw6/GmfreHp85286ScW+oOH00yiKI4CTDv0KW11WqJm7bmG?=
 =?us-ascii?Q?0mC0XTdnqYOGBjWyeYIPUSe1lOtnmpn0ROqvF0VO/c4T2KkS5eq3MFrv0MWZ?=
 =?us-ascii?Q?DuXIn+VAkPZtQBobDic9SitqPR7pSBxQcEFMTD++ynqwdcW1JiovvLAcYTrc?=
 =?us-ascii?Q?81q0Lpj+pWIKcKu/RIhT5uSQPfzZMeR0PjiRAt3q0Sdk3dH008NM3m5yjkc4?=
 =?us-ascii?Q?RiELP7fx21PYO/EWh88XrwzuQ6JDVBMBfUEFBfRveeyuM9kQAM8zlKTH4vyP?=
 =?us-ascii?Q?YLMKqXgVPiIv+Cx8A9nJSe9eheTVmAZnuEkn82YvqJlrHvMonhaBcD+x+rEZ?=
 =?us-ascii?Q?j2+1zPlkCyrRCVV7iwGDCd+61xOeRXF99qSnQfSL2FZR2AIMT2XYoeBiDI3P?=
 =?us-ascii?Q?P5xs6jujZmRkH38frT+YTrQeFMCHeb5U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?coOh1GMsPSuIXDqnN6pOYotOCA5jJA3gDe4Rcm8N7gbZ152C0Yv/2bO1cLj8?=
 =?us-ascii?Q?qAHiL+aZgGB2IptpWnvDY2URzToh/v7stLekDgr6bCaSug7xsM/ZQ7kKZcst?=
 =?us-ascii?Q?tLuYhatN1w3yirnshe2pU9ssvZx5xnX2NEBpjv9q0d1w6jcx9Bb0jPKQ5aHA?=
 =?us-ascii?Q?+o/ke8qIF2GfzUi4LzzeLm8l4w3qcxFDwibXsGYaCxF6QSq35wcbJw4vxXOw?=
 =?us-ascii?Q?99Ojd9g4LlSJjiVjmopOKWqfEYpegZazyKLdR6atEcoRaIQ33ohPyO3VBRO8?=
 =?us-ascii?Q?YszLPfdxQjdfELzY2DOpZwVPW/RoAyzvb25e90edCDjXwhq1Ct8XSod8p/7P?=
 =?us-ascii?Q?YD1sHbo5FlE9AFwO128tDdfe0GmL/oDM1Te4IUSoyLHmEewDKBFLVr6LKURK?=
 =?us-ascii?Q?djI5vS5EDq94mVGPY7LNxuMMpPxbMxSM05FHdwr6aC/kssPqL7sSjHZmfOX+?=
 =?us-ascii?Q?Kt+ugjpulOwwzWcujeEa7NOfncwhywkg+dAjsDOZsIRH7pvlpmOudWN4xCV6?=
 =?us-ascii?Q?1KeJsZyIMEHUnwqoxKcfyoKVKqVL1abjpkr6XwmP4Z4PuV6sltnONSaSokbm?=
 =?us-ascii?Q?XTEYKOu2VKO5M1bSb8Kp99XUd9dXjbnLj0rN+H0tkuO8zqauCTOfKymsVAy3?=
 =?us-ascii?Q?QqtedqyOjAFBxdssIkmupUyx0eBlNUy5/od/kIKPR4cCxF5sEY3VtXOqQdtp?=
 =?us-ascii?Q?dtkbuzXzRxrD34RjvshbzJ6AC0OUaPrZJP3A5N/76Z3lt+7qsXUt+nwWSLcr?=
 =?us-ascii?Q?DiL5FQzWkYkdAcher/cU/2fbVONYyLNjm3mIhxgya4vJIwY0Acyf9+kfcmiX?=
 =?us-ascii?Q?9bIGpnLICzeWMXmFsi053gY15Zb1khJlSXe3KE95XiCTxh7eP3g00RHxVZHd?=
 =?us-ascii?Q?6jCK2qvgU1TsL2qGWz6PseIPxMv2wwo4talZbvhLYQPvnP2FAmoLHVsLijmj?=
 =?us-ascii?Q?HV3aVw8p2SztBTGxCfctDJFJ3VED+jqRMsmtWulAcTHbhgLsyO56YLY/ajyJ?=
 =?us-ascii?Q?SJw1bIgCRIivhLxo5TC7z3mrf9olnBH0yjyDP/jtUIABsj4ND0+m1JbKVFk4?=
 =?us-ascii?Q?TgP8YZFM8tON9CrAbwbpqxKOq4gxVWxithwXBefafdwPMtXaH4T8TOi3gZHR?=
 =?us-ascii?Q?G7BXl25MFNu8o34hpQOKQDDTIIQ8ex8IxKq54Z0foaER48f1LjJw5pw9AD/O?=
 =?us-ascii?Q?nl0s2X1mu5Q39tjpcYPAT1FC1Mdac0+4woCOCCDhTmOkPj01WZM7tK6Nv5T0?=
 =?us-ascii?Q?UIhaAzC6qzEE7i/vJa5Ztji0CNtFflKA5IKiMv5uCokrZT+kP3Wv5ztyDRHb?=
 =?us-ascii?Q?oOmUe7eZmE3Zh3GjaIT3peK+vCagD+nO4+q8CVLLOrtnUzrppuGqLi0Td2Dg?=
 =?us-ascii?Q?0yZswAlqP02nbJhIHu2/JqSijJ1kIYsthQoqNXMudH2ZApMye2tdkmxbdMJz?=
 =?us-ascii?Q?91+iKFF0X4dNCt3MboKvf12bfhEjpcbiUhk8PCBCQN9/IaO6xth4hdKkH4OH?=
 =?us-ascii?Q?JYgFDToijOri8f3jFSc3YqPPrLFnpSUiZLUPJ3vSGZ1F2gFtya5N7YRSL1Bu?=
 =?us-ascii?Q?3G53gnBHUT6CecU57ma2MjL0KFNZLDJfh99zOx2N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a14fd8c-58e3-4361-131b-08dd1e679e44
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 06:54:14.4103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9Nf9qC585jcuX6uvq688IU6DAWAiKTzFpGYCWDSL74+zLOLb8lkEMm95/VliXC1VdrOkxwDHEQgqnMaupLHbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_225418_273827_313854E3 
X-CRM114-Status: UNSURE (   8.50  )
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

From: Alexander Stein <alexander.stein@ew.tq-group.com>

This adds DCSS + MHDP + MHDP PHY nodes. PHY mode (DP/HDMI) is selected
by the connector type connected to mhdp port@1 endpoint.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
v17->v20:
 *No change

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 68 +++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2b..df8ba1d5391ae 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1602,6 +1602,74 @@ aips4: bus@32c00000 { /* AIPS4 */
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
 
+			mdhp_phy: phy@32c00000 {
+				compatible = "fsl,imx8mq-hdptx-phy";
+				reg = <0x32c00000 0x100000>;
+				#phy-cells = <0>;
+				clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+				clock-names = "ref", "apb";
+			};
+
+			mhdp: bridge@32c00000 {
+				compatible = "fsl,imx8mq-mhdp8501";
+				reg = <0x32c00000 0x100000>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "plug_in", "plug_out";
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+				phys = <&mdhp_phy>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mhdp_in: endpoint {
+							remote-endpoint = <&dcss_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mhdp_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dcss: display-controller@32e00000 {
+				compatible = "nxp,imx8mq-dcss";
+				reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+				interrupt-parent = <&irqsteer>;
+				interrupts = <6>, <8>, <9>;
+				interrupt-names = "ctxld", "ctxld_kick", "vblank";
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
+					 <&clk IMX8MQ_VIDEO2_PLL_OUT>,
+					 <&clk IMX8MQ_CLK_DISP_DTRC>;
+				clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+				assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+						  <&clk IMX8MQ_CLK_DISP_RTRM>,
+						  <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
+				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_CLK_27M>;
+				assigned-clock-rates = <800000000>,
+						       <400000000>;
+				status = "disabled";
+
+				port {
+					dcss_out: endpoint {
+						remote-endpoint = <&mhdp_in>;
+					};
+				};
+			};
+
 			irqsteer: interrupt-controller@32e2d000 {
 				compatible = "fsl,imx8m-irqsteer", "fsl,imx-irqsteer";
 				reg = <0x32e2d000 0x1000>;
-- 
2.34.1


