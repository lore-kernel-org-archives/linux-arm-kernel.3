Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80987C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1Rms3TAKvJ0DWAIQahRYenmqeYz1Pw9/up2OrK8qe4=; b=0FcuGW74cqx/CBA7MSWjoWBaMr
	9DrJJiszmEW1+6m7YLDVlwwcsieHiA8MQKpa1zGrVL7XJwpwaQeSpYlawwXfg3aWC0Ael2rhPfbfX
	0GYmnN/TzZtMTSijpij7kn1voRORY8M3c+7rP6KB3eAMHoH+G9d4LmdTMUqINJFWxG/qenO+8feOI
	E5z5QREXruNqvZBu9BN5NslJelIiTh971JePjrqC1rVt5NkyBUv4xUfETcqBy6sRjbeqo8AC+UjWh
	Cj07potPShmlneiedpBjr4CPv2A+9qWHYfeG0doob4Z5UHzyZO0ZiSVYdyNwr9/nDgOnv+M+y9225
	745UeYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVTA-0000000Dxoj-1kip;
	Fri, 07 Mar 2025 11:02:20 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVMh-0000000DwmO-0YLg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:55:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2235908a30aso42752585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741344938; x=1741949738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1Rms3TAKvJ0DWAIQahRYenmqeYz1Pw9/up2OrK8qe4=;
        b=xDD8085kLLdo16f8vzw614bNRaYMpzgrisDS3S9G8tMYH04mqh+p6bv1PyFifrxtMP
         3kR94qgh9vbrUjD81vPf3Y2i4aOI133yztWz2aWeycfLF+wluaxmoVBF5Crr7SG/vx71
         axR6areDkUtsvNaFrociYDeaA0BIA8C0rOMwl317Gej904Ae+rWuojDR9YikgR+gqRja
         PP8VgGGoi8WnuDmm/XUinIryJ0M7B30RTTZrekGQIcJbGVaUc58BLEccF95SRvUdbe0D
         eBQJRCunW3mXPmY3s/eZsf5eLXN5PDGZyw8p5zmc0HiYCzb0nvXaU6cOAFl+QpL64paM
         hevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741344938; x=1741949738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1Rms3TAKvJ0DWAIQahRYenmqeYz1Pw9/up2OrK8qe4=;
        b=JFxfg/fvWwbS67hio+LXmPj2hYWYWdu4r9MSeYpF9PWqZOlkVpxyo1K8znhfQ8WJjZ
         RQEEl3Xzb8JD9orJwLn2L6nlkObQPfHKFuupAMD4Zws8xMdDry4D65Pvpf4IgtQK3MP+
         +g9Gm0pal82LBb7UXNoJ1mKf3EmrrQkAnMTBUfaSaMrM63blyT/Y2amkwmDH/ItbjMPd
         6oRqKidn7y2Y/12eiLbBpCJzEwT26BjjcJiKdV1nsdhV/AMmSctNkL15RmTdwsj/JHTe
         ngepMtubNWGFq8zwwLdVS6jx3vYXxIHEhCzGXJJAjj1s6PM++geqnaQLiT0ZQLcCojdI
         GQFw==
X-Gm-Message-State: AOJu0YzlU+rxU9niDpc/FDOvxI6om12L0bNHxywEGBkzgq61t5lANv+Y
	QVdRE7go3+E4kr+ExClkgqNKrMFN2G8ma2DPfuY+IJ/G50M3QHcoSS2e5RgCm7E=
X-Gm-Gg: ASbGnctcVAPHVyWXpQ4U+s53GkOs0hhPesAYYyN3lcTC2pmYdNTid9boTHLp3MoH84c
	u3RB2uBHrMOwQzCcIDYd73lOP8ZOD779cT5JPeddzE+DRTa/zspz814K/lAlqefKnegyAl07X2D
	XWTBCQnzGfq0KdKq85qYeQr7ZQnHfmqSZMmlMtqa8NfjghjXZNQfcNf9guRIflBwwPu1yHSjnLS
	oCILLSY+rOlZOlR4wVn5AK/96KBw/pz6LbKgB0E9m0x6mwRqX776O5+chqsNFIwMpEdoKcohFkH
	NZeIP3OWRhP98Uj2CRP8BVev9s6jR1ATpy0zUnQbom02CkOy
X-Google-Smtp-Source: AGHT+IHp21Tz3W1NVSkiBkXo05zCKdRXsyhKUTTj6kvZ1eTKmFZGZ/WkqB5Jrack/mZQWt+UsvaCdA==
X-Received: by 2002:a17:902:e80a:b0:224:13a4:d61e with SMTP id d9443c01a7336-22428c0a43bmr38314595ad.51.1741344938150;
        Fri, 07 Mar 2025 02:55:38 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22410a908a0sm27232235ad.162.2025.03.07.02.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 02:55:37 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Mar 2025 19:55:28 +0900
