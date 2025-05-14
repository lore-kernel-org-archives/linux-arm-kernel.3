Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41139C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3MauCW+urlix1RrycVNh0XN4aZXJqzxAZQYVw1ClTM=; b=NYJUBs4Duv2EQ51tQ0eaPNzRQz
	Blko+q0FAm/kEeMfCKzmQ6Qjt4C4o94r2sWU7GaeMIJ1gTPnMx9MCEZNXetmM97/+qSeMh5s694vJ
	wPD1l+TPYVIYvAjC3KWwsaVhqSKVwDAoNgH4an+5iwFP/wkEn1+hNf8q8Uz/0/Ap0gRWGe0A8jT3M
	5SFaCMo/vwExusQnvl8hNHTKOOTkTLF/PR9xXL9SaJ5SiFBAVJqIJojPEN7PYaYsMG8iJrGvE8L1a
	o0Cj0wIt9qY77d+c11t8l+bNLJAOu+PCS92W0mddJGi5uBxhzFdTvWKzcthPcYRr9kn81nxUdhCT8
	PaXxQPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHyv-0000000GCA5-0IMi;
	Wed, 14 May 2025 19:41:33 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHg7-0000000GA0k-3iXn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:22:09 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-85b4dc23f03so16180839f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747250526; x=1747855326; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3MauCW+urlix1RrycVNh0XN4aZXJqzxAZQYVw1ClTM=;
        b=FRMUKjVH+wWUH7GzHCw+aMFBIkSvOM8sRLLqe7zHfQslxA07CCzAuNqmFGZziBy27L
         MwrSpDvZ7SNJHmXP5Xe56FyUgpOGSNmOWL9eiqmaA1syhmVG5hIPZBHZyuRfG/1tnStN
         Vg2varLNeGasMo1VlMoiv3IW0Xx3ENSzhN1KsYhmvhxbE8q0KFbynEhIOBY8EHGuzvIS
         B+YZQL4YB5ThzNH0A0JJDebcg1HvoGzRb5g4ZejRJ4QmPaZimZfbNyPEn2k+wXyEbFIq
         3Af9FOZJU0uQHb1r/0o929310ITcF3KFZvAsqSU8H2eXpuNv6vyWmXTXlHzGIIDR+v1G
         9LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250526; x=1747855326;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3MauCW+urlix1RrycVNh0XN4aZXJqzxAZQYVw1ClTM=;
        b=IhjUoh+ffJVisNu0DeFSykG2updMx9kbWavn3XZCiH23+VfDPDiPQj6TqEcq+URreU
         Z89IzlEq44bcrZgKDpJaXmATbnIJ4vtOQUhe0Fh7stZv07eh2JizOtkVprn3Ul3G+sg8
         g4RYsm4jQDmRZFa2NScDmLmq76a2C4fQZiHNfvlMPLtitqszLZHsg8a/XAuVsu/mfKGn
         yM5m9QI407Eq+9eB4gJbXuGyt/4xl+R1QhTdX+3vgMVbcwEdvaBIRP5Q69NZpwaaAqR6
         lRLhe1kI+Ti2S9ahKElAXhLvVgY516ecJicylm16i4y/xt7b4BCoBsKlYqNEQgvNr63K
         T0iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMp2o8M4bZ3PjyuRyaiLNtq6XZXyZGlFDzMR5WUVGHAs75Fdh3d+0F9crzk3pU4PoSvIDTAMtFMxxy2wRkPacK@lists.infradead.org
X-Gm-Message-State: AOJu0YyC5UeYjOW6aJw+TIQo4uaDN1RJ+trTJvL45qZOyUcW6+GjBUWp
	/MJ4lKsgQe7hmx3jTXx/V78kLQci7niiA/6l8fSUYL2iCC+AwYAP5d8qFB+NkhZ4ftj4T8+vXSU
	grJVUzg==
