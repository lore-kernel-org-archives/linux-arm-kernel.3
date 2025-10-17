Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46DCCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ngwce4OaquS4InkYDa/fl+U0GZsEjplrgThj8MTuVYg=; b=1cEAclq/aHixsfWhTL+sYwjg6G
	yR8mcQsJGlx/HB2sOTuZF5mGX4GytVD1VKO98yFoW1+pRXHyu9DzQ3RRx1+C6mnPxLj7x+OtGYxZz
	Ghf1rBjolUpjdnPYiWMMT1WKornRHsYBaUJTjkJuOuYeeEDsj0UYb2ynlTkPUcbL0X9ppePK8CaqL
	aEQlgb0pB4/RGD3/XVaI6RI5G40Jz8bJq+PXnbcBK1bW9To9tl/EGxuD17UjQb6IxU5INOn8Kp+9C
	OqovPoKbBDtmcYa4eEZ69UyIUOmErNnAw0BR4RTo/AmsGkzc41LRlPB5Yu8wu2KR4ZWGlQHtBLiAY
	doRF+CzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YQm-00000006FYf-1Jlo;
	Fri, 17 Oct 2025 00:34:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPc-00000006DeJ-2Btn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ngwce4OaquS4InkYDa/fl+U0GZsEjplrgThj8MTuVYg=; b=ubGU0XJteMHtcDi2FVU+LuNjVX
	tMP33xdN7pF7wD/qdkNtHwFRCAT5y2q7OMixX9zJ02HeSbvu4QlNyksbitbespzKWx9T6EWx8vIua
	kfjb41ihLRjfOQS3jvNML6FjBJcWk5xfGWCPHLy9/EQCcLvYYPHUld0EZHOLGJjN74nG+of1YEw80
	iutNmSJ9a9kXSw1W7lkJKFVeuywNcpzciieMjm3Yst4gTzQ99cjcEyJ6PWidYmoWlhr8MRD8gAf8u
	QKPPZoYcVoQhWpNHNCAI85CUceeSWoSZ5kV9sjoZb4IVb+q0320GjZirLXJOlewtU67XbEOSRpaSB
	zm/wLz7g==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPV-0000000FiEq-03wp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:38 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33428befc49so2261527a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661210; x=1761266010; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ngwce4OaquS4InkYDa/fl+U0GZsEjplrgThj8MTuVYg=;
        b=yl60Gkw0CXE8gKwyIq8h8WEf4dtKNNrYuN5iIA4lzdo5TNLcC4zZxiflbvi7uQudfe
         2sWZEkCaq5X6KS4uuvraqwEdCACU2FkBn+Hpb+ykN25Zm8DtgBs0PRIogpqQuWw7qUae
         7IMRGGNiAReF9j+8stZn4OL8OwPJLLrxBch9geoy7QjvDYjtlcLXlTb4DchiH0DuCUxU
         oe0pA+b/iBZpZMonmyz5x/a0ob3HNOQyMQ/WgyqQiN65zLbIy7ehH+EXHxVijz8tnfWI
         9V3XmTFqFAfMSMPX5gSZwd5dZn3HNJUpxtu8tcYaUNHnsEWfl7/m4cIfJFenptyGO2Ae
         pTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661210; x=1761266010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ngwce4OaquS4InkYDa/fl+U0GZsEjplrgThj8MTuVYg=;
        b=plYz1MYdC/AFPdAESWHIBXhxINe4xDlP6JTfJO0Bvj6OpBIoQA2Yc7KtQns8HleN3n
         EUYy7vdXQrKgCmavamPIDVarYPwM7YKWjC15C8t4Iv1FRl4rtsQ7t8aUP1DSBuEMBAiJ
         hbSP1c0EbLOjKOZZ6ldA3/HM5M2XyL2/C0Fsl5czIsTwS7THIztd5zU/CJRES5tsBbHo
         55x8M7kjlFvMapbZ3xxPdTsgGBpRDNkkG0zf3HlNZ8zfH0U5rAWSBCcrbMt0CNRLoyPF
         xNWAGOXjfRYo5sXC9pNYSZths3Ly9bvDb0Sc7d+hclCS1DPuSTX3FHvasXXcLMB9ZMwK
         cGxw==
X-Gm-Message-State: AOJu0Yy7V/aeOI+3x14K3EVT4rbb2TlgoWkvZX49x8YVA2o9Gdg8hu2Q
	Su8ZgYd34/duST1FH46W/n/cTwlbbg+Ejb1FFhzoedJn2bAtHse89hri/MXvLty2dO5TlNcipTj
	N6Uq8SA==
X-Google-Smtp-Source: AGHT+IEKHDX7XekpTQV5XLScyWGD23ZPyNWCCYdFpMOGeqIT3rMk3IOTs/Q4qsdgwOMQLd3yDk0jpbRIcJA=
X-Received: from pjua3.prod.google.com ([2002:a17:90a:cb83:b0:33b:be14:2b68])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d09:b0:339:e8c7:d47d
 with SMTP id 98e67ed59e1d1-33bc9c11c65mr2828717a91.9.1760661210238; Thu, 16
 Oct 2025 17:33:30 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:42 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-25-seanjc@google.com>
Subject: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all" the locks
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
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013334_306593_FE3325F2 
X-CRM114-Status: GOOD (  15.60  )
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
 arch/x86/kvm/vmx/tdx.c | 63 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 84b5fe654c99..d6541b08423f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2632,6 +2632,46 @@ static int tdx_read_cpuid(struct kvm_vcpu *vcpu, u32 leaf, u32 sub_leaf,
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
@@ -2644,6 +2684,10 @@ static int tdx_td_init(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 	BUILD_BUG_ON(sizeof(*init_vm) != 256 + sizeof_field(struct kvm_tdx_init_vm, cpuid));
 	BUILD_BUG_ON(sizeof(struct td_params) != 1024);
 
+	CLASS(tdx_vm_state_guard, guard)(kvm);
+	if (IS_ERR(guard))
+		return PTR_ERR(guard);
+
 	if (kvm_tdx->state != TD_STATE_UNINITIALIZED)
 		return -EINVAL;
 
@@ -2743,7 +2787,9 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
-	guard(mutex)(&kvm->slots_lock);
+	CLASS(tdx_vm_state_guard, guard)(kvm);
+	if (IS_ERR(guard))
+		return PTR_ERR(guard);
 
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
@@ -2781,8 +2827,6 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
-	guard(mutex)(&kvm->lock);
-
 	switch (tdx_cmd.id) {
 	case KVM_TDX_CAPABILITIES:
 		r = tdx_get_capabilities(&tdx_cmd);
@@ -3090,8 +3134,6 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 	if (tdx->state != VCPU_TD_STATE_INITIALIZED)
 		return -EINVAL;
 
-	guard(mutex)(&kvm->slots_lock);
-
 	/* Once TD is finalized, the initial guest memory is fixed. */
 	if (kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
@@ -3147,7 +3189,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 
 int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 {
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	struct kvm_tdx_cmd cmd;
 	int r;
 
@@ -3155,12 +3198,13 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
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
@@ -3177,7 +3221,6 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 
 	vcpu_put(vcpu);
 
-	mutex_unlock(&vcpu->mutex);
 	return r;
 }
 
-- 
2.51.0.858.gf9c4a03a3a-goog


