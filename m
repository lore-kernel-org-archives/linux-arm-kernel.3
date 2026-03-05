Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAD5F33A79
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAv/8HmlAn/Qot2JKSZqAnMjTCp/agMf2e97++bdoD4=; b=zedkwqqA1/inqNmv0etFTwtuxk
	PRTeKiZTdlfwxlLya9ybHGsbho5q+F2Ug1rFFyzWXyChX2xENPeNehw3a6LGY6easv6Qt9CJZxbRL
	7BPFgcgBLIXISAbQfEHibflcq11AI63EfCCdjksDsxnzGECuPum3hUbhfqObPVkvbVOy850v50MKe
	Y2IDQv1iG8USVgvIrHGR3KGmobitNXSVTDsCnIVFkCmsPjNvOLrw3UFOeougM7pruQD4FY5FHLGjs
	WhBMS5fOcDYHpfjcaGgciVjiHKjgAPfxz3wurLBW28rtfjd+iVcEb9aiJQcHT2LhKuN3FT6Ym5Ifp
	BBD/2Muw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wW-000000021ND-2xtF;
	Thu, 05 Mar 2026 14:44:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wU-000000021KQ-1JS1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD00F41898;
	Thu,  5 Mar 2026 14:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB7EC116C6;
	Thu,  5 Mar 2026 14:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721885;
	bh=wn4SL8TqWB/sDO8+sLBGUxB6TlwqgJ+UgCL5lcaBB9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VUOtODbRxmoSqeJoG7V8U/Vhv8QUNMu+aTWVUh9SJo+t03cqGPD+3/cDF84tgisVL
	 QikVf5KVmjIyIZufMzLBEiLV1jNwP0v7UnzHBswFyQHNdLEJ8Yn2ahUufP0dEf8mOT
	 RgNd/5p0+4gG+66f7caQ0UWtQtf9gjktRTdAqBwMoWa0z+Pp2XLoYxPAPuNeJ6vmiv
	 efWKkhXe4dsBQ5Vgvc3E1Zd1wgmlJSNZy/DdURH8T08bFxVf1DXQymmYQlxZQHdmEi
	 B2E52mnsGxHQVy3N46rxIhX1AD0MLF80L1sjXeG/H/OnLmoPRhZvpF/9GqSQL72aOT
	 SIJtARWy/NSzA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v3 10/36] KVM: arm64: Split teardown hypercall into two phases
Date: Thu,  5 Mar 2026 14:43:23 +0000
Message-ID: <20260305144351.17071-11-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_064446_391568_CFCA570A 
X-CRM114-Status: GOOD (  20.12  )
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

In preparation for reclaiming protected guest VM pages from the host
during teardown, split the current 'pkvm_teardown_vm' hypercall into
separate 'start' and 'finalise' calls.

The 'pkvm_start_teardown_vm' hypercall puts the VM into a new 'is_dying'
state, which is a point of no return past which no vCPU of the pVM is
allowed to run any more.  Once in this new state,
'pkvm_finalize_teardown_vm' can be used to reclaim meta-data and
page-table pages from the VM. A subsequent patch will add support for
reclaiming the individual guest memory pages.

Co-developed-by: Quentin Perret <qperret@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h       |  3 ++-
 arch/arm64/include/asm/kvm_host.h      |  7 +++++
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  4 ++-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     | 14 +++++++---
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 36 ++++++++++++++++++++++----
 arch/arm64/kvm/pkvm.c                  |  7 ++++-
 6 files changed, 60 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 7b72aac4730d..df6b661701b6 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -89,7 +89,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vcpu,
-	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
+	__KVM_HOST_SMCCC_FUNC___pkvm_start_teardown_vm,
+	__KVM_HOST_SMCCC_FUNC___pkvm_finalize_teardown_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2ca264b3db5f..911819e6e757 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -255,6 +255,13 @@ struct kvm_protected_vm {
 	struct kvm_hyp_memcache stage2_teardown_mc;
 	bool is_protected;
 	bool is_created;
+
+	/*
+	 * True when the guest is being torn down. When in this state, the
+	 * guest's vCPUs can't be loaded anymore, but its pages can be
+	 * reclaimed by the host.
+	 */
+	bool is_dying;
 };
 
 struct kvm_mpidr_data {
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 184ad7a39950..04c7ca703014 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -73,7 +73,9 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 		   unsigned long pgd_hva);
 int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
 		     unsigned long vcpu_hva);
