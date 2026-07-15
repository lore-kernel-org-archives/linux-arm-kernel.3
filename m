Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9DFC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 20:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uDgXUuVQoBIL9ZYJrBHwWmD4XomyrVP/6QluVeWBDsM=; b=vIo6/+Rues8LmkTshMTLRHSaZl
	+Fy0ZzlwnJqw//73Lh8CgTDmBLa1zx5cO8qcItbjpsQkVNvhgzYd/vr9+CTL4n3RZiG+oNIg/x1fu
	Y4rtpXXTJglzcmn0kVoor4X3sGDbMyio2S8HOdn74QHxLRslKoibl227VtmLGlveHEdZ/X4PQIDwv
	L5vSq5qepUMcLt+RlkTUN2gNXE2MIpqFURn7Uif/wcsYu4k4XtX8La7TWatqCVOsV6WhLJj9PRKYR
	kOgxTzpXD1EYDfUaBQl+nQCab3hy7aVU/Q8k78qwiWsBq7OZ+8qVrcJBS2c3jzG125vphc7x53iDV
	OwvSG76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk6Xq-0000000Fu7Y-2Oj1;
	Wed, 15 Jul 2026 20:49:30 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk6Xn-0000000Fu6z-0Fx8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 20:49:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFS8T+6A7iFP2dQX8PiWmC7iGexkjsAgxdBveauGMaRW5aTmH/WDpTeUUPME5feifr+ZKKCPO/42vBVdtOlk395wqEvhhBfb2UR0mpnc+vFylOMhnB+998rBPG3rX9aePtGa9BslXvnM7+/XRuapvlLOwj8O9apuFz+WYWo7wRKIy2Uw96HASFnKZWsnoP4ndJS8tfhn16e9fCCNsB9wsYs0jPyEhRYQkYoKREn+0JttxC+XbwP82fnM/8CgklsT0KNuEsEizk1daWXceNzr1tiLZjbXCyOFSbcyejRY5iuI6jO6uQmiijUtIm+BIEeKMpYAOfus+BQZ5Qh1TOYsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDgXUuVQoBIL9ZYJrBHwWmD4XomyrVP/6QluVeWBDsM=;
 b=Qw/mxwRPUpUbRDHTGhQqoqVc6nDIU8ASRj+3G0QzADUnkLbA3YniK7vKVesO7gFIUMVx4bULxWOq3ORuDuLOJbWIZzehfdhZTtaD/3sjjzRFB/n9g2DP8blkwT1w0M3vou9s84Z1DCIxTTnWNMGZhkAh/oxf/DTxH7/iqxYF048hnpRfCUgzUUFybbS+u+vYCpZBrATih2Y05nBVuxqc757vG6M9A9CkgNGL5O6wjir97sU6gzZxAUM8I5kh1yZw7vL8iIRGxGLU+CYY20zmdAjhYnPEf//Ft8xlt2hWBro6wYkixYAiI3GrUwsSL2ZCjhq5pYhA+KFyOMoZBWm8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDgXUuVQoBIL9ZYJrBHwWmD4XomyrVP/6QluVeWBDsM=;
 b=hwQMrmpXzeeTyEK4SD01IqQdGIWBD22Ef+le7hVgGi0ek6FCM0kqbKbsM+1kKUZ6X7ZdM5OKyEWdql6yKgqufRLQvksbjEl5LZPhDRFeEKqCI8vAWzWdfZGzt1MPCS36P9Ys+hx0lmKRaN7rvUgHPfdA0h9RO67/E+KuqR4R1ibabl3M5wbht6AV86gXR4keX6ZxSfbtgaj4H99bjDmCP11NSQZo/v8AvDETuzuAnXb3fv5JoiCMuVhA4Mkn3vkpUEBqe5O2hIuJAfHcefpEX1J7qi2l7qn93z0su5qF2La1acd0rfI9fxU8ygahTk8o6aYmUQK6JZHHd/09cmWOVw==
