Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7138C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afnZ0jJXOhQY7VGkttvC9Hi+PEuDYghXStcmJck84J4=; b=QIm/W80BWplxxpkPfAS56rfxOy
	CAq1Gp6jmCgL56XyGPHSLElAvz6j+031TSJAiUVbV5w7o3KxKM9UmiIaRg3uvNp2mppgYVLJwdBtO
	77khKyxDtm5iOqbxfiryZjiKdz8LOAZ6WTkk0G6DxaH4AylWLhlwjWlatC3CZ0i37QVA7QXvYPrhL
	bbz3fIle/g/YPu/3eUvYLKERVRwqi45AXfqemtT3HgcKf1YGGmjqUkLrRzu/PMvKArJ+k1ktBAdOO
	ti+UAwvM17jJB2dTQd6Q0ERxtMSN2Y3lYpxLcULqBpH5RoXtYDzoDgydbfHrexqhbKzesaEo8b19m
	+49fJ1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupE8-00000002WTT-2Uop;
	Fri, 14 Aug 2026 10:33:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupE7-00000002WSV-0Z3X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 10:33:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69264601DE;
	Fri, 14 Aug 2026 10:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2601F00A3D;
	Fri, 14 Aug 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786703606;
	bh=afnZ0jJXOhQY7VGkttvC9Hi+PEuDYghXStcmJck84J4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bBzNbLFOmSiE6nkWmpu3CnLBhWL9K9NITZ9sqqvp7yohSr/9HEanfI5OpN925RN69
	 G3r49KTn4S06vIbvAEZD/VtTy4qfkZSXMIkeP8KLciPxxFR/JGYgYt1sEfacpQwp/a
	 gTA2DO6PQRZ978mVimQJRNAyY7u9JVEFOzzrIPwGfI8oLK9mO7fuoZQuvLs0sc8H8I
	 xcKZmtX8TvONB5AhqsBoYQHLn6ZSGNWLHuHaA6NQsV8CI773oldXxLQvFN+ql5dCRE
	 tcRR/rwqaDb7/1d7G8Z6T/48GbEMGLkInNkCFJ3m7bq/5Xa/EOOxQQca3eOIcLVEYq
	 6Kxl/Dh8jaBTQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wupE4-0000000FdQO-15I6;
	Fri, 14 Aug 2026 10:33:24 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	ljs@kernel.org,
	Shen Yongchao <grayhat@foxmail.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] KVM: arm64: nv: Delay freeing of shadow S2 structures until VM destruction
Date: Fri, 14 Aug 2026 11:32:30 +0100
Message-ID: <20260814103230.858578-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260814103230.858578-1-maz@kernel.org>
References: <20260814103230.858578-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, ljs@kernel.org, grayhat@foxmail.com, kmehltretter@gmail.com, weilin.chang@arm.com, stable@vger.kernel.org
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

We free the shadow S2 structures from kvm_arch_flush_shadow_all(), which
is a Bad Idea(tm). Freeing the page tables is fair game (this is what
this callback is for), but freeing the container that could still be
referenced by another part of the system is not great.

Instead, grow separate destructors that gets called when we tear the VM
down for good. From there, we can nuke both the individual MMUs as well
as the global array that points to them, safe in the knowledge that the
vcpus themselves have been destroyed already.

Note that similarly to what happens for the canonical S2 MMU, we need to
manage the freeing of the page tables both in kvm_arch_flush_shadow_all
(called on address space teardown) and VM teardown (as a result of
closing the VM fd, amongst others), as there is no guaranteed ordering
between these two events.

Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/kvm_nested.h |  1 +
 arch/arm64/kvm/arm.c                |  4 ++--
 arch/arm64/kvm/nested.c             | 32 ++++++++++++++++++++---------
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 5b8edb2e8a87d..586026e859030 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -67,6 +67,7 @@ static inline u64 translate_ttbr0_el2_to_ttbr0_el1(u64 ttbr0)
 extern bool forward_smc_trap(struct kvm_vcpu *vcpu);
 extern bool forward_debug_exception(struct kvm_vcpu *vcpu);
 extern int kvm_init_nested(struct kvm *kvm);
+extern void kvm_destroy_nested(struct kvm *kvm);
 extern int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu);
 extern void kvm_init_nested_s2_mmu(struct kvm_s2_mmu *mmu);
 extern struct kvm_s2_mmu *lookup_s2_mmu(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 7607173c1a40c..2b069c6440669 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -269,7 +269,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 err_uninit_mmu:
 	kvm_uninit_stage2_mmu(kvm);
-	kvfree(kvm->arch.nested_mmus);
+	kvm_destroy_nested(kvm);
 err_free_cpumask:
 	free_cpumask_var(kvm->arch.supported_cpus);
 err_unshare_kvm:
@@ -327,7 +327,7 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 
 	kvm_unshare_hyp(kvm, kvm + 1);
 
-	kvfree(kvm->arch.nested_mmus);
+	kvm_destroy_nested(kvm);
 	kvm_arm_teardown_hypercalls(kvm);
 }
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 254cbd8703b3d..d0c05db554b1c 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -55,6 +55,27 @@ int kvm_init_nested(struct kvm *kvm)
 	return kvm->arch.nested_mmus ? 0 : -ENOMEM;
 }
 
+static void kvm_uninit_shadow_stage2_mmu(struct kvm *kvm)
+{
+	for (int i = 0; i < kvm->arch.nested_mmus_size; i++) {
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
+
+		if (!WARN_ON(atomic_read(&mmu->refcnt)))
+			kvm_free_stage2_pgd(mmu);
+	}
+}
+
+void kvm_destroy_nested(struct kvm *kvm)
+{
+	kvm_uninit_shadow_stage2_mmu(kvm);
+
+	for (int i = 0; i < kvm->arch.nested_mmus_size; i+= S2_MMU_PER_VCPU)
+		kvfree(kvm->arch.nested_mmus[i]);
+
+	kvm->arch.nested_mmus_size = 0;
+	kvfree(kvm->arch.nested_mmus);
+}
+
 static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
 {
 	/*
@@ -1310,16 +1331,7 @@ void kvm_nested_s2_flush(struct kvm *kvm)
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
-	for (int i = kvm->arch.nested_mmus_size - 1; i >= 0; i--) {
-		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
-
-		if (!WARN_ON(atomic_read(&mmu->refcnt)))
-			kvm_free_stage2_pgd(mmu);
-
-		if ((i % S2_MMU_PER_VCPU) == 0)
-			kvfree(mmu);
-	}
-	kvm->arch.nested_mmus_size = 0;
+	kvm_uninit_shadow_stage2_mmu(kvm);
 	kvm_uninit_stage2_mmu(kvm);
 }
 
-- 
2.47.3


