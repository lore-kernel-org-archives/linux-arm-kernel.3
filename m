Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C49CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rqhEXx+bAUUv0UkRlFmV2Zvp3hXdq1kcDBLTaZd8ieY=; b=tXR5xn1sgC3js2uuzJIBHFCdB2
	QOQecUay0y1DSQDuSkIL6ZmOWxpNUsCEo4kV8qEwG35z8rQv5qVKaN0U23vvUVyxexJscPEhzu+yQ
	b2nay8ta/2qWWL8nU+3rxUhHR7Vwh8KQJgQxf3G7gPuNk+zWKQ7gUw6F8iahMMcTZ1qwPsJa5tZmH
	91fu9DEtGluKXQdyIbj+LeIafODX/KcsL20AWgjNOAqoBCdA5JHCZbaK3R8yR68I8Jv0oXvCuk09S
	m5N+Dv+j3RWVd3IPvD02nwbg6v2g3R1iu2moPGoDn+z9cVXM5WLlqltLoFYQtNuBibMDFRVActC+5
	Gmp9fznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdMh-00000004C7q-0yFy;
	Wed, 20 May 2026 09:37:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdMf-00000004C6U-2pQ9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rqhEXx+bAUUv0UkRlFmV2Zvp3hXdq1kcDBLTaZd8ieY=; b=XFEu4F/hznjfYjuvmj/e9BYOiW
	o4g7b1BwUqY2GJsfYzM+lBaYxLj3vo9Mhro5HaYyL0QdUyWQHjdD1i4ZtRgB0BAp90SLYsFufouka
	gMqqUKDhycgwH7jJxYtOJAH8dpvrubfXCJin/hPEBNtJMi3N8b4bA9lzKwSU8C5K3tj6GppBVurW9
	opOaZFH2HZ4MVfaAdllPukH6IC7GxBfdhQB+PObKAHr3knsC75iyzVN7aAYCq+TDGd7c8mBfkGyDM
	rCl7+27+okNkVUzshmfoYefhJYPgO5+1Eb+kPV/q6o5RQKLwBxkgIx/BinEAOAT/NUkknOJ6nP0sG
	ujR3g89w==;
