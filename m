Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1E3F513F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 03:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iyU2CsXvc043GMO86VtBnM1Bg1xqAUge4puoz8tRdU=; b=ufj7icdQFRp52osVoHjO5mmaXI
	rKEC8p3sgpvdBFon4qUNW+Jr2dsMHtPcS0Rhwea38Hweo5oBn+LLITTbeNWqdTRcwjdaiBaAL0teL
	N96HQ0J0Xgz0qaT3G/EFJdrY6jOL7cLauXyXIWW/43vdkAyRV3QBpExiqNpTwrOZ+wZxt2a1CZZp+
	+GGc6XVru6l2pA/uEA8298inkA9dFA6AyqvzV4eRCJ7aUOFrf8t4mrC+iGCoHdLFldXrOtYFOIKq/
	V8bQxPBjn1NnosrpJVFj/mOP1kDUxKvV4msMwRb3XFf6O9b8n/Isb0kW837VNdggh3qcf74Kii4o8
	T0Ixm6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLvZ-00000002xkg-3QGC;
	Fri, 06 Mar 2026 03:32:37 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLvX-00000002xjw-0sNs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 03:32:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8jr9wflRVGpsk+pk6MU+B18i+2z1ktGs0mx6nSwHfJcJOrQK+ATu8blYiOyVO1bjsQACZCDSTZn+VGmyK08FQCypy/WoGVwINpTs2ScuRwTM49jKtmcl3QB5FAH/rvezqwRP5vhzZAycFZtJoYjiCA6fka1tuUwCPl6ygNQnVqcQBqpz/z5vgynNmRXJuf6OOlXeAJ1TlKQ2k/irIkvx/L+o+gTIYjWhcga0ZjkmR1V8GM9dNIAoOCBLxR+k3/N69U3aAohJDCT97kd1XfyKA66BNWawEcA5xgmLy6oxBtGoZSd7HGNSG/C87QRq3sgG+k7/rRHb4H7Mh86pSPWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iyU2CsXvc043GMO86VtBnM1Bg1xqAUge4puoz8tRdU=;
 b=MrKPg00IuvJh9+/BCUIU+E5LV6lGb3lSCrXk5PZq+knbUi3p6Cdynk2uGpzCL7SZqNTi1xytYCh6V5f3okqmHhZe4xBA2NnpAtY4HdDYTsAthSi+3YBhvLd7OEBrlSUoJ9McHZny5H8r0NIb9n+wZ+Ca9cqeJ0lfYsuyk2tEr3DLA/xxap4OirmiXnThVg7G9TrAn+Ki8Me+WYPe9D1eE5DOf2wjhyBW3LXZpM7qzZayp7vn5HFl7sVFUNSQ6KMbcOywdQ8BKHVP3SKRAT//xgGYfP+xA4YOiSNMNxa/2zCA2hXdUhLxk0BngobDOje1iB4mVsYkfsyGegxDlkNV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iyU2CsXvc043GMO86VtBnM1Bg1xqAUge4puoz8tRdU=;
 b=RjXx7u5L7hkjdpkd//EmcWR/Yq6PI1YHyYvARb5hyzdAcf7mXEmHzCx1aIzVnp6jvQg9mYM5f/1cbDnhxlMeq1580NLVVnNf1b/G28t95XtalKSAhO9Dg26u1mCTe8rVhmZXPnx66ZWbGL83DLvYbvx1x3YNoB52KGDkc1vLrzlv8EgchZZJyWSUkKBinazvh2JjWx2auHezbZNgPaTyhRLC7jc73JSKYKXVeZERhICo1VVH5ZB5TsXofU/IofLA1rKWuSsvLFo7wkKIYxDs2Nm995TQ6s0Dmo0Mi5bk4nB8Abql9lq4veHcS3WdGIx9MfHtApBnNk0ElIcz8u1MCg==
Received: from AS4P195CA0035.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::19)
 by AM4P195MB3014.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:6e6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 03:32:31 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::9f) by AS4P195CA0035.outlook.office365.com
 (2603:10a6:20b:65a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 03:32:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 03:32:30 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 6 Mar
 2026 04:32:27 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v2 1/5] arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