X-Google-Smtp-Source: AGHT+IEy09eku3jD263yCQYKQ2rr3/0cu+Cf3UzUC6jmBnOz4zk6Mpi7GLuEdzeaZ4KU1bn0EY+ScGzWk8y2
X-Received: from ilsx3.prod.google.com ([2002:a05:6e02:743:b0:3d9:367f:729a])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:3784:b0:3d9:5d50:e3b1
 with SMTP id e9e14a558f8ab-3db6f7f1597mr60756865ab.18.1747250526441; Wed, 14
 May 2025 12:22:06 -0700 (PDT)
Date: Wed, 14 May 2025 19:21:57 +0000
In-Reply-To: <20250514192159.1751538-1-rananta@google.com>
Mime-Version: 1.0
References: <20250514192159.1751538-1-rananta@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514192159.1751538-2-rananta@google.com>
Subject: [PATCH 1/3] kvm: arm64: Add support for KVM_DEV_ARM_VGIC_CONFIG_GICV4 attr
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_122207_926529_67ECB27C 
X-CRM114-Status: GOOD (  26.39  )
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

When kvm-arm.vgic_v4_enable=1, KVM adds support for direct interrupt
injection by default to all the VMs in the system, aka GICv4. A
shortcoming of the GIC architecture is that there's an absolute limit on
the number of vPEs that can be tracked by the ITS. It is possible that
an operator is running a mix of VMs on a system, only wanting to provide
a specific class of VMs with hardware interrupt injection support.

To support this, introduce a GIC attribute, KVM_DEV_ARM_VGIC_CONFIG_GICV4,
for the userspace to enable or disable vGICv4 for a given VM. Make the
interface backward compatible by leaving vGICv4 enabled by default.

Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/include/uapi/asm/kvm.h     |  7 +++++
 arch/arm64/kvm/vgic/vgic-init.c       |  3 +++
 arch/arm64/kvm/vgic/vgic-its.c        |  2 +-
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 39 +++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic-mmio-v3.c    | 12 ++++-----
 arch/arm64/kvm/vgic/vgic-v3.c         | 16 +++++++++--
 arch/arm64/kvm/vgic/vgic-v4.c         |  8 +++---
 include/kvm/arm_vgic.h                |  5 ++++
 8 files changed, 79 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index af9d9acaf997..6762683f7e0f 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -428,6 +428,13 @@ enum {
 #define   KVM_DEV_ARM_ITS_RESTORE_TABLES        2
 #define   KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES	3
 #define   KVM_DEV_ARM_ITS_CTRL_RESET		4
+#define   KVM_DEV_ARM_VGIC_CONFIG_GICV4	5
+
+enum {
+	KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE = 0,
+	KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE,
+	KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE,
+};
 
 /* Device Control API on vcpu fd */
 #define KVM_ARM_VCPU_PMU_V3_CTRL	0
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 1f33e71c2a73..cd345df2271f 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -132,6 +132,9 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 
 	kvm->arch.vgic.in_kernel = true;
 	kvm->arch.vgic.vgic_model = type;
+	kvm->arch.vgic.gicv4_config = kvm_vgic_global_state.has_gicv4 ?
+				      KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE :
+				      KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE;
 
 	kvm->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
 
diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index fb96802799c6..bba635e4e851 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2242,7 +2242,7 @@ static int vgic_its_save_itt(struct vgic_its *its, struct its_device *device)
 		 * have direct access to that state without GICv4.1.
 		 * Let's simply fail the save operation...
 		 */
-		if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
+		if (ite->irq->hw && !kvm_vm_has_gicv4_1(its->dev->kvm))
 			return -EACCES;
 
 		ret = vgic_its_save_ite(its, device, ite, gpa);
diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index 359094f68c23..f03b80fc816e 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -279,6 +279,33 @@ static int vgic_set_common_attr(struct kvm_device *dev,
 			unlock_all_vcpus(dev->kvm);
 			mutex_unlock(&dev->kvm->lock);
 			return r;
+		case KVM_DEV_ARM_VGIC_CONFIG_GICV4: {
+			u8 __user *uaddr = (u8 __user *)(long)attr->addr;
+			u8 val;
+
+			if (!kvm_vgic_global_state.has_gicv4)
+				return -ENXIO;
+
+			if (get_user(val, uaddr))
+				return -EFAULT;
+
+			if (vgic_initialized(dev->kvm) &&
+				val != dev->kvm->arch.vgic.gicv4_config)
+				return -EBUSY;
+
+			switch (val) {
+			case KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE:
+			case KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE:
+				mutex_lock(&dev->kvm->arch.config_lock);
+				dev->kvm->arch.vgic.gicv4_config = val;
+				mutex_unlock(&dev->kvm->arch.config_lock);
+				break;
+			default:
+				return -EINVAL;
+			}
+
+			return 0;
+		}
 		}
 		break;
 	}
