Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DC0C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 20:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7URY0/P+czEc9oAhoLdople5LjdnyrNihUG3Il3dJU=; b=RZnA7H5k4QXLyCD9zfelaDQon3
	HoMKBscVnaI7dq7X8pw2VzGY5j+NAfp8xANI6Dmms7aO/alt8QbC/Qeapa56dH03zf4N3mW16ShH5
	GtjQ+f7TdhjVK1+6/kuO93RmvTVVeJhv466kYbZHZDbdYGYtSn9Fjz41QruRQDWfWKYrWlSm2ONX7
	LIRs1NW/ywpCGnYjlHSntpTfki5SrQzAru4+/WX3PjdUs8ziwdfgGDBxrL29mPUYNUuBDuqHbgB4a
	FZoxKm7HV2y+FigO3e17gxkxGmYqRa67t68sXC/cYsjR6+fC5VcFjHRs6ZEIRM/GkMTylZRIEcBeu
	DW4l4Xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpu7u-0000000DZML-1uw3;
	Fri, 31 Jul 2026 20:46:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpu7o-0000000DZLJ-0u21
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 20:46:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DCF960A72;
	Fri, 31 Jul 2026 20:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9F91F00ACA;
	Fri, 31 Jul 2026 20:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785530795;
	bh=N7URY0/P+czEc9oAhoLdople5LjdnyrNihUG3Il3dJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D9UAAfF7luiusONfjIjp5ztWVObeyNL9uioaS3MQGp4R8xHXkHY3xitNXurTZ3Hzt
	 cGnFgHa5Z1qciKhJnG09nh23s3Y3f2yQ7YvxbvXhrpqkMbx3m0m7sQCHsp8AzMiu+n
	 BkAZ7wfFduWlUbTd+owNyPFLT1BYsw0MwZJ04IEOpnApGPobHIpN1snLeC891hpOxQ
	 pSlFUqRiQjf5YMcWhdfmtGTDpNqSUtQh1LDovPwab6PkQkdu9cknEEerXjdAdTV4T2
	 rtt8GYibZM/QoDbdoZRbBRuN2LsYFzY2grn4soTc8KL0HApxDcMfGX9jnu3ZtEeIs0
	 SwdYNWGJDkvUg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 21:44:45 +0100
Subject: [PATCH 1/2] KVM: arm64: Finalize guest-wide sysregs prior to
 per-vCPU sysregs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-kvm-arm64-idreg-final-v1-1-3de2a5616dc6@kernel.org>
References: <20260731-kvm-arm64-idreg-final-v1-0-3de2a5616dc6@kernel.org>
In-Reply-To: <20260731-kvm-arm64-idreg-final-v1-0-3de2a5616dc6@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3763; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sAoUaDyMQALfN+ONy0lnwC2Oo/ld3+Elyc6NDljIQe8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbQmjVfAtLU1PVQEawt81+Ms/TGa8+XaODI4a2
 G2AkmizqkeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0JowAKCRAk1otyXVSH
 0Md5B/wJbunxy6e8xmvSR3LbfR+dQxZaiqJOtOpg6p3QiPEofddW2Ub1ZQ76Z9hBJPcOXwi+Bwr
 NgBtQtXlOZ77TME3oNb8ysDKB+AtcoIiCCOhq719E5KdzXiE1GDbHp32Cv6BNBTDKPDtx22e1ZA
 8mtrINZFc1b9jpXH8tfuGmw3FUBpfcmfIyEs5pRk4sIB03qTkJxH5d37woTzyVY3BeV5ppxle+9
 tzKDSEjdBkxG5hsqQaOZrbLZra/1EL9L7UUCeNPw2/06V8+GIsjacPlQoixJvI7PrzcNOQF39I6
 TqtoDEuAwZKdaHJjEcLtJH2FD0bB0r/Pep0guznGosfZ3SRn
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
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/arm.c      |  2 +-
 arch/arm64/kvm/sys_regs.c | 40 ++++++++++++++++++++++++++--------------
 arch/arm64/kvm/sys_regs.h |  2 +-
 3 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 50adfff75be8..2b75e1d5ca8d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -931,7 +931,7 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 			return ret;
 	}
 
-	ret = kvm_finalize_sys_regs(vcpu);
+	ret = kvm_vcpu_finalize_sys_regs(vcpu);
 	if (ret)
 		return ret;
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5d5c579d4579..958d7ef78785 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5755,25 +5755,14 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
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
-
 	if (kvm_vm_has_ran_once(kvm))
 		return 0;
 
@@ -5825,6 +5814,29 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
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
index 2a983664220c..402c5774d916 100644
--- a/arch/arm64/kvm/sys_regs.h
+++ b/arch/arm64/kvm/sys_regs.h
@@ -235,7 +235,7 @@ int kvm_sys_reg_set_user(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg,
 
 bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index);
 
-int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu);
+int kvm_vcpu_finalize_sys_regs(struct kvm_vcpu *vcpu);
 
 #define AA32(_x)	.aarch32_map = AA32_##_x
 #define Op0(_x) 	.Op0 = _x

-- 
2.47.3


