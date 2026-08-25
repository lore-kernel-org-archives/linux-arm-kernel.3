Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AC4C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBcYdCatcgll6+G/f3rRQ6HDdJVRsx0Wohsoj9dSwT4=; b=Lnm2KLuTSNAUaBTTQVHBdt2zAB
	kYaezXRKT47S91nknVB4rtLeIE6By1RXprMFwBaqxALx9PCmtwX+tpGPZQhTYFYa/Cak/iPxe3Cer
	DjQvAlIL7y8KQ2ONB5NeW4gvGITTBZQvTDdlLa6ALkZhkwVSTfqtY5XLfANjbLF9DJrXLlddrM8oz
	soiOWsakrYREyZw/kdNDTavYViwsAxiRbfGYwDH7nONmfjoXzD8bb2D1ruSYD66w5hDqOxx8qLxht
	xY2UlyjdmYOil2rRiDmydSgsnucOsmB4cdvpvO1wJILN5xu0y6F/KqdW4O66xFEVj1b6A/lAuzHV0
	Jqd0QCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyXk-00000001UpU-31Tw;
	Tue, 25 Aug 2026 21:18:52 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyXi-00000001Unp-1ZDH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787692730; x=1819228730;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=j6Asuk1cnBvinvk3JEqecrbzglvqkmx5gA73gonKR8E=;
  b=sN2sEpIsQdXWdlcXhsCA/3cSdqSinxL/uaC+32YrWCwv++3kVlRFayXQ
   6j1Dn+HRvx/p6ufOUtSehDg1OK8AjwrqdaFuyC9nekCIgClf79CvSjJ9C
   et0aJ1IZrezAoxsfvG3DFHAyW4sC4hXY+Mk5b6LtdfnQbYNOfh3xJmUP1
   caHmyldQpIKdVdAZEs+7WhYCqPKHfSeyYMABrne8htg9r66ug5Y3Gl9Fl
   En8G1F+u5j49mr1gl9SCdNE8KG9/CC0GUuuNT4/bP+KMkAGweN/0JbHnP
   gzeQEM2QBRyjlJyuOVZYCHIAck3tStX6k2A6egPqx6+X/VbC2Beos5G2S
   A==;
X-CSE-ConnectionGUID: OVJKJ/2XQo6AEf8e2pxGcQ==
X-CSE-MsgGUID: 5PUWokR9Sc64Vq/55HyKjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="238776795"
X-IronPort-AV: E=Sophos;i="6.25,243,1779116400"; 
   d="scan'208";a="238776795"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 06:18:49 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C8C2A820C0D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 21:18:48 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 850B0C0246B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 21:18:48 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B7D8D1801127;
	Tue, 25 Aug 2026 21:18:43 +0000 (UTC)
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Date: Wed, 26 Aug 2026 06:18:34 +0900
Subject: [PATCH 1/2] KVM: selftest: arm64: Support 5-level paging in stage
 1 translation table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-arm64-52bit-va-v1-1-14ec98211363@fujitsu.com>
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
In-Reply-To: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
 Takayuki Okamoto <tokamoto@fujitsu.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787692718; l=7169;
 i=itaru.kitayama@fujitsu.com; s=20260825; h=from:subject:message-id;
 bh=j6Asuk1cnBvinvk3JEqecrbzglvqkmx5gA73gonKR8E=;
 b=6T4a5KAqdlBssANDbaEO8tnHAZpKT80qJ+CiRvnlccosN/JQ7RnXybQTuU1Lj3I1glKWbng5R
 v+ctyoyhppqDVTJrhBt32hdWL9u8NACxpgs82TvetXzsX5OahtXaLtn
X-Developer-Key: i=itaru.kitayama@fujitsu.com; a=ed25519;
 pk=g9bTnr9giRP7JwNSZHy+OMLQZBEUtSE9tUnXso0hH1Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_141850_691338_85F170F5 
X-CRM114-Status: GOOD (  17.78  )
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

Add p4d_index() for when 5-level paging required, i.e., V52 guest mode
IDs. With the index helper function, _virt_pg_map() handles 5-level
paging case, and aarch64_vcpu_setup() now is aware of the new V52 guest
mode IDs.

Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Reviewed-by: Takayuki Okamoto <tokamoto@fujitsu.com>
---
 .../selftests/kvm/include/arm64/processor.h        |  2 +
 tools/testing/selftests/kvm/lib/arm64/processor.c  | 87 ++++++++++++++++++++--
 2 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index b8a902ba8573..a6fd7a9b379e 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -113,6 +113,7 @@
 
 #define PTE_VALID		BIT(0)
 #define PGD_TYPE_TABLE		BIT(1)
