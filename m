Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B29ACA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13qL+mSBvjYeAZ5L/QST7A425G2VDqjT/pYTrHUm66k=; b=v7/qRaGm5/xEDf9Ovey9PE7qk+
	HXgs9CSdPvGllJfvnn7QIBOuU41PwjqBCao6RazZMqrcxcUL4rywwYUdZrvRNU0qo2dh6Av8sS7fC
	DUVr+I8ExZMrHKg3hmbyKmvOr4FMqEusGmRi10k/3UUEiHwBPeMDnE1zv6nqk6hIhptf1m8ipy1Sm
	KH8KyESegmgfoqRBWOCCjBuYsiL7Ddl5OW4WUF3CZPYIoyjPZJ1j+tlHhiZ/fZVVQHNjDo9/SBAnM
	Wj0OvO3NmHFWc5BPeEtFETx7zNC5PKRMF5jQLARO4VncpGPX7O5W/4AoshgrbcZ1xTMGkNV1YXJov
	vJRkmm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaUu-0000000BJ9v-1zcG;
	Fri, 02 Oct 2026 10:28:12 +0000
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaUs-0000000BJ86-26Rc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790936890; x=1822472890;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Xqi6OaaaW1eG1O5rqaNPfGA7QBOWDo0BOw04yYs2hp0=;
  b=NBtMZvMAzSXWe1PmTqQomLDrQbp667TrJExcbjtLA7tDGNd0RUw4AcR1
   Q2JuL1MByLTBzBn2qlfj9+j5DvYkBfMYX7wnD0F+3Ec+PFIxK2sRtykKw
   /6Z/LOM/pzmyJttc0PKwn0aCUDjOADt5cSu/12WIn+OKbGI0inIW1bgyY
   Mc7SDkCHkHI+B4rEW3peEH/zX5GAsaetlash7lsZJBlfa2fl/1VE45B/R
   d8YoSHW5DULuCHGqlKaoXk30cWcj9/bYSVBgMogPKfReHvhitP13i0kGF
   dlSBhYFUnsWPoKMdTz1+7bX2F834mo2xv02C+Mp/5SYCEjtKkhngxgJEc
   g==;
X-CSE-ConnectionGUID: MGdu9OJETMGwKWG/kW5ACg==
X-CSE-MsgGUID: bm0mU1qBSNOqSh7BgAefJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="256956432"
X-IronPort-AV: E=Sophos;i="6.27,136,1786978800"; 
   d="scan'208";a="256956432"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 19:28:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7AC101C000DA
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 10:28:08 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2D8FA1802AEC
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 10:28:08 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 16C25201F385;
	Fri,  2 Oct 2026 10:28:02 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Date: Fri, 02 Oct 2026 19:26:50 +0900
Subject: [PATCH 2/4] arm64: tlb: Add tlbi workaround for FUJITSU-MONAKA
 Erratum E#030001
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-monaka-fix-for-upstream-v1-2-4aec0b0cbe34@fujitsu.com>
References: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
In-Reply-To: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Kohei Enju <enju.kohei@fujitsu.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790936872; l=6562;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=Xqi6OaaaW1eG1O5rqaNPfGA7QBOWDo0BOw04yYs2hp0=;
 b=haTsLoxBcGblWtg/2NIVSnt/+5mB7vT+Ssk2vlskNZ7bsTiu3hAWyWBIlsrx/4cKGu8BBfNwr
 0MknhFLBo4fDAYXmtA2lgqaPVv0XA/0yEyDRbaEZ8dhYRCrjkUOw8Ku
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_032810_843633_E4B96ABB 
X-CRM114-Status: GOOD (  20.03  )
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

FUJITSU-MONAKA Erratum E#030001 affects FUJITSU-MONAKA CPU
when using 64k page size.

On affected FUJITSU-MONAKA CPUs, range-based TLBI operations
targeting a VA or IPA may fail to invalidate TLB entries when
addr[34:29] == all 1 && addr[28:0] == 0 for 512MB mappings.
The affected instructions are:
  RVA[L]E{1,2,3}*, RVAA[L]E1*, and RIPAS2[L]E1*.

Work around the erratum by issuing additional non-range
TLBI instructions corresponding to the affected VA or IPA
range-based TLBI operations.

Signed-off-by: Tomohiro Misono <misono.tomohiro@fujitsu.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 19 +++++++++++++++++
 arch/arm64/include/asm/cpucaps.h            |  2 ++
 arch/arm64/include/asm/tlbflush.h           | 33 +++++++++++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 10 +++++++++
 arch/arm64/tools/cpucaps                    |  1 +
 6 files changed, 67 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index ac3248b9f2f3..8ab6284e3d10 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -373,6 +373,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Fujitsu        | A64FX           | E#010001        | FUJITSU_ERRATUM_010001      |
 +----------------+-----------------+-----------------+-----------------------------+
