Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B727F41994
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp8TJvgYk4dUAnyYuq90MCPQ++6cQcyfGHV+/YigiLU=; b=ECahVshP7tnflPnR7YVprc2W+T
	2H6jNYRfgrMrQRcDQq9mZR9AzrBRTbUacmRqVsIMvgUxp5U0vJdCGrIsNULOpr6Tej1mJS0eX8QRS
	R2Y/iprJmQ4dv+yLfVt24AYqrZrwtXemJ73UyrOqh9UnlfN8l2+OvrIuZyzqs/RaVajC2oAwEOLH6
	X1azfGq0vviLBAABtXTq5NXBu3PFZsZemDCw8lYPJHFSfpT7sK36BMBdQHw4Ti2YARC0Me16Dr6qq
	UBKWkOhow9+Rpd138FvVi3q8AOZXKJ03+U1BtxbEG45mlgpJI3GPlNUYTi0tdxy8M29ZgLUhCz2BF
	1VHjlM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr4-0000000149D-1rDc;
	Wed, 15 Apr 2026 11:56:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr1-0000000146S-25oW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D79146012A;
	Wed, 15 Apr 2026 11:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D139C19424;
	Wed, 15 Apr 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254182;
	bh=3GpnxZCnP3owOfN9/6GKMUYj5IThL0sP1V0fxRFMcbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2njVw4eigEg9mSxeee0opXf34CTcAMoiv2SoqtfnusruC1h+FMMYjRudo/EuBFmS
	 N7ZXRYq7/Yx1vHnepMZflfLV28RPN8VYv/MSTH1Ks0DSiRlXxiYbdOZTjKh21ASQ4I
	 Tqw4uOO+t0JcdVpasjEvKzOS5OiJ1IJF2msPy972KEM4EKphtv/6kcq+t1ihlvlc0J
	 rJOeLRyv5nfdmWj6wXjE3F3kGYvvZ5ETHuNdJwkTY87Zhxx1+R3uYiiOKBMQl/emkQ
	 FC00cF5BrqKLVp8SKSVXUAV8OkFl02xT/dxIqY1oGyJg1Y4mcUuP9To6Wuy7nOzXwK
	 zE10jILtfiauA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqy-0000000Bqsi-2DGS;
	Wed, 15 Apr 2026 11:56:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 07/18] KVM: arm64: vgic-v5: Drop defensive checks from vgic_v5_ppi_queue_irq_unlock()
Date: Wed, 15 Apr 2026 12:55:48 +0100
Message-ID: <20260415115559.2227718-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
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

vgic_v5_ppi_queue_irq_unlock() performs a bunch of sanity checks
that are pretty pointless as there is no code path that can
result in these invariants to be violated. And if they are, a nice
crash is just as instructive than a warning.

Drop what is evidently debug code and simplify the whole thing.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 757484d2493b2..7916bd8d564ef 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -238,9 +238,9 @@ static u32 vgic_v5_get_effective_priority_mask(struct kvm_vcpu *vcpu)
 
 /*
  * For GICv5, the PPIs are mostly directly managed by the hardware. We (the
- * hypervisor) handle the pending, active, enable state save/restore, but don't
- * need the PPIs to be queued on a per-VCPU AP list. Therefore, sanity check the
- * state, unlock, and return.
+ * hypervisor) handle the pending, active, enable state save/restore, but
+ * don't need the PPIs to be queued on a per-VCPU AP list. Therefore,
+ * unlock, kick the vcpu and return.
  */
 bool vgic_v5_ppi_queue_irq_unlock(struct kvm *kvm, struct vgic_irq *irq,
 				  unsigned long flags)
@@ -250,12 +250,7 @@ bool vgic_v5_ppi_queue_irq_unlock(struct kvm *kvm, struct vgic_irq *irq,
 
 	lockdep_assert_held(&irq->irq_lock);
 
-	if (WARN_ON_ONCE(!__irq_is_ppi(KVM_DEV_TYPE_ARM_VGIC_V5, irq->intid)))
-		goto out_unlock_fail;
-
 	vcpu = irq->target_vcpu;
-	if (WARN_ON_ONCE(!vcpu))
-		goto out_unlock_fail;
 
 	raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
 
@@ -264,11 +259,6 @@ bool vgic_v5_ppi_queue_irq_unlock(struct kvm *kvm, struct vgic_irq *irq,
 	kvm_vcpu_kick(vcpu);
 
 	return true;
-
-out_unlock_fail:
-	raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
-
-	return false;
 }
 
 /*
-- 
2.47.3


