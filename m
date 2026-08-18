Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF7CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6ZNwKrky/lThoffrrbm+MLvOMXr8hXSrmvT/j22RwY=; b=SyDxMxO4NxciUVerv2TdNEVfzQ
	gPUdhtEWvIntJhp+757gogqeN+5d8+xvNp0aJlwd+pmw5lWZXwXgzqgP4HzlJ667HfQla2imoSsvV
	hs9E4M4g7kI7mURTd09wIlV7pk147XZPUTMLF5x+LOoUVw8Jp6UqoHyOUFIJEjNKFI9cOMyq+gyIc
	QMex9jqVVdsuPbl/6kFp8cRYEBCGR0ZU8yPgKHU1U4PNP/1QAg+UIWQeBPV//x+0SYXF7vqlt1vfq
	WhdrmpCl8vR20NI8Wcfyv9byl+PMdBAM6In3TRjvdzc+KWKqtUYgPFj4qmkm61g6ZVPCxpqxYIl/I
	JWFnEeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA7M-00000007938-3Ssw;
	Tue, 18 Aug 2026 03:04:00 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA7I-000000078yN-17J9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:03:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh7PyxrRKRzULt6ttuHlXvIF104jQKFpYN4lNkNOElBw7SKTdSyjERS/X5blleAl6518pMLHQ43JHICPUASCgKFBvyvWp5KXA3oSCg1n3icVHCnu9DJ6vtqpbrZz4e8Yr3k63I51TxSiN/mXYNFMR6iKcOoh12fNWdXAVeLk5mPASG9+llmr8Vy5a5Kw7Q1Sp7PtHLd8PQpz8+1orfitULgw/08mjs++/vBUx2gGhEIofg2kw+Epjo4yX8X93F+1yRsXNq413VrswTApjCKPPcu3amsHK1Bd7kLA5WwLTWZLKl3PKTjPUnO0z52FeS111+EcCoG2jT6hd1U7w/7PEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6ZNwKrky/lThoffrrbm+MLvOMXr8hXSrmvT/j22RwY=;
 b=DOdS7cmLpdaALY3ZJTAy8GmMvaRAkc74HzRYZXTovsioXKHXbS21trnXTxLoS7nocXMwJfOEDvkFe2G4NKJV5j+Cuf5OeF7sBvtV6T1NXcaiEyNL6rrIZ2Dp428duG8L8YtwRUBIepGdeX0I1hlKduhHV6zW/TAVtk+KcQvWpSRehICFZy3+Y9Zat5piWtcYP7c6af84AKhKwyHzA+IvJjTbQf4I7drYtCps4dvjBajA8TZipsQd83j0mQdWB/uxduxfYO4EWVAC8krLPOhZR/nn3l8yCuWplm9CBEEtEKu1tfepcuzknHM8+oD18gLkhQobQ/AGXNG3k9sHJh9/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6ZNwKrky/lThoffrrbm+MLvOMXr8hXSrmvT/j22RwY=;
 b=pYokGZGEwxzXLGwmt+tlStPaJ4WxuS4E/I45MKnyfL+Huh6/BpjJ+vsdY3eep46IiTskPVV3U+e6CZIemlqFDig6dTOLbKjRnNgsVslXChKJRRB3FsKeWv2ei2IPj28qvbDrLFlRhYnT2azN9nrPOrNTpD/5v47g8dTaTlUkxnnM3Z+3VlVRCJ6rKdL7rTg3Z1uRql0HErQ01hqCskOHN+34/gpTKX6jOqXFbAIHJPLNm6HTkSIKnJ7RcydNuOl7CiA/XDFeZ4njdY+hxHBgr96ew20yzkoRQRwMr8zaxsMNfmz0NLU6ethafSAR0NGLB+G0f10bWHvr0xwTUiIWkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6829.eurprd04.prod.outlook.com
 (2603:10a6:803:13b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 03:03:50 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:03:50 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/17] arm64: dts: imx952: Add AONMIX MQS device node
