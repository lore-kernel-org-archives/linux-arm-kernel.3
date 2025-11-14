Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D0DCE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XlT0t77YW7czSNjqxWEJaK1l8UcMtuJivEvh1sMm2Q=; b=mLUthxgE2+cgNx23A8Npb0TNZP
	HujAtOb2eh7HH4PC2fA8DKOOFdCKyPmSmPi30KU/O6yInOl5HrZTz7ImatslXa2bOEjeBjA/+q+8y
	GC0tb+oEqDVOUXwRdKFspAugkhsoDN9PDC7s+SyiwRVznYrwa6IGvOVhDB59/Tck9iS4wCZMFyGsT
	AT4Cb1+V1nZNeZySdilhAa2GOsG2WU+RAVOhGniC2NJ+xqwgRnXvy0F9C6dVcyrBwPTDsonTAEzgk
	/eOGIvFscvZtEXMh9SO5u3bHVScQaUFddOCJXOPvkYTz4VutBV5ZOVASj/IcsQPC7B0Y7W+Q7kB9m
	jvCep7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwMR-0000000Cgkn-3jVx;
	Fri, 14 Nov 2025 16:09:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwMA-0000000CgKs-1F5v
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8XlT0t77YW7czSNjqxWEJaK1l8UcMtuJivEvh1sMm2Q=; b=iQEume0s9ruAbyKO9VFPKg3gyb
	RhvDzsAxKWbEVoipMbW1RtyMcYpJA+vXS89jzndL+dauCbObRfCQ25522xb9Q/nVaDjjxaOX9jlQK
	T/xz9Dkp4WYO55jORMSgYRxTUGb6zogO4OwjmB7STCsPyS5AM0cDxhMv/QuFah1+EXAfcFdthsnXx
	QjvD9s2C7T0HrEc/x/fvuOy8JsWwEKiOHUXC4cVa+6lEPh7u1ZylNKZh+2igPWiXciqz1FfFjN04J
	UEX+lEt6RZt5zUMCSLY8uSI3rIIrm9nrppjYhrqjVgjhZMOQz5OWLklAfKTwPgcQq6xfL/c1vXVFw
	BTS/CCmg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvUK-00000002vgR-2vSf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:13:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B4AD19F6;
	Fri, 14 Nov 2025 08:08:42 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E06F53F5A1;
	Fri, 14 Nov 2025 08:08:47 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 30/35] KVM: Propagate MMU event to the MMU notifier handlers
Date: Fri, 14 Nov 2025 16:07:11 +0000
Message-ID: <20251114160717.163230-31-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151325_104954_E5AFF9E7 
X-CRM114-Status: GOOD (  11.21  )
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

arm64 will want to perform a different action for MMU notifiers based on
the reason for the notifier. Propagate the reason for the MMU notifier down
to the arch code. Where there is no primary MMU event associated with a
notifier callback, add our own.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 include/linux/kvm_host.h | 17 +++++++++++++++++
 virt/kvm/kvm_main.c      |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5bd76cf394fa..772e75d13af1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -263,12 +263,29 @@ enum kvm_gfn_range_filter {
 	KVM_FILTER_PRIVATE		= BIT(1),
 };
 
+enum kvm_mmu_notifier_event {
+	KVM_MMU_NOTIFY_UNMAP            = MMU_NOTIFY_UNMAP,
+	KVM_MMU_NOTIFY_CLEAR            = MMU_NOTIFY_CLEAR,
+	KVM_MMU_NOTIFY_PROTECTION_VMA   = MMU_NOTIFY_PROTECTION_VMA,
+	KVM_MMU_NOTIFY_PROTECTION_PAGE  = MMU_NOTIFY_PROTECTION_PAGE,
+	KVM_MMU_NOTIFY_SOFT_DIRTY       = MMU_NOTIFY_SOFT_DIRTY,
+	KVM_MMU_NOTIFY_RELEASE          = MMU_NOTIFY_RELEASE,
+	KVM_MMU_NOTIFY_MIGRATE          = MMU_NOTIFY_MIGRATE,
+	KVM_MMU_NOTIFY_EXCLUSIVE        = MMU_NOTIFY_EXCLUSIVE,
+	KVM_MMU_NOTIFY_AGE		= 32,
+	KVM_MMU_NOTIFY_MEMORY_ATTRIBUTES,
+	KVM_MMU_NOTIFY_ARCH1,
+	KVM_MMU_NOTIFY_ARCH2,
+	KVM_MMU_NOTIFY_ARCH3,
+};
+
 struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
 	gfn_t start;
 	gfn_t end;
 	union kvm_mmu_notifier_arg arg;
 	enum kvm_gfn_range_filter attr_filter;
+	enum kvm_mmu_notifier_event event;
 	bool may_block;
 	bool lockless;
 };
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b7a0ae2a7b20..2dce50bcb181 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -521,6 +521,7 @@ struct kvm_mmu_notifier_range {
 	union kvm_mmu_notifier_arg arg;
 	gfn_handler_t handler;
 	on_lock_fn_t on_lock;
+	enum kvm_mmu_notifier_event event;
 	bool flush_on_ret;
 	bool may_block;
 	bool lockless;
@@ -618,6 +619,7 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
 			gfn_range.start = hva_to_gfn_memslot(hva_start, slot);
 			gfn_range.end = hva_to_gfn_memslot(hva_end + PAGE_SIZE - 1, slot);
 			gfn_range.slot = slot;
+			gfn_range.event = range->event;
 			gfn_range.lockless = range->lockless;
 
 			if (!r.found_memslot) {
@@ -660,6 +662,7 @@ static __always_inline int kvm_age_hva_range(struct mmu_notifier *mn,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= flush_on_ret,
+		.event		= KVM_MMU_NOTIFY_AGE,
 		.may_block	= false,
 		.lockless	= IS_ENABLED(CONFIG_KVM_MMU_LOCKLESS_AGING),
 	};
@@ -732,6 +735,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= kvm_mmu_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
+		.event		= (enum kvm_mmu_notifier_event)range->event,
 		.flush_on_ret	= true,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
@@ -808,6 +812,7 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= (void *)kvm_null_fn,
 		.on_lock	= kvm_mmu_invalidate_end,
+		.event		= (enum kvm_mmu_notifier_event)range->event,
 		.flush_on_ret	= false,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
@@ -2482,6 +2487,7 @@ static __always_inline void kvm_handle_gfn_range(struct kvm *kvm,
 
 	gfn_range.arg = range->arg;
 	gfn_range.may_block = range->may_block;
+	gfn_range.event = range->event;
 
 	/*
 	 * If/when KVM supports more attributes beyond private .vs shared, this
@@ -2550,6 +2556,7 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 		.arg.attributes = attributes,
 		.handler = kvm_pre_set_memory_attributes,
 		.on_lock = kvm_mmu_invalidate_begin,
+		.event = KVM_MMU_NOTIFY_MEMORY_ATTRIBUTES,
 		.flush_on_ret = true,
 		.may_block = true,
 	};
@@ -2559,6 +2566,7 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 		.arg.attributes = attributes,
 		.handler = kvm_arch_post_set_memory_attributes,
 		.on_lock = kvm_mmu_invalidate_end,
+		.event = KVM_MMU_NOTIFY_MEMORY_ATTRIBUTES,
 		.may_block = true,
 	};
 	unsigned long i;
-- 
2.51.2


