Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29435E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pP8bnMYzH0rRgvYU0LBvl1h3gElvO0I2TorracJ9LyY=; b=Es4ODLksICDB5gaJmQ//uGD49Q
	xpPn6Wng+55HxVhFhrhpf7tp9O844MLHghcOROa+XRPY6A27Wovg8fDlR5nUelwy997z6U+NUMOTU
	+CKNk8DTSlw7RA/8nhVuoaGpDbqV5gdejq/EjN/dDRKLyjLLhseOV3gFcjqx1qIH/XfaXZ0w4kTSz
	LC44dg4tv9Jf/QsyxJ9GZWyFlaQzZ1MMI/+g0mEfaZyNkn3AceZSzsWNjuVvH5L6vONaLF8Z46t0V
	CLfJPBYWpMoTyQlSQreT8EVWSPs+Q94NiRirZkZtDEzulz3lLO/wmV3CDfs8jNbG469y0q++pQHEb
	d6x67WUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZN8-0000000DvpP-32Hs;
	Tue, 17 Dec 2024 15:20:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZGw-0000000DuRt-0Ocj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48B505C5FEA;
	Tue, 17 Dec 2024 15:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F739C4CEDF;
	Tue, 17 Dec 2024 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448445;
	bh=Bgxuo34U3iIpwaIaLAPc1QHIjxi5FsZIEKUZNx2/DWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dwq2eoxf+QW0+Z858ezsWXx+fQN4JTfFdJh7CQAwIcnNxnpjmf7OOHjU18ej2tRC4
	 7SzuIRt1xoVTaX/IRJm7k7+6fhvB9RwHid+p702+S5YWOIKfe21tS5LjWkhKVv7Mc0
	 YbEu1QOLhFoTsyEXsg2IdBjfniuczdMbDC7nuiLg8fuiKD+OUSPTHjOOqEW+PG5z0g
	 /9qSUBc+AC60RGYCcW6cZk3u3QFgeswz30Ydyd++YLKQAQoDMaO39YyU5WbaxS73pu
	 O91a5/MZfenyQ7dT2KJyqT0Lh74borfDjmVCRzQkmVE2eD7t9wD88PrxPQnaCgRHUu
	 Z3/o5oikuR43g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNZGt-004bWV-8r;
	Tue, 17 Dec 2024 15:14:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 04/16] KVM: arm64: Move host SVE/SME state flags out of vCPU
Date: Tue, 17 Dec 2024 15:13:19 +0000
Message-Id: <20241217151331.934077-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217151331.934077-1-maz@kernel.org>
References: <20241217151331.934077-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eauger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071406_224735_654B63B2 
X-CRM114-Status: GOOD (  15.17  )
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

From: Oliver Upton <oliver.upton@linux.dev>

