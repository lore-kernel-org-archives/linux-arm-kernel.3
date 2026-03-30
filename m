Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8738C1061B09
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JdaorIb8StMfyJzX5Eyap0lagiAMto8NWreqsHtTCQ=; b=uVA1nnKF6Ov/1Qg5txmEpzHslf
	Vz7bDpbNn2umzPdZzXvJy+jmXtTVArmKF1o1GLgVdKs68Y0/0XgCOJ4pdZZ3po6i02OmV+dkPdYYX
	WybUiSc372Os4TNgAC/qkDYYIOrW9mntG0SvwjKX9/7ReZkwGoSpNyUN07ziStLL5hQsEStzkQPNB
	HPY2/ppzuy4r37wX9UjZAgImQClMY86rgDqUDljqhiDKGoE/zbTyKWCQ4PNd1lAJ1oOdzM3mAE0yC
	KfTXA5GdqzOxCA3V7e6VuHceQkb7DTvFKNUmG7StwV+T9IY3ziYGUjvk/9QZD1wWwCJ5j4Wdhbrh4
	VaEJaKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dvn-0000000BTA2-3M8I;
	Mon, 30 Mar 2026 14:49:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dvk-0000000BT65-2COP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E397360123;
	Mon, 30 Mar 2026 14:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9FCC4CEF7;
	Mon, 30 Mar 2026 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882167;
	bh=UsvBRMLt/ktPH9jtaeWx7wGbf/WGFCHJM0ON/H9DwJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lAbWvbcAC/dKOYuwfiy4j1IueWTEaPLqPHdBSmA7RwPCUkgnn3GZQqOn7arevXC7y
	 0dY0T3Mv1oHUWdXQWzoPlXs9e/pQFTU9g8yPRPb3Szd34UV3SnJD4HSaDyxVullCw1
	 KZ7cqjon0q4pBy3qMkQAX/UtAeKBx5Euxrb48walSqlpky4R9Lcv7Wuwu+JpwkaGMU
	 aNPpn8GK5I1ejZdIpD34R9Ah98WD0fVkWYxKuz7eQTjc1yiF5imWtUTLFB+aqtCHtY
	 SAlNzkd9+suh2TTSW3ZjYFv2BxkOqVGykFS8bQlJ3FeUp+fCdvJ+/VC6pTV++nSYy7
	 64eULQyhMm2Rg==
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
Subject: [PATCH v5 11/38] KVM: arm64: Split teardown hypercall into two phases
Date: Mon, 30 Mar 2026 15:48:12 +0100
Message-ID: <20260330144841.26181-12-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Co-developed-by: Quentin Perret <qperret@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h       |  3 +-
 arch/arm64/include/asm/kvm_host.h      |  7 ++++
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  4 ++-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     | 14 ++++++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 44 ++++++++++++++++++++++----
 arch/arm64/kvm/pkvm.c                  |  7 +++-
 6 files changed, 67 insertions(+), 12 deletions(-)

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
index 70cb9cfd760a..31b9454bb74d 100644
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
index 2f029bfe4755..61e69e24656a 100644
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
@@ -301,8 +304,14 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
 
 	hyp_spin_lock(&vm_table_lock);
 	hyp_vm = get_vm_by_handle(handle);
-	if (hyp_vm)
+	if (!hyp_vm)
+		goto unlock;
+
+	if (hyp_vm->kvm.arch.pkvm.is_dying)
+		hyp_vm = NULL;
+	else
 		hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
+unlock:
 	hyp_spin_unlock(&vm_table_lock);
 
 	return hyp_vm;
@@ -859,7 +868,32 @@ teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
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
@@ -873,9 +907,7 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
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
index 94b70eb80aa8..ea7f267ee7ad 100644
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
@@ -356,6 +356,11 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
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
2.53.0.1018.g2bb0e51243-goog


