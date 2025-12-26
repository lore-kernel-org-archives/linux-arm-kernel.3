Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB00E8FDA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 07:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cMh1B9jeIE4aw279198M1b/hk/GMIA7jSM//p/wGIko=; b=vcUtRxDNIklqAPjvi81vOOwoHM
	OMThYtlpwyzF9/1ku4il484Rny22tr9UX6jFkxDfauirxjccUWHAmdaA9vMVaeTeM4wyoDmI0OQ6r
	+VBPkvwxVorwWjX8UfTryGmd2ES1UiD60gPOjkRotc+1mMzgylGYtxpRB0P21WV/4HB9q2sSGVhF7
	eZcwrh37pWpPgIL/rfsYl+p/SowhWcxIjrvEW+KN5iLG+s9bY/KgWgGQlluE9cmGzOCQZ1aOxRr9g
	OPKVnE4twRwnk/I/30SQ8L06a/VzGZGy1JDB9whWGgAtu/JWdscomQvANNCJ/5x3Dqp3YYVDu24N5
	LIKoalXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ2SP-000000010QP-1tyE;
	Fri, 26 Dec 2025 07:41:53 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ2SM-000000010Pv-2LyX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 07:41:52 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-29f2b45ecffso116932035ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 23:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766734908; x=1767339708; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cMh1B9jeIE4aw279198M1b/hk/GMIA7jSM//p/wGIko=;
        b=yAIsNDtdYuFaM5khixlPPldXIZ5/IU+lE+oonbVvJjt6HFAlDEp1UBjqnDkNXDtLxQ
         VelTpXykL71qMa5KKvZhgjolgmvcZPOafBlMPPEUFbNVTVYydxMe1Bd2IU2Bqxc398rn
         TnUMeDMPl60t2YITsv0DI8r1In9My6xkexpB5JuZEbBuB7gfSxSWru3u7EjLTc1ic6Yc
         nzQmtNx/0IOrs4i9RvXAes+0MNFnjWmZA2o71eV+hzCkGRkzcE8H+Vb4w9u4ijEPFMrJ
         EjHg64A2pkQIHzynws481w5z78C/B3ji/+xZRrwbS8qMTzC0Y0ARnu/uuSUU/CZUaspS
         cuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766734908; x=1767339708;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cMh1B9jeIE4aw279198M1b/hk/GMIA7jSM//p/wGIko=;
        b=SAAC/uXoLHXapskWTUQLkhc35A+FntsMRe/nXSa7yl45F96Z7pKtxYDltnChDzDpn8
         bjS2acm5c2QQfUUKqJEF528Zevv1NoQLCN/HsAxJ1gyRrjGobfb/7wy5WBOPec1adaSL
         ZUSo+PXeio+FTk3nvOVC60+Ma6G49ZY19Z7qvW3T6UCMLOJzc6wxAOo42pg6iif0dGlF
         YuDJJxGrXHsRvffhWaUetOD8SjPFbevj8jfmQLSH+rCT5JHpshBG0s1lTirHBPRE4fyC
         rneUGOGUpbzRxsfQczMo5lL6+ygW3xRMcc1gklTVBdkV3dbCKvvBoRa3Fu1cvI/CJehr
         JzzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXcOptR+SDlNNA4C+QpL+mSqWhKC6tVDR3mNbwuKiCgHNKwl1K8XlvGfpLaXJpMV+o0yCxlQUmfGt6DZLoaKfB@lists.infradead.org
X-Gm-Message-State: AOJu0YwiWcpxRGZZ8VcAQh8KGcGg2AIhz469y34HNa/nW/1ADdBLKAq0
	lfHG6EGwj5xHpNv+IWd84LKl7MIiJa/SApZug0U43qMJM7GA2k9BcXwXLMPw5goGgukxDR8s42Q
	g52NT5Ah/ZO1kSA==