-int __pkvm_teardown_vm(pkvm_handle_t handle);
+
+int __pkvm_start_teardown_vm(pkvm_handle_t handle);
+int __pkvm_finalize_teardown_vm(pkvm_handle_t handle);
 
 struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 					 unsigned int vcpu_idx);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 127decc2dd2b..634ea2766240 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -553,11 +553,18 @@ static void handle___pkvm_init_vcpu(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_init_vcpu(handle, host_vcpu, vcpu_hva);
 }
 
-static void handle___pkvm_teardown_vm(struct kvm_cpu_context *host_ctxt)
+static void handle___pkvm_start_teardown_vm(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 
-	cpu_reg(host_ctxt, 1) = __pkvm_teardown_vm(handle);
+	cpu_reg(host_ctxt, 1) = __pkvm_start_teardown_vm(handle);
+}
+
+static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+
+	cpu_reg(host_ctxt, 1) = __pkvm_finalize_teardown_vm(handle);
 }
 
 typedef void (*hcall_t)(struct kvm_cpu_context *);
@@ -598,7 +605,8 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_unreserve_vm),
 	HANDLE_FUNC(__pkvm_init_vm),
 	HANDLE_FUNC(__pkvm_init_vcpu),
-	HANDLE_FUNC(__pkvm_teardown_vm),
+	HANDLE_FUNC(__pkvm_start_teardown_vm),
+	HANDLE_FUNC(__pkvm_finalize_teardown_vm),
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 2f029bfe4755..c4e05ab8b605 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -255,7 +255,10 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 
 	hyp_spin_lock(&vm_table_lock);
 	hyp_vm = get_vm_by_handle(handle);
-	if (!hyp_vm || hyp_vm->kvm.created_vcpus <= vcpu_idx)
+	if (!hyp_vm || hyp_vm->kvm.arch.pkvm.is_dying)
+		goto unlock;
+
+	if (hyp_vm->kvm.created_vcpus <= vcpu_idx)
 		goto unlock;
 
 	hyp_vcpu = hyp_vm->vcpus[vcpu_idx];
@@ -859,7 +862,32 @@ teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
 	unmap_donated_memory_noclear(addr, size);
 }
 
-int __pkvm_teardown_vm(pkvm_handle_t handle)
+int __pkvm_start_teardown_vm(pkvm_handle_t handle)
+{
+	struct pkvm_hyp_vm *hyp_vm;
+	int ret = 0;
+
+	hyp_spin_lock(&vm_table_lock);
+	hyp_vm = get_vm_by_handle(handle);
+	if (!hyp_vm) {
+		ret = -ENOENT;
+		goto unlock;
+	} else if (WARN_ON(hyp_page_count(hyp_vm))) {
+		ret = -EBUSY;
+		goto unlock;
+	} else if (hyp_vm->kvm.arch.pkvm.is_dying) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	hyp_vm->kvm.arch.pkvm.is_dying = true;
+unlock:
+	hyp_spin_unlock(&vm_table_lock);
+
+	return ret;
+}
+
+int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 {
 	struct kvm_hyp_memcache *mc, *stage2_mc;
 	struct pkvm_hyp_vm *hyp_vm;
@@ -873,9 +901,7 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
 	if (!hyp_vm) {
 		err = -ENOENT;
 		goto err_unlock;
-	}
-
-	if (WARN_ON(hyp_page_count(hyp_vm))) {
+	} else if (!hyp_vm->kvm.arch.pkvm.is_dying) {
 		err = -EBUSY;
 		goto err_unlock;
 	}
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 20d50abb3b94..a39dacd1d617 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -88,7 +88,7 @@ void __init kvm_hyp_reserve(void)
 static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
 	if (pkvm_hyp_vm_is_created(kvm)) {
-		WARN_ON(kvm_call_hyp_nvhe(__pkvm_teardown_vm,
+		WARN_ON(kvm_call_hyp_nvhe(__pkvm_finalize_teardown_vm,
 					  kvm->arch.pkvm.handle));
 	} else if (kvm->arch.pkvm.handle) {
 		/*
@@ -350,6 +350,11 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 	if (!handle)
 		return;
 
+	if (pkvm_hyp_vm_is_created(kvm) && !kvm->arch.pkvm.is_dying) {
+		WARN_ON(kvm_call_hyp_nvhe(__pkvm_start_teardown_vm, handle));
+		kvm->arch.pkvm.is_dying = true;
+	}
+
 	__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
 }
 
-- 
2.53.0.473.g4a7958ca14-goog


