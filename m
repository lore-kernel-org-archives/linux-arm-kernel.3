Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DF0C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 19:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTZZPoK8YWDAF27/BjW/uUX2gNJg3u8TOPAMlzmvYFQ=; b=PLeWKqghxwoZ67iTgWauiRMqJD
	T64s5BFyTRXsCnFlEiOWAa5Lqs5cMtAXBSS2qxNrUZcdb9KxGdvzhk8I5vgA0eZtDcMCN3xnVnoXz
	+DCz2qbhN0AYOYlGow4poCpMiF+4L2fwDzjdt3KD23FABvxrz4sGJYn9cFBhWtGpxz16EmJPKthvA
	M2iWIh6EYSIIn2VSO8smSMBqAN2u/QDY2WGu4KtGZA7B+Jn120imvCF2TJK42IgGV0usxMI+QarOv
	c/qQ7115GvBBvM+EmDRTVqd25hiC6fl6Hvc3GZgleBgwgk0r4tQkhM0egIVSWHlT3sQO0bUEpUbtb
	25Y9mFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNcQl-00000000rGb-0pam;
	Fri, 06 Jun 2025 19:08:43 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNcKH-00000000qSm-2wW6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 19:02:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQSfTjWVVpHiwLD/l3ceyDzl6W6KaIWnG+SWRVuZ3JlXDhPMc0bUiYHJebpiX61+s0nVk8VdlLNVRQ6FTzsJesnVXMHCkFAEy3yR3Vkg98etybBUcKVW35+XLV0L3DKUgWEiZJHFUxUfSN2QEDU2AbYrapy2iyjYFvpLB6X4V64HNoH41FnzRTPuUtDQ+kDuVEZI1IF6rJrKHYTGgGzRTVOLpjk2E0mc/Fydd3PBGZuvkISF1OrQKaz3IqmA5lo7WL8HXLi6zQbe5VI2wtEuijpi4ZG3Feb/kPVvukgH15iMWe+Mzs3NCEkhcfuWg5BHdTDSkQNeSkwBBUaeE9G+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTZZPoK8YWDAF27/BjW/uUX2gNJg3u8TOPAMlzmvYFQ=;
 b=lJwIeWFcl1Ukgp80cnYyjAlZfQiA1E9zEMc/dXN5E7L3EvvFwBqlhQREIbRTfH4xiCcoc5vZjFMVsJPxzV9Qiup67wVq2qpiB/22z9aa3rK93QdOe9cWXKu4DOYMQ6oOU0+k2wMBXmpvRRu/WsQ+JRL401/z6ZW+4CplaqniRqrwJmllP0EKdKEG8/DwhO9dsT/lYlHX4chvw5gze6/6nlaos7JmHiW6KgS+9plJttbhUTliTr9GWmShdIYNvE4U/R6QJfiTdTXMFdJRlNuzN1he4ee1eSDAek4OzCKhFYWf1oZVE+yBUhq8mUKtNlyqEGqNGLztM4hVWmmKif1txQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTZZPoK8YWDAF27/BjW/uUX2gNJg3u8TOPAMlzmvYFQ=;
 b=axfgFeac19V3t1IcqDXPNiRVuoTdvCbgTMiU17VbVi5z2+Fiy38SlTP7XY5pHi68/YdfJExTqV7HI4mEy4Dkc4aXtB2lOHh28O5+1p61ISUeFRPE8Mw1qdvwRQCjINf8RTYQW0rtxzOjwboAFpBtflm54BbUc1XYVTNqrMYVwhEHMciHoS4olZ2XkTkJr3hhoXBd3aklYoqEXAukUGWY7hpGZ4BjIp6SsoRW07JKcvDO+uKO0o+n2neaJmRRR99dhH+WmWdCuQ9o/cAwVGlIjxSaUVAi4/IfnfhqCAHbAJAQmv4tJBlaFMOndrUIhtPGceacb7u/L2/dQ8HsSjBu1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7563.eurprd04.prod.outlook.com (2603:10a6:10:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 19:01:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 19:01:55 +0000
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
Cc: imx@lists.linux.dev
Subject: [PATCH v2 3/4] arm64: dts: imx95-19x19-evk: adjust pinctrl settings for usdhc2
Date: Fri,  6 Jun 2025 15:00:43 -0400
Message-Id: <20250606190045.1438740-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606190045.1438740-1-Frank.Li@nxp.com>
References: <20250606190045.1438740-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a349f2-42bb-462b-c3ff-08dda52c9b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9YHo/H0ZH4qHvsxy1KK6wFyqEi7U+K2EB0qbxNWAt+3ZwbWrDbI/Dv7WJVfX?=
 =?us-ascii?Q?8KAu7q9voizADfMKEet1A/8qpT8PodUwAzAqGEYNa5pAsaRwBhatkzAH0tWJ?=
 =?us-ascii?Q?wxfNS4FfVGA1u9yYWR0aXKfklOjzS4zEN84JpPB3eWX103QXaJIEBlWUZogD?=
 =?us-ascii?Q?iP+bpBQFt2huKxRE8KLVLyJmouwHBGgPmKQXkJgJnOu1mVUViYIeK/zqv5H4?=
 =?us-ascii?Q?w0BI4Cz02cgUGCrtpvnFvBVJCxPXdkonSxNkRtH9DoHGb5Vvi19GqHTcBa72?=
 =?us-ascii?Q?H9gN1M5LN/SIw6GkhlzqL4q5Mj1BdHIHYSGc1rJY3zaoTre2zxoBjC5DAoet?=
 =?us-ascii?Q?EOAeeopsc9KCoOXmBIuRyYEy0EK+SObsiBF4cGobdHD4FK4InMMCyhlSdyVy?=
 =?us-ascii?Q?ASpLxBw3JCK0Ho3sOdeBKlgqKkN8bicvhXyEP8p2WDYRKS8unCPqKGoOKFd7?=
 =?us-ascii?Q?8P+Kk0Nljnuag4u+e2aFZU6BrQohxLUely2ItDCjob7vkkhcIzDmbockm8Dc?=
 =?us-ascii?Q?1H3r7Q7CSbTCXUN3HCg0TBcJEUetzEMObP1ZUhcIjLvneCbzNJCWZuO6thzu?=
 =?us-ascii?Q?KSnbq4m9yM5LIMqeMI6rsY92CPHK10PyLUE2XKyYdDwHztVylAnZb2vlLm9N?=
 =?us-ascii?Q?w+jEEQWAB6qI/z09Z97hG7Mrdya87vRfYQ1WNU4HvnkPvMOATY/kvvjbQzwB?=
 =?us-ascii?Q?rr3UnFWYRFz/FwlCeGg01URWHTSl/tUjmstnIgzFM8iZLPxOJetFWa3T4zkl?=
 =?us-ascii?Q?CrJ0rmqCcSmYtA0it/ZkZb18Oz5li5Wp+IFfTepeeeQHM2wdA01yVCWbCx0z?=
 =?us-ascii?Q?MA628yB2FgrYBm7VFAcMku6l0xprz+hbVtB1dWcwgBS0/nUnCXP4biZSqeQN?=
 =?us-ascii?Q?kAjIUm7Z0Ku8W+gMSID61k8jSGTMBOcL9jyXXeCkqzpYMppieo21Z2e8Nazm?=
 =?us-ascii?Q?cNv90iiIAZzNT9eQwonVUHdnwVTZxj6TeRJaz5eZKuLdQg6lzyVsmy9ze6/O?=
 =?us-ascii?Q?q0MEjwsOmo/z0yZUcFYIDAfBPNxQgQPNjNjRYhR0B2ELmyAYwFcmEvSPVLml?=
 =?us-ascii?Q?n1G22kfHs2paePkzXed8mekaKQTr/xAF5XptZZA6jwtqmyMbQUL1B27/as2N?=
 =?us-ascii?Q?TVoaZ3vBPsBQcfJ3GQRPVBeFDYAqmQWzMHdPf9dtiQL8bWvoPlmxw4gb75qk?=
 =?us-ascii?Q?Zf4f10TQWyhgcrnUz8j5Q11azju27Xaa7jFKbqj9/ZNRqjX/dAAyUxZotlEP?=
 =?us-ascii?Q?DZZneKst86E1tLCAejIjFNlGwo72skSndljXnYY8EclK+Y3GlBjHOHynZ72N?=
 =?us-ascii?Q?OzYMGKoV43rMCDeuHjL3YGIFsAMyEgOGt2SyPz+QVOlX3HnH3HSjlQWm4jir?=
 =?us-ascii?Q?biQxDpLd8U8I4a38sDF296X+EtRSKOLmQVBb8VUFYYwOMZKHeGjdqJ6gHMp7?=
 =?us-ascii?Q?69I8KlXIEmHoWt3ETRWIZTrX6T1gXhFShHEVlXuburWz9wtxDF54A2c+8xGf?=
 =?us-ascii?Q?14oYwGW5myGzhFU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Tb1q0absMWCbWmtScyQhE0TYweARwOzS4CJze+J2C2CMUegpShSrhQzAwDD?=
 =?us-ascii?Q?RVKm1MuaMoQBlbxVVW7is7/puPZhqFO9M/2TmUvfw2vi8P9nP29vugtUqndg?=
 =?us-ascii?Q?QwxbRwRN2uRlbw2R/N35bo+h18PUpKexhdKfTWJJCKgT3rxiLAOYaJ0Og0ea?=
 =?us-ascii?Q?VIS7jSXiCWCANyBmR1EbFXllr9KA5VBR72WPzMH+tnTqR5A/6AW3yBXMSVFn?=
 =?us-ascii?Q?83xIe96QmZIIprJRpldCpsDHSsbDDofBnB3oRTIon7NDacNYpl+YW2Iq6M34?=
 =?us-ascii?Q?VfPtExWQkkLXlittJ5Bfrr66m8jC/9hSCrmpJRZS2OdygvVB1aGCOnKedoJp?=
 =?us-ascii?Q?Qn2bWz939+lKyKaccUIqSqNWuAlqyheILwEQzArgcf1V6G+6kPIjkUmqhc0o?=
 =?us-ascii?Q?khBzQHzdwrS6MPQ0z1VBkb8GRlRr9Tlj/KzjSLerEh4YUNYmOxE7hAA1M6IS?=
 =?us-ascii?Q?hp48y7Xx+2gpQ/REqyfvip57xsClBfT1MrHDrE++kgi/fiMKmTZDHo+5Jb1M?=
 =?us-ascii?Q?YNDCtXncHxhe0ALldYvRonM6HUdZREUPKHeP/2CkUzfXB8H02yYl8bWq76mi?=
 =?us-ascii?Q?efLpYQjZ+HJ0YwLfHVPAzK2iafhKnc3T6RnCSO5plBjRq+U7R8QvHyjcRqA5?=
 =?us-ascii?Q?T2jzJbyqMdn47g6JPJ9P+Mwj4W9NyN0upbVkqYuyA+k1pBsxW2TwwXBxP5MK?=
 =?us-ascii?Q?AP8JU4kgs0YXhCNKFob1K7ImSyyhke6xiarktW2sTPQixzAgxHCAJns4oZk6?=
 =?us-ascii?Q?Fb5cZTdhGpt0fOblJAE617QfUlRAQsThNJuiqvIuizzTYj4OoSy0CPIVsnD7?=
 =?us-ascii?Q?Bv44AEG8sBV8tnLKdLLC8/s5G492jUd87D1ZwocXQPhBDZ5RLxrvpezRRvEf?=
 =?us-ascii?Q?61g8FIaRjjqTuj/WOJroSna6mvHEDQFu4OWoStRJkjZqFAqavyE4224066hb?=
 =?us-ascii?Q?1MQktn870YnK+s7FyuzeGSk283zi1Kk/Bqf2hEKk+gzZWnzmMJhwadZEHBPP?=
 =?us-ascii?Q?l114AoDlWC7lwYK0xqUydOb/YA+LtP5kzZbwz38eP0m1x0uoFWNOW4TtCgzv?=
 =?us-ascii?Q?gkNo7MRrLZ2u8cysr8xqN2JTUylZx6TtGRiCe92gSkl43mXnUKo10ZmA7zPr?=
 =?us-ascii?Q?GN4i+3sMEOTle2laVOrxUInATPmvHkHGv42OaFb4ixz6ON5aBd1VeyjQ2Wo7?=
 =?us-ascii?Q?Ie1uW0Y0Z/pjXEFXqaO1lIfS2leG6giFQKmoI4ZMKMcU+3Q5xR56sHu7JuCb?=
 =?us-ascii?Q?nNjhCy+c9gWoR3pvXO4AlB6UIsfDU+0QJA0HC3P0BtaOCPrRFvvkr7sxn6Nc?=
 =?us-ascii?Q?r71Vg+8FEKcSO4vttwc1qfyXDUm9UHtFq+5uftq7dV5VwBB11fUNbvb9ngcY?=
 =?us-ascii?Q?LSCw6M8sqtJdGXr0eFB9md4DW6lo1cArn+o1gpIEK2VTimGKRCdf08WCePA7?=
 =?us-ascii?Q?vuQ88F6sdpjjNdloJ2OnVomhHixCLq7XSXqiv7eHAMz2YxsO2hQB6XBaKFuL?=
 =?us-ascii?Q?t/EmKQs6dZpyP+k8M/p/S0OMzj4uuXLrfyfOIA2vefvtSw92mOEmC20sXR3v?=
 =?us-ascii?Q?ozMh8Y0tEg4zSo8tKc/4x3/mBR9WgsO2om9C/5Ri?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a349f2-42bb-462b-c3ff-08dda52c9b09
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 19:01:55.6524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7j5PEAUtareBZHpYdRjQFDk5YQCOo5+eWvxF/POMjXq2HDfI+REEz//1SCgfVcK7YtE5Gbg1m9wxp1ABz1H6AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_120201_751289_EC2BCA9E 
X-CRM114-Status: GOOD (  10.63  )
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

From: Luke Wang <ziniu.wang_1@nxp.com>

The driver strength is too high for SDR104 mode. Change the driver strength
to x3 according to hardware recommendation.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- none
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index ea70ef4e85690..b6822b56374c4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -984,12 +984,12 @@ IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			IMX95_PAD_SD2_CLK__USDHC2_CLK			0x15fe
-			IMX95_PAD_SD2_CMD__USDHC2_CMD			0x13fe
-			IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x13fe
-			IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x13fe
-			IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x13fe
-			IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x13fe
+			IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
 		>;
 	};
-- 
2.34.1


