Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9166CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufat+d28npEF/ToRnN5gETv0PJQDZGb4TLR/RIGpsDs=; b=nRckh/eNG2nSRQ7rbYk2jtbdVP
	YJeh43bpFBEAcs/Cnj2IUJyaF/uxbQ9eLyTeWcTUuB9VAft8QxcZGciiKFa33VCstCoX/akFcrmPb
	LemxyeJYHg0I1Of+x30THJdjv/w1N8dNgBgENze2B8WE60hRzNnYRoMMf7hiNlgnSX9Kl41JEc8fU
	Y7nDPZAMeHZ6bfq0kB5HUkXkMUxmIqtzmRKXptBZvVgMpwSEW1MvnnT5DrfW1mZnjF0jIaT0F6IVh
	B5a95raKcDqX7e80+O5ICImF/SkeG5w7M4+HA7KiTcNde89cIFL15h1OISk1Q5OmmgyB71bI43Hft
	6GqUWnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWTo-00000003StY-2UQF;
	Tue, 29 Sep 2026 11:58:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWTh-00000003Sre-2I1i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:58:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6ECE43F36;
	Tue, 29 Sep 2026 11:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40ED01F000FF;
	Tue, 29 Sep 2026 11:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790683112;
	bh=ufat+d28npEF/ToRnN5gETv0PJQDZGb4TLR/RIGpsDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LZ+35mo4rWL+fA26NkvGnoM2CD/kCycO9eKIk8Bb2pURvO9Bp/LxuyxoyL6K9JjTv
	 Fu7P0tS/y0ApUeJDqGi0TInqVBBviZGsBw6Ussj4ZNP1GyuVNLKpS4PtiMQU4uVKyL
	 NNVaJsnp57an+SVUfXvBbfG5U0sm7vYYIo/LdH9saY3jpdNR4DV4Ku0KVV4OL/gw40
	 Tl0ljS5HZGOka8j6VSG2Q9jzgP+xzdcenOqb0EGPQ3NwgshsY3qBRSGLP9RvuYUEdM
	 dOh86o1qINWjEw8qzfu65pzGFib1AMollfp47F7krFc3mUfY1EhpIzSLwJ1bS+P50m
	 SasJI4my2AP0g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 29 Sep 2026 12:57:58 +0100
Subject: [PATCH v4 1/3] KVM: arm64: Finalize guest-wide sysregs prior to
 per-vCPU sysregs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kvm-arm64-idreg-final-v4-1-75296dde994d@kernel.org>
References: <20260929-kvm-arm64-idreg-final-v4-0-75296dde994d@kernel.org>
In-Reply-To: <20260929-kvm-arm64-idreg-final-v4-0-75296dde994d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4006; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/8dOhr1gHwA3YOOWxiuGFBTXYfDRB5yR3xWSZ8pB87M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqu6ffdl66ynyK36swKxoQmboo2P8ScRmq/E15Y
 QwCDrL59g6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarun3wAKCRAk1otyXVSH
 0G3LB/9wYwQnxiRprmkqfQExqgIr3Wv66iCKoSWzJOkLD/zW6yn0ejhphoixjeMhV3OL7qzkhxF
 z9OVmQBNAnqoyy+QuE+S7Bq/5BIdwY8+vwFGcrw0u2g65e7YNCVoZSJHNkQGH8m69ycZ13Lj3dV
 8EBnfkdBKzvV68bFO2466XDStqHZ5ofSY4LaX8ODWKSs++tDCN1FyJboxhra9v39wqUqA1yStvJ
 5sRhu8fUAtkel6xLjiLWYAZ/FFUkEM0j/CiylHaUx3ErWZn8edBUQhOIgudaQF6dF8xe5p1FUrJ
 xq0C2CzzEC+22tbJQq4dJJqZtqHAy/IuYc+xuz5Q/x7afRSl
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

In commit d82d09d5ba4b ("KVM: arm64: Don't skip per-vcpu NV
initialisation") the NV register sanitisation was moved earlier in
kvm_finalize_sys_regs() so that it runs for each vCPU rather than only
once per guest. This means that for the first vCPU it runs prior to vGIC
finalization, but the vGIC finalization updates the ID registers which
the NV initialization uses so we may end up with a mismatch. For
example, HFGRTR_EL2.ICC_IGRPENn_EL1 depends on GICv3 being enabled in
ID_AA64PFR0_EL1.GIC so may be mistakenly marked or not marked as RES0.

Split the initialization which runs once per guest into a separate
function and run that before the per-vCPU initialisation for NV,
renaming the per-vCPU function to make it clear that it does per-vCPU
setup.

Fixes: d82d09d5ba4b ("KVM: arm64: Don't skip per-vcpu NV initialisation")
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/arm.c      |  2 +-
 arch/arm64/kvm/sys_regs.c | 40 +++++++++++++++++++++++++++-------------
 arch/arm64/kvm/sys_regs.h |  2 +-
 3 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90..4f044280dec0 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -949,7 +949,7 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 			return ret;
 	}
 
-	ret = kvm_finalize_sys_regs(vcpu);
+	ret = kvm_vcpu_finalize_sys_regs(vcpu);
 	if (ret)
 		return ret;
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 44aae52c473d..57abbce52540 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5861,24 +5861,15 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 }
 
 /*
- * Perform last adjustments to the ID registers that are implied by the
+ * Do system register finalization that is shared by the whole guest. This
+ * includes last adjustments to the ID registers that are implied by the
  * configuration outside of the ID regs themselves, as well as any
  * initialisation that directly depend on these ID registers (such as
  * RES0/RES1 behaviours). This is not the place to configure traps though.
- *
- * Because this can be called once per CPU, changes must be idempotent.
  */
-int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
+static int kvm_vm_finalize_sys_regs(struct kvm *kvm)
 {
-	struct kvm *kvm = vcpu->kvm;
-
-	guard(mutex)(&kvm->arch.config_lock);
-
-	if (vcpu_has_nv(vcpu)) {
-		int ret = kvm_init_nv_sysregs(vcpu);
-		if (ret)
-			return ret;
-	}
+	lockdep_assert_held(&kvm->arch.config_lock);
 
 	if (kvm_vm_has_ran_once(kvm))
 		return 0;
@@ -5931,6 +5922,29 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+/*
+ * Because this can be called once per CPU, changes must be idempotent.
+ */
+int kvm_vcpu_finalize_sys_regs(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	int ret;
+
+	guard(mutex)(&kvm->arch.config_lock);
+
+	ret = kvm_vm_finalize_sys_regs(kvm);
+	if (ret)
+		return ret;
+
+	if (vcpu_has_nv(vcpu)) {
+		ret = kvm_init_nv_sysregs(vcpu);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int __init kvm_sys_reg_table_init(void)
 {
 	const struct sys_reg_desc *gicv3_regs;
diff --git a/arch/arm64/kvm/sys_regs.h b/arch/arm64/kvm/sys_regs.h
index bd56a45abbf9..a3cccad2766f 100644
--- a/arch/arm64/kvm/sys_regs.h
+++ b/arch/arm64/kvm/sys_regs.h
@@ -254,7 +254,7 @@ int kvm_sys_reg_set_user(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg,
 
 bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index);
 
-int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu);
+int kvm_vcpu_finalize_sys_regs(struct kvm_vcpu *vcpu);
 
 #define AA32(_x)	.aarch32_map = AA32_##_x
 #define Op0(_x) 	.Op0 = _x

-- 
2.47.3


