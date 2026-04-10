Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE06F36B9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 02:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AIat2mzwx+LfeZBwOS7XTYabRfThSe+oGSHSCqNG5Y=; b=zmqHx5GW6V+Ccdj5cTFXKlDdfA
	Nl20AP/gUH2TtK6kNZyHN9VFbutXeqv0qsiOov7Aw5MrXGUU36EiRT+gag9fHgK72LUAwPyG7NU2I
	WN0IDVRHDPiqrPqTTUkhxFHexCzGr8XmGCxc8+NB2IzlpwwH2HXTxuKr8pJvxHrmMdGoqSTQDKpab
	4gz/GT9iabnMUFYBBNhYnLNQb7X5dScJJS6p2UkqFfLj7HcB59E6irPkC2l2HvVRfqoNLJ+HewIgw
	JM+l7N+qU6giGJ1aj6nDdCrgeEWJzm5Zy7oUo/cPDgWzu8uVijNEnw5acHnZGQUFKnIQppjTPE6JG
	EogU/uNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1dK-0000000BScU-13yu;
	Fri, 10 Apr 2026 02:30:10 +0000
Received: from mail-westeuropeazon11013042.outbound.protection.outlook.com ([52.101.72.42] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1dH-0000000BSaQ-3kub
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 02:30:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMJWwTk6w8NZYTY2FLkifsV0oF9OZWRtdu+7CPeEbN6igA65UvPI/0NiEYC3gmWulrA5net5edZFyO8SlKPeuXMXvaHdh27ltmxcsHebqGtOus4rx7BS8yrl5wAUo45mF+VUv7gOSKCw799cnMalHfSnWPPWtBq2qE45JI74ALuyz7pPiVFsFRF8ZoyEGEouOGV0XEoOpBZbGrWk5O/VsRX6Inij3+d+S4YpP/RkMph7IbwMMpfsGOuBfqpHLXZ+oRSXvP84JDE+dusnK0gp+3oL9Ribfiyvfe9P9vPARHQAWHFEzl+4hpPW/SFyzJMA5gXMojJRgBBl56NYeRO0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AIat2mzwx+LfeZBwOS7XTYabRfThSe+oGSHSCqNG5Y=;
 b=AweQeFg+0cJWdPRSfxbBPCTCbppJjSVGk4oqXv4Qxl7nluU7ZPnk1AO+a176WeFyq6A9Vf1PHM9SefG32QQmlP1q+BzxkTedwk2k7XXhjUFVjZzT11d6ufNgHQKE21jZAguGSqQTRbvLuDa8SMlVs+rcrB3mm8BS5SalYSsZtYdzfuEUdG+W7LGZXOQaQpn/qfAVEwADsVyGzqcF7HxNdcOsbiJN4v7bL9AO4mH1MKuHxqFO5po5621FcrcDMFS5TZjr0zTbKbJZNVWR8vWeOP82e7EujldIwYlqdmI6ggC+sxl23oMEj9Hbt6VUC/O+T/NSC3/AZ1JAsbslAFIPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AIat2mzwx+LfeZBwOS7XTYabRfThSe+oGSHSCqNG5Y=;
 b=DJO3kixAlyS6VhbOBgbGPPhaARzLnajlwFcX3QabVRYcuNIh7HwpvfpbhMb4Bif1IR6jzb4AcpMGYOi5RwfuID7RVbIvki+l7JV9GIFYeUunGdjFpyoOvTNg8cUTJ3Oa9ke7+gQeOWPFl6ZKVEmNzh3kj2d2TwqPyRvKOiOM21LSNOXJ09dKRGp437Shxy2fUUNpRIXyR7mndI/5iFbuklILEsFZxpWpYAk+9dA5ZCrH0jqoUJPOcdWz2v76qgZ2lHNbmn+7HBMN4ZgmcktzcF9sVkM+yamK+qgHEO6Z67KKVhiYsS7Sc3WT2l50OyyxKgVHPnO3kRD1gkdaBp4Bng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS5PR04MB9826.eurprd04.prod.outlook.com
 (2603:10a6:20b:673::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 02:30:05 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:30:05 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 05/12] arm: dts: imx6qdl: Add Root Port node and PERST property
Date: Fri, 10 Apr 2026 10:30:48 +0800
Message-Id: <20260410023055.2439146-6-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260410023055.2439146-1-sherry.sun@nxp.com>
References: <20260410023055.2439146-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS5PR04MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: b51b9ab5-c9d4-475a-b954-08de96a9130e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: c9A88wM+8LlcDnfbtpbGHBjsu2UziuTPgKmo98yt9XSu5En9myoyoLBD63y4iqsE1YlO6BDJeHfgybQGHT6sTSqI7j1gWKSYAv0mgsMzp//eUcJTic63Kbr9iD90hG0N7jeOPpbx7ijEeWninVIUlSQtIadNP/dkP9ZVNahs01dNNRhoP/ih1eLcvGXqJ0YOz/gUPujcdPu1bKPSkn2zfgxg2ae3kSo3lHB39WtNkP5xgk4ib/Cvah+YeBg0c4dYP0IYpcdeusjGwJqmvFbhu+cjEOLe2sOZLRFXXHmxO+6uU0vFaZvZgvWfNQiuX6ZAxeGVH559Pj3l9HMLfMp79n6kosvhRvaviz57PWbR8R6mihixEczMQLGf90QHvFzm5K9TePdHfAXzGrWa0G+XBUDYrlGgM1HEiH8KL9bVSby/Ckk03b/QZ8uxoIEUrtEcrr+8UoXHA2Jcbd8ouE9Lg17/IIM9R/a7XjI1VTtWZPiHvZTa2KYHoqTNgxWskl2i6/JzSNvNm0Dryp+wYUhaCQjRC0nH2TFy2qa6Av8Fj/G3+zCCmGO91XvXiAfCoZ4H6MOep/Rk+pujxA1pnxdMditE/z1tCJUCqAG1Ngp+AqRmtKpQ/nncCyI8wYdmmdwvAWJ5MHFD/vOVeSU4yEnrsn9NyKaktXsh8B2cNtLwnd7Yk/cn+gaXBEufFTtkqrg8HtpkrIw2Vb4CnGbrd0I8PnY2/duOgnhjBvHQzCfT0z86lETFKyIDjLhHpOrWG4tnDFlmAKSEEgzs1o8fp2oDtSMYegDlJ9w5x9YkFRaW5fTyJIyjK7W5tV49hftIw6qV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K++y618EWjwUUMEkcLb4IRHMh11OQxhxTUp7IguvmpYy0DQ7FzXbAXMxmSmG?=
 =?us-ascii?Q?lYPZqvOg/JvMH+d64Ib26cB2v0ZOD9HF6uXSuJdl6UAYawvazUSCJ8M77/Ol?=
 =?us-ascii?Q?5eKV41zVW1D60G79ro5J6R29vx8uvxPTkP7lDs3dYCc78ZcPvYUvI5gilWMH?=
 =?us-ascii?Q?tVosHGgGehWNrOKHdWldCIQ2JaWMmNcMWtz5qzh8JwvQvkhXl5AHnZsk/5l8?=
 =?us-ascii?Q?A83Vu0Qbi6Ne7z3ygilNWKNLpGaVT2pyF8fJ83US+K9IpaEIGDlmAuoo+qqs?=
 =?us-ascii?Q?hE1cVj5ty19iweQP/cD90FHGyyUfjEYt4cgCLdS1GAvnwxmRwvAdn2c5TNbo?=
 =?us-ascii?Q?dCm6Qf7dD58QYAJBA6EffrXGDC1p2dFwwGdJLjBkwmdDZkI0WELp3YnuQjxK?=
 =?us-ascii?Q?xx4pqNS6ki5ywTCWQ8hUkTiK2D5UKwBz9EY+L7srqqUmCD1WFkj+wcSPb2+o?=
 =?us-ascii?Q?mEWcHkFaMHZDfKN8lIQliByEMo3RiweIv7TYt9qy4DlZCL+hwb2XSyrY6HJa?=
 =?us-ascii?Q?bjOFklnoRf2H7uL3zZlXufauRzMHWPPOOcD1bu+FIK1GmDMHxaBcCATJb9L8?=
 =?us-ascii?Q?aWStBt82ngStPYwWQ/94GITzmjXM7Z1UROb7UUUs93VvJmcohgroSXjJDqhV?=
 =?us-ascii?Q?bJZiTI507nLZLbaS/GtT68lGAmNT788qwJd+k6MxQGq9zZ5mZPD2YUWjux2x?=
 =?us-ascii?Q?QYRJtG+mv2o5M2E3aTGjfslRkZQ3RXoS2J7AgaQSOTLRtQx2ny2Tg+dk4G7U?=
 =?us-ascii?Q?dLBxYBzRYeD2aoBXf8w6lubmF7K5EwZdSdRfsoftIJ92WFP+PHIRcjrOLRL9?=
 =?us-ascii?Q?5z/s9Y5pI1NHVQUP25+26xIwSUMsxYfdNkEb4U07pGupfdpRi0NwiKUjmc1j?=
 =?us-ascii?Q?0Ih9NLPwI6OeYaxgfiCnZwMUCHAGdlGB27fA+WvgxtPUus4LfmEpc4cfNN0A?=
 =?us-ascii?Q?UIzMmN2KteJlPkjBdsWWLVTIPZQa0s3f9v1F2BQjRD4U/NtzWIhtnnbflg4G?=
 =?us-ascii?Q?R8iWMfdzp/4VWonEpAx1jbEOmPYKsHckbSQa2kR3EzyflwRkCBZU1sTUllZU?=
 =?us-ascii?Q?LaHUHecti9+FLQW60ZS4CPijnuEuca4HUvtUR8qhKUalDc4cSheUIW+0U3PA?=
 =?us-ascii?Q?1Hbu1PQV5caE78O3txCVJ98sZO2sr+JgcsVHbOM1WRrzXPNtwOzTntkoTXo/?=
 =?us-ascii?Q?HBzqGh+vlqHnUPn/eVu+PZmgeHgElV56EQRRSR07OjcRTAT4s3nZPd3inkdm?=
 =?us-ascii?Q?su+JN+U5QOJRBPsQy+OMNT+1gbh9H6LfO5DMxUCSzsnNM7b339BQA7FmTXMP?=
 =?us-ascii?Q?+5qhdRt2NsKmr2yrn+NmHsWWEscxVi/xRcEyvN9HOG8RGKhuy8tSXFOn8KLC?=
 =?us-ascii?Q?BHCVZby+YZC+tlgts3nrMRbTmynksjiPF1PRSSHRIMiFsWVYPOSVvmNgzQqE?=
 =?us-ascii?Q?rC+46g8TwYMVKDTTSzZrQ7Fujh0YYXy+BlG9W+TV58WbI1sdU0lpKJEE8vVh?=
 =?us-ascii?Q?Nnyx+4xZLKpYLRotSjwjYl0xEDfJ7VwaCdDggeFPVB8eToPGMPBmjEthBHnx?=
 =?us-ascii?Q?4qPZOiVlrJLb0G3sReRpFRp0zOVKnGsPZu8ox4g8A/0iGrZ09yKOfdYF+Mnl?=
 =?us-ascii?Q?gWQYNkXaJFKuhVJCKNB3CSbMkrSfg4vFDGiEAnBYExkp6EVfgvNMkZvqDfo6?=
 =?us-ascii?Q?fNXE3b/VfCZf0VLFYJGKoJgzThxUVAOJb4K+fhm/8K/8xV3nAuMvrBmVvcXC?=
 =?us-ascii?Q?QSUwY4/6GA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51b9ab5-c9d4-475a-b954-08de96a9130e
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:30:04.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLGIrREex/telirvAthPr6OI3V44XFIW1PGruQttmcTg0NWRARH41jXb8Wcc6PIqOhUvUMLtMuKFF3KZVCKwvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_193007_929538_0A791324 
X-CRM114-Status: GOOD (  10.60  )
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
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi         | 11 +++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |  5 +++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index ba29720e3f72..fe9046c03ddd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -754,11 +754,16 @@ lvds0_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index 4dc2c410cf61..9438862b9927 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -302,6 +302,17 @@ pcie: pcie@1ffc000 {
 				 <&clks IMX6QDL_CLK_PCIE_REF_125M>;
 			clock-names = "pcie", "pcie_bus", "pcie_phy";
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
 
 		aips1: bus@2000000 { /* AIPS1 */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
index c5b220aeaefd..6b12cab7175f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
@@ -45,10 +45,15 @@ MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
 };
 
 &pcie {
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&max7310_c 5 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&max7310_c 5 GPIO_ACTIVE_LOW>;
+};
+
 &sata {
 	status = "okay";
 };
-- 
2.37.1


