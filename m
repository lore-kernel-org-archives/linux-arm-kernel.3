Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE6CCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp8TJvgYk4dUAnyYuq90MCPQ++6cQcyfGHV+/YigiLU=; b=iKiISskCe+Gs/61ESxyh/GzFJG
	tN8KXO0SDL+Ut7eaKWArGerssCFjCjTOl3g1lndQC4emOPeVwdxOCHCxB77gh1kkorTM5GkpeHZG5
	oX6rTTOtNfHXBt66Qa3jsruGtMZ7Zydk+DbO8xiCckRX6oyHtKKE30ldZ7rR8cf1WdiiUQIWu1RAH
	8LDBWqe+e3cPjCR2DsAOJ6mvfhQDjYTMb4zYDi+onMg+lkM7ABHGHxqZX1TWd1HWesdzldNzF/L/u
	sIZHsuPCWHerS4jlFkrGOx3xTjDK8ddTwHOa/+JyL8I8+9qx5SxseFc3zPyKA6W59Y0iBsNIUwycx
	AkixzLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd7Q-000000048qI-3p6W;
	Wed, 20 May 2026 09:21:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6b-000000047p2-1lpz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Yp8TJvgYk4dUAnyYuq90MCPQ++6cQcyfGHV+/YigiLU=; b=TO3kjqrcpm5wQTklk0gW/08M2n
	cbTqQYBDnnettWViWtPFD4iO1tIO8SOLyDy9N5sXpMPHOVhRQO5OFOU0psAoQFItAD4Xo5T+R05ZP
	xwN3bBUzpHSA+WBRVm70LaHGi7ihXQvTY2owAitOX04mHnlpMJVwigBVryNx7A3+dvrwPVn/ZYMba
	J7euHXkWbatnwyzMSJfE9lZaXgymh6240XN7dirBmkipx3YjNzSUfKxmMfDAODPxZM56Ps7mIp1F5
	sxZf3RH+uqdOVM8oIbiVxEZVUE/Py3AXCY21RfRotyZlRxtrRDbPkSzSfLVCarX2RAA1nrLPF1/j5
	rFQCGiXg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6C-0000000GKXA-1ijK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 72B69418BD;
	Wed, 20 May 2026 09:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589BD1F0089C;
	Wed, 20 May 2026 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268813;
	bh=Yp8TJvgYk4dUAnyYuq90MCPQ++6cQcyfGHV+/YigiLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FJJHQXUmD+Y82FRqKen8WEDYl5pm32pATNjpbfiuvDZS3JzftrEIqvSv35iSNJ5hR
	 qaE5yfKKCRXlL4N1pyxhxMqrEUCSG2cUA8eR0BaA49+s6lmVzdvlN8CV239dbduMTp
	 KTh5CLGmCoa7UQ3+AqubeIAOccmZ8jm27YXCM2mIcfRLnler2rHV+zxitodRJv9yfB
	 aDYg2GCPdXoGaxFpWkuE0eb6Z+69cwwd/++6WrXpkdtZ5wShCegNXis4y+NIeL8BIN
	 2ZgC1LrAQY5HBQOHlVuSWfOx4V4/9zDd3kF71lV3aRZvkBVKYJwhXZw2N5iFL+zJ7G
	 IRP0/vjSnCfxw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd63-00000004IaV-2emc;
	Wed, 20 May 2026 09:20:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 07/18] KVM: arm64: vgic-v5: Drop defensive checks from vgic_v5_ppi_queue_irq_unlock()
Date: Wed, 20 May 2026 10:19:38 +0100
Message-ID: <20260520091949.542365-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102038_059917_59A5DD9F 
X-CRM114-Status: GOOD (  13.28  )
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


