Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F382FCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixX9GQx535IvklNL5bVhTvm5cxC1bAxRsqCoHbh8pSg=; b=z0VUQXgRj3Ds+u05NpBMHpxAlm
	OgtevDYS+YbLPLgOu3zUUqGfKBqqSpujS3OnKQhPcxidiYvaDgNW8YYEEGHwB1ItdniQbMIoxJE7w
	vl4NwTJ0VvO9f6v2Zltx8Fdk943FRdw4TVSQ/fjq7oOZMW6EkSuAeE5EZDscZaooSYKETNAA2P1aC
	VNrz7F6+iSdBoTwLzJDwdoEE5q/QgiYX0/5a+HBvMGP50IamTK4kEWYWEkRhaZ8nMSiME3wBssnq7
	LVJwtK0akNzu+ULoHperfeCqnqS1n7x4hinmhWu7XiPNYH8526bPD+Kr/Rg7R+DtapUoSye/k4YAr
	0FhCf1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ1h-00000004nVy-0SbC;
	Thu, 30 Oct 2025 20:13:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzG-00000004kXv-0r3j
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ixX9GQx535IvklNL5bVhTvm5cxC1bAxRsqCoHbh8pSg=; b=Zu/BNVgcuNti8pWGzGc/vflQ1L
	28C0p3HmigyzkXFEhoexW/3QgLdLaezVAYZyHxX8ULKG9RuHNvPFkVOD8W39YD3Dz+/2icFF3MDDw
	vxuWLsRcUkzG5U1BKchFvIzuZGHqdGuCVurAdJ002F8bMC3n/BY+WCeclJTVRNpO/GJQ/PusXZ7mY
	RUC6oV0Fwgj4NuNSlJ2GqoPSXQOGzCK/d4M9RdVwpPqHuJpPqsowAydWPEX0o1soSEi5s3LutBTEH
	lSabD4hl/IgCXbolxDIWqCfmjwwygAmleZOHEDdyKOlT1hKuxWMhpTEDkTDVkegWgcXWpEYrqEYZi
	zVmwo13g==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY7T-00000009u5Y-2506
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:15:37 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34029b3dbfeso1711191a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855064; x=1762459864; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ixX9GQx535IvklNL5bVhTvm5cxC1bAxRsqCoHbh8pSg=;
        b=jr/MEnfADqmCDay4Llkc/aSq7i8q+5jgd0DOUloyJxR2xY3ePjkUOBnpBtBWfXJxRV
         4D7ZDfzmZ9LqBzPi9fizrBxtw3DJuXy4ij6K51kvWxbE6GB91NbLid4Y6Gfclzy3fKX5
         ZMCYbSe25IZoqrQBJbnrotcIlcu6eRzE1D/wRFhiaf/hvlI1kn3enxTNJO2H9PLw9t24
         ce0Fsir7AFx6T4s1qDl6jpKBUAQj2tBLIq/wIcI2k8eUxqoAL1ucqBHMjZLRPpFAiODY
         KoWKU2puQfWyFlk0MQxUT7VuPQ2pNLmbtIJI+PRm4CiyY/ROKlvUTNQt6xxlSkh+o/ha
         HW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855064; x=1762459864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixX9GQx535IvklNL5bVhTvm5cxC1bAxRsqCoHbh8pSg=;
        b=ZSfidIt5e7CsJv3+TZ8H7VdQjAK/ZdPFOdJRXpstlS+E77EUWZr8hFVwos3toA0kzv
         BDIOcnV+ST8QmVQCKD3OxHlrxIkP9j9waiuU2iY9LkViARdZMytfkHrOrrv53SQYOgBp
         +vKJXwEZkbnJ34jAvnj6e62CEMJcvJo+MWLV7TDkLmoxe6PCoV28SpEexR7jfK26rN5D
         ci1mkp4yf1UbyE3rCXfJIhMQVLRi5qWWu/kjxJBBWDzRUmsJ+LueDdFxl0UCbQAmIIlf
         VPZyW4ceZrCAJ3tJQUJM3WS64QGLDFDg4uq0VyIw4uQBxLGTIpsDyzprlgGe0Fdq/neM
         wI8g==
X-Gm-Message-State: AOJu0Yw/CqGhYQCs8+vVkSveJ5Blx/iwEu4Fme3YPGW4VGimubvifo95
	TjYNn1LBcvR1fIlRX4gqR5j81fBSmmT7KcQCKJxd4oUsunptgfszcIGkAblm5oecIgwHTfWUdlc
	MA1mPzw==
X-Google-Smtp-Source: AGHT+IFyAaLKG8h2LJ84hJgHQ75wx3G0tk8Vj+W9kFkkyUvmGPkijC+6POH5qOYkAqbj7Ex/aKtYOd6js0k=
X-Received: from pjbcq19.prod.google.com ([2002:a17:90a:f993:b0:339:ee5f:ec32])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b10:b0:340:2a16:94be
 with SMTP id 98e67ed59e1d1-34082fab1e6mr1328002a91.4.1761855063621; Thu, 30
 Oct 2025 13:11:03 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:49 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-27-seanjc@google.com>
