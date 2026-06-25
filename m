Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE65CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5956J5kL3Xtz9LYUOOoOPaic9spv+4RnQvg+0iqoXaI=; b=fT7A0mWrsbB+rlW0W0w6Ic3QJf
	fOAd3SZpMVWYC8Ef+cYEtwBM9ceBzqScRcxKpeTe5aSGxtCA+8Us201P1VWLl3FiCB0Wcf0Xr2Oxl
	PTh/QyWoD5FVHAIFddvhOlyjH12axChh1fORWefrHm7pBaeupLIcVgw5jZIdDPUxLD1EwKoZ6DkbX
	LH8P4ckZM/zltVSBSJZRVmvj4MGcLD4mnUXIpIFb1VgbarrFss8Vb0aZ+nJoFusO61gLrBi7r6bo+
	PeOPzEvNUnRx2Z8sKYQXOyUZNKIBOFcc3exWkx3V8hI+ioZIk/Jw8yZCgyrdjn7hpfw7cW3s+CBio
	NUoinajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcolT-00000009g2P-0Q9F;
	Thu, 25 Jun 2026 18:25:27 +0000
Received: from mail-westus3azon11011023.outbound.protection.outlook.com ([40.107.208.23] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcolL-00000009fzX-12fr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 18:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/Mk0ursmXFUvNISMxv15DYHQzJAXG62WVW8WHjHSzcqVi2uhlsCFp186IqWfoFVxl48S51UV2vpnVFu8naa0zKclXFvNEQYoxwbYG0XUj3CFWqjlSgLjs5gEV7MjzecAqUqV/V73LAhVMbXC9N+QcrlHRBUshF1R1oSmlFTe294aXSpaYL+IaskkXlZ6HFDybmQprtYT61JVDlx9hmAe7ShjJYhLr8r2JEXQdPL+a2Ug5ezlGCvvfMVyQqWQy8cvKZSHEBUKJ1q/ODvku641LSL52SfDdn1epKKeFjRFcT1w99B7nazLBxgXEegjGGQ3sUWJqFv3Op8E09NZkn1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5956J5kL3Xtz9LYUOOoOPaic9spv+4RnQvg+0iqoXaI=;
 b=mgtQpblutS8Y1syioCg5cEn3HjR5gqbt2RUZWMMTPCRntpBHXSlcN0B5jnON1WVyxsFz666vnI5EuTHR5zx1Ied/M1Uccc+nrFalHzK33r9GUIl55PCN9aRmt0aBdreDiTS6AcEOR5Cc0SL6x0XDbDAn0egvlobc3edHQjXcbj/nfOulIqh2ABfNHsk8bQOWkOjvVe7GPsLx2vE6JeDN38oD6FeaubI4wtNGMnnOwr4M/OkzcUoRgywoPFza2LceQKMnf2z1X2l6anmhxBxiU730DQpZ70wRg8bdSdjRsV+gfOaYb18bgZy9VVbmHHJkMnevB4QcrTdAH62WYruVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5956J5kL3Xtz9LYUOOoOPaic9spv+4RnQvg+0iqoXaI=;
 b=BR62jFmteZiC/PtRl5M8eZji1kYB8045zmPMrRK7eTRzSDGjcw6ED0esXMDmuUZ6X63co02hB68xYVGDDeGGpyQFp47dYKdGAS3GPTC3WIb0c6vlDLN8tCxW6YjQDC5sKQ7g2T5ze1+YamiJycngAmMVCg6mct3HNjp4FN21v980cr3YOC7t7RhbAyRBrlTq0FZYdghXMwK7Nu5ca+anHgjKw0Up/gfDq3baCMF6ZNzCLtya07AHZHQub3oCSocTx9gzcveYnhVQISq7bwV7rgPM1rKdk7EWtdUOR0E9aNvI59k9PJx5kw0QNk8Bsg6ZK8uTwLRj+gZYVH/C37dW2A==
Received: from PH1PEPF000132F2.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::35)
 by SA1PR12MB6704.namprd12.prod.outlook.com (2603:10b6:806:254::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Thu, 25 Jun
 2026 18:25:05 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::3) by PH1PEPF000132F2.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 18:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 18:25:05 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 25 Jun
 2026 11:24:45 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 25 Jun 2026 11:24:45 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Jun 2026 11:24:44 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <linux-arm-kernel@lists.infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>
