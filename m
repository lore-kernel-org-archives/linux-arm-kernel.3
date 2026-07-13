Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDDFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 02:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwEG2SvJo3s4IrXSqK5W9PGEaSuqZN2eVnvmMcV1ZEE=; b=pIIGhyql25IsZCef4qHhZH1ePj
	oXNBBpslLk2LIinKknQ7kPuRm1kY1Omw1bXBMJAuZvUKf+e87+/0/57ranPyw1hrgRGQdGRVp2+uK
	4ba6+jZ+xbKkkHRuID1/pFDF7VmWx9mf7fEU5NoagWDm4Npgt9AbkNJC2Y3lWkRL+74cJUQqNwLEK
	zKAR/WwrW8srbv3TM+4ophsCI6Hn0KDun86hxUMEAUUxUPPlctLFf20DY25SgfKcdOr1kugo53mwx
	qeAnRu948J+zYnyVvLG9xsZUZdBGomUrOPV/sFo9jYMaoAaNueMioo7pu1qtUYyHF+rytXnkPp5vI
	znIgrUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6KI-00000007xnP-2qRf;
	Mon, 13 Jul 2026 02:23:22 +0000
Received: from mail-northeuropeazon11012049.outbound.protection.outlook.com ([52.101.66.49] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6KF-00000007xlX-3yIA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 02:23:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qy8ONxQ1xskLAmO0W2DMv0EIzcQWKmrLt3nv2lP9B6JgoJ2XvxIcIrhL8otkAsmUxdtOfq4hx53YeiNmhj9xA9r07CpwF5erI+V6crNEI7x5DMWLPH0sNvvrSejAxEZHV9slp46R0YvZGSFRivVno3elCD9y8pdy2DoXdfjpnwt8M9sdycPcZOkEKxVmzLh7g1QRjthnZEQdVemYkyqJyuTU6woVWFZ3QtLjUTCVQNn/cvnKGW70voTqVuZPVyW4eshh3gAOJvQx55uicTWf175fOiO2dlT8wMMk7T1zheT5Vumfd6XzVMvbbfQBtl72n5xUxgDRkBdWD9koI3BIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwEG2SvJo3s4IrXSqK5W9PGEaSuqZN2eVnvmMcV1ZEE=;
 b=KHFTFUDUxmC5k/ObZPVoa9GalyLPeUfVDknFBWxNSPMZB52X3S5FKUa73+6uNzbm9FAi5Dcty2AKp05fqsagQu4BeaKuzVMq7jnx8TewWIxUv0/hUqXg4ZswgRe7eIi6wS+DiOSb4meTyPx6WnVCpAfryrOvD2xFky7/u4uMg0hfSDW+KPML1YYFop5CWOy/r/+/fZapys5gMh9/VNIjxYzNgWMf14Su3YiqCr7i8VZ3kBdRUSqnd7ivkcq9uBOwwvieR2yPSlPGsuPv4xAoai5wTGAAAtaBRcYbaGo9MYyYswZTa+awKpU9n9Wt/sGcFxKPgbbC7rFjvqFQnpRdFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwEG2SvJo3s4IrXSqK5W9PGEaSuqZN2eVnvmMcV1ZEE=;
 b=nn3oB9r5MqB4gH2hF8uRb9xASU4yDZSPeRJ+YQmDjdbEZ99NK3lzlokLooAj7sDZc+2vwFiHBnncZamm7JoMOTmSOeWoyEr3ZG7fLyZYSaiCSEN62N/AGM5hXC8ZPPFeag5xWMK5AK1dCUydrkGe13Yw/g5kvKEpFcGgbeIle3lG9GcHiaqT8BLmcZcmIruZCIwI3WL2b/FM/J7U+mgW3tiLdt31VyFvJua/J9Woa9pUEscZw95LgZPJmWWC0M3aGqrFGdDkLlZ1SB2XecXFiBd0qLIsbWuFWKVs3nDJG946wDKruqJft8qSU0K8T7WBALEfz+FJLY+8fSLRI8YLNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DBBPR04MB7659.eurprd04.prod.outlook.com
 (2603:10a6:10:209::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 02:23:16 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.014; Mon, 13 Jul 2026
 02:23:16 +0000
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
Subject: [PATCH v3 3/3] arm64: dts: imx91-9x9-qsb: Add PDM microphone sound card support
Date: Mon, 13 Jul 2026 11:22:48 +0900
Message-ID: <20260713022248.1262123-4-chancel.liu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8ceda386-fef6-41d7-dfa2-08dee085b259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: P47/TeiKrJ1pkIro8I0bono24iz8vM8wOHwOf0PIRhJl3TYVcSsMINl9E+E4j72orLmkNTPdM85V+Y0WCdBcVumLKzTWQskfneStKjnKrcIURoY29lHiBDYNB1ovnhR98XGIBks5IirNo34tQ9Xk6Cq+zmpwnV4xc8W0igzWZQqnBsv2XDG3CNKorQ2zeAgwXHhzCzxX1fLM9rPVXYYzPjQadqElI/nO+/OrW6IvPFx63nvnIzactdxasekg0SFU6sWJ6g0FfWay63R0GvRus4JdeDFAlvCJB5ePnTGO57Om7qDzXJ3TuWX+uEQls6IiuLAa2X1C0TmV/M4FcFtxRgJ2KQxKUeEdWdC1J8sc2iKEaMdpZS6940Mq2CF0B+C58GyfsA6HDg44dWO5jNEbJnlZf2lWAcpmWw4EjU29kepXWJNSFPXC6/kGh6+ZaJujllFV4c4jPsaYO6f1fPvsOLEa+hpSlU3MOIXr/o791YDaM73lduQabcV+YAab89dKNLO7E8ndblipj89mzu4VbCXVwMPIbfhCM48K/iNGQBN3I/B7EbZQK6Z7vff55Ds17Pkuz/ByD75ejmlHyITWBYHvh8gSYbXta4DaRt4NRvLHxXdXGftxZVbv1u4bDwPGB5mvvIEOWZXsh/q3G3HleppByBZUgDYJEr6m1S14UDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hGEsIKkrlPt5UuowUJBXzwQhRKRZVPsPCsQWGAdf7FgY9xgSeEiPnpBT3ciP?=
 =?us-ascii?Q?SxRJnRaTVpc8QDcMmvMHWSZ7ofuDRRGqlnrLyWY8cpbfIcDWUdPhL68WFt32?=
 =?us-ascii?Q?7aDHhB7Qts9mZhCR2oQeXMRi0TobzozjLBe6Em55kj8FNjG+wHRuXHq8woyD?=
 =?us-ascii?Q?Wbs58edCrOL+gpb9F7O4/dkC7mn75Izr3qnO/H3nKZwOO8IkiHqePKndTdgG?=
 =?us-ascii?Q?7Wh7M4pnfR6wlOCrIQwaFCms+dlyjOu24dMMFGkyrLdkt/xB9Uw6C8uEy619?=
 =?us-ascii?Q?EGYe4STPpmkGlnEnpUz0gJC5tRVVsu0Jtru0EJkpQT8wjqKdKrtWD+Tv/bvY?=
 =?us-ascii?Q?j3tMEkDMYhpsX+LmY9SCpsH/ddm/GMogCs5mS2gh7OsUKmpBJP1ajCVO+Eey?=
 =?us-ascii?Q?23yZxrMAXXoW6h+BtBBdwPUjrzLubTJvHY1a3XThuzyupXz1nrbtLwKkgLb9?=
 =?us-ascii?Q?Po+oNR61TqWDkocHDRyJaldfLV991DEbC3YRBYCRMV92DJUWJ+c5W2Hvucod?=
 =?us-ascii?Q?oSeYj5IowdypH6I6uSvVvQogjyLeV5YXruc1CKRql0wn1jleTwThcd0/MQxu?=
 =?us-ascii?Q?dIMLUif41vlhTfVFD+txHgauTteBykuusZXmy4YeorpxUIgSHU0ytKwClehk?=
 =?us-ascii?Q?wQRSRcaPLh4tc/A+F6RuZ63fawwrjiE1RsfSj3FCPifY1/cKuKYCPgcVM4s1?=
 =?us-ascii?Q?Td8LXYRnytm64rtYvLx5oSmxY7qSxlfqCkj7wDnVZnxrmjNNNIo9GWHyFSLA?=
 =?us-ascii?Q?u9+AWnjUQw3Al2GRUypkIpKBURqLdlLGfacBUyjBX7arYlSdUOMlbDF79+1g?=
 =?us-ascii?Q?c/hkAaxNKv9esTwboaVLTbvWzKlIvGnfJbYEZzMFShaUW5TEmRXOczmL7B96?=
 =?us-ascii?Q?GnVqwMN60n8n0ALIrRyemhITVNko7xAcd46VFBsaGIcVsxRrKUQ6YywrMjpc?=
 =?us-ascii?Q?r7XHbL1xRPMllgb+26v58PQta4pxOV7tyOuIqpYJqqWybNFnAEL/IhpPXAMc?=
 =?us-ascii?Q?nfhBJrCe7ZmWOm0HNMtNS7vmqIh2mmnbOO17+cbEmgp+zYiJNadwpK3a0z7q?=
 =?us-ascii?Q?GqU+yfN8E2PahCc2FD8yQd9xPWOFDSFy9gSUoSdr3efSdKuv05Ymb0x8dFj9?=
 =?us-ascii?Q?Wpvl94oeJSAAAjKZxK63DnLm6G6dFZzuLIafxxFsLYxH2lR2hmr7KGMoK/Vc?=
 =?us-ascii?Q?i4cUyQc4g2jULjpJNRiW8U26jO7ukE83D4ZiXFSbYbTGcOLFubCuSMdGQL4d?=
 =?us-ascii?Q?pfTe8VydFV87AYDSYkbBIvOF4fWUHyiZHsl2j17A0dDtQTz/m2i1auU0lbZG?=
 =?us-ascii?Q?kIh0JCFOGLFmEVHP5KH0uJ20ziHPvLDE/Gub8D0RkCgDK02arZkfrdheMPNW?=
 =?us-ascii?Q?jkRyZAX5rtBFqW2I6cCctUVP/5K9CScM5Z+1RLs3yj/9VQ4KY/3JpMcc3C8l?=
 =?us-ascii?Q?RVpGN+P1yrkolV8XMIkoaA5qAc1EIod6POKYgapDbWvCGy+oD9YfCIFs8VOC?=
 =?us-ascii?Q?z3dPgq9Qe6TGLsnUWFbHIXOwlXR061COOzkLfxNcukD+G7RRxzmtfzTncAzH?=
 =?us-ascii?Q?NKSNsN+ZWZli57bFRZ7KW0nu3uMVCgimtVk/lG50v5XxxwsOHtzww7FrO/zK?=
 =?us-ascii?Q?8xhkGcoRf1hVKIPM3k1uc+FWhdQLJW5AedTocgTkOspbg6DtY0aHUsyOrVaN?=
 =?us-ascii?Q?TzmmN8yos6eErJb3tdDN9/Ft7gQVDf7vxIalC51DO2x1OFXglHZJQooLB0wz?=
 =?us-ascii?Q?hclSmN0ctxgMVUkuS6uKn6d9eREtV/ejymhy+Pn91JGef+pTmCSN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ceda386-fef6-41d7-dfa2-08dee085b259
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 02:23:16.2623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gRpH5WFZ+IozHVQOPJSsK+U46qxjINAIN1s3glMNw0VcZpYeH7dlAXjpdxNzCGlKU6pqcLSFI6J0gav2x8XENzgZD3JwNosqolUSVpBuX39jIdqmlWMfxYpa3Td5qpf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7659
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_192319_993736_FAFD6212 
X-CRM114-Status: GOOD (  10.62  )
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

Add PDM microphone sound card support, configure the pinmux.

This sound card supports recording sound from PDM microphone and
convert the PDM format data to PCM data.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index 089d999196d6..044b37fcc0ba 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -42,6 +42,18 @@ codec_ep: endpoint {
 		};
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <4>;
+
+		port {
+			dmic_ep: endpoint {
+				remote-endpoint = <&micfil_ep>;
+			};
+		};
+	};
+
 	can_mux: mux-controller-0 {
 		compatible = "gpio-mux";
 		#mux-control-cells = <0>;
@@ -123,6 +135,12 @@ linux,cma {
 		};
 	};
 
+	sound-micfil {
+		compatible = "audio-graph-card2";
+		label = "micfil-audio";
+		links = <&micfil_port>;
+	};
+
 	sound-wm8524 {
 		compatible = "audio-graph-card2";
 		label = "wm8524-audio";
@@ -202,6 +220,14 @@ MX91_PAD_CCM_CLKO1__GPIO3_IO26                          0x31e
 		>;
 	};
 
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__PDM_CLK				0x31e
+			MX91_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0		0x31e
+			MX91_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1		0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
@@ -464,6 +490,24 @@ &lpuart1 {
 	status = "okay";
 };
 
+&micfil {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
+	assigned-clocks = <&clk IMX93_CLK_PDM>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <49152000>;
+	status = "okay";
+
+	micfil_port: port {
+		capture-only;
+
+		micfil_ep: endpoint {
+			remote-endpoint = <&dmic_ep>;
+		};
+	};
+};
+
 &sai1 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-- 
2.50.1