Subject: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all" the locks
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_191535_825154_71431616 
X-CRM114-Status: GOOD (  17.94  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Acquire kvm->lock, kvm->slots_lock, and all vcpu->mutex locks when
servicing ioctls that (a) transition the TD to a new state, i.e. when
doing INIT or FINALIZE or (b) are only valid if the TD is in a specific
state, i.e. when initializing a vCPU or memory region.  Acquiring "all"
the locks fixes several KVM_BUG_ON() situations where a SEAMCALL can fail
due to racing actions, e.g. if tdh_vp_create() contends with either
tdh_mr_extend() or tdh_mr_finalize().

For all intents and purposes, the paths in question are fully serialized,
i.e. there's no reason to try and allow anything remotely interesting to
happen.  Smack 'em with a big hammer instead of trying to be "nice".

Acquire kvm->lock to prevent VM-wide things from happening, slots_lock to
prevent kvm_mmu_zap_all_fast(), and _all_ vCPU mutexes to prevent vCPUs
from interefering.  Use the recently-renamed kvm_arch_vcpu_unlocked_ioctl()
to service the vCPU-scoped ioctls to avoid a lock inversion problem, e.g.
due to taking vcpu->mutex outside kvm->lock.

See also commit ecf371f8b02d ("KVM: SVM: Reject SEV{-ES} intra host
migration if vCPU creation is in-flight"), which fixed a similar bug with
SEV intra-host migration where an in-flight vCPU creation could race with
a VM-wide state transition.

Define a fancy new CLASS to handle the lock+check => unlock logic with
guard()-like syntax:

        CLASS(tdx_vm_state_guard, guard)(kvm);
        if (IS_ERR(guard))
                return PTR_ERR(guard);

to simplify juggling the many locks.

Note!  Take kvm->slots_lock *after* all vcpu->mutex locks, as per KVM's
soon-to-be-documented lock ordering rules[1].

Link: https://lore.kernel.org/all/20251016235538.171962-1-seanjc@google.com [1]
Reported-by: Yan Zhao <yan.y.zhao@intel.com>
Closes: https://lore.kernel.org/all/aLFiPq1smdzN3Ary@yzhao56-desk.sh.intel.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 59 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 57dfddd2a6cf..8bcdec049ac6 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2653,6 +2653,46 @@ static int tdx_read_cpuid(struct kvm_vcpu *vcpu, u32 leaf, u32 sub_leaf,
 	return -EIO;
 }
 
+typedef void *tdx_vm_state_guard_t;
+
+static tdx_vm_state_guard_t tdx_acquire_vm_state_locks(struct kvm *kvm)
+{
+	int r;
+
+	mutex_lock(&kvm->lock);
+
+	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus)) {
+		r = -EBUSY;
+		goto out_err;
+	}
+
+	r = kvm_lock_all_vcpus(kvm);
+	if (r)
+		goto out_err;
+
+	/*
+	 * Note the unintuitive ordering!  vcpu->mutex must be taken outside
+	 * kvm->slots_lock!
+	 */
+	mutex_lock(&kvm->slots_lock);
+	return kvm;
+
+out_err:
+	mutex_unlock(&kvm->lock);
+	return ERR_PTR(r);
+}
+
+static void tdx_release_vm_state_locks(struct kvm *kvm)
+{
+	mutex_unlock(&kvm->slots_lock);
+	kvm_unlock_all_vcpus(kvm);
+	mutex_unlock(&kvm->lock);
+}
+
+DEFINE_CLASS(tdx_vm_state_guard, tdx_vm_state_guard_t,
+	     if (!IS_ERR(_T)) tdx_release_vm_state_locks(_T),
+	     tdx_acquire_vm_state_locks(kvm), struct kvm *kvm);
+
 static int tdx_td_init(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 {
 	struct kvm_tdx_init_vm __user *user_data = u64_to_user_ptr(cmd->data);
@@ -2764,8 +2804,6 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
-	guard(mutex)(&kvm->slots_lock);
-
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
 
@@ -2809,7 +2847,9 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (tdx_cmd.id == KVM_TDX_CAPABILITIES)
 		return tdx_get_capabilities(&tdx_cmd);
 
-	guard(mutex)(&kvm->lock);
+	CLASS(tdx_vm_state_guard, guard)(kvm);
+	if (IS_ERR(guard))
+		return PTR_ERR(guard);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_INIT_VM:
@@ -3113,8 +3153,6 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 	if (tdx->state != VCPU_TD_STATE_INITIALIZED)
 		return -EINVAL;
 
-	guard(mutex)(&kvm->slots_lock);
-
 	/* Once TD is finalized, the initial guest memory is fixed. */
 	if (kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
@@ -3170,7 +3208,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 
 int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 {
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	struct kvm_tdx_cmd cmd;
 	int r;
 
@@ -3178,12 +3217,13 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	if (r)
 		return r;
 
+	CLASS(tdx_vm_state_guard, guard)(kvm);
+	if (IS_ERR(guard))
+		return PTR_ERR(guard);
+
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
 
-	if (mutex_lock_killable(&vcpu->mutex))
-		return -EINTR;
-
 	vcpu_load(vcpu);
 
 	switch (cmd.id) {
@@ -3200,7 +3240,6 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 
 	vcpu_put(vcpu);
 
-	mutex_unlock(&vcpu->mutex);
 	return r;
 }
 
-- 
2.51.1.930.gacf6e81ea2-goog


