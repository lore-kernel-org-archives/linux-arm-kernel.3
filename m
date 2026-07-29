Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85208C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N6dH0Gfnug0Itmi1EYYzp7vNlTRp4cIvjpJnn04Vt7s=; b=o0MlV3gnkjirAxjUuHMWzeJzBL
	KbuKrUziHXdddNrmiJfabnh0N7PYvAcgqtXrAYmjFQdlUSGGoVH+wyklOM8PgInHuGUrj8uLHB6+3
	8CAQiQQs10tCX+BdJIX/cpP1PzYhSQTYNixrbB2rRNsXukaXwy6m05HIQw5xWG226V1WZiBJmdCpc
	AWbJvue3miRCS2xCjRi0loik81WCQrgS+kwSg0MSvv9FNyNBIFXRDdqJyCbWUlcy3FoELu//ZoNSj
	EIS2PE+DakHTApk2tJsxxaPi4IXCopc2tRAWRoVZqV+ghwkYEOF9TZgXAZ6E0+oigGpaFvBetbLre
	S2tdFbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3oh-00000007yhn-3mMj;
	Wed, 29 Jul 2026 12:55:23 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3oe-00000007yf0-01FB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:55:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9FLAvcDzK2lJvnYsfMSMQ6rZz21Xk0sj04LIgs6uuMMkPpyY3Mr5eWd6bLvlRmv98+WJKdyio7SyAeNPVqB0rT8NLFFAHvKyJkOxmMxNJcj8RrpelRvWX+MvaM+N0Swpadplf/iarHa+aXY6EQSp2Vo2luRl1H1ZdyJRBLSkHPPr60I9XGmv/3q4kguZgs+OB86YygkeH3GzGlz/uBvFG5LyiKKR+zqHTjadCeHZ2Xhph6OvTbN/T3N1Idxo2mS6DIUM90LuaopgINpoI1ziALBiA6Lk+NIoKb8zgjIOQMWCwJSJj92UJUihDBvRMg7gkJknY5OQPEE2jS6HAy3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6dH0Gfnug0Itmi1EYYzp7vNlTRp4cIvjpJnn04Vt7s=;
 b=FmZbayk1pTxcFoxNlCIir2v4EgUohFXZsp7KcEgbzxkUT1593/OsP8qboPzYrUDh0ZZVaEqmnDx5Oi2oPOnvTzSDdjifCFIBweJbS7+gEq9I8R1BhuVUkuN7oqdNoUV+vJlcPA2Qw6wZC3JjREXZUOV4vRub/U6w1c+W9Js5s7A0M10GKTFbJ2atdqSWbVIdy+lf84d0zkDELSli8f5ZpbJnW5ST8HTf8h7EDVRW5FUoJ6kcL1J2hZWtlw4pMOJ3KKP2TrhVQCE/21rGC8eBUzesCNsVg6YFN9obDbT25whqXzyfH1LMShfwUACLVbaYbtcTvRpSpzh8tNoJAXg8Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6dH0Gfnug0Itmi1EYYzp7vNlTRp4cIvjpJnn04Vt7s=;
 b=f5QR9+j5CY5suBtiqleXV9bmziHpCJngmXFTbVJWGqb210YMKUWI45GBuLJMcp4StO08gLpaMwGLun1oy33NbSKANQDcK8tXPq4m7EIfzzMBhpzbqtbh1svMB9natdKWkWbv6ERQNrfYZDCPNY8etnORTeCVK0eyLJEahJK5+fQ=
