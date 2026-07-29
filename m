Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2FCC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AN1FzAefzA61KlLKqNFjJJaocWdRcH+GLOTsXDoSoIw=; b=15AQ9wVZ2lgw5W3vmgApEtvHtf
	aofX7FmVKSBr/4Uq1drx/NP8avXxKv8uTbrTSWpbT/qUangoGXk3pSr9itTlmRQZ4MToZbUuyiMY9
	0JqidLY1+Klv8HAk0xw3HuYupEUTJ6JQ9FqQgw5BoQ1wPOrbhszrT5R0di2lvIDs0lfWEHVws3jCO
	M+QCcrt/Gmvxn5jRaYofof7oDLroVvvo/v0AxsCV0LCs/b/1E8KpYV7mjaMRlQP7kyNkplvgMb/Hq
	uE0EZ703TBtnEg71j/KXB4kMKufNhlClz5UP3kpsFd6EGW3/QIYkx02hwuz3UgBcystLlgzyZVS4S
	iLdA6edA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1oj-00000007alR-42Lr;
	Wed, 29 Jul 2026 10:47:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1oS-00000007aYK-1Tzr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:47:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A0711688;
	Wed, 29 Jul 2026 03:46:54 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 486A43F66F;
	Wed, 29 Jul 2026 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785322018; bh=4khYqylUpukD41WfoeMeH0nQNHvx+xJKbgU5VMe1emQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NGfhb8SqKa01Lyjr90afa+7XRefGzvSrDnoztEcplS5uwYPXICaueFrkpcMy9ezZu
	 TIO3i0FRFd5wDmvIiTG9nGADTL6Kh+fjgz1ncTB4y3TzsUU7AaLQ/8NLI1jnyvAbFy
	 QUpCs3iifGNKpY9CDLCK2We3ac2xcqKxq9ldbcVU=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Morse <james.morse@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v3 09/11] kvm/dirty_ring: Add arch-generic interface for hw-accelerated dirty-ring cleaning
Date: Wed, 29 Jul 2026 11:45:44 +0100
Message-ID: <20260729104548.3439958-10-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729104548.3439958-1-leo.bras@arm.com>
References: <20260729104548.3439958-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3599; i=leo.bras@arm.com; h=from:subject; bh=4khYqylUpukD41WfoeMeH0nQNHvx+xJKbgU5VMe1emQ=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLIyb16rKFdYF7PxckjHp+sT5AU99kw+LP/j+jGuPsNLm QbT2WKFOkpZGMS4GGTFFFlkH81fxfN9SsaRKz8WwMxhZQIZwsDFKQATqb3P8L+ycyXHxU8/TW4t blARepFqVNZ+3/n3rStS14LFJfSrLuYxMlxOlV/X2fHiySG153Ud55gMipuf/3P9NGPpj40SMx6 ujmMBAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_034700_478515_5AFCE50C 
X-CRM114-Status: GOOD (  17.37  )
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

Introduce kvm_arch_dirty_ring_clear() that allow implementation of
arch-specific hardware-accelerated dirty-ring routines.

A call to that is added on kvm_dirty_ring_reset() and will fall back to
software version if not implemented, or any error was detected in the
arch-specific routine.

For an arch to implement this function, it's required to provide it in a
asm/kvm_dirty_bit.h and have CONFIG_HAVE_KVM_HW_DIRTY_BIT=y on building.

If the arch does not implement it, and thus lack above config, the
introduced snippet is expected to be compiled-out and have zero impact at
runtime.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 include/linux/kvm_dirty_bit.h | 7 +++++++
 virt/kvm/dirty_ring.c         | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/kvm_dirty_bit.h b/include/linux/kvm_dirty_bit.h
index fa4f6b67b623..8492979d694e 100644
--- a/include/linux/kvm_dirty_bit.h
+++ b/include/linux/kvm_dirty_bit.h
@@ -11,17 +11,24 @@
 
 static inline int kvm_arch_dirty_log_clear(struct kvm *kvm,
 					   struct kvm_memory_slot *memslot,
 					   struct kvm_clear_dirty_log *log,
 					   unsigned long *bitmap,
 					   bool *flush)
 {
 	return -ENXIO;
 }
 
+static inline int kvm_arch_dirty_ring_clear(struct kvm *kvm,
+					    struct kvm_dirty_ring *ring,
+					    int *nr_entries_reset)
+{
+	return -ENXIO;
+}
+
 #else /* CONFIG_HAVE_KVM_HW_DIRTY_BIT */
 
 #include <asm/kvm_dirty_bit.h>
 
 #endif /* CONFIG_HAVE_KVM_HW_DIRTY_BIT */
 
 #endif /* __KVM_DIRTY_BIT_H__ */
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 807c45fb1fc7..3fa62894f3d2 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -1,20 +1,21 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * KVM dirty ring implementation
  *
  * Copyright 2019 Red Hat, Inc.
  */
 #include <linux/kvm_host.h>
 #include <linux/kvm.h>
 #include <linux/vmalloc.h>
 #include <linux/kvm_dirty_ring.h>
+#include <linux/kvm_dirty_bit.h>
 #include <trace/events/kvm.h>
 #include "kvm_mm.h"
 
 int __weak kvm_cpu_dirty_log_size(struct kvm *kvm)
 {
 	return 0;
 }
 
 u32 kvm_dirty_ring_get_rsvd_entries(struct kvm *kvm)
 {
@@ -126,20 +127,23 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
 	struct kvm_dirty_gfn *entry;
 
 	/*
 	 * Ensure concurrent calls to KVM_RESET_DIRTY_RINGS are serialized,
 	 * e.g. so that KVM fully resets all entries processed by a given call
 	 * before returning to userspace.  Holding slots_lock also protects
 	 * the various memslot accesses.
 	 */
 	lockdep_assert_held(&kvm->slots_lock);
 
+	if (kvm_arch_dirty_ring_clear(kvm, ring, nr_entries_reset) >= 0)
+		goto out;
+
 	while (likely((*nr_entries_reset) < INT_MAX)) {
 		if (signal_pending(current))
 			return -EINTR;
 
 		entry = &ring->dirty_gfns[ring->reset_index & (ring->size - 1)];
 
 		if (!kvm_dirty_gfn_harvested(entry))
 			break;
 
 		next_slot = READ_ONCE(entry->slot);
@@ -206,20 +210,21 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
 	 * always be left pending.
 	 */
 	if (mask)
 		kvm_reset_dirty_gfn(kvm, cur_slot, cur_offset, mask);
 
 	/*
 	 * The request KVM_REQ_DIRTY_RING_SOFT_FULL will be cleared
 	 * by the VCPU thread next time when it enters the guest.
 	 */
 
+out:
 	trace_kvm_dirty_ring_reset(ring);
 
 	return 0;
 }
 
 void kvm_dirty_ring_push(struct kvm_vcpu *vcpu, u32 slot, u64 offset)
 {
 	struct kvm_dirty_ring *ring = &vcpu->dirty_ring;
 	struct kvm_dirty_gfn *entry;
 
-- 
2.55.0


