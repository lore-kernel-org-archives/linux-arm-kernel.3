Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37712C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO8ZjRFXZ0qt7IgcgpYC4Wj+eVf2OYiOjkCtfATq4V8=; b=h3S2nGyRfSSFMHmmKgfaq0RwSN
	FcY7JBPAqr7t7O3SJGcPzwKu+aXHQuAqObsBscXGZcnMR4b0DUdIjxt7frvEvX5DLt/8JdatRQjaN
	lMWugox8a7wOK+DjzvItq7Tn33iHjexgIvpkdA4Ii8BVWRm3+yJdZMjJGiye23Y73biyoe51Oqqew
	6DFg1ShdUF0xwhNwcmwgUU1a0hJUFkcFeONcLC+RdCfWjqTQjNy3EVV4HGGCOgkG4TarI0FWnI8l6
	/evAi4yhsI4p5Md2iDA+D6oHhaG5z63arndKgg4M88Rk90cmoPWIbOLwR/hOIlZQM28R0vQJq9Tb8
	uf8eYVlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY5-0000000HKIW-09KT;
	Sun, 20 Sep 2026 11:17:33 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FXz-0000000HKAd-08Kj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:17:28 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36W088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:12 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=oO8ZjRFXZ0qt7IgcgpYC4Wj+eVf2OYiOjkCtfATq4V8=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902972; v=1;
        b=UIVtESW1R1rtJeUqvKjAMoxDo1sq+7UuT6yJyyle0ylezbtTKp70ifBwRgOHVlfJ
         kAuA2Q4/JYA0taKRGgGlsTfRLJHZReK487jUn0FIJwXnkmQuQCeOk6VDNevkFJOF
         vtUnVqbAiOoo5sgtINBJFOlCH0brWmDTAAs8PtqWWTnrvop7HYBopRzkkb09mmwh
         Pm3xnn98VCDTMKSDQyo+ddIZsNKiK318avXMpa5kEUX3SQM4onLAa2oGsy+mYeIm
         nK4QCsD4tDFL1JglycNrvPoxkp792MFvSV7Nl5N0nlxmkI0q3jK4lO3/bKa28s0i
         8GQtVYbSKI4kIgbWOWYWMA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:15:50 +0900
Subject: [PATCH v11 09/21] KVM: arm64: PMU: Recreate events after MDCR_EL2
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-9-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
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
        Steffen Eiden <seiden@linux.ibm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6379;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=+1MHjEcho65DrRBCEyZyzH1H5cMIdbCh4zca1DnceGU=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6A5kaPy9Y6TrOuvir57K0fmjY0Y9vVj5NCWJgXtgtu
 bRoykamjlIWBjEuBlkxRZaUot3cGtG1nwoT4ltg5rAygQxh4OIUgImsv8nI8M16c/G23f1MUUye
 XlaKTU58hh8jt2+7vOhwweN1ITHRmxj+OzHuueDw5/7r65u//V1f1zE9bHH3F8G8p1JlBrM32vw
 /xQ8A
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041727_300768_F62D06DE 
X-CRM114-Status: GOOD (  17.32  )
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

Add a deferred event-recreation request that stops existing events
before reprogramming counters on the vCPU thread.

Use a common helper for guest and userspace writes. Recreate events
after HPMN, HPMD, or HLP changes. This preserves counter values. Defer
event creation to the vCPU thread instead of an arbitrary ioctl thread.

Use a setter-only accessor so register restore gains these side effects
without changing generic reads or rejecting register values.

Fixes: fe827f916662 ("KVM: arm64: nv: Honor MDCR_EL2.HPME")
Fixes: 8a34979030f6 ("KVM: arm64: nv: Apply EL2 event filtering when in hyp context")
Fixes: 16535d55e91f ("KVM: arm64: nv: Honor MDCR_EL2.HLP")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 29 +++++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c | 22 ++++++++++++++--------
 include/kvm/arm_pmu.h     |  5 +++++
 3 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 14fcdbdb4587..a8449e533070 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -585,6 +585,12 @@ void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val)
 	kvm_pmu_counter_increment(vcpu, val, ARMV8_PMUV3_PERFCTR_SW_INCR);
 }
 
+void kvm_pmu_request_recreate(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.pmu.events_need_recreate = true;
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+}
+
 /**
  * kvm_pmu_handle_pmcr - handle PMCR register
  * @vcpu: The vcpu pointer
@@ -620,6 +626,20 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
 	}
 }
 
+void kvm_pmu_apply_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val)
+{
+	u64 changed = old ^ val;
+
+	/*
+	 * HPMN determines which counters HPMD and HLP apply to. Changes to
+	 * these fields require new perf event filters and sample periods.
+	 */
+	if (changed & (MDCR_EL2_HPMN | MDCR_EL2_HPMD | MDCR_EL2_HLP))
+		kvm_pmu_request_recreate(vcpu);
+	else if (changed & MDCR_EL2_HPME)
+		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+}
+
 static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
 {
 	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
@@ -914,7 +934,16 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 
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
index 75624725adf1..7dd2cafce247 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3114,17 +3114,22 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	}
 
 	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
-
-	/*
-	 * Request a reload of the PMU to enable/disable the counters
-	 * affected by HPME.
-	 */
-	if ((old ^ val) & MDCR_EL2_HPME)
-		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+	kvm_pmu_apply_mdcr(vcpu, old, val);
 
 	return true;
 }
 
+static int set_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
+		    u64 val)
+{
+	u64 old = __vcpu_sys_reg(vcpu, MDCR_EL2);
+
+	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
+	kvm_pmu_apply_mdcr(vcpu, old, val);
+
+	return 0;
+}
+
 static bool access_ras(struct kvm_vcpu *vcpu,
 		       struct sys_reg_params *p,
 		       const struct sys_reg_desc *r)
@@ -3836,7 +3841,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
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
index 51f5e4ca3326..2fe73ad50e4e 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -32,6 +32,7 @@ struct kvm_pmu {
 	struct kvm_pmc pmc[KVM_ARMV8_PMU_MAX_COUNTERS];
 	int irq_num;
 	bool created;
+	bool events_need_recreate;
 };
 
 struct arm_pmu_entry {
@@ -56,7 +57,9 @@ void kvm_pmu_sync_hwstate(struct kvm_vcpu *vcpu);
 bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu);
 bool kvm_pmu_update_run(struct kvm_vcpu *vcpu);
 void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val);
+void kvm_pmu_request_recreate(struct kvm_vcpu *vcpu);
 void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val);
+void kvm_pmu_apply_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val);
 void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu, u64 data,
 				    u64 select_idx);
 void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu);
@@ -137,7 +140,9 @@ static inline bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu)
 }
 static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) { return false; }
 static inline void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val) {}
+static inline void kvm_pmu_request_recreate(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val) {}
+static inline void kvm_pmu_apply_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val) {}
 static inline void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu,
 						  u64 data, u64 select_idx) {}
 static inline int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,

-- 
2.55.0