Received: from mail-westcentralusazon11013005.outbound.protection.outlook.com ([40.93.201.5] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdMU-0000000GNas-09RH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:37:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSnmQeeBTPcaKCQa1o7yKC+VWPw+no9m338YVS3YxtmaElmuCb/xpWPbEItPlKoicEtDj6aGPZtly2VioSYsVFH5YZ8vByBOTKJsvV/M50k2w//vNcDgE7PpY/B9dwyV3Nq11sKcF62lMp0HC83LMCH8c7PQFP5GCaFIReXsOodcDb6wOvrdV88H0YPKeS0ZZdM5vMcF1C4oikW7nrhLMZXt0459de/HE3cN/meN55ibZnBwGf9GWaFKrutbZt6P07ZAhU5eBFUmfrxTGSwsNCLV1rCbdWfA9xTutlsVFS0V328+3A2uSUoJJjYfpgH0zz0mcjE3FfQL+azVKjfWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqhEXx+bAUUv0UkRlFmV2Zvp3hXdq1kcDBLTaZd8ieY=;
 b=X45aGWZga+tJj0CdqVRFjPYQi8w7U+O3CmQ6MLmxxj9IlE+U1dpShdFKrfZVudaDaCOOU9GoYs17VIiQG+1ZUkIiSlK1XWx/Vm0wkaSe1FNXSwujUWciadx4FYi7Q662z3NvX6eHhwEqoZ25Rd6zzb1qAdJIIWYv8NaO94rdCYQWZKeCrmpvNLz0p7FTFSvbiXsdN//fJ05eu70uUQweLxwFlWX+YbI8J1UIlwg291ywvcOGhYE2ilATawegieUiIRTpyiU+0xyeBYHJiXORUoTt9CXeJCinHZHl+yf31fRl1JDuD0v1YC3FnCUNzmH0P01TY6sThTvf9HYJy6mAlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqhEXx+bAUUv0UkRlFmV2Zvp3hXdq1kcDBLTaZd8ieY=;
 b=3Wh7MkurEYrrJu9EOmfVZV/2ZL63+9SQfBOTABirNwsixke7XDblVKu/Ju4O0AAtlMg9htwQByeWlCNP684Cill35509AKYZBXO0vu16i2I9RhDt9lEFZnpRwn1YL9mSciBHikhW57tiWbxy85I8eKArVKyUZI0f+0COvt+qjDk=
Received: from BL0PR02CA0071.namprd02.prod.outlook.com (2603:10b6:207:3d::48)
 by CH3PR12MB8401.namprd12.prod.outlook.com (2603:10b6:610:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 09:37:00 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:207:3d:cafe::3a) by BL0PR02CA0071.outlook.office365.com
 (2603:10b6:207:3d::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 09:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Wed, 20 May 2026 09:37:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 04:36:59 -0500
Received: from xsjarunbala52.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 20 May 2026 04:36:59 -0500
From: Ronak Jain <ronak.jain@amd.com>
To: <michal.simek@amd.com>, <senthilnathan.thangaraj@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ronak.jain@amd.com>
Subject: [PATCH v2 0/2] Add dynamic CSU register sysfs interface
Date: Wed, 20 May 2026 02:36:52 -0700
Message-ID: <20260520093654.3303917-1-ronak.jain@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CH3PR12MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3e09a2-ba40-45da-3ecd-08deb65357c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 4jQYWJK4OJan5yGpmCyJ5bKHSjQ/YZli16ERD2qAa1N7Oj/a0UGWKZEuew9SQWDj2qAhAa0k5qD5CO/qDw+E6EiGguz+zdybkBPrp92yrTO1W0Zjc1RR6u3XG5J2WMaFdq96L5rUVGG+aX6CsVx1Pbr1tpK8OeF3iTwGMUCuWGe1ZwuVrMTdQLDP1qyoUf28+RIpavtP34o2pLfsA7rxhvFNfI7CFsnetcZArc+O3Jywaq7uhLL6RvmpXK0gPCq/rtOybbQQVtY+BK+hoWXeMsm079QUiW5LAKUWVwpI/UyfHl+PF+r8gJ9anpsZFPde5Rcm5f2iu6qJiiCQbPjJjvBfwSUuz+amBMqVixCTaY3vCQKFafakrxqHAa34ap1Bf7Uhp91GrvjpEiF8KBFz9iYHfDr6+m4sBOnObwB/RnJJ8nm2IwOaVdBvP2scYPuaraC8PYST0stEfSdkSV2i9F92rVC8TObrpjOtnuy4S7Ywhq7zFFxY/ZCDlzlPIdsdrsfFkuUwoJ5wwPFNpsk/j3Sy0GGY11BGObxGtOS/7+s2YTqfT1dC8cXr9/pPTAl6oaMYsQHW41+M4bq/ZEoHj/DWgEU1KHTYdWibNhpcFXVfh5pTRkgi2EaiNHeJWOAbzdBe3beiZiv0pAnshvijDHW+U5SZITzzBL9aVxp18IZazDMghhNr+ZsXGkvkUVJvR0RKOSNjHKoXWMDTO/Q2x7FXFst/uZhpv96e/yK/4+c=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 461U8mmz49dQ7bS7St8mIOI9f1D2wCRDphEMy1XSu66yqxf9gBoijIRlBkjbfbm9yeGeRWQ1NNEU8fHB3aLqrupi4SR3xdlImdEpHpAQiFNipzVJBL/dlYKun53SnfA2/OSCgLIUZ40zIrf58albkP23whCYubBgJTsO7fgfp70KtMZVECo09dFMmvuxvuKxbVp/DxL0SCebnvZLRuMEmXOZ5loB3ElXoZMMYDAreep4Cl07L/F499sjw7uOIZr86od8NDUFZzp2TkK76vmzSOg6pN/LxkmX0BW5aaZeGFhzMbYDE2KmWr+co2co8+OgGtpCUs3tItY9Nl4V1RSiqV5BXZ/Uvwsa9fBidxYiYbpNG4cus81Q4o3VT9VM/miN0EPSB18pZAO2R+Kse0GDU6faZlQMfpDTZX2JcyJvCbC1+V19IbdXEXCe8x9bgRzx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 09:37:00.3599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3e09a2-ba40-45da-3ecd-08deb65357c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_103714_689252_E98049F2 
X-CRM114-Status: GOOD (  17.98  )
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

This patch series adds support for exposing CSU registers through a
sysfs interface. The implementation uses dynamic discovery via the
PM_QUERY_DATA firmware API to determine available registers at
runtime, making the interface flexible and maintainable without
requiring kernel changes when firmware capabilities evolve.

Background:

The ZynqMP platform has several CSU registers that are useful for
system configuration and debugging. Previously, accessing these
registers required direct memory access or custom tools. This series
provides a standardized sysfs interface that leverages existing
firmware APIs for secure access.

Key Features:

- Dynamic register discovery using PM_QUERY_DATA API
  * PM_QID_GET_NODE_COUNT: Query number of available registers
  * PM_QID_GET_NODE_NAME: Query register names by index
- Automatic sysfs attribute creation under csu_registers/ group
- Read operations via existing IOCTL_READ_REG firmware API
- Write operations via existing IOCTL_MASK_WRITE_REG firmware API
- Firmware-enforced access control for read-only registers

Currently Supported Registers:

- multiboot (CSU_MULTI_BOOT): Boot mode configuration
- idcode (CSU_IDCODE): Device identification (read-only)
- pcap-status (CSU_PCAP_STATUS): PCAP status (read-only)

The sysfs interface is available at:
  /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/

Usage Examples:

Reading a register:
  # cat /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/idcode

Writing a register (mask and value in hex):
  # echo "0xFFFFFFFF 0x0" > /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/multiboot


Testing:

- Verified register read operations return correct values
- Verified write operations update registers correctly
- Verified read-only registers reject write attempts
- Verified dynamic discovery works with different firmware versions

Changes in v2:
Patch #1
- Update date

Patch #2:
- Removed unused csu_reg_count field from struct zynqmp_csu_data and
  its kernel-doc entry.
- Added explicit devm_kfree() on the csu_regs and attrs allocation
  failure paths, plus on devm_device_add_group() failure — keeps the
  footprint minimal when CSU is optional.
- Expanded the 0644 sysfs-mode inline comment into a block comment
  explaining the firmware-enforced access-control limitation.Also,
  update the commit message accordingly.
- Added zynqmp_pm_is_function_supported check for PM_QID_GET_NODE_NAME
  ID to mirror the PM_QID_GET_NODE_COUNT verification.

Ronak Jain (2):
  Documentation: ABI: add sysfs interface for ZynqMP CSU registers
  firmware: zynqmp: Add dynamic CSU register discovery and sysfs
    interface

 .../ABI/stable/sysfs-driver-firmware-zynqmp   |  33 +++
 MAINTAINERS                                   |  10 +
 drivers/firmware/xilinx/Makefile              |   2 +-
 drivers/firmware/xilinx/zynqmp-csu-reg.c      | 258 ++++++++++++++++++
 drivers/firmware/xilinx/zynqmp-csu-reg.h      |  18 ++
 drivers/firmware/xilinx/zynqmp.c              |   6 +
 include/linux/firmware/xlnx-zynqmp.h          |   4 +-
 7 files changed, 329 insertions(+), 2 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.c
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.h

-- 
2.34.1


