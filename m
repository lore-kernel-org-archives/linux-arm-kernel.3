Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9526E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qRe+YWoR/7llDeJ38JyW1xhw7ge9Tde3t65LUVrgr4=; b=Pi80tE85rXClkm9Uf384nYHgSe
	akLeKysSnSxRVWiugqgt6ZiscfiTRMKTJsw3Ku37MbRDI9mYC0uE7nGKCZEaF76Fa+OSiLGWNwNRN
	1UD3Xa3QLMPwenqgOqMDxho9vAgheLCwpFm6MbpOhwTwevReZaBB6dFKrm2S3ZIG0H+pfnIgoZwKC
	FVHMo+rKixL4PO/73tIiTzM4Zcq23zwnUZq8Ncluucvqc3CCr0jvhUObVWI7ZlC1RR7TgY9gSzXFT
	ChzizAIypIIxUvf5aIWw9cYO/RS3yYXyG9S8xYwiBUcPnqKz5u6DuSnWSawAkoJ6LUFNVp6uPYWMo
	f7U29Qcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP1v-0000000FLHC-1Pwp;
	Wed, 11 Dec 2024 15:53:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOvN-0000000FJmj-24CL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:46:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D329F1713;
	Wed, 11 Dec 2024 07:47:20 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20DFE3F5A1;
	Wed, 11 Dec 2024 07:46:51 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	liunx-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@vger.kernel.org
Subject: [RFC PATCH v1 3/5] arm64: Add errata and workarounds for systems with broken BBML2
Date: Wed, 11 Dec 2024 15:45:04 +0000
Message-ID: <20241211154611.40395-4-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211154611.40395-1-miko.lenczewski@arm.com>
References: <20241211154611.40395-1-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074653_626740_D7293D3F 
X-CRM114-Status: GOOD (  11.17  )
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

There are systems which claim support for BBML2, but whose
implementation of this support is broken. Add a Kconfig erratum for each
of these systems, and a cpufeature workaround that forces the supported
BBM level on these systems to 0.

Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  32 ++++
 arch/arm64/Kconfig                          | 164 ++++++++++++++++++++
 arch/arm64/kernel/cpufeature.c              |  32 +++-
 3 files changed, 227 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index b42fea07c5ce..4b4c1dd9b671 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -126,16 +126,26 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A76      | #3324349        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A76      | #3696297        | ARM64_ERRATUM_3696297       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A77      | #1491015        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A77      | #1508412        | ARM64_ERRATUM_1508412       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A77      | #3324348        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A77      | #3696294        | ARM64_ERRATUM_3696294       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A78      | #3324344        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A78      | #3696287        | ARM64_ERRATUM_3696287       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A78C     | #3324346,3324347| ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A78C     | #3696291        | ARM64_ERRATUM_3696291       |
++----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A78C     | #3696292        | ARM64_ERRATUM_3696292       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A710     | #2119858        | ARM64_ERRATUM_2119858       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A710     | #2054223        | ARM64_ERRATUM_2054223       |
@@ -144,6 +154,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A710     | #3324338        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A710     | #3696244        | ARM64_ERRATUM_3696244       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A715     | #2645198        | ARM64_ERRATUM_2645198       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A715     | #3456084        | ARM64_ERRATUM_3194386       |
@@ -156,6 +168,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X1       | #3324344        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X1       | #3696287        | ARM64_ERRATUM_3696287       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X1C      | #3324346        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #2119858        | ARM64_ERRATUM_2119858       |
@@ -164,10 +178,18 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #3324338        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X2       | #3696244        | ARM64_ERRATUM_3696244       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X3       | #3324335        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X3       | #3696239        | ARM64_ERRATUM_3696239       |
++----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X4       | #3043263        | ARM64_ERRATUM_3043263       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X4       | #3194386        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X925     | #3056274        | ARM64_ERRATUM_3056274       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X925     | #3324334        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N1     | #1188873,1418040| ARM64_ERRATUM_1418040       |
@@ -180,6 +202,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N1     | #3324349        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-N1     | #3696297        | ARM64_ERRATUM_3696297       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N2     | #2139208        | ARM64_ERRATUM_2139208       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N2     | #2067961        | ARM64_ERRATUM_2067961       |
@@ -188,14 +212,22 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N2     | #3324339        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-N2     | #3696250        | ARM64_ERRATUM_3696250       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N3     | #3456111        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #1619801        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #3324341        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V1     | #3696285        | ARM64_ERRATUM_3696285       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V2     | #3324336        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V2     | #3696242        | ARM64_ERRATUM_3696242       |
++----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V3     | #3053180        | ARM64_ERRATUM_3053180       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3     | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-500         | #841119,826419  | N/A                         |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 100570a048c5..9ef8418e8410 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1127,6 +1127,170 @@ config ARM64_ERRATUM_3194386
 
 	  If unsure, say Y.
 
