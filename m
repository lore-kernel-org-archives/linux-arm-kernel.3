Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B841C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXnlk8Oj50kBtPmAQ5IhbS6eNdNw6B/15jx/cysRtNw=; b=kYJ9r9ldqLGGAZbsb4lulXJ30x
	A7lL1kMPGyPDhe4ziVw8IS7vOSyBA23rLFkmACliHzUORIqnWQa9NDEjdjBbpFeoNHMrvfT1KIfiP
	WD5PBpNC5xJRgQY4Fj3CZiq8XSk+cX1TSdr4kher/mV0vvHTyd3LGVq9FyeFyLsg0DwX7LBHSvXny
	iLKXP+gXtrsEO8bRtSr/SVs21ZXA6A31nA2LlR//uRfitLticWvZ2YO7/1o2O3AFfN7UE56Tj+hqi
	xJzo7TTlra4cP8Qv+n3X0wkB3AK0aX2oHTtoA3vs8qBYLJ+0PnfdGufC7cfKLgW94J+3NwGSenWtE
	x2S0BAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSol-00000003ZMA-0Tjn;
	Mon, 14 Jul 2025 23:42:43 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS9E-00000003SZY-3k5A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:49 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86d01ff56ebso829327739f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533988; x=1753138788; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sXnlk8Oj50kBtPmAQ5IhbS6eNdNw6B/15jx/cysRtNw=;
        b=nPeKatiJY4mbNqnTGB2xGSGWvS9VUQSwh0icoNJUdaFDbJvabKnjl1VtIXtxCjpGKe
         gt2437KzfIp0riMolEl5pBonGbfKhJAFmyD8B0+UHPYw7zPGNEdDLkZnCLudkuBuxpLN
         Cl5Yor93iBYuz+jGLop9kHn5jRcf5KdVIKxZvoIGTIUWkU/xW97W1sQOf0ATCwp727hw
         rPPw8tBboy7Iq0nwergoz/VkcoPbuzjzxUCxH71gATTJNeHgTaWKHNL5kZAbPCcBZR6R
         p5JZUVoM/2TTtcdNNN4f0RfrrAKJbXKS3psgeDyrSij3sOwqsN3uyXJCYezLBGWKOSj3
         cH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533988; x=1753138788;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXnlk8Oj50kBtPmAQ5IhbS6eNdNw6B/15jx/cysRtNw=;
        b=T3iIwpFAejNWhMXQjYfWcycj2LkW0N34g2NNLa142OrrFM39Rqx6qG/yUI7pD05bBy
         cVlIe0qWLh8c17/27i9Yl/MisQc0Y3hxxY/ln3scnGq68xY/lsGT28E8EY6O+0JOaajt
         1kyKzI21puTXRK7gj/Xlcl7TWeJ2PV2M6nr+3RDXrov1Hrwz5BokaTQO7252JGwULeJv
         64sXWR1UY3FAb5JDbi5g8SiiKKDS8ibJhuMBy3ZRIP6aibU4MditvUf0QJU7u1fEiSSb
         PDsU7KIJRdCvvxCFoAoL8k5eCp9L4D4Xes1FuKRreOv9PkyDwb3sWR+NWYQ8YaEGEO4P
         qXTg==
X-Forwarded-Encrypted: i=1; AJvYcCVAzPMR+iy+DF49rWud5F1gsw7Q5LNqvQHjBY3fZNolTlRGMz+u73oqXy7XiTHs03wI+xnOByih/lEqAh14jKqp@lists.infradead.org
X-Gm-Message-State: AOJu0YyaK3tnDOw4+4i7ps0rC+sYIwtJYRdW7eCGgIYTGGK1W8cHUJqV
	pzPFIyUGjJT2LpAomalKcgNnA15EZiTwK0BUb8ughz24/RuM9J+E0MOPdJRbC3ezVzju6ZzPQpa
	XjH8C2a7DD1jq9fbnKh3t6xLYuw==
X-Google-Smtp-Source: AGHT+IE357sOrApLJCq1WzFbQdDxZmtg7XTkGgz6+RXD/fX/V+IYmhdKT8OJFTHuEVtH1u9P9MhFxUvuEWSnRycsww==
X-Received: from iola12.prod.google.com ([2002:a5d:980c:0:b0:86c:f382:ca95])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:27c1:b0:86d:1218:de96 with SMTP id ca18e2360f4ac-8797886bf8fmr1673529039f.12.1752533987975;
 Mon, 14 Jul 2025 15:59:47 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:11 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-18-coltonlewis@google.com>
Subject: [PATCH v4 17/23] KVM: arm64: Enforce PMU event filter at vcpu_load()
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
X-CRM114-CacheID: sfid-20250714_155948_958371_77D21C21 
X-CRM114-Status: GOOD (  14.83  )
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
 arch/arm64/kvm/pmu-direct.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 16b01320ca77..e21fdd274c2e 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -195,6 +195,47 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
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
@@ -217,6 +258,8 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	if (!kvm_vcpu_pmu_use_fgt(vcpu))
 		return;
 
+	kvm_pmu_apply_event_filter(vcpu);
+
 	for (i = 0; i < pmu->hpmn_max; i++) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
 		write_pmevcntrn(i, val);
-- 
2.50.0.727.gbf7dc18ff4-goog


