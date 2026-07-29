Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A6FC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38xKC8eVo8Hqj3onAzLdmDNFSeQq7E4tgrw2PlkWRz8=; b=3ESP0x0THxoVofH/UUzKsc2C2m
	p0ru8OOtL8vBay1lh3z+t1SUR1Z3M5ZU7l3ZpRfxJiDhCf5YtKqNz4dqkEKj4dK/pQ9thjHvH2Swg
	Do+UI4o2kT/I7t0xUNRqI9ZYeBwnCkoHC8Q6yLXlpsFcSYakzCbzmshe+FLxWg/jEfQSRhWU+iK3u
	I7/IQmc9CV9/6vcSycxc1AUAR9q/0yIn4hwDRV2taym5VEeP8kqqsd3nkNlfw7ux+ajw9KprI8oQc
	GxQqVVBdBU/Ry5WaZS7DHgyWgd8fAGx9eLp+6L0Zd4zuElasDovGh4X01pq53ToDhiHn2g9/ZHlzx
	Xub7sipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1oB-00000007aKl-3txl;
	Wed, 29 Jul 2026 10:46:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1o6-00000007aGv-0Ykq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:46:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 290AD1688;
	Wed, 29 Jul 2026 03:46:33 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6704B3F66F;
	Wed, 29 Jul 2026 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785321997; bh=eX91rPZ3hV+bCYq2WjnKREl4obSvgm79CWXZz7+fmFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tN1gXyT9nuj9StpiRjvILLcXdE26m27KZ3lf2mBNJEQ5NWtspLpGy00PtSSUFbcvS
	 Ob3bewfXrTQypr3PGO9q7XuEcZRY3CEQTFZwsL8h8/jB0gYsZJvrSZZX0kv8wRqpGP
	 k7ON2dhUd6HFEPI3+xFdE4AeTOw5SiwzGRX+nn58=
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
Subject: [PATCH v3 05/11] kvm: Add arch-generic interface for hw-accelerated dirty-bitmap cleaning
Date: Wed, 29 Jul 2026 11:45:40 +0100
Message-ID: <20260729104548.3439958-6-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729104548.3439958-1-leo.bras@arm.com>
References: <20260729104548.3439958-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6039; i=leo.bras@arm.com; h=from:subject; bh=eX91rPZ3hV+bCYq2WjnKREl4obSvgm79CWXZz7+fmFg=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLIyb15zztm3ozBmbZwr2ynNpNmFd1W+ztwopbq2L/jCk wtP3x3n7yhlYRDjYpAVU2SRfTR/Fc/3KRlHrvxYADOHlQlkCAMXpwBMpPURwz9zvaxDbLL3dhgX 9q9Ycl95S/DbCsaexkeXhA8q/N3Pd/4SI8NxDsk76wQPvNHznxOl+vl3rfJBg4pFi84518gkd8e 8XcIAAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_034638_249304_BCCC42E2 
X-CRM114-Status: GOOD (  25.13  )
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

Introduce kvm_arch_dirty_log_clear() that allow implementation of
arch-specific hardware-accelerated dirty-log routines.

A call to that is added on both kvm_get_dirty_log_protect() and
kvm_clear_dirty_log_protect() and will fall back to software version if
not implemented, or any error was detected in the arch-specific routine.

For an arch to implement this function, it's required to provide an
asm/kvm_dirty_bit.h and have CONFIG_HAVE_KVM_HW_DIRTY_BIT=y on building.

If the arch does not implement it, and thus lack above config, the
introduced snippet is expected to be compiled-out and have zero impact at
runtime.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 include/linux/kvm_dirty_bit.h | 27 +++++++++++++++++++++++++++
 virt/kvm/kvm_main.c           | 13 ++++++++++++-
 virt/kvm/Kconfig              |  3 +++
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/kvm_dirty_bit.h

diff --git a/include/linux/kvm_dirty_bit.h b/include/linux/kvm_dirty_bit.h
new file mode 100644
index 000000000000..fa4f6b67b623
--- /dev/null
+++ b/include/linux/kvm_dirty_bit.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Ltd.
+ * Author: Leonardo Bras <leo.bras@arm.com>
+ */
+
+#ifndef __KVM_DIRTY_BIT_H__
+#define __KVM_DIRTY_BIT_H__
+
+#ifndef CONFIG_HAVE_KVM_HW_DIRTY_BIT
+
+static inline int kvm_arch_dirty_log_clear(struct kvm *kvm,
+					   struct kvm_memory_slot *memslot,
+					   struct kvm_clear_dirty_log *log,
+					   unsigned long *bitmap,
+					   bool *flush)
+{
+	return -ENXIO;
+}
+
+#else /* CONFIG_HAVE_KVM_HW_DIRTY_BIT */
+
+#include <asm/kvm_dirty_bit.h>
+
+#endif /* CONFIG_HAVE_KVM_HW_DIRTY_BIT */
+
+#endif /* __KVM_DIRTY_BIT_H__ */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 45e784462ec6..7a13ef69b6e3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -58,20 +58,21 @@
 #include "async_pf.h"
 #include "kvm_mm.h"
 #include "vfio.h"
 
 #include <trace/events/ipi.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/kvm.h>
 
 #include <linux/kvm_dirty_ring.h>
