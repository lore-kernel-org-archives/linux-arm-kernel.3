Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208BFCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RcEbOlmEhH2BkkJw1seheB5K+zKX3a2//GPGGg++i7k=; b=s53RFE3H7DlPWRPzEdiCtUP0dL
	upscUIbjmQh5Fq2PzkF7xuaJkgGxNoR/w4lKZULG+v1tzKxQ8UypYzuQYTmRQTvcQ1JjLsLMvGnp3
	SedDjgzQqhxf/X/QWTk0SGweNBa2GJVQgwiPg9CA5FugtBdXwFJ8hyrHo+QOfvU4iNqHUNZqT0Czr
	sYJulxKrJzGt4B3CwFRxe42cx51lKWAkmyH+Oc+UocW/cW/4l0GJREQLVT7If9liijqhyTeEZfgpH
	AM0bsOEW3Wj+9OLZmKWR2Tr1zI4GsqfXSd2ahpQt1cDDLBwsXGmfYZ9PXRu0vXve670fq3blokAQf
	mPXc/EGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXM7a-000000089or-1lrs;
	Wed, 10 Jun 2026 16:49:42 +0000
Received: from mail-westus2azon11012015.outbound.protection.outlook.com ([52.101.48.15] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXM7X-000000089oU-3YLj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 16:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCwu6LRU5Bbudfy/nxSmP7Co+VZFWDYhBLur+wOw9bw8m9GSgRIsHziXnPrDuOiHEwgcDSwZNYiYjRuf1BLlA11lLHeoNoWib3Yc9FuHMK2IfmpmIFB6m2RpulHvDNLCgbTUcarqEBK3DwJLsDMXwOCYzZmv5S3/hax+TE8YR9euMyGOIxrRBBX7hSu83EdqAQIgeHkWldB8hmyg6Dou0r72/J3jgnAmUDQT4hfXFATmLGovdFjAutSYzA1za+q25dR3WBhf0cPycA1C7KIUPXID9a6rI4QeMFXqOCo1gFcyUnhG4l7/wpGw2rs/MS5fOEZ2fAwXKkRdf87Ay3ePow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcEbOlmEhH2BkkJw1seheB5K+zKX3a2//GPGGg++i7k=;
 b=NBCG2j0Qz0UBjua4VuFc+JXBee0I4veIeDjj5gcWSfLFeu1FE1ycsCJftOIgsNPI/ldqEyWxg3oUN+SPEQCLxA8QEaw9hSnTGdpizX9MUB0i0yDIWhgcn+x+uyoFvwZCL4hrWGBkuzekXCGjcF9Q+HqIb0/BCuFS7hOkWfErUoH1kovJFQHP1/kbWppQ1aZ4c5QoPSGayAQ5BG2KvdErXSf7fzhE1IFO86p0DD2fFi6vAhTjLFruaT/SaqicS8bNQBu2WGGr8+5+a/uy92HDyJDkrZCzKGexhgPW9XpNnz2KI+JlkTHyWjJ9YghPxiO013JwLq91xS2K1zvP/XWHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcEbOlmEhH2BkkJw1seheB5K+zKX3a2//GPGGg++i7k=;
 b=T+07q3Gsa/rw32lPbB5m+EdQcLKXcehunwUGUl9DnxmtUA19zNhH0bxQTrgC4psnSd9ys4dg0HWkgR4S0Xe5LTnYjS1WUgdtCckhkrDGYjID59fobMMQT8htJnS04+jls1BC3c6tO9dMBFKR4wxwCIRNLsYSn36SkT+O7CifiiY6lqi99D6cAtxA9haRv74yotDmtEUdZuu9fKt2jDxrTEROHx/ETc4fmmhBV/djZKD5baaNV3Kmq9VYHpbh5SAWZWPcHYUFuL0d3ZjB7CImvehJNWmhR/7zEDbT9eW9MgIxZv0O2OYevTXCDwmFbbYD8rSEsOwkno2NYu0CIxOljA==
Received: from BN9PR03CA0776.namprd03.prod.outlook.com (2603:10b6:408:13a::31)
 by SJ2PR12MB7920.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Wed, 10 Jun
 2026 16:49:27 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::91) by BN9PR03CA0776.outlook.office365.com
 (2603:10b6:408:13a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 16:49:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 16:49:26 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 09:48:45 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 09:48:44 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Jun 2026 09:48:43 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <linux-arm-kernel@lists.infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>
Subject: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device store/load ordering erratum
Date: Wed, 10 Jun 2026 11:48:22 -0500
Message-ID: <20260610164822.4157248-1-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SJ2PR12MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: dbae11ab-f084-481d-bb0b-08dec7103bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|13003099007|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 66j9NIVG69vagHmUQuQN2M9i6YSZnCaZkOb1KAqhJdvJeK1/EU5DeE8kaigsQlx9D315XQZY4HquDyAkRBAgY3pcVu/Yks1fJACP+tdEIFprR/x/omEbkszd8aEkXF47K7OqyYQfMt2uMEBJc1xNfD9Uu3t0TucBxxEWF7u+X3pLmGUVlbVVeZMueoqOWwmf/Egyk6c1GL7N7FMhCvveBCKSv04ycGCCpf83iKBCeIrJ13Jd3KzoTASSiBXAtpecjhou0+mf0+22lbRv4R13qnW+sdh6aHGjuZzgoLprbx2BVgZYv3zamQH0ZxSVLQIISvsf59hiyp8kTg1mZqDmlOuk+7tDGDJMBaN+iKlISSKN+p/mFBwoXqxHwJ78XIo1Doh6tw5xky67NReLLhzzms3bLCebOVUT3w5k0DJC6X99iDNYSq26yo1U/mOdsEg9ax5VjCEE4Qdc5S+wFCDV51ELM5zf3eyU/cpP0f0TWIqGx1TvrYdqq8WH6VbSae8M+8Vc4j73uaKQJXtURQ8JcV2Gfp0crDKHDlFJ/mR4DYMR4pzLvp9oDL2Ka+kAgkU0XAs9eMvWQKhyDKUkZp0A1PPYnquGbSU0b6C6z2SrtbrlvJ/r4ejMqCA256LqIQOgfgsBZAv3C/5EcXPWSYp5zzoQ10LTUy+SzJqf430XlsRAtgAOKEAVEqGIB8etHE3Wk9OQLPZcWgJfg/+NlFzNykFKKRSsoSmkU7vqlWKIHtn85ln0q5nSykunkf3aRsy+
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(13003099007)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: suWZtRbibpKOVVENE2EVji+0fZQjnOfdsoK4GYBMn310/ualTMXGC1AZXfFBiC9kQrw++3PiJn/JWMyYDdVulNhw/fRztojAxqUZc05hGcbz5o9m3WIWCLkjSQVMv2d3ZLymn0xDYiKP99TbMSH9qCEGHKvDp5nc02clwHzw+KMniF5n/LkpvVkb7ryBAUZ43rfroS3ytSIMOR3tS/vmreeIdcUQfoLImpEwYWSuaEBk53vyUlXh/lVVnTauCG4Nth2N5pU/dJyIONfYv3LUW1G/NsiYBfHa39a0ksua/vuYT8tw1LaoV4c/HVPiRuuDN3TmCnLpR5P25GqApIbkKu7UU4NKAcEwBOcEVJ0Zav/r2awHku8hItZ8PEEgq6ornLszGBKwiu8B6acinSWnn1W1oijmyQCClfAFroo+ZK8RA0b4cCyExkSfYPtIj5eg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:49:26.0290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbae11ab-f084-481d-bb0b-08dec7103bac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7920
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_094939_973353_CA91669B 
X-CRM114-Status: GOOD (  23.12  )
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
to stlr* (Store-Release), which removes the "store is not a
store-release" condition for every device write the kernel issues.
Because writel() and writel_relaxed() are both built on __raw_writel()
in asm-generic/io.h, patching the raw variants covers both the
non-relaxed and relaxed APIs without touching the higher layers. Note
that writel()'s own barrier sits before the store, so it does not order
the store against a subsequent readl(); the store-release promotion is
what provides that ordering.

Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
the plain str* sequence.

Note: stlr* only supports base-register addressing, so affected CPUs use
a base-register stlr* path. Unaffected CPUs keep the original
offset-addressed str* sequence introduced by commit d044d6ba6f02
("arm64: io: permit offset addressing").

The __const_memcpy_toio_aligned32() and __const_memcpy_toio_aligned64()
helpers are left unchanged. These helpers are intended for
write-combining mappings, which are Normal-NC on arm64. Replacing their
contiguous str* groups would defeat the write-combining behavior used to
improve store performance.

Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
---
Changes since v2:
  - Reworked the raw MMIO write helpers so unaffected CPUs keep the
    existing offset-addressed STR sequence, while affected CPUs use the
    base-register STLR path.
  - Updated the commit message to match the code changes.
  - Rebased on top of the arm64 for-next/errata branch:
    https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/errata

Changes since v1:
  - Updated the commit message based on feedback from Vladimir Murzin.

 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 23 ++++++++++++++++
 arch/arm64/include/asm/io.h                 | 30 +++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              |  8 ++++++
 arch/arm64/tools/cpucaps                    |  1 +
 5 files changed, 64 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index ad09bbb10da80..fc45125dc2f80 100644
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
index c65cef81be86a..d633eb70de1ac 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -564,6 +564,29 @@ config ARM64_ERRATUM_832075
 
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
+	  layers.
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
diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 8cbd1e96fd50b..801223e754c90 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -22,10 +22,22 @@
 /*
  * Generic IO read/write.  These perform native-endian accesses.
  */
+static __always_inline bool arm64_needs_device_store_release(void)
+{
+	return alternative_has_cap_unlikely(
+				ARM64_WORKAROUND_DEVICE_STORE_RELEASE);
+}
+
 #define __raw_writeb __raw_writeb
 static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
 {
 	volatile u8 __iomem *ptr = addr;
+
+	if (arm64_needs_device_store_release()) {
+		asm volatile("stlrb %w0, [%1]" : : "rZ" (val), "r" (addr));
+		return;
+	}
+
 	asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
 }
 
@@ -33,6 +45,12 @@ static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
 static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
 {
 	volatile u16 __iomem *ptr = addr;
+
+	if (arm64_needs_device_store_release()) {
+		asm volatile("stlrh %w0, [%1]" : : "rZ" (val), "r" (addr));
+		return;
+	}
+
 	asm volatile("strh %w0, %1" : : "rZ" (val), "Qo" (*ptr));
 }
 
@@ -40,6 +58,12 @@ static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
 static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
 {
 	volatile u32 __iomem *ptr = addr;
+
+	if (arm64_needs_device_store_release()) {
+		asm volatile("stlr %w0, [%1]" : : "rZ" (val), "r" (addr));
+		return;
+	}
+
 	asm volatile("str %w0, %1" : : "rZ" (val), "Qo" (*ptr));
 }
 
@@ -47,6 +71,12 @@ static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
 static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 {
 	volatile u64 __iomem *ptr = addr;
+
+	if (arm64_needs_device_store_release()) {
+		asm volatile("stlr %x0, [%1]" : : "rZ" (val), "r" (addr));
+		return;
+	}
+
 	asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
 }
 
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index d597896b0f7f3..b096d9acca578 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -838,6 +838,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
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
index 811c2479e82d6..d367257bf7703 100644
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
2.43.0


