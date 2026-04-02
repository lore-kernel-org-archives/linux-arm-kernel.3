Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030FAD3940B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ar1VoCQOfqxRn9JTafCIhUPdpnR3eh4akKNpCkBDLIQ=; b=EJWy3EMh+moOGpmVatJh14A0F1
	+hK0dnkk3zR8VMvuhVNGTF3tW2bMUy2y3MeETKPPVugiRe97+CAYRjpKS+kAq21AcD5Knw/v6c18z
	JMUPN03GPeG0HGn0UIaZx7XYCaveL08glnWxb5rNCo+5thA44EBo3tlqz7u9vBEny2o2xpVtyLt2q
	Fv03dNjLnqmPokeDJBmgdN8ZS23JtW+tGRTtmuD15La7+0jvHkDTLdQZR0PJfKTJHBUfLsgIY1z+H
	7b5uiNRbDiJ+Oa+ayatbJ+fxQlZ3g0q3BQo5w9nXUIFlIfPwueZRLjLYVvAqgIy6oVrs1kMmch+6P
	F3+TZBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ExQ-0000000HLm9-1usD;
	Thu, 02 Apr 2026 10:07:24 +0000
Received: from mail-westeuropeazon11013014.outbound.protection.outlook.com ([52.101.72.14] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ExN-0000000HLl4-1l8Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:07:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKzBMEeEHT0NFcA+dUiJTBtlnBieqKoZDpGAyi6omoCG6Hzz5/USY6iiNfE6H6WF6IQ61XPkhthT46ikGfWWHEuaGIvzuUG+NJJf/otUg4WCH93df+UbBSFpte8oQKs5GgaOzIpRi+HePO6ky6v70mY/1mbC6Jjp8ddHMV6DLYIKIPdKjIfCVy8OSvkJR7jcpIXC03NX7jIz7OxMczhHtRI0Xld8QW4tYRAzKMYB4RBL4NNiADw4VP4ti5anyIpVypylPdKE8MHRGFQv4UWItSmYz6CCpDkEUe2XKrSNswZs+AulboFCqHEKyQu6J4eBVknaXSnfbgAcCpTt+mvPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ar1VoCQOfqxRn9JTafCIhUPdpnR3eh4akKNpCkBDLIQ=;
 b=YASL6FZcCU3zbFAOwzlSDrAO94llHaaeogAEGVUau7wIFiXJIPcIggzEC6grw24LkuP1Q99d5oBO42jWI/QCG2vU1Qo/cPAqteu8IMEi/K2AsTZb0r0LIiwgFMnaW2dQaYsjOxH1yOxyoXflQ02W/XP7GXLh4iiPLQzhRKwV0vOwuCJKVCTQgsHHnRrVe7zicR/aoSTa645X5S+jmHNeQm6TkZjKIQMnPY2wGMIOKnKCo9nGghsyIEG7WkLAAMrwvrMt8xwhXHelXRWggsMmCenAFgPECtrso9nMPWC4jNBolafb8XBK57qVinjtBxYTlSbXgR0Kqeg+AoVQitTtJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar1VoCQOfqxRn9JTafCIhUPdpnR3eh4akKNpCkBDLIQ=;
 b=nhQYDmaaLbIdG4T2yKCtwtag44FY4YPK4cUos5wYfHQ2Vj9ktX9GIvboFeFELsSjJG4xR8tmGQQrgCEoJ5jNYp7fbiN2x69/WbRqMsTtiCQdmTiVhXPHAhMMHQpOHyRtxV9LPR0lZm0ba6hhj2Jui88jvQlrDl65HHkO98g5yzvQ1a1PYbVhgB60Y6J12THIN492QcqKQC1/lDbUOIRSi57z+q1chy4bPUN7HRQbwJzB0ZlTcvfReDGujVYlHKcVq2dEjYyC5DxG/LzAO7Qqu6RGeuckGlKT2YCCkxNEOKb7EPb5smXStHpNP2mfBNU6NfAvTOlrTyCg5kg7XsGyaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB9865.eurprd04.prod.outlook.com
 (2603:10a6:10:4f0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 09:51:16 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 09:51:16 +0000
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
Subject: [PATCH V10 12/13] arm64: dts: imx8dxl/qm/qxp: Add Root Port node and PERST property
Date: Thu,  2 Apr 2026 17:51:06 +0800
Message-Id: <20260402095107.205439-13-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260402095107.205439-1-sherry.sun@nxp.com>
References: <20260402095107.205439-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB9PR04MB9865:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2c2d94-b12c-44ad-8d3f-08de909d623f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kmyZ+Hxc48PqtYbP3d/phb5kXhr3pdL9Bz0ZdeNQCS6tEOta8aviQtEE9LUYDj48QXLZqIsJhSufw1QCaHentpwfFxFOQMhH/EaCgOfzvcqM2nlTp6cdaUOXDasVhgLlUDVJDzcelRgcrSef1wUYI1e6RfU8gyiw+xlp0q7sZv1hXGDHrtuE6NFTL9kzNZRa7Yf1iSMVcLeLBrCnwgA/vxj9i9+hp2sqljVcxBe3d6S0hhiHoJLrtJx1JyitvJnfNnD7zmKhjlfIP8lv7PnHFNxMEVU7n3okVZVau9Sz9fTepNcW5sQQ2gAuFWYvYIzIqmc7elfwUdTkk6EX0U6vUWRALjOIiyqUxT+Q4tWC3qR89RrfYlCcL7JwmCVV2JpDcmiJKp2S6qZ34DIIXZYABcysC+GHqnvKaGfklMjIitj0ZqpkMzEIQzSu9kppJZJOZl6oJR4LMBT5+5C3Tt0qzeouPfoyMIghpbLkMKyr0aPh2KAhPZb7d8SBREkWP8stgnvxwx04iyyzH58KxFaimE1qkry26Ntb+mj1PrJWraeBLli7y2T5qGdM12AnIhi9d3yc9MjmocKxpHzJ81I1vYBBsk+6Z8G5zZC2dq/qHnQice3grzj/rsK95vRk6fTV50FPHeTMw5sZDhXeuc007z8wpL1oGVCOL2/7UzThriN3FxGTEbDcYdJpyrihVPvib8BmZnirDJ+jeiNWrdFUXLx/HquHrGV6OGmx+0rbS1j5wVG7SEZysYIObnTSit2ra/+5nDYVVHCn2sI3k2VjGovb/8p5/xgAWNsNe23+FBCOfpyUUBUbmnxFOmkHmZOQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aw+8NtG2PTSSW5kuu+GBKM4FjtZzd/NLZC5QORf63+aQT54IIzJi26dmsMDw?=
 =?us-ascii?Q?XMaHdlpHEwWe6cWOqnhaSYzhbQ+56UnJYhnOCF79qXlCM6B50Rsd75+P0vn+?=
 =?us-ascii?Q?fJJFqwb5//Fxenov3n3MQQ20B/47rHTKIEshnqLQ4aNUneutU6NyN8pYsZlz?=
 =?us-ascii?Q?Ukm0V//592Vy28Zu3NYeqi6bChb57crrM7HYs/I0FaDVLESBobi/Mrbx6XUw?=
 =?us-ascii?Q?MMnQpgwv2za4kMc/IlTTlGs3IA6GsC8XONP1zn92rt89dhjrDCeAT9RsrkXQ?=
 =?us-ascii?Q?8NfEcTb8U7Eys0iWMMekQI7dqt8we7IH7eWgL2iWPpY4FLd1e6xxgeqv3WfA?=
 =?us-ascii?Q?8TcRRXTDnzwnxe9c8yncQbsiUqhCvl5BKi1qCLxU/h2J+1u5VX0V1yDDBt70?=
 =?us-ascii?Q?JPdQzq9JGfJSqP3StF6IKOOC+moU8OcvEtDHW4RZQIg5vBjbqxxV38gKkSa5?=
 =?us-ascii?Q?iFFEJK7TeE3/dnQrzkVpQqH8mYN9RS+zlM4AssJ40u+tp8sczw5HTLdAMZww?=
 =?us-ascii?Q?ny3AS69P0JpJ6oqTqcchSY1Yer4PG3oFIxHTTR/94gJpOylvRqxZ4DRAJA+G?=
 =?us-ascii?Q?IwwjOj2JMEtD0N6nLfuVAPg6v4W6h/TyiTdWrN+xhFFR7QnGn+IdI1e90bl2?=
 =?us-ascii?Q?OJ4lr3kILL/COJ0caZGUJ92Yro12z4mdEdkfNXhmFpsrv5BznImg70b94DVh?=
 =?us-ascii?Q?2YStJmb+agp4j6OlzrbJnzcAmaqHMDhZlCfbd79k2hT6l2RKF2Q3Y9ti4AeM?=
 =?us-ascii?Q?bpUgn9fVK8UcubmehIiAbrWT6nJOqrlnvaOfwf1DntnjbgLZSipT4IskYmYK?=
 =?us-ascii?Q?745GMlkNoV9MVupRXzRLi45aGm+AJmjIwW8l0iMEQuwKU9B5DQq5ArM+JtQ9?=
 =?us-ascii?Q?aM5bQIfv1xtqmuSh5Q9aEEuJjENIdBo/+xoIU+GAeIB2UP5foOSktoj0r8xy?=
 =?us-ascii?Q?R+bMQ/RJ/zhnPFoa0h+5qet0A/R7BWZOMmXob5om5rMEcJ+23LEPzuSQR6cR?=
 =?us-ascii?Q?Cc//SsgerVopjyNt15JgPDCNuRk737K8NwDBseipTFDnUZt9kfavsT+wD7cZ?=
 =?us-ascii?Q?CgNDy7FLW0Sray4NFGUu1L5VLIm5uPumeSHXFKvXsX7mm2UVSqXelwOJDde2?=
 =?us-ascii?Q?4Wgh1quV0+To+BRPXgO+UIGNqxTTAVWOrsSo7YZwPJCW79cBBl/wBgOkoZRN?=
 =?us-ascii?Q?xC7NEfvXgTOW5CN3C+jCMZu29OAKagPuwHZMmRHTCflSPzpcyAM0dMG0SZ5Y?=
 =?us-ascii?Q?9ezJinFbjyUBnHdNaDks6Jm54C5759pxniWARvzMMJ3d9xT4KlYBtHGO2bpt?=
 =?us-ascii?Q?w++YFlPVgj0fKXc+9BVkcIpaYx9SvLv7IUTVlvfx/f46M8FOsRNdTfn4ZDhL?=
 =?us-ascii?Q?OlKl8LUAGNSrDIYazBzow5xXSo3vsW9tftRARDoOGF7vcBi16qhOiclSUYqE?=
 =?us-ascii?Q?zs2reA15Oc7T9CRuhy3ZNKP2ETZ2fPHopTPRnio9RBxM1EtQVxtlyv/U0KLR?=
 =?us-ascii?Q?W2LjyZ5DyWR3DHg0k2jK62ASiSw0hmXosW5x8ah8WgNqp7qrQk2WvQGDn4+l?=
 =?us-ascii?Q?jBg2YkiohUjAabs4BUJ3XBcPke0eiKqgMieyVENC7CXNh6SylaLsQGlwINoa?=
 =?us-ascii?Q?YPpLPPXp2v88mo4zGGeeXF7Bt7ws9b5EwGQ5eiWmfnaQiy8XFjbyDmlI07Jj?=
 =?us-ascii?Q?s9g6nUeZlteE24tfnRTWyrr0XYP9rNeSGwKrmFAuqhOpjIg3fQeQzooHhwPP?=
 =?us-ascii?Q?WwJi8PGjqQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2c2d94-b12c-44ad-8d3f-08de909d623f
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:51:16.8022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTdbfgKkW+VIEZMG7NaogXC3wtT+ljgNvsHh2PL1rzveiYfkCD8ygewsf7qWpN3Q8LID95aF62sjcT+K68oTwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_030721_458862_33CAC7E0 
X-CRM114-Status: GOOD (  11.11  )
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
 .../boot/dts/freescale/imx8-ss-hsio.dtsi      | 11 ++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts |  5 +++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 10 +++++++++
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    | 22 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  5 +++++
 5 files changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
index 469de8b536b5..009990b2e559 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
@@ -78,6 +78,17 @@ pcieb: pcie@5f010000 {
 		power-domains = <&pd IMX_SC_R_PCIE_B>;
 		fsl,max-link-speed = <3>;
 		status = "disabled";
+
+		pcieb_port0: pcie@0 {
+			compatible = "pciclass,0604";
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
 	};
 
 	pcieb_ep: pcie-ep@5f010000 {
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index bc62ae5ca812..39108a915f96 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -675,6 +675,7 @@ &pcie0 {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	vpcie3v3aux-supply = <&reg_pcieb>;
@@ -691,6 +692,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcieb_port0 {
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+};
+
 &sai0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai0>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 011a89d85961..f706c86137c0 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -810,6 +810,7 @@ &pciea {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pciea>;
 	pinctrl-names = "default";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pciea>;
 	vpcie3v3aux-supply = <&reg_pciea>;
@@ -817,15 +818,24 @@ &pciea {
 	status = "okay";
 };
 
+&pciea_port0 {
+	reset-gpios = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
+};
+
 &pcieb {
 	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
+&pcieb_port0 {
+	reset-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+};
+
 &qm_pwm_lvds0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm_lvds0>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index f2c94cdb682b..2e4fbfe0ca16 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -41,6 +41,17 @@ pcie0: pciea: pcie@5f000000 {
 		power-domains = <&pd IMX_SC_R_PCIE_A>;
 		fsl,max-link-speed = <3>;
 		status = "disabled";
+
+		pciea_port0: pcie@0 {
+			compatible = "pciclass,0604";
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
 	};
 
 	pcie0_ep: pciea_ep: pcie-ep@5f000000 {
@@ -91,6 +102,17 @@ pcie1: pcieb: pcie@5f010000 {
 		power-domains = <&pd IMX_SC_R_PCIE_B>;
 		fsl,max-link-speed = <3>;
 		status = "disabled";
+
+		pcieb_port0: pcie@0 {
+			compatible = "pciclass,0604";
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
 	};
 
 	sata: sata@5f020000 {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 623169f7ddb5..489e174df4c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -730,6 +730,7 @@ &pcie0 {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	vpcie3v3aux-supply = <&reg_pcieb>;
@@ -746,6 +747,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcieb_port0 {
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+};
+
 &scu_key {
 	status = "okay";
 };
-- 
2.37.1


