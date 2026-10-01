Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E69CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVNx+P3Y2f0HGBVMUeJv0U3/6ZFKjMgYfJ/KkCb3kak=; b=AhIfj2CiChXlkZjyfqHJZdonU4
	GT4/VXfOvF0tx7QfomnQlqMqcffmvNfxD1cV5SiGZOu1Us0NDizzoR1XVIuUFF8Xntn8VoNFpmYmq
	eCOJcJEmOXSJkS/6V1lEnoaFlRVG+rcWAdsH6wUI4MRi35F+3caqyCM/nvtIh39nUTFuycQxZKnfh
	c+07K39KfDANZa3lqTcC5JcmdV9XFna6yD05GZWdNUGN+KES0TrJ/7B60yld0IB1UH4GTAEZywI/t
	iU8T/pBNzrCrdg21j4lOHI8Av5gCYsxsFQ3PmicXz1q38aJXOTubN8l1N1eS+MsnDWD5n1RngCWOR
	UZBGGQAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHJk-00000009JWQ-3tzQ;
	Thu, 01 Oct 2026 13:59:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHJk-00000009JVX-0Dep
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 13:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uVNx+P3Y2f0HGBVMUeJv0U3/6ZFKjMgYfJ/KkCb3kak=; b=CXPVrupQdY7XJl7E1X3ZsqxGBk
	R4Wk2svbVm5pXI7rB1fmZbIpAxfKjYT7W0ZNvhK3y00J0h0UTK5GwXanlxrTY3rTpwy/h/jrNu3bu
	lUP3pv0SDAYEjlHjr02dx2rBZCg2kT9xxhDGo1ewqATmqsbXtO1YurXhsdQ0c7y3GMgrKD754Zpjs
	6MUzp6UC2eDlRsSqgTTYber8gFI/fyA3yniJOTrzyHYF59ervaFQL/olp1BkVdpdC+vz5vCR+O4ZC
	ewHBKljTbdu4cvqOGWyhMjHUNv/3NHNhpDsWuF7NcrWpbmE2t0ztYphGPiBWZfEJ40ViR01HdRuB1
	ytddWjdg==;
