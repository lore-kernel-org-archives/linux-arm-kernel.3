Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B6CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYf1NlmF8/QTGj97Qxw1rCkue71OyUvLh0xkN4pVh4E=; b=VM78X+uNGrvbssUb3gtKj3racX
	UnWO3c/TCL6Gq/e2THpsocYF3ytyayStL8arwyWRKRsj71zoCv2CxbKYvFn2VuvtSD4zdl9UmW0j4
	mhN5fsV1PBxuw/yMWfKYLO8uH+6zOlhIDPOwy8q6YZLqaPbIJEv1vk6W4EMATJpKBPzPPs2SKReMq
	D88IobWvqMaPWFGRb5enAqQ7OMW9Qt9Gr9JHW7QHr9X798KLFktzSjnOtqC/BX8vCHujIjrep3UQi
	/+ZuUk+VdxI9Z7xJH4uiOqCWqg9z3qvuvQYNhfctBIq6VexboSd9aRuPE2qgBigbwLmvrXcDNnNtQ
	o+bv6ciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSr9-00000003ZUD-3vWb;
	Mon, 14 Jul 2025 23:45:11 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS9F-00000003SaB-3s6W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:51 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3e0513ec553so109270995ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533989; x=1753138789; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kYf1NlmF8/QTGj97Qxw1rCkue71OyUvLh0xkN4pVh4E=;
        b=mEmM/qjWhQcLedrVZRn+W2Qcnt6j+mRlus7k+Nnp1P1btPUDJ4PQ8Q9glTRnxOlHJg
         8Q6WwuzCSv36dvDfv5tI+BHWeg7nEnhsOMsz6fJ+l4lLSMv2zhPqHflln079cHktZA6q
         wqfPhCUOHKHBYVEMhLduX/QlYxEEw3EweFw2LfQwb02b6FccINJCtz7EP/BPsE5wvlHm
         9iDBKiKawjEugY4FXEyUSSGo3DLnq06azT0qDMgjWqYI9MM391JaN4WOmALIv+oJO4nt
         PTVdUwmNm/QN0AoBDpwXthQD1cxL3DHHixUwQ5CyKxQoPASRiqIoK2pN5gIIXXFXwbtm
         6Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533989; x=1753138789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYf1NlmF8/QTGj97Qxw1rCkue71OyUvLh0xkN4pVh4E=;
        b=kMCeQn1HrSvQTScNJzXNNnK5fT3xNp0YbghKT5ns88ZdJVELvF+mhXF55BghTo6aCV
         qgvlS6I2G8MQ9Vnuxh0k5cwbTUCIO8DEZ1u/A43Ekn8iyLiWorlRpQrgLEWJyWySEnxq
         3nf0aYsSPXAlK8VxesA14iXrKxl0h8JhNdSYqiEPVk9zqjcW0vrMfIL3vdlt0csZkZgF
         a+6kZrDKFFbpQRKzEgQR3BvxdVkQr8Lm5oAzXoZBnsrqBlHehSDEinTNRug5GfUqxnUS
         ADG6c+qEC8B1+QKQ+Uw5Tjoe++EIETVVsquU3x9K1dUQ6UBCpVjl+Jh63qVBY7ajWmQE
         4+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUoL0/BGs15By11mgyu4hVvhYjbyuUcdTDPEpARVWpw+jjOmEA/ROxu3Yqi1uwMXRWXSbdbSEFB3QwOsLJewQoa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz24PhHHJq+prG+ibIe7Z33t/32vR9/0127J6A7kJbc0boRsi6n
	HludwhcO0sLmiSJpv+eCG0qWDyF5u5v5t6jYbm1On6qOcgbobHDRyxxHg24BfHc4mZxUAGSfXGw
	o6fXyWfK/cB2LMIb6lvi71WSjdA==
X-Google-Smtp-Source: AGHT+IEqn9WMczkmgGJMqe3Pfe69AM+/PU1iKi1PXg3+tmFjAie5sPccK6SXrZKFiKE60xITkz3trTASZ14i+omdNw==
X-Received: from ilos18.prod.google.com ([2002:a92:cb12:0:b0:3df:53d6:5d35])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3388:b0:3df:3d1a:2e76 with SMTP id e9e14a558f8ab-3e255571390mr143216325ab.1.1752533989026;
 Mon, 14 Jul 2025 15:59:49 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:12 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-19-coltonlewis@google.com>
Subject: [PATCH v4 18/23] KVM: arm64: Extract enum debug_owner to enum vcpu_register_owner
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
X-CRM114-CacheID: sfid-20250714_155949_962092_6F192B61 
X-CRM114-Status: GOOD (  15.67  )
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

The concept of a register or set of registers being owned by the host,
guest, or neither and choosing how to handle traps based on that state
applies equally well to PMU registers as other debug registers.

