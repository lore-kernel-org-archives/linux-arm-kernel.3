Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC93CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHdUHpz2QUTUTPA0omhntC6N40tEvHT+WGB9a85+D14=; b=U85i99ig15gV+5RDzHwACjfTU2
	o8i9ypiB/gXYaB7K+K7BKLZ2ZwS8NdLJrco7gL4gdxUVs3w8EJMfWJfyOs7h5E5PUXd8nM7Nsv+Ua
	12bRICNb9LloNMFBy4P7jS8qhs3+8Ga7h3WYrkUmBDAIM4eQjWjvAqQxsQxbqhruixobQ9Sly+171
	hFecJs6tNBz8LdFi8JzTKEiDYT7sCtQpisDHQ4wxpxfJp8LfOfxZNOsajyNNQQQrBBKlP098QDUur
	V9HWie5MVWdoXPdL4Q1j1lVr9+86YwWKYQnTC6e3WvHXXFAZ60LCsJiWGElRdPJDLZ83SdppaubMm
	beooTETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI920-00000004CUu-3iJJ;
	Sun, 09 Nov 2025 17:16:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91n-00000004CDG-1cvS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8F646013D;
	Sun,  9 Nov 2025 17:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9B3C19421;
	Sun,  9 Nov 2025 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708594;
	bh=5IkFfNBLzAtUk47cnyzmf/J4gBVwD0aQa6Mumy1Fgbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jHgkj+NS1z2CzGmMIyfi3dVnb2mDe6FPUR+l4KCJdgcxraEQPsWr+3dhou3sqkNLL
	 Pv9rqv8ZIZtCFR3PBy2VKoEb6JjsZlt2U4CG49HbwuwiKbLsjUxv+W209x55pOiqJe
	 ESa2/nCNvAN8EKh/ohPm9LTfxevOvYZ1dl+ySgBme3kbfYgMS4LtzgKjFwkR1au9Ku
	 oQPw9U2GGTBYMOLQ7wzZ8eOg+AzHMM/bvh2EeagqRWOQO6Pn6ea10+FGcPXXx2XnOi
	 mHFQSsfXUhLGi3Vb6NTfgjs9KD2VNS8sttYpMNKmbS4c9pQAl5a2wayp1qaTSNe0Sb
	 pjrEwrdlfaqIw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91k-00000003exw-2TcT;
	Sun, 09 Nov 2025 17:16:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 18/45] KVM: arm64: Compute vgic state irrespective of the number of interrupts
Date: Sun,  9 Nov 2025 17:15:52 +0000
Message-ID: <20251109171619.1507205-19-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 35 ++---------------------------------
 1 file changed, 2 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 8d7f6803e601b..46b31cd365466 100644
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


