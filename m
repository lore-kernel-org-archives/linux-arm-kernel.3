Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77463E7C712
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxKnc2kT3w6oBw5LmiLzE5Ycd7uKryKJ8fT5+RyTzXQ=; b=40wU/YARmmTf+W5TAv9VOHBTlu
	S+fMtJ5HoSSAXFTELt78CoccdFIQArLH+FPcfDOa1pxfXEmhg7nwn3c7wqSo7jOV5g1XNx0RF0iSk
	FkxKrzi+d/BNdHtZMwjOo4Mh99SLRVhGrUGP+gwiPpGM/OmJM2N5wmYmHoCryshKfE6GCHvrlm55f
	Gembd6cmlfE9BvooGKhtKrJGRfxjKNwVLtu6jb3LuaWDNeSybZN2OQypcKE/ei78piDv+cfYlOAak
	cI+aOSJ2EqIdJ2Wz0DRqqZ/cTDzddGmSI3d7mt1svAwczpubm0/wOyFbU8MA1zaLcUhBV5cm/7z7r
	IujnYbeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5sj-00000005tqI-2Ild;
	Tue, 03 Feb 2026 02:11:09 +0000
Received: from mail-koreacentralazon11023085.outbound.protection.outlook.com ([40.107.44.85] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5sf-00000005to8-4AGd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 02:11:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEkTdTCxv5dc77tPV+hZrz4ZtvTQWxIgrYfBaEEO/7XSeZIRE/P+6f4jYX3I8O+VcZCx/qRPMEUi7yzezb9FR39KXIPY4UcfFL7dV8lHlE2/j3wBPk+R5jGpU7S88MIl1AnC8c+6KWz5pHQLvkv8JUE59tgTXZr5rgwunNB28EYAXCXbvmCs/3UH8UNKXzYFCqxSOag5IhXbjpSDieUdSAiAqmbtpCY/AJMPd2pyMbSwrS364H9KnlXvTNjYH9IyD3BMKqcN0tYEhO8zVuf3RssbXVaAYJtaMNtmhKnok7cSr/mDgTo0Ceqk9Pq9ydKKB4Opu5BU7dCjlRac6Udx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxKnc2kT3w6oBw5LmiLzE5Ycd7uKryKJ8fT5+RyTzXQ=;
 b=Yle9glKbI/Qjz3wDNILovr7ksL/c5ZkxX0xd1xYUshocKaRw9SNIiFaUv/it/CMmB4/LfSi/CZBDpC1tqXB/2u5j1qTmfHw++L4xkVOUgbAgb34wRx43TU6u3B3qJJkX0d0/LcqcYOAnlttenrlWZRgK+nJnUyOoQra54bUXwqB92Q82XM0eLWc0N3Ag7ewkKlhNGmkagYVupjuMgTB+3vES+G5DiwbGiwiylKnjRZbHknW+4i2hLZT0JIYIEWn9wD2VJ9DAfm0HUpTc/hhm7BfyHEwnZtfxlcvrBEvWJCBC/6sRYX4piqyJfW3Y/gRtlxik7b3hk/c9chJ/BDLZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0031.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2b2::9)
 by SEYPR06MB5325.apcprd06.prod.outlook.com (2603:1096:101:80::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:10:55 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:405:2b2:cafe::44) by TY4P286CA0031.outlook.office365.com
 (2603:1096:405:2b2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 02:10:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 02:10:54 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E6EC34079A20;
	Tue,  3 Feb 2026 10:10:53 +0800 (CST)
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
Subject: [PATCH v6 2/3] reset: add Sky1 soc reset support
Date: Tue,  3 Feb 2026 10:10:52 +0800
Message-ID: <20260203021053.4073258-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203021053.4073258-1-gary.yang@cixtech.com>
References: <20260203021053.4073258-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|SEYPR06MB5325:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5f72e4bf-407a-49b0-2335-08de62c9768f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EJanLX69GN3JOnPWqC2JlYmG0gEmjOJVDbocC1Aaal3MaRcnOjBCfkIGjrC3?=
 =?us-ascii?Q?MgAHUL4CcNGQVdg1E2UFEMmURoTkLk6g4X6U8EvLNKpYUGRZeRji26vQsFby?=
 =?us-ascii?Q?Mgmv89TdDQljhF8fBAubR4lLwEfAZKTI7kaDpoSudU+gDYmUIJQhBN43wrdR?=
 =?us-ascii?Q?P4O3dHnr4gPiUzelHb2cKpM83t0769fjynd0azDQ8Kw5kIczK4uh58zUs7y4?=
 =?us-ascii?Q?9z5UWQ9eP1H3k2dWV9f5AdwS5dcrseTRwYj8pT9F49mC9ShEGgexelZiYReV?=
 =?us-ascii?Q?2M/xGdXBbQl5tMbfHBpBsHJU6LvAvU6z58Ro6vQBKB8WNLjvDLEXesV8/6NE?=
 =?us-ascii?Q?4Ftbf8K4vxWuvec4wcQSiH7M39k48OnYL2tWdJG+LMGCm9ytbxMnVe0l2olf?=
 =?us-ascii?Q?R9dhKnhEsan9Pm8DDg+xL/HHEU1VEKMs9rM4Td1oTntAbXUIRf6gomI3yOgT?=
 =?us-ascii?Q?+ApS5/nKUKHuwxhs09yIChUGSQ8MdIG0dJNaSkoWPrDKBYCza/SdEimLeq/K?=
 =?us-ascii?Q?AODCzL/2GB1YMZeDpdFdgq77s+sMpVOgdSdWzKPgjEyE8zF6+mOxKs3o1fh0?=
 =?us-ascii?Q?8d/PECVTVLR6YFenKwwdownVvTYXYv5qxbL+rcoSk10Rxez7k6YOiQScj17k?=
 =?us-ascii?Q?y7TtSqFsXOCp7B9BzzWpcwidZHRKlCtRvxLpcWfG9p66WvGhhoUmJ8xjYSh4?=
 =?us-ascii?Q?i/CDECcsngqyVzk+lzQV4H441WjiIgkkPx8wr3cgTNOnKiuI4cKAPrnEhIAv?=
 =?us-ascii?Q?15S7hMGprEXUB4/9uVvalzRw8uHpIXuWhl/nXuSsy2rV7yH26C5U0wZSmQFi?=
 =?us-ascii?Q?hn34uOMFCH4DTfq2uJcItOuckRYEFEP5L97Q872QU1kXakSmhO4+BaUhzoap?=
 =?us-ascii?Q?TmgiAgYwAVdY+Qn44SOkfbUXTLWXCtb0Y1opeUTszTOw2VWxevzGmT319ATz?=
 =?us-ascii?Q?LxklmRwtMC2JpyDSdSeZCLQcXFrSSDMD+SmrgJoLVyOwHzEQkgWEZU0oUx31?=
 =?us-ascii?Q?QUDrVHAXSpmzYvUTC/xpyywTlbR2j4z8BXIjaE6nH8jDdqjhIZGPjWWGHoTO?=
 =?us-ascii?Q?+mPoGGuwIFLGcLwTN1+YzjuZcqIvrgDrCwZfUmsXMCAkdbhM9b3exuCDVXEE?=
 =?us-ascii?Q?/QQ1FPXdMBsl9wJ4ctgwT1bm4LwEbHLpcG98+ujT/WrGTXgR0qYTXNK+JrFZ?=
 =?us-ascii?Q?ky4ZUFAc4bv3lnXqZJ2fPXHB/jirrhyxq+ewbTHdz1zHNNM8rVvGlpZVpIQS?=
 =?us-ascii?Q?FnZ7q1o2tg42Nqbj7VhD1rawVr3kLMqMO+UNaBeg+CSKgY3s7bknuZkbNeEV?=
 =?us-ascii?Q?taUX12xfQkLQ4mZdnE7uV9neXtti7MSCfh79CyvZGAs/JDam2m/p1PuOzMFZ?=
 =?us-ascii?Q?LMuBzaSMlZX1Tm38AbwV10H1ZGRqzLGzgNhzpJxgnaV/m60uxeja8nz9dfqM?=
 =?us-ascii?Q?kMTrOQfUrXTlGRcSFoLjDP0E6o8COS6X4LH2T5kVUzQEjDyS7UzgVJUTGXSp?=
 =?us-ascii?Q?0x2YJXzrFnVP92TkE9kY974RYWv3X377tIptYdwvTk3/Qjz59/+oic1stb0H?=
 =?us-ascii?Q?0jDwfoJ0ExMpUvnOOUWP90/B9i1t1zjMOoRIxZneFRwArqOGn8K5XAMy40s+?=
 =?us-ascii?Q?5TMCdjNbNNQAquh2nCkyEiYQyRn4J8Ne7yiaMcuEZJOFrtMPBNl2+p/hL6KD?=
 =?us-ascii?Q?xAjOkQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zn5ahzgBggBEpqexYFkOTzhuwmNGwe8EJpAcH+O6iRfTKuLrNRFr8WUjBoiBjFz6wxueE6hvYJKokLFyiXb+e/8jgwgNAv67CxAxrBuEmyN/QAwpEVgImx7ZGisHS8jRr32vHxpdNnZMEkS6jwuHrzHOSMwVJaY7V8ffdwRMgCuEA0opCJzp72+yoU0kT3HWtDhtvVnK04u2+f2j6YWuj9SSWPJn/R4jKpJD4s0z1cX++TSwxEgxoFRIkIVh/0EPA8+nne4pOYAhOE49qD0ZdIRIx+sQOU2YeE5m2B+VxPkEWu7M8fSOFtcstX8rl0MyxP6la5E3bwdDN4XKmRSeJ55Xa/I1GLtA/gs9VO4r/JdOzKKS9oWuqBfcjUdUqk+C/jyolTIT//cReX2XA2T+ieOsOjwWvoev2OCzyp8aRqFu1C0sZo95c6KYDkn8crot
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 02:10:54.7846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f72e4bf-407a-49b0-2335-08de62c9768f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_181106_193569_D017BAA9 
X-CRM114-Status: GOOD (  20.36  )
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
domain, and the other is located in S0 and S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 drivers/reset/Kconfig                 |   7 +
 drivers/reset/Makefile                |   1 +
 drivers/reset/reset-sky1-base.c       | 125 ++++++++++++++++
 drivers/reset/reset-sky1-fch.c        |  78 ++++++++++
 drivers/reset/reset-sky1.c            | 204 ++++++++++++++++++++++++++
 drivers/soc/Kconfig                   |   1 +
 drivers/soc/Makefile                  |   1 +
 drivers/soc/cix/Kconfig               |  11 ++
 drivers/soc/cix/Makefile              |   1 +
 drivers/soc/cix/sky1-system-control.c |  47 ++++++
 include/linux/reset/sky1.h            |  18 +++
 11 files changed, 494 insertions(+)
 create mode 100644 drivers/reset/reset-sky1-base.c
 create mode 100644 drivers/reset/reset-sky1-fch.c
 create mode 100644 drivers/reset/reset-sky1.c
 create mode 100644 drivers/soc/cix/Kconfig
 create mode 100644 drivers/soc/cix/Makefile
 create mode 100644 drivers/soc/cix/sky1-system-control.c
 create mode 100644 include/linux/reset/sky1.h

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
index 9c3e484dfd81..6a43ed23da14 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
+obj-$(CONFIG_RESET_SKY1) += reset-sky1-base.o reset-sky1.o reset-sky1-fch.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
diff --git a/drivers/reset/reset-sky1-base.c b/drivers/reset/reset-sky1-base.c
new file mode 100644
index 000000000000..3e8301a35bc2
--- /dev/null
+++ b/drivers/reset/reset-sky1-base.c
@@ -0,0 +1,125 @@
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
+static const struct reset_control_ops sky1_src_ops = {
+	.reset    = sky1_reset,
+	.assert   = sky1_reset_assert,
+	.deassert = sky1_reset_deassert,
+	.status   = sky1_reset_status
+};
+
+int sky1_reset_common_probe(struct platform_device *pdev,
+			const struct sky1_src_variant *variant)
+{
+	struct sky1_src *sky1src;
+	struct device *dev = &pdev->dev;
+
+	sky1src = devm_kzalloc(dev, sizeof(*sky1src), GFP_KERNEL);
+	if (!sky1src)
+		return -ENOMEM;
+
+	sky1src->regmap = device_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(sky1src->regmap)) {
+		dev_err(dev, "Unable to get sky1-src regmap");
+		return PTR_ERR(sky1src->regmap);
+	}
+
+	sky1src->signals = variant->signals;
+	sky1src->rcdev.owner     = THIS_MODULE;
+	sky1src->rcdev.nr_resets = variant->signals_num;
+	sky1src->rcdev.ops       = &sky1_src_ops;
+	sky1src->rcdev.of_node   = dev->parent->of_node;
+	sky1src->rcdev.dev       = dev;
+
+	return devm_reset_controller_register(dev, &sky1src->rcdev);
+}
+
+MODULE_AUTHOR("Jerry Zhu <jerry.zhu@cixtech.com>");
+MODULE_DESCRIPTION("Cix Sky1 reset driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/reset/reset-sky1-fch.c b/drivers/reset/reset-sky1-fch.c
new file mode 100644
index 000000000000..6a3870c2fcf9
--- /dev/null
+++ b/drivers/reset/reset-sky1-fch.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *
+ * CIX System Reset Controller (SRC) driver
+ *
+ * Author: Jerry Zhu <jerry.zhu@cixtech.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset/sky1.h>
+
+#include <dt-bindings/reset/cix,sky1-rst-fch.h>
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
+static int sky1_reset_fch_probe(struct platform_device *pdev)
+{
+	return sky1_reset_common_probe(pdev, &variant_sky1_fch);
+}
+
+static struct platform_driver sky1_reset_driver = {
+	.probe	= sky1_reset_fch_probe,
+	.driver = {
+		.name		= "cix,sky1-rst-fch",
+	},
+};
+module_platform_driver(sky1_reset_driver)
+
+MODULE_AUTHOR("Jerry Zhu <jerry.zhu@cixtech.com>");
+MODULE_DESCRIPTION("Cix Sky1 reset driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/reset/reset-sky1.c b/drivers/reset/reset-sky1.c
new file mode 100644
index 000000000000..9b7ba238ba64
--- /dev/null
+++ b/drivers/reset/reset-sky1.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *
+ * CIX System Reset Controller (SRC) driver
+ *
+ * Author: Jerry Zhu <jerry.zhu@cixtech.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset/sky1.h>
+
+#include <dt-bindings/reset/cix,sky1-rst.h>
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
+static int sky1_reset_probe(struct platform_device *pdev)
+{
+	return sky1_reset_common_probe(pdev, &variant_sky1);
+}
+
+static struct platform_driver sky1_reset_driver = {
+	.probe	= sky1_reset_probe,
+	.driver = {
+		.name		= "cix,sky1-rst",
+	},
+};
+module_platform_driver(sky1_reset_driver)
+
+MODULE_AUTHOR("Jerry Zhu <jerry.zhu@cixtech.com>");
+MODULE_DESCRIPTION("Cix Sky1 reset driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb80..150352c50be9 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -8,6 +8,7 @@ source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
 source "drivers/soc/canaan/Kconfig"
 source "drivers/soc/cirrus/Kconfig"
+source "drivers/soc/cix/Kconfig"
 source "drivers/soc/fsl/Kconfig"
 source "drivers/soc/fujitsu/Kconfig"
 source "drivers/soc/hisilicon/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb..e36645abf20a 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_ARCH_AT91)		+= atmel/
 obj-y				+= bcm/
 obj-$(CONFIG_ARCH_CANAAN)	+= canaan/
 obj-$(CONFIG_EP93XX_SOC)        += cirrus/
+obj-$(CONFIG_ARCH_CIX)		+= cix/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
diff --git a/drivers/soc/cix/Kconfig b/drivers/soc/cix/Kconfig
new file mode 100644
index 000000000000..3487499d4b2a
--- /dev/null
+++ b/drivers/soc/cix/Kconfig
@@ -0,0 +1,11 @@
+config CIX_SOC_SYSCONS
+	bool "Cix SoC syscon drivers"
+	default y
+	depends on ARCH_CIX
+	select MFD_CORE
+	help
+	  The drivers add support for the syscons on Cix SoC. Without
+	  the drivers core parts of the kernel such as resets will not
+	  function correctly.
+
+	  If unsure, and on a Cix SoC, say y.
diff --git a/drivers/soc/cix/Makefile b/drivers/soc/cix/Makefile
new file mode 100644
index 000000000000..e1252cf836ba
--- /dev/null
+++ b/drivers/soc/cix/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_CIX_SOC_SYSCONS)	+= sky1-system-control.o
diff --git a/drivers/soc/cix/sky1-system-control.c b/drivers/soc/cix/sky1-system-control.c
new file mode 100644
index 000000000000..8bed84a715b6
--- /dev/null
+++ b/drivers/soc/cix/sky1-system-control.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/array_size.h>
+#include <linux/of.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+static const struct mfd_cell sky1_system_control_devs[] = {
+	MFD_CELL_NAME("cix,sky1-rst-fch"),
+};
+
+static const struct mfd_cell sky1_s5_system_control_devs[] = {
+	MFD_CELL_NAME("cix,sky1-rst"),
+};
+
+static int sky1_system_control_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct mfd_cell *cell =
+			(struct mfd_cell *)of_device_get_match_data(dev);
+
+	return mfd_add_devices(dev, PLATFORM_DEVID_NONE, cell, 1, NULL, 0, NULL);
+}
+
+static const struct of_device_id sky1_system_control_of_match[] = {
+	{ .compatible = "cix,sky1-system-control",
+	  .data = sky1_system_control_devs},
+	{ .compatible = "cix,sky1-s5-system-control",
+	  .data = sky1_s5_system_control_devs},
+	{},
+};
+MODULE_DEVICE_TABLE(of, sky1_system_control_of_match);
+
+static struct platform_driver sky1_system_control_driver = {
+	.driver = {
+		.name = "sky1-system-control",
+		.of_match_table = sky1_system_control_of_match,
+	},
+	.probe = sky1_system_control_probe,
+};
+module_platform_driver(sky1_system_control_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gary Yang <gary.yang@cixtech.com>");
+MODULE_DESCRIPTION("Cix SoC system control driver");
diff --git a/include/linux/reset/sky1.h b/include/linux/reset/sky1.h
new file mode 100644
index 000000000000..2939071e510c
--- /dev/null
+++ b/include/linux/reset/sky1.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_RESET_SKY1_H__
+#define __LINUX_RESET_SKY1_H__
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
+int sky1_reset_common_probe(struct platform_device *pdev,
+			    const struct sky1_src_variant *variant);
+
+#endif /* __LINUX_RESET_SKY1_H__ */
-- 
2.49.0


