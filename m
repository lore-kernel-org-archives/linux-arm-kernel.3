Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E117CCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 22:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ip0GSPcOf73baSNEbw06pVGhZdDHrjVOI7is0zaeU+I=; b=apPjtFm7eUf4Vq1LHIhqxYMaW1
	WUmprpeumXbWMpf/Q/7zbYjNgbmxTt6CQ57Na/tL7udjqunZq8cqAfphodbbl4HrwbpkfZSJZizqI
	M5tdM3sCu+1S+VIfjTMVvweYPbmQXps2nmu/vPHhFhmRkEKsZXNZCwMK+pC+vOedMNmt+ElP+nQ1O
	AwDyg0eJhc4NSD1bn1pv8WNR4YkQAWCAuwA6IGg2CwWSyMp9I4DrTbLDIZVMzKQxEND3Ta52slOvZ
	mlUAxVQJvPImiGIYxQdHiYyRt/BMWJncgeQurMTPmW+2rlH/o3tUCL30MGzIKaYppJd4eW9576ckm
	OsE9nylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsec-0000000Gm2x-2ww1;
	Tue, 28 Oct 2025 22:59:02 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDseX-0000000Gm14-41es
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 22:58:59 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34029b3dbfeso1206991a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 15:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761692336; x=1762297136; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ip0GSPcOf73baSNEbw06pVGhZdDHrjVOI7is0zaeU+I=;
        b=ag637Rb76o9RwrTiLcpjLL0cATY7LJAs9h7x5TO9Ce087KuumeTyH28V5p35RSnNeA
         de/hiAtoM+GKKYonb4cAOi3YE1ycEqIiIcVsFKopLgJ4leflC3t85F0KYC9cO9jXaXWo
         1jc9IwLpeN0J9GKsCUen/JyyfAa3VPLcMN0Yu61eAB4LzAZYN1Kkxk+36fDsUhMwggzT
         y8bw3kkjgLUzBAJdZ6amRyQlXzAjNlVZZtnX7U8S00rh7LYrbyK5VvlzzK1rUBU9tzdU
         las/G3wQCkqtMzdEEANlx0w1Bg/oMWZJ6EarlQHmdb+UxIYTHixE6I9bOLMslqjMqw2J
         H1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761692336; x=1762297136;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ip0GSPcOf73baSNEbw06pVGhZdDHrjVOI7is0zaeU+I=;
        b=PWHB1sl543ZHaXgklB0fP9ZLHv0s4V4NfBue7BvdsCdXjw+jotuDYGE6huja5RTl1V
         EAFBwzsKAUNRe2uTCwy6ANqnIewaFnFRYwIxTN0nXmxBMx4ZhCWTHKmaC5qF0t0o+HHA
         pCgw5/eiWTekkvOrR34ad0g1X/erqn4EUciVq0qbC/6LaYee6hn+CVVNtiZG88mf+nuf
         qwtCfsvcNWoaku+7miG4LQP+CHoblaRxEAN6sYoTovtpLGj93XiyT9jPwXHYbA0JBeSE
         eD7wB8ogCJvJHrAMKmv36Ai0jr2PfpJbJo1iid4NWgGJ26ufrkf5b/myIjzaqMzBPgIi
         QzSw==
X-Forwarded-Encrypted: i=1; AJvYcCWcs1Qm1d1MD9WmP0U7tQXFi+Ia+YhF/oV0WY7KoB1M+aK+UQRkTBwhIIpBA07E8WXqZ8GBDMbiDW4Um8ftmkyC@lists.infradead.org
X-Gm-Message-State: AOJu0YxLfeGeK1JAAVpH4tuGvm4d/DIAGWjViBpcLiMovJJQaPIkI9Od
	lVoModTPRuuPh9GKeUMjiEefvc6aECM1P/mduo8hcuGyu5UILgKz4r2EmteEoVTOHyZthjsz/Rb
	mTx+HiRl5MXwwdA==
