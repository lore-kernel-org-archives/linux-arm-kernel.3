Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635EEC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 02:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hreN8Vd30EHDY0yhyfRP4kMduQhkiO081GJXdgKBIAc=; b=mPblJpiUzhBYjVLA1r81gf8wvi
	n/eV3G2LNUKslfPDBWw/KJomqXbHs1w0WPJRkjDRJPF3jWQ2E9jvn4UyRfzttlyqIXjTgcF5O43iq
	twId9zfTmxiryMfI2RuODyUf8E6zeYuFuXAuqC59yK9wWfL4XCfDQ5kb9JeA7jcufcgiMbT813nLV
	tsqGq/wUFCed7YAhFRYXSs1cP8MWtFHnVPnLwTuGg+9e1Ni0S2T7GPGA0Wyq+C+oMIxp038TpqNJS
	JOPCxe59q3H/jHviDaI+kj84X/cXrWpDXWtu9RpoyE0uhIc+RCdnwqK+euYzA4I5ea8frsJ4PR1Lx
	i8FH/ZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK6CL-0000000BwpP-07fx;
	Wed, 28 May 2025 02:07:17 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK661-0000000Bw7T-2tVG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 02:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5GwpTIOAoZKYP5uTELRRlJJsmGatKAi6pspN0HkXon8/Xy6pO4emJHEXRv8jMyHqQhNzBaQtHx7bPTjpBJS4yH5XlmGWReveH5ikFjX+WQGzx35D44i7E9t5iBothYDbseGRU5ZvkxYXAx1jNR9Ys/38DvkFI3eNN2FAdJT54v0r39QyCcX8nH7aJJbVxTTX/n6dZkKvq6p5h4H5vtZA32Xjse5ArSBLoqeGKXNM7tP493K27nAgYtGUOouTCDL7NvtlrRn7cEDksQ0FU2eEjwoIB83OBjt5Ci5O9xzzKDs/lD6dUkCEV00xC4aJ/XZowCCNJ4CP2rABb1jr8qv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hreN8Vd30EHDY0yhyfRP4kMduQhkiO081GJXdgKBIAc=;
 b=dL+0eh++0Wr4nSR3PDXoc9rR9O3gjYVMtef+oaaXNnqW4I/0DTLCj9JAlPWW0opk7ToRlKRNyQaw91rykC/cmwncvsbCDE2zdwHdg7aoAh7iDCoSIH6choX6Gq6Tx5jIhCL3Asytp68jqx257Tu7X1u+15znoNfZdux8Q/R4pXW9+Bkta53VVLTeytEhmTKJ/cScBGC48vki/RNZKy6vxOI96ZDU/PZcAqhRvfcxm3bE9+dwLAz6841G+d8a7jqqjkqL8CiFLVf/24cLuiRarFQx8dgzxtQSd8KH1Q60K24mKc5pxHY4Qt6rgOO0vADm8bv0yJFyPQZFT+QGX+re/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hreN8Vd30EHDY0yhyfRP4kMduQhkiO081GJXdgKBIAc=;
 b=XZWzbtTEacS0V5fuobxxOgz6idBrsAVmfEcOnKoQzsJygGsSR4qvDshJvhBtvIhRkjuSVqcKJ7IMzZl6MfjPVmZB5vwADM35pxj2s+DDPLaiU/xCsPFEjcDwbyHyeS9eQO4SZ6imeXTRIzn+BohZE97CIQ8fbxpTpXb+0ddvVbrwk7PRHpSEi+EjM5P7I05RyE9MUgRRxxRKcnE8HzlJjzpwdA7+M+jjylR80191NHPPqApryTvc3e7c8dxfZb/4tAxbgPdTQfGVxriLLK8NfvYy2ASAmnkrpLt6zHTmqXW5TK3zY05VMT54Y3AdjsvSOEaReXjrZHYx6I62kBvBRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 02:00:43 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 02:00:43 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	carlos.song@nxp.com
