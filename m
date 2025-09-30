Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628ABCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCmkZgKFMyuT+sM7m0n7s9ktzIaXj5k2PNLO9h9tIOA=; b=nmQJ7YE8DZUnx9I5PrTpb/nl1c
	XinrSxQiv5d349Tpa/vrb1nUYfoOe9mUHHQ4x0khyQ0RvIe6/z07Nok/uerxBFcLFif5A2HveiHWT
	z+yRArXMe8zSjygjs4MIlwKu/4Kwh8F7AeFF6CSvSeRJ9cMjAOTXp/K7ys7p2AbA1NIIGTr4v75aX
	tAlHjewIpVJvGabAdMtpdn29U4zOUgTvRmdiw/zH9ud/gyMwaitIWkJhMjponuLJk24hgJPH6K4Z0
	LCKtyxeya9PRJ2TlrlAd58+pF6gmvmzSwDaqqD31jjwS0jOQS7QQbYFhkHgYAXt3CEp5JJpBVxKOB
	S7Z5MTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3U9x-00000004OTV-0EOP;
	Tue, 30 Sep 2025 06:48:25 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3U9l-00000004OKu-3nh0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 06:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3Xv6KEpIXJMTi71sn9OG/boMtY3S+rfr48r9l5wgRa0Rwvb7xbk4X7+67oVLeMvPxl4oh84+ZgzsnMk/OdGCGRykB1DlwEuCHwpCKtH6Ijeq1DqRCVH604oGulE4ehF/L+81sMdbBXJr5kOL1wNrvi72QoRul8PIPJMx4HE5mg+S1Rl6uRvTZ/cNcA33sb0WQ2l421zvZVvehh0fngdxBhlxoxOPoFyQKpDfrflWpB9yhs4fOy1GdU5/HVEdHyqHCRncPoZWT/zzfCcg9fIPR4EnlN0rpuckq9PwufzsayfI43OUhip1BuLrhNmmeqR9JzaxtNkJbTRer10wUF4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCmkZgKFMyuT+sM7m0n7s9ktzIaXj5k2PNLO9h9tIOA=;
 b=MxBvRKQZryJdT4qYmRK14xpHX/vjGYgK6MmHHFiHNTLfKpq+4w48SlQTE0YYMFMReTTCQi4EjuseTsWjLjjoyH7xc6FLkquKzOw8JF4XrPMXDjCOBCTmI9ippRm8xXb4t+33Snq8Rx5VED1XC9zBVXSrOkXhc6+mD2yTajmWcbsC+teLaPFs+9X1kptlY6gQ+Ocwsbl9PgDl1LQc4dCWz2ZONl/qrflX9usT9EMYSahf34ZuKunAaUzsbDEM5hsno/m6fN/rsSFN5Oi09SdFQboK94fLuoEHQI4CvgtIEpPuS2xLPzKNehVTrxEin/4Q81OeF1mX8vHe3B9y6hjWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCmkZgKFMyuT+sM7m0n7s9ktzIaXj5k2PNLO9h9tIOA=;
 b=Onl5RZQabFgBXYiwElu34PaD/lr8cojCK9/Oki5s8+VfKaBespiKQ6HlLMwYzPVKCwaCuM9oI2m0g4meEdxP2h7cX5erSTZ73MaWILf3JHgns1P0Fb/wjChORW6fQGDuNXcpUE4LupRFUPu9e5lNigcw3Hdnnjc6DiXHxBvgAzY+YLSaRJVeCFW9+RAAUD8Nf+6oOatNEGbZZFqGPgeH+ySWltIWcYf5ZsysqKonLuZ7AP7DRk71jhfDoBsDSzwlpmdaIqgF7bcw3qy+xnlZ+wT53jUBbWU94bwlO3zAg4firOrYiIBKWcG1Q5rSu5EeNEeKFkBqZslG74XOcLwvSA==
