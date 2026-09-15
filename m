Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D670C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyKR4fiF77nE7ZKoyi1tHhTHT9iZYdk+pX/TxZMuHKE=; b=o7YNIRo1ucD8D4Bcytdc3bs02S
	k9RxvGWRKXwG1RrcvZge+REO0OalYBpXzoz1UMGatmGAuH1GmjtF9Pb5Jb/2Xvr1Q9JSXNBKra41J
	MxKIHfZW8ksiKkkb+2zYv+Nfz0O/1hZza2dd4X+3bm8A30VagUIlYQHdNc6YV0kMv03cAIdpK0Cso
	ap4i0f2B32lhV6I5azV4CGyassHAjijzA9G+60u98TjNqtwVQO9IuqcO0PvXpVeFjJ/i9t1Y78dXm
	1SykkrN+DHd4JQT8+kLT6SXcdVB5YEw5V/HNEwu+PeJWm1ZSmeG84XKis9u9LZdTyP4Od4hU4tawd
	hBEEwhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vbb-00000007Ky5-0iwc;
	Tue, 15 Sep 2026 16:01:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VbY-00000007KxI-2Zfc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:01:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F63C1570;
	Tue, 15 Sep 2026 09:01:52 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D99B3F882;
	Tue, 15 Sep 2026 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789488115; bh=fBZJKiu/ewB5QHAgo63DvTdkFMYmp3Bnxwns6qPiSKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L+T9Uozv/tDz3Pk7iU8g5To5JLXyJmTx5wv6QVnTthjAprbbVslLEe34IJX7OM+c8
	 GJLf0uiZ2AMnawoZGSQoW8Andz9tS607fyocUuJsk0LMrZ3ceKKk7HXtT7xu1XjKA2
	 uT4Sl7KiuOY/7nO3VUg5fERL33q3Pl4N5SN4IaYw=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Marc Zyngier <maz@krenel.org>
Subject: [PATCH v18 01/23] KVM: arm64: protected VM: Handle set_one_reg CNTVCT_EL0/CNTPCT_EL0
Date: Tue, 15 Sep 2026 17:01:19 +0100
Message-ID: <20260915160141.3543048-2-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_090156_732922_3729A1AC 
X-CRM114-Status: GOOD (  21.32  )
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

Protected VMs doesn't allow setting offsets for virtual and phyiscal
counters, as the offset is always fixed to 0. The VM ioclt is filtered
out based on the cap. However we don't prevent the userspace from trying
to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.

Fix this by always "fixing" the timer offsets to 0 and marking that the
timer offset is set in the kvm->arch.flags at pKVM init time. The
userspace cannot use the KVM_ARM_SET_COUNTER_OFFSET, as it is blocked for a
protected VM.

A userspace writing to the SYS_CNT*CT would observe success, without
any real effect. This was chosen over preventing the writes to these
registers and returning -EPERM.

With that, we always have a valid vm_offset pointer, remove the checks for
vm_offset == NULL.

Reported by Sashiko here
https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org

Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
Suggested-by: Marc Zyngier <maz@krenel.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/arch_timer.c    | 15 +++++----------
 arch/arm64/kvm/arm.c           | 15 +++++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 26 +++++++++++++-------------
 include/kvm/arm_arch_timer.h   |  3 +--
 4 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 6ac3321f4c575..dda020da4c9c7 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1079,14 +1079,10 @@ static void timer_context_init(struct kvm_vcpu *vcpu, int timerid)
 
 	ctxt->timer_id = timerid;
 
