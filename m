Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092BFFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5s0tIXpB8hlNO6Tpc8lm3vOaXeUhQ8iprPjSFyACC84=; b=COWSHbUBQFuwG5fqZxwStGXIXn
	pAT7Oli0TS08bJmXwkcA1QwUJ/qm5wL+ZBDlM/tvL7s3GzIaJ1EYQlZfbZULM9bOFcGOw3fnOftOx
	aBJ1UPOb5EkysUCBJE+/CFTvTA9+9smzhoXKPq7XNsf1pLTO27bnhyzEL9Bnu61VCNIZWOnBMx275
	BOn8/nOJtXzsZk0W3gVDZ48LLCC7DOVcd+zCLiYBf8HHrR+XRENMaNxvCGqYDMz6ZB+K7KoqrM2fD
	xfZ5EQUKlwErDly+N0Tudsi8QC99QMQE0eeM42mG4DTo+pI08o5pxaCBY+97SCa6mIzgZycLNjNrP
	JWyGo+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gv-0000000ELy2-2Ksc;
	Mon, 04 May 2026 21:19:01 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gn-0000000ELgP-211i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:18:59 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-7dcd9061254so9208108a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929531; x=1778534331; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5s0tIXpB8hlNO6Tpc8lm3vOaXeUhQ8iprPjSFyACC84=;
        b=aenI93aXQz8nF1oI9SRe/WNYbhyv10EbHeQi1DxOMfts5ItSAGSQpzqsVR/90RDCgi
         zyRYKTHvhKxT4lxURUYJ73tjhUp6rtLVp3iwQcoAhN3hlWPLXgqQsTKn5k5RUoSkr6sT
         HnPNsTwc6f2KufTwKUyPCM4J9GeVw0Zj9HH/0DGnHCCkQGK39Tlws7RzFG6/kKcKEjLl
         bBqBioT4pyFbnCEXC5l4bkYk3orvDbP63dugAt9neWMZ5yg35BiFI1zB/hOhTzxyYeQb
         B630XF8cv+7LuNVV4GpK9prPX8qBKmyNE33PZSYuiidVOykLhtN5eusWh5vQsGqLfzSe
         sVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929531; x=1778534331;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5s0tIXpB8hlNO6Tpc8lm3vOaXeUhQ8iprPjSFyACC84=;
        b=I6GXrgCNDW0fUg6IQhsEhlGu5CKkvDIuQZwlO+R6sfovvtTAmhTNGL7uF9dypIjreS
         KI7lfSK0Efc/Y+COPW4HzkXNd+G35y9/yqqFF+A13w8EbMpVZkZoKSMcvimgFCX5dOXj
         mcHskbjrOfsEQMlI1qcoCXMnVne4z/BVsdxr3b8ruF4G9Se8ZC3DdMOkdUHfoW1J9+6Z
         IQL8D/Mh1z6HR6RY4vUSjlEC7FPrK+L4O5YK8rK/jr1VIPNXdiummPkAAPOoqw8q5HDl
         dZLwKJhrkjmxQHb/cXQbGwyg6FKt9iXxO8up1OygAnjahOgCFwcavcsrhlQIGXHyouib
         xxCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Y0Uv4YYwUihUYFvjsOgrHDPKXU9SeOeENCb4s7RHU2v59XT3Iso8rJTEunLNIM8MaPo79fivQGDMQnfHl4s1m@lists.infradead.org
X-Gm-Message-State: AOJu0Yxap+UIjeoGNSGmEOdo7vkPF7C4E+5SG1kNWhuj27LKydEzqohT
	rBcezRD3spbSTXGR2941AG5oIiFLlPyMAuDjQFZuM7Of0UUBMUvMhsO1jBTTgYeNwBbdcleQC3T
	DzLbWWLX2Vmeii1F17hNDmBI5OA==
X-Received: from ilbeh6-n2.prod.google.com ([2002:a05:6e02:4c06:20b0:4fb:4dad:95a4])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:211:b0:696:6585:a4b with SMTP id 006d021491bc7-696979cbddfmr5538431eaf.5.1777929530625;
 Mon, 04 May 2026 14:18:50 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:10 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-18-coltonlewis@google.com>
Subject: [PATCH v7 17/20] KVM: arm64: Add vCPU device attr to partition the PMU
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
X-CRM114-CacheID: sfid-20260504_141854_067937_44960726 
X-CRM114-Status: GOOD (  21.34  )
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

Add a new PMU device attr to enable the partitioned PMU for a given
VM. This capability can be set when the PMU is initially configured
before the vCPU starts running and is allowed where PMUv3 and VHE are
supported and the host driver was configured with
arm_pmuv3.reserved_host_counters.