Received: from AM8P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::26)
 by VI2P195MB3100.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:2e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 30 Sep
 2025 06:48:04 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::b5) by AM8P189CA0021.outlook.office365.com
 (2603:10a6:20b:218::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Tue,
 30 Sep 2025 06:48:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 06:48:04 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 08:48:03 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 30 Sep 2025 08:47:46 +0200
Subject: [PATCH 3/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10: reorder
 properties to match dts coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-3-d5d03ccbfca1@phytec.de>
References: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
In-Reply-To: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Jan Remmet <j.remmet@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|VI2P195MB3100:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f4e644-baab-4862-8f1c-08ddffed4e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1pRMTc3ektuR1Rpb0ZJMURWbTN4UW1UVVpYbys3RGM0QUswYjZqTG5taDg3?=
 =?utf-8?B?dzdKSHFSVmkxemNXTlFYQlMraWZ6dTVwVS8za3ppUGVDekE3TXM3M2hHTnlV?=
 =?utf-8?B?Ly9wN0JFSmdNdXB0NVA2VHg4VkxZbTZHenBCbDMyYU0rK3FlTFpOa3lqeS92?=
 =?utf-8?B?djhuL3JFNUlFVDFGc3dIVHNJMkdheUdEL0QzQ2lDM1ZUY2JaNXNDVXgrZ1My?=
 =?utf-8?B?bjZabXU4cFdFVGN3RDl5WjBlQmQ0Z3NZS3NERHUwVlE3SlhXZkhUN3VwZUtp?=
 =?utf-8?B?OFFIOSt0U2RFSXlJeWc3MW1SQXgvR1VDb0tucmtDVE1tblpKSk9EbXZhZFVS?=
 =?utf-8?B?d1k4QlZqd1ZUczRNTENranVKUDc3UXdHUGlLTlJVRzJJKzd4ZzJGdW1oWHJi?=
 =?utf-8?B?dkwrd2JHbUgyMXl2WERDRHhQMGU1TGdtcStIV3BsaENtelFURnhVRGRKNE5G?=
 =?utf-8?B?ajFrcDFUTXlWMHB3a2oxRFNPcWJZdWxKcHZSQkVTbTdjWXAxSWs3a29LY2d6?=
 =?utf-8?B?NUthK1IxVk5PNWRMMEZFZXY5WngxazFJZFJZV0E2M21zMkFwb2N6bDM5cnl3?=
 =?utf-8?B?bTM1NUxuMmw2WUNnSElhRmk0R1hZK2V6Rm43RFZJQXhUNzJuRi9wNU9yczhn?=
 =?utf-8?B?aldJYTduZzNMM3lTanJWcC9YQk9ZcVd3SXJsalptYVVuaE5PeGMyb3hRWGVp?=
 =?utf-8?B?YkxxYjhnOG40c2RibllabytzUmFRQW5jZ1k2dzBBa05VSkhiUUdEMzRzUTBE?=
 =?utf-8?B?VERqU2t0aEt1d0VTdGJ2ZHFpY0xEZkVXVmxFYmN1Wi9lMlJiNjBCSERMTlEv?=
 =?utf-8?B?c2FUWXp6U1ErYWhmbGQ0b1ZRY1RCL2NDZ3l2bVJab1BLWUlQV2dKMVlQbU1l?=
 =?utf-8?B?SkY5Q2VXbVRIZmdWQzdpczI0NExZSVJ5THFscWt4Qm5iMWxVQWtrSWRpRTdr?=
 =?utf-8?B?b1A2VXNNQkZFaEZuNm54eXFPQkp0TjlscGRwSWxnS3d3VzkyOGJqamFWb1N1?=
 =?utf-8?B?azVtNGxhMDJPR2dKbDFBUU9tSTNSYWJmVlc3NkZ6cUxONHA0U1RNbk1nTXk4?=
 =?utf-8?B?RkRWa3B3Q1NUY0tva2lVRGJYM1MxMFJLOTJVT3RJVm9tUURNZXFwZlZSRnc4?=
 =?utf-8?B?dTBNVGREbFpBcnZURDNlVitYVUxoaWt2UitPNndXNmY1M0JLYm1ac3BVckpH?=
 =?utf-8?B?WHI2Z3NnUHZoTDVvcjNwc2h5MzR2UDBwNmhOZUtUL1ZQdmVkNnl5M2dXREhh?=
 =?utf-8?B?RXdub3NzN1BHc0drV1NPaDRxMFM0cjQyQ0VzZ0lHM2ZrWnErVUVnMXprbmtU?=
 =?utf-8?B?VHZSTjNVU2Rna2xSV3g0WllNTWVXREJUR1FpSDYzVnA5bEt3N21ZN0s2VWJo?=
 =?utf-8?B?RFhsZFQ4SnVtUHlIT0tGNnNlMDljSllvY1N1NnpmRHdPbVBTbVhQdWg2dUts?=
 =?utf-8?B?and2WFJNN29ic2lFazZmM0hqRjNlbGRzNy8zajMvSk5FNnN2WFJ0T24yTzZN?=
 =?utf-8?B?c2RSRGl1ZitxREpSb1A2ckUyNnRlY2hSejRtT09DR280aEM2ZnptWHJtUUxI?=
 =?utf-8?B?VWd3L3BwZWQ4NmR6QVRpZjdZRkJWbXpXVmNPeTRJajhKcFJwQWxpREtua3I4?=
 =?utf-8?B?d0QxWUpRVkthQ1o3VDVkUEcxci8rN0JwKzZXY1M3dk9WNWMrWHA3U3NRZ1dT?=
 =?utf-8?B?RjA1OGd2NmwxTjdWTDc3OTRrYUdCc3g3d3orZjJlRzJtUkxEWVl2TlpGVXBn?=
 =?utf-8?B?VFZSaERWejM1bGp6Z1NDaEZXYmVHMnlVRHVKQ0lzZzMxQWR5RFVtSXAwZEdG?=
 =?utf-8?B?OWd3QjhiQ1FSakZ5QmNHMnRJSlN1MjhZaHNNV3pqYTFnODFkMktlSHBmMkpX?=
 =?utf-8?B?cWthdmZEdndxYXhBNHBzQVZBY3ViaHJxT1VDTkp5MEtGUk4vODBnSEtKUzFq?=
 =?utf-8?B?ZVVzWUh4WTZnSmlka09UenlZTlJCTHE1WXJIWC81dmhwTUZ3aGtXc2RxOTFu?=
 =?utf-8?B?NDZSalV3MmpqSEZ6ZHc0WjlaVm1vVC9UV1VXL1NPakt6ek56eWpwNDlXeVhW?=
 =?utf-8?B?bi9sZHpSSjZ6bVFVVEFBSnl1bWVYMjd1TElUUTdqZm12VUI0b3U1THNXRkdt?=
 =?utf-8?Q?qKho=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:48:04.6903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f4e644-baab-4862-8f1c-08ddffed4e96
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P195MB3100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_234813_969244_484663F4 
X-CRM114-Status: UNSURE (   9.57  )
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

Sort properties. Rename regulator label to match schematics.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso | 48 +++++++++++-----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index 5d4f6a9c348b57ee903c7b74f8c8e2b318060945..74547642a34aadc60ace9a9cd2ddea37877d6aeb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -13,13 +13,13 @@
 &{/} {
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_lcd>;
-		default-brightness-level = <6>;
-		pwms = <&pwm4 0 50000 0>;
-		power-supply = <&reg_vdd_3v3_s>;
-		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 		brightness-levels= <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pinctrl_lcd>;
+		pinctrl-names = "default";
+		power-supply = <&reg_vdd_3v3_s>;
+		pwms = <&pwm4 0 50000 0>;
 	};
 
 	panel {
@@ -34,27 +34,27 @@ panel_in: endpoint {
 		};
 	};
 
-	reg_sound_1v8: regulator-1v8 {
+	reg_vcc_1v8_audio: regulator-1v8 {
 		compatible = "regulator-fixed";
-		regulator-name = "VCC_1V8_Audio";
-		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VCC_1V8_Audio";
 	};
 
-	reg_sound_3v3: regulator-3v3 {
+	reg_vcc_3v3_analog: regulator-3v3 {
 		compatible = "regulator-fixed";
-		regulator-name = "VCC_3V3_Analog";
-		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VCC_3V3_Analog";
 	};
 
 	sound-peb-av-10 {
 		compatible = "simple-audio-card";
-		simple-audio-card,name = "snd-peb-av-10";
-		simple-audio-card,format = "i2s";
 		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&dailink_master>;
 		simple-audio-card,mclk-fs = <32>;
+		simple-audio-card,name = "snd-peb-av-10";
 		simple-audio-card,widgets =
 			"Line", "Line In",
 			"Speaker", "Speaker",
@@ -89,28 +89,28 @@ &bridge_out {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
-	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	pinctrl-names = "default", "gpio";
 	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
 
 	codec: codec@18 {
 		compatible = "ti,tlv320aic3007";
-		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_tlv320>;
+		pinctrl-names = "default";
 		#sound-dai-cells = <0>;
 		reg = <0x18>;
-		reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
 		ai3x-gpio-func = <0xd 0x0>;
 		ai3x-micbias-vg = <2>;
-		AVDD-supply = <&reg_sound_3v3>;
-		IOVDD-supply = <&reg_sound_3v3>;
-		DRVDD-supply = <&reg_sound_3v3>;
-		DVDD-supply = <&reg_sound_1v8>;
+		reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_vcc_3v3_analog>;
+		DRVDD-supply = <&reg_vcc_3v3_analog>;
+		DVDD-supply = <&reg_vcc_1v8_audio>;
+		IOVDD-supply = <&reg_vcc_3v3_analog>;
 	};
 
 	eeprom@57 {
@@ -138,8 +138,8 @@ &mipi_dsi {
 };
 
 &pwm4 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm4>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -154,8 +154,8 @@ &sai5 {
 	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k",
 			"pll11k";
 	fsl,sai-mclk-direction-output;
-	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai5>;
+	pinctrl-names = "default";
 	#sound-dai-cells = <0>;
 	status = "okay";
 };

-- 
2.43.0


