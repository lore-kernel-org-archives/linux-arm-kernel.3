Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF52F4BB9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=; b=4sc5dsfojoq6FiDC6uB04cKeZ3
	XI0PCCOEB7OPrAdjGSj436kJ0p/OKeTn0wNEsUsDNbTiu6jPz+X8fLY/pehg32yaQ20L5IfbgcDG2
	jm1rnrdzvh0fFJX6AhFPxnYQxFENQMc0f4CTDjCA6wD2knOXGj6ZICiERRVKQ1109SfDKuwqAYA+P
	HTLR9FfXvkP8FpJ5W1YpkRF5P8InMBXFsL5GXFOrCBdsyV2Xp7T+kB/TyyR5Ckiubp5iLf1GtspIL
	ryO+0rv/ImD0AVUsj0QYscjlWBrsjNmM5aArsITTH8kXvMPVAlBl432zn6jQE413v6ecslpCBbjYq
	oUj5MjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXg-00000003qpm-28ef;
	Wed, 25 Feb 2026 10:54:56 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXd-00000003qnJ-2P59
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:54:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REbAYqqa0HmUzhIohFCDixG+5JJGmqRt6HJbpwZxNTY+qSmy7Ivy9RBf26hbfwKO5bEhPOmneAAebywAkeu8DtJcBhfIkfiX5sYN2G/JRDp4LF57fMxUlY+xFljwwkhz9R2LJzDwZcC+gb7yVJA4IAg/ykC3etwLy039FNXvEduUySXxqOp5QscJ8xCarGgeO45O5dXJFWZUVV8IvRN7YBpv7Ndo3UBC9L0i7wyzA++O0v7jUak61ow9JcqzUA5sC220Zu/ygSq+wews29oOZAdfa82Xsi6C1Fkh3mvgQ5oKwcQZYX29mUbsLou+5a1Ics2YNdBJLBt6IpPruMYRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=;
 b=P7sTL+H41heIVLRUPKSSw5ZzLwPuCN+XwFN521IXAcFOBHJcw7SKXsSfGJfEZk1XZbYpP2KIcN0AXcVrJQUw5Jc1NeQBSWHPqnbP9wIHGtMQUrlKpF+Aj9pPh23+0uKsJfJHB5b8VjQmIro3xG+Zz69lxoo9xbDymoera4UL/bBm83sgNhHHPcuHQauldLMwLUrHRDxXVVX7AVLubcYOA1Rw2puKi54p+M/rJKAAOXDS0Ox+6S+kcHrT/GGnr368le1rRVnpYmxccdDTvTSbimoSmSbOxDIgQB0d+rmIS0HlZ7DlAV9h0MrfFoXOHHWkvnVBYBb5crsZRH6a72tFQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=;
 b=eV+wbFYLhyljTmeP/15Ph9L0LoY0qQsX1ylGcvGdbQvS0LjcjyV/GL8gM1uq3BegpLZx0CC9Wij5uilTLKwwyvIbV+jYvml0ZO8MjhdWXZiY8oEoBQyObmTBvmm1QOaMTGA9YeS2JnuXAdOTKuPD54Yk2jy79UA0f9uLSwhXA5PaOfkWBFS/FKX7ZkHJsSPJWOaxojz7354gzIWOeZmC3ETtqf+PDSqStrOqJSshmGrorv2EjXm0t75hqfrbrMaNogamLPHHKM5yEJA7x96+O2SDxTK0tgkd+Apycy7L/dBhclOSRWgEKGA3u+Kg80xQzCl/nctGG1OEpTQLQopsCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB7668.eurprd04.prod.outlook.com
 (2603:10a6:20b:2dd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 10:54:50 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:54:50 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 06/12] arm: dts: imx6sx: Add Root Port node and PERST property
