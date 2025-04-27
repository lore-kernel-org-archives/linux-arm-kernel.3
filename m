Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94747C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiPPrtSyFeqQODjOLU2zkoTnDZeR9Gu8fC+I6pjD/9Y=; b=M3if47LkeQXSCgy5/TR9EPPwGk
	XPnlzBIujA4j4rK4xshPmUlwIYgKTFp0HI0rSYqhRyqlGzbunDkO+ygZCgJxy13a8R+AoNIRlDkX1
	dViIwLspcZUQGjppLwfjvvXoQlvbHYSn9A32YsYVGZspcsId7ynf2PoyEUQ/LOEAHsaOWaslX8Sof
	wRhZ4+v1vNGirDpJ5/4oTSHeUmFarQz/w7+mBHi0+hTDpMOkDQalnBQqzgLrofYtrUxQfJXB04T9C
	3A0MgE4awIwZU/0jIGTF3JNGW7oVBuSIuJf337nI/QEEwE/A1uvB8svfGUPKOudr75FmjFAHN9+eW
	YoPmdWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xOW-00000003BOF-2aP5;
	Sun, 27 Apr 2025 08:29:48 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xH9-00000003AN6-1way;
	Sun, 27 Apr 2025 08:22:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUvxbsiqXp9Dq2ubRgCmJlTicVDJcGlpq34NEM4AoRql163BCBUbWtFOppBKTdhwejCVwvc0fu2o4iUohdSRqKIA5dSxoa0xau9pAQXGqT+s3ExV1JaY3PeYiYHFTA6XQ6TcjSD3XPVX6O++GejFzMM1jGUUUqWxeCeRCV0SauweML/jlKqFytqd391OB+zKd74lL9w5EmJ6dkD7Hz6UD/I4ToWGxuTj6cVAT5dn9MPArQLMu1q4wwu1MRUYoRPZCfwbrSp4oQLq+Yc7QfmsXIbBCuH57k9BXDLjCmnIeCx2G1OPu3DU4jBoncpb7WdryFNXQ8Xntwuoff4/plNcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiPPrtSyFeqQODjOLU2zkoTnDZeR9Gu8fC+I6pjD/9Y=;
 b=eKx/G3iSGpPoixETw3m0U8dmlMkpt49KlSVpzysWVcUEVb908lrlULkAzxfD/9O0b6050lQtuk8GcD901tRwoBuA+lf4EJr3LavkXIoBD2R0KPgSYV8wXa0ZQ2JriZZGZ9M8eZEwMvEAX8bwdqUKcl4Lpc8CDG6xY3MYbzciYfygtHLt8gG/+NLComnSCS/SRGBuahIh3aLfeg3H825RLNE+3vGE46woOM/SttfkI97bys1OiaYpwgHUfmisdrGCek00CAx9eG6Km3KqcuFQrYtpHQoXMv/KdGI3f5TRDsHojm5aMywIJ0smRXW3uF0ocOs+jkgPJh88ENu20l8zuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiPPrtSyFeqQODjOLU2zkoTnDZeR9Gu8fC+I6pjD/9Y=;
 b=e5GUPdw+aqtAoZI8OUjJz6LqPiK2RMjIMAX6Yia791P9lww2UQN5z3kpNBVq0bL1tP03twK7dYHJJn5LSNpvFW8sXgjNY569CNyA+VAWZv0frIQyZn5OL36sw9vi7JbmyLQf/GboV23aOYpHfMzH2CknCmsuVsuEVXz40Qo/3EdyezumhssdZO3SvEw3KMI3NIcxCdYMieXNyVkHwsfC2MpBNNsBOlxtDEp/qi/5X8SnrY1xTpKZArLbGWcaByV7iENtbnScBccRZRdZELGkJnIJVj1e8t6Nc1HbYeUIUzK5lpLZKOp5JCkQ30Z9gUUwh/aZbbe1lbCIhY30QJvKxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PAXPR04MB8474.eurprd04.prod.outlook.com
 (2603:10a6:102:1dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sun, 27 Apr
 2025 08:22:05 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 08:22:05 +0000
From: carlos.song@nxp.com
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V4 3/3] arm64: dts: imx95: correct i3c node in imx95
Date: Sun, 27 Apr 2025 16:32:30 +0800
Message-Id: <20250427083230.3325700-4-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250427083230.3325700-1-carlos.song@nxp.com>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PAXPR04MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 30375944-8956-46d6-f024-08dd85649835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K3l2kGgIUk3WoBTUsahQFrVG81uyH8+idlSl/UgelOUuzuqzaW4iL0O3XOeT?=
 =?us-ascii?Q?YS04/F46dHV5BG5m1mUubONuRfjhT0Ddkn96tYd8s3Px/OqJdNUxaFfwxLbA?=
 =?us-ascii?Q?aDbOneO79yVdZ1TV2JsyBoB7qJqu/kuML+PS+fiL/nC/f7Yt0kTzySxa2DLe?=
 =?us-ascii?Q?e9fXF57jjNfyKMoQJemjNqYdKvudgLJhbgm5me8/g6AlLpd6eixkaL/8snUa?=
 =?us-ascii?Q?1yhtW/4iLrZoeIPFMq+3pVOOZN2gtb6u6zLcM4ODEu503e0mHA/yHdd5wXB5?=
 =?us-ascii?Q?nQlUaLRzp9S1bAC7pb1qx9k1iQut6ktZQ/z8NpFCDmmAiNcgpr2NuwP/Tlk7?=
 =?us-ascii?Q?tGmQAVJ/JvuALyk2WO4fJRVWFVV89YUDpcmNwRK7hgomP/UOBMv5HoOVhYao?=
 =?us-ascii?Q?4TYh4gkmgZrQaz+eSeArQP68WXJoJ4BtUodTYY9a65o9sbH8llUwWHMhW4ye?=
 =?us-ascii?Q?GHMfk0Go5Kp6tq7N1RaxHoyfa6XWHWJVYQuaL0aMinmsjaEfnhJHXLCGZKe3?=
 =?us-ascii?Q?i4B5C50Nvt+nHL5hi+ZUac7xlsT/y3VmkN0k7Tss6wXDBg6lurQAv/PE/rwF?=
 =?us-ascii?Q?43K8Nnp5KD7VX+bUhAU9REiIpoK8GcrKJ6T/XOosctHclHXe3zskDl9lbQPW?=
 =?us-ascii?Q?CfFF9yRoBuDBSW0E22SKeJymkRh2w6Qig89HcBN1qDbpBr9LjS+9dSO5o1cl?=
 =?us-ascii?Q?vy6JENK57pWFGp8EMcfn9FHCpTNPNiMhF1qx9TWFT8dq2SVtRipKAjIyusBO?=
 =?us-ascii?Q?fUSVJIZXnhz0afU79C3jHgqr0gOoXyO5iiFWoaH+SQF56vaI6nFDVSwa/DTy?=
 =?us-ascii?Q?GSTKbw2aZGjkeWwkO2utwFCDaecbyfy3iCV87DYerzdK3bPzktPvnLgkXrTW?=
 =?us-ascii?Q?6GCCocEJBsHHoC8XIHpZPudkkzQK+9+kKQcaGxsEqufeOh9CVdmYpRHE7Syj?=
 =?us-ascii?Q?sFyes4QDOhP+Kc/4VFi2FwRAVbh5oQa5+1m8Vz22/79UIJVtQqhF9gEfyCgI?=
 =?us-ascii?Q?4dYbfLyBCfkwpkRmAUY99YjQeOHG6LBeaAHgYJIWV3VZNkW2ovuRDdiMUeKO?=
 =?us-ascii?Q?wxhlDS67dB0MNvNUb3mfnjoQyAayqQ1c0wzxOpyfNiL2wqvpE8IwOZ1gOw1q?=
 =?us-ascii?Q?+OxCEr7I+a/U7oOC/ADgziNfxqhKy2NaOpJ4mTltw8Lyp0sRYGBL8Y4GpNSr?=
 =?us-ascii?Q?G2Nu++OvDHgl1ekaPkrKrhOQnr9N3Cs6I5wDFWHW+zPHE8PGfknBycbd4tAv?=
 =?us-ascii?Q?YCBVckPCimNVczfxA420lVsPLFQROxK9M6f1zfQSM557UNRKFRZpzNduIy2c?=
 =?us-ascii?Q?vaoqUQcfvedK+se1gihJCixPlzTsKhBmcZ6JwJSpTzO9PBYhPlxkKQGJ3j02?=
 =?us-ascii?Q?mKjYzJwChXqArQfoToB9r+zBl5S65a9U8Mn2sXhQTmoKEyq/T/C2wq9qvnVO?=
 =?us-ascii?Q?Os35iV+xz/VHnWPE4j5nUQtDd0AxEgFDlrHbmmrPmmla+makQh3qUvOj0sCa?=
 =?us-ascii?Q?hZW0PMxHjzxcrqI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/e48VML8VYr5s/X73vtVpz3VsgKnDZjcEfhf0+MbK9NNP2XHaJOxYgHcauqw?=
 =?us-ascii?Q?YfQsOW8adbomcpuFTFkcL92NNQEPlO5NjAH6RJt2cufyYTigeVpB5bgQQcML?=
 =?us-ascii?Q?0Nt1DPP6ndOG1vlydvC0keqPgZ+69ctcfJUQJY6BmMZuvMxj7XXtqmN3af1H?=
 =?us-ascii?Q?ncFmLKUfeh9WdNFklZtggi32TEnGWZC9UVWc2aY7/k2d+ZuwDmRu0Ke8V4x6?=
 =?us-ascii?Q?bjXF3eLpDSe22s67V4TL+8+IdMd1fvL+4fPNjJ2rbYU3y+SzyN5f4EtjU/2R?=
 =?us-ascii?Q?Fe7D5rJv0T/Fd4qsDUwa7tKRZHTZ+aH9xA7SZ8aurZ80NfzQxkLw/jk3AoUw?=
 =?us-ascii?Q?9o8pj0FAq3eBjCZ8uHLPWxbV1BmthAsa8Zd1OzSU3vG29r+g9ClgfwfFLssV?=
 =?us-ascii?Q?k3fKafzaJcMLMjLt39e8/NfvzMHMibirT+rUw/3xWPPWkqBh3lj38dlrcXwH?=
 =?us-ascii?Q?vsNsWAt7/DpD8kbRMgXQKxLpGsV11JP8UXHYTz4aK9Pb4zdx0DV+8srT7BTP?=
 =?us-ascii?Q?RDZbh86V2jJrhK3OK+nlQ6vZKHjj9avV2RfUJsWyUWlgpo8kxCYvTF5Xopte?=
 =?us-ascii?Q?ttQ6Scg0Nw3om+9WbPNAjjl3PonWfysGgXAWWDc7IK0bVb3B0/oJsKD1HslZ?=
 =?us-ascii?Q?KVSK4Y+AXO+CoOHAj+BV+xRXlQJ+kSd/wuibKucATFKtlP2kUv0T4dOdAIB+?=
 =?us-ascii?Q?Gc0QMGDdkLy6sbTzhmvhZ+jSaCbiHDUPf3zEARBvHApzCd4tSPTgo/ThRk5A?=
 =?us-ascii?Q?02L2vZEEz+87n7jWEkEWuESTf7/itQ7sgrqtwKxBKpPKm4yz9vWhXZrl9Tzq?=
 =?us-ascii?Q?uQWfIKRGFKqszWG9O8N3M5i/f8T3zvMKzcSVGesUg674bxwpwc9KybAcfo/s?=
 =?us-ascii?Q?tTcrFosX1tZQjs3/dwGPRSfns1PkAQq22H7uxd/Ggspt5O288pB2aSjEvC+5?=
 =?us-ascii?Q?uXb6CN5eEI7NmbDEAy8/JynefAn1vu0SGLjmWuw2oYx0E3wl2jjIVF7Z/Ki/?=
 =?us-ascii?Q?lF29kyyzORsP2dA5tV8CvHDSf07kEOvUAbgIIfCGp0h2o8cvwq3DtZrj93tj?=
 =?us-ascii?Q?kA0UbvRSwy4Xbyf7MkMHXDYCwc/wIdqOLO+sNNwEOkgFd4c+PacwnfyldMX7?=
 =?us-ascii?Q?72Pi6lkRkdLwPGDy3YaOUFfkobkzOtf2eVA2mdb+ELJTnaG9tRXtJWG8IgkO?=
 =?us-ascii?Q?Aymwv3Y5S9Zo5J+LtEQU5LJka2WHOt0rDlBz/VkZUbz6ULvFZoYp5LBKXykv?=
 =?us-ascii?Q?t9xiwKJoMzZn859G3PZAkP57fSb+zK3DflAPWMyRIyjTnd6CJmXnJ/hFmpgG?=
 =?us-ascii?Q?W6na8Td5gdVy8k4vPnqXeSafUYZeQzzntke8AzfaZC5Fz5WtltN32ZUk4bBB?=
 =?us-ascii?Q?HeAwxhEphQlCWB+m7cBZs50ugLpTX5c4z1xXtNtFmjTnPmMPj/fM43kuVBEI?=
 =?us-ascii?Q?2i7+PdCNDY8aAQUSvQaW8lJ1C+luN8vr/rE/4tFCbPQZ852pkjedWwLVqYRX?=
 =?us-ascii?Q?gGdRRyKuLl8y0bcNSJGPHMlQGRAo2+Rg6l1VBHJcJwKtOGMb9Yk0cwlK1rcg?=
 =?us-ascii?Q?4EFiR9qHQwIcRPu16yT5pMNHLhPIrMtKakPwTDPn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30375944-8956-46d6-f024-08dd85649835
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 08:22:05.5751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6pgOaW8OMgGZ1FFg/eZsfZzO8AwipmoKAgHthr2ZXrVxuCcs34IsxJKBDxht8szgYYMGBi5vFqtpFXIH5/mdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8474
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_012211_506949_B532B5AD 
X-CRM114-Status: GOOD (  10.77  )
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

