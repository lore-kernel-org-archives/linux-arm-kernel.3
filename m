Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587BAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jebVS1nr4nrEMYVoKtSK6nLQ3THvgE0eU6OaAI8Lg7A=; b=Cbv8+7J7gowZ31X/bHu52bOPfJ
	9VmesYAUOTZ0ih0SODC9+KedrpXb9MIx2UdGjWG9zkUUjiT+FjL1cnG+bOtlnmjyzfOKe83VAXSvb
	8cUnLR9BBINUbNQcCppijIxTIEPk8M8vZb2oaNsH1/iYOevdvUxyuhnQy9dnc8f6j6wNVlu25nwMa
	rtNoiLhBIfx+mKhSTMujAg35ryIDViiKMf+eEMplEzrkKxUnPX5MzG2+bCxnMQIArm4htrBNQj2X5
	5hUKcowH7G1YXBeMJOKAhMalPJIsop/Zs6y3VPoMwPH4USbDxRrt8q+P4QU0kY2f9yInMDRru4xam
	oyTJW87g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1ke-00000003Amx-0y1I;
	Sun, 12 Jan 2025 17:27:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1SK-000000037iV-1Lur
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 17:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D3FFA40AA5;
	Sun, 12 Jan 2025 17:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8B4C4CEE0;
	Sun, 12 Jan 2025 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736701734;
	bh=bBS4fJajDfZE1aWzWfZnIljuaWUShrhbiZ7kpSCCqRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qr5aRiiwoS6i/pU8c3IruYqDGER0xqDsi3Zk5rVPH2cVJOm5PzjLOH3h0RIB697MQ
	 zvPjYvK6s168LW7XRQj2uOXMAT0xw24x32kUSOazy6g19KxVSDZ0Pixn05OVdmp2kF
	 /pDH6g81pL1Gcm+WRo6q2MDz2dlnuGxfMkKWS1+pEYz2Ymkwioa4Hji5t7p2Z188ic
	 /VzyZCaUYzOJvbJ7MU6BdtvrpSAvsodZLfl5qg1mNKDxPoYF4HwkUwSmQolRYxxEnS
	 xpQnaLhLjrt+cR8J97Dj1+s25Vn3Uv5199mhtfkQa0r0W5N0FeGBloaGRobde/ZvZm
	 9++stiWLHUI4A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tX1SG-00BNxR-Er;
	Sun, 12 Jan 2025 17:08:52 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 16/17] KVM: arm64: nv: Allow userland to set VGIC maintenance IRQ
Date: Sun, 12 Jan 2025 17:08:44 +0000
Message-Id: <20250112170845.1181891-17-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250112170845.1181891-1-maz@kernel.org>
References: <20250112170845.1181891-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_090856_504573_2C223DC7 
X-CRM114-Status: GOOD (  19.40  )
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

From: Andre Przywara <andre.przywara@arm.com>

The VGIC maintenance IRQ signals various conditions about the LRs, when
the GIC's virtualization extension is used.
So far we didn't need it, but nested virtualization needs to know about
this interrupt, so add a userland interface to setup the IRQ number.
The architecture mandates that it must be a PPI, on top of that this code
only exports a per-device option, so the PPI is the same on all VCPUs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
[added some bits of documentation]
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 .../virt/kvm/devices/arm-vgic-v3.rst          | 12 +++++++-
 arch/arm64/include/uapi/asm/kvm.h             |  1 +
 arch/arm64/kvm/vgic/vgic-kvm-device.c         | 29 +++++++++++++++++--
 tools/arch/arm/include/uapi/asm/kvm.h         |  1 +
 4 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v3.rst b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
index 5817edb4e0467..e860498b1e359 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-v3.rst
+++ b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
@@ -291,8 +291,18 @@ Groups:
       |    Aff3    |    Aff2    |    Aff1    |    Aff0    |
 
   Errors:
-
     =======  =============================================
     -EINVAL  vINTID is not multiple of 32 or info field is
 	     not VGIC_LEVEL_INFO_LINE_LEVEL
     =======  =============================================
