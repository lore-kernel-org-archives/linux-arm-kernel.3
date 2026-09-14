Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66183C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5X3EgFSRW7eag/s5qAku4PH/bvlj9nBk6IFerUupNxE=; b=Q3UWWU48VHXKEkUlKqKFQpxJhc
	TLoxrp8WbjctAn1F8+zZ4RF3/9RtmR5x/dkCrWMloxsZd/TFcGWW3OAW77IKxM+CMzWLhKqQTCks/
	8i7Wj5hrf5lSMfdOIJ/v+JDB33C4TGWO2Irm2FtwCF+o+IOrFCXblN2QdSOHe3CztcWuT7mzetGd2
	vSbsXRMnblFvgLC6HoDdVoCPX87yCCFhLqqAxRSZVelUGvsVdGWixjU+N11mSxF8CwKqjRB+3EltY
	gKzvAz3Vl3QVV5N465MDxyf7+SluXl3nl6PgpZZ9E42TbnXhbr7QCHOR2FnNRAfyr/AIh5WdmEzoC
	am4feDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655P-00000003Lal-3ncY;
	Mon, 14 Sep 2026 11:42:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655B-00000003LLB-2vlD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 11:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5X3EgFSRW7eag/s5qAku4PH/bvlj9nBk6IFerUupNxE=; b=pdHL4R3X0q4DMXY1dD4VJuWq9m
	IxfXOAPvdEZQ27XQ9Bzxh1Jlxt3/+zS4lXbjw1D9QVphz/wDgu+RDJM003B8oMwfojymcg+kpnR0l
	BHMiPB2L/6S5QiA620YQRs6TTW7lkJI0+lW9eygUi7n+ww24JPIYBfl92Tsf+fY7UlJuruSqixDZR
	+whLVgIsg5E2tljooy2xTeg72heaQQYY1KvKXuaHaJNerK/0VFeLuM75YrLFAMEakomPSWu7RXEc4
	ahvTCSN1xdERqdSkwrpCS2n6X5hb72T0xq70csngE82FbNZV+TqEBXt2XLcSmxi4v227nDJoTGq12
	ALfnfO3w==;
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6558-00000005YCn-0WmA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:44 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjsA084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:54 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=5X3EgFSRW7eag/s5qAku4PH/bvlj9nBk6IFerUupNxE=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386114; v=1;
        b=Hs7K+FMu4NFGiZujTes1rkHZv+mcuYNQR7POrVLA1xLSbRa69VdyJLuPlnuLCNEn
         I8a4qIeY2qSLgmBnIhB8d87Q57+hu7nGiP2boUnmGgaEAp74uE65VfwjeSzRFEMz
         /eP9muybzAPleVn7K+CU22odvtX/2MYLnZNWeOoVAO/+V0VZ6qMf3ztylzDNzmi1
         hSO1BkFuBtmuAZTyLxrS/Z2KvTT0E3UNAs0C5oXR9SuBbFhmjcY3LU6tnZ1OCaEm
         H3kRDzVAIy+RDSGl4oJL/ZWDGITLkhyCgrD3gTM0ukUQ30GPaXWhCpXmOpV5Ncxc
         syohBTzyWo5mwE9Qpd1nig==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:47 +0900
Subject: [PATCH v10 08/20] KVM: arm64: PMU: Recreate events after MDCR_EL2
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-8-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
References: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
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
        Steffen Eiden <seiden@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Andrew Jones <drjones@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
        Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4914;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=mGsOePNADDbpufK4bCa5VbquY5MThz4mUhg8oNaFSoU=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byuwXmnu82hXd0nNoacKjs+N2bHfEiB3MtFH3d3K7cs
 YhPV33TUcrCIMbFICumyJJStJtbI7r2U2FCfAvMHFYmkCEMXJwCMBGe+wz/Q56F13znvheQsD5o
 4aNsj7XH2wqbprjtP6zW5qolkP9zIsMfvgte5zg/lnw3Dml8tGjjWxnZCdIJDA4Tdk/oP76tapM
 mBwA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_124242_985722_3EB3D605 
X-CRM114-Status: GOOD (  14.33  )
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
 arch/arm64/kvm/pmu-emul.c | 14 ++++++++++++++
 arch/arm64/kvm/sys_regs.c | 22 ++++++++++++++--------
 include/kvm/arm_pmu.h     |  2 ++
 3 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 8530cc907b56..953255111779 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -612,6 +612,20 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
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
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 1a57e07cec9a..bae1b69a5ab9 100644
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
index 65cf9b49a0c0..f12c916c04d5 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -58,6 +58,7 @@ bool kvm_pmu_update_run(struct kvm_vcpu *vcpu);
 void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val);
 void kvm_pmu_request_recreate(struct kvm_vcpu *vcpu);
 void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val);
+void kvm_pmu_apply_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val);
 void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu, u64 data,
 				    u64 select_idx);
 void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu);
@@ -139,6 +140,7 @@ static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) { return false; }
 static inline void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val) {}
 static inline void kvm_pmu_request_recreate(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val) {}
+static inline void kvm_pmu_apply_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val) {}
 static inline void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu,
 						  u64 data, u64 select_idx) {}
 static inline int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,

-- 
2.55.0


