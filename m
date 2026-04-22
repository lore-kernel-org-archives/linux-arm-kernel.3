Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69463F9B602
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nqtHuOTu+UK0c+gBFcLxLDb7R0eFyGDb2HzhRB0wmg=; b=YeL8pXKMhMVoibKu+tu+NwnubM
	Fv4MP8HEvtzALGkc4Moa6ghUAlo1vDwVoz3zfXJJIIIC0LwJw9AL3e5hnyvd2Ll3X7nwC3zhYBeGk
	9OmPui6T0lSgRhuCPuLwPGposvIcd1WlbCgFSh5+ExIF6N+0KLRNWlQfKneROcCEYMvI7qNqNuiFq
	prop3VWoLs5qo9ukrr9qIUPFVmU2CvUhWQfzG+MEB7YhuF5yo7oqFQy9KYIRXC3kaMmcn6xXbgR5Y
	GBdcAGGSKa14S1iWBV36olYI8pnGmMBD7BmNcnLY9vSMCTI9s8ZrrUDFotMfOvZZUgogwD7mlzHYi
	u5f+IZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUPV-00000009uhY-2Xiz;
	Wed, 22 Apr 2026 10:02:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUPS-00000009ufe-0YFp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 10:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E491760125;
	Wed, 22 Apr 2026 10:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FB6C2BCC6;
	Wed, 22 Apr 2026 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776852135;
	bh=axFrI5UOMgvvCv5/3fhLhydt6PvPA2EyBTnm72OVc6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t44RbhoBeVqcgb3OoHzkP6j2LZFVWMmchvQvs/4Q1l5/hRcyoD832Qp/TT7Pk8Wfl
	 xLxTx5WI7/DNf8tm0OsAPAmYpMVM2230Wo9XmThh63G7eQ4/LctSI50D8LJpDkD9XN
	 EJciXINuAwQeo+H1nwS72l0AzPkeN46QS3VbTpraKvKs3hwkhV9gs5uNKydfgnq0l7
	 ZH1F0gtzybjPfECCtEKlAi91iiRDQCyMULhbWSEcPkoCAF9N/56oKyJdlCnZWvRoWB
	 ubfwoIEcd+ofNGdZKd40yx81fEZuSSvQQJgDsX4yNYxB1g5meLpRCn+5RSsGzsneRq
	 ecQXAbKR3T1ZA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wFUPN-0000000Dh6d-2D7T;
	Wed, 22 Apr 2026 10:02:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 3/4] KVM: arm64: vgic-v2: Force vgic init on injection outside the run loop
Date: Wed, 22 Apr 2026 11:02:09 +0100
Message-ID: <20260422100210.3008156-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422100210.3008156-1-maz@kernel.org>
References: <20260422100210.3008156-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kartikey406@gmail.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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
 arch/arm64/kvm/arm.c             | 7 +++++++
 arch/arm64/kvm/vgic/vgic-irqfd.c | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 176cbe8baad30..e856cf4099f42 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -51,6 +51,7 @@
 
 #include <linux/irqchip/arm-gic-v5.h>
 
+#include "vgic/vgic.h"
 #include "sys_regs.h"
 
 static enum kvm_mode kvm_mode = KVM_MODE_DEFAULT;
@@ -1475,6 +1476,12 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
 
 	trace_kvm_irq_line(irq_type, vcpu_id, irq_num, irq_level->level);
 
+	if (irqchip_in_kernel(kvm)) {
+		int ret = vgic_lazy_init(kvm);
+		if (ret)
+			return ret;
+	}
+
 	switch (irq_type) {
 	case KVM_ARM_IRQ_TYPE_CPU:
 		if (irqchip_in_kernel(kvm))
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


