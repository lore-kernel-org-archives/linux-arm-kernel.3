Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD44FEDA1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ON9zurSJSI4QQT1BMl1VRtFngSU5U/rUteO/tCC7Fn0=; b=HlgtFF1JKA8BVQ7AgrgtxtUB4c
	KIEZPY1N8E7un76QXU2sYsiTo9WW3vvL87lEH4r6miol3NkqtiFsVNlU938fcLkcZLneWVjkrDBCG
	OKLkDnGYZIVfFKFWnEsju/4osTU+8CJXEgLzfie5MXMU2yaYD24Qq2u8RFxhfgV1s5Mf49J+xwwZi
	6j2dj0RTLX4IbzKtDW4mqwtxZiX+12f0K5+iJAQKo6wxzxtQYhDkfUVgxcMFy8KngtGkg0B0T2qxQ
	RQZXW/PtjDYp3UngPFwflO+RJWc0ytkyC9SodKovMmnBYZVPzRd+vED9sQa1OXaORnMHsVFT2Z+og
	ko4f/f4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2aSo-000000079SZ-3Nci;
	Tue, 17 Mar 2026 19:52:26 +0000
Received: from mail-westcentralusazon11023114.outbound.protection.outlook.com ([40.93.201.114] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2aSj-000000079MY-24Wf;
	Tue, 17 Mar 2026 19:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIde6rD2Kgo7ZalgnqA74ed14gMtMdO9e5XTL21D4rsKaNWO4Sf1z04IhLqs9uoK6zLyg08k0wLXpog9YsOSjF7rEonRtf13g1mZuxM3BA5DNVk3Ocmb99RmeTuBAuv4PEOMXUzoza+h9oVBLa1rdm+swhchZwCq7FAdnzqwHGMXKv+dBOlZ29zc++RdZdfocMaX7hIU8tXBrFqfZuCCaH1VB7j30C8iK91JT90l9ziGiOh5C1Q3pbw0u23E4WSNMCZ+ptAft8UfOBmJJy2wPi1Bqq+dGm0lxqynhtH8WXgIKXrUOZED/I34xHGt3r/2JEP4yRMIyM/rdPfBWMF5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON9zurSJSI4QQT1BMl1VRtFngSU5U/rUteO/tCC7Fn0=;
 b=L8/mWx8Kw8g5y9Mf+kom6guvwAURmSJPLs/3mC690SBXDxZmvnWGskkz0VkF5g1kWjMNDreHdyoQP5OupGATqOkuygGPgRo9IyNspt3q/bcFcww6u22kNAadapPznSun576hn+LVXc3qnYY2BCy7IIRj7e9zEdvyyLpl+v7dL1WRjUmQqpA9Aba7W7jfldMpVN/K7yk9dUGVhMVmozMtwuH5EqQOdizkLPQV4oBivQ9HdmoouuSI5skKKoq+bCCYZ60J0H+p5hpI8Uatxupxu6zWMPFZMgm1BJ59PMBxSj49U7LHihhFf0ECTAfrqEgEcc8sVW/w2SOZ7IPkyLhFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON9zurSJSI4QQT1BMl1VRtFngSU5U/rUteO/tCC7Fn0=;
 b=pmiR/xx3z4M7UcC6wU/Z0ztgz076hZyE/haGJh26jI1EnAfYQgpgD+4FynCa7lG/fWs8Z382WAPj1Ah5If9jPE3jHn9VwYl0WtOIACi9kvVHtxQ10LxNvGDupYP8l9WfRNEner1BttNfmDmbDiNW3IZJpszYh8tC1Mq9nm13YBz0sZmRRbx4KZKYNrbO7nOmethQOLB+fqjVWxkMpDostZe5ocdQgLkEhh6o50R2kMforcoQA4lEf0Io1WPaBTZZzKpwxpNyKrVVpW9zs26jjR1Xg0mQpj51RigHlQRrRwf5ntaqoGHX8+lhQ+g1yAGmS4V1em2z33eZzVCoV0/qHA==
Received: from BN9PR03CA0056.namprd03.prod.outlook.com (2603:10b6:408:fb::31)
 by IA3PR18MB6310.namprd18.prod.outlook.com (2603:10b6:208:529::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 19:52:12 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::db) by BN9PR03CA0056.outlook.office365.com
 (2603:10b6:408:fb::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 19:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.0
 via Frontend Transport; Tue, 17 Mar 2026 19:52:12 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 762454186B5A;
	Tue, 17 Mar 2026 12:52:10 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Tue, 17 Mar 2026 12:52:09 -0700
Subject: [PATCH v3 2/4] phy: axiado: add Axiado eMMC PHY driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-2-fbf790f3f711@axiado.com>
References: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
In-Reply-To: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9023; i=twei@axiado.com;
 h=from:subject:message-id; bh=YBprfDKFNQn6DMWhRJHAypcI9/qyZHy+Jg3oeuFZQSY=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpubDqfUZdlxF3buCvOd8JJZGUngOI2iqQXEO03
 9mIEQOiFs2JAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCabmw6gAKCRB4EDBdxFrx
 16SPDACcZxXbTanOGISDFQq8ybC1A4PVm8+uNyOYj+yhCIatypGzvxrnLvajOPe8XEUFzZEeXVd
 29QBT1VhSiL4GkUG8WfXgGmrFLfc4FJtOKb21oQfWYczR5Ih1Ck9F7vlhNgopHdR1iIm0WZsHFS
 rTWlUf4wS43md8Bera/aVamxATKAE9uIRkU6XsD9j4iAQEBt2Z4Tb7YL8076a2xt6zXAe/J4cJI
 55mvPTbVjXEPSIqwMFiOa6TuFQ7NtPQL3MDgwd6bjSpQ4B0nmMcomfVPYbgXTNOaHpiNq8a2cuC
 URvxNevXsn2P1ufk7X16YeIdbz1yhPOsFbK8tMJSCsbhIX6952oyIi/ugFQ+7cBYAQLw7CCkbzN
 AP1DcFlkop8KZnScFD9hY6ueWFnh4ZHiDzGqqTT8XxxWcHxiYqtauQq+a5Y4xY/V01rDXfXkDch
 G0qH+VF1WD2zIyPzC13NrChUl711SguH2GGv2ID0LzqhWy3oJ5jfMbgWSIvO1M7YSAH+4=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|IA3PR18MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f70436-86b3-4239-f0c8-08de845eae95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|42112799006|7416014|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 0e10hXMsPd4+shsKyWSIp7vs7BHrgFV8C+BwKclm69oVk0kzdKiHQuNDEt/7RaaEIIgyoqMbX9GpwNSEnvhZcv5Gp7e0Kw72e63/hrY2rCgoAyUZGGDZ8o/kwOKhur1YOEqMHzOYHBhQPMC3eIOL0MNc6dTj53whm8yFr93RmROVljduayBM2BzYFNENPiVrMaZCNaSaLre6IQImLQgLm/qJZ9CyniIYbWxeQACIFMvGKtHqU2qTyBsUY8Q2RSg3x0UOSAXYPqobSU4JfM5Gg1FW7iTXnph9yJephitUl4nixBzcihCc/DGTPbhyQaO84p7I93qM+iZ1b7O6DPbe8lkS+s5JyCJso3AkMMFuATmMOTxzYdbX/fQT2kpHLxhvt3Khl69mJuPBjpEYwy3Z7p7ZPJdlj+Cy8jhs1VmlYbTNnHj5MNZgV5z+B3AyeIno/FZP4x+9/CBjE7OE2P3BXPW2oF2AwvKebFPodl4sIOPhUeFPOJ8/XnNr74WQBVphuFBsfIzycM9/kBbr47qiZ8O8fDtIh2LM5GW/kunk7GmsHzFNHj4cTfK60D+aX6o/mWR0Z06di4BXNVvOyAz+5N0tC20pMTliR+W5qtjiJtm44Qki4eF2mzcb1rbn5HqprWoC16sR2Hlcs2d2D8OCWZZ7h+4zGbDIzsSq0E81jSwI2nGz5y6h6CdP69//9mdP0V3Gs78mGi34CA1w66VSLNinL/pcC48gFam/d8nDnXMCWYh7aOeMzgKFr72zwbWv09qbjI7+umE9/ephBpIWLw==
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(7416014)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: H52RrLJej0qSrpMPOsNYw2aIfd9d9E79Hw8pXdXwN9Lk+XkmcBwEhVOzCnTAZaaS7HQQFZCgoss085G1BF39bTRae4VHaicb+A4vCDG5D1bP3Jpbf9o/2G9AgCzvKXSYWbrfi6hfXcDkU4XxkuMMa5jWP7pYchj4JAFIgALlTevIP2ELK0WUyYb3vciJyyNdn70No8y4IwGPIK1Jyt9r5y4AVDuEhAZI/6ldvPQ4ya9y8UCR4Ll4AWCJ7BwUEkaeouGS1xbjOHGFg44EgHb6yOCQD4nv+xluh80Pzy7uYwrhAZy1exIcpMGFLxZT6l/Uv7TpatKyziF/zSVwIw88rpb0Oi81m2IZYcc569EPKdqK9T65H0w2t3Wml0n6k0qMMp8aaeoX+EQHcCsNUwKWsdFhxmxAsKHjYMJRbfrUkL23IkYFt2LsWu3fbusOant6
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:52:12.2326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f70436-86b3-4239-f0c8-08de845eae95
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR18MB6310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_125221_643947_4AB3BAFC 
X-CRM114-Status: GOOD (  16.32  )
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

From: SriNavmani A <srinavmani@axiado.com>

It provides the required configurations for Axiado eMMC PHY driver for
HS200 mode.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 drivers/phy/Kconfig                  |   1 +
 drivers/phy/Makefile                 |   1 +
 drivers/phy/axiado/Kconfig           |  11 ++
 drivers/phy/axiado/Makefile          |   1 +
 drivers/phy/axiado/phy-axiado-emmc.c | 217 +++++++++++++++++++++++++++++++++++
 5 files changed, 231 insertions(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 678dd0452f0aa0597773433f04d2a9ba77474d2a..b802274ea45a84bd36d7c0b7fb90e368a5c018b4 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -103,6 +103,7 @@ config PHY_NXP_PTN3222
 
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
+source "drivers/phy/axiado/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/freescale/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..f1b9e4a8673bcde3fdc0fdc06a3deddb5785ced1 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
+					   axiado/	\
 					   broadcom/	\
 					   cadence/	\
 					   freescale/	\
diff --git a/drivers/phy/axiado/Kconfig b/drivers/phy/axiado/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..d159e0345345987c7f48dcd12d3237997735d2b5
--- /dev/null
+++ b/drivers/phy/axiado/Kconfig
@@ -0,0 +1,11 @@
+#
+# PHY drivers for Axiado platforms
+#
+
+config PHY_AX3000_EMMC
+	tristate "Axiado eMMC PHY driver"
+	depends on OF && (ARCH_AXIADO || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  Enables this to support for the AX3000 EMMC PHY driver.
+	  If unsure, say N.
diff --git a/drivers/phy/axiado/Makefile b/drivers/phy/axiado/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..1e2b1ba016092eaffdbd7acbd9cdc8577d79b35c
--- /dev/null
+++ b/drivers/phy/axiado/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_PHY_AX3000_EMMC)		+= phy-axiado-emmc.o
diff --git a/drivers/phy/axiado/phy-axiado-emmc.c b/drivers/phy/axiado/phy-axiado-emmc.c
new file mode 100644
index 0000000000000000000000000000000000000000..e0e2174776ad027df0a10a8c4741b1b4ef9ef40e
--- /dev/null
+++ b/drivers/phy/axiado/phy-axiado-emmc.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Axiado eMMC PHY driver
+ *
+ * Copyright (C) 2017 Arasan Chip Systems Inc.
+ * Copyright (C) 2022-2026 Axiado Corporation (or its affiliates).
+ *
+ * Based on Arasan Driver (sdhci-pci-arasan.c)
+ * sdhci-pci-arasan.c - Driver for Arasan PCI Controller with integrated phy.
+ */
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+/* Arasan eMMC 5.1 - PHY configuration registers */
+#define CAP_REG_IN_S1_MSB		0x04
+#define PHY_CTRL_1			0x38
+#define PHY_CTRL_2			0x3c
+#define PHY_CTRL_3			0x40
+#define STATUS				0x50
+
+#define DLL_ENBL	BIT(26)
+#define RTRIM_EN	BIT(21)
+#define PDB_ENBL	BIT(23)
+#define RETB_ENBL	BIT(1)
+
+#define REN_STRB	BIT(27)
+#define REN_CMD_EN	GENMASK(20, 12)
+
+/* Pull-UP Enable on CMD Line */
+#define PU_CMD_EN	GENMASK(11, 3)
+
+/* Selection value for the optimum delay from 1-32 output tap lines */
+#define OTAP_DLY	0x02
+/* DLL charge pump current trim default [1000] */
+#define DLL_TRM_ICP	0x08
+/* Select the frequency range of DLL Operation */
+#define FRQ_SEL	0x01
+
+#define OTAP_SEL_MASK		GENMASK(10, 7)
+#define DLL_TRM_MASK		GENMASK(25, 22)
+#define DLL_FRQSEL_MASK		GENMASK(27, 25)
+
+#define OTAP_SEL(x)		(FIELD_PREP(OTAP_SEL_MASK, x) | OTAPDLY_EN)
+#define DLL_TRM(x)		(FIELD_PREP(DLL_TRM_MASK, x) | DLL_ENBL)
+#define DLL_FRQSEL(x)	FIELD_PREP(DLL_FRQSEL_MASK, x)
+
+#define OTAPDLY_EN	BIT(11)
+
+#define SEL_DLY_RXCLK	BIT(18)
+#define SEL_DLY_TXCLK	BIT(19)
+
+#define CALDONE_MASK	0x40
+#define DLL_RDY_MASK	0x1
+#define MAX_CLK_BUF0	BIT(20)
+#define MAX_CLK_BUF1	BIT(21)
+#define MAX_CLK_BUF2	BIT(22)
+
+#define CLK_MULTIPLIER	0xc008e
+#define POLL_TIMEOUT_MS	3000
+#define POLL_DELAY_US	100
+
+struct axiado_emmc_phy {
+	void __iomem *reg_base;
+	struct device *dev;
+};
+
+static int axiado_emmc_phy_init(struct phy *phy)
+{
+	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
+	struct device *dev = ax_phy->dev;
+	u32 val;
+	int ret;
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | RETB_ENBL | RTRIM_EN, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
+
+	ret = readl_poll_timeout(ax_phy->reg_base + STATUS, val,
+				 val & CALDONE_MASK, POLL_DELAY_US,
+				 POLL_TIMEOUT_MS * 1000);
+	if (ret) {
+		dev_err(dev, "PHY calibration timeout\n");
+		return ret;
+	}
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | REN_CMD_EN | PU_CMD_EN, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_2);
+	writel(val | REN_STRB, ax_phy->reg_base + PHY_CTRL_2);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | MAX_CLK_BUF0 | MAX_CLK_BUF1 | MAX_CLK_BUF2,
+	       ax_phy->reg_base + PHY_CTRL_3);
+
+	writel(CLK_MULTIPLIER, ax_phy->reg_base + CAP_REG_IN_S1_MSB);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | SEL_DLY_RXCLK | SEL_DLY_TXCLK,
+	       ax_phy->reg_base + PHY_CTRL_3);
+
+	return 0;
+}
+
+static int axiado_emmc_phy_power_on(struct phy *phy)
+{
+	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
+	struct device *dev = ax_phy->dev;
+	u32 val;
+	int ret;
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | RETB_ENBL, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_2);
+	writel(val | OTAP_SEL(OTAP_DLY), ax_phy->reg_base + PHY_CTRL_2);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | DLL_TRM(DLL_TRM_ICP), ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | DLL_FRQSEL(FRQ_SEL), ax_phy->reg_base + PHY_CTRL_3);
+
+	ret = read_poll_timeout(readl, val, val & DLL_RDY_MASK, POLL_DELAY_US,
+				POLL_TIMEOUT_MS * 1000, false,
+				ax_phy->reg_base + STATUS);
+	if (ret) {
+		dev_err(dev, "DLL ready timeout\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int axiado_emmc_phy_power_off(struct phy *phy)
+{
+	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
+	u32 val;
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	val &= ~(DLL_TRM_MASK | DLL_ENBL);
+	writel(val, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	val &= ~(DLL_FRQSEL_MASK | PDB_ENBL);
+	writel(val, ax_phy->reg_base + PHY_CTRL_3);
+
+	return 0;
+}
+
+static const struct phy_ops axiado_emmc_phy_ops = {
+	.init = axiado_emmc_phy_init,
+	.power_on = axiado_emmc_phy_power_on,
+	.power_off = axiado_emmc_phy_power_off,
+	.owner = THIS_MODULE,
+};
+
+static const struct of_device_id axiado_emmc_phy_of_match[] = {
+	{ .compatible = "axiado,ax3000-emmc-phy" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, axiado_emmc_phy_of_match);
+
+static int axiado_emmc_phy_probe(struct platform_device *pdev)
+{
+	struct axiado_emmc_phy *ax_phy;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct phy *generic_phy;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	ax_phy = devm_kzalloc(dev, sizeof(*ax_phy), GFP_KERNEL);
+	if (!ax_phy)
+		return -ENOMEM;
+
+	ax_phy->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ax_phy->reg_base))
+		return PTR_ERR(ax_phy->reg_base);
+
+	ax_phy->dev = dev;
+
+	generic_phy = devm_phy_create(dev, dev->of_node, &axiado_emmc_phy_ops);
+	if (IS_ERR(generic_phy))
+		return dev_err_probe(dev, PTR_ERR(generic_phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(generic_phy, ax_phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver axiado_emmc_phy_driver = {
+	.probe = axiado_emmc_phy_probe,
+	.driver = {
+		.name = "axiado-emmc-phy",
+		.of_match_table = axiado_emmc_phy_of_match,
+	},
+};
+module_platform_driver(axiado_emmc_phy_driver);
+
+MODULE_DESCRIPTION("AX3000 eMMC PHY Driver");
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_LICENSE("GPL");

-- 
2.34.1


