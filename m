Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBEBFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7ANQcjYfpmtewOGm0UmCBJBOxKnZ8ayyuodk3waYR4=; b=ShZpOe0y0qYbVurK7cH1pp2ScW
	6YAvODKptmOgUbKlSYy8Mhc/o2v8QY08gJQaRcPB93GKuQEm1lWAL6jMwpX7K1sH6XLr+Fw7Q4PXX
	9lBIBjAMy3L+lqqHQk94YaMAp9gqwx9qbK9SB63I7fKs21Ic4wbNA3UXwCNGu4oPAhqoKN33PbAty
	Nmdjcukw2boBiymZ7N2Cf/zV5gj1O5yJNI5UfnFjs54X2qFjX1xAfAbcRV1KYRmAL8rEnEheZg70N
	OYx4XFkBO9MNPM588vFgIgR3bXD/K1RH6VNjUxGtEll11aELq49ilFxA6wXYMjP8TAUmtTF12jUF5
	sYqX1XGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyZ5-000000031JQ-3BHD;
	Wed, 29 Apr 2026 06:38:31 +0000
Received: from mail-japaneastazon11022096.outbound.protection.outlook.com ([52.101.126.96] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyYx-000000031B6-3R4B;
	Wed, 29 Apr 2026 06:38:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eM1r7DlFQDmyp7aB+HXHiH9ZkMrWC3OcGrigHlEGEQv/jQLhbkrEK9CY3jy+gNYjhPU68Nplsh0l9G9mHkSHHJ9+PA0d8cpJOjjalei/SngWvJwdC9HKYKnLJS7OxEpZrg1QVZ2hBHh2jw3YeqirL/P1kImC6Zkjja2TqTrzMbyDh8csAnuxBLq8boIRuZ3xH5b4DSCVe64arb33KL4Z7ZqEQ9idCsOd0JZU43YsHKBsTY3WeS3clIQzy1hxqfEL6vJggs5UwDWLqtsF/iRLoplGKNcVmoPx4MjrEHeO6J7DshpDKnVJNH6XSX06M+X/ZF5416AYKYmq0V+FFAy8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7ANQcjYfpmtewOGm0UmCBJBOxKnZ8ayyuodk3waYR4=;
 b=eA7Vl/CpiRsJd4NWWWdurCZheRSfuWypZQ0qtmej8sQYHxeBH94LexMOSppWdYCT6pxsurkibLd4pYJrSF+X16pM5ZZ1WuaU3m/Qrn2Hw+SdW8GpA7hN1OShfnK/eOWq3jRWU2bv+aA1QAeVrSwHB+nZ7kEpqWseh/3+q0oqobZ9+/8uJdRAd/aW5aQQN04Qb0FlORsFda4moW/Pg+XuKVbuTsIZH8jsRs8RE9KhgcJLQDO4Ti3p82m99OKfVzFpEY8Fds2A/5uHtb2YCqqilA1LQt9W7pn3SeGqmcUZaNCNyp490ZGHGYj18Gy5A0XyagrjcYhgTe1YCZE8D2+dbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 06:38:08 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:38:08 +0000
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
Subject: [PATCH v2 3/7] arm64: dts: rockchip: Add AP6275P wireless support for Khadas Edge 2L
Date: Wed, 29 Apr 2026 14:37:08 +0800
Message-Id: <20260429063712.2150938-4-gray.huang@wesion.com>
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
X-MS-Office365-Filtering-Correlation-Id: 80a7bf16-cc07-4390-ec26-08dea5b9e05a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: oSI3vmTmjxnKZRNbfvFHBMzLm7U7B1N6LdCAARkI48lYl4YKGkZLc4pUZ7KGBkeImcvx8BK7NdxvtXLR5ObJqxlfG97LSeqzdyj+dXCQViLaSd6ly16elCebqB/ZiF7+XnM8TdlTV0/x5yTi2BlcQ8D9ugAl1hVHFzhDVE4xABz2ssK83S78A32ofiu6tHhNh+e4WfBRCqU9yB2C4QCfGDXovdzqxaNzDdsymIwxT0wfD+1YLdLTTcvoGWYCCI+7DW1qlljNodeoeFbPMuJsT32ZL6ROu++lIH208nwZMC0m2EcWqvGI+ViN6A/XoWk2+SsPC8gbYxGotdofr2U1i1HMlWbbinoyPC3u7cPc+G5517QSqJlQ0NxFNIWMTULBcw0HdlYd46QKSyD9T7UPI63uUhkJWEMVSQBVsCbW3eNBsME5+ZGKvlfEVxMgT38oXEitFuOPDOrVfESNhEwqKavlf0hQEekZ1vLBaKqISCX+qEvZULde2yRxmJekmd1y7ul81tcd39YTu2XdTLlHcNVCWytV2dWoI5bsP8PIiqzpXZksScodaOXuF0RFNpyAbQZ8T4nN7vwhybfUC2WlqYWViX89MDdiS9XYKWOPqjm0vHi6r3cfUdwpE9UMbI8ljIn0dGTUsjjm8FnGs/FNls64ySZtraq6OEuQbqvecCBDChk601REPFUs0hpIrNQqPsDBKlPDhsjwKu8R88codu+N4+cKhxBic789hqDQBiEpqzzYgClzqk0eW5Gjh2zH/ozXTZINaM13A/biJ2OUR4N/M+Hy7PPIfIPX4MNeJYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ChnpH7Dt1KkCtGY5FVKM3oGxPeLGpKmzTjNkor/UdEmFB7cxBv+U/KHK/jzx?=
 =?us-ascii?Q?1KOA+egD6jCFFrqZLMa8iqn73xEmJhqAkXqhcc7PfY/YkPLc+olxQ6efKl6c?=
 =?us-ascii?Q?wLKWdYw5fUK02MrzGwzAKuyxUUJCkmLMnLXlho1T62UvlheHuriiWqJ4yRb3?=
 =?us-ascii?Q?kA7ZbDWrJnB0F4Vbppd9lclpUmYV9Qb9Qw1piYcaGKiv9RD58iMr6JquGnoo?=
 =?us-ascii?Q?eiUqWaQ7xufRrsOYRrRJS0Zo2yXr2n79yC9X60ybXh9tnjV2YcVXrlSD44+R?=
 =?us-ascii?Q?XQLzsAkJOqy5um/I2GN7MNGVBKEsr/wJCksuK8LA1IaGoSTgXxA/EkRto0q7?=
 =?us-ascii?Q?ebVPARzXJ1UUnHyCXLWl90dLLURP292W1srGSCHwohwnw3q+wcRJZZB79za0?=
 =?us-ascii?Q?uksuvYISuEjG3mmithyCH1LFFZ5iYdtZls5GoOf0Ac81CA1XATGlJ0u8EGU+?=
 =?us-ascii?Q?gYR/8JDsMCUp1pfXFw59Jefbw8aZjsu1wHegjPCZxY/eteT5Hw3COL6uUqoW?=
 =?us-ascii?Q?Smd4MzwxoBeZ7NU9g2lw7nGNORczXj4sKR9ueu8h+1/nSjaMxLEJk9jC9+Ao?=
 =?us-ascii?Q?XHHrQQgzoGBeAVvxJ+n52TT2S3a2XHCGu7PP7STmXlypMEsPs2fwbgF1ceJt?=
 =?us-ascii?Q?w8rnMb3fh2IcXkbEPYpjS12np5V0UdtbkKIyMzq4WosJxpCYBqpO8UQ4cI7T?=
 =?us-ascii?Q?FLX6Uf7VIuhrC1slQq0jZ/ciIFKBI/fFUAilAX7lP5oqbvnY0uweAuPzBn9l?=
 =?us-ascii?Q?qkpZFqPVzNIOElgqGKwiTSDGSa+8vwwJBlnENU43QUPPtMYV1C0WdvhtMl4M?=
 =?us-ascii?Q?ItyOLT/PnlkzohJw/uYmucth9dn3QZhJK3bWwChfOsuyBh3lYhG356xLkW69?=
 =?us-ascii?Q?a4xolHOm6qnovEKg4zxZ3gF+u1M9ZI7rT0bwuWgGw7Q9koSZvEQHxmm+s3Pb?=
 =?us-ascii?Q?FZC0SKp1o1a6z3uf2GAqKkMmbpLobFU7nRL+txC0oMyLY7GpISh51gAAFwea?=
 =?us-ascii?Q?YlLA/gBI2/GcleRTtVdsJMi19mhYetTKa0yJ8NTzKRgZjL93i8Rf/c+i3osG?=
 =?us-ascii?Q?OQEwhTXBVvGajv4CVReKl3GDB4kl/uc6EE+L1enwI8s5dbALDVzv5uv721yT?=
 =?us-ascii?Q?yRfaL++t9PRN3IVYbrdyOKusP/MFeDTRU1gXnXXP8CTfBcxs84jkjRmzFtEk?=
 =?us-ascii?Q?/08d+9nJsAF+/8gpA/5IxLtjQsLDR/mzaPxM1uMmucn+Ot47pJr5ci0Gdr07?=
 =?us-ascii?Q?Ir4RwtK3EVoIv5sBjL/Gze6wiBsqVEVoIroYgN0Y/R/FtjioTddJRiLke7aZ?=
 =?us-ascii?Q?DNniBwTNsBBzC+/s4biFDyYZnoxr80tY5P796yfw4xrWXhkPi9cj+Pejyw0K?=
 =?us-ascii?Q?EdXM4vqIr7y9tgMLVpQ7xH6nzJM0AoEykn7BjIRwqsBGZujTP5mVs6hYWz1B?=
 =?us-ascii?Q?yBKBCj35KFHa4Q9SUhmP1jm1GJ6kwvC9Eacodwd8YC6+SVK+AYsGxccMJXdE?=
 =?us-ascii?Q?8B4UAt8DMAE0gAt3ux3olhVMDZR6wgAYOLHW1638ZDDNigzfMWAONP6OyPKh?=
 =?us-ascii?Q?7oikjFT4GbfWDqDdROgB2Mbo7quzKcE2x6FxRfIS4zD0AlpBINjOp+SeeRP7?=
 =?us-ascii?Q?ClhHiU4vZlJrJYpbC3Lqs1+c89GbwKz1hd4nGCOwp9wrNhz2Xir4mNeRA1Nl?=
 =?us-ascii?Q?SbgoQkfXj/81NAmxTkLnmeCOZbZTjHfGS9+cxldNc+nRjGGBs7dPO9gkCbWO?=
 =?us-ascii?Q?Vc3POZbOhQ=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a7bf16-cc07-4390-ec26-08dea5b9e05a
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:38:08.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1hfOPp5H4fj6pF28uOvnq/+0F5FVTZ+mL9JbTxjoikc7HWKPNoHajfBNbG/bhuMR3cifpz7/ff3s0XMIqm5Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_233823_864952_9A0826E6 
X-CRM114-Status: GOOD (  10.81  )
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

The Khadas Edge 2L uses an Ampak AP6275P (BCM43752) PCIe
Wi-Fi 6 module.

Enable combphy0 and pcie0, add the Wi-Fi regulator and reset
pinctrl, and describe the PCIe Wi-Fi function so it can consume
the 32.768kHz LPO clock provided by the HYM8563 RTC.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 64 ++++++++++++++++++-
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index c85b219fe409..9cabbbbab96f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -46,16 +46,34 @@ vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
 		regulator-max-microvolt = <2000000>;
 		vin-supply = <&vcc_sys>;
 	};
