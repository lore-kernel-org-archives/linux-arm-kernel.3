Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49746EFCD77
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhlV8Jy5WwMvpOvVuSuduORunfmN0WWEI0zdvau+gNA=; b=w5SGbgvKa6Bp7sYzHzQpH7vRwp
	8GelpRpdDMgBexxWosYNIYslx+PLf1aGJ16+J94jh4VX1dytn/xDfflIr5cK942HnR4V3rrJxAurA
	GVVbLMcCnSZR5w5aVIiT9aoWXfluS0iCrgSqOD/JtvAI+PbMkqbd8QBZvXLVEPEWfKybvr7EfLBk+
	rh1osalnHSlESrTvNkadwIWNt+baW2+SaR7sr/bBQ3e0cilfoIdeHB2Mdvvte44Rxqt0D9ZpBi5rE
	cjCZxh/1nVxxizVHGs8MR4eLzEohYRiO23XzuMH+hjmobmVUh8kq/OkL7sYgK54+iMPMrHpABlUy0
	VpeULLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXVO-0000000737K-0qCP;
	Mon, 09 Mar 2026 10:06:30 +0000
Received: from mail-norwayeastazon11013059.outbound.protection.outlook.com ([40.107.159.59] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXVJ-0000000733k-38aC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHEjv25FYJiCWQAt7d/v/OIkHfkL6HvxRsa8q61t5ZirBqkjjEmGYCjL8HhMhaTbpwnYJiOk+kFpMR6yXNd3vXWsO1Znr70qUuFneuaG2xSbMVi10flHpWcw/N+vGY4aY2fjPSQv15lBiVE8u7wm4Dv2B+nksKJV6ew7O+1pvognEMxcqrjYiOHybKhaa974ednCA1QPY4QbF0+O7qiHBhZS+osSD+CspMDfxIaelArzv7OdXhm8vEpz80Ou2eriD8nxFPVv9esegs0r/bDvLTYCkMNG935+eSutpmIutSqEPNWUv9K/P23VtGV6TUJUdXRVGjBCKt4mzBljSQLDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhlV8Jy5WwMvpOvVuSuduORunfmN0WWEI0zdvau+gNA=;
 b=gZAKjnh4bhOqtRfMfouRLZNGLtwDXhV/PhfiIWAhr9ltjhQbF6RWwUa2tOhtQ2l8eUKdPyYTePkQ2JsnuKkAl9XTXBrOTolatbfeRXfAj5zyWISVnrjKcNoIpDEkKBqB2bumSDJvpPfoUwCx/fojWnKIwuT5D31xELpR93KxHRPPvCXns2vD4ILqk/DPhVIEyAkB/LuxZJL3p++hABrWRxEYULMJVnQVGHZCBu5HjMxOMvuXEg3BTMgUhUD+BRL6fhd7Be2iIIQZHQ9acP5yTac0KBvzewsWI3B5FBGUuEBj8O3S+LpHHWm0g7e59X5ex/5lLN4YDt+Yawetvt+Q5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhlV8Jy5WwMvpOvVuSuduORunfmN0WWEI0zdvau+gNA=;
 b=C5rqHkvcRD+l9GYeTFIu5+CIeDvOlqGOck+bi2WqHR4omF0VSGoakWPMcUZuD7MpfPWDp8F1N0vCMJlmGtHB96XWWPF3LnMOiNGTKDaFH9vrVFhOVz8HwdBeinYlKLY77+pAFfQ9tOYbFf2iaJUx/ZTqviElRrHlhk+YkTCxGW6kcDSaruteXIpmW3XLHPNw8IIAj4q3zm32BzWWK+arhIwzsZHiHX64pq6WavCfblfYFUq4COd9nRayIngw5t/93+tkAScoSTbGt2eFhepVcR+tqu2NRE8f2DQSZ1K79WNy4dem7ortNrfl2TwHXSpdSYFz/5FHYWpS9zhg8iz3Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10970.eurprd04.prod.outlook.com (2603:10a6:150:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 10:06:19 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 10:06:19 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v3 2/2] arm64: dts: imx943-evk: add Type-C and USB related nodes
Date: Mon,  9 Mar 2026 18:08:07 +0800
Message-Id: <20260309100807.2844925-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309100807.2844925-1-xu.yang_2@nxp.com>
References: <20260309100807.2844925-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10970:EE_
X-MS-Office365-Filtering-Correlation-Id: 94700d7f-3d03-4015-2bbf-08de7dc3824d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: Wh1V6B8ZiYSjn/Pbn+9ozDJAsCbrahE6Fnb/aEpJyzZmI/+JhakcrsQZ+sTcgNao512P7g5hTMjUIlluNIs9T6rkwA8NgZQp3XJSWu9iq1E9Wi+EOV4LPiE1JVa3bk3YAvf4vracgbuR1N4T8AlErNsBm18bpqy+anT2ilpnUokCd5ITTayEJqIjzB3wLcjoxpqzpKovQR6q2I1VKDJqF4jlTUgs4G6lKJ2M3iRd/8zIoopdEdsKdS6m4m64nmwks0IipCZnljoEKSRG2FbEl/3u7ogYPu9Vns3+kMk8BpNIUwzOOWCu25/7yxHXe1cRNLUTFUATUXU5zFu8my5mRXjit2CHObi4LaRCvUO5JL/YkVhnFIWNV95QAxh2BvBZA1dWeI8qRVC5nAbrK5AG22bYd1FI2jZScRdHKF1nTlAKzH6NMANgc0Yq5/n2yWLc5aUOJJbXGz1dFu49h6E8L87It5k1mVvny68QlqIgK53pXAspye6lM2e+Wcpe3SyfkB2tSnHw8kSXJmqP1K94kCIFhpX9UX42PPK6AouwAI2zoLgHWlQ36MsxfzeUX6RdHYwidgkkGwg1Fxs2S4oIwxvCsGh2sfefCI+CYvjG5zAAsuEoi57Kj1ggMU0M+lBC0OwyvzyGtLYbRa0me89pGZhIOlxN43b76a3wxkn4TR0Aitcq0Zakj2pnEVju9ic1G4byWH39UsKogRWar2KtCjKUxRG4O+ax6Zjc1MdMd5NC8nT9BVK96TpCYZewzSk7vcUhQlQ9zN92o3WKXrqi+bElbI/yMz9mw8bHgAsfEpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YjcJ3jTO+TiZG4MMl5oxHpiB93RNW2n32NHeKZ+d/Hpnx2QMUszCr9Vx1ar8?=
 =?us-ascii?Q?lK0l5VhORfyJAQFSDd+LND8EDlb0WqRl1KjJp6uIEFR08eYR/u6zAdvE7oqU?=
 =?us-ascii?Q?poEvDnnDgLRjyH0HdgnGaHJQ9/8XqLTMORXwTviiwfPqEY/NGikDXIKqhdKs?=
 =?us-ascii?Q?sI3gGs6mgvQsF3Ku3TzWP4dchCZzSzLqvg8xDGZWoIo2wqg3a9mMF3u4vI7Q?=
 =?us-ascii?Q?pmnpsW5kBoztOwKXf4kGOMF5Vcch3AgopBzU9f2uJnORztXxGSux+YxQFbu/?=
 =?us-ascii?Q?lnBTr/108SDVV/fVnHZKEm+BPGLLOYUxA9uPLRM+Mq+p+ZhWZCPVXiCgJwdy?=
 =?us-ascii?Q?7PoeRbyuPqej2ViNLpnz9XvHfqq4AabN5YzKb9cISueKDNkPz4Qc3rZg8pMd?=
 =?us-ascii?Q?oA9o9bR+XnxBywWN08BKJ5+9uy3k7ElZR4U1mZg2dqVBmIm3gwMrT0BQCpHs?=
 =?us-ascii?Q?PeiMMXnqmxvE+WxNRO+TNGechKfgkCzRvB57tCtIVWo8zGxMnmDXmHd8CBvb?=
 =?us-ascii?Q?IpiXNlOrw7qlsE4Z2gGvUPBETiH2kG3GKQCrSSWxuy0ztq0G8ww9Hywt9ogP?=
 =?us-ascii?Q?6t7MQm/aRa3xU1D9iLOrf3ny1IjzFqe41vwClBXY6YhIEe0W/kR4C4DVCYd/?=
 =?us-ascii?Q?DlJftGzhrfi3jdOwXdtTEWWVBKQoUIRJJeG202deuIWnclpf0O6Do610wom8?=
 =?us-ascii?Q?HdY4MSYnXugoZgBRl3rAa+ZJADBLhPS6N+A4divroT+tIA4J9IDOSqzhmpox?=
 =?us-ascii?Q?ryzJZiI4awTbNOfjPkwgSmdyUPKyBYAmpErtEK8nxmR7F1PlGZwAcf4E6un1?=
 =?us-ascii?Q?46zT5B0amr4VFk9/VtJIwOQgmMRst4Ylo2MoRjLB4RBUFiIWpbXHjhs/xNz7?=
 =?us-ascii?Q?2x941eCm/xfZXGoc9sloVHDnw03xDoRu8wJNKa4kUZ6de18RqPmg6cGL1Y1H?=
 =?us-ascii?Q?gPLmOx9CpKZwT751qaRi37OU5Nt19mCao4Qrs6wnKHvUyTnZ3qhTCqe83OIw?=
 =?us-ascii?Q?QabYRyLCW7Sd34h9CgCESd84Olxrh0ymQgDSGJXOZriPVxD4dFl7aM9yf+y/?=
 =?us-ascii?Q?7gUK2ekGCMhiPAxkxO7SEEU0k8t8fXRqBpw/Be+gwGM1m+CW0Yd425RtY3yR?=
 =?us-ascii?Q?eW/zgSMUnSk2EVzA3d2Q9A+I953XwZh0t6MXJ4B2HU1W0KoAe5w909X56iWL?=
 =?us-ascii?Q?fviACqME/Og4+mZHjFD3jbLBDZdkiWF2dOmVrytF5hIuXwf/VbtWjjoFJ9N0?=
 =?us-ascii?Q?P6UpBCqaQ6I7uHJ4+735it3FmrIaMRWSCC6R81s3nRXODqFpoGF8ffPmIrOW?=
 =?us-ascii?Q?a1tcTYVGI9bgSm2wxtH0FImrnWvrcE46rJy0KLp0dH/a2+wMpP1psQEKQfqk?=
 =?us-ascii?Q?AUluFKviDKK3o/W+pNPQi23AGSFhdDFnteZ+FJ0X/Cj8SaEMc2PK6Tj4/YKK?=
 =?us-ascii?Q?9uGWt+bfEGy16knNEXyqNN1S89c0d7UdtCWFRBgIcXO+j36PpaIM6tHoVzvi?=
 =?us-ascii?Q?3pYZ1eQGv3ytNNsUF+WoX1bUemRGlpJ9taVHi6VA2w3hMU0TFG/M7FZUyE1R?=
 =?us-ascii?Q?/vfqtbOoKjdCUZ58IBs7goAR/mii3y2s1aKsUde1eBmzTbvYJR+hhYgPW3bd?=
 =?us-ascii?Q?M29ii5VmXMRYPzkWVTA3q/gXNEBvoEd/xP+IGl4sd8MvyQEP0vHDpXEM7C2B?=
 =?us-ascii?Q?k5iXFaKlb6WIRkB5eEdrHQ9PcU23DJCX4OiPiWfxefOpYQkGh7xt/stpp0iZ?=
 =?us-ascii?Q?MiUTKbNh+w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94700d7f-3d03-4015-2bbf-08de7dc3824d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:06:19.5233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYjplqSvorsSzWu1mtBXljQn7yTLLvRGLXNHXsPgePN93WiJwA8Gpv9ueP0Gn6ST/io/CJQMJHYowf/IIm9Qwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_030625_791792_C02DD54A 
X-CRM114-Status: GOOD (  12.21  )
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

Add Type-C and USB related nodes. There are two Type-C ports, one is USB2
only and another is USB3.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
 - add missing ptn5150 node
Changes in v3:
 - no changes
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 100 +++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8ceabe3d923..0e2da43f9d62 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "imx943.dtsi"
+#include <dt-bindings/usb/pd.h>
 
 / {
 	compatible = "fsl,imx943-evk", "fsl,imx94";
@@ -230,6 +231,48 @@ pca9670_i2c3: gpio@23 {
 		gpio-controller;
 	};
 
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	pca9548_i2c3: i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		reg = <0x77>;
@@ -286,6 +329,14 @@ wm8962: codec@1a {
 				SPKVDD1-supply = <&reg_audio_pwr>;
 				SPKVDD2-supply = <&reg_audio_pwr>;
 			};
+
+			ptn5150: tcpc@3d {
+				compatible = "nxp,ptn5150";
+				reg = <0x3d>;
+				interrupt-parent = <&pcal6408_i2c3_u172>;
+				interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+				status = "disabled";
+			};
 		};
 
 		i2c@5 {
@@ -680,6 +731,12 @@ IMX94_PAD_GPIO_IO47__SAI3_TX_DATA0	0x31e
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO44__GPIO3_IO12		0x30e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
@@ -821,6 +878,49 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
 	};
 };
 
+&usb2 {
+	dr_mode = "otg";
+	disable-over-current;
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+	samsung,picophy-dc-vol-level-adjust = <10>;
+	status = "okay";
+};
+
+&usb3 {
+	dr_mode = "otg";
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
+	orientation-switch;
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
 &usdhc1 {
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-- 
2.34.1