+config ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	bool
+
+config ARM64_ERRATUM_3696250
+	bool "Neoverse-N2: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Neoverse-N2 cores (r0p0, r0p1, r0p2, r0p3) declare
+	  break-before-make level 2 support, but changing the block size
+	  without utilising a break-before-make sequence, or mis-programming
+	  the contiguous hint bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696244
+	bool "Cortex-A710/Cortex-X2: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Cortex-A710 and Cortex-X2 cores (r0p0, r1p0, r2p0, r2p1)
+	  declare break-before-make level 2 support, but changing the block
+	  size without utilising a break-before-make sequence, or
+	  mis-programming the contiguous hint bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696297
+	bool "Cortex-A76/Neoverse-N1: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  This option adds a workaround for ARM Cortex-A76/Neoverse-N1 erratum
+	  3696297.
+
+	  Affected Cortex-A76 and Neoverse-N1 cores (r0p0, r1p0, r2p0, r3p0,
+	  r3p1, r4p0, r4p1) declare break-before-make level 2 support, but
+	  changing the block size without utilising a break-before-make sequence,
+	  or mis-programming the contiguous hint bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696294
+	bool "Cortex-A77: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  This option adds a workaround for ARM Cortex-A77 erratum 3696294.
+
+	  Affected Cortex-A77 cores (r0p0, r1p0, r1p1) declare break-before-make
+	  level 2 support, but changing the block size without utilising a
+	  break-before-make sequence, or mis-programming the contiguous hint
+	  bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696239
+	bool "Cortex-X3: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Cortex-X3 cores (r0p0, r1p0, r1p1, r1p2) declare
+	  break-before-make level 2 support, but changing the block size
+	  without utilising a break-before-make sequence, or mis-programming
+	  the contiguous hint bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696242
+	bool "Neoverse-V2: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Neoverse-V2 cores (r0p0, r0p1, r0p2) declare
+	  break-before-make level 2 support, but changing the block size
+	  without utilising a break-before-make sequence, or mis-programming
+	  the contiguous hint bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696285
+	bool "Neoverse-V1: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Neoverse-V1 cores (r0p0, r1p0, r1p1, r1p2) declare
+	  break-before-make level 2 support, but changing the block size
+	  without utilising a break-before-make sequence, or mis-programming
+	  the contiguous hint bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696287
+	bool "Cortex-A78/Cortex-X1: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Cortex-A78 and Cortex-X1 cores (r0p0, r1p0, r1p1, r1p2)
+	  declare break-before-make level 2 support, but changing the block
+	  size without utilising a break-before-make sequence, or
+	  mis-programming the contiguous hint bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696291
+	bool "Cortex-A78C: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Cortex-A78C cores (r0p0, r0p1, r0p2) declare
+	  break-before-make level 2 support, but changing the block size
+	  without utilising a break-before-make sequence, or mis-programming
+	  the contiguous hint bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696292
+	bool "Cortex-A78C: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Cortex-A78C cores (r0p1, r0p2) declare break-before-make
+	  level 2 support, but changing the block size without utilising a
+	  break-before-make sequence, or mis-programming the contiguous hint
+	  bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3056274
+	bool "Cortex-X925: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Cortex-X925 cores (r0p0, r0p1) declare break-before-make
+	  level 2 support, but changing the block size without utilising a
+	  break-before-make sequence, or mis-programming the contiguous hint
+	  bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3043263
+	bool "Cortex-X4: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Cortex-X4 cores (r0p0, r0p1, r0p2) declare break-before-make
+	  level 2 support, but changing the block size without utilising a
+	  break-before-make sequence, or mis-programming the contiguous hint
+	  bit can lead to a livelock.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3053180
+	bool "Neoverse-V3: workaround for broken BBM level 2 support"
+	default y
+	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
+	help
+	  Affected Neoverse-V3 cores (r0p0, r0p1) declare break-before-make
+	  level 2 support, but changing the block size without utilising a
+	  break-before-make sequence, or mis-programming the contiguous hint
+	  bit can lead to a livelock.
+
+	  If unsure, say Y.
+
 config CAVIUM_ERRATUM_22375
 	bool "Cavium erratum 22375, 24313"
 	default y
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 7cc94bd5da24..e6c05b330e0f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2167,6 +2167,36 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
 	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
 }
 
+static bool has_bbml2(const struct arm64_cpu_capabilities *entry,
+		      int scope)
+{
+	if (IS_ENABLED(CONFIG_ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT)) {
+		static const struct midr_range broken_bbml2_list[] = {
+			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
+			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
+			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
+			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
+			MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
+			MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
+			MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
+			MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
+			MIDR_ALL_VERSIONS(MIDR_CORTEX_X4),
+			MIDR_ALL_VERSIONS(MIDR_CORTEX_X925),
+			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
+			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
+			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
+			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
+			{}
+		};
+
+		if (is_midr_in_range_list(read_cpuid_id(), broken_bbml2_list))
+			return false;
+	}
+
+	return has_cpuid_feature(entry, scope);
+}
+
 #ifdef CONFIG_ARM64_PAN
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
 {
@@ -2921,7 +2951,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.desc = "BBM Level 2 Support",
 		.capability = ARM64_HAS_BBML2,
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
-		.matches = has_cpuid_feature,
+		.matches = has_bbml2,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, BBM, 2)
 	},
 	{
-- 
2.45.2


