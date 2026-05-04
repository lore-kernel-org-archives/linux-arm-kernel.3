Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44331CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eEXyvRG46atk1NeuxPuyTaL3r+WKmiAuf7G/PMx4+I=; b=oRfTs4vZDYoygOCrosWpRevLTp
	5R9XugnPz8sZ+S2+955NDMAufC0z8hTufXqw9fIlSS1N2NIB7pSZAXo8pEcyXt4omvxSdiFmcA3Sr
	SeAGShi9hCQJJ4J2JZd1xdiL7GGDsc6vE2Sx0aVjg21rV6fwDjawd2Si5KluvgZ0vLknizCI9aUhO
	xQDeyRR1nfMN8KUdzDaj2XUVOwlRK3NGXarHd2FF+UxsoVLQRIp4RCeUkhdJjNZfPrtUqcq3gKo0u
	IQkDdjoXqRfvkKUysEWyFRkbBhNEiD83deLSW6qpzHllFdJfluZlHar4PmjesbRzf4y8FF7HqTXp0
	WirPSYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gq-0000000ELpw-0sxr;
	Mon, 04 May 2026 21:18:56 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gl-0000000ELdx-0mF2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:18:52 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-6967b799acdso8347984eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929529; x=1778534329; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4eEXyvRG46atk1NeuxPuyTaL3r+WKmiAuf7G/PMx4+I=;
        b=J0CuF+NQh3EXA7GRJVtLx66ZebhO/8BlcY49Ig0rlVON+XD6MnaFc52EgNtRxtwlq/
         UKNSAMmcKOoJ89QmgQN+FPTl7iczilFwHfQYic5TRDfRZ34XBrg+3y91fcvHmCqEJWLU
         GcUQpbHtgo79aHLORRGrcmvvsyKcnQUYCi0A741O+mMU/VV3p2uCK/3Pc38ZGbM04hie
         dBMFlldFS4Ls97jYUXDGj0H96vNX2ht0WkCxJI8C8hUpYzfWVhqXWWsGtdGa2KAutcOA
         Ix/qUKhnJaEgovbnXkI5P6OhaxFVTxm0fIcdwHwjdKRSmKH41+EwpcepKoU+rEradrQI
         JPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929529; x=1778534329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4eEXyvRG46atk1NeuxPuyTaL3r+WKmiAuf7G/PMx4+I=;
        b=Xt2OyeVtVBL6VbIZKE15EPGwFFifvDG8zHcuntjN+YW3z8Du9eXT0rOkJOf7uvob4k
         ZKK7KNPy+xjUWr7DYs+efEY7GJyvm2lUkDCwNDYg4y8iRIi7KnWZ3hTltOrQnVHVeRY9
         oL3qF6ZTEt0Z3HXaK8Mh5XrMzxQrlGlkuC10fNoWcDQuctbZMvDiJQ4PcYuN0s0n+iuV
         Gqis3gmcaxsBa18y4nIjlIuM4z/xred8tXyTKkBijkhMqe/+oIyWycND0z1uSugubuTb
         2Hp7Xj1CoBqqx9AMfqwZrjbi5Mz0BNmm2ipcS1v1Hz8vOzo7nA6a3doa6vb5AHARzQtq
         Yntw==
X-Forwarded-Encrypted: i=1; AFNElJ/BAbBd2KMblBHrXebrBNT9SM+qdbJlKCaJx8NT0o7UWpA+y78ORBkYDETo+jH0vzwrsPFzQ2NIOFVlpqdag911@lists.infradead.org
X-Gm-Message-State: AOJu0YwuDZP816VuLK571Qo22QeTv7Ax54rrAlyqdD6F4AuKB6a8q02T
	Rw46JBBj/9F6WvjDU8yWs7BjCejPPntjNjAh5jacI2kYEy33iemR+ZTCOAUt1AuVZb0Hzxl1C4Z
	sh3qDtbI4tvc/vfGcLv6ecdC6Bg==
X-Received: from ilmv4.prod.google.com ([2002:a92:c6c4:0:b0:4fe:8f7d:8d00])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:20c:b0:696:1f6b:b3b0 with SMTP id 006d021491bc7-69697c50c9dmr5805746eaf.33.1777929529289;
 Mon, 04 May 2026 14:18:49 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:09 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-17-coltonlewis@google.com>
Subject: [PATCH v7 16/20] KVM: arm64: Detect overflows for the Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_141851_245340_C14FC8FF 
X-CRM114-Status: GOOD (  17.96  )
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
index 535b4c492ff80..9693d9eb69daa 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -433,3 +433,33 @@ void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr)
 
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
index 8c10ad05661bc..f1c66ce678840 100644
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
index de058a5347d18..4af8abf2dde0f 100644
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
2.54.0.545.g6539524ca2-goog