+
+  KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ
+   Attributes:
+
+    The attr field of kvm_device_attr encodes the following values:
+
+      bits:     | 31   ....    5 | 4  ....  0 |
+      values:   |      RES0      |   vINTID   |
+
+    The vINTID specifies which interrupt is generated when the vGIC
+    must generate a maintenance interrupt. This must be a PPI.
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 66736ff04011e..05d53d3de5b3b 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -406,6 +406,7 @@ enum {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
 #define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO  7
 #define KVM_DEV_ARM_VGIC_GRP_ITS_REGS 8
+#define KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ  9
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
 			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index 5f4f57aaa23ec..359094f68c23e 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -303,6 +303,12 @@ static int vgic_get_common_attr(struct kvm_device *dev,
 			     VGIC_NR_PRIVATE_IRQS, uaddr);
 		break;
 	}
+	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ: {
+		u32 __user *uaddr = (u32 __user *)(long)attr->addr;
+
+		r = put_user(dev->kvm->arch.vgic.mi_intid, uaddr);
+		break;
+	}
 	}
 
 	return r;
@@ -517,7 +523,7 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 	struct vgic_reg_attr reg_attr;
 	gpa_t addr;
 	struct kvm_vcpu *vcpu;
-	bool uaccess;
+	bool uaccess, post_init = true;
 	u32 val;
 	int ret;
 
@@ -533,6 +539,9 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 		/* Sysregs uaccess is performed by the sysreg handling code */
 		uaccess = false;
 		break;
+	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ:
+		post_init = false;
+		fallthrough;
 	default:
 		uaccess = true;
 	}
@@ -552,7 +561,7 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 
 	mutex_lock(&dev->kvm->arch.config_lock);
 
-	if (unlikely(!vgic_initialized(dev->kvm))) {
+	if (post_init != vgic_initialized(dev->kvm)) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -582,6 +591,19 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 		}
 		break;
 	}
+	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ:
+		if (!is_write) {
+			val = dev->kvm->arch.vgic.mi_intid;
+			ret = 0;
+			break;
+		}
+
+		ret = -EINVAL;
+		if ((val < VGIC_NR_PRIVATE_IRQS) && (val >= VGIC_NR_SGIS)) {
+			dev->kvm->arch.vgic.mi_intid = val;
+			ret = 0;
+		}
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -608,6 +630,7 @@ static int vgic_v3_set_attr(struct kvm_device *dev,
 	case KVM_DEV_ARM_VGIC_GRP_REDIST_REGS:
 	case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
 	case KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO:
+	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ:
 		return vgic_v3_attr_regs_access(dev, attr, true);
 	default:
 		return vgic_set_common_attr(dev, attr);
@@ -622,6 +645,7 @@ static int vgic_v3_get_attr(struct kvm_device *dev,
 	case KVM_DEV_ARM_VGIC_GRP_REDIST_REGS:
 	case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
 	case KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO:
+	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ:
 		return vgic_v3_attr_regs_access(dev, attr, false);
 	default:
 		return vgic_get_common_attr(dev, attr);
@@ -645,6 +669,7 @@ static int vgic_v3_has_attr(struct kvm_device *dev,
 	case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
 		return vgic_v3_has_attr_regs(dev, attr);
 	case KVM_DEV_ARM_VGIC_GRP_NR_IRQS:
+	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ:
 		return 0;
 	case KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO: {
 		if (((attr->attr & KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK) >>
diff --git a/tools/arch/arm/include/uapi/asm/kvm.h b/tools/arch/arm/include/uapi/asm/kvm.h
index 03cd7c19a683b..d5dd969028175 100644
--- a/tools/arch/arm/include/uapi/asm/kvm.h
+++ b/tools/arch/arm/include/uapi/asm/kvm.h
@@ -246,6 +246,7 @@ struct kvm_vcpu_events {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
 #define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO  7
 #define KVM_DEV_ARM_VGIC_GRP_ITS_REGS	8
+#define KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ	9
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
 			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
-- 
2.39.2