Received: from out-131.mta1.migadu.com ([95.215.58.131] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCHJh-0000000532K-0R1h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:59:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8PgbjM3RudzbwOkoe5Gt2RQoxYVPLiuGki2F4kB8jq4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790863158; v=1; x=1791467958;
 b=QC9CjX0ati5vaQheM/gwz2+H83RSittLuCB2DXPdXAaKPzFDdK3nr/RatpZUKVYd6Mf2DV+7
 upNXka0MtzmgAT9LnbGU5IxUMh0+zLjn7OPSg0OuBRvSWlCCRde4cVls932Q5tlyn9Offm8m0TB
 9zYzopToVvrQHGoT653/AEh0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 43ef2dae9eb95ac3;
	Thu, 01 Oct 2026 13:59:18 +0000
X-Mizu-Trace-ID: 43ef2dae9eb95ac3
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
Subject: [PATCH v4 16/18] KVM: arm64: Reject host power-on of a vCPU that EL2 holds powered off
Date: Thu,  1 Oct 2026 14:57:09 +0100
Message-Id: <20261001135711.1640520-17-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001135711.1640520-1-fuad.tabba@linux.dev>
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_145921_357659_26F334F8 
X-CRM114-Status: GOOD (  21.08  )
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

A protected vCPU's power state belongs to EL2, which changes it only
on the guest's own PSCI calls. KVM_SET_MP_STATE(RUNNABLE) on a vCPU
EL2 holds powered off changes the host's copy alone, and the guest's
next CPU_ON of that vCPU then fails: mp_state is no longer STOPPED, so
the host returns ALREADY_ON, and the guest's retry fails the same way
until the VMM stops the vCPU again. SUSPENDED has the same effect.

Record a vCPU EL2 holds powered off as KVM_MP_STATE_UNINITIALIZED, an
encoding arm64 didn't use: the guest's CPU_OFF writes it, as does hyp
vCPU creation for a vCPU that starts STOPPED, and only the guest's
CPU_ON writes RUNNABLE over it. RUNNABLE and SUSPENDED from the VMM
return -EPERM on it, the VMM can't write the value itself, and
KVM_ARM_VCPU_INIT, which would write STOPPED or RUNNABLE over it, is
rejected once the vCPU has run.

The VMM can still pause and resume a vCPU EL2 has powered on. Neither
STOPPED nor kvm_prepare_system_event() overwrites the value: a vCPU at
it is already off, and a STOPPED in its place would turn the guest's
next CPU_ON into ALREADY_ON, after a SYSTEM_RESET exit the VMM runs on
from. kvm_arm_vcpu_stopped() covers it, so the run loop sleeps the
vCPU as before.

The guest's CPU_ON is gated on the value rather than on STOPPED. A
STOPPED written between the target's CPU_OFF exit and the host's
power-off of it, which kvm_prepare_system_event() can do from another
vCPU's SYSTEM_OFF or SYSTEM_RESET, would otherwise let the CPU_ON
through, and the power-off would then record the target powered off
while EL2 holds it ON_PENDING, with no way back before VM teardown.
Gated on the value, that CPU_ON returns ALREADY_ON and the retry
succeeds once the power-off has run.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/arm.c              | 35 +++++++++++++++++++++++++------
 arch/arm64/kvm/pkvm.c             | 21 +++++++++++++++----
 arch/arm64/kvm/psci.c             | 11 ++++++++--
 4 files changed, 56 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 37d0721d39a45..e99b706c879cf 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1564,6 +1564,7 @@ static inline void kvm_hyp_reserve(void) { }
 
 void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
 bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
+bool kvm_pkvm_vcpu_is_powered_off(struct kvm_vcpu *vcpu);
 
 static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
 {
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 14fe4e7275796..a89087c83e27f 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -770,23 +770,28 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	vcpu->cpu = -1;
 }
 
-static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
+static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu, u32 mp_state)
 {
-	WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_STOPPED);
+	WRITE_ONCE(vcpu->arch.mp_state.mp_state, mp_state);
 	kvm_make_request(KVM_REQ_SLEEP, vcpu);
 	kvm_vcpu_kick(vcpu);
 }
 
+/* The guest's own CPU_OFF: EL2 has already powered the vCPU off. */
 void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
 {
+	u32 mp_state = vcpu_is_protected(vcpu) ? KVM_MP_STATE_UNINITIALIZED : KVM_MP_STATE_STOPPED;
+
 	spin_lock(&vcpu->arch.mp_state_lock);
-	__kvm_arm_vcpu_power_off(vcpu);
+	__kvm_arm_vcpu_power_off(vcpu, mp_state);
 	spin_unlock(&vcpu->arch.mp_state_lock);
 }
 
 bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu)
 {
-	return READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_STOPPED;
+	u32 mp_state = READ_ONCE(vcpu->arch.mp_state.mp_state);
+
+	return mp_state == KVM_MP_STATE_STOPPED || mp_state == KVM_MP_STATE_UNINITIALIZED;
 }
 
 static void kvm_arm_vcpu_suspend(struct kvm_vcpu *vcpu)
@@ -801,6 +806,12 @@ static bool kvm_arm_vcpu_suspended(struct kvm_vcpu *vcpu)
 	return READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_SUSPENDED;
 }
 
