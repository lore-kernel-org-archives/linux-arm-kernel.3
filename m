Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48B6C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSsGsr3kAuFxcrtpSfRGA99t0k+DUOp8ehJUjKxyPeQ=; b=j5BLoS9kiyo6Jca2In3DRrdYxB
	Y3MwwWWneOLkJ8LIB1cWB5O9dkKYptWN6ZRto6OznEsskocYxrGC0wQkCMhz9kzgdg5OLsKF6a/a/
	L93AS+wFo9EcLQlwyNwB77tVou66u1WhTMD0mDvCpYbDtE3EfUeNqMD3vNIJ4VztqNSE/tpraDGga
	pitkifkunfm1TkLbD2UunxAE90VRk6JXyPzZDiwBUBOqf6V7mBFO8UpMsEGD06W3/MDr8IeFf8zAD
	ObHAaAusPURBg9bbIWTzusilxW8oMY/x7Lvi0AYJdbDPlzBMcLEo/9T13vAZKEUxWUpYHd+DHPXAh
	hAedkvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLfR-00000008Tpr-1SeX;
	Wed, 12 Mar 2025 12:58:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKhK-00000008KQH-0MpQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Mar 2025 11:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LSsGsr3kAuFxcrtpSfRGA99t0k+DUOp8ehJUjKxyPeQ=; b=IFLKYawnUQ+/2QlvPsEtvdvHnM
	7DvvoBwg5nC22bd041rXEEKgUP+nTBCwCblwgQYveN7IxGxHOncvbx1RJWD6PRt9Lrg68P8uYF1jr
	8WjJFiBEbVtUSQ9DTo5Cb2BtE3CJRmhe2Gjdct8xaKMgPa9aFZFvGXTbWeh45mV3gPJVMM8XjCsGg
	ykH2QCM2ZdkzmvwD/Zth0AcdxA67IUWo7XVflLLnDBjYZGBzkLtc8rpSFENjcOfpQ0QpEPqqLVDYd
	Xxg2nkbjTS4PzVLGpBi6LBskmzujY97lJw+38xObSynIt3xO+AuPqrdNLA4olKFn9oeBdvj6Pa/jo
	WTwY8d6A==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKhG-00000002Mp3-26uq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:56:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2239aa5da08so108268505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741780584; x=1742385384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSsGsr3kAuFxcrtpSfRGA99t0k+DUOp8ehJUjKxyPeQ=;
        b=2+cZKUQDlha8UATnAAsOrYIMc2caHiF842saI5l/bgAO/663somrArMrSEn4Mp4uDL
         QWOjFMAQK4Mn6air8SBZH3jpxCT4kuqTi5PgeMPlku5XsWJYjAnG3zEEBHlXIDAVARAF
         mBxq+CtTEFXEtGJqxbCcg6WtxBn7c1rqKo3Z5MiI5rxzO7ZbYkm+FrGHkluvNQR3dH73
         AvZdCOhLA9VqCphL2S6q3DLIQWViEDnxYHvhdR0UE9bNGZE/Z5yEsmyqnBcqEv9W8ruz
         OItkfKjRV4DPVVKzqIplqXlCjgdFKjxOJjMu+cIIbKp7aHdmIFIaKzXZJSX0BCoob+nF
         0vRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741780584; x=1742385384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSsGsr3kAuFxcrtpSfRGA99t0k+DUOp8ehJUjKxyPeQ=;
        b=QFdrhF3Do3PLegvMe0Pc3sA6qzniU93atEgGuMY++7RPgLszH8GIMPM9riyKhXUvuR
         Rxo+fkBywSfr1zT0jI1lwokUzLzfw+dlAnTxShZTLCC/I/GdTwpFuRLt+x4pL8qqTXd7
         n3355duA98rXufhGAYNM3KGSAubE4ijxZ0RfUAZqujgLzegf7B6tpuIA1EhQlYtHfTEB
         y08a/HaC+CdDSpfmu5gQe9xHGbsg8hApVAbguI3kGdzv982iAGto+HKOF5r/ZQ12eRu9
         ux4B7xkB9MDzlTd+JaloqmeXhjVr9j+0zlzaQ8ltG0a11g+9QGP8H7/brJqN6Y6LeCHD
         pHBA==
X-Gm-Message-State: AOJu0Yy1velyphPViLSWB2U6f2DrWyzPwLbxLBkbqiIB2KDCKqBxkaa1
	msSu9CPRLRF1rJvq/2AbmcMUdxvyCbDf0mtfVqBu/DMCmiRfgNMIMfCbMJ1kpG90f2qD0nHfL0a
	pfC8=
X-Gm-Gg: ASbGncu4Uk34i9Ofudq4A5+MVMrcoUhHUzmkeWxx/bkPmSlKFJgkGoIJxr5Kz5j2Pcv
	JGlIoG0KQHVpSZ35PLz5qmv3y4wfC9hDUF6fxIHGFBaNa3Cbs/RsIEWEMC/bXGJBV0sSaIj94vU
	sF4AHNsTQgHRNmYMv01IDc6xLyIFM9c+66EBCLD00ibMmgitbHE01OAtvKi5b0Ubz33/cvb6eq0
	s5ypUBGMBYaZ7xCksnvFLxamWrqFbmDE0HN0DR0tfocDN66eZ3kq9kWuxoaabw2O9YmRDITtjzJ
	ZfBaZhB16PnBFa/C9oDoQVVLu35rSJYQ6HqSHJvBdIKC/rkZsbOsGJvgcoM=
X-Google-Smtp-Source: AGHT+IEySYB2KOvAVkEbdUGCk7PaLmynA5DtA3ifevnpQFe/NSoQ7IgcTUmRgz4PK00aGrJKKcPhDQ==
X-Received: by 2002:a05:6a00:8e09:b0:736:ff65:3fcc with SMTP id d2e1a72fcca58-736ff65443emr3402126b3a.16.1741780584028;
        Wed, 12 Mar 2025 04:56:24 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736b7bb0bf2sm9336341b3a.42.2025.03.12.04.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 04:56:23 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 12 Mar 2025 20:55:57 +0900
Subject: [PATCH v3 3/6] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pmc-v3-3-0411cab5dc3d@daynix.com>
References: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
In-Reply-To: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <drjones@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_115626_659566_83CA3844 
X-CRM114-Status: GOOD (  19.04  )
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
index 3e5bf414447f..1cfe53b6353e 100644
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