+#define P4D_TYPE_TABLE		BIT(1)
 #define PUD_TYPE_TABLE		BIT(1)
 #define PMD_TYPE_TABLE		BIT(1)
 #define PTE_TYPE_PAGE		BIT(1)
@@ -167,6 +168,7 @@ enum {
 			   (v) == VECTOR_SYNC_LOWER_64    || \
 			   (v) == VECTOR_SYNC_LOWER_32)
 
+u32 aarch64_get_supported_va_size(void);
 void aarch64_get_supported_page_sizes(u32 ipa, u32 *ipa4k,
 				      u32 *ipa16k, u32 *ipa64k);
 
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 01325bf4d36f..9108e14a9b5b 100644
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
+		    "Mode %d does not have at least 4 page table levels",
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
@@ -321,12 +356,14 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 	case VM_MODE_PXXVYY_4K:
 		TEST_FAIL("AArch64 does not support 4K sized pages "
 			  "with ANY-bit physical address ranges");
+	case VM_MODE_P52V52_64K:
 	case VM_MODE_P52V48_64K:
 	case VM_MODE_P48V48_64K:
 	case VM_MODE_P40V48_64K:
 	case VM_MODE_P36V48_64K:
 		tcr_el1 |= TCR_TG0_64K;
 		break;
+	case VM_MODE_P52V52_16K:
 	case VM_MODE_P52V48_16K:
 	case VM_MODE_P48V48_16K:
 	case VM_MODE_P40V48_16K:
@@ -334,6 +371,7 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 	case VM_MODE_P36V47_16K:
 		tcr_el1 |= TCR_TG0_16K;
 		break;
+	case VM_MODE_P52V52_4K:
 	case VM_MODE_P52V48_4K:
 	case VM_MODE_P48V48_4K:
 	case VM_MODE_P40V48_4K:
@@ -348,6 +386,9 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 
 	/* Configure output size */
 	switch (vm->mode) {
+	case VM_MODE_P52V52_4K:
+	case VM_MODE_P52V52_16K:
+	case VM_MODE_P52V52_64K:
 	case VM_MODE_P52V48_4K:
 	case VM_MODE_P52V48_16K:
 	case VM_MODE_P52V48_64K:
@@ -578,6 +619,42 @@ static u32 max_ipa_for_page_size(u32 vm_ipa, u32 gran,
 		return min(vm_ipa, 48U);
 }
 
+u32 aarch64_get_supported_va_size(void)
+{
+	struct kvm_vcpu_init preferred_init = {};
+	int kvm_fd, vm_fd, vcpu_fd, err;
+	u64 val;
+	u32 va_range;
+	struct kvm_one_reg reg = {
+		.id	= KVM_ARM64_SYS_REG(SYS_ID_AA64MMFR2_EL1),
+		.addr	= (u64)&val,
+	};
+
+	kvm_fd = open_kvm_dev_path_or_exit();
+	vm_fd = __kvm_ioctl(kvm_fd, KVM_CREATE_VM, NULL);
+	TEST_ASSERT(vm_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm_fd));
+
+	vcpu_fd = ioctl(vm_fd, KVM_CREATE_VCPU, 0);
+	TEST_ASSERT(vcpu_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VCPU, vcpu_fd));
+
+	err = ioctl(vm_fd, KVM_ARM_PREFERRED_TARGET, &preferred_init);
+	TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_ARM_PREFERRED_TARGET, err));
+
+	err = ioctl(vcpu_fd, KVM_ARM_VCPU_INIT, &preferred_init);
+	TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_ARM_VCPU_INIT, err));
+
+	err = ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg);
+	TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_GET_ONE_REG, err));
+
+	va_range = FIELD_GET(ID_AA64MMFR2_EL1_VARange, val);
+
+	close(vcpu_fd);
+	close(vm_fd);
+	close(kvm_fd);
+
+	return va_range >= ID_AA64MMFR2_EL1_VARange_52 ? 52 : 48;
+}
+
 void aarch64_get_supported_page_sizes(u32 ipa, u32 *ipa4k,
 				      u32 *ipa16k, u32 *ipa64k)
 {

-- 
2.43.0


