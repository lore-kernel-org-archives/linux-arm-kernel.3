Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C634C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6oERwEX9ihIeJP2v6QxDWL9BHMEBqaouPjaqIFm6Iw=; b=Bpo+J9jIbXpWAPmzq/Ba+ImDkF
	WwEmq4b8fUyw2CCek+RX3hvahhnhNSRku+f3PUsctWx1GzA4JPSXPvVldK/rgsyNw1AZ5stlnUC+3
	v1asVVrLoGK+Y4ybX9FpGASOG/W/YJjnoGRjJLx9ON4yH7rVg30FKlRgD0hytWyC2KGcQr7cGdR9a
	1q484SH3KEf7AwnZ8sPSBsyyZwoLrkYimZcb435vC9SV5rJI7expYikAY6Ny6Zh3fbWL+Olzgsvit
	asrLXCZ3nCTthQipIW7wj/vK6awjxoMAQ0QXY7xy5xWAozhdIGOMgmfyhmY8pTHelSmyRS3IGCk0p
	2W9F4ICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xE-0000000HFeG-3BYp;
	Fri, 13 Jun 2025 18:16:40 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6i9-0000000Gxnr-2ia6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:52:58 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-86d0daf3b2cso468641639f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 08:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749829976; x=1750434776; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R6oERwEX9ihIeJP2v6QxDWL9BHMEBqaouPjaqIFm6Iw=;
        b=oE+ncYfC1LTWo2g5llYf2XZGqWGHCBKY2fFLMg2Mgy1gOEZjxUW85NY2rpVaf/Ba29
         UWZXg5y5mw/Nsjk0GLx28N6gM6rG0uroGq8ynBf+7il9FG612Sl4KaPPphA1vtwb6e9U
         eYmm/PaFsXMjqI/wMmFxmQGycesrNp9I1mSrV7PZ38TVrYjlIo1SLmuWklMTYVHDivry
         4O/pZzBU4YvbaCWfruFImwh4Cyge4oB8lvtCtKoSkNfE89qkCaxYYGHwYRC1GGc0PEWP
         lRXOAVYDSuGIXfzsRUQVwYsEIHNXzT+dSy2yVJ2mgFV06vtIZ/gRASO3be2IiSQcJgJt
         Ecdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829976; x=1750434776;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6oERwEX9ihIeJP2v6QxDWL9BHMEBqaouPjaqIFm6Iw=;
        b=qZGT2Fl3lIK8DfAqTsTFYaxxLRDY77gWCV11Vc7GNYTLBPvNyfesox+eXif3HsykCz
         ISBpmVV0SY2PrBVscgEfnzN+82VBFkwkZSsihbfEdb9NO9fLediC4Aga+5nn8oOdPHB3
         bSIyTfxghFlspxxMFMlEggm+UEHTZR9rGTJx7HA7s65dTe5xIJPiH2DhYDF4USeFV3Sw
         04jdMjLWVLfzxORI8dnCocmr/5EZ5+INNUMNAB1VJBC8F3+90dciHnbkISnhgvP0HTaq
         CTIeYlz/UGBKe2ylanqv9H0ymTlU9FqkTJ6ffAt1otOWj7tctbI6c3Rkxp4Iaa+MnQ2N
         9otA==
X-Forwarded-Encrypted: i=1; AJvYcCW2e0OkXQDs2ADjWivUpVN+AawNl2AJYnjg2MzmbVXMGjXu9ad2sKfJN6p3LQJp9ejcHKNa8m4e18/GenKjJmUa@lists.infradead.org
X-Gm-Message-State: AOJu0YyDSYVTIPqSfylplo0woNdy3RPd+yDDg612fCtqm9HSHCnDg9La
	QZ3gAe1jnBovjPHznyLXKuSk9pJRyXKHNct2fgeD7CU7Vf8ON7+iBApvbn434R73WIYFBL1X00u
	Ji/COjqVb7g==
X-Google-Smtp-Source: AGHT+IHQ02cONRw6pm1YF1fpfHYYr8pmJ6vodarmPvsSB72Fz6jp9DIzeYQOuK2lpV+1OvcWdDYWazQgvwWV
X-Received: from iobbr11.prod.google.com ([2002:a05:6602:388b:b0:867:6d21:ab61])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:29a9:b0:864:4a1b:dfc5
 with SMTP id ca18e2360f4ac-875d3d2c717mr392436439f.9.1749829965739; Fri, 13
 Jun 2025 08:52:45 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:52:37 +0000
