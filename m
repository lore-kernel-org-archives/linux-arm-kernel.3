Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EFACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcUCfWOb7E/MCTe0mysr/KonOU+PtVIQA29jn5U8pCE=; b=erlI5BqM+EMHF0r2xSnivv9zzu
	+es2PIBSr5f2pKynL8FIc6e2Z0nd0h6gIjVRSNL5sKAOfunKPViS+dHVtm0HUklXq/C+TCux/EVon
	RS46Kh2bR8Tx86vVbNPAxJ61JRl+VNxXiiCKPEBCzyB80sjKYXWJoQPc5o+7kMFu5qdjPwT8bYSO2
	Dg/cSy3raLgcTBSEawPxLqtVjkbWS08yLm0t+Op0dskf8Gj7rxXU1tGGO5hxbFLT6ysjgqJ6EiGG8
	Z8rw+ZwCKtaf1LLbTyvEvFKU0Q1WYjTvrfiiA5ncu0q/d2g5uS/ueZO8smMR3CkTJ01oZmj3UXrcd
	iTymk2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdMT-00000004C1B-36Pn;
	Wed, 20 May 2026 09:37:09 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdMQ-00000004Bzw-1H5t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:37:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcXIQ/sgVZALmYo8POO04sD70lqGDOU/qnR2rAnKVa850deZ9/DjGNZY5yplbtw40rpoeJIE6J9IYrAuZf121nUFkvm6p+uxn5D5LC06Qddy5XmUfuxDbqeSWuBpk2/PdwOvT4SV+0KPQlD956xWMj2veFm9TWIW83pXbEb2+d1HlunqbuhLzQB8PO/913UrnrydlM3PvA+QAHF8rhDoMU7dKaxRMyg5bao6l6alISaub9wEzv7FTgpa6isgPm9WwaopyKNzbgNHiHdLh0dQnYu7t+bRbAgomjCFniWv6dfa1AP9isJUy618qr1hGJ9/S/zuODY8kJ04mS9tEFYb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcUCfWOb7E/MCTe0mysr/KonOU+PtVIQA29jn5U8pCE=;
 b=M5WHOV+LUFrV9kI/V/UOgvehRcAhbjTxvE4C656wYJ/nejbsAnzII4PGnrgvF2LP9a5wbre/3JiF82Mnknt+eH+NLiTmpH78LAmBJhdLEgWwTz0StXWScFQtQiF9HiTUTK3xBeNqsLUGl/Jb7egQd3ogGt1leue8HO3UToXK+aeSEF4lR/WdMct1GPBc0KKfSEWSG8TX/1k+DJ0tnyBoG07ojG8XTEEhfe2ifonxTR20J7DYK/JJDgmKZyPIL3tkIWEsdIPeudjmELWsQNiMgJR4vkGcKAvzoktEvKGIlDyeTg7XHnMdx2Bl/8mjzFueZJmBtjPCPS7Na/Vgoc3pgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcUCfWOb7E/MCTe0mysr/KonOU+PtVIQA29jn5U8pCE=;
 b=ad/4D0Di+o2kyszELhJjUtsnw5uf5WDXLlFI7rQx9mcO7wGUG+R/EuRQ3O8dwoyudEY0EbdU0gLcqVy1+mb3CKSoGW1zc9ECigN+hNgyGOe/qzv2CbCI1wEcj36J3PrLUy2jWDyUzV7ifPYmz03VmB88JiGAK85DC0uSAKlh/9s=