Subject: [PATCH v2 1/3] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-pmc-v2-1-6c3375a5f1e4@daynix.com>
References: <20250307-pmc-v2-0-6c3375a5f1e4@daynix.com>
In-Reply-To: <20250307-pmc-v2-0-6c3375a5f1e4@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <drjones@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_025539_184341_D6B033E9 
X-CRM114-Status: GOOD (  17.95  )
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

Reload the perf event when setting the vPMU counter (vPMC) registers
(PMCCNTR_EL0 and PMEVCNTR<n>_EL0). This is a change corresponding to
commit 9228b26194d1 ("KVM: arm64: PMU: Fix GET_ONE_REG
for vPMC regs to return the current value") but for SET_ONE_REG.

Values of vPMC registers are saved in sysreg files on certain occasions.
These saved values don't represent the current values of the vPMC
registers if the perf events for the vPMCs count events after the save.
The current values of those registers are the sum of the sysreg file
value and the current perf event counter value.  But, when userspace
writes those registers (using KVM_SET_ONE_REG), KVM only updates the
sysreg file value and leaves the current perf event counter value as is.

Fix this by releasing the current perf event and trigger recreating one
with KVM_REQ_RELOAD_PMU.

Fixes: 051ff581ce70 ("arm64: KVM: Add access handler for event counter register")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 16 ++++++++++++++++
 arch/arm64/kvm/sys_regs.c | 20 +++++++++++++++++++-
 include/kvm/arm_pmu.h     |  1 +
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index e3e82b66e2268d37d5e2630e47ddf085a6846e1c..1402cce5625bffa706aabe5e6121d1f3817a0aaf 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -191,6 +191,22 @@ void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val)
 	kvm_pmu_set_pmc_value(kvm_vcpu_idx_to_pmc(vcpu, select_idx), val, false);
 }
 
+/**
+ * kvm_pmu_set_counter_value_user - set PMU counter value from user
+ * @vcpu: The vcpu pointer
+ * @select_idx: The counter index
+ * @val: The counter value
+ */
+void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu, u64 select_idx, u64 val)
+{
+	if (!kvm_vcpu_has_pmu(vcpu))
+		return;
+
+	kvm_pmu_release_perf_event(kvm_vcpu_idx_to_pmc(vcpu, select_idx));
+	__vcpu_sys_reg(vcpu, counter_index_to_reg(select_idx)) = val;
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+}
+
 /**
  * kvm_pmu_release_perf_event - remove the perf event
  * @pmc: The PMU counter pointer
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 42791971f75887796afab905cc12f49fead39e10..27418dac791df9a89124f867879e899db175e506 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1035,6 +1035,22 @@ static int get_pmu_evcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	return 0;
 }
 
+static int set_pmu_evcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
+			  u64 val)
+{
+	u64 idx;
+
+	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 0)
+		/* PMCCNTR_EL0 */
+		idx = ARMV8_PMU_CYCLE_IDX;
+	else
+		/* PMEVCNTRn_EL0 */
+		idx = ((r->CRm & 3) << 3) | (r->Op2 & 7);
+
+	kvm_pmu_set_counter_value_user(vcpu, idx, val);
+	return 0;
+}
+
 static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
 			      struct sys_reg_params *p,
 			      const struct sys_reg_desc *r)
@@ -1328,6 +1344,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 #define PMU_PMEVCNTR_EL0(n)						\
 	{ PMU_SYS_REG(PMEVCNTRn_EL0(n)),				\
 	  .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,		\
+	  .set_user = set_pmu_evcntr,					\
 	  .access = access_pmu_evcntr, .reg = (PMEVCNTR0_EL0 + n), }
 
 /* Macro to expand the PMEVTYPERn_EL0 register */
@@ -2682,7 +2699,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .access = access_pmceid, .reset = NULL },
 	{ PMU_SYS_REG(PMCCNTR_EL0),
 	  .access = access_pmu_evcntr, .reset = reset_unknown,
-	  .reg = PMCCNTR_EL0, .get_user = get_pmu_evcntr},
+	  .reg = PMCCNTR_EL0, .get_user = get_pmu_evcntr,
+	  .set_user = set_pmu_evcntr },
 	{ PMU_SYS_REG(PMXEVTYPER_EL0),
 	  .access = access_pmu_evtyper, .reset = NULL },
 	{ PMU_SYS_REG(PMXEVCNTR_EL0),
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 28b380ad8dfa942c4275e0c7ed3535d309b81b2f..9c062756ebfad5ea555362154459ffe9f8311c6d 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -41,6 +41,7 @@ bool kvm_supports_guest_pmuv3(void);
 #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
+void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
 u64 kvm_pmu_valid_counter_mask(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1);
 void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu);

-- 
2.48.1


