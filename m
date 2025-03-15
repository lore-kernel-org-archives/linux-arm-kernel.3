Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3871C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z45wX6sTn0j+WP194BbrDZyhFp7C/BntrOrXCNO4tBM=; b=PqdnCMFaYtj/gh3QazWV6vjtXu
	HPJklWNgTDFq45MCWtOIC8GK61tTBbzRUPQ9wnTJCJsxgjH6WZ29+T7Us392KiLhrzLVcikuAcN9E
	IXsLqqyrBjTlIspgCTAPzCxIc/ZQT6MeuZgJDyN61pMzl/io63AqBgwFxzEVkODet4XBNx6Pfj06O
	a2gkpvfQocXr8Xk0SY6xRvSQ++jATWxIWauE2Tgi+aG2YHH9uY4H3F1RH0eTBgRFUml/2nzOT5B6G
	U/xVjSfvUDthkaWMn5SYA2h+oaqE+FPwKQsF/oMpA3dq8dDqUBosGd+q9nRKmKCRYzV9KsXsYlCdF
	fgLGFuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNg6-0000000G7In-1rJ6;
	Sat, 15 Mar 2025 09:19:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNZg-0000000G5of-41dU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 09:12:58 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so652468a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742029976; x=1742634776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z45wX6sTn0j+WP194BbrDZyhFp7C/BntrOrXCNO4tBM=;
        b=SACtfMNrhy3wUWwGJIAFgilZwfUsMz9Nhk9z9NaD33dER77xbnI4Y4/4/0MCR4Idzz
         aN25jHN22lYcET/eoXphc6NbOjJ0b8zSOd0rewXEqTTCvVgMQDnTu5QPl0G6682fPooA
         cuawoZBtgiMroXQTT4DD3Lmq3yU/pJSmn1y1hAmyiYJRJ46SBDEyxMMKP5O8IbM0ql13
         fmr+Xy2CwsOAbcIZK9MtPCUGxJBynxgUvD28P5mqtUEpmvj1gUvcLmNIn3QjBTMaHY29
         AgxRAtvypyFos4HnytkCdkH5enemdJRnsg2uj5OeorW1cbUhSCwwPoxqWbmiDGaaGMft
         Cl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742029976; x=1742634776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z45wX6sTn0j+WP194BbrDZyhFp7C/BntrOrXCNO4tBM=;
        b=BrfV5Z9FESzdt5d28sH5EzQF9T7i/dgtYATd6rLGXw1kVk0E6J/WoOm/DX+VH8f4Ji
         aEtOgKCJ2XhlWsZdG1Te+9g3PLIwBJqGDzLjrnEkalpp3/6/ntsNrXrYRSk2KiiTA7L/
         BR5S0wmuF2wfdIqMeYBV6l6GAdRqOajpPIvFvwO60yK0axduhrCn3yDmQlNn4FAvcffh
         wXrYub6DCizMtj/e8mfbC5p8lDrB4p/Q67N8hwGxmzKj8MIfp1YVacJzs2sKod8FZFuC
         8yu5tYQz/IVeqUsVbyMiaenfB2Tje/DYhglP3mP/KaO3aTAA5rmYmM83FGe1zerJba6f
         S4sA==
X-Gm-Message-State: AOJu0YybENnZiO2ZDTMMZA2uFGDz81Rle4MKQKfc1z2uWo7f7EbMyI2e
	KF4T8HjdTYPF68+bnizrJ3bxKEZsF0yaWCCHW4bPs84C9aacBWN88CNVfoks1Eg=
X-Gm-Gg: ASbGncswDfA+ZUsAGwUPe1y91SsUKlkZr1U7YRybKpKQ42H54McdI+36lgdWW4eOqPd
	k4LoFVzjxvrok6ANcqZeJ7HYgLNB1h5gVGWQ7gTb3yKETYDPOO0XrCUI/mOtYWTdubhN7rxKUmz
	JI9pLv2WNVlU4yXBbVQAwhBtt7GAH3qmWA6Ndt/pqYrvgb79EtWOMAp3tS/VVoUCvSn+eKsTvWx
	vN/VBxWF3ny4EzoZRU+BsWSxZ1WC0+zOPfCUrgNOUmKJaNX+WQKGxAevGIYr5UGFuKsZB7wyJoK
	NDddVt6BPbUl5V9CRKeksG40TEas0hQaoN+uhXpg6+l8VcpB
X-Google-Smtp-Source: AGHT+IFM01ujgQGmxWWrZqVb8b6dOpUickjIAuSWkmx+lJTnPzesouNeLYIaUrB/yeU1KLg5VJSBcQ==
X-Received: by 2002:a05:6a20:2d08:b0:1f3:1d13:96b3 with SMTP id adf61e73a8af0-1f5c1132fcfmr7792054637.5.1742029976132;
        Sat, 15 Mar 2025 02:12:56 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-af56ea7c7ffsm3280291a12.55.2025.03.15.02.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 02:12:55 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 15 Mar 2025 18:12:12 +0900
Subject: [PATCH v5 3/5] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250315-pmc-v5-3-ecee87dab216@daynix.com>
References: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
In-Reply-To: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_021257_005818_A744391C 
X-CRM114-Status: GOOD (  18.31  )
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

It is also important to keep the correct state even if userspace writes
them after first run, specifically when debugging Windows on QEMU with
GDB; QEMU tries to write back all visible registers when resuming the VM
execution with GDB, corrupting the PMU state. Windows always uses the
PMU so this can cause adverse effects on that particular OS.

Fix this by releasing the current perf event and trigger recreating one
with KVM_REQ_RELOAD_PMU.

Fixes: 051ff581ce70 ("arm64: KVM: Add access handler for event counter register")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 13 +++++++++++++
 arch/arm64/kvm/sys_regs.c | 20 +++++++++++++++++++-
 include/kvm/arm_pmu.h     |  2 ++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 98fdc65f5b24..593216bc14f0 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -191,6 +191,19 @@ void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val)
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
+	kvm_pmu_release_perf_event(kvm_vcpu_idx_to_pmc(vcpu, select_idx));
+	__vcpu_sys_reg(vcpu, counter_index_to_reg(select_idx)) = val;
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+}
+
 /**
  * kvm_pmu_release_perf_event - remove the perf event
  * @pmc: The PMU counter pointer
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e8e9c781a929..4d1ef47d0049 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -960,6 +960,22 @@ static int get_pmu_evcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
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
@@ -1238,6 +1254,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 #define PMU_PMEVCNTR_EL0(n)						\
 	{ PMU_SYS_REG(PMEVCNTRn_EL0(n)),				\
 	  .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,		\
+	  .set_user = set_pmu_evcntr,					\
 	  .access = access_pmu_evcntr, .reg = (PMEVCNTR0_EL0 + n), }
 
 /* Macro to expand the PMEVTYPERn_EL0 register */
@@ -2835,7 +2852,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
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
index 147bd3ee4f7b..b6d0a682505d 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -47,8 +47,10 @@ static __always_inline bool kvm_arm_support_pmu_v3(void)
 #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
+void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
 u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu);
+u64 kvm_pmu_valid_counter_mask(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1);
 void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu);
 void kvm_pmu_vcpu_reset(struct kvm_vcpu *vcpu);

-- 
2.48.1


