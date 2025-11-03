Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC801CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxEoEG+mzlWuxq6BVblkJMj3rbD6iAxrcS8Ky42jjb4=; b=Ok+upcg12DOZCKbvdMDZf/Ug5E
	vHb2Ulz23QmXTnj8xUdlxivop8CHAE+KKHyjlmOLP2WMaFHmagQFq4PL7jvPQ9jNblTkD093CUqQ9
	j7wOc3FFT2/z/RHsxwswjvojRgKusJbaSfWQ1IeFaIoDm4vK63tvwVP9wXq/JQAbnCCFlRIO3cn7b
	6QZVFXH6VP7VeWSMSB8Vt2EqEIPs49KjRZrIrju1dDdfhIxX3kZ8zmzaMTiIdyCwjkVzLvuD/4Zle
	wNhRIYpUe8Jl1x1d82OXO5UwY2HDLfgSXapA/45ff8FfxtmgqUsY715DfkMkPTvslTv5wrSi5tdaA
	8R0THTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqT-0000000AKep-34qx;
	Mon, 03 Nov 2025 16:55:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq8-0000000AJzP-391H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EB69419BA;
	Mon,  3 Nov 2025 16:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8192EC113D0;
	Mon,  3 Nov 2025 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188932;
	bh=H45ACQ31zwJs1iN2ph2dhip32kIZZ3Ja116Yq9uq39w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sl5htj6aziAwulZZC3H3V7p9+I2Z48ggSRrHZQgdsSoJ+9yXguulRF2uyhLrql2kz
	 bP/IwInJk+Cc32RfZJb22pxqLIKqC4kEqAlIxFHE4MLEzr59LOO/mVhRMcQ1+3D6Mt
	 9DFKDmGRd3dy9Omkmtopd4P+GsWWaUdmyCK3Wp/SmOF9R0oqfp4REy1Oaf7nnfI8D6
	 ab7ig0tyq8/TjaoWQFwgIhxWkjyyn3Yci8VQo0k1mUGQPqNzGr94C+Q6tmQocilJyQ
	 0QKE9yRJZOSt9xPmzzcZQijYXtZak/hhvjGpuAjVYqjMrQLQlQDl7WcN7KrfIJzx+v
	 GDq7NrjOoSWqg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq6-000000021VN-2h9B;
	Mon, 03 Nov 2025 16:55:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 25/33] KVM: arm64: Add AP-list overflow split/splice
Date: Mon,  3 Nov 2025 16:55:09 +0000
Message-ID: <20251103165517.2960148-26-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085532_876440_802107A9 
X-CRM114-Status: GOOD (  26.27  )
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

When EOImode==0, the deactivation of an interrupt outside of the LRs
results in an increment of EOIcount, but not much else.

In order to figure out what interrupts did not make it into the LRs,
split the ap_list to make it easy to find the interrupts EOIcount
applies to. Also provide a bit of documentation for how things are
expected to work.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c |  2 ++
 arch/arm64/kvm/vgic/vgic.c      | 48 ++++++++++++++++++++++++++++++++-
 include/kvm/arm_vgic.h          |  6 +++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 1796b1a22a72a..f03cbf0ad154a 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -331,6 +331,7 @@ int kvm_vgic_vcpu_init(struct kvm_vcpu *vcpu)
 	vgic_cpu->rd_iodev.base_addr = VGIC_ADDR_UNDEF;
 
 	INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
+	INIT_LIST_HEAD(&vgic_cpu->overflow_ap_list_head);
 	raw_spin_lock_init(&vgic_cpu->ap_list_lock);
 	atomic_set(&vgic_cpu->vgic_v3.its_vpe.vlpi_count, 0);
 
@@ -455,6 +456,7 @@ static void __kvm_vgic_vcpu_destroy(struct kvm_vcpu *vcpu)
 	vgic_flush_pending_lpis(vcpu);
 
 	INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
