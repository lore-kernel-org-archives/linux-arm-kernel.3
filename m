Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C18C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 05:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1Mz4rOABbuY4F1mkmNiJrsvm1/Qoz10s+UYuQectBE=; b=1sAG5sw1+wyZshHwO1OxjKypPz
	ak5AGBt4Yuf7Ngb+8mFnjeypc/WePg5kd2Vus8mT2ZIMtVqBJ2uQH/GGs7p5oT4S2e8iQYUkkmJie
	aG0aB6ZXmxFejlhJwfRnuooGGESnaPx4JLrqHScYZVEvwEbm6VbgxJkcD86ibzlLRSWXlgSC9PuI0
	s3Zzu4RlKeWzp44xHrOxzRU3aYST85SILnleUooLTgC8k8LCLvSYVLlms87DInza1WuWrVeRJKvVn
	BNLapQ3EDqT98sZl5DtzUh0xu0OEDgyuMOkh5Xq5R9GLcvrbKgTFFylk6KlOqCGFumJs1eBd+hT+y
	gjxT72RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgLa-00000005qZu-47yj;
	Mon, 20 Jul 2026 05:15:22 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgLY-00000005qYk-0bG1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:15:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dinU9NRO2EB+hdPOGJ9lRKuxQkd8U7wQqoAo+jy6i8rcsws9rgSZkfRqfvZor178w0BUL2S6dKPmu1u8JFUttqlr0jp91+7+carOFfptJbHRemnteb0uhHzAa4sS8VrvSNfPlxrQC2eK/Kud+SpjSPGhZw8XUMsXkQwGD6m2bLSdsvncWG1BpbKdx1BSmpA4INHA8i/bliGZfx/8vC1NhjER0sCusd++/fwwTbH+kqkPX4yDj4WzTRJNeZj6M3Q0xZjMmpfG9sS4bU6iKhoTtI3FwqvdHiNbjd7gcDEEKkaYl7aNWd5qHdRBNyEzeFknxAFfWD7hYYI0BWPuaO1UuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1Mz4rOABbuY4F1mkmNiJrsvm1/Qoz10s+UYuQectBE=;
 b=FR5rGO9isyXYhkCgsE+fSSnTQ+9Nt/hdhPGi2+Bl4VNX+dAPamye9mj+kGQHE0RK3szOoNw4iyz6jGvoiW9oNlTMorMSZeLSsJJAupca+QZBdONYlYpBSd9F0RozjInsVbesCyS2C/t9CnkpZkMcJPSk+NEH0MIxcCcMPaHy21NLp9oGW4Y0ZtyJpqf7+HTY3GnZQAblIuvLXg6Ps+kqku4bCDneu9Q9qHGglpLmtJVSLDHRQe3vyknBbJFrkbWFo23DdMZ5wZJ+YBExl5VNZqmiEZE+Lea5SbCn84BglXjROM0TS8v12QaxBoBzANX+N48NH5H6UjYA44gYP2rb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGAP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::27) by
 TYPPR06MB8278.apcprd06.prod.outlook.com (2603:1096:405:395::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 05:15:12 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::a3) by SGAP274CA0015.outlook.office365.com
 (2603:1096:4:b6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 05:15:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 05:15:11 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6080F40920E3;
	Mon, 20 Jul 2026 13:15:09 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v10 4/4] arm64: dts: cix: sky1: add audss cru
Date: Mon, 20 Jul 2026 13:15:05 +0800
Message-ID: <20260720051505.1252774-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TYPPR06MB8278:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ab18688c-8291-4b94-1166-08dee61ddf97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|23010399003|1800799024|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: xxp/PHuRD+yhTLGrXSQZsonGmSw8iGbzF/FTUGXNnJr4tcvoXYoVEpQwIu6E2mw1dfTXaSiuo67b64rDjqkRaXGJ1/sDZQ/BVNQrnSqjlaeoFk9TNZbJWR1Kf+tD7h3moJ3tOgSH8cM2pnCoGU3O+BDYFNNW22xoNRV20ci5MkuEmzw4b8t1h50je21bRE/1+7r3LfhKBM+a+U/tHMP5n57+JP4hgyTdfleqMIjIheaZtf3DJYsU6A8dX1I4BvXjymO8tYx7NEzR7Q8K69uDZMehtulip6xDDpy/Xep4mOpJOWdK5PNaBgiMfUG5f5QijzYqZIWABXR+zQ7FBk881dbQ75XfCkH8yrUQp7yNJ7Ywgrl6WbDNkB0Vz8dEOsNclBWhg+jHjatTUypoD97L0ti3/hGZ/3LUWZOiov75uMcbIW5XlEcgqiRCH05C2G0V7fdNjM3xPYxRfeP+Jy1gUdEWmpE2GMxiRMWMvc6hgpCQPfmCfsj91WX1+c08mXI7Cqc+2oRMc4G6pEX27cQfqx6LH/rTQmLMEk5B8CwFPBVhFAcHnczXx7XbJR2WTW+V1b1V0ndZJusrCX18vUk5eyAaLObakVbNpeH08XgPVYotBIqnSJXpndyii9HDEPIh0k1GuLvrog1BpqIU0Gk717ynTBiFUVsVD3ymVB3aTDZz1+aD/i3JDgWnYjeTsxVCK6UKJflg0ev2yncHNAH1lw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VQ2Fq5KPUE+TqZbeeooOyXaEkhNeN/t5LHt4TkjsOw45ORmcE74WlCV1R6GfT5MToP3OnSXPQvQ2dWE65a11Wq2v+tjgEw5LgKbx1QQj4hSWTckOUPjQZLjZtFnSUSt8J1mSW+SS6FxJ3KGFUje11YLGdFoua//5QP9Ci35pWLTMwfm5RZtdfAuz9gWRIPeCCOC2WXUdk2f5gIwnIVbG4SYuPQEK+QJYvSUqzdPjMKNyEmySuOcPmcqxVt7AqlYqnc7f/rQhlzhCsmEo0WGEmar+nN4Q3gKj5uq7q3qnMACLTm4UtQx3Le9SN2pu8Q1AFnA2gB+j26GTBQWTYxUaQ2K+J+pkwi2eHQ2xJw9KHwaPnLV6uS8r3pQXOwKpLiLneGRTt6G4zxdpGALyYlm/GfIAmJCgnN236DTcAqmvhZENUVFpQK3jtqJ9y2VWDYZ4
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 05:15:11.0195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab18688c-8291-4b94-1166-08dee61ddf97
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_221520_213646_46A5A616 
X-CRM114-Status: UNSURE (   7.50  )
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

Add the AUDSS CRU device node providing clocks and software resets
for audio subsystem peripherals.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index a77c52296ebd..9b2d969f6bfe 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,10 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/clock/cix,sky1-audss-cru.h>
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-cru.h>
 #include "sky1-power.h"
 
 / {
@@ -558,6 +562,20 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss_cru: clock-controller@7110000 {
+			compatible = "cix,sky1-audss-cru";
+			reg = <0x0 0x07110000 0x0 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+			clock-names = "x8k", "x11k", "sys", "48m";
+			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
+		};
+
 		mbox_sfh2ap: mailbox@8090000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x08090000 0x0 0x10000>;
-- 
2.50.1


