Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7512606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NOQanjr4;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YldVIdE0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I1Fa6JRPP7VYNcV1UYSNzfVBuIai7Yz+ImynYwQzz8w=; b=NOQanjr44WK+i5
	tES/0M/WOdW4Ht90xal88vBjGG/mSY1RoOD2I93JtRJQDox9g/1gqQPKIAcO2Fd1h6ZO2nPzFwIb+
	fCbYDZ7f9O4n1aPBmefs5XEdoORvZta569HlRGCZ3xJtoSCBVmx5oVvYBntErSB7jEGAnF+Bv3TVk
	JKhPSoe7ky5+yVp2STTH20qKZ22sPYH1TWUvcHzM1c97JlfShSRIcGTBNKnuAYb9RV2QKJkqoKFn7
	gutitWYbAz8dESqHKpV8ojoYT0BXT7PsUX+Q3D2NRp6NzdGyA88m53AAfZJRE9Axkj26P4CAzT897
	xkOHf6UfQv3jXvqRiuPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Wy-00000007fmW-2R14;
	Wed, 28 Oct 2026 17:33:44 +0000
Received: from out-169.mta0.migadu.com ([2001:41d0:1004:224b::a9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Ws-00000007fjj-0Srs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:33:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Vu3DCnFQlvZnnQDvCt8iSvZagRZVGtqQzKTq6UXQQNA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793208815; v=1; x=1793813615;
 b=YldVIdE0tZen68U2dzYAeLfmvCn/AYpRxWJFx3P/bZU+3lg8OkAkiv8LzWz35zCguLpc2HKT
 uqEPOk4lIqIMYEpy+vQ/zQOyE7Fmqf8t+bVhqSi0E5R6jjx89onQgmgZLBzpv5mwCP9bc4+rrBZ
 qIadKiMGGYOrpMBweNdPzo0g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5cb386fb5ff2312e;
	Wed, 28 Oct 2026 17:33:35 +0000
X-Mizu-Trace-ID: 5cb386fb5ff2312e
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
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
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] KVM: arm64: vgic-its: Remove the pending state of a cleared LPI
Date: Wed, 28 Oct 2026 17:33:19 +0000
Message-ID: <20261028173319.1807811-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028173319.1807811-1-fuad.tabba@linux.dev>
References: <20261028173319.1807811-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_103338_291709_464E7CDC 
X-CRM114-Status: GOOD (  18.31  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CLEAR removes the pending state of an LPI (IHI 0069H.b 5.3.3). Since
commit e99ff76f4a02b ("KVM: arm64: vgic-its: Remove the pending state of
a discarded LPI"), DISCARD does that under the irq lock, after pausing
the vCPUs whose list registers can hold the LPI. CLEAR does neither. An
LPI pending in a running vCPU's list register is folded back on exit, so
the guest takes it after the CLEAR. pending_latch also shares a word
with on_lr, so a racing CLEAR can restore on_lr after the exit path has
cleared it under the lock, and trip the WARN_ON() in
vgic_v3_compute_lr() when the LPI is next queued.

Move DISCARD's pause and clear into a helper and use it for CLEAR too,
after checking, as DISCARD does, that the event's collection is mapped.
CLEAR on an unmapped collection is a command error. Without the check,
the helper could be handed an LPI that has no target vCPU to pause.

Fixes: df9f58fbea9bc ("KVM: arm64: vgic-its: Implement ITS command queue command handlers")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-its.c | 67 ++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 42dc71495ad98..f9e9b0a71eb5a 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -817,6 +817,38 @@ static u64 its_cmd_mask_field(u64 *its_cmd, int word, int shift, int size)
 #define its_cmd_get_target_addr(cmd)	its_cmd_mask_field(cmd, 2, 16, 32)
 #define its_cmd_get_validbit(cmd)	its_cmd_mask_field(cmd, 2, 63,  1)
 
+/*
+ * Only an LPI on a vCPU's AP list can be in its list registers, which the
+ * exit path folds back, and that exit moves the LPI to its target vCPU if
+ * the target has changed: pause both. Clear an LPI on no AP list before
+ * dropping the lock, so that nothing can put it in a list register first.
+ * Must be called with the its_lock mutex held.
+ */
+static void vgic_its_clear_pending(struct vgic_irq *irq)
+{
+	struct kvm_vcpu *vcpu, *target;
+
+	scoped_guard(raw_spinlock_irqsave, &irq->irq_lock) {
+		vcpu = irq->vcpu;
+		target = irq->target_vcpu;
+		if (!vcpu)
+			irq->pending_latch = false;
+	}
+
+	if (vcpu) {
+		if (target != vcpu)
+			kvm_pause_vcpu(target);
+		kvm_pause_vcpu(vcpu);
+
+		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
+			irq->pending_latch = false;
+
+		kvm_resume_vcpu(vcpu);
+		if (target != vcpu)
+			kvm_resume_vcpu(target);
+	}
+}
+
 /*
  * The DISCARD command frees an Interrupt Translation Table Entry (ITTE).
  * Must be called with the its_lock mutex held.
@@ -833,38 +865,9 @@ static int vgic_its_cmd_handle_discard(struct kvm *kvm, struct vgic_its *its,
 		struct its_device *device = find_its_device(its, device_id);
 		int ite_esz = vgic_its_get_abi(its)->ite_esz;
 		gpa_t gpa = device->itt_addr + ite->event_id * ite_esz;
-		struct vgic_irq *irq = ite->irq;
-		struct kvm_vcpu *vcpu, *target;
 
 		vgic_its_invalidate_cache(its);
-
-		/*
-		 * Only an LPI on a vCPU's AP list can be in its list registers,
-		 * which the exit path folds back, and that exit moves the LPI
-		 * to its target vCPU if the target has changed: pause both.
-		 * Clear an LPI on no AP list before dropping the lock, so that
-		 * nothing can put it in a list register first.
-		 */
-		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock) {
-			vcpu = irq->vcpu;
-			target = irq->target_vcpu;
-			if (!vcpu)
-				irq->pending_latch = false;
-		}
-
-		if (vcpu) {
-			if (target != vcpu)
-				kvm_pause_vcpu(target);
-			kvm_pause_vcpu(vcpu);
-
-			scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
-				irq->pending_latch = false;
-
-			kvm_resume_vcpu(vcpu);
-			if (target != vcpu)
-				kvm_resume_vcpu(target);
-		}
-
+		vgic_its_clear_pending(ite->irq);
 		its_free_ite(kvm, ite);
 
 		return vgic_its_write_entry_lock(its, gpa, 0ULL, ite);
@@ -1309,10 +1312,10 @@ static int vgic_its_cmd_handle_clear(struct kvm *kvm, struct vgic_its *its,
 
 
 	ite = find_ite(its, device_id, event_id);
-	if (!ite)
+	if (!ite || !its_is_collection_mapped(ite->collection))
 		return E_ITS_CLEAR_UNMAPPED_INTERRUPT;
 
-	ite->irq->pending_latch = false;
+	vgic_its_clear_pending(ite->irq);
 
 	if (ite->irq->hw)
 		return irq_set_irqchip_state(ite->irq->host_irq,
-- 
2.47.3


