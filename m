Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86E9F9D0DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BPLBFca2NIt/ec8VmY4Tvm+1eRiZzLban17dqm/R954=; b=GChUT1H3RX5QIR+cjqgryphx9f
	S2Y4WeA+35v8u/VfguL4BLHD54ehxQ009tIx9/cgbOomk1QlH9AIbN3vQoOdBcbl9BqPCRsfudq1G
	UazSD/MoV1DbLRmtwEPkmxG2K/InSPIFi8B0gwsGjWRFYSozU88V3naBKx4vCHvfUZqRUCw2hG5Ga
	I+b8A7355vb0XZs8CNET4h517YjSYfYYlyJ+eAy8sblrVHYecKbYy+OTm65t0AdQwEC5hEbc2rZhw
	dJPw4Hg10uHNU636hrKGyDmyHc/RbxyExG2+sKYDizmrwh/sXq5FiiAOKCFtOHrLrKCZiIOGa3HRr
	FSkpCtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgGi-0000000HaIn-1s4m;
	Tue, 14 Apr 2026 16:05:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgGg-0000000HaIM-38Mo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16BDE44510;
	Tue, 14 Apr 2026 16:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B6DC19425;
	Tue, 14 Apr 2026 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776182737;
	bh=KB+DwxjKOv+7tb2uKyWawrhRV0KiPF8QdOmOtDXaD7U=;
	h=From:To:Cc:Subject:Date:From;
	b=uDWmRt3/rsToMdkoLEp7nzIwgfEAmxYDEr8cpSj1K0J78ni6x56t9XNi6VSE2yf9Z
	 c9YQC5Z97isMRxwhBgjkZeggib/XwH+xmlUWptMGZ6JB3xXR69/GOvgDZGIKs9dks0
	 jo/UTKGL29nJ32Z2GAHcBEgmzY9L3Nqg+NUcf5pdC4eL894uOM+nVyW+jKBMlNzX2+
	 ZLYGsTlGPm0Ozkvr93aZS2di1B+lA4nEtyiXn2yvtSmfdfz9aZlCLvWEThSsM1vXZE
	 1S32yvQ1sHY0JLcdUSkEUFLoCY+L2Gbv3mml2S14d3MR5ZBCazE8hBc6T0kT1a/92L
	 YrxFxfQieeFug==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCgGd-0000000BdFr-2MO3;
	Tue, 14 Apr 2026 16:05:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: pkvm: Adopt MARKER() to define host hypercall ranges
Date: Tue, 14 Apr 2026 17:05:28 +0100
Message-ID: <20260414160528.2218858-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, will@kernel.org, vdonnefort@google.com, tabba@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_090538_822548_A5AFD3EF 
X-CRM114-Status: GOOD (  19.83  )
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

The EL2 code defines ranges of host hypercalls that are either
enabled at boot-time only, used by [nh]VHE KVM, or reserved to pKVM.

The way these ranges are delineated is error prone, as the enum symbols
defining the limits are expressed in terms of actual function symbols.
This means that should a new function be added, special care must be
taken to also update the limit symbol.

Improve this by reusing the mechanism introduced for the vcpu_sysreg
enum, which uses a MARKER() macro and some extra trickery to make
the limit symbol standalone. Crucially, the limit symbol has the
same value as the *following* symbol.

The handle_host_hcall() function is then updated to make use of
the new limit definitions and get rid of the brittle default
upper limit. This allows for some more strict checks at build
time, and the removal of an comparison at run time.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h   | 12 ++++++++++--
 arch/arm64/include/asm/kvm_host.h  |  3 ---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 10 +++++-----
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 37414440cee7f..fa033be6141ad 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -50,6 +50,9 @@
 
 #include <linux/mm.h>
 
+#define MARKER(m)				\
+	m, __after_##m = m - 1
+
 enum __kvm_host_smccc_func {
 	/* Hypercalls that are unavailable once pKVM has finalised. */
 	/* __KVM_HOST_SMCCC_FUNC___kvm_hyp_init */
@@ -59,8 +62,10 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
+
+	MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
+
 	__KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
-	__KVM_HOST_SMCCC_FUNC_MIN_PKVM = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
 
 	/* Hypercalls that are always available and common to [nh]VHE/pKVM. */
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
@@ -76,7 +81,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
-	__KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM = __KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
+
+	MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
 
 	/* Hypercalls that are available only when pKVM has finalised. */
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
@@ -108,6 +114,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___tracing_reset,
 	__KVM_HOST_SMCCC_FUNC___tracing_enable_event,
 	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
+
+	MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 851f6171751c0..44211e86f5ebd 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -450,9 +450,6 @@ struct kvm_vcpu_fault_info {
 	r = __VNCR_START__ + ((VNCR_ ## r) / 8),	\
 	__after_##r = __MAX__(__before_##r - 1, r)
 
-#define MARKER(m)				\
-	m, __after_##m = m - 1
-
 enum vcpu_sysreg {
 	__INVALID_SYSREG__,   /* 0 is reserved as an invalid value */
 	MPIDR_EL1,	/* MultiProcessor Affinity Register */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 73f2e0221e703..9e44c05cf780e 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -748,9 +748,11 @@ static const hcall_t host_hcall[] = {
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(unsigned long, id, host_ctxt, 0);
-	unsigned long hcall_min = 0, hcall_max = -1;
+	unsigned long hcall_min = 0, hcall_max = __KVM_HOST_SMCCC_FUNC_MAX;
 	hcall_t hfn;
 
+	BUILD_BUG_ON(ARRAY_SIZE(host_hcall) != __KVM_HOST_SMCCC_FUNC_MAX);
+
 	/*
 	 * If pKVM has been initialised then reject any calls to the
 	 * early "privileged" hypercalls. Note that we cannot reject
@@ -763,16 +765,14 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 	if (static_branch_unlikely(&kvm_protected_mode_initialized)) {
 		hcall_min = __KVM_HOST_SMCCC_FUNC_MIN_PKVM;
 	} else {
-		hcall_max = __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM;
+		hcall_max = __KVM_HOST_SMCCC_FUNC_PKVM_ONLY;
 	}
 
 	id &= ~ARM_SMCCC_CALL_HINTS;
 	id -= KVM_HOST_SMCCC_ID(0);
 
-	if (unlikely(id < hcall_min || id > hcall_max ||
-		     id >= ARRAY_SIZE(host_hcall))) {
+	if (unlikely(id < hcall_min || id >= hcall_max))
 		goto inval;
-	}
 
 	hfn = host_hcall[id];
 	if (unlikely(!hfn))
-- 
2.47.3