X-Google-Smtp-Source: AGHT+IEocRZ/8v9VtAgKKGORzHoS2iGayjZS+sqTWSEnk3iM6JDQKTWbdjJDm+53lGtYfikxVTGa+6PFwz1akg==
X-Received: from pjtf19.prod.google.com ([2002:a17:90a:c293:b0:33b:da89:9788])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1d4c:b0:340:29cf:221f with SMTP id 98e67ed59e1d1-3403a2a3952mr713832a91.33.1761692336600;
 Tue, 28 Oct 2025 15:58:56 -0700 (PDT)
Date: Tue, 28 Oct 2025 15:30:41 -0700
In-Reply-To: <20251028225827.2269128-1-jmattson@google.com>
Mime-Version: 1.0
References: <20251028225827.2269128-1-jmattson@google.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028225827.2269128-4-jmattson@google.com>
Subject: [PATCH v2 3/4] KVM: selftests: Change VM_MODE_PXXV48_4K to VM_MODE_PXXVYY_4K
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Jim Mattson <jmattson@google.com>, 
	"Pratik R. Sampat" <prsampat@amd.com>, James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_155858_019442_FFD31159 
X-CRM114-Status: GOOD (  22.38  )
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

Use 57-bit addresses with 5-level paging on hardware that supports
LA57. Continue to use 48-bit addresses with 4-level paging on hardware
that doesn't support LA57.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  4 +--
 .../selftests/kvm/include/x86/processor.h     |  2 +-
 .../selftests/kvm/lib/arm64/processor.c       |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 30 ++++++++++---------
 .../testing/selftests/kvm/lib/x86/processor.c | 30 +++++++++++--------
 tools/testing/selftests/kvm/lib/x86/vmx.c     |  6 ++--
 6 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index d3f3e455c031..8a54a1279d44 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -177,7 +177,7 @@ enum vm_guest_mode {
 	VM_MODE_P40V48_4K,
 	VM_MODE_P40V48_16K,
 	VM_MODE_P40V48_64K,
-	VM_MODE_PXXV48_4K,	/* For 48bits VA but ANY bits PA */
+	VM_MODE_PXXVYY_4K,	/* For 48-bit or 57-bit VA, depending on host support */
 	VM_MODE_P47V64_4K,
 	VM_MODE_P44V64_4K,
 	VM_MODE_P36V48_4K,
@@ -219,7 +219,7 @@ extern enum vm_guest_mode vm_mode_default;
 
 #elif defined(__x86_64__)
 
-#define VM_MODE_DEFAULT			VM_MODE_PXXV48_4K
+#define VM_MODE_DEFAULT			VM_MODE_PXXVYY_4K
 #define MIN_PAGE_SHIFT			12U
 #define ptes_per_page(page_size)	((page_size) / 8)
 
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 51cd84b9ca66..57d62a425109 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1441,7 +1441,7 @@ enum pg_level {
 	PG_LEVEL_2M,
 	PG_LEVEL_1G,
 	PG_LEVEL_512G,
-	PG_LEVEL_NUM
+	PG_LEVEL_256T
 };
 
 #define PG_LEVEL_SHIFT(_level) ((_level - 1) * 9 + 12)
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 54f6d17c78f7..d46e4b13b92c 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -324,7 +324,7 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 
 	/* Configure base granule size */
 	switch (vm->mode) {
-	case VM_MODE_PXXV48_4K:
+	case VM_MODE_PXXVYY_4K:
 		TEST_FAIL("AArch64 does not support 4K sized pages "
 			  "with ANY-bit physical address ranges");
 	case VM_MODE_P52V48_64K:
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 1a93d6361671..364efd02ad4a 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -201,7 +201,7 @@ const char *vm_guest_mode_string(uint32_t i)
 		[VM_MODE_P40V48_4K]	= "PA-bits:40,  VA-bits:48,  4K pages",
 		[VM_MODE_P40V48_16K]	= "PA-bits:40,  VA-bits:48, 16K pages",
 		[VM_MODE_P40V48_64K]	= "PA-bits:40,  VA-bits:48, 64K pages",
-		[VM_MODE_PXXV48_4K]	= "PA-bits:ANY, VA-bits:48,  4K pages",
+		[VM_MODE_PXXVYY_4K]	= "PA-bits:ANY, VA-bits:48 or 57, 4K pages",
 		[VM_MODE_P47V64_4K]	= "PA-bits:47,  VA-bits:64,  4K pages",
 		[VM_MODE_P44V64_4K]	= "PA-bits:44,  VA-bits:64,  4K pages",
 		[VM_MODE_P36V48_4K]	= "PA-bits:36,  VA-bits:48,  4K pages",
@@ -228,7 +228,7 @@ const struct vm_guest_mode_params vm_guest_mode_params[] = {
 	[VM_MODE_P40V48_4K]	= { 40, 48,  0x1000, 12 },
 	[VM_MODE_P40V48_16K]	= { 40, 48,  0x4000, 14 },
 	[VM_MODE_P40V48_64K]	= { 40, 48, 0x10000, 16 },
-	[VM_MODE_PXXV48_4K]	= {  0,  0,  0x1000, 12 },
+	[VM_MODE_PXXVYY_4K]	= {  0,  0,  0x1000, 12 },
 	[VM_MODE_P47V64_4K]	= { 47, 64,  0x1000, 12 },
 	[VM_MODE_P44V64_4K]	= { 44, 64,  0x1000, 12 },
 	[VM_MODE_P36V48_4K]	= { 36, 48,  0x1000, 12 },
@@ -310,24 +310,26 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	case VM_MODE_P36V47_16K:
 		vm->pgtable_levels = 3;
 		break;
-	case VM_MODE_PXXV48_4K:
+	case VM_MODE_PXXVYY_4K:
 #ifdef __x86_64__
 		kvm_get_cpu_address_width(&vm->pa_bits, &vm->va_bits);
 		kvm_init_vm_address_properties(vm);
-		/*
-		 * Ignore KVM support for 5-level paging (vm->va_bits == 57),
-		 * it doesn't take effect unless a CR4.LA57 is set, which it
-		 * isn't for this mode (48-bit virtual address space).
-		 */
-		TEST_ASSERT(vm->va_bits == 48 || vm->va_bits == 57,
-			    "Linear address width (%d bits) not supported",
-			    vm->va_bits);
+
 		pr_debug("Guest physical address width detected: %d\n",
 			 vm->pa_bits);
-		vm->pgtable_levels = 4;
-		vm->va_bits = 48;
+		pr_debug("Guest virtual address width detected: %d\n",
+			 vm->va_bits);
+
+		if (vm->va_bits == 57) {
+			vm->pgtable_levels = 5;
+		} else {
+			TEST_ASSERT(vm->va_bits == 48,
+				    "Unexpected guest virtual address width: %d",
+				    vm->va_bits);
+			vm->pgtable_levels = 4;
+		}
 #else
-		TEST_FAIL("VM_MODE_PXXV48_4K not supported on non-x86 platforms");
+		TEST_FAIL("VM_MODE_PXXVYY_4K not supported on non-x86 platforms");
 #endif
 		break;
 	case VM_MODE_P47V64_4K:
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 720c678187b5..40bd69b265ef 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -158,10 +158,10 @@ bool kvm_is_tdp_enabled(void)
 
 void virt_arch_pgd_alloc(struct kvm_vm *vm)
 {
-	TEST_ASSERT(vm->mode == VM_MODE_PXXV48_4K, "Attempt to use "
-		"unknown or unsupported guest mode, mode: 0x%x", vm->mode);
+	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
+		    "Unknown or unsupported guest mode: 0x%x", vm->mode);
 
-	/* If needed, create page map l4 table. */
+	/* If needed, create the top-level page table. */
 	if (!vm->pgd_created) {
 		vm->pgd = vm_alloc_page_table(vm);
 		vm->pgd_created = true;
@@ -221,8 +221,8 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 	uint64_t *pte = &vm->pgd;
 	int current_level;
 
-	TEST_ASSERT(vm->mode == VM_MODE_PXXV48_4K,
-		    "Unknown or unsupported guest mode, mode: 0x%x", vm->mode);
+	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
+		    "Unknown or unsupported guest mode: 0x%x", vm->mode);
 
 	TEST_ASSERT((vaddr % pg_size) == 0,
 		    "Virtual address not aligned,\n"
@@ -307,27 +307,28 @@ static bool vm_is_target_pte(uint64_t *pte, int *level, int current_level)
 uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
 				    int *level)
 {
+	int va_width = 12 + (vm->pgtable_levels) * 9;
 	uint64_t *pte = &vm->pgd;
 	int current_level;
 
 	TEST_ASSERT(!vm->arch.is_pt_protected,
 		    "Walking page tables of protected guests is impossible");
 
-	TEST_ASSERT(*level >= PG_LEVEL_NONE && *level < PG_LEVEL_NUM,
+	TEST_ASSERT(*level >= PG_LEVEL_NONE && *level <= vm->pgtable_levels,
 		    "Invalid PG_LEVEL_* '%d'", *level);
 
-	TEST_ASSERT(vm->mode == VM_MODE_PXXV48_4K, "Attempt to use "
-		"unknown or unsupported guest mode, mode: 0x%x", vm->mode);
+	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
+		    "Unknown or unsupported guest mode: 0x%x", vm->mode);
 	TEST_ASSERT(sparsebit_is_set(vm->vpages_valid,
 		(vaddr >> vm->page_shift)),
 		"Invalid virtual address, vaddr: 0x%lx",
 		vaddr);
 	/*
-	 * Based on the mode check above there are 48 bits in the vaddr, so
-	 * shift 16 to sign extend the last bit (bit-47),
+	 * Check that the vaddr is a sign-extended va_width value.
 	 */
-	TEST_ASSERT(vaddr == (((int64_t)vaddr << 16) >> 16),
-		"Canonical check failed.  The virtual address is invalid.");
+	TEST_ASSERT(vaddr ==
+		    (((int64_t)vaddr << (64 - va_width) >> (64 - va_width))),
+		    "Canonical check failed.  The virtual address is invalid.");
 
 	for (current_level = vm->pgtable_levels;
 	     current_level > PG_LEVEL_4K;
@@ -520,7 +521,8 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
 	struct kvm_sregs sregs;
 
-	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXV48_4K);
+	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
+		    "Unknown or unsupported guest mode: 0x%x", vm->mode);
 
 	/* Set mode specific system register values. */
 	vcpu_sregs_get(vcpu, &sregs);
@@ -534,6 +536,8 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
 	if (kvm_cpu_has(X86_FEATURE_XSAVE))
 		sregs.cr4 |= X86_CR4_OSXSAVE;
+	if (vm->pgtable_levels == 5)
+		sregs.cr4 |= X86_CR4_LA57;
 	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
 	kvm_seg_set_unusable(&sregs.ldt);
diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index d4d1208dd023..3bb529e8720f 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -401,11 +401,11 @@ void __nested_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 	struct eptPageTableEntry *pt = vmx->eptp_hva, *pte;
 	uint16_t index;
 
-	TEST_ASSERT(vm->mode == VM_MODE_PXXV48_4K, "Attempt to use "
-		    "unknown or unsupported guest mode, mode: 0x%x", vm->mode);
+	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
+		    "Unknown or unsupported guest mode: 0x%x", vm->mode);
 
 	TEST_ASSERT((nested_paddr >> 48) == 0,
-		    "Nested physical address 0x%lx requires 5-level paging",
+		    "Nested physical address 0x%lx is > 48-bits and requires 5-level EPT",
 		    nested_paddr);
 	TEST_ASSERT((nested_paddr % page_size) == 0,
 		    "Nested physical address not on page boundary,\n"
-- 
2.51.1.851.g4ebd6896fd-goog


