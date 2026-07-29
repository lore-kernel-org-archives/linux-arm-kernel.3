Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D405EC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Z0rGNYfLyn2UM9LMjxnaekW8bXeIQca03QduKS1Svk=; b=TjvW/fo1b5Xrg2MYY3084p4FUw
	9gOWVNRdZCp3HUmrueJSX8GuzGoknY332M16806ZqNpxdU/aE1T2iPVkHFs/3FsPnVaUKydXtNtpp
	Pvsww2BxyX0SxP5uKDxpi0KLbrTpFAu1HE8bC/mZ2+BBSenaD6kvu1CF2lX5Ca+/Je/8sXCs6R90o
	XLRwMsnPCJAZMUrWrIH20g9+lMZLWOXSVS8VIMn6L2iju9Y5PiYpiAwRqRsrbTEUC5BlyWyGM973B
	wmz24JJH4kLGGSu3IaAA6hC87XB1VYTKVLfVZnqoFFQXU9ugfFeEUpASSCKilUrxtVVeVZLynq9i8
	dGzGnAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Mm-00000007u0X-01EM;
	Wed, 29 Jul 2026 12:26:32 +0000
Received: from mail-westusazon11010048.outbound.protection.outlook.com ([52.101.85.48] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3ML-00000007tgL-3rE4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:26:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j66Fe55CSq/0gvSHpYAoflXr926hLnXhCb3j/ac8dvxTDxiccbiH7YOX4FB7Tiab23i0Qy04Ae0zcJ4cSpfWqBNvQsd+/7fEyhfTyHm+uIL0DhY8Vbqfn/BmrXiRpk3P/H2GNsmnpNB13wMZJyOCRfOM4Ff0nigr0VuSxscWD95K+JJHuYhKUnqWRhNoQpWLGSDyXypWols+OUj4Sz78FZhXqOGObYON1T/ny46LOBSB8RzZ6iaugZo6SiYAYqcaedz9akbDHXSRPUO/xTzW/ugZNGGX89JOOtm3TIxuwIPuWFLOrlbn0AYxn3ZqCF8iAnbmk1TQcspbQdXOv5myWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z0rGNYfLyn2UM9LMjxnaekW8bXeIQca03QduKS1Svk=;
 b=HbP4b3Wvkl+O4jf2LNSl8MgcIiZfMs3bPR+HVSTHjubwurV7RdjCnpXthvbsIO6EtkKCvxE4weRV9NuanZYMcG0qc58U+5s4ELXHxHm4cIUG+tGbG9h3GpxCPnuIwcdlu3RfYOcPvfnJinlu4MYAzF4NgTaG4GPFxVJoO9JmMErR3QBW9Emnp54p1JGop7PIe2Gn+3r5NZY2Ns33T3tMMbK7fqB2tgQfVUqv04q/GRYVxk41Jc+28FmG5n9Bzn5/7IeuFdQTDo0PUk+htLYAnzfL2aenVf6ydNNcBjT/+guEmd78pZdxoshHBe5hI3JZxSv349To86AXh1TfN2MifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z0rGNYfLyn2UM9LMjxnaekW8bXeIQca03QduKS1Svk=;
 b=M9fb8vm2TKf4jo7nFgm4xR7iiA6c4EJRD1gLuQ8UMUCUXTnoHB8WjuW6LJRTwRICA9EOSQUpUfknHvOZTUCtDRMRFJo60Ss0qk46df2OgrUVtuaWB+m/z6zU2crFjeyiZUGm0HVXIoOi5aN6SFscZJIl3T6+HEmcf8IxbqCB7IA=
Received: from BN9PR03CA0740.namprd03.prod.outlook.com (2603:10b6:408:110::25)
 by SA3PR12MB7902.namprd12.prod.outlook.com (2603:10b6:806:305::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 12:26:01 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::2c) by BN9PR03CA0740.outlook.office365.com
 (2603:10b6:408:110::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 12:26:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 12:26:01 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 07:25:57 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <git@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH v4 0/3] firmware: xilinx: Clean up firmware and EL3 state on kexec
Date: Wed, 29 Jul 2026 05:25:19 -0700
Message-ID: <20260729122522.3732875-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
References: <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|SA3PR12MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: b00a4bd9-9f78-4e3d-ed7b-08deed6c8d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wA8fpYXZdR0ujVQ2N37Gt0eQU3u8SckNHzcq7Ym0jk7YyDpuyU22wrrZFku0DiBvehW5vfZCRqGMPdBN8M0BGVqQAaK173j0/nzmn1hNOOuFJrBIMj23Yq+gWwzTHgCT+vopPpA/wvjBiD8pX+r5A0hS+43hNBuR+hHgHNTM+KY61ZBwwIUVNvdvjy3PSx1F/YOim0yhWtGB2wDEOxHSDTX3MV8tuVbOPRuqeMo7uhITU89hrJbNb3B7bQlXcSeLfsMmbvltdk6XjyNCvmDDPg6MArMNRh6d01o26lmCgkX/pPnW8spGyB9ZL+F+6tJJeVD2/RdSDFeE+2AwOARP+eNfwaFne/JStad2o8R5pMidd+O+1N+ll9J+FyYjGDYSIWWQVh9DtYNe3UyFldEOXILZjc2SOn2+OCSCNdWaiY7vJHWvqiUUF1dhsiY9i8W6FOfhq9Dvo5RgeAbrwaux3Bs2rAcXPb7fNmBll1a7JajpQBW/IBAsGtHGQOBwbQXGJ0WrrWj8hGwDcDf6PpTM5UmFmUmL5u/OouCI2Z8j8f82f3dnlV62HnYZ5SNqdgAS0+K+n/VCbD+LiQJlhcjUbpNq+9ED+8E6WIClOkckuNuTwdvdVWTLTdyQc+rLH3y2HsW8c28NdCWjv1Qi2z84RR71Rc0IpSqI3l/0L+jbcpUgwvLVJ3UqDuep31OCpjV289GqS9kKF5BOysOL2TRcVA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5g3ZZa0iwVahaXUwBl1LSZBMDJwgQ8cYFvJIjrorRjF0Z5EdUajCGXy+kTAxfE8Y1XBgf2nHyHRE76+HG7I5skjVa2EUzP6VJC9lgrTq3KylFjfdIgPhuuhxUFthvLOKmBiM5eFGgvWo2gKond4Z3NcCVxlUjxivF16r1ZGXGjiw2sgtPLPiYhmEkn9HrW/nY9fE/cntW6oTIDBipIUKR80ib2Ezk66ERH3zijlnvJ6j5+b32DuE0ZKC2JymDHzSxTwaokFVATBPFr137dBJWK+SbAuvjrWU5+fscHhSuqGlrDsvmK2bIF4wNrSunjr4ER/6AuQdoH1eoh4AfXUJJPPNgE9XO6YDCnBLpfD3Ztbw3u7hSx342C/h7j278zcnLEFV8fluBSyJ2ylcj8uvoQWUJZrmZPGFuO1C/cMMt9bZjVY9oqo4emBXQvWjC+Ks
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 12:26:01.3818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b00a4bd9-9f78-4e3d-ed7b-08deed6c8d30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_052606_000621_F078FB58 
X-CRM114-Status: GOOD (  14.64  )
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
in EL3 and platform firmware persists. This leaves the freshly booted
kernel out of sync with secure firmware for things like the SGI number,
shutdown scope, allocated peripheral devices and registered notifier
callbacks, which can lead to unexpected behaviour after a kexec.

Introduce a mechanism to clear the stale EL3 and platform firmware state
so the reloaded kernel starts from a clean baseline:

  - Add TF_A_CLEAR_PM_STATE to clear EL3 PM subsystem state.
  - Add PM_DEV_ALL_PERIPH to release all peripheral devices in one call.
  - Add PM_ALL_NOTIFIERS to unregister all notifier callbacks in one call.

On a graceful kexec reboot the cleanup is performed from
zynqmp_firmware_shutdown(); on a crash (kdump) restart it is performed
from zynqmp_firmware_probe() of the reloaded kernel. Each cleanup step
is guarded by a feature check so it degrades gracefully on firmware
versions that do not implement the new APIs.

Changes in v4:
  - Modified platform check to restrict kexec cleanup to Versal and
    Versal Net platforms only
  - Used EL3 firmware instead of TF-A in descriptions and comments

Changes in v3:
  - Corrected subject prefix

Changes in v2:
  - Drop patch 4/4 (feature check improvements) from this series per
    review feedback. Those changes are sent separately as:
    "[PATCH 1/2] firmware: xilinx: Use TF-A feature check for
    TF-A-specific APIs" and "[PATCH 2/2] firmware: xilinx: Propagate
    actual error from feature check"

Jay Buddhabhatti (3):
  firmware: xilinx: Add support to clear EL3 PM state
  firmware: xilinx: Release all peripheral devices from firmware
  firmware: xilinx: Clear firmware notifiers across kexec transitions

 drivers/firmware/xilinx/zynqmp.c     | 86 +++++++++++++++++++++++++++-
 include/linux/firmware/xlnx-zynqmp.h | 10 +++-
 2 files changed, 94 insertions(+), 2 deletions(-)

-- 
2.34.1

