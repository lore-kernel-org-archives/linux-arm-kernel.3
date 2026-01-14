Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE0AD37E3F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qY8ISVuzSMYysF5FVAjGM0hrJi0sARJDavcxZKDaL/Y=; b=u7S7udkA5uSh0jifP/CpDyR0IG
	/F1l2EdtcfI3Y2ciz6MEF4ac4TdfBxZa6QQw93gMF0Pz8x7DXCKTUG81lCp0FaXGRsN37EXHCNsNP
	iOEWC8MBqLOQ3D78ZhMZRwuyjStN0bJsgjrx2Arl5BD768KC5L+86DpjEAew9fxuCA4KyGnBn3lRq
	L6zP76rhWcNm2jcdJaO6iNFlFtDNxJDKTqf8ijD/LOgF8zXclMRs5wFr+2eX2G0GEdqfgkHv0+cxa
	Ig6e6k4bA4y/AxubAMXz9NMxQlb2BIyMq4LpcDBWcninoRbK1uMei5JicX5ECFPfk5pCAIUk6DB26
	aLoTq+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2F6-00000009aLu-2Al0;
	Wed, 14 Jan 2026 14:53:04 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2F3-00000009aKq-3BTc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:53:02 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-81ecb6279d9so3830627b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768402378; x=1769007178; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qY8ISVuzSMYysF5FVAjGM0hrJi0sARJDavcxZKDaL/Y=;
        b=FN2i4BM/iBSBOT3CHMk1SbgVRzmksWT5D2KX3apa59+mEdUGcMtHN/EvPuxf5PJZTQ
         k2565ubPESkXa1S83JiX6AR8qk1S+DCKSzG/yt6luU7ktaPhhJbo7zDV9NdKIX3Pdo1Q
         PEkXu6KpJtOVjF9Apuwk7uyNQaim48E+4kjFdoVtfjkSBFKLOlGFW3yEwO2S1xanSYVJ
         T771d5nYHos21sWpFtLSmGD8Q38FopmU87FBZJaxa8wyDFnvk8zx4rxwUFHsKaQwTs7E
         wfJmMuIHt0mDt79kjWMUAZClNXiw5O9GckjKseVWmcsYm+FOFgukSMOCfzb7JTGuMoA8
         jQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768402378; x=1769007178;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qY8ISVuzSMYysF5FVAjGM0hrJi0sARJDavcxZKDaL/Y=;
        b=Q/2rY4qeFrOOHhPOsp78SMkKZttkdxs36TLR+4pn2Vkybu2fjvFFltlv0F4ffBSVUd
         AuNReQv5YoQ+GWYGe1V7uGqKJU1hft7p9Lynrct+vMzKVLL8EEb5WflVA45R3JO19Cj/
         yEeCOFbxTxXjpnZo0k6QpEES4rhfKX00BYaW1msIFmLfD+EgPnd+jwc0oUpdIsjbPqBo
         GaqIg/f93ug6U/yFnwFKS+njLgmINM1ezv73KirYtwDVQdCijI5BG2av5GzkM9/A08oN
         ckIYe9oc0FJ6GNdNiKKJiI/coCZ7SKZ9vc+H6IRvE0wFL/fV7dc9fq+kEWMSf/Qc1CG1
         Yp1w==
X-Forwarded-Encrypted: i=1; AJvYcCViS7mIKKQnTZLsrS3SuLZVjv+e7tL5scwJCIUpKHFc4CzeAbHQh3sl3ePyQ9LEnRACsfe7EH59BIBJJgssLL63@lists.infradead.org
X-Gm-Message-State: AOJu0YxKkKeqhO4pJj1fOM+uyjx/GeDWn9OtyZXVr5mf0C0kldsggT8O
	ZvU7BlaCoAmoiCA/b31CXERfsH1Cx2axuQTRM2Pj7ylQxWy1LN/FI26SEHjIMen1mDIma/pH/eC
	W+a69AkyhAjuAtg==
X-Received: from pfgs36.prod.google.com ([2002:a05:6a00:17a4:b0:7e8:a188:d95e])
 (user=lucaswei job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:998a:b0:33f:4e3d:afff with SMTP id adf61e73a8af0-38bed0b4ad5mr2928565637.14.1768402378210;
 Wed, 14 Jan 2026 06:52:58 -0800 (PST)
Date: Wed, 14 Jan 2026 14:52:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260114145243.3458315-1-lucaswei@google.com>
Subject: [PATCH v3] arm64: errata: Workaround for SI L1 downstream coherency issue
From: Lucas Wei <lucaswei@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: sjadavani@google.com, Lucas Wei <lucaswei@google.com>, stable@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_065301_842032_6FE4F4BF 
X-CRM114-Status: GOOD (  25.14  )
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
    a clean or clean&invalidate by virtual address (DC CVAC or DC
    CIVAC), that hits on unique dirty data in the CPU or DSU cache.
    This results in a combined CopyBack and CMO being issued to the
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
cache data be cleaned to PoC. This way of implementation mitigates
performance penalty compared to purely duplicate original CMO.

Cc: stable@vger.kernel.org # 6.12.x
Signed-off-by: Lucas Wei <lucaswei@google.com>
---

Changes in v3:

 1. Fix typos
 2. Remove 'lkp@intel.com' from commit message
 3. Keep ARM within a single section
 4. Remove workaround of #4311569 from `cache_inval_poc()`

Changes in v2:

 1. Fixed warning from kernel test robot by changing
    arm_si_l1_workaround_4311569 to static
    [Reported-by: kernel test robot <lkp@intel.com>]

---
 Documentation/arch/arm64/silicon-errata.rst |  1 +
 arch/arm64/Kconfig                          | 19 +++++++++++++
 arch/arm64/include/asm/assembler.h          | 10 +++++++
 arch/arm64/kernel/cpu_errata.c              | 31 +++++++++++++++++++++
 arch/arm64/tools/cpucaps                    |  1 +
 5 files changed, 62 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index a7ec57060f64..4c300caad901 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -212,6 +212,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
 | Broadcom       | Brahma-B53      | N/A             | ARM64_ERRATUM_845719        |
 +----------------+-----------------+-----------------+-----------------------------+
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
index 8cb3b575a031..5c0ab6bfd44a 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -141,6 +141,30 @@ has_mismatched_cache_type(const struct arm64_cpu_capabilities *entry,
 	return (ctr_real != sys) && (ctr_raw != sys);
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_4311569
+static DEFINE_STATIC_KEY_FALSE(arm_si_l1_workaround_4311569);
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

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.52.0.457.g6b5491de43-goog