Date: Wed, 25 Feb 2026 18:55:17 +0800
Message-Id: <20260225105523.748775-7-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260225105523.748775-1-sherry.sun@nxp.com>
References: <20260225105523.748775-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: db37dab5-9e24-450e-ed5b-08de745c4c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: eNFrdaJlk6jvSfC1kZgLmPgUpDZaH/OaPcGJkWgx6UVCkN9sYvS3iAhdncGGj8BbTvnowyHT0D7Hgyl/woekDspHySnrC3TaU6SJ3dnZsIKz9SQ1zcSMbfvu0Mt+apd74OdaTpAMjaMMcHoCMOIKRyg2vVstIujOX6/DC04+YNNW/KMkOc2Z7NLyxDbv9YLPk1/gtx3DNx9EmN/7iK7LPftyxek48pkjygPCVvY38w0X6sJN0JeIbKgfjUsO2CfS8nNync+Nw/XCdgTOCE4IYZfNGMhsmAH3+KpjSgv6KvAkFcpyfXvNbtxbUZJbuqG93/kyTnNW1SmyJbsR3QfJSPuzhwJLbYl9NWpPiwgST4YXKpryRptVdRUtVmmYTpggq0lIvlPGD+E1Pe8Mw748zJuNad8gKCG/Hgo/hKPB7cFDgWqmxUoakH5xTgMqklr8NFEDsFg18FB3W78I7yV/sgCMHkUNYP+AiYRg8HPQBsFjT1kqzVD8bnIZBWfG4AEmJ/KKmUpE4QWpY7VCTHzF8JyfcEjjpSGgfh8QefifDl6M2tjv5kc/0DW1Xsplg+UXBN2i3Pg1YY3BcP7y9qs/doq0sODvVMYSQsweQrTZITNW5ZmxoFsYlGssK55fTGcGDd3+wC3SkTTE5cOjwrI1lnpG7bqpjuw+Y/8DAvi2Y3DtBqx9DR7PgsHwBcySwnNBU4iFWRguejFx57kVrLNVQ2TpQNLHTwaBXc1QFWEWtgB5nD9dJXxfvma8C7YqE37fmkFp/VXeyMbadRDAios0X9YiccUBFySF3sKi0syWHE3cVHUi8ZDzzG+T30AuphGs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YxXH74WXQbHV7cUap/YFudgG8tUoComdTIFyaMoxLV7xV1g2HXEeiULYC3SY?=
 =?us-ascii?Q?SCbtTwCnRU6zzmqxT3YKvqEbbpfnHxgacScwiT6AZ9BtZXzeSRz7PpNg4NJ6?=
 =?us-ascii?Q?jsG8w3vz5dbt78Xi2dqib51zYZ1k0IcEfeJ4nGiUt8u9Dh90QFQKc/J8i/Nq?=
 =?us-ascii?Q?7P30P/PkDtSXu70XrsIZ2qguJELdS4uEPVt2L2Fp1QrcDWKKHHfQLTj2f0CX?=
 =?us-ascii?Q?HLoG/Lb8fJa+01m55spqzPNAH70KCeD1YBcSqAt9hyOzo96XZjS75DGot6nY?=
 =?us-ascii?Q?WKP8HvitBjnoXha6AwKehBuDHX87Oqv23Or6WXA4Rrs4HqVuHQYRs4sb2KfL?=
 =?us-ascii?Q?ZLwOd1k+/qTTFpzN5OaNMLE8VPVmOu/OfHN+j+00p3riTcNV2HqqIgRgauXx?=
 =?us-ascii?Q?Ht2pUV0MP0JRTTUiAG3U4mOKrUxBZII6HtniU649g3EwuhmLh4ZeQXe9tz+g?=
 =?us-ascii?Q?vGl297KZiFU34F8q390qmriiD3XDiRTY14yzUrynkki+UOyGUZUXX0mll/Yu?=
 =?us-ascii?Q?3IN6tNBaY7uTP1Ak8XohTOGHVnagrvoqIvX5z+92QS0uEfuhE5XCEHpShV7T?=
 =?us-ascii?Q?xbvuLBfe3d4XJjxET1xTpW8tfX/I3b1O7HpqpWyHq2kKistvnvqBdvKedU8B?=
 =?us-ascii?Q?oeIpn8M5yt9e8F+t2rNPd4SVstB49pk5EjYhnHyxkN/gqrLz5MQUtIGBuOt6?=
 =?us-ascii?Q?1zBM0R5hsV1RMo7iYunNPF1tHyQ7bjQIrdZCQHgQIYZtt1h00l63UjNERJXr?=
 =?us-ascii?Q?yMK9bHhhrkm7PYxULCwl9SUIZnlG0ViES7fFSKLj0Pluc7tsOUBX1ClbOfam?=
 =?us-ascii?Q?w34EfcRRPa342ToISk5GBDPLLakdF1uc5HCWP2KY+BirgOhqPTd8RHE2qofT?=
 =?us-ascii?Q?KwkLlJlXgim+lozX4o1fTSBGVAUvdAUB9Eq8rFfQrzn7cI5q7dunMKsgisGf?=
 =?us-ascii?Q?zgiP6s8XVBAipwVNYZnVPUYhfLrhdJpwb6j6ALyh0xSbQGWVqJ2swxGWB+gy?=
 =?us-ascii?Q?J7CX0txPbcztorqXw0B60vCbpyr8JCwsTDUZUdzATx7lrv1zGkcxKU3fv0jI?=
 =?us-ascii?Q?6p7lnUQU+QCupC+8kuIyyieb1YRGLh75ejYHrCQVky8hPYhpGvHKWC84gz6d?=
 =?us-ascii?Q?beDdDs6XlunAATkPl6Jshb6fVrgFm5kXoZ0DcmynoZ7u7LqG/xDJRdwz+dWo?=
 =?us-ascii?Q?3kkGBIBjeedI+u4QOuRUG2aBCTz0dx0eqjOzGWl+rLV7GAq5uDBiLdu4TxBg?=
 =?us-ascii?Q?qigrTnWhkbRzkflalRMuwsqJDCLi63HQfVwhC6O4hKLMtdLgEY2E/XgpYZhw?=
 =?us-ascii?Q?LH9k48OvA4AhRJyoArKDuKCAT5wLZEFEejcQTTuKAMt4yyzAi0trG+eBgKas?=
 =?us-ascii?Q?QRgocxdHA6AReOAaiGc//6BfeJZB11KMxpSOVgis3ZnuhRZuEDDUV5YlMNSF?=
 =?us-ascii?Q?FFr31xpwH8BtKt64/sR+XB0pwwz1q0DOWpmbFREeLPhFHGpa1c8ukLZh9Apx?=
 =?us-ascii?Q?LZ/wHPfOxm3yxf4kdaBTIH89EBJN2k8zmxiLWSsd9kM7cnbCw0KhUMunnE3j?=
 =?us-ascii?Q?IVjDF+RxCw/8bspzc7Nu3MeW48bb4GpDZF0Y3umEi6HIflErb4m8h/OCMk2/?=
 =?us-ascii?Q?6q4+UNQQaRFeTvWdZ4cNjJmaebm2IWcXZtqlMQFN3lSn4msYMYwj72BQX9xM?=
 =?us-ascii?Q?MINFHtvNUTrb/8GZQmfRoM/dnHNYxrmmGWXEdTS76BlFkZ5RekM+h3KpXazi?=
 =?us-ascii?Q?7SBK/aitNQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db37dab5-9e24-450e-ed5b-08de745c4c84
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:54:50.4746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWyiDr6IoJ7EpHLX/v7HUjTuN3Hj1oWOcOz8CHa1UYhh91wLXavxhqVLgV/YlZmgvLfgqFr7J/eqM83xaidlyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_025454_832118_C8D3F037 
X-CRM114-Status: GOOD (  10.83  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi     | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 3e238d8118fa..338de4d144b2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -282,11 +282,16 @@ codec: wm8962@1a {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_gpio>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+};
+
 &lcdif1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcd>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index 1426f357d474..d42363cb5105 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -1470,6 +1470,17 @@ pcie: pcie@8ffc000 {
 			power-domains = <&pd_disp>, <&pd_pci>;
 			power-domain-names = "pcie", "pcie_phy";
 			status = "disabled";
+
+			pcie_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 	};
 };
-- 
2.37.1


