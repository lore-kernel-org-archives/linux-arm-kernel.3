Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446C110F3DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 14:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLLpFqB+ZIyLngxBxLDj8CBL+XIY5yTMOd9iEghgbsw=; b=RflB/qqc+VctZaDXcul2EpjcWH
	Kj6XXqGaMBRp+/qDt8Zj7r1nn5rkQNzCYHHSZZOO6FeatZWNdoCnXKWKj0wRHDWc8hao61ix/Q4vl
	06mPHEeQ0Au27lTyESufCU2t0gcsDtuI1fH0iCURSXcelXNc9qgF/YElJB4Wj0FbPws44Au4Q2zs7
	t+Ro13EDSbC3AY4dc9aSc9xNwCjoARMM2IxLBvFTGuBS0GUKmeoioEhgXNAhuS4Du4APnrqzjj6zJ
	7Zs4EKB7eMrWtknknFjb8uj0rceYNuioZ7DLN16Jrs/IMumah4gcBzkYoNJ3wD+9QkkILzXFjVf3/
	4AvbIBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6V4I-000000092P8-1wSt;
	Sat, 28 Mar 2026 14:55:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6V4G-000000092OZ-28kK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 14:55:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 983954649;
	Sat, 28 Mar 2026 07:55:08 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AF383F905;
	Sat, 28 Mar 2026 07:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774709714; bh=WiaT6yqhX7+O5GUFv1mPhJKhjKsn3CHDlnrK3rSI1jE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1HZkWkxfqqsJc8uQT/Szy40g32f/TZ/Of6P21T3Ww0Dd2z7OP0VNST0WxSacZdr8
	 9jRXVOgd6r+pr5N5UC4r/HnfLJ1MV3PgIxj/EkpD3EI2GXG3GHKBOGJP/r8Wcavicd
	 m40RRqy2nJ+d6MNIWYyzZk9SMdbSTmRrv1Ac32Ck=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 1/2] KVM: arm64: Rename kvm_free_stage2_pgd()
Date: Sat, 28 Mar 2026 14:54:38 +0000
Message-ID: <20260328145439.2501562-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328145439.2501562-1-weilin.chang@arm.com>
References: <20260328145439.2501562-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_075516_677591_AB215F67 
X-CRM114-Status: GOOD (  11.18  )
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

kvm_free_stage2_pgd() reads like it is only freeing the top level page
tables (pgd), but it frees every level in kvm_stage2_destroy().

Rename it to kvm_free_stage2() instead.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_mmu.h | 2 +-
 arch/arm64/kvm/mmu.c             | 4 ++--
 arch/arm64/kvm/nested.c          | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 01e9c72d6aa7..960b6aed4ffa 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -177,7 +177,7 @@ void kvm_stage2_wp_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t e
 void stage2_unmap_vm(struct kvm *kvm);
 int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long type);
 void kvm_uninit_stage2_mmu(struct kvm *kvm);
-void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu);
+void kvm_free_stage2(struct kvm_s2_mmu *mmu);
 int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 			  phys_addr_t pa, unsigned long size, bool writable);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 17d64a1e11e5..b19b9a9b3c27 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1020,7 +1020,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 
 void kvm_uninit_stage2_mmu(struct kvm *kvm)
 {
-	kvm_free_stage2_pgd(&kvm->arch.mmu);
+	kvm_free_stage2(&kvm->arch.mmu);
 	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
 }
 
@@ -1094,7 +1094,7 @@ void stage2_unmap_vm(struct kvm *kvm)
 	srcu_read_unlock(&kvm->srcu, idx);
 }
 
-void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
+void kvm_free_stage2(struct kvm_s2_mmu *mmu)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	struct kvm_pgtable *pgt = NULL;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 883b6c1008fb..772d922cf0ee 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -110,7 +110,7 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 
 	if (ret) {
 		for (int i = kvm->arch.nested_mmus_size; i < num_mmus; i++)
-			kvm_free_stage2_pgd(&kvm->arch.nested_mmus[i]);
+			kvm_free_stage2(&kvm->arch.nested_mmus[i]);
 
 		free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
 		vcpu->arch.ctxt.vncr_array = NULL;
@@ -1194,7 +1194,7 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
 
 		if (!WARN_ON(atomic_read(&mmu->refcnt)))
-			kvm_free_stage2_pgd(mmu);
+			kvm_free_stage2(mmu);
 	}
 	kvfree(kvm->arch.nested_mmus);
 	kvm->arch.nested_mmus = NULL;
-- 
2.43.0