In-Reply-To: <20250613155239.2029059-1-rananta@google.com>
Mime-Version: 1.0
References: <20250613155239.2029059-1-rananta@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250613155239.2029059-4-rananta@google.com>
Subject: [PATCH v3 3/4] KVM: arm64: Introduce attribute to control GICD_TYPER2.nASSGIcap
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085257_690700_2139CC16 
X-CRM114-Status: GOOD (  24.27  )
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

KVM unconditionally advertises GICD_TYPER2.nASSGIcap (which internally
implies vSGIs) on GICv4.1 systems. Allow userspace to change whether a
VM supports the feature. Only allow changes prior to VGIC initialization
as at that point vPEs need to be allocated for the VM.

For convenience, bundle support for vLPIs and vSGIs behind this feature,
allowing userspace to control vPE allocation for VMs in environments
that may be constrained on vPE IDs.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 .../virt/kvm/devices/arm-vgic-v3.rst          | 29 +++++++++++++++
 arch/arm64/include/uapi/asm/kvm.h             |  3 ++
 arch/arm64/kvm/vgic/vgic-init.c               |  3 ++
 arch/arm64/kvm/vgic/vgic-kvm-device.c         | 37 +++++++++++++++++++
 arch/arm64/kvm/vgic/vgic-mmio-v3.c            | 10 ++++-
 arch/arm64/kvm/vgic/vgic-v3.c                 |  5 ++-
 arch/arm64/kvm/vgic/vgic-v4.c                 |  2 +-
 include/kvm/arm_vgic.h                        |  3 ++
 8 files changed, 88 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v3.rst b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
index e860498b1e35..049d77eae591 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-v3.rst
+++ b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
@@ -306,3 +306,32 @@ Groups:
 
     The vINTID specifies which interrupt is generated when the vGIC
     must generate a maintenance interrupt. This must be a PPI.
+
+  KVM_DEV_ARM_VGIC_GRP_FEATURES
+   Attributes:
+
+    KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap
+      Control whether support for SGIs without an active state is exposed
+      to the VM. attr->addr points to a __u8 value which indicates whether
+      he feature is enabled / disabled.
+
+      A value of 0 indicates that the feature is disabled. A nonzero value
+      indicates that the feature is enabled.
+
+      This attribute can only be set prior to initializing the VGIC (i.e.
+      KVM_DEV_ARM_VGIC_CTRL_INIT).
+
+      Support for SGIs without an active state depends on hardware support.
+      Userspace can discover support for the feature by reading the
+      attribute after creating a VGICv3. It is possible that
+      KVM_DEV_ARM_VGIC_CTRL_INIT can later fail if this feature is enabled
+      and KVM is unable to allocate GIC vPEs for the VM.
+
+  Errors:
+
+    =======  ========================================================
+    -ENXIO   Invalid attribute in attr->attr
+    -EFAULT  Invalid user address in attr->addr
+    -EBUSY   The VGIC has already been initialized
+    -EINVAL  KVM doesn't support the requested feature setting
+    =======  ========================================================
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index ed5f3892674c..41e9ce412afd 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -417,6 +417,7 @@ enum {
 #define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO  7
 #define KVM_DEV_ARM_VGIC_GRP_ITS_REGS 8
 #define KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ  9
+#define KVM_DEV_ARM_VGIC_GRP_FEATURES 10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
 			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
@@ -429,6 +430,8 @@ enum {
 #define   KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES	3
 #define   KVM_DEV_ARM_ITS_CTRL_RESET		4
 
+#define   KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap	0
+
 /* Device Control API on vcpu fd */
 #define KVM_ARM_VCPU_PMU_V3_CTRL	0
 #define   KVM_ARM_VCPU_PMU_V3_IRQ		0
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 5e0e4559004b..944e24750ac4 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -157,6 +157,9 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 
 	kvm->arch.vgic.in_kernel = true;
 	kvm->arch.vgic.vgic_model = type;
+	if (type == KVM_DEV_TYPE_ARM_VGIC_V3)
+		kvm->arch.vgic.nassgicap = kvm_vgic_global_state.has_gicv4_1 &&
+					   gic_cpuif_has_vsgi();
 
 	kvm->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
 
diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index e28cf68a49c3..629f56063a13 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -626,6 +626,26 @@ static int vgic_v3_set_attr(struct kvm_device *dev,
 		dev->kvm->arch.vgic.mi_intid = val;
 		return 0;
 	}
+	case KVM_DEV_ARM_VGIC_GRP_FEATURES: {
+		u8 __user *uaddr = (u8 __user *)attr->addr;
+		u8 val;
+
+		if (attr->attr != KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap)
+			return -ENXIO;
+
+		if (get_user(val, uaddr))
+			return -EFAULT;
+
+		guard(mutex)(&dev->kvm->arch.config_lock);
+		if (vgic_initialized(dev->kvm))
+			return -EBUSY;
+
+		if (!(kvm_vgic_global_state.has_gicv4_1 && gic_cpuif_has_vsgi()) && val)
+			return -EINVAL;
+
+		dev->kvm->arch.vgic.nassgicap = val;
+		return 0;
+	}
 	default:
 		return vgic_set_common_attr(dev, attr);
 	}
@@ -646,6 +666,17 @@ static int vgic_v3_get_attr(struct kvm_device *dev,
 		guard(mutex)(&dev->kvm->arch.config_lock);
 		return put_user(dev->kvm->arch.vgic.mi_intid, uaddr);
 	}
+	case KVM_DEV_ARM_VGIC_GRP_FEATURES: {
+		u8 __user *uaddr = (u8 __user *)attr->addr;
+		u8 val;
+
+		if (attr->attr != KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap)
+			return -ENXIO;
+
+		guard(mutex)(&dev->kvm->arch.config_lock);
+		val = dev->kvm->arch.vgic.nassgicap;
+		return put_user(val, uaddr);
+	}
 	default:
 		return vgic_get_common_attr(dev, attr);
 	}