+#include <linux/kvm_dirty_bit.h>
 
 
 /* Worst case buffer size needed for holding an integer. */
 #define ITOA_MAX_LEN 12
 
 MODULE_AUTHOR("Qumranet");
 MODULE_DESCRIPTION("Kernel-based Virtual Machine (KVM) Hypervisor");
 MODULE_LICENSE("GPL");
 
 /* Architectures should define their poll value according to the halt latency */
@@ -2255,39 +2256,44 @@ static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log)
 		 * is some code duplication between this function and
 		 * kvm_get_dirty_log, but hopefully all architecture
 		 * transition to kvm_get_dirty_log_protect and kvm_get_dirty_log
 		 * can be eliminated.
 		 */
 		dirty_bitmap_buffer = dirty_bitmap;
 	} else {
 		dirty_bitmap_buffer = kvm_second_dirty_bitmap(memslot);
 		memset(dirty_bitmap_buffer, 0, n);
 
+		if (kvm_arch_dirty_log_clear(kvm, memslot, NULL,
+					     dirty_bitmap_buffer, &flush) >= 0)
+			goto out;
+
 		KVM_MMU_LOCK(kvm);
 		for (i = 0; i < n / sizeof(long); i++) {
 			unsigned long mask;
 			gfn_t offset;
 
 			if (!dirty_bitmap[i])
 				continue;
 
 			flush = true;
 			mask = xchg(&dirty_bitmap[i], 0);
 			dirty_bitmap_buffer[i] = mask;
 
 			offset = i * BITS_PER_LONG;
 			kvm_arch_mmu_enable_log_dirty_pt_masked(kvm, memslot,
 								offset, mask);
 		}
 		KVM_MMU_UNLOCK(kvm);
 	}
 
+out:
 	if (flush)
 		kvm_flush_remote_tlbs_memslot(kvm, memslot);
 
 	if (copy_to_user(log->dirty_bitmap, dirty_bitmap_buffer, n))
 		return -EFAULT;
 	return 0;
 }
 
 
 /**
@@ -2366,45 +2372,50 @@ static int kvm_clear_dirty_log_protect(struct kvm *kvm,
 	    (log->num_pages < memslot->npages - log->first_page && (log->num_pages & 63)))
 	    return -EINVAL;
 
 	kvm_arch_sync_dirty_log(kvm, memslot);
 
 	flush = false;
 	dirty_bitmap_buffer = kvm_second_dirty_bitmap(memslot);
 	if (copy_from_user(dirty_bitmap_buffer, log->dirty_bitmap, n))
 		return -EFAULT;
 
+	if (kvm_arch_dirty_log_clear(kvm, memslot, log, dirty_bitmap_buffer,
+				     &flush) >= 0)
+		goto out;
+
 	KVM_MMU_LOCK(kvm);
 	for (offset = log->first_page, i = offset / BITS_PER_LONG,
 		 n = DIV_ROUND_UP(log->num_pages, BITS_PER_LONG); n--;
 	     i++, offset += BITS_PER_LONG) {
 		unsigned long mask = *dirty_bitmap_buffer++;
 		atomic_long_t *p = (atomic_long_t *) &dirty_bitmap[i];
 		if (!mask)
 			continue;
 
 		mask &= atomic_long_fetch_andnot(mask, p);
 
 		/*
 		 * mask contains the bits that really have been cleared.  This
 		 * never includes any bits beyond the length of the memslot (if
 		 * the length is not aligned to 64 pages), therefore it is not
 		 * a problem if userspace sets them in log->dirty_bitmap.
 		*/
 		if (mask) {
 			flush = true;
+
 			kvm_arch_mmu_enable_log_dirty_pt_masked(kvm, memslot,
 								offset, mask);
 		}
 	}
 	KVM_MMU_UNLOCK(kvm);
-
+out:
 	if (flush)
 		kvm_flush_remote_tlbs_memslot(kvm, memslot);
 
 	return 0;
 }
 
 static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
 					struct kvm_clear_dirty_log *log)
 {
 	int r;
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 794976b88c6f..f8757b5b84b3 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -13,20 +13,23 @@ config HAVE_KVM_PFNCACHE
 
 config HAVE_KVM_IRQCHIP
        bool
 
 config HAVE_KVM_IRQ_ROUTING
        bool
 
 config HAVE_KVM_DIRTY_RING
        bool
 
+config HAVE_KVM_HW_DIRTY_BIT
+       bool
+
 # Only strongly ordered architectures can select this, as it doesn't
 # put any explicit constraint on userspace ordering. They can also
 # select the _ACQ_REL version.
 config HAVE_KVM_DIRTY_RING_TSO
        bool
        select HAVE_KVM_DIRTY_RING
        depends on X86
 
 # Weakly ordered architectures can only select this, advertising
 # to userspace the additional ordering requirements.
-- 
2.55.0


