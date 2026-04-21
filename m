Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CA2F89251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C93e88pR9ZTo5QWL3rg6ZtVzSazCYuPXFWtYjOcsUII=; b=uWapkzuTyH1ehge5AVuU7cYVao
	bPJIiJAsSY9uJKTs9x/CXSwPdJ1A7j/AbnIgZwxTrza3YL7x2bX6ypE6Ii5tWojclWDwtPUUWiURP
	xyHxZXychBiHdi+BGKIUdAmgcGaEsePL6bAwpgq9eZu6OT7fgl3QrrMqWR+2sfKbVm2X2OGuaqnKm
	UcrumXfvAvzludE6nAOOd4vawMc5olvwJjROcR3Jf9M1zXwoOZK5qOLuVVi7lc7Gp0RZBwuTBU1EO
	RiD3DcEirkrcnZ6NEdId0cTK1VW8t/r9rGydzjx+rXB3MsGvkTI/LBdh3G6VXeMVPW/a2a/k4f+Rs
	e2RvMtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8ir-00000008TA3-3LJ6;
	Tue, 21 Apr 2026 10:52:53 +0000
Received: from mail-northeuropeazon11012045.outbound.protection.outlook.com ([52.101.66.45] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8io-00000008T7R-2G2R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:52:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8e0dpm97wnpsSy/9Kgw2Rq7n2NVZbK0Obs71KcdCa9wvjDOzHYsVwnvdsp+3ARuI6yGukdGfXruzNiU+JLGWK0DspU4qCp5fH8H0P2vxD44nD2J9HkSbQu6m9ECHe7CsPFIDP7cadPkyGkf+qQt3pW7uU/uAhfCeor158HEy+ZrAYK1rVIgIKWwgSjX+L4zwBA1tpMFpSn5+JEgjwJ9eT0gTRTijVWT+j7N542HW0ldOw4A+JHRHxalLKutULoIm2P3unUdxt7BAKPiucYJOdiJx9ia+dgNCqFxRzebro82M2OvMjbRQNhyjm7pksPF5wikiwsrsBbZ1C+AuC2BAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C93e88pR9ZTo5QWL3rg6ZtVzSazCYuPXFWtYjOcsUII=;
 b=XKgP+IB+aRGOOEHKUeCBok0K+07hg5iL7oxS6gguTcB52+ANEAw2OtTRxmBMTM9wqjTyLemgXYqXZNyv/wlyv/LhjtBW/g8qBEfSd0QZNIWD4dS6ApFvmx767fwFq+SvVyoGJ/sZK5gvnqxMy+Atf1lmozPnL/uaAUJ7W1dm2oU7VXGZTZpnH4mPtFwhnPEZNgZIHDtN39oFiSuPFmEb4Wox6P3a0RQRpqzZdn4XkFOmm1M0M6iD9TAT356hi5Sk3UaLHBzsfMT3xxKMej7Qka8JWh5UBmVG0fQ/AKjMZNb6t+ux6KLOT+PYs2WQbNA5nXJewz330rLpHt8TdjiR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C93e88pR9ZTo5QWL3rg6ZtVzSazCYuPXFWtYjOcsUII=;
 b=Da2htLPa0Bol/BetEneoMI8A7bxJ4WQzDu1Tu74IpY2hxVpopOgQ1BQOKlyX3gERointw1UMsOFqMBqmbfOzpBwuQLInb7VZjn+xJ8Y7apyAn3pQzYDCCnlxwQYfI3JqvcpClZnWITxrt8Noop1zfxqnWXW/Ig0Q5aV6Hmhn4Afw84MGp4xwYqx4kZ6/1bvDHS+zvH7T7+CrzVdSNkBvZfrBGNRR53TfQfI1l1v8/Tw/7s0KT1LrCLe8tcHxGzA/e7Lz8CeBtqDuik/9mAPHQr2uGWjfYkZh1QwfbTM/UP3fIRh3ICMjgUIyhTPDZpr2uhzQnLSDLrEJT0HCCYRWIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB12270.eurprd04.prod.outlook.com (2603:10a6:150:321::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 10:52:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 10:52:48 +0000
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
Subject: [PATCH 3/4] arm64: dts: imx8mp-evk: add typec node
Date: Tue, 21 Apr 2026 18:55:02 +0800
Message-Id: <20260421105503.1416566-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421105503.1416566-1-xu.yang_2@nxp.com>
References: <20260421105503.1416566-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB12270:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c9a662-8291-465a-1c1f-08de9f942068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: e14gnwr0ai9HHxyJO7OJnsuI9ELwG3SSNk2ROO0g+9siEDg8gYBJ/2SCMUdCuOE2cKUvk4cSUDA2euzG3tDm/yj5WHVPn4XySySd4XzoS5orzfKU51vPUwu2uMNrXyvtpcry37qlUpLOTtdJmTWvEqO4+u0aU7zc+audb+4JLsyY/uWTFeybbDl458oWIfw/CFFX2gvZJQmgszBgcGF+1gckuqVJM7n6rm6mU53OOFqngrsQaFzItEEtJ8FykIH2iWAzLFARA4L2GnmcTK/8U6PUbMNlDiPDJTvQ8m8vl3YUT7N9/HBALETspUhM22rMItW6gLxNQwJs6tblrYQEhq/uOV0X5d8kcFdOVVEGg12gbtcPwXOeNnExpH4wXrFgOV6D2P2OX/v/u9uZcgVdEUjcZ0lIGc2Zu0WMDnqZEae0epKImLJGlPNJyj51+tqGzkHI+83sWcGnThJOZ0Q1OsIvtl5gmR/PVqfGVIUKGqtivWtrBWXRme3dlGIKtRh+loccDiBgkfOWwVrMFN1TOi09SAG9Sjons6Euhcs2AfStQHBZUGfESMm4qwR0FziDV5br4jEsL5Jgbc1Y+NozOTnMPGpUFZeZ+pmthRKEGZ5Fh1T9r5Tk9HiGn5n0KiWq2siC+YitYu90qgYA1P676j6plDo6gjoEXRr2ERYtCooaJ+dLJktoc89OOCPu1j2V6cX/dtcnRZgHZde3GmJt/aB+1WsREuh0MWRriYA8SJlmMtPy8PcfW1Y93WuxxBUl9Y/rE/GJNGNL923/XaAiXS3bfZF98g+JvRcHueB8KaM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wvDmjuKMBaScOzhCKQjO7I/KsOG1g2Ktb41CdvdSUOVJNQR6mJUkyme2X3Ne?=
 =?us-ascii?Q?+wrUzGvweQiTK09mYinMSYdEDS9/9TcTfB7k5WQ4ztTyS8qiZX1LsFWfLQye?=
 =?us-ascii?Q?+YWpm6dvQ3wg3+VdtLyAQrNQXfh1BB4I9DYFtZZw7IZ5ZpohbM4acI8fULmT?=
 =?us-ascii?Q?VrMj95eL1ixt+9Qmd090YgXqdnPZAUWSEEn4XcAlR8orhL5SO4mreZ3vmAuX?=
 =?us-ascii?Q?v2qNf842hmXCEDFiw79624gJAfFLocV6xGOvB59AU4IzjVjESn+HfiYO5Kw0?=
 =?us-ascii?Q?4wpENiwFNQtlHsCHjxBOC98ccYKFCf7jCmthcH6O4JSctENVdsWs3oZ2wzBF?=
 =?us-ascii?Q?1opfs1XvG6MfI4Nq/0zqEPgsHQn8d16jsV56oqJLlyeRh4knUJMi8KL6CQoT?=
 =?us-ascii?Q?TAlgS0m6ve3dimLxXtBkdvcvNMYeT/k/ZyWHab2LBARar8/GmTdDAFpnL5au?=
 =?us-ascii?Q?wsEfZQARTe1vbJU7o8nOWxpxznhIchmarYUlM1JB5fnClkA8OAdGHGK56Ou4?=
 =?us-ascii?Q?3DHCsdVhzcCvMW17gaRrHsfoB97GfWArez4687IVojGRgeabdgidb2U9zCZN?=
 =?us-ascii?Q?PrLbP2Wpl0SepGut/hzV00uYAi81o32jNnVR180V/ppWaB6KKTmM8s7y8pAc?=
 =?us-ascii?Q?9i3fxHgCkAP2e9pwP4+Amg1HUPmj5dWVmvm3PYL/WYihuwPvjowM669mgvpI?=
 =?us-ascii?Q?Evd2nUJcrs6Ch7Zw/TmjcKP8SgkX0ATZHPc4keFnAwDfy/vvVAVz3TSSoTVF?=
 =?us-ascii?Q?+VbC7pAGNLfFy2AZHc0oLxHxR29OtwQCqfedM7dTo3hxnwzZjL+3tnNqewH5?=
 =?us-ascii?Q?7+2rEzGCssIoyH37wPKxBFBjZulxas2cIcKw2h+xFc6wjiN2sMoIYC0uTTYs?=
 =?us-ascii?Q?GvRoIP+C0oDyaAHZnJs1p6D4LJTByXCv0Bly0yEdMvxhuBJC+bVeR8nQu5hp?=
 =?us-ascii?Q?JUHgUIH8ARMlnFe+QnhGamkGQbvn994r/Hl2S91GHxxDz/8iSzAbikVb9H8u?=
 =?us-ascii?Q?fC2B8qHrBxUYy2DcZNk68l5J+/kzvf23Ei22nXWfJDNq/pvu8HWsWhm6XGJK?=
 =?us-ascii?Q?m6scGa8X3DAF7PUjDjxPWDO3akU+UKpE58AVct0/r2dHXdaXaqEgQR9Xtxxz?=
 =?us-ascii?Q?ocmjanZ18xvB8MzhRMBqFmctkGdeyE7xvMJbLa9LEauA995vY1GligpNk2Kh?=
 =?us-ascii?Q?HwVaf/w7uCGKtaOa0ln6Wa+42jsh3mA5Ja0aO5x1UG2sLjck7vhBL2EMIsIX?=
 =?us-ascii?Q?Zvv+GAkAeqelmxFaAuZlGwPP4KOLOKsgvPAdSL0Hylzfg54awKQnTLg8YBHq?=
 =?us-ascii?Q?rlLiaIZWPNvp8Xv5S3pEjg3bSLX5GJlDi/mhxHHupHQrqpYFqo7TWf3YbfG4?=
 =?us-ascii?Q?PJd+XE4P4Cw+kKrrIGhOSAjnVF2zrWaq47WqtQxOm+FIRKuwEmDalnMUUYaL?=
 =?us-ascii?Q?411XfVc5RyxlwwWhikXLtlH5MhqjCtym1tvIpcyV75BNH8k7pSlInzlklt1H?=
 =?us-ascii?Q?VAirG9kt62YFG8cKxcgnGQCUTYxVLPgMmZ+qJqjNQGaV+BeEnvQpCBZ5jdnt?=
 =?us-ascii?Q?he+pt1Uaq29DeGHv6Hy8D6GMQLa3It4/G0VFezgJGtW+sCz4Zx8wUxENIF0n?=
 =?us-ascii?Q?llk35E52V/CaWQXuoZ1O9b6WQJQfjI3PNOKFk2uJs1veurWgZC7RIRgTTpAK?=
 =?us-ascii?Q?LQ0CIxAsV7W2hsBK8/X6M6Qga9XJP4QeSfzJ+sc3kWnB/gEgXArqeYtPKE8X?=
 =?us-ascii?Q?HgjScppHpg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c9a662-8291-465a-1c1f-08de9f942068
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:52:48.1922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/PFM59TWXKj1MjA1q/TI/sfGt86LA+OEiMNKcXgoO2u5VjpVHWq9pUwG1zH2ghiEwWgYyLEEXqAfw3ZPuVgTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_035250_577336_E17416FC 
X-CRM114-Status: GOOD (  11.82  )
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

The first USB port features a Type-C connector with dual data role
and dual power role capabilities. Add the Type-C device node and
enable the corresponding USB controller node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 67 ++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index d0a2bd975a18..1d9e9a8f5e5b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/usb/pd.h>
 #include "imx8mp.dtsi"
 
 / {
@@ -636,6 +637,35 @@ adv7535_out: endpoint {
 
 		};
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		orientation-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+
+			port {
+				typec_con_hs: endpoint {
+					remote-endpoint = <&usb3_data_hs>;
+				};
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -846,7 +876,37 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	fsl,phy-tx-vref-tune-percent = <122>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	status = "okay";
+};
+
+&usb3_0 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
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
 &usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
 	status = "okay";
 };
 
@@ -1174,6 +1234,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x1c4
+			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20	0x16
+		>;
+	};
+
 	pinctrl_usb1_vbus: usb1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x10
-- 
2.34.1