@@ -683,8 +714,14 @@ static int vgic_v3_has_attr(struct kvm_device *dev,
 			return 0;
 		case KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES:
 			return 0;
+		default:
+			return -ENXIO;
 		}
+	case KVM_DEV_ARM_VGIC_GRP_FEATURES:
+		return attr->attr != KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap ?
+		       -ENXIO : 0;
 	}
+
 	return -ENXIO;
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 1a9c5b4418b2..43f59e70e1a2 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -50,12 +50,20 @@ bool vgic_has_its(struct kvm *kvm)
 
 bool vgic_supports_direct_msis(struct kvm *kvm)
 {
+	/*
+	 * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
+	 * indirectly allowing userspace to control whether or not vPEs are
+	 * allocated for the VM.
+	 */
+	if (kvm_vgic_global_state.has_gicv4_1 && !vgic_supports_direct_sgis(kvm))
+		return false;
+
 	return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
 }
 
 bool vgic_supports_direct_sgis(struct kvm *kvm)
 {
-	return kvm_vgic_global_state.has_gicv4_1 && gic_cpuif_has_vsgi();
+	return kvm->arch.vgic.nassgicap;
 }
 
 /*
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index b9ad7c42c5b0..cb6bda9b3c6c 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -404,7 +404,8 @@ int vgic_v3_save_pending_tables(struct kvm *kvm)
 	 * The above vgic initialized check also ensures that the allocation
 	 * and enabling of the doorbells have already been done.
 	 */
-	if (kvm_vgic_global_state.has_gicv4_1) {
+	if (kvm_vgic_global_state.has_gicv4_1 &&
+	    vgic_supports_direct_irqs(kvm)) {
 		unmap_all_vpes(kvm);
 		vlpi_avail = true;
 	}
@@ -581,7 +582,7 @@ int vgic_v3_map_resources(struct kvm *kvm)
 		return -EBUSY;
 	}
 
-	if (kvm_vgic_global_state.has_gicv4_1)
+	if (vgic_supports_direct_sgis(kvm))
 		vgic_v4_configure_vsgis(kvm);
 
 	return 0;
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index e7e284d47a77..25e9da9e7a2d 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -245,7 +245,7 @@ int vgic_v4_init(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (!kvm_vgic_global_state.has_gicv4)
+	if (!vgic_supports_direct_irqs(kvm))
 		return 0; /* Nothing to see here... move along. */
 
 	if (dist->its_vm.vpes)
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 4a34f7f0a864..1b4886f3fb20 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -264,6 +264,9 @@ struct vgic_dist {
 	/* distributor enabled */
 	bool			enabled;
 
+	/* Supports SGIs without active state */
+	bool			nassgicap;
+
 	/* Wants SGIs without active state */
 	bool			nassgireq;
 
-- 
2.50.0.rc2.692.g299adb8693-goog


