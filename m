Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B261073CA0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YGXw6CYwcX+q6pkqI/rMr1NBYTLiE2L/uH/nylLYuK8=; b=G/XMO8Kym7hIBzFiS/Sx1cUXFU
	2mWq7aL62ESoULPrJf3zbTZrzpXrdOQBvKtXcJUj+dfR3FY0TEBk5FNwC03rrB56oGky/eC6KIrwf
	PIJ8Rl02dMBKUmcXzYS2IneCZMqxWcsdQahEpr8Ww7shmiggSFAOMxgQiVDANjA6SbDo8T+RSlEoI
	IkqJQs8/WcPaiBAX+EETb19Pe/4TCr7M2IwaTN+Xa8ALyCHIMGUVg1vUOvRC8v4PORp8cgci67Nc+
	bTqJ2L8isCbebkWNbT2IPm10durXL6hYIb2gELn7GgqSwvx1Kk0DXhPGkMror2HHVZWwKp+k+17dC
	W8UEDgHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARJB-00000008lxh-2xtf;
	Wed, 08 Apr 2026 11:42:57 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARJ7-00000008lw5-0YPP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:42:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iM5R2bI4n2SLWqRyr1808B2anNDxciU1JdwzStwSxZtawtLBWKQJfcT2yvjnZR5W1sN22t459eH7qYOlL1CIssAfiMiCq+hiSfLAQd10wXu7yANxi38pzY2LBEcBT/DxJ3LEtN2CUJTgjMWwVmSbXBMDVdhp3lsw8TWNcz40X13PYEHIlKKZfm0DsjqbIKuGbT3zAVuFN6NQS4hfJvfCGzcOJGrjQF7deSq8+3CinCAyzKfnFa9Ll9xdjjr8DUJsK8HmxW9Xd9deBBfZK8UoX5hYJf6muEsEbLJMCJb2SZAOYhe+7P7VB6qeCdywC0Nwy5NhNafD74iBZe2d8zNXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGXw6CYwcX+q6pkqI/rMr1NBYTLiE2L/uH/nylLYuK8=;
 b=bp6ftgmwDEoE2cXpT/IHHw4QjGG/tQiNdqGeH0ai5tWwW5AYNbVg3hdFkDlzd9qEzuqAyjX0obJoe2AXYFNNZmFrEzwG5UvVhk1Uiitpu7DCLW8ygjGMrvLooqX04hMWMeY9peYS+pHM8J+A6jrX1kk2EJLlv8S6rJhZc0A2vmvZ0il2Tgr/nEggts7Zo7MmknKpxWPN0kbUkhiOXgIRaGLectzdkZnjjl6SNug+0i751EcsnKfRG/yeBswYtRXfGnQbjo/oolhcvGukczuYiXya/un9LkaGMfj9JTGzRxc4kOkV9BRefH5vIfkukVr76uaRQz5htfzvn85SejP6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGXw6CYwcX+q6pkqI/rMr1NBYTLiE2L/uH/nylLYuK8=;
 b=UZNfUPbU9ktHx6JjKJvQMvcyL41i2ClkWUXT8+N9X18SURmJ/F1WR5/wPEfwMkDejK+IMUDqQQXSQU9avHe9TqMSRmvwdd9eV2F2mvO/AuOWh0DuysVUuYD3frBqZliMs8ObuGq8eMifODjPYcT51Ehfi5NlMa/z08FEB5R8wb4=