Subject: [PATCH v2 2/6] arm64: dts: imx943-evk: add lpi2c support
Date: Wed, 28 May 2025 09:58:33 +0800
Message-Id: <20250528015837.488376-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250528015837.488376-1-shengjiu.wang@nxp.com>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e2e257-1700-4de7-8124-08dd9d8b7431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7xdmrRH3YLoV5nYhQHm7iTeu3vG+2OCEj1yJuyBF6SYPiO8S9Z6wsu56Wmnb?=
 =?us-ascii?Q?WlfYl3S23TYB6uYDLcSi2LolHts/Dvm5WpFtovuW8dRQ8geetuJV/H8xQ6wl?=
 =?us-ascii?Q?qNkYFQ4Pf3as5+MPj6/TPJ1YHO4sCrV3UQE9I9D52YiCsANwYAPC8L/n4Piv?=
 =?us-ascii?Q?l4RlnxKzy8+f6cDI6hn6vA8mQAPHU4/8LGsLdKTDkpRpp6fTIDENQakbG25I?=
 =?us-ascii?Q?cjrjXT3Ch+lxp3cCuQ7DHKxdWetZpvbjRJ8Q3zYT5nKPxmGBHqxyy7bDuDg8?=
 =?us-ascii?Q?qPksPt+01HDeAHV9pmsRdk4dWKUVBFhm1UT/36I6uEC5wo3rv/4uYp14yvKO?=
 =?us-ascii?Q?G82Mshi7l4xMqcnPb0zhsStzT45mVhYt2jYILl4BJrR9o+he7H4hDmatyxvj?=
 =?us-ascii?Q?52ija0mgB1e0+Kc93VRxJvtdqEx0IPl+E6sc0chxdhW1voYUEA1cJ0hiQHPD?=
 =?us-ascii?Q?byvwtLy8WzNV8LJYkswq9x9CzT1+OTIWYFG3efbJ9KXTIN+AGgXZHAPfUq5s?=
 =?us-ascii?Q?sPmOmDNDtuhsvvfhynqyJBc4EOAqTqExWNrpS3KfY/8J+gpsrraJD+8B0DSd?=
 =?us-ascii?Q?jaEFMWi2X4bIHx/+sXDoHWWJvmQmlV4SvGNVlXzi5LQvAZyp2Bs9JhXqb8OR?=
 =?us-ascii?Q?kf2g7HUqq8xVNqvjJDMIrYzHf6pFUGc1CUM38onGrrAu6i/pVLhCf9MHPGf4?=
 =?us-ascii?Q?aJVEitt6UQv/osXA+PnE44WLkZuoH+aLmdoGK9Cj66ameinYxl5IcwmpENhi?=
 =?us-ascii?Q?/rw2JkLxoS1bZdOl6vC1eG86CrDTuDQSZLmYuLrZ3NN1yKWxwsBqWrLyYcPp?=
 =?us-ascii?Q?vhVY1mYAg6uxZwfiBCkVBUimd8oAaZaCM+fIWIvMh7gOxlymCG5K4cO1ONMa?=
 =?us-ascii?Q?vaiZ4Pnbj4aaQLankKgJk0eHnzDjJlwBZjVmgg8sda41/PvarpcmZX36t2TK?=
 =?us-ascii?Q?+/b25wwFphC3QEraMrverkXikSB46IJiJmZ9f43QIrs6wQXnbristiFMzKTc?=
 =?us-ascii?Q?VwSsMamNhnGPu5SQuyarCV0D/FSaCf1xxMT+YTVeR3/EsOit2IGTptQ2lwX/?=
 =?us-ascii?Q?fSF25Wj+qUs3YwBd7Kcm4Fa4UeiUZkGvFlnsyc8ggcfobBdJNWMuGoI6w0Te?=
 =?us-ascii?Q?fhAENDuIBSnbETGtxaElCFqMltCRM3I2Rt9J3E2rr8HaZ8xOFps0aoQ2yY8T?=
 =?us-ascii?Q?POSVvxksniOXXbE4yHzqL1RcZUBI836+CZmutiUm7KefQhNN9dDb5Qvv8F7q?=
 =?us-ascii?Q?iEYobI8MDTnYDq10dQurqYQlp9IMePeAvdfxt6la77YJg75AbO05nX611ZFO?=
 =?us-ascii?Q?//hc7I30mh1+GwYWV6kYuFcVnYJTEMiE4J4M7vKSsE+3LCV5hTYKciWNFom7?=
 =?us-ascii?Q?WpkLw/i8aNR/g2b31WfhhqSXWZFue3TyzKhnrSJdipB5ATMcQBXzOOI8TtsY?=
 =?us-ascii?Q?pA3bTHpsW1C7W3r5vd/WOXYZLj+DwviYfOqTollXu0EUzqyV5/iVNzmEvvlY?=
 =?us-ascii?Q?mVhoijWxjMDGfes=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ghGwcukAbxjKZB1ZjMbJBrNlOQ8rbWwfgN+Es6+09JlUS1Xd3KGBnkWGZzxp?=
 =?us-ascii?Q?+K8jL2dGZbzg8QgJRLX1tQupMYWuyAln2pqZaVP9WkhcznvkC4ffsc6kcZH/?=
 =?us-ascii?Q?ifNpgmbXVz6GpMituyfQTIga7CiLnFHbuIRu6u1JA/pNMMoD3h2Y+PT8tQLi?=
 =?us-ascii?Q?orvgdWRziOgF5Sy6B5iL2/+eDPqzAs02oiVIDeQsVI6c2JKCRuo8D+4qwxQF?=
 =?us-ascii?Q?6dTZUG2AyfhLzwbhhPWq9gndl9WvWNAUwotc8THVjfxvcgtVdrl7JrlOuJC5?=
 =?us-ascii?Q?iGp9OAdJZCT/S39reHfW7E4A2Q5SOR17kMZgJruywJIOQ0IcfSPmBx9i1amB?=
 =?us-ascii?Q?WqOpaYzg5OiznmxWee+wrhzJwdXMgReaRAnmzcMZgu81p3iFdaJpPWl0EfQe?=
 =?us-ascii?Q?z2MRKTAaq2ZVcwJezoa8Qx49hAzmek9GSbWIALs5QyJtHHs81FhtcvHUEEVz?=
 =?us-ascii?Q?lcZ4I1R7m4cvzft4Jw87vBoXTYBRuYxeXkFQ6n4i4RpkvDNoRS7JCTky7xcu?=
 =?us-ascii?Q?JIBO0XvcqXt0qQPvVRLt5EXtHtc494zxlfjgZVsXLsDrBzMz14dr1Rft8Rdi?=
 =?us-ascii?Q?jhPskR+g2zr+NmUE4zzKpgt4Xc7N53vWZKsuz4s8f8YfEIJY6hzmrw3BHZxY?=
 =?us-ascii?Q?GOfyuBj4cjsm8518q/Mv91GYR5ay6BeA0RnFf/GteZWe0bisdxDSHxwB2sqi?=
 =?us-ascii?Q?+4FMX1HTr7IOFOT3eEeVKupKCx/15GlI7irrJDXXudlzo70Ml+9lZFMUnN55?=
 =?us-ascii?Q?ZJRUYHnCHvf1DdisFR5QlfDteTpqQcE+OSftUENJWnWMU+Bhu0oBBFIAa3Vd?=
 =?us-ascii?Q?vbYnxIB87rUpfdd8Tox0rf7uU3ftEqMy0rg+gokdMJt4ODJKi0iK16MwA8f+?=
 =?us-ascii?Q?5xYWeAV7++jnCFhDicIDQ0ZYXDm2uWCao+ajtQ9jLhL8hOzupqfuVN4ePsBQ?=
 =?us-ascii?Q?Y/WJYN9DV/5xBzftshLhjVKWYrTBtLX3dW8IVo01F/vLwlZZoDm4/EQhA7Ct?=
 =?us-ascii?Q?zIEZ4CzG8WuX7mghnoTvMk2hXFjZz/POy/+Mt4kAyrb1D3IOjX8LjCtB0iuG?=
 =?us-ascii?Q?3FAanN6xAcBMlSbslXBLvCAqi/fetTB1H+dlilm1st7eVbyVzNdTJ5bF/LwH?=
 =?us-ascii?Q?hkO21XvJpqw/O44IAENa/T2B8vN2jJoiWHcWAYiZltesQa8bFFE1pQcgUkWB?=
 =?us-ascii?Q?9wd5NpAMDBU5PeN6trND6lP9nvnkcE5qi3XVoq/Qll3xAdMSz5wiXedWXdwV?=
 =?us-ascii?Q?Vw6VE4yevw622f3Dug19qP2PJy/N9pqNEzSOv3/NIW/PjljfPqtv8tJEVEqN?=
 =?us-ascii?Q?glX54XDrKAluPxV0F9PioPNzyGIqp3eTL9f/2SUFK49lfkYU/Q1h+Dp54PPl?=
 =?us-ascii?Q?+whWFPIndNHzP9Zh1qc6lsk4j2RcNDGV6qZTPm8/piL3BGe7M8isdop+Z3JK?=
 =?us-ascii?Q?CGkKhgfcoM9S9pNStv5fOu+r9KEWv10uGy4lcfHxZfQZxtxb9S+OK5XHgqwI?=
 =?us-ascii?Q?dC4O+wNwP5tcwGbvQS14mF81Lvl1bRc0puVv7lzLTUWDNOkJTn5755uK7kkP?=
 =?us-ascii?Q?x62ee34c0S3GNI9PUDc6Epxa2rko91nUDZrRRgZA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e2e257-1700-4de7-8124-08dd9d8b7431
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:00:43.5655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYDFk2lyfSkwz16gVGpFGiKyy2XopxWQJVqXJ2H34BazXj8VkPqMrABFjh7XU4wKdlX0O9Tp7YaXL/SB0jqIYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_190045_734511_34393191 
X-CRM114-Status: GOOD (  10.45  )
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

