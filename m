Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52D9FEA80D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 05:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIbFEXGvajGUlB+Ay+4momjvhissi/ZFASMh8e38y70=; b=Xdkgpc/JNDC+ANJSMk5Bxinq7u
	C9eBx8hQ6lhtjUdkJsL2MonGto/qrLMFdtUSucaMVQLyOpMz9QMWWsgmm6dJQ0M/GO1S5VvRVp7iQ
	DJIOiqcZ7qcLq653hiUsp2FrEaqwsHQtgq0qZNMadJ/+o2AVkhlloLlEN9vJf4TQNgSLwOA5AxqRK
	JKJrwhiNBWkn1OIWV476SwRYeDd2H0lEbwH37R6eIY0McCQw/aDEagtpP6wdw2MSNfBEUKIiASTqr
	zy9y19OUaZeEkyXyH23o4E5ZK8wNrm7+90iMyM992Htf2hrzt07ceJOLaBuSAteA9aCg9sglNMFtQ
	X7/hcxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H6z-00000002jo3-2cDx;
	Wed, 25 Mar 2026 05:49:01 +0000
Received: from mail-japaneastazon11022116.outbound.protection.outlook.com ([52.101.126.116] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H6x-00000002jmU-1YPs;
	Wed, 25 Mar 2026 05:49:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KX+RshbqdRvhEKJ22e4jvKy3pJMFixvAOB8HU4u5jnIV3gU4LpkJn2nqET+GwTyCv3LHimgRnomHDOHkQc5p1ChP3odUFO6DYqC/tLmDkS/HhmtY2NAjMDjTI9VBmBEDlqh1sGxkZlkzWy9+konwGltQbSe+Dyf0l0YVMOY6L76cg1oabh0Wc45p3QT/n0kPRqBnrCFGHzqaO8jbQ8baBtyXO6nwM9hYW0md3mXEmP7ddpl8x7xn/wewarcJMGYSeZ2fFDh41BE+aQO53a9QNFSEKk0U1JGqWaHFywgPjsWLqQwOBRHXgE73ZBnwdgBeokL3JCvm6vsm01+BrXkfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIbFEXGvajGUlB+Ay+4momjvhissi/ZFASMh8e38y70=;
 b=lbzaEznPiERP92f3hvLJgvZ7cxkBIGlldMGLzX/BBno/NAxWygXhoDqxul9d64QnDIDKTGRc63Way7lydwMAJpptca9Wes29CYNLDrPYBLqmVknsMZmhMaq+awdSYBYvaNbZjDhIj07DvkelMYMAcID03uSxXPBz2oO8IljtNQ8U5cWOECPdCydb2OdEaB3d06CWSHY3aWSbJPoNTVt4Au4UZSPogwCretpz9frpM+o0//Mu8TAFN6e4P4uG3YlFwa1lNrcCZhwJMShMrTcv8Lm/zLq3lnjVXww/9Wx1+RiVewxNP7tE1NbMSHgyegfu2Sm3oSXJtGSDBvdudzjdrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by TY0PR03MB6678.apcprd03.prod.outlook.com (2603:1096:400:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 05:48:56 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 05:48:56 +0000
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
Subject: [PATCH 1/6] arm64: dts: rockchip: Add PMIC support for Khadas Edge 2L
Date: Wed, 25 Mar 2026 13:46:09 +0800
Message-Id: <20260325054614.1497147-2-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325054614.1497147-1-gray.huang@wesion.com>
References: <20260325054614.1497147-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0284.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::15) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|TY0PR03MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 846a2c0d-e357-41ea-e7f5-08de8a323423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|366016|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: Fk7d2tlumERlJCzttEZmc9qd+upsqne+o1irPpYkqrL2j+xnpYiDg5CTyA7XPJ/phjRGw5Fz4atWBSnWu3+c+OZRD/BNDLcFldr4wLcta7y2JnJqzupJ0SeGljq1Iv1ETutC5cNqF/czaHhPYIql629Z1950OJvhPv76FnM0aAj75FGwqQWDT+qZ7ffvlnY18eHb2y/w5eA/4zvxyt04ALYpGPt1Hu24ckZ3RDOt/ZHHdLyM4j79D8IlmNjlXMkk3g3TAj/HbomvkuKl/2bwewrY57g+WEwzUXzdUIPx9sN3c1gJArGlBmj6ceS1PsGexHk3CH42+B5rC+gsRCg+2w91QwdEOX862TOJNKy6GCKo0QhkVTmQCBgGXWEj6pDH8ngnutcl58LI+kawQrnH9NnTgldkAMfzIzG6I/RUMIR6/eS13YwcZGNN2rT+CL++TwuQo/FtuOIla/LmU7YRoG49xMnAmKti86lj0bEYaiZIFaDb4bOzwVUKYQv6RPnEtgFFky1DakMVZaKR7b8/StGCp8Fupj53pafkLcm6gaetInmkQi8098bqq/0x4tqSyWFTkBEVudp9DxJQG+PvbjfXNTQxy1KZ1AgMg0QoZYnutRsyHhytwxQItNnKpTEplxuUuOKcpi/IKLtTdZoD+smyHKsUU+JEasj+uQtrH9TeOIhcjfcIw3SvQ2GSN4MssoMsbx3ClO4OCs0JYhj9+FtfOB32CVfsRvbjBcQdap3REWqYr5SFtRrfleNvDz6IDH31M9LPVQ6rf7BkBoSJkojn4iRy5WiAJK5dmGihQbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V19guuC9xOTJj3nT+w3oWyTzqh6jv8zHtguCb4IFtzqnFI2qWfdbL+9xPTj+?=
 =?us-ascii?Q?bi0JTAngw0Pnz1RsIAj8/dhDZzbYXL1WCp9U5fikt4XcgTXkdA+Cb+3hqey2?=
 =?us-ascii?Q?5UGai1yIhpXADG4PTQTh6tiXm9twSu2ljDvbxwL/Tsev2v4kbEnHKYzJ/Gu0?=
 =?us-ascii?Q?xXeniBFE7cIFmb3o6qGEVlGtxabGgvxhCPxuLxkjUayPxRAA06LahlQa4dsp?=
 =?us-ascii?Q?WWsL11VwGI8gvf8BmPOfzcAoC1e1J3zvUcGZ3LlXHc41VutmBbALuoHXaQKC?=
 =?us-ascii?Q?2Xc4w4efPfCPmTZtsQp4xbRi8gvV6iK2o2Ol/3IXIF0wSPj1LG8zRmB4U2xH?=
 =?us-ascii?Q?3MqO2RVCr9YZ5Eh8Qo9RimpfXoHjqaGfy8eraNawbNEvzSRGF2VUkDc/0SAo?=
 =?us-ascii?Q?cqxqjrPeu6QENAIOGuqWTUdGBLrZWPEy4I/IHBkkWiwDzarsS53xsUt3PW9U?=
 =?us-ascii?Q?LYM8m2swJnyebkyjTRTec+cGa9aWaKyNhhntfGH0GrUoRRjZdQdtYCAO7WAI?=
 =?us-ascii?Q?RJzQb9fT47c/SuSs4tUIp+d8IIPVRks1a0VSBAS0NAEYzVOhGRTkO0VWOS7D?=
 =?us-ascii?Q?w04a4dmdQxwkFCHfC9fXFEM6lOyOMb/YXjuqQ7pxbcIQ3fZfBdixzc5CmD2b?=
 =?us-ascii?Q?yjBTXdkN/B7AvFiRj9Vplhc7TCoFzNZpJVzpQWSGgirtecJOPgrCfBuoZ7tS?=
 =?us-ascii?Q?OCH7iWAOVaX3R77vq9L1FtjJp2dXI0gy2tAof34QI6X6bwoOZcj6KOVSGLwc?=
 =?us-ascii?Q?n8bxzRBMfi8+WIDnYm1etbjdbT5RFZRJAv+nps9Hy5U2z9qo8xeKOH+oUq5b?=
 =?us-ascii?Q?zmLR94I5j/olrL8Xq9woM1YHpl43iic2W65ZNEHdRqdYPyPyOKqc+xZPCWV/?=
 =?us-ascii?Q?LYR5uokqxkYqawL3ucZ0kTE/NHpl+9zjFWq2uSBNWUHMUzSKMKOp1pC3+Szp?=
 =?us-ascii?Q?zIlI5MfiPxfY85VzQfNoJ4bn/ODv1Xvsj7mhdK9cLykOJ3FSJCDU/LqxPow9?=
 =?us-ascii?Q?bUgd8MDe1z+Byrfo+7xNzbf2KRIXy/4KXxVU+ylgh9tvWsGc87AddSRtnI4g?=
 =?us-ascii?Q?nuV4hLHSl2258fkx8vJ1OuMYzEAH0CpuiGIPvxAQ4RDzO05Nr5Blob3pEdcy?=
 =?us-ascii?Q?hGvW3m+llri9kpShihd7xJp0Y5jHh2EZfIPDdn5RMksWMlWKlmB6lnChBUk3?=
 =?us-ascii?Q?LOlo1gcH/jJli/EUGebqip3E+9M4PL9hD/xnwEO6Hoik70DL0OhoGwLfTVQ8?=
 =?us-ascii?Q?B1+JrMCLwgSpXUyjqH8sDOrTmnsYvEZAr6ZiBdlQTs3dKjR03tMJBsr8P47K?=
 =?us-ascii?Q?SHukrvYIjddwl6QcWmkRGTRrxO4dabh+4MSs+jhaQd8inyvzkTqFe8hasW9M?=
 =?us-ascii?Q?c/jw71ATNIxuqvfP49GwM0zZ4HpsdrNIX5e7rpmOnp8/7NXYG1jW2rLGgzBf?=
 =?us-ascii?Q?i4dDty9vkJIZqQNaUKHXd7aQn5snaKYoAh5EhbgvI2IgNhHBigjn+3TQ+NIE?=
 =?us-ascii?Q?1Oa93FuAYJ/ixnuC/qeYl24Mlvh0aJnOnuHS83sQpomNepdLp367QSVWAHzm?=
 =?us-ascii?Q?0hiXoIp+w+Lp4oYDHTKrZBIUVf682O6DZ+4ydXzoRPW6Tj8uAApYsccehwfg?=
 =?us-ascii?Q?84Ji3+c4hBsfwpk1bVOTFsaLKGBISiRJVP/lW4fV4sUg/BfIZa1ua/WCAdTw?=
 =?us-ascii?Q?2f10ry3cYGNVPi7qt+UdILo4/0fjtRT4AnJTa8dZHZ1XT9qmKfFyvAbR8Le3?=
 =?us-ascii?Q?yacVTDicAA=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846a2c0d-e357-41ea-e7f5-08de8a323423
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 05:48:56.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ypu41ybTFzEc+uxUfumrwC57+Z8JN2iKxtA98fy2o7oPYtrBqLnQnfVIqwV0ATJsACJzsLYLTPTQxnTDJYzoXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_224859_547407_2D957DE0 
X-CRM114-Status: UNSURE (   9.74  )
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

