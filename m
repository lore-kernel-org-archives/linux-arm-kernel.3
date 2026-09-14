Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6072C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F31O+RltZ0fO6BL62Rqu7TnU/yLJYGXGDr/vzomNmRg=; b=nEv0UlDbVB0BTrhE7d1wvSJsZQ
	bsQezBlmR7W20E+f+TTkXFgKLqKOwyM5aVlaHtYAM4foRn/WMAs3jNTX6mFVtrRARzNkyE5uUh88b
	KYWslgDjeNK+KKk1yjTCu2t1on/WokLLyqf/Q2SJ0F8neSLrub6EXj2uDKsmmzXr7/WfjoTrG3KjX
	E1GsdWSod+AxObtl13j+bZwJ+2zN+nFdJ0TVfGy+tqXq0v1CXU2yUnVKXAk77R/qpRi4tGdk/ahuY
	BpJq0FeZITYKRcFHXwVZxz5fGlI3Lj8B5DcuRiS8AiFIC+nCDJMTa4iJ6qYBCaOc2yD6BBYpYWLA9
	uUXSoGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61A9-00000002ZuQ-0NK1;
	Mon, 14 Sep 2026 07:31:39 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x619i-00000002Zoi-48P4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789371071; x=1820907071;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=mjC5aEg0jr+yXeG0sa/LeF7keN1owrxkWF90cvUI0lo=;
  b=mqBo1k6vV8KkGKj0dAkLDVRKHtHzaV1cGn9KXop8hG1/TwgRSqXDcJpI
   k8NrIQNNudtB/YxbEg8YX/wJdtl9pvvw8fIvYDl1Pyj7vYlK17m9qU51z
   mrO9/JXWQRj+4vL3gC74Gh2sdPTtqm6TrTCy7R0FcT8XHtHhjzmI8TXH3
   CHiQvSCS5XOVMkSMrNQ2KqjCT3lI94ofEXR0BCSngBE1fsgnbHbKGL/by
   GD1ToAf9HTgg888jqpbeYE4jCsfnnGQGXJGiFdHwq2yvVEfsxTs1yGKZ1
   gb5EGXuDha00ugynl78QFDbwUM1MyUcP7zJHwn1iV4BWSspjeNk87Q5aO
   A==;
X-CSE-ConnectionGUID: TwlgBwTJSByx2PF7JMkeUw==
X-CSE-MsgGUID: icG9PNSBRhK+bukrs4sEcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="258731112"
X-IronPort-AV: E=Sophos;i="6.27,102,1786978800"; 
   d="scan'208";a="258731112"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 16:31:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E675F1002B99
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:31:08 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9A0AB1400601
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:31:08 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id C44B118002FD;
	Mon, 14 Sep 2026 07:31:02 +0000 (UTC)
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Date: Mon, 14 Sep 2026 16:30:44 +0900
Subject: [PATCH v2 1/3] KVM: arm64: selftests: Support five-level stage-1
 page tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm64-52bit-va-v2-1-3911cb9d4ad4@fujitsu.com>
References: <20260914-arm64-52bit-va-v2-0-3911cb9d4ad4@fujitsu.com>
In-Reply-To: <20260914-arm64-52bit-va-v2-0-3911cb9d4ad4@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
 Takayuki Okamoto <tokamoto@fujitsu.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789371056; l=4541;
 i=itaru.kitayama@fujitsu.com; s=20260825; h=from:subject:message-id;
 bh=mjC5aEg0jr+yXeG0sa/LeF7keN1owrxkWF90cvUI0lo=;
 b=7DfFUkA8aXGMtM/DD1jgfw6RcVdnLoUN1N2f+Gph7TODeSPeczCqvGITFCrwbSXP0Q82ddjs5
 9kdbQI1rnOoA3MR8zsljCryu3P+Bnkrq1SgP+zofWwoU+upUoMsOOu+
X-Developer-Key: i=itaru.kitayama@fujitsu.com; a=ed25519;
 pk=g9bTnr9giRP7JwNSZHy+OMLQZBEUtSE9tUnXso0hH1Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_003111_318864_207DEE88 
X-CRM114-Status: GOOD (  16.92  )
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

Add support for populating and walking five-level stage-1 page tables.
A five-level translation starts at architectural level -1, so extend
the page-table helpers and level validation accordingly.

This enables the page-table infrastructure required by 52-bit VA
configurations using the 4K translation granule.

Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Reviewed-by: Takayuki Okamoto <tokamoto@fujitsu.com>
---
 .../selftests/kvm/include/arm64/processor.h        |  1 +
 tools/testing/selftests/kvm/lib/arm64/processor.c  | 45 +++++++++++++++++++---
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index b8a902ba8573..7457503df956 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -113,6 +113,7 @@
 
 #define PTE_VALID		BIT(0)
 #define PGD_TYPE_TABLE		BIT(1)