+| Fujitsu        | MONAKA          | E#030001        | FUJITSU_ERRATUM_030001      |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | ASR            | ASR8601         | #8601001        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..38248a31d5f1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1312,6 +1312,25 @@ config FUJITSU_ERRATUM_010001
 
 	  If unsure, say Y.
 
+config FUJITSU_ERRATUM_030001
+	bool "FUJITSU-MONAKA erratum E#030001: Range TLBI may fail to invalidate some entries"
+	depends on PAGE_SIZE_64KB
+	default y
+	help
+	  This option adds a workaround for FUJITSU-MONAKA erratum E#030001.
+	  On affected FUJITSU-MONAKA CPUs, range-based TLBI operation
+	  targeting a VA or IPA may fail to invalidate some TLB entries
+	  for 512MB mappings. The affected instructions are RVA[L]E{1,2,3}*,
+	  RVAA[L]E1*, and RIPAS2[L]E1*.
+
+	  Work around the erratum by issuing additional non-range TLBI
+	  instructions corresponding to the affected VA or IPA range-based
+	  TLBI operations.
+
+	  The erratum only affects the FUJITSU-MONAKA on 64k pagesize.
+
+	  If unsure, say Y.
+
 config HISILICON_ERRATUM_161600802
 	bool "Hip07 161600802: Erroneous redistributor VLPI base"
 	default y
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 76350b38f0d7..9220b917ec20 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -66,6 +66,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_ERRATUM_3194386);
 	case ARM64_WORKAROUND_4193714:
 		return IS_ENABLED(CONFIG_ARM64_ERRATUM_4193714);
+	case ARM64_WORKAROUND_FUJITSU_030001:
+		return IS_ENABLED(CONFIG_FUJITSU_ERRATUM_030001);
 	case ARM64_MPAM:
 		/*
 		 * KVM MPAM support doesn't rely on the host kernel supporting MPAM.
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 14a78ac0f800..0487daec1652 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -487,6 +487,37 @@ static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
 	op(arg);
 }
 
+#ifdef CONFIG_FUJITSU_ERRATUM_030001
+static inline void fujitsu_erratum_wa(tlbi_op lop, u64 start, u64 end, u16 asid)
+{
+	u64 addr;
+
+	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_FUJITSU_030001))
+		return;
+
+	/*
+	 * The erratum fails to invalidate TLBI entries in the range when
+	 * addr[34:29] == all 1 && addr[28:0] == all 0 for 512M hugepage.
+	 * However, since it cannot be determined reliably if the target
+	 * entry is hugepage or not here, always assume hugepage is used.
+	 * The workaround is to issue extra non-range TLBI ops corresponding
+	 * to the affected VA or IPA range-based ops in the range.
+	 */
+	addr = (start & GENMASK_ULL(63, 35)) | GENMASK_ULL(34, 29);
+	while (addr < end) {
+		__tlbi_level_asid(lop, addr, TLBI_TTL_UNKNOWN, asid);
+		if (addr + BIT_ULL(35) < addr)
+			/* overflow */
+			break;
+		addr += BIT_ULL(35);
+	}
+}
+#else
+static inline void fujitsu_erratum_wa(tlbi_op lop, u64 start, u64 end, u16 asid)
+{
+}
+#endif /* CONFIG_FUJITSU_ERRATUM_030001 */
+
 static __always_inline void __flush_tlb_range_op(tlbi_op lop, tlbi_op rop,
 						 u64 start, size_t pages,
 						 u64 stride, u16 asid,
@@ -518,6 +549,8 @@ static __always_inline void __flush_tlb_range_op(tlbi_op lop, tlbi_op rop,
 		__tlbi_level_asid(lop, addr, level, asid);
 		addr += stride;
 	}
+
+	fujitsu_erratum_wa(lop, start, end, asid);
 }
 
 #define __flush_s1_tlb_range_op(op, start, pages, stride, asid, tlb_level) \
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 8ec47d89b45b..5b9dea3c761d 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -1027,6 +1027,16 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.matches = has_impdef_pmuv3,
 		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
 	},
+#ifdef CONFIG_FUJITSU_ERRATUM_030001
+	{
+		.desc = "FUJITSU-MONAKA Erratum E#030001",
+		.capability = ARM64_WORKAROUND_FUJITSU_030001,
+		ERRATA_MIDR_RANGE_LIST(((const struct midr_range[]) {
+					MIDR_ALL_VERSIONS(MIDR_FUJITSU_MONAKA),
+					{}
+				})),
+	},
+#endif
 	{
 		.desc = "Known broken GICv3 SEIS implementation",
 		.capability = ARM64_WORKAROUND_GICv3_BROKEN_SEIS,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 2775ba3359cf..50a9aa0e2bf0 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -132,3 +132,4 @@ WORKAROUND_REPEAT_TLBI_SYNC
 WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
+WORKAROUND_FUJITSU_030001

-- 
2.43.0


