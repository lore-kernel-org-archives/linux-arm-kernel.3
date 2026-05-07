Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19BACD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 03:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaDEvY7CtBkjnU1O403PtQPfC8vuRs3yWPgETSHhXFs=; b=2LpN7rSxK+tx9HcaIOteUKyA6i
	M5zQYafE6pqIgPspwSEC3H8B+wyRPuRPHjx4tSl7/pFcLXR7/M24GD3013dFx1ErujEhcy7PUj63z
	Gw3cjeOOGDxFjuCVr83DgUpwt3faNoYaCd7uakc46UYe1qaytZ7/KtYVlPVorrPgvFlK18PHi055w
	WRFUXFL9YP13CPasCkblgF9BLlHrCymDcElWT3h0ZEANzOpx0/ofls6tatQarm0uJGa/3gmbrm7n6
	CnhavLVB71vH/Cq71uTgTCNL2LL9oiqdIi6BH+aQzo5nmqaAcsiOQf+wq2b+pYdZV/lKQbX47yAkQ
	QaEJFc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpXI-00000002eAf-0Sr6;
	Thu, 07 May 2026 03:36:28 +0000
Received: from mail-koreacentralazon11023074.outbound.protection.outlook.com ([40.107.44.74] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpXF-00000002e86-0pvH;
	Thu, 07 May 2026 03:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPsiFUE9RJTggc0C3U+7qlkzuZD5QNTm+dehmy79Oh/7lxvz10PloascyviHcdvEu2hDVkvMMiAPyMPpEapuzSBDE0F6SArA6HIbFcwpVdu9MwWjrv0tjcS16UCeoH3Ket9XFrvG1JaXMxcmk1pJoJT4JGKdtzApZG+DwIksX2loQKpdVvxTBOe0bSo0WigtHTj5/AnpfscH1bdtqv1CRyEwZDC6rfhe0xvOfk3/bndfU/ZyxjVn+D1LwL9vbIykOksdcMnHmIjukdctmBTQ3kWc5wR1L2ZpV3vg43SwUwd2QmSrzOcDCP8r9ycU3DcvsAuVb0l+BXh3jNt0mv63fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaDEvY7CtBkjnU1O403PtQPfC8vuRs3yWPgETSHhXFs=;
 b=iJpwxhyk3vH/7IuXrmp/nLTu6M04l96PUmvaBDP1kqu3FjEQFB2vut3x5bm5/lAV9imMcIu4XyjltT8TGM3dHoQeZpefoMfUTnJSUeOc+lAQmme60N+F0JgAtXDlZwWCIA5eAcjVrix0eOXCauiim1wBG1uX+p+QcQRD2ZfSMYZKnWUlMuX77aMagUyizMjhKFVVHYlV3CUUHC7wIbsbhpWQ79F7lb83xaOsrV/g2Qo5d8MSVRrFBippvdcwI+dVW+iV6V0tqGoMlrkoiE/eQTU4de7kYhD+kAUt+0GZpnhD9WiZcxczsujQQ7jpdHvBbVM2iFiIx22+zwIIz1EpXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SE3PR03MB9965.apcprd03.prod.outlook.com (2603:1096:101:32d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.12; Thu, 7 May
 2026 03:36:15 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 03:36:15 +0000
From: Gray Huang <gray.huang@wesion.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH v3 1/2] arm64: dts: rockchip: Enable USB for Khadas Edge 2L
Date: Thu,  7 May 2026 11:35:40 +0800
Message-Id: <20260507033541.2576335-2-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507033541.2576335-1-gray.huang@wesion.com>
References: <20260507033541.2576335-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0028.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::8)
 To JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SE3PR03MB9965:EE_
