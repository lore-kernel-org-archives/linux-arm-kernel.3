Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559D4FC72D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+5TP0nhTDeVYcIyNCrEcDX0wO+Szp9p2fldC/WHMOF0=; b=vn1DVf8/LvWS6nQ9AAuUNQSd6I
	NksjnKn3FNS0GPkCUksVn6A0GNvz2cJiUzbGSB3NMQwc5J72ZPUHUNWJcLQ15ADbat8VKy/C5sg4+
	rRjwfV/cV30vOcyIBTimRnFQtzU94MGYurJihNE44whNOkD7Ty4ryp/BA+XoWRZLhthi6sDNzJWpd
	s/ktGurAwlD+uSHuNlvVNFyAx5H1OY0/bsOtOk6p342zpkYe4YLKDJRaAJR0WFaecPEzuq8OH+9sE
	HkbGa4UQiU2h3soFSTSWhWoUiLxFNseEX+ih9/m/m1q/ZFoCjTbU7Z1CWcbUbOY7jP8oPB2sPgFZP
	HcnWimBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZzJ-0000000GDB3-0MCU;
	Mon, 23 Mar 2026 07:46:13 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZzG-0000000GDAf-1Ddl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 07:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEjPVWZ/ERhvROiNKuoGJ/0FjaPYs+kl/QpnJi7V3sbngYJwUDSX2HRxARg3M8GwZ0cY04Fns1ymbEiUpJXocj1JNDhxf2GUBr6lpKpNrD81HWAI2j7/HTEnoMIdkCdCVVjZ1M19BsPG7diKKEi0hOPMPsK6QbuDz1npDj1Hj3h3zEMsGAhG7SEbuy7o3ghpT4sUc3e/3XA6cr6HOvcmCNY5nskT0hV3PnNrGfS+8nMhrd0hndFZTPgYW+QF9HfVPyP+jGYLr6cBTwnCvLBaNIXx+crXOzU1tuRTQsW4r2GokSkIu16OAH6km2olg24LOLRNye3KCmUWYjollaaOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5TP0nhTDeVYcIyNCrEcDX0wO+Szp9p2fldC/WHMOF0=;
 b=V6OUBEcy8q79yFt/54wdT8B9//maeyrZbHL1jHuPTCHksMAVmXmcFP/QK4MpXAnPov66Cg/WIPl8vef7CWfYzE0OemyU4b8eqLsIA7RFzU3gr51MBRTGzP9DWn7RuB7Ls3B8tjJmQrr+z8w9aGbgcyxdotG5IXtMf/Cd7iwCfgx+Y+7LcAL3h88Qux+DPsUf91TsiZ6kC+LzAxLBQSj+hII8Z0qFdxp9+6XXYbVcqA81VeZsIIDNHVlTL7J8N5LRWPBaIXgc3nRE3l+qpcK9ZLIKi6t4aN7MbkiNDmJrtRSDny3OLpoXYT5zItSU2q7qhzcgm3EwX9klRZfdkZEQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5TP0nhTDeVYcIyNCrEcDX0wO+Szp9p2fldC/WHMOF0=;
 b=O8L6ZGs1OOJcNJ7hXIb6s+9xelpYO0IeWM6OEoEKTSxVVOWBG0NVdCHSF1fukGAwtqLELdrCIHpZhqlx+zU2um6bh20Z3L44Qjt02tWy5iu8FhrzfJ2CWi0Pcx+VVbsqZ+cIGevPGKbotF0FFg+mVrDZwvfpGGK1NoWO06LXPyE=
Received: from BN9P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::28)
 by MN6PR12MB8469.namprd12.prod.outlook.com (2603:10b6:208:46e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 07:46:04 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::14) by BN9P222CA0023.outlook.office365.com
 (2603:10b6:408:10c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Mon,
 23 Mar 2026 07:45:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Mon, 23 Mar 2026 07:46:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 02:46:02 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Mar 2026 02:45:59 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, Andy Shevchenko
	<andy@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v2 0/4] iio: adc: xilinx-xadc: Add I2C interface support for System Management Wizard
