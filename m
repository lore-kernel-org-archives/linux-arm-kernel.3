Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E32CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q6oysZNWNYIk8HixiYkUmpZpjdoFdfV0gj3GlueBTrk=; b=EM5tfpBSXxllDsAhyMknuJUfju
	nK0A3mG6MvWRm3Zc28V+iU54xo1QQoOMOetPJl8lq4Qfq72lWIrt9Zko/PmeKgI4r2wI2FOvH+2Oc
	+gAW7TCgVM6TGWV1fY6UTGyYWK5lxWH3EIrDNbN/j4hDL28chDaIijes/HNdDCAO0TWdZRuWiwHjf
	d1ZaClrd0XKmRpxHPrMsSbVk+1LGGEb6ZKBzg9bBlqdVpS2nfa2cfEEgNcU2AgjEVR/LNoA/eW4X9
	dOEPXBLKVWXOKhvQapnCY4ZmgnCSzgcqrA/DmAT4hWv+SAinI3a113W+ZkhDX+0CpqVyoXSyStcka
	xPm1/I4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZyER-00000000NVb-2tWL;
	Wed, 17 Jun 2026 21:55:35 +0000
Received: from mail-northeuropeazon11010053.outbound.protection.outlook.com ([52.101.84.53] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZyEP-00000000NV7-2ZiU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 21:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIMEJTqa7oxWSus37RwxnjZqnLfc0hyEOtu886z640XjxfxNfoPd+TtyR48Vcc1cmpT8LfJNey5olNHAJVAmLrz+A2PVGP3nhSw4KLMTUkUqL/DJT5sogG4KaEfIOcfLVvp0bJDMMqwBSSfSMpP/RwKw+SkpyIgJFZNdS4Ck1/vBMFBReQltvUNmgdmp8NdeF2co2fj9tdl4fntCRIChJSq0ZrIqJ90zr2qTP76+tIilC4N8YBn2vBgwzR8pRqeVtM7+kL/IBBBaIgYp804mSFb1cydbUU/oGNeMYkE+9LzAqkcQtYbEvfIQ7n/I6K2bI/PXG5uz8LHnolYNtDJJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6oysZNWNYIk8HixiYkUmpZpjdoFdfV0gj3GlueBTrk=;
 b=JYm84aJ/XwCsanfEoeBtpG/x5bj9kN6p6cpkgAzT6TxvXbdA/qqeWQ/ALNdIiS0rMXimqXI8tm+wKWse1kf1mB6yfnnY3w63Xes55+Iw+Mc3mZGxsq6bROJcqDTRhhK6wW2BwNrqX+d1q6vOsuJcCm9ayaqp33pJa5uty38Xw/V87hprzaeEXs8B2GwZUFz5m/ZhAMvnwt96UugqapmDK+XVrQDvElUVThsG3dy7ldszKGTTvsrf8zL5vSC+fl/qRjBjaQa1lUMjZRyhoD9GQ+hSKXy8UEzCV5meuwRfEKy1PwKgyM1wSu+/F5s2FOfm8EfB1k6CYedAOXkhE2NW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6oysZNWNYIk8HixiYkUmpZpjdoFdfV0gj3GlueBTrk=;
 b=qXzmh2JwCthxhyt2yVe4VWqwdfXwNKOcmoD4U8cic6iXg5fPzGIE0GQmQ8i869t8tpJxIAFH0nLlrIWGSDRj/o/b3K0Db4FAfwBROSfCUVDIEFvnj17nIP7bPSJE4QEYzsaLTkjbdPRY0R/oJRgGqRv20TR4x+kc5ZTTNNCxLHC47XPmqBVdg5f3RvcXCW5c1Rpyvzuw8PiPCnkLuxawRWE1A3QugWk6R6rGBzChnsLIYi5ySbegbgka4uifo8l1cNcbL7vHgc7y5AZKhM5IPUiRQhcHQWtifQ5YpadE3TrinMUvCXOreYHy3gK/DOXVn2v1Vw5ce4r/jYPkuiwwgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com (2603:10a6:20b:446::12)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Wed, 17 Jun
 2026 21:55:25 +0000
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308]) by AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308%3]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 21:55:25 +0000
From: han.xu@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Han Xu <han.xu@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: imx94-xspi: add the DMA channels
Date: Wed, 17 Jun 2026 16:55:17 -0500
Message-Id: <20260617215520.3327836-1-han.xu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::9) To AS8PR04MB9079.eurprd04.prod.outlook.com
 (2603:10a6:20b:446::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9079:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c816b3-2bbe-4f60-143f-08deccbb2325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: yigWWE+g3mqD1bskbIiqOPkZpF3M7w+Yptxa3ZHc1GJ2tcYP8XP7ubcNVOn3DaN0GpDWvQgzhcUq+DUBLW4OHBrWyEugMkMWBdJTKI7gO3h7NlLvdyd4rCEvnGZmyoz/BU8SImvveBS2VmdpALcj5Wm/Nj62PvYpctq17L4e9nmeGakLEO2nNe19oZMQMZXJbgIRWQI2kSXM74eF6IkrrU9/j6KTzSstIiEwo20mgnoNKXhMr1TdzBzyrG7MSzXs0eUVHuJuCV/Yw07ZIgMuJrEogZXiGdY1Tv5EZWA/9M1L8ZuMHGhBJZpZEvPZpMl5w7wM8frq5YHoZAItA5O8x+uf0eUIsyrTUDLPLHD92g+ZRrmqdaMnyuFC37BLV5VzaiEYW0KReE93eb3YTtJZuMLSZ/cc+zoFz2cXXX0I5cGq4IqjiyI9Iveud8rqXO4SMvAw4/JXvS6sCqmY9I9gmplCmbFZoINdABLXGWG1izRRCAG4LcGYX14L7cXMaRFyUmWm9bXUzd25bS/aUbvpTwT/6rQaTo7O65ijDUcpko2oqhEUbrRjyZYq1yl9L3bqhabn72PL5gREM2ZzoDi+cpafjlI+Gp62iS+iLGCiIplVHLfE7692QjdHiKCNAmjrmqavd7EIrjwwQQtIwqDnRddVPpnxVpbL0WDJOwQNYdB1FpaFuLM8A1VOPvFrGVEN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9079.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IkgdlbKneKnMuR2b86Y1Kaj3r2I6E2gUe3hTXAnjlZSRcnRgBdrqcKM5yXuh?=
 =?us-ascii?Q?Cn/FDHmpI3om2tBSJFIFLk/KG8xVEQBUzIbDwacWqkZ/tkdHMf7BdWPkMsVB?=
 =?us-ascii?Q?tIZ6uAXQwDldfzkJmEO3/WG4Z5mQrl9uL5cr+t8bIlQyj1OQrA/oj0Jj5vTh?=
 =?us-ascii?Q?+Bc3Svgrf5Ccw7zWo3EwPHxzUqIdCIxSm90Z5PviyjMI+e2hg0Is3YejYq/U?=
 =?us-ascii?Q?Mfi5EXeNOdtdf5kglF+zKYDN6rleI9K8c6epqOu5I4HXNXVBbd79H5vqoBPM?=
 =?us-ascii?Q?TEHOpt5HxncUejs1vxOQwHexnojiPVKEhenRxAfnuFeWVU7CBsxTzK7+KJdS?=
 =?us-ascii?Q?fhSM63lrOFp+3w6torCtpd35TKpV0RolUTZdsQIy1Ub7cCUeAhD27yKekPfH?=
 =?us-ascii?Q?oK1hYvVI/W4aMocoWrLuuHsxz8cwQlG8aa3Lvhog/NvO4ZZKJi9JnthI7Vo9?=
 =?us-ascii?Q?CROVvFGTci+bvz1CscoNbQQQaDfbaXyUROPAP1v8Q7KfKBsd99vWCAqFkf+3?=
 =?us-ascii?Q?43g6PdxJebSBiPD5bpsvWqpwUckpajtfV7vbLMThrJ6QcciGTW5cbztsAHkA?=
 =?us-ascii?Q?G7/eJJ1WgF0IAML13NckBp5SEGq1IiejgUyDTzEBv93xe3S4kdIyB4eXXZF5?=
 =?us-ascii?Q?f4Rh9vwxIszKkz8HVmTsTICV3xu1J1OF/6N2sE1LqFfl5x74M+U18OIH2zTm?=
 =?us-ascii?Q?LZ7FjZiUC2vojZ+WFrNEsa9Nir/iMX4v9t0LLoEWmeJO38jCyNbVIaIiXHKS?=
 =?us-ascii?Q?4HGyrk4Vmcq419WhlVU9qJH0+uMYZlDaQ3xBxxuivCSUpSPc5jvCYiqd2Uwz?=
 =?us-ascii?Q?34YvfSWa9uQzgYxkCEK76dKhND9JcwctWbmDYAkQfk96TTfNQERdav51z57R?=
 =?us-ascii?Q?ZHo9JEO0TqiHExfF1VHr858mBuJ/a9oEMOWDlABbO3BdHnkCLHu7+cy0cVKd?=
 =?us-ascii?Q?YT3OOUP6Wk1bJ2D/CwC0EhQL94Kl5t5QUIgMKE+nhIGgcr592SsrCg5rh3SG?=
 =?us-ascii?Q?FBaXLuWMVWxdf73FZgtEcQ4IHiaM9Of446KNMu9eixyn+WaVmV15N6wets0m?=
 =?us-ascii?Q?ZzOzgTY7tLNv5jvFljmiUJ7eSexoAP4ttQAfbTacw9A9mBoFD5h7r85uEgrJ?=
 =?us-ascii?Q?OL8VkNO7XFSBvh6prXlVbWfsTr0/4zqQeJpoBUIwkxCROFbIo69l1Rjvtw2B?=
 =?us-ascii?Q?a9YiRcM7G4QNN1tLOoRwELr8hXTY4GnlkNbLOE1sie8LZeKLq6H7vsGMCwnI?=
 =?us-ascii?Q?w+8Yiq3cXpbl4JE8MMSJjv0MG6y4+QCea9NOz8BwwxHFck3GGT8wnkn4pOT3?=
 =?us-ascii?Q?EIC+mnDPt91TubySX07rGQcTQ9BEORFvCcaZOpyM/BX9xn2aEcpxWinvJuJV?=
 =?us-ascii?Q?DmM22B9JdNuo8/0dkKHcG95uWrEuvnM/SXqONg4fP1BXXXD2YsbTUNRPDFoF?=
 =?us-ascii?Q?C3hrQfHvGpNz3JC8zK7U/3hP09l0YjK6kPPBIkrWl6g+t9foiNNyK56ceKjm?=
 =?us-ascii?Q?GvVLG9/qJy88HHFFH8zzNzCJiS2P3hWOqpqd5l3LbVuenhS3thMe8w5c28OV?=
 =?us-ascii?Q?eK/0sriyNNGME7UHRgqzFo0VxFns2MsQqaRo51DMegjYGJF+Dcc4g6zdYQAX?=
 =?us-ascii?Q?OCS144Sk8k30XFIkyN4HfmSU5JzYgLuI01GsmvZcnttjWYF84nnskCUfUIo9?=
 =?us-ascii?Q?KXKx50z9b0oKQOIrQdiTG1kX96yONVv8X+y7wLArmAYtFqQtRcG4ochN6WcF?=
 =?us-ascii?Q?Doy/QyQu6WpvSfg5UAIzEzWZBXWZpkE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c816b3-2bbe-4f60-143f-08deccbb2325
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9079.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 21:55:25.5129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FF2ipmU5kjM6UvwKlY2o9RFRlBIm+rtAsj0zN3ICyNxc/Iv0CGReKta5UpgMRy6c6DUOtLlBq0Nbiji8IS+Y6Sa6vD0q3GcEUHw7vodHFTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_145533_660563_F6101B5D 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

From: Han Xu <han.xu@nxp.com>

Add the DMA channels for iMX94 XSPI controller.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index c460ece6070f8..9de1b9754450e 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -820,6 +820,8 @@ xspi1: spi@42b90000 {
 				#size-cells = <0>;
 				clocks = <&scmi_clk IMX94_CLK_XSPI1>;
 				clock-names = "per";
+				dmas = <&edma2 27 0 0>, <&edma2 28 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -836,6 +838,8 @@ xspi2: spi@42be0000 {
 				#size-cells = <0>;
 				clocks = <&scmi_clk IMX94_CLK_XSPI2>;
 				clock-names = "per";
+				dmas = <&edma4 42 0 0>, <&edma4 43 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 		};
-- 
2.34.1


