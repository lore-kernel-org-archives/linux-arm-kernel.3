Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C054D58E62
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpFcP4s5+2J8tyEvF8lIcZq35Tm8UMH19nD3WYziXkU=; b=majBUMM1NtP13GWW+VvYb1iJ7H
	0blUQwjj90Q/YtEwri7w3Z6yfeD1qM2oedbXl2xFseDDUBrjhYzdSctKoi88ZHo3DpEhTAz1nC+Gz
	TD7ZGW4OuHwh3QRym9/Nzka72F+CtT0nB9VeWMWpSm5FbVjVjLJZ5lO10WKNmeyv+Lz23LqNjozwK
	/apNUeNs6UpmjzkPLD4ImYz8MV1Sx4nMgKTMLJdtYY8FjJ2lIFZVnI/dWwszsj23NfCSangxKzKmg
	qp2PIuaKKBhNIxQRanJcAci4NND9wK1TMFeI7CuD4+XI6C7ddBopKurP8neAUwtg7IhVEWjkSfxfh
	kZQspcdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwx0u-0000000CLrN-2Tnt;
	Mon, 02 Mar 2026 06:44:20 +0000
Received: from mail-japaneastazon11022120.outbound.protection.outlook.com ([52.101.126.120] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwx0s-0000000CLqB-0XH1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 06:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iX47A41J/deIUnXkuPyj033GQS//diekVnHm6pY2bViXXmQ3b6R7nOKRe/UCbzFGtOAs9o3ZGYbECTOZ+eGSMeT0mwyltmeeKpgt6cj72lWiH8zwvhV9xIfft76xZegFaS88RzHaURtaIkpqBWgMoblRTIoDwCKpmkPO9A+OU/4Hg5+dx4mZV82T0uWMvmuoyD8FqMTNw76dsYj5FiTsfxqNvgDebmiv7dhz5LlVl1B+WpLqCCoQrWRCupyCpvUnVei+OwKFyhhYCrCioqsx7REsyffwzJq584ZyAcCgIkJ+Qsd3sxdtz+SdsGVdktMEW993vaillzNy7dag0twS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpFcP4s5+2J8tyEvF8lIcZq35Tm8UMH19nD3WYziXkU=;
 b=u/ZeygLSwJIPlRWPQnAlapAH1MdqNrrH0sPJhEhItFkl25bR5nyz3F+3vZAw0LE62v5AxtQUHBrqTAhzVps5pTaEbfLqLXcAS4SKlYmQ1FFSf6K87J0fX3XMPXeZk9OJwSQosca2ypPCAWhk4P7oyTffmXjNnbUvqzC0gSzJ0OcfPZAw3DKI4EucriGlgri3652XCV8aVHQWmUv8yTVKUh176WCZMrGsKIVeLLeSC8QDl+mEnn8P+rM8zap7qszXea7zJGepcxheiXFDNUlOj6uMOyckPLvR2Jy5fyRmue0XpbOP5qrtx+vGvlVwkVX1TZ1Lsbi3KAcQY+HZWJkTgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2P216CA0176.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b::23)
 by KL1PR0601MB5749.apcprd06.prod.outlook.com (2603:1096:820:bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 06:44:10 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:101:1b:cafe::45) by SL2P216CA0176.outlook.office365.com
 (2603:1096:101:1b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 06:44:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 06:44:09 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4746F41604E7;
	Mon,  2 Mar 2026 14:44:08 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v10 2/3] reset: add Sky1 soc reset support
