Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3905CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQXq7y4VDRCnCs7aTyPe3mddFLkda83JZJ2Nuluqp8U=; b=28wA5h67UUUYpkqhtibsU1pzho
	xomn74VPuXeZWZWoo+b2qnDue57zVyGOLlO24zJKHHCTwC4fVsqwdHFkFpsshs/Z9XoIKOXIhm540
	XRfCY54GPyQmID9DlTi+J6txQ9KRQFabH0+IfZerkULNoYdJj9dM5bA7Hsor7se2CP0+FVIXvucVB
	2hWyEIS2FGessk8a67y9X49kSFI7ClYWZ51l8v07CANg1KebEdxV2ZlNHDJTqZNjqiRsNGyEWpaCb
	ByS0wZNJL+ffMseXvLrc5RPR+EUF19eEwXyDe3dPJmnBeBXchSPwmmkR0e7sqRTdCMo0tkHvXsqeR
	1/UZrcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDoH-00000006zs5-115n;
	Wed, 10 Jun 2026 07:57:13 +0000
Received: from mail-koreacentralazon11023121.outbound.protection.outlook.com ([40.107.44.121] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDoE-00000006zoW-1BB0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDqa4/wAhTk8L+ro79jHuJ6/AdOFUpxmXUuOzLX+U6zXS2L0+gLxKU9VXtAuCLUFqweHl/G04rsMRI85PeBpZaG3UyG/Ykog9tMa1WMFPnfX2u/sjDJppEUCKkmgChyV/zF2EzzMl60MK6/w5aLheH2BRuWotfmcNvpi36P+E7BaudldFHL6NT7rO98eCLfRwhUJRkTuQ+u7SkdHAXsMVY3liXiSD4mcwn0iytkUj/vPQkWRv63LUvAU7VevO58+bMhhjXS6pQhB0wFS4b6wbdC/zD1bh9myGX76nAaQwNwmztGthnELMeuvENrUcXEOj9NjK0TuBNNP9Qy1zuUifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQXq7y4VDRCnCs7aTyPe3mddFLkda83JZJ2Nuluqp8U=;
 b=CeBcv5gx3l/ysV6lNAs5WkxCSUWKKPgSjnTZEA0430i8XqW6E8uEqoWyFvSBAjzyjEewn4g7Mf1//irDJXVknktpd8tRfQmqq9OZaF49LLIWfVmNy88XQB7McZUNO1JOqI9yxLaEEGKIuacSBpCAUNFlNtwNyOQqAEKq6o1QPd3r6i81YiDPwCJ51h9zjZl4oW/t2UP5vecfgkmNZZnqu3YE2mJ9mwY6i/vyzR0r6CeN9y+E0fpEJrrkZMsLVg0noS51GoL9ykdiIRJUtC2ejXyh9D/9x8Cbc8duXwUJ47bnKJko50KosDkUIcHZXF7AwSP6RZ0PakIoHPWNW/uDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12) by
 SE3PR06MB8666.apcprd06.prod.outlook.com (2603:1096:101:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 07:56:51 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:c7:cafe::b) by SG2P153CA0025.outlook.office365.com
 (2603:1096:4:c7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.3 via Frontend Transport; Wed, 10
 Jun 2026 07:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 07:56:48 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E58D34084279;
	Wed, 10 Jun 2026 15:56:47 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v3 5/5] arm64: dts: cix: sky1: add audss system control
Date: Wed, 10 Jun 2026 15:56:45 +0800
Message-ID: <20260610075645.3581145-6-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
References: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SE3PR06MB8666:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 91c4dacf-e811-4bcf-bb20-08dec6c5d427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|7416014|376014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: vkNjsul07cBF1weehXO0+vWQbgwA/omBHkB4760pztZuPVw0Oy5vrs7O2TzaW4MDd3P5F2xh+LRLAYXF/A3b93GhG514lNB0IGGJ+kDGUIVSVVtstk1fjaq9UYnnZrn+yXrAYHlBNZrx/k9D+pxMwKiQbrQq5hBujaaqPOF5tz1D9uFEiDCrEhHMEj3M4MhKbNp0OhikplwLdiF17Meprx8PKC9M3deF0AQasGFwGxLDyhRqTPvpe23JWR8z7rxaaj6MYxauG8LzvcUTUaYETLaCqJTzKaXiugJ1BYJSA5ai8KkD0G3Vjus1KZeUftobTsbQVUI8aV8DqLEm93ntX8YNzlSIuQhwc/l6LBw0dqfa9q7X4fA3eCIs/7znH++Q5YID9L0l1V1EOUAAT1pYzSdnztE+tMPCE2LBpaKEtlrkJHWIbN+gF3dEBUkQ2pLnjDITJtRfj8J+216pwdwmMDcVRjkpMArn9yJW5z2lUA0Mjs4WIuDJVtqvcufai8klMh9+MD2UM9K4H9AHXuGXTljqMN5owUoJatsY+X2BTx6npRQD2SBWzV0pDK73RIl/GGalwAcr3aPtNAfT5qJoMzLye77kQ3I9446OE7t7BaGUT22r8EKtjTIPWVvLIO4bfY178hfcBvCA/SnATS0iLSWwX3WwD2BTDaf3HKbVCZv2VipsrdXttmylCgbyy/A/i1pKV1N6IvP/Hd8wdy5qHytHwxDitWbl3oKIqq8OUAs=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bQk0RbH19bSzPj42aRbWh00zZ6YTcnX6Ff3dpLDkcSAP4BJevfMQGmkm0yboHFjXK4P78oz0NonCk5jn+evrZfvhrhy/8Q/o9SMda5r0SX6CxwBx4108AQOBcQEGUZRQn7k29H8Ib4jv2TSwil19WwvPPkGVxcFMxzgigAk79HsvwtHyQaNnlmlpjWnrqnujisYeXoyqWjEShBzg6scBNRtRgnFAtRxfdAUzE+Ju+xt2RgVGVM6S+pF6334nvV1r0lVYwld9QtMsds+qVyGLOgGwK1isU50wtE9uv6vw6E87XxNmYv60H54wzuk07hhPfWN5o2YFtVob+DqHqGu7tuDR8ee8m8AVORl/U4eiN8ZEUkPVGMvAwoRiQfhPxuISj223SL22vHyEn+L2eBIbTo5rbGo6SA8xye0Pn6ny+Ew+gyofb/DBJcfCKa2tBrzF
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:56:48.9439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c4dacf-e811-4bcf-bb20-08dec6c5d427
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_005710_314001_C43B3DC5 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add audss system control device node, which would provides
clocks and resets for devices in audss domain.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..368a1d85c93d 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,10 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/clock/cix,sky1-audss.h>
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-system-control.h>
 #include "sky1-power.h"
 
 / {
@@ -488,6 +492,26 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss_cru: system-controller@7110000 {
+			compatible = "cix,sky1-audss-system-control", "simple-mfd", "syscon";
+			reg = <0x0 0x07110000 0x0 0x10000>;
+			#reset-cells = <1>;
+			status = "okay";
+
+			audss_clk: clock-controller {
+				compatible = "cix,sky1-audss-clock";
+				power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+				resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
+				clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+				clock-names = "x8k", "x11k", "sys", "48m";
+				#clock-cells = <1>;
+				status = "okay";
+			};
+		};
+
 		mbox_sfh2ap: mailbox@8090000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x08090000 0x0 0x10000>;
-- 
2.50.1


