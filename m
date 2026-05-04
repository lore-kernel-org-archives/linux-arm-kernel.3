Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B3DCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC+QCMBPXdQWF+dL8GXMYzl+k9Np64sK2GTCcOrjhPY=; b=pdVOjuiSpoyaQE/WT7slS/D3A5
	/JZeN++NTLQqk2MG4Ph3CDDhwCdVvDng7Nv8ycY4PEgqMNVtPCwD+FPX0K1ShBFk09o039Wbh2LEl
	jGAgzPpGLl4RbfZh7ajo4z4TOBBTazEppEU9RXS0MY12Lv/EMgSMEO6OTLnY6z8jNxhmHhujPLXJF
	eJ8oSKZfgTK3KhAYN4p2qvxXpVqiPVjVbsi2TCGH4ICoJgOsI80kSZkV1MuUtdSdNzNpXBWWB9xz+
	QVo4v//SeWQAzmunJKaw95c1ktF/nYxgTZ+Z9DtcJy4zsaMLECZ4OOHYVP01lQda9oXtX8JMxo9HN
	VI93jBfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK205-0000000EVPF-11GC;
	Mon, 04 May 2026 22:42:53 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK202-0000000EVNF-1Ioi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:42:51 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b258636d16so49473885ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934569; x=1778539369; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vC+QCMBPXdQWF+dL8GXMYzl+k9Np64sK2GTCcOrjhPY=;
        b=L8lbXO0E+wCIijEyy0BPva8CyfLUnnPuVZzMm7CAzFt+7G62zqWZ8FmxdNYIXQk2p3
         v+6xz5DVZyWGqEPxYRuM66aq2wnrUs8wQb21nQt2dO3jpzEFD1ab1g9g8k8WQ5VSyfvc
         Ti0BQb5M97HmYv/3cPkO1Q+rSwlqLTDEFlyY8l9bgD/13ZyM4zw1znTFKhUJs/eAx6Lr
         0hbA9ifBohu/TWUtzf3+oyjfQ2RwzWf5AiL+Yiss4qM8ZzyiOzJ04Dk8cV7t5LOclSNm
         S67c60PRLCX4dklm4lZM4JlnDVAufTxXNuTDeNR3lEaWaEu7oGeWEPAbT+tQqsmQ+4WS
         q3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934569; x=1778539369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vC+QCMBPXdQWF+dL8GXMYzl+k9Np64sK2GTCcOrjhPY=;
        b=nQHsBmEmdLwrPzmFRqL22LdyUA0N5aG9jDeVUEdxmUaZWHNwaPlsrpC6HAMoL1hrq7
         QNPcoxbyq66LNYUvoMEP968F4L5bidTQ+5oYtV9txwcYREUXPtxxp/RRsPijlECR+Drf
         L16V1gZHGmVIS3alpJdaDV/cJP3plhsHxN440y3nINOFYul85d+RkeJG44fF0dVa33pw
         pIOVgJ57CU6pgra8+R21y4Esdb+mU4xOwshzWhBLiVpcnBatB1FregRJZGGMwp3Y6OwA
         ZCNXEs9drutVDKDeQmyXGVlef+WaUblbksnD8ntMqKQPxxwLbK8rSzBDNoOF0HgOx7a4
         PzuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7eSXAILll8y8cu9mQX8JJa/CPCslGSu4O76psxtUH4Wgw52BbPe1XyP8qd4PuUh+ggRgM7x5u71qwkphog1xq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0FD/EEPOe8l80FWPXdWBSL0QtuKj58HYVo8waMrNDs9UsdYMP
	bjA1H+PZ/GBo/wwssOA2qeXZse6E++A7oAFXNd60V27QHpXKFXQKL8ywBoZ8niBFQUD7wyIvWiJ
	udZ13DnNOsTO+UoWJDRpGMA==
X-Received: from plmx11.prod.google.com ([2002:a17:902:fe8b:b0:2ae:3bca:37a5])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4b0d:b0:2b0:6d33:e7c0 with SMTP id d9443c01a7336-2ba535e2df5mr4309355ad.1.1777934568708;
 Mon, 04 May 2026 15:42:48 -0700 (PDT)
