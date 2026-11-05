Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B659606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNpR0WZU;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vIrFY6We
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rvaFmtyNDISQsoxMWBFpDY8CKig5NLHO//X6oykgI60=; b=BNpR0WZU8bQaJb
	6ZIY6NQM3k2l/AXzgM9Jc1IyVwSvnuSq52csTOA64JCwGpMlH0qyHCIG6cM6fQizQwfADy3mY3lzB
	sR1GiaoRgK7g9lueAi04e1ywZqA7WZn4OifrATOsTZoCh2MdLD708tPQ3ztqMpKxzyYGd47DWDs4I
	Ci3nvC17/81JUpJH0VfXHOWB/UTWo9Qwm9nDPogB326mTLcOkMudNpZPStcpCMG2NXGxA6PUv8xfu
	qZVwRD265PC+ikCYUQza03vammuMoEFLa5R5LcZpQFINtMAPGCYXhg24GtYD9vop4JBRzPS+vZ+ev
	x8FV08UkbAnEzpn2P3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvDN-00000008Xjk-3t6O;
	Thu, 05 Nov 2026 11:01:05 +0000
Received: from out-194.mta1.migadu.com ([95.215.58.194] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvDI-00000008XdN-24jZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:01:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NyEGJoxXLgzBuQGYRabpnuVYOlu6XTCpsnZS7w1lcug=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793876458; v=1; x=1794481258;
 b=vIrFY6WeE9WW0HJWQx9rBXqXQNSdxsKhOXDMFmBTNEXy8U9imBwQJnQtc2KIP9G6rQVZE2qF
 RptMNnBmU1d/2aZsQAHwNJylcGlk9FG3Wkl2J4hFsYIqYeOuqImALXcJEel5Kb7ABLAFdXf9Cos
 Gu8ued5W8kzL9C5W2qhqaYTw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e5683ee50ff6c947;
	Thu, 05 Nov 2026 11:00:58 +0000
X-Mizu-Trace-ID: e5683ee50ff6c947
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] KVM: arm64: vgic: Drop the pending state of all LPIs when disabling LPIs
Date: Thu,  5 Nov 2026 11:00:48 +0000
Message-ID: <20261105110050.1244525-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110050.1244525-1-fuad.tabba@linux.dev>
References: <20261105110050.1244525-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030100_999423_99C35FCF 
X-CRM114-Status: GOOD (  16.85  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the guest clears GICR_CTLR.EnableLPIs, vgic_flush_pending_lpis()
retires the LPIs on the vCPU's AP list. However, an LPI disabled in the
configuration table can be pending without being on that list. An LPI
moved to the vCPU by MOVI can also still be in another vCPU's LRs,
which pausing the vCPU doesn't fold back. These LPIs stay pending, and
the guest takes them even after re-enabling LPIs with
GICR_PENDBASER.PTZ set.

Halt the guest rather than the vCPU, so that no vCPU can fold such an
LPI back from its LRs after the flush. Have the flush clear the pending
state of every LPI targeting the vCPU. A forwarded vLPI's pending state
is in its vPE's pending table, which the flush doesn't clear.

Invalidate the translation cache before the flush. Only an MSI racing
with the disable can then make an LPI pending, or cache its translation
for later ones.

Fixes: 0e4e82f154e38 ("KVM: arm64: vgic-its: Enable ITS emulation as a virtual MSI controller")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 13 +++++++------
 arch/arm64/kvm/vgic/vgic.c         | 16 +++++++++++++++-
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 02292f8e0b431..93024879ed3b3 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -298,14 +298,15 @@ static void vgic_mmio_write_v3r_ctlr(struct kvm_vcpu *vcpu,
 		/*
 		 * Yes, disabling LPIs is painful, since it can be done from
 		 * a *remote* vcpu! So let's not take any chance, and make
-		 * sure that the target vCPU has written their LRs back to the
+		 * sure that every vCPU has written their LRs back to the
 		 * irq structures, and release any reference they would have.
-		 * Pause it before its LPIs read as disabled, so that the exit's
-		 * prune leaves them for vgic_flush_pending_lpis() to retire.
+		 * Halt them before the LPIs read as disabled, so that none can
+		 * fold an LPI back from its LRs after vgic_flush_pending_lpis()
+		 * has cleared it.
 		 *
 		 * If it hurts, don't do it.
 		 */
-		kvm_pause_vcpu(vcpu);
+		kvm_arm_halt_guest(vcpu->kvm);
 
 		/*
 		 * Don't disable if RWP is set, as there already an
@@ -315,12 +316,12 @@ static void vgic_mmio_write_v3r_ctlr(struct kvm_vcpu *vcpu,
 					      GICR_CTLR_ENABLE_LPIS,
 					      GICR_CTLR_RWP);
 		if (ctlr == GICR_CTLR_ENABLE_LPIS) {
-			vgic_flush_pending_lpis(vcpu);
 			vgic_its_invalidate_all_caches(vcpu->kvm);
+			vgic_flush_pending_lpis(vcpu);
 			atomic_set_release(&vgic_cpu->ctlr, 0);
 		}
 
-		kvm_resume_vcpu(vcpu);
+		kvm_arm_resume_guest(vcpu->kvm);
 	} else {
 		ctlr = atomic_cmpxchg_acquire(&vgic_cpu->ctlr, 0,
 					      GICR_CTLR_ENABLE_LPIS);
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index fe09ada322625..a99570538f104 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -207,9 +207,10 @@ static void vgic_release_deleted_lpis(struct kvm *kvm)
 void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+	struct vgic_dist *dist = &vcpu->kvm->arch.vgic;
 	struct vgic_irq *irq, *tmp;
+	unsigned long intid, flags;
 	bool deleted = false;
-	unsigned long flags;
 
 	raw_spin_lock_irqsave(&vgic_cpu->ap_list_lock, flags);
 
@@ -228,6 +229,19 @@ void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
 
 	if (deleted)
 		vgic_release_deleted_lpis(vcpu->kvm);
+
+	/* Disabled LPIs and LPIs MOVI'd here can be pending off this AP list. */
+	xa_for_each(&dist->lpi_xa, intid, irq) {
+		irq = vgic_get_irq(vcpu->kvm, intid);
+		if (!irq)
+			continue;
+
+		raw_spin_lock_irqsave(&irq->irq_lock, flags);
+		if (irq->target_vcpu == vcpu)
+			irq->pending_latch = false;
+		raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
+		vgic_put_irq(vcpu->kvm, irq);
+	}
 }
 
 void vgic_irq_set_phys_pending(struct vgic_irq *irq, bool pending)
-- 
2.47.3


