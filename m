Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0170C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 05:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/MEVwLMiiLRlqBOgGpJ/BxA199hp2Gm7pyB1iMNam8=; b=JOTWbG5xJrwO5UWABqOKW+54g6
	zQS7iINgbNqZLbQpWDXnsQyFZbLghLEGM4bdbiXTNipWRVjEiK+sYQ42fYM50V2MES2rFMRdJBmqg
	qbSXA9BF2CrmLHmOv4kESd2yN9jPpRjZAw/ZZbkBpcWSl2Ooc5p9ighki5aWtui+PomArPunxWvfP
	clTVOJKPq3SoiikM+sQO+5gu7QTHMDb5/XSZFqRFVSaaPoT76VlpwPWIUOkLXVUG3Oklv9c/KW8oZ
	3uByc1IBFY1ykAPyErYyW4DGsZ5QaBImS1rmuhA5eGSTx/HrO26ck/zvWqfvxfQh4uFTx7g/cDwfm
	448PB5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgnQ-00000005tNj-1guP;
	Mon, 20 Jul 2026 05:44:08 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgnE-00000005tHy-0yUy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:43:57 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66K5c7oo075973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Jul 2026 14:38:26 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=4/MEVwLMiiLRlqBOgGpJ/BxA199hp2Gm7pyB1iMNam8=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1784525907; v=1;
        b=dy4RLNt/SPZeSLaQbOEBrUo92vcqI9bpAuOKLRJR/w8B7T8WeYCIocVsCCL19G9Z
         gYWIWuUNYFxa+BDD6AFgBMFMycVtEZ/zcwKya0+WYt0amIUcaiNtI+JBV/aJe2WQ
         aJJkg97KeQSH/O7YwwR5xWIGvesJwFhpdZ9+skyTFTO6JfJsUXa3wFqEfACT/ilq
         6wcUP+Si3vbYZUdBYmFhdB6Mvpbzh4v/gjURNZvhmXi86AvWh4G68gezw1tKQmFB
         +zKzH8gklU70Eu30O3ZfF84uWcj86z7hsT67lgy9ywEUUQC7wV69P7p010qZEf4e
         DPZXwiLEXmKOA7GxP62EcA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Jul 2026 14:38:00 +0900
Subject: [PATCH v9 06/16] KVM: arm64: PMU: Recreate events after MDCR_EL2
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-hybrid-v9-6-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=6507;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=M/PETtsyeQ9dlXizOVrQk9S6JHEFBMx7jxtJuQJHeoc=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bsFrfrHAoHXUo97zzUn7rQ/FfhhsdvDy1aFxN3qJBjl
 sqcQo/zHaUsDGJcDLJiiiwpRbu5NaJrPxUmxLfAzGFlAhnCwMUpABNRPcbIMHvK8YmfnR8JdpnM
 On1MlE97zqOQA5kPt//bfK5c1s61/yLDP7s4gZnFXw/0ihiH3JDWDXv30vVr/9fD5XOrJy046Gx
 6gwcA
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_224356_498543_A85C2CD4 
X-CRM114-Status: GOOD (  19.14  )
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

MDCR_EL2.HPMN changes which counters are reserved for EL2 and thus which
enable control, event filter, and overflow width apply. HPMD changes EL2
filtering, while HLP changes the overflow width and sample period.

The existing guest MDCR_EL2 handling only requests a PMU reload for
HPME. Reloading enables or disables existing perf events, but does not
rebuild events whose attributes have become stale. Generic userspace
writes through KVM_SET_ONE_REG do not request a reload at all.

Route guest writes, userspace writes, and reset through a common helper.
Mark the vCPU's perf events for recreation when HPMN, HPMD, or HLP
changes. Consume the marker on the vCPU thread before reprogramming the
counters, which also preserves counter values and avoids creating events
on an arbitrary ioctl thread.

Use a setter-only accessor so register restore gains these side effects
without changing generic reads or rejecting register values.

Fixes: fe827f916662 ("KVM: arm64: nv: Honor MDCR_EL2.HPME")
Fixes: 8a34979030f6 ("KVM: arm64: nv: Apply EL2 event filtering when in hyp context")
Fixes: 16535d55e91f ("KVM: arm64: nv: Honor MDCR_EL2.HLP")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/pmu-emul.c | 27 +++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c | 31 +++++++++++++++++++++----------
 include/kvm/arm_pmu.h     |  3 +++
 3 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 5281d37634a0..9ac5f307ea31 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -17,6 +17,9 @@
 
 #define PERF_ATTR_CFG1_COUNTER_64BIT	BIT(0)
 
