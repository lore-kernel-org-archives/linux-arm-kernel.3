Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5F7CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgoGg8IT47suUaHaJzyZEohRJ+j1hMuFDDZER4oWthY=; b=sk1I8j+lKYGxTiREp0ruzubLB6
	2sR6ww8X0O/cTF1fubuocezE8+9fxYXhKrUI3FmEbLMA+/4BB4LuRn1K1XilU5aMv/9GwGK1Rnyma
	fBR9X6EQYXxLf9X0dVI+7SbVyL3pWHaHCyLaFNbbDQ0uw8ff8UCBcGxyeCfdM5SAjgSLaoZTqpaix
	a6qcpU+RNhJPvki8de0yTYAO3K9viAMMxgkBfWY30OVmh3qGJRgovBXpAgKln3YvTRUxpCpJBxwv5
	MWT0usz+PJUIK2fH70XAZbQzjA7a6isFBexcDpv1jCWJiL2PBt+JGPcOKjmmCwdfC0AqRxsUsInNY
	R2sjsseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4LGz-0000000AjET-1lub;
	Thu, 02 Oct 2025 15:31:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4LGy-0000000AjDe-1EIm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 15:31:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B60DB63E6A;
	Thu,  2 Oct 2025 15:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FE1C4CEF9;
	Thu,  2 Oct 2025 15:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759419071;
	bh=vkZan2sA3q3Zpt91HGXqtJTHqqZKLrjcgTqhPBKawuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bXGZB8GVEqmrly6BJ9gCsZkTGpZ+05lTNCQlZpPwuWSPqqggpP0drBVMr244U+XvV
	 1zoKol7xdUtuwbaDKTHLQHBfmRcD79Xqkfuriyq85IxgAeG0QZaYdXj9rIGa8if3bR
	 dY9AL1NtiGkNPrjpaQfdJHrmF7xmJfMa4OlnfAf4h0EEuYrTGloTuHjsuZbSTGlMjq
	 p0Te4crEiGB4SzHSjAToUEMk2GN+4B3O9dwpTB1rucWRG182YKl5IJdwAvEKRjZSwL
	 qTjSKDPnWEzFVQBJPv1gqbpS3nIw4tqIHnAWJE+V4x2DKpFew0hgLGzQlZ6ZZNaf0A
	 qkSAN5lVSZPkQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.16] arm64: errata: Apply workarounds for Neoverse-V3AE
Date: Thu,  2 Oct 2025 11:30:19 -0400
Message-ID: <20251002153025.2209281-32-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002153025.2209281-1-sashal@kernel.org>
References: <20251002153025.2209281-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 0c33aa1804d101c11ba1992504f17a42233f0e11 ]

Neoverse-V3AE is also affected by erratum #3312417, as described in its
Software Developer Errata Notice (SDEN) document:

  Neoverse V3AE (MP172) SDEN v9.0, erratum 3312417
  https://developer.arm.com/documentation/SDEN-2615521/9-0/

Enable the workaround for Neoverse-V3AE, and document this.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive analysis, here is my determination:

## **Backport Status: YES**

### Detailed Analysis

#### 1. **Nature of the Fix**
This commit adds ARM Neoverse-V3AE to the existing workaround for
erratum 3194386/3312417, which addresses a **speculative execution
vulnerability** related to SSBS (Speculative Store Bypass Safe). The
erratum description states: "MSR SSBS, #0 instructions may not affect
subsequent speculative instructions, which may permit unexpected
speculative store bypassing." This is a security-related issue similar
to Spectre v4.

#### 2. **Code Changes Analysis**
The changes are **minimal and surgical**:
- **Documentation** (`silicon-errata.rst`): Adds 1 table entry
  documenting Neoverse-V3AE erratum 3312417
- **Kconfig** (`arch/arm64/Kconfig`): Adds 1 line to the list of
  affected CPUs in the ARM64_ERRATUM_3194386 help text