We're running a bit tight on vCPU state flags, and there's no good
reason for tracking bits of host state in the vCPU. Rather than do the
unspeakable and add another byte of sflags, move some of the obvious
host bits over to kvm_host_data where they really belong.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20240823212703.3576061-3-oliver.upton@linux.dev
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 26 ++++++++++++++++----------
 arch/arm64/kvm/fpsimd.c           | 12 ++++++------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e18e9244d17a4..8cc25845b4be3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -610,6 +610,12 @@ struct cpu_sve_state {
  * field.
  */
 struct kvm_host_data {
+	/* SVE enabled for EL0 */
+#define HOST_SVE_ENABLED	0
+	/* SME enabled for EL0 */
+#define HOST_SME_ENABLED	1
+	unsigned long flags;
+
 	struct kvm_cpu_context host_ctxt;
 
 	/*
@@ -913,22 +919,18 @@ struct kvm_vcpu_arch {
 /* Save TRBE context if active  */
 #define DEBUG_STATE_SAVE_TRBE	__vcpu_single_flag(iflags, BIT(6))
 
-/* SVE enabled for host EL0 */
-#define HOST_SVE_ENABLED	__vcpu_single_flag(sflags, BIT(0))
-/* SME enabled for EL0 */
-#define HOST_SME_ENABLED	__vcpu_single_flag(sflags, BIT(1))
 /* Physical CPU not in supported_cpus */
-#define ON_UNSUPPORTED_CPU	__vcpu_single_flag(sflags, BIT(2))
+#define ON_UNSUPPORTED_CPU	__vcpu_single_flag(sflags, BIT(0))
 /* WFIT instruction trapped */
-#define IN_WFIT			__vcpu_single_flag(sflags, BIT(3))
+#define IN_WFIT			__vcpu_single_flag(sflags, BIT(1))
 /* vcpu system registers loaded on physical CPU */
-#define SYSREGS_ON_CPU		__vcpu_single_flag(sflags, BIT(4))
+#define SYSREGS_ON_CPU		__vcpu_single_flag(sflags, BIT(2))
 /* Software step state is Active-pending */
-#define DBG_SS_ACTIVE_PENDING	__vcpu_single_flag(sflags, BIT(5))
+#define DBG_SS_ACTIVE_PENDING	__vcpu_single_flag(sflags, BIT(3))
 /* PMUSERENR for the guest EL0 is on physical CPU */
-#define PMUSERENR_ON_CPU	__vcpu_single_flag(sflags, BIT(6))
+#define PMUSERENR_ON_CPU	__vcpu_single_flag(sflags, BIT(4))
 /* WFI instruction trapped */
-#define IN_WFI			__vcpu_single_flag(sflags, BIT(7))
+#define IN_WFI			__vcpu_single_flag(sflags, BIT(5))
 
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
@@ -1307,6 +1309,10 @@ DECLARE_KVM_HYP_PER_CPU(struct kvm_host_data, kvm_host_data);
 	 &this_cpu_ptr_hyp_sym(kvm_host_data)->f)
 #endif
 
+#define host_data_set_flag(nr)		set_bit(nr, host_data_ptr(flags))
+#define host_data_test_flag(nr)		test_bit(nr, host_data_ptr(flags))
+#define host_data_clear_flag(nr)	clear_bit(nr, host_data_ptr(flags))
+
 /* Check whether the FP regs are owned by the guest */
 static inline bool guest_owns_fp_regs(void)
 {
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index ea5484ce1f3ba..0e0f37d1990a3 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -65,14 +65,14 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	*host_data_ptr(fpsimd_state) = kern_hyp_va(&current->thread.uw.fpsimd_state);
 	*host_data_ptr(fpmr_ptr) = kern_hyp_va(&current->thread.uw.fpmr);
 
-	vcpu_clear_flag(vcpu, HOST_SVE_ENABLED);
+	host_data_clear_flag(HOST_SVE_ENABLED);
 	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
-		vcpu_set_flag(vcpu, HOST_SVE_ENABLED);
+		host_data_set_flag(HOST_SVE_ENABLED);
 
 	if (system_supports_sme()) {
-		vcpu_clear_flag(vcpu, HOST_SME_ENABLED);
+		host_data_clear_flag(HOST_SME_ENABLED);
 		if (read_sysreg(cpacr_el1) & CPACR_EL1_SMEN_EL0EN)
-			vcpu_set_flag(vcpu, HOST_SME_ENABLED);
+			host_data_set_flag(HOST_SME_ENABLED);
 
 		/*
 		 * If PSTATE.SM is enabled then save any pending FP
@@ -168,7 +168,7 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 	 */
 	if (has_vhe() && system_supports_sme()) {
 		/* Also restore EL0 state seen on entry */
-		if (vcpu_get_flag(vcpu, HOST_SME_ENABLED))
+		if (host_data_test_flag(HOST_SME_ENABLED))
 			sysreg_clear_set(CPACR_EL1, 0, CPACR_ELx_SMEN);
 		else
 			sysreg_clear_set(CPACR_EL1,
@@ -227,7 +227,7 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 		 * for EL0.  To avoid spurious traps, restore the trap state
 		 * seen by kvm_arch_vcpu_load_fp():
 		 */
-		if (vcpu_get_flag(vcpu, HOST_SVE_ENABLED))
+		if (host_data_test_flag(HOST_SVE_ENABLED))
 			sysreg_clear_set(CPACR_EL1, 0, CPACR_EL1_ZEN_EL0EN);
 		else
 			sysreg_clear_set(CPACR_EL1, CPACR_EL1_ZEN_EL0EN, 0);
-- 
2.39.2


