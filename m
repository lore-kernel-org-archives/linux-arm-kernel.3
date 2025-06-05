Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20647C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uztewrdXQWTahVc/YbzNobM64BLxewgBCZIdEB3Hag=; b=tLixsSWMFmIksXLHP9ihI/SPqK
	6YTEu91H1ItowQIsRW2GIyIrW7gx2NWKcK2SyUBzz30zMN89P67bv/mSQfCqHZn49TfO+/OhAxs+Y
	nfR/mAWT3PJANwwQm21vmpgWRauP/+dc2FRZe7so2risFDTEQKi8AjoWX1V8A66F7HPFjd53SB6OP
	7PIhBa/TQWAxlBnCZ60r+HcRj80ZcUc2YWsKrukgN6ePs3nYMs2104xEOyBMj//N2XllaZ9jsyy97
	bNla9stFVLGhXp9/jFYsKymzdxDcrSw4zcT/FN3tUlo54msKy2mgQhrvkMFrdkP0dmWMAUVdqsllR
	zXc8w6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNHrp-0000000GeZF-3XT0;
	Thu, 05 Jun 2025 21:11:17 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNHgI-0000000Gd7F-2fuh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 20:59:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk5R2hb/dUIROVkumqWyIpASeWbirME1nv4+MsAfsUfuDFKDrXjmvXayj3nZC3DF4u3ygFuRVNEojSByuv7X9FoL2YMDecy2yCttJUa75PjVVj9gS08FARVWcAIbDfETzM8pmIAKJRg20NcwL64oqROuDnolLIS1QgxwZTDgg7D/wq347ll9f2Y8WsbKE8UvRn6v8ZHGKyWa1vTyT8mWpg5Ozvvd+dKgK9HIfMs2lw1qPlCAedr3fTkYgR+ogG3Imz3BzOydnALWAYgKGf/dUpXRqLq+ZsjPSzC+ybzFOd7Jd17P15k0m5s903YqFkvtc0R9Ba6lmbeEYSJlubxezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uztewrdXQWTahVc/YbzNobM64BLxewgBCZIdEB3Hag=;
 b=c2kq20xGgPmdnx64LGoi2wria9y+9hVPaIz28rWAC/5LYUaERV3fXaT8yHEdjKWJJcRb2kBxiAD9OB3j1+ZjYQN4qHYiiqLZuMPvFGc0sB1jTGEUy+BA7WdM4m4TnVtm4iEVtnro2E5gxWwf9/bGgcHN3CCy/NVoH6KDk1A4B0hoXoadM04z18jhvTsCnXEXKTyVbKjc25r+xjkiZ2KXeH5Vh3zYLdLT0xI9ju9uZPZj+/rMevBdmw09Jxhev4n5TQ4TuSctHfkjaXQF/ozOjwN9KkhEFCT0ym4aSV8T/+mjuwYJztZGDxT5QtcKpH6Edyx1lRoIXY6NDrkjWvRMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uztewrdXQWTahVc/YbzNobM64BLxewgBCZIdEB3Hag=;
 b=kZK+Rq/5Do4bLeUasoA1GoyrAX6POwiuiOrYoS5LM3SeTG88/K2v6cB7vhh0Hu9cdX8IypeW3T8LjWLPZ4d8i03kdOKi77nwLNRVVj69ZOiCjsN5iR4XAtoS6/MwMtIyIuRpdjn2sQ//Ct1FA2/d2kSzftA5GxUq8ONTWIdKvO1eWfZl16rnfjKR4spoztGLIFZyeN6yZaVCRN92UI+kq7OoK6HywIkpHDQ83pkplyP/GI35XD4X0L104WEvf7LMfCVNKvdV6vzIWP42/YH3UbkSC7ZSA4GQtSLc9gkc601tKk4VW/Y9+sdEvsbMDEzMQavglTmF3kz2/wQFbxVnOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9697.eurprd04.prod.outlook.com (2603:10a6:20b:480::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 20:59:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 20:59:19 +0000
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
Subject: [PATCH 5/6] arm64: dts: imx93-11x11-evk: reduce the driving strength of net RXC/TXC
Date: Thu,  5 Jun 2025 16:58:52 -0400
Message-Id: <20250605205853.1334131-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605205853.1334131-1-Frank.Li@nxp.com>
References: <20250605205853.1334131-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A3.namprd05.prod.outlook.com
 (2603:10b6:518:1::57) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: c123a7b7-8f0c-4e07-60f7-08dda473d6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WrFcjDOT2Dd2FUnuOoz/baekjX3aQxVJzTvkyHG0Sq/no4nzRynzutJ9x7J5?=
 =?us-ascii?Q?NTAbTvYU2boTQUbGSPD1lhD/ioKkUpKnTz8SeaIE08CRJj5iE8SIWrF2VmXO?=
 =?us-ascii?Q?TnIIQWYdoA+hOTEL74itplEfm48zmdZC3UkTUAwjddxSCTpsFRIcr01NmWly?=
 =?us-ascii?Q?23eXnA7ceyNb34WTW91Z7TnA5SWmfFxG8Zp34k8LnYXScXWzVfxFekLL+HjF?=
 =?us-ascii?Q?hI4eaT4jofakXZJEUWcorwUf7Xn5C+xEJWjUn9S89TXPy7kNjwp+4bmotI4v?=
 =?us-ascii?Q?lvvCJ+cfZrepmxOQUfaYKLZK0ltKPz6WlNpkiPU5LPuDqmVZgWxhRMTbr9M6?=
 =?us-ascii?Q?FN5NvvFrKombbskEyhruWUiH4ki1eo9wPUdvyyO5zXv5uhKm8nNlIw4qN1YD?=
 =?us-ascii?Q?MQi/xbmY2tn7LGCzPCLlwh8Q4wC2nzh1e2rYwNYhVSX1oz53de2A5YWJrRVg?=
 =?us-ascii?Q?5PjFWhSEb6z0466mIl0XbQUAUoDst74qNW/CNDjYA291JVv1zoeUs3t2xHIQ?=
 =?us-ascii?Q?uDwHUEOJrTZqIT4p9e2VLSyKNBDIZA8iZI78RA/mvEMElSjeA6mIv5nLvk8m?=
 =?us-ascii?Q?s/ZFMHFeYGNASWIT25R2Mb7dmn267JnL/tlygTWpY5dNFwt4jlGm+37FDb1p?=
 =?us-ascii?Q?UM6pV5zP1o44HBVrMGP0v2Jisi+7GnN2zy/NMXg+WtfIC9wUbnP1QoTkzqgl?=
 =?us-ascii?Q?H4HmTtqtAHQOH1E2k+bnyuNUWtvkx1RHpunxMze1Wn+FYvjNZwwvE9MWswZH?=
 =?us-ascii?Q?tMwhwXsoRvR+eEfZVm0A2wd7bD8lE8wWLs13Mb5uFornwXTW5jqSYJolCt5P?=
 =?us-ascii?Q?l/JwU6/S0EXp+77E3DF/Bf1hOdEjGHcd8XL8lf7hbEziXrGz/8UhrbYKyYSR?=
 =?us-ascii?Q?vq6pwY5WAAgBw4YvDd7VOqYeDHUFjOYl9burYJz6rdXuuw7M/NJJuSazBl6r?=
 =?us-ascii?Q?fGcK4NcqxF6cSkF3Kr4Cl9COj1MSQKaGyHa1yGwBPFyY8KapF/FaGlTHwhfL?=
 =?us-ascii?Q?Mkq6H8J2/ABeiVY79PbkC/WYHTMCLsK0ILJHaYGp9Xr/i3ixARBMCigYN3YD?=
 =?us-ascii?Q?Ibkzzb0xzhwGDRspXYJ4WGgwz9S1QOmjpe6EcC1Gc4SOgwJcmUddoe9CJj2o?=
 =?us-ascii?Q?31XTKTnTJf9fPL3GNjvRBGKRCIX3s4buhcTgSzV43FFBcpl0lFTai3WAymt1?=
 =?us-ascii?Q?KiLuNDxG9YX8P5t9UB1A9I/cBv0HbwabqsKknrDCubzN1EQkWbcFRIHqIg5m?=
 =?us-ascii?Q?yq7OqVF4ZotZuoaj7X8cBfZyJyMN+obDVm37J2v+M45NRLjqn6xl8lm3UoW/?=
 =?us-ascii?Q?GR5hVG9IQg4qXwUSCBKZ07ro2syuGKLIR/mdKQAahnXsXDwmt+1n0bhlUiO/?=
 =?us-ascii?Q?cIZVfNpEfV0Sp/FOE52tT9p3wELjme0u1Fvn9S31LnS6JCIdCT8U9tpNWNeO?=
 =?us-ascii?Q?zgh//LEqZaqT4l5ZlE6lMDq5foSxl/QB1BsFL5rX6phHufmcWYKbpI4KJF1k?=
 =?us-ascii?Q?hbNeBLci3aMdkKk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d2yEijp/L0rUTjXe9RJgsxvWph92wDgGAEWvZKYZ9uTMlY9clDtCL5VfeqDF?=
 =?us-ascii?Q?88nS09neZN6CV2dFdch4J0d0SH3eWjYyKyqtucjGc1S3oXpq8z21ES11R6Ks?=
 =?us-ascii?Q?sfYYcj6goz7+CiuOljo9byi0EQJJeTGjNfjbvP/tDgcmgMIey91tWY3h6Y7A?=
 =?us-ascii?Q?JlxZolV0Idyb0z9rMKH3JuVtuOT5I0lyaO5gyMMfUYzy5o0dRMd7lWlagQSp?=
 =?us-ascii?Q?G9IKKiVZt7UzkpFStOSwXAlAVxL8m5HteOSfYM+1yXu9QCDWWwZotpvlQ2i6?=
 =?us-ascii?Q?Cpz62WUz/MIgcL0r/Sov96SyCftj0DkYHBQF3w90+G1xwBefNzfS5PBVQGQN?=
 =?us-ascii?Q?VMJQ9PZ/mOMCX8SkOWEXyieEmBwgimiTDz1HGtBaWSC45JgQnvMbh3Zd0Ye/?=
 =?us-ascii?Q?4lrj2bbaMiUcxIbD1VCQ6Je/MWxlPWJ2jhJLw0zfL16Z7Zy/t1h/m2Gc37jX?=
 =?us-ascii?Q?2F8agXpfockz0x8MFjiOLUUr86w3M32d/UV25x2ww78cSGnKlBVA6I65DhIJ?=
 =?us-ascii?Q?HuuuouC+isHrd9DjcFs5g9XF1ZvuHBFkMWhruGMtOtz8kRRp4uR8vEkvWgLY?=
 =?us-ascii?Q?f/LMzLkzNs+yuzzNZWx/azF5a7gWcN0jhMBzpp3b+lDh9UYkc2qBPsvOg8E8?=
 =?us-ascii?Q?KL8h1XqgsVVPIunPJz/gDO/HqjWKc1Lv86vcH+lLzQWki4ivaNTpwn1HVE5G?=
 =?us-ascii?Q?nQeE+h0vLfWZTXUv72acSaFnyrPvBHxS3HpWHeekZwrevXWZUeXQIyEb1THe?=
 =?us-ascii?Q?Ob5gU43DRAosV3welSUkXPdY3TS21A2YKSWhZiS3JMD92bC1HryllWHiDUHZ?=
 =?us-ascii?Q?0ScF+fJ2wU9CinEwbTT/1xxXp5W/5FY0gVmm9iJMWzXE9DLlcsBxXhx680iB?=
 =?us-ascii?Q?mR5IGOY+RyqaJB+5OOwdriOZqOY1yVe+8hBSIbrn3mrT+9euaGOMjRTXGDmP?=
 =?us-ascii?Q?1cK2NanPh7QCB+G6smMrVqhPoO6sgFFK1RywXJsJwX1vGwSE+tfpP2lFYrf9?=
 =?us-ascii?Q?RrL3qzc50ad3Y+GkOYZk+9hdLT3CYkXaVmP9pNlBhFIyRbEPT+DBuTswN5vK?=
 =?us-ascii?Q?elNqVTeTQbaI/OeoeO/kyjgS4KzsBJFXxvNszaDU2Wmpv2eVZTd/yIKQzdsG?=
 =?us-ascii?Q?m4TYTW+rWTZ5TqVLGn1xkDAMQrNGl+7p79w1akrEMqqPPe1c3ZqMYCgdaB0k?=
 =?us-ascii?Q?+rNEvjFwSaHmtMuME80DvdjuJGdVy7pznh/ah8ii/uDH3TZpRVw+SsksgX9r?=
 =?us-ascii?Q?wbAZZL+zinCEjBlCfv40MpVKY/nmEq+4jq8Bw49PxW1lMTFylRQmXVY923xA?=
 =?us-ascii?Q?I+bDL+pYUdXkktrUnICqj+YPN+8L6TY0e42flI8lwnlGogorcEmDbQKh+r52?=
 =?us-ascii?Q?lz24k4HPUoBIHm4EX5OGVnH2TDoLJSvX/jOzTTDfd0SPuA3XpCqM6/14vjM/?=
 =?us-ascii?Q?qk6tOpsXsS8dbw+2pn7JEaq9EANTid89aXSmMs+6yh5LwhhQP8D43F9FLXQY?=
 =?us-ascii?Q?7hPSzYtGbL/IyIN3TpCWicVIW6NHGBPI5TV7i+Fv33VFfMwngw1p5p//Pnu9?=
 =?us-ascii?Q?kiYK7APTglHGTclap6RyVvEO9pkRKqKSQqkTAMQ9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c123a7b7-8f0c-4e07-60f7-08dda473d6c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 20:59:18.9880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pTUL16r2cBL1FFsXVSkp3P99eJlRbnPeVToYWgcCQD+gn74STzBSla+D+VI1hX3K3AJ6+xfjzilu+f/LDOO8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_135922_709105_D5B83071 
X-CRM114-Status: UNSURE (   9.55  )
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

From: Clark Wang <xiaoning.wang@nxp.com>

Reduce the driving strength of all Ethernet RGMII R/TXC pads according to
hardware signal measurement result.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 8688fcb382c06..31fb1cd8daba2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -673,13 +673,13 @@ MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
 			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
 			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
 			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
-			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x5fe
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
 			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
 			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
 			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
 			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
 			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
-			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
 			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
 		>;
 	};
@@ -711,13 +711,13 @@ MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
 			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
 			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
 			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
-			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x5fe
+			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
 			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
 			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
 			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
 			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
 			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
-			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x5fe
+			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
 			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
 		>;
 	};
-- 
2.34.1


