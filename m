Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6E9CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9JzmnwdeypjwQOnKFWK+jD3+i5H6JgCUgI4RfiUJ3w=; b=Kn/0dwIKtZbnM6lzl2IPJSWGHV
	SCN3YuLhClzdjHGfGRmRJQk5o0Fur3U11+fZsuIMioRGJ5fEgq9/bIxHHIZbReKZfPu+TaelOde+1
	91lKhGOvHybNhSJ62QUyW4oHRIaGpGIfJMAsvz0yP1Rf9TOQIXNXrEo6PHTLptqNavHGz6WSrCUxz
	htHBrHUtRd2qV1tnIqeUdm+kym3rPVZHrx2E8MrMxlvLRQtZczAmYXXtUHRAyDu2cpOqwo7g0JUac
	Zws6ByEWRHi+yO2GDFuHDbW891iRYCsSF3VB5inUU3Vv4ZkM4N6qo/s/0l1V/hXI8R2z9p28OR7Qf
	yvBHAS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJnJ-0000000BCew-0AcM;
	Sat, 16 May 2026 18:31:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJnA-0000000BCWP-2WFZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 18:31:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 951041BF3;
	Sat, 16 May 2026 11:31:10 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24C233F85F;
	Sat, 16 May 2026 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778956275; bh=/1t/CERV4WJKmLTkfx/AdC8xUY2k0LviAytjvvkIoEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qpRjr816bPDh6feC6wJMq4ZIT5RzIoLJmWRlzCn5rCnXmoTiF3bHGGE1C5XSnJc7Q
	 VjYxy9b7Uts/utZxVgpD6SKJNwAU6vibvirdlm9ieO0R71PaivSFzOxTjBQeAyOv0i
	 RLlH90CDHQA/7p5jNQ6H7s9GkpJ+9Z12pLK0DLbo=
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
Subject: [PATCH v3 9/9] KVM: arm64: selftests: shadow_stage2: Turn on stage-2 translation for the nested guest
Date: Sat, 16 May 2026 19:30:03 +0100
Message-ID: <20260516183003.799058-10-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516183003.799058-1-weilin.chang@arm.com>
References: <20260516183003.799058-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_113116_722074_93AD5EE2 
X-CRM114-Status: GOOD (  12.49  )
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

Utilize the stage-2 library functions to initialize a s2_mmu, build a
stage-2 page table, and turn on stage-2 translation for the nested
guest. This better tests out the shadow page table code in KVM.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 .../selftests/kvm/arm64/shadow_stage2.c       | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/shadow_stage2.c b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
index 2b274b810dcf..5bce55abdea7 100644
--- a/tools/testing/selftests/kvm/arm64/shadow_stage2.c
+++ b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
@@ -51,9 +51,11 @@ static void l2_guest_code(void)
 static void guest_code(void)
 {
 	struct vcpu vcpu;
+	struct s2_mmu mmu;
 	struct hyp_data hyp_data;
 	int ret, i = 0;
-	gpa_t l2_pc, l2_stack_top;
+	gpa_t l2_pc, l2_stack_start, l2_stack_top, s2_pgd;
+	gpa_t do_hvc_gpa;
 	struct page_pool pp;
 	u64 mmfr0 = read_sysreg(id_aa64mmfr0_el1);
 
@@ -68,11 +70,20 @@ static void guest_code(void)
 	if (!has_tgran_2(mmfr0, pp.page_size))
 		GUEST_SYNC1(TGRAN2NOSUP);
 
-	l2_stack_top = alloc_page(&pp) + pp.page_size;
+	l2_stack_start = alloc_page(&pp);
+	l2_stack_top = l2_stack_start + pp.page_size;
 	l2_pc = ucall_translate_to_gpa(l2_guest_code);
+	do_hvc_gpa = ucall_translate_to_gpa(do_hvc);
+
+	s2_pgd = alloc_page(&pp);
 
 	init_vcpu(&vcpu, l2_pc, l2_stack_top);
-	prepare_hyp_no_s2();
+	init_s2_mmu(&mmu, 0, s2_pgd, pp.page_size, 40);
+	create_s2_mapping(&mmu, l2_pc, l2_pc, pp.page_size * 2, &pp);
+	create_s2_mapping(&mmu, do_hvc_gpa, do_hvc_gpa, pp.page_size, &pp);
+	create_s2_mapping(&mmu, l2_stack_start, l2_stack_start, pp.page_size, &pp);
+
+	prepare_hyp(&mmu);
 
 	while (true) {
 		GUEST_PRINTF("L2 enter\n");
@@ -113,6 +124,12 @@ int main(void)
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
 				    L2_PAGE_POOL_ADDR, L2_PAGE_POOL_MEMSLOT,
 				    L2_PAGE_POOL_NPAGES, 0);
+	/*
+	 * This idmap allows L1 to traverse and build its guest stage-2, where
+	 * it must do a PA to VA conversion in order to descend to the next
+	 * level.
+	 */
+	virt_map(vm, L2_PAGE_POOL_ADDR, L2_PAGE_POOL_ADDR, L2_PAGE_POOL_NPAGES);
 
 	while (true) {
 		vcpu_run(vcpu);
-- 
2.43.0


