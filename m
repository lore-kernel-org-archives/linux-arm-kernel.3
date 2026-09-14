Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BC1C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqCoLV1jhnoAwm95c3/NyTTyWCMRLbVCiTNf0Rtg2is=; b=GXY6dIzhSmoGQfUgkKJhkFmqvE
	JNVsUO5KKoZW2HpOgPWW7p54DSn8deDmXu7CdcpBpklZr/0Xjjsyugq13Yk6RPBvr5aq4PGR/afpJ
	p8cOE1oLuvQIgHQDn1vRjPxvrDtOQYAFJUZz9zRkArAEKxrTo5yMol9lkY+VQoV1jtABJt+tkPFCF
	BYx1OsYO/YpmcEjmLf/HJmTruefvj6D8e8eTIUsvh83uSoGwzI6PzN8sg7aa8zTJaZzmoGS61+puf
	b3sy9bEicGkbHAcMP6AUDo5TRdid/bvvkq91wfOwaQHZQwIKfbWlODSfGqF3zHx6eL/rMzIGHSwKB
	QoBDXd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xD-00000003G5N-0y7e;
	Mon, 14 Sep 2026 11:34:31 +0000
Received: from out-169.mta0.migadu.com ([2001:41d0:1004:224b::a9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64x7-00000003G2X-2Jgr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:34:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=EG4jlttgnQRUvp6RBdIaHPH0rkeIxINr+dVWvqmOdKY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789385663; v=1; x=1789990463;
 b=KI9t/vkJILY9iVbSHOk1IhJolKbsSRWD2tNBnGPSARYnc5DdnwfX8Ee1nPh0Azorf0qaiPIL
 MT87f4Lfn9Xx8HFoa17EZX/VdQLUPclZJ/yMS7JlnWZ0vvBypLBBTOzAYQXW9bOph4nxupAkaeH
 1HruzpY+6FVShnh/JESHYFsg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1461c02063194a2b;
	Mon, 14 Sep 2026 11:34:23 +0000
X-Mizu-Trace-ID: 1461c02063194a2b
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
Subject: [PATCH v3 05/18] KVM: arm64: Introduce per-EC entry handlers for pKVM
Date: Mon, 14 Sep 2026 12:33:25 +0100
Message-Id: <20260914113338.159227-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260914113338.159227-1-fuad.tabba@linux.dev>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043425_977407_9782D993 
X-CRM114-Status: GOOD (  16.52  )
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

From: Marc Zyngier <maz@kernel.org>

Add an ESR_EL2.EC-indexed handler table, entry_hyp_vm_handlers[],
consulted from flush_hyp_vcpu() on re-entry when the previous exit was
a trap: sync_hyp_vcpu() records the exit reason in the hyp vCPU as
exit_code, and the trap's exception class comes from its ESR_EL2. Its
single generic handler stands in until the per-EC marshalling patch
replaces the table with protected-only ones.

Entry carries the host's requested PC updates to the hyp vCPU: add
vcpu_copy_flag() to copy a masked set of flags between the two vCPU
structures, with PC_UPDATE_REQ covering INCREMENT_PC and the
pending-exception flags. The wholesale iflags copy moves into the
non-protected branch; a protected vCPU takes only PC_UPDATE_REQ.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h      | 19 +++++++++++++
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     | 39 +++++++++++++++++++++++---
 3 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 286489a69dff5..37d0721d39a45 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1033,11 +1033,28 @@ struct kvm_vcpu_arch {
 		set;						\
 	})
 
+#define __vcpu_copy_flag(vt, vs, flagset, f, m)			\
+	do {							\
+		typeof(vs->arch.flagset) tmp, val;		\
+								\
+		__build_check_flag(vs, flagset, f, m);		\
+								\
+		val = READ_ONCE(vs->arch.flagset);		\
+		val &= (m);					\
+		__vcpu_flags_preempt_disable();			\
+		tmp = READ_ONCE(vt->arch.flagset);		\
+		tmp &= ~(m);					\
+		tmp |= val;					\
+		WRITE_ONCE(vt->arch.flagset, tmp);		\
+		__vcpu_flags_preempt_enable();			\
+	} while (0)
+
 #define vcpu_get_flag(v, ...)	__vcpu_get_flag((v), __VA_ARGS__)
 #define vcpu_set_flag(v, ...)	__vcpu_set_flag((v), __VA_ARGS__)
 #define vcpu_clear_flag(v, ...)	__vcpu_clear_flag((v), __VA_ARGS__)
 #define vcpu_test_and_clear_flag(v, ...)			\
 	__vcpu_test_and_clear_flag((v), __VA_ARGS__)
+#define vcpu_copy_flag(vt, vs, ...) __vcpu_copy_flag((vt), (vs), __VA_ARGS__)
 
 /* KVM_ARM_VCPU_INIT completed */
 #define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(0))
@@ -1055,6 +1072,8 @@ struct kvm_vcpu_arch {
 #define INCREMENT_PC		__vcpu_single_flag(iflags, BIT(1))
 /* Target EL/MODE (not a single flag, but let's abuse the macro) */
 #define EXCEPT_MASK		__vcpu_single_flag(iflags, GENMASK(3, 1))
+/* Cover both PENDING_EXCEPTION and EXCEPT_MASK for global operations */
+#define PC_UPDATE_REQ		__vcpu_single_flag(iflags, GENMASK(3, 0))
 /* Host-set: the hyp flushes the non-protected vCPU state in on entry */
 #define PKVM_HOST_STATE_DIRTY	__vcpu_single_flag(iflags, BIT(4))
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index c904647d2f760..49a0a992047ba 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -26,6 +26,9 @@ struct pkvm_hyp_vcpu {
 	 * per-cpu pointer tracking us. Otherwise, NULL if not loaded.
 	 */
 	struct pkvm_hyp_vcpu **loaded_hyp_vcpu;
+
+	/* The previous exit's ARM_EXCEPTION_* code. */
+	u32 exit_code;
 };
 
 /*
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 52a65b13b3810..ef65c3cd6f810 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -31,6 +31,17 @@ unsigned int hyp_gicv3_nr_lr;
 
 void __kvm_hyp_host_forward_smc(struct kvm_cpu_context *host_ctxt);
 
+typedef void (*hyp_entry_exit_handler_fn)(struct pkvm_hyp_vcpu *);
+
+static void handle_vm_entry_generic(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	vcpu_copy_flag(&hyp_vcpu->vcpu, hyp_vcpu->host_vcpu, PC_UPDATE_REQ);
+}
+
+static const hyp_entry_exit_handler_fn entry_hyp_vm_handlers[] = {
+	[0 ... ESR_ELx_EC_MAX]		= handle_vm_entry_generic,
+};
+
 static void __hyp_sve_save_guest(struct kvm_vcpu *vcpu)
 {
 	__vcpu_assign_sys_reg(vcpu, ZCR_EL1, read_sysreg_el1(SYS_ZCR));
@@ -216,6 +227,8 @@ static void sync_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+	hyp_entry_exit_handler_fn ec_handler;
+	u8 esr_ec;
 
 	fpsimd_sve_flush();
 	flush_debug_state(hyp_vcpu);
@@ -228,6 +241,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
 		if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
 			flush_hyp_vcpu_state(hyp_vcpu);
+		hyp_vcpu->vcpu.arch.iflags = host_vcpu->arch.iflags;
 	} else {
 		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
 	}
@@ -245,16 +259,31 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
 						 (HCR_TWI | HCR_TWE | HCR_VSE);
 
-	hyp_vcpu->vcpu.arch.iflags	= host_vcpu->arch.iflags;
-
 	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
 
 	flush_hyp_vgic_state(hyp_vcpu);
 
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
+
+	switch (ARM_EXCEPTION_CODE(hyp_vcpu->exit_code)) {
+	case ARM_EXCEPTION_IRQ:
+	case ARM_EXCEPTION_EL1_SERROR:
+	case ARM_EXCEPTION_IL:
+		break;
+	case ARM_EXCEPTION_TRAP:
+		esr_ec = ESR_ELx_EC(kvm_vcpu_get_esr(&hyp_vcpu->vcpu));
+		ec_handler = entry_hyp_vm_handlers[esr_ec];
+		if (ec_handler)
+			ec_handler(hyp_vcpu);
+		break;
+	default:
+		BUG();
+	}
+
+	hyp_vcpu->exit_code = 0;
 }
 
-static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
+static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
 
@@ -281,6 +310,8 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	host_vcpu->arch.hcr_el2 |= hyp_vcpu->vcpu.arch.hcr_el2 & HCR_VSE;
 
 	sync_hyp_vgic_state(hyp_vcpu);
+
+	hyp_vcpu->exit_code = exit_reason;
 }
 
 static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
@@ -395,7 +426,7 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 
 		ret = __kvm_vcpu_run(&hyp_vcpu->vcpu);
 
-		sync_hyp_vcpu(hyp_vcpu);
+		sync_hyp_vcpu(hyp_vcpu, ret);
 	} else {
 		/* The host is fully trusted, run its vCPU directly. */
 		fpsimd_lazy_switch_to_guest(host_vcpu);
-- 
2.39.5


