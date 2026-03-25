Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C22FEA806
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 05:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NTl/rOZ9unOnpP+4W4PULEcVTlx4HeRq2L3DbAz4UA=; b=rNuJ7Bl3I15yGo3w/hpCG72JIc
	VLc/BAKNQj6n0kNpI+XIFto00Z+bZ3CWVaFwKry7Q1mhZe9C68R+wHUD70sFATDVJOkH4DRBM+23V
	dOeAa2TwDzsQ3P5FPvT/tRPeQXhF/Fxub646SW5sDV9/ptoS5oNsSq/bTP3m0uJJQs5iUKwhKO/HA
	/un1BqBbDxHqd6d4r8hbb6aT8eGMNFg9r/BM4WJgF7rbKpje7MZ7Jdqxccbk0UETpgBa33LL3ItB0
	FtSDwA+vv6/bJSRwAw3FMCUsKBOgo0dmRIIcda/vdYNuQSwkkDQHWux4pDjuCguMVpQIVsUPkOFSL
	H+5uaqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H76-00000002jrz-3YIu;
	Wed, 25 Mar 2026 05:49:08 +0000
Received: from mail-japaneastazon11022083.outbound.protection.outlook.com ([52.101.126.83] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H70-00000002joA-3nmA;
	Wed, 25 Mar 2026 05:49:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJVp9mteP3A3iwLL9ikinQ+lVB1CUSoFVFwdPjJRKrFnSbJcbn5+pSu87XI51Xe5HXqPEcQNpCI5QjK4ravXab4ug6xotbl3z74Pg/AnfPKkeYbYCCIayFAPPf68ojxXQjif0UrLT7NBicB1eTNiFUr1sR3zTZa009lQ7Z/9Yf7zlbDh/wzczvBSnslhKd7pzn00pL7hr8ILJm68vKsGd4Jj4vR2rTJlVXKJ2Vaor5Rq3LSrMPxJbFXZry+SVf4AbPWgdjUFeT1I7EaOSY/JXwqWoRnnYB3ihZGxnoDKT7wKL7058qbVwjQnh0G7ZyPGYhyoR5Sv9j4naqhlBlbZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NTl/rOZ9unOnpP+4W4PULEcVTlx4HeRq2L3DbAz4UA=;
 b=se5okButIyM+7Qzr8qHNHFlVqr0eU+4rQsybMhRdNlhtV5OFxobzICE/SAnBq9OB1NKq/7FYQZXy2yDU0fJZNYBusnZYUmNF9Z+Z6rps8d134g6RsyEer8fE0X42I/kPdUPP/W65DSc6iHaep6wq8x4NubgTr4w0r2oYV/JR6C4JooT+v/cBxIVDZSchYvTaUqEBGE4EceVj3XXexqd/7h/tTL8GN2uqyJk8VFEWvPd91TVegI5QuBCcNogFO9G3nEbVnwgPVkAM28t+HSC8rmRiOYikPuOu43676uHE8B8sSJAyB6B848Y+l4+tdaK2hv5GId0n1erMEg0vpHNbZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by TY0PR03MB6678.apcprd03.prod.outlook.com (2603:1096:400:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 05:48:59 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 05:48:59 +0000
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
Subject: [PATCH 2/6] arm64: dts: rockchip: Add AP6275P wireless support for Khadas Edge 2L
Date: Wed, 25 Mar 2026 13:46:10 +0800
Message-Id: <20260325054614.1497147-3-gray.huang@wesion.com>
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
X-MS-Office365-Filtering-Correlation-Id: 22572864-a0be-4943-6cc8-08de8a3235be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|366016|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: XGL4jfsQbyOuY8LR81kXxtfh1muSRN8CL2xKu3DOJsOUaaRffTyJnm79L5HtTVtFTnEjU7hjGsGsv6JEIhKEOiq0bbYBqGHfMfAWzTP2AoQYyfdUPIXt+5SsFCJ/dzoq07CeRyLX6Akx7oqO/PbFL7PXFWgvAmaJGPIUpYpsJ5HYPOdxBmq5fziZ2bIB3eYOAgMPdKppbIoSlVOLbHcpOc2vyM6uaewFRKYJFq+9vP8Rt9EwdzS+Xn8ZYpy8azOwiEMPKr9CWUflUKSuVnDSwEufuFKgAXA0heDqvspgCGgmnTaiuQq1+NgpzVW9MOLlW6M3txbYxVhQo5b7Ogp6SK8VwgnySrR4xfr3f9EK+CQLGWDxcLDf4+0wNR53iXTH6Smf6cfgaAAUTArux0pWypIAoHY9/cxGXONZeF7plPvQHTzb17CMbq3ulKibRqBPU01eFMDP5F1rodQZdLfSYcuUTup28QtUyJlYYj3ulbR6WKkKX202eS9uK0PUVragUsK8HfboFN635mvjFjVWLQhldbr33opRzmAmOObsxKHcg/2T+F4FW8GGlKDCYU8MV+VH/5vy65zyiMwPTy05QZsNANeKunmXlnOCAXh+XzJc/fbo6d0kw8MWajLtieSgryj4fQJzf5c4xiLdA7++H4cJQlQesWxRkrfrrNbUrJ7Lma50TEs5MZUCPZZ6dBS7cKkJM9ehjjPyQAgHSuxFuQnYfSP7f+MhqyhWHJUgRUPd5c0lcBiJmNS30vuKV6DCJaK5MY6P2SuEiBA8qubXOZ3drjFOX9gSHZptwZ20zWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aRmtzCCknVS9IR3X/a1R6c7DbqVkMnouj2Cgx//pN9SGzvf1OSYlQnSLMq16?=
 =?us-ascii?Q?jarPsy9IqXdITMT+szhV6BfGUNbVCoPnZ4XlrGuQO1p05ACRX9PhwwMhU4CV?=
 =?us-ascii?Q?nXKj0y0+jOVpZEMu95Ups3B6/v7LgRxd3INnzWn7ZEOtHJjAbEN9zaGl9/kx?=
 =?us-ascii?Q?/gNXm1TDEedfm5q+R+1oNZfSErv1oohAPJAa4BBVGTt7pFzmODLgn5v8b8uq?=
 =?us-ascii?Q?PUf+JKMYhdth+lGFBcLlGqA1slgF4OXdenQqgO3vSx7FBcc4humpMEKRxP1c?=
 =?us-ascii?Q?Gp3/HotiNh6ROW9YpQS5/zZG6WsISJfSbcamO882r8jh7DEhDkXu3C8KHKb3?=
 =?us-ascii?Q?+mn12zOyT82UUO1ev8W9MrNkUoCg1EGX+D9gRTRWHn3F8OMkDz+KSIgNyMBW?=
 =?us-ascii?Q?kOJcI8SjGD9yXCI/lFlHtHTW1MtP14Xxr9kz0ofvuy6V14h6Oge/FYQton7K?=
 =?us-ascii?Q?yeLd1qPG6KDLOOqD03+1fayRRqyJFdmCa97bvua+af99K+C2FpAtQn1rdkO+?=
 =?us-ascii?Q?OvujaafrRPXqLuZQ8bGRJBIQ/n0T/yWth2T+yN3VGZiGE946KO7oFSIrOZpW?=
 =?us-ascii?Q?UR7UAj2n5uYSyjV11ChwfkZWKOOKfn/7InTdpkfTKYjY4VKs/5023f+y5pFw?=
 =?us-ascii?Q?z5hvMzQoA74AV/Zm7ciSS9t1LAYswBELWATWPXIFBp0pWS+C5/ZFZDCm/73f?=
 =?us-ascii?Q?xUpvAjPhHoAhoMQgSTLyDWv/xzNldYxpJszXNRY2tyeXW1Lu2RHjhSZCAPJy?=
 =?us-ascii?Q?SMi7Y22Kq//HVMHGt5MwbutA9Xwm188RHUaDcItQwcf1Om1hdxRu6UYSXQ1p?=
 =?us-ascii?Q?Mxddng5sXgqF+KCd6Q6ACrsMYt+Fq+9VFrsutU4EeA8CpgZSqXsFWkCnPCU4?=
 =?us-ascii?Q?jpjqUDKvEAa1EPQKDzFQn9KdUyIzZE62ORKkCoA/SfomaHN8AmFvubnwJZP7?=
 =?us-ascii?Q?x3sKVyvH5ekDoCZkbTgcOHyiezIa2SnwloHmm3AN89CEV6hlU8l+GwohidJl?=
 =?us-ascii?Q?fEncWxywnH2vPa6gVgGgFlYpjiiKfnV6P2bXGQBGat7n5h4xVwZQeU0vT8bG?=
 =?us-ascii?Q?gD6A0YxtIDReyeU897B/nA/9rnFF88ziUDfkGb20JcK4e5CYC8z/fz+YYK5Z?=
 =?us-ascii?Q?npxAiq1UIRGtq2hOyL4qDThPKnYcCpDA7icNwFKhx1Ir5CPM3DEO7FE5NwyX?=
 =?us-ascii?Q?pg5+HeYmjhFsf4KwvK0/M3joms7VjdKzaG1HjzkQjFYGzC5nasjmGYS1Ik6y?=
 =?us-ascii?Q?p+EHjBopQnnrIigt051XkcpeEYlAeEH7w/Tknp7BVJNymhuRnJiQLaJsm/H7?=
 =?us-ascii?Q?D5svYbaIt9KUqr8n7SySYpJ3SB4sblS/ZnTVzg2mxMqnn/d1XZdQctZ2GjDE?=
 =?us-ascii?Q?pXJi1XkhA8vU8h9IFyiKhI1kIkO2f6UNnxwXvpGhIlfSx9jbrdaRaj9fQPqX?=
 =?us-ascii?Q?zGecIL7fbCjfRhUC7mWuW4/x4lZx0bdUJNrywoumFH6XAhw3xgzoafkOB+1p?=
 =?us-ascii?Q?tSexeUK2EI+06CV/A/2evxjP8UI/lAgqajiNSd6ZseEcz9GmG/1RSqbrq0JF?=
 =?us-ascii?Q?cnV37YWocmYdkcp0XLg8UbP94u30Ufzc16y/U/yoe2EKFsfIzzsV0X+AqFys?=
 =?us-ascii?Q?SaCBBduOr6z8LAsaXx09ekyGVc7wc1fDK/sXZ17ysUlREtKIlVYL3WwxIqRI?=
 =?us-ascii?Q?CVuVThjR9uSUZnElYzDGlBvGTHcBwWCOPKXUy1RMa+oB2ohI6gq9qNbjOPTT?=
 =?us-ascii?Q?u5mM96zNQA=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22572864-a0be-4943-6cc8-08de8a3235be
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 05:48:58.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqGN1ggcWIskYrfdU1KVkER6PraayOhGQv8p9DpYQ0pafEbq3Y9AV/KDrvOXuCLFQCUYYtw83cfuvXrh0TQ+aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_224902_952949_E3092F06 
X-CRM114-Status: GOOD (  11.46  )
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

The Khadas Edge 2L board uses the Ampak AP6275P (BCM43752) PCIe
Wi-Fi 6 module.

Enable the pcie0 controller and add the Wi-Fi module as its child
node. Additionally, enable the HYM8563 RTC to provide the 32.768kHz
LPO clock required by the Wi-Fi module, along with the necessary
CombPHY and fixed regulator.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 71 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index 5781deae00d9..09cb0f0d6dcf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -47,7 +47,19 @@ vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
 		vin-supply = <&vcc_sys>;
 	};
 
-
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
 
 &cpu_l0 {
@@ -431,6 +443,63 @@ regulator-state-mem {
 	};
 };
 
+&combphy0_ps {
+	status = "okay";
+};
+
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
+&i2c2 {
+	status = "okay";
+
+	hym8563: hym8563@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		wakeup-source;
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
 
 &sdhci {
 	bus-width = <8>;
-- 
2.34.1


