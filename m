Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C305EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgoLeZ0/25+A0/8D/NxLiDPJvKV6h8IrJAxWnjH2sT4=; b=uae39CWQDTIPvYEJYYGNk5kvsh
	etWFLaIM7ZygAcYn9IlgwyEjC8GJf8X5h400M0sUosozDoChZIhuDyvjblsRmSEEWdc4h5paq1r7R
	v8l0wu3HHg9mUbOYPV23ZesE7x8lewuhF1INIUogU5dCIviUGcpjTBzWVBCpsrFVvbAKaQbWzLKFO
	cdkmmS20CQ92OLehwxxyHLNhCK5RanuxhBU4XUHauAYXgY4J6pvzxxInDbWLj2hVZt1eH/QhssXP1
	o8XdrH2PZYN6C7fzIVanhno9wx8bnCJFqKBQFKrgODgUgOMw2nbPDKGn5J4bHrJvnn2DuS0z4VgZs
	D3QiCrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whx9V-00000003lcm-3FLI;
	Thu, 09 Jul 2026 22:23:29 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whx9S-00000003lal-2Cum;
	Thu, 09 Jul 2026 22:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783635806; x=1815171806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gxx6q3PaUXThy7077PBdEcj1YAhyEf5rMxD7v3MrfBU=;
  b=ZIKbMTaQTKF+/MNy4j2ksEFLG+rseIaPgqBNPmcazOaO1g5JVUCzadtY
   Iebk+ixWrXy82dbkwYRRCJlWZQrnChE7m3cPWeV9H61YFBvp5Wx+EKWM4
   M6pxWpvFw4qOVxOrhJDlc+FLfGh2daxetDgPF7fG5zioYGYgQ0yCADsjB
   oKB3q6lMgrIS3bu76ZqTeQubyaT9VCEgL20XNJfyaIJH72ZJeal2nLyhM
   FXys8GFJHLHhsJFkCbjMM8uHjn/zHlABkWMWbv+SDaZmC5OjeSnojHYEk
   olEL5lNj6LF4atfZHlxEht4SItDCLzELn7EXkPoYEyZOwiCn561d/ub4Q
   g==;
X-CSE-ConnectionGUID: NTEM8+DVSPWdtEIR9DhpKA==
X-CSE-MsgGUID: gBPBO7AzQ6eXEic5LKE5dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84213677"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84213677"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 15:23:26 -0700
X-CSE-ConnectionGUID: quniZ9VdSxak3XEDt5pNeA==
X-CSE-MsgGUID: 8t1vTq8uS3mfFzTFwhmBFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248335410"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 15:23:26 -0700
Date: Thu, 9 Jul 2026 15:23:25 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH 7.1.y 2/6] x86/bugs: Enable IBPB flush on BPF JIT allocation
Message-ID: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-2-5ac5a2d6797f@linux.intel.com>
X-Mailer: b4 0.16-dev
References: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_152326_582696_CEE52CEA 
X-CRM114-Status: GOOD (  16.16  )
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

commit a3af84b0fa00ead01fcd0e28b5d773ff25990a0d upstream.

Enable hardening against JIT spraying when Spectre-v2 mitigations are in
use. Specifically, issue an IBPB flush on BPF JIT memory reuse. Skip
enabling the IBPB flush if the BPF dispatcher is already using a retpoline
sequence.

This hardening applies only when BPF-JIT is in use. Guard the enabling
under CONFIG_BPF_JIT so that bugs.c still builds with CONFIG_BPF_JIT=n.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
---
 arch/x86/include/asm/nospec-branch.h |  4 +++
 arch/x86/kernel/cpu/bugs.c           | 50 ++++++++++++++++++++++++++++++++----
 2 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
index 4f4b5e8a1574..b68892e6d58c 100644
--- a/arch/x86/include/asm/nospec-branch.h
+++ b/arch/x86/include/asm/nospec-branch.h
@@ -388,6 +388,10 @@ extern void srso_alias_return_thunk(void);
 extern void entry_untrain_ret(void);
 extern void write_ibpb(void);
 
+#ifdef CONFIG_BPF_JIT
+extern void bpf_arch_ibpb(void);
+#endif
+
 #ifdef CONFIG_X86_64
 extern void clear_bhb_loop(void);
 #endif
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 83f51cab0b1e..d9af230c0512 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -16,6 +16,7 @@
 #include <linux/sched/smt.h>
 #include <linux/pgtable.h>
 #include <linux/bpf.h>