Received: from DS7P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::15) by
 DM6PR12MB4057.namprd12.prod.outlook.com (2603:10b6:5:213::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.18; Wed, 15 Jul 2026 20:49:14 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:1ca:cafe::64) by DS7P220CA0008.outlook.office365.com
 (2603:10b6:8:1ca::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 20:49:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 20:49:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 15 Jul
 2026 13:48:59 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 15 Jul 2026 13:48:59 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Jul 2026 13:48:58 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <linux-arm-kernel@lists.infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>
Subject: [PATCH v5] arm64: errata: work around NVIDIA Olympus device store/load ordering
Date: Wed, 15 Jul 2026 15:48:56 -0500
Message-ID: <20260715204856.3707449-1-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|DM6PR12MB4057:EE_
X-MS-Office365-Filtering-Correlation-Id: fc98cbf2-f10b-4318-9cdd-08dee2b287d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|6133799003|3023799007|18002099003|56012099006|11063799006|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: iKOHokhhjd0EHW1B+1WSr8qes0Ac/Be/ijbI5WMy2tES6v+mlKiipR+e+FJ3uKjWouv5j5bn0c3nwwq4Gf5rU/a0k1Lmisf9vMg03A1EuQpHAGhXBwBKbFt7R/PsgVRAOjaHSmaJ9beF5Ys+OTqgezIKuiQ5H17nFto/GxIETmUZcIFAcrmDYT5xwFOzhYqVXLOE/pHHKiBbIs3s3k+fqeEIKyLtCWJK58jr9RvTa3PDKS9t6SFg9RFfkBNKjKGKgzVkerumUbBnj8h/i0rZjK/4L+Zm5i10mqo135VC0Ec6QlCzGYb1rVzaRD5u0fEoh0J/5+59JVNht8VrQBCjkg9zT2MtO2R9hk6MVvyNZYxuApkVcXNNrvFSEt6ef0oBWmhHrrzqDO32JEsp+QaR+TpMLos70+DhIIOk2o22YDeSnCIURNJ6KfHLayKYcNRFxzpEq63Yg4/IzoMlSdpgET+/AmkwlrUoZxH+f7mFnqU5SMlMAKi0FtcOQud32lB85owol9eqLsqF5o8F9xBRXlZYfhB4t7LVmEbGSX4inOpYiSSMknBIaBevTjfYMg35/jAsVKW+gqXjRfYxL7OXb2NZs7G7z4hje3FPTiwcKYWbL5BWHbooH2ZvOkN1tVZQoD1NKszlv3FbS2Hnxe1tncxtIG0O67L84/Y8GymLIp6n2eyaXTXT2EudWv2sf9FoCbrUcsyjQBuFi/u1xoet0g==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(6133799003)(3023799007)(18002099003)(56012099006)(11063799006)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rHZTHR1fUiZltkbwWJ7CgNncCIPGd+jpM2lVAdfsENB6r2mfnZmcWv03gyP3LCJ9nmiYlhimz3cd1Jqv9MS+lUlmBj2hk/Txq9E+uxdl4il5N79BjQwkBjh+k+WguDneqakwWeQIw80Z5bXMw4IeG7Ft4tMBRObSUJcoKmGUPpYJtPQED9SYPrLF0STBlPQmTUxNUJwL7wh37QkNX2978rCvldfgcCmQ65TArb4Zn6YqvISs2t/2/bBIhu0cQKVHBPtyqHWXswucqI38OgnsDJOzUkhzxihJWS/IAPiydTxCAcyjHBquRQyod2Idca70WJYDSQ7R+8CQmAdDax/7+5VNxUWhNWZEG8ovnu6/lb3UPQ0TUFuiwlQR4pY/WEfp10KvNcFMQ4pt6kmG8yJbg4coh5W7FWJg7P8WBIJpIyxFpKI524NAQKY25lG/JDu9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:49:14.2696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc98cbf2-f10b-4318-9cdd-08dee2b287d2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_134927_754043_886CA5E2 
X-CRM114-Status: GOOD (  22.96  )
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
peripheral in an incorrect state.

The erratum can occur only when all of the following apply:

  - A PE executes a Device-nGnR* store followed by a younger
    Device-nGnR* load.
  - The store is not a store-release.
  - The accesses target the same peripheral and do not overlap in bytes.
  - There is at most one intervening Device-nGnR* store in program
    order, and there are no intervening Device-nGnR* loads.
  - There is no DSB or full DMB between the store and the load.
  - Specific microarchitectural and timing conditions occur.

Insert a DMB OSH immediately before each raw MMIO load on affected CPUs.
As a full barrier, DMB OSH orders the older Device store before the
younger Device load and prevents the erroneous observation.

Add the barrier directly to the __raw_read*() helpers, independently of
the existing device-load-acquire alternative. On affected CPUs this adds
one DMB OSH per raw MMIO load, including each load used by
memcpy_fromio(). On unaffected CPUs the alternative remains a NOP.

Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Link: https://lore.kernel.org/all/akPQ8F3OgER621UP@willie-the-truck/
---
Changes since v4:
  - Reworked the workaround following Will Deacon's review: leave the raw
    MMIO write helpers unchanged and insert a DMB OSH before raw MMIO loads.
  - Use DMB OSH after hardware confirmation that it fixes T410-OLY-1027.
  - Dropped the separate memcpy_fromio() optimization patch because the
    benchmark showed no noticeable benefit over the per-load workaround.
  - Updated the cpucap, Kconfig help text, and commit messages for the
    load-side workaround.

Changes since v3:
  - Split the workaround into two patches: the erratum fix (1/2) and the
    arm64 memset_io()/memcpy_toio() block writers (2/2).
  - Reworked the raw MMIO write helpers to use a direct base-register
    str*/stlr* alternative sequence instead of a per-write static branch.
  - Covered the write-combining __iowrite{32,64}_copy() path by patching
    dgh() to dmb osh on affected CPUs, keeping the contiguous STR groups
    and the ordering barrier outside the copy loop; the single-element
    case now uses a plain str* as well.
  - Added arm64 memset_io()/memcpy_toio() so the byte/word block writers
    take one trailing dmb osh instead of a per-store store-release.
  - Updated the commit messages to describe the offset-addressing
    trade-off.

Changes since v2:
  - Reworked the raw MMIO write helpers so unaffected CPUs keep the
    existing offset-addressed STR sequence, while affected CPUs use the
    base-register STLR path.
  - Updated the commit message to match the code changes.
  - Rebased on top of the arm64 for-next/errata branch:
    https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/errata

Changes since v1:
  - Updated the commit message based on feedback from Vladimir Murzin.

---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 22 +++++++++++++++++++++
 arch/arm64/include/asm/io.h                 | 16 ++++++++++++----
 arch/arm64/kernel/cpu_errata.c              |  8 ++++++++
 arch/arm64/tools/cpucaps                    |  1 +
 5 files changed, 45 insertions(+), 4 deletions(-)

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
index 10c69474f276..73e3e68db161 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1363,6 +1363,28 @@ config NVIDIA_CARMEL_CNP_ERRATUM
 
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
+	  The workaround inserts a DMB OSH immediately before raw MMIO loads.
+	  The erratum cannot occur when a DMB that orders loads appears
+	  between the store and load, preventing the younger load from being
+	  observed before the older store.
+
+	  The alternatives framework patches in DMB OSH only when an affected
+	  CPU is detected. Other CPUs execute a NOP in its place. Disabling
+	  this option leaves the original MMIO read instruction stream
+	  unchanged.
+
+	  If unsure, say Y.
+
 config ROCKCHIP_ERRATUM_3568002
 	bool "Rockchip 3568002: GIC600 can not access physical addresses higher than 4GB"
 	default y
diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 8cbd1e96fd50..6d6d54c1b74c 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -54,7 +54,9 @@ static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 static __always_inline u8 __raw_readb(const volatile void __iomem *addr)
 {
 	u8 val;
-	asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
+	asm volatile(ALTERNATIVE("nop", "dmb osh",
+				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
+		     ALTERNATIVE("ldrb %w0, [%1]",
 				 "ldarb %w0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
 		     : "=r" (val) : "r" (addr));
@@ -66,7 +68,9 @@ static __always_inline u16 __raw_readw(const volatile void __iomem *addr)
 {
 	u16 val;
 
-	asm volatile(ALTERNATIVE("ldrh %w0, [%1]",
+	asm volatile(ALTERNATIVE("nop", "dmb osh",
+				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
+		     ALTERNATIVE("ldrh %w0, [%1]",
 				 "ldarh %w0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
 		     : "=r" (val) : "r" (addr));
@@ -77,7 +81,9 @@ static __always_inline u16 __raw_readw(const volatile void __iomem *addr)
 static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
 {
 	u32 val;
-	asm volatile(ALTERNATIVE("ldr %w0, [%1]",
+	asm volatile(ALTERNATIVE("nop", "dmb osh",
+				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
+		     ALTERNATIVE("ldr %w0, [%1]",
 				 "ldar %w0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
 		     : "=r" (val) : "r" (addr));
@@ -88,7 +94,9 @@ static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
 static __always_inline u64 __raw_readq(const volatile void __iomem *addr)
 {
 	u64 val;
-	asm volatile(ALTERNATIVE("ldr %0, [%1]",
+	asm volatile(ALTERNATIVE("nop", "dmb osh",
+				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
+		     ALTERNATIVE("ldr %0, [%1]",
 				 "ldar %0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
 		     : "=r" (val) : "r" (addr));
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 4b0d5d932897..740ba3d51e30 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -839,6 +839,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
 	},
 #endif
+#ifdef CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM
+	{
+		/* NVIDIA Olympus core */
+		.desc = "NVIDIA Olympus device store/load ordering erratum",
+		.capability = ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027,
+		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
+	},
+#endif
 #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
 	{
 		/*
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 811c2479e82d..8d919b6699f0 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -121,6 +121,7 @@ WORKAROUND_CAVIUM_TX2_219_TVM
 WORKAROUND_CLEAN_CACHE
 WORKAROUND_DEVICE_LOAD_ACQUIRE
 WORKAROUND_NVIDIA_CARMEL_CNP
+WORKAROUND_NVIDIA_OLYMPUS_1027
 WORKAROUND_PMUV3_IMPDEF_TRAPS
 WORKAROUND_QCOM_FALKOR_E1003
 WORKAROUND_QCOM_ORYON_CNTVOFF
-- 
2.54.0.windows.1