Received: from BN0PR04CA0135.namprd04.prod.outlook.com (2603:10b6:408:ed::20)
 by SA0PR12MB4414.namprd12.prod.outlook.com (2603:10b6:806:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 12:55:08 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::7d) by BN0PR04CA0135.outlook.office365.com
 (2603:10b6:408:ed::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 12:55:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 12:55:08 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 07:55:07 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 29 Jul 2026 07:55:04 -0500
From: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<DileepKumar.Nagavarapu@amd.com>
Subject: [PATCH v3 0/6] iio: adc: xilinx-xadc: Add I2C interface support for System Management Wizard
Date: Wed, 29 Jul 2026 18:24:49 +0530
Message-ID: <20260729125455.95893-1-DileepKumar.Nagavarapu@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|SA0PR12MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: 8139107b-fd91-4dd7-e16a-08deed709e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|20046099003|18002099003|5023799004|11063799006|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: M2F4kVofCIsYKTaxmVx01IMFgoBjtlMhM3Lmo9hOZ2S95bvPTf3R92XXuxRyXVpw8jjujeSj9PxsB6/OZuiME0n7cP3LYnoicjjtn19QroAG1DwjWEVk/X0QS3i7U2pwtRAYJH9mjVbCaF5Jk5QhvB4CKUUJyaMAncXaK22mlUJWZtg0Gao83auOLEwEyg+KmpkKIkIa+PexkBulrv6zvL22NQZKkW9iBE5qxHNGbz2QzP3JG1g3wBaUsoBLnWd0XK75j9EvmgY8hYy1eCLgzvPNPh7l10nJ7TNM2QMhTpsh9bZtKGffiezTR9yHHXPluMgn4cSJH2AgE+IlV4ITY/1WrL1/ibhO9PPb9sut+iR0WH66cK4HiqxS4cvwAJ3qJYfodPLg+qzSdVJhX1tPk1+M4rvRabDefOHlU1zpUDtQuXYoUXjvNzkklIAnHFIok3NAAdqNZ2NbI1tXgYmYLAJkbamDI45aYgkjgny1ecrTdjXXN9/c6hVpCYdcEYxi4yNQ5joMPfDW9vPT1IhIuLpWqvYg8MFO6yXKhAcMglAHsfsoM4fDPYDiv2Ug9O1WspfpSbCt0e/CMvvpj/+sBDbzFiJPlCEjt7bovZQjFJ7mqtLnlq0QS+mYOuvgLs3R8Ubl7l3s8hoxSX0qaXbkhKOi9yPGr9yBxuwBOqU4UICcp4XetqQHov8dUCMY4qNtNdPncpOI+MRgHF3XnJxUpA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(20046099003)(18002099003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Vog4dMwLtkf+2rsVAifjM/0s8NsjJfUpsTpl+cwa2ORtG7ACJ8waPWL2lil/MenBGbToXfklsaS8V9I52luIaL5qA3lROiCz+fNDBSXKeYCMEfzHk/BJ0GM2KOVmQk5byEr69em/L4PY8fdlXiHqZbz/tftpa/kPAWc1ZFNv2bjWRrTeQGcvwyIRAYC3da5W0d6R2YGpWLzOqEwproWo5vi8Q88DFFL5ZhhwcQg62lm/gAmaRGyQZgpGWXKtn3m3F0jYvYflNO+fw6vCyM0kb6YsnVDE1zXArgrSmSoyuyvZoB3lkbdpY3shg5vepotkS5r+q+2BeEl1SEzwWIo69BMttg04hlLzvyMXNUjfp8UWq2Dci0jvRnd+uLhSKdSgtG9Pl+pD1xETZO/iXaHCxUI0JnbYNFHTKkcTiMEr9Pfcrev/jsQD714hnWvdQ+Nx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 12:55:08.4975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8139107b-fd91-4dd7-e16a-08deed709e8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_055520_049329_D7B09066 
X-CRM114-Status: GOOD (  18.23  )
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

The existing driver only supported AXI memory-mapped access to the System
Management Wizard IP. This series extends the driver to support I2C-based
access, which is particularly useful for System Controller usecases.

Key Changes:
- Split the xilinx-xadc-core.c file into two files(xilinx-xadc-core.c and
  xilinx-xadc-platform.c)
- Add required helper functions and callbacks
- Add channel configuration via callback mechanism
- New I2C driver for UltraScale+ System Management Wizard for basic
  voltage and temperature monitoring
- Converted text binding to YAML schema format

Note: We are working on x86 platform support where fixed channel
configuration is used(no DT support). The .setup_channels() function
pointer introduced in patch 2/4 enables different channel configuration
approaches for various platforms.

This series was originally posted by Sai Krishna Potthuri.

Link:https://lore.kernel.org/all/20260323074505.3853353-1-sai.krishna.potthuri@amd.com/

I will be maintaining the series going forward and posting updated
revisions.

Changes in v3:
-> 1/6 - Modernized the driver code with latest kernel coding styles
         and guidelines.
       - Restored one-variable-per-line declarations where no
         functional change  was intended.
       - Added unit suffixes to timing and clock-rate constants.
       - Replaced GENMASK() and FIELD_PREP() in appropriate places.
       - Added guard(spinlock_irq) helper to manage the spinlock
         automatically on scope exit.
       - Added MAINTAINERS entry for XILINX XADC driver.
-> 2/6 - Refactored the xadc_setup_buffer_and_triggers function
         with only two arguments.
       - Added xadc_device_setup() and xadc_device_configure() to handle
         device initialization and configuration separately.
-> 3/6 - Added IIO_XADC namespace to all exported symbols and
         imported the namespace in platform specific modulue.
       - Spliting the driver with modrern driver changes.
-> 4/6 - Added .setup_channels() to handle custom channel setup
         and configuration.
-> 5/6 - Replaced mutex initialization with devm_mutex_init()
       - Removed unused i2c_set_clientdata() usage.
       - Added comments describing the DRP packet layout used
         for I2C  transactions.
       - Added comment for hardware initialization check from xadc i2c
         write and read functions.
       - Wrapped Kconfig help text to conform to kernel style guidelines.
       - Switched device setup error handling to dev_err_probe().
-> 6/6 - Removed write edge default configuration in XADCIF_CFG register.
-> Dropped the binding to YAML conversion patch as this is already sent by
   Pramod Maurya and is in discussion.

Changes in v2:
-> 1/4 - Split the xilinx-xadc-core.c file into two files
         xilinx-xadc-core.c and xilinx-xadc-platform.c(comments from Andy).
-> 2/4 - Referred as .setup_channels instead of setup_channels.
-> 3/4 - Created separate functions for i2c read and write.
       - Created separate file for i2c interface handling.
-> 4/4(comments from Krzysztof)
       - Removed $defs and use it directly under xlnx,channels.
       - Documented the error information in the commit message due to
         vendor prefix properties.
       - Kept only one example as there is not much differences.


Dileep Kumar Nagavarapu (6):
  iio: adc: xilinx-xadc: Modernize driver code
  iio: adc: xilinx-xadc: Add helper functions for the device setup
  iio: adc: xilinx-xadc: Split driver into core and platform files
  iio: adc: xilinx-xadc: Add .setup_channels() to struct xadc_ops
  iio: adc: xilinx-xadc: Add I2C interface support
  iio: adc: xilinx-xadc: Correct Write edge in CFG

 MAINTAINERS                                   |    7 +
 drivers/iio/adc/Kconfig                       |   23 +-
 drivers/iio/adc/Makefile                      |    6 +-
 drivers/iio/adc/xilinx-xadc-core.c            |  886 ++------------
 drivers/iio/adc/xilinx-xadc-events.c          |   54 +-
 drivers/iio/adc/xilinx-xadc-i2c.c             |  228 ++++
 ...inx-xadc-core.c => xilinx-xadc-platform.c} | 1043 ++---------------
 drivers/iio/adc/xilinx-xadc.h                 |  108 +-
 8 files changed, 609 insertions(+), 1746 deletions(-)
 create mode 100644 drivers/iio/adc/xilinx-xadc-i2c.c
 copy drivers/iio/adc/{xilinx-xadc-core.c => xilinx-xadc-platform.c} (34%)

-- 
2.34.1


