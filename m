Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D250CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Z5bA1By+JtNso6P9tQT0o7+iO9T31301+nK/HMuZ3g=; b=QMF2ka3AuTDEfrv3JfKPZwn1vk
	x7th6asHeCD4hxxfTDXFKEM2w6em+BBvvLlDrjKSNShVBteGdCQ2tXPRd0a5+82pMax8JT0GJiBTx
	jtxcw+4IoMtPbK7c8hZn4sK1FcQc432erSVEKzZAUQcOpRRRUQ9RoRESE3eRCV2fu3lCVz8YeZ9/s
	Y7L5LcATevsfT2ka12yDPgy0mZSOCcEnPw6AxymAHjE+DNCt6HuJqw5UR3+KD6rrJQqpuK+iEqS1w
	yVbSH86iJmousYL4OJK1mY6m8q1BYEROT1SpOEQCVB3RLPsehVnpNotrAIqsVRLgo1I1mX3elOyVH
	n7eg+RMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbt-0000000GZE5-2lJc;
	Wed, 27 Aug 2025 19:15:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIjb-0000000G8pa-3UC2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8418944B84;
	Wed, 27 Aug 2025 16:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67341C4CEF0;
	Wed, 27 Aug 2025 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311051;
	bh=6B5+c9uUTaPo5ss1f0hbG+yJAYTqzC9v9VAjf7G/RI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NCqSp+GqTJaKBpAXOLPp1bp3aMnxsgIOjbmPBZy+aojxDqBDuiPIRxpV8FJx3h0Lt
	 hb+i6Owfa4cWKCWhN8FoeNXuCePrj5SmympTKeSI/UN6LAfOCdITp+MWlPy2vDxoIO
	 2YUTZ8EbR5VpkmlZvibsI6w6yjaRgJWlIORqkdpmqalnDEwp9A3+D8PJOQ8W4Qp7CT
	 drqWLoPdAplHZCAICJ1wIcVqv778Fx4bH2FhekL1kaondH5kFZmd3X6/NIvg1Y+XXK
	 98yAX0oKNyjNXGNIo1rV2pGSn3HJyX+npUL6LOIl02SlybgbhcLzR193Gn6koPYCcI
	 Cw1013wF/rU5A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjZ-00000000yGc-2paM;
	Wed, 27 Aug 2025 16:10:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 16/16] KVM: arm64: selftest: Expand external_aborts test to look for TTW levels
Date: Wed, 27 Aug 2025 17:10:38 +0100
Message-Id: <20250827161039.938958-17-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091051_918323_40D67A8D 
X-CRM114-Status: GOOD (  14.62  )
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

Add a basic test corrupting a level-2 table entry to check that
the resulting abort is a SEA on a PTW at level-3.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 .../selftests/kvm/arm64/external_aborts.c     | 43 +++++++++++++++++++
 .../selftests/kvm/include/arm64/processor.h   |  1 +
 .../selftests/kvm/lib/arm64/processor.c       | 13 +++++-
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index 062bf84cced13..acb32d0f27bbe 100644
--- a/tools/testing/selftests/kvm/arm64/external_aborts.c
+++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
@@ -250,6 +250,48 @@ static void test_serror(void)
 	kvm_vm_free(vm);
 }
 
+static void expect_sea_s1ptw_handler(struct ex_regs *regs)
+{
+	u64 esr = read_sysreg(esr_el1);
+
+
+	GUEST_ASSERT_EQ(regs->pc, expected_abort_pc);
+	GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_CUR);
+	GUEST_ASSERT_EQ((esr & ESR_ELx_FSC), ESR_ELx_FSC_SEA_TTW(3));
+
+	GUEST_DONE();
+}
+
+static noinline void test_s1ptw_abort_guest(void)
+{
+	extern char test_s1ptw_abort_insn;
+
+	WRITE_ONCE(expected_abort_pc, (u64)&test_s1ptw_abort_insn);
+
+	asm volatile("test_s1ptw_abort_insn:\n\t"
+		     "ldr x0, [%0]\n\t"
+		     : : "r" (MMIO_ADDR) : "x0", "memory");
+
+	GUEST_FAIL("Load on S1PTW abort should not retire");
+}
+
+static void test_s1ptw_abort(void)
+{
+	struct kvm_vcpu *vcpu;
+	u64 *ptep, bad_pa;
+	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_s1ptw_abort_guest,
+							expect_sea_s1ptw_handler);
+
+	ptep = virt_get_pte_hva_at_level(vm, MMIO_ADDR, 2);
+	bad_pa = BIT(vm->pa_bits) - vm->page_size;
+
+	*ptep &= ~GENMASK(47, 12);
+	*ptep |= bad_pa;
+
+	vcpu_run_expect_done(vcpu);
+	kvm_vm_free(vm);
+}
+
 static void test_serror_emulated_guest(void)
 {
 	GUEST_ASSERT(!(read_sysreg(isr_el1) & ISR_EL1_A));
@@ -327,4 +369,5 @@ int main(void)
 	test_serror_masked();
 	test_serror_emulated();
 	test_mmio_ease();
+	test_s1ptw_abort();
 }
diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index 255fed769a8a5..e3e916b1d9c4e 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -175,6 +175,7 @@ void vm_install_exception_handler(struct kvm_vm *vm,
 void vm_install_sync_handler(struct kvm_vm *vm,
 		int vector, int ec, handler_fn handler);
 
+uint64_t *virt_get_pte_hva_at_level(struct kvm_vm *vm, vm_vaddr_t gva, int level);
 uint64_t *virt_get_pte_hva(struct kvm_vm *vm, vm_vaddr_t gva);
 
 static inline void cpu_relax(void)
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 9d69904cb6084..5c459862f6325 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -185,7 +185,7 @@ void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
 	_virt_pg_map(vm, vaddr, paddr, attr_idx);
 }
 
-uint64_t *virt_get_pte_hva(struct kvm_vm *vm, vm_vaddr_t gva)
+uint64_t *virt_get_pte_hva_at_level(struct kvm_vm *vm, vm_vaddr_t gva, int level)
 {
 	uint64_t *ptep;
 
@@ -195,17 +195,23 @@ uint64_t *virt_get_pte_hva(struct kvm_vm *vm, vm_vaddr_t gva)
 	ptep = addr_gpa2hva(vm, vm->pgd) + pgd_index(vm, gva) * 8;
 	if (!ptep)
 		goto unmapped_gva;
+	if (level == 0)
+		return ptep;
 
 	switch (vm->pgtable_levels) {
 	case 4:
 		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + pud_index(vm, gva) * 8;
 		if (!ptep)
 			goto unmapped_gva;
+		if (level == 1)
+			break;
 		/* fall through */
 	case 3:
 		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + pmd_index(vm, gva) * 8;
 		if (!ptep)
 			goto unmapped_gva;
+		if (level == 2)
+			break;
 		/* fall through */
 	case 2:
 		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + pte_index(vm, gva) * 8;
@@ -223,6 +229,11 @@ uint64_t *virt_get_pte_hva(struct kvm_vm *vm, vm_vaddr_t gva)
 	exit(EXIT_FAILURE);
 }
 
+uint64_t *virt_get_pte_hva(struct kvm_vm *vm, vm_vaddr_t gva)
+{
+	return virt_get_pte_hva_at_level(vm, gva, 3);
+}
+
 vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 {
 	uint64_t *ptep = virt_get_pte_hva(vm, gva);
-- 
2.39.2


