Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D642ACD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 03:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCyRdkBWrsbJqTw8caXxLVvj/1frW/LtTBrCwjHb5sI=; b=OW9qPKRWOpZ2XZo3ofJ8SQ2nkM
	XZo5WmAjUaHRkLRIwD1NXr2QzqFIrDdmqDFQVEBn59ddGVa5gS/xrMZ3qpr2LLez2jvJZySNwhY+c
	GZD2zrjkBeahyec1825UWtmX1QLjlOrWxXEudDJYu4QAYwFNe/JxdcfVh4MCW3femuhWyvOQO3wSF
	IsyOmi8Q2uDj25mFeyKQO8PMTh/EOAKm0OPQ3i8JAuTy4ksveqI4TofCAIC2nPOyDqKoLcFMWHB/K
	QqoDU4NxRcBDrz0RYXe2Jc5SLbctL2eef+jl8fFOTdT4gT8j9rHMUPHBPQI1XN9Bebq6ixo8mo+xa
	MHrjsttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVLA0-000000001Gt-0dVA;
	Fri, 05 Jun 2026 03:23:52 +0000
Received: from mail-japaneastazon11023117.outbound.protection.outlook.com ([52.101.127.117] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVL9w-000000001FD-2w0O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 03:23:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klv0bk+wSm73VfvipdaK9uwpVCkTu8cgMRLAv5P2MUa2tFU9MKZ6ziV678LRakdLQZJi7Lb9KtM2aoKkv8mjfQA/BnCcC2Dxt2UjFlfIZn4GVE3oGWXvOcXmB0gtVg9o/FE82V26ZH+qfzWVRQ7eWZwV8uPSLux9vuuaoOdwFQ8jzirUryq/ZdsqPNJSsVlc3osjXeQklsmmzE/mEL/38sO87LQuVRacWS5ggnsHUAFwE22kXzhP4DjLPCKlX/d6XvDZmuhomDkzVRqBfIeET1z+W6VXIEWYJFIqunqrFGmmfHlW2k5U/VSHOMNWHSdP10pNSh7axURY5ZoP2tvV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCyRdkBWrsbJqTw8caXxLVvj/1frW/LtTBrCwjHb5sI=;
 b=q4TNl/FiEIUnvajxNusCoUO02zJYs7EkZNm9l98Q4sOt6CC9DImHzQeap/gb3FWu4ce9PYBVrvsMaxyBka+xs2cZVuNbooDyU/b4QoPxYzS2RFasN8/5zLsCDenCxqDGZifcP7Xmalm+L/yVYCCZayav1NwMBMU4LrmezlSGqkEPhTvXXCnPuUkZt631tFwaQxiVP6Txtkb6Z69SvArBkaw4b+LMiuLX7j145lucEni2P3i7ehrmlzv6TeceX4eZ1x3RFh+5LiqEvKs6zSdytqlNiRP7/mQgJ11qwutImP2CFdUahKFwvcPc7lMa5Jt6sgl+Z4PC+U0r7ewczuYJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::29) by OSNPR06MB8810.apcprd06.prod.outlook.com
 (2603:1096:604:4a0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 03:23:45 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::55) by PS2PR01CA0041.outlook.office365.com
 (2603:1096:300:58::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 03:23:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 03:23:44 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 66A464084272;
	Fri,  5 Jun 2026 11:23:43 +0800 (CST)
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
Subject: [PATCH v2 5/5] arm64: dts: cix: sky1: add audss system control
Date: Fri,  5 Jun 2026 11:22:25 +0800
Message-ID: <20260605032225.523669-6-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260605032225.523669-1-joakim.zhang@cixtech.com>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|OSNPR06MB8810:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 75048fd2-29fe-4930-10fe-08dec2b1d9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZdSxkGFrFOXT8UFESwNzcZ4/TAzsRUGSKYiQyGEyAKJKtx6Itg2ZoIbxulH9JA9Y55iKvGqrwU9j+uc39b7u6ZApIkB8EDJWnwRJbeZ3EP6dO3TYu6dePiYiyDWUSdAURADpqzXV3njEEOEhqbKueu5jCpFhORneubvIEBAYuZctyHbsulsV/E8XLnw7Po3/h1ev7kdmMDw5ZFd9eScdaVYALiNodcj2C/KQsVMgzKfqM+aasir17CVdPHsN1VCn6HFwkoPt1OdE94W1Uf0Sk6m7LoJtCQQ97A55BJWbMCibTT7nFn2tXqN/FV9NwszBZ1tMZjTc3oioRT5fRNaJWmOtx66BBq6vnmUUduRW/b1wLizC8lNPia7irD2oH/4cedCflIhZa4v+drhtrRnffsrr/AF5Hwn5sAiIpWPWZe3QtYW49ZyQL6vnERsqcSZVTWA2HfXJinBh+M5lNj61gjH79kZ4kg+gtXgDWhhwlwHIXJBww9vmr1YOMr1fph/ay1KrtMvg30nH9GgA3IOgYwGfWk5QEuVOdbD95witOnS7TUIgmqP7rLPphrbfrhJHbZHwpbcfcK+LKi5woEGCtIYHhNdLON6/D1dJNlZmGsTy7/uvNQsRcjiVhidhHKF9NWRxt2ArEnWfJMN8WWQDPT/4qeOPMh2xJoaCkLMuHGo2NNE0KQ22Ka8optUub2YkNnMN9wAUoXp6vwCdaAG1yM5BN+B6JwK5EGgj5YYgc5w=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hyEJJMoP10Wp0cVbuSXYmDEMrSuhAW02jLV2RZPErZszR2W1Yx/2zzEzh0cgQ3Ewq8TNK0X5q0dRPknHMbY328DHk77ORa/YgLnHeTU21BmSxpysk49hZZ0wvExqcPoHMGvekM0uaQonR3YLDXwIBTJ6bB4RuYgLL8pyfDKlh6BMLYGrzcCLuUxL+XUlaKVMwvf0QagUcMwd3v/1G3MM9bWAJq+NljEXpJjNQ1d6Dczk8KgAP0T8FA3PKOf1atS4H0UHCg2FCQKAg+GaJlRR7JDK6WKKFsjORUYyBxdR9fXSyeJFzfqpPlH3zyEZflBjuQo6BbIDyM7y4avjAbI6pZ+Kbb4qgV0YSuwQ5J3CbWIFRIhHZNJY3eA+R2LZmmlNyuEXvTgtvseP3fOEx9kf44aeN5DB4ncbe90q2ArrKs0wGpoovGB2/fX/Z3ET5cBY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 03:23:44.8660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75048fd2-29fe-4930-10fe-08dec2b1d9ba
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_202348_736370_B936B2D2 
X-CRM114-Status: UNSURE (   8.45  )
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
 arch/arm64/boot/dts/cix/sky1.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..0edc35523c71 100644
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
@@ -488,6 +492,30 @@ mbox_pm2ap: mailbox@65a0080 {
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
+					 <&scmi_clk CLK_TREE_AUDIO_CLK1>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK3>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+				clock-names = "audio_clk0", "audio_clk1",
+					      "audio_clk2", "audio_clk3",
+					      "audio_clk4", "audio_clk5";
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


