Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8479BD2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5PQLoPw0PMek/LS9vJnQnbwHDO3lcL/jK5ZbU7CCws=; b=b1B1hVEmmSclJytK8qpwhwWrfx
	6n7zcwe8pk6HenREDvFqL5bmlFWI8I0m2u9H6mgp884+X6W4/VXRQDdF5Rs8rM2RgRcCaiD3Sc491
	sJV8KWPQrlSSWWlCJ6sNJ147DHBW8Yo91y9UewrmvyxNfbdsfu3IHcMpBLamhU6AQ+Ys+t9y0IaDl
	c7dScaG/CpuDhFVqZcrKBN2/f6q0p9DtD4WAynylFn06U4MMydSHkgxQFNt2HHJsnt8gKkbmWrazP
	3nKmrtbT3uaca6etEisJygsL5DTqXbflQwiX2fbNOQkYvlq6dFztCXai/fCphxBkpVfTFvdBOaTig
	O9Uahbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgJ9-00000007MhJ-3N7K;
	Tue, 13 Jan 2026 15:27:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgJ4-00000007Mdk-2Eyd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:27:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso45294305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768318061; x=1768922861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5PQLoPw0PMek/LS9vJnQnbwHDO3lcL/jK5ZbU7CCws=;
        b=V2BybJuZMO7a65o1//f6o3zh/8ZhvJWCT8nZXjSA8IpMugbfNGNJ1SyIkYbs1gyKGr
         JV/leYtYtdJ9vmODZMRzefSAk8uDBObRFgwjYIviqwFS2iaEY5KhU+hNoRga/2oG/rl9
         HfrDTX9kf0MIPDzpHUxWH5GmUFiadAR45WniYJ2mvdvu+AZRCGudmyY0HmCk1vW1vRLN
         HiecF1S6FYeFIiiVReWgQA//TXLlz2LIvsQLkjmLLW/emgjmTITi79YQqbfvL+YdQCwY
         gDG7PAKbco1jKzVMlgG3Bi2m3uQJzsfLlMrBCuIMUJP+ti3620yKk6HrjDhhiOof766P
         rFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318061; x=1768922861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x5PQLoPw0PMek/LS9vJnQnbwHDO3lcL/jK5ZbU7CCws=;
        b=RXsvmU2x55T3tWTQurxROmKO1DYTChEre9idVyxgqGVaHgEgjL8CgLdc2mlTun6N0X
         uILRC4x+M9cpIOlYgPc+OTDGpm7KkqX7cfd1hW6jjNrYyNq4pVbnlFcFtz1JIYT0fqcd
         Tm24NqamZ/gPCpTt71ywHdtCpGXiRv/7Gdsv0Mosd9LXaIiN64kLPp2mGepBkNgh2xoj
         hwmgY4CFGvWP0e3VEezYnV3FMRDmwKXPzFIme/BnKUiUYNcZLS+QYFhGdH3dPw0PQ60M
         1rWGN84wYJ9syKzLeZ8p9VJ3Qvssse14UqKnV0BAgzVvJyHRtEP/RH5MkTCO/Z56G/1r
         BRTA==
X-Forwarded-Encrypted: i=1; AJvYcCW8cDdg/0D5je9nJGVJmuIgmjBJdbqSKMo8HwfcLmYTgZCCVmW81Dbl1gcPywyn8NFt2ce9BkIJWnYxbqlNiEN8@lists.infradead.org
X-Gm-Message-State: AOJu0YzT3G1CQ0LAEbcWVUFnykFNqQYcA/TvcnktZly8zIDrnBRMRWsv
	1WJQ+jduEo9mwVMGnsmiYFbCBF0P+Y586uvV/cuaA3/PNNN88Wih/8qa
X-Gm-Gg: AY/fxX5O7aMSxKWMMO+AbGmVC1Yx4IiIWmCbSJstst6abyQe1RkPgwk4ZWVZe+/lwfj
	Dd7cav+uQaXL0sLxtmhwO0DX0pp9L8EzkBJ1LkXLEVgwdZjP9ucowDs91XRQw66JoJSRXbD+w7b
	D+eGtCqS3HUoyWpJxBt7on8V/CIEZodDrS4ff+RjahPKkpDk/Sca/etNTNMYsPfMRw4DVDYwt/O
	FYN7lbTgypt/ep+sivWjhd2iSZrE1dkMEKbdDmgzPVepzAnlGxISxIUvdkkugusWK3bABNL5n3j
	S7u4X+wZKkzhrjcAG+XZXyd8UjlgGDfNbWYsw6lzRtp53mmeOi2Ad7mjpnFjlx1IVyHo23LRYYV
	CkY1agbsePOu+Qxx+wk3l1/pSqFYw+ZkiLOY7WbimbCHxTjPfq1sGfVwOoewAdF++IRCGiY/SC4
	gjElFnbXMVsD2x28bhTmk+BKvXBL0PLWid/KoUs0L+OeflJAKWwCpZda0=