- **Errata code** (`cpu_errata.c`): Adds 1 line
  `MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE)` to the
  `erratum_spec_ssbs_list[]` array

This simply registers a new CPU variant to an existing, well-tested
workaround infrastructure.

#### 3. **Established Backporting Pattern**
The erratum 3194386 infrastructure has a **clear history of being
expanded and backported**:
- Base erratum introduced in v6.10 (commit 7187bb7d0b5c7)
- First expansion in v6.11 (commit 75b3c43eab594) - **backported to
  v6.10.x**
- Second expansion in v6.11 (commit adeec61a4723f) - **backported to
  v6.10.x**
- Third expansion in v6.12 (commit 081eb7932c2b2) - **backported to
  v6.11.x**

The backport commits show `Signed-off-by: Sasha Levin
<sashal@kernel.org>`, confirming stable team involvement. This
establishes that ARM errata workarounds for speculative execution are
**routinely backported**.

#### 4. **Risk Assessment: VERY LOW**
- **No architectural changes** - uses existing workaround mechanism
- **No new code paths** - just adds a CPU ID to a matching list
- **Zero impact if hardware not present** - the MIDR check only triggers
  on affected CPUs
- **Well-contained** - changes are confined to ARM64 errata subsystem
- **Already tested** - the workaround logic is proven on 20+ other ARM
  cores with the same erratum

#### 5. **Dependencies**
This commit depends on `3bbf004c4808e` ("arm64: cputype: Add
Neoverse-V3AE definitions") which adds the `MIDR_NEOVERSE_V3AE`
constant. Both commits are part of the same September 2025 patch series
and should be backported together as a pair.

#### 6. **User Impact**
- **Security**: Users with Neoverse-V3AE CPUs are vulnerable to
  speculative store bypass attacks without this fix
- **Hardware availability**: ARM has published SDEN v9.0 for
  Neoverse-V3AE (MP172), indicating this hardware exists or will exist
  in production systems
- **Protection**: The workaround places speculation barriers after SSBS
  changes to prevent information leakage

#### 7. **Stable Kernel Criteria Compliance**
✅ **Fixes important bug** - Security/speculative execution vulnerability
✅ **Small and contained** - 3 single-line additions
✅ **No new features** - Just hardware support
✅ **Minimal regression risk** - Uses proven infrastructure
✅ **Clear benefit** - Protects affected hardware

### Recommendation
**STRONGLY RECOMMEND BACKPORTING** this commit along with its dependency
(3bbf004c4808e) to all stable kernels that contain the base
ARM64_ERRATUM_3194386 infrastructure (v6.10+). This follows the
established pattern for ARM errata workarounds and provides essential
security protection for Neoverse-V3AE hardware.

 Documentation/arch/arm64/silicon-errata.rst | 2 ++
 arch/arm64/Kconfig                          | 1 +
 arch/arm64/kernel/cpu_errata.c              | 1 +
 3 files changed, 4 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index b18ef4064bc04..a7ec57060f64f 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -200,6 +200,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3     | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V3AE   | #3312417        | ARM64_ERRATUM_3194386       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-500         | #841119,826419  | ARM_SMMU_MMU_500_CPRE_ERRATA|
 |                |                 | #562869,1047329 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a64..93f391e67af15 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1138,6 +1138,7 @@ config ARM64_ERRATUM_3194386
 	  * ARM Neoverse-V1 erratum 3324341
 	  * ARM Neoverse V2 erratum 3324336
 	  * ARM Neoverse-V3 erratum 3312417
+	  * ARM Neoverse-V3AE erratum 3312417
 
 	  On affected cores "MSR SSBS, #0" instructions may not affect
 	  subsequent speculative instructions, which may permit unexepected
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 59d723c9ab8f5..21f86c160aab2 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -545,6 +545,7 @@ static const struct midr_range erratum_spec_ssbs_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE),
 	{}
 };
 #endif
-- 
2.51.0


