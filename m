Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1AEC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hv4OkRslATLDKdhly5HSsqyggkXQoo3JBYk3Mmof+/s=; b=j29++1YrDK3WPK0JSQVpVynCJe
	rmK3nnYRvt6ZSGSJd7ma7koeCa+Y9rJA/0Rg5jnreoTTcK0dcdTWkh1IY7YPmCey5DEKB//lZaU1G
	01gtwcKE8q2Q4J/YaURz1zsNRwRYHkedrjjBOe+0PkPCL9Lep33y3sqY6zZroVmEQqrkrzV/eix8a
	izICAcZSUTI+XtiDltpJrVDnsc6iQlE5Ua94Z+7eqv88zjYqfhVND0wem73QaPdIpJtNMCfz2aXEc
	LQbtdKVfiKa+YPYHCcfqF4POiXzapXaEJDN3kSacPxkV6GbAsM9yJhnW+ZSI9Koe2MHYEIdN5xBxl
	2qOqlUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA15-0000000EPou-40S4;
	Mon, 29 Jun 2026 11:19:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA11-0000000EPl9-2iCK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:19:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50EDA2A6B;
	Mon, 29 Jun 2026 04:18:58 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E43F3F905;
	Mon, 29 Jun 2026 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731942; bh=d1P52RBARm6K7guxD4diGoe0CFmrUmVHhlNfBAzjzxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Poutxn2+LeUI1Crf6Y70Smu2jOdSm7K/jFX+YI05jNZg3hFrfTVrVjfC8MJvSQebL
	 Sci7K73GVeembuT8kZnjRAUzj5H55H3d0DJWFJ30chRYObxR3XyCuoTAFg2DeeY/wr
	 KgTunWFt8o3pF0HdW8cVhgkNSsHadQ0VRwKveXEM=
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
Subject: [PATCH v2 07/13] kvm: Add arch-generic interface for hw-accelerated dirty-bitmap cleaning
Date: Mon, 29 Jun 2026 12:17:55 +0100
Message-ID: <20260629111820.1873540-8-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629111820.1873540-1-leo.bras@arm.com>
References: <20260629111820.1873540-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6039; i=leo.bras@arm.com; h=from:subject; bh=d1P52RBARm6K7guxD4diGoe0CFmrUmVHhlNfBAzjzxU=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKcQhIdMs5FSG+dP9lBf71PT4iitGmfWtlOpzCDmRaFT QvX19zvKGVhEONikBVTZJF9NH8Vz/cpGUeu/FgAM4eVCWQIAxenAEyE+Tcjwwm1QC+NZG+2jt+6 N33Eko13Ok68G7XhsbbSu5s6FYsSbBkZPim+9trFc8HFOZMrI7rexXKjIWvA6+UeTXa7f66u9Rb mAAA=
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041903_782929_7873293A 
X-CRM114-Status: GOOD (  24.27  )
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
index e44c20c04961..a25b8902cdfc 100644
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
2.54.0