Subject: [PATCH v4 1/2] arm64: errata: Workaround NVIDIA Olympus device store/load ordering
Date: Thu, 25 Jun 2026 13:24:24 -0500
Message-ID: <20260625182425.3194066-2-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625182425.3194066-1-sdonthineni@nvidia.com>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|SA1PR12MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c7d90e-42e1-4f70-0ba6-08ded2e71492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|22082099003|6133799003|3023799007|13003099007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: gsUX+Y84zBSlBPSuQisKAA2RYJ6MpMXyopsbRMbxYRdPHSeelC0SxyfBrGRlYiP/QZwmdyu6ZO22aaGt9jxJMkFkhHbAceD+JQwZqjbZN/Y93+6WnVL6IqP4QEIwEV1TLJ/zaSyPErBPdvvSKPdMOdasn8WybuIbdRULVCIxGuR3cQ5d6dVP9wfMlUBKnNkEg7c2NStjQsgR2lQ3X6Ead1gUzRmtC8CGyrOmtx9IXNH/wruoYN19onEq1jb+s9PK5KW+92VoH/XlYJDjOZ3qnmWQjzPH9mQLpt/Wi1PBPF+yDg2KZZ6BThOZu00nmEvZMaEHQi8lFwMqH8wLhKgFJQOBEHf3RtwfgbQZVQqDoIG1sptphFE5THDv+wyzJ6q8AXF9iXIW5jbJzaQ/nzYMOb5PYYDXzFql3h7sTCBhJl3n+VTSPudgObOKLcOQhARVYIAQzt7lArSZ9cqXJGr2Mq2h9xHKWDHDA34jlq4wCy6ldobdaHtfj1Rm8/AgRNisU4lxutTOZs/lhJQwvagEe+zLsXpUzId+O5+RA8RkwaCgJrnCjdok17qyjhwjensJmsw33v/o8QywkYHj3Ph1htglTu3BUZVufxfhV8INNLemWva5+1daa78yZbLCIp8fNaCU2saQq6/Iu7fURRXUWuvHUSLwQlNHkZoga6dAI7eSW0aN9nIyS5cZT83gcSakmAxV3B/4mzXcxDtUgLZaKg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hkbqrpr+eimF5EzvX7HSHUFSwnaogcPXpuzyODwVx6snFjOas2bgpfvIVulQFejzzYl3kN3HuvFIRxqtv5zfyFCDFtHEVXKJXUY21AtRG30xasEddt2fZVA78I9ylfZMZzUJSpFJv14M7G7WYZV8SRjwZZBqzm8ecnT6Mai3K/YWhCc4fA+aQPtuNvfvxS7xKVBm5dtL8f3Cjiq/B7dIiiRL+OwSg0tGMWlE+MjTOmrZ4Vx+y8EGnGZSEvL1gA4ZNY5LY1dK27L22TEyYI0UDX/3QdALYEz2ZkqNqe+wgy0Sfpk0OudQmJ7qAdth32nCEeqTm9XnDehiGhpsANOKJzvawMZZK3hyR9wmo93CmiPHAw4UmJ1Nu0ovzqT/cEgdYVhxUDJqGLCNcdy9S6ZzgaB8pEQ/quDgyqUCzDlEX0xpo3vj91oaZFLP007POV+W
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 18:25:05.6330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c7d90e-42e1-4f70-0ba6-08ded2e71492
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_112519_316232_F44C3F59 
X-CRM114-Status: GOOD (  24.21  )
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

On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
observed by a peripheral before an older, non-overlapping Device-nGnR*
store to the same peripheral. This breaks the program-order guarantee
that software expects for Device-nGnR* accesses and can leave a
peripheral in an incorrect state, as a load is observed before an
earlier store takes effect.

