Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DEFC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z+I0kNEG7+cPSApd/MI+RCWglu1hfaTCwGjTOC8b+uU=; b=1Axp749r9CbV0r1OvOllz5M+sE
	l66O3uIOMToTI2GKPcU4M0V695WFI6DEFUtsWARkB4ojJuCS/+9tx5ANg+5ufLOzV43i11wKnUSoF
	OM053/AP2T6xvbIjFwSgsQjkpSlQX4ifSFcOYMK2mId1xgFQ1I2O3qCWJcVCh9sp77nz2yMD0ON9o
	cbwi62Pryi6Zi5+KfPjhe1U3Qha26+4bUk/EqbTMQ1BMSrTfMkW36lVhTKsAcTyIRon+WG4XoX+f2
	Lhlma6pDxXQaGmGoFMoTjW0WBprcVYI2EEsm30QNF9pw64nvGbxIfI8XUHpiixS9CYj0Edy685TTa
	w3V9Z0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0DnW-00000007tYr-2Qev;
	Thu, 03 Apr 2025 06:11:30 +0000
Received: from mail-bn1nam02on20607.outbound.protection.outlook.com ([2a01:111:f403:2407::607] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Dlj-00000007tLC-1BOv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:09:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrFU7IddJI698HKJyxTuOAUYgRWaCw7ijvAf4wswEih2yI362w+fNoNRZCKNEXLR/JXb8DJyqlFRs4nQRf3a4ethXuUDbuu2f2Zg5DG+c6/oz0aq9Cvt1wr7bZrB8uft9oZqw5vEAAuXJPuNukRc5AKCGctn1tTMMCLRkl8a2u7rp71s2nqFVwk6spsq5EYmfNceXoXEI2yy9zhdha8Y3IKUy3KONZyt7ubctfsUzsPIyTNygC1CaozX4C4oik8OjKV7Kx1nb93QQQZaT5erw/Sc197GLQWOLJnF/DQMJE7kHBwSpgVHCQ2kCDckWecdUDBNosIKc36nlWz0RkDoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+I0kNEG7+cPSApd/MI+RCWglu1hfaTCwGjTOC8b+uU=;
 b=pVD+pW+5H69sQTjgbuUT8dTAZ+K3oAkzzj36qeqn8aZFJxq4eDJiqYFOZQWJzFEAWLeW5RCi+KLu2CZX7LpPnktLPz0eijSz8IhtHSgpUj0TiZsheqiin77ijrWgqfLBq9IMptlU4HnmuhvCojKNbKYNmngmQIt+c6H4AbxlmwXX+Nq+Hxtd1NapV0k2782mjusDUwTjzh0kymOpI5+NdggypZ2ApnL1iL7iXk9WR6QiAQ0RSxR7BgAlkgbFBJzlwCr6bouX/eFfmvnawxdPkjXg2EyTlOX5xkmkWyoBkZFZWOTgcUQtRyz5uKOLgeXwHc5odVzoMZ4LTflpN+ioyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+I0kNEG7+cPSApd/MI+RCWglu1hfaTCwGjTOC8b+uU=;
 b=o2y/Mjl2TkYR+aaRLxSvCvMLWntBMXeun6XCSgb2Jjcy+E6J5UsMuw+SMOWq6TV4Rxix3lqZePED2D0GGUsocSgPQ0WEcYkCOZGgjuyesTErzBkxN++DH0CRIDVpLVUnQFwzaW0byyIvHMsbREwm2hVuKPuBr2AiOYXJnL4mc3E=
Received: from BY5PR13CA0011.namprd13.prod.outlook.com (2603:10b6:a03:180::24)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 06:09:21 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::24) by BY5PR13CA0011.outlook.office365.com
 (2603:10b6:a03:180::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Thu,
 3 Apr 2025 06:09:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 06:09:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 01:09:17 -0500
Received: from xhdmubinusm40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 01:09:13 -0500
From: Mubin Sayyed <mubin.sayyed@amd.com>
To: <dlemoal@kernel.org>, <cassel@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linus.walleij@linaro.org>,
	<brgl@bgdev.pl>, <michal.simek@amd.com>, <p.zabel@pengutronix.de>,
	<gregkh@linuxfoundation.org>, <radhey.shyam.pandey@amd.com>
CC: <linux-ide@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<git@amd.com>, Mubin Sayyed <mubin.sayyed@amd.com>
Subject: [PATCH] dt-bindings: xilinx: Remove myself from maintainership
Date: Thu, 3 Apr 2025 11:38:36 +0530
Message-ID: <20250403060836.2602361-1-mubin.sayyed@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: mubin.sayyed@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|MN0PR12MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: e81f7246-6488-4e46-7982-08dd727612b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hzvDd3yI0TubJZ/+xwWFjU299gCO9ISgOtaJAt9UT+lh9lMmzJDFvpcKOdCs?=
 =?us-ascii?Q?w/AKaZCDSY3Thm6WWQwj+A5JgI+GtafD/mb9kLJelXGhjjhuSp07AD0fFY5j?=
 =?us-ascii?Q?5LJfA8rNwizgvmcOd45x2a5DlXwdfKNyj2j9+ozY7lG1ToNStrnxw73hhKRK?=
 =?us-ascii?Q?YppvIt6JTn0XuSRY2IJXAOeQqBIWLgVq2G48tpVbcBKoAO2+h+5k8cQdRYg0?=
 =?us-ascii?Q?VyEC6+ZY5B6C/P6yArX6IeUM8R/87my/4mtF26hqMgOy6EbPTchM7lzEtMFW?=
 =?us-ascii?Q?HTHwGGLq4MBCRFGU9HMRAYTaziy/AECO6JdcHHPsggf5BPdVGbdGADXybdkf?=
 =?us-ascii?Q?+2HHocw/o4kaT2qbM8RlxoHyEna9cKYrSjlU1ov9KquuyQVf8idZa9L0RegC?=
 =?us-ascii?Q?JA4FPUEr9sRet5cQ4qio1/zC840/3AGhT0UR8Tz6blCDA7qYMPe7Cye7EzxH?=
 =?us-ascii?Q?Gw9az6w164HIUO/OiqylHxL1c8a5XPFqO6fy1Z3QIo66Fk43tu7lndlWrThD?=
 =?us-ascii?Q?XAjomhTar5FwMHNPeeNjqhOh/PXUbKoP8BFFahYBd1wJekaLpTKJDYEZ81Xd?=
 =?us-ascii?Q?eH+CWzZ8lcM8kMmfsg/AOtuJ4XOjMtzxamnE6pothoHUZ+vVGIyvFdezQ9Mn?=
 =?us-ascii?Q?erUFvoF92fMHz9WseIvOljeOM4z0ZzK9e9EJyXa4dv0edz6U5DOgiq4E4R5Q?=
 =?us-ascii?Q?UxLPOe4+YPRtqrIn9Xj/1sCJWb/xUpDcDyUklyz1EEv/mu0796EjH4bgyz9R?=
 =?us-ascii?Q?PsWb93i47fVlgdj5WGOgCkNgIOjhwa72xZXrppNO6pgjCwT/l22y3tcVRdhf?=
 =?us-ascii?Q?QZWcDXx26K+/LgicliYJ2GKZ5y4OsYeeZsqhDlDtWyDjKhNYPJSuf5ngLUGp?=
 =?us-ascii?Q?UFvhMpewHBoArADGhzuNzmrP3w78k6hYE22LUMseHBADnFpTZFn97twMgGIU?=
 =?us-ascii?Q?/oDEgzy9dtr9DqgoOm10Zy5Ra7apQx3/9iO6bhtDRqucfJH6Z/MSAJcEi8hr?=
 =?us-ascii?Q?D0L8uWdiVBMV4Hg4j1jON4N0SSTSKjPiUOMjyIkYjLtifogR+V8NFSV8yO/u?=
 =?us-ascii?Q?Wwfj7Px5Qj0ds2lKxzbIK2EXGc9AhYXRuQw4Zcsf+29jaQbxAWgSujkcNQr9?=
 =?us-ascii?Q?4+/TM6PSOYcCjV9sJ42RLDEZYTEZDf/JAQg+SsTnlg4acoZCCFOA5G7x00OI?=
 =?us-ascii?Q?QYyCyNf1b3F5yyzCm/LAsljUK8s8DtYk9Xn9qHqnav2q6c9xcmTGcB7Mh3aF?=
 =?us-ascii?Q?ymhFNCpw5HQ3T9hT5LmUamMl7nBH6sOLnoM++WmcnyyT+2BxYAPXO3aFVIKq?=
 =?us-ascii?Q?9eA5gJ+cKOTMH/PwlM1eUYOKSnYm4D6bexF9unVOWtB8CpGqkMHBo/MFJwE5?=
 =?us-ascii?Q?bJg1tQO3UJXvYchaPWRpdSvz+CyRMML9y+lmVN6gNFAE/scfgLnIHx9r37KP?=
 =?us-ascii?Q?qSn3pkK8Op6vcJqAc/bBzifhlH76vzLZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 06:09:20.0531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e81f7246-6488-4e46-7982-08dd727612b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_230939_348293_7375E6D1 
X-CRM114-Status: UNSURE (   8.01  )
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

As I am leaving AMD and will no longer be maintaining
these platform drivers, so removing myself from maintainership.

Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
---
 Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml        | 1 -
 .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml       | 1 -
 Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml   | 1 -
 Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml           | 1 -
 Documentation/devicetree/bindings/usb/microchip,usb5744.yaml     | 1 -
 Documentation/devicetree/bindings/usb/xlnx,usb2.yaml             | 1 -
 6 files changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
index 6ad78429dc74..c92341888a28 100644
--- a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
+++ b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Ceva AHCI SATA Controller
 
 maintainers:
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 description: |
diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
index bb93baa88879..e13e9d6dd148 100644
--- a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
+++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
@@ -12,7 +12,6 @@ description:
   PS_MODE). Every pin can be configured as input/output.
 
 maintainers:
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml b/Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml
index 1f1b42dde94d..1db85fc9966f 100644
--- a/Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Zynq UltraScale+ MPSoC and Versal reset
 
 maintainers:
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 description: |
diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index b5843f4d17d8..379dacacb526 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx SuperSpeed DWC3 USB SoC controller
 
 maintainers:
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
index e2a72deae776..c68c04da3399 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
@@ -17,7 +17,6 @@ description:
 
 maintainers:
   - Michal Simek <michal.simek@amd.com>
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
index a7f75fe36665..f295aa9d9ee7 100644
--- a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx udc controller
 
 maintainers:
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 properties:
-- 
2.25.1


