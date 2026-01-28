Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B822D35698
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJA+wPUH3yFQDLWjSjn21+lnOvYt1E7BiGZVhM9H9+E=; b=4ihFRz60Ig3pLvxOk6/lRi5NMa
	BUcMlfPSonSLdhZwGYhrKWV53zz6lhZVd1DWPeCmWPf3kKJRNWLm3Bg55JX5NlWtb61+CBsPPM4mZ
	llhAqjld9Bepde0TaBf3wP9LbYh0ZJKU5/j2rBPjO177FKTK4dRpZoS14YIjLtqWxtIE7+7liFhWB
	rkXbM9REaGl3ANcQj4RsEc565QbiBrjPEWHbGIHecwklSmSDCuRto1K2lFqhzGiAnl2T9bCaXHa1r
	7FAQ5+qqpMBF2mKnoGgt+2KC/FpinZymyaYjjEsb90yr0QeZYmbhWoaCEVgUbm5NF2x6VCvr1FXYB
	VdhthmVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2CW-0000000Fm7G-0JYf;
	Wed, 28 Jan 2026 09:51:04 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2CS-0000000Fm6r-0Cgk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:51:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvBGK/G/VRKl7ms47fXjUQt6EyedEBu1FsiST7eOqD36LvZCLb2BmeJMUnezYAUXeagToChE9x2MNAI21PzA5vx/El2M1PnbCxKJsmUxz2lZL9dEYEvbRweeRL+PWRQpWsqVCjQHv7THBSwENYUTziAtOAs/vEUgvCBcPUMI1RUq0kM/qBVWNyHHnuXIyMLEElTDIVfjfkHCR/ANZvaF/TZDc/XYOCOvLFRYSNJYD5sKk2/4VAF1tIjyXptuxODuAfgtPQ4gmSQUNIDYkr1Xe+LDNXbSww59yLNcZnds/eAFZOpSlWKcwDNMsVcUMpV8URUWn3KhjDKCV6/4Sn5Nwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJA+wPUH3yFQDLWjSjn21+lnOvYt1E7BiGZVhM9H9+E=;
 b=hltqeVRmoY3THrw5ORJvR/bjyYq3kwO8DwVaPymBerjn2jRtH17sACnIeIVKXTonUvy1y3JQ3+ht4toJhOGtjie65AIWB6YpuMm7Z8W9kEplFStQ8kN5At1k2bxvb+CuUjgiJ96aPva+g+oqSNyu0HtQpEwlUf2cbweRx+Lw28GP8dKPMxZ8VhWi0jhLuHC8ueDh9ZZB+TcU40HMlsDS8hzIBMlM0uoF6xSBSOW5rPRZf55iTs7CNY5t6TyMmQFv4DT1bWXqIUd6IDo5p0AGu/U9SU+6H1sDQ3rawVbzMJMZDPMuGWn8K/panHddTR0Qo8wXos54D5LQrICfjpWd/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4PR01CA0116.jpnprd01.prod.outlook.com (2603:1096:405:379::16)
 by TYZPR06MB6355.apcprd06.prod.outlook.com (2603:1096:400:41d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 09:36:13 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:405:379:cafe::2) by TY4PR01CA0116.outlook.office365.com
 (2603:1096:405:379::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 09:36:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 09:36:12 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 164954350714;
	Wed, 28 Jan 2026 17:36:12 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
Date: Wed, 28 Jan 2026 17:36:10 +0800
Message-ID: <20260128093611.1932770-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260128093611.1932770-1-gary.yang@cixtech.com>
References: <20260128093611.1932770-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|TYZPR06MB6355:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 879d8a9a-011b-4b46-9728-08de5e50ad67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tn/0Y58g09jWxr/6r+1dn/RXVS5250dmlF459ok/Ryn/3uXq7a1OCEQLofc4?=
 =?us-ascii?Q?afcVNzHh0CBDKqs0PpGNw5lMisQXtKPyVwYgUxiZh6TcBiauQV7FBpFJ4CNc?=
 =?us-ascii?Q?O1T75itp7APNNvzOZCTL+T/RVpvuZ7/xOqHLrm/F8TAWvrrT4hRhg7Jm4uah?=
 =?us-ascii?Q?uzZh4VTicEY2qGJ1p4Vb7KP4QjHYBvqvPIHzogEhvkueFQbmDnpE3miQiKim?=
 =?us-ascii?Q?xYskvnFvw46u8gi9GM+aKlYu+fDezd3v55D79ZgWij1u1tKnhw/JnLkdXacL?=
 =?us-ascii?Q?u0MuHPhbBYTKBAw2kVag7c9jfMwCFdQpopZQ6FzCmEF9r9xlQUYLaxQcILfK?=
 =?us-ascii?Q?76lBl7OnjMjfoOP4SIjm/wLTd6D3SfZjJgmP9GQifQBLnQ0QTkTIo0WOBB3G?=
 =?us-ascii?Q?9bREZuqQaTHlasTPlefhwn1HOaqIdG9NB4JSZGVXVTOq1l1Gc34SVmDBIf8n?=
 =?us-ascii?Q?w6MfLJZWTS4rnmrtm/nfG2Y2b+A3w4TQfvWzfZGHxLQNF4UDtYAzhP6B3q8d?=
 =?us-ascii?Q?RS1xLQOF78nKna/CbbjxIKKAgmxVackrCvZHR8MMCiIUtv0G+pJ52kTlLYjF?=
 =?us-ascii?Q?ZnDTrwd2Y1CdgVT511sLs+jG+ojUmV967K3+llsbATEIv+dQxj6qOarkwUEx?=
 =?us-ascii?Q?hPhTVApZ7umYGxRFYmf89FIRk6fi9T9Mv7joJs2K9wYNK65hxD/s5ZjiJuq3?=
 =?us-ascii?Q?p+MYdwVQEEhYdY0jpmiumb6ocm9WuLP4qd5dQq8+ZUiNLeHbjRr/UZNLoEaz?=
 =?us-ascii?Q?eFK/VbSNQhlnmMtfr+8YjwgwnvfWaz9oWPVxRUlg7UdJXoc1dlOoq6ZUkt1R?=
 =?us-ascii?Q?tLvsUmbQH2F7jeFLWDo5ifNWo7gQ9pRlyIHJe15uHO/vcCR7VlLG1PnqIqA4?=
 =?us-ascii?Q?0AALkWljB/vEdYTgTxlER7SaDGpS8a8W81r0k9ALYeqBqwxqMDC3CYc63lQB?=
 =?us-ascii?Q?O9S0OMEQU/SP+DUqVqcW8zIA3nFtx0Cb2Z6AW62Xeeu9FwaI19nF8Wz3IsJf?=
 =?us-ascii?Q?llFfdIbZxHubRm5i/9zNLLwfo2LqIbbZjlNnggRuM4mPFhZa4DSQiUDLx6EG?=
 =?us-ascii?Q?whzfDmirM+D7WELpcgMjrm7u68IMEiSzoVX60/ZqY9oPLhzxQrl1VBJs15ve?=
 =?us-ascii?Q?rDUU8S97nWu3Nrv0byVM5xRK85URXBObhMPmmslne+BzsZy+0c4Qq+Ns7+5/?=
 =?us-ascii?Q?KWcxBV8X690TT+3nFjqyuWfSEKAtE6JxqfkEUYbfu1+nu21k43vUMvMTnfLR?=
 =?us-ascii?Q?0VigGeNEhIBD5XKfHvcdwgxUO9ZkU9pvHo2HiPuBZw+v4JiB2nEUhHiSmgKl?=
 =?us-ascii?Q?jvJaNhbNuc0/FiRMJSyi5zGalgW347xK5xiQrQIcEP33GNroGMwv5PCVIfQm?=
 =?us-ascii?Q?kJy/a4tG0/gEIV0G78XK31nxFyrizvNJNewDDklueK0dBnL4rK4XBi2VrYof?=
 =?us-ascii?Q?HJenp0lyrDSCNUgf6ZSvoeaV9hdkNrqcyVSBmE5FYZP5pFy7OEWWZG+2OLJu?=
 =?us-ascii?Q?7oPjTt3f072d7vjetWMyX7uPSIxgQ+P0evFE7fdMoQDt0hW3lM27MOzgAvhU?=
 =?us-ascii?Q?LnWif78Xx9d1kgelDuYequrEuUjmxQ2C//Lkj5GpnhQJJ2sddUDzI7zbpHUp?=
 =?us-ascii?Q?wI2OcY98K1HfzbeFZdHnEXdMg8ZR7BPFHyBGKim9cjJyFPVscTYAIM98rd6o?=
 =?us-ascii?Q?+S4GEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 09:36:12.9455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 879d8a9a-011b-4b46-9728-08de5e50ad67
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015100_203968_B425B46E 
X-CRM114-Status: GOOD (  17.05  )
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

There are two reset controllers on Cix Sky1 Soc.
One is located in S0 domain, and the other is located
in S0 and S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
Link: https://lore.kernel.org/r/20251124063235.952136-3-gary.yang@cixtech.com
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 drivers/reset/Kconfig      |   7 +
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-sky1.c | 376 +++++++++++++++++++++++++++++++++++++
 3 files changed, 384 insertions(+)
 create mode 100644 drivers/reset/reset-sky1.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..24bf60c4e640 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -291,6 +291,13 @@ config RESET_SIMPLE
 	   - SiFive FU740 SoCs
 	   - Sophgo SoCs
 
+config RESET_SKY1
+	bool "Cix Sky1 reset controller"
+	depends on HAS_IOMEM
+	depends on ARCH_CIX || COMPILE_TEST
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
index 000000000000..92e34b48f041
--- /dev/null
+++ b/drivers/reset/reset-sky1.c
@@ -0,0 +1,376 @@
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
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/reset/cix,sky1-rst.h>
+#include <dt-bindings/reset/cix,sky1-rst-fch.h>
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
+	unsigned int value = assert ? 0 : sky1src->signals[id].bit;
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
+static const struct sky1_src_variant variant_sky1 = {
+	.signals = sky1_src_signals,
+	.signals_num = ARRAY_SIZE(sky1_src_signals),
+};
+
+static const struct sky1_src_variant variant_sky1_fch = {
+	.signals = sky1_src_fch_signals,
+	.signals_num = ARRAY_SIZE(sky1_src_fch_signals),
+};
+
+static const struct reset_control_ops sky1_src_ops = {
+	.reset    = sky1_reset,
+	.assert   = sky1_reset_assert,
+	.deassert = sky1_reset_deassert,
+	.status   = sky1_reset_status
+};
+
+static const struct regmap_config sky1_src_config[] = {
+	{
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.name = "src",
+	},
+};
+
+static int sky1_reset_probe(struct platform_device *pdev)
+{
+	struct sky1_src *sky1src;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct sky1_src_variant *variant = of_device_get_match_data(dev);
+
+	sky1src = devm_kzalloc(dev, sizeof(*sky1src), GFP_KERNEL);
+	if (!sky1src)
+		return -ENOMEM;
+
+	sky1src->regmap = device_node_to_regmap(np->parent);
+	if (IS_ERR(sky1src->regmap)) {
+		dev_err(dev, "Unable to get sky1-src regmap");
+		return PTR_ERR(sky1src->regmap);
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
+static const struct of_device_id sky1_reset_dt_ids[] = {
+	{ .compatible = "cix,sky1-rst", .data = &variant_sky1 },
+	{ .compatible = "cix,sky1-rst-fch", .data = &variant_sky1_fch },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, sky1_reset_dt_ids);
+
+static struct platform_driver sky1_reset_driver = {
+	.probe	= sky1_reset_probe,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= sky1_reset_dt_ids,
+	},
+};
+module_platform_driver(sky1_reset_driver)
+
+MODULE_AUTHOR("Jerry Zhu <jerry.zhu@cixtech.com>");
+MODULE_DESCRIPTION("Cix Sky1 reset driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0


