Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2590C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zGt9EV15Ulfq01JA8Zgt1mCd1oWoc7evWWfvK4czPA=; b=uGJwmHWBb5LO6Yo3Znu4N1B+jQ
	wKONZVzgcmEdvyF5MIUJsstTWzxUVrPDgFyXGs8KKwOLXBRWstoRUFEVqubLpXhS4p7VuZfQRY0qa
	Ye7/yBRLxCNcg16jKvFkP+jEN8OBf/7qXwjuOthTzhwAEgKEsFbIbTpdTz8fnpg3SueouPWq/wUql
	zTI0FX4ZPwferE7jG6k/B3FSzpcl0hZeY7tQDJ/pTTDLet8c+kqnXyEho82Oc/7NSp0z+owyZwrGg
	2T6nr4R8oVRDYeiGRKOHwSj7L5c5RF5ftSWy/nw/GHUaY1pUkHIIzMtOI64JHIQaBKDEyobEbey43
	SxKQA7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xb-00000003GLn-0Pc3;
	Mon, 14 Sep 2026 11:34:55 +0000
Received: from out-194.mta0.migadu.com ([2001:41d0:1004:224b::c2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xI-00000003G8X-13Bv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:34:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Tt0RaxTPBRzjk8pmJ1SZNy1FJeaoqVNbaM1Fzi/5QNk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789385674; v=1; x=1789990474;
 b=QAvOhrjoprA3lIAk1xlbo2oo0OWJB+fY1CAAS9Dh9bK6nRcUmwKku9e5StPvWMHPc6RmeF6I
 TcGt15BA8GAoXRAAb1RfIwhokAIiyJCsSrqZ1yMY2QKKG5k32LneNtmVkwZdzwa28KLtgedP1Ak
 2ba5L+VPBvjH+cBoagGUbW5w=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b01b2d8f1823b2c1;
	Mon, 14 Sep 2026 11:34:34 +0000
X-Mizu-Trace-ID: b01b2d8f1823b2c1
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
Subject: [PATCH v3 08/18] KVM: arm64: Add system register reset framework for protected VMs
Date: Mon, 14 Sep 2026 12:33:28 +0100
Message-Id: <20260914113338.159227-9-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260914113338.159227-1-fuad.tabba@linux.dev>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043436_459893_266F3802 
X-CRM114-Status: GOOD (  17.60  )
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

Add kvm_reset_pvm_sys_regs() and the pvm_sys_reg_reset_vals[] table
that drives it, and call it from init_pkvm_hyp_vcpu() for protected
vCPUs. The table holds the registers KVM resets that EL2 loads for a
protected vCPU: the ones __sysreg_restore_state_nvhe() restores, and
CNTV_CTL_EL0, which flush_hyp_timer_state() loads from a copy the
host's kvm_timer_vcpu_reset() doesn't write. The ptrauth keys, which
entry.S loads, are not in the table: sys_regs.c resets them to
UNKNOWN, and a vCPU that CPU_ON brings back keeps the keys the guest
last set, one UNKNOWN value in place of another.

A register that resets to 0 still needs an entry: a later patch calls
kvm_reset_pvm_sys_regs() again for PSCI CPU_ON at EL2, on a context
that has run.

A poison value stands in where sys_regs.c resets to UNKNOWN, and for
VBAR_EL1 and CONTEXTIDR_EL1 in place of the 0 it uses.

MPIDR_EL1 is derived from vcpu_id, as for any KVM guest.

AMAIR_EL1 resets to 0 where sys_regs.c reads the hardware: the host
writes it freely before the hypercall, and it's loaded on every guest
entry.

Until the per-EC marshalling patch removes the host's full-context
copy from flush_hyp_vcpu(), that copy overwrites these values on every
entry. It preserves CNTV_CTL_EL0, whose entry writes the zero the page
already holds. So this patch has no observable effect on its own.

No functional change intended.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  1 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c         |  5 +++
 arch/arm64/kvm/hyp/nvhe/sys_regs.c     | 60 ++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

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
index d52c26c0959a8..0252f28cca300 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -590,6 +590,11 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
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
index 8758c68017765..87557d1b3bf07 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -525,6 +525,66 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* Performance Monitoring Registers are restricted. */
 };
 
+struct sys_reg_desc_reset {
+	int reg;
+	void (*reset)(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *rd);
+	u64 value;
+};
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
+#define RESET_VAL(REG, VAL) {  REG, reset_value, VAL }
+
+#define RESET_ZERO(REG) RESET_VAL(REG, 0)
+
+#define RESET_UNKNOWN(REG) RESET_VAL(REG, 0x1de7ec7edbadc0deULL)
+
+#define RESET_FUNC(REG, FN) {  REG, FN, 0 }
+
+static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
+	RESET_FUNC(MPIDR_EL1, reset_mpidr),
+	RESET_UNKNOWN(TPIDR_EL0),
+	RESET_UNKNOWN(TPIDRRO_EL0),
+	RESET_UNKNOWN(TPIDR_EL1),
+	RESET_ZERO(CNTKCTL_EL1),
+	RESET_UNKNOWN(PAR_EL1),
+	RESET_ZERO(DISR_EL1),
+	RESET_ZERO(CPACR_EL1),
+	RESET_VAL(CONTEXTIDR_EL1, 0x00000000dbadc0deULL),
+	RESET_VAL(SCTLR_EL1, 0x00C50078ULL),
+	RESET_ZERO(TCR_EL1),
+	RESET_UNKNOWN(AFSR0_EL1),
+	RESET_UNKNOWN(AFSR1_EL1),
+	RESET_UNKNOWN(ESR_EL1),
+	RESET_UNKNOWN(MAIR_EL1),
+	RESET_ZERO(AMAIR_EL1),
+	RESET_ZERO(MDSCR_EL1),
+	RESET_ZERO(CNTV_CTL_EL0),
+	RESET_UNKNOWN(TTBR0_EL1),
+	RESET_UNKNOWN(TTBR1_EL1),
+	RESET_UNKNOWN(FAR_EL1),
+	RESET_VAL(VBAR_EL1, 0x1de7ec7edbadc000ULL),
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
-- 
2.39.5


