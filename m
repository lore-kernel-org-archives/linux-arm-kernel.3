Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B6BFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIbFEXGvajGUlB+Ay+4momjvhissi/ZFASMh8e38y70=; b=I01PKuSF1hCWdxO7tKfxy3WjPs
	eVy9U9Jfjj/MyzxJRuOngV3I1dNoYa65EjO+qeF0BWnENxgfbr+ayNpDAG4Y9CgMXitGnnK31D8cV
	Rpkul8qK5Qh4+lZk4AigrbEBrFhEwiMz6U2/qA2hlkCn3DkVDWiMK9dmqLWWc2t1V/6I/CWT7dtFc
	8USuGNQjaJ2UfPAFe+fwV9DlziOybbkjApPEtY9SNwSSkeujOmf6mjNhKjE9ozlP13fO5Laz5v0im
	C9qcanCBvunem2PIB9RF2+zbbtlRK5bpVljl4zJlFb0dHE7XL1m0NT02/W2oHjRSIBGXoefjByUXP
	22ck9BcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyYw-000000031CP-23tj;
	Wed, 29 Apr 2026 06:38:22 +0000
Received: from mail-japaneastazon11022096.outbound.protection.outlook.com ([52.101.126.96] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyYu-000000031B6-1Byd;
	Wed, 29 Apr 2026 06:38:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abEPaO9Z21DM8HugKtfDw10cVkoJeREhdvyMMgSUJ09Z7s5vKKcD2TCn7klM5SRD6+CSoy0WSZwe4rSDnk9Y4fxau8nku3UVal3U/rJltmIA7VEqHlGpbBzrVdJ+VauQH2BenCFt+krksrG5A337SN/E2Oj3XV3wpNLIy/wu+jZZ1FZkvrLYfVaeif0RZF/dtK4399s8osYXIueK7bNUfIGt63zxeuW0+yJ+WbgKoLvPu+lwa6sI53F2B2rOcgcAqkapnL19SkQQlfbAIiZkvnblXFAgLZV6MxzAyH8VoXHWu+eatU+bZhPFX2V6qhyJBKEHa18t9wt7HrBRtzE4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIbFEXGvajGUlB+Ay+4momjvhissi/ZFASMh8e38y70=;
 b=H4wbd8Ifys1cHlflVX+jwZ6pmr8Ij+Ep9UGZG/Jn5b2N87Y8lLd/Kf7GzCugdNorym42XIbCpFQSy2l3apIBSDKy/fLPmx5+P4DOzUOvn+0+nok+GzxgYWtC/jdJFvtaQs6St7N06o8wAQKrYaBynrlNJrR7vTSuzu+X+dGG/JIRJf41CNu0S/YsNJsWPGkDKEFKmThGzhkkqnRvjE2NcDQf+MBTObVwiEcyPNn42IgG3mxNaDAB3oOyb85sXNRk2qkMGtKpdEMTSSZpm6Gdg6hzh5buhDDjorD32whqPS7vNqT96+FJoeqpio7y3Kh7u25DRQ/iBPaJFv8YigIOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 06:38:04 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:38:03 +0000
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
Subject: [PATCH v2 1/7] arm64: dts: rockchip: Add PMIC support for Khadas Edge 2L
Date: Wed, 29 Apr 2026 14:37:06 +0800
Message-Id: <20260429063712.2150938-2-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429063712.2150938-1-gray.huang@wesion.com>
References: <20260429063712.2150938-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::12) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEZPR03MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ad8c4d-fea3-4448-8dcb-08dea5b9dd2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: rimU/x4uNxPw3krtkgNhqwo1BP2y3vkqnEh/zGbk7lvOAbW6f8PCKGzMu3gSEe2rznSkwbwmSjigDMEogwp9OFnpx8v4tgQyW9E1R3DHCacSmGvg4849XfmZ7xCL5zdBya6fvwXS9FCNNWZSlf50JmN2WUJAqjLu2p6/sd+x+K1EsuF0uf6MxxGo6TOA3ncINQMjsxLRoo7RyrVHTIAP9SUrS6nA+v6s2ZTrfL0pD8+Wb1AiaFCVHjXyuO46DXTdXWxedPW6GdH9dO7A0u7YghcajY8v0ZFq4fAVdErBoTPp+sDpuUcQlSxvuXwdLsL/Rw9Noz9vlAF1vQAkwDmkmnnjSWLuWgdF5RXUMGgfdPVuxcJfBFKQO+oNiRjDC5W1HIIB02IVOL8D4NfoTtrLSvYkluEyd0glgGJYs8t4JejFW06MoYz7iTNp8k9ZMXEYuEHgweg/rB6v7avbHK/WQ4dcjHgHu3pj8XHEX3SQRfCJUcmBwjrBQ2w/bpcvXKe/gf8Ch278Rxt4FsMDAPtThX39uJ0S4IwY5ZqTFzKuI9D6cZjACCG1pIk8tnLycCWU4OqoMKxgjR5VbZTKkNiGmug4kkjHIqI8Ht2G+zM22MzR4VJOM5snkTCiG4neFgEfvREBVJYmJN0Te9dSHxVg3GL4gVtjAJ25duvVB/WkpUGeDdaDlCJF8m/ZfU8fiUYkdfZIBGBPzwHE9Sw5++7fXjMhqiuoZW+I4pKdr8OZ6sqwhvkq/Fpjitx2/LJkg5UcoGtlvvlkJKitMXpFjLhSmhuG3VRV59tN09xZ+6+AgPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7FjAjbRcIefE2QcJVORaUB+b1+kJMUR301GdO4+GFM9jUSiMq5ZjPmERTUQp?=
 =?us-ascii?Q?G4o0iX4CEt5ri/YvKi6gi2vHtQ6V7WSHE/ks+ZhiI8ruJz+TTBAxPH4J8LU6?=
 =?us-ascii?Q?kW5+S0JjY9M7otYTAfbBcIpLAMFR1q2s3T4gNDCN3gIjYLq5OsjMw4lt8lmf?=
 =?us-ascii?Q?5N7kCcjcvoABVMNnlHZRhqWADUjqyd3B69KseFtVVIHiRSoAa/mEOr6yhdWl?=
 =?us-ascii?Q?3Joe3c36NnOrIRGWZdtQ95QAimDX3CHniTHxfsn+7oY1lA9Xkqa1lEXmN9a6?=
 =?us-ascii?Q?1L7Nji1ebHM8demG5uK+Gw72q47MUODP3yW4FoNDjAjvUVUm03BxJKho3/Hg?=
 =?us-ascii?Q?GQXrG3FYNPC+z9np+u4Dno8uw3btJjU4xaHKepABMnF15c2jsmKOI+6c78nF?=
 =?us-ascii?Q?i3GUwvEY7E6CEMWzp5Zg39yk8J85zmzX+Bnuped6NtKlvBsLyAN1xLy5I/ms?=
 =?us-ascii?Q?8KdgA/tJu3yLgdv6OR5D48+mPnQejujUx9KYXnYwqqUy1qqm9phPCVM6W/CR?=
 =?us-ascii?Q?XMs6lGnp8hKR9Z+hv41VUL7f9hRNvWmWuaqVBLSC0JuDnMr22Jv7kKnsLH4m?=
 =?us-ascii?Q?a0efM2m3L1aEPJOxNcsT7nNVLIDjjAZWXs+4zH3wXzKi9b8wbB7VhrbITSLl?=
 =?us-ascii?Q?26AXQNuo+LpheeZ+XjYskAX9gPA6DuWekwnJVrx4gzbfwTVpyrxoAWAxbXtH?=
 =?us-ascii?Q?m+Skvt3JF7G69kM6zt3J24fV+ZW7B87YjbwzWfLwq8NMwfNbh5y+UHiGuMxV?=
 =?us-ascii?Q?yD5UkAAN14kkf7QrtEYORE+axJdk3zDG3f5Ie5iQbw88m+BV2ev+j+wqBarJ?=
 =?us-ascii?Q?nt25rdanMQPJg4XeBxzBcOROFUev2Yfg8+9YmZusD97ofGb3039JgyaBVl1o?=
 =?us-ascii?Q?y+UZo+92fPKdEd4fZgrFFbB425FICDlsTiyMlIzg7yZgx1EDOcSg78Unc3TK?=
 =?us-ascii?Q?4zNEIAQruGW5QpAgtjZeR+vb9m2vSP9CwvdeETknV9ZHqzZWw9TqEZvTd75x?=
 =?us-ascii?Q?9LctodW8MdhI8VxYXdnUfP4aEVfhXE8KzV2fCr3/i38Zxb6Mr5f/8eIHsBGf?=
 =?us-ascii?Q?/1pb5OaeE2ZOeJ4mJrhq5ABs1Hvn3QAkiQhY6L9amBVIEzTDMl98oFQYEeNq?=
 =?us-ascii?Q?iq8pKXCSj7mQW/J8RNrwGt3lfqdf+RLOWQqdwtYFfTWAL9FY4nNLokMw+NOo?=
 =?us-ascii?Q?euFmtj/8JFt00J4169Uj69/RPvtw+xl/JcwX3e2qYZngNZT1vixcGHURlvib?=
 =?us-ascii?Q?cTiXqseTmVcBth1b6Yw4lTAoVBhLeHmtxpY5ACaEjUCRzAbHOP9HXUKqGdvq?=
 =?us-ascii?Q?47VekHJfi9+/FhVVi60p6Ue1TCy9FyuLhv7gOKTFofGzsxh91gwwb8M6ByM+?=
 =?us-ascii?Q?4Ztwm5XuhkiLoHak3k9W649Q8BzheKRgNhftPFuTpJjrxkrcC0IF++OpBJpG?=
 =?us-ascii?Q?bhAFZzNfzeHVE9aVq+W1pCjsiuDR7V1MmuVGnF9H7UBKRrTyc91XAdzXAuEM?=
 =?us-ascii?Q?anZnbf2dMYFBoPPezlYDJGTHoxY31GBke6IVl1TCMOj1i1Qw3b3x6FN/pUwB?=
 =?us-ascii?Q?iGUTX0648ez9kVOEYCUZMZ7jANOEDSvOGwFM5gjcE9bCPwhtah5RPK9sFt+p?=
 =?us-ascii?Q?swj+Oh3S0Zc0rmLHjWkwf71oJESapjV7Ybb+yHPD5wRczcBjmgBJeSIY7xD8?=
 =?us-ascii?Q?QDFLmzZw7g7iYYGTloCd5vTOz4xRwZDJTIJzVJ1k8lLS5OvkDhFxMGJAsGJx?=
 =?us-ascii?Q?AlrjsxaaXg=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ad8c4d-fea3-4448-8dcb-08dea5b9dd2c
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:38:03.3721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qZx6BOaYwQwbbSuzyB9ojJtXRpkO3M4jE+nQsrbxr9ix1lo26fD+qlLX0jUMeaj/UboF3rXhTnNDqyVy5A37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_233820_460544_472F569F 
X-CRM114-Status: UNSURE (   9.52  )
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