+#include <linux/filter.h>
 #include <linux/kvm_types.h>
 
 #include <asm/spec-ctrl.h>
@@ -1651,8 +1652,21 @@ static inline const char *spectre_v2_module_string(void)
 {
 	return spectre_v2_bad_module ? " - vulnerable module loaded" : "";
 }
+
+/*
+ * The "retpoline sequence" is the "call;mov;ret" sequence that
+ * replaces normal indirect branch instructions. Differentiate
+ * *the* retpoline sequence from the LFENCE-prefixed indirect
+ * branches that simply use the retpoline infrastructure.
+ */
+static inline bool retpoline_seq_enabled(void)
+{
+	return boot_cpu_has(X86_FEATURE_RETPOLINE) && !boot_cpu_has(X86_FEATURE_RETPOLINE_LFENCE);
+}
+
 #else
 static inline const char *spectre_v2_module_string(void) { return ""; }
+static inline bool retpoline_seq_enabled(void) { return false; }
 #endif
 
 #define SPECTRE_V2_LFENCE_MSG "WARNING: LFENCE mitigation is not recommended for this CPU, data leaks possible!\n"
@@ -2095,8 +2109,7 @@ static void __init bhi_apply_mitigation(void)
 		return;
 
 	/* Retpoline mitigates against BHI unless the CPU has RRSBA behavior */
-	if (boot_cpu_has(X86_FEATURE_RETPOLINE) &&
-	    !boot_cpu_has(X86_FEATURE_RETPOLINE_LFENCE)) {
+	if (retpoline_seq_enabled()) {
 		spec_ctrl_disable_kernel_rrsba();
 		if (rrsba_disabled)
 			return;
@@ -2238,6 +2251,27 @@ static void __init spectre_v2_update_mitigation(void)
 		pr_info("%s\n", spectre_v2_strings[spectre_v2_enabled]);
 }
 
+#ifdef CONFIG_BPF_JIT
+static void __bpf_arch_ibpb(void *unused)
+{
+	write_ibpb();
+}
+
+void bpf_arch_ibpb(void)
+{
+	on_each_cpu(__bpf_arch_ibpb, NULL, 1);
+}
+
+static bool __init cpu_wants_ibpb_bpf(void)
+{
+	/* A genuine retpoline already neutralizes ring0 indirect predictions */
+	if (retpoline_seq_enabled())
+		return false;
+
+	return boot_cpu_has(X86_FEATURE_IBPB);
+}
+#endif
+
 static void __init spectre_v2_apply_mitigation(void)
 {
 	if (spectre_v2_enabled == SPECTRE_V2_EIBRS && unprivileged_ebpf_enabled())
@@ -2314,6 +2348,14 @@ static void __init spectre_v2_apply_mitigation(void)
 		setup_force_cpu_cap(X86_FEATURE_USE_IBRS_FW);
 		pr_info("Enabling Restricted Speculation for firmware calls\n");
 	}
+
+#ifdef CONFIG_BPF_JIT
+	if (cpu_wants_ibpb_bpf()) {
+		static_call_update(bpf_arch_pred_flush, bpf_arch_ibpb);
+		static_branch_enable(&bpf_pred_flush_enabled);
+		pr_info("Enabling IBPB for BPF\n");
+	}
+#endif
 }
 
 static void update_stibp_msr(void * __unused)
@@ -3490,9 +3532,7 @@ static const char *spectre_bhi_state(void)
 		return "; BHI: BHI_DIS_S";
 	else if (boot_cpu_has(X86_FEATURE_CLEAR_BHB_LOOP))
 		return "; BHI: SW loop, KVM: SW loop";
-	else if (boot_cpu_has(X86_FEATURE_RETPOLINE) &&
-		 !boot_cpu_has(X86_FEATURE_RETPOLINE_LFENCE) &&
-		 rrsba_disabled)
+	else if (retpoline_seq_enabled() && rrsba_disabled)
 		return "; BHI: Retpoline";
 	else if (boot_cpu_has(X86_FEATURE_CLEAR_BHB_VMEXIT))
 		return "; BHI: Vulnerable, KVM: SW loop";

-- 
2.43.0



