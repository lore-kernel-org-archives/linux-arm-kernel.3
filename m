Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794EFFCD0BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 06:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzEYEJCpGAVoSFS/77n0upIrt281k+WuWklTX1dO93Y=; b=NPqrEdxgBvKO0GirKTLVYX7w5S
	vok5owuZmi+5VaLeNqgI4dSDSPVzLZUO4m/tAl6Awc6g/UP3hh/oWJ7GJeUXQGVHHvtbsPFipcWX6
	TkF0JeplO7P9z+tEDjTVBoMU24KqUi6CGtI0MOUjuvJBQ9ayZBTYpLoSdFB95qv4RI1nSu/DmLQFo
	Fsm8dumY5fEMN0ys8pqOdm3ZAnL0TjXkKO0EW/A8O9oAM+heIq9O7j/qPx7ZSPGWyXoftpFas5AMV
	RVXuYHhyThW0u1MHqMZ8yI6UU9pWmXUULJVlA/WlFoY0DOagU8eNbQZBsdSr5DHQnMK3SVfqga5Gr
	01JzJPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kP9-00000007rmF-35vP;
	Wed, 18 Mar 2026 06:29:19 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kP6-00000007rjT-3My8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 06:29:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYhCidcD+If3PJRNfeajw/mTzjBIW6bRiy6XhVb9NYKbbYWI/gQCHGeOSQx52CQYyioOEXkcqPC/7SN9BTLXQRHRJ5hAd7vnK8/H6X6oQSxJg8MPCHMAF6ZusI5XZEmbQv/Mg69ncnCcRpqjeWw0E/MKrZCh8zWIC/HiUV7Id67OOMjGONMbH7hgGCm1inmO5jPicHpZhcSSFdwoTQvXP0ry9u5p/tCZzCmAifJfM+w9NCCW58AFuAcmZn7pLtOYuzUJHt/tB5cy3SL36Ib43HzLkzCDWu6EBIgxWBZq0ydiVOUhU7B3jtSuozARIXJY9ZzO4zAW8/hTscWXkhgjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzEYEJCpGAVoSFS/77n0upIrt281k+WuWklTX1dO93Y=;
 b=VcPyvRdFjuSnObn0qNDCex6CO0SMMNZE6oXavsejBv0JWutbdYMecDZjIP5aIlQEDV94/FqWkCKWtNPPOl+IRRTqUgGYbAp1h42ntGaXmxagkY/HKTlNXkxqdWK9/dAqy9mTfkdUxs7XMdSiPptv9LnxBQSdPpsYYUaDgXd2585MZaE/7OsUuaGX5xwmcpuzklBrG3MF5mgyqxV97HugGuWSYAVFrpgflHYXvmXFhK+EbW+z/+qUPF/G7owAbwa27OPdsZ/BH4dnkkt4KvF7X6FAtjDoatECEYuidVrjrafslm8R3h/l1g2FlavQO2khAboaa2uQSwqryZLR99s/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEYEJCpGAVoSFS/77n0upIrt281k+WuWklTX1dO93Y=;
 b=KsqKFkpMW31MsqPvm5JxiAHg08mTYHiV5vFdDWK4oETwuw6uIB6YKU1wARKq+Xd01uceaJHjetpV1AlLFnJhZP618C8t1A33h6/zQPXtH1Ocsj2CFItObYzDX47+YMwgn6/q6Sk4jNsfbfdrJ4qAXuTcpotvj2wUQA4c9x5dwejy5uX6p/1iYwHGq7ELmvO0q5g4zFeyFwmTsj/cr774MIDID/tVIPPvDmiaTY2wLvkI3+bIofEJXBsEfda9kX3cEZkiiFdhIluZkQ4oYn2lblLAUx/f28SgILAydY2/gFXWaQ3O3SrW+xjSPrpUqEcNyMJrq+rUyHWeFu1HNUlI4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8021.eurprd04.prod.outlook.com
 (2603:10a6:20b:2a7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 06:29:13 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 06:29:13 +0000
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
Subject: [PATCH V9 10/13] arm64: dts: imx8mp: Add Root Port node and PERST property
Date: Wed, 18 Mar 2026 14:29:13 +0800
Message-Id: <20260318062916.2747472-11-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260318062916.2747472-1-sherry.sun@nxp.com>
References: <20260318062916.2747472-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS8PR04MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f43ed2-91c8-40eb-da28-08de84b7ac2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|19092799006|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3pTKTrHQ+6U39Sofcwz9B2bYdTMRvrNwvTz8eEIGtvP8h12b9blhmHP3F/90bq+SDu8+fWoP0na9kDbfhgQ8ZnL+9O+rt+edhuLehNsuV8lSmbQy3Z5zNBn6Zdx3JfvVMYUYGhIv1mbG51J28p1vcaNOOEyJyYJ4da1Xa0xsTrHmfMwo6n1zrk8K1PO8m3E/+tL6DClNkB/jVzQCMQfcPSThmNWnY2p6QfYbGZsdws5Gg94vWaVv0Ak0KSdz9N5szyJiecPDuGmHARZtzDmpcbXvA/YMjdha8R+ldHpKRMq2d2WI6efWapwZO7hP8u3USTQxMAYQHmAH47y2qSphZaWCgkmCxKYHX8eIO6/+XJWFPrSjGVfCpFJwAVoelh78FXOO3vHn6/BuqH8G504Zsn9SutYTnf52jmYXliCaIGf3cwq6l+n8MA49luUTt5KiZRTWC9rUMix9htPu3PkWFr9XIIN6sXNXU0AEc/53bD6Jc8PdkhgcfckRZYO4Tmmh14MSF6i3irfO4rFk7SzMTl/Ru7OAqDBQUEMFOnyJloWFDavhSX16UEmRjB+pzVEMqblleavWk6KMpKrhx+gw0LnVVSOslzJ54sH58QsSrmYBO7ElMvoLSWStyfq6RaUqJrJrlzc/CHWgHPfoVf3OYdJLjX0kpQ+aikd0g1A2RcuMjMDaG87FDyKMjVAIY+2RX5DUe3Nk6DgVUAu+K+0CLGX+NNsFOxnjruKgZmfRxGkTLDD2J/ma2FLOVSzOpLlfS2nsqkgzP+9qG3p0uXHnRsE36snUhewfsXrar1DcD+IIV5FH/c9JoFTRId9WlZT6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(19092799006)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zCYvMbZZp+OJwnXo4MUSVq5e3GSZLoUzQwWvA/bXw51sOCZQirqSA+il0K/V?=
 =?us-ascii?Q?VpAIPb5IiaGhJnlL+3/eHHFh6LeenUxmIfQwsXuJINRMTJU3e8LzG8VC1hq8?=
 =?us-ascii?Q?f57tvq1h/a6JSM4gfK+NkulM0QFj++gEOzxFb3jjEux0mEZ++E7Dgzb3vlUR?=
 =?us-ascii?Q?zhOOQNRQ8WI/ooX2o9XxMa0o0rTVL/D3itqSvx/aoM0gy/vpRzrsMDHI98ux?=
 =?us-ascii?Q?tIELUm9x/2dcRFjFP/TdUv9i6Og33RJRewd24THaudxvwh0+vw8L1LRkPi0f?=
 =?us-ascii?Q?M2OcM4fdQbEtc+UgtDsKB3EWxB3OFJafrzK3/To9Tr58Uz7Ez7LdUlMnaVZc?=
 =?us-ascii?Q?2PFzrqI7DBkdpXssMiEcaR1JhvJZHq730aR8EsqfMlquXsgfco07WsvdJDao?=
 =?us-ascii?Q?jN2I1SOz6jWPg2txS7xaR7nTR3XLvRiAVj4EK8wMB1sLehIKaB+5cphTDu4M?=
 =?us-ascii?Q?JQ9tS+IWl63hKoWVLiqtW3tZHPT9aa+DRUB3kFOBF9Q4i/Ypr7t1+AoAUiN7?=
 =?us-ascii?Q?WRDDQ3CL3ZEKlwEaWShTQa/VBOglKKvgv8G3Gfr8dfBj37Z2gzwn2xP160FZ?=
 =?us-ascii?Q?OOHaddPcDIDJCMP/d74qfBfS9p0hHzdcNcmE3a1VLpWUBE0RYHwr6xgj7r2F?=
 =?us-ascii?Q?0rY9DU69CPbUEhCZJdvb0T0/d7YrrwYDJtFeYlN9DPQo4Uqipxi5k1Gh8iT9?=
 =?us-ascii?Q?pPue/fhgatZhQJtcMVHXRPogx/hUDprwh7bID8b+wE8xWgzF0kNjM7fjxF8w?=
 =?us-ascii?Q?r26lRx30ckPIhPXwhG3TYr+mra/DJTsEqOJ60xBb8uUcFM6xxeChCo46J2dE?=
 =?us-ascii?Q?0ckXOSUNfqrdbUaivbgmnLkRMWzapK+/kUb8+0qLmGrJG/IRT//DTMSdQoOb?=
 =?us-ascii?Q?/vMIfRQWiTAYRn8wrL+MI6j994GRb3Fht5rYXNA6cSLkPMKS2FL7del/86D4?=
 =?us-ascii?Q?kanc1G8lH0y7ftnIjgYp7hcS0dB1Vi75n+oFteZEtiDYoBo2nTbZtl0hkr44?=
 =?us-ascii?Q?xRWIoCTZwX9tZ8SbBt9y1tMgVYHAvc6eSxcpOi9bG2F59RJ6v4Gx2hhMwmvM?=
 =?us-ascii?Q?hJv+LIL9dcnUrjgnZexo46OPz9ciZ4vdmNBtQvrAtFcojO6w8VYcC3Q+xPH7?=
 =?us-ascii?Q?0A+LIdiyI8ebqPYKepcM/JHx4B3jYJLeio7dDQ7fOdbAhCBkLGk/UQlC7IXR?=
 =?us-ascii?Q?/3UJ0IUuwaTlCUt4AIoB0qNacojX53ShaUOgAVhwGxl7LVJTfi9DqMJhs/Cm?=
 =?us-ascii?Q?fnkWbuQsVx1bfJkDnki2wrEucKtLW6XF4VdqFSgTUnTB+eT5XKIYO79RhS2I?=
 =?us-ascii?Q?WvGSlO4JZDhzCN9oPAjG/oHE1iHSSAWe5vesL3HstAadqyK6TSMzOQex6jKM?=
 =?us-ascii?Q?w5TVeO5HMkHeADGkrQyqXbMD/JsrXcrYZGc4qSZ5EOUeCcgOCHdW/c1jzSbP?=
 =?us-ascii?Q?rvKdDeNDfni2goq0au5rHOa0u1Jkfe2K+PdsZ/AhoAOJB/QjW45bayRSGoKT?=
 =?us-ascii?Q?XWuydWdqn2DKYG9dYPWQUtXJf+RUyaZmMZXUpWg2hee/DZvDgkE9g285XE7/?=
 =?us-ascii?Q?sn9cxiqxOUBzz7E7xgl4PEfliq6uECBXmkOhXMrEwoUoI0P/HScVAEXujvaG?=
 =?us-ascii?Q?VAOKKG5Z0V3DDHHkexHKHfkYLggMZ7XxkaK9SiIurwNTAhtz/t7+b0GxbJP4?=
 =?us-ascii?Q?VVpFFuPOvdsyi7f+BW7xOPwisicZb152gj4v8edAz0iHbK/sVB7Hdv4FpB3E?=
 =?us-ascii?Q?3HqyYyys3g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f43ed2-91c8-40eb-da28-08de84b7ac2a
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 06:29:13.7982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XI1SsvAhpkchCzHkyNtFoaXnfcKuZgBAihxo2Uun+S4kbIwKECj/nQjYWe2eCWHOSFYZj2n+XjNkiRel7Dvmlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_232916_877898_1C019537 
X-CRM114-Status: GOOD (  10.85  )
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
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index f09335e6388d..8290de52ec90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -769,6 +769,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
@@ -782,6 +783,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b2b3a9bf9e8..f66667735a02 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2266,6 +2266,17 @@ pcie0: pcie: pcie@33800000 {
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
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
 
 		pcie0_ep: pcie_ep: pcie-ep@33800000 {
-- 
2.37.1


