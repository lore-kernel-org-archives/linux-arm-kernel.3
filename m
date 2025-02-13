Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0993BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLUHIAnciKfVIqttpwhpITrA5lg9JQ8R42NOErtMOkw=; b=z/+2/F9eEokaYPleviUaGvWdv3
	174Nn1N+ZIXQJY2wSw67NQSfOHMJoHehfd+pgcv+N7qyMAG0XGnhbRzFVZAdRFkZAABaTQmmRhz7A
	pC2pEEEyWTNYJ/R/rhPMlyN3ayn+kVc/Ssg322C8B1kt+hLP5J3BBv1sWAtGOAk0ckzCtIUqEa/Hz
	nDa+Co/ijYJBSj3w1wNHhofmYYc10XdoZhY9FlQBMl3U11FnYH8MwlL76LJq31QLXrHXhnVYrqOJd
	fUhKD496lT4npOF7lNK8LIbzPJtAcviBS3AXGEeQytG20l5wO0O1mf68rCevVLXxTiCMfBqfC9iP1
	rICSRjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ticqs-0000000BymM-1Q8K;
	Thu, 13 Feb 2025 17:18:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibu4-0000000BjAJ-1X1X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:17:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABCA026BA;
	Thu, 13 Feb 2025 08:17:48 -0800 (PST)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.32.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55B503F6A8;
	Thu, 13 Feb 2025 08:17:23 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v7 36/45] arm64: RME: Set breakpoint parameters through SET_ONE_REG
Date: Thu, 13 Feb 2025 16:14:16 +0000
Message-ID: <20250213161426.102987-37-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213161426.102987-1-steven.price@arm.com>
References: <20250213161426.102987-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_081728_487185_AD2D31C0 
X-CRM114-Status: GOOD (  15.98  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Allow userspace to configure the number of breakpoints and watchpoints
of a Realm VM through KVM_SET_ONE_REG ID_AA64DFR0_EL1.

The KVM sys_reg handler checks the user value against the maximum value
given by RMM (arm64_check_features() gets it from the
read_sanitised_id_aa64dfr0_el1() reset handler).

Userspace discovers that it can write these fields by issuing a
KVM_ARM_GET_REG_WRITABLE_MASKS ioctl.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/kvm/guest.c    |  2 ++
 arch/arm64/kvm/rme.c      |  3 +++
 arch/arm64/kvm/sys_regs.c | 17 +++++++++++------
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index da8961a5d01a..dbd45d0a0d54 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -802,6 +802,7 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 }
 
 #define KVM_REG_ARM_PMCR_EL0		ARM64_SYS_REG(3, 3, 9, 12, 0)
+#define KVM_REG_ARM_ID_AA64DFR0_EL1	ARM64_SYS_REG(3, 0, 0, 5, 0)
 
 /*
  * The RMI ABI only enables setting some GPRs and PC. The selection of GPRs
@@ -820,6 +821,7 @@ static bool validate_realm_set_reg(struct kvm_vcpu *vcpu,
 	} else {
 		switch (reg->id) {
 		case KVM_REG_ARM_PMCR_EL0:
+		case KVM_REG_ARM_ID_AA64DFR0_EL1:
 			return true;
 		}
 	}
diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
index 8c426f575728..f236e1776d8c 100644
--- a/arch/arm64/kvm/rme.c
+++ b/arch/arm64/kvm/rme.c
@@ -355,6 +355,7 @@ static int realm_create_rd(struct kvm *kvm)
 	void *rd = NULL;
 	phys_addr_t rd_phys, params_phys;
 	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
+	u64 dfr0 = kvm_read_vm_id_reg(kvm, SYS_ID_AA64DFR0_EL1);
 	int i, r;
 	int rtt_num_start;
 
@@ -391,6 +392,8 @@ static int realm_create_rd(struct kvm *kvm)
 	params->rtt_num_start = rtt_num_start;
 	params->rtt_base = kvm->arch.mmu.pgd_phys;
 	params->vmid = realm->vmid;
+	params->num_bps = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, dfr0);
+	params->num_wps = SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, dfr0);
 
 	if (kvm->arch.arm_pmu) {
 		params->pmu_num_ctrs = kvm->arch.pmcr_n;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5618eff33155..efd86df4e59d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1829,6 +1829,9 @@ static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,
 {
 	u8 debugver = SYS_FIELD_GET(ID_AA64DFR0_EL1, DebugVer, val);
 	u8 pmuver = SYS_FIELD_GET(ID_AA64DFR0_EL1, PMUVer, val);
+	u8 bps = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, val);
+	u8 wps = SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, val);
+	u8 ctx_cmps = SYS_FIELD_GET(ID_AA64DFR0_EL1, CTX_CMPs, val);
 
 	/*
 	 * Prior to commit 3d0dba5764b9 ("KVM: arm64: PMU: Move the
@@ -1848,10 +1851,11 @@ static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,
 		val &= ~ID_AA64DFR0_EL1_PMUVer_MASK;
 
 	/*
-	 * ID_AA64DFR0_EL1.DebugVer is one of those awkward fields with a
-	 * nonzero minimum safe value.
+	 * ID_AA64DFR0_EL1.DebugVer, BRPs and WRPs all have to be greater than
+	 * zero. CTX_CMPs is never greater than BRPs.
 	 */
-	if (debugver < ID_AA64DFR0_EL1_DebugVer_IMP)
+	if (debugver < ID_AA64DFR0_EL1_DebugVer_IMP || !bps || !wps ||
+	    ctx_cmps > bps)
 		return -EINVAL;
 
 	return set_id_reg(vcpu, rd, val);
@@ -1998,10 +2002,11 @@ static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 	mutex_lock(&vcpu->kvm->arch.config_lock);
 
 	/*
-	 * Once the VM has started the ID registers are immutable. Reject any
-	 * write that does not match the final register value.
+	 * Once the VM has started or the Realm descriptor is created, the ID
+	 * registers are immutable. Reject any write that does not match the
+	 * final register value.
 	 */
-	if (kvm_vm_has_ran_once(vcpu->kvm)) {
+	if (kvm_vm_has_ran_once(vcpu->kvm) || kvm_realm_is_created(vcpu->kvm)) {
 		if (val != read_id_reg(vcpu, rd))
 			ret = -EBUSY;
 		else
-- 
2.43.0


