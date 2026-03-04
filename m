Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7812EB7ED6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxmC7REIwkDLDNsvhDHypg0S1aF/Jcbc7I0TMIizkpg=; b=ND8BPqg9zmB0uvx67b8YZBnX62
	l4FS91YYQiPJhUwx4+7CBlAMHkS6WCh7NNGIFBGT0JjTGCIHMhl5TIniiUKkqnqALOijb56YndZug
	hcmhozQGpNeQB3iwWF5JdH2c+hGITKDB7fuR08bLZcheApwhKnRBy1ZYVP2yww2zMSN/r5k1snk7l
	wfACioenp0ZzJzAqdNE3aHqBpvfPkLnqPOqZEd7GfT3VQQ9RcxE8tiBXfjnlP5NzPn5yJ3Z8lzGsx
	67xUhcUPwSIktnM55wt1/J0fPAWmE6A3/LbNvqSuxlYrGf6RwMnwnGp6/RWFUHDwfpbtF4W9b7hlJ
	scn3bbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkVY-0000000H6S8-3BZl;
	Wed, 04 Mar 2026 11:35:16 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkVW-0000000H6JB-2Swa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:35:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvCGg1cwNTuTw8XvWZpc/PSEUrsI1vKrPw19leTLCQq31PNezkKzyCRih1H7W+cLSXDapa/75lhYOqfZcwz99yxALWCqTBGhTofLurkOUggj0rHNunoxtZ5A2sJ4rDTqT48BaVqxFCQAeAQBVBbvZqnX+KdOaXKjSmwznpGT/rYO/0nXxnbxRC67j7rZSCUzE5mf+L1q5Gi+V8HevzrBjixya4+FKeeNds9k+mW1UMQ/oHtdnbgP/Da35FxBoUYMylmhjRDLWlXqxNclCAT0e5/euj8/GH9qUmtVbtcr24YDNOeTBUJRqnHdr0fDiyE6oYAz6feLTVEYo4lf3V1O9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxmC7REIwkDLDNsvhDHypg0S1aF/Jcbc7I0TMIizkpg=;
 b=WaOmJhJ6YyGkPRfqATdentihOaOPWphvenqVYfQUQVJjDv4zFGSxfMPxeUme/gUmwesFqpgwR97UUSBRaDG6NG5SgxeeZeSDMRZgKpdHpKWUeh+5xYOoAzBtxGfO6WAlVpj249aCNQxX32x9d14HcAt/0Eo/QDdHJpc7vr3HPLv9dqHkQzt7x24eEXR6KhOqdVrYjIDdya5rgO6iOmtbcOJm5hsBhfmIHNUD9An9lvBDzMvaa8GPd/cXTNBiBOzV3wyH0v39/5G+9p6kkO3LQVoCpzfG0P72Zn135Orn5C8PR1Eef6CvHVi95rUcMwW4kyTtlKZVN2XCgxJ4BqXDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxmC7REIwkDLDNsvhDHypg0S1aF/Jcbc7I0TMIizkpg=;
 b=Ae1Om627PSc3fVKIcpA8O5h6op/Fc5SK7jbnIRD6olV38A8ggBE3ouY3WlpFYwz6Aklkm06nCxPTi02FYZpgnamQeVvk9SccbpSXLx6yQpw3FRbLea+z/KokSrK9ZaGNsYFo/tsYd4xAiPqOQhmhvQT9NI4FKo/LEiZZ38cobKVwutXaWAKlcuJb7avS2Kkrnthxm5UYukvZBOkMmkRlxrrX1aO6SOvwx+j2Hg2nen7P8VUMwnCDiMOO5SGB7QrDCFhEbso9zHq0kj87g8n/dduFuVwRIlcZGwml265K9pLo0hsD4XxbZJK6lPkvjmcXa1IPfDbdDabmjYX3zREXkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:35:08 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:35:08 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	Ying Liu <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 8/9] arm64: dts: imx943-evk: Add display support using IT6263