+#define P4D_TYPE_TABLE		BIT(1)
 #define PUD_TYPE_TABLE		BIT(1)
 #define PMD_TYPE_TABLE		BIT(1)
 #define PTE_TYPE_PAGE		BIT(1)
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 01325bf4d36f..b589368bf822 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -29,13 +29,25 @@ static u64 pgd_index(struct kvm_vm *vm, gva_t gva)
 	return (gva >> shift) & mask;
 }
 
+static u64 p4d_index(struct kvm_vm *vm, gva_t gva)
+{
+	unsigned int shift = 3 * (vm->page_shift - 3) + vm->page_shift;
+	u64 mask = (1UL << (vm->page_shift - 3)) - 1;
+
+	TEST_ASSERT(vm->mmu.pgtable_levels == 5,
+		    "Mode %d does not have 5 page table levels", vm->mode);
+
+	return (gva >> shift) & mask;
+}
+
 static u64 pud_index(struct kvm_vm *vm, gva_t gva)
 {
 	unsigned int shift = 2 * (vm->page_shift - 3) + vm->page_shift;
 	u64 mask = (1UL << (vm->page_shift - 3)) - 1;
 
-	TEST_ASSERT(vm->mmu.pgtable_levels == 4,
-		"Mode %d does not have 4 page table levels", vm->mode);
+	TEST_ASSERT(vm->mmu.pgtable_levels >= 4,
+		    "Mode %d does not have >= 4 page table levels",
+		    vm->mode);
 
 	return (gva >> shift) & mask;
 }
@@ -147,6 +159,12 @@ static void _virt_pg_map(struct kvm_vm *vm, gva_t gva, gpa_t gpa,
 				 PGD_TYPE_TABLE | PTE_VALID);
 
 	switch (vm->mmu.pgtable_levels) {
+	case 5:
+		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + p4d_index(vm, gva) * 8;
+		if (!*ptep)
+			*ptep = addr_pte(vm, vm_alloc_page_table(vm),
+					 P4D_TYPE_TABLE | PTE_VALID);
+		/* fall through */
 	case 4:
 		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + pud_index(vm, gva) * 8;
 		if (!*ptep)
@@ -163,7 +181,7 @@ static void _virt_pg_map(struct kvm_vm *vm, gva_t gva, gpa_t gpa,
 		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + pte_index(vm, gva) * 8;
 		break;
 	default:
-		TEST_FAIL("Page table levels must be 2, 3, or 4");
+		TEST_FAIL("Page table levels must be 2, 3, 4, or 5");
 	}
 
 	pg_attr = PTE_AF | PTE_ATTRINDX(attr_idx) | PTE_TYPE_PAGE | PTE_VALID;
@@ -182,18 +200,35 @@ void virt_arch_pg_map(struct kvm_vm *vm, gva_t gva, gpa_t gpa)
 
 u64 *virt_get_pte_hva_at_level(struct kvm_vm *vm, gva_t gva, int level)
 {
+	int start_level = 4 - vm->mmu.pgtable_levels;
 	u64 *ptep;
 
+	TEST_ASSERT(level >= start_level && level <= 3,
+		    "Invalid translation level %d, valid range is %d-3",
+		    level, start_level);
+
 	if (!vm->mmu.pgd_created)
 		goto unmapped_gva;
 
 	ptep = addr_gpa2hva(vm, vm->mmu.pgd) + pgd_index(vm, gva) * 8;
 	if (!ptep)
 		goto unmapped_gva;
-	if (level == 0)
+	/*
+	 * Stage-1 translation starts at level -1 for a five-level page
+	 * table, and at levels 0, 1, or 2 for four-, three-, or two-level
+	 * page tables, respectively.
+	 */
+	if (level == start_level)
 		return ptep;
 
 	switch (vm->mmu.pgtable_levels) {
+	case 5:
+		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + p4d_index(vm, gva) * 8;
+		if (!ptep)
+			goto unmapped_gva;
+		if (level == 0)
+			break;
+		/* fall through */
 	case 4:
 		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + pud_index(vm, gva) * 8;
 		if (!ptep)
@@ -214,7 +249,7 @@ u64 *virt_get_pte_hva_at_level(struct kvm_vm *vm, gva_t gva, int level)
 			goto unmapped_gva;
 		break;
 	default:
-		TEST_FAIL("Page table levels must be 2, 3, or 4");
+		TEST_FAIL("Page table levels must be 2, 3, 4, or 5");
 	}
 
 	return ptep;

-- 
2.43.0