+	INIT_LIST_HEAD(&vgic_cpu->overflow_ap_list_head);
 	kfree(vgic_cpu->private_irqs);
 	vgic_cpu->private_irqs = NULL;
 
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 5c9204d18b27d..bd77365331530 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -687,6 +687,15 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
 retry:
 	raw_spin_lock(&vgic_cpu->ap_list_lock);
 
+	/*
+	 * Replug the overflow list into the ap_list so that we can walk the
+	 * whole thing in one go. Note that we only replug it once,
+	 * irrespective of how many tries we perform.
+	 */
+	if (!list_empty(&vgic_cpu->overflow_ap_list_head))
+		list_splice_tail_init(&vgic_cpu->overflow_ap_list_head,
+				      &vgic_cpu->ap_list_head);
+
 	list_for_each_entry_safe(irq, tmp, &vgic_cpu->ap_list_head, ap_list) {
 		struct kvm_vcpu *target_vcpu, *vcpuA, *vcpuB;
 		bool target_vcpu_needs_kick = false;
@@ -914,12 +923,33 @@ static void summarize_ap_list(struct kvm_vcpu *vcpu,
  *   if they were made pending sequentially. This may mean that we don't
  *   always present the HPPI if other interrupts with lower priority are
  *   pending in the LRs. Big deal.
+ *
+ * Additional complexity comes from dealing with these overflow interrupts,
+ * as they are not easy to locate on exit (the ap_list isn't immutable while
+ * the vcpu is running, and new interrupts can be added).
+ *
+ * To deal with this, we play some games with the ap_list:
+ *
+ * - On entering the guest, interrupts that haven't made it onto the LRs are
+ *   placed on an overflow list. These entries are still notionally part of
+ *   the ap_list (the vcpu field still points to the owner).
+ *
+ * - On exiting the guest, the overflow list is used to handle the
+ *   deactivations signaled by EOIcount, by walking the list and
+ *   deactivating EOIcount interrupts from the overflow list.
+ *
+ * - The overflow list is then spliced back with the rest of the ap_list,
+ *   before pruning of idle interrupts.
+ *
+ * - Interrupts that are made pending while the vcpu is running are added to
+ *   the ap_list itself, never to the overflow list. This ensures that these
+ *   new interrupts are not evaluated for deactivation when the vcpu exits.
  */
 static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct ap_list_summary als;
-	struct vgic_irq *irq;
+	struct vgic_irq *irq, *last = NULL;
 	int count = 0;
 
 	lockdep_assert_held(&vgic_cpu->ap_list_lock);
@@ -933,6 +963,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 		scoped_guard(raw_spinlock,  &irq->irq_lock) {
 			if (likely(vgic_target_oracle(irq) == vcpu)) {
 				vgic_populate_lr(vcpu, irq, count++);
+				last = irq;
 			}
 		}
 
@@ -951,6 +982,21 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 		vcpu->arch.vgic_cpu.vgic_v3.used_lrs = count;
 		vgic_v3_configure_hcr(vcpu, &als);
 	}
+
+	/*
+	 * Move the end of the list to the overflow list, unless:
+	 *
+	 * - either we didn't inject anything at all
+	 * - or we injected everything there was to inject
+	 */
+	if (!count ||
+	    (last && list_is_last(&last->ap_list, &vgic_cpu->ap_list_head))) {
+		INIT_LIST_HEAD(&vgic_cpu->overflow_ap_list_head);
+		return;
+	}
+
+	vgic_cpu->overflow_ap_list_head = vgic_cpu->ap_list_head;
+	list_cut_position(&vgic_cpu->ap_list_head, &vgic_cpu->overflow_ap_list_head, &last->ap_list);
 }
 
 static inline bool can_access_vgic_from_kernel(void)
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index ec349c5a4a8b6..1d700850f6ea7 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -359,6 +359,12 @@ struct vgic_cpu {
 	 */
 	struct list_head ap_list_head;
 
+	/*
+	 * List of IRQs that have not made it onto an LR, but still
+	 * notionally par of the AP list
+	 */
+	struct list_head overflow_ap_list_head;
+
 	/*
 	 * Members below are used with GICv3 emulation only and represent
 	 * parts of the redistributor.
-- 
2.47.3