Date: Mon,  2 Mar 2026 14:44:06 +0800
Message-ID: <20260302064407.1914014-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302064407.1914014-1-gary.yang@cixtech.com>
References: <20260302064407.1914014-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|KL1PR0601MB5749:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3f2075bf-5700-4d32-a4a6-08de78271b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: WXuq/+pOB0CjkQuOh1kAbl9ELTD2E1+5RUsPARjTOVrW9ERE4VqYltqvP2ZPRIllCXhFxg/IpqfkSae9Phuxc+6E2O7Xi5bsBaFpRx6rCdLJjef9oruGx2Drr2BUYFDAqW7meKpzY10jVlsNCmNC3jj++wXwFBeFnHBMKF2pT13M53qDo6+tz2/LxXvRyVZ2zu0grvEI1iXi8vjqPvrz8e58mH7agifBnVUCISq8JBWE1hBY9JZisYAnR8F7JYZBN/pAHCTA4Gx+Wu5mLAud3fiL6vlaYYhKKUGltufDr6ovd15JY6/iwCpLH8L03PWSxL8h1jDYuNweWf28k51K6C1mRcGKno8FbEUq4Ve5uRWNLPHD1Sr6Y2ViouxORDfqJNbvUTBNgjRIcAMHeMj2yjR/zphngxIslDL7Pym49qoRgrdxD9izVNO9GET8lXyXiYiKcIJn7hsuSskbiOH2Ng/7X5FiZNNrDnQeyrue12yXVN7XvDMfezE4Bht1NGNyNU9jPGqsHdNtEDtzuCpxGVFjgImbBZ5mA5Oq2jUFfwz09AMCD9oVyA62Al8dtsiZjixFI86Tul40D6hH3K6AESdfcKp4WxT8SolGrr41RHiJ2RO0mhTj3301MWSTNHfs4d6i+nIsaXcNvfJ7qQFGVpYF2wtPwTvLXuR+OfHJx/m18qKoQWGtNUdBBI3KWeWEZ5kLhfjgr1W6TKGx5MGfaOLs1rJkqq48HOpRC3B8R6d7kxq7nGcZWi20hO8vx+KdXskOBitwztP0Lnlb4tnXal/rTOKoFlNThFmj0yWP+yA7RUwCZBuLGdOVVTfSPi61CmqEjrwZXExmEpk258NoMg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u8cgeAKs0BKjGV0HDBtg4GiDhY0GprASiWAf5qqIJzKl9NNBM7WxpaHAHcsdQm3mRuW7L2GZEt8ZBfb77DJK8zJlptU0qc/LUCJ5uVIzP2+AqVxFEuW05IVnPdOJRpV3RM+/K+8nlt0iqV2rtCVQ6vMjpygcoRFLCj01IaTPBSRiukdEGWkmZLhmfMiTHjUWSCJu5b3E7FYwaJykzczd9Ae3jQm3VM5MAmFshe5bdFF4inRQCD05cXQfYGQFfymBNKgPHmMQfdH3G7SdLsvh7AT63o2uRNz+UsfU7Z92K9rLmj4Kip3jMZg2uI1SlySoK6GrVSAA/Zxb/OVhEB0/VfRwtFalJXqRcfRjyixaEnDdDbE39eG9snKtZqxIZ7kRuwFVN/54S+MCeUwLT3Fi4Nn5QEFz5H++9uRnIksn/viGuMVQsTbzcnFO8zyjMTnL
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:44:09.1795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2075bf-5700-4d32-a4a6-08de78271b97
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5749
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_224418_276996_2BE50901 
X-CRM114-Status: GOOD (  16.59  )
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

Add support for the resets on Cix's Sky1 SoC.
There are two reset controllers on Cix Sky1 Soc. One is located in S0
domain, and the other is located in S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 drivers/reset/Kconfig      |   7 +
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-sky1.c | 367 +++++++++++++++++++++++++++++++++++++
 3 files changed, 375 insertions(+)
 create mode 100644 drivers/reset/reset-sky1.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..3fee381707d8 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -291,6 +291,13 @@ config RESET_SIMPLE
 	   - SiFive FU740 SoCs
 	   - Sophgo SoCs
 