Date: Wed,  4 Mar 2026 11:34:17 +0000
Message-ID: <20260304-dcif-upstreaming-v8-8-bec5c047edd4@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0021.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::9) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: 40fe36ea-142c-4923-f655-08de79e216ee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|19092799006|376014|366016;
X-Microsoft-Antispam-Message-Info: zaRe6JIhxfyoe88+ozGFIwPEceYQvZ7BzKu0UFsCnL8YJjJPtDMQZuwQDAeuWpQFdfyfsECBTrjK5ApA/FHHPqfdXfxFK3HlfDy2Qn3oQ3/zZLleaWvQq+PXDGxDYyMw6Fa9Ew1GKJzfoktapqry+aMuprnhTrBFtYZjm2YEAS88Kd/SWexmLuLTnfbbXSQOuVu9vHYUlsMo6dAJ7dcePD7KgXELbptc0iKOgwSboBTv3B/QHwgYsNfDIjKMaajS1KdOdNwNVmhi7skUkviNXQqM0yCokVW+JYRLomyDU7zpmVrqAUHcQ47yBq42B3F7CK8z+a8zkP6wgln/7l2VK3rw2g23ntGlgas4N42JMwNULCAkbVAVHCfD8Aytj9zvgyhw3lSiBfPfQ8UejYezPMcT7xmvqH+ZRJfy9hFJOW9pvzX5fIAEBitN+lmmGdNSSIuHIw87JJS5bG3u/c7mv81Pxzapb5n/WLeeqnnUZWg3ykMClT5vrowDIl+3hvnA1ZmscjHdrQqwid61tG5dDzigRItb7YVIr84hJpaYD67OnuovjT6X3DPS1JnmEcTLbAggxoCTstsEkgfxXnSO5v9MbhEqdhq3C5fpFij/C67q2arZhrAI81foFVmV3ihtWgK6Aeork86p9YnJ3eWboFQ4src5SLICeP8pmd8sROgRhml8yzYt3LvEUFzFZovXb+x99MZBiIqPEyQizqqjAECCs610op1pIFtv3dwoNb4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azVrUUZuSEJ6MlgranBPbHprSGtVYUNOVXZKQkdZZDlQT0Rqd1UzOFlTQW54?=
 =?utf-8?B?Z1BjWXdhSEVoMGd2aU5XS3dSWGJsVS9SbUc2UXJXeVJFNFY1dkxrdEpxcHhL?=
 =?utf-8?B?U2kvNi9sS1hZNW1yU1RRMitvaDdlUUhDVmgrQi9pbWcxellFVmhjRzdCaTBa?=
 =?utf-8?B?SDBsNDJheHFNTUswUGVlN2RRcmVJOHRVYTJoQ0NkTVl5L3BSYkNQOGF0Z0FZ?=
 =?utf-8?B?REF1RTJ6OGRaYjVIbnBIUFF6UFF6dk1NWFBDRzlOVFJEVkdIbmpZOTFQaE5Y?=
 =?utf-8?B?QlN4OUQzRW4zcTR4OEYrUnNNTVJZU1poQjdpanY2VmlXQmYwV2NObzFxcnlT?=
 =?utf-8?B?cklZV294Szd5WWoxeU14SlJ3Z1dpbUdhM1M1VHBkSjM2eVBRbCtyMi8zV29v?=
 =?utf-8?B?R2FpMUY5Y0pRTWs2aS9ONlAxM0txWXBRVTB0SkRQRG92UTJpb1VzLzVSZmNx?=
 =?utf-8?B?ejE4T1l0bWVtdThUNGhoenR3S1IwRjczNG1sdk5wUkp2TU1XeDBDODFPVkRE?=
 =?utf-8?B?bG5qamhUdmdTZGhvVFl3aSswM1dPQ0tQcjlCTUVmNFBTenVwS2d3RTY3anhZ?=
 =?utf-8?B?cVhoQlFpNHdNb2tDVjNpUmEwN21lYWo5RUZFQmQ3aXNZcDBHREp2Tml5TjBa?=
 =?utf-8?B?bzQxTUlWcStpdkN1cFVlZUNYTHJJbjdYTE1ZdU83SFVGRk8xbVgxeEJnRytT?=
 =?utf-8?B?L0crM0hINDYyL04zTFJvZ3RzbW9ZazBlRDNsS2xvQUNxa0ZtdXJLc216bGl4?=
 =?utf-8?B?andDQkhaUUdxL0JmbGtFWExPeVZramY4WFdFaCtWK2oxbmx4Zm9Ubk1lQSsy?=
 =?utf-8?B?UUlSTFFpWUFYOHZUWUw5QkpJUjFiUlFaelRiQmMrR25DRXE3cDdlUVRBSGNQ?=
 =?utf-8?B?MEFVTzNiNEJTNjl0Y0JZT2d6ZTlGSWJnOHdiSWZ4S1UrM3ZROUF0d3FNQlJM?=
 =?utf-8?B?OFJaR3h3T21BZkFKQWFKK2lsdmd2d3grbEV5WUZFR1RhVnRKanVBdnBRN0k3?=
 =?utf-8?B?d1NBS0FxV2ZTV3VESmViQmRxRHloVlhXTlN1Q3M0SkhMR3ZxL0QvWFZlWkI2?=
 =?utf-8?B?bnNUWER6UytxTi9zMVBFR29SOGxiTFZWSkNqeUpkWm9EOWNwaFZnNjJvVFJZ?=
 =?utf-8?B?bDVRTlg5a2pLR2NOSXNabjdON2lpcDlxLzBrRUQ0Qm1ZcnBlQTJKNlpsa3JW?=
 =?utf-8?B?TFR0SGQ2Z3B4end1K01FcVgva24yVENabmxmczB4VUtQZVp5N3BlUDdsUy9K?=
 =?utf-8?B?dEtiUXlIOERYUE5YSnZrN0ZmcWM0dVB1QWNVNStQUTBlcFBxaTdDRk1Xdkg3?=
 =?utf-8?B?eXQybUFObG9CTEQydGFacjRKZzNQNEFBMm50YVNzZlBmcHdEazlpRDdMdG1V?=
 =?utf-8?B?Zmt2MEhTeGNWK25aV0hCbmhHcGJTd283Q05xVGkvSkNWQkRRQTM4cnlFdnRF?=
 =?utf-8?B?cVdWaXhTa2lxUHlNT2FPdmt4SUVuTUl5T3k1ZFcxcWY4YjNKcGpFc0YwejJP?=
 =?utf-8?B?ZjQ1VWwrQk44Z2NXNnVUUndXQXZTVGlBVDFMbXJnTWgvYU9sUzdwM2Z5b0ZP?=
 =?utf-8?B?ZDAyaExCQkxkOHlRQk45T1Z4L28vUU9hc1NUM1R5djdkdzhxa0xPa1dMM3BB?=
 =?utf-8?B?WFRuZXRJQTJTbHBXMUFISC94VUhpczllcUwvOEpjMWpZdlBCVyttWVhXcVJx?=
 =?utf-8?B?VUFTZ3YyeWIrRDA2dkhvK0gzV1VCS0ZNNVFMVXgrOGUzdWxiU0ZvZkU3NzZT?=
 =?utf-8?B?eXZHRktncThIN2QreXE4Qk9VRGQ3N3pHcWdmSlNZNVRic213U2pkR1gxWWZE?=
 =?utf-8?B?cmZpSVByRmZwR1ZPT0hGU1F6Q0ZJME5aZkFFSjE1bVJCN3NoM2NUblhpK0JR?=
 =?utf-8?B?MEp4U3loZzVNTGZSQTFjdndWZk5QUGFyQm82QkM5Rmx4dEtvOUtaWGpxeGNL?=
 =?utf-8?B?TkhSdldXSGZjQ3VEUlJoUG9wTGpRQmwzZUVINWF2ZmprdVpiRDVuajJOMzRK?=
 =?utf-8?B?Qm1MUWVQc1N5T3liRC9KN0x1anhQVEIrSEpEcERkZi8rTDVZZU1xTmRaQzRU?=
 =?utf-8?B?YUQ3RnFMSHJHRENTMU5aSXJhNkRNU1FqSmlNUW9zbHZ6MzRtdldINERlL2or?=
 =?utf-8?B?OGVhUlRSaW9SZm9XS1dtZjhqUVd6ZjEvOHUrdnpvM0NndW9ESjVMM09DUFNX?=
 =?utf-8?B?azE0d2JoMmdwVytFZlZ5emdPdmNVZi9jYmRyOWV0b1dMRG4wVGpweHhjdm1x?=
 =?utf-8?B?RXVmdUNKVzEwME9hYk1QenArYXJaZFlscGx4RSs0MDFKOWhFMEM4RnNMK3lE?=
 =?utf-8?B?dFBBNUhLQ0RwUURRYTV4OXhXcFA5b3E3VWVGL2tadlcvY0xEMWVtWUhkTmRP?=
 =?utf-8?Q?feUBii6WRp6WKnTE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fe36ea-142c-4923-f655-08de79e216ee
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:35:08.8688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBu+3dbktYNQE6DXkMbGj0HWA5AK5olQUjyIVn2WUKH/qJVrJ69HAQTs4OTPOZtl5cAbBMOJ9wz6weR9GT00vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_033514_639559_2477E42D 
X-CRM114-Status: GOOD (  11.55  )
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