Date: Mon, 23 Mar 2026 13:15:01 +0530
Message-ID: <20260323074505.3853353-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|MN6PR12MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: e86c6389-7a62-4fdd-ceb1-08de88b03c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: pXT8FUTedEKWexWRLlNpUShM4fKr1mxqaTpwMfKixAs75+T9kWjcVnXkfWwb69jqVJ5gU/PEnQcNfBbZkMetAaCA5klayygqwW0nmXP9TcRq05ZEXSq4/ffVXKFCq2PV66x1gJeG2S6BsTsgde9tjVBaT5YMcFsVx4T2EHYyVHyhJa9vD+AlGQ3+TNGIeQR8jb+imPx7bKnVwejIhAEMDKgTelxgEHegEJ03E7R3pkJJkJtc/dF8PTDDFfdoyyPGV+0IQ5L0BEoVVNgW56JUhyIq80GPBIhJ0e5o+dAqcMdSUIvtmYmsSBQH9/v74P1YQfZglAEQ1VkD1w0Ty3zBasyizTGkBFLBRL7ZqicBAgTjioJb5jN+cepuuitfF68GrGDLsZ66GKz/R3XnYPs/LmvOd66GBfZVtlwbO7jmVrUzBRWBtbZg1EqqVYkcIJ7TFs8yfA2cb92Dvr5/vZEIofzr+YlNPg1ELIqfHo6KoHI8tcz7VtksbdD5m16CFGgBkDnLxLU841tzAhwbZMXvE1k01kkDdCNs606i29uf7A1KDunztSzdWJfiHbvxSAOAsQNBx2cChe+5iv6l5ShNURRPl7pc19OJUSl9kUoZIPYLlLJWA1yTKX399JWZ+RcTyuiYcxwRZOCxZYso5F6wj8oIaASHMv6F5G7qhkG7qtvanJRO5CA10ElIUajZnnwBhMDLz/mDPkOBE9e7mpe8uWDObDFW7/DtRQpUcm1wuCy5fbsZ6NfJOB4GKhCebYFcR7tmPrAmjV/dDmd7pkH7+Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rwpVEbHZzg2d1K/aNwpvEm2gYtmLcgtBLBaB8gJs0bcop72nhzvsJ1mxw2sITX9m/s2Hv5bZG2WP5qoRUkhePaVdOygURTgLf0Hcrwhx6Km4KQy9W2swTYQhpfqFOPAC2++tarhisS9Bkq/Pcm0/QemTxPym5DWRi5au6uKzMtC2KXYwS407oTLTQOGQ4svNbGLgW+34QjB/7C+ANfKMoOTpTm+U6g3TYQgOsGvSUU+pYcQbeNH+brDya7FibM1qGYRQ++gkEHgyea/G/tlNRNMRQ3fbf9JJgYc0NkW89iAOdPCjGGsxhqFJzlmGwySiBP8odq35gNctcHOIvNJJdT2u9i48jCqI72rh2G0vD05GkygECqidyNVi8EpdevlBWTOcDQwZvALeNYhH0l942wfPemcCTorzOiqbRTlPi9xGJBm+vwUeDu4rNJGtD1ba
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 07:46:04.4003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e86c6389-7a62-4fdd-ceb1-08de88b03c88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_004610_502301_E6DDF607 
X-CRM114-Status: GOOD (  15.70  )
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


Sai Krishna Potthuri (4):
  iio: adc: xilinx-xadc: Split driver into core and platform files
  iio: adc: xilinx-xadc: Add .setup_channels() to struct xadc_ops
  iio: adc: xilinx-xadc: Add I2C interface support
  dt-bindings: iio: adc: xlnx,axi-xadc: convert to DT schema

 .../bindings/iio/adc/xilinx-xadc.txt          | 141 ---
 .../bindings/iio/adc/xlnx,axi-xadc.yaml       | 154 ++++
 drivers/iio/adc/Kconfig                       |  23 +-
 drivers/iio/adc/Makefile                      |   6 +-
 drivers/iio/adc/xilinx-xadc-core.c            | 814 +++---------------
 drivers/iio/adc/xilinx-xadc-i2c.c             | 215 +++++
 drivers/iio/adc/xilinx-xadc-platform.c        | 668 ++++++++++++++
 drivers/iio/adc/xilinx-xadc.h                 |  33 +
 8 files changed, 1193 insertions(+), 861 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/xlnx,axi-xadc.yaml
 create mode 100644 drivers/iio/adc/xilinx-xadc-i2c.c
 create mode 100644 drivers/iio/adc/xilinx-xadc-platform.c

-- 
2.25.1


