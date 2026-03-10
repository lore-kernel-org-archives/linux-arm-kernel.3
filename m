Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCDFFCC9A8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 01:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f27SUcPc/7GNnkQnoPRzUdp6Y0/1ifunguGbldvZAMc=; b=R3bBCAv3N9vFyceVGpKNjDX6CC
	YErVEhYuVOokHqa9MWKlqNaABy0VlPFMkwgTQK7bwqyTb5aQtjN2XE5uxsZmARg+AqGaiGdgnN5j8
	SVB3mneoq7deyNyTr5Hr/A9V4QdHIYOpJyRFmxdBhwkEIwL5ElJWAxeTbfgla+ciOZXVOmBlJ6gRX
	rmycBW9kX0kdl1ldWoBq50U279w4CEBDx7tSBceFVn9AkFb+cLE5FpyILSf/wosH2ngkIJ8hKk/Fj
	bqjmXAgjEpJLoU/Q7nWSdk1hvG7t2kc7wtO9a8eglWbQ2tiSDfuC/o5V1tzgHfHwl7G315XwmSEVu
	6bgRATRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmIn-00000008Wgz-1mve;
	Tue, 10 Mar 2026 01:54:29 +0000
Received: from mail-norwayeastazon11013020.outbound.protection.outlook.com ([40.107.159.20] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmIj-00000008WbZ-0pUX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 01:54:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmTwpKX4/t8DiT4KOPPSQAsUCx44k04i6yXg2qYrQQknCqBsUuWnRDaQQ2QGzYM2S4qwIK0P6TmCnGcL91SHqX2XLMyy3haY6UxcTXyyYUy58IeT0PnI9tlY36XTcdy6vpkPkZ0JFSXXnrEvS7GdUAnPoa00PeObuRzxhmj+5NOvbDikQu0GkOcCJtpDsTS2s8hbDwDDdutP7anP3m3mAIkimcjGlQDr8IikxtZ1bHdYmdfuDQ1T1AL2tn5bmniW+tk5gQTAKVS8yqnQqG/OeZAoV+ZofR5p+8C7jYkhZih2u8wF1rsqqqEl6cw+q2zykiaVKoAv9jCp3rXtEezM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f27SUcPc/7GNnkQnoPRzUdp6Y0/1ifunguGbldvZAMc=;
 b=V+IumFBa+0CVJsEe8kQB1Ai2/D3r0eGgApJl0pesN/iDk9F/qAgrgWJzASp2b37LCI3MVX5MzjshS+GaFFVYPL8k8ASXnb0d/vh2hIDdxgKcnAWk6udmvr+PYLzMLv6W7BzxjlNkEI77gWi97xxihXfupJLLANPhHO3EkWKr6m2s/hzUe5bHp1eT2JOYpqUWrKqj9f1MViu+NGkjxW9Q2bfIeG/puNyYkRELNQ41M4cEFh7clqC6g/4SyIUNjBvns4bU420OJzH1kVquWQs+RrQGKyAeI/YryleRVQW/ptCXbBf4c5y+/0TwDtHjUVlYtgVxH3DlmwRlUQ6al11GJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f27SUcPc/7GNnkQnoPRzUdp6Y0/1ifunguGbldvZAMc=;
 b=E+EbzwgsZLjKqqHwXM0+XsAYs0bYUq9bX5Jhc9lVT7uYcjQtkz4mKCMWUb6E2vTCpBiTlT2jK7XuP/Dl/ze6wvp+CwnHQKBZOWGoGL8oOumnYlVQNvGHd4VDcDCMy2pasIzuPsjtrFlpCGRVN47zuFHSvWOkKsH34cIcy4f7VWGUcFp9Pet38GCNtd58XN18+BklUOI91LldbDP3cCz8TkO5gw3X+9HsMqnqVmTGt5L9qU8PptgErkfCpFSvjOLGJ9fQmZLwZlbdb9w1TcdNCer8NdB630fPEXK8EiR8X3Ctq5hwLFJm24h51ZZ8o51T6DiMjbxan0HriLnLCy8pBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8434.eurprd04.prod.outlook.com
 (2603:10a6:20b:406::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 01:54:20 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 01:54:20 +0000
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
Subject: [PATCH V7 12/13] arm64: dts: imx8dxl/qm/qxp: Add Root Port node and PERST property
Date: Tue, 10 Mar 2026 09:54:25 +0800
Message-Id: <20260310015426.365675-13-sherry.sun@nxp.com>
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
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS8PR04MB8434:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e640c7-6c5f-4aa6-686d-08de7e47f22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: Ump8vLk0CHsLleunWJMwSS0QEGSGWnk/hZlx6SstcsmgTW7iUangwU30xToXCb8P0dzkiSUDw/EhNuwM7YhrvBsADziAUKJreUtbY2wIsSnkuYOrxXVz+owS2fmM8t4AfGGRZ1xVgr5rS6Kx7SD1lU5TopADWxxKR2yhGd+1yRZKzueroZ42Knv5IvaOzcCjGyirQ+lMREYNPFsoGcZyyrTC1c/kZfkB9ZRevT80D1BCrXarhp2XF5pbJKMzv365rJ/GdwQI7f1+7Z1UhW1fFfhw5QDrJhWgxJGdOyyoOsGWSUtuaSyHiukinszIzQBh8BXbxbpVJeVqngi+KrAvN3FI4hsmsaR8y1lJECJHXGiTgXhfsF2JkaaM2coOmHHR5pe4kHTUwwqw4ugK0PlvT+LnwGxzsUkeg1m0HX+ENgbsZJu6bbKylRfcLYcPAcIz7+gUAE5ANnZZ+CvDUEbFoMFwQU5LndSWWikfdWjiyNt/PUj+Pg+FMjceZYgrz4O8F9CbRCPk7x2Ym34mYjnjK78iwGZegBwmz0AxnsX7oknMqBBMVa4NvjqutVRsl9PW882O36G1hmk+FkpmSjS7iDtGzsAluCvS6pUzlzNmqha6jWsivrnzFISfmIYPNMhs+N68qRFt0vfvOnq4IZNxZX733lVF34iXn0NF80YDprbwaVLbuJTCMStgcleisy8Xv04ye7ALAyBz/AkUKPbXxNNfaViHqOJK1rh7HLNcOsE3hdiQ3yEmArsXbgptp6pMI6+ik2DGW94v8lkbjQ9DgeWMYSxl8mii3BtumVuMei3HD+ojmRQTlaAeBQaFT7Iu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k9CZecNgVzoREAmdXxcBIaFqcgXAZPLayYLvJfHo0/OA9yBF8Kk5khLl9Y3U?=
 =?us-ascii?Q?9c3VFdCRDc5ewJmFxwvJEasSpOWYpYZz3snD3h9vXvkIQsvtsBPDAQe7d/jY?=
 =?us-ascii?Q?+k/DsIXnko1SMpb4+eQEyBopHGxl9g0pS72YtmeAbSHcFQyAHCuRVLGH+NiO?=
 =?us-ascii?Q?ZHS9sbpskCSGWdEWwlAJu1ZiaH3dK6rduD3yBA6p9+d3hZjaz0PlxzhH/R42?=
 =?us-ascii?Q?21yAWSFyM7E1qsULNdwipCf67/1NAjzFUSViUC2LAWWG6evQM6Q/NQR69TTY?=
 =?us-ascii?Q?eSXsbxzMepK2tAKJI69g9HN2VusSfnrpawTWNAPN9YzT/FZzRHzVSLh4ZcuB?=
 =?us-ascii?Q?Kft2+bwOWhRLHNb1Zc9zfX9dMa68dWsz1VeV5fV6EgW33sGGtGQgLWeej3Nm?=
 =?us-ascii?Q?F9A/0rGgCKGZxak59iB4bVHIpssDDAySEw3U/pyn/f0WOVPoICNCh0uD6uai?=
 =?us-ascii?Q?+4SyJgyOr0RXsnbUmIAWM4EYFSUsalLC6hZdbnIlo8jbWCeBCgOtZKyX7XcI?=
 =?us-ascii?Q?t9U4FDN1Q81TE9J4V4pOjifs6hXmGdhqVH9UyWUWCzBrXatUXOXOfELH4wbU?=
 =?us-ascii?Q?b3k7vLbeS2XRK9j4/YxB/reHiOLOwLkqJ5dOqReavy+hrIo+5mYx1HO+MftJ?=
 =?us-ascii?Q?bptoQS93F0mebqQUCuoGEtEyFZKhW+bM3JOAWklwU+FJ3T31H3LAY2RoDRSF?=
 =?us-ascii?Q?Q2GVbbqOmQKOfJWW1ga3PJuyP18al/HrIbAwaFk3PZaYusXLlZ58yfR4q/h1?=
 =?us-ascii?Q?MsQTa7SnMbJTAQMEzzZ1A+BxNjpnzJodUBAToxqTo7DJ9cXhyetRGLqeprA2?=
 =?us-ascii?Q?mUpyusYX6KvmB2qUHSS7RjzhMElKmLqEm7I+TinBHbe48NMBviR1HgB5RRMk?=
 =?us-ascii?Q?/aZkqfpDjI07EjJtm0bT6SKnOnYQfC2PiSL125PIPjT45NIVy3LT0A/wSS+E?=
 =?us-ascii?Q?jIOTQF8Ct0rvYxdV0KguSR/1XO5+bmGOW4exUHS9h52uaOXKRMRXGJ5JwfE8?=
 =?us-ascii?Q?ULcqxAad4WgMSDYtRcw94BafimgOylQsYQKvGNttTemP3ZZ9N/t2oHp934++?=
 =?us-ascii?Q?O94j8KvxZp/1zQfaO9Ivrvo3bhiGbUqnQo5xF8RvF2kB3qD0HUGYHu7xBKg1?=
 =?us-ascii?Q?l3PwrIJryTSuRs08B/sccyeMfuC8ra5Pes/ZlD5vaN4MCMk3jzlr+Zzkgo9+?=
 =?us-ascii?Q?7lrTMuAJEhXdxr9G3B//R95k4re/9bHjHasoBT1BYXQvt9xcWQhiscc0FJji?=
 =?us-ascii?Q?jMzNnIBAahYMn0Iov19v26Hjd/I/C2UtZ05VF68ohJQeOipveL4s/lABmAKM?=
 =?us-ascii?Q?uqfCMa9EWSUzytNXk8xxUY3rKWhvz8s3rZrUuSqylLQqNFe5pCLeKzCFJbum?=
 =?us-ascii?Q?5q5ysX9NbZacpJd+WMaf+tugjqdTm6MNR2JY1pAkGv55BeqGUkSRbY/r4cDz?=
 =?us-ascii?Q?iIUDtwSu2DJ0Qp5pqy9XI2ITdALcQcfMM5gKucel4jQnDiOuJ0e+ZynftkCM?=
 =?us-ascii?Q?vRYJJ2XegNwxzlPv2jGoEBRNzF7977st29AznPToiapcRqYr1B6YTX48HEw1?=
 =?us-ascii?Q?YpAplVHH95xFGYGcCityPs4gvVT80AHEtCTqe/uFVpVFXt9rf4AIWTAEbnT1?=
 =?us-ascii?Q?DLxwD330hnr+mf7Q6eTJtHnmDBVBn3XGrPDLJoWUkMMNyMihSDONSMRHTmig?=
 =?us-ascii?Q?IhKukjy8c8TPPlTWu2WaO6loTqC1QfNkPIAsl0P6ElQJfwDxGHR7CV8+8fMX?=
 =?us-ascii?Q?eo1rCtD8FQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e640c7-6c5f-4aa6-686d-08de7e47f22e
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:54:20.5555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wd9PO8oPQxBZ2V5Z7xOXNgL277oGm41NoX2LK2nHRtg42B80w8stJa2YoFnCScVlctrPuw+jY21vV9CWx7Wbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8434
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_185425_274225_E130713A 
X-CRM114-Status: GOOD (  11.19  )
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
index 5c68d33e19f2..8f2c2bd00cde 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -651,6 +651,7 @@ &pcie0 {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	vpcie3v3aux-supply = <&reg_pcieb>;
@@ -667,6 +668,10 @@ &pcie0_ep {
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
index dadc136aec6e..02f7589bd860 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -802,6 +802,7 @@ &pciea {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pciea>;
 	pinctrl-names = "default";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pciea>;
 	vpcie3v3aux-supply = <&reg_pciea>;
@@ -809,15 +810,24 @@ &pciea {
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
index bd6e0aa27efe..48c29c2cfe8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -40,6 +40,17 @@ pcie0: pciea: pcie@5f000000 {
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
@@ -90,6 +101,17 @@ pcie1: pcieb: pcie@5f010000 {
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
index 40a0bc9f4e84..cd127d0a0a75 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -722,6 +722,7 @@ &pcie0 {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	vpcie3v3aux-supply = <&reg_pcieb>;
@@ -738,6 +739,10 @@ &pcie0_ep {
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