@@ -309,6 +336,16 @@ static int vgic_get_common_attr(struct kvm_device *dev,
 		r = put_user(dev->kvm->arch.vgic.mi_intid, uaddr);
 		break;
 	}
+	case KVM_DEV_ARM_VGIC_GRP_CTRL: {
+		switch (attr->attr) {
+		case KVM_DEV_ARM_VGIC_CONFIG_GICV4: {
+			u8 __user *uaddr = (u8 __user *)(long)attr->addr;
+
+			r = put_user(dev->kvm->arch.vgic.gicv4_config, uaddr);
+			break;
+		}
+		}
+	}
 	}
 
 	return r;
@@ -684,6 +721,8 @@ static int vgic_v3_has_attr(struct kvm_device *dev,
 			return 0;
 		case KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES:
 			return 0;
+		case KVM_DEV_ARM_VGIC_CONFIG_GICV4:
+			return 0;
 		}
 	}
 	return -ENXIO;
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index ae4c0593d114..66b365f59c51 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -50,8 +50,8 @@ bool vgic_has_its(struct kvm *kvm)
 
 bool vgic_supports_direct_msis(struct kvm *kvm)
 {
-	return (kvm_vgic_global_state.has_gicv4_1 ||
-		(kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm)));
+	return kvm_vm_has_gicv4(kvm) &&
+		(kvm_vgic_global_state.has_gicv4_1 || vgic_has_its(kvm));
 }
 
 /*
@@ -86,7 +86,7 @@ static unsigned long vgic_mmio_read_v3_misc(struct kvm_vcpu *vcpu,
 		}
 		break;
 	case GICD_TYPER2:
-		if (kvm_vgic_global_state.has_gicv4_1 && gic_cpuif_has_vsgi())
+		if (kvm_vm_has_gicv4_1(vcpu->kvm) && gic_cpuif_has_vsgi())
 			value = GICD_TYPER2_nASSGIcap;
 		break;
 	case GICD_IIDR:
@@ -119,7 +119,7 @@ static void vgic_mmio_write_v3_misc(struct kvm_vcpu *vcpu,
 		dist->enabled = val & GICD_CTLR_ENABLE_SS_G1;
 
 		/* Not a GICv4.1? No HW SGIs */
-		if (!kvm_vgic_global_state.has_gicv4_1 || !gic_cpuif_has_vsgi())
+		if (!kvm_vm_has_gicv4_1(vcpu->kvm) || !gic_cpuif_has_vsgi())
 			val &= ~GICD_CTLR_nASSGIreq;
 
 		/* Dist stays enabled? nASSGIreq is RO */
