Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF80E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5SIRuK+cys1quLQYNJTyVCpiadlh9SO9ucnQU2Wymo=; b=lYi9a+hdiDdjyWg7KbPMrYHGaj
	8lZiIQn6XIXv7m25ZddWadV0lC3F73EnvRdsgreQpTQ/0RuSUMyIl/E3SOYW0RCjzvC5kQjHN5ynm
	10KuMB/EWXqHfznecOtlb63VqTvNyQi5PxDrIofziokDI3ooOHp69BsugLhQeNy7ZJdA3LXCbcI0T
	kx2+SjZebMgIlDIctVmguay+UZA3b0CECjsE+d+JQJoKeHK9D7inkMTuwN7xvZzLdVB2+rTIkvV1K
	fPfbpJ55+cU8ZC6WVS98B+GHgBfMkYPzP4lMaEbGWQXhq2APnSIPe4YcMheWX62gjG1Q/YkTSUeva
	97ywh7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZSU-0000000Dx3g-48uc;
	Tue, 17 Dec 2024 15:26:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZGy-0000000DuUR-2FX5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF66BA41A1F;
	Tue, 17 Dec 2024 15:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD42C4CEE0;
	Tue, 17 Dec 2024 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448446;
	bh=EOwDeEEdCnSnldPYlWdcwYEt+LLvBfkCBZw1/S5dYx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=abyBx0orQupbFptfghSVTEe2n5JrfeAX3QFjCVp80jE33h5vPZg0P3yFHt+U4vQI3
	 DGkQwl3KqS2CP+wZZwKj/0iMLdoP9baEI4MSfkXuSYfaUgd65L3v37zlK5XXLOWdKM
	 urIG6tdLsR5jahk6ct7jYrz4fnQJGiyMfis3kd3er+Q+0mn8qZxjZhhns5QvgbgS4G
	 ZXCnose1pTrR/waVtdDPZZD/BAsBc/2Ce+nsHZhH+eTQg13KElrJe+LhlMd9kSu0ed
	 SB8gK3gqJa1BWmMP+HxNH30olA8pEyq3bGsCBLImx/8R2L7R4Vaz1gJgGy6Mn8MHQa
	 pw1Lu+V9r3qAw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNZGu-004bWV-Fq;
	Tue, 17 Dec 2024 15:14:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 10/16] KVM: arm64: nv: Handle L2->L1 transition on interrupt injection
Date: Tue, 17 Dec 2024 15:13:25 +0000
Message-Id: <20241217151331.934077-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217151331.934077-1-maz@kernel.org>
References: <20241217151331.934077-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eauger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071408_707295_660D8A90 
X-CRM114-Status: GOOD (  20.28  )
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
 arch/arm64/kvm/nested.c           |  3 +++
 arch/arm64/kvm/vgic/vgic.c        | 23 +++++++++++++++++++++++
 4 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 218047cd0296d..cb969c096d7bd 100644
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
index 3115c44ed4042..5e353b2c225b4 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1153,6 +1153,11 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
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
index 37f7ef2f44bd8..2b511d30939b3 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1295,4 +1295,7 @@ void check_nested_vcpu_requests(struct kvm_vcpu *vcpu)
 		}
 		write_unlock(&vcpu->kvm->mmu_lock);
 	}
+
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


