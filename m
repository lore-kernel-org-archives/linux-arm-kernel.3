Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3A6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfRWm9pySWV119cyJM4tetQffY2MEeMP3H4EVBEsc18=; b=KYn6jq2BvJb/mZfW/9cERncYy2
	QAi9tmXoxvDj7rEbLK29iYdYLzra3nvEvHA2ff7WdEUTI6x8WzY/mO6cu/3rQvnpXuZCW0Kwh+ji0
	QTMnJE61FMkgsyUlxYPjjDYzXJmLa7iTqP6XWpSKdLon3s3C++dVbZ7GrC9nGdFrlAfekcqQk1nWx
	8Z8j7z2DIrocVoI51dPHtQtubPAm3raf9PnVw3IUUfID500jAzL6V8/flqEzJA1xsaZ4H1tXGzgW5
	rUu/0nJoUU6WzoM6mOX4GeXFxdVHie5dtncH1HV6NtOBsxBnw6YJKIL+HPOHZ8Pz3t19MQK1gdG5T
	lxkVDOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumFC-000000027qz-19m7;
	Fri, 14 Aug 2026 07:22:22 +0000
Received: from mail-francecentralazon11013043.outbound.protection.outlook.com ([40.107.162.43] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumF9-000000027nl-3TCy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:22:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrZwVqQ6yg8g3RfBU5hviaZ+KZ4SM8kfsz59zR6QQSLaMQNq7WhhdeYEedAX/XQNjrZhbpZ04OWPvoPi/Vaj6+K0qug2M053e33K53XO/Ok4oXlfsFUpm7sVxmCSOtWrXKDH3OL/tEJrFELIgD+mo/wJjizmbLbA0WwqyE+AzlzaV2tJl2PpR9vUQZoTXJFMh4GowFMsMwDBRGoHlduwv125Qb7KpK6GNLII9hf2UtJu17Zq1fQHStB+ks9jJ3sMAMhAbSif1kWZkVL1jgl6Pa1EnwkadVxuuldJvAcLzXT0xeMzam641bpzLAvcTrYhcb2id6qoBpxKImUCV3Tk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfRWm9pySWV119cyJM4tetQffY2MEeMP3H4EVBEsc18=;
 b=pJcIsLjPynfq9p6YKi4K3+rzXIhmKKD9DX+gApaix8yCceBVaEuIX9bQsrpaRT1abPtFwWSJreU3yOob9vkFJoLsXd9PdkQEhSGqes33/ETBdIvdUmJJSwzz3aTVQHEFFzWGLMl5GATujoBxe9QNF8Sm5OpAacvc6nl3KkIFRBo8TTsmiI7BGIakIqIGRiboS84oRvgfSS5mfqh3Pn6v3SgewjEposv3Cn4nA5xTV9gc8sK7E+hrV8ORXxyNAQWZhwglPwBgsau9KpP0zhpACIFvwZWV4EAt1sK8w8nnwfpzYUzOphUtSNbHn4wF+rSV3Z6XsQs//qxcIbSSzZTqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfRWm9pySWV119cyJM4tetQffY2MEeMP3H4EVBEsc18=;
 b=JTSV3Yf2uyRJueYwBvgZfeJLQrvUcQwmEmh5PuobiqiYgLgd39qLm5NVCoUINKrU3fo+LNAnK/2gaEnyMzPqvVmXYTgbzmlLhv8GP9nfWAcMny9MI1rn8ATWHxGNWFBkAPRiBR4ykb6NBjVZtizzoPz74Qy3mKK43vy2YboS/5qZAcNTHd8lqluodXzNgBxryzHcr5LQDIShaoaUzJA5P1TcLucrYiahuTSgd/4VX7/axoviBOrPcbWu7oA1Zz1b9qaA+ma2ZQmZCtnA1CLBQn0WaC3zBIHcj0IWRA1DOmP6chZGJ8Sw/XOtySvX2ZZgvcLLHsgaAdNwL+vwOR/5OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:22:17 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:22:17 +0000
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
Subject: [PATCH 15/17] arm64: dts: imx952-evk: Add board muxes to select between CAN1/PDM
Date: Fri, 14 Aug 2026 16:20:19 +0900
Message-ID: <20260814072022.4064009-16-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0118.KORP216.PROD.OUTLOOK.COM (2603:1096:101::15)
 To GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: be7a6dae-2a7d-4d12-dd84-08def9d4c537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Kk4tocsCtZzwr68BoQ5gFYLTG878pS3MoiUJS5+Nd4anCqIeuh7g/KW9Lia2VHm3JnEH2FBgiqk3f6f0fjiW9UKLAvAQkmOCp1F8GYB+ru/c0ZByEmvDFT5gto1ZmcbhiSrtkQwgz5iZ94pkqvv5nOTKMGDGi2fR8ZeRVE9QAecUy7NNbhqXfrohZ7jIG05l9YtjXvS7q/VYuETewwSO3coxs9jGIAiVpZ4LVDitW0LP77M7IsBDuSM+10lZABCAtE3uy6mgD/9Cm5ets8pzfo2S8UKLXvFMcxkq21QdqEKur7SmCfP/T1wZTml8F2Owa1gnG3TShlix/d98e7w7k09l92v4JeKwRgVUzamB+kAAvzeOkAlp51qW6lt5W6Ogh9ir3ymcfCH213XG3LSrWUBACZATMzqrT+V+lxUg98CFQGwbKKDW5WhNsk2Y0DuANyTq+tCqDNdBDC8a1IHzHFtwgz4+y2cQ99lcUrztwVcjzgO4Q2EN03mLmxcRyS/pQ35F/KixQxq8hgI09XpIzcz7B2pTsV3V+5C30087q2EG8BlqeiC7wIwR8guqrj5EEafsg5VNe5qK837liNvruo0JFuPziOra51O+Z4qKXB3qu2XYjgUypXkdwaJLAWL5J2h8yzUGLUw5eoOt1IAsAQvAPJKHg77az+eWhOFhUB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2xfPh8lWqiylMSiBwKMCYU0PAYdj6hkFzt47OMmnaKxRfAlueIbV5NXMEzEt?=
 =?us-ascii?Q?Zt8iADWKvGZKenBqRlkMDnd6YkehnyghcWa9gKH4VqtfNOg229clW/frWqAJ?=
 =?us-ascii?Q?QOObEUPm6p1l6+9wZp9o+nbD+FFZwRMkF/J11xbLT2SwJoA+yILtbolUsIaL?=
 =?us-ascii?Q?rnF3gFpgsg600elN/y+1z+QywCzvU48R83sUOlC4fuAGFzbpZqXm/eEAWnOk?=
 =?us-ascii?Q?m2C0jr19vQz5qGi385rpPTeZBO7cZ+UeXIROkMg3pmz5W5iRNPETVg3mBry6?=
 =?us-ascii?Q?ciYGPHRuLq8e3Dq/fOzIT5lGAmzNFDr7OkQyb67FnEgbUYG3vUzwGP+wGGu1?=
 =?us-ascii?Q?fy9IQ796uFo5x3jMi2e3/pxzAujh9C5tuEZJhFveX907VSJmnjLCiZcs/NOr?=
 =?us-ascii?Q?D8jbJv82CidOl52ZvZYzChq8IaCvIPM5j5hkSC9LMFRS9CfLy1zebbvwCnuK?=
 =?us-ascii?Q?JBaPKRvxTrpO4bGoeFW6uQZdKX4Ogvux/EK9zfoYcm29QScG8urZFEQ0HrTT?=
 =?us-ascii?Q?YlLlsvGfYxdv0XD4bHw/1f2/F+S45+HtY65jgAWH35Pzhlx74jAk1gWskD8G?=
 =?us-ascii?Q?nhvwa6c8JJfaLcy1lVB3NqFwqHuRp4EIiLpXAACIxNyoG3BnvODBc4jH0VX4?=
 =?us-ascii?Q?BBY/fww8f0WggSut1RB2sD9T/yLxbGgT3enk29X/nqpTXve+vgjSuUjhR6qJ?=
 =?us-ascii?Q?Lr09YQAhjoxlNMfgZVyZ4sEUsQgYNgPpWj+JUEPec3GuHHjkvg2D65mmh5Jm?=
 =?us-ascii?Q?Mjdf/mvfiRklyaNpIYub49yDnGb9yIloPJJM6pB4tgl39Atv0tE6+TM2nIz0?=
 =?us-ascii?Q?+9XPge2OJOIhmtBf+T8Qi9f2qh1F5ce2n7ViCEs6bH7OkAzDm6sa3f6TU0Ly?=
 =?us-ascii?Q?nG9fseUJUBhYaAMWZP3qoZ+Ern6QaKXXIKeRviA0GonsNoxdMboFiUhY9ekP?=
 =?us-ascii?Q?4fzVwgxRDYe80N2eVgrVhxkvPL3HnkH7PxjKmg/Fo199lEzFYJ15K2Xue2cM?=
 =?us-ascii?Q?wLc7TCBotg1T3LfFoT5JFLeaQbqL6rOMSAlB2YXydWnl+Y9G/LMBF0yqOZPR?=
 =?us-ascii?Q?bE5Ahiew0iPfeszGDswahdgwN7Oz1mkb9wj5paeLo/TB2UP5ZbhngEDaQZGM?=
 =?us-ascii?Q?/3U054Nx9VZyCmyJ1lmMDmPT5cmKOKMz1N1vv+SEAVY5HOqDyCvTsJb1uKmB?=
 =?us-ascii?Q?ornHAAJXm2e4huN31aartkPqLelI4j7RWDq9SpbWW+QJ2Dn7/Uvk7VIVXFOY?=
 =?us-ascii?Q?TAIzi94RLkxRxyhB9Ng5XGYIiyLvuvFXGroaakdcy0/mKhoZrw6rGlFhTJ2v?=
 =?us-ascii?Q?rLdWBM1rWwW4J0pXRhYvMBlIofyaNdNRgC7lq1uNOgR4WTJERTx8cRz3qT7P?=
 =?us-ascii?Q?Ab6PM82Gf/9YWc6s4AN5CWyJfdPOv0Jf/19evjmvV+wOYf733X79xnhO90V/?=
 =?us-ascii?Q?MylhMy3uPdWBbGu5zpRI8Y8qn0vzEEDCw5XoXvyF38QPdBTUN62yaTt/iAXm?=
 =?us-ascii?Q?9klu5lal/aJDZka7djp1FuiBaXpMuWH8YhPKphfmZlqGQnAy4YDSUezb9sX9?=
 =?us-ascii?Q?OExKlLfkAWDoCM0JUTjpQPRzmmvwbq5ZQRfbNYx1h7hlJdAZt+0GBXg59G3L?=
 =?us-ascii?Q?efGO75JE4NUeZ54ReyPn4WFSlD1i744Khj911H30Tdxm3+/HjdEzHnjKhUQP?=
 =?us-ascii?Q?8LJvol8O5pIvRI6kLMxeUKBY9MkWr1W0NHnfPgIGe11wRd75NIrNjYomreuk?=
 =?us-ascii?Q?Xiln2iulTnxhPLxCPzw86C+DdWKqRghb0CrgU2xCf2sinW9izgv+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7a6dae-2a7d-4d12-dd84-08def9d4c537
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:22:17.2078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvAHhwp8TGfvNql+15ZK+Tl6QJfE7UsPi0VkWjgwcFze5o+WXhUlA0lgt0LHl+erlTJ/HbXFhXxAfsNQJOU+IS/WnEl4K9+wqHfIX99rYE+rUViWHKdwuV7aBMnDavqC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_002219_905336_F78CF0C8 
X-CRM114-Status: GOOD (  10.57  )
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

CAN1 has pin conflict with PDM. MQS1 requires an enable signal via a
separate GPIO. Replace static gpio-hog settings with GPIO-controlled
board muxes using the pinctrl-multiplexer framework, so that the
conflicting functions can be selected at runtime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 50 ++++++++++++++------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 2224b90aafe9..e9d735dc2a51 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -52,6 +52,40 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	can1_pdm_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416 10 GPIO_ACTIVE_HIGH>;
+	};
+
+	mqs1_en_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416 15 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can1_fun: can1-grp {
+			mux-states = <&can1_pdm_mux 1>;
+		};
+
+		mqs1_disable: mqs1-disable-grp {
+			mux-states = <&mqs1_en_mux 0>;
+		};
+
+		mqs1_enable: mqs1-enable-grp {
+			mux-states = <&mqs1_en_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can1_pdm_mux 0>;
+		};
+	};
+
 	dmic: dmic {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -284,7 +318,7 @@ &asrc2 {
 /* pin conflict with PDM */
 &flexcan1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-0 = <&pinctrl_flexcan1>, <&mqs1_disable>, <&can1_fun>;
 	phys = <&flexcan1_phy>;
 	status = "disabled";
 };
@@ -387,18 +421,6 @@ pcal6416: gpio@21 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pcal6416>;
 		vcc-supply = <&reg_3p3v>;
-
-		pdm-can-sel-hog {
-			gpio-hog;
-			gpios = <10 GPIO_ACTIVE_HIGH>;
-			output-low;
-		};
-
-		mqs-en-hog {
-			gpio-hog;
-			gpios = <15 GPIO_ACTIVE_HIGH>;
-			output-low;
-		};
 	};
 };
 
@@ -491,7 +513,7 @@ &micfil {
 				<&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&mqs1_disable>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
-- 
2.50.1