The erratum can occur only when all of the following apply:

  - A PE executes a Device-nGnR* store followed by a younger
    Device-nGnR* load.
  - The store is not a store-release.
  - The accesses target the same peripheral and do not overlap in bytes.
  - There is at most one intervening Device-nGnR* store in program
    order, and there are no intervening Device-nGnR* loads.
  - There is no DSB, and no DMB that orders loads, between the store and
    the load.
  - Specific micro-architectural and timing conditions occur.

Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
to stlr* (Store-Release) on affected CPUs, which removes the "store is
not a store-release" condition for every device write the kernel issues.
Because writel() and writel_relaxed() are both built on __raw_writel()
in asm-generic/io.h, patching the raw variants covers both the
non-relaxed and relaxed APIs without touching the higher layers. Note
that writel()'s own barrier sits before the store, so it does not order
the store against a subsequent readl(); the store-release promotion is
what provides that ordering.

Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
plain str* instructions.

Note: stlr* only supports base-register addressing, so the raw MMIO
write helpers use a base-register str*/stlr* alternative sequence. This
gives up the offset-addressed str* code generation introduced by commit
d044d6ba6f02 ("arm64: io: permit offset addressing"). A static-branch
implementation would add extra control flow without preserving the
desired offset-addressed code generation in practice, so use a direct
base-register str*/stlr* alternative instead.

For the write-combining copy helpers (__iowrite{32,64}_copy()), the
contiguous str* groups are kept, because replacing those stores would
defeat the write-combining behaviour used to improve store performance.
Rather than rely on the relaxed, no-ordering contract of these helpers -
which would leave affected CPUs behaving differently from every other
arm64 system and exposed to any future driver that depends on ordering
across such copies - the DGH hint emitted once after each copy is
promoted to dmb osh on affected CPUs. That orders the grouped stores
against subsequent loads without placing a barrier in the copy loop,
while unaffected CPUs keep the existing DGH hint. The single-element
case of __const_memcpy_toio_aligned{32,64}() likewise uses a plain str*
(instead of __raw_write*()) so it shares that str* group + DGH path
rather than taking a per-store store-release.

Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Link: https://lore.kernel.org/all/ajVZBJgKn-5sxHD6@willie-the-truck/
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 25 +++++++++++++++++
 arch/arm64/include/asm/barrier.h            |  4 ++-
 arch/arm64/include/asm/io.h                 | 31 +++++++++++++--------
 arch/arm64/kernel/cpu_errata.c              |  8 ++++++
 arch/arm64/tools/cpucaps                    |  1 +
 6 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index ad04d1cdc0f0..c4137f89acef 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -298,6 +298,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
 +----------------+-----------------+-----------------+-----------------------------+
+| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
++----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | Olympus core    | T410-OLY-1029   | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 10c69474f276..da4e66b19209 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -564,6 +564,31 @@ config ARM64_ERRATUM_832075
 
 	  If unsure, say Y.
 
+config NVIDIA_OLYMPUS_1027_ERRATUM
+	bool "NVIDIA Olympus: device store/load ordering erratum"
+	default y
+	help
+	  This option adds an alternative code sequence to work around an
+	  NVIDIA Olympus core erratum where a Device-nGnR* store can be
+	  observed by a peripheral after a younger Device-nGnR* load to the
+	  same peripheral. This breaks the program order that drivers rely
+	  on for MMIO and can leave a device in an incorrect state.
+
+	  The workaround promotes the raw MMIO store helpers
+	  (__raw_writeb/w/l/q) to Store-Release (STLR), which restores the
+	  required ordering. Because writel() and writel_relaxed() are built
+	  on __raw_writel(), both are covered without changes to the higher
+	  layers. It also promotes the DGH hint used after write-combining
+	  memcpy-to-IO sequences to a DMB, so grouped stores are ordered
+	  against subsequent reads without placing a barrier in the copy loop.
+
+	  The fix is applied through the alternatives framework, so enabling
+	  this option does not by itself activate the workaround: it is
+	  patched in only when an affected CPU is detected, and is a no-op on
+	  unaffected CPUs.
+
+	  If unsure, say Y.
+
 config ARM64_ERRATUM_834220
 	bool "Cortex-A57: 834220: Stage 2 translation fault might be incorrectly reported in presence of a Stage 1 fault (rare)"
 	depends on KVM
diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
index 9495c4441a46..22792d1305aa 100644
--- a/arch/arm64/include/asm/barrier.h
+++ b/arch/arm64/include/asm/barrier.h
@@ -38,7 +38,9 @@
  * Device-GRE attributes before the hint instruction with any memory accesses
  * appearing after the hint instruction.
  */
-#define dgh()		asm volatile("hint #6" : : : "memory")
+#define dgh()		asm volatile(ALTERNATIVE("hint #6", "dmb osh",	\
+					 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)	\
+				     : : : "memory")
 
 #define spec_bar()	asm volatile(ALTERNATIVE("dsb nsh\nisb\n",		\
 						 SB_BARRIER_INSN"nop\n",	\
diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 8cbd1e96fd50..69e0fa004d31 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -16,7 +16,6 @@
 #include <asm/memory.h>
 #include <asm/early_ioremap.h>
 #include <asm/alternative.h>
-#include <asm/cpufeature.h>
 #include <asm/rsi.h>
 
 /*
@@ -25,29 +24,37 @@
 #define __raw_writeb __raw_writeb
 static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
 {
-	volatile u8 __iomem *ptr = addr;
-	asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("strb %w0, [%1]",
+				 "stlrb %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writew __raw_writew
 static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
 {
-	volatile u16 __iomem *ptr = addr;
-	asm volatile("strh %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("strh %w0, [%1]",
+				 "stlrh %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writel __raw_writel
 static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
 {
-	volatile u32 __iomem *ptr = addr;
-	asm volatile("str %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("str %w0, [%1]",
+				 "stlr %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writeq __raw_writeq
 static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 {
-	volatile u64 __iomem *ptr = addr;
-	asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("str %x0, [%1]",
+				 "stlr %x0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_readb __raw_readb
@@ -178,7 +185,8 @@ __const_memcpy_toio_aligned32(volatile u32 __iomem *to, const u32 *from,
 			     : "rZ"(from[0]), "rZ"(from[1]), "r"(to));
 		break;
 	case 1:
-		__raw_writel(*from, to);
+		asm volatile("str %w0, [%1]"
+			     : : "rZ"(from[0]), "r"(to) : "memory");
 		break;
 	default:
 		BUILD_BUG();
@@ -235,7 +243,8 @@ __const_memcpy_toio_aligned64(volatile u64 __iomem *to, const u64 *from,
 			     : "rZ"(from[0]), "rZ"(from[1]), "r"(to));
 		break;
 	case 1:
-		__raw_writeq(*from, to);
+		asm volatile("str %x0, [%1]"
+			     : : "rZ"(from[0]), "r"(to) : "memory");
 		break;
 	default:
 		BUILD_BUG();
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 4b0d5d932897..76c1f8cf1ee0 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -839,6 +839,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
 	},
 #endif
+#ifdef CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM
+	{
+		/* NVIDIA Olympus core */
+		.desc = "NVIDIA Olympus device load/store ordering erratum",
+		.capability = ARM64_WORKAROUND_DEVICE_STORE_RELEASE,
+		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
+	},
+#endif
 #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
 	{
 		/*
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 811c2479e82d..d367257bf770 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -120,6 +120,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
 WORKAROUND_CAVIUM_TX2_219_TVM
 WORKAROUND_CLEAN_CACHE
 WORKAROUND_DEVICE_LOAD_ACQUIRE
+WORKAROUND_DEVICE_STORE_RELEASE
 WORKAROUND_NVIDIA_CARMEL_CNP
 WORKAROUND_PMUV3_IMPDEF_TRAPS
 WORKAROUND_QCOM_FALKOR_E1003
-- 
2.54.0.windows.1