+
+	vcc_wifi_reg_on: regulator-wifi-reg-on {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&wifi_reg_on>;
+		pinctrl-names = "default";
+		regulator-name = "wifi_reg_on";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_1v8_s3>;
+	};
 };
 
-&cpu_l0 {
-	cpu-supply = <&vdd_cpu_lit_s0>;
+&combphy0_ps {
+	status = "okay";
 };
 
 &cpu_b0 {
 	cpu-supply = <&vdd_cpu_big_s0>;
 };
 
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
 &i2c1 {
 	status = "okay";
 
@@ -441,6 +459,48 @@ hym8563: hym8563@51 {
 	};
 };
 
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_rst>;
+	reset-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
+	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x0 0 0 0 0>;
+		bus-range = <0x0 0xf>;
+		device_type = "pci";
+		ranges;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		wifi: wifi@0,0 {
+			compatible = "pci14e4,449d";
+			reg = <0x10000 0 0 0 0>;
+			clocks = <&hym8563>;
+			clock-names = "lpo";
+		};
+	};
+};
+
+&pinctrl {
+	pcie0 {
+		pcie0_rst: pcie0-rst {
+			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi {
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		wifi_wake_host: wifi-wake-host {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
 &sdhci {
 	bus-width = <8>;
 	no-sdio;
-- 
2.34.1


