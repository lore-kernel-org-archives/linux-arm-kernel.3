Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F50CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Yr9GGgCQpScYsf1hUYT729pk2Pxrw9m5mYbmydC2KA=; b=CV9S6ccW7KBKmG/VkOc2k13AW5
	Oqjps217xv4Xyv4oIJn/o0rUL0jxiQBUNG80OBJi+nq98qE5cydBF86lfr0FoTliJMgGTr9ERKf2k
	V5heL5Rt5W49FqQHI7YD4KWLM4tdzu2pJBPkyeutaTAqLIMXxZSIjA+o58qMzGkW+JZeSuU8SAe+4
	WxPEROZubN1rABmXPzVdjJwA4agOtRI9jBae7ENlFwixvMStpFjeu10qTQBwKTJQ/L2jZX4BhLr/h
	Cb4Mrj4s1W/iywKT6MNX9Qe5/BrjKgQ7WF9qSOxYFJN2YfH5wzHq+J6YLOZ6WcPU/2k5DD+5RuYvg
	r+RldMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJn5-0000000BCRN-2cOz;
	Sat, 16 May 2026 18:31:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJn2-0000000BCOk-1OiX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 18:31:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E1C91CDD;
	Sat, 16 May 2026 11:31:01 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 134633F85F;
	Sat, 16 May 2026 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778956266; bh=jADMEVZuXP3pAMbKzFIdmO4l26Z49yvuX6i+PGRaGSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EMtBQNSdsfY93wcLqMuI5+b453PA5kzcOT/rTsqInDh8uabl8rFIATtsowQL62NI9
	 Wtvcip2D30av12+kf64gPKTyQj/414nurusUCSeb+f0FncU8zzZlwxuyvULAkci6wm
	 C73C1WaSK7A+4LiJnP58PJMMZS9Usa098a5pEUX4=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 6/9] KVM: arm64: selftests: shadow_stage2: Allocate L2 stack from dedicated pool
Date: Sat, 16 May 2026 19:30:00 +0100
Message-ID: <20260516183003.799058-7-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516183003.799058-1-weilin.chang@arm.com>
References: <20260516183003.799058-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_113108_478147_4966ACD0 
X-CRM114-Status: GOOD (  15.02  )
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

Instead of using L1's stack, create a simple page allocator and use that
to allocate L2 stack. The allocator will also be used later on when the
stage-2 page table generator builds stage-2 mappings for the nested
guest (L2).

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 .../selftests/kvm/arm64/shadow_stage2.c       | 20 ++++++++---
 .../selftests/kvm/include/arm64/nested.h      |  9 +++++
 .../testing/selftests/kvm/lib/arm64/nested.c  | 33 +++++++++++++++++++
 3 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/shadow_stage2.c b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
index cf76a2b0582d..1ad510a38654 100644
--- a/tools/testing/selftests/kvm/arm64/shadow_stage2.c
+++ b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
@@ -9,12 +9,16 @@
 #include "ucall.h"
 
 #define XLATE2GPA	(0xABCD)
-#define L2STACKSZ	(0x100)
 
 #define L2SUCCESS	(0x0)
 #define L2FAILED	(0x1)
 #define L2SYNC		(0x2)
 
+/* Used for L2 stack and guest S2 page tables. */
+#define L2_PAGE_POOL_ADDR	(0x80000000)
+#define L2_PAGE_POOL_NPAGES	(512)
+#define L2_PAGE_POOL_MEMSLOT	(0x2)
+
 /*
  * TPIDR_EL2 is used to store vcpu id, so save and restore it.
  */
@@ -48,14 +52,18 @@ static void guest_code(void)
 	struct hyp_data hyp_data;
 	int ret, i = 0;
 	gpa_t l2_pc, l2_stack_top;
-	/* force 16-byte alignment for the stack pointer */
-	u8 l2_stack[L2STACKSZ] __attribute__((aligned(16)));
+	struct page_pool pp;
 
 	GUEST_ASSERT_EQ(get_current_el(), 2);
 	GUEST_PRINTF("vEL2 entry\n");
 
+	pp.start = L2_PAGE_POOL_ADDR;
+	pp.npages = L2_PAGE_POOL_NPAGES;
+	pp.current = L2_PAGE_POOL_ADDR;
+	pp.page_size = get_page_size();
+
+	l2_stack_top = alloc_page(&pp) + pp.page_size;
 	l2_pc = ucall_translate_to_gpa(l2_guest_code);
-	l2_stack_top = ucall_translate_to_gpa(&l2_stack[L2STACKSZ]);
 
 	init_vcpu(&vcpu, l2_pc, l2_stack_top);
 	prepare_hyp();
@@ -96,6 +104,10 @@ int main(void)
 	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
 	kvm_arch_vm_finalize_vcpus(vm);
 
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    L2_PAGE_POOL_ADDR, L2_PAGE_POOL_MEMSLOT,
+				    L2_PAGE_POOL_NPAGES, 0);
+
 	while (true) {
 		vcpu_run(vcpu);
 
diff --git a/tools/testing/selftests/kvm/include/arm64/nested.h b/tools/testing/selftests/kvm/include/arm64/nested.h
index c10ef4a85be7..8e7d7738b381 100644
--- a/tools/testing/selftests/kvm/include/arm64/nested.h
+++ b/tools/testing/selftests/kvm/include/arm64/nested.h
@@ -46,6 +46,15 @@ struct hyp_data {
 	struct cpu_context hyp_context;
 };
 
+struct page_pool {
+	gpa_t start;
+	gpa_t current;
+	size_t npages;
+	size_t page_size;
+};
+
+size_t get_page_size(void);
+gpa_t alloc_page(struct page_pool *pp);
 void prepare_hyp(void);
 void init_vcpu(struct vcpu *vcpu, gpa_t l2_pc, gpa_t l2_stack_top);
 int run_l2(struct vcpu *vcpu, struct hyp_data *hyp_data);
diff --git a/tools/testing/selftests/kvm/lib/arm64/nested.c b/tools/testing/selftests/kvm/lib/arm64/nested.c
index f6c24beb01d0..7f47e340f00d 100644
--- a/tools/testing/selftests/kvm/lib/arm64/nested.c
+++ b/tools/testing/selftests/kvm/lib/arm64/nested.c
@@ -7,6 +7,39 @@
 #include "processor.h"
 #include "test_util.h"
 #include <asm/sysreg.h>
+#include <linux/sizes.h>
+
+size_t get_page_size(void)
+{
+	u64 tcr_el1 = read_sysreg(tcr_el1);
+	u64 tg0 = SYS_FIELD_GET(TCR_EL1, TG0, tcr_el1);
+
+	switch (tg0) {
+	case TCR_EL1_TG0_4K:
+		return SZ_4K;
+	case TCR_EL1_TG0_16K:
+		return SZ_16K;
+	case TCR_EL1_TG0_64K:
+		return SZ_64K;
+	default:
+		GUEST_FAIL("Unexpected tg0 value!\n");
+		return 0;
+	}
+}
+
+gpa_t alloc_page(struct page_pool *pp)
+{
+	gpa_t page = pp->current;
+
+	pp->current += pp->page_size;
+
+	if ((pp->current - pp->start) / pp->page_size <= pp->npages) {
+		return page;
+	} else {
+		GUEST_FAIL("%s failed!\n", __func__);
+		return 0;
+	}
+}
 
 void prepare_hyp(void)
 {
-- 
2.43.0


