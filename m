Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A162FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1N0sOUo680TdCGyuto6pqZHuf408XlOJM+wYOh/4lYw=; b=rl5jnqS+xCc78G6EeLqs/ajdCp
	n7V69HlLzhTt/cWyrVsRhfzqTOMgcjCG0uBMIKfY6FSXu7pu1lOZhLCjoj1tJcnZYYzGFUlx9tP3c
	PjySWUZIA4kOQLUax8phdnK0x/F5++sxW5C+QZylpbau2wSiatwsTBhZJeaiYAHI5TbwHFFyrqC11
	P9HF/aH4JInEwt4+0FuyUZ3+J+CN25uHPAOn22iyqHXJnY9Frtqh40aWyjwDIOX9BvBIHmB7TE2Mo
	sb+QPR5IbFcqxbPST6pdnnPDEU4NRtdwBfNb8x66n3dgSHJY2OazG2RXC3nv9aWOnfwt6ZajqANQR
	7udOSn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e6l-0000000BKQo-0mSl;
	Wed, 23 Apr 2025 17:42:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bok-0000000AvqH-2Wtj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C565615EB;
	Wed, 23 Apr 2025 15:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4EBC4CEE3;
	Wed, 23 Apr 2025 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421317;
	bh=iqPl/CjPWZmIy/wD6gTTXYinaag2iqtsZvdP8NH+rPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O2JIbN+Qlp1z172C3jC/uR9tQucCJp6KhYiO9/0dZ/lXx/8erwZlUJJU9/8MwFsSc
	 F0OI+No7Wn/vSPG6Brqg7d9rTkPGxqup6BJN2oZSrofdIxcLPEUQEi7XxqKCAAFcuP
	 yZVBm27zd0mjyGvNh9KsE7FMh959qOdU0SQDSufJG5Vb2UwdtyhPWpraUT08rIePYa
	 6T6x4gqX9DPpq74Tc103Hh39Odjx2hQUdZRRaxAbd8oWMZ/IQR+ifIkJJc7uePHF7W
	 yYRh9aDqscczr2rJTHvt57cdYJpTVxsj0oqlgO1hyl0kzp2MK043NiKWKzWSl1doTY
	 v3hhbiLroZ6Xg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u7boh-0082xr-V0;
	Wed, 23 Apr 2025 16:15:16 +0100
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
Subject: [PATCH v3 11/17] KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers
Date: Wed, 23 Apr 2025 16:15:02 +0100
Message-Id: <20250423151508.2961768-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250423151508.2961768-1-maz@kernel.org>
References: <20250423151508.2961768-1-maz@kernel.org>
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
index f4f14bbdef277..ed3599e8dd06a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -433,6 +433,30 @@ static unsigned int ttl_to_size(u8 ttl)
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
@@ -783,6 +807,53 @@ int kvm_inject_s2_fault(struct kvm_vcpu *vcpu, u64 esr_el2)
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
@@ -795,6 +866,8 @@ void kvm_nested_s2_wp(struct kvm *kvm)
 		if (kvm_s2_mmu_valid(mmu))
 			kvm_stage2_wp_range(mmu, 0, kvm_phys_size(mmu));
 	}
+
+	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
 }
 
 void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
@@ -809,6 +882,8 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 		if (kvm_s2_mmu_valid(mmu))
 			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
 	}
+
+	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
 }
 
 void kvm_nested_s2_flush(struct kvm *kvm)
-- 
2.39.2