Extract the enum debug_owner previously defined inside struct
kvm_vcpu_arch to it's own type and add a the field to struct kvm_pmu
as well.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h         | 12 ++++--------
 arch/arm64/include/asm/kvm_pmu.h          |  1 +
 arch/arm64/include/asm/kvm_types.h        |  7 ++++++-
 arch/arm64/kvm/debug.c                    |  8 ++++----
 arch/arm64/kvm/hyp/include/hyp/debug-sr.h |  6 +++---
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 463dbf7f0821..21e32d7fa19b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -846,11 +846,7 @@ struct kvm_vcpu_arch {
 	struct kvm_guest_debug_arch external_debug_state;
 	u64 external_mdscr_el1;
 
-	enum {
-		VCPU_DEBUG_FREE,
-		VCPU_DEBUG_HOST_OWNED,
-		VCPU_DEBUG_GUEST_OWNED,
-	} debug_owner;
+	enum vcpu_register_owner debug_owner;
 
 	/* VGIC state */
 	struct vgic_cpu vgic_cpu;
@@ -1467,11 +1463,11 @@ void kvm_debug_handle_oslar(struct kvm_vcpu *vcpu, u64 val);
 	(!!(__vcpu_sys_reg(vcpu, OSLSR_EL1) & OSLSR_EL1_OSLK))
 
 #define kvm_debug_regs_in_use(vcpu)		\
-	((vcpu)->arch.debug_owner != VCPU_DEBUG_FREE)
+	((vcpu)->arch.debug_owner != VCPU_REGISTER_FREE)
 #define kvm_host_owns_debug_regs(vcpu)		\
-	((vcpu)->arch.debug_owner == VCPU_DEBUG_HOST_OWNED)
+	((vcpu)->arch.debug_owner == VCPU_REGISTER_HOST_OWNED)
 #define kvm_guest_owns_debug_regs(vcpu)		\
-	((vcpu)->arch.debug_owner == VCPU_DEBUG_GUEST_OWNED)
+	((vcpu)->arch.debug_owner == VCPU_REGISTER_GUEST_OWNED)
 
 int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
 			       struct kvm_device_attr *attr);
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 4f0741bf6779..58c1219adf54 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -38,6 +38,7 @@ struct kvm_pmu {
 	int irq_num;
 	bool created;
 	bool irq_level;
+	enum vcpu_register_owner owner;
 };
 
 struct arm_pmu_entry {
diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
index 9a126b9e2d7c..1d951fb1ad78 100644
--- a/arch/arm64/include/asm/kvm_types.h
+++ b/arch/arm64/include/asm/kvm_types.h
@@ -4,5 +4,10 @@
 
 #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
 
-#endif /* _ASM_ARM64_KVM_TYPES_H */
+enum vcpu_register_owner {
+	VCPU_REGISTER_FREE,
+	VCPU_REGISTER_HOST_OWNED,
+	VCPU_REGISTER_GUEST_OWNED,
+};
 
+#endif /* _ASM_ARM64_KVM_TYPES_H */
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 8ae9d141cad4..fa8b4f846b68 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -161,7 +161,7 @@ void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu)
 	 *    context needs to be loaded on the CPU.
 	 */
 	if (vcpu->guest_debug || kvm_vcpu_os_lock_enabled(vcpu)) {
-		vcpu->arch.debug_owner = VCPU_DEBUG_HOST_OWNED;
+		vcpu->arch.debug_owner = VCPU_REGISTER_HOST_OWNED;
 		setup_external_mdscr(vcpu);
 
 		/*
@@ -183,9 +183,9 @@ void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu)
 		mdscr = vcpu_read_sys_reg(vcpu, MDSCR_EL1);
 
 		if (mdscr & (MDSCR_EL1_KDE | MDSCR_EL1_MDE))
-			vcpu->arch.debug_owner = VCPU_DEBUG_GUEST_OWNED;
+			vcpu->arch.debug_owner = VCPU_REGISTER_GUEST_OWNED;
 		else
-			vcpu->arch.debug_owner = VCPU_DEBUG_FREE;
+			vcpu->arch.debug_owner = VCPU_REGISTER_FREE;
 	}
 
 	kvm_arm_setup_mdcr_el2(vcpu);
@@ -222,7 +222,7 @@ void kvm_debug_set_guest_ownership(struct kvm_vcpu *vcpu)
 	if (kvm_host_owns_debug_regs(vcpu))
 		return;
 
-	vcpu->arch.debug_owner = VCPU_DEBUG_GUEST_OWNED;
+	vcpu->arch.debug_owner = VCPU_REGISTER_GUEST_OWNED;
 	kvm_arm_setup_mdcr_el2(vcpu);
 }
 
diff --git a/arch/arm64/kvm/hyp/include/hyp/debug-sr.h b/arch/arm64/kvm/hyp/include/hyp/debug-sr.h
index 502a5b73ee70..048234439a41 100644
--- a/arch/arm64/kvm/hyp/include/hyp/debug-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/debug-sr.h
@@ -91,12 +91,12 @@
 static struct kvm_guest_debug_arch *__vcpu_debug_regs(struct kvm_vcpu *vcpu)
 {
 	switch (vcpu->arch.debug_owner) {
-	case VCPU_DEBUG_FREE:
+	case VCPU_REGISTER_FREE:
 		WARN_ON_ONCE(1);
 		fallthrough;
-	case VCPU_DEBUG_GUEST_OWNED:
+	case VCPU_REGISTER_GUEST_OWNED:
 		return &vcpu->arch.vcpu_debug_state;
-	case VCPU_DEBUG_HOST_OWNED:
+	case VCPU_REGISTER_HOST_OWNED:
 		return &vcpu->arch.external_debug_state;
 	}
 
-- 
2.50.0.727.gbf7dc18ff4-goog


