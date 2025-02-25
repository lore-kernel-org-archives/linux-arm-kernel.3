Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1785C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XD4d4L3Li20ia+cyYlkKus8uNkH+X82eioQml+BTQGg=; b=bp3ftwxhxJdQWox3/1EiSgyPzr
	uUNQ24bfQfVyRYIVNtWMsPwggLZYR/8XjQpSUV8OlkX6VHw4xPDiPWojkgJ1doaU+PvVtqJMRX0oN
	Zx3ccowAsrYJJlSfFRNv1VySoysjlBE6ttWzy0EIdivRehhVxDa6c2g9T+nFeRc2OdM+LAlL9TU4y
	q16pY6JoBgAtMFvc7eWjTq1aJQqAy5py/UedDg1KGUw4t0fYjv8pW5WX5Jf6jMpRYOvaMUF56OZDp
	z2ghQdBX7+r1JFYC0bJzV1T85g8PL2Ru7+3HFt4BTLEAe0lESgihPS1pNuRyaY3dRTPz/bRvGDuOR
	vTggkO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzSa-00000000sGS-02dB;
	Tue, 25 Feb 2025 18:15:12 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmykd-00000000eA8-3Qhx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B370B612CE;
	Tue, 25 Feb 2025 17:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4867BC4CEE2;
	Tue, 25 Feb 2025 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504587;
	bh=MG6V1iXKlEJKDBccezjHnT48DNrHj/X9BQoNBuoFRAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nBvWXxdOJDKQ1dXAxxvxEqIZbXBSCBYBty/3ModsxG/zPZBzBHLPk03TXEJY486n1
	 HnDie+KHWqqDilayyBzvbkyOYMWaboEO0CugOpT7NTpsDDhOajGSRpLOujX8XYPKgN
	 yYX2GvI2Z2jAGd9kTwo6ZXns2GRC/aZJIHCWvwkICgiAW1z2Ll5qREKzmYG1CxpXj0
	 6yjhAoJLaLNo/oJ9FY5duF76+oijL7zedRUhvmLwt8axF1BI+GODh+SQ9m87hIXV4X
	 /qrBXTuLtJrZyOBzeBZFT5YsD9O6QrmsAZT9UOw8Wl9wwpSIElQYRF3q26mUxGKGqu
	 Czi9vNKDqAK6w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmykb-007rKs-IJ;
	Tue, 25 Feb 2025 17:29:45 +0000
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
Subject: [PATCH v4 09/16] KVM: arm64: nv: Handle L2->L1 transition on interrupt injection
Date: Tue, 25 Feb 2025 17:29:23 +0000
Message-Id: <20250225172930.1850838-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
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

An interrupt being delivered to L1 while running L2 must result
in the correct exception being delivered to L1.

This means that if, on entry to L2, we found ourselves with pending
interrupts in the L1 distributor, we need to take immediate action.
This is done by posting a request which will prevent the entry in
L2, and deliver an IRQ exception to L1, forcing the switch.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 17 +++++++++--------
 arch/arm64/kvm/arm.c              |  5 +++++
 arch/arm64/kvm/nested.c           |  4 ++++
 arch/arm64/kvm/vgic/vgic.c        | 23 +++++++++++++++++++++++
 4 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7e0dc6b4cb99e..86519a73971ed 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -44,14 +44,15 @@
 
 #define KVM_REQ_SLEEP \
 	KVM_ARCH_REQ_FLAGS(0, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
-#define KVM_REQ_IRQ_PENDING	KVM_ARCH_REQ(1)
-#define KVM_REQ_VCPU_RESET	KVM_ARCH_REQ(2)
-#define KVM_REQ_RECORD_STEAL	KVM_ARCH_REQ(3)
-#define KVM_REQ_RELOAD_GICv4	KVM_ARCH_REQ(4)
-#define KVM_REQ_RELOAD_PMU	KVM_ARCH_REQ(5)
-#define KVM_REQ_SUSPEND		KVM_ARCH_REQ(6)
-#define KVM_REQ_RESYNC_PMU_EL0	KVM_ARCH_REQ(7)
-#define KVM_REQ_NESTED_S2_UNMAP	KVM_ARCH_REQ(8)
+#define KVM_REQ_IRQ_PENDING		KVM_ARCH_REQ(1)
+#define KVM_REQ_VCPU_RESET		KVM_ARCH_REQ(2)
+#define KVM_REQ_RECORD_STEAL		KVM_ARCH_REQ(3)
+#define KVM_REQ_RELOAD_GICv4		KVM_ARCH_REQ(4)
+#define KVM_REQ_RELOAD_PMU		KVM_ARCH_REQ(5)
+#define KVM_REQ_SUSPEND			KVM_ARCH_REQ(6)
+#define KVM_REQ_RESYNC_PMU_EL0		KVM_ARCH_REQ(7)
+#define KVM_REQ_NESTED_S2_UNMAP		KVM_ARCH_REQ(8)
+#define KVM_REQ_GUEST_HYP_IRQ_PENDING	KVM_ARCH_REQ(9)
 
 #define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
 				     KVM_DIRTY_LOG_INITIALLY_SET)
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f678a77438cc0..697e8c6596a0f 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1144,6 +1144,11 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 * preserved on VMID roll-over if the task was preempted,
 		 * making a thread's VMID inactive. So we need to call
 		 * kvm_arm_vmid_update() in non-premptible context.
+		 *
+		 * Note that this must happen after the check_vcpu_request()
+		 * call to pick the correct s2_mmu structure, as a pending
+		 * nested exception (IRQ, for example) can trigger a change
+		 * in translation regime.
 		 */
 		if (kvm_arm_vmid_update(&vcpu->arch.hw_mmu->vmid) &&
 		    has_vhe())
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 7c8f39070a503..722e61e410e2e 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1318,4 +1318,8 @@ void check_nested_vcpu_requests(struct kvm_vcpu *vcpu)
 		}
 		write_unlock(&vcpu->kvm->mmu_lock);
 	}
+
+	/* Must be last, as may switch context! */
+	if (kvm_check_request(KVM_REQ_GUEST_HYP_IRQ_PENDING, vcpu))
+		kvm_inject_nested_irq(vcpu);
 }
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 324c547e1b4d8..9734a71b85611 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -906,6 +906,29 @@ static inline void vgic_restore_state(struct kvm_vcpu *vcpu)
 /* Flush our emulation state into the GIC hardware before entering the guest. */
 void kvm_vgic_flush_hwstate(struct kvm_vcpu *vcpu)
 {
+	/*
+	 * If in a nested state, we must return early. Two possibilities:
+	 *
+	 * - If we have any pending IRQ for the guest and the guest
+	 *   expects IRQs to be handled in its virtual EL2 mode (the
+	 *   virtual IMO bit is set) and it is not already running in
+	 *   virtual EL2 mode, then we have to emulate an IRQ
+	 *   exception to virtual EL2.
+	 *
+	 *   We do that by placing a request to ourselves which will
+	 *   abort the entry procedure and inject the exception at the
+	 *   beginning of the run loop.
+	 *
+	 * - Otherwise, do exactly *NOTHING*. The guest state is
+	 *   already loaded, and we can carry on with running it.
+	 */
+	if (vgic_state_is_nested(vcpu)) {
+		if (kvm_vgic_vcpu_pending_irq(vcpu))
+			kvm_make_request(KVM_REQ_GUEST_HYP_IRQ_PENDING, vcpu);
+
+		return;
+	}
+
 	/*
 	 * If there are no virtual interrupts active or pending for this
 	 * VCPU, then there is no work to do and we can bail out without
-- 
2.39.2


