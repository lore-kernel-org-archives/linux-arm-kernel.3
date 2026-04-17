Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0724F43697
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 12:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdEMfRQm2dy05rXYqJD42GiIE49meMVUiBnLAMECYAc=; b=4w3Yq8za96+Lzw0D4xOxcbL0BJ
	5KyK43ettioXldDk8zYx2Q1aljmrFHtn8TAMw6UxyE5S8kCXI7TE2UCOTKOBb98eugBEYSE6EgYl1
	m+dTR/zfOeIcGnhHeSrIIrXg9thHte4ryGPP3alfDYuRnQ/nWxFcYDCLlcL0WXBS+suD+sx3K/vbc
	KqUGHRN5/iZv34WCjkmahIlV+8UHWwVH+YqrU8g16GkhkXQOrmQPMpBmqYyEu5bc71UOlMJ8lti4g
	pG1cUFtSVzxtJp1et7jha8s89dywQoC7MYTObyYJxLfHeyPI+j4oXna23gBkHyVj2m8gjE8x5Ti5e
	D0NTYZpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiaT-000000043An-3VK6;
	Fri, 17 Apr 2026 12:46:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiaS-0000000439p-0mHX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 12:46:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56EF160139;
	Fri, 17 Apr 2026 12:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4CAC2BCB7;
	Fri, 17 Apr 2026 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776429979;
	bh=kFA288NlmP/ThIs4VFFDZrv24ox81bH/b4T77Zp7qXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=skf+N3/oUH0YiiHAyALoeglRGUqaIxJGAf3QgpuWMb+P0ekAz93xdB3+Pc9eSKlRS
	 cWQv2j/I1Ad2q/RPc1E+b2SzieS4pIb4OTp63uXZHxr9xCk6Wz89kZERDxjW8uzjzt
	 rSJPXMjaH4b5+/WgeorZrq2owgOEQwkaGk28tsxZHYEGpYOxgigabTPDsqhlqzuI1p
	 /TGkHNCjNKOpBYsxe8pGgyQbwEEgsuTaPFYUjCVEmCtin6Bu+3bymewGiu+aFKfMV6
	 vhwh8PQQf9EutmdTM5HjMvxTZAKtnMR3panSM/gpTiyqgXkJXczoi5neYuDQKfqPQD
	 djSsQwkvMOs9A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wDiaP-0000000CRo5-0aal;
	Fri, 17 Apr 2026 12:46:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 3/4] KVM: arm64: vgic-v2: Force vgic init on injection from userspace
Date: Fri, 17 Apr 2026 13:46:11 +0100
Message-ID: <20260417124612.2770268-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260417124612.2770268-1-maz@kernel.org>
References: <20260417124612.2770268-1-maz@kernel.org>
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
results in the GICv2 lazy init to take place. This is not currently
necessary as the init is also performed on *any* interrupt injection.

But as we're about to remove that, let's introduce it here.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arm.c | 7 +++++++
 1 file changed, 7 insertions(+)

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
-- 
2.47.3


