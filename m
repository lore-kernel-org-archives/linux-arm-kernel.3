Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E50FED9F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyEIK4RZqIRvu0U5EDM/OcUg/HPiJTgNqcOQsDzJ1tU=; b=PK08ZSXuBcUICjIf6+e+Lh2RwD
	Cb2+2+LRzmC3UEbReH0luapmCiRRQjNDKn0MlXSMAgFm4cnQGSmvk4MLhiajVL9B1WYSQT+Xvmhw5
	X3j6RUeqDthE3V/KOaU9DjNgvRXecw1HAU2tyb6LDY7E4V6T4L0E/LF4SnH0vU29EL+3+p5R75STB
	zS+Lz0z8ChQzt27MoiUyWFTcx0D73yHPFg8DsGm6rmllqPjRrBYu+D2vg3mNGO21Sf1bFtez4DUUK
	cd8cMtqjIRKpJvljmTwA/Z3HhL3Kfgy8bvFS8T0rFMthjx5XTA7Z12Tl1Mi2D8Vbq8aQaoaSaisJ/
	jtzt8ZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Z8n-000000073SG-3lSR;
	Tue, 17 Mar 2026 18:27:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Z8l-000000073RH-1qHV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:27:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E30A01477;
	Tue, 17 Mar 2026 11:27:31 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64E173F7BD;
	Tue, 17 Mar 2026 11:27:36 -0700 (PDT)
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 2/2] KVM: arm64: nv: Expose shadow page tables in debugfs
Date: Tue, 17 Mar 2026 18:26:38 +0000
Message-ID: <20260317182638.1592507-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317182638.1592507-1-weilin.chang@arm.com>
References: <20260317182638.1592507-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_112739_574618_7157D581 
X-CRM114-Status: GOOD (  19.93  )
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

Exposing shadow page tables in debugfs improves the debugability and
testability of NV. With this patch a new directory "nested" is created
for each VM created if the host is NV capable. Within the directory each
valid s2 mmu will have its shadow page table exposed as a readable file
with the file name formatted as 0x<vttbr>-0x<vtcr>-s2-{en,dis}abled. The
creation and removal of the files happen at the points when an s2 mmu
becomes valid, or the context it represents change. In the future the
"nested" directory can also hold other NV related information.

This is gated behind CONFIG_PTDUMP_STAGE2_DEBUGFS.

Suggested-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_host.h |  9 +++++++++
 arch/arm64/include/asm/kvm_mmu.h  |  4 ++++
 arch/arm64/kvm/nested.c           |  6 +++++-
 arch/arm64/kvm/ptdump.c           | 27 +++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 5d5a3bbdb95e..52977c9a11c3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -217,6 +217,10 @@ struct kvm_s2_mmu {
 	 */
 	bool	nested_stage2_enabled;
 
+#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
+	struct dentry *shadow_pt_debugfs_dentry;
+#endif
+
 	/*
 	 * true when this MMU needs to be unmapped before being used for a new
 	 * purpose.
@@ -405,6 +409,11 @@ struct kvm_arch {
 	 * the associated pKVM instance in the hypervisor.
 	 */
 	struct kvm_protected_vm pkvm;
+
+#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
+	/* Nested virtualization info */
+	struct dentry *debugfs_nv_dentry;
+#endif
 };
 
 struct kvm_vcpu_fault_info {
diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index d968aca0461a..01e9c72d6aa7 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -393,8 +393,12 @@ static inline bool kvm_supports_cacheable_pfnmap(void)
 
 #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
 void kvm_s2_ptdump_create_debugfs(struct kvm *kvm);
+void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu);
+void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu);
 #else
 static inline void kvm_s2_ptdump_create_debugfs(struct kvm *kvm) {}
+static inline void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu) {}
+static inline void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu) {}
 #endif /* CONFIG_PTDUMP_STAGE2_DEBUGFS */
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index eeea5e692370..31d74ed8449e 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -730,8 +730,10 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 	kvm->arch.nested_mmus_next = (i + 1) % kvm->arch.nested_mmus_size;
 
 	/* Make sure we don't forget to do the laundry */
-	if (kvm_s2_mmu_valid(s2_mmu))
+	if (kvm_s2_mmu_valid(s2_mmu)) {
+		kvm_nested_s2_ptdump_remove_debugfs(s2_mmu);
 		s2_mmu->pending_unmap = true;
+	}
 
 	/*
 	 * The virtual VMID (modulo CnP) will be used as a key when matching
@@ -745,6 +747,8 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 	s2_mmu->tlb_vtcr = vcpu_read_sys_reg(vcpu, VTCR_EL2);
 	s2_mmu->nested_stage2_enabled = vcpu_read_sys_reg(vcpu, HCR_EL2) & HCR_VM;
 
+	kvm_nested_s2_ptdump_create_debugfs(s2_mmu);
+
 out:
 	atomic_inc(&s2_mmu->refcnt);
 
diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 98763b291956..aebbbad85d38 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -10,12 +10,14 @@
 #include <linux/kvm_host.h>
 #include <linux/seq_file.h>
 
+#include <asm/cpufeature.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_pgtable.h>
 #include <asm/ptdump.h>
 
 #define MARKERS_LEN		2
 #define KVM_PGTABLE_MAX_LEVELS	(KVM_PGTABLE_LAST_LEVEL + 1)
+#define S2FNAMESZ	sizeof("0x0123456789abcdef-0x0123456789abcdef-s2-disabled")
 
 struct kvm_ptdump_guest_state {
 	struct kvm_s2_mmu	*mmu;
@@ -277,6 +279,28 @@ static const struct file_operations kvm_pgtable_levels_fops = {
 	.release	= kvm_pgtable_debugfs_close,
 };
 
+void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu)
+{
+	struct dentry *dent;
+	char file_name[S2FNAMESZ];
+
+	snprintf(file_name, sizeof(file_name), "0x%llx-0x%llx-s2-%sabled",
+		 mmu->tlb_vttbr,
+		 mmu->tlb_vtcr,
+		 mmu->nested_stage2_enabled ? "en" : "dis");
+
+	dent = debugfs_create_file(file_name, 0400,
+				   mmu->arch->debugfs_nv_dentry, mmu,
+				   &kvm_ptdump_guest_fops);
+
+	mmu->shadow_pt_debugfs_dentry = dent;
+}
+
+void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu)
+{
+	debugfs_remove(mmu->shadow_pt_debugfs_dentry);
+}
+
 void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
 {
 	debugfs_create_file("stage2_page_tables", 0400, kvm->debugfs_dentry,
@@ -285,4 +309,7 @@ void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
 			    &kvm->arch.mmu, &kvm_pgtable_range_fops);
 	debugfs_create_file("stage2_levels", 0400, kvm->debugfs_dentry,
 			    &kvm->arch.mmu, &kvm_pgtable_levels_fops);
+	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
+		kvm->arch.debugfs_nv_dentry =
+			debugfs_create_dir("nested", kvm->debugfs_dentry);
 }
-- 
2.43.0


