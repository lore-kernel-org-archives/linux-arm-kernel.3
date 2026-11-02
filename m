Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88F960A3837
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bQu8aknG;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jErUH5qQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P7s5fTYbabCx65o9vZqOXbEWaMwo2qqeJ1k/3DDHPeg=; b=bQu8aknGpfKHYR
	3CMk+G+oxzqEJMlUGoYYhx07fhjEkTeJmTrjnvMNpBeKszZmfukQotmyLa55P/cWA9i/K4tIR5csz
	pfxLmFGFZ9JN0lKNCKf5sj/95ORHftGMPfTmMaeAygNLnS37He5BaCzxDy9GtZefyPuky30TE8j2X
	/YdynEH9000oT4WUjrg3HJl0WGmFMRxTTglc1GCd7eK+eawqH/37iGo6x2G17iH8FdfpyIOqm8+c+
	OUad3QzBNwHpEMqJUl8A4ul+ozFw4OeWuNj0/6iobRuoIETLicfJ2XunMrcVAPP/rOhVAwgFYrlrJ
	QnjoHxwoRgiczFg6Sm9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsnR-0000000Gjsx-2uV6;
	Mon, 02 Nov 2026 14:14:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsnO-0000000Gjq2-2fUv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:14:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E716D1691;
	Mon,  2 Nov 2026 06:13:54 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33E273F59E;
	Mon,  2 Nov 2026 06:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793628838; bh=yKWmeyNxwmUK+L/EPoppbmafGzFD1IiTBcY7YvGJPYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jErUH5qQcDMkfm+742/DyqdPY5qpqOpoY8e/WOp2e3TO0ciRvmUUKejg4nul2aZZ/
	 TOV6gDOvms5ktgs20ntV2b3NL8N8ssLZuZfvEfRLFiodpM10QCzxOs19vhevbDpKWU
	 R9ke8vqq763JW06yL4AJD2VrHwMiZi04sH1WD5RM=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 06/11] KVM: arm64: CCA: Add basic infrastructure for creating a realm