Add RK806 PMIC support for the Khadas Edge 2L board. Assign the
corresponding PMIC regulators (vdd_cpu_lit_s0 and vdd_cpu_big_s0)
to the little and big CPU clusters to enable proper power
management and CPU frequency scaling.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 413 ++++++++++++++++++
 1 file changed, 413 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index 68630379af63..5781deae00d9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -17,8 +17,421 @@ aliases {
 	chosen {
 		stdout-path = "serial0:1500000n8";
 	};
+
+	vcc_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v1_nldo_s3";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc_sys>;
+	};
+
+	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_2v0_pldo_s3";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <2000000>;
+		regulator-max-microvolt = <2000000>;
+		vin-supply = <&vcc_sys>;
+	};
+
+
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&i2c1 {
+	status = "okay";
+
+	rk806: pmic@23 {
+		compatible = "rockchip,rk806";
+		reg = <0x23>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
+		system-power-controller;
+
+		vcc1-supply = <&vcc_sys>;
+		vcc2-supply = <&vcc_sys>;
+		vcc3-supply = <&vcc_sys>;
+		vcc4-supply = <&vcc_sys>;
+		vcc5-supply = <&vcc_sys>;
+		vcc6-supply = <&vcc_sys>;
+		vcc7-supply = <&vcc_sys>;
+		vcc8-supply = <&vcc_sys>;
+		vcc9-supply = <&vcc_sys>;
+		vcc10-supply = <&vcc_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc_sys>;
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
+		vcca-supply = <&vcc_sys>;
+
+		rk806_dvs1_null: dvs1-null-pins {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs2_null: dvs2-null-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs3_null: dvs3-null-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs1_slp: dvs1-slp-pins {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun1";
+		};
+
+		rk806_dvs1_pwrdn: dvs1-pwrdn-pins {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun2";
+		};
+
+		rk806_dvs1_rst: dvs1-rst-pins {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun3";
+		};
+
+		rk806_dvs2_slp: dvs2-slp-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun1";
+		};
+
+		rk806_dvs2_pwrdn: dvs2-pwrdn-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun2";
+		};
+
+		rk806_dvs2_rst: dvs2-rst-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun3";
+		};
+
+		rk806_dvs2_dvs: dvs2-dvs-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun4";
+		};
+
+		rk806_dvs2_gpio: dvs2-gpio-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun5";
+		};
+
+		rk806_dvs3_slp: dvs3-slp-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun1";
+		};
+
+		rk806_dvs3_pwrdn: dvs3-pwrdn-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun2";
+		};
+
+		rk806_dvs3_rst: dvs3-rst-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun3";
+		};
+
+		rk806_dvs3_dvs: dvs3-dvs-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun4";
+		};
+
+		rk806_dvs3_gpio: dvs3-gpio-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun5";
+		};
+
+		regulators {
+			vdd_cpu_big_s0: dcdc-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_cpu_big_s0";
+				regulator-enable-ramp-delay = <400>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_npu_s0: dcdc-reg2 {
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_npu_s0";
+				regulator-enable-ramp-delay = <400>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: dcdc-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_cpu_lit_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc_3v3_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vdd_gpu_s0: dcdc-reg5 {
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <900000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_gpu_s0";
+				regulator-enable-ramp-delay = <400>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vddq_ddr_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_logic_s0: dcdc-reg7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <800000>;
+				regulator-name = "vdd_logic_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vdd2_ddr_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg10 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdd_ddr_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_1v8_s0: pldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca_1v8_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pldo2_s0: pldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca1v8_pldo2_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdda_1v2_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcca_3v3_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vccio_sd_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pldo6_s3: pldo-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca1v8_pldo6_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdda_ddr_pll_s0: nldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdda_ddr_pll_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v75_hdmi_s0: nldo-reg3 {
+				regulator-boot-on;
+				regulator-min-microvolt = <837500>;
+				regulator-max-microvolt = <837500>;
+				regulator-name = "vdda0v75_hdmi_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v85_s0: nldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdda_0v85_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v75_s0: nldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdda_0v75_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+
 &sdhci {
 	bus-width = <8>;
 	no-sdio;
-- 
2.34.1


