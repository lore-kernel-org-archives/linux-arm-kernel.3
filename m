Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5711310F3DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 14:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lomb60nLiRQE+KKnEJ5kdC3m9BxENVtC9rkPLGykIZk=; b=EqE66tYU1tH9hqNivKxxZcs88P
	qjbDK6wdAJ0sdVl9onDyzBMOyUfKJugOQdbi94fYzFPhu/jQgQ8kXMQeU9OS1qQBiw/heygvK8lc5
	kDmDIwHtumzPVdLAJYHNRS05KM0Z5bcrWbr2R+Clssh7OFqPmiC4KEDLjyXz1Y/6V4tFh4B17nZLz
	6jQzWuQ1V/KV5waL9QTOrzM/V0FakUH94ikwubyzbrnMzxrOFDV+ELCBMOS5+PA/XGDdiXT+5d1Bc
	KWCgOoFj1xf2OwwK9z0doq4GN26RnAmde0iRkpT8ZZqWLXuph1BQrNvcONqp0GcLpDTpnvSsQeS6u
	9AOnCLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6V4P-000000092RC-3VI2;
	Sat, 28 Mar 2026 14:55:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6V4L-000000092Pz-1UNm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 14:55:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5382464D;
	Sat, 28 Mar 2026 07:55:14 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5725B3FA1F;
	Sat, 28 Mar 2026 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774709720; bh=AYLvh7lUWIwSy3ntEJvqDbumamhIKM4p9dd0UtbiXN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxoJpyNFMkbnYoMDQ/5NIz1+TEmHMgFZPsCTSFKGTLNblbhUClxaXI32bVhKBn9se
	 hiHhwSGqXxjTDfs4T4jwGjr1tzrPGDbQF/z6R2MAJtoNkM+kLYNCcKWJcUklsDBSV8
	 HN3WsNKdj3a8atvkr6z7DIdslhhCnO6RNvUwb+Jk=
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
Subject: [PATCH 2/2] KVM: arm64: Refactor stage2 mmu tear down functions
Date: Sat, 28 Mar 2026 14:54:39 +0000
Message-ID: <20260328145439.2501562-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328145439.2501562-1-weilin.chang@arm.com>
References: <20260328145439.2501562-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_075521_512502_86D94996 
X-CRM114-Status: GOOD (  11.71  )
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

With NV, "stage2 mmu" becomes ambiguous, it could refer to the canonical
one or one of the nested ones. Modify kvm_uninit_stage2_mmu() so that it
can uninitialize both the canonical s2 mmu and nested s2 mmus.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_mmu.h | 2 +-
 arch/arm64/kvm/mmu.c             | 8 +++++---
 arch/arm64/kvm/nested.c          | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 960b6aed4ffa..4b49aabecbf3 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -176,7 +176,7 @@ void kvm_stage2_wp_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t e
 
 void stage2_unmap_vm(struct kvm *kvm);
 int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long type);
-void kvm_uninit_stage2_mmu(struct kvm *kvm);
+void kvm_uninit_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu);
 void kvm_free_stage2(struct kvm_s2_mmu *mmu);
 int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 			  phys_addr_t pa, unsigned long size, bool writable);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index b19b9a9b3c27..a2affd70eca6 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1018,10 +1018,12 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	return err;
 }
 
-void kvm_uninit_stage2_mmu(struct kvm *kvm)
+void kvm_uninit_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
 {
-	kvm_free_stage2(&kvm->arch.mmu);
-	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
+	kvm_free_stage2(mmu);
+
+	if (!kvm_is_nested_s2_mmu(kvm, mmu))
+		kvm_mmu_free_memory_cache(&mmu->split_page_cache);
 }
 
 static void stage2_unmap_memslot(struct kvm *kvm,
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 772d922cf0ee..5eba94d6cc67 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1194,12 +1194,12 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
 
 		if (!WARN_ON(atomic_read(&mmu->refcnt)))
-			kvm_free_stage2(mmu);
+			kvm_uninit_stage2_mmu(kvm, mmu);
 	}
 	kvfree(kvm->arch.nested_mmus);
 	kvm->arch.nested_mmus = NULL;
 	kvm->arch.nested_mmus_size = 0;
-	kvm_uninit_stage2_mmu(kvm);
+	kvm_uninit_stage2_mmu(kvm, &kvm->arch.mmu);
 }
 
 /*
-- 
2.43.0


