Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A550C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNJqhfcVg16UajP+uJ3fe6+J3gZfm6YjKROqthtx1EM=; b=R/mbUCSBwqWHpicxOoyfeMJqif
	j16kwdrHan4tJLI8kwYwNG2/M9G/0uLOvL3UKcUz5HJsWaoxsN6Q/MMDeTVrv4aOs7SH3CQpnR+1J
	3vqbDiS6X6a83uB0dj4U475Kd4LeSlrQhxz4iRzLQLIxT32+VAq9Uu9yijOhGbEVEJEtG2FOgkI9Z
	sYM2a/0TUUJ6NP1IzVEkH8FTxxxvlsLorCbMn88l7V6xxJDHBlrATSR7L7m+jcUoeNLSbSQK4gM/f
	c5GbgNns9/LYLXLK5ddueZp2q8MbON2EfQUWMdU0JHeIiR37KUuNqEs0qjpRqzp2M3Qyef/zI4PaZ
	1we/HnTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TDp-0000000CxfX-0KUL;
	Tue, 01 Sep 2026 18:28:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TDn-0000000CxfB-2dHs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:28:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 242554151B;
	Tue,  1 Sep 2026 18:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A3A1F000E9;
	Tue,  1 Sep 2026 18:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788287315;
	bh=fNJqhfcVg16UajP+uJ3fe6+J3gZfm6YjKROqthtx1EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ig1adgrkqrDlFL+dIynyWCIbk6YF2drPnpyN7ioov0wt+ekSYHC3DurkxzZAXV6wR
	 llfjUB98A8/JK3zeWnwb3nw2wT/8uqGTyFYVaVhes2insqgJgvRWNsHhu6WudjhMU3
	 7Bzl5nqGxi8qRPly9RbxzuYd8XXF3yg+n+Q7vIFq87ivrY6RCa9neFVphoiamp5CJf
	 41vd6x+bVl9YgS8g4HNWfStml7E0t8++ZFHdaHhBG/t4wU5ikQMj+Y9qRrQFuRmMo7
	 htarp+ARjQIWWO3KRPWo77wufi2+om/F3k1POR5M2zPwMy9+kLIETZU65miBP3728C
	 78Eih9Pa3RiPQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 19:18:49 +0100
Subject: [PATCH v3 2/3] KVM: arm64: Block ID register changes after we rely
 on the values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-kvm-arm64-idreg-final-v3-2-a0ffa06fa872@kernel.org>
References: <20260901-kvm-arm64-idreg-final-v3-0-a0ffa06fa872@kernel.org>
In-Reply-To: <20260901-kvm-arm64-idreg-final-v3-0-a0ffa06fa872@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6971; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kHfzv3QpjTdH0n96fEpnde6627jxUR0i4ECXziS639c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxlHnC4ZmaKPosDQlziiC4gaYytcBrFmlu6Sk
 IvFob3yD1mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcZRwAKCRAk1otyXVSH
 0GobB/9Vck2QtNt4Co95mKE/bM1DoimhpFESS7LKMiB87+RQ9uLLEjyz7VJc8nonHcbmtSUD81k
 UwkN6u83gaopn5Vh1/1+WqaCF1KltCzwFC/eMUslo6/bN7Hne+fCiiFmwLqThX4sj+0KqqI5Eer
 vQ5BCcxqMn4koiOuVDkI2mnPYNVj9RAPuNjIddsxkVQUJeTzMIgCqyCYHjTECMa49m9ggJDGhJ/
 tSTrTfEraK2V0KrPGTA3JWT9ZcCJM83+2CgRPyKBqm45oSqHWObJhROtNxIOOc7wQCmKV7S3fhP
 kzER7yx+xaXe5VJGy6soKtJjs4qeU9lNQnZuFE3fDKgooRy0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