X-MS-Office365-Filtering-Correlation-Id: 2931dcf5-808e-41e1-275e-08deabe9caf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|18002099003|22082099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: kt0E8GFqAIevYDpx8IFD7/xAQa3jnE4HMKXAUrMpAJXeMBigIfsSylKt/mvdOp6C46EPcrBhlhkyqm5ikhN0PJ2yiA4YOXmksJNlJZ9fIUc4X/7idEwuNj4We0xfO3AuH+yHpgpgp2TcL0xNycY4lUR9zZpOiFPFVHfnBrdZoged2a/SzzybFE0JxiqCMAJsSrmWT9KG0MrlEkbb7Q674CDzaZbTuCZlAv4nT0qpAxzjO73/FW8RuOcw84MGSZHlOuLvAUHfcypEultzdV1pgxDEgam6K5mQbiHp5Q7n3obHC/p5fa42xddalAPHlUFqnrR5LUGBTirm6/GBQX04uvIR6NZT9X0Ue56K1hQFhjueVGuNdYzPEsy6rR30Za/DUgJHk7YVx5VL3mrFd9eF4yxfIgzpEtA5VgjHz1djh790xoNsaDWbxQVQnhLxahkdVix+vynchMiLBsAhuHLphPetMt96SPK0kKx8QvRLVsZLNVm+VV6T5n4l/XBWtnSq1jcStTAYDSPVwrnKkcXbMuVgNKyeLC/PLI9U94iLwDzfliuAS3C+/qEK0hwzPerfBDqllkCrt0DnsGStILDPjEbTEZKhNq4qwwIHBNm7rkte6EEVebFknE5TD2I3/Tng1o2b+wvnM2bb/KpjQfOsyAJACTy2hPwPO+m0HTVPpE4aBUj4e7GSOsINntKGIkQ4iB/nmyWZhoN1rzvilH754x4Fs0TiWKAJ57TqKZqjHeD7w4S54huJdVPF3f2w7p2n
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(18002099003)(22082099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zu6jifABNRPi6BvM/oaUeC3oGZ1aV9mfPnowlaXjHHIm9HGpIpRzehCiKvTC?=
 =?us-ascii?Q?qgaTCKlvdp4+wORknLyIKnWV7b0+VhEPMOuNFiXOp8CymbyBL6IWy6yye4Uc?=
 =?us-ascii?Q?5RqyBPwTk5FBE2pYq+aiyeDkgkqAhfaKVASPY/EJ3oKMqDFUNS6lwebP7K6n?=
 =?us-ascii?Q?0QJmZoNr6P6T498C5N2QblCi9j+SgS+QdQkkp0duL2ENvP83wgSYO3H73Psd?=
 =?us-ascii?Q?fcYqszzAxLogdk14Mun9Qq5YV4N+nsh4mQngOh0tS4MZCFQ5nfDtFMbfbOUN?=
 =?us-ascii?Q?eOsaqenbey74+fOZ/6cZQ9r1vOEADpN0q76oWoUPYkGIQJLOYAMHxgw1y3aA?=
 =?us-ascii?Q?n3V7PAq/Tw8SPQFAQIO12PeEz9EdSHdsoTCCCSNGiWscvwBX4RpHRsSBrdFc?=
 =?us-ascii?Q?iy7lY4uc2a1Ij2RpstVD3NEF+ilzw/tSmjgVpcM65kvCllXR/4oNGKFYdSVO?=
 =?us-ascii?Q?okV1A5A1NVmnszCzVsOV0maUKu11KfPJIOKCXQwD9QQlUC7OLEYmKIEAMYy7?=
 =?us-ascii?Q?zQHabpMujItPHqyOHiaXC+S+9AMSB9cpYdf3gJ4c6mh8qcbzP/wp5uaQ02VI?=
 =?us-ascii?Q?Vc7XV+NFTMqUkS243uFFiVF6pyHwdPBelp8DYh2KHw5z4aY4sv3H6CzDLK2o?=
 =?us-ascii?Q?Lcwn5tevW9G30ItGTDdfnIMhgMhvMSVARRlHtOw0KTSIFz/h0e+zODkXbmfq?=
 =?us-ascii?Q?o5g4E4F9l8T3JwsLFq5DiAMhlxXBswwoZ5l5YOmD37zXSN3Pdpu0YIYwkjso?=
 =?us-ascii?Q?zLXa86PldOyJg5hNv15AwzunY5ly7UhCnkzyxRBT/9D0XGMOHQtM8vKv9KUn?=
 =?us-ascii?Q?Yq57hdgmjsW8VtfAT2/oy1tmtPI3pEjKGFaqTC/2cS9COdhbiUkV4YJ2qfbO?=
 =?us-ascii?Q?sfqU4aWRsMC/5dXZAc01WDiZ52BalrLW10ilIzoT+M+2dla1r4ODbAdeYSo0?=
 =?us-ascii?Q?ap1jEj9vYMe2etJtZsRl9JCujRzQHvfwUNF7qb9XqPaMI2Znh9crxdKWXQPT?=
 =?us-ascii?Q?oARzMwUuytToDF8WvwA2ciVF/h9TS/+kTEG//37xw0icWRgtbVzQzXyugRyy?=
 =?us-ascii?Q?TPTaBw8vJQCk5W4RP5Repv9fJNm29Af7COZFQ/HajtZETCphhEIlW6zATHH3?=
 =?us-ascii?Q?nYRVhxxUDSaURCX+qGBznPUqSswSri970MkrBnWR4bslM955hZC31FonjcJX?=
 =?us-ascii?Q?MhCI7etFzKad8baVRmyXvNw3MchlaqSfEZd1YX+LgBvu/sOypIXRGKh/v78W?=
 =?us-ascii?Q?SNI3Alm+byo0hpz+lgBVAXwJSxxo7p4kZcgWDE3eqwlZP6P2CwTDIPd4J6fI?=
 =?us-ascii?Q?/o9nvkMO2f7jaMj8rLpywgFfF4tJ0NC+gDPLWAYDa2zSDyMqM59Cr6qA203O?=
 =?us-ascii?Q?HfjIpICc7URwewoSKUtrcCfSCs4NwSEjqCILtLE2JQK4PYEA8Ung9qlnTwCl?=
 =?us-ascii?Q?IGW+Pf3QZxXagnbI9HPFDFKj+Gt4SgwurX17QzaQz8OgmRXcMPPH1JHjWQpo?=
 =?us-ascii?Q?SBj20ssjllKb/CFNbvm49K4fYtb+SU58qiqYMGNLS3HBb8dlXjrEV5O2QxJX?=
 =?us-ascii?Q?cgI/CCmStKWgubHharn3mLufOGoIen8/HA4NBBl39g3fcAyiPv27fkyQIpO9?=
 =?us-ascii?Q?o3/nsbx0MWfihfXmD/BF955tej7NBX9xeFrXy4livPL2sbBvptZGeoRPzpyI?=
 =?us-ascii?Q?Wqop+u7XJG0q38LKhS7ntVMb8onnOgRTUFWMoY6JKQ4MKzRiI1ycN/a8uDre?=
 =?us-ascii?Q?Q3W4UtcByg=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2931dcf5-808e-41e1-275e-08deabe9caf5
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 03:36:15.6499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBZdwYrUlkSo7rMV2k+pve1iICibziYYozXbM4sWhwMZTXfAUNkqIeA/yBPXIaP45ZpYFzD1fhEJubZd23lw3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_203625_240514_7FA00E1B 
X-CRM114-Status: UNSURE (   8.79  )
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

The Khadas Edge 2L board provides one USB 3.0 Host port and
one USB 2.0 port (connected via an internal hub). Enable the
corresponding DWC3 controllers and PHYs.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index e7fe22eb31a3..0c55ff5331ce 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -30,6 +30,29 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	vcc5v0_device: regulator-vcc5v0-device {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_device";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc5v0_host: regulator-vcc5v0-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_host";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc5v0_device>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+	};
+
 	vcc_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_sys";
@@ -78,6 +101,10 @@ &combphy0_ps {
 	status = "okay";
 };
 
+&combphy1_psu {
+	status = "okay";
+};
+
 &cpu_l0 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
@@ -531,6 +558,12 @@ pcie0_rst: pcie0-rst {
 		};
 	};
 
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	wifi {
 		wifi_reg_on: wifi-reg-on {
 			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -552,10 +585,24 @@ &sdhci {
 	status = "okay";
 };
 
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
 
+&usb_drd1_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &vop {
 	status = "okay";
 };
-- 
2.34.1


