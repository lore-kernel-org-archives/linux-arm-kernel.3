Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394C8C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZoP9RDQfuS31sDhYtr56bPWv4r3Z4neDtjStedSc2c=; b=evXz8lb5ZcP4VdiJBTCR5twxkz
	zUML2tX/3hG1rKAD8Ix5j/RxV763UEfQJXyUHblN+1eJdhPg78La3mJVJ8KHgS3dLoWIt02v9SCwr
	TXfwymn0Xopd2neCA7kVaQsntBJdu3yv76+5IJodSARgosIngJkj54/K2MS8AUYJ8tI+5KBHH5749
	7WI9+8falJkAAF6vQukTnoPWzewU4Umjy+aB1aRwjlEGeHd05dLlJODHrYmLqrj9eoTkBMnZuZEF+
	IW59jCKs6G+Qkzn2yJRdCyBWZ2qF9AYMG6yH8jyFtJy8X+lmec764E5px2Zpe92dI+FJjyEyEEvCI
	Mda+DPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCay-0000000G0e0-2ON8;
	Fri, 24 Jul 2026 09:53:32 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCav-0000000G0cK-2Yju
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:53:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCpFN9yFWPe2FFqe94AtNEqaHTbtSIsKL4g9anITAHg8TDHKB4Z6GmyxUOdzsZ8eF3gEvoGxiEWiLGsy2O6X237g6YZ0e7RAEAsd7Xtu0sARzsR2ZmhiKq0YZVJFDYGnO2fcn9YUkGUhZT4Zp2tYb/TeAvv88mmCBD3le6TW5mFDkaLbfljaGMVuYjIzokD/fPw9kK2I7X5wu0N/EEHAaZ5/Mmfk2GoEfNiNwTFE/HCo1twgav9osO/o2WR8Badg0U++v6qhW0qf3YBXt7Q8XUmGywNYy8rvsuuehrgX1MkB2fcJ/XYFkMpUmffwf8g9imgdG76FKXNUEPYPoGPmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZoP9RDQfuS31sDhYtr56bPWv4r3Z4neDtjStedSc2c=;
 b=AJ9b1pg1SpI2JMHhvcnODHqbC/Fi9/fc4bAyaNdqz0AzsafVbS+5Oy+ctwkjL8YiJgGNgX8rmBFrzU5jxBnDj7VClvySRSw6h02xtpzJt5kXeECrTPJoH3DXI9cnbHSc7LYkW5T4+KnSCHqPVugOtwuby8su5Lz9OhtR9daNAP86V2wWNiffdjGveo2dk+0iJqgE4H1G6XnCEk+1kNSrjeG01UETwmrwxwl3TIyTcIN3tg5K8q43gOLS6zXgmDL1OA3ZyTlRl7pkWe4aX8q85lUdYV+ttByzE3lk6XuKbArIh5Ee4BaoN5J/TOk0TO+/nYvA991ejSsMfpYFRrz0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZoP9RDQfuS31sDhYtr56bPWv4r3Z4neDtjStedSc2c=;
 b=cEeDB9sKO3AKWHq0Z04WxcaM3yDYntSbDjzoy2bhglKSZm3BfR8GOn1uhAY3ZUgIgWvtZ3Wk6blBw1pQX1X7C7CL9QsTSzRdqFh+usuoGm/DeOoX1qc1BmlOcFqSFsyg/3WCqNgjQdUu0ibNpoKNWf5mcSXkIK7d5BKP6I/rWS8=
Received: from BN0PR07CA0009.namprd07.prod.outlook.com (2603:10b6:408:141::8)
 by SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 09:53:24 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::a0) by BN0PR07CA0009.outlook.office365.com
 (2603:10b6:408:141::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 09:53:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 09:53:23 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 04:53:22 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ptsm@linux.microsoft.com>, <radhey.shyam.pandey@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH v2 0/3] firmware: xilinx: Clean up firmware and TF-A state on kexec