+config RESET_SKY1
+	bool "Cix Sky1 reset controller"
+	depends on ARCH_CIX || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  This enables the reset controller for Cix Sky1.
+
 config RESET_SOCFPGA
 	bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
 	default ARM && ARCH_INTEL_SOCFPGA
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 9c3e484dfd81..0d2e1329561d 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
+obj-$(CONFIG_RESET_SKY1) += reset-sky1.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
diff --git a/drivers/reset/reset-sky1.c b/drivers/reset/reset-sky1.c
new file mode 100644
index 000000000000..78e80a533c39
--- /dev/null
+++ b/drivers/reset/reset-sky1.c
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *
+ * CIX System Reset Controller (SRC) driver
+ *
+ * Author: Jerry Zhu <jerry.zhu@cixtech.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+#define SKY1_RESET_SLEEP_MIN_US		50
+#define SKY1_RESET_SLEEP_MAX_US		100
+
+struct sky1_src_signal {
+	unsigned int offset;
+	unsigned int bit;
+};
+
+struct sky1_src_variant {
+	const struct sky1_src_signal *signals;
+	unsigned int signals_num;
+};
+
+struct sky1_src {
+	struct reset_controller_dev rcdev;
+	const struct sky1_src_signal *signals;
+	struct regmap *regmap;
+};
+
+enum {
+	CSU_PM_RESET				= 0x304,
+	SENSORFUSION_RESET			= 0x308,
+	SENSORFUSION_NOC_RESET			= 0x30c,
+	RESET_GROUP0_S0_DOMAIN_0		= 0x400,
+	RESET_GROUP0_S0_DOMAIN_1		= 0x404,
+	RESET_GROUP1_USB_PHYS			= 0x408,
+	RESET_GROUP1_USB_CONTROLLERS		= 0x40c,
+	RESET_GROUP0_RCSU			= 0x800,
+	RESET_GROUP1_RCSU			= 0x804,
+};
+
+static const struct sky1_src_signal sky1_src_signals[] = {
+	/* reset group1 for s0 domain modules */
+	[SKY1_CSU_PM_RESET_N]		= { CSU_PM_RESET, BIT(0) },
+	[SKY1_SENSORFUSION_RESET_N]	= { SENSORFUSION_RESET, BIT(0) },
+	[SKY1_SENSORFUSION_NOC_RESET_N]	= { SENSORFUSION_NOC_RESET, BIT(0) },
+	[SKY1_DDRC_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(0) },
+	[SKY1_GIC_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(1) },
+	[SKY1_CI700_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(2) },
+	[SKY1_SYS_NI700_RESET_N]	= { RESET_GROUP0_S0_DOMAIN_0, BIT(3) },
+	[SKY1_MM_NI700_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(4) },
+	[SKY1_PCIE_NI700_RESET_N]	= { RESET_GROUP0_S0_DOMAIN_0, BIT(5) },
+	[SKY1_GPU_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(6) },
+	[SKY1_NPUTOP_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(7) },
+	[SKY1_NPUCORE0_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(8) },
+	[SKY1_NPUCORE1_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(9) },
+	[SKY1_NPUCORE2_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(10) },
+	[SKY1_VPU_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(11) },
+	[SKY1_ISP_SRESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(12) },
+	[SKY1_ISP_ARESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(13) },
+	[SKY1_ISP_HRESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(14) },
+	[SKY1_ISP_GDCRESET_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(15) },
+	[SKY1_DPU_RESET0_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(16) },
+	[SKY1_DPU_RESET1_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(17) },
+	[SKY1_DPU_RESET2_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(18) },
+	[SKY1_DPU_RESET3_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(19) },
+	[SKY1_DPU_RESET4_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(20) },
+	[SKY1_DP_RESET0_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(21) },
+	[SKY1_DP_RESET1_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(22) },
+	[SKY1_DP_RESET2_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(23) },
+	[SKY1_DP_RESET3_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(24) },
+	[SKY1_DP_RESET4_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(25) },
+	[SKY1_DP_PHY_RST_N]		= { RESET_GROUP0_S0_DOMAIN_0, BIT(26) },
+
+	/* reset group1 for s0 domain modules */
+	[SKY1_AUDIO_HIFI5_RESET_N]	= { RESET_GROUP0_S0_DOMAIN_1, BIT(0) },
+	[SKY1_AUDIO_HIFI5_NOC_RESET_N]	= { RESET_GROUP0_S0_DOMAIN_1, BIT(1) },
+	[SKY1_CSIDPHY_PRST0_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(2) },
+	[SKY1_CSIDPHY_CMNRST0_N]	= { RESET_GROUP0_S0_DOMAIN_1, BIT(3) },
+	[SKY1_CSI0_RST_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(4) },
+	[SKY1_CSIDPHY_PRST1_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(5) },
+	[SKY1_CSIDPHY_CMNRST1_N]	= { RESET_GROUP0_S0_DOMAIN_1, BIT(6) },
+	[SKY1_CSI1_RST_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(7) },
+	[SKY1_CSI2_RST_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(8) },
+	[SKY1_CSI3_RST_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(9) },
+	[SKY1_CSIBRDGE0_RST_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(10) },
+	[SKY1_CSIBRDGE1_RST_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(11) },
+	[SKY1_CSIBRDGE2_RST_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(12) },
+	[SKY1_CSIBRDGE3_RST_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(13) },
+	[SKY1_GMAC0_RST_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(14) },
+	[SKY1_GMAC1_RST_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(15) },
+	[SKY1_PCIE0_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(16) },
+	[SKY1_PCIE1_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(17) },
+	[SKY1_PCIE2_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(18) },
+	[SKY1_PCIE3_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(19) },
+	[SKY1_PCIE4_RESET_N]		= { RESET_GROUP0_S0_DOMAIN_1, BIT(20) },
+
+	/* reset group1 for usb phys */
+	[SKY1_USB_DP_PHY0_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(0) },
+	[SKY1_USB_DP_PHY1_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(1) },
+	[SKY1_USB_DP_PHY2_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(2) },
+	[SKY1_USB_DP_PHY3_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(3) },
+	[SKY1_USB_DP_PHY0_RST_N]		= { RESET_GROUP1_USB_PHYS, BIT(4) },
+	[SKY1_USB_DP_PHY1_RST_N]		= { RESET_GROUP1_USB_PHYS, BIT(5) },
+	[SKY1_USB_DP_PHY2_RST_N]		= { RESET_GROUP1_USB_PHYS, BIT(6) },
+	[SKY1_USB_DP_PHY3_RST_N]		= { RESET_GROUP1_USB_PHYS, BIT(7) },
+	[SKY1_USBPHY_SS_PST_N]			= { RESET_GROUP1_USB_PHYS, BIT(8) },
+	[SKY1_USBPHY_SS_RST_N]			= { RESET_GROUP1_USB_PHYS, BIT(9) },
+	[SKY1_USBPHY_HS0_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(10) },
+	[SKY1_USBPHY_HS1_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(11) },
+	[SKY1_USBPHY_HS2_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(12) },
+	[SKY1_USBPHY_HS3_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(13) },
+	[SKY1_USBPHY_HS4_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(14) },
+	[SKY1_USBPHY_HS5_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(15) },
+	[SKY1_USBPHY_HS6_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(16) },
+	[SKY1_USBPHY_HS7_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(17) },
+	[SKY1_USBPHY_HS8_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(18) },
+	[SKY1_USBPHY_HS9_PRST_N]		= { RESET_GROUP1_USB_PHYS, BIT(19) },
+
+	/* reset group1 for usb controllers */
+	[SKY1_USBC_SS0_PRST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(0) },
+	[SKY1_USBC_SS1_PRST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(1) },
+	[SKY1_USBC_SS2_PRST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(2) },
+	[SKY1_USBC_SS3_PRST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(3) },
+	[SKY1_USBC_SS4_PRST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(4) },
+	[SKY1_USBC_SS5_PRST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(5) },
+	[SKY1_USBC_SS0_RST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(6) },
+	[SKY1_USBC_SS1_RST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(7) },
+	[SKY1_USBC_SS2_RST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(8) },
+	[SKY1_USBC_SS3_RST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(9) },
+	[SKY1_USBC_SS4_RST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(10) },
+	[SKY1_USBC_SS5_RST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(11) },
+	[SKY1_USBC_HS0_PRST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(12) },
+	[SKY1_USBC_HS1_PRST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(13) },
+	[SKY1_USBC_HS2_PRST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(14) },
+	[SKY1_USBC_HS3_PRST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(15) },
+	[SKY1_USBC_HS0_RST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(16) },
+	[SKY1_USBC_HS1_RST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(17) },
+	[SKY1_USBC_HS2_RST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(18) },
+	[SKY1_USBC_HS3_RST_N]		= { RESET_GROUP1_USB_CONTROLLERS, BIT(19) },
+
+	/* reset group0 for rcsu */
+	[SKY1_AUDIO_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(0) },
+	[SKY1_CI700_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(1) },
+	[SKY1_CSI_RCSU0_RESET_N]		= { RESET_GROUP0_RCSU, BIT(2) },
+	[SKY1_CSI_RCSU1_RESET_N]		= { RESET_GROUP0_RCSU, BIT(3) },
+	[SKY1_CSU_PM_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(4) },
+	[SKY1_DDR_BROADCAST_RCSU_RESET_N]	= { RESET_GROUP0_RCSU, BIT(5) },
+	[SKY1_DDR_CTRL_RCSU_0_RESET_N]		= { RESET_GROUP0_RCSU, BIT(6) },
+	[SKY1_DDR_CTRL_RCSU_1_RESET_N]		= { RESET_GROUP0_RCSU, BIT(7) },
+	[SKY1_DDR_CTRL_RCSU_2_RESET_N]		= { RESET_GROUP0_RCSU, BIT(8) },
+	[SKY1_DDR_CTRL_RCSU_3_RESET_N]		= { RESET_GROUP0_RCSU, BIT(9) },
+	[SKY1_DDR_TZC400_RCSU_0_RESET_N]	= { RESET_GROUP0_RCSU, BIT(10) },
+	[SKY1_DDR_TZC400_RCSU_1_RESET_N]	= { RESET_GROUP0_RCSU, BIT(11) },
+	[SKY1_DDR_TZC400_RCSU_2_RESET_N]	= { RESET_GROUP0_RCSU, BIT(12) },
+	[SKY1_DDR_TZC400_RCSU_3_RESET_N]	= { RESET_GROUP0_RCSU, BIT(13) },
+	[SKY1_DP0_RCSU_RESET_N]			= { RESET_GROUP0_RCSU, BIT(14) },
+	[SKY1_DP1_RCSU_RESET_N]			= { RESET_GROUP0_RCSU, BIT(15) },
+	[SKY1_DP2_RCSU_RESET_N]			= { RESET_GROUP0_RCSU, BIT(16) },
+	[SKY1_DP3_RCSU_RESET_N]			= { RESET_GROUP0_RCSU, BIT(17) },
+	[SKY1_DP4_RCSU_RESET_N]			= { RESET_GROUP0_RCSU, BIT(18) },
+	[SKY1_DPU0_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(19) },
+	[SKY1_DPU1_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(20) },
+	[SKY1_DPU2_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(21) },
+	[SKY1_DPU3_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(22) },
+	[SKY1_DPU4_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(23) },
+	[SKY1_DSU_RCSU_RESET_N]			= { RESET_GROUP0_RCSU, BIT(24) },
+	[SKY1_FCH_RCSU_RESET_N]			= { RESET_GROUP0_RCSU, BIT(25) },
+	[SKY1_GICD_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(26) },
+	[SKY1_GMAC_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(27) },
+	[SKY1_GPU_RCSU_RESET_N]			= { RESET_GROUP0_RCSU, BIT(28) },
+	[SKY1_ISP_RCSU0_RESET_N]		= { RESET_GROUP0_RCSU, BIT(29) },
+	[SKY1_ISP_RCSU1_RESET_N]		= { RESET_GROUP0_RCSU, BIT(30) },
+	[SKY1_NI700_MMHUB_RCSU_RESET_N]		= { RESET_GROUP0_RCSU, BIT(31) },
+
+	/* reset group1 for rcsu */
+	[SKY1_NPU_RCSU_RESET_N]			= { RESET_GROUP1_RCSU, BIT(0) },
+	[SKY1_NI700_PCIE_RCSU_RESET_N]		= { RESET_GROUP1_RCSU, BIT(1) },
+	[SKY1_PCIE_X421_RCSU_RESET_N]		= { RESET_GROUP1_RCSU, BIT(2) },
+	[SKY1_PCIE_X8_RCSU_RESET_N]		= { RESET_GROUP1_RCSU, BIT(3) },
+	[SKY1_SF_RCSU_RESET_N]			= { RESET_GROUP1_RCSU, BIT(4) },
+	[SKY1_RCSU_SMMU_MMHUB_RESET_N]		= { RESET_GROUP1_RCSU, BIT(5) },
+	[SKY1_RCSU_SMMU_PCIEHUB_RESET_N]	= { RESET_GROUP1_RCSU, BIT(6) },
+	[SKY1_RCSU_SYSHUB_RESET_N]		= { RESET_GROUP1_RCSU, BIT(7) },
+	[SKY1_NI700_SMN_RCSU_RESET_N]		= { RESET_GROUP1_RCSU, BIT(8) },
+	[SKY1_NI700_SYSHUB_RCSU_RESET_N]	= { RESET_GROUP1_RCSU, BIT(9) },
+	[SKY1_RCSU_USB2_HOST0_RESET_N]		= { RESET_GROUP1_RCSU, BIT(10) },
+	[SKY1_RCSU_USB2_HOST1_RESET_N]		= { RESET_GROUP1_RCSU, BIT(11) },
+	[SKY1_RCSU_USB2_HOST2_RESET_N]		= { RESET_GROUP1_RCSU, BIT(12) },
+	[SKY1_RCSU_USB2_HOST3_RESET_N]		= { RESET_GROUP1_RCSU, BIT(13) },
+	[SKY1_RCSU_USB3_TYPEA_DRD_RESET_N]	= { RESET_GROUP1_RCSU, BIT(14) },
+	[SKY1_RCSU_USB3_TYPEC_DRD_RESET_N]	= { RESET_GROUP1_RCSU, BIT(15) },
+	[SKY1_RCSU_USB3_TYPEC_HOST0_RESET_N]	= { RESET_GROUP1_RCSU, BIT(16) },
+	[SKY1_RCSU_USB3_TYPEC_HOST1_RESET_N]	= { RESET_GROUP1_RCSU, BIT(17) },
+	[SKY1_RCSU_USB3_TYPEC_HOST2_RESET_N]	= { RESET_GROUP1_RCSU, BIT(18) },
+	[SKY1_VPU_RCSU_RESET_N]			= { RESET_GROUP1_RCSU, BIT(19) },
+};
+
+static const struct sky1_src_variant variant_sky1 = {
+	.signals = sky1_src_signals,
+	.signals_num = ARRAY_SIZE(sky1_src_signals),
+};
+
+enum {
+	FCH_SW_RST_FUNC			= 0x8,
+	FCH_SW_RST_BUS			= 0xc,
+	FCH_SW_XSPI			= 0x10,
+};
+
+static const struct sky1_src_signal sky1_src_fch_signals[] = {
+	/* resets for fch_sw_rst_func */
+	[SW_I3C0_RST_FUNC_G_N]	= { FCH_SW_RST_FUNC, BIT(0) },
+	[SW_I3C0_RST_FUNC_I_N]	= { FCH_SW_RST_FUNC, BIT(1) },
+	[SW_I3C1_RST_FUNC_G_N]	= { FCH_SW_RST_FUNC, BIT(2) },
+	[SW_I3C1_RST_FUNC_I_N]	= { FCH_SW_RST_FUNC, BIT(3) },
+	[SW_UART0_RST_FUNC_N]	= { FCH_SW_RST_FUNC, BIT(4) },
+	[SW_UART1_RST_FUNC_N]	= { FCH_SW_RST_FUNC, BIT(5) },
+	[SW_UART2_RST_FUNC_N]	= { FCH_SW_RST_FUNC, BIT(6) },
+	[SW_UART3_RST_FUNC_N]	= { FCH_SW_RST_FUNC, BIT(7) },
+	[SW_TIMER_RST_FUNC_N]	= { FCH_SW_RST_FUNC, BIT(20) },
+
+	/* resets for fch_sw_rst_bus */
+	[SW_I3C0_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(0) },
+	[SW_I3C1_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(1) },
+	[SW_DMA_RST_AXI_N]	= { FCH_SW_RST_BUS, BIT(2) },
+	[SW_UART0_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(4) },
+	[SW_UART1_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(5) },
+	[SW_UART2_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(6) },
+	[SW_UART3_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(7) },
+	[SW_SPI0_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(8) },
+	[SW_SPI1_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(9) },
+	[SW_I2C0_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(12) },
+	[SW_I2C1_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(13) },
+	[SW_I2C2_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(14) },
+	[SW_I2C3_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(15) },
+	[SW_I2C4_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(16) },
+	[SW_I2C5_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(17) },
+	[SW_I2C6_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(18) },
+	[SW_I2C7_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(19) },
+	[SW_GPIO_RST_APB_N]	= { FCH_SW_RST_BUS, BIT(21) },
+
+	/* resets for fch_sw_xspi */
+	[SW_XSPI_REG_RST_N]	= { FCH_SW_XSPI, BIT(0) },
+	[SW_XSPI_SYS_RST_N]	= { FCH_SW_XSPI, BIT(1) },
+};
+
+static const struct sky1_src_variant variant_sky1_fch = {
+	.signals = sky1_src_fch_signals,
+	.signals_num = ARRAY_SIZE(sky1_src_fch_signals),
+};
+
+static struct sky1_src *to_sky1_src(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct sky1_src, rcdev);
+}
+
+static int sky1_reset_set(struct reset_controller_dev *rcdev,
+			  unsigned long id, bool assert)
+{
+	struct sky1_src *sky1src = to_sky1_src(rcdev);
+	const struct sky1_src_signal *signal = &sky1src->signals[id];
+	unsigned int value = assert ? 0 : signal->bit;
+
+	return regmap_update_bits(sky1src->regmap,
+				  signal->offset, signal->bit, value);
+}
+
+static int sky1_reset_assert(struct reset_controller_dev *rcdev,
+			     unsigned long id)
+{
+	sky1_reset_set(rcdev, id, true);
+	usleep_range(SKY1_RESET_SLEEP_MIN_US,
+		     SKY1_RESET_SLEEP_MAX_US);
+	return 0;
+}
+
+static int sky1_reset_deassert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	sky1_reset_set(rcdev, id, false);
+	usleep_range(SKY1_RESET_SLEEP_MIN_US,
+		     SKY1_RESET_SLEEP_MAX_US);
+	return 0;
+}
+
+static int sky1_reset(struct reset_controller_dev *rcdev,
+		      unsigned long id)
+{
+	sky1_reset_assert(rcdev, id);
+	sky1_reset_deassert(rcdev, id);
+	return 0;
+}
+
+static int sky1_reset_status(struct reset_controller_dev *rcdev,
+			     unsigned long id)
+{
+	unsigned int value = 0;
+	struct sky1_src *sky1src = to_sky1_src(rcdev);
+	const struct sky1_src_signal *signal = &sky1src->signals[id];
+
+	regmap_read(sky1src->regmap, signal->offset, &value);
+	return !(value & signal->bit);
+}
+
+static const struct reset_control_ops sky1_src_ops = {
+	.reset    = sky1_reset,
+	.assert   = sky1_reset_assert,
+	.deassert = sky1_reset_deassert,
+	.status   = sky1_reset_status
+};
+
+static int sky1_reset_probe(struct platform_device *pdev)
+{
+	struct sky1_src *sky1src;
+	struct device *dev = &pdev->dev;
+	const struct sky1_src_variant *variant;
+
+	sky1src = devm_kzalloc(dev, sizeof(*sky1src), GFP_KERNEL);
+	if (!sky1src)
+		return -ENOMEM;
+
+	variant = of_device_get_match_data(dev);
+
+	sky1src->regmap = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(sky1src->regmap)) {
+		return dev_err_probe(dev, PTR_ERR(sky1src->regmap),
+				     "Unable to get sky1-src regmap");
+	}
+
+	sky1src->signals = variant->signals;
+	sky1src->rcdev.owner     = THIS_MODULE;
+	sky1src->rcdev.nr_resets = variant->signals_num;
+	sky1src->rcdev.ops       = &sky1_src_ops;
+	sky1src->rcdev.of_node   = dev->of_node;
+	sky1src->rcdev.dev       = dev;
+
+	return devm_reset_controller_register(dev, &sky1src->rcdev);
+}
+
+static const struct of_device_id sky1_sysreg_of_match[] = {
+	{ .compatible = "cix,sky1-system-control", .data = &variant_sky1_fch},
+	{ .compatible = "cix,sky1-s5-system-control", .data = &variant_sky1},
+	{},
+};
+MODULE_DEVICE_TABLE(of, sky1_sysreg_of_match);
+
+static struct platform_driver sky1_reset_driver = {
+	.probe	= sky1_reset_probe,
+	.driver = {
+		.name		= "cix,sky1-rst",
+		.of_match_table = sky1_sysreg_of_match,
+	},
+};
+module_platform_driver(sky1_reset_driver)
+
+MODULE_AUTHOR("Jerry Zhu <jerry.zhu@cixtech.com>");
+MODULE_DESCRIPTION("Cix Sky1 reset driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0


