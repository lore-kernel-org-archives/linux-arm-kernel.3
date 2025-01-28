Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43542C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+dK8zbVUB+Aun9iZyS6yqEPAydvrbxxLRWm1TkWSTE=; b=l24bkpIZM/0uBvlmOmIWxuD9pz
	mXX65RvRMvEZa42kVPVwYAZYo9U4NtXAWF5iLxfy5CZjF58d6+wzutRWTwP9T4Vmu/4a3Q2bUx13t
	68uzNToCvQj6vUjJTwHiDYdVV6nPQ5XeA15uEl566Z2e5+KfjTkhLlylGsPk5W1rFCJHfzHdUjVB8
	bj51qIZasjfEJSbYqY6UONxKPfSq/ZdJ1SLSU004o6qzcIIhJHJc1Dr/GL/rWfQ7wJPztvG3D+weV
	JNEObEoxwClP15S+tNkp3DD3NF5rgEqsLYm3B1ZBnEBpg55S20Ox5qwDcqAQJh4KSAtYVGVVHwzL6
	xA4EKP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoTq-00000005KHO-1J0s;
	Tue, 28 Jan 2025 16:30:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoHN-00000005IKL-0cix
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 16:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 824465C6099;
	Tue, 28 Jan 2025 16:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5003FC4CEE3;
	Tue, 28 Jan 2025 16:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738081052;
	bh=VQtqCF5VwxQZ3zUdT5Ya9xq6VhdkLVv1Fj7Qtdf+K5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cw9h1ude8ichfU8pcmw7OAiZfaNagCoGoYZREWS4HpvZEGGI0qDuFO+sQPwwtxy7Q
	 hkgTadm12wz5FNDARPJabzg5QTRWgBQnjELR4unV23s9IaTj+qXeWV709zrRwphqYg
	 Qw5MPLPI9HnZEB2tFYYcLzlg7NvidctOk7EjL1LKDcppNYyw8ghvtwUikpilXaEGUh
	 /q5VOnJCzi3JTJM1mTO1zJU38lqDaqsDwiIQMMcfy32KVjdf5sl6k9zsYc9/8e3ANr
	 h91f/RWl6oM0aYt0Ns3uY06gHtO8ApmbXDc5IuOpY3aWcf3rVu+KMVsLag4rE6K8da
	 /wstY9Vd9s+Ag==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tcoHK-00G6bi-FP;
	Tue, 28 Jan 2025 16:17:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dmytro Terletskyi <Dmytro_Terletskyi@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 3/3] KVM: arm64: timer: Consolidate NV configuration of virtual timers
Date: Tue, 28 Jan 2025 16:17:21 +0000
Message-Id: <20250128161721.3279927-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250128161721.3279927-1-maz@kernel.org>
References: <20250128161721.3279927-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, r09922117@csie.ntu.edu.tw, Volodymyr_Babchuk@epam.com, Dmytro_Terletskyi@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_081733_349087_95B74724 
X-CRM114-Status: GOOD (  21.61  )
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

The way we configure the virtual timers with NV is rather odd:

- the EL1 virtual timer gets setup in kvm_timer_vcpu_reset(). Why not?

- the EL2 virtual timer gets setup at vcpu_load time, which is really
  bizarre, because this really should be a one-off.

The reason for the second point is that this setup is conditionned
on HCR_EL2.E2H, as it decides whether CNTVOFF_EL2 applies to the
EL2 virtual counter or not. And of course, this is not known at
the point where we reset the timer. Huh.

Solve this by introducing a NV-specific init for the timers,
matching what we do for the other subsystems, that gets called
once we know for sure that the configuration is final (on first
vcpu run, effectively).

This makes kvm_timer_vcpu_load_nested_switch() slightly simpler.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c  | 48 ++++++++++++++++--------------------
 arch/arm64/kvm/arm.c         |  3 +++
 include/kvm/arm_arch_timer.h |  1 +
 3 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index e59836e0260cf..43109277281a7 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -759,21 +759,6 @@ static void kvm_timer_vcpu_load_nested_switch(struct kvm_vcpu *vcpu,
 					    timer_irq(map->direct_ptimer),
 					    &arch_timer_irq_ops);
 		WARN_ON_ONCE(ret);
