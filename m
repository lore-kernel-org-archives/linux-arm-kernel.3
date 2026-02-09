Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F69CE9461B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8vsvPCwrm4qK2tJSRhYymVMX8OUXdkNYkDGMZ9conM=; b=lYj2pWRsTRrxdPAubxZhx6CqHD
	gsw8Nk+z8cnxIB0tR7aKsJ5gc0B9nwUoQeLeFqkEKYD977evoW1HEUwnVZ4dJVRslAqisLuiCgArL
	tZc3xcsbTlXT0uk7C48Zjue5gA7A4W6bet/9yO4iCsRuc/n3xiR2DmXEosKjIJt7/Hyt3WNfEHIDg
	6uDD+iHOAnrc4gAoZNv44fW5xmfmEWCfzFLBH2bt0MhETXmHQdLu+nSuMHUMjBciCampQwpel9/TQ
	5MjMTPDnnOasl/uJX2zStDZWyRUMJ2d5kZW17ZkIEaTj5aFtUho2qmo49s1La59I0Leq0IzgIv/Ra
	JCc4UbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwb-0000000G7tY-3A84;
	Mon, 09 Feb 2026 22:41:25 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwG-0000000G7R9-34xa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:41:05 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-672c40f3873so911836eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676862; x=1771281662; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I8vsvPCwrm4qK2tJSRhYymVMX8OUXdkNYkDGMZ9conM=;
        b=VvTaUWBklUq+n9iJvc23ylHChIpn/+Cy+wH557RnSKDs2XsYW4x9KFzlcosrRyh/LI
         6rtCK2kIhMdg2soGw25qQjktkCbl77yHyfnsVfKgw5GdOkgEDwmDVI6pfxGfBo33dhh0
         5UZhva8BrHDGJIxvPLUh1Oq3vEV6cPkfite0JLO+WBsNv9CwtSzCClLr/2SQilFOJ23V
         BwdxYoHHsvgzI5LKpvXGg/KA7Zu7aqKExm/c9loObazxhdQleFPRnGXfMPF+Ytagbala
         PQk7PCs2aJwf9tjGc3drqXoVOeMa6sdeOvYgMfcZ7+SU02xRLlwwyZIoJh7nKGpl1yG4
         CAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676862; x=1771281662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8vsvPCwrm4qK2tJSRhYymVMX8OUXdkNYkDGMZ9conM=;
        b=W2fCE4SLW8AX9mnh+bztNwrYSQPxBm4fRtO2ieyOgWcZVfFvVSwIykGZSBDR/d8f3h
         IBQo4IFvp4rZwLx4e750Jgj0Olz4nTmnLEJSNWfXX6R66T+AY1Nz8ZPxS32256iIT34X
         3xxp4aNPCry+/4569gGMyUNUSUnjCDxjvj5woIBgeI3Uy7HVVofaUqREsgBKrR37kIVq
         RLoqLG7qRJxFJLo3HOAdroOkyXwFcaJhXDkF23B5s8pAVXFOlk67GZSr9FxsiIRQDe7f
         7WQs7VpbOk5JtWljbkcCj4Agfr+O4+ao8oRl4TDONbPUhJsTfp5d64XbSc8YRr8tuWg5
         IgJg==
X-Forwarded-Encrypted: i=1; AJvYcCU6okhgDaB6CCawypybtWEw+fP7MpjVuEPG7EtSYEhvLmjZitxiFMSxbCA6t6bP1HTbouYCuTj94vroSzDBYKLB@lists.infradead.org
X-Gm-Message-State: AOJu0YxJy3PEhIJeQhrvc8PSNGNpc2gzKOPIQPZEL/rfhyA37HFJoAkm
	2qCTGoNVa7xsVGAEf0qpxKq40LWjWXkNzepvKDLi6gqL9t8KkWUJeEHa1SSqwu7xFnBkmJ8q4bc
	A9RuVbFl46jZFkPEY4klVGE3Mtw==
X-Received: from iomv22.prod.google.com ([2002:a5e:d716:0:b0:957:5d25:584])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1622:b0:662:f8f6:e8d1 with SMTP id 006d021491bc7-66d09ac24cdmr6817429eaf.6.1770676861761;
 Mon, 09 Feb 2026 14:41:01 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:11 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-17-coltonlewis@google.com>
Subject: [PATCH v6 16/19] KVM: arm64: Add vCPU device attr to partition the PMU
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
X-CRM114-CacheID: sfid-20260209_144104_792837_BEB1A618 
X-CRM114-Status: GOOD (  21.85  )
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
KVM_ARCH_FLAG_PARTITIONED_PMU_ENABLED.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/include/uapi/asm/kvm.h |  2 ++
 arch/arm64/kvm/pmu-direct.c       | 35 ++++++++++++++++++++++++++++---
 arch/arm64/kvm/pmu.c              | 14 +++++++++++++
 include/kvm/arm_pmu.h             |  9 ++++++++
 5 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 41577ede0254f..f0b0a5edc7252 100644
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
index 6ebb59d2aa0e7..1dbf50b8891f6 100644
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
+		armv8pmu_max_guest_counters > -1;
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
index 72d5b7cb3d93e..cdf51f24fdaf3 100644
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
index 93586691a2790..ff898370fa63f 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -109,6 +109,8 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
 
 void kvm_pmu_set_physical_access(struct kvm_vcpu *vcpu);
+bool has_kvm_pmu_partition_support(void);
+void kvm_pmu_partition_enable(struct kvm *kvm, bool enable);
 
 #if !defined(__KVM_NVHE_HYPERVISOR__)
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
@@ -311,6 +313,13 @@ static inline void kvm_pmu_host_counters_enable(void) {}
 static inline void kvm_pmu_host_counters_disable(void) {}
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
2.53.0.rc2.204.g2597b5adb4-goog


