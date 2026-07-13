Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11298C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 02:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJ1KZYBEi8ROIOz6ZtXfbKVo5SDtnqwy5IlaLTTjJIQ=; b=ZXuyO3rz3tYvuSbN1KXQlPqXtt
	qyg1Wz+kF2+73wGYocvx8In5O71MSz/6RkdUsTG2kH/9rigwsCkXhZ7mUtVyl5xU95qYi5Rk9ut4s
	H/79y89hEXFwOT2MWlBhqrZ9z2grQDnf41spmYnUDSm9L+B7afmK4ZBoNaZrfVgAnw+lNEhT5yD8M
	IcB3EZ6pTq1Ho8ozjfLbut7dyjxRbM0yixyE5HhnAc22yAIYtfzeiyBW/LPs8SeKAUIVfvpYOsvzv
	cmT2qoWSHKgvjKbhXsXaPh6kDEKZw9p8Y1MidHChBdnTBQ0hsrwJExu1J2G325gOLFYb2liztC3YJ
	IESNzfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6K7-00000007xip-1S8Y;
	Mon, 13 Jul 2026 02:23:11 +0000
Received: from mail-westeuropeazon11010043.outbound.protection.outlook.com ([52.101.69.43] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6K5-00000007xi3-0U0H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 02:23:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7cYfotba9c/Gd1xw+wbJfJ7qyvHZ8WxMrYSwYwy3+6qzXfyFDmaZOG8xZAmA6m0lrS4rkxOZdQS/MzLry3VPeeSpW0sgiyoyXY4317ctheCU8s5awDN83id9jys2Dzkmt/BJLmHzo7JUXZgSi6iTixfTP3TAzWYW6iEZeHldQkIXJ5xNUn4cQjG17oNxesJ0ym1BixJH5KXNn6o6NF6kHKvYrLee63HUSzZn4burW3ubVHz3Iw0dI4S2JjoRiTG+pGEJlolbFTEjrCw2dgXrMGyZJ87PwU2fKtAWUmc9kFwrvSF2zDpHEtMi35vXmkLZ7bz92g29lcKtqeYgqLziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJ1KZYBEi8ROIOz6ZtXfbKVo5SDtnqwy5IlaLTTjJIQ=;
 b=Go54JPH2s4N1k4biMZQLNmbmYnflgtpP5tV7LvkPkPhoyamSgVcTOi1Nipy/vVVJv51m/pcIxG86hkf0hpnPgDOfsbVPn8cTmZ6ZjS/VHgJOzEsjF1PXVPhOVBPivCMOy/egQdVVWcj9qJAuf85HxeO1+0ydQESEoRwQDbey284l54yp+Mg53iCwaiaXdreRqTeQ7WgsgGan49VeKKD/607kyojAotNMyU8KVVr1gH3GeEOUBFRAYhfu+cffrxNC4zbYZe8KuSPH42CFA94mIdkCtyLR2H5HhQBRMGVVTsPiFVT4KNdnDcRfAA8Tj4rrU6Si/plJX3tzbpHwadnY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJ1KZYBEi8ROIOz6ZtXfbKVo5SDtnqwy5IlaLTTjJIQ=;
 b=jkJqVcjCvlnJs7Gss+SCRs0W1OSjmCWXVxL7torKeXSmmffbuk529cyjimLvz0GwLMWw6eYYEzwH5dKYNynLnQ5TP9lQrtBddWhmfpnFXtW83i+LiieGrRX3fcUBv2eO3ar4KPykGBUINrOOBCAoUtgXvahOKXOQPTL8fVfF92qUlnhMgLdpK4gxgaxm3Eo3jl3vNQrkWvuJRVF9VhkRWbmv+x9vTbGnHr08o0BsflffghXzq46s0kEM2H0/CYHgLTvy/eUMjzNhwMbFeE5e2n3202YyGCbIfFt986s9+ubPaJ3+TbKrtn+L9hHxTiUmmSTBoYIwweu4lWUleW5ydA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DBBPR04MB7659.eurprd04.prod.outlook.com
 (2603:10a6:10:209::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 02:23:04 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.014; Mon, 13 Jul 2026
 02:23:04 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] arm64: dts: imx91-9x9-qsb: Add audio-related board muxes
Date: Mon, 13 Jul 2026 11:22:46 +0900
Message-ID: <20260713022248.1262123-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713022248.1262123-1-chancel.liu@oss.nxp.com>
References: <20260713022248.1262123-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0197.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DBBPR04MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bec5942-5607-452f-6ace-08dee085ab11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ybztnt577NZpeAFGmo72B1uW5ZZ8u3hXv8R1vEf2VMw775LrFbvfkNNFlE9foAVONc/vegzPAzQm9u+4jsMPrtXSZ99H6/cjI4banRN8xMTRB2ZduRuhHd+osWuIzpsGTOPrrfbZStuYnEgHp6UWz/QroE2W+AbU9ldjh2hhnNNYwGJVvZWCL/Rrngz4t8r/xUih7IUZHaLM6hEwfEuDClPD4wnL011zW1qX6rgORK/RQfnOn84X8v6JaOOCGJivQ2//nFGACMi2WWefnJ0PjqMPnsHCjwDBLmLm855RAe6iMAOJM9sX0bBwN1c2gsUKn/ncKfRzZxMAfh5buf6MYO6A0N/0ZkWfQE0WIQONV/ibO5zb3lXNQMNNKLgOH4sQlTsTWuMOBvbpEeQry1dTc9E3ouk1Viqi6bPN9+5me5neFewuiVaZ0iyDingrsZPk583QiOOZeTIRpxcx9yty14QL0lOKifUo0K9TvukgCS5DEKUUNsrRl/5ewxI38unx8ZeGiv5orM1dc02rhKaOnVcmg9wWeDzAoQXZmXS37xw7hkiuq9IV72TK255oCOaQHzNLXFlby84G2nZodN+QUbYjKeWv2vilqBDOse5e7fqcllu2pWmGcRpALLCTa5QTuRZmGNwFD/K5SHpx6zTLXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MFxugWmlPuAUXzoBNcZeslndYIiDvvmHpbxuHEo0/OaUAUCnNftgK52EhB97?=
 =?us-ascii?Q?i6ZmAPkCwBeKUCHOS63gMFwXi2PnrkMAYs0SILupJQBdHI63/glWkC0HeMsw?=
 =?us-ascii?Q?GmtZS3HzELUTB5krajrou0hRhLYzCRN/4ssO3hOQrAt++BV2afR0AYnPSjIl?=
 =?us-ascii?Q?nd5nHACjKa+OuKjYC7yW6W6hnXlr4K92NtMhVUpTPy0xUv7FCBA0WWIShz3x?=
 =?us-ascii?Q?4dFlPS8w2UrPkiWeF7kL8/iL0mM2+xR92yu3PACvJVAm0ZfazX5Tn0pS/wzU?=
 =?us-ascii?Q?1xhl2iETlWTPtZ3Xu/SZ0+DD0/k+VswExXiC9qRarPPpOS2IAWcUe9MIursM?=
 =?us-ascii?Q?9zPfToNemhNds4ebpklY3Fa6xA5DkoPAXrVSRiudGFuAraaPJ/tPDVF8Y92k?=
 =?us-ascii?Q?MDvWarmM4jAUi2ZhCfzsD/cRMHXqk7eILZX9UL1aOsO4eB8d1GfmHFql63x4?=
 =?us-ascii?Q?Cffr7jZxptgz8aXcBFZkJyiNmcPAVpd8+aXEXbhGJGMrQTU9YCjuf0aWGGu4?=
 =?us-ascii?Q?cooYxDYuH6AVJeB4PKJBDjZcm6O4vzTp2crkizvZ5zeDSbenAtjZYMacNP6d?=
 =?us-ascii?Q?LqaTWYRLsKRkBxPCfkxQQ0bRSc9OOrfu4HjBTcWW0uVOxyYjgRhy8AYZeaDD?=
 =?us-ascii?Q?il0jIWNODVecrGF288lhVj9qwAsaq6Q5wdRRdoX2ExvmCwZhNsH05ksoeBay?=
 =?us-ascii?Q?lqhUaXAUfghAVTbm4avRLwK1K4u12f48fqzBmjhHFJSdoWkLs+uastt5uLR6?=
 =?us-ascii?Q?pVNNFLCVB6tFPSICQkyQYmdZUBNE7zBgJRytG9w/PTQuGcmF8sNRQSLkItW4?=
 =?us-ascii?Q?NC3WKKd4tkU73RHrCDzKALTCrRfrTqkYLdMZtlxMCbvTR5dtdGq/eF0JX/td?=
 =?us-ascii?Q?B45Y4VwfxTbZ5yMeDx0F9xzPTxykTwyxtVUt3mXmhMcdQSselSanGcLVUTIi?=
 =?us-ascii?Q?fqclrDwyN+2rzbEr3wpvBsbWwlHB/XY00zJe23GaXj125EV4x9F5JuNbeUF4?=
 =?us-ascii?Q?bAqodDPVbAWeljXafUoLqP8Qcq0Ziaw1qGYjDx23bhAts/bTcYt4m9L4V/fl?=
 =?us-ascii?Q?Oc3rd4r2ck4rFZCOKyPE7fLhfaLDmsw3nv9esCgeehFZ3pO08kME3BNX2suS?=
 =?us-ascii?Q?PNL6EP8bnbI/i01aD26O3cORekQcVEv0RcTGBjtKEUUniR7b2SmJABVXkDdN?=
 =?us-ascii?Q?2uNxzg8t62gLF0NIEU0zvQ2fD2j9zTWlSSZ7egOEUWxZynHJOPx6ZrVxqHls?=
 =?us-ascii?Q?NjUgFQFsS7ZWmapYHRAm+cOwrkjQC+ldtdHSgwit25exmhA1STcytGlKnpmf?=
 =?us-ascii?Q?Vjv+e/4BKmWdPGY5+TAD9HNIhMu2Yd/daXbGlFLxiNRjY7L+bKK45J8jeF69?=
 =?us-ascii?Q?XhgdbRgfKr0kk865rAb63t87xezvK2Zet6Hi1KdKcI67pF52wBekZXh1o0qG?=
 =?us-ascii?Q?SdNTWOno0iGKx2RVPxuD4rEu1gKsMauqukFG/YWZ1iz2Mc93Vn16QcdHCZ0m?=
 =?us-ascii?Q?u37PS71NToTRcewKOaCf1SZFfzNCbc5GvT0SmIW21maaRAC8pzQBwKDPz3k0?=
 =?us-ascii?Q?UvHKN4Ik5rvkXmsd3Yh/evpYglC8q4cWc1mGWo8R/XRwiTLrZwSnA1OX8YPW?=
 =?us-ascii?Q?NlCjDQcK1Vt0tBPG/AE4dHruAScP5LlzWHNs+yNyOOlyaZAUHfJSybw+1HdK?=
 =?us-ascii?Q?y34CX54Brf0iM9TZkdDnri6kVyRKgwMxbhGD2s7dTFKReMLJWDsXi+2uhVxY?=
 =?us-ascii?Q?JXStHhrjCS4a+Ddt8ZSI02B3yRCZ4/8h70BQExh6w/gG+4PoM6Hc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bec5942-5607-452f-6ace-08dee085ab11
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 02:23:04.3050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+zlNPdQEZAse/KVzMcV06pTd+5vxb2osKJryYPLt5JjWlC0O/+nwOY1EeoYG7fbBiRhOeGcrl1yGNgsZ3wgSLTSBmnQQFfkTeycWeN8vh0prT7SCBJB8feUZbt3pkjC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7659
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_192309_152269_70CAB623 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Chancel Liu <chancel.liu@nxp.com>

The board uses GPIO-controlled muxes to route shared signals between
different functions.

Add the audio-related mux states for:
- selecting PDM or CAN1
- selecting SAI1 or M.2
- enabling the SAI1 audio path or not

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index ea8cf14e0bc6..4821ac312ab2 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -30,6 +30,55 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 17 GPIO_ACTIVE_HIGH>;
+	};
+
+	sai1_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 18 GPIO_ACTIVE_HIGH>;
+	};
+
+	sai1_en_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can_fun: can-grp {
+			mux-states = <&can_mux 1>;
+		};
+
+		m2_fun: m2-grp {
+			mux-states = <&sai1_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can_mux 0>;
+		};
+
+		sai1_disable: sai1-disable-grp {
+			mux-states = <&sai1_en_mux 1>;
+		};
+
+		sai1_enable: sai1-enable-grp {
+			mux-states = <&sai1_en_mux 0>;
+		};
+
+		sai1_fun: sai1-grp {
+			mux-states = <&sai1_mux 0>;
+		};
+	};
+
 	reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-name = "vref_1v8";
-- 
2.50.1