The ITE IT6263 based NXP LVDS to HDMI converter can be attached to the
i.MX943 EVK board LVDS port using the mini-SAS connector. Since this is
the default configuration for the EVK, add support for it here.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 86 ++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8ceabe3d9239..0b69450566159 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -55,6 +55,36 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+
+	reg_1v8_ext: regulator-1v8-ext {
+		compatible = "regulator-fixed";
+		regulator-name = "1V8_EXT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3v3_ext: regulator-3v3-ext {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3_EXT";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "M.2-power";
@@ -179,6 +209,10 @@ memory@80000000 {
 	};
 };
 
+&dcif {
+	status = "okay";
+};
+
 &enetc1 {
 	clocks = <&scmi_clk IMX94_CLK_MAC4>;
 	clock-names = "ref";
@@ -217,6 +251,21 @@ &flexcan4 {
 	status = "okay";
 };
 
+&ldb {
+	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
+			  <&scmi_clk IMX94_CLK_LDBPLL>;
+	assigned-clock-rates = <4158000000>, <1039500000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds_out: endpoint {
+				remote-endpoint = <&it6263_in>;
+			};
+		};
+	};
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&pinctrl_lpi2c3>;
@@ -258,6 +307,43 @@ i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			lvds-to-hdmi-bridge@4c {
+				compatible = "ite,it6263";
+				reg = <0x4c>;
+				data-mapping = "jeida-24";
+				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
+				ivdd-supply = <&reg_1v8_ext>;
+				ovdd-supply = <&reg_3v3_ext>;
+				txavcc18-supply = <&reg_1v8_ext>;
+				txavcc33-supply = <&reg_3v3_ext>;
+				pvcc1-supply = <&reg_1v8_ext>;
+				pvcc2-supply = <&reg_1v8_ext>;
+				avcc-supply = <&reg_3v3_ext>;
+				anvdd-supply = <&reg_1v8_ext>;
+				apvdd-supply = <&reg_1v8_ext>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						it6263_in: endpoint {
+							remote-endpoint = <&lvds_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						it6263_out: endpoint {
+							remote-endpoint = <&hdmi_connector_in>;
+						};
+					};
+				};
+			};
 		};
 
 		i2c@4 {

-- 
2.51.0

