Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEF2CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ggynNS0cDIMq4+IAIPsohUIWDGrd3BFjyCx58WHEqk=; b=vg4EBuE3wNwug6fc1ifRzOitDG
	5QSzmcSbRJVnIdkpx8FSw59Q/FuixPAQCIv0FA2RsdSje8ZxrpuPhLPdYE/ygeuNLkSyhGKo6v9ax
	LerTqzohYSTiwkRcJHcjOYpktJfXVtMl972xXP9aWMiUlIhb3c/K+AxbEW2CUUEPtuJRxO8N27Rdm
	Hrs2jM38Ld0THrNdhNsraUzBZQyhUECiU03Vwm7mfu9/GKvYfOde4XdHvEj8wlLoTBIA946S6eILz
	t98YmoOrHOmQKgrJYuD8vIBZZfhoFCTiaVgQGTeoQA+OPjkwD70nZD2InrAbrmYJs44cRE24IQgGK
	Yp/TBDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfZf-0000000FanK-1NgY;
	Tue, 28 Oct 2025 09:01:03 +0000
Received: from mail-westeuropeazon11020077.outbound.protection.outlook.com ([52.101.69.77] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfZR-0000000Fagv-1HnK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:00:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTr0hgqxUerbTbtTdDtfx987GQ31PCcC5nnB6hfr4of5Tc/IjkG8mgkeeBbh4ag1USIkKQGUf3o7gY/EdCjY1p7FWjwAnTLqPY7ONeOMRx3uQRen+BUhAmV/9Q4Av55NsenilEjZlUTxgMpRz2b4ivpqCELE2cvbbnKqDX/RGPIeHNL447U6XZx2bo5UVBnWgYE3tpNmpK0MOeK1+PaKuiTZcw344xm+4EN9JmTqs45K1HsqGjc2YPJIuaB7Z/D1Y+e5UDZx+6nCE7Y2SjLXdAvH3ILm0Edz+EwNjsAxs53QJDh8UYyDcqtz0VWPbQaytsZLEAXun0eQ3VBPEqwVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ggynNS0cDIMq4+IAIPsohUIWDGrd3BFjyCx58WHEqk=;
 b=TeDfyXX1jA6B78q13g0MSLCXaEcSDr6yDleEeCzmCc8vbbTcMW7cvj/viZm+M47LYhYhVo9+rex/tlidNpiy6zJr2YlqlOpryzpGnFc8pRDFLqKpp6VfduvVP6oRVx25Y4qYOUK4Tx4y7r7py1S8C/vtrf0wKdv0fQY/4XWGPzUdYXK2ZSYlIFDFi1j8C9kF3VkP3reafG5Oj+rgVGo/GtP3Lklf2zIWgYWUaZIGdOUii0JF2sRWq6Nwndcj7QfpW93R/E+Y4L20Hm3zpCjXn7W+BH6djMNS6JMZ2OgsYP6XI7R8R0EtwSAAnc2gvHm9bT28XsYmFDOrpRXBuvZrbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ggynNS0cDIMq4+IAIPsohUIWDGrd3BFjyCx58WHEqk=;
 b=S1NE+UyhjGvKQEvNugpihUzZKaYCjQ4/fY8u/4ZtZghjpK9vk/pm4x31XEp9WnjGP5aqhY1p6qfACaNmfWdwXuUEVz3VGi2GTrT4+F0xI/C9Uy0FeTGh8fjvQs2lNeY4ROAx/Gcl6s9wv8QToS2CGySpE/EJEwJJsnTjNS80uzWE3sHgFMzmD8ka4+W1p8Y8ysD/tOR8Pl8gc6gqdGjKw2u9QTY1earJPaqZL9q/rwVN6Ck69lgmFy35UhDANhMOX3pICtdczF4LLux/iqzhoIrhxwwHKF7dAb4TSkkoKSqfCpdPWlst/G4PwUz3naEseQRSNITmK+EirM976NeiAw==
Received: from DB8P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::33)
 by AM9P195MB0902.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 09:00:41 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::60) by DB8P191CA0023.outlook.office365.com
 (2603:10a6:10:130::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 09:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 28 Oct 2025 09:00:40 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Oct
 2025 10:00:38 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 28 Oct 2025 09:58:10 +0100
Subject: [PATCH v3 3/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10:
 reorder properties to match dts coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-3-9b98f29a6bb9@phytec.de>
References: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
In-Reply-To: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|AM9P195MB0902:EE_
X-MS-Office365-Filtering-Correlation-Id: 14efa2c6-3be1-4f83-571d-08de16007876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUFIK1RmVXRQcGliZGxWcGtDNXhmU29DUEczMmE1WE90SUtueFh2WWIrWFph?=
 =?utf-8?B?YzR6ZXlkckxabkMrNS9XUVgzMFpXZHR4ZUxPVUR6blgxWVNhSnBSV25GMWZ4?=
 =?utf-8?B?alBKanBIYXk2bXExMWczT2RuKzNTbEhaa3RGL0ZRV3NFVmxzYjEwSHp3N0xa?=
 =?utf-8?B?bjJDaUo0LzhGeG5aUWRlSTZxU3VKa283SEl0blN3d3ZnT3dhOG0xMC9oMzE3?=
 =?utf-8?B?aWFmZEVaYVZnNkpoZXBieTNJYlRRTFh1SnNvbTZJQXd5WnFHRkRETG9KbEw0?=
 =?utf-8?B?ZDlOTXFRbzdqZlZHNytpd3NCeURkcGtSNkYzYXBsZmduSzAycWFvRnRsOWJJ?=
 =?utf-8?B?eU5pKzBJWUxqcy9BSVZGb3BNSmFjWmJGWXlsbTFIYnNoaWtvZnBuRXVwVXdH?=
 =?utf-8?B?Nzl4OGlmeWozcXNQVWcwb29iQklLdUIyb1lkNllkMUxWaWtDYUF6cEhqQi80?=
 =?utf-8?B?Vi9TZll3U1NvanNlY2MyRnRHRGsvQVVCWmxlZTB5RmVURnhVUGkxZUJTaFhV?=
 =?utf-8?B?V2g2N0pvMkVNTExGZTRJZTZiS0haYzZFc01BOTJUV2wzYTIySmZ4VitWQVl2?=
 =?utf-8?B?dzQ3eUlDSTFIOWhBaVdUQStnZk0xdVhPb3hjZUQ4VkU4R2hpMjIwS3Y1VDNk?=
 =?utf-8?B?OUxWZFVxcjJ0MS84OWtnY0cyNHB3dTRFWlJBUnZMSWFsYXkvQVgyMlVZSmxN?=
 =?utf-8?B?N0pUcXVvMUlqdGx6a1FrdVNvQmJZRW9ESy9WMzk0K1kyKy9vS2k4TFpuYlRE?=
 =?utf-8?B?OHdYaU56R1ZTZHV6Nm9wdUxWRHBsd0Y3R1FEdUlxMzZRallIL1QreFE5eVJr?=
 =?utf-8?B?azBHV0xUVDRlR1czOHVUWDd1UnpTS1YvSE9MOVdMb1FVNFNYM2Zlb28zNmF2?=
 =?utf-8?B?U0tkelFXSEEzWjl4N25iRVNxU0pOdlFLdkczNVZGNVF1dU5qLy91U3pWZkov?=
 =?utf-8?B?WnUxUFB4N2RFUEtjTGlSdGVoSFQ2SmxNb1BNRnNQTExVb2RYYjFib08wVDdK?=
 =?utf-8?B?bEgwL0gxSnlxNkRrMFAxV0ludmN1NEs2aGh0ZGswSFhhMS9FbDBOY2NsK3p6?=
 =?utf-8?B?bkE3WWdqTUQ0SjVLTmg5N1VobllGVzZDYVJGYlFSNVZKNXVocEtJQ0tjcWdx?=
 =?utf-8?B?STBJSFN2QlFLM0tSWXRQSlA2bU9pd1VaRFlPcHZSektmMXpETno5ckRnYXRo?=
 =?utf-8?B?dllNQlgvbzF1d09pMUd3RFhCclBOakN0NXZRaGxWQnNwUzFLUFhraE5xS0Iv?=
 =?utf-8?B?dGppNG1pVU1ROFY1SVg1NWFTT1lRMWhvTEhhMUJ4bEVtUmVRbVJ3T1p2MzBj?=
 =?utf-8?B?S2xVV1FZaTlzRmdhSmxLMC9oSmpFSzhteEZ0VEcxMGdtZThUejkvYmJxUFdZ?=
 =?utf-8?B?SG9MdWpEc3U3dVpPbDR0ZGtCTjhwQjRPQnZnYTMydDAwaERpa3ZWM3hDZmtH?=
 =?utf-8?B?cGxDV085bHdXRUpqcFNHUVI4dWlCV25WREpQNEJoTGZkVlpoVjlSaHhvS2F3?=
 =?utf-8?B?WHMwc3pjRUZqTktkZFpETzdqcVdRV1JSZ2tPS0pzZm5iOFdsY09aNjZoTTE3?=
 =?utf-8?B?bElLbW9uN2l4VnJXMHBreWdkY1RFa2pINy90ak90ZzE2VURTM0dxMys5SXZZ?=
 =?utf-8?B?SVZDZGcxMGxuNWpVWjZEcVZkZ01JTFhzTFErc0VVUnZNMkRXeXA5cGhzSVZu?=
 =?utf-8?B?aUkyTGdmOC8yTVFMTFA0VDdWbXVaRXJPTXJIVFRtVkJhcXd6aW90YVcwWXZl?=
 =?utf-8?B?RTBOS0pFNUMyVVlRU0xBWlBCZ3k2eXJDS0lIc3JRdFpHTDZiczdWdzZEVDVp?=
 =?utf-8?B?RDBrNGVSdS8wZDV2NXR2a25tT1dEeWkrdGhaeXh6OWVrWG00a0JhTFpuN3gr?=
 =?utf-8?B?cnE1bWNsUzFMaHFsS0lJSm0zK2tQOFBjcXlLdDU5NGZYS1p1d05oaGpDcytN?=
 =?utf-8?B?cVpKWURXcjlEcDJyQlVTNENsTFVXeHNodVM4Q21vRHhnd2dxdnNpMTJTRzJz?=
 =?utf-8?B?OXhhY2dnTlk1Vjc2VXAzTG9vTmVjc3hWT09hRkMwaG5Zd0lLVU5veG1IU2Mw?=
 =?utf-8?B?eFpLczBnRy9CMzJkN0wzM1lsMUk2azFSYng4T29KNEJQWE1rZ2s5L1ZXQzJP?=
 =?utf-8?Q?H09c=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:00:40.9295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14efa2c6-3be1-4f83-571d-08de16007876
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_020049_351945_CCED4804 
X-CRM114-Status: UNSURE (   9.12  )
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
index 7e60c96b3562f4baf19bcdda8940c2b0c52dd743..d08f73da75962e1e2bd1e4a25913a13c3f366323 100644
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
 		brightness-levels = <0 4 8 16 32 64 128 255>;
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


