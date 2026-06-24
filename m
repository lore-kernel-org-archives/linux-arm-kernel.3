Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7A1CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx0JKLfMz3fTPMWgeqj9P7VKpe//wWtOOAahhKu18Ic=; b=pVXCkArIAPaaMRf+A0ADrWcHi0
	Fe+yykjC8FVhJlMkexHIPGJ94skA0fbxUjhFyO4CgWy8uEZyLX8f+oC/sT5ulMFTZsa9xsDjIrwOH
	yGqd7jQSioaVjo8G7oMBMdKt0hosLCG43e/LPLZWiLxVRuCZsMFDVqBGzNjsMfezUdFmcUQ+D2OlN
	BEy0/KnNFkibxkaNUNQP/czY/EKjECNG47zxj4LKKJHZh/gXDcZ/B0cpPkKjnavexb+Q2nsCKhSv8
	FPtw0Tdg4ZALpyLDOutqMjwlRWHa4YFsqKSDz2AVy//Vd0YaXEX7dZ2pBqN/hnz7aWDgb5SbECAgu
	GL7DQHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKjY-00000007amg-3kS7;
	Wed, 24 Jun 2026 10:21:28 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKjU-00000007aku-2pkE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 10:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9Ml6ZUx/DIlc087MV6gBZ/pOqq1YcsSvaIlFsgLKuhkQ21Ds6B+bUVxpNlSrq/b0Gtm9a0lhQGlHuCqsxNiqKN3+EUg/o6zK0qTs/INeCrFj9NG1Esjuf/hRJnxER6KY/zlHg3eYU0aGe+8sGAdomMZ/pcCo1xq6EN3aiPlHtpZEcfLqxYBVfw3pceRNgZ5GyAPwyEu+w7ckZ15JNMXhXzj5hsRmlR3c4QgiEMJruvxqvptpefWmiU6hhorjfRU9a+Thhy2Rdz3lhvyVtk1/BYaNAetiVV17JOE77BRLeivCEg2TNLLvIcEndoaYzas0ppZBen5y1a/1ayTnq3gCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dx0JKLfMz3fTPMWgeqj9P7VKpe//wWtOOAahhKu18Ic=;
 b=RcQI38ND7VuWLfml1gCC52DZeGKxYgMLjtQSqaSy0CrnQC3hLUtDcb2zzEnpglanGOus95JLadkaIIXuI6KrMg/Zx12bxEjD/UtzQbnlafsDoKToIluMKnRL93GltUqezDv700Klse2j3TXyQFC/sLxpZKCyFaycxPPbXxaNYtxfUHkkieQ9vfj78O/g02O5/wYYG3Y3fxlMt9L6O/emwuOLS/BVizhgXTl3ZRWk2CNZS1uvbiFIa8QVNjm/L3JSDDN35x7Px+O1wucD3o/olUHjR+UmeSkuhliHuSsii3N5A/xTvbZIT0ql/56MMXEsz4qvBqngir1xxXTUDhmbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dx0JKLfMz3fTPMWgeqj9P7VKpe//wWtOOAahhKu18Ic=;
 b=GrAUp/+D+SwKFXgraJvtpHHjZC4BBPW8mxD1yNq4PseiXKJVh1toLXKIdTRdYnOfo0l7mKGKVIHeoQfdyKH5W9iIEvotQ38iq8h/3vFaXxH83T+SDyZhS8KtTUU/rXnwUzL0boMoDm0gPiC+Fc5MLr25De3zG4gW6sl8ejdL7RrIZpE8qu0rK1f02vLedct2mhhpRNq2j9pAxGQz4dyTFO2eckPmFmRO/Jd9Lg3VflPFxHi3ygRsiGHZEf9xpfPMiyAy1UkaPtU6mOOXyoFeQHhI9HE3sOrrYP7KGrbWIRx5ypFv26dLaS6xulFSW1BuFUQF60jwsrViRHBHZsX/uw==
