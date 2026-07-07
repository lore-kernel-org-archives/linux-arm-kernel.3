Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B017C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 18:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FryudSw1T2aBIUC8yNaOKfA0SsyG7mefxgdiOUUg/jo=; b=xV4YDegUuHCiFHt5vn6/rfLbaw
	nFshwSnetLSGGczPGzvPBK0KssGw0yjyvTGuOryQFQaTCK5dF6U3At6plQi9nW5g1s1wGmpg+oIxM
	OF1vvpFC15EfhBOicVcrp9vPXXX6dpS1UUH+g0lZ5dJ7iTEcnjZ8bleadVK0GD0P4Vdk/HqZukRpM
	kIgkU0XINsPBFcosrYxUzaBADyJKdpFDNDlz/qJbjZnlNgDcego5VWsbu4yb+leyCyhSx/limitQo
	rSOlbWTGn7tZpSbk3l/6NrDC7nEXCsxxHzoYwanS/aDd3/kvBlCiVeUDdFoRU3MKSik2TeWY45PdN
	mLJ/JBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whA81-0000000FbrM-0F53;
	Tue, 07 Jul 2026 18:02:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whA7z-0000000FbrE-3cac
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 18:02:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D6734328E;
	Tue,  7 Jul 2026 18:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41221F000E9;
	Tue,  7 Jul 2026 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783447359;
	bh=FryudSw1T2aBIUC8yNaOKfA0SsyG7mefxgdiOUUg/jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N+Vnbwoua/QGFqX1FJgxTZEeQArxQywA5ZLkb+cuyiLT1RyZBO8UKEnY1TN1bRU+y
	 mmImothqrfHNURIQLWJ/FVvuF+nGkjn62x3ctvrxuKVMdasv+rz8+EhJWbyE9bVMAP
	 XeXPvElu8iOFTsq5ShjS+JCrJ+t9w6iHaJZ2BvoL54Gs1evNMASXj19FeDmeueAseD
	 M7yO3DIThFb6/MbvZUUbt+47vSyWcwfhLN5nmXrCiCUy18/Fgo7e71ItmXyNIni1sr
	 e1Cudg/8AwbbkWQxfyGpEJeGE//8QxHgz5emwJUSZxpzTmnrZQg99BNpuQfCaJSKtR
	 0RMZFg5mGzjig==
Date: Tue, 7 Jul 2026 11:02:37 -0700
From: Oliver Upton <oupton@kernel.org>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 5/7] KVM: arm64: PMU: Implement fixed-counters-only
 emulation
Message-ID: <ak0_PSnxyAWm9_Fu@kernel.org>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-5-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <akvyvclUQ2b2YHiU@kernel.org>
 <cb5d5f13-a1a9-47dd-a717-5533a8b32b20@rsg.ci.i.u-tokyo.ac.jp>
 <5e66748a-bfda-41a9-8614-88cbf2fe1f09@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e66748a-bfda-41a9-8614-88cbf2fe1f09@rsg.ci.i.u-tokyo.ac.jp>
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

On Tue, Jul 07, 2026 at 09:52:49PM +0900, Akihiko Odaki wrote:
> On 2026/07/07 20:23, Akihiko Odaki wrote:
> > On 2026/07/07 3:23, Oliver Upton wrote:
> > > Just detect the changing PMU implementation here, KVM_REQ_RELOAD_PMU
> > > will need to detect the PMCs that require an update anyway. Stash the
> > > last cpu in kvm_arch_vcpu_load() and pass it to this:
> > > 
> > > void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu)
> > > {
> > >     if (!kvm_pmu_fixed_counters_only(vcpu->kvm) || vcpu->cpu == last_cpu)
> > >         return;
> > > 
> > >     if (kvm_pmu_probe_armpmu(vcpu->cpu) !=
> > > kvm_pmu_probe_armpmu(last_cpu))
> > >         kvm_make_request(KVM_REQ_RELOAD_PMU);
> > > }
> > 
> > It is a nice way to simplify the code and to avoid hardcoding
> > ARMV8_PMU_INSTR_IDX. I'll use the code for the next version.
> 
> I tried this but unfortunately it doesn't seem to work. kvm_arch_vcpu_put()
> sets vcpu->cpu to -1 so we cannot simply read it to get the last cpu in
> kvm_arch_vcpu_load().

Urgh, there's no reason for doing that any more. Let's fix it, I want a
straightforward way to detect pCPU migrations. There may be other
reasons for using it in the future.

Untested, but could you give this a whirl?

From bb5af058030aada66f5c9eafa54db604979acf55 Mon Sep 17 00:00:00 2001
From: Oliver Upton <oupton@kernel.org>
Date: Tue, 7 Jul 2026 09:50:00 -0700
Subject: [PATCH] KVM: arm64: Don't clear vcpu->cpu in kvm_arch_vcpu_put()

commit e9b152cb957c ("arm/arm64: kvm: Set vcpu->cpu to -1 on vcpu_put")
reset vcpu->cpu in order for the VGIC to determine if there was any vCPU
running at the time of access. The VGIC has gone through an entire
rewrite since then, and with commit 7d450e282171 ("KVM: arm/arm64:
vgic-new: Add userland access to VGIC dist registers") the user
accessors just grab all vCPU mutexes instead.

Drop this remaining vestige such that kvm_arch_vcpu_load() can properly
detect a CPU migration. While at it, rework kvm_reset_vcpu() to do a
much more pedantic check that the provided vCPU is actually what's
running on the present CPU.

Signed-off-by: Oliver Upton <oupton@kernel.org>
---
 arch/arm64/kvm/arm.c   |  1 -
 arch/arm64/kvm/reset.c | 15 ++++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 50adfff75be8..735acc42b50b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -749,7 +749,6 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_arm_vmid_clear_active();
 
 	vcpu_clear_on_unsupported_cpu(vcpu);
-	vcpu->cpu = -1;
 }
 
 static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index b963fd975aac..6aba085c0673 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -190,7 +190,8 @@ static void kvm_vcpu_reset_sve(struct kvm_vcpu *vcpu)
 void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_reset_state reset_state;
-	bool loaded;
+	struct kvm_vcpu *running;
+	bool loaded = false;
 	u32 pstate;
 
 	spin_lock(&vcpu->arch.mp_state_lock);
@@ -198,10 +199,15 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.reset_state.reset = false;
 	spin_unlock(&vcpu->arch.mp_state_lock);
 
-	preempt_disable();
-	loaded = (vcpu->cpu != -1);
-	if (loaded)
+	guard(preempt)();
+
+	if ((running = kvm_get_running_vcpu())) {
+		if (KVM_BUG_ON(running != vcpu, vcpu->kvm))
+			return;
+
+		loaded = true;
 		kvm_arch_vcpu_put(vcpu);
+	}
 
 	if (!kvm_arm_vcpu_sve_finalized(vcpu)) {
 		if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
@@ -269,7 +275,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	if (loaded)
 		kvm_arch_vcpu_load(vcpu, smp_processor_id());
-	preempt_enable();
 }
 
 u32 kvm_get_pa_bits(struct kvm *kvm)
-- 
2.47.3