Date: Tue, 18 Aug 2026 12:02:08 +0900
Message-ID: <20260818030211.3141710-15-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0213.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::16) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 90dc16ed-da8d-4504-70ab-08defcd55438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|19092799006|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pt0AT1STP2Vl51CRoJh7tvfAWpBDYmjQ+ic4i747gjppCNcOgg/yfZM15KJG4YDsb2VZeKY5rFGKg+J7Vc3LHHsqgEyEjzzpc+SggvWC8tFj5/x6jyyQ26tWwAvc5As8fuZhujiGswh0pxfHATSJT1f4y2KE0uhgVX5G1KWo3zhYUeCuRioEHXkYwceAVygHtOelRsGbrW5nZ9NfPHFq45rVdEJPBmaBg04IRlLjSYx+MtZqmoKlrVIobc7wyXvpS5ZQVeGnVUGPaOUHUzQEArBPYEa7LBzzfPpkUh+afZ6NPSU/2IojpzQzPfU47d0sslAiXH3qKj/S8x6pasTRqAIB+g+qRLkNZuGPOLi09smIRTpgOeOE2zXEbPT2AvOW/IExlCuwafsBs4Hy1eTaNnObYHBbdmWQmfxkDrE71zDajPfDmN4/KO0ubnN1n0H1syUyirFzCNSwdJ/CvoJkvvxYlwLNLON+RUpeTb+PqmHXvP/4D6hSKSpEoK+Mg006Sihgu3fu3JDVLWmUxqtEPTYw5423lnxs/fKx1EjaHCyr1oJO6V19lxAdDW1xKdCmA79ozFurdhjjvC87aZXFkG1U0blzeI5+7rHwCC0Df9mKgg5Gl90psa56fzXLT2kue9JquIKUQz4xiRRIEC225e7hnt5s1UtEMHcCxaTryKE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(19092799006)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RSLnRULTlVmN1wOhs+bgzZSr+bjS3yGNPn8R11+Rps+nbC3lLBEhvY7Ex2NX?=
 =?us-ascii?Q?PxsSw7u1ivM4R0mVp2z9BiwtsoXxqYXESGZY3wMopERYWZlfcxG/dR6T38E/?=
 =?us-ascii?Q?45KaecSJLnq15IDlvIP5bWacygq9fw48QFlfHALvwJIl4CmW1Ei1P1mjVaqr?=
 =?us-ascii?Q?6CKaIkVfScOd373D6ZBJvIibhWhBb/T+/TOBZjNyI6WtR91XLW8mIHo6qy21?=
 =?us-ascii?Q?Jz8dRAIsLvEiC8J2fxsdWNXYZJ+kjdwnZWS+H7FXuD3RxYFWmJiR9Av9Dpbi?=
 =?us-ascii?Q?QE0icc+5Ft13G7tWvpZa16Chk49UlvcqTnmASWgIvuMBwXYzR6fMTwSbmdxY?=
 =?us-ascii?Q?rwR2zy4wiK03k1oL02/DDPaY3QQxyJ76mCfEO0juPsazOBB+bWIdqSEyh+Wq?=
 =?us-ascii?Q?CNVnhGIhZJy2UZHuWzRw7S6K9X+4AWexNoe5QSU9VjyHgxcC0EnCwtG/a+Z3?=
 =?us-ascii?Q?CWJkdkRYuBkqYJDNIcbFMCG+8eIsTvkJ6s5lW0/Rmi7sG/p3AmATH4ZQW3Oc?=
 =?us-ascii?Q?yhITphBkqhtabXm6P6idB2tNDLISzM8786NNBJoo3umL10qkItanuu6dgHwL?=
 =?us-ascii?Q?xnOFCUBtEF0/NMuun9kPfCMbr9X5VCg5Lkdq10wJeBSnmFYcAOC/uUz4yMxF?=
 =?us-ascii?Q?B3ikmxxfxr/5FF5zgipB1Pc5VxYyNcoqXFFTSkiFZOOGst2/ucIBDA5RqHsW?=
 =?us-ascii?Q?U+ygACbfH64feCbbhfarWqrChRwpMsJXKZBIqGKCDuIlc//ZMtX7jlyrcZ58?=
 =?us-ascii?Q?Sto4pejSt/SeuXFMsf9QVoIDb9VwySDDoJAmhO+C07G9v/gzQQj/OedmmDJm?=
 =?us-ascii?Q?DHuk+EfP1a54T0H0GutikPbmZCVZevNJgpb9jlP17pwTUU6UxRpuB2ld0Uew?=
 =?us-ascii?Q?9+BPXTldv4+bMZO/DWlo/lbHhQ3jkesGXuo4Nm7Y1qT+3ZIwJ0p0LmazsQSa?=
 =?us-ascii?Q?+SC6sYHM+n1GjevO98EyZiF68udJEOnbAPxu9y1wyv7NNS3f7CEfZQw9ESCV?=
 =?us-ascii?Q?D/vq3X/mCA2M5Iq/ByMEPTqTPCj1i9coJ1uAjLtPWoQTFJmc9afH/DmP+MIQ?=
 =?us-ascii?Q?BzV4qzrdPWLJ7dzhy4H2A80MyvWyV0T18hwQqp23a2Oi0ZnJ1kzdfInMXBSJ?=
 =?us-ascii?Q?/f1Wp6zCP40yt1Kfeph0dDRAF7xi0tMUb8lYypY59o+9+fAzHuvOxc8f/7Fk?=
 =?us-ascii?Q?PzduOpEPZsr2CcQK0VXmnvqCD5GnAiE3S9dvGyu4hFmCShCKdpmO5Dy4GMNq?=
 =?us-ascii?Q?MX9k3sxsxGGKhBvznSj/18KQOPaaGgDTEg2uZjSCHq2wfXyMzn3Qd3qEH162?=
 =?us-ascii?Q?VJ1VUBcr7S2yFuv0bi8OgMav/jZNW3vadtnT3jQSaaZM/OYWMmhgKHntubTF?=
 =?us-ascii?Q?hfa0EUh+1JxKj/0yc2UEprGLVNCuFiylfFiUVLq0MnDAcoMPpAv1ffTCu0Im?=
 =?us-ascii?Q?a6goK83U2flhKQH3tu1fubcWBcbWTVJUh6Y6/OuahTm/3ZG+Y7V1Oz3SOFPm?=
 =?us-ascii?Q?wqf51IJiSC5O8fkDnVLQBbKrompe0ykmkXwq/WYICSJNwUTEgpq474ayGMa8?=
 =?us-ascii?Q?nx/2ZTAa0p4TBGAwSi5y+QiTFqTvQuuzsF5LYsbSRm6GuhWGt4QVj0ogLRDc?=
 =?us-ascii?Q?smuwtXJcH3p8oaT4dMxmSWTIp3FeyUcyuz2dXYCERy/N0ytbltdhMHNIKTdL?=
 =?us-ascii?Q?oDxdSrDadpFgo9Fo0r37RLtTW60MJayy7pt2Gf7UKigZgcOc+S3+pM9TD5qH?=
 =?us-ascii?Q?QeaQlAfnVZcT5PyaG5QSfYCUeqel1LkpXY9o2d1ehBdVJSAzXAfB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90dc16ed-da8d-4504-70ab-08defcd55438
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:03:50.5832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9CvlQGeUFnTEmv2Z8AABzmoQcK8zwcyIGap9+Sv9j7nXvT9yvgCnRHTNKeCi/7qLmQ05iC1ij4NvXxRSFYr2DL2aWCtFmHWX7c7H2GxB7sJTaz+H/TUSYg091ApynM2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_200356_310184_C6EB5C43 
X-CRM114-Status: UNSURE (   9.39  )
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

From: Chancel Liu <chancel.liu@nxp.com>

Add DT node for AONMIX MQS (i.e. MQS1).

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 020de00e8285..54dc793a2f69 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -261,6 +261,14 @@ scmi_misc: protocol@84 {
 		};
 	};
 
+	mqs1: mqs1 {
+		compatible = "fsl,imx95-aonmix-mqs";
+		clocks = <&scmi_clk IMX952_CLK_SAI1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@48000000 {
 		compatible = "arm,gic-v3";
 		reg = <0 0x48000000 0 0x10000>,
-- 
2.50.1