X-Google-Smtp-Source: AGHT+IExCZWJcb/0GZ31JqPekHZy2maoMNKm5K54c/5lKFA3EuWdAV8whKhI88HtcWnW30x8c/SNBQ==
X-Received: by 2002:a05:600c:a04:b0:47d:5dae:73b1 with SMTP id 5b1f17b1804b1-47d84b3b668mr281127875e9.23.1768318060510;
        Tue, 13 Jan 2026 07:27:40 -0800 (PST)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f4ddsm421025325e9.2.2026.01.13.07.27.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Jan 2026 07:27:40 -0800 (PST)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	xmarcalx@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH v4 2/3] KVM: selftests: Enable pre_fault_memory_test for arm64
Date: Tue, 13 Jan 2026 15:26:41 +0000
Message-ID: <20260113152643.18858-3-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113152643.18858-1-jackabt.amazon@gmail.com>
References: <20260113152643.18858-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072742_618254_D8195CAD 
X-CRM114-Status: GOOD (  17.68  )
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

From: Jack Thomson <jackabt@amazon.com>

Enable the pre_fault_memory_test to run on arm64 by making it work with
different guest page sizes and testing multiple guest configurations.

Update the test_assert to compare against the UCALL_EXIT_REASON, for
portability, as arm64 exits with KVM_EXIT_MMIO while x86 uses
KVM_EXIT_IO.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/pre_fault_memory_test.c     | 85 ++++++++++++++-----
 2 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index ba5c2b643efa..6d6a74ddad30 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -187,6 +187,7 @@ TEST_GEN_PROGS_arm64 += memslot_perf_test
 TEST_GEN_PROGS_arm64 += mmu_stress_test
 TEST_GEN_PROGS_arm64 += rseq_test
 TEST_GEN_PROGS_arm64 += steal_time
+TEST_GEN_PROGS_arm64 += pre_fault_memory_test
 
 TEST_GEN_PROGS_s390 = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_s390 += s390/memop
diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index 93e603d91311..be1a84a6c137 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -11,19 +11,29 @@
 #include <kvm_util.h>
 #include <processor.h>
 #include <pthread.h>
+#include <guest_modes.h>
 
 /* Arbitrarily chosen values */
-#define TEST_SIZE		(SZ_2M + PAGE_SIZE)
-#define TEST_NPAGES		(TEST_SIZE / PAGE_SIZE)
+#define TEST_BASE_SIZE		SZ_2M
 #define TEST_SLOT		10
 
-static void guest_code(uint64_t base_gva)
+/* Storage of test info to share with guest code */
+struct test_config {
+	uint64_t page_size;
+	uint64_t test_size;
+	uint64_t test_num_pages;
+};
+
+static struct test_config test_config;
+
+static void guest_code(uint64_t base_gpa)
 {
 	volatile uint64_t val __used;
+	struct test_config *config = &test_config;
 	int i;
 
-	for (i = 0; i < TEST_NPAGES; i++) {
-		uint64_t *src = (uint64_t *)(base_gva + i * PAGE_SIZE);
+	for (i = 0; i < config->test_num_pages; i++) {
+		uint64_t *src = (uint64_t *)(base_gpa + i * config->page_size);
 
 		val = *src;
 	}
@@ -56,7 +66,7 @@ static void *delete_slot_worker(void *__data)
 		cpu_relax();
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, data->gpa,
-				    TEST_SLOT, TEST_NPAGES, data->flags);
+				    TEST_SLOT, test_config.test_num_pages, data->flags);
 
 	return NULL;
 }
@@ -159,22 +169,35 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 base_gpa, u64 offset,
 					  KVM_PRE_FAULT_MEMORY, ret, vcpu->vm);
 }
 