Date: Thu, 5 Mar 2026 19:31:44 -0800
Message-ID: <20260306033151.276202-2-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306033151.276202-1-d.haller@phytec.de>
References: <20260306033151.276202-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|AM4P195MB3014:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3377d6-c4b9-4630-fff2-08de7b30ff35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: cVwYaw5wsR3OeLId0PTeb7bsJPT1p3DTw5d3nTulu/EoBDqr5hxJDEliw99JRnW4IEfq28fBDyJ7uGr4GErz8RBgOUHQHoaJhWwwBas5yowB7QrPpVk00xjebF22jx4BH++jpIpQkKdYpQukkep3E8FX83iNy0wh0RvGye+E1UYqlBe+3hnntxZwBD53X+KDXGVSM2DlpB/mxgnJ6hz0PtePtjdPBWVrOqp6utSlEfHTwk90JSSGRIsKlskd/jMR3KQ2cjM9e5BccDJ+RdohPSMR071k2WvyVmELqqKAWdlXhQS87NPYNsNspmVGacBtoJJH6mLxvBaP4LjSWT3FiRnQwEOPqmKJcusIaX8rRkkPyBD/NoHLM3g+80tlKNe445a/vS3vZCOg94iw2plaxeiph1JKbZ275sdW4ByfZW1DX9eiG18FuYv3pbLO1UcngjXHcoQ9BI4Ae2wajaFIOKbmLB0soOlIUnRlkEqfreUXsLeMp9QnEnE/CCclBxFEKNSEMPmMEaP65wuRD4l0lpXhQnrVlqTW+jwlrP6E4dlYSgQR3dWtVVMqXLNG8rXuxZtpouFL9lp13dywa0gPbaeGxW+xFTWUpYtO9J8f/nd6LqoHN0ZgalbapQHNGtG+yJEsvnR++BNg1B6rMjt5IPDm49B9rnmsw1b1sq7Rh+MUw24YLB75Cpi0pbSnQSuQItEFDjx8CzIjuQX/uAQcOGuAHak3wEnWpt0u4/EucXQFHmmQd1p6IyXWgEJf34jvTN7MtzqvgJ3hk5QAOQEQuw==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cr36dx/jSb7KxUexyeAiVG6cF4Oltn0ugYdPHxhd9PQbAmzjlNPmaH7+igVCICZ+p7N9wZFIQDFV8fQ71SFJe640Jdx/1aX4nl9Ir7B46r51P1gnoXzfZyhauNmd2XLbe1EGXMS+BGC7QRBQfUc+sgUvhdO6oEk3C+5jpLZnrIHWrD81xTHExpqDry21XGnwLpUPaKDSjjiYY3hSzdf9ws7q0fPMcIRysW8utqR3JGIZ9vmCOPJeB5+Zu0kLkb8wdrVr06OtNZ+hN+oSNpj2OnsCX+C+64LolJDUdUlFPMa6ximiMYSrSqWmw3HCnzoivvHde6HcGD2DgrylddxndJCSSJUeOMVj24fukFyUTrRYPYC0f0Way7xGNE6qqJ22UexDhzEJivj87VX9A9oPCp64VjC0sVOj4ncD6MYL/c9+8tJgO0tKvAFEHZs8O6qf
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:32:30.3061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3377d6-c4b9-4630-fff2-08de7b30ff35
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P195MB3014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_193235_256203_92C9FF4B 
X-CRM114-Status: UNSURE (   8.20  )
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

Assign the dss clocks in the base dts so that display overlays can be
used in any combination.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 .../boot/dts/ti/k3-am68-phyboard-izar.dts      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
index e221ccb30e95..b8d17bdb7685 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
@@ -298,6 +298,24 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&dss {
+	/*
+	 * VP0 - Displayport
+	 * VP1 - DPI0
+	 * VP2 - DSI0
+	 * VP3 - DPI1/DSI1
+	 */
+
+	assigned-clocks = <&k3_clks 158 2>,
+			  <&k3_clks 158 5>,
+			  <&k3_clks 158 14>,
+			  <&k3_clks 158 18>;
+	assigned-clock-parents = <&k3_clks 158 3>,
+				 <&k3_clks 158 7>,
+				 <&k3_clks 158 16>,
+				 <&k3_clks 158 22>;
+};
+
 &i2c_som_rtc {
 	trickle-resistor-ohms = <3000>;
 };
-- 
2.43.0


