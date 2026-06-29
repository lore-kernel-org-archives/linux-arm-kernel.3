Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDDBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGVqpXdANocol0MqNw4/r1A6VypJfTPh2LSKPcPPQxY=; b=I/96aKVTLAX4aJTQOWLz75C0Oy
	VRbeCE4H//wzVoG9XgLGFdkOaBuAVUycnb7xpfOF6Zs0+WydSNo/ebBmMzExNIK1K6cCRe8/XkbsW
	ELvceWgdkrb4x/twTJK4ZzTfzOOAb/GQskARtiGy0zr2znkSzoileFOMeUmX3ZGsE0i3nB+sb5zOA
	UMYNM27j99TtGioo6mevkyqH9y7IImj/SMu3yPmsKuSEDLfMUUYuNqnrJcDu9eiaITNU6SIzcGjae
	vevbdvsarnl723jYBMjdxDJP1EWJj/8jVXI5LBu3vHh2rblxHB2cQvtdGNHuZdNGzPUKMHnE+cnRd
	hLHd6/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA1P-0000000EQ5M-3IJ0;
	Mon, 29 Jun 2026 11:19:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA1J-0000000EPzw-2eJB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:19:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 409D53565;
	Mon, 29 Jun 2026 04:19:16 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 807843F905;
	Mon, 29 Jun 2026 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731960; bh=H1H7xLhZTiWLAZ00k8s2MDbYagBYOn2VOlBgJhEBaTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xb6wlDDccOT9ay2vnXMatlaGmrOvX4aC9DZLXLKNrsJre2JRQFPxlFhDYMs6JzqQS
	 8Qy3JO1+33UvQrZ24+tMWwsBQEdca91s3Wo+loUVfnRH5xCp4PgkoSVivFwPkb7+ql
	 tCUmkJwNKyu/hVNO3wMopFCCphpAzN8dUH6LVjtA=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 11/13] kvm/dirty_ring: Add arch-generic interface for hw-accelerated dirty-ring cleaning
Date: Mon, 29 Jun 2026 12:17:59 +0100
Message-ID: <20260629111820.1873540-12-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629111820.1873540-1-leo.bras@arm.com>
References: <20260629111820.1873540-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3023; i=leo.bras@arm.com; h=from:subject; bh=H1H7xLhZTiWLAZ00k8s2MDbYagBYOn2VOlBgJhEBaTs=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKcQhJLnxkdevuk5NFsUz3DBuVrWhq39j64VNwpr8CTe syUoelJRykLgxgXg6yYIovso/mreL5PyThy5ccCmDmsTCBDGLg4BWAiUusYGY4dW+0n0H/0Z/68 qTIal9YrRFwsf/JOrqdr27Hz83r/nDBi+O+26qIAa9f04z1T3gfcnsf095pa7Bap6QYdcQtmT3z 19y8rAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041921_771884_CBA70A0C 
X-CRM114-Status: GOOD (  16.41  )
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
 virt/kvm/dirty_ring.c         | 4 ++++
 2 files changed, 11 insertions(+)

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
index 42de1a511037..fe4e7da6cc4a 100644
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
+		return 0;
+
 	while (likely((*nr_entries_reset) < INT_MAX)) {
 		if (signal_pending(current))
 			return -EINTR;
 
 		entry = &ring->dirty_gfns[ring->reset_index & (ring->size - 1)];
 
 		if (!kvm_dirty_gfn_harvested(entry))
 			break;
 
 		next_slot = READ_ONCE(entry->slot);
-- 
2.54.0


