Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F36C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1Mz4rOABbuY4F1mkmNiJrsvm1/Qoz10s+UYuQectBE=; b=Kz8D9je0J7Y45mvSGpnv3SqLxb
	vXlimGPfC68HaNpVK5k4lYgFmdZ6qPV8yj3TFTGHlNLVw4kOKbDCLVRslkWjiXJOtZ0//f1ZC6r4j
	9a1SwTGLE3AdFvNDI/fxdo+W94G7KKwmYqG6NVFZnCxQT/eqyW01jQi7OcaG581ZZ+0cUP57KJLwl
	GfWc/gwZBF7C9viiQkc3lY1fv3zJK/dhYrY/CSXk6my3sXPkzdUl0kekt/h1XpMaWxF4tmnjsxyxe
	SRZi/SfUV2idLCdNGdIesLy2gQbAbxQD/PBSEqIXHYRHO62halz6/yOTMFzSKF6oKPQZigVpDZv6K
	VOz8lMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnRw-00000002ILY-2uJE;
	Thu, 09 Jul 2026 12:01:52 +0000
Received: from mail-japaneastazon11022096.outbound.protection.outlook.com ([52.101.126.96] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnRt-00000002IIY-1ref
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcwbVHEOipzRv0FiZcpuLhXtUFu7VMlOHX2w0Lp24laLSF0PF0FvkgKRaVpKE+vRTLQ6fYPz/Rf3I/oIuCPgyPpFyTB6pkptvp2wVcL0+5ro9MP8pWAayysypIpDPmKChJrE23rHapvvDevAg65/Dunwb09PLpFPF3mRghM3f47yQ4I5XKQI6FaIeiQZ6187ey0RVDVFxlAttayErsa42X+ccMvnwWfRaDxjirKlbpt/WVvRpROUqI1JXkeJtsgxfbos37mR2Pe3J1dJ/ayb6+IPdXyXk+DAJJEfPRFF1E1+BNs7Cz3wkXspKn5wKKy1ijPFwN/8YpQR0L5HjStZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1Mz4rOABbuY4F1mkmNiJrsvm1/Qoz10s+UYuQectBE=;
 b=rO8jZ37OIOAOyjUqcoC8RTJ2UVxmyr2ya3nyUH0TMgPUHJxZbUj4v5Fuz7dquig7EBQxScLWrq8Rw6PcUEgfF0ogo4QcXaUI5U1pUpYqRABEooVGRe8tyB8UjFKYX9DZ9sDILlNzqayhw+ivKEqln49/fMaU0+qm+SQXs+IvT2B34/z0vQJNI4xXSoNMD6H6PjrzzEGj6o6invv+XjtzDsY6r2ElWLGcvDmGvhXli0AnItPaOz8ygscziN3XTO3DLW1B2oNwonrvIMK8x/4eiuNJbZtYliHHst1Wn78ewDyJfkKPebmj036AAP7YbKonJdM1OyM4PPdxUUNWwUt5Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OSTPR01CA0020.jpnprd01.prod.outlook.com (2603:1096:604:221::6)
 by KL1PR06MB6260.apcprd06.prod.outlook.com (2603:1096:820:d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 12:01:32 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:604:221:cafe::13) by OSTPR01CA0020.outlook.office365.com
 (2603:1096:604:221::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 12:01:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 12:01:31 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2560C40920F1;
	Thu,  9 Jul 2026 20:01:30 +0800 (CST)
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
Subject: [PATCH v9 4/4] arm64: dts: cix: sky1: add audss cru
Date: Thu,  9 Jul 2026 20:01:25 +0800
Message-ID: <20260709120125.3997078-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
References: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|KL1PR06MB6260:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dbe48c38-6dc9-403a-1f96-08deddb1d0f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|23010399003|376014|82310400026|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: KIp2RcCyGo/AlCJtg//0MIGT/u4yrRMk4fpFdXC3xqb0u1yP5sJYqjEpYbDpNXR+6lAhmBigbVAqNjOSJLumOtJHINtekeoVLsrZ5s4/UR3Ut0BTrDjFhbPUE3UL8yZDIeLBmmVTmw9PT47dpmXbmROtVcF8jUZl7u/gGCOJxswiGx/MN93btuAfm6N4bzLkeYjgbmjtNsNzpU+NjqPgwHsSU5dYlhAAWU+bGb6gr3E1Ke/Gh0b4o1rQ8lVxz3NG750MzOnBykYnVUD5K8GlKjqSHkbCsnh6308jDMrsXH/QBwxjiqT+Ol7PoqdRFCIQe/pljOEao0r6/uhDIa4KEQoTERDFsRWwFwEO+98aSqSBU2jhLLIMtSXF2Kcw2gG/ODR5iDLaKeV7QyXWQL/JYZT6vDkSndAwgmtavx4aSE/ER13iDxk0Wq49UcA2gKLDjjAb2Kz/23QxGOMu1TT7kU8NDyyULf2bQMOrtoyH7/d+/O0uugxdB7VwnJpU7Iyx3zu6rSkJgMkl5bq8qvcHMPmG5zj1VHGlWNOUaXHdFXCW4Ijln+k3sgvfznDlYSmHzSrODAP7FZpb2q94Mqoh9iDha+bKk5ZJDzUoCtV8mPxnCkIYaXlf82SYllVdb52vonFfCjBYHbKJx5ROH2nLKdymNnH1fi6B+uZMzDxhuXJkwB45ywjwGcDbh441v3/vXODbiSUiIJcG0HP3Zm3kRg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(23010399003)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d3u5oeZIRNmlmIEWDzWD7kn8HEzUjLvbiPtE5y6IvC9/t9bcWQ/kU6c9+qXusONXTBBM/KUWxJLZy8K28MLT72JQ7oBy8/lwrxn+gmFfkcvXNLNl63ib5IxsHc4QIgBTM+hoR3ozddxYUSxnNExCoMls7gL5AJP2Hlsygu8G6fSVydcRnod8osuJSSJ11wQLwyZBNGcbL91koaXZIT8Vm7MjLpoUnFm0k6w9Su8YZV4pqTNyh9Gy+nZrF7W6+BPuATXVI6V7LykoM318byo8pb+T6zHdySixoZoRvGkLXH6shEAiufhW9Cz5o6s40fggpWMSftD54FfMSG0voc54+PrqKAs76hIpPknNiYTb6dvoUPRy4K5JjeKJfa8gBh8c/GVx0dzigOsBiGWkxhIuzefIW776GvJ24v464HSl8DFK7WuYLeZb9QcAZIvh6RI9
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 12:01:31.5202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe48c38-6dc9-403a-1f96-08deddb1d0f1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_050149_524036_7241C8DB 
X-CRM114-Status: UNSURE (   7.96  )
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