Date: Mon,  2 Nov 2026 14:12:57 +0000
Message-ID: <20261102141304.126883-7-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102141304.126883-1-steven.price@arm.com>
References: <20261102141304.126883-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_061359_194454_88AC75EB 
X-CRM114-Status: GOOD (  23.02  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce the skeleton functions for creating and destroying a realm.
The IPA size requested is checked against what the RMM supports.

The actual work of constructing the realm will be added in future
patches.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/include/asm/kvm_rmi.h | 20 ++++++++++++
 arch/arm64/kvm/arm.c             |  9 +++++
 arch/arm64/kvm/mmu.c             | 18 ++++++++--
 arch/arm64/kvm/rmi.c             | 56 ++++++++++++++++++++++++++++++++
 4 files changed, 101 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 3194daaacf2b..f1a1ed6b91f5 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -6,6 +6,9 @@
 #ifndef __ASM_KVM_RMI_H
 #define __ASM_KVM_RMI_H
 
+#include <linux/arm-smccc-rmi.h>
+#include <linux/kvm.h>
+
 /**
  * enum realm_state - State of a Realm
  *
@@ -50,12 +53,29 @@ enum realm_state {
 /**
  * struct realm - Additional per VM data for a Realm
  *
+ * @rd: Kernel mapping of the RMM-managed Realm Descriptor (RD) granule
+ * @sro: Preallocated SRO state context for Realm MMU operations
  * @state: The lifetime state machine for the realm
+ * @ia_bits: Number of valid Input Address bits in the IPA
  */
 struct realm {
+	void *rd;
+	/*
+	 * Reused by RTT map/unmap SRO commands. Those commands are only
+	 * issued from Realm stage-2 map/unmap paths while kvm->mmu_lock is
+	 * held for write, including Realm fault handling where
+	 * kvm_fault_lock() takes the write side, so concurrent use is
+	 * serialized.
+	 */
+	struct rmi_sro_state *sro;
 	enum realm_state state;
+	unsigned int ia_bits;
 };
 
 void kvm_init_rmi(void);
+u32 kvm_rmm_ipa_limit(void);
+
+int kvm_init_realm(struct kvm *kvm);
+void kvm_destroy_realm(struct kvm *kvm);
 
 #endif /* __ASM_KVM_RMI_H */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c8599fed5902..9a7bbfaf9675 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -303,6 +303,13 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
 
+	/* Initialise the realm bits after the generic bits are enabled */
+	if (kvm_vm_is_realm(kvm)) {
+		ret = kvm_init_realm(kvm);
+		if (ret)
+			goto err_uninit_mmu;
+	}
+
 	return 0;
 
 err_uninit_mmu:
@@ -367,6 +374,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 
 	kvm_destroy_nested(kvm);
 	kvm_arm_teardown_hypercalls(kvm);
+	if (kvm_vm_is_realm(kvm))
+		kvm_destroy_realm(kvm);
 }
 
 static bool kvm_has_full_ptr_auth(void)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1301c563d705..b049ea67d9af 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -981,10 +981,14 @@ static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
 
 static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 {
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	u32 kvm_ipa_limit = get_kvm_ipa_limit();
 	u64 mmfr0, mmfr1;
 	u32 phys_shift;
 
+	if (kvm_vm_is_realm(kvm))
+		kvm_ipa_limit = kvm_rmm_ipa_limit();
+
 	phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
 	if (is_protected_kvm_enabled()) {
 		phys_shift = kvm_ipa_limit;
@@ -1034,9 +1038,18 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
 
 static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
 {
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
 
-	stage2_destroy_range(pgt, 0, BIT(ia_bits));
+	/*
+	 * Realm RTTs are inaccessible to the host and may contain stale data
+	 * after the RMM has released them. The non-root RTTs are explicitly
+	 * destroyed through RMI before the RD is destroyed; only the root PGD
+	 * pages remain to be freed here.
+	 */
+	if (!kvm_vm_is_realm(kvm))
+		stage2_destroy_range(pgt, 0, BIT(ia_bits));
+
 	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
 }
 
@@ -1084,6 +1097,8 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 		return -EINVAL;
 	}
 
+	mmu->arch = &kvm->arch;
+
 	err = kvm_init_ipa_range(mmu, type);
 	if (err)
 		return err;
@@ -1092,7 +1107,6 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	if (!pgt)
 		return -ENOMEM;
 
-	mmu->arch = &kvm->arch;
 	err = KVM_PGT_FN(kvm_pgtable_stage2_init)(pgt, mmu, &kvm_s2_mm_ops);
 	if (err)
 		goto out_free_pgtable;
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 5b07beff8bc9..45ecbaa467d1 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -6,6 +6,8 @@
 #include <linux/arm-rmi-cmds.h>
 #include <linux/kvm_host.h>
 
+#include <asm/kvm_emulate.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_pgtable.h>
 #include <asm/virt.h>
 
@@ -14,6 +16,60 @@ static bool rmi_has_feature(int reg, unsigned long feature)
 	return !!u64_get_bits(rmi_feat_reg(reg), feature);
 }
 
+u32 kvm_rmm_ipa_limit(void)
+{
+	return u64_get_bits(rmi_feat_reg(0), RMI_FEATURE_REGISTER_0_S2SZ);
+}
+
+void kvm_destroy_realm(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
+
+	if (!kvm_realm_is_created(kvm)) {
+		kfree(realm->sro);
+		realm->sro = NULL;
+		return;
+	}
+
+	kvm_set_realm_state(kvm, REALM_STATE_DYING);
+
+	if (realm->rd) {
+		phys_addr_t rd_phys = virt_to_phys(realm->rd);
+
+		if (WARN_ON(rmi_realm_terminate(rd_phys, realm->sro)))
+			return;
+
+		if (WARN_ON(rmi_realm_destroy(rd_phys, realm->sro)))
+			return;
+		rmi_free_delegated_page(rd_phys);
+		realm->rd = NULL;
+	}
+
+	if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys,
+					 pgd_size)))
+		return;
+
+	kvm_set_realm_state(kvm, REALM_STATE_DEAD);
+
+	/* Now that the realm is destroyed, free the entry-level RTTs. */
+	kvm_free_stage2_pgd(&kvm->arch.mmu);
+
+	kfree(realm->sro);
+	realm->sro = NULL;
+}
+
+int kvm_init_realm(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+
+	realm->sro = kmalloc_obj(*realm->sro);
+	if (!realm->sro)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int rmm_check_features(void)
 {
 	if (kvm_lpa2_is_enabled() &&
-- 
2.43.0


