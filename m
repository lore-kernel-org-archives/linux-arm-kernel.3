Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339CDCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekdmkcXW48B9CD1tkp3RfBESf/cr31oHV89C5tJaqcI=; b=yCV1i6hi9ihbYHfImlroQn43Fc
	mQB56zPacoHAPsnq7dT7w3uYwB1G/hwIc1csV6Mt3rJ+s3RmZxLw8fd+S3Ql5j0HhEXnjvZu2YZr6
	Y3d98QXpPPCCXaQhjS6OlLXM5NgRcm+CoV0MhJdmSfUPmYNY7q1rjeu1uYXxUAwrfSMARBriZ1Rh7
	vNMzEKgxSwXteW7Zik2RnFuJ2CSHVoPT4Q6MGFwyvg1v7YaS+TGDSzN+Hr42UYY/4Cri/wyIIm7Ep
	EZ+GXnWZ1hPXEE6Na/BpHtGEcCrBeuBwA/yfMJZKUFhIBf5Bh4bgrXTDv3HBSNK5GMiglWf5nIJ2e
	EFCNrJGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNR-00000005LbN-0rTH;
	Thu, 30 Apr 2026 11:16:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNK-00000005LVm-1BFc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 11:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ekdmkcXW48B9CD1tkp3RfBESf/cr31oHV89C5tJaqcI=; b=kuFjsvKJ/J/w1JfPXKxi77Ya65
	8LYh3Niv+x6HcC7m/+Mrplr9m59qYi2q6pw5WmW4dOKGf7yK///0RBrn/q1luS5fMmDZ5gQ262rOG
	PDI5Om/RyMe6JsLfPx9K17usRlsQsUP6gMN138VEs4uYTtSEy9JrKyHtY5x2wqJVqh7gIFHAaiLHc
	NDiTckPEU9/RfrUW00jKTCcGmoQL2xmLtrQtRqAlm1f7aXA7ojZvhGEM2EiMuqSFiYnN9a1taN2lf
	V87Ac3CrxYt1Y2+3XxTIi8U8wT9qVg/hoWCaxGHZhWr7SuHHEobtrfv0oQzlD5shwgEj8/a719CM0
	ArtjT51w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNH-00000007DqA-0BhW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:16:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D258356D;
	Thu, 30 Apr 2026 04:16:00 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A74FE3F763;
	Thu, 30 Apr 2026 04:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777547766; bh=q/NKBboAJbYod0gf/Ix7PhIBx5sQObfz8OK5XkSm43U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FSbrttDP37W00c2im+As8lbB9vFtmE6uJ9NzYPqQ3NMp6zj+bbLmMx0UJzC0mQFqd
	 6KAv8y+ZoToAfNeKB9S9rTApTp0aGj2Ho03zvSWm/l7x3CUSKbsHT2UXzw6nnhNhpZ
	 rxEKsVBwtyHdo0l3m397C4nOzNUMf1dqUCse7okI=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Thomas Huth <thuth@redhat.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v1 10/12] kvm/dirty_ring: Add arch-generic interface for hw-accelerated dirty-ring cleaning
Date: Thu, 30 Apr 2026 12:14:14 +0100
Message-ID: <20260430111424.3479613-12-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430111424.3479613-2-leo.bras@arm.com>
References: <20260430111424.3479613-2-leo.bras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_121607_510278_25A92CE2 
X-CRM114-Status: GOOD (  16.07  )
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
index 83ac5ac907c1..a58c811dd461 100644
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
@@ -125,20 +126,23 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
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


