Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EEBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzgXurmyO9YqPKgeQvDyesqSmHx6+dpnRd/sCuPYXas=; b=W2tryqvUTMfXMQjkZvENaX4KVh
	NJ4NkEPSjND3CwZm3PNtvor+R3OD/nv4hAJ105Hhy0h7TT+m8qZPQik0w4AAXNL3QpN5idK2TFD68
	kRKBnVkkDrmxfcWKcvMerNf23XLTJgg3YSOmduUQS5aQCyiA9pknhyA/jTr7qHSs7cYXG7yu1geBW
	kpyoo3NzpenXeDNMKsxvmGNj5F/kKISgiCDl3mpT35P7l4iH/0AU+ThE906hqGqTg+ppOuKfOdopK
	iOy3oDicicMlzXQcX0GUXMphRxYCe3NLa5CBzi6iGBFiNfQYzNzFW+Efr0QvT5kKNikJ4bYeddNnV
	DvaTDk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumDt-000000026uc-0B1r;
	Fri, 14 Aug 2026 07:21:01 +0000
Received: from mail-norwayeastazon11013051.outbound.protection.outlook.com ([40.107.159.51] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumDn-000000026rU-1sBB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:20:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5VJKNdaTAxpBKRf+s5s/4AkuT6vA2dhtl+0Z295ftwVJQR/UOqn1WXZyFSVPcEYIse+7N997fZZR9qFK2WjYF1Aeaqbt+sCIrEd7yI8QQiDdV6rXhy/xwVwrpZs05TqUnis+6CEco+mkCv6chdjimGJLkGwHe022VQBQ6IOxhEDhWt33w6eoOO/dQA9jt5jCmX5DSD72O0oi/gklOWJuO5b/47wYpDZf/PPbodNm37pdHJUr/sIyfetxpxAtueP6tozxewTeeRGXWveYM+ogaTZ+m6iF1vc9rE7J2XpUWZasXoSECkDjlxOTvpWSHhiNarKfI2JafmdR1UTxBVqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzgXurmyO9YqPKgeQvDyesqSmHx6+dpnRd/sCuPYXas=;
 b=vigSJBFDjgxtZN8SgCeJMBZ+OP8yHs4+95dwlHMF1e+/0vgIZLjIo3AljCpp3P/GW3NpJ9+gPTbxprYn0ztUTjIZpP+HGoS5u+KJgj0mbRtW5UW9bUU8wnPCa3UqEnZfhMngIQGfaKzSJ4k3AZWHm0riKnO85tXDgyjueIkIZTKFTbDrMxGlfBa7/b4DUKLVrjBqz098JkTmnxyXovEbWkjVSOvLjf5FQm3/ggDEFLo4s2yS6jJkW9qLza+rLq21TBTE1Hu8pE2q4ioe82zURZXUc6Zgjw3tIYs7N8Lk+aqA4bQH8JnBWl0H8+COxsA2lwHfVEtnYZ40hwbDXyr5dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzgXurmyO9YqPKgeQvDyesqSmHx6+dpnRd/sCuPYXas=;
 b=lM8TX92Olk+mqaHPpTQyAeHd8jsUJ74G0L3SCTC44+tf3QyKZPYR/kIf+GC+1JP0KySGiJNhP/wvsvdUquWPGIoSzNvTw79roLI6Fw0qAGlVodCM6nw92LRfDZ9ID5qg1z42BUHRJhpoeolcD/9EgbdXFYsOIz1vniRlk7I5mgROZobscWK8k9keIEhQy78IiSYdEbqdeLojnX+3xh1wdu+eosjIKiJs9U2p9S9R18V76IAiv0As6jtBYBPFZZsGs2ZyhfafZE/2XG/smyObJcDcplNESoM5h8wYiAqhQymtS8JADs67gLocNRkQpJJcFJBuWJpuxHmnSAYIjyw4ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:20:51 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:20:51 +0000
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
Subject: [PATCH 03/17] arm64: dts: imx91-11x11-evk: Add pinmux and mark conflicting devices for MQS1
Date: Fri, 14 Aug 2026 16:20:07 +0900
Message-ID: <20260814072022.4064009-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0144.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::13) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: 906dcc9f-649a-4294-602a-08def9d491ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qHz8tXKl1l3R8SMyof0v5ZHTi5sHtg81RSWP3Wukq1IaMf0hZJj/gJ+TCzHaumuTb+vEjFGuVQmNO1QTJqCu7xlx6Uu0Oiyiv324AQ7x9OcIzdc31+Dw7tkuXA6FDnJR7UuHzD1E9lJiWhWPLxBS0Rq3cVpIqkEcdetVe4ggC4Km/BTnYwbgZBYYDRxHLPWGLsK83gj8QwxsGqSJ3NrEfur3Q40rzALaz6PjcKCTBT9N+onyDf+i33oergLaFAWLYj7GbcfB70+oRk9awnZvnvySGu9jJwSIkmIYZhYJ8rsvmM8fbWrjNgwdglhAsdOolHYVIqYCWdel6RPOQ/7hfOyHqhxs+aCcF6vESPGq3QUyZsU7ryAY5KYyI07nJP6eAuchT4Kb42OmtHjDoj44p2+77PViiwgwXU8iogoKTmOVoQFISB9NJrj38+6oc7OGjpBk2WwuLlATAre1FRtg1tUvnMMpGMdGiqYJIHzIT7TncpronrdUFgvO4uTENyyCvrPa/3hjwdAryhKMjLRhtYdlmhTWsYSF0yx54eO5711PIXhrwc6vgBje9kasM1lMNsEizkU245hOYAjAaHfxNEc95E/2sqnSSwATe5d377uRja8bvC8zWOqzFuLg6ltTJfDMikkhBJAUoL+I/Ktta9rjKDV6lJUV08B6wxBtd1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bl9yMeSuP/uE3ldPji7FyoQfelM6M5kwDCLpieDWWQxclCJh6ydpeoVlf7g8?=
 =?us-ascii?Q?po18CzSw8DRLNfsvAEUvDb4tKXOUuDLyrnbQaFXNaH+pP6CY3DFK8fmd0AD7?=
 =?us-ascii?Q?RBzO+b4bNm+G71SNubu5bTGlfd0SJqVfdCYEDll7mWsZ4MGbmeDjJb3dvRld?=
 =?us-ascii?Q?yN/31hmHy1QTTfekWINIuPxpH5FSfiPwaVZMlA8TEMMfi2YzCnIYAyAtRLSy?=
 =?us-ascii?Q?Ksp8YzglbewpbVJdkeil/ImqIGLbioH+pjnzBymKEkiUJpIiRlmeB5qhOXdI?=
 =?us-ascii?Q?Js9Hb6SAM4pWPiaxN0mlaWe4YWmiukC1v3obv3tNAwHj5fqOV9v1m1fhxX4W?=
 =?us-ascii?Q?BpMqQzE/kn13S1yZF5N1uB4S/QrfB57x51ptGGVhtJ6yI1XXDGi0AzwTOUp8?=
 =?us-ascii?Q?9gd+Z8aHH5nhrNxc6yMdW3sDYEzD1glVXIg4IZ0GNgJg9Mvp1M1KX3pdhZWx?=
 =?us-ascii?Q?3c+5iBOQX7lMS4hNgz3CCFpWnVXd5Lvr56KyiJ6Ljd6NJeMrL8ELWPaLMaSi?=
 =?us-ascii?Q?tNGMgZjNP3C7k7O7/x6D6L2INJWuhMZRY1kvtO0Ijr8Ymufx8eWABXduXoo3?=
 =?us-ascii?Q?v/SZwn8BEsBdsu0MxFIcOrs9R+bH+Xw8SiMbY7vUyXUbpNsRpicpZXrcQGPp?=
 =?us-ascii?Q?Ue/AGa4Ng6lRpJ9aiQswPAE1SzKhXZ7YvIwMuBZsqh9su5sO0s5eHwns0tQI?=
 =?us-ascii?Q?KddwkOBi0yFBPmHwufw2ECOMau2GNZVGxl43F6siys8mwq5mUk+RV/2O5Cqg?=
 =?us-ascii?Q?EqYysE9zvLmto85og2A/0MGxft5rCdhh+59G1HLTeiHYqz34mY4fzMZ2GI4r?=
 =?us-ascii?Q?clXfthrnWP6KgFjxdDjbqrYRHm950k0/Bd8SjikblGO20gZvn2HTk/06zgxp?=
 =?us-ascii?Q?32648R1ZuAGz2SpuPhMH/eysr2ANMjU1Ri6EEGKxFKVI9f6qkcAtIe/A3sGV?=
 =?us-ascii?Q?d403ufS6iuUlf0SdJaHhOlIzgejOs+7DEFJhphDksWjMr/MyFBvVonysou2l?=
 =?us-ascii?Q?/nlMfBcXRki+iZxf6snuBBtROzOpptpCjTitNlwxFA7zak4RTB6Zc8EkK5pe?=
 =?us-ascii?Q?C1lczCrY43DPF1p5qanqaWa9kQ7mVJ71RSrhuy3gqEQvy7MB6YXb6RMrV6UF?=
 =?us-ascii?Q?MKaO7AVYU2m2S2XnKr2bj9zjBMBzTmO6or8NOQ9JYE+aRcA5/CsoLxM6xCtu?=
 =?us-ascii?Q?hJFvIPHABssvQ5a/OAG/Ufh/UxRWKVQbsB8Btg/hSTDW+/JHlzv1C1Fn87S9?=
 =?us-ascii?Q?LbgfvWZvoux71AyUFQryT80d2sClNdwKHIUYL8PhtjotalshHjDQOaFvgReC?=
 =?us-ascii?Q?BPWgwUSc9BK3UMDPlEqFWlwm7blgrxPjDwjxZrfhG57seYjczpmgj79dt/gh?=
 =?us-ascii?Q?TI75XDZdnBd/aOMgJ9a/ZGqJg0zQXIIE5Ytsty0UnvUef2frlYF5RAeAnoT2?=
 =?us-ascii?Q?pRjwxOPKfi7MXjSFQ0wBhCjMPgyrv18lkQy4X31XVlZ0ZvKx2BTCkiqwxR5g?=
 =?us-ascii?Q?emwxAU19E8/9iT+a/YdyK0xjSi0GE86PSzzS2cWNWdsdlR6alQYcK0JMjNyd?=
 =?us-ascii?Q?8Zjo6pJSxtE89NuddmuYrBrTW2gplM6TqmG+zGwM3JqTXk2rVioqiuSz3uMS?=
 =?us-ascii?Q?XH2b6usOXuWPDlskMAhYJ1u6OKipv5YqOxGgeYFDrmv4MSLZju3xpaqj43lx?=
 =?us-ascii?Q?FqTqkn1HId/MQGEuK/HDAmLdzVevFqa3YHd1JCYRmHRirLcD4yUB2MgMu02l?=
 =?us-ascii?Q?KsLbrUoNrb70/E+J/qzqvNbYBJ57v3YZ8LM51Er3fSWImoY9NmYD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906dcc9f-649a-4294-602a-08def9d491ed
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:20:51.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezXm0m/DU7p/qYD8nEFc0ORi03+90oIdkJZvbSOailtfd7cY2aDpFGRkViu3RiSZO4kjHuQOxofSOJBQhN22yS5V5YyUaRwFmYGnCyoxTiWW93oziRFlTXQ1veDUBfAh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_002055_540968_ACADB45D 
X-CRM114-Status: GOOD (  10.64  )
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

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 4d1ada6a3942..4a3dfafae377 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -145,7 +145,7 @@ sound-wm8962 {
 			"IN1R", "AMIC";
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
 		simple-audio-card,format = "dsp_a";
@@ -501,7 +501,7 @@ bluetooth {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
@@ -511,10 +511,19 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>;
+};
+
 &sai1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_sai1>;
 	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
 	assigned-clocks = <&clk IMX93_CLK_SAI1>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
 	assigned-clock-rates = <12288000>;
@@ -720,6 +729,13 @@ MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__MQS1_LEFT			0x31e
+			MX91_PAD_PDM_BIT_STREAM0__MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
 			MX91_PAD_PDM_CLK__PDM_CLK			0x31e
-- 
2.50.1


