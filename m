Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97265D0BB47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=swSFmM4gjrq08vkqdvcaVB+Z8+FcMoaJs1bEF/M/2is=; b=Mz5mm6DgiX51uQ2xIRVf3m3fRd
	2bAPPJEC79bYhpVKef/u62p8FiiuhGHepYyc+gsBJqTUYCYuBpg7FLYoipIuCetGz4k91jdSd4bs0
	jcKuUyO0ewx2oo6RHnMYK15YfXGW7LeWZTmqTjuiDE9TLA6j/xiqT6avoj0P6sBFRfKmCOx38xEu6
	Y5vQ75mhvMAILDQuL81uLwESmjFwyIdwEx6/lCawqFlqIl16Po0BU0Te70+FhyW0pSEw3wHxyEFi+
	GlmIOFRuEFSijHdEqpmmwgHOPq2++pO4GssO0CSi55M8beLrrlr8+gvhjioi/tYuW5ph/6Ym1V6qE
	lv5TUrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3juU-0000000G6P9-3QvU;
	Wed, 23 Oct 2024 22:32:58 +0000
Received: from mail-vi1eur02on20619.outbound.protection.outlook.com ([2a01:111:f403:2607::619] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jZh-0000000G3u2-3sVQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:11:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImpxcGjtCvWRgzkAYoHo1bXtBmnWvLenIkNihc0buQxOzCcKrOmvyCqZMPDXD0cT1FohqQ3m6yNmogoA67MpgtdIwGei2f8bveWrjpO/zNBeMPFfJNTUJXoC2Uy3R1aXqb5GLf2vjfk3ISjCZ7h2sm+l2BUafO37VWuKC6fwpJnIyWspZmjoKII19uOOPKWFM+5EEoHR6xgr9dT/Os5SyIAM2UdcpBrETgJmr5EE4fsdjS0l8aL8CQMKIbLLCL9HrYnCi3e3ynj5wwkgbdQrGcf2AtBX3Nl0ub7OIDu6n08TQHnm6hFXu1HdMp1V4vjkUyFjwtBB38llC0iOlv1lXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swSFmM4gjrq08vkqdvcaVB+Z8+FcMoaJs1bEF/M/2is=;
 b=pLfbZvKNx2WJSUiLeKn61M7xPMa4748vLWrqQKvzmSs+aMo3qr7cGM6j957ugbsmkWICz1JM+4LRiK0ypDPDiIgMENgcY2Gp6knmWTbFjXUTqLyu/7vGMJIaZR8bwUwo6X9WxMf9u5XFiqghugd6/KXmmdptNJcm69hLvWalw4S6auDaCPQz2iEbMvHcI/FfhT8Q5bdFNpYrVhT6ZhJm1hdYnaAFL5DWN3vevrVqUFxSb1huMb/NvXuolmf46dDEl8oYfQA0Ji/j1ZaucDkoY/ArO9ED37/sIymJQ8VfxDsNd3+2qA8y1O4fIYNCuqJAcghGZsViYNNfD/wkoFiFew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swSFmM4gjrq08vkqdvcaVB+Z8+FcMoaJs1bEF/M/2is=;
 b=T0KhVU17xWxyz9wL/QbDQeTiiX5dPik+iLj2iRrOHhCSJPdG8pvvvaN5/41LJLndepGO9tHkrZvpLppIaX5ekYW29GReOWGx01V1AbGHH0SHKKWq6J8lWITt/96sADs4ysN7Ib/NDgVFy8NZEG7HP27ZjOVr5ryH3wyUZAFC+COTsyyxD2bYoOTktCFYSNfxH/qaxeyqTiGORbih/csmMveKfFOP2s5hxHHM2gXDPi/LXLNOtcxNDvUs5MVZiNji7DO9CPZDqGCRLcXh2ka/OYVYdJ88l7weRYavzQ3GQ4skyllYIW2L3a+/iSI1OPpoIFZRDYfs6CiEVcF46/kdUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 22:11:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 22:11:25 +0000
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
Subject: [PATCH 1/1] arm64: dts: imx8mn-bsh-smm-s2pro: remove undocument property 'clocks' for audio-codec@18
Date: Wed, 23 Oct 2024 18:11:12 -0400
Message-Id: <20241023221112.1393280-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0008.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e41b07-796a-4868-2e60-08dcf3afa286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?spDaSK7dhvK+Bg9Dc/4csYtOjegIijJzmZ8Jn+bMekkWyFawMqR7yhn0DB26?=
 =?us-ascii?Q?Z33z1PZt2Rp9nZICsDWVwQEqrb4xiYcipiWk9s8NqjMaMRjeBq/ij/C6On0I?=
 =?us-ascii?Q?BgnnoX9K26z8xziinFhfrS0Pf7kv1GCYkhSNw1WaAsYK3sLE6foJjZiJMrMi?=
 =?us-ascii?Q?Oj46Rw66x2kwRS30+UIlOiCD2gNc+zjPTlLrZRdjm4ov2bPYKXemM3MBOZwv?=
 =?us-ascii?Q?A2aQQ+ELzTF2NP/zrJTcyf9EfMGRhfpuFEOT3MrsSGN5ztuzryZx/FhcRP4d?=
 =?us-ascii?Q?I+cXJgv6J15NgBPY38GOALh/yypWpBTXe6LnaNKnRL/BeqhGyXyGC4QBN1aS?=
 =?us-ascii?Q?7enu934ZRK27U/xw4ZJ6fAyoaulTDca9/Hgl85x7+Euf/AXpxP17yFt9FSZE?=
 =?us-ascii?Q?Z0FEdGzqY1vLMkRJx5vEYN6BOY3Su/ZJ2aI0xVvzzruoL1+I3r9PAWTn2N3J?=
 =?us-ascii?Q?2LA00AXvO7oiBQH3faIqxklzLO5XYJsePhs6l/2/t2OE2TxadbXIAFh+3Kk+?=
 =?us-ascii?Q?TgJQHQBXu8PlI7YV7cAdPvK/PHmO7MqbQsfCIvtUU7y1pcAuce9v3ZmGeMNB?=
 =?us-ascii?Q?G9txTbMDfDxCOqUdfiUgZ0FFD4DqvKnoOkdFNOpWoteeVDtu9y10tfXXjeEy?=
 =?us-ascii?Q?sOWX6GpDvbyIvuI6wNusbSkoa5rxkSkTGLbSO4m3E3MhzQNkYiX+ml1CgY5X?=
 =?us-ascii?Q?G3u8nDgaJdcJ/GoK5x41LnfRqgCenY20IrMAGzJO/bJDLK+3R6I1qGfkiw3t?=
 =?us-ascii?Q?xac5mCPdrxBQVLau/3/WMQsgYbAJBbEGWKScXMgltKonfN+AoQP71IVRqCbc?=
 =?us-ascii?Q?kV6SmQxr4XDZpLPOzfcaiDCZ1rv6XOg7nSwMYFWrCIYa3voTpWS5soofDIh+?=
 =?us-ascii?Q?Savdz6NNDYwWdYU/aqLJwU86bjOPWb7hj+D/vlYvWgRirkEddIg2xNmP+7jZ?=
 =?us-ascii?Q?No7Qbvr6+a0CPFuH+T4bkX0Gw/0A5z2xniimSeEPlAvSrk6DHgO4FUA79ZNF?=
 =?us-ascii?Q?ReyrOnrEgS9OypQha9lfk+tzvNNSvYXheUyb6FIITCDm+TiDzEnfE5XaE2WE?=
 =?us-ascii?Q?UUUSlNz1YnTWAc7gtvat9QLX48D6B9ExQHMlgZ/7/67LRPp4DqcUKOuUCvdU?=
 =?us-ascii?Q?zH/6IW50iQ/pamPRI/KbI1zbKlMMJvjhjHNC76isDyjjjRG6QulQtu50X0ty?=
 =?us-ascii?Q?K2ej4V/XaQaUBc76/EHHdGxGZlX/OQfFk2YCzJt6qj3Kfvg/u4JRGXkhHKyC?=
 =?us-ascii?Q?GzSr3ghAO9aHzQ+QXJ8Qjf6tS/lZ/gyq2j1pdpgeNBaP/ByvH/Zkn+Q//FM0?=
 =?us-ascii?Q?1ln/Nrlk+UJ7PvzDsw4Y0TCVOiEmCFyZcpwYJaTMmNg0pc1U9jmtDPszJZLy?=
 =?us-ascii?Q?DQF1JvE7yaYf6LixNNl2vrNVnl6s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gxKqHn+Xmugv/WbXKogftAijAkqeMCjz0x27nNde3hT5f6CVjYLhOOwXe8A4?=
 =?us-ascii?Q?h/BTt1ExKFrzeUVlFhflllufF8a6SA/WXJeW7iFX8RgHfHgp1oU+qREDEBu/?=
 =?us-ascii?Q?mTucWVlDUgLbSEJMF0xWlh171F0bm8k5H+aSnHcZVK3JH10AIsblhnfIt4BH?=
 =?us-ascii?Q?TQtSx4poqjG4jcWm6GOFQ67u2j+eh1dn/5zTGWVvZHC5tTo2ZoW0xqw70fKg?=
 =?us-ascii?Q?vg99IxxoBEvkTqyu7cXp0/WUbyf4XjSF+q7MRBICtpNo41jz7p7mlKa6TW3v?=
 =?us-ascii?Q?3KI+Qvp4YwTjFAH7Wy3OcWlnJOP4e5w7AEQIih0dZ89U4SVoyOtdRhu4uvbc?=
 =?us-ascii?Q?sacAcbZge1pQaQ3M1rbDUgl/b+Uc+7NCWaDetU0+RjVfGE3PmOSwxjLau6tw?=
 =?us-ascii?Q?04c46STbIC2t+3dpsMkvN0zLAF9OxBJI81+qaE19oAmcEiCiIUflGvGeoGSB?=
 =?us-ascii?Q?Wqh04Ua3pg0KfML4FzRdAr0u0ycPwlcVW1sa2lQEeu6waS53qhXb82mtTdl/?=
 =?us-ascii?Q?tdD84F/vcK0jRySDxOn/Xgfjv3lghuNClAuFMt003hKWVoHYNYchD/glZ/ak?=
 =?us-ascii?Q?3xjgECg/uWbMTqX+BGByNYmh2Z3f50rS1D8dlahIniNITgmYDoAaiETaVYYs?=
 =?us-ascii?Q?uWNhoFsvcH8VzhN3hU8QkJmMwYD4uo9d9JDzFzOnyxupbX7CdXadVuVv8stf?=
 =?us-ascii?Q?dBWsOduaC4cfpwXnkQ1idwL0q0Pvc4/MNyQRYVe7yL7cB2oJt+6YSlHt8VHA?=
 =?us-ascii?Q?kma4l8XfAontL2nMOV9j+E1uTw3bh3UUeGdFjmtUNpTeX/P0isSel92ipSgk?=
 =?us-ascii?Q?cNA4gdSvY6SKBDkpvG3yDx2fKVcpS1oCta8AiPDK32nvIcEJKS4tkL5YKZUV?=
 =?us-ascii?Q?5P7rSbalj14uW7CRaN0mOBNPSMqoIxKM6GBX8Cgmy9lqyN/iC7gsXxn8S7zf?=
 =?us-ascii?Q?mvlFlHwbjsdy3vzy5L+q103floco4AGquFhZieQWtMX1UbBbC6tqnRY8khZ1?=
 =?us-ascii?Q?Qt8SoRZF/ur/o5MhX4zaIMST68dxp5HlX8CFz/HVlTk0RnUdBruEb7DsbtdH?=
 =?us-ascii?Q?xe1TKDeMNPn1TYCc8rGPOgKN8lxcsHFkpoTOU25GRGGmcjlYb1Gf/vUC9kCP?=
 =?us-ascii?Q?dFh7hqcbx2HINj91eXi+JRzesCpRxQ/GFffeMFavTVsCXNYuXatGfhxSLFst?=
 =?us-ascii?Q?MJImUTrFj9hIG+harnlNGzCWh2GWcMkamTNxtuBMg227A12cTnvoEz1EtAq+?=
 =?us-ascii?Q?g7sU/7lWzSydDguWOQYc2s3YNAqk/btMSMWn7MwMliWJ1nd4uyb5uDcsaaZ+?=
 =?us-ascii?Q?B7mSBZ3Q7OWJF89dl6S1NDbVntORWDmCVArvnKB6WwOxu78hN8aKgPlBfIhV?=
 =?us-ascii?Q?yU38SGxV8e697DXtMJTN2Nj3TBBWNdes1dAVsIZOsr0uBnRwpymZplYbeu8M?=
 =?us-ascii?Q?S+cDfEhTtMtASWnkDT+jIFfeL/uEj7piQAyOGec30ZiDqaen0fxUo4vtOGYZ?=
 =?us-ascii?Q?0SK4U84E8VILZF+TyCwwd/NfV/SIwBvUsLsan/AnPdSnUuEdyDk/VJNxmefd?=
 =?us-ascii?Q?d5i4O5duYvR/ZBHa6E5lnz1OlfajB1nCzT9EdXpo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e41b07-796a-4868-2e60-08dcf3afa286
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:11:25.3970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Vga0dT2sX1uip2sb+10S1061ykN+yfFSsl/w61bWLylRjMbW1ipeg89nLOkg60BMLeeJF0gBuj2guBspHT6vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_151129_994155_08994849 
X-CRM114-Status: UNSURE (   9.48  )
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

Remove undocument property 'clocks' for audio-codec@18, which compatible
string is 'ti,tlv320dac3101'.

Fix below CHECK_DTBS warning:
 audio-codec@18: Unevaluated properties are not allowed ('clocks' was unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
index c6ad65becc970..475cbf9e0d1e2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
@@ -64,7 +64,6 @@ tlv320dac3101: audio-codec@18 {
 		DVDD-supply = <&buck5_reg>;
 		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 		ai31xx-micbias-vg = <MICBIAS_AVDDV>;
-		clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
 	};
 };
 
-- 
2.34.1


