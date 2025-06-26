Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF9CC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsln9Cluh/lr4G6zFvH7bpJ9BvK8mJLYYPmhFGobydY=; b=gix9a11OJmifmwT6rMY93ftNQ4
	tMv5UYL8upegTwbtcGFqLxaC/keRTOb9ikkF7SHrT4tE/x/hFo7EPl34C9ufVBM3KFf+2LmExX0og
	AC0YN7coJ3PXjJE3bh0ajU8F0SRfY2v/YDzGiY0d2L2AKq/mjCIo0V1VjlCSwpzXlPcnYwdT66DZY
	XvUe2mL+m1Fg3QfkxjsxSrfBqEiICmHTevsb56L9PxnNixrE6zLqnUs7cNTtrEtA+KEKE/sjsz0aw
	C+L30VOu/3zWUCETo+exRDpnCNdwwxL9BDbaIOe4VyvwpCmJBBaO3jaHrgYON5Qu2DHqE/KoytEIj
	oRsYbhpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuyR-0000000CvV5-3sJL;
	Thu, 26 Jun 2025 22:21:39 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrL-0000000Cgpl-1xBc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:12 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-4067aeea8c0so509170b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968370; x=1751573170; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fsln9Cluh/lr4G6zFvH7bpJ9BvK8mJLYYPmhFGobydY=;
        b=SnUJP2A2RJzxZ0CusQme2uneiuqP1kADfQrWZIJY/0bX2yqIOgIugulnMAXD/RWyiC
         +Zyb/MDLzRRLf0+Gv4QJqdO9eluQXLvAKIx+4LePLJ3Tho+mhmFZXs9EzRM+PQKczXcu
         ch8UjnI7vIoLiSnOAN/36MnseAW/UI17cD7gZpJsCYgAK8IBosXK0GofoFRGfzCNZQGL
         F0xS+QjPdnmS4cQXewxoiEz7DzoVVALgO6hpSqpl0KkgGTMBXajIcXGxKaVgwnT59Vqw
         3QkDDdGZEEmqEHJayPgAotzm475/iaA7QOs9L0lkxzz/FjMNr2exrLX7ZmBHyY3pU5Z9
         l4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968370; x=1751573170;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsln9Cluh/lr4G6zFvH7bpJ9BvK8mJLYYPmhFGobydY=;
        b=JL9A1DQB5RBWqUtb1+Z2lvScfBC9d6iqSxK3ZkCxd7IPkVr/r8SobVIFOCGhBTtx2T
         yYbOeptGB7M6ZSqpErbajfSSXm0ZFkOJFHH123gVA1fTZPZPQAhyRtitG7S4pEQTntG5
         B6Ro0PTIiPL2ukI0zd2LVIIHhazmrtt0aw7FvYY1TigGIxNGa9x9e3/Q+D/BaCRpqwD8
         A2ZCxh5K3yiuoI7GJPz+u9IKAc4Zg/bj6A/YuXT9V5oJVNHsHEZjVruRLwXyAqc/hMJq
         bBavRe5Bo0wstAh9sLN7p7wAjQIaRBF0aSANpQfhDC+/3qC1oVT6Tpf0qoEVF4NcgMyC
         4AQw==
X-Forwarded-Encrypted: i=1; AJvYcCWAazfLhv06S3vsFxMSlUjcGezoeDdhoddPcY+pH7Af18m2NFVxfAy8ztFFMxfBEl6WMzPd6qyArYScXuzsypRu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz335AB4Yzv0YXQbXsNCS7CNPtUcE8ImQ4cLnPigQjrAZgpUF4Y
	wkcRm8wdiqb/6liPvHOSgV0KWIM7BsAw8OMzoaOWDZal/TTbOIE5BKWcp6Cn4PWIHGlHRn7lFKO
	AX9adTrj4OsIy47jGDczSI0TvLg==
X-Google-Smtp-Source: AGHT+IGFAFvDi2PbexbAqauL7y5C7K4PGkXLqZnIMKzQ7KnS/pNLTbsU7lTkZfS0TlivdMxg6dS5ZH5rez4yi9e+5w==
X-Received: from oobbq3.prod.google.com ([2002:a05:6820:1a03:b0:60e:fcff:daa1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:151f:b0:404:2960:9b4d with SMTP id 5614622812f47-40b33e133bfmr396970b6e.25.1750968370241;
 Thu, 26 Jun 2025 13:06:10 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:54 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-19-coltonlewis@google.com>
Subject: [PATCH v3 18/22] KVM: arm64: Enforce PMU event filter at vcpu_load()
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
X-CRM114-CacheID: sfid-20250626_130611_504174_B10755A9 
X-CRM114-Status: GOOD (  14.16  )
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

The KVM API for event filtering says that counters do not count when
blocked by the event filter. To enforce that, the event filter must be
rechecked on every load. If the event is filtered, exclude counting at
all exception levels before writing the hardware.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-part.c | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 5eb53c6409e7..1451870757e1 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -196,6 +196,47 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 	return hpmn;
 }
 
+/**
+ * kvm_pmu_apply_event_filter()
+ * @vcpu: Pointer to vcpu struct
+ *
+ * To uphold the guarantee of the KVM PMU event filter, we must ensure
+ * no counter counts if the event is filtered. Accomplish this by
+ * filtering all exception levels if the event is filtered.
+ */
+static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 evtyper_set = kvm_pmu_evtyper_mask(vcpu->kvm)
+		& ~kvm_pmu_event_mask(vcpu->kvm)
+		& ~ARMV8_PMU_INCLUDE_EL2;
+	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
+	u8 i;
+	u64 val;
+
+	for (i = 0; i < pmu->hpmn_max; i++) {
+		val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
+
+		if (vcpu->kvm->arch.pmu_filter &&
+		    !test_bit(val, vcpu->kvm->arch.pmu_filter)) {
+			val |= evtyper_set;
+			val &= ~evtyper_clr;
+		}
+
+		write_pmevtypern(i, val);
+	}
+
+	val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    !test_bit(ARMV8_PMUV3_PERFCTR_CPU_CYCLES, vcpu->kvm->arch.pmu_filter)) {
+		val |= evtyper_set;
+		val &= ~evtyper_clr;
+	}
+
+	write_pmccfiltr(val);
+}
+
 /**
  * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
@@ -218,6 +259,8 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	if (!kvm_pmu_is_partitioned(pmu) || (vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
 		return;
 
+	kvm_pmu_apply_event_filter(vcpu);
+
 	for (i = 0; i < pmu->hpmn_max; i++) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
 		write_pmevcntrn(i, val);
-- 
2.50.0.727.gbf7dc18ff4-goog


