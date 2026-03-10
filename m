Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F274FCC9A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 02:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=; b=HbAzVGdQ4Fq6tLE+3b5DWLT+wK
	TqmGYLr9TKq3+mcp2V/yIIYM6RwFbg6ZOT6/pfHW+3APOFJc92iWTouMw7YfWpnFC1gAaO2EI0KTp
	ZkJuofkqlrSmGo7iJJMUUNbh+u0BZ+IBIqhRcmNFLpCx/Iw8rLLG2kp9aIn1Hm8fGHC+SmIrx8RpY
	aatdQ9Kj7jFeIcsGiGZX2io8k/i1glXgBv7mBkk31t5VkzrMddoZFxx5KBpWQPJZg+pZdBTzm9JLu
	zss9vnSQoRtDHt5m45Tmp4TVMCsXiYdahtrg/eEDeWRkFvNugW0f/uOoZ73OCt7Izwp4iWxvZ2uAb
	5oYziL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmXe-00000008YPL-2HuN;
	Tue, 10 Mar 2026 02:09:50 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmXb-00000008YOx-2PN4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 02:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoUbJ447+peJHtPeYZqYUyH4HeAo6iw8qkVjyDqoBTofNw0fTmrTfZOurANpINPPVay71B76ZGpwnzUpnCx0teuJj44tT09StwH+TpM8h3BqVtDS4gK06S1c98SEpOdW7bouFJRurdz8orP7MXdhR7lGINVaw53f9t4NbQkvQ331ONG4fryAcjA1FlUXAnnkEArtQNtrXrQf0qgRAex9omdFGRgUWPGdccXrUUjh+AeTaS/8e9ja40tWmFE+Klv2ee57D+Y2y55n0rLoCTZSFKCKQaXae1sVJssazjC0Sbt8EDliDXW5p1tYLBiPfcdwkva+qOLMpv+zApk7WAPlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=;
 b=Vhg2+VcgL5y9YuRUdAGDLUIO3AEcAWmEqOvfKnOEEgV3mgWOgYr7XmDwOfH1sN163yBiq/HMqgZhohIOehI/IjxACEHkLZoR2xyhong5Gtw4N0QPMSoK/1P+ASI6a6g3MHp53Rf8/HApHpTivCVv38GFUnVow2Ugmy4+/bg2RfP1R0tGkNqi1+mXCpb0CRMwr6jV/dAEOd8bFwqK0dzVx6tjZLNZATzd+Im/AOGCF/KsrBj9KPHod3NMkLvk+4iTx3jeopcGZgIcoD4oeqq3IoZObbGVNwLiK6+gNKXdjWB+RiJl7rYnTrBMT3LjRKcMoTk2mGXkw8tPtvzm3ik2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=;
 b=KGG/MoWhVZIhtY8AJRzF2Ko+EYKFVM+pxipmU209wrmjQmH3xS6O2YE3h54uirwJ1TQgsxmJtiJJiQHwBOOKl88zu7iiZwlv8zAHS5ZZjuRQFBn1vX89uO+hM1N1zmnFGNDvHEnYMgGq+fNioHK2S0kVbmz3ZyX6zws4zxOQ4kQ++voBXb1YyloO3vtLcX8BzmREaQwpz3s+NxM4OYfm8VCpyuIo7Y6i8STUuHR1bR0Hob9Jwr7kv3R3hY9/tKVN6QwV3nc+wK7E2rRhSrzDOUZkQMq2Vb72RV+u3IUSwhLaaYiljM1qYwWeih2U9k9/5Vid+WnwHHmepIqdh6ru4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB8889.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 01:53:49 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 01:53:49 +0000
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
Subject: [PATCH V7 07/13] arm: dts: imx6sx: Add Root Port node and PERST property
Date: Tue, 10 Mar 2026 09:54:20 +0800
Message-Id: <20260310015426.365675-8-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260310015426.365675-1-sherry.sun@nxp.com>
References: <20260310015426.365675-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:54::20) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 681193ef-734f-4841-dddd-08de7e47dff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: nNTlHE6RW2dYZZiILsz7++w2ZZHih5LJeFxqwSaV04SVLwCue8AR9XIugeSzESh1aWC/f3mmEX2zFKxf3n0MJRkeQ+FqyqbgOjBNjYrRLETfDe663h2GNm0e3aXqNWNyvUmayU2IeTE3sa74vcgw/G8RxtDZep8Qjd5m7/Ov0dmBK4sXBtmUsO2DgtvZNRI67XvX2YL/0H08G1sBPf7decSVqTQYnOLZar1jIJWKxfEdFUEk9A+A6/wBMwJUPdqtGLBKd5i4TekvP6bdYf/rsobgAyBvhk6fB5LjDxbzJkoz+n+nS4TGqaMqAJbU1MMJNH/Der5SdZiK04OzhXmXE7adhCRIHC8RZy6CrNLRNwkJm0Rc3oh3Qs30rE5ufHujeP4KZZPy6L1hQ/U7Qx34oof+pWc2Ds+onjpkjKWOLNl6QWjR4p874DezLi7n6WlK0+erGZsfOXwAP757CsgVeIVnQJiUrb/FOgdKudKLYH/RBEs+Ea9xmaPar1xA2JX08P2JSBJ0wrhsq8xlAwTah9jLyEbP/khBL9CkEwVsiD+qSyaEf+frlA3bfJBovP3sZ8POpi/u7NZ/cqZzQScgZbWFLEI0n+hMQlkbFNMBfb5cJk/i+A0dANYIYhnnEdH+Jk586ZiCCKVrveHBmKYUOE7zeSZ8NoRKL/KsxGog7iClCU/HzJE/bMRZXIOxF7m5h9a0pEXG1dg/C6dkgNWgFDgzoMSD9I+HDRMKNhld18k1m/Ibnz4H5BQcdFXx3f0VnliS/b5HYzpSWo5XCOlwE9u7q9fTsCuhtMbwu9n4rsaNrvgvKEee7+SLnPwubGG4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EyLils1aK7tUqw8/EITLxIv8HjaRw9qm53J4SH2R6ODG9RHfzRUbTIwk2449?=
 =?us-ascii?Q?kUtvbz28CySkTpldpQRwm2q/dlQFoWo2bfzEt9Xy23OO5gcPJQWHcDDsXnV3?=
 =?us-ascii?Q?2lqKAxo2S3CB1wPfGLgeEP6+6dKg5m2gXTCMtBJiyGlKYd+Gac/aVI/rwHK6?=
 =?us-ascii?Q?M/m0/GIhSVF9wTeZ0upbsWmvULTb54k+wRcoXwHQStGH256hU5ShyG/DYekS?=
 =?us-ascii?Q?m7yUM54fxLsqrkPyaX2LUk+3nG0OuPAKgs10QfmOrxAvHdS7FusxD5QpfxLH?=
 =?us-ascii?Q?tCS5QG/hS8rDiC1XDArHpPtqUxQJoBqpZOHh6PhSzbDchNOyzK2EPWUnSrC5?=
 =?us-ascii?Q?DVQCdAHK6MJyaPdTlJgsGZHCuumdeh9PPg8nmDRoTlp+aE1PIKAA6ki+imNR?=
 =?us-ascii?Q?FUZPdkdncjtgCdUGBhxKTG8H3AFuLk8na0AAxKTTYDPVxtrtQejlxxadgEnn?=
 =?us-ascii?Q?8yfpNj0QJiF0161uI7nsLmet0zyqvQKJ7HLS6aktEQn9QhoK6z9IKC+PkI9Y?=
 =?us-ascii?Q?AuHqkkd1psYv6g+D/JuaVfuz7Qhv2h+jkXBPHIztyUYe6tsa6rGMmCC9df2K?=
 =?us-ascii?Q?SpOVZVWtA8WRxxmlq1f0wFMyLtP0PJe5uaOVqHSn5s3upwcCHQdLkPPQkwHE?=
 =?us-ascii?Q?n81H8FMtyBTwyeujUkVPz2JkQW/WQ6CdSXzcyJ+oDUUsjny8jjzuopyND4JL?=
 =?us-ascii?Q?dgMlZfUCpTskzBRcidAEIP6iqsaOHFv61dFaK1dYqCbwQltXvmOqffOXyvmh?=
 =?us-ascii?Q?93OZXDx9JfmKj8lyolrfgdaVWT8huwIXoU5MVl1hd37UuN2zt1+Nyk/+ekSn?=
 =?us-ascii?Q?1kH/XOJo8YvwgXP5pb6EG0i3B7ttCxAamK4/GeJ/U3NuhY7qRMRWsaoJBhfR?=
 =?us-ascii?Q?CjVgSu0e6DOyqZsDG1z4fKACHWZLdGybW7/EEugAWznBiW4L9qIH2UvbWT7a?=
 =?us-ascii?Q?zvYkop1lIP2ubuI8iiw35Rmc934wVnQ2XS1F+RUVTuyMSQggAaTBaD2VCaTg?=
 =?us-ascii?Q?oXNES3tCXGI53c+bmqursEey+woZtILS9EUBgnIKirhZ0zdRgtNiVY3BAalY?=
 =?us-ascii?Q?oJ5agGY5knWE88R0BTN0RCNoRRbHocM36pHPkPeNjr6W6KZiH0YObr/uuJnC?=
 =?us-ascii?Q?KWPBknbrKkyJTma8HGrCCrXyvcn8nIWHNHQuXFZTjnv4m2olv6wG33G7Ml2G?=
 =?us-ascii?Q?6PTK636+dvfJoJBlTVyA09B948+qNdt+OevXY/UeXyeTblr0kE/kGDEP5Bdw?=
 =?us-ascii?Q?XTzeeTV5PFS+m1FZOjqt3kArG9Yd+wmsDgCit0v5wFIPkZBDsK8Qk2siNC/B?=
 =?us-ascii?Q?X5LWO1DGx+hloH2pJC9a+S2o4jKnWbe2L1FoVUpQsCXpt916Cd/y5q5d7qPL?=
 =?us-ascii?Q?6WDQMXU0fMhoBf7jg+aZAf5Oy6Slbyd0/dv8mmC9kOHd/IfreN19ktGhyQvw?=
 =?us-ascii?Q?Gi8x47WtmES2WuMPlB9pcUJyLGc6zgKxObhDAlBiANHGu1X3kO/DI0/L11E8?=
 =?us-ascii?Q?bW5NPmFYlIjTewbqhaYTlYnDvfMBDRxdI8TD9yfM2ylZCMfDf+oSvUxnBqKW?=
 =?us-ascii?Q?ECJu4ljSMwtX+MtCJf6IoSKx3mdOUM0vdsEVDiJzzZ/hvc0oOx47BoP7jKla?=
 =?us-ascii?Q?lrY744nkRVZOPnWnSqvp0bNgIywcU8ZIhy/gKJiB4bT3Yp+D/7eXc7Nz/25x?=
 =?us-ascii?Q?o+4Ev/qi49AkS9vQXhqe3qbrWkMS6Hwjh2hB1A6DA4qf7Nsh22mqVmWeKqa8?=
 =?us-ascii?Q?6JSMQlEZIQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681193ef-734f-4841-dddd-08de7e47dff7
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:53:49.9125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dS4TKl0Qv0zPC+WY68pBNFuUaoydnsA4PnVzBuBNoiW7shMvjy3iO0lZ43Bi4HnLydl7CpdSWz8V48VjYHbNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_190947_638229_DE5A1B2C 
X-CRM114-Status: GOOD (  10.72  )
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


