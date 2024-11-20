Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995FCD63954
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zL/VZRLZoCjyIlIGQnIKiUV4QmzWrnAJjgHq7d0XmlE=; b=nwWJsrY/EEhYyje/XX6YqT6xVH
	gogiJc7i4SjLlGmMv20l/ropFZ3Z+Ow6lhLzYSEsPUiZGA9atluotXZSuLJQ1Pfkf4VmMAM1JDnKA
	QzxJAXhl7kZGIZiRHELJkaOFEldFOW67jQKjqO7xfiXSF+4Tegx2y7/w8hULmkJcCIqQIYWDP29X/
	5bGCfwM4fI+12MD5HzeFO+usWDViZQpeeXfv6n4wPTs6ibdbHZBrDH3fD533LqGNezm6aDzTA0GLi
	2lwYqacQbsUl5qx3cWPwT4Xa1wY6IOIe9dTC35FUNYLJpTy2QzTV5YEXgK1VPGjMDgMnr7l/dRCfx
	GdQlfFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlI7-0000000FTSD-33fj;
	Wed, 20 Nov 2024 14:02:47 +0000
Received: from mail-vi1eur05on2062d.outbound.protection.outlook.com ([2a01:111:f403:2613::62d] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlDd-0000000FSay-1qRK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 13:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0xy968KV9qBWZ/O/H+gJri8HdXN9N+6CKW4I0x4Z3cvd4R2YwFEAtckbdwua/h6X5pZQtOoVE0o3AoekfGTDzZXB8FYU5Tjoing8onYXJs4Sg530LyFKTu/n8M+Mpjib3U8Ji4zQBYHOBxEAqYOrvNYnl6bctrLBL+fQErQC0R7r3vwiCAXOj/OYFVr48M98wVQ/WUQq4QHYjx4XY1+LP7ly2bHI+DViHn8vYhOqUTvr96FFq/OMBrabUnSeKbhE/Ie8El/fOgHwo5prMmqYizSavNTOjjyMGUAHxmfGSb0JYzHHNOia/bu2XYNUXN1W3DsWYEQ9zyyRWVzboZv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zL/VZRLZoCjyIlIGQnIKiUV4QmzWrnAJjgHq7d0XmlE=;
 b=b+d2MoWnCbGj5AS48rocSWIU3RAuIT1SS0rOr3wZw/JxOijOlbvbQp5YTN+3Lat3YP0NGouYicZR/UxWcejUlpjcHlpuvGdSX9GqIvZJA7bJdCaojnQ1+T+/G2UxFobtP2badsiGfZkOM58aUXqGmhj9DMu7S8jgnKIuW2/ACyANQsnXy0EskJQWZZzjS1oKn0WWJZbDAsJpLzpGMLeFTt5mG9bbQ0qD6OJ5+wIiyyYFUrGAGDMakD6k/kEpOXnB2++JdVjeo8lmppSw8HelYYT7vxVmUBq/is1a/WsLlZovN0l4Ry6pANju5mhW4bcp+b6r0g+dLTrJYm7YvFMlUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL/VZRLZoCjyIlIGQnIKiUV4QmzWrnAJjgHq7d0XmlE=;
 b=Fe2fbxINu7OrAcl/zF7exAUuzc/VGvvsYGV4NnVS/hO1cwO+/HnipJmfW0O8T+nKJtqbFfNJnRWOHg545CSG3+orD948ETVZX0tj+p8XCIlSjABPB7M8zvH5AxybKBaC5qi9zeZ1ieiNr2+x0duHy+g4YArAFeqh4HW9+JSodaOiJOwgTT0PLd2Wd9F2bQdeyQ/XEKWjimrtLxzQ1jCjFE4xLi0YP3drPC38AKeDEEoGZ5dT1NxQzYpMlTpr7CLM8tVou3M351hMIXhDqjudj7vi2iOJDFGBACP8bjBgKMO4OELRvO2uGzBmpuxZ+tvzNFhoRqbC8sJFxfgEknKZUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 13:58:03 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 13:58:03 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 4/5] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
