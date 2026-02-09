Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1D7E94617
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtvZ/CVAyvlBIyi+KC1xnXowl3JGTClEkFZx5dHECQw=; b=EndkHldorratxaFpc7FRA28vpP
	0Hgz0HLCS6O2TJByQzx9CaD6+V+3zbmpSbEw3E5e+GALLpEnezcBrL0J8o81zYDmlaH/FK2pv3J52
	AuAWZ98Ezu8q8gJshBu+08W+XHTvDEUfVREidi9Yhro1+nZ19AuLm+pgDtm1Q8OjfxoTVNmBABqzB
	rv5WOZ7Rqx+8AWAx0iHbFTKku51vCiIB1uk0M/ZXWWgQ2glVdlMBQj+iHtxdmgb08V6ao8pS5QHLJ
	sOgroq3slDQ53MOcCmO97E7Yq40LOKe7MFUtloJenPFp+jd/5rmO5bHZHWngMTMBbkvqoK6m/Ai9o
	hzyRKkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwe-0000000G7w2-3RqY;
	Mon, 09 Feb 2026 22:41:28 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwG-0000000G7R7-3LPI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:41:06 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-45f21c2842aso8401954b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676860; x=1771281660; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtvZ/CVAyvlBIyi+KC1xnXowl3JGTClEkFZx5dHECQw=;
        b=S2hpjKbvOvBha2gQxQelEG7jSEgY3wdKxibIzulLtDr9tTmdOc9WOswtxfnd4LqZG1
         rW8YODT8V156i6Dx2cUNotwKBzn1z6sM4XroUx893UtOrX1HeB5v1VnPtNHigaOwv8/s
         zaqkzE82OqQBd1VKll5RVZil/OwC6K7BoEUK5BcgNTFjovBtN+FuiMOrlyGcqarwsm56
         Q2gW+/jFufM96C61nwG//lVHQ5vY7rcOqNUIbrsgg4SuX7tgeuHu/DxaEYwpjUir7e8O
         kpzcmN2QEYdkaGbbVPjHbQjzACaHKpi/Rlcl5c5OSTahYUVpqYEZdPm8+bu/1uussMDr
         RnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676860; x=1771281660;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtvZ/CVAyvlBIyi+KC1xnXowl3JGTClEkFZx5dHECQw=;
        b=LjFpdlH27Sldi8pEVdmM37r4VEhG6oX3AQvVA9xpq2Sh33bCWYhOuP+9BBiCmGsjU1
         asa3XNfsRg+VF4Ak4UhVENdtfV/XHhFINgbHcNmmGJHNE9fPO5Bjgne4qW0XYhdhd6hM
         1VQmDLypkWLtGSslQOzBHdQFRZTkXxnt1VO/ukBjtc5v8yjayUCRF6xHSpVbpjaqbO4f
         BZOw+gUFFUC6LVzvOu2kXbk+JHYThP88mfIBI1twZSDKpMKvcnz1E3jHtnHnNULVv7dI
         viLKf40z4lzzdgwYYY5Z9n1nYk9Kh1CQmT0YNr0aCgJHRDivt4/UyQ3/wwiJ+h0zwA8f
         W1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWjjHXH82L/Wvqku8ih87yw+1T3qWr++5aukF8S7lxowI4epj9M8t5ruPK2KQ5kG1aONljIZJ+3b4gL4JCYBB9/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf9VfHVhOiGH8cYBX7Wc0S0D4xYlaDM/pXitV4lXGqmWKwruCm
	cYSfZV/HLdg1+p1uSeGQGWUI6Iy0d2KZXGpoMFdwqEwgmSuF/sk8WWx0jYpZqsTQFTvHRdGPjOI
	caI3KKZ2cZhDuVVHduM3EDU+VOw==
X-Received: from ilbbg8.prod.google.com ([2002:a05:6e02:3108:b0:482:7936:419f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4913:b0:662:fa75:d6df with SMTP id 006d021491bc7-672fdc0a914mr57705eaf.12.1770676860543;
 Mon, 09 Feb 2026 14:41:00 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:10 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-16-coltonlewis@google.com>
Subject: [PATCH v6 15/19] KVM: arm64: Detect overflows for the Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144104_871754_1CA6EDA6 
X-CRM114-Status: GOOD (  18.19  )
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

When we re-enter the VM after handling a PMU interrupt, calculate
whether it was any of the guest counters that overflowed and inject an
interrupt into the guest if so.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 30 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu-emul.c   |  4 ++--
 arch/arm64/kvm/pmu.c        |  6 +++++-
 include/kvm/arm_pmu.h       |  2 ++
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 79d13a0aa2fd6..6ebb59d2aa0e7 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -378,3 +378,33 @@ void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr)
 
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
 }
+
+/**
+ * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Determine if any guest counters have overflowed and therefore an
+ * IRQ needs to be injected into the guest. If access is still free,
+ * then the guest hasn't accessed the PMU yet so we know the guest
+ * context is not loaded onto the pCPU and an overflow is impossible.
+ *
+ * Return: True if there was an overflow, false otherwise
+ */
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu;
+	u64 mask, pmovs, pmint, pmcr;
+	bool overflow;
+
+	if (vcpu->arch.pmu.access == VCPU_PMU_ACCESS_FREE)
+		return false;
+
+	pmu = vcpu->kvm->arch.arm_pmu;
+	mask = kvm_pmu_guest_counter_mask(pmu);
+	pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+	pmint = read_pmintenset();
+	pmcr = read_pmcr();
+	overflow = (pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint);
+
+	return overflow;
+}
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index a40db0d5120ff..c5438de3e5a74 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -268,7 +268,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
  * counter where the values of the global enable control, PMOVSSET_EL0[n], and
  * PMINTENSET_EL1[n] are all 1.
  */
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu)
 {
 	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 
@@ -405,7 +405,7 @@ static void kvm_pmu_perf_overflow(struct perf_event *perf_event,
 		kvm_pmu_counter_increment(vcpu, BIT(idx + 1),
 					  ARMV8_PMUV3_PERFCTR_CHAIN);
 
-	if (kvm_pmu_overflow_status(vcpu)) {
+	if (kvm_pmu_emul_overflow_status(vcpu)) {
 		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
 
 		if (!in_nmi())
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index b198356d772ca..72d5b7cb3d93e 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -408,7 +408,11 @@ static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
 	bool overflow;
 
-	overflow = kvm_pmu_overflow_status(vcpu);
+	if (kvm_vcpu_pmu_is_partitioned(vcpu))
+		overflow = kvm_pmu_part_overflow_status(vcpu);
+	else
+		overflow = kvm_pmu_emul_overflow_status(vcpu);
+
 	if (pmu->irq_level == overflow)
 		return;
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 3d922bd145d4e..93586691a2790 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -90,6 +90,8 @@ bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
-- 
2.53.0.rc2.204.g2597b5adb4-goog