+#define MDCR_EL2_PMU_RECREATE_MASK	(MDCR_EL2_HPMN | MDCR_EL2_HPMD | \
+					 MDCR_EL2_HLP)
+
 static LIST_HEAD(arm_pmus);
 static DEFINE_MUTEX(arm_pmus_lock);
 
@@ -606,6 +609,21 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
 	}
 }
 
+void kvm_pmu_handle_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val)
+{
+	u64 changed = old ^ val;
+
+	/*
+	 * HPMN determines which counters HPMD and HLP apply to. Changes to
+	 * these fields require new perf event filters and sample periods.
+	 */
+	if (changed & MDCR_EL2_PMU_RECREATE_MASK)
+		vcpu->arch.pmu.events_need_recreate = true;
+
+	if (changed & (MDCR_EL2_HPME | MDCR_EL2_PMU_RECREATE_MASK))
+		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+}
+
 static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
 {
 	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
@@ -899,7 +917,16 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 
 void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 {
+	struct kvm_pmu *pmu = &vcpu->arch.pmu;
 	u64 mask = kvm_pmu_implemented_counter_mask(vcpu);
+	int i;
+
+	if (pmu->events_need_recreate) {
+		for (i = 0; i < KVM_ARMV8_PMU_MAX_COUNTERS; i++)
+			kvm_pmu_stop_counter(kvm_vcpu_idx_to_pmc(vcpu, i));
+
+		pmu->events_need_recreate = false;
+	}
 
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, mask);
 	__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, &=, mask);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5d5c579d4579..9e905d9be9f6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3020,17 +3020,22 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	}
 
 	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
-
-	/*
-	 * Request a reload of the PMU to enable/disable the counters
-	 * affected by HPME.
-	 */
-	if ((old ^ val) & MDCR_EL2_HPME)
-		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+	kvm_pmu_handle_mdcr(vcpu, old, val);
 
 	return true;
 }
 
+static int set_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
+		    u64 val)
+{
+	u64 old = __vcpu_sys_reg(vcpu, MDCR_EL2);
+
+	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
+	kvm_pmu_handle_mdcr(vcpu, old, val);
+
+	return 0;
+}
+
 static bool access_ras(struct kvm_vcpu *vcpu,
 		       struct sys_reg_params *p,
 		       const struct sys_reg_desc *r)
@@ -3177,8 +3182,13 @@ static int set_imp_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 
 static u64 reset_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 {
-	__vcpu_assign_sys_reg(vcpu, r->reg, vcpu->kvm->arch.nr_pmu_counters);
-	return vcpu->kvm->arch.nr_pmu_counters;
+	u64 old = __vcpu_sys_reg(vcpu, r->reg);
+	u64 val = vcpu->kvm->arch.nr_pmu_counters;
+
+	__vcpu_assign_sys_reg(vcpu, r->reg, val);
+	kvm_pmu_handle_mdcr(vcpu, old, val);
+
+	return val;
 }
 
 /*
@@ -3741,7 +3751,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG_FILTERED(SCTLR2_EL2, access_vm_reg, reset_val, 0,
 			 sctlr2_el2_visibility),
 	EL2_REG_VNCR(HCR_EL2, reset_hcr, 0),
-	EL2_REG(MDCR_EL2, access_mdcr, reset_mdcr, 0),
+	SYS_REG_USER_FILTER(MDCR_EL2, access_mdcr, reset_mdcr, 0,
+			    NULL, set_mdcr, el2_visibility),
 	EL2_REG(CPTR_EL2, access_rw, reset_val, CPTR_NVHE_EL2_RES1),
 	EL2_REG_VNCR(HSTR_EL2, reset_val, 0),
 	EL2_REG_VNCR_FILT(HFGRTR_EL2, fgt_visibility),
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index b5e5942204fc..1971f8794c9d 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -32,6 +32,7 @@ struct kvm_pmu {
 	struct kvm_pmc pmc[KVM_ARMV8_PMU_MAX_COUNTERS];
 	int irq_num;
 	bool created;
+	bool events_need_recreate;
 };
 
 struct arm_pmu_entry {
@@ -56,6 +57,7 @@ bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu);
 bool kvm_pmu_update_run(struct kvm_vcpu *vcpu);
 void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val);
 void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val);
+void kvm_pmu_handle_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val);
 void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu, u64 data,
 				    u64 select_idx);
 void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu);
@@ -133,6 +135,7 @@ static inline bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu)
 static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) { return false; }
 static inline void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val) {}
 static inline void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val) {}
+static inline void kvm_pmu_handle_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val) {}
 static inline void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu,
 						  u64 data, u64 select_idx) {}
 static inline int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,

-- 
2.55.0