-	if (!kvm_vm_is_protected(vcpu->kvm)) {
-		if (timerid == TIMER_VTIMER)
-			ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
-		else
-			ctxt->offset.vm_offset = &kvm->arch.timer_data.poffset;
-	} else {
-		ctxt->offset.vm_offset = NULL;
-	}
+	if (timerid == TIMER_VTIMER)
+		ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
+	else
+		ctxt->offset.vm_offset = &kvm->arch.timer_data.poffset;
 
 	hrtimer_setup(&ctxt->hrtimer, kvm_hrtimer_expire, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
 
@@ -1110,8 +1106,7 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
 		timer_context_init(vcpu, i);
 
 	/* Synchronize offsets across timers of a VM if not already provided */
-	if (!vcpu_is_protected(vcpu) &&
-	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
+	if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
 		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
 		timer_set_offset(vcpu_ptimer(vcpu), 0);
 	}
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90b..7c88508cac8a1 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -214,6 +214,20 @@ static int kvm_arm_default_max_vcpus(void)
 	return vgic_present ? kvm_vgic_get_max_vcpus() : KVM_MAX_VCPUS;
 }
 
+/*
+ * Fix the counter offset to 0 for Protected VMs and mark the
+ * offset flag. The user can't set the offset via KVM_ARM_SET_COUNTER_OFFSET.
+ */
+static void kvm_arch_fix_timer_offsets(struct kvm *kvm)
+{
+	if (!kvm_vm_is_protected(kvm))
+		return;
+
+	/* Fix the counter offset to 0 and mark the offset initialised */
+	kvm->arch.timer_data.poffset = kvm->arch.timer_data.voffset = 0;
+	set_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &kvm->arch.flags);
+}
+
 /**
  * kvm_arch_init_vm - initializes a VM data structure
  * @kvm:	pointer to the KVM struct
@@ -267,6 +281,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	kvm_vgic_early_init(kvm);
 
+	kvm_arch_fix_timer_offsets(kvm);
 	kvm_timer_init_vm(kvm);
 
 	/* The maximum number of VCPUs is limited by the host's GIC model */
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 459bd9eb7e4bc..e7b38eff63bd1 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -528,19 +528,19 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
 	hyp_vcpu->vcpu.arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
 
-	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
-		/*
-		 * Timer offsets are pointing to the untrusted KVM copy,
-		 * which is pinned in __pkvm_init_vm() for the VM life time.
-		 * It is worth noting that hyp_vm->host_kvm points to an EL2
-		 * linear map address and timer_get_offset() will use
-		 * kern_hyp_va() which is safe as it is idempotent.
-		 */
-		vcpu_vtimer(&hyp_vcpu->vcpu)->offset.vm_offset =
-			&hyp_vm->host_kvm->arch.timer_data.voffset;
-		vcpu_ptimer(&hyp_vcpu->vcpu)->offset.vm_offset =
-			&hyp_vm->host_kvm->arch.timer_data.poffset;
-	}
+	/*
+	 * Timer offsets are pointing to the untrusted KVM copy,
+	 * which is pinned in __pkvm_init_vm() for the VM life time.
+	 * It is worth noting that hyp_vm->host_kvm points to an EL2
+	 * linear map address and timer_get_offset() will use
+	 * kern_hyp_va() which is safe as it is idempotent.
+	 * Also for protected VMs the offset is fixed to 0 and is prevented
+	 * from changing.
+	 */
+	vcpu_vtimer(&hyp_vcpu->vcpu)->offset.vm_offset =
+		&hyp_vm->host_kvm->arch.timer_data.voffset;
+	vcpu_ptimer(&hyp_vcpu->vcpu)->offset.vm_offset =
+		&hyp_vm->host_kvm->arch.timer_data.poffset;
 
 	ret = pkvm_vcpu_init_sysregs(hyp_vcpu);
 	if (ret)
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index bc6f2fdd7ad33..4f0aa3bb69f45 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -176,8 +176,7 @@ static inline bool has_cntpoff(void)
 		if (__ctxt) {						\
 			struct arch_timer_offset *ato = &__ctxt->offset;\
 									\
-			if (ato->vm_offset)				\
-				off += *KERN_HYP_VA(ato->vm_offset);	\
+			off += *KERN_HYP_VA(ato->vm_offset);		\
 			if (ato->vcpu_offset)				\
 				off += *KERN_HYP_VA(ato->vcpu_offset);	\
 		}							\
-- 
2.43.0