Date: Wed, 20 Nov 2024 15:58:57 +0200
Message-ID: <20241120135859.3133984-5-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120135859.3133984-1-daniel.baluta@nxp.com>
References: <20241120135859.3133984-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::7) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DB8PR04MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: c7cf808e-e859-4ad6-d197-08dd096b59ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l8iWEXKNm0UatdBvqA7scL5QDzdCEc2jDUoIKrJp+o1+OPf5kXMwc1gDf3aK?=
 =?us-ascii?Q?mhEaeMDluFcHhkiGDf/vWSmyeX0l8kdE0qXfEJzGhjTmltUC7Xwm07Tz/YE3?=
 =?us-ascii?Q?S7wfbIwPyd7Ai8AFlPd98l7Rzny5lvw5YK1lIHg4QkfogPxD03QJnK+xTCy5?=
 =?us-ascii?Q?QZLsuzjlSoH5owoBdLg+r+beGZaqreRwNn18jf/f9U4pZXXzYNhJlqU8TGld?=
 =?us-ascii?Q?eJMUsN+T8OPX31hE50TMrM94HpiztDFGIJj7E9I9DhtRyOx0VlpO+/BIZJTp?=
 =?us-ascii?Q?PjVQZpOq2rtKeaJaGGginWd3FYeBu6X9poOxITcwtbbC0+xdcUFjhXSrKkV1?=
 =?us-ascii?Q?2L5tZhpiJTFVU3+zFFXvghVo+WZlj0baa9X3/qzS5TjZfmSwoC7f7k3+Rvsh?=
 =?us-ascii?Q?myqaVuJ6g3vzb1GoMDFxqC1MZXDgU+Ouu50t4z2x0QRNhc8ghjGxIwTpXMU7?=
 =?us-ascii?Q?cu5jqqv2HHLaW9lNdIJ71WGZcmUObHCoFiUHad+9K7Z2eNMQLOY1O+nkp9Sc?=
 =?us-ascii?Q?eGH1NgOkAGain/NXYm8NVy3pRWyxBSzjSsUMs6Aiaz1Qsnw847Ayr64CC+OD?=
 =?us-ascii?Q?Fb8JcdikbIIuTX9hKJay8t0a1XvKXJa2RUkAXq0cTWbBbLI5A8uFWLIe/1wi?=
 =?us-ascii?Q?3XlU3s84TljPtd7XlloM6S5hD5/xdE4f7yr/9/gN+UYAl8Caq5Gx84yErFO8?=
 =?us-ascii?Q?m4L+UJXgjVNf5napou+JaZZOCyQye8YQE0BtPx0rtqMhw7zEyudKFwZbGIXF?=
 =?us-ascii?Q?3IZqRbGhFVqPydM4hsTDePuy8pypq/4mvLlKwGDl8kI2mzyDcxCnAxHEM4bv?=
 =?us-ascii?Q?8wTf27oB34ijzMR24vO8+hqSGdwFSVr1WUgAhcyRoCgg12P9kYqm9uQm7q5N?=
 =?us-ascii?Q?aJQ4Bmf1qNM4mo9HKYnDQin21pXieqEeL6HW9nCxKQU9sY1oc9HUpIIvseTM?=
 =?us-ascii?Q?TanJZdRZMPe/IOEiQUEaq6G2b2in2v0sCsx+hUnaVfMNC78JZRsBDhICRVJG?=
 =?us-ascii?Q?3IGdN5KPBRxWh1Bh8sOOoRGuyz/V+Kx2qOcc/ZxA8P/3KdTicSAofqYyrsO8?=
 =?us-ascii?Q?uln5xSo2I1A/9pfxcrGWFiB7lBTYuu+KIEAyi9LNb6WHAnFrukshvLbsoX9g?=
 =?us-ascii?Q?ajdqEI1Dlcom/EP17CEYxiTf+IdafuJAXfDN2znDKY/Eh5O1V1uxsQ6SG+Et?=
 =?us-ascii?Q?UkIe2Pt57rUVpn/Ti3o0YTpxQUKfkY/EIE8wNG+wxITeldaSxFwMvqBQimlg?=
 =?us-ascii?Q?KxNXNsxRGjHvrCfFyx+Aad7/P0/SXptGuL0dZm+w/oNo6WddqiEC3JfByhEr?=
 =?us-ascii?Q?8uNh8nYmAss8yn20Z+aLVl1g9rsGwlySJlwSsGCAb29g+OqbG0sN2WLjjxIJ?=
 =?us-ascii?Q?VZQ2YYQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TfyzRAaeqU4+xS2C2QWh9H1l5lJkFu3d/KZHiZjL/A7sque9t/AI7CAeO9u6?=
 =?us-ascii?Q?Xk7OI+HyPyLgtftF/GBauedS+/lXxo42XjLL4+KXr3ZTeMSFaF/4EitTgEM5?=
 =?us-ascii?Q?57LT8TBdJSlTCYwUP/L53ai3fUgv8h/J0AOZ4rTaQo2PCh/ED/s33RheR7J3?=
 =?us-ascii?Q?e+OnSV56V1cjKi9JCeApOIhG5XXB2BI1VwRuHldjGnkG/YfpMiFoAgXz+Ou7?=
 =?us-ascii?Q?H9wEDo+98BfVfyVT/RyUTjARMu4ZJQrVhy7+gfRzEbgtofAxzdnf84+HIDc+?=
 =?us-ascii?Q?QR5+wS5V3fj8ur1Dzxa/ubAwoMJ6dZvfaIwlM56t/oR2ZakSwjrgkgU1Urcx?=
 =?us-ascii?Q?/8JpYPh8qHb253TCvhiP993Vac1CS5c6MZhz1rlsCQlUuciRIjQ2xGGqJnb7?=
 =?us-ascii?Q?DucV3/OpN4qnkF9Lj9wL9rkP7kF7zm90m7d/WrTM8JxSl9PnXne89PMAwu+o?=
 =?us-ascii?Q?tCXAb60vGiPMzI+nX+TLGhgyZgFV0QB9jMqH+DTpriyHYVi5/grtqiYva6iv?=
 =?us-ascii?Q?LCgosQGnQrHdcQ+YL6CEzjOqC9VJZm2Fl/wZcKsmF+EwdfKZoxt86NU45JLB?=
 =?us-ascii?Q?daO4tw9klBcNnFkkGvIiUdDQeboTGiOQAUCBCmJdkR7iD2opI/aedkKa5Yf9?=
 =?us-ascii?Q?0/53kFthHK4hwCChuK4c6w1q/igOToZD7n+FEVI9hEFzI50UDBeCN3DOLAii?=
 =?us-ascii?Q?EYgSuJCVqRYijOCjNnkczJ/5XrJByQJbdiUNo7geq2m5bQX2q5VHhWrM4B1R?=
 =?us-ascii?Q?tDw1LYgDpgU1k58i6syVgkOajt52jMCwOuJAq+vx1KHjuiuBwdVtpQqsi4EV?=
 =?us-ascii?Q?Q+UuP0hxE0CfhJbjYlsrYw2JiDWKVjf685IPSIdDzL95s5Nxoe+B8dLFTOJ1?=
 =?us-ascii?Q?plmp/quPRjolHJ5ASBTyg6khoJ/l/bz4W+lU25K6PBzjv/pA14KqzhiC5XST?=
 =?us-ascii?Q?1OhR9NqPM+wV+tVlVdiz9f550vFRuTUA5ijFq4nCUiUZmgkXhlCrUagjil/x?=
 =?us-ascii?Q?w0mEjcGbhoPCdmys5eDxapeHy2nulhipXP7TGf+Gw74NkqIhpA21wpkL3HbF?=
 =?us-ascii?Q?vxh50kDyBlY4Fil6hzauwx4bfx4YJ3atbCZRoU2l2vd7xVh1FReBvqIj9UEk?=
 =?us-ascii?Q?/gXpXV2ztjijQnsGMsL2P1DLglhFL8VUJYqPtTePP7uNc3fO/kx31qy+Yjjr?=
 =?us-ascii?Q?1htTtqG2XIcjnaPqVDnvgm4olzKzlUNBbIkeXmZhooVQKZmIG4UUPrt8mELm?=
 =?us-ascii?Q?n6jFziLo7/SqxK1JlyUdPR+Q4+yugsyjWRvJr83kjCANvHD+lmIfqibcyn57?=
 =?us-ascii?Q?64/z8PjOMM+ahRX9K7FSYvLLgtEHPuC8Jkaqe8XyJmsdfwuKIUX8GxgsDZLP?=
 =?us-ascii?Q?uXySAUg/8RJ0LWQFKVIAJNuymI6pWYZagvTtIeSQvhdw2tveUHMyTdQ0zPPK?=
 =?us-ascii?Q?6uxanA9uFqIuyxWfzkv8Q5m3tTay1/W+CJH5wlfSm0IpJSXTuQAdpRwUY5qH?=
 =?us-ascii?Q?7p8Gn7RDUd6xeV3ifXRdKluelbsrzOMWIGafxvvoezIHU6C15ELCegQ1pwps?=
 =?us-ascii?Q?WVCfvGLNgZZ3cj6Dkh7HmM22d6AZU1edFwXRXYRZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cf808e-e859-4ad6-d197-08dd096b59ad
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 13:58:02.9679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXwKZ3X7j6fLv4OZOBIPkiH54NqmNOCxjcPgq0qVvuxC3qnwVVHSZGsUaBTI7v5RfsKAbZsa6aYiD4E+5xV8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_055809_481549_4418001B 
X-CRM114-Status: GOOD (  12.38  )
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

Audio block control contains a set of registers some of them used for
DSP configuration.

Drivers (rproc, SOF) are using fsl,dsp-ctrl property to access those registers
in order to control the operations of the DSP (e.g for start, reset,
etc).

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 41ff40ab5da2..fa4ff75af12d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1616,7 +1616,7 @@ sdma2: dma-controller@30e10000 {
 			};
 
 			audio_blk_ctrl: clock-controller@30e20000 {
-				compatible = "fsl,imx8mp-audio-blk-ctrl";
+				compatible = "fsl,imx8mp-audio-blk-ctrl", "syscon";
 				reg = <0x30e20000 0x10000>;
 				#clock-cells = <1>;
 				#reset-cells = <1>;
@@ -2433,6 +2433,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
 			firmware-name = "imx/dsp/hifi4.bin";
 			memory-region = <&dsp_reserved>;
+			fsl,dsp-ctrl = <&audio_blk_ctrl>;
 			status = "disabled";
 		};
 	};
-- 
2.43.0