From: Carlos Song <carlos.song@nxp.com>

Add lpi2c and i2c-mux support for imx943 evk board.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 132 +++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index cc8f3e6a1789..a566b9d8b813 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -12,6 +12,9 @@ / {
 	model = "NXP i.MX943 EVK board";
 
 	aliases {
+		i2c2 = &lpi2c3;
+		i2c3 = &lpi2c4;
+		i2c5 = &lpi2c6;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		serial0 = &lpuart1;
@@ -53,6 +56,113 @@ memory@80000000 {
 	};
 };
 
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9548_i2c3: i2c-mux@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&lpi2c4 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&lpi2c6 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c6>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9544_i2c6: i2c-mux@77 {
+		compatible = "nxp,pca9544";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
 &lpuart1 {
 	pinctrl-0 = <&pinctrl_uart1>;
 	pinctrl-names = "default";
@@ -60,6 +170,28 @@ &lpuart1 {
 };
 
 &scmi_iomuxc {
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO16__LPI2C3_SDA		0x40000b9e
+			IMX94_PAD_GPIO_IO17__LPI2C3_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c4: lpi2c4grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO18__LPI2C4_SDA		0x40000b9e
+			IMX94_PAD_GPIO_IO19__LPI2C4_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c6: lpi2c6grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO29__LPI2C6_SDA		0x40000b9e
+			IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
-- 
2.34.1


