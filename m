Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9EB606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jIZRh0+G;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xMpA6cyk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+AI0DYauqQPIFoBNmaP0YwjPn6fiYc/EIMHLhz9D4Mk=; b=jIZRh0+GgI2bO8
	aqJnyKu49jAjhJz8uYA4YWFCDiIvEmU62utCmAhXsQqCtviyuy77HuHC9agU3e9JDSAbp6xJYdiY/
	juc8NHyLmdW3hADKyJCnWFmsdJZRGOFD3mmqQKUrThSW78xLZOJc2yu0udYiyUltqVvTVFXdgRuHA
	yYNvXlebD+SUfjPJZpOyUDH9NuDWhkqRzSzTB6D8WyJmdRr61qVmKbEE+uislgqfmCyBDmv6VOWV8
	xWqkQCBM91GMj3mHj/OKyk0D9h+4qDj0/mFecpDcTNV2MMbNLICh6fWaDeKXL405l29nTwlz2yeJJ
	TkVF1IwXiS/HsK0xyCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH09-00000002425-1n46;
	Mon, 26 Oct 2026 09:28:21 +0000
Received: from out-194.mta1.migadu.com ([95.215.58.194] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH06-0000000240J-09vY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:28:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=WutytbD2CvrnwsDDfY3uXMPciA1D/8obpWjMW5XUgIs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793006891; v=1; x=1793611691;
 b=xMpA6cyk9O8sjT1ffQZWhshc+JJqlySlicrVlf126vGAUc0IR1zqxfaeDZuG6tA3GO743AYD
 uTGQZRX1nPDG2ABvMOEUiK883N8FfCzrQcEM7dbbiIcw32JWidKfrQgP1NXVDJkMrLjdN9In9vu
 m/dZ2HqoR8Y9DXkEPVg6BJTM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c5e8a671613dede4;
	Mon, 26 Oct 2026 09:28:11 +0000
X-Mizu-Trace-ID: c5e8a671613dede4
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: vgic: Don't forward LPIs to a redistributor with LPIs disabled
Date: Mon, 26 Oct 2026 09:28:01 +0000
Message-ID: <20261026092802.2636798-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026092802.2636798-1-fuad.tabba@linux.dev>
References: <20261026092802.2636798-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_022818_411498_512E0D37 
X-CRM114-Status: GOOD (  17.57  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Clearing GICR_CTLR.EnableLPIs retires the LPIs on the target vCPU's
ap_list, then invalidates the ITS translation caches. However, an MSI
that hits the translation cache can still queue an LPI to that vCPU
after the retire, and so can an INVALL that enables an LPI already
pending. vgic_target_oracle() only checks that the distributor is
enabled, so the LPI goes on the ap_list and the vCPU takes it with
EnableLPIs clear.

Make the oracle also return NULL for an LPI whose redistributor has LPIs
disabled. vgic_queue_irq_unlock() rechecks it under the ap_list lock,
which the retire takes after clearing EnableLPIs, so either the retire
finds the LPI or the queueing reads EnableLPIs clear. The disable path
pauses the vCPU after clearing EnableLPIs, and with this change the
prune on that vCPU's exit would take its pending LPIs off the ap_list
before the retire walks it. Pause the vCPU before clearing EnableLPIs,
so that the retire still clears their pending state.

Fixes: 0e4e82f154e38 ("KVM: arm64: vgic-its: Enable ITS emulation as a virtual MSI controller")
Suggested-by: Oliver Upton <oupton@kernel.org>
Link: https://lore.kernel.org/r/asf87i2RDh-WksL-@kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 31 ++++++++++++++++--------------
 arch/arm64/kvm/vgic/vgic.c         | 12 ++++++++----
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index f5bd29fbe3a90..9117cd85aa593 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -293,6 +293,18 @@ static void vgic_mmio_write_v3r_ctlr(struct kvm_vcpu *vcpu,
 		return;
 
 	if (!(val & GICR_CTLR_ENABLE_LPIS)) {
+		/*
+		 * Yes, disabling LPIs is painful, since it can be done from
+		 * a *remote* vcpu! So let's not take any chance, and make
+		 * sure that the target vCPU has written their LRs back to the
+		 * irq structures, and release any reference they would have.
+		 * Pause it before its LPIs read as disabled, so that the exit's
+		 * prune leaves them for vgic_flush_pending_lpis() to retire.
+		 *
+		 * If it hurts, don't do it.
+		 */
+		kvm_pause_vcpu(vcpu);
+
 		/*
 		 * Don't disable if RWP is set, as there already an
 		 * ongoing disable. Funky guest...
@@ -300,21 +312,12 @@ static void vgic_mmio_write_v3r_ctlr(struct kvm_vcpu *vcpu,
 		ctlr = atomic_cmpxchg_acquire(&vgic_cpu->ctlr,
 					      GICR_CTLR_ENABLE_LPIS,
 					      GICR_CTLR_RWP);
-		if (ctlr != GICR_CTLR_ENABLE_LPIS)
-			return;
+		if (ctlr == GICR_CTLR_ENABLE_LPIS) {
+			vgic_flush_pending_lpis(vcpu);
+			vgic_its_invalidate_all_caches(vcpu->kvm);
+			atomic_set_release(&vgic_cpu->ctlr, 0);
+		}
 
-		/*
-		 * Yes, disabling LPIs is painful, since it can be done from
-		 * a *remote* vcpu! So let's not take any chance, and make
-		 * sure that the target vCPU has written their LRs back to the
-		 * irq structures, and release any reference they would have.
-		 *
-		 * If it hurts, don't do it.
-		 */
-		kvm_pause_vcpu(vcpu);
-		vgic_flush_pending_lpis(vcpu);
-		vgic_its_invalidate_all_caches(vcpu->kvm);
-		atomic_set_release(&vgic_cpu->ctlr, 0);
 		kvm_resume_vcpu(vcpu);
 	} else {
 		ctlr = atomic_cmpxchg_acquire(&vgic_cpu->ctlr, 0,
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 7061b4ab206c9..e1a6a5aa61a8e 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -273,14 +273,18 @@ struct kvm_vcpu *vgic_target_oracle(struct vgic_irq *irq)
 	 * If the IRQ is not active but enabled and pending, we should direct
 	 * it to its configured target VCPU.
 	 * If the distributor is disabled, pending interrupts shouldn't be
-	 * forwarded.
+	 * forwarded, nor should LPIs whose redistributor has them disabled.
 	 */
 	if (irq->enabled && irq_is_pending(irq)) {
-		if (unlikely(irq->target_vcpu &&
-			     !irq->target_vcpu->kvm->arch.vgic.enabled))
+		struct kvm_vcpu *vcpu = irq->target_vcpu;
+
+		if (unlikely(vcpu && !vcpu->kvm->arch.vgic.enabled))
 			return NULL;
 
-		return irq->target_vcpu;
+		if (unlikely(vcpu && irq_is_lpi(vcpu->kvm, irq->intid) && !vgic_lpis_enabled(vcpu)))
+			return NULL;
+
+		return vcpu;
 	}
 
 	/* If neither active nor pending and enabled, then this IRQ should not
-- 
2.47.3