Received: from BN0PR03CA0052.namprd03.prod.outlook.com (2603:10b6:408:e7::27)
 by DS4PPF732958687.namprd18.prod.outlook.com (2603:10b6:f:fc00::aa4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 10:21:14 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::38) by BN0PR03CA0052.outlook.office365.com
 (2603:10b6:408:e7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Wed,
 24 Jun 2026 10:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Wed, 24 Jun 2026 10:21:14 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 936AF4186B5B;
	Wed, 24 Jun 2026 03:18:27 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Wed, 24 Jun 2026 03:21:09 -0700
Subject: [PATCH 2/2] arm64: dts: axiado: Add initial support for AX3005 SoC
 and eval board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-upstream-axiado-ax3005-upstream-v1-2-c05bd0bc9124@axiado.com>
References: <20260624-upstream-axiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com>
In-Reply-To: <20260624-upstream-axiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=28969; i=syang@axiado.com;
 h=from:subject:message-id; bh=svCbpD0TlBx05HgwSrv+hjisSnm2t1DX8jk3dEDq194=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhizr9TOFkg4+67Fq2mTholMTMSl4SooJ4/sjS4xuOS7y/
 7y7O8uto5SFQYyDQVZMkeWrzrf8k7na9zr3riyFmcPKBDKEgYtTACby8hvDf2eH5wvUt/cb/uFx
 Cz78jEnlpcvXrVOXx/QHaz+bdaE8TIuRYZ9ORcXPFT59Z58n75vG/nnbfJ2UlF+/E1b/fykgliP
 hwQkA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DS4PPF732958687:EE_
X-MS-Office365-Filtering-Correlation-Id: b446faa6-e0a7-4585-1724-08ded1da520a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: qs51UdLfoDaendmserTNa7NgXIWxT6/YLQ/sLpGiFc2AGTaG1L2sp/ArBB6QZsCEmr4a0xN8VytSwJgwTfNJ371RoZ1lidfCuwgZkBASoB+UqO+X8Q1DhAw1R1OGVjWny4MiP1eR8VPd7whAUo9jlUpfFtEEZfBGAGC/ZS5JIZnlkFa1aUd1Wbj20rjri0CwBqrrgWMEj7B2I8rUjPS7wjSykaAiApL/HP8NOoJ17eTr7nBWKx9eq/sVH9j61m/MGgUDG3Mq37oZZM4m9olYsdE6ifLQL8kI6mVxy89qHoeUhb35oHv3ahW56wusZZCVs6PZ04POPJF5RrjVWdyHNA1SzPQ/0RyRyO3QXEPVsdhA5kyL+kQkF9Gr7Ns6M7zIuAfDE2bDxYW3nEfA03OZZPt+RkuYgqmekwAYVUEqFuIoFvWE2E4MosfRKAcywQf9EBfidvfQa7JrwUECLW0sOnOMRjIY+41jabrVMuFvoUbhAEMPDCxvauXhtY5c757LHp2JgfKLhnHa2tokO4aYXEIidMGgPxaVewi3yr96TJgYS/9W73iw+VQkmjISBhjO39iSXfxzUjwpI2nZUpIC0dQibFzIlB2cXipRU4fZpxWubTVh92KCzJ44pnIGOyuiiVAfDPVBQBiYH3A+5xW7pzcIjGnWUr2CIxnLvLwbN1/WsSQaGDxS1tr7LrDNAAdWK4vzJ2SHUBX1DlM1ytVBkQ==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: H0kcuFsKRYi+mRuVp+sFHsDIIqR1tU4sEUQX4WhS1jF0T/kec9MdDcknx77TP2tw5nNc/mIFng1wWzeHRYquGFjmJrduuOXNBdYL6KmHG+HbuBed9SWoekt+Bwmqj3LzurgRBAI1ygOYtcosQwUMfFOOlvOrawRlPOgqya+pOl+RoGhe3Oadpv6M7CIj1CtCfiTfvWVsQpMHxB+0HWgHBlTuhISN+ZYg3lZKHPnV67POd5g2eNGvBKalNeBSH7qD2cagyEr6Tljkh2p7QmEW1jSfMJGwvDnX5t6CFIzVPSmCGEb2MoGKSnskhxRcUqImMD/h+3Z6U+I/xceg4JNbjbnB1HRjAigQqjDaeqxAArHKQMHMYY7mqtTQm2wfM+49gJl3ADzpHOPMwicLC+Tcq8srvHsN7NeyR52To/L50JKkdlL+GR0PTdB6LuUuNDR0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:21:14.0933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b446faa6-e0a7-4585-1724-08ded1da520a
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF732958687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_032124_768940_F52AD44B 
X-CRM114-Status: GOOD (  13.67  )
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

Add initial device tree support for the AX3005 SoC and its evaluation
board. The AX3005 is a multi-core SoC featuring 4 Cortex-A53 cores, and
this adds the CPUs, timer, GPIO, UART, I2C, I3C, SPI and USB
controllers.

The AX3005 groups its low-speed controllers into four Slow Peripheral
(SP) blocks (SP0-SP3), each exposing its own I2C/I3C, SPI and UART
instances. The controllers are numbered by their per-SP hardware
instance ID, so the i2cN/spiN/uartN labels and their aliases are
intentionally non-contiguous and do not increase monotonically with
the register address.

Signed-off-by: Swark Yang <syang@axiado.com>
---
 arch/arm64/boot/dts/axiado/Makefile       |   1 +
 arch/arm64/boot/dts/axiado/ax3005-evk.dts | 327 ++++++++++++
 arch/arm64/boot/dts/axiado/ax3005.dtsi    | 843 ++++++++++++++++++++++++++++++
 3 files changed, 1171 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/Makefile b/arch/arm64/boot/dts/axiado/Makefile
index 6676ad07db61..e71a0850a451 100644
--- a/arch/arm64/boot/dts/axiado/Makefile
+++ b/arch/arm64/boot/dts/axiado/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_AXIADO) += ax3000-evk.dtb
+dtb-$(CONFIG_ARCH_AXIADO) += ax3005-evk.dtb
diff --git a/arch/arm64/boot/dts/axiado/ax3005-evk.dts b/arch/arm64/boot/dts/axiado/ax3005-evk.dts
new file mode 100644
index 000000000000..9187057eb7a5
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3005-evk.dts
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DTS file for Axiado AX3005 SoC based EVK
+ * Copyright (c) 2026 Axiado Corporation.
+ */
+
+/dts-v1/;
+
+#include "ax3005.dtsi"
+
+/ {
+	model = "Axiado AX3005 EVK";
+	compatible = "axiado,ax3005-evk", "axiado,ax3005";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+		serial6 = &uart6;
+		serial7 = &uart7;
+		serial8 = &uart8;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i3c12;
+		i2c13 = &i3c13;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+		i2c16 = &i2c16;
+		i2c17 = &i2c17;
+		i2c18 = &i2c18;
+		i2c19 = &i2c19;
+		i2c20 = &i2c20;
+		i2c21 = &i2c21;
+		i2c22 = &i2c22;
+		i2c23 = &i2c23;
+		i2c24 = &i2c24;
+		i2c25 = &i2c25;
+		i2c26 = &i2c26;
+		i2c27 = &i2c27;
+		i2c28 = &i2c28;
+		i2c29 = &i2c29;
+		i2c30 = &i2c30;
+		i2c31 = &i2c31;
+		i2c32 = &i2c32;
+		i2c33 = &i2c33;
+		i2c34 = &i2c34;
+		i2c35 = &i2c35;
+		i2c36 = &i2c36;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		spi2 = &spi2;
+		spi3 = &spi3;
+		spi5 = &spi5;
+		spi6 = &spi6;
+	};
+
+	chosen {
+		stdout-path = "serial3:115200";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		/* Cortex-A53 will use following memory map */
+		reg = <0x0 0x81000000 0x0 0x7f000000>;
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&gpio3 {
+	status = "okay";
+};
+
+&gpio4 {
+	status = "okay";
+};
+
+&gpio5 {
+	status = "okay";
+};
+
+&gpio6 {
+	status = "okay";
+};
+
+&gpio7 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i3c12 {
+	status = "okay";
+};
+
+&i3c13 {
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&i2c16 {
+	status = "okay";
+};
+
+&i2c17 {
+	status = "okay";
+};
+
+&i2c18 {
+	status = "okay";
+};
+
+&i2c19 {
+	status = "okay";
+};
+
+&i2c20 {
+	status = "okay";
+};
+
+&i2c21 {
+	status = "okay";
+};
+
+&i2c22 {
+	status = "okay";
+};
+
+&i2c23 {
+	status = "okay";
+};
+
+&i2c24 {
+	status = "okay";
+};
+
+&i2c25 {
+	status = "okay";
+};
+
+&i2c26 {
+	status = "okay";
+};
+
+&i2c27 {
+	status = "okay";
+};
+
+&i2c28 {
+	status = "okay";
+};
+
+&i2c29 {
+	status = "okay";
+};
+
+&i2c30 {
+	status = "okay";
+};
+
+&i2c31 {
+	status = "okay";
+};
+
+&i2c32 {
+	status = "okay";
+};
+
+&i2c33 {
+	status = "okay";
+};
+
+&i2c34 {
+	status = "okay";
+};
+
+&i2c35 {
+	status = "okay";
+};
+
+&i2c36 {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+};
+
+&spi1 {
+	status = "okay";
+};
+
+&spi2 {
+	status = "okay";
+};
+
+&spi3 {
+	status = "okay";
+};
+
+&spi5 {
+	status = "okay";
+};
+
+&spi6 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&uart6 {
+	status = "okay";
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&uart8 {
+	status = "okay";
+};
+
+&usb2_0 {
+	status = "okay";
+};
+
+&usb2_1 {
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/axiado/ax3005.dtsi b/arch/arm64/boot/dts/axiado/ax3005.dtsi
new file mode 100644
index 000000000000..3c2ce18082a9
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3005.dtsi
@@ -0,0 +1,843 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2026 Axiado Corporation.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+/memreserve/ 0x80002fa0 0x00000008;
+/ {
+	model = "Axiado AX3005";
+	interrupt-parent = <&gic500>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0x0 0x0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x80002fa0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0x0 0x1>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x80002fa0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu2: cpu@2 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0x0 0x2>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x80002fa0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu3: cpu@3 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0x0 0x3>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x80002fa0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x100000>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-level = <2>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
+	clocks {
+		refclk: clock-125000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+		};
+
+		pclk: clock-100000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <100000000>;
+		};
+
+		sysclk: clock-200000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <200000000>;
+		};
+
+		spiclk: clock-400000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <400000000>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&gic500>;
+		ranges;
+
+		gic500: interrupt-controller@40400000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x40400000 0x0 0x10000>,
+			      <0x0 0x40500000 0x0 0xc0000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		/* GPIO Controller banks 0 - 7 */
+		gpio0: gpio-controller@33000000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x0 0x33000000 0x0 0x100>;
+			clocks = <&pclk>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio-controller@33080000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x0 0x33080000 0x0 0x100>;
+			clocks = <&pclk>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio2: gpio-controller@33100000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x0 0x33100000 0x0 0x100>;
+			clocks = <&pclk>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio3: gpio-controller@33180000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x0 0x33180000 0x0 0x100>;
+			clocks = <&pclk>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio4: gpio-controller@33200000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x0 0x33200000 0x0 0x100>;
+			clocks = <&pclk>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio5: gpio-controller@33280000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x0 0x33280000 0x0 0x100>;
+			clocks = <&pclk>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio6: gpio-controller@33300000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x0 0x33300000 0x0 0x100>;
+			clocks = <&pclk>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio7: gpio-controller@33380000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x0 0x33380000 0x0 0x100>;
+			clocks = <&pclk>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@33000400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33000400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@33000800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33000800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@33080400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33080400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@33080800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33080800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@33100400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33100400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@33100800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33100800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c8: i2c@33200400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33200400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c9: i2c@33200800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33200800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c10: i2c@33280400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33280400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c11: i2c@33280800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33280800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c12: i3c@33300400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x0 0x33300400 0x0 0x400>;
+			clock-names = "pclk", "sysclk";
+			clocks = <&pclk &sysclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c13: i3c@33300800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x0 0x33300800 0x0 0x400>;
+			clock-names = "pclk", "sysclk";
+			clocks = <&pclk &sysclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c14: i2c@33380400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33380400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c15: i2c@33380800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33380800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c16: i2c@33120400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33120400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c17: i2c@33021400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33021400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c18: i2c@33021800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33021800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c19: i2c@330c0400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x330c0400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c20: i2c@330c0800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x330c0800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c21: i2c@330c0c00 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x330c0c00 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c22: i2c@331a0800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x331a0800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c23: i2c@33302800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33302800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c24: i2c@33302c00 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33302c00 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c25: i2c@33303000 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33303000 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c26: i2c@33382000 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33382000 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c27: i2c@33382400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33382400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c28: i2c@33382800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33382800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c29: i2c@33382c00 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33382c00 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c30: i2c@33383000 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33383000 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c31: i2c@33383400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33383400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c32: i2c@33383800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33383800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c33: i2c@33282400 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33282400 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c34: i2c@33282800 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33282800 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c35: i2c@33282c00 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33282c00 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c36: i2c@33283000 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x33283000 0x0 0x400>;
+			clocks = <&pclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi0: spi@33010000 {
+			compatible = "snps,dwc-ssi-1.01a";
+			reg = <0x0 0x33010000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&spiclk>;
+			num-cs = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		spi1: spi@33090000 {
+			compatible = "snps,dwc-ssi-1.01a";
+			reg = <0x0 0x33090000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&spiclk>;
+			num-cs = <1>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		spi2: spi@333c0000 {
+			compatible = "snps,dwc-ssi-1.01a";
+			reg = <0x0 0x333c0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&spiclk>;
+			num-cs = <1>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		spi3: spi@330e0000 {
+			compatible = "snps,dwc-ssi-1.01a";
+			reg = <0x0 0x330e0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&spiclk>;
+			num-cs = <1>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		spi5: spi@33390000 {
+			compatible = "snps,dwc-ssi-1.01a";
+			reg = <0x0 0x33390000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&spiclk>;
+			num-cs = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		spi6: spi@333a0000 {
+			compatible = "snps,dwc-ssi-1.01a";
+			reg = <0x0 0x333a0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&spiclk>;
+			num-cs = <1>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart0: serial@33020000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x0 0x33020000 0x0 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &pclk>;
+			status = "disabled";
+		};
+
+		uart1: serial@330a0000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x0 0x330a0000 0x0 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &pclk>;
+			status = "disabled";
+		};
+
+		uart2: serial@33120000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x0 0x33120000 0x0 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &pclk>;
+			status = "disabled";
+		};
+
+		uart3: serial@33020800 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x0 0x33020800 0x0 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &pclk>;
+			status = "disabled";
+		};
+
+		uart4: serial@331a0400 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x0 0x331a0400 0x0 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &pclk>;
+			status = "disabled";
+		};
+
+		uart5: serial@33381d00 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x0 0x33381d00 0x0 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &pclk>;
+			status = "disabled";
+		};
+
+		uart6: serial@33381e00 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x0 0x33381e00 0x0 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &pclk>;
+			status = "disabled";
+		};
+
+		uart7: serial@33381f00 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x0 0x33381f00 0x0 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &pclk>;
+			status = "disabled";
+		};
+
+		uart8: serial@330c0000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x0 0x330c0000 0x0 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &pclk>;
+			status = "disabled";
+		};
+
+		usb2_0: usb@41000000 {
+			compatible = "generic-xhci";
+			reg = <0x0 0x41000000 0x0 0x100000>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		usb2_1: usb@41100000 {
+			compatible = "generic-xhci";
+			reg = <0x0 0x41100000 0x0 0x100000>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		usb3_0: usb@41400000 {
+			compatible = "generic-xhci";
+			reg = <0x0 0x41400000 0x0 0x100000>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		usb3_1: usb@41500000 {
+			compatible = "generic-xhci";
+			reg = <0x0 0x41500000 0x0 0x100000>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.34.1


