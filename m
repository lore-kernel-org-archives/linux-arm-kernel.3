Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93A4CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tB774sdEjGOsUuihk5n6/aTLO5S2y/yue2pNnYlb8Vw=; b=0cw3PTDzRg4h8PJAISGTldvv42
	KSHM4K4DoSdfJqpSj9oPmrP3hToWHf0GIKNU2ZIXOWYHoecVRbVSJftj7FEU78wV3VlFFUjmUn+ci
	XzMOx4GdaF7lWCVJ3fgSzn1h6T3vjnmzLHB9DocI7VbCC2JY18rmYIS+kE//yc3B4PlupraVLCHhn
	Pmm/vGOd7qK1c+G/wj2APGbJbBQzc2wdqRbjvIuUm1x6aJs0+0jgCGwzOdtmHroD1RH9Qv3XWdGtk
	q9Be+Tcwht0ab01hzIM7YkoO3mn66VC7rY604uzO9mchYAjHZ1gS9eDooz4CFKxjAT9aqxtU4Z9Bv
	XkxJcSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdkg-00000004GOr-3dJ9;
	Wed, 20 May 2026 10:02:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdkf-00000004GNe-0imu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 10:02:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EC3060145;
	Wed, 20 May 2026 10:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DDA1F00896;
	Wed, 20 May 2026 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271328;
	bh=tB774sdEjGOsUuihk5n6/aTLO5S2y/yue2pNnYlb8Vw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yr8IV7BIV0VSWdKaAC9t7xpdAB1Ht5L6qejJHwV+Pth6oVq0xpa+7QFREyHNT35Pa
	 wLnEulZtONP1oKmxv7QOfuorXajsnVzxOF8YESO52M0PUm/5KpHM4SEc9VT0ChcdVs
	 FoEy/eUahOD1YWP2iybcQqQtNGD+Azjc+BkCyWZpgzl7OPxBHtAg5UgNbgnhtVrkIr
	 PoB/f/VnhBFK8hkgirdUymxBWEqKw16nxsejAPCKj9dLIuF/a5LsWSEiBlTm58hz9y
	 tN2+A1NvZTlBB8wH4GovDcFsMWFcaESFoWP4wY5uDedTZDh1Zehe0Nh8/nYG3KzMti
	 FdWERqpA26tNA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPdkc-00000004Jio-212F;
	Wed, 20 May 2026 10:02:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v3 5/6] KVM: arm64: vgic-v2: Force vgic init on injection outside the run loop
Date: Wed, 20 May 2026 11:01:59 +0100
Message-ID: <20260520100200.543845-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520100200.543845-1-maz@kernel.org>
References: <20260520100200.543845-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kartikey406@gmail.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Make sure that any attempt to inject an interrupt from userspace
or an irqfd results in the GICv2 lazy init to take place.

This is not currently necessary as the init is also performed on
*any* interrupt injection. But as we're about to remove that,
let's introduce it here.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arm.c             | 15 +++++++++++++--
 arch/arm64/kvm/vgic/vgic-irqfd.c |  6 ++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 6e6dc17f8b606..cfb7921fc7d75 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -51,6 +51,7 @@
 
 #include <linux/irqchip/arm-gic-v5.h>
 
+#include "vgic/vgic.h"
 #include "sys_regs.h"
 
 static enum kvm_mode kvm_mode = KVM_MODE_DEFAULT;
@@ -1497,8 +1498,13 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
 
 		return vcpu_interrupt_line(vcpu, irq_num, level);
 	case KVM_ARM_IRQ_TYPE_PPI:
-		if (!irqchip_in_kernel(kvm))
+		if (irqchip_in_kernel(kvm)) {
+			int ret = vgic_lazy_init(kvm);
+			if (ret)
+				return ret;
+		} else {
 			return -ENXIO;
+		}
 
 		vcpu = kvm_get_vcpu_by_id(kvm, vcpu_id);
 		if (!vcpu)
@@ -1525,8 +1531,13 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
 
 		return kvm_vgic_inject_irq(kvm, vcpu, irq_num, level, NULL);
 	case KVM_ARM_IRQ_TYPE_SPI:
-		if (!irqchip_in_kernel(kvm))
+		if (irqchip_in_kernel(kvm)) {
+			int ret = vgic_lazy_init(kvm);
+			if (ret)
+				return ret;
+		} else {
 			return -ENXIO;
+		}
 
 		if (vgic_is_v5(kvm)) {
 			/* Build a GICv5-style IntID here */
diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
index b9b86e3a6c862..19a1094536e6a 100644
--- a/arch/arm64/kvm/vgic/vgic-irqfd.c
+++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
@@ -20,9 +20,15 @@ static int vgic_irqfd_set_irq(struct kvm_kernel_irq_routing_entry *e,
 			int level, bool line_status)
 {
 	unsigned int spi_id = e->irqchip.pin + VGIC_NR_PRIVATE_IRQS;
+	int ret;
 
 	if (!vgic_valid_spi(kvm, spi_id))
 		return -EINVAL;
+
+	ret = vgic_lazy_init(kvm);
+	if (ret)
+		return ret;
+
 	return kvm_vgic_inject_irq(kvm, NULL, spi_id, level, NULL);
 }
 
-- 
2.47.3