Received: from SJ0PR05CA0070.namprd05.prod.outlook.com (2603:10b6:a03:332::15)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 09:37:02 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::2e) by SJ0PR05CA0070.outlook.office365.com
 (2603:10b6:a03:332::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.13 via Frontend Transport; Wed, 20
 May 2026 09:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 09:37:02 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 04:37:00 -0500
Received: from xsjarunbala52.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 20 May 2026 04:37:00 -0500
From: Ronak Jain <ronak.jain@amd.com>
To: <michal.simek@amd.com>, <senthilnathan.thangaraj@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ronak.jain@amd.com>
Subject: [PATCH v2 1/2] Documentation: ABI: add sysfs interface for ZynqMP CSU registers
Date: Wed, 20 May 2026 02:36:53 -0700
Message-ID: <20260520093654.3303917-2-ronak.jain@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520093654.3303917-1-ronak.jain@amd.com>
References: <20260520093654.3303917-1-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|SA0PR12MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: 56578010-c72c-4ccc-6b03-08deb65358f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|18002099003|56012099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: lthNOzwkbAWIBo+u7pWyq3LYLu/sDE/aEYRlCZvB9zArgChEXFa11TMwYLiJCkF25eZGsruH7v920wPZZA3td6033OCW/kAy1bp2pK+77DobUJaFKRRP7WcXETrPSlQPqm+JRbbHfEKHOG4y3SADGD3/gZWBd/kclVwwR1OIUWqjDzC26aYiNfYvsn9QNqswFgKjc3n3Sh5kqyf0LDtOQ3Czu7/sbubydM5swuG6VfE6RxXUk8bsMPBnyoLk2hYvywkrkp2MTXNcC08fFMNshg3d8PuCg7uS84dSBSMA9IBuiyd9p8eBC6WP04Sv3NQk+dKubLdfH+7IAwpSRtoTSwEp7D1I6v1EBGZlSM2vgJ/HCq4QVbNGFHw8MkFsUn6XwApPk6uncN9Rm6lyuyR/o+hyx1Ve6HpGcjB0VRIvgpP8tUwuhSfp2cax8ckvkrFWGWGrs2T170YRcRDigbuOBHZnLbbsDB4aMSytaB0WMlLaglXdUoXCLCn5+XtsNvBCol064ciA7izigSdSOKfbM0YJ1Jy/1IB0spzB6Oh5GO2WKK1EL5xBooYvD7g+2MTcn/Zh50LAAwJ0t32lX9lOBZnxBdSPVnOU0aQsGlqBMoG3QBdtl8b6CNrpqc+xAMP4KBvm/E5PvtXAVR5sY09vOfSubPAW6mime5xYW7fMf04MwaRbQRaOXJDt3Cs/ULuLRqpkIKocB5ZmghgqBIJPe/WH5LkaZQ4mlA8XwJkU5Yk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /o3H4G2Nvs7guqwZTZa/I/x+3w8MTQqgtpSjpigbqLwLghXOPK2ywbz0ssDfzT+zh+0vFk5bihn2HHZF/jeAHP25gyd67Ca+zYYBJaTOsCZsO/heg2osS7DXUeKMPxPWOLMX/by7WNDYndsHkCJSSCGy5iJrtBiV6Fbe8bb6y3uDQiOPvsMlQuW9TdqQG48Gr18yuFsKkX3n2SIKAqprEb6xtX2qGlMELtT5UQnBOllAYPZJgwQ+dQEsq/Lr85QIxdTh/JcMuFXR3XXBoJyASedMhWysmMMTlhpEZjFxY6/tD6Djj145l/hAF5ysXJg31a2Y43rUqIMyBm9U6vkmtteLhoD8puVwtHCcGJJqAhgvHq2Q2sAHxQwRTdyGYBV9s+zpfwSmHoCxPec+aPJ9nVVw826ZgNTap7YdcKhMun6cJ9EehNLdKwegyyTp3qGI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 09:37:02.2866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56578010-c72c-4ccc-6b03-08deb65358f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_023706_492987_B01BA179 
X-CRM114-Status: GOOD (  13.49  )
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

Document the new sysfs interface that exposes Configuration Security
Unit (CSU) registers through the zynqmp-firmware driver.

The interface is available under:

  /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/

The CSU registers are discovered at boot time using the PM_QUERY_DATA
firmware API. The following registers are currently supported:

  - multiboot     (CSU_MULTI_BOOT)
  - idcode        (CSU_IDCODE, read-only)
  - pcap-status   (CSU_PCAP_STATUS, read-only)

Read operations use the existing IOCTL_READ_REG firmware interface,
while write operations use IOCTL_MASK_WRITE_REG.

Access control is enforced by the firmware. Write attempts to
read-only registers are rejected by firmware even though the sysfs file
permissions allow writes.

Document the ABI entry accordingly.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
---
 .../ABI/stable/sysfs-driver-firmware-zynqmp   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp b/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
index c3fec3c835af..f9b004e33696 100644
--- a/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
+++ b/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
@@ -254,3 +254,36 @@ Description:
 		The expected result is 500.
 
 Users:		Xilinx
+
+What:		/sys/devices/platform/firmware\:zynqmp-firmware/csu_registers/*
+Date:		May 2026
+KernelVersion:	7.1
+Contact:	"Ronak Jain" <ronak.jain@amd.com>
+Description:
+		Read/Write CSU (Configuration Security Unit) registers.
+
+		This interface provides dynamic access to CSU registers that are
+		discovered from the firmware at boot time using PM_QUERY_DATA API.
+
+		The supported registers are:
+
+		- multiboot: CSU_MULTI_BOOT register
+		- idcode: CSU_IDCODE register (read-only)
+		- pcap-status: CSU_PCAP_STATUS register (read-only)
+
+		Read operations use the existing IOCTL_READ_REG API.
+		Write operations use the existing IOCTL_MASK_WRITE_REG API.
+
+		The firmware enforces access control - read-only registers will reject
+		write attempts even though the sysfs permissions show write access.
+
+		Usage for reading::
+
+		    # cat /sys/devices/platform/firmware\:zynqmp-firmware/csu_registers/multiboot
+		    # cat /sys/devices/platform/firmware\:zynqmp-firmware/csu_registers/idcode
+
+		Usage for writing (mask and value are in hexadecimal)::
+
+		    # echo 0xFFFFFFF 0x0 > /sys/devices/platform/firmware\:zynqmp-firmware/csu_registers/multiboot
+
+Users:		Xilinx/AMD
-- 
2.34.1