+/* Only the guest's CPU_ON may start a vCPU EL2 holds powered off. */
+bool kvm_pkvm_vcpu_is_powered_off(struct kvm_vcpu *vcpu)
+{
+	return READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_UNINITIALIZED;
+}
+
 int kvm_arch_vcpu_ioctl_get_mpstate(struct kvm_vcpu *vcpu,
 				    struct kvm_mp_state *mp_state)
 {
@@ -818,12 +829,24 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 
 	switch (mp_state->mp_state) {
 	case KVM_MP_STATE_RUNNABLE:
+		if (kvm_pkvm_vcpu_is_powered_off(vcpu)) {
+			ret = -EPERM;
+			break;
+		}
+
 		WRITE_ONCE(vcpu->arch.mp_state, *mp_state);
 		break;
 	case KVM_MP_STATE_STOPPED:
-		__kvm_arm_vcpu_power_off(vcpu);
+		/* Keep EL2's off record: STOPPED over it would let RUNNABLE through. */
+		if (!kvm_pkvm_vcpu_is_powered_off(vcpu))
+			__kvm_arm_vcpu_power_off(vcpu, KVM_MP_STATE_STOPPED);
 		break;
 	case KVM_MP_STATE_SUSPENDED:
+		if (kvm_pkvm_vcpu_is_powered_off(vcpu)) {
+			ret = -EPERM;
+			break;
+		}
+
 		kvm_arm_vcpu_suspend(vcpu);
 		break;
 	default:
@@ -1788,7 +1811,7 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
 	spin_lock(&vcpu->arch.mp_state_lock);
 
 	if (power_off)
-		__kvm_arm_vcpu_power_off(vcpu);
+		__kvm_arm_vcpu_power_off(vcpu, KVM_MP_STATE_STOPPED);
 	else
 		WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_RUNNABLE);
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8e4c6e4bec123..99a5d9a913129 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -118,12 +118,25 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 		return -ENOMEM;
 
 	ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, vcpu, hyp_vcpu);
-	if (!ret)
-		vcpu_set_flag(vcpu, VCPU_PKVM_FINALIZED);
-	else
+	if (ret) {
 		free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
+		return ret;
+	}
 
-	return ret;
+	/*
+	 * Mirror EL2's seeding of power_state from mp_state. The hyp vCPU is
+	 * published, so take mp_state_lock against kvm_psci_vcpu_on().
+	 */
+	if (vcpu_is_protected(vcpu)) {
+		spin_lock(&vcpu->arch.mp_state_lock);
+		if (kvm_arm_vcpu_stopped(vcpu))
+			WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_UNINITIALIZED);
+		spin_unlock(&vcpu->arch.mp_state_lock);
+	}
+
+	vcpu_set_flag(vcpu, VCPU_PKVM_FINALIZED);
+
+	return 0;
 }
 
 /*
diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index e3db84400d1f8..b01f8d44033f1 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -63,7 +63,12 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
 		return PSCI_RET_INVALID_PARAMS;
 
 	spin_lock(&vcpu->arch.mp_state_lock);
-	if (!kvm_arm_vcpu_stopped(vcpu)) {
+	/*
+	 * A protected vCPU is off once the host has acted on EL2's CPU_OFF.
+	 * STOPPED before that is the VMM's pause.
+	 */
+	if (!kvm_arm_vcpu_stopped(vcpu) ||
+	    (vcpu_is_protected(vcpu) && !kvm_pkvm_vcpu_is_powered_off(vcpu))) {
 		if (kvm_psci_version(source_vcpu) != KVM_ARM_PSCI_0_1)
 			ret = PSCI_RET_ALREADY_ON;
 		else
@@ -161,7 +166,9 @@ static void kvm_prepare_system_event(struct kvm_vcpu *vcpu, u32 type, u64 flags)
 	 */
 	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
 		spin_lock(&tmp->arch.mp_state_lock);
-		WRITE_ONCE(tmp->arch.mp_state.mp_state, KVM_MP_STATE_STOPPED);
+		/* Keep EL2's off record for the guest's next CPU_ON. */
+		if (!kvm_pkvm_vcpu_is_powered_off(tmp))
+			WRITE_ONCE(tmp->arch.mp_state.mp_state, KVM_MP_STATE_STOPPED);
 		spin_unlock(&tmp->arch.mp_state_lock);
 	}
 	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
-- 
2.39.5


