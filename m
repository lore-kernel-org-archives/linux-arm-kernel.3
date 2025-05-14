Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2E0C3ABDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4gMZc0seLXj9jwjKzMU2bkTMOaz4MH+cjyMrsp/1bA=; b=aVCubDbOSa30jOvmVEw/LqchJA
	apbKV2BYnmZ8JHk2Bxk1IrZQogOnxRvN9RhC19chc3Zc3QbQVWgxME6LhEZufncGjZkK3aaXu6syt
	UYUEvBfav5gdo4h6KoKSFnrHFg1bGplyAAjYhhfwq7a0fCyE65w0uqFj/NeLAIHGc2AjJT94KyX0Y
	dHgueXljY20jiMRJz6JFfZSADjw5WGNILmqPa118RFzOL2PXNDebm4lNv1Y+LZLvBMl0ZbGYDQEF2
	8tSU70ujMrfwMP9b3wMcXLj4v3yMz1TAr3bklzQp+j1rKqNFatibCnAFGki9UBlkhTjWyBOnMW42I
	noEsVBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXo-0000000FGyp-0ame;
	Wed, 14 May 2025 13:53:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9S8-0000000EnoY-2kFl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 10:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 748A6629E6;
	Wed, 14 May 2025 10:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45674C4CEF6;
	Wed, 14 May 2025 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747218908;
	bh=EvPVE6nuzrIUxi/yzRzJUY2tSTPhNUO79MH3qf+FQi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Aaq79BDSzl29nsLPP4EmsGXOnvWBL8EwzbVwwJ1QWh8Rio8rxK6iZAyaYnQ+Xsrd2
	 7aZUHL1fCd8oqCKokCyWb7DzTV9VPJUEz/uLlDzMxjRl7HPOqLMFuvLE0Jox3b0yvJ
	 YEP2yNB+R8ZTs0r9w9Qvu5xaAmDKCGihVWBdErkYFZypb8lUiCrwMJm5RoSfx9QlW0
	 bKE+sVcuXUpFhoga4f2IsIxIXAKw21VfQlQyDoeKGeWcr1Awsft/fczIBYLFKyXiNs
	 QWLsTrJ85osBCq8f3Ox1oP4G1uFnhDR6wVL0HIyV8kaNP6LmbpyqrpvZwNFMoFMCsc
	 yr3v2WLCngCNw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uF9S6-00Eos3-Gh;
	Wed, 14 May 2025 11:35:06 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH v4 11/17] KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers
Date: Wed, 14 May 2025 11:34:54 +0100
Message-Id: <20250514103501.2225951-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250514103501.2225951-1-maz@kernel.org>
References: <20250514103501.2225951-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
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

During an invalidation triggered by an MMU notifier, we need to
make sure we can drop the *host* mapping that would have been
translated by the stage-2 mapping being invalidated.

For the moment, the invalidation is pretty brutal, as we nuke
the full IPA range, and therefore any VNCR_EL2 mapping.

At some point, we'll be more light-weight, and the code is able
to deal with something more targetted.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 75 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 59bc665a05134..002d57875a0fb 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -434,6 +434,30 @@ static unsigned int ttl_to_size(u8 ttl)
 	return max_size;
 }
 
+static u8 pgshift_level_to_ttl(u16 shift, u8 level)
+{
+	u8 ttl;
+
+	switch(shift) {
+	case 12:
+		ttl = TLBI_TTL_TG_4K;
+		break;
+	case 14:
+		ttl = TLBI_TTL_TG_16K;
+		break;
+	case 16:
+		ttl = TLBI_TTL_TG_64K;
+		break;
+	default:
+		BUG();
+	}
+
+	ttl <<= 2;
+	ttl |= level & 3;
+
+	return ttl;
+}
+
 /*
  * Compute the equivalent of the TTL field by parsing the shadow PT.  The
  * granule size is extracted from the cached VTCR_EL2.TG0 while the level is
@@ -784,6 +808,53 @@ int kvm_inject_s2_fault(struct kvm_vcpu *vcpu, u64 esr_el2)
 	return kvm_inject_nested_sync(vcpu, esr_el2);
 }
 
+static void invalidate_vncr(struct vncr_tlb *vt)
+{
+	vt->valid = false;
+	if (vt->cpu != -1)
+		clear_fixmap(vncr_fixmap(vt->cpu));
+}
+
+static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
+		return;
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
+		u64 ipa_start, ipa_end, ipa_size;
+
+		/*
+		 * Careful here: We end-up here from an MMU notifier,
+		 * and this can race against a vcpu not being onlined
+		 * yet, without the pseudo-TLB being allocated.
+		 *
+		 * Skip those, as they obviously don't participate in
+		 * the invalidation at this stage.
+		 */
+		if (!vt)
+			continue;
+
+		if (!vt->valid)
+			continue;
+
+		ipa_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
+							    vt->wr.level));
+		ipa_start = vt->wr.pa & (ipa_size - 1);
+		ipa_end = ipa_start + ipa_size;
+
+		if (ipa_end <= start || ipa_start >= end)
+			continue;
+
+		invalidate_vncr(vt);
+	}
+}
+
 void kvm_nested_s2_wp(struct kvm *kvm)
 {
 	int i;
@@ -796,6 +867,8 @@ void kvm_nested_s2_wp(struct kvm *kvm)
 		if (kvm_s2_mmu_valid(mmu))
 			kvm_stage2_wp_range(mmu, 0, kvm_phys_size(mmu));
 	}
+
+	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
 }
 
 void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
@@ -810,6 +883,8 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 		if (kvm_s2_mmu_valid(mmu))
 			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
 	}
+
+	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
 }
 
 void kvm_nested_s2_flush(struct kvm *kvm)
-- 
2.39.2


