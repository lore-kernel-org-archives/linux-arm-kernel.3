Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256ACC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSD4bne3AT6ceRgo+6wIO9gkD2uwS0got8y9byEnPz4=; b=xqLJP2N2uBqPqpg+8U0+02T5Rp
	jIT1Pdyf7F0gDBBdzcl8929HFBhyqve1QZcTfqwrprkRnXdN/TMllm/x9UQ2S9IzHeoGL8gFsw4Bf
	WUjqD2cXbiNWNm1qhdgD2rsygWZMsaLdgVKc/6ouCAAS1vyoCg6nCPvDwWV9bEe8mQf/jsBNREpsI
	20J406kG/ps5PGjM8Z05LFxBf0y3OdCLt5nSKsP57cB9oZESg4x5wKuQgkUy8mLxg0Wx/Rf8IzMSz
	7F+HcyhhbPmATnW0VzfB/eHLd51eIzPpWMz6+aSN+vqcqQrf1UXcsg4ZsUzw4FdzZ0N5yLLw/YQCx
	J+A3LmAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14yS-0000000A3w6-17wl;
	Mon, 31 Aug 2026 16:35:08 +0000
Received: from out-202.mta1.migadu.com ([2001:41d0:203:375::ca] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14y3-0000000A3cY-09K2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:34:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6t1gqYdyhRpYCJ4ePxm8eKCyjmvWIh4HU6EgCqsQmzQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194081; v=1; x=1788798881;
 b=IgEYf/Az+fqDs23NBg8dsv69+fkBGC62ietkamCYq5kJZ/OlVP5fHWII9/BR/SkI46uaM6qd
 jjN+W+/ebrGd2uTq6FfAuyvOsp9yQhPBXw2Ikn3zNU8skFdjfFZodfnIj+vaLF6+3H3Q15KMnX4
 mFrrvXR25KYGRhE8haZZt/7s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id faf522f5f8183ba7;
	Mon, 31 Aug 2026 16:34:40 +0000
X-Mizu-Trace-ID: faf522f5f8183ba7
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
Subject: [PATCH 07/17] KVM: arm64: Add system register reset framework for protected VMs
Date: Mon, 31 Aug 2026 17:34:11 +0100
Message-Id: <20260831163421.272420-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_093443_485847_C58F17DF 
X-CRM114-Status: GOOD (  17.61  )
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

Reset a protected VM's system registers at EL2 rather than taking the
host's values: add kvm_reset_pvm_sys_regs() and the
pvm_sys_reg_reset_vals[] table that drives it, and call it from
init_pkvm_hyp_vcpu() for protected vCPUs. The values follow the
host-side reset in sys_regs.c, with a poison value where it resets to
UNKNOWN, and for VBAR_EL1 and CONTEXTIDR_EL1 in place of the 0 it
resets them to. MPIDR_EL1 is derived from vcpu_id, as for any KVM
guest.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  1 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c         |  5 ++
 arch/arm64/kvm/hyp/nvhe/sys_regs.c     | 91 ++++++++++++++++++++++++--
 3 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 49a0a992047ba..a04b7c04d5135 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -95,6 +95,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code);
 bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
 bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
 void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
+void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu);
 int kvm_check_pvm_sysreg_table(void);
 
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index e85f13233da08..af334318d0a03 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -551,6 +551,11 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 		goto done;
 
 	ret = pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
+	if (ret)
+		goto done;
+
+	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		kvm_reset_pvm_sys_regs(&hyp_vcpu->vcpu);
 done:
 	if (ret)
 		unpin_host_vcpu(host_vcpu);
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 8758c68017765..ebfd48aa15b56 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -525,6 +525,84 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* Performance Monitoring Registers are restricted. */
 };
 
