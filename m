Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B56C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8zLEPE5GrOtWg6UFZKE8MKoTklGyzSk0lREwSLdq38=; b=j38ijMoxsH7pFIaHsHkXa5XBQR
	2Alyn433HgLj+ShWh6Voj5h/WQJ1cgXmFozX8dIaziswdFlvs3ugIXijAb2/ntcMme+VXO/+dpiVO
	DNxxlI95bFVeUPmnc18FBTkht+D0H9fXauGti9oB81pYi4+KkxoArAwkOb8ofG+laCRCtum1t+YbD
	QOWMwpp/Zt+GnM8T7R8iY77BXdl8MObCMmNBeF0BY0/zaQsIy1KbkwgalEK5Cys1Et2Ma6yeVPF24
	hDosR00jCYoTMFmdnIG2IHBqs7996eMPfvUlTQBM6IctSVxXdRWplHspYsHDLygQGbjbY1hN6eE1P
	nnWw4QCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14zE-0000000A4e1-2Duk;
	Mon, 31 Aug 2026 16:35:56 +0000
Received: from out-114.mta0.migadu.com ([2001:41d0:1004:224b::72] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14yd-0000000A49V-0zQJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:35:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VS8GZgRjJ2h0GcotosxCkgRTqdb5O2AjYDV7/AEn/aU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194117; v=1; x=1788798917;
 b=qNGKroayC9UoNo4dWH0ifzT+wVz6P9xaF8Dl51m5W8JmiSMuK1xuoZLbeQidLza+FYTmMoz2
 Hvz4OtCXS0DaTbVmesljfYMVDLlf7Pv11oHwU9KOhPTXsAEj/eImqHpijDw+CbstUJJtiHtWyKv
 Ijkcr8eGFXAp1pucqtNaiUBI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9236023ace9825dd;
	Mon, 31 Aug 2026 16:35:16 +0000
X-Mizu-Trace-ID: 9236023ace9825dd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 15/17] KVM: arm64: Reject host access to protected VM private state
Date: Mon, 31 Aug 2026 17:34:19 +0100
Message-Id: <20260831163421.272420-16-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_093519_450792_85256FAE 
X-CRM114-Status: GOOD (  16.64  )
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

A protected vCPU's register and debug state is no longer exposed to
the host. Host ioctls that would reach that state now fail rather
than operate on a copy that is not the guest's:

  - KVM_GET_ONE_REG and KVM_SET_ONE_REG return -EPERM once the vCPU has
    run: the copy then holds reset values plus what the exit handlers
    marshal out. Pre-run access still builds the guest's boot state.
  - KVM_ARM_VCPU_INIT returns -EPERM once the vCPU has run: it would
    reset the host copy alone and rewrite mp_state, which EL2 reads
    only at hyp vCPU creation, so a vCPU the guest powered off would
    come back RUNNABLE.
  - KVM_SET_VCPU_EVENTS rejects external-abort injection with -EPERM;
    SError injection is forwarded and stays permitted.
  - KVM_SET_GUEST_DEBUG returns -EPERM: a protected guest's debug state
    is hypervisor-owned.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arm.c   |  7 +++++++
 arch/arm64/kvm/guest.c | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 3e00edce23a99..8caacdd4de020 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1750,6 +1750,13 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
 	bool power_off = false;
 	int ret;
 
+	/*
+	 * Re-init would reset the host copy alone and rewrite mp_state
+	 * after EL2 has read it. Pre-run init stays allowed.
+	 */
+	if (kvm_vm_is_protected(vcpu->kvm) && vcpu_has_run_once(vcpu))
+		return -EPERM;
+
 	/*
 	 * Treat the power-off vCPU feature as ephemeral. Clear the bit to avoid
 	 * reflecting it in the finalized feature set, thus limiting its scope
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 23f725e2cf745..3a0ea2ae4a307 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -701,6 +701,10 @@ int kvm_arm_copy_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
 
 int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
+	/* Once the vCPU has run, the host copy is not the guest's state. */
+	if (kvm_vm_is_protected(vcpu->kvm) && vcpu_has_run_once(vcpu))
+		return -EPERM;
+
 	/* We currently use nothing arch-specific in upper 32 bits */
 	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
 		return -EINVAL;
@@ -718,6 +722,10 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 
 int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
+	/* Writes build the boot state; once run, EL2 owns the registers. */
+	if (kvm_vm_is_protected(vcpu->kvm) && vcpu_has_run_once(vcpu))
+		return -EPERM;
+
 	/* We currently use nothing arch-specific in upper 32 bits */
 	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
 		return -EINVAL;
@@ -786,6 +794,13 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	u64 esr = events->exception.serror_esr;
 	int ret = 0;
 
+	/*
+	 * EL2 injects an external abort only to complete a forwarded abort.
+	 * SError injection is forwarded.
+	 */
+	if (kvm_vm_is_protected(vcpu->kvm) && ext_dabt_pending)
+		return -EPERM;
+
 	/*
 	 * Immediately commit the pending SEA to the vCPU's architectural
 	 * state which is necessary since we do not return a pending SEA
@@ -883,6 +898,10 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 {
 	trace_kvm_set_guest_debug(vcpu, dbg->control);
 
+	/* A protected guest's debug state is not exposed to the host. */
+	if (kvm_vm_is_protected(vcpu->kvm))
+		return -EPERM;
+
 	if (dbg->control & ~KVM_GUESTDBG_VALID_MASK)
 		return -EINVAL;
 
-- 
2.39.5