@@ -133,7 +133,7 @@ static void vgic_mmio_write_v3_misc(struct kvm_vcpu *vcpu,
 		if (is_hwsgi != dist->nassgireq)
 			vgic_v4_configure_vsgis(vcpu->kvm);
 
-		if (kvm_vgic_global_state.has_gicv4_1 &&
+		if (kvm_vm_has_gicv4_1(vcpu->kvm) &&
 		    was_enabled != dist->enabled)
 			kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_RELOAD_GICv4);
 		else if (!was_enabled && dist->enabled)
@@ -178,7 +178,7 @@ static int vgic_mmio_uaccess_write_v3_misc(struct kvm_vcpu *vcpu,
 		}
 	case GICD_CTLR:
 		/* Not a GICv4.1? No HW SGIs */
-		if (!kvm_vgic_global_state.has_gicv4_1)
+		if (!kvm_vm_has_gicv4_1(vcpu->kvm))
 			val &= ~GICD_CTLR_nASSGIreq;
 
 		dist->enabled = val & GICD_CTLR_ENABLE_SS_G1;
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index b9ad7c42c5b0..bc8cb9184be9 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -20,6 +20,18 @@ static bool common_trap;
 static bool dir_trap;
 static bool gicv4_enable;
 
+int kvm_vm_has_gicv4(struct kvm *kvm)
+{
+	return kvm->arch.vgic.gicv4_config ==
+		KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE;
+}
+
+int kvm_vm_has_gicv4_1(struct kvm *kvm)
+{
+	return (kvm_vm_has_gicv4(kvm) &&
+		kvm_vgic_global_state.has_gicv4_1);
+}
+
 void vgic_v3_set_underflow(struct kvm_vcpu *vcpu)
 {
 	struct vgic_v3_cpu_if *cpuif = &vcpu->arch.vgic_cpu.vgic_v3;
@@ -404,7 +416,7 @@ int vgic_v3_save_pending_tables(struct kvm *kvm)
 	 * The above vgic initialized check also ensures that the allocation
 	 * and enabling of the doorbells have already been done.
 	 */
-	if (kvm_vgic_global_state.has_gicv4_1) {
+	if (kvm_vm_has_gicv4_1(kvm)) {
 		unmap_all_vpes(kvm);
 		vlpi_avail = true;
 	}
@@ -581,7 +593,7 @@ int vgic_v3_map_resources(struct kvm *kvm)
 		return -EBUSY;
 	}
 
-	if (kvm_vgic_global_state.has_gicv4_1)
+	if (kvm_vm_has_gicv4_1(kvm))
 		vgic_v4_configure_vsgis(kvm);
 
 	return 0;
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index c7de6154627c..814d54f4ce13 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -86,7 +86,7 @@ static irqreturn_t vgic_v4_doorbell_handler(int irq, void *info)
 	struct kvm_vcpu *vcpu = info;
 
 	/* We got the message, no need to fire again */
-	if (!kvm_vgic_global_state.has_gicv4_1 &&
+	if (!kvm_vm_has_gicv4_1(vcpu->kvm) &&
 	    !irqd_irq_disabled(&irq_to_desc(irq)->irq_data))
 		disable_irq_nosync(irq);
 
@@ -245,7 +245,7 @@ int vgic_v4_init(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (!kvm_vgic_global_state.has_gicv4)
+	if (!kvm_vm_has_gicv4(kvm))
 		return 0; /* Nothing to see here... move along. */
 
 	if (dist->its_vm.vpes)
@@ -286,7 +286,7 @@ int vgic_v4_init(struct kvm *kvm)
 		 * On GICv4.1, the doorbell is managed in HW and must
 		 * be left enabled.
 		 */
-		if (kvm_vgic_global_state.has_gicv4_1)
+		if (kvm_vm_has_gicv4_1(kvm))
 			irq_flags &= ~IRQ_NOAUTOEN;
 		irq_set_status_flags(irq, irq_flags);
 
@@ -392,7 +392,7 @@ int vgic_v4_load(struct kvm_vcpu *vcpu)
 	 * doorbell interrupt that would still be pending. This is a
 	 * GICv4.0 only "feature"...
 	 */
-	if (!kvm_vgic_global_state.has_gicv4_1)
+	if (!kvm_vm_has_gicv4_1(vcpu->kvm))
 		err = irq_set_irqchip_state(vpe->irq, IRQCHIP_STATE_PENDING, false);
 
 	return err;
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 714cef854c1c..8883dc677674 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -296,6 +296,8 @@ struct vgic_dist {
 	 * else.
 	 */
 	struct its_vm		its_vm;
+
+	u8			gicv4_config;
 };
 
 struct vgic_v2_cpu_if {
@@ -447,4 +449,7 @@ bool vgic_state_is_nested(struct kvm_vcpu *vcpu);
 void kvm_vgic_cpu_up(void);
 void kvm_vgic_cpu_down(void);
 
+int kvm_vm_has_gicv4(struct kvm *kvm);
+int kvm_vm_has_gicv4_1(struct kvm *kvm);
+
 #endif /* __KVM_ARM_VGIC_H */
-- 
2.49.0.1101.gccaa498523-goog