In commit c5bac1ef7df6b ("KVM: arm64: Move existing feature disabling
over to FGU infrastructure") a check was added to suppress duplicate
recalculation of FGUs based on a flag KVM_ARCH_FLAG_FGU_INITIALIZED. This
flag is set when we complete kvm_calculate_traps(), which is called from
kvm_arch_vcpu_run_pid_change(). There are several points where that
function could fail after we have calculated FGUs (eg, due to an invalid
timer configuration). If this happens then userspace will still be able
to write to the ID registers, writes to which are gated on
KVM_ARCH_FLAG_HAS_RAN_ONCE being set. This in turn means that the FGU
configuration for a running guest may not match the ID register
configuration.

This will result in issues based on the hypervisor assuming a consistent
configuration, for example it allows the creation of guests which have
untrapped access to system registers which are not context switched for
the guest.

A similar issue exists in kvm_init_nv_sysregs() where once sysreg_masks
is allocated the RES0/RES1 masks for registers are fixed based on the ID
register values at the time the function ran, and also for copying the
implementation ID registers to the hypervisor for pKVM.

There is a further issue with vGIC setup, creating a vGIC includes
updating the ID registers to reflect the GIC configuration. We refuse
to create a vGIC after the first vCPU has run but if a vCPU fails its
first run we may already have finalized the ID register values.

Avoid these issues by adding a new flag that we set when we finalize the
system registers, blocking ID register changes after that has been set
even if something fails later on. Do this in kvm_vm_finalize_sys_regs(),
this is where we finalize the GIC fields in the ID registers and happens
before we do the FGU and RES0/1 setup. A VMM which tries to create an
irqchip after failing to run a vCPU will now get -EBUSY rather than a
likely misconfigured guest. Userspace is not expected to try to run a
guest that fails to start, never mind try to repair the guest
configuration after doing so, so this is not expected to have any impact
on practical users.

There is a preexisting flag KVM_ARCH_FLAG_ID_REGS_INITIALIZED, this was
added as part of the series that originally enabled writable ID
registers[1].  That is set when the vCPU feature flags are finalized in
KVM_ARM_VCPU_INIT when we initiailise the ID registers, we need to be
able to write to the ID registers after that point since the features
can influence ID registers (eg, ID_AA64ZFR0_EL1).  Given this and the
fact that the flag was introduced as part of making the ID registers
writable it appears to be a deliberate and desired ABI design decision
to not use this flag to block writes to the ID registers.  Introducing
the new flag preserves the existing behaviour.

[1] https://lore.kernel.org/r/20230609190054.1542113-7-oliver.upton@linux.dev

Fixes: c5bac1ef7df6b ("KVM: arm64: Move existing feature disabling over to FGU infrastructure")
Fixes: 888f088070229 ("KVM: arm64: nv: Add sanitising to VNCR-backed sysregs")
Fixes: 03e1b89d051f ("KVM: arm64: Copy MIDR_EL1 into hyp VM when it is writable")
Fixes: 8a9866ff8600 ("KVM: arm64: Set ID_{AA64PFR0,PFR1}_EL1.GIC when GICv3 is configured")
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  8 ++++++++
 arch/arm64/kvm/sys_regs.c         | 17 ++++++++++-------
 arch/arm64/kvm/vgic/vgic-init.c   |  6 ++----
 3 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7..777c46b34bb5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -367,6 +367,8 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
 	/* Unhandled SEAs are taken to userspace */
 #define KVM_ARCH_FLAG_EXIT_SEA				11
+	/* No further ID register changes possible */
+#define KVM_ARCH_FLAG_ID_REGS_FINAL			12
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
@@ -1149,6 +1151,12 @@ struct kvm_vcpu_arch {
 #define vcpu_has_ptrauth(vcpu)		false
 #endif
 
+#define kvm_id_regs_final(kvm)						\
+	test_bit(KVM_ARCH_FLAG_ID_REGS_FINAL, &(kvm)->arch.flags)
+
+#define vcpu_id_regs_final(vcpu)					\
+	kvm_id_regs_final((vcpu)->kvm)
+
 #define vcpu_on_unsupported_cpu(vcpu)					\
 	vcpu_get_flag(vcpu, ON_UNSUPPORTED_CPU)
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 880f84248427..df0c3831094d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2511,9 +2511,10 @@ static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 
 	/*
 	 * Once the VM has started the ID registers are immutable. Reject any
-	 * write that does not match the final register value.
+	 * write that does not match the final register value once we have
+	 * got far enough into first running the VM to use the values.
 	 */
-	if (kvm_vm_has_ran_once(vcpu->kvm)) {
+	if (vcpu_id_regs_final(vcpu)) {
 		if (val != read_id_reg(vcpu, rd))
 			ret = -EBUSY;
 		else
@@ -2547,7 +2548,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (KVM_BUG_ON(kvm_vm_has_ran_once(kvm) || !p, kvm))
+	if (KVM_BUG_ON(kvm_id_regs_final(kvm) || !p, kvm))
 		return;
 
 	*p = val;
@@ -3243,10 +3244,10 @@ static int set_imp_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 		return -EINVAL;
 
 	/*
-	 * Once the VM has started the ID registers are immutable. Reject the
-	 * write if userspace tries to change it.
+	 * Once we have been far enough into starting the VM the ID registers
+	 * are immutable. Reject the write if userspace tries to change it.
 	 */
-	if (kvm_vm_has_ran_once(kvm))
+	if (kvm_id_regs_final(kvm))
 		return -EBUSY;
 
 	/*
@@ -5869,7 +5870,7 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
  */
 static int kvm_vm_finalize_sys_regs(struct kvm *kvm)
 {
-	if (kvm_vm_has_ran_once(kvm))
+	if (kvm_id_regs_final(kvm))
 		return 0;
 
 	/*
@@ -5917,6 +5918,8 @@ static int kvm_vm_finalize_sys_regs(struct kvm *kvm)
 		kvm_vgic_finalize_idregs(kvm);
 	}
 
+	set_bit(KVM_ARCH_FLAG_ID_REGS_FINAL, &kvm->arch.flags);
+
 	return 0;
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 4012df6002ea..247c211bd68b 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -123,10 +123,8 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 		goto out_unlock;
 	}
 
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (vcpu_has_run_once(vcpu))
-			goto out_unlock;
-	}
+	if (kvm_id_regs_final(kvm))
+		goto out_unlock;
 	ret = 0;
 
 	if (type == KVM_DEV_TYPE_ARM_VGIC_V2)

-- 
2.47.3


