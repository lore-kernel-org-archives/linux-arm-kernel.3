Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FAEC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKpyg1sB+mwBsoY3+ry505zkPRCb2DGcln+AVX1dPtQ=; b=LBlQqswDtPmC8hT722zFJGyrIE
	Aja2Vemq4QwFwrjCVt8FNTGarCwBvBlCbWXEhnoJ+rWN3oii2lBjQ09vWUGq2eOpl0wmrx08aelB1
	EH6dFIkKRnTUCqFVIQcmOzpxrknpo4z1VEhG+ibKdhTPBgSdbMmurMDZgEUwXhg1w+vr/dpg4Cqrb
	oIN3wur4zMQ5NfreBQeNCXC7RtoW+PP/dUducKr8OXVepRRwN7TFN6gfsfLo4OIIf8ijSFGpPIcxk
	fop9yxDVVE/gRgt9mpCfctHaws+bloh9ZQg6Uc452sI5IBlZxHdFsiUBtgYLYetUH+deOOrbg+L1z
	3bLDCWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumED-0000000275e-1ZyU;
	Fri, 14 Aug 2026 07:21:21 +0000
Received: from mail-norwayeastazon11013066.outbound.protection.outlook.com ([40.107.159.66] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumEA-0000000273B-01cd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reGmbnBqP1L7oBu4hGksyhxs3xwIMF+ffLEtDtPlykqrbuomjJl28HHJth2yLKvPskX6H6YbCAiNgCU75H13rHoHHi5JDrYZsKu4AMg7VUFZQkh5+BB4s6uL4niApa09JFGOnXcHZp0FqaLYpVCffoiZEZrcyeE6SxsjNFpCueV3LsysJEd3DuPYeL/MqBVdl/r0oHzh02tkY2V+SbvEUANiCdmhrXIewWCeOAzeVL0UW1algk8tigPXX/N1JBa2xdtqrJELRjWBTC91rRko6SA6NQq9YL8wVGWp48TKdaiRrJdldy1dQl8kllmShfrYHiF8hk+5r/0DRPKlB+am6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKpyg1sB+mwBsoY3+ry505zkPRCb2DGcln+AVX1dPtQ=;
 b=yxf3Fl/u1oQBizDmRjAiICr2aPIhmG1HTmycYkdygnJLPPFf4IPbMbBhe+J8Kxyo7dNlHQIDv9r2oTo+4aiqhcePJLE+n6ErDQkZ93f+AALF2l02ofwfOQWL9u62oD0OI4HtaPcL3C4U7BGHn2E5m9J1jKZvk8QspR2XqkNmiLW2plEzqDPHyHfosGOFG7TVzsE+jf8IdChQZPy/5z89wq/1IbjCP65J57GTC46lk2LM+xTqmDOuI77wQB+Eswqc1fB+5mPScUOSJGUNRjEkzUQgTwldGPNFeWIQxceQ8RHQ/ie3aHMNrNd35KGvWa45Ypk5UD90hsrUQJMeEQG/sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKpyg1sB+mwBsoY3+ry505zkPRCb2DGcln+AVX1dPtQ=;
 b=mdZjYvz5qPNItxdTKLApRQEo2+j0lgAA2aFQ4c0Hq559qfvX6Xw8137mSUKIyBR2k+tpQE3in7xJW6OQ6MIpjbcwMXLjvKWBmvafEluz+vtJLBIwU8FtlGMZQxjRz9gj+3tNVq0YtEnTskVQt+KBpI/SoFCUHHOssFNmGr4Rbze+wWR09lsnBMyQPg9lk05BdwqEM6tAU0odSrbVNnFu8/pg4+qIoQ8ms5Iz1HJvoN9Gv1qDLLNFF7xNi37yC+o3QGHrhhxpiV3xCi3JMwMpaH2CDffrjEIZsuqEe1x/KhZHfAOZw/oMZtzw7uD5yI2BzU3zaCfVDjOcmnm5tagmYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:21:14 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:21:14 +0000
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
Subject: [PATCH 06/17] arm64: dts: imx93-14x14-evk: Add board muxes to select between FlexCAN1 and MQS1
Date: Fri, 14 Aug 2026 16:20:10 +0900
Message-ID: <20260814072022.4064009-7-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0109.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::9) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f9f94c-2a2e-481f-26cd-08def9d49f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Bhn3cmmpwZc3feNvW6poc2IoGM4tKMmWGGoPGySrIo2BE75fjrSgPp1dBXW0NP2PckjbIg/0K8wLJe5NGDNgnvjTtEKinz/GKoaKZN+WDyVz9/3uZPbhTOcAkw7QKdIv+3CQN0OtTV3E4yfztVuk3eNIn+NrnGa2dNsNySLMUzpV2mhpuDQ4uXML5NLHuVqpUVuwOOarYKvvYlIsM1+IJpv8Gn+cmBKHV+ugEckv0RcGpYLf8bLUWIMOXs6+eQxD/GYVI5StDITIBRYmWSf3tp91XfZmvXFkv40sgVAL7bq0VRlx/ECoQcoDuHURM2K7eqhyW0KB8LfCwIx5LHGKPbTXFDiNM6jf86epr9GPLluwd7CYR3OYutvivtGp1NLDnv+ZVATuwwVGHurUXZadGqfk55h6mXpKSKVZqD8ZjqEi4LJuTxTDn3uDB99zGh2SnPRPEjEVpV6oRzp21DGE5QV2DfOjewx2DwrNdl2dF8qjcphcPmD15VW1yHdIIfY8XHsz+6XVrgXCJxaz5tOTlZvqrVQSfIRSnVtcpbd2t3l/xgndSDcvYmteX9VSR39QRi+gle7BWUpJVOv2PVHMri+5poo6Z3Tr72zs2VT7YvhTayTtk/BUSnF71NqA0eFeowhFw4O7BTmmKIaRNWE3yxRy+EUslJeNlb1LhrNDjiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hzOQpRKc7WI4jRCo+Uek/Y9CE7Nk2nDQslW7S0X4asKayuOpy2FgFByqyrWz?=
 =?us-ascii?Q?v2eV7B0jIM14FK+x7lqmh46ZtbDYyqlMdRc8yvG+v53K1nPHFuG9uIO6EnMx?=
 =?us-ascii?Q?mxCgFvyj+6W/T3Fpbcfww9BsOSmygZa0GSO0zXnuPgMCPO++CZajHasB2Ds8?=
 =?us-ascii?Q?HhF/YcUQOAVzOiNt8uJHunuOjXUYauvIKiix6AjSPM5en33zEJfFSmvBswAq?=
 =?us-ascii?Q?VG5y3I3/fqjpVCOH/k28kwsLOhp+DIAAZHIx1dhhOK0LRvWI7HQLbTD9tlB9?=
 =?us-ascii?Q?FbP79a19j1JMG772vAtcgpTBgr0jTVCuhPr81SueY3vMtakXzkjFpw2OA92y?=
 =?us-ascii?Q?rlzeyqnT/lxi7/TIMvhNY9ZrTpcoUphaOH4D+jcKi0Hbfe4KiiWQ8/hnoXtE?=
 =?us-ascii?Q?R8qcoj8212U/ioCoPtjaw1BpexY5eSlruPd/y93wqU9zqNC7huOslvgRqfiR?=
 =?us-ascii?Q?w9M+7/TY6nSF9KKNiX2P8JUw3slWllEFHgQFvAwrMQ41Yl0jsqXDn2aVo0is?=
 =?us-ascii?Q?qpcPU/OzyuMUgmBGbHvW5iOuarfsWZ+nUBDgboY7Ollw/neuBZEXrSfmYlmo?=
 =?us-ascii?Q?dnQ9pB+27MEO3f3ZEUwzuMUJhbfa3nXU4CYHJmzYSH48KIo2oyxnggPvQTW8?=
 =?us-ascii?Q?kxweSpuHL2s6ftn8kJBUQlwdOoL4b4Tnkv3D8fNOTfZZ5mMqEz+mf2TD+S54?=
 =?us-ascii?Q?ln3lSiHIuhOLkStBK4ywQiB+8dDN0jjqFlKNLCsfMMWjholWVynEKlDg+/9U?=
 =?us-ascii?Q?Bsk+E0xs/H60IcPchT6nqTeGYv8xs921juFJy/iUho7MM8GsJv7a6VLyELOh?=
 =?us-ascii?Q?5YWS+iK4i7ycClkZZ239baMYZYJiOdlxswzt5aSRpFqeh6qzMcWPqPbYt+VM?=
 =?us-ascii?Q?t/ljkbW8CjNwUXWIpVdlVkIJh56S6f80Zxye7h9BSXiQve4xEUfZE9bIvdGr?=
 =?us-ascii?Q?yjjWU6/ycXtH+l8mXkyv4xjmgJcLfLKHwJq0t4Ol06oVTVGO46WMU3pR112S?=
 =?us-ascii?Q?SYUlVK+V2XWVbpFrKh5MjdFleF79fj2UUUQwXzGzHjNGNUSe1ONzzil7mj1Q?=
 =?us-ascii?Q?1ILZON3/JCMQ8QzM/4tpheKtLkonsrBnzD3kcjVbtgtlWY3zKYPLNehTL30f?=
 =?us-ascii?Q?RakpTNwBEIIkKP2o3i+hTqAdA8hrBUl3xQvtoug/dqRk+qZlFQizmDHdDxqO?=
 =?us-ascii?Q?nbpOUu6VG06fqQ8ns5eyJbNcHDpU7F85ciCZ24mdR71W99y4zNVr1PvNEX7K?=
 =?us-ascii?Q?JCq4Vy7jW8Z0hMxEMW6wQ2vQrnnWi9o2Ad3G5v/t69880eYGh30s7mgcX53e?=
 =?us-ascii?Q?UO0UYyDpQE8/MCV2/M1vLKmnzAtRrn+02mcfFZ+oeG2vpPxSE+7YDHO0iyEH?=
 =?us-ascii?Q?f1CeOrnczXckNgsCk+Cp4J6Y4h0rR+NKYectHCFZjJkOvEFC6GzQEQj8poHm?=
 =?us-ascii?Q?FEjpr/X/RtjFroRsBNqKeF7icGP74Vc2z05E1JsyH4pfNVUi2y3wWqacK8fn?=
 =?us-ascii?Q?zdx9/ZnNJ/H5tGjAwlMUddtnGiDl3m/xCJhP+u4Py79MKr06EbLr8rElyXfM?=
 =?us-ascii?Q?65oqU9F1QcGj9S7l92QLgg3drP25eV8xGHFFQTUgur4CE/0wWqiko913rUKP?=
 =?us-ascii?Q?TvOS7s1Xf9la+M+p9/xZOiZ7xoz4nvOwM6UQL181nxmv8tGjgcSo8YQDQlfb?=
 =?us-ascii?Q?v71TTSjB9suaTEX5kjCapVWYNsDG4YpNEEuYhqS4RaLey26Lmf8DbXYp1im2?=
 =?us-ascii?Q?VeKLx/Pgy7HzhxVqH6dmbB4+iHXkUVvxPkwu3ShMHRsNI6BU/7t8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f9f94c-2a2e-481f-26cd-08def9d49f8c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:21:13.9931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ISGC69wIDcRYHjex8ujZTRBERe9flOMXiHaof5CHIjLMttDO+DAZtV8T8PSTgystNXGqjZSsdU/1Nk9qS70SmevmeTZ37HXqrh7PSPAdJ6VcDB3DdBuWkke9Jq3dlvE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_002118_058415_8335F725 
X-CRM114-Status: UNSURE (   9.13  )
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

FlexCAN1 has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between FlexCAN1 and MQS1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index ec78c03f4788..502237fab332 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -37,6 +37,36 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	can1_mqs1_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524_2 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	mqs1_amp_en_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524_2 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can1_fun: can1-grp {
+			mux-states = <&can1_mqs1_mux 0>;
+		};
+
+		mqs1_amp_en: mqs1-amp-en-grp {
+			mux-states = <&mqs1_amp_en_mux 1>;
+		};
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&can1_mqs1_mux 1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.50.1


