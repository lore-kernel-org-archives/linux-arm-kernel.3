Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1B9C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QA3UW6Y8rAxAny6iU/eRmOq8dPrpECd+SpYd5oHTFx0=; b=ThG+YSqTKlRuCd3V3zjmkF7Jg8
	VMTrbr+1FtmfUR94tNyPj+dbAAUO0lZNHeGbExitmAPYIvECndbSlZ41cS84SgSTtnCYza9QT6VwO
	NK7oj8irn81Nft/VLJYfIkqQBzZimGdi/V96ewjxqwxLH/ME5KdvHgDdENX20x+o7vm9RXDYnG6+3
	Ir54pMRdyHQSly81lHBrXxmVttFwNuzgUXd8X13YUH2Azc8wRyr/yN7dfhPHBHVzf6ZvSKKLdTog8
	40DpfY//x3YoSnvQLI2JSeiuclQ6VpmsDIxOX4fhvSkACu5ZJvOOwxJSaF9SF5Ma5ytgmOGnH63nY
	qokVbtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUurj-0000000Cumk-2rDv;
	Thu, 26 Jun 2025 22:14:43 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrI-0000000Cgnp-224z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:09 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddbd339f3dso13946195ab.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968367; x=1751573167; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QA3UW6Y8rAxAny6iU/eRmOq8dPrpECd+SpYd5oHTFx0=;
        b=rAVVYfkfKjqSBYWy2BhdpG1SsY6CfAwtyrb2PuzAXYfSZ/QOkyCWlQAUuvCMKsSBR8
         A4fA+X3bxNQXDT2ToRwamxePDSNtcojI68E17Pt/x6/jVqQj6mZtpqHX7OXD3SGtpxXs
         DA9BQy8CQ74FM3BXcxYbWK8zLop7WxH09K8P82fpZkTLfOAXID244Fbt2SjNP0jmVPJS
         Yced5mvIxBP/rIAFp63xWvTTvu3FUmwdsUcLmSWrVI5glrl61irpRUgPa6KlMUlYwa3d
         BtzVN6QYx8SmFzvm4rFxu+oro+0J15bUkgNy5f7eKbfUEO+5Mvc2fg4CdX0iD1n6klNf
         /A7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968367; x=1751573167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QA3UW6Y8rAxAny6iU/eRmOq8dPrpECd+SpYd5oHTFx0=;
        b=mciDMY8YhsKfTGzHiPFVQy5OMFU041/VhcZ76ixmZscQm5k6oKMaz5MF5+NsexwQdf
         a3DX296njLwc3Tvxnlkxg3Q3Apv1HdIBlMekyX4YbV+mMlguCOWhTMPKWHf2KgWFOLft
         IkUyJBvYJ03ccCd4w57juaqNpfVqnmmw9Mi7T/cm7XITS6a9WdpOb9iGEApIO/9dlmYY
         gCy2ECqELY4CpESKTwkbccdSg4Qf2RLA5gaoGpmsYBudLv6uDrs7px9Pn/pXRr4N4LYM
         QiBmYv4LDofBDRSzh3l+4gItHpmEE3I2We019QMiOIGyPxdu9INnTUqWv80ul6OZ9Mre
         25Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUk++swKX+1va/0a/8OwGOM2GC599mrrP8LLif/+bmBzi4wl9yHaEbfJPq31cT870fUpGcRvIfDnEyrwA4n29n3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0S1MF61bHRoNaaytdRyLaM1r1ot8Ddllf06faVviL9A7j6pAa
	zbjnfhFuoMueobDXx6OwLMx5nR+1FfzdQAECQfSt++x4mrYR7pP9lglkaNj4y7vwm/ts4qYOp6J
	VOdopepQ+ebG5u3yE9vQzG8m2iA==
X-Google-Smtp-Source: AGHT+IEzT1wnDgAQ96OJkbudRajHKCKUOzyR2rX0XafuH6cZli5Gqftia2M8Ig1EJNOLt/wms6hYjIofKHvZFHa92Q==
X-Received: from ilbbc25.prod.google.com ([2002:a05:6e02:99:b0:3df:40c1:c1ac])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1748:b0:3df:3be7:59d1 with SMTP id e9e14a558f8ab-3df4ab87f69mr10145295ab.11.1750968367035;
 Thu, 26 Jun 2025 13:06:07 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:51 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-16-coltonlewis@google.com>
Subject: [PATCH v3 15/22] KVM: arm64: Setup MDCR_EL2 to handle a partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130608_544248_D8C919FA 
X-CRM114-Status: GOOD (  19.69  )
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