X-Google-Smtp-Source: AGHT+IFtF1K9L6PYp/XzYAz9RZqRh29e1exGwQNKVor5fhVi5cRkwnbSQpCOKzH10Rx1XFEgf7xJTaY0uGlvqQ==
X-Received: from plrf19.prod.google.com ([2002:a17:902:ab93:b0:29f:22e:147c])
 (user=lucaswei job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ccc3:b0:2a0:97d2:a25d with SMTP id d9443c01a7336-2a2f2426c84mr257403495ad.15.1766734908420;
 Thu, 25 Dec 2025 23:41:48 -0800 (PST)
Date: Fri, 26 Dec 2025 07:41:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
Message-ID: <20251226074106.3751725-1-lucaswei@google.com>
Subject: [PATCH] arm64: errata: Workaround for SI L1 downstream coherency issue
From: Lucas Wei <lucaswei@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: sjadavani@google.com, Lucas Wei <lucaswei@google.com>, stable@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_234150_635339_DAF716E8 
X-CRM114-Status: GOOD (  24.86  )
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

When software issues a Cache Maintenance Operation (CMO) targeting a
dirty cache line, the CPU and DSU cluster may optimize the operation by
combining the CopyBack Write and CMO into a single combined CopyBack
Write plus CMO transaction presented to the interconnect (MCN).
For these combined transactions, the MCN splits the operation into two
separate transactions, one Write and one CMO, and then propagates the
write and optionally the CMO to the downstream memory system or external
Point of Serialization (PoS).
However, the MCN may return an early CompCMO response to the DSU cluster
before the corresponding Write and CMO transactions have completed at
the external PoS or downstream memory. As a result, stale data may be
observed by external observers that are directly connected to the
external PoS or downstream memory.

This erratum affects any system topology in which the following
conditions apply:
 - The Point of Serialization (PoS) is located downstream of the
   interconnect.
 - A downstream observer accesses memory directly, bypassing the
   interconnect.

Conditions:
This erratum occurs only when all of the following conditions are met:
 1. Software executes a data cache maintenance operation, specifically,
    a clean or invalidate by virtual address (DC CVAC, DC CIVAC, or DC
    IVAC), that hits on unique dirty data in the CPU or DSU cache. This
    results in a combined CopyBack and CMO being issued to the
    interconnect.
 2. The interconnect splits the combined transaction into separate Write
    and CMO transactions and returns an early completion response to the
    CPU or DSU before the write has completed at the downstream memory
    or PoS.
 3. A downstream observer accesses the affected memory address after the
    early completion response is issued but before the actual memory
    write has completed. This allows the observer to read stale data
    that has not yet been updated at the PoS or downstream memory.

The implementation of workaround put a second loop of CMOs at the same
virtual address whose operation meet erratum conditions to wait until
cache data be cleaned to PoC.. This way of implementation mitigates
performance panalty compared to purly duplicate orignial CMO.

Cc: stable@vger.kernel.org # 6.12.x
Signed-off-by: Lucas Wei <lucaswei@google.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  3 ++
 arch/arm64/Kconfig                          | 19 +++++++++++++
 arch/arm64/include/asm/assembler.h          | 10 +++++++
 arch/arm64/kernel/cpu_errata.c              | 31 +++++++++++++++++++++
 arch/arm64/mm/cache.S                       | 13 ++++++++-
 arch/arm64/tools/cpucaps                    |  1 +
 6 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index a7ec57060f64..98efdf528719 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -213,6 +213,9 @@ stable kernels.
 | ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
 +----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
++----------------+-----------------+-----------------+-----------------------------+
++----------------+-----------------+-----------------+-----------------------------+
 | Broadcom       | Brahma-B53      | N/A             | ARM64_ERRATUM_845719        |
 +----------------+-----------------+-----------------+-----------------------------+
 | Broadcom       | Brahma-B53      | N/A             | ARM64_ERRATUM_843419        |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7..89326bb26f48 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1155,6 +1155,25 @@ config ARM64_ERRATUM_3194386
 
 	  If unsure, say Y.
 
+config ARM64_ERRATUM_4311569
+	bool "SI L1: 4311569: workaround for premature CMO completion erratum"
+	default y
+	help
+	  This option adds the workaround for ARM SI L1 erratum 4311569.
+
+	  The erratum of SI L1 can cause an early response to a combined write
+	  and cache maintenance operation (WR+CMO) before the operation is fully
+	  completed to the Point of Serialization (POS).
+	  This can result in a non-I/O coherent agent observing stale data,
+	  potentially leading to system instability or incorrect behavior.
+
+	  Enabling this option implements a software workaround by inserting a
+	  second loop of Cache Maintenance Operation (CMO) immediately following the
+	  end of function to do CMOs. This ensures that the data is correctly serialized
+	  before the buffer is handed off to a non-coherent agent.
+
+	  If unsure, say Y.
+
 config CAVIUM_ERRATUM_22375
 	bool "Cavium erratum 22375, 24313"
 	default y
diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index f0ca7196f6fa..d3d46e5f7188 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -381,6 +381,9 @@ alternative_endif
 	.macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
 	sub	\tmp, \linesz, #1
 	bic	\start, \start, \tmp
+alternative_if ARM64_WORKAROUND_4311569
+	mov	\tmp, \start
+alternative_else_nop_endif
 .Ldcache_op\@:
 	.ifc	\op, cvau
 	__dcache_op_workaround_clean_cache \op, \start
@@ -402,6 +405,13 @@ alternative_endif
 	add	\start, \start, \linesz
 	cmp	\start, \end
 	b.lo	.Ldcache_op\@
+alternative_if ARM64_WORKAROUND_4311569
+	.ifnc	\op, cvau
+	mov	\start, \tmp
+	mov	\tmp, xzr
+	cbnz	\start, .Ldcache_op\@
+	.endif
+alternative_else_nop_endif
 	dsb	\domain
 
 	_cond_uaccess_extable .Ldcache_op\@, \fixup
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 8cb3b575a031..c69678c512f1 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -141,6 +141,30 @@ has_mismatched_cache_type(const struct arm64_cpu_capabilities *entry,
 	return (ctr_real != sys) && (ctr_raw != sys);
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_4311569
+DEFINE_STATIC_KEY_FALSE(arm_si_l1_workaround_4311569);
+static int __init early_arm_si_l1_workaround_4311569_cfg(char *arg)
+{
+	static_branch_enable(&arm_si_l1_workaround_4311569);
+	pr_info("Enabling cache maintenance workaround for ARM SI-L1 erratum 4311569\n");
+
+	return 0;
+}
+early_param("arm_si_l1_workaround_4311569", early_arm_si_l1_workaround_4311569_cfg);
+
+/*
+ * We have some earlier use cases to call cache maintenance operation functions, for example,
+ * dcache_inval_poc() and dcache_clean_poc() in head.S, before making decision to turn on this
+ * workaround. Since the scope of this workaround is limited to non-coherent DMA agents, its
+ * safe to have the workaround off by default.
+ */
+static bool
+need_arm_si_l1_workaround_4311569(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	return static_branch_unlikely(&arm_si_l1_workaround_4311569);
+}
+#endif
+
 static void
 cpu_enable_trap_ctr_access(const struct arm64_cpu_capabilities *cap)
 {
@@ -870,6 +894,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		ERRATA_MIDR_RANGE_LIST(erratum_spec_ssbs_list),
 	},
 #endif
+#ifdef CONFIG_ARM64_ERRATUM_4311569
+	{
+		.capability = ARM64_WORKAROUND_4311569,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = need_arm_si_l1_workaround_4311569,
+	},
+#endif
 #ifdef CONFIG_ARM64_WORKAROUND_SPECULATIVE_UNPRIV_LOAD
 	{
 		.desc = "ARM errata 2966298, 3117295",
diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index 503567c864fd..ddf0097624ed 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -143,9 +143,14 @@ SYM_FUNC_END(dcache_clean_pou)
  *	- end     - kernel end address of region
  */
 SYM_FUNC_START(__pi_dcache_inval_poc)
+alternative_if ARM64_WORKAROUND_4311569
+	mov	x4, x0
+	mov	x5, x1
+	mov	x6, #1
+alternative_else_nop_endif
 	dcache_line_size x2, x3
 	sub	x3, x2, #1
-	tst	x1, x3				// end cache line aligned?
+again:	tst	x1, x3				// end cache line aligned?
 	bic	x1, x1, x3
 	b.eq	1f
 	dc	civac, x1			// clean & invalidate D / U line
@@ -158,6 +163,12 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
 3:	add	x0, x0, x2
 	cmp	x0, x1
 	b.lo	2b
+alternative_if ARM64_WORKAROUND_4311569
+	mov	x0, x4
+	mov	x1, x5
+	sub	x6, x6, #1
+	cbz	x6, again
+alternative_else_nop_endif
 	dsb	sy
 	ret
 SYM_FUNC_END(__pi_dcache_inval_poc)
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 0fac75f01534..856b6cf6e71e 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -103,6 +103,7 @@ WORKAROUND_2077057
 WORKAROUND_2457168
 WORKAROUND_2645198
 WORKAROUND_2658417
+WORKAROUND_4311569
 WORKAROUND_AMPERE_AC03_CPU_38
 WORKAROUND_AMPERE_AC04_CPU_23
 WORKAROUND_TRBE_OVERWRITE_FILL_MODE
-- 
2.52.0.358.g0dd7633a29-goog


