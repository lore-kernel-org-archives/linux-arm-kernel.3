Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB60BC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yWHJjmdfLV0NU3EtJu2D7g4FdTmcoRzMNltgii4Byo=; b=je1moe73mvCPSjG7qJ19g2/8QT
	TI+i0Ceb4jcDCSaP1nakMtZGPJ9hmJDWUmYhnRtItjkjGE4cb2lhWvpb1ym2IM09QGfKpaRu2TsjU
	GBt+G5SCRZjCEMBrQ/4zW1MFHc/t+xpTtw2VsMc+3fISHI1RetDGRoG8WC1rR7DXoQHosRPjz8An7
	hhD8LqmMQTM7NPHAOkgBPCF2N2cJq2ty4gY2y95e7GoLf0PXZSdJeKguJgAN94G+KfEVx32WyMj9I
	xnECENKsPPmVc2utq6YHF7QriRgC2FIqIfbRIK0FQHjOyZuVzL7xhJ+jBMkUNFEm2RExyHuRWmZvb
	auteGMJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD19-0000000G40I-1Gxt;
	Fri, 24 Jul 2026 10:20:35 +0000
Received: from mail-northcentralusazon11010027.outbound.protection.outlook.com ([52.101.193.27] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD16-0000000G3xu-0KGO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:20:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S65+n0glA55dXYu1BoRza0T5eJlMrhfMeROug8dpqVv9G8nGfKfGhnFagPOSYd4UbNi43NWN1sygSenZ4lQ3unBsxfjG0VB+rWZFxZbMV5/umA+PJeqFj/o02Vms1pXwZQqury+/vXZ7s6xNUr3MRLr9J7km9+wKELVAq8M2vg37CUv6CX9XIsBFym6Ib1oigJWxRuy4iIp4t6muLqUI62VrRFy7TawD6O9/ebGSMwSjCqUQLJbFTmSffD817fSa9P/xg7z1AvuCdzeSZ132FP+3ABn9c8Yij7vclQBuEcYEVgb/Ofbk6aqUd+4M6lABx6GePIFu53DqOnqpXcpbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yWHJjmdfLV0NU3EtJu2D7g4FdTmcoRzMNltgii4Byo=;
 b=u+Nui9XG4tctjG3SjtLMPl47sUpNesrpKGik6hgGPr5n/gSV6fP46IdHi4Os7z+48iLT5GuyQvMVdcyAvn1o3bmSeGbu6boKdBnYmP0YuyC2PbxK0F2qVs9H4YEOx6mfeCy1oTA7zE9S7lY5hY37JWTlmqq5P3bdBdhiQ8TKjb4BtFZJlnic9tfPRwQgfvFiINt304CGBuilnIwi2BEO/V2oJA7lCYKusyOEdfntdr6zxPHhGVahiQ4KMMUtJ3W9s+eK6xz81j/k43bMlmiRCe96wYowUyyGwe+g+SHm/sTQ+NEuqAdObwPqlAvWnSzY3LYbB6/kkuG9J4bYEEqeyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yWHJjmdfLV0NU3EtJu2D7g4FdTmcoRzMNltgii4Byo=;
 b=EXLnq8cd1e52Bcf150NnouCu0U6Iozy9FYzgMeT0kxMYCkl5XUN8oDSULG1rYjAfLLDfnlWyF5VOd166C/SG9/KxcCyg8kDm2nPKEw4g9MD/oZWyspkHRMX2EAFjoVQv2+7pBJoMLxP+6lG816YruCOOiBVNrmxJC/84ZHcGirs=
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by MN0PR12MB6104.namprd12.prod.outlook.com (2603:10b6:208:3c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 10:20:26 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::68) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 10:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:20:25 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 05:20:24 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ptsm@linux.microsoft.com>, <radhey.shyam.pandey@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH v3 0/3] firmware: xilinx: Clean up firmware and TF-A state on kexec
Date: Fri, 24 Jul 2026 03:19:45 -0700
Message-ID: <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
References: <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|MN0PR12MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 6197df68-d239-40d0-566f-08dee96d2d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Xtkcp+yp+g6qD6f76ZJlhHNb8HrIYpsVWwYC8bBAtjk3QPb5qA9Jk88Pe9L+S5iwVytUIYXUUEjcrSIwU9+Rn1ONJJiqHz1rGCQ7rWXA9c+zAsuAzOVubPndbiS/8OvLRdsw1jQMxjTuC7Y23biAfssBkUFPOtN7uhZc8QtJlxgJWGshTE+SOhaS8VxzIxJEXAEmR5oap46cNBL+cL8kfXCiRrepiEnPKRz0n+G1Rr3XIDxr7KbcI45u99uqerzA0smMZKtANvGSTAcirc7mouRy6feLvz+Z9ZkqgSFGK4AzBCuE61sASPbs47b+qwkTjxNNKhHzq0+dhs6csrxqlkfZM+ZIGK6Me8Lq9efScgUm1zYZmNWDw7sVda9OyBUeELGeMt6yEWBqeA3PMXVKLmX9Bud73yHmwy04+fFDh000oL0Igi1pQdTj8PQhXWv0khGZnirnceaqGuRWAh8RivRiIxg4bay9hNUfIpvD2JbdtSIyAX4blD9q1+1dfCGMK7S50MXo2llQG6bGeY6ftrwU+FehghW+aQW0PQvoVgXohmPF42CEeeCRU91LR7C4rOHhtXyiQ+PFckwU9U7x4+2d2HqSQ+CHJvqX5PVWRlx1n3PAuiLFuW7HUxUXArahEsGAkt+hcaGgY4s413dGub6SBLFItac/sxscgk3AvFJAM0qtOiCrkyp+bvBfkNjYPhSzm73P+IyclffVbbi6gw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ir/g+6y7Ulbmi6Y6tCPv3fuc24+Rx9ZMiejxe+Rl5x26UX4eSfziQPz1eQ1To1on6ndoLwcCAC+MHbH1cz7Y7gOqKBXT7unB75H+u9er18xDAjB0IobCidT9RgJUqJkmGdYVOk3rJBXV15ii1/NQumjyEvwhZUHSFGhXOHveYxAClnaNiyh+DhrN37ZmWQOrg9fkhYEu6+k38Y8Oq/5UFaxhLWBG5MCKL5uQ6l/+VVYisCKtA/t6sWJTaY0wgh0YAvonDwNEI+W/enbvaaJ9+RP35DAqVhnOQoyUe2JXizNNQKKhBBgkGihR4vjteDPPiba17REyAJlXHD1SiVB3nKxY/3bPHsDluYSkSJaPoBDQ6Fgb2FcuorWVJGs4NbWb8nLxSCkgSuGkhG0weedtMra3vWs6Tev8o/vBTWwqgejL2dDsKeZdTwQl7xohiHIZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:20:25.3239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6197df68-d239-40d0-566f-08dee96d2d4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_032032_129937_D1F93063 
X-CRM114-Status: GOOD (  13.18  )
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

Changes in v3:
  - Corrected subject prefix

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

 drivers/firmware/xilinx/zynqmp.c     | 75 +++++++++++++++++++++++++++-
 include/linux/firmware/xlnx-zynqmp.h | 10 +++-
 2 files changed, 83 insertions(+), 2 deletions(-)

-- 
2.34.1