Setup MDCR_EL2 to handle a partitioned PMU. That means calculate an
appropriate value for HPMN instead of the maximum setting the host
allows (which implies no partition) so hardware enforces that a guest
will only see the counters in the guest partition.

With HPMN set, we can now leave the TPM and TPMCR bits unset unless
FGT is not available, in which case we need to fall back to that.

Also, if available, set the filtering bits HPMD and HCCD to be extra
sure nothing counts at EL2.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_pmu.h | 11 ++++++
 arch/arm64/kvm/debug.c           | 23 ++++++++++---
 arch/arm64/kvm/pmu-part.c        | 57 ++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 62c8032a548f..35674879aae0 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -96,6 +96,9 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
 
+u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
+u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
+
 #if !defined(__KVM_NVHE_HYPERVISOR__)
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
@@ -158,6 +161,14 @@ static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
 {
 	return false;
 }
+static inline u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+static inline u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index a554c3e368dc..b420fec3c754 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -37,15 +37,28 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
 	 * to disable guest access to the profiling and trace buffers
 	 */
-	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
-					 *host_data_ptr(nr_event_counters));
-	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
-				MDCR_EL2_TPMS |
-				MDCR_EL2_TTRF |
+	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, kvm_pmu_hpmn(vcpu));
+	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TTRF |
 				MDCR_EL2_TPMCR |
 				MDCR_EL2_TDRA |
 				MDCR_EL2_TDOSA);
 
+	if (kvm_vcpu_pmu_is_partitioned(vcpu)
+	    && is_pmuv3p1(read_pmuver())) {
+		/*
+		 * Filtering these should be redundant because we trap
+		 * all the TYPER and FILTR registers anyway and ensure
+		 * they filter EL2, but set the bits if they are here.
+		 */
+		vcpu->arch.mdcr_el2 |= MDCR_EL2_HPMD;
+
+		if (is_pmuv3p5(read_pmuver()))
+			vcpu->arch.mdcr_el2 |= MDCR_EL2_HCCD;
+	}
+
+	if (!kvm_vcpu_pmu_use_fgt(vcpu))
+		vcpu->arch.mdcr_el2 |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
+
 	/* Is the VM being debugged by userspace? */
 	if (vcpu->guest_debug)
 		/* Route all software debug exceptions to EL2 */
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 92775e19cbf6..f954d2d29314 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -137,3 +137,60 @@ void kvm_pmu_host_counters_disable(void)
 	mdcr &= ~MDCR_EL2_HPME;
 	write_sysreg(mdcr, mdcr_el2);
 }
+
+/**
+ * kvm_pmu_guest_num_counters() - Number of counters to show to guest
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Calculate the number of counters to show to the guest via
+ * PMCR_EL0.N, making sure to respect the maximum the host allows,
+ * which is hpmn_max if partitioned and host_max otherwise.
+ *
+ * Return: Valid value for PMCR_EL0.N
+ */
+u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu)
+{
+	u8 nr_cnt = vcpu->kvm->arch.nr_pmu_counters;
+	int hpmn_max = vcpu->kvm->arch.arm_pmu->hpmn_max;
+	u8 host_max = *host_data_ptr(nr_event_counters);
+
+	if (kvm_vcpu_pmu_is_partitioned(vcpu)) {
+		if (nr_cnt <= hpmn_max && nr_cnt <= host_max)
+			return nr_cnt;
+		if (hpmn_max <= host_max)
+			return hpmn_max;
+	}
+
+	if (nr_cnt <= host_max)
+		return nr_cnt;
+
+	return host_max;
+}
+
+/**
+ * kvm_pmu_hpmn() - Calculate HPMN field value
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Calculate the appropriate value to set for MDCR_EL2.HPMN, ensuring
+ * it always stays below the number of counters on the current CPU and
+ * above 0 unless the CPU has FEAT_HPMN0.
+ *
+ * This function works whether or not the PMU is partitioned.
+ *
+ * Return: A valid HPMN value
+ */
+u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
+{
+	u8 hpmn = kvm_pmu_guest_num_counters(vcpu);
+	int hpmn_max = vcpu->kvm->arch.arm_pmu->hpmn_max;
+	u8 host_max = *host_data_ptr(nr_event_counters);
+
+	if (hpmn == 0 && !cpus_have_final_cap(ARM64_HAS_HPMN0)) {
+		if (kvm_vcpu_pmu_is_partitioned(vcpu))
+			return hpmn_max;
+		else
+			return host_max;
+	}
+
+	return hpmn;
+}
-- 
2.50.0.727.gbf7dc18ff4-goog