Date: Mon,  4 May 2026 22:42:11 +0000
In-Reply-To: <20260504224213.1049426-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260504224213.1049426-1-jthoughton@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504224213.1049426-5-jthoughton@google.com>
Subject: [PATCH 4/5] KVM: Hold MMU lock exclusively when calling kvm_arch_flush_shadow_all()
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_154250_356035_9FCD154F 
X-CRM114-Status: GOOD (  17.57  )
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

All architectures that non-trivially implement this function grab the
KVM MMU lock exclusively to prevent things like double-freeing of page
table entries and caches. Do so generically to somewhat simplify the
architecture-specific logic.

Without this change, it is possible for kvm_arch_flush_shadow_all() to
be called on the same `kvm` at the same time: if the `kvm`'s mm is
destroyed (exit_mm()) at the same time to the final reference to the
`kvm` is dropped.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/nested.c  | 2 +-
 arch/loongarch/kvm/mmu.c | 4 +++-
 arch/mips/kvm/mips.c     | 2 +-
 arch/riscv/kvm/mmu.c     | 4 ++--
 arch/riscv/kvm/vm.c      | 2 ++
 arch/x86/kvm/mmu/mmu.c   | 4 +---
 virt/kvm/kvm_main.c      | 3 +++
 7 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 977598bff5e6..ba2e6c98bd45 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1190,7 +1190,7 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
 	int i;
 
-	guard(write_lock)(&kvm->mmu_lock);
+	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 5dbce9b18e1c..120001da26e4 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -486,7 +486,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
-	kvm_flush_range(kvm, 0, kvm->arch.gpa_size >> PAGE_SHIFT, 1);
+	lockdep_assert_held(&kvm->mmu_lock);
+
+	kvm_flush_range(kvm, 0, kvm->arch.gpa_size >> PAGE_SHIFT, 0);
 }
 
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 463b6c4aa62c..4ad9e21a3321 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -180,7 +180,7 @@ long kvm_arch_dev_ioctl(struct file *filp, unsigned int ioctl,
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
-	guard(spinlock)(&kvm->mmu_lock);
+	lockdep_assert_held(&kvm->mmu_lock);
 
 	/* Flush whole GPA */
 	kvm_mips_flush_gpa_pt(kvm, 0, ~0);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024270..c1b9333f17eb 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -558,7 +558,8 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 	struct kvm_gstage gstage;
 	void *pgd = NULL;
 
-	spin_lock(&kvm->mmu_lock);
+	lockdep_assert_held(&kvm->mmu_lock);
+
 	if (kvm->arch.pgd) {
 		kvm_riscv_gstage_init(&gstage, kvm);
 		kvm_riscv_gstage_unmap_range(&gstage, 0UL,
@@ -568,7 +569,6 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 		kvm->arch.pgd_phys = 0;
 		kvm->arch.pgd_levels = 0;
 	}
-	spin_unlock(&kvm->mmu_lock);
 
 	if (pgd)
 		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083feeb76..f704a64bfc48 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -38,7 +38,9 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	r = kvm_riscv_gstage_vmid_init(kvm);
 	if (r) {
+		spin_lock(&kvm->mmu_lock);
 		kvm_riscv_mmu_free_pgd(kvm);
+		spin_unlock(&kvm->mmu_lock);
 		return r;
 	}
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 892246204435..6e6f94046b3f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -7352,7 +7352,7 @@ static void kvm_mmu_zap_all(struct kvm *kvm)
 	LIST_HEAD(invalid_list);
 	int ign;
 
-	write_lock(&kvm->mmu_lock);
+	lockdep_assert_held_write(&kvm->mmu_lock);
 restart:
 	list_for_each_entry_safe(sp, node, &kvm->arch.active_mmu_pages, link) {
 		if (WARN_ON_ONCE(sp->role.invalid))
@@ -7367,8 +7367,6 @@ static void kvm_mmu_zap_all(struct kvm *kvm)
 
 	if (tdp_mmu_enabled)
 		kvm_tdp_mmu_zap_all(kvm);
-
-	write_unlock(&kvm->mmu_lock);
 }
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 89489996fbc1..f5affd3bfda8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -340,7 +340,10 @@ void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
 
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
+	KVM_MMU_LOCK(kvm);
 	kvm_arch_flush_shadow_all(kvm);
+	KVM_MMU_UNLOCK(kvm);
+
 	kvm_arch_guest_memory_reclaimed(kvm);
 }
 
-- 
2.54.0.545.g6539524ca2-goog


