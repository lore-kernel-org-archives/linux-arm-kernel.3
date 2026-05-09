Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9C9CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 01:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbMCHyZI2NRDtVmJbDtIPb3u3G7k7zwlDU3y1jHqPUY=; b=U8LOAhqtlt8iq3CEpSbxuwWn0l
	oAME605LEDLI7oQDmAvplNwnW+QAot5MemQwB+xERQSKSF6Jx71858XNp9ZfoZUxOT/dLPYM5f19q
	jhTHuHPRjYkhBEUfn+Slp86W/04AykjitWn+N0QwxLDjKMaEnjGJGKOPIQtTamNuqX8DSjLKoN1g2
	Fy5WcktB9IFZplMDf5i2vMt4KjhEFIFnH7S66FvI6WAt/XgUYlyO12jZ4RZVOc2lN8S07Xbyd18gC
	dNdn/6D2p1zKJrE1oY2NBeY+dBf3UlLklRblNFK/ryHkfLBhtHc6bqldrxOXPROw2cPcrAJC6bMkM
	um5CG0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWrf-00000007we9-1YJk;
	Sat, 09 May 2026 01:52:23 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWrb-00000007wax-3FST
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 01:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIERB5QsvtoL+eFiiAQz3XbdOUPTOmw8iOb79UThNiZaUJNqiakR3HWY9CcsQsFilxu203fjTfHudgHx5EujxrPDThqIF1IWWzaCkipGFHZtKYZm6qz15XMcs65VSDVc90b1dLRZ8lcdVBtUt2wTwfqgMLr/RSSKLM3EiADW6wqAu2SL3kV6YLaF7yXEzS058WlrknBwoFsSQ3vP7SvvDGMmGkNI6Xx8mRwahaUvHdeO1JsV3bHemrEP2oa7lp4wYVAXwKA7Y0pAR1JVmT9RN0gKMneIZK/iGdDuIftKw3JTWphatSKVBM/nTdBLyR5UxSc23w8ODPetg3yEbZnrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbMCHyZI2NRDtVmJbDtIPb3u3G7k7zwlDU3y1jHqPUY=;
 b=SYs2w2aLsxVycwscCh++UZPASyVVMMXwqlhXH6NxKvakv6TO/XP8QHfBgrz/GMnxPb6G0e9ApmZE2qQKOcGxwyN9ddZnkjIY68pK7+KVF0kdrkv12rvI4doJlGTVNCScGqdB7ziJkv/h5scLA+vnT6uabIq2XaK6eigl2a6FXRh8XfB7rHvT90XBH+QXq6LqfQTo2F6a+7ZYR0H6VwkzFdwnTDDALi6jBjS7u0uVCUkoEu+Y/aI7hydXy3FbBro0vCk4vudGrdjzwasT8YffuX8puDawlV9dTcUTnCMlGc+5C2y6U1yliLBQugwGWOsPkgz3UrPWSMYc/SQwrvx8/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbMCHyZI2NRDtVmJbDtIPb3u3G7k7zwlDU3y1jHqPUY=;
 b=K9cJBpdxVA0KjYVOXG4ytbYToAMT5IhlftZUf2zew83CDALewHywAcnCSOJeWn4U1RiMhMsqjYZFiuUt+HX09neXhfyWEeGkFHukAYXdEk7P82VWeDF801dIcVz6PSI2dp4XhGqQpc7+jIw+H1P1ACmQaWqnT9nZtm7kHTFYvedMOdl+Q5SXp1jo5smIjNaqqduICAhWMMTyz7T2TTJxXmdC+XsKjO81ZK7XEmZjUMN9osbBAFZEInGBubaxMEWdhJxV8gZmU0L3VPdCrYLciB+J02XviCp3NDLTIwWBph9UvCs5YAs/ZI8iGFNylgdfIjI3826r7vrwPyCp2hOEfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI2PR04MB11027.eurprd04.prod.outlook.com
 (2603:10a6:800:276::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 01:52:17 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9891.016; Sat, 9 May 2026
 01:52:17 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com,
	shawnguo@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: imx8qxp-mek: Remove unnecessary PCIe EP vpcie-supply
Date: Sat,  9 May 2026 09:54:10 +0800
Message-Id: <20260509015411.3218700-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260509015411.3218700-1-sherry.sun@nxp.com>
References: <20260509015411.3218700-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI2PR04MB11027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7301a6fb-f4ae-4041-7e30-08dead6d99c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OlJQer9AK5zv1wIDstgsfOyZbYzjqSU4UbbFvlSL61aGTDV/7f1Qt3TSf1mCz+5L84GLC0lhNNEFBKPM0Q9pQKMesrE3AzdqlF+cvdrffL/CUCRf4NIVDHXGykTRzly8R6aYE35kLoGFcFFskbXNnmVZoNRJJwQjI/OCj1TQpi9wF0ALihgPd0LwDBiv1F0UQaDUhnhvbwOg9RsOsaG801gjCI/lWleZYDjCUM+AdQhGtParKi/Va/GdKcuOXG1fr49z2TNZQ2sNYGjDgu951+mXrD3T6dKbkQ3ovcAUDwdMEwUtTg0e2GEGERgpiHGgSVm56KCLI2IpWsfZSCRf86ZVtqbG/k9BMHahhZTWiYMwfywGTS/s6CUUKrMu6IGf0sSDMcoK1ZniV+UWyXMnvlvuO7wazthVIthazBFfYPs90psdHlv92UBL5Nhq+exfPYlRdXKoX6tY/StWGEHpSh19I1mnmw6aj/QFXt2pCfUOHp13xChWrN1MJqqnsFW9iYM3bIpCEaEZwRfejrAus0pABZZzS2KHQ4JFfTleAhBi172thno/C+SPZiNJYJRaq4TA+O3tODdM7EkFlrfBsVRwPN4VPhlrIHP/bfpkjCPON5WoPfIPAlUUn2cedDL+hUdtGW4orrLD1UjYASfiZJljxrgaTY6b22/EqvQfgMByxROrLggsthZvxspeDtObNFec3D24VcYhaJGEo27BDJ3jVDGJyPSSp0MsTts7fBZr81SI5yB1D7XeoT2wW5Y8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xBrA47EmSgvFUBPhPDPBnITpX8Squ6H3QET0PigXc6yRunw4ipKdNKP/CyJS?=
 =?us-ascii?Q?URZm4Q2rnatOsCftbPRT/uPy0LFCbZlJcnNg/TR7iivts6GSAljuY6pQBm/4?=
 =?us-ascii?Q?XB5ywQcJNY2kffDgcc0Ktj8E8UoIKzzoO7n0Yr6xpJGqwGiB3C2Z+DPRlxeU?=
 =?us-ascii?Q?I4bT6GRsVOFJbn9pKyBU32sTd15ln8QeEQ9yDh7TzYCuL4uDhBdZiq6PBmHd?=
 =?us-ascii?Q?05OF8XC+1goS+/Y9A9bcZiYE/VzZatoWeSGabuM9oW87LHTj4v2pZA6OnFay?=
 =?us-ascii?Q?Km6aqyrcasKFkiDYorMCcyB4PaUxJojuc283NDXuF66P7GiclfLOpA7uQqQe?=
 =?us-ascii?Q?jl6AB/s0afu7kj2bvc0MSf2Fwa8dzFSHX2znZ5cLe61oocCnkYNiyptphQy/?=
 =?us-ascii?Q?FDvn1En9O1GDIYj+BOGrGZKsILLf1cUNN3D6eK3XN896yvL3S7JLa1PG6Sjz?=
 =?us-ascii?Q?U271+dV6CmgQnbhrvUKFXrp63adAdfqAgUiGEocTmYr2723FiblHhw2v/ExT?=
 =?us-ascii?Q?utTjOdvk4OC/0qv9tReAL3pco2GnDKTJ3Oh8Z8ubbi7D7LMgk+fQqjWzZxgM?=
 =?us-ascii?Q?94TyPgU7vT1Y0Jx/6UD5xeMpR0sPzuiNsZ3PzVU4GSsA7zlZh+VuRftnMSFO?=
 =?us-ascii?Q?0dvvfrztNQy2NvaKc1x1g1pCCqhuRkZHBI61TbZzAYcTPRcrlK7yaqbwUbTu?=
 =?us-ascii?Q?r1Ok+0j/N7ZvIGwAxerKhHzVrgPqQjtUFn0P9F6++ztmEz8ydD+KkJ38LJgO?=
 =?us-ascii?Q?Hh5vbE/gasMiPXfkyVWpT4V5ZpCBMqfvd0K5z6nRYYlG1eFxqgyJZ+CYxSae?=
 =?us-ascii?Q?PIEPUUawnWeYgcpAqAZMUDznaow6Igq0LqbpYO5c8FodmZwkeZDwVOxKIQhE?=
 =?us-ascii?Q?zadx8mLLOdsMLdM22XEvKO+zCaRoMnklUZiGAIKGjQelGjPieWV1LREkDAVF?=
 =?us-ascii?Q?J2PiS3LF+1UBJUER1GGZLDXxNqwj8FFeVGwhmnbweuaonZGMJOrKg+OBZ3FO?=
 =?us-ascii?Q?V/S/RstYuefor6/WGuuylhTqkDYsGgWCkWtK+WWEjCehckLaEevfFQu57ZhV?=
 =?us-ascii?Q?qNGRkledzBF/OlYm0FGtFRrL+qtS04+zp5R8azYbjKParSJZCygLZRZhKZ/d?=
 =?us-ascii?Q?dgxcNDS2/GbJ9G/bjmDb82i5Yt+JVs5OopOVzlAeLfdM/3TvNXJNrjMfm8F6?=
 =?us-ascii?Q?v7dlbnLUC5hqp8kw4se+wJ7ZzmUGMsaPcu/gjdr+PRMJHTI2++x3MOca1Rtv?=
 =?us-ascii?Q?gf/1iNb9ovZXMXq5Ye3lzBKkhuhU9+VaXwg/JfuKMRV+4JKA9HtptcbAen78?=
 =?us-ascii?Q?QaHHeZj2GWLq4I3bs5TZLbciohIHOPb7DE0uaB4iOwglwd7d+Ay8XMLcJp7D?=
 =?us-ascii?Q?J5ecrgUW32EbYTdrm0t2NN3MXjqgf38cOyCW3OY+6xCMAECQAZroxhOSp4FM?=
 =?us-ascii?Q?Dpry3VhmRKGF/9a8IdYy6f8hSLTSsrsjZOBkHY2mOkCiTuSSJA/cQNYNDj6a?=
 =?us-ascii?Q?sdfLV96gtPfphcSJiwKUdcET28BMH83ilywuJk1heXY5Hl9Ux2fO40AHa5UQ?=
 =?us-ascii?Q?Y8l4ORtnjNjJWJOI2HuTKwxxpe8hV4+kdNtXxCqFdgVQn6fXw6H+/UD5g4k0?=
 =?us-ascii?Q?U8tr4o3WLXneI4XIrEA9IIvWudIgVpcT5RLhpipOYcpplJkshmW+4an/iptF?=
 =?us-ascii?Q?RM293m/2G2OFBbNjjXVMKZEiU875pq8jfWu1Lp3a6T1bww0IFQkeIuCdJYwD?=
 =?us-ascii?Q?Slv99xZhfw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7301a6fb-f4ae-4041-7e30-08dead6d99c9
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 01:52:17.9162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfClSagJ1B2ZvUP9vg+Gh1YaFDm1epeGVMOU7Qz11h7KiShXgK6R/n+QnmPKMRGN2Oc9KdXENR5P7TWyGjf0dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_185219_906281_C518659F 
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

For PCIe endpoint mode, only M.2 power supply needs to be ensured.
On imx8qxp-mek, the M.2 power is always on and cannot be controlled,
while reg_pcieb only controls the M.2 W_DISABLE1# signal. Remove the
unnecessary vpcie-supply property from pcie0_ep node.

Fixes: 1c9b0c6044c2 ("arm64: dts: imx8: use common imx-pcie0-ep.dtso to enable PCI ep function")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 623169f7ddb5..c07138055229 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -742,7 +742,6 @@ &pcie0_ep {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	vpcie-supply = <&reg_pcieb>;
 	status = "disabled";
 };
 
-- 
2.37.1