-
-		/*
-		 * The virtual offset behaviour is "interesting", as it
-		 * always applies when HCR_EL2.E2H==0, but only when
-		 * accessed from EL1 when HCR_EL2.E2H==1. So make sure we
-		 * track E2H when putting the HV timer in "direct" mode.
-		 */
-		if (map->direct_vtimer == vcpu_hvtimer(vcpu)) {
-			struct arch_timer_offset *offs = &map->direct_vtimer->offset;
-
-			if (vcpu_el2_e2h_is_set(vcpu))
-				offs->vcpu_offset = NULL;
-			else
-				offs->vcpu_offset = &__vcpu_sys_reg(vcpu, CNTVOFF_EL2);
-		}
 	}
 }
 
@@ -1045,18 +1030,6 @@ void kvm_timer_vcpu_reset(struct kvm_vcpu *vcpu)
 	for (int i = 0; i < nr_timers(vcpu); i++)
 		timer_set_ctl(vcpu_get_timer(vcpu, i), 0);
 
-	/*
-	 * A vcpu running at EL2 is in charge of the offset applied to
-	 * the virtual timer, so use the physical VM offset, and point
-	 * the vcpu offset to CNTVOFF_EL2.
-	 */
-	if (vcpu_has_nv(vcpu)) {
-		struct arch_timer_offset *offs = &vcpu_vtimer(vcpu)->offset;
-
-		offs->vcpu_offset = &__vcpu_sys_reg(vcpu, CNTVOFF_EL2);
-		offs->vm_offset = &vcpu->kvm->arch.timer_data.poffset;
-	}
-
 	if (timer->enabled) {
 		for (int i = 0; i < nr_timers(vcpu); i++)
 			kvm_timer_update_irq(vcpu, false,
@@ -1102,6 +1075,27 @@ static void timer_context_init(struct kvm_vcpu *vcpu, int timerid)
 	}
 }
 
+void kvm_timer_vcpu_nv_init(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * A vcpu running at EL2 is in charge of the offset applied to
+	 * the virtual timer, so use the physical VM offset, and point
+	 * the vcpu offset to CNTVOFF_EL2.
+	 *
+	 * The virtual offset behaviour is "interesting", as it always
+	 * applies when HCR_EL2.E2H==0, but only when accessed from EL1 when
+	 * HCR_EL2.E2H==1. Apply it to the HV timer when E2H==0.
+	 */
+	struct arch_timer_offset *offs = &vcpu_vtimer(vcpu)->offset;
+	u64 *voff = __ctxt_sys_reg(&vcpu->arch.ctxt, CNTVOFF_EL2);
+
+	offs->vcpu_offset = voff;
+	offs->vm_offset = &vcpu->kvm->arch.timer_data.poffset;
+
+	if (!vcpu_el2_e2h_is_set(vcpu))
+		vcpu_hvtimer(vcpu)->offset.vcpu_offset = voff;
+}
+
 void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
 {
 	struct arch_timer_cpu *timer = vcpu_timer(vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 0725a0b50a3e9..deb74ab5775aa 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -815,6 +815,9 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 	if (ret)
 		return ret;
 
+	if (vcpu_has_nv(vcpu))
+		kvm_timer_vcpu_nv_init(vcpu);
+
 	/*
 	 * This needs to happen after any restriction has been applied
 	 * to the feature set.
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 681cf0c8b9df4..351813133aef6 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -98,6 +98,7 @@ int __init kvm_timer_hyp_init(bool has_gic);
 int kvm_timer_enable(struct kvm_vcpu *vcpu);
 void kvm_timer_vcpu_reset(struct kvm_vcpu *vcpu);
 void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu);
+void kvm_timer_vcpu_nv_init(struct kvm_vcpu *vcpu);
 void kvm_timer_sync_nested(struct kvm_vcpu *vcpu);
 void kvm_timer_sync_user(struct kvm_vcpu *vcpu);
 bool kvm_timer_should_notify_user(struct kvm_vcpu *vcpu);
-- 
2.39.2


