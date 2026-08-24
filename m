Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CE2C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 02:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lrcjEBbbblSnUzf9sHH7EdMvdf+8u8U8CsBClnqodg=; b=KLh5yeZtAHK7Qvao7kf9Ms7JEz
	lNCjyHtYxUulibOCAkJHvVdegKLQ2LOkVkr1vh1if70DD1RnM0NJNKp1o5kFTHh+mCmvozm0okyug
	4RQAirW2fjCIOuFAiLRUXHcfu8Wz0g4bXxJC9jbw8/QfBAkofOYkedSmbeFppoL/Dwq8jMSwvGbxc
	18Aql4KowFD59rcvQvObL/EAhsxorKCXVXiggBcorO8bnKW4FSCWAwnKaQiP6ylI3dnRo4EDzxOnA
	4qmDobXV1kIRV0yBz1s71IMyDmKayTO+QkXOsBti+/Ig9czu3pQ49euVJfoQAm4ZMbtbGosFzJ1bs
	yT7bUHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKJc-0000000FmOA-2e2x;
	Mon, 24 Aug 2026 02:21:36 +0000
Received: from mail-northeuropeazon11011029.outbound.protection.outlook.com ([52.101.65.29] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKJa-0000000FmK4-05Lv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 02:21:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjOthAigBWNFvZFPBL/zk3EVuoB05CXbVVeP89LoArI+aLbDmA3tqPg4hV4O1Cm9mTzGUOi1DADsRTuUtkPyRXYgGfzr9RplRSrt+B+XwrBKlPLOUDACMTu+0L7HsE4X8qYabsp2X77FJQD2RS3rMe/gT/VBKpvJtBI4/YP25NJYJ3djwKf0kO7mljnJJNyJLBlnJocXem8PiWiv6ITtuSWXSAQH/xNrpmDrrhu7pDtnK9yfpiYXaPRh+8lFnrh51LTpfSIVlVtvR6nge1VtDZxxyYSWmcPIRoUT7nbTC5sm1lfxzdILp6POyN+8M7hMvLZlik9/D27Hk5qv70Hhew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lrcjEBbbblSnUzf9sHH7EdMvdf+8u8U8CsBClnqodg=;
 b=hfk4VxjsfR1MzC4b6e+4nX9YrOKH3tut69YPcfQY34z3vxsNU0qRtvGffbKWK/MlkU1aQ1nowpogxusytDUsi6yS+b3lceaj/APnWJW7bb/iuyoYrE8wsYuRhbwjMdFeUSlXEXzK+wu/DcsPCIItRLrkoL1GCnI0x190EJROZJ5CvhKQw3fe+jEv5awLX2quYm6J/ODHGXajT7BEg+BON+jtT3FTZ/75z3ASZn0iokVAo4aNVbY36jFZoIvyIHJtt9wsDYheOofltWRwAAYDpuyA5Hqm270xmoIk27t0XI9XvVuIDp/hK+tkjQxB2WXrHJfVLk4YDUH44K5wV27eyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lrcjEBbbblSnUzf9sHH7EdMvdf+8u8U8CsBClnqodg=;
 b=bd+TxCdKC/pAaynR2O2WrOy11e2gYcZcyoEfqeGacteJ5EioD82F47TyFBEWWhGwKhffuGXnd93bSP/XsSnDlY4XM3RWaoUzpEswE+++jNEncr+ymcgUxM76ovuzn/hk/gqBWMZm2m054p/ci46LVzWpV1QRHPOqu6Nyrk9NYP0K7EulDQTk33BFMi4zl9oc1AI6RiN76daSUn/JOSEtOZKknWSUanjrImMzzpZgLoOiFfFZtTATJvsddH0U0t6AbAwHsZwaFpx+Z6NPbELkCQFqDAxeIxCeYc1biOcbcSQlIRWgHD9vPD1DnJ5SrzPw/z5oCRviVaJGloNUbJS8aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VE1PR04MB7360.eurprd04.prod.outlook.com
 (2603:10a6:800:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:21:31 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:21:30 +0000
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
Subject: [PATCH v3 09/17] arm64: dts: imx943-evk: Add board muxes to select between CAN1/PDM and MQS1/MIC
Date: Mon, 24 Aug 2026 11:20:12 +0900
Message-ID: <20260824022020.2812810-10-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0119.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::9) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4bf74a-eb37-4bf2-8326-08df018668ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IW11ShvfoeGkzqayv+MpPbba5jl4e6Nkc1pe3FOdI1obFq9plp2rr3lViNoE5P6KtJVjWBzQ448MOCH8y8hnKZYCWgFwaQZLw/bg+TVIeaCSStbv6R1B2FhBhaAh75LtzizUbTjbCGtm3i4VtIWXrLOX1sKu1LHH6jR4Io4V7OU7y2+bhp8l6X2yBMn1BHsEY9LuBWa7DsTbeCk1cCJBWRMtNgVsBq/u6CkSEUQ1x+3J7SICTpy8muNu5qvZzrD8k3EZLkrN6kVpBJvXUt8o26pAvGmZyoYwe17RBPBxK4i64SmRDH162dzniYrk7laZG/RX+ITPZl8xgOuDpJBDFuJBvEoRTgTDdKa8IRJHMymmEHmV35Mi7kw04Z0ZP9OzRhhNQd5oF8y9fz4+Za5iszXRwh7nMo114kJRu/FUZWe0xe/Qgj5ba1oVeBsCtWwd7JbxW/h3TTraUMJ1vt1f2aRJnXcvNF/bKAK3iofP6L0tiMp7RxDXvhH94XkP+SWLRUwnLeUXZYagRYe0buaAvYLPZ4mYpDNahSEuMBJkCdSmpRN2s98f+hlWtmRR6oTHSOv1mlHBpXcGZl+u0BSKudkwnjFRlqymHtie6OMyiDl9VkmjlI+5/5EPGm2nI82pWCDFUO2Kh7SpyTSLOfzKTmYX9Gw0SGe4P5xB4FMeVX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TrgTeyFxFqbIO8nsM1ygF1cszQHfXMHCcxGceY85BKtJPkda2BN8R1NbKzSa?=
 =?us-ascii?Q?ZMnGd023uDg3DSXNcFkKLWVlxm4w1WK1x9L6x+rmM2mnKqINOMri3PGz1Ixk?=
 =?us-ascii?Q?y1DRtUu4cEIG/YwZx2UMwIT+pJnBFGpUIA+IVIX4hq9r+K++KVw8DVI+UQ/q?=
 =?us-ascii?Q?q+2TruIRRksMWTIvJfBelgOYyHP0DzZY5pgyuuORF7ADgrd0yxtOLj1z4AaP?=
 =?us-ascii?Q?aPxWuXkS6xkyTejBOc4nGR13IYkmeotH2QhWiW2aaBIsGqiBPrDENauQnIzP?=
 =?us-ascii?Q?M0zZPQDHeif7ILpE8EkbAPaSZIXlh68GlxIDX8Pw7EamYTHlo/4BjEjbSWhi?=
 =?us-ascii?Q?yQCTMoyg8D5POfcr9hXADQ6vohtpOum+feDkLKjgjiPdHORxphTT9AN9WaEF?=
 =?us-ascii?Q?0E2PaN67+/JOJYHZZ1XCdkNn+AqOYgrbFM/wFTpmE60baDHbdFD2uAQAbPvf?=
 =?us-ascii?Q?tIVBwIYKfI43epySVsdQWiWdpq4hFZrbzXO0bSqAs3Tvam4FnsA39anqsfuo?=
 =?us-ascii?Q?p21fePPlSbdlRRfxF2O1FBWF6Lr+FkysTh1Zp3nOEI8KqkI+Pl446UyMgmAG?=
 =?us-ascii?Q?TuumDU7s20lNOC/pEC6g6YsGaq50SpK56xdqG5cA/X0bWJWwrksV898xz3Rt?=
 =?us-ascii?Q?zEpKTL3WFaU8Vf6ca52j5N9CDu+Qga/GqzsbwrNTX3ZSJ7Bzif2qTshxd9el?=
 =?us-ascii?Q?B0MdGjPdjdMH79i5UxI23si0U8FKdIRwO/6d3tFAalyESDdCW/8ZCsznA7Mi?=
 =?us-ascii?Q?5FswbT/njwRSD8ac3BmrVMIG5WjOEP87ix2ucRsCyjIu9jqU90CH70j7PEW6?=
 =?us-ascii?Q?DRx0TTWJXqNJVcXq1Fo4et7PkksUClAWtpjtt7BYAOUSpfMJh9/COrCvQ2Ql?=
 =?us-ascii?Q?oj/OBgfq4XyXTsrAFa8Y2FDLem5BxbIaILNhVl8mMF0m7SEQCKVlEoF4MiLw?=
 =?us-ascii?Q?4BKwtH5vYiKPDWmZpuBI0VlHK/4DHzJz6xDi0sWo0YUO7xhBx0X6tmRlcBma?=
 =?us-ascii?Q?irUfztbrbgjL4fBeHrdtR27LWdXkk13QrEzAccqqSE+8DPKyZCpLzCcBOIf0?=
 =?us-ascii?Q?rKEWxOggfTBdX1+Da0uX5EgJ/RqV1zSSVeOWSsE4sl7s1zSFysxNExYzJg4T?=
 =?us-ascii?Q?+RB59x8DdTN9VE6JCY7JGZJr5ANpH7C1JsKJl/jz9LH8lWibSGJAokD78ZMn?=
 =?us-ascii?Q?YerhL7pjqC9HjekHo3ZGxZ1NhChSaeB0g8di0a6kFv6hSh6htinBHBjJT7f9?=
 =?us-ascii?Q?hP141FUDVwYtaJ2jl1Pvsh1FK+V//0aDHlzPKNE/lv6fIX6FzGAWKFaZrj2O?=
 =?us-ascii?Q?DGXO3R9j2Vu8h+vC7mNOPSI+GMo3lgmIwMNffb1KTQ3b5YglLJpaUAIXzKDP?=
 =?us-ascii?Q?UxeyVnB7k7J6IViLCnPCOt2RMgtLl2cibO+oPK2MiAcnyxpaZ9jR/PcI9Po4?=
 =?us-ascii?Q?WcpPGnGGklEF+QvI8FnRA2dxRzve2cGm3g850ggOmnCcW1KTRzTQAXj5o0hh?=
 =?us-ascii?Q?oHzaCKvzyUMkVvp9Vv9lZzvHQDOepOkQZ2hIroYnrZClOoWp/lpyEgTpYKgl?=
 =?us-ascii?Q?WvAQaphbtlBhm8Js8aMYCXIsZdzYW0I5W04z947LDANXz3L1Dr/1Js0kfmyx?=
 =?us-ascii?Q?wx+lzYnN2yGErvgKvBD7LbsgCYe2mICT9nye/n4dYSopeY4JqkBm5DANk0H+?=
 =?us-ascii?Q?F/6HINJSsvE/f1nEuIl3RivZd5Vk9fazrHEhNT0PI61qNVCkkYm9e5Rdu0hT?=
 =?us-ascii?Q?hqy76nHecpn3p5d1iJq4eWiuzkeldGPL1Ok4+01ThajwLOLmRX7o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4bf74a-eb37-4bf2-8326-08df018668ed
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:21:30.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDt3OLeTWNtxEHLuWmlzyYaXwgVkcM9pI64idLJRQ/IMT/SDLIVyeDM1tWlIPPm7bHIzhjm7PCEDCMT3p892PIIdzmUiDUZHgNUkIaQ6pKmAQLUIF2tSAqRbMeRNRd0W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_192134_112129_D4173CC6 
X-CRM114-Status: GOOD (  11.64  )
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

CAN1 has pin conflict with PDM, and MQS1 has pin conflict with the
MICFIL function. Replace static gpio-hog settings with GPIO-controlled
board muxes using the pinctrl-multiplexer framework, so that the
conflicting functions can be selected at runtime.

Update the MICFIL node to select MICFIL function via PINCTRL.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 49 ++++++++++++++------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 64660f94f4e9..07b782ef698a 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -38,6 +38,40 @@ bt_sco_codec: bt-sco-codec {
 		#sound-dai-cells = <1>;
 	};
 
+	can1_pdm_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416_i2c6_u44 12 GPIO_ACTIVE_HIGH>;
+	};
+
+	mqs1_mic_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416_i2c3_u171 11 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can1_fun: can1-grp {
+			mux-states = <&can1_pdm_mux 1>;
+		};
+
+		mic_fun: mic-grp {
+			mux-states = <&mqs1_mic_mux 0>;
+		};
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&mqs1_mic_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can1_pdm_mux 0>;
+		};
+	};
+
 	flexcan2_phy: can-phy0 {
 		compatible = "nxp,tjr1443";
 		#phy-cells = <0>;
@@ -535,12 +569,6 @@ audio-pwren-hog {
 					gpio-hog;
 					output-high;
 				};
-
-				mqs-mic-sel-hog {
-					gpios = <11 GPIO_ACTIVE_HIGH>;
-					gpio-hog;
-					output-low;
-				};
 			};
 		};
 
@@ -651,13 +679,6 @@ pcal6416_i2c6_u44: gpio@20 {
 				#gpio-cells = <2>;
 				gpio-controller;
 
-				/* pdm selection */
-				can-pdm-sel-hog {
-					gpios = <12 GPIO_ACTIVE_HIGH>;
-					gpio-hog;
-					output-low;
-				};
-
 				sai3-sel-hog {
 					gpios = <11 GPIO_ACTIVE_HIGH>;
 					gpio-hog;
@@ -710,7 +731,7 @@ &micfil {
 	assigned-clock-rates = <3932160000>,
 			       <3612672000>, <393216000>,
 			       <361267200>, <49152000>;
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&mic_fun>, <&pdm_fun>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.50.1


