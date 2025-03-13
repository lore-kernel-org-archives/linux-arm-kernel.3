Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CD2C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6iz2Tb4ku//H3AxfAexQ9B2Bw11aMopngIm2weGw1M=; b=vqZVnlW3vFvqBMXZK0tiZ4mxxX
	2QE1R8/WRP1M/KC4i36J9Fl8SQEWT5oYL6YPqXs6bYHtg58cA+ePv/sI9F+17UgSEYZkQTq8/xVv3
	ojJ+MS0RgcWRKT5n0aWCD0n2OrhMGOjUAiGtC3zJ96M3TAnKgY1kkLfDOrHQ/1GsjGjSHb9coCBx5
	BIpBRwlm9V5/PJ5wOO0uvvz07nAAK/Q8kkUtGcx06LdnIyzuLb33kTwDcbTy1F09kRKXEK1ozBZL8
	p7V5AdmovNA/Mle9+JykhLk58YJCHI/vJHlVURxJUJgaUKpSLmwmg2OxZEh32K0IQpAere9t66pK/
	AahwIyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsccW-0000000AIQk-1amV;
	Thu, 13 Mar 2025 07:04:44 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscWA-0000000AGzn-3ast
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:58:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-223f4c06e9fso11001755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849090; x=1742453890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6iz2Tb4ku//H3AxfAexQ9B2Bw11aMopngIm2weGw1M=;
        b=T29iSIaXz514OII6dJoDbcqXrjrGJqsQZPeJuZYgrlFxP+hMvPmCYgeOLW3oOT3do+
         DJ+blnyVYYWwT81FhYRQIppKijK+Q+211Ywd7HgB4OHSPXnAaLX5IzJorn6zlOmK2cR7
         MqL7WKK7vWI89pyhx9xzB+xH4HLkMOJzp7yxhok77VBjYPM/vJ8BG+Qyh9ucCIG2fsrj
         JvU++FHi2qvpf2BBp+/wpRnyh8F+3261/fOtbPkDWrh721he7tUVAHASYTaveBr2kT3d
         jb/xuuGX/uXbW9klC2c+IezyUYcRIaPIgVAMeRQEYNmku+YI7QhKh1ghTSFeTHCCUGHN
         2ATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849090; x=1742453890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6iz2Tb4ku//H3AxfAexQ9B2Bw11aMopngIm2weGw1M=;
        b=WgwCSbOQ1je7FIjZuX7kWvlROMparDqOPcwzujCTwyA6apXHX208vCsQB8A8+Q79Lp
         p+wDR4z1SCNa3LsROEuy+yR6U3crG6PwRJNMLupo9sjjhJLL7G8tmBfnA82wYLtyJpAk
         ZkXcW8Z7+ed7XKSgA52jPeu7M9GY1G9tVUXRCjSABUEZeqFuBQHixcca8QU2elQQ3m4m
         61cBULV7XGSmpltY6mdvS2pSKUCSyRSU/rm9by61WON+YEQNqVg+cXlTbdompFCNX3Jz
         a1JMQ7Ig2yg6U9oWt0Ssk9vPvrKwRAi4dRyKOJvTO1c5P8fEdLFcJXAuKnx6Ip25R5NZ
         UTcQ==
X-Gm-Message-State: AOJu0YwJSnwSWHM6xJfcGZlftMWcA1BgpkTxQx+0M/0pjSf7RoRak0JY
	Mm0zttlbg4Pd5ctfB6QSQmmhg6lrummKHi9edRd0NoBNhEUad+aMxByFqe/RPvk=
X-Gm-Gg: ASbGnctt7d2h7mNdbjxsPGoDxUqw5/ojJ++7QAkH/9dGwTbIjLU+lVE/lqFoU4fiaYU
	3LdDsH+VEKygBADMdT/yzu/eIiXimGqn9bpuOMsnE+9mFcIhalHdR+b3ECMaDaEbBr8TfIzfkYo
	kzNU4K05d2/P8+9lUbQl0TSrBmBlVS9PX0Nhc/zz/So4TzbMyfPBVeRrxrjowe/nckYzUZURQjT
	nehcLWWBUmtU0atUbS3EDnLTBXSTiM7+i+4paqQossEx0sHdlT6ik4Rws6ywOOSgn1Fbfs2REKE
	gtkiutZriMmZxk181OyW0LagR8msRhJjTt7VsD/FV49fK9M/
X-Google-Smtp-Source: AGHT+IE5NpWqZ+PooCqPvK48p4HWbGtSfd6lTwIKoKKHaXf2OMgXMo53qPDLD1AgcAjnRYmc4YTHGw==
X-Received: by 2002:a17:902:d2c6:b0:215:742e:5cff with SMTP id d9443c01a7336-225c6672ca0mr23251545ad.16.1741849090214;
        Wed, 12 Mar 2025 23:58:10 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6bbe960sm6398075ad.200.2025.03.12.23.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 23:58:09 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 15:57:44 +0900
Subject: [PATCH v4 3/7] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-pmc-v4-3-2c976827118c@daynix.com>
References: <20250313-pmc-v4-0-2c976827118c@daynix.com>
In-Reply-To: <20250313-pmc-v4-0-2c976827118c@daynix.com>
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
X-CRM114-CacheID: sfid-20250312_235810_901060_736A5F17 
X-CRM114-Status: GOOD (  18.59  )
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
 include/kvm/arm_pmu.h     |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 3dd0b479c6fd..1b91e5188d52 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -185,6 +185,19 @@ void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val)
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
index 6e75557bea1d..26182cae4ac7 100644
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
@@ -1309,6 +1325,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 #define PMU_PMEVCNTR_EL0(n)						\
 	{ PMU_SYS_REG(PMEVCNTRn_EL0(n)),				\
 	  .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,		\
+	  .set_user = set_pmu_evcntr,					\
 	  .access = access_pmu_evcntr, .reg = (PMEVCNTR0_EL0 + n), }
 
 /* Macro to expand the PMEVTYPERn_EL0 register */
@@ -2665,7 +2682,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
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
index 28b380ad8dfa..9c062756ebfa 100644
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