Received: from CH0PR04CA0089.namprd04.prod.outlook.com (2603:10b6:610:74::34)
 by IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 8 Apr
 2026 11:42:46 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::9e) by CH0PR04CA0089.outlook.office365.com
 (2603:10b6:610:74::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.38 via Frontend Transport; Wed,
 8 Apr 2026 11:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 11:42:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 06:42:45 -0500
Received: from xsjarunbala52.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 8 Apr 2026 06:42:45 -0500
From: Ronak Jain <ronak.jain@amd.com>
To: <michal.simek@amd.com>, <senthilnathan.thangaraj@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ronak.jain@amd.com>
Subject: [PATCH 0/2] Add dynamic CSU register sysfs interface
Date: Wed, 8 Apr 2026 04:42:42 -0700
Message-ID: <20260408114244.2852015-1-ronak.jain@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|IA0PR12MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: b46eae2e-9678-4dfa-2791-08de9563f3fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Fi5498LN2oOwmG+R5nthQucBCDt8vn8yIa4sZ5JNmsqSqWfRxzsHw0Tlu6hbTGcnm/KDFM7MfD2Yg4ztB9G0MEZ80FgR1cMcvq/S9aTSNZJ2ndWSfJpoGcimBa3llQKUvrU+Yp5DQk+M25/4inz8jOMJBZWJ4YxAxuGLBTltdYdOQQywY5RPWd43WevaoXje0RXXm3+6+HgIfwkV+rjfSJW8yrQjbMamP9hek0kjW4BtuokstvvyQ7tsC4kwGpiB1VEuDKRZCUSpZASIdhPjgYGnVA2755O1cv3aE/EAxEOyw+dDN2I8VgxFM/sfr6xhVyFwFBZMWuXpn5zV+0gptuF1nhXL7u7EfeuzbqUbuteFM3NbKbcRNHwZM2n2cTv4z5FB+7rqFIxXCd2n1aLOxBjVxyXXyCzc/mqufnX2I3INs5QaLqiRCHZfSO3oyjbJqgenw/Tq0dRdYWg9RdxqqrGqFU7SJk34t7nX0lFSZhgTOTxi4BK0vRLZElnwYMw6snXx7xS7ubINw7X4GKCYsRVuo0X/RmHsBPeSecsdeBLX+GJ3Nra7K2/A3TTzPk4xZjFWRJY5VSwwlKe7AGW4sJQ7q/HZrK5BvwJPw76atAFsOIgGcGjSgAYiho8pXHLwIYwMZfv8Z7KSxxaz9alerSweEYGP6O+S/7LYMcdHPPVzokwNgyIimds/XBVEK+gRjUo/JMy3zBds5dByda2olbYSkl2wzN62ISc2V8l0VOYSxGFpsd9upRhxaUhEeI/JsJ2pZy9DqFNW29CpdPY4uA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KxoNvUrift6rT689igJgBaNyCT00qYD7pXy8Di9nFt54TRdeGg+uc0RU77fvYiS8NtiaMIae3YMHh9owJuY62+zIHUIpsP3nQndY6tOA1THw1zT7xXpdA4aOCEvNleoVct9y0OK5lJ/EMqvA6vzSy0vxLe7qC1n87p8JOPmGcFJkFp9bEb9pVwC0OjFHamyFh1EJ1Nf/r4KK0wRzxawWJhEvwCaTfm+8X5yWb8Oh3rKwS53gpjvNegXo4smyWF3TAwQ/Eye2qMNz/UGq0V/4+tV1YFQQm00glljI11gHgMVX8nbTUeVkn0MgBXIYnoHgd2XcIJRsd/9l9fl4EFKHDwjVQZ1MtU9UQwPNGlg+rMBNZDeOcXJlHtSYZvk49f3KzSd2J1nGORfvsTryy+kSRI/ccqbuWFPab6Lp/iXsgV47+W+xgEa3XGYOZLtXepyB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:42:46.0214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b46eae2e-9678-4dfa-2791-08de9563f3fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_044253_168020_4882A7BC 
X-CRM114-Status: GOOD (  14.82  )
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


Ronak Jain (2):
  Documentation: ABI: add sysfs interface for ZynqMP CSU registers
  firmware: zynqmp: Add dynamic CSU register discovery and sysfs
    interface

 .../ABI/stable/sysfs-driver-firmware-zynqmp   |  33 +++
 MAINTAINERS                                   |  10 +
 drivers/firmware/xilinx/Makefile              |   2 +-
 drivers/firmware/xilinx/zynqmp-csu-reg.c      | 249 ++++++++++++++++++
 drivers/firmware/xilinx/zynqmp-csu-reg.h      |  18 ++
 drivers/firmware/xilinx/zynqmp.c              |   6 +
 include/linux/firmware/xlnx-zynqmp.h          |   4 +-
 7 files changed, 320 insertions(+), 2 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.c
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.h

-- 
2.34.1


