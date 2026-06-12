Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4C0CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMUfkA0Qvrb7iW5rl1K95T0ct8KyLE0h2lxpS+ugXRA=; b=BBL+v4Ab3sCA1YSHWNlW+0zvhv
	uUx5+mCGNrnWoPv8AvbYqCSKDs162zUAMBkyp0Q3Ljx87ERFqbVfj8Vcjkl/bS5y04RJ/F12RAt+y
	UI6pFhv92WPh47RHz6BXk+ISjRPO5KNfMcq3K0ya2QQLWSxutrLNuiFbfTmTXayAO2Z6GkzwmuZyo
	a6yMogXMmsJxVQW0eqZa0lRbw9rFcGi9vQg7hxNuIn/fqpGrQ71D/wC9oZ2CreeSsK08oGQuDQucv
	Psy+ZvtAJ2V4RizbBO8M57LrsaIj2k9Ip6kOCAxvObZWg/Cq9vWpKivzfs+BQ38WWcUMf1hqcEDFF
	e/RutwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZQ-0000000BSkP-1tES;
	Fri, 12 Jun 2026 19:29:36 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZI-0000000BSW8-2Nph
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:30 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-486db2bf46eso1551078b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292567; x=1781897367; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xMUfkA0Qvrb7iW5rl1K95T0ct8KyLE0h2lxpS+ugXRA=;
        b=tKQlh4aMWKl1ERO13pMjKdQqgr2NO2v2FdDZnsiLizVTJDNG207FNFqQDR/syx0l+K
         fnhbkg+axQjAdgVSkCXJPRX8xPTkhQ8r+E+nZY50sY8R/Hp4Vz035vYLEGzE6zW+Xgei
         +IxbmL70H0numFb0Fefn6gvZNdEaSdS+r6zW3CJAZ3RAcPrDk0K26X7w7XcBvqQ3DMWw
         evpxPuEud9VVEY9LugADovTfgfHtjar8RGzd4J/gkLFHJ9MbNNNj4o6xFhO0MY+qI3/p
         eKV1nuIPUt+Id4K0/mDjq0IGUfPz9/6FoFVWoBxXbEwRL3vDTAOtBqHXsoB/Gu4lfFCq
         Z51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292567; x=1781897367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMUfkA0Qvrb7iW5rl1K95T0ct8KyLE0h2lxpS+ugXRA=;
        b=BMfgy0WEag741Xtecbihjyy9Ucu+ZUjVItdR34PPfdNTmLTbqSKe411A/MQ2TjSD3L
         HFf1iUeOyYe5r6jr1WjA7U/gm/OLB/OgTekdhi9ybj5cIeT+GxtnyAiWCHe6j5fJOTL9
         srXXQnNN/lZwICwVYzO0a3LjG3calYlSe2cGq+DsVFp1yqcE1Melo9WHkiQirR9nVGXS
         mlofLO27nZx+33g8ht7cQurbC5i1/g/nPN6p7eEAomWdzZgtwvH8mRjnpbVkw2cHB3Pf
         crd2s4eTuL1a7EHAZdOAbNM3a3jKleY9ClKjph0gRTaMkjBFfYy7Pk3BT56xXxFh0WaP
         ahRg==
X-Forwarded-Encrypted: i=1; AFNElJ9yzlr7+aoFQS+rKdcStaf9QMzFkQ5eJ8spSNWJ5fFFep7lxdWOLR0xRqXK3c4PG6QWGC9/ZRwxeOcGmE+NG08p@lists.infradead.org
X-Gm-Message-State: AOJu0YzB78BjZaVskhpk8CuDNCm1OBS3U+6gNVKJt+N2IUrcRxmRVJNN
	qR7oxucRg3YKF+6+0xFbc5KDGk45Q96ZOOMFFqZJw7/7Q/VQGw4owC8rQwLILbRqffSjuTGs/kM
	DP4S+Q65DLT64ybFtbpngG4QqUA==
X-Received: from ilbdx1-n1.prod.google.com ([2002:a05:6e02:4201:10b0:4fa:1e84:4047])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:170f:b0:485:15bd:60e8 with SMTP id 5614622812f47-48741b51368mr655188b6e.35.1781292567145;
 Fri, 12 Jun 2026 12:29:27 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:06 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-19-coltonlewis@google.com>
Subject: [PATCH 18/21] KVM: arm64: Add vCPU device attr to partition the PMU
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_122928_639921_56BA0914 
X-CRM114-Status: GOOD (  18.30  )
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
 arch/arm64/include/uapi/asm/kvm.h |  2 ++
 arch/arm64/kvm/pmu-direct.c       | 30 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu.c              | 23 +++++++++++++++++++++++
 include/kvm/arm_pmu.h             |  9 +++++++++
 4 files changed, 64 insertions(+)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 1c13bfa2d38aa..7f57b8c132925 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -437,6 +437,8 @@ enum {
 #define   KVM_ARM_VCPU_PMU_V3_FILTER		2
 #define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
 #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
+#define   KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION	5
+
 #define KVM_ARM_VCPU_TIMER_CTRL		1
 #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
 #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 0062d1d8e1999..2d2294b78ebe0 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -24,6 +24,36 @@ bool has_host_pmu_partition_support(void)
 		system_supports_pmuv3();
 }
 
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
+}
+
 /**
  * pmu_is_partitioned() - Determine if given PMU is partitioned
  * @pmu: Pointer to arm_pmu struct
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index f5ee18b4dfae7..4e15948ac2565 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -769,6 +769,28 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 
 		return kvm_arm_pmu_v3_set_nr_counters(vcpu, n);
 	}
+	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION: {
+		unsigned int __user *uaddr = (unsigned int __user *)(long)attr->addr;
+		u32 val;
+
+		if (get_user(val, uaddr))
+			return -EFAULT;
+
+		if (!has_kvm_pmu_partition_support())
+			return -EPERM;
+
+		if (kvm_vm_has_ran_once(kvm))
+			return -EBUSY;
+
+		kvm_pmu_partition_enable(kvm, val);
+		if (val) {
+			unsigned int max_counters = kvm_arm_pmu_get_max_counters(kvm);
+
+			if (kvm->arch.nr_pmu_counters > max_counters)
+				kvm_arm_set_nr_counters(kvm, max_counters);
+		}
+		return 0;
+	}
 	case KVM_ARM_VCPU_PMU_V3_INIT:
 		return kvm_arm_pmu_v3_init(vcpu);
 	}
@@ -808,6 +830,7 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 	case KVM_ARM_VCPU_PMU_V3_FILTER:
 	case KVM_ARM_VCPU_PMU_V3_SET_PMU:
 	case KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS:
+	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION:
 		if (kvm_vcpu_has_pmu(vcpu))
 			return 0;
 	}
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index f72d080ee7ba2..6a5572994b7fa 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -99,6 +99,8 @@ bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
 
+bool has_kvm_pmu_partition_support(void);
+void kvm_pmu_partition_enable(struct kvm *kvm, bool enable);
 bool pmu_is_partitioned(struct arm_pmu *pmu);
 bool kvm_pmu_is_partitioned(struct kvm *kvm);
 void kvm_pmu_direct_pmcr_write(struct kvm_vcpu *vcpu, u64 val);
@@ -279,6 +281,13 @@ static inline u64 kvm_pmu_guest_counter_mask(void *kvm)
 
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
2.54.0.1136.gdb2ca164c4-goog