Date: Fri, 24 Jul 2026 02:52:58 -0700
Message-ID: <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SJ1PR12MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2e6688-5f2c-4761-cf18-08dee9696695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|11063799006|6133799003|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: DTvlzxnGHp6iC8Pid//mgYdWSggy1aA6PPQ/6S1LvAi7yoZkkIjgxpj3OFZKF67Yhm+9ShmXuMB7Yf6VyL/cEtOssyXEwQ45hwys75dSjR9icZ2zRKj6oR/1iwDKlkYoHn5F9cQX9hldkYuQnGGS4tjEWFKIIkPIKLj9Lmq8kszm9dRC3aNhKTzEw0R1YadZegJBs8TnWqhXxiJgW20y3zSr4ZzEW0iTdwvJ2jju4DqHqid736E4cLmzSLGrpL9SSLZLQPmWflCON9UOGi8+B0n2rT/fyFkUH4sMvTk8tjRz6Bvi8zz4M3YAIgJEShlvL1NuGXQI21awwuePJkK401OKyJRK5Hb5Z45GS/8i6Bim40mnJmTUD88cDQi3DERxkj8tF15ZtSrYPBX57amd5hF6DG0E6ixnglu/mpSgiahpBCAuxbPzyR/IY0pBD7Np/Cl3wIRGlE6FUuX4ifaNO3pLQtsvTk/XIvl0v7QKZiA63bRWLCbtC0LbrmU4KpkdjSkYRV9o6YsxbKHAxLLkb5NrQJSIFCIJMGEGhX0v5MRP7iM/9uMD4WI11yDxaORfJK9FH5k5zKUETkNh5fdk73P/cIh76F3rBwqn0DOlux5pqFT7Zzs881l5xG8kiwCTjwVW+siCdLa6kyV3dW8fZ3ax+S6CVcLq/oaCjoxCabJUizprEwsQuIMRUTO8IavTH1yFB0UYfKbIoV3/+DwkyQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OlTmQoTZ0twhBCIJyr/nahtC6D57gtlSh9ls6XZwSBNqjV/JsZYf+aqt1hKWFy6ks3lieZubM12HNNVYEXVr0a6FuGypIqwFp6pkG8JiXBM8zhbHCeAElkJin/MpXbmT08P/fIuh6aqZS3/KwEwZrhLYFHWJU5sSRvcfYxiVqa/6epUNG7jmfvyOkPV2297Fou4cX0L9ctkLJ3dryM/Uo7aQCWf0RM//eggEredGskD5jWP4MdlERZlEk/tdPOMaTOOKoPV5W7fRKx68je/RGTZ5E8xm0gn4cEe+1uKiLpz42S87u438peyiE8Z5tUCO1jeqPVwRMnL9+NqL9O61m96fcj2ZYim/c/C+Lge2R4FzyLGQ6ad00himu3O+AoltuRpWJXOJ5K7NFK21tK/5NJ6aeiq+TbcpD6fBUn/yItmGMXsQjwoH74f39wBuUA5V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:53:23.4610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2e6688-5f2c-4761-cf18-08dee9696695
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_025329_700493_BAA8C56F 
X-CRM114-Status: GOOD (  12.65  )
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

During a kexec restart, only the kernel is reloaded while the state held
in TF-A and the platform firmware persists. This leaves the freshly
booted kernel out of sync with the firmware for things like the SGI
number, shutdown scope, allocated peripheral devices and registered
notifier callbacks, which can lead to unexpected behaviour after a
kexec.

Introduce a mechanism to clear the stale firmware/TF-A state so the
reloaded kernel starts from a clean baseline:

  - Add TF_A_CLEAR_PM_STATE to clear TF-A specific PM state.
  - Add PM_DEV_ALL_PERIPH to release all peripheral devices in one call.
  - Add PM_ALL_NOTIFIERS to unregister all notifier callbacks in one call.

On a graceful kexec reboot the cleanup is performed from
zynqmp_firmware_shutdown(); on a crash (kdump) restart it is performed
from zynqmp_firmware_probe() of the reloaded kernel. Each cleanup step
is guarded by a feature check so it degrades gracefully on firmware/TF-A
versions that do not implement the new APIs.

Changes in v2:
  - Drop patch 4/4 (feature check improvements) from this series per
    review feedback. Those changes are sent separately as:
    "[PATCH 1/2] firmware: xilinx: Use TF-A feature check for
    TF-A-specific APIs" and "[PATCH 2/2] firmware: xilinx: Propagate
    actual error from feature check"

Jay Buddhabhatti (3):
  firmware: xilinx: Add support to clear TF-A PM state
  firmware: xilinx: Release all peripheral devices from firmware
  firmware: xilinx: Clear firmware notifiers across kexec transitions

 drivers/firmware/xilinx/zynqmp.c     | 77 ++++++++++++++++++++++++++-
 include/linux/firmware/xlnx-zynqmp.h | 10 +++-
 2 files changed, 83 insertions(+), 4 deletions(-)

-- 
2.34.1


