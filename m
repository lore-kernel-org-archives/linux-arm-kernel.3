Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E32FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVpCYZtdIzK8a150FMAUG/RAikDaE31UtW6Y0pnQGWo=; b=r1RKxsl/ScFVgiRnKjd97Ht7X5
	Pe6Udi3mS3+e1wCHyXXfJdgIpjlJfDa9J6a2kcTIAXy1Yw6R4JZMpaEVW0aqUaohivk79wvqZnKbt
	Y7K2petQoAXmvRgR8E0H9iKuGEtSEqxgs9lqx9BHmI9MEdHKu/55Atw23cBccIruE4rxO3B0Z8rtF
	pMDZGP8fc2Aw1VRF6EuEJlOAA76COKmG3SH3/pRXCDhm/dKkfo/xv/7Sg93iiRnH2kyXAS5lnSTtF
	CZeTtYnpBKlRSyA6qQvT9cUwzdmzuyhDxqo5RuGi1hKn6yxQs+UTloyVGi0KC9Rks9+9t2eNbHavc
	LoInHR2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHHM-0000000GRZ3-1pKs;
	Mon, 27 Apr 2026 08:25:20 +0000
Received: from mail-westeuropeazon11010015.outbound.protection.outlook.com ([52.101.69.15] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHHG-0000000GRVC-3YTA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:25:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqpsnxIgOxJ9D274p1PNyr9b9ZFQMsiBeDd8Gj0zihaZMuM5CKLjEi5+vgxxSwkwPhhpbs80Vo/KDabzTCqglBK06bS1uqvADhIC4sxkzRsQW8tr8aGIAA81J4kYWdmG3duxqjkQ3bJ0+PPkpSycz2FOIhfp57lTut7Vy+dPlk96TPufrwF9LGEVDw/iAyORQ6se3x6PwOGUzgx2aANMcwqjsWhi7j5W/+iM1Ejc7wqmfUIZjGYB9UoVJM//jaJT5OP3oTNfZjBApI+/4EXHeuMlEeKX60KWxXtSkIsob5aku5DJ6Z8vP8Ayc7APTS02JrCouZMx3tRBYgC6MCCOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVpCYZtdIzK8a150FMAUG/RAikDaE31UtW6Y0pnQGWo=;
 b=BZ/5psMspRJ/vKn/k8kLwg3iLYbLWHNSNgZ9oRpY9YGBgvS7bFsIBNWGVzWmjnhx9JTluxAcsYkDkzMjIFr/guev/kt68iIP8TcY2eSgMIN1O2HZfZE8YldsLbHzzn1vWcYOfO1eM0kGlDyPtDWy3EpDOEMbDgGr40V4NjDwMNxSs+487iLj+ENnRAZ4bWkgqqrFgmAxr1o24o7E4oEgCPCyT18NiXCATJnsPsTFV2Y5q4zjkrR/OZZBFQ1HAng6Zs8EQzkLdxRiGoLBbU6EDNr1dSZXRV3xdBnih0lbB7zBsw6x9gIavodc30eQdIxgfcP5FhQl/I3GzRVWLSIzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVpCYZtdIzK8a150FMAUG/RAikDaE31UtW6Y0pnQGWo=;
 b=UjejhNIspykk53pbwR22VdaZpWfvvyNEKN2+VV5QZj+jClVT4a+AJ/fW2dZog7rx/d9gyIrkoOnMVPADvDPHZ0AkeDn1iLWeJNGPnG6HTO1DTW33VF5jaqeziKELEvYHBLL3JlOxdIBtx4f0dOHjWyObHuZIkOx+OTiZkjr8anZJkd7ftIOq/Jci2cuzag740Bk1eXW7zvs/ya4bymyI5zMMKUXMVBepu3XSmCAjmwpIEWxOGk2TeQ8hloSYqpc44WXG2cgV65fAm5492au9nF1Nh4xFH2X2ez0w9fNFqEJ2xwlS8rqs+yB9d4RRoUXBQR0pRfGVG/tW6jvpKafrYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10806.eurprd04.prod.outlook.com (2603:10a6:800:262::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:25:08 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 08:25:07 +0000
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
Subject: [PATCH v2 2/6] arm64: dts: imx8mp: switch usb controller to flattened model
Date: Mon, 27 Apr 2026 16:27:24 +0800
Message-Id: <20260427082728.3641872-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427082728.3641872-1-xu.yang_2@nxp.com>
References: <20260427082728.3641872-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10806:EE_
X-MS-Office365-Filtering-Correlation-Id: ea64f0f9-3a20-48b6-8e12-08dea4367db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 7BFM+KafUWLdehXHFoQ0HHlk6SfinVKL/iRt+JGS9tzKf/qpQbnA9w0MDhcGb9Sv6RNxrrOHnAXUV2AW7I7SfwJdt1b0ZCUdoMRxpCVQE1BS0evuOxba2E+tIlxl/MhqrUlEdeponZf4sFbs4mNBFbWSXmrRDal2okrYDHJd619uk78MewEp2p6KtWRk6NzxUvsSnUbNAp+84aSWjtnJ2V1Yqj1AQymtbmL6LMv6iobfKRAbGt0SGgEDZRlAAinQ4QWUQ17TptHDkEwI/KVeA3ainnl1gYewngcUzpDR0QintrUogo06p/Ia7h7ecHwHDku6/tY4PNkd9NzYbbor52cB/0ii1lsdxftJqKZEC8JdcTMGW+MTK7YaMdk9IFje0BVVPFs1rSJuACAFq5X88gAr6xik8cr6WgQuyvdZ6D+5TKivXb/PCYIzOAX0PKBBpJ9LdHRkIEC/jpH8O1QCIQHvyDg7xUhw+Xeu7j7QmKJRUC/p9uwtsBsYoi3qj/z9Fs0Q8RpIvNEVU/NF+5VM2w39nSjaJQeC5DHjPcaH9X3t9wVixw2ZGVnDMcPBIHiNWfzvwGkiDhiNpXkNnnUS2WJ5L4G1q4i252Ys4/QSZiyLQTbNj+UE0/NUiQo3QUO/1LJ+X3RTXUkyraq89Mhg8mmjI87kGCEzSUyXLmW6DCYcrmfnBSOSkMoGFcDwdOo7Vqotz/nTltrWtukEfpSPedCH1p6LHvDqpw3mxL8fStDz1k43WLLd0MA7lWZlWDOmqt+qH6J1rnGsAW7r6S3hgm0VuH9/OORMejWPTDc31tw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4tIVufLjtnzkZ0obfhyaYA3PWNZXW65B9PsualiE+xYsyYPkNCFAyHnrMaBS?=
 =?us-ascii?Q?TCVNGOW/7/uSMkod13feNNHE4aK0Azx4qAV1Nm4eV/fse8Kzo1pcVy97sOE7?=
 =?us-ascii?Q?aO94Rl68IuXN7Go6m2dyiD02Ixi+FdrkkVzjpnkInGcyWcgP3AlTbfiahd4t?=
 =?us-ascii?Q?dbLxEBJN5iWcpgTczZU6bsDq8t5Sm1MTeQ2fdhCJUFRXwp8Sdj19CZKoxXy4?=
 =?us-ascii?Q?Y4uiTNMXH9GFrZLuDg9oR9l5WHSg1TS1hXdx0k8MXYTUWNkP5cQF4HQt9nwO?=
 =?us-ascii?Q?qCVbi4DVFUfKe9rcnTIPPfqdwHMuF54EIZzIGpg9g44YoK32Ny8aE6/KV6sl?=
 =?us-ascii?Q?Va4BeDxrgKupI+X6eyCQU+1BxlQQyg8Wsx0MCvHDZi0W1EwFJ5gQLDnLjf/i?=
 =?us-ascii?Q?SxL+ZDXDuqKetgODUnSyuWD3A5R4mYO6pY/eqUWrW4/SNzJBWBOnQY8ZMX4r?=
 =?us-ascii?Q?at1sTC/0qq89UQGFSygOI4sqGDEBG1eBHruJ5FfoKGcdxKPtURDZ6ojczIjT?=
 =?us-ascii?Q?jiF89OKbQ9u7yXTTsgYm1RuAqVV1Y4tJTQecw4dZ7rIk57dppwttGLnIe+uY?=
 =?us-ascii?Q?3WyJv3ZTK02PDIjpkjUw1BdmRkVpuiT9Rg78ibULYcfekL5KoXIQbZpVPv5D?=
 =?us-ascii?Q?e+Wcp1vpHBBAKL4QIX3yCd3Ln+4sj3FY06HxPNeO68p9AkIGBojdca/81ul/?=
 =?us-ascii?Q?4a271eNklEhXusDO/aXRp6KLViFitDFX0jpKv81D9CQ3gAGgfzYvM438zKiT?=
 =?us-ascii?Q?gYESufDZfv9VbppCEUTG//m4TGgvl3HEw9faAH3wO1GbcfP4aOcDvUJeAI/o?=
 =?us-ascii?Q?C4qGst1enJFluskLajYp/9Jpx4b8mpRb7AxJPelK9OGfgl0EIL+dYfcM7S5B?=
 =?us-ascii?Q?HXPMUrkSauswiVWPgPVSeBV97kxs8F884nM1/T+VhfpeIkW8MWHmRYuD2Pkk?=
 =?us-ascii?Q?uT2G7ZAm3FgFVMQxv8kjcinK5Ax4efjcKwsEkGHCNTgqPD3MfeyYoR+TyLU6?=
 =?us-ascii?Q?yk1i2d8+vzlDs7lptWr/poRC8Ik6Uw4BNK/CXSZsz8JU1IRqQHmqEgcVv+71?=
 =?us-ascii?Q?R1YVtjLRBkMFxm55+BN5gXLitKX7MNIqCClS7gZNpBO7j802A0J+ebilbpKt?=
 =?us-ascii?Q?FOFLe1wKhfvEfPDY1UmhtGFuGzVOlE+gOMd01E6YoM1XDJI1g7uxits9QghI?=
 =?us-ascii?Q?6ON6oGFMjwWCDlKmevLA+6oDnXocEqjUc/iZm0LSmW4xep2mWYMwq22dTVGC?=
 =?us-ascii?Q?YEn4kYiOM+Je0WK4/zjN7drTaDS4RpQxnKAAaCHgW7Z3Ccs0HKLrGwKfevG/?=
 =?us-ascii?Q?wtg8aLleZHQXvHy32sS0S27GiVbBrQ1sCzU91264v0AdO7FIGGi0ABGJpf2/?=
 =?us-ascii?Q?ftfRVykJpiXMXyBxtnzaUaaey/WRvMhOToJ1etm8T6M84lWXNbBWibvdreMQ?=
 =?us-ascii?Q?mXlWSYb2kVL1JdJ+ig5IiBPFk3JsQ0V/fiPIojsjDAvrd5Oo2Yh2piIJ36re?=
 =?us-ascii?Q?Zy7K+LIgI7x1/oiFAewGXr3h6ed/IWrIrViXaUVRRqZhraFYLUqE6h0oLUpm?=
 =?us-ascii?Q?lVT+/1uYZtB8C7oVyqvo2VNHHZNz2QtlW+WoIoxZtCY1eiOh1oZgjSPJ4Ppx?=
 =?us-ascii?Q?vjbtJtbYlAFIn9sdu293LTJ0SNLKLk3S5JmRt8ON0GEZBMCcj6UbkDQCzBVI?=
 =?us-ascii?Q?ytjMci0Nysd5SCs+TXpFIX/HMiD4CfsZ+q7btZD44DR44w6IzoylHnvx/6kN?=
 =?us-ascii?Q?txSAYcaROQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea64f0f9-3a20-48b6-8e12-08dea4367db4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:25:07.9373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuwXz4GQ+kQnwqI1E/WRhGBaKCar2azo9muur2H3iHWR+9qa8ktYRgfBK218JahT1rf78JJIzIKb5w1HJ3SbYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_012514_928640_B7E7E66E 
X-CRM114-Status: GOOD (  13.10  )
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

Switch to use flattened model for all USB controllers. To enable USB
controllers with restricted DMA access range to work correctly, add a
simple-bus to constrain the DMA address.

Note:
  This changes the USB controller compatible string from "fsl,imx8mp-dwc3"
  to "nxp,imx8mp-dwc3". This requires a kernel with CONFIG_USB_DWC3_IMX
  enabled; otherwise, the new DTB will not be compatible with older one.
  See commit 76fc9452a6bf ("usb: dwc3: introduce flatten model driver of
  i.MX Soc")

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add note in the commit message
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 113 ++++++++++------------
 1 file changed, 52 insertions(+), 61 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index cc0246a9c003..8b3aab14ccf1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2229,67 +2229,6 @@ hdmi_tx_phy: phy@32fdff00 {
 			};
 		};
 
-		usb3_0: usb@32f10100 {
-			compatible = "fsl,imx8mp-dwc3";
-			reg = <0x32f10100 0x8>,
-			      <0x381f0000 0x20>;
-			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
-				 <&clk IMX8MP_CLK_USB_SUSP>;
-			clock-names = "hsio", "suspend";
-			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
-			ranges;
-			status = "disabled";
-
-			usb_dwc3_0: usb@38100000 {
-				compatible = "snps,dwc3";
-				reg = <0x38100000 0x10000>;
-				clocks = <&clk IMX8MP_CLK_USB_ROOT>,
-					 <&clk IMX8MP_CLK_USB_CORE_REF>,
-					 <&clk IMX8MP_CLK_USB_SUSP>;
-				clock-names = "bus_early", "ref", "suspend";
-				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb3_phy0>, <&usb3_phy0>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,gfladj-refclk-lpm-sel-quirk;
-				snps,parkmode-disable-ss-quirk;
-			};
-
-		};
-
-		usb3_1: usb@32f10108 {
-			compatible = "fsl,imx8mp-dwc3";
-			reg = <0x32f10108 0x8>,
-			      <0x382f0000 0x20>;
-			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
-				 <&clk IMX8MP_CLK_USB_SUSP>;
-			clock-names = "hsio", "suspend";
-			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
-			ranges;
-			status = "disabled";
-
-			usb_dwc3_1: usb@38200000 {
-				compatible = "snps,dwc3";
-				reg = <0x38200000 0x10000>;
-				clocks = <&clk IMX8MP_CLK_USB_ROOT>,
-					 <&clk IMX8MP_CLK_USB_CORE_REF>,
-					 <&clk IMX8MP_CLK_USB_SUSP>;
-				clock-names = "bus_early", "ref", "suspend";
-				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb3_phy1>, <&usb3_phy1>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,gfladj-refclk-lpm-sel-quirk;
-				snps,parkmode-disable-ss-quirk;
-			};
-		};
-
 		pcie0: pcie: pcie@33800000 {
 			compatible = "fsl,imx8mp-pcie";
 			reg = <0x33800000 0x400000>, <0x1ff00000 0x80000>;
@@ -2390,6 +2329,58 @@ gpu2d: gpu@38008000 {
 			power-domains = <&pgc_gpu2d>;
 		};
 
+		bus@38100000 {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
+			ranges;
+
+			usb3_0: usb_dwc3_0: usb@38100000 {
+				compatible = "nxp,imx8mp-dwc3";
+				reg = <0x38100000 0x10000>,
+				      <0x32f10100 0x8>,
+				      <0x381f0000 0x20>;
+				reg-names = "core", "blkctl", "glue";
+				clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+					 <&clk IMX8MP_CLK_USB_ROOT>,
+					 <&clk IMX8MP_CLK_USB_CORE_REF>,
+					 <&clk IMX8MP_CLK_USB_SUSP>;
+				clock-names = "hsio", "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "dwc_usb3", "wakeup";
+				power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
+				phys = <&usb3_phy0>, <&usb3_phy0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+				status = "disabled";
+			};
+
+			usb3_1: usb_dwc3_1: usb@38200000 {
+				compatible = "nxp,imx8mp-dwc3";
+				reg = <0x38200000 0x10000>,
+				      <0x32f10108 0x8>,
+				      <0x382f0000 0x20>;
+				reg-names = "core", "blkctl", "glue";
+				clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+					 <&clk IMX8MP_CLK_USB_ROOT>,
+					 <&clk IMX8MP_CLK_USB_CORE_REF>,
+					 <&clk IMX8MP_CLK_USB_SUSP>;
+				clock-names = "hsio", "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "dwc_usb3", "wakeup";
+				power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
+				phys = <&usb3_phy1>, <&usb3_phy1>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+				status = "disabled";
+			};
+		};
+
 		usb3_phy0: usb-phy@381f0040 {
 			compatible = "fsl,imx8mp-usb-phy";
 			reg = <0x381f0040 0x40>;
-- 
2.34.1