From: Carlos Song <carlos.song@nxp.com>

I.MX95 I3C only need two clocks so add clock fix. Add "nxp,imx95-i3c"
compatible string for all imx95 i3c nodes.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Change for V4:
- No change
Change for V3:
- Remove unrelated fix in imx95.dtsi
Change for V2:
- No change
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 59f057ba6fa7..ce0787410f9d 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -681,15 +681,14 @@ tpm6: pwm@42510000 {
 			};
 
 			i3c2: i3c@42520000 {
-				compatible = "silvaco,i3c-master-v1";
+				compatible = "nxp,imx95-i3c", "silvaco,i3c-master-v1";
 				reg = <0x42520000 0x10000>;
 				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <3>;
 				#size-cells = <0>;
 				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
-					 <&scmi_clk IMX95_CLK_I3C2>,
 					 <&scmi_clk IMX95_CLK_I3C2SLOW>;
-				clock-names = "pclk", "fast_clk", "slow_clk";
+				clock-names = "pclk", "fast_clk";
 				status = "disabled";
 			};
 
@@ -1266,15 +1265,14 @@ tpm2: pwm@44320000 {
 			};
 
 			i3c1: i3c@44330000 {
-				compatible = "silvaco,i3c-master-v1";
+				compatible = "nxp,imx95-i3c", "silvaco,i3c-master-v1";
 				reg = <0x44330000 0x10000>;
 				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <3>;
 				#size-cells = <0>;
 				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
-					 <&scmi_clk IMX95_CLK_I3C1>,
 					 <&scmi_clk IMX95_CLK_I3C1SLOW>;
-				clock-names = "pclk", "fast_clk", "slow_clk";
+				clock-names = "pclk", "fast_clk";
 				status = "disabled";
 			};
 
-- 
2.34.1


