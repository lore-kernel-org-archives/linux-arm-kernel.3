Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F71F4BB9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQgr/Jjp3ApT/lbu19qZvUztjyAkB4ugK0PPupDQNwg=; b=Snx0H2EWNpzIO/OsGBjTkNmXF8
	kW9LSoSqxPXiSio+x8oW1DtMY5F9FkDTdXl1jGG2rS2/X2pQTo74OiyurQEaQknVUyMSbejefkkZy
	T5qwsM+Fwg4FD4KhztaEFwTrBwhDsR9zBgkO8VAlrtW3F7IwEV+5DY1cE6RqpLQiomcy2hg615/Ix
	vukNKtCqAx0UOE1XAqaI8bZ+oyTTRrjI/UCBLeYLysvBwNOjBtQRqh6D0gEShg7z9OYekui+gYGw+
	5hrCxxzdGG9JheZsVY/6gtk1DzNB/YVCkWCkUHqosZ3mCwdt5V9KVZtunvbAc3WWAXgbp0dcumuaY
	mIU38MHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXn-00000003quo-3PpL;
	Wed, 25 Feb 2026 10:55:03 +0000
Received: from mail-westeuropeazon11013042.outbound.protection.outlook.com ([52.101.72.42] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXl-00000003qrh-1Qgi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:55:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p64bMtrGkcxWk3RFWgg0eAwAiRYjYjUC/wbZOYsfw8b445pDh9tcnczxmYQSXQxU+5qJM6xEErGGpNybLzanf+hHezYHviW9w1ppNPWM65VFxRnjsOdkgB0gXFwPeFfytuTe1dY77EMz1pVbp8C5vre2nUw0sOo4l28PIBjyzyDSqNFGuxNCgf210k3Wce+SH6f3ZDzWPZQ0BgHIv00gTL+U5sNkihMq6zA23J3JAFLQGFDe6SHJvsE9MHeXltLyF0+aPB5zZuX2Ht8WCUSRehYUEJF+78vjAlW0Fi/r1fZlhA1eTZrLJ6U6VVEmsanpSVXLBBEgb6N7H6Pfxx2QIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQgr/Jjp3ApT/lbu19qZvUztjyAkB4ugK0PPupDQNwg=;
 b=UAOWiBHZpvCwlTiTe7I6uODvXD8MCWjgttibN5BDggrnTqQC+/kamC4UUJ1l3uYVB1AzKKNGJrMo5EHYaKxepFcr7Ue8LeEMNAE9ImtQqOHEgns4vy4EKcSbPEWi3m1zcNxzPrtz2SNOm8n/nVeUPWhxADgUoDrYajQbstUYaYNivM+He5Lvdr8FFuDF2ioApS5DgPAcUscduhZ2jIHbrkPbhcoS4MWtoLz4ub6L8ywr2zseFKIDsuAyGRZlCROUR4QQIgP/ka02+WhkV0JCBrnoEL5iuoxswfJ5SR7Dk6zvmj75/y4OY/clpfbvTqyIG/IZJcvAazBCge9F8venKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQgr/Jjp3ApT/lbu19qZvUztjyAkB4ugK0PPupDQNwg=;
 b=T7teRs7CLhQMkHa8z226YMagKqXmEb9vuo9FwnErQY5uUnQGSshm/dZIawd7EuqkNgbkGIob52hqLPDnHwgue/ORsZoKUJ2b4kI5O6/VV7QTQM7mdHKuLu9CHHfC2eRHJ8FYzYEBp650HFam0EyI9wG2gQvaHFhx220tjPqX81BGhghHqhBtxvRaIDLBdtmdslviXvolp7QQY2Q3qdQJG2tTG5/Dh2g/jGL4QD3ndfuVc/7i2kLOPZH4fUTXLSF3RyFu64NFUUHWgfO40KdpTzBsLJCqhpjIZYBZxoZtkH9H5xolbCFS1SlKBXkHWM0DAbm9J2mQqxvC9Jk3n6jpSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA1PR04MB12224.eurprd04.prod.outlook.com
 (2603:10a6:102:561::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 10:54:56 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:54:56 +0000
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
Subject: [PATCH V6 07/12] arm: dts: imx7d: Add Root Port node and PERST property
Date: Wed, 25 Feb 2026 18:55:18 +0800
Message-Id: <20260225105523.748775-8-sherry.sun@nxp.com>
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
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA1PR04MB12224:EE_
X-MS-Office365-Filtering-Correlation-Id: df092bdc-c0f2-4c8c-f218-08de745c5038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: +Xh//3B42IsUJFkp1SUk9gU+fd0RMONUWXEYzh6PqEnaWUTnIXSnQ02ZRicKzEGmYzlFiX9PtVEYVXFz//AXAmbL3w7Nr1FcWnV5mGofGW2bZ25V/QBUKaImV7OA2Yc25LEmmWuxd8X/MtwBCxBkMLzHyiym2JGGOaUJVI66mgeEWr8U4ow3ZUh54OanOh5Y982oYOpPkr39i2FesRY5Jfk/qVt0khPeP/w+9cdH4QkxqLZcoTArrlG90Lr/AUUbbkZ/rSq43IGocrx5a+0/kCQHDIrQti4TVkxZpQi9Q7mEoo62ld/rzjaiBnmv3MdVSwMxs6/T0IH/ojnRdctMxXzDXOpn6OPloUStShgixy5RIi7bxOZCLylyFaHjqrt29pNbwANbDPOPkIrgp45GQpoVdT/rLWPyQ4Xeo1+Gk1Wgo0UVCJQFiDLJacCSBJhBJg61fUkNzBLxwLsJYZYvs7vLOT3Z3DI54s3Sf5ux3jKkxXsZiyZnMUDPZlM7Wtrs4IO75w+DEyHE2DHXtFECjDjNbCZqU3PH6aop6GFRYgnKDRU4liCHwM+gy1ku3U8y9z9XG3D/OSj0u6/0i1wtvAdSo0XFTN1G9YmOoWGUp7BQ7TYh1qMBvk+uSa1sAuY/5jDydOCpzACm/BKpaVFj9u9Sxhh9cQHYGegceulQ/jSLOc0qIgNvHYrNgoDVSxMNLmOVtcG+v4TQF0owJjJjECUo5/uU8CJSEc9pBuvrAInQ4sbPvDfjebcP0UlNbopbSrwALzAnR6h9XEXFo7uoousIxfe9hXDSIBOfXy9oqjaayXhQtLSPNIcnUkU4darh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1+khIsP/nBrjjqGyooNHgc4MPW4IzlAzJP7bw4jfFmWRrq8Ez1vDqvX8LZa8?=
 =?us-ascii?Q?rbpPxKVqXrFHhMFqzARHoRqH8X7EJqzMjOApqdwkhRGLWiv8HrkdrsgrOmKF?=
 =?us-ascii?Q?s8tTJxvCJXeHTnE1IHOPOzfFy0IBcE+D6BdZ2XPa4i4R8/ObIrD1lyM5CGhg?=
 =?us-ascii?Q?rCf3CIFuklZ3nF2K6wXlYdCUUiR+Luh9qEm2Y6Pk4X+mrZFdBu+mN7fv93Rq?=
 =?us-ascii?Q?o+EeJAW3PgnPL2J6BAHvwfRgEUPjebkLiX8H6uF/BFmanWjAzp9TsdaUmhw5?=
 =?us-ascii?Q?mwixs4qX7UNdAQVsCYPNxFUGLSOb4vAqzIEIkstSURZgg7HUJMUC53ZtEmvb?=
 =?us-ascii?Q?tZJRunjQ0mcgYEJRg9NpgnVs3+IZTinpfEOp0e3BW7pgvTN/er2Qav8gNPdT?=
 =?us-ascii?Q?r3Gb/XRKlSu4/1kyP7uG5VLPtpm2gIzfiEEotTG7OzHj6VlzwLs7+x8w5vJ7?=
 =?us-ascii?Q?Kv5E5qYCgD7mbDZ2IZ52VZ0wbcKF4B+LdBCPapBovdEODw03r/0N7tOiqH6/?=
 =?us-ascii?Q?K1hz1ORMYh9zwwUYsBUaVjjrTaF/zdWNQvkpoTw61r+urEwqYdJM9RofCc9+?=
 =?us-ascii?Q?jgZBYsJfAy8MblMj1U1RZFkXooZGG26DxHRGsGR4ikps0mXnRjTZGb0YzoSX?=
 =?us-ascii?Q?VqOl2nVqImhwGBzXfUX+glp/ALmNDrt+SKnPmgeHMSblq6Hz96GuCEW9yvkd?=
 =?us-ascii?Q?dW3l2pKkHN1weFLR3IhtWaEtLjgYCy+7d4Xk7bgIWhERl/qz92YLthlGeXkU?=
 =?us-ascii?Q?B+XMt7PWyhRHgtrDRwaCl5GSvcMTCarp3INDSUhBzpGX6W21avPEygACRGU+?=
 =?us-ascii?Q?HJ+1sFdKnYBDFv05eI//c4jK4i04g3Va1YE1WxjImcgFBJqVzuRPUBARTEff?=
 =?us-ascii?Q?SN8Lx8tmrLzkMyy3DT3d3IR0i862lBg79HfAdUH+VnfXIL8DeQLlPc1j/fJZ?=
 =?us-ascii?Q?8wuoJLbab7xYdVARqXfdXA1m3n7RZIEhld6fDnru8Svq4B2kcJS0S8GAV/wo?=
 =?us-ascii?Q?XgBgFl24XIrWV/9/tD/WDicupgyYJqg7/BdPST6Bkn43bfR3ttS7U3nP2P/y?=
 =?us-ascii?Q?Ka8+cRN0/TtiRkwv8ZwWz4uzB8W+sZPWDLdmjY8fpWZNsHgSowfoHKJAC45+?=
 =?us-ascii?Q?pWR/+NMFpKfse5fjR44YtRYejmdls9u+OKsWpvyfH74nDl4MBUOMnkus4roQ?=
 =?us-ascii?Q?/dUOhIyq8Yrr1iZNHUs+eO9s2cpRNAYbc0v1Pzk92nzzOtcoxEq/UVTRsyPb?=
 =?us-ascii?Q?CewF6T83UM/T2Rxrudximl4aclKoxMuC83vumYoKZbvfXeFiygLU66riyonw?=
 =?us-ascii?Q?b1lLK57nNQP9CSA3mKiqy6CroBJDG2eaYYVQLKqBSytDxA8AIwGE6HAA5HaX?=
 =?us-ascii?Q?Y8vvD3ynDEyAYFwG6/29uW/yNRn7M1iN/sg2TpGgAFlae7aY90ieSMjaH+QK?=
 =?us-ascii?Q?htti5VAYFIVjv37i6o4Vl1ASR3zBwtpfdl61z010Z3O2gQAYEZNfabvmXLCl?=
 =?us-ascii?Q?Axxzb8JHwONrf71jVFCS50CVsy5up33xutVFFy7Zl0rL6Vl9CLoWM+lmKDU4?=
 =?us-ascii?Q?+Q/4p+b/8r/hsKh6yQNYvBwwQlHWtqhSryjHaFF1eXWxLWkef0+9JxVPmfrR?=
 =?us-ascii?Q?TCchMGV0rRQIH4kCZe/6bCz2QKsNDzvjUVkPK+W+q4Jq9sdDTNlsLJhHQAQp?=
 =?us-ascii?Q?Waq0km5adSFLq0AHMLl6Z2cJCRi9+4Dogk0wGXNgAtIql64RTe8WtPSC9ncj?=
 =?us-ascii?Q?5bHZpZuA/g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df092bdc-c0f2-4c8c-f218-08de745c5038
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:54:56.7158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3BlGT9vCtUdggYbKCY2lemIKmT/XVqirQQXEA1//pCDjAUhoB5cLEeq+dDHDVoNrVas+n8o9tkDy+rlzsURnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_025501_384437_CFB480C0 
X-CRM114-Status: GOOD (  10.80  )
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
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi    | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
index a370e868cafe..0046b276b8b9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
@@ -456,10 +456,15 @@ display_out: endpoint {
 };
 
 &pcie {
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&extended_io 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&extended_io 1 GPIO_ACTIVE_LOW>;
+};
+
 &reg_1p0d {
 	vin-supply = <&sw2_reg>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
index d961c61a93af..3c5c1f2c1460 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
@@ -155,6 +155,17 @@ pcie: pcie@33800000 {
 			reset-names = "pciephy", "apps", "turnoff";
 			fsl,imx7d-pcie-phy = <&pcie_phy>;
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


