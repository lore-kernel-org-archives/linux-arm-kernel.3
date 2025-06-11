Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB78C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOTLB9yjN2C3LWZCQEdqcwdP4FJ1lfhRlbh51+CaqBQ=; b=Rk9r6jTDnPebFXJ9YSR/z11nfh
	o+ACctpEcd8n3472dUaHiPKy6fWgd/xObJY5RcAWCRHJCm43ZP+30eOTOpgYVETmBJkb7wMJeQQha
	02oYlKyiwQu/hYf0ICMg9owYI9ER/qHyIsUy1jy6fxvOK57dItbDqv7fwdfJQBt4+RXTOqAG4zqFF
	b+ywHQLVEWO0lT2uxQyuywqYbMlsbtYonfPBfH5IAGydQlVY+gUc6hk8BLP9jRI3B5u+r5qT/nMbh
	kKI9xX8Q8QDJYBT+m6iaUdUqgipumsFooTKiC+/MvRLOXlwhfjkISt8mlFXXvqaEva4C76m2bTbHD
	PtA/uAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmS-0000000ATZw-2pKi;
	Wed, 11 Jun 2025 15:54:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ1e-00000009fJr-2t1g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:49:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A77CC1655;
	Wed, 11 Jun 2025 03:49:26 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.67.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C8743F673;
	Wed, 11 Jun 2025 03:49:43 -0700 (PDT)
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
	Emi Kisanuki <fj0570is@fujitsu.com>
Subject: [PATCH v9 12/43] KVM: arm64: vgic: Provide helper for number of list registers
Date: Wed, 11 Jun 2025 11:48:09 +0100
Message-ID: <20250611104844.245235-13-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611104844.245235-1-steven.price@arm.com>
References: <20250611104844.245235-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_034946_767645_C99876E5 
X-CRM114-Status: GOOD (  13.17  )
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

Currently the number of list registers available is stored in a global
(kvm_vgic_global_state.nr_lr). With Arm CCA the RMM is permitted to
reserve list registers for its own use and so the number of available
list registers can be fewer for a realm VM. Provide a wrapper function
to fetch the global in preparation for restricting nr_lr when dealing
with a realm VM.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
New patch for v6
---
 arch/arm64/kvm/vgic/vgic.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 8f8096d48925..c7aed48c5668 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -21,6 +21,11 @@ struct vgic_global kvm_vgic_global_state __ro_after_init = {
 	.gicv3_cpuif = STATIC_KEY_FALSE_INIT,
 };
 
+static inline int kvm_vcpu_vgic_nr_lr(struct kvm_vcpu *vcpu)
+{
+	return kvm_vgic_global_state.nr_lr;
+}
+
 /*
  * Locking order is always:
  * kvm->lock (mutex)
@@ -802,7 +807,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 	lockdep_assert_held(&vgic_cpu->ap_list_lock);
 
 	count = compute_ap_list_depth(vcpu, &multi_sgi);
-	if (count > kvm_vgic_global_state.nr_lr || multi_sgi)
+	if (count > kvm_vcpu_vgic_nr_lr(vcpu) || multi_sgi)
 		vgic_sort_ap_list(vcpu);
 
 	count = 0;
@@ -831,7 +836,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 
 		raw_spin_unlock(&irq->irq_lock);
 
-		if (count == kvm_vgic_global_state.nr_lr) {
+		if (count == kvm_vcpu_vgic_nr_lr(vcpu)) {
 			if (!list_is_last(&irq->ap_list,
 					  &vgic_cpu->ap_list_head))
 				vgic_set_underflow(vcpu);
@@ -840,7 +845,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 	}
 
 	/* Nuke remaining LRs */
-	for (i = count ; i < kvm_vgic_global_state.nr_lr; i++)
+	for (i = count; i < kvm_vcpu_vgic_nr_lr(vcpu); i++)
 		vgic_clear_lr(vcpu, i);
 
 	if (!static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
-- 
2.43.0


