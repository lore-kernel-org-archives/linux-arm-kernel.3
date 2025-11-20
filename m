Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B74FCF9C7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOIjhweXvx91T3Q5x9q40XIRj4c8tlaJwpiVxjUfNIQ=; b=MWhveHnTNJuTwqZ07r4lleyC/W
	YbP+DW4jiZKHipRsFIdl28sktQgqqbU2tsHfSfLTD0UyMKPiRdR6uftu0tSqKqxNvcDEf7VTeDlz/
	JM/YkMOEeSuyII90kqHMF+JizN5Jc9f/LJGOgq+xho4Fpa0tr37r/jzw2o9rXGnqQd/L2EAPH4W/L
	xW77KwkhcE4RgmOM7O6OYXjt9SUMsXPmqV/7qnlyEP4DT3M0g0Ea8h3BC/s6qVd+F7fscL1MGWsBl
	56gxle1ABXM50wfsulR9MlVpPAKumz4w4bV63b4/0TePLjmkpBRNAqCVsRE67NNKY1o1i4Pmw25d1
	iD3dU0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QB-000000075ru-0RSh;
	Thu, 20 Nov 2025 17:26:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Px-000000075bm-17p4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B4CF3601F2;
	Thu, 20 Nov 2025 17:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8F7C116C6;
	Thu, 20 Nov 2025 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659560;
	bh=bms1Md7sGkq4HJkFfPkaPFYDm0tudSYohGQAkv2vdk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gWYDsp9+ctsMCg5mXoqk6JlWQe7SMrPK30l/mgZ46FpE6zuVB/e99TPV8N6KP4x3i
	 RiwZ/xDpu2ui596Em9IICWMW2NuiLDf2xxJ45paGkH8DNjtrXqrc86uvvesHwtNaZB
	 jwT5tevg8Al1in1Ppi/fVpp9YEtoLLUj7pjJVh04EM60TGIYrDgkXbEgZV55J1MdLN
	 XfXbLdhm+AIyQqJr8sGhFrKu0Rea1yAQ9op+dtCt68IUR2tBtydg2A1gw3A4ph9WqY
	 q1YvkQeN0L5oiD3zrnRLGiZ+MLRXhRXruDtyi+nqPFC1uZV3yjGkSgT9f0bygzxG74
	 QLp8EpvwqDxuw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pu-00000006y6g-1r1N;
	Thu, 20 Nov 2025 17:25:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 19/49] KVM: arm64: Compute vgic state irrespective of the number of interrupts
Date: Thu, 20 Nov 2025 17:25:09 +0000
Message-ID: <20251120172540.2267180-20-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
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

As we are going to rely on the [G]ICH_HCR{,_EL2} register to be
programmed with MI information at all times, slightly de-optimise
the flush/sync code to always be called. This is rather lightweight
when no interrupts are in flight.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 35 ++---------------------------------
 1 file changed, 2 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 7ee253a9fb77e..39346baa2677c 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -985,8 +985,6 @@ static inline void vgic_save_state(struct kvm_vcpu *vcpu)
 /* Sync back the hardware VGIC state into our emulation after a guest's run. */
 void kvm_vgic_sync_hwstate(struct kvm_vcpu *vcpu)
 {
-	int used_lrs;
-
 	/* If nesting, emulate the HW effect from L0 to L1 */
 	if (vgic_state_is_nested(vcpu)) {
 		vgic_v3_sync_nested(vcpu);
@@ -996,20 +994,10 @@ void kvm_vgic_sync_hwstate(struct kvm_vcpu *vcpu)
 	if (vcpu_has_nv(vcpu))
 		vgic_v3_nested_update_mi(vcpu);
 
-	/* An empty ap_list_head implies used_lrs == 0 */
-	if (list_empty(&vcpu->arch.vgic_cpu.ap_list_head))
-		return;
-
 	if (can_access_vgic_from_kernel())
 		vgic_save_state(vcpu);
 
-	if (!static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
-		used_lrs = vcpu->arch.vgic_cpu.vgic_v2.used_lrs;
-	else
-		used_lrs = vcpu->arch.vgic_cpu.vgic_v3.used_lrs;
-
-	if (used_lrs)
-		vgic_fold_lr_state(vcpu);
+	vgic_fold_lr_state(vcpu);
 	vgic_prune_ap_list(vcpu);
 }
 
@@ -1053,29 +1041,10 @@ void kvm_vgic_flush_hwstate(struct kvm_vcpu *vcpu)
 	if (vcpu_has_nv(vcpu))
 		vgic_v3_nested_update_mi(vcpu);
 
-	/*
-	 * If there are no virtual interrupts active or pending for this
-	 * VCPU, then there is no work to do and we can bail out without
-	 * taking any lock.  There is a potential race with someone injecting
-	 * interrupts to the VCPU, but it is a benign race as the VCPU will
-	 * either observe the new interrupt before or after doing this check,
-	 * and introducing additional synchronization mechanism doesn't change
-	 * this.
-	 *
-	 * Note that we still need to go through the whole thing if anything
-	 * can be directly injected (GICv4).
-	 */
-	if (list_empty(&vcpu->arch.vgic_cpu.ap_list_head) &&
-	    !vgic_supports_direct_irqs(vcpu->kvm))
-		return;
-
 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
 
-	if (!list_empty(&vcpu->arch.vgic_cpu.ap_list_head)) {
-		raw_spin_lock(&vcpu->arch.vgic_cpu.ap_list_lock);
+	scoped_guard(raw_spinlock, &vcpu->arch.vgic_cpu.ap_list_lock)
 		vgic_flush_lr_state(vcpu);
-		raw_spin_unlock(&vcpu->arch.vgic_cpu.ap_list_lock);
-	}
 
 	if (can_access_vgic_from_kernel())
 		vgic_restore_state(vcpu);
-- 
2.47.3


