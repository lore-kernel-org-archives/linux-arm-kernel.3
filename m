Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633F4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVP/cX8K+IizM7MHHIWGgxoxHAqmXb0N3FutYFrisSU=; b=LIyrfIPwjGU8GjNqO2a1jnKrj8
	mPB4s5WDLPrf5n/DEFNGra6ICJm4bZBiiGK94R7A4oFUNJ7STGzCgsAHFVRRtaDonxk4URLZ7+piK
	RWa4RBSzJYSCk5xGv+BJrGMJ7HhBvz7ugGKi8j/i/4R1nnJF7QgRqa65mmQE2DFcDheOSE6PbujtG
	3ad2Mcf8rIpnqJ5YripcxZHdzzbVvNcTVcOK/cBWC0z5sp0Sn/alQvMzeHVnSOB1htrF0zyuGeJEz
	zNwphMk1uK/QhjIvGufONMBKJC6r8braS+jUB/n2XTDExVUTQ3skq7tZNvcSU+QxahwRcx4pHKxSK
	mlcix/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXpJ-0000000H1mB-37bY;
	Tue, 30 Jun 2026 12:44:33 +0000
Received: from mail-japanwestazon11022088.outbound.protection.outlook.com ([40.107.75.88] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXpD-0000000H1iI-3VNY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:44:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SD/NjTsiBdYsSH8IssYkPaQTnxslrCHCgOr7iy90T+9tZM+GcoFjl9L1GPdzVFgcYbK4Oi/0cgmRlDe8ws8rgKtZ3Lbd6F8Cq2PzIifB9MqTcIUw45CSW2Q9XYsMc+ZKC+tUL8RXDS69uGiPE6tE+UoqHrRoMzgx0m/CdXm1U/I7NiU4z4sks/m4dUbJ+qZXaA+FJEgPByz5lrlmgMqy4UCguiqX29LAOpb43j+lXjx0qGQcy6RXm7zD1+v9YkqiyLpn+57paUsAOBM59I6+MQkI0ZxsjnPXjngCfBd7oC/pGZxs1SGZWVZqt0qOUBukD5xpsHHyekIxDMjKcdsjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVP/cX8K+IizM7MHHIWGgxoxHAqmXb0N3FutYFrisSU=;
 b=OElyI84SvXVtL7FCjfXThXffIzkh1q81d5QPfDm7SNSuw/Mi4NfV1UPPIpUrE50OPMH4BY+tidNDYW3TXUI7RstTnpwbCSgBExGcBaIipa1+uiAIe9PUhuB8jd0qkk2utAqeveHkhuLZ32rWDny+NoUD88oGNkyNoLwJp70/kjC/0CBXryfDG+4PS51Q2BAesxSlR+LT7E39nf/Raxr2uwJyJjZaPQzLeoJf6+B2OgrwjmYFBP4SJsUVpAlokzGMkI+igQvMUnH+I4NAxt86pg/B37xN9Fcei7Lh3fEeDi5UeVfntKvy4lxVJ/SMeoeVWPMQ/sA1qgA6wOvlGJBuUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:381::14)
 by SG2PR06MB5058.apcprd06.prod.outlook.com (2603:1096:4:1c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:44:21 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:400:381:cafe::84) by TYCP301CA0024.outlook.office365.com
 (2603:1096:400:381::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 12:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 12:44:20 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1FC9F40920E0;
	Tue, 30 Jun 2026 20:44:17 +0800 (CST)
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
Subject: [PATCH v8 4/4] arm64: dts: cix: sky1: add audss cru
Date: Tue, 30 Jun 2026 20:44:13 +0800
Message-ID: <20260630124413.1814379-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
References: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SG2PR06MB5058:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dfb484d4-1512-4469-67d9-08ded6a54ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|36860700016|82310400026|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: f4y6AQ++GB4jFNbNiT3RB5/SIOO4RP9RZ7kcYLoi6g137tvvX8/4nHQHc3OsO2aZobMgvk61FQ2Xd4hvROM1Zd+u6DhsIa6NhzujKiSinw8l0BKH9GwkCJ/RODsk1O84yr2DeYSTzS0bHHHU8FapvL8JLjTVeDnVTDnOvnvQjoOXxo1szAoL/LYW4Egx005zARgbUhRLC+DFK243GxqX5H3FH6HrjNOs1lhu1Rb9cZ8lY9ZzA1EN2+KOLmvG1XOBKAwXDpq+GdAmTIAzWROQlfeWMBE9vadGvQSRhxBJolV9CKaCJ3VHabN2qJNR98MGrK4z3AyGhrzUbtdb2KuH+FedTBukywB4VQwmJjU/bUzZBBcaBBoytWasSdpcclEPU0TmCFV5P+Hm2gGyKHcs5mEfyNIxyDav1oOqtOfK5vB1yXlKNE+9ETPWhbC1SPrPoJsMk3p7Z5sWKdOQNI2nKg+kqXpscy/cvxRhlW+BpBllDN0jSbBF0wxupR7WZw9glfUfMB58lGazPe2/xaAFZA4WywIwOdb0+aHK4xsnokhXcHafctOrlYE2jeLtJ2O+IO1Y6ZYRkPp8IYuSlVFM4O0F4BA8jNNggVzF3givK5m8JXvN33z7N+U+HjcgpBxjRcNA+/It1PuHQh4qJuwSgtIUzp4okIqICidA0CDNcL0v7nyZ0uX/6LmYCYYXX3SXnCpX+giq3gCnNS9V1F2f+w==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o+rTxVS9afxrC3Rni0ndQGhr+C5R/sFTrwOMwNp3Hvj8j9RK4gCJ0Dt2TFhFajB5s1gt/TTj5W2nDbwQCDxUMhvyFGHID3p9FPM8Ph6twBj5G4F3QyTFgb0ljItRWJjs4GicF/49LlfbO3tbmoKygk19vd/whPjPZ6Gx0JOj5I1vFzcCvjKoniEuC5bOCX/UU920JyMXFr1B+tR7ZcmXnRmNEt3OH+57zvQHmKeL7c8igZdRxS4svWVJpE7kVXkyePhXHmYaI7ssRxRJFaOTcJyQK69o+YM7mFwao5Am4QQc6F/WPUCSMmQ7jMrcghg3UvHmHX+MXYfRMdaWtadULOJN1DyrJlLkLMqLWCno4lNoV6xED7JPh9B11VRKvmDncKFMcD4nrj0Q5gmIB40tEj2xX426Orddn1ysZ+B/EoUBx9hs0yZkfW1LtcNu/Iqu
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:44:20.9938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb484d4-1512-4469-67d9-08ded6a54ec4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_054427_912924_A7C1EB69 
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
index bb5cfb1f2113..6d045d7216e6 100644
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
@@ -488,6 +492,20 @@ mbox_pm2ap: mailbox@65a0080 {
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