The enabled capability is tracked by the new flag
KVM_ARCH_FLAG_PARTITION_PMU_ENABLED.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/include/uapi/asm/kvm.h |  2 ++
 arch/arm64/kvm/pmu-direct.c       | 35 ++++++++++++++++++++++++++++---
 arch/arm64/kvm/pmu.c              | 14 +++++++++++++
 include/kvm/arm_pmu.h             |  9 ++++++++
 5 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 891433fe304ac..22b3985b978de 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -353,6 +353,8 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
 	/* Unhandled SEAs are taken to userspace */
 #define KVM_ARCH_FLAG_EXIT_SEA				11
+	/* Partitioned PMU Enabled */
+#define KVM_ARCH_FLAG_PARTITION_PMU_ENABLED		12
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index a792a599b9d68..3e0b7619f781d 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -436,6 +436,8 @@ enum {
 #define   KVM_ARM_VCPU_PMU_V3_FILTER		2
 #define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
 #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
+#define   KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION	5
+
 #define KVM_ARM_VCPU_TIMER_CTRL		1
 #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
 #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 9693d9eb69daa..47fd143cf4ac7 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -44,8 +44,8 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
 }
 
 /**
- * kvm_vcpu_pmu_is_partitioned() - Determine if given VCPU has a partitioned PMU
- * @vcpu: Pointer to kvm_vcpu struct
+ * kvm_pmu_is_partitioned() - Determine if given VCPU has a partitioned PMU
+ * @kvm: Pointer to kvm_vcpu struct
  *
  * Determine if given VCPU has a partitioned PMU by extracting that
  * field and passing it to :c:func:`kvm_pmu_is_partitioned`
@@ -55,7 +55,36 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
 {
 	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu) &&
-		false;
+		test_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &vcpu->kvm->arch.flags);
+}
+
+/**
+ * has_kvm_pmu_partition_support() - If we can enable/disable partition
+ *
+ * Return: true if allowed, false otherwise.
+ */
+bool has_kvm_pmu_partition_support(void)
+{
+	return has_host_pmu_partition_support() &&
+		kvm_supports_guest_pmuv3() &&
+		armv8pmu_is_partitioned;
+}
+
+/**
+ * kvm_pmu_partition_enable() - Enable/disable partition flag
+ * @kvm: Pointer to vcpu
+ * @enable: Whether to enable or disable
+ *
+ * If we want to enable the partition, the guest is free to grab
+ * hardware by accessing PMU registers. Otherwise, the host maintains
+ * control.
+ */
+void kvm_pmu_partition_enable(struct kvm *kvm, bool enable)
+{
+	if (enable)
+		set_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
+	else
+		clear_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
 }
 
 /**
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index f1c66ce678840..add5e7da830b2 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -759,6 +759,19 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 
 		return kvm_arm_pmu_v3_set_nr_counters(vcpu, n);
 	}
+	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION: {
+		unsigned int __user *uaddr = (unsigned int __user *)(long)attr->addr;
+		bool enable;
+
+		if (get_user(enable, uaddr))
+			return -EFAULT;
+
+		if (!has_kvm_pmu_partition_support())
+			return -EPERM;
+
+		kvm_pmu_partition_enable(kvm, enable);
+		return 0;
+	}
 	case KVM_ARM_VCPU_PMU_V3_INIT:
 		return kvm_arm_pmu_v3_init(vcpu);
 	}
@@ -798,6 +811,7 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 	case KVM_ARM_VCPU_PMU_V3_FILTER:
 	case KVM_ARM_VCPU_PMU_V3_SET_PMU:
 	case KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS:
+	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION:
 		if (kvm_vcpu_has_pmu(vcpu))
 			return 0;
 	}
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 4af8abf2dde0f..131c4b8eec194 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -107,6 +107,8 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
 
 void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu);
+bool has_kvm_pmu_partition_support(void);
+void kvm_pmu_partition_enable(struct kvm *kvm, bool enable);
 
 #if !defined(__KVM_NVHE_HYPERVISOR__)
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
@@ -295,6 +297,13 @@ static inline u64 kvm_pmu_guest_counter_mask(void *kvm)
 
 static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
 
+static inline bool has_kvm_pmu_partition_support(void)
+{
+	return false;
+}
+
+static inline void kvm_pmu_partition_enable(struct kvm *kvm, bool enable) {}
+
 #endif
 
 #endif
-- 
2.54.0.545.g6539524ca2-goog