+struct sys_reg_desc_reset {
+	int reg;
+	void (*reset)(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *rd);
+	u64 value;
+};
+
+/* Hardware value, as sys_regs.c's reset_actlr()/reset_amair_el1(). */
+static void reset_actlr(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
+{
+	__vcpu_assign_sys_reg(vcpu, r->reg, read_sysreg(actlr_el1));
+}
+
+static void reset_amair_el1(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
+{
+	__vcpu_assign_sys_reg(vcpu, r->reg, read_sysreg(amair_el1));
+}
+
+static void reset_mpidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
+{
+	__vcpu_assign_sys_reg(vcpu, r->reg, kvm_calculate_mpidr(vcpu));
+}
+
+static void reset_value(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
+{
+	__vcpu_assign_sys_reg(vcpu, r->reg, r->value);
+}
+
+#define RESET_VAL(REG, RESET_VAL) {  REG, reset_value, RESET_VAL }
+
+#define RESET_ZERO(REG) RESET_VAL(REG, 0)
+
+#define RESET_UNKNOWN(REG) RESET_VAL(REG, 0x1de7ec7edbadc0deULL)
+
+#define RESET_FUNC(REG, RESET_FUNC) {  REG, RESET_FUNC, 0 }
+
+/* Sorted ascending by reg; kvm_check_pvm_sysreg_table() enforces it. */
+static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
+	RESET_FUNC(MPIDR_EL1, reset_mpidr),
+	RESET_UNKNOWN(TPIDR_EL0),
+	RESET_UNKNOWN(TPIDRRO_EL0),
+	RESET_UNKNOWN(TPIDR_EL1),
+	RESET_ZERO(CNTKCTL_EL1),
+	RESET_UNKNOWN(PAR_EL1),
+	RESET_ZERO(MDCCINT_EL1),
+	RESET_ZERO(DISR_EL1),
+	RESET_ZERO(PMCCFILTR_EL0),
+	RESET_ZERO(PMUSERENR_EL0),
+	RESET_ZERO(CPACR_EL1),
+	RESET_VAL(CONTEXTIDR_EL1, 0x00000000dbadc0deULL),
+	RESET_VAL(SCTLR_EL1, 0x00C50078ULL),
+	RESET_FUNC(ACTLR_EL1, reset_actlr),
+	RESET_ZERO(TCR_EL1),
+	RESET_UNKNOWN(AFSR0_EL1),
+	RESET_UNKNOWN(AFSR1_EL1),
+	RESET_UNKNOWN(ESR_EL1),
+	RESET_UNKNOWN(MAIR_EL1),
+	RESET_FUNC(AMAIR_EL1, reset_amair_el1),
+	RESET_ZERO(MDSCR_EL1),
+	RESET_ZERO(ZCR_EL1),
+	RESET_UNKNOWN(TTBR0_EL1),
+	RESET_UNKNOWN(TTBR1_EL1),
+	RESET_UNKNOWN(FAR_EL1),
+	RESET_VAL(VBAR_EL1, 0x1de7ec7edbadc000ULL),
+	RESET_UNKNOWN(PIRE0_EL1),
+	RESET_UNKNOWN(PIR_EL1),
+};
+
+void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu)
+{
+	unsigned long i;
+
+	for (i = 0; i < ARRAY_SIZE(pvm_sys_reg_reset_vals); i++) {
+		const struct sys_reg_desc_reset *r = &pvm_sys_reg_reset_vals[i];
+
+		r->reset(vcpu, r);
+	}
+}
+
 /*
  * Initializes feature registers for protected vms.
  */
@@ -550,16 +628,21 @@ void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
 }
 
 /*
- * Checks that the sysreg table is unique and in-order.
- *
- * Returns 0 if the table is consistent, or 1 otherwise.
+ * Both tables must be unique and sorted ascending. pvm_sys_reg_descs.reg is the
+ * sys_reg() encoding, pvm_sys_reg_reset_vals.reg the vcpu_sysreg index, so they
+ * compare differently. BUG_ON() at __pkvm_init: fatal at boot.
  */
 int kvm_check_pvm_sysreg_table(void)
 {
 	unsigned int i;
 
 	for (i = 1; i < ARRAY_SIZE(pvm_sys_reg_descs); i++) {
-		if (cmp_sys_reg(&pvm_sys_reg_descs[i-1], &pvm_sys_reg_descs[i]) >= 0)
+		if (cmp_sys_reg(&pvm_sys_reg_descs[i - 1], &pvm_sys_reg_descs[i]) >= 0)
+			return 1;
+	}
+
+	for (i = 1; i < ARRAY_SIZE(pvm_sys_reg_reset_vals); i++) {
+		if (pvm_sys_reg_reset_vals[i - 1].reg >= pvm_sys_reg_reset_vals[i].reg)
 			return 1;
 	}
 
-- 
2.39.5