-static void __test_pre_fault_memory(unsigned long vm_type, bool private)
+struct test_params {
+	unsigned long vm_type;
+	bool private;
+};
+
+static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 {
 	uint64_t gpa, gva, alignment, guest_page_size;
+	struct test_params *p = arg;
 	const struct vm_shape shape = {
-		.mode = VM_MODE_DEFAULT,
-		.type = vm_type,
+		.mode = guest_mode,
+		.type = p->vm_type,
 	};
 	struct kvm_vcpu *vcpu;
 	struct kvm_run *run;
 	struct kvm_vm *vm;
 	struct ucall uc;
 
+	pr_info("Testing guest mode: %s\n", vm_guest_mode_string(guest_mode));
+
 	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_code);
 
-	alignment = guest_page_size = vm_guest_mode_params[VM_MODE_DEFAULT].page_size;
-	gpa = (vm->max_gfn - TEST_NPAGES) * guest_page_size;
+	guest_page_size = vm_guest_mode_params[guest_mode].page_size;
+
+	test_config.page_size = guest_page_size;
+	test_config.test_size = TEST_BASE_SIZE + test_config.page_size;
+	test_config.test_num_pages = vm_calc_num_guest_pages(vm->mode, test_config.test_size);
+
+	gpa = (vm->max_gfn - test_config.test_num_pages) * test_config.page_size;
 #ifdef __s390x__
 	alignment = max(0x100000UL, guest_page_size);
 #else
@@ -183,23 +206,32 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
 	gpa = align_down(gpa, alignment);
 	gva = gpa & ((1ULL << (vm->va_bits - 1)) - 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa, TEST_SLOT,
-				    TEST_NPAGES, private ? KVM_MEM_GUEST_MEMFD : 0);
-	virt_map(vm, gva, gpa, TEST_NPAGES);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    gpa, TEST_SLOT, test_config.test_num_pages,
+				    p->private ? KVM_MEM_GUEST_MEMFD : 0);
+	virt_map(vm, gva, gpa, test_config.test_num_pages);
+
+	if (p->private)
+		vm_mem_set_private(vm, gpa, test_config.test_size);
+	pre_fault_memory(vcpu, gpa, 0, TEST_BASE_SIZE, 0, p->private);
+	/* Test pre-faulting over an already faulted range */
+	pre_fault_memory(vcpu, gpa, 0, TEST_BASE_SIZE, 0, p->private);
+	pre_fault_memory(vcpu, gpa, TEST_BASE_SIZE,
+			 test_config.page_size * 2, test_config.page_size, p->private);
+	pre_fault_memory(vcpu, gpa, test_config.test_size,
+			 test_config.page_size, test_config.page_size, p->private);
 
-	if (private)
-		vm_mem_set_private(vm, gpa, TEST_SIZE);
+	vcpu_args_set(vcpu, 1, gva);
 
-	pre_fault_memory(vcpu, gpa, 0, SZ_2M, 0, private);
-	pre_fault_memory(vcpu, gpa, SZ_2M, PAGE_SIZE * 2, PAGE_SIZE, private);
-	pre_fault_memory(vcpu, gpa, TEST_SIZE, PAGE_SIZE, PAGE_SIZE, private);
+	/* Export the shared variables to the guest. */
+	sync_global_to_guest(vm, test_config);
 
-	vcpu_args_set(vcpu, 1, gva);
 	vcpu_run(vcpu);
 
 	run = vcpu->run;
-	TEST_ASSERT(run->exit_reason == KVM_EXIT_IO,
-		    "Wanted KVM_EXIT_IO, got exit reason: %u (%s)",
+	TEST_ASSERT(run->exit_reason == UCALL_EXIT_REASON,
+		    "Wanted %s, got exit reason: %u (%s)",
+		    exit_reason_str(UCALL_EXIT_REASON),
 		    run->exit_reason, exit_reason_str(run->exit_reason));
 
 	switch (get_ucall(vcpu, &uc)) {
@@ -218,18 +250,25 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
 
 static void test_pre_fault_memory(unsigned long vm_type, bool private)
 {
+	struct test_params p = {
+		.vm_type = vm_type,
+		.private = private,
+	};
+
 	if (vm_type && !(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type))) {
 		pr_info("Skipping tests for vm_type 0x%lx\n", vm_type);
 		return;
 	}
 
-	__test_pre_fault_memory(vm_type, private);
+	for_each_guest_mode(__test_pre_fault_memory, &p);
 }
 
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
 
+	guest_modes_append_default();
+
 	test_pre_fault_memory(0, false);
 #ifdef __x86_64__
 	test_pre_fault_memory(KVM_X86_SW_PROTECTED_VM, false);
-- 
2.43.0


