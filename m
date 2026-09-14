Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B008C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkOIvu8q2gHRPu8gLHr1j7FThQAssMDAlnryy77Ag5Q=; b=MzPOVJatFS5/ruPtjHVuvtd+Hx
	i2mXJDZp3Lz4WE3f5kfM21xRmfOCzjnimyAkf8kyWTVaYg7a0bRAiSt1oARcivgdk/lcscfRFoEJ0
	zSgE4FtU8FmfB7o7moGpsd9s8JcqRksg8Ml72PMh/OFg3XxNv4M8xRa1wOb/7RdtYqZEnEKa8nOu9
	Kocyb5USBQr8kg+Pp2HUszzVhFb1J4wdw+pC0seOCaiH6bjZKEpmT9rNVr2q4hoAXtS01DhZk+Sjo
	Mr2DWZ2SJoYkdwDsIpFYbPzZlOecWql25YXN4dSXXYt6SwvdvzFYqT2mjmhdfAVMCb4z0M6HFVOTr
	v0bg15Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64wi-00000003Fpd-3FFL;
	Mon, 14 Sep 2026 11:34:00 +0000
Received: from out-109.mta0.migadu.com ([2001:41d0:1004:224b::6d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64wd-00000003Fmu-1bGI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:33:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ANhxith82ULbv0/JaaJ8goUq0CxV3cuc4rjj5cuj3dU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789385633; v=1; x=1789990433;
 b=Yp9q6pC0gh7TfOjpdghu+mei+jDuIICBU9dW9jyE97lcY3oYc8EnMVH1PeoX4fQdUcl+spL/
 haSC5znA2FF9u3JZBDkmMN2xxGeBGcjyrzb4WNocCQtQodpRFwwI93Ns+AvhuSfZmPtCF/XCbBf
 oHq1KXxgwsQs2RpW8owSAx/M=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f8e40eda986950bb;
	Mon, 14 Sep 2026 11:33:53 +0000
X-Mizu-Trace-ID: f8e40eda986950bb
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v3 02/18] KVM: arm64: Validate the host vCPU's VM before reading it under pKVM
Date: Mon, 14 Sep 2026 12:33:22 +0100
Message-Id: <20260914113338.159227-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260914113338.159227-1-fuad.tabba@linux.dev>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043355_571798_49B90197 
X-CRM114-Status: GOOD (  15.34  )
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

On an MTE-capable host under pKVM, enter_exception64() reads the VM's
MTE flag through vcpu->kvm, which for a host vCPU is a host-writable
pointer nothing validates. The host can point it at any address in the
hyp linear map and read back bit 1 of that word through PSR_TCO in the
vCPU's CPSR, or panic the hypervisor with an unmapped one.

Get the VM through a get/put pair around the read: a loaded vCPU's is
the hyp VM, an unloaded host vCPU's is read once and pinned, and a
pointer the host never shared leaves TCO clear.

Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260914070536.877D91F000FF@smtp.kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/exception.c             |  5 ++-
 arch/arm64/kvm/hyp/include/hyp/adjust_pc.h | 18 ++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c             | 39 ++++++++++++++++++++++
 3 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index 754e2dc1df54a..6e60d890afa4a 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -70,6 +70,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
 			      enum exception_type type)
 {
 	unsigned long sctlr, vbar, old, new, mode;
+	struct kvm *kvm;
 	u64 exc_offset;
 
 	mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
@@ -109,8 +110,10 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
 	new |= (old & PSR_C_BIT);
 	new |= (old & PSR_V_BIT);
 
-	if (kvm_has_mte(kern_hyp_va(vcpu->kvm)))
+	kvm = vcpu_get_kvm(vcpu);
+	if (kvm && kvm_has_mte(kvm))
 		new |= PSR_TCO_BIT;
+	vcpu_put_kvm(vcpu, kvm);
 
 	new |= (old & PSR_DIT_BIT);
 
diff --git a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
index 4fdfeabefeb43..a4fb04faa7d09 100644
--- a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
+++ b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
@@ -13,6 +13,24 @@
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_host.h>
 
+/*
+ * Under pKVM a host vCPU's ->kvm is host-writable: the nVHE pair
+ * validates it.
+ */
+#ifdef __KVM_NVHE_HYPERVISOR__
+struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu);
+void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm);
+#else
+static inline struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu)
+{
+	return vcpu->kvm;
+}
+
+static inline void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm)
+{
+}
+#endif
+
 static inline void kvm_skip_instr(struct kvm_vcpu *vcpu)
 {
 	if (vcpu_mode_is_32bit(vcpu)) {
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 459bd9eb7e4bc..9bdc7a9b84b8c 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -11,6 +11,8 @@
 
 #include <asm/kvm_emulate.h>
 
+#include <hyp/adjust_pc.h>
+
 #include <nvhe/mem_protect.h>
 #include <nvhe/memory.h>
 #include <nvhe/pkvm.h>
@@ -304,6 +306,43 @@ struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void)
 
 }
 
+static struct pkvm_hyp_vm *loaded_hyp_vm_of(struct kvm_vcpu *vcpu)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+
+	if (hyp_vcpu &&
+	    (vcpu == &hyp_vcpu->vcpu || vcpu == hyp_vcpu->host_vcpu))
+		return pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
+
+	return NULL;
+}
+
+/* An unloaded host vCPU's VM is mapped at EL2 only while pinned. */
+struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu)
+{
+	struct pkvm_hyp_vm *hyp_vm;
+	struct kvm *kvm;
+
+	if (!is_protected_kvm_enabled())
+		return kern_hyp_va(vcpu->kvm);
+
+	hyp_vm = loaded_hyp_vm_of(vcpu);
+	if (hyp_vm)
+		return &hyp_vm->kvm;
+
+	kvm = kern_hyp_va(READ_ONCE(vcpu->kvm));
+	if (hyp_pin_shared_mem(kvm, kvm + 1))
+		return NULL;
+
+	return kvm;
+}
+
+void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm)
+{
+	if (kvm && is_protected_kvm_enabled() && !loaded_hyp_vm_of(vcpu))
+		hyp_unpin_shared_mem(kvm, kvm + 1);
+}
+
 struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
 {
 	struct pkvm_hyp_vm *hyp_vm;
-- 
2.39.5


