Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A78C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVM+xtZo4DSwIGNCfdZ1hhjkN+MmX0LKoU3teHStK4Y=; b=Z36zmlQB57pFteUYh4ZP1t2jWg
	HPuIqVU5mlGINZoy9DNoU3mezMvxqozE9rkpxqaNU/+PEbxg0Ma8Mt3BXVcPEFzFKd7SKdz3hWXYO
	uqhqCCW5HUPSiHXtfJx+FJQGogW+T+yMs8Feuycq8eHvAzUfxj/ZshDoLC0ULXvkfeEIOG8gSxyni
	hr3Fb9bs2jbguQoPtAoKhDpB61wtwrGtuChtUsH407QuOEVP/kdnEFVy6Uzet2ezpHMBff5ugkcA1
	J63ovmecjKt3GPn7VYnPQfc7jfUAUXGgGSq2yUeO2kC+iRVfLEHJ0LEKJewCMZif85ufS97yfAbPj
	lv/36r0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqszQ-0000000HDDJ-0F6L;
	Mon, 03 Aug 2026 13:46:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqszH-0000000HD2s-40wT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:45:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 625241476;
	Mon,  3 Aug 2026 06:45:47 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EACBD3F66F;
	Mon,  3 Aug 2026 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764751; bh=+to7CADPvNbqpJgbAHoG4amNfn4k084irx3hyn1zoX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qjpJ8LBkfQDODk2ibY1YVPZOPNdSLZLrSU45GUaFsaOu+TM1kibD7zJdPPhSXD3a4
	 VdUElxRYvW7rZH2EO5bOr4vNNpQY38Y24fETfZdZ4ClG0io6GYheVdNAH+BUmD9NdV
	 AVFMc3TwDyy/3pvYge3rYsVad/MGLmBIEie49u2Q=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v16 20/45] KVM: arm64: CCA: Support timers in realm RECs
Date: Mon,  3 Aug 2026 14:43:36 +0100
Message-ID: <20260803134403.80630-21-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064552_094849_5627BA28 
X-CRM114-Status: GOOD (  18.46  )
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

The RMM keeps track of the timer while the realm REC is running, but on
exit to the normal world KVM is responsible for handling the timers.

A later patch adds the support for propagating the timer values from the
exit data structure and calling kvm_realm_timers_update().

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v15:
 * Major rewrite to make better use of the KVM infrastructure.
Changes since v14:
 * Special case in kvm_timer_vcpu_load()/kvm_timer_vcpu_put() the timer
   handling.
Changes since v12:
 * Adapt to upstream changes.
Changes since v11:
 * Drop the kvm_is_realm() check from timer_set_offset(). We already
   ensure that the offset is 0 when calling the function.
Changes since v10:
 * KVM_CAP_COUNTER_OFFSET is now already hidden by a previous patch.
Changes since v9:
 * No need to move the call to kvm_timer_unblocking() in
   kvm_timer_vcpu_load().
Changes since v7:
 * Hide KVM_CAP_COUNTER_OFFSET for realm guests.
---
 arch/arm64/kvm/arch_timer.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 4155fe89b58a..00ff182ae288 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -56,11 +56,22 @@ static unsigned long kvm_arch_timer_get_irq_flags(void)
 	return kvm_vgic_global_state.no_hw_deactivation ? VGIC_IRQ_SW_RESAMPLE : 0;
 }
 
+static unsigned long kvm_realm_timer_get_irq_flags(void)
+{
+	/* RMI_REC_ENTER rejects LRs which have the HW bit set. */
+	return VGIC_IRQ_SW_RESAMPLE;
+}
+
 static const struct irq_ops arch_timer_irq_ops = {
 	.get_flags	 = kvm_arch_timer_get_irq_flags,
 	.get_input_level = kvm_arch_timer_get_input_level,
 };
 
+static const struct irq_ops realm_timer_irq_ops = {
+	.get_flags	 = kvm_realm_timer_get_irq_flags,
+	.get_input_level = kvm_arch_timer_get_input_level,
+};
+
 static const struct irq_ops arch_timer_irq_ops_vgic_v5 = {
 	.get_input_level = kvm_arch_timer_get_input_level,
 	.queue_irq_unlock = vgic_v5_ppi_queue_irq_unlock,
@@ -1073,7 +1084,8 @@ static void timer_context_init(struct kvm_vcpu *vcpu, int timerid)
 
 	ctxt->timer_id = timerid;
 
-	if (!kvm_vm_is_protected(vcpu->kvm)) {
+	/* The RMM architecture fixes both Realm counter offsets at zero. */
+	if (!kvm_vm_is_protected(vcpu->kvm) && !vcpu_is_rec(vcpu)) {
 		if (timerid == TIMER_VTIMER)
 			ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
 		else
@@ -1103,8 +1115,11 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
 	for (int i = 0; i < NR_KVM_TIMERS; i++)
 		timer_context_init(vcpu, i);
 
-	/* Synchronize offsets across timers of a VM if not already provided */
-	if (!vcpu_is_protected(vcpu) &&
+	/*
+	 * Synchronize offsets across timers of a VM if not already provided.
+	 * Realm counter offsets are fixed at zero by the RMM architecture.
+	 */
+	if (!vcpu_is_protected(vcpu) && !vcpu_is_rec(vcpu) &&
 	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
 		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
 		timer_set_offset(vcpu_ptimer(vcpu), 0);
@@ -1602,8 +1617,15 @@ int kvm_timer_enable(struct kvm_vcpu *vcpu)
 
 	get_timer_map(vcpu, &map);
 
-	ops = vgic_is_v5(vcpu->kvm) ? &arch_timer_irq_ops_vgic_v5 :
-				      &arch_timer_irq_ops;
+	/*
+	 * RMI_REC_ENTER rejects LRs with the HW bit set, so use the existing
+	 * software resampling mechanism for Realm timer interrupts.
+	 */
+	if (vcpu_is_rec(vcpu))
+		ops = &realm_timer_irq_ops;
+	else
+		ops = vgic_is_v5(vcpu->kvm) ? &arch_timer_irq_ops_vgic_v5 :
+					      &arch_timer_irq_ops;
 
 	for (int i = 0; i < nr_timers(vcpu); i++)
 		kvm_vgic_set_irq_ops(vcpu, timer_irq(vcpu_get_timer(vcpu, i)), ops);
@@ -1729,7 +1751,7 @@ int kvm_vm_ioctl_set_counter_offset(struct kvm *kvm,
 	if (offset->reserved)
 		return -EINVAL;
 
-	if (kvm_vm_is_protected(kvm))
+	if (kvm_vm_is_protected(kvm) || kvm_is_realm(kvm))
 		return -EINVAL;
 
 	mutex_lock(&kvm->lock);
-- 
2.43.0


