Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB3DCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tydmeyYrLPvT4qet9l6Pm8OKfFhD4dz0649Lu1ejs0k=; b=sd8Or90eR0BB0eVHXgYx9IKpcV
	G6OQcb4epFwHo+PqUKcR+4ght6MwYWXx23qZ8XBRWAiR5u4GtB+66I422Wb48v4qoxPjffKxBmr7d
	MWDvAg4cNJ+oFvCcwmB1S1xjvR+GufuONt7ng5Kw5X2oZr2mfYYj4T2mSt99NiUrSajoUU2T8OBAj
	zR4/0kpBJ9nni+2daY3DATDX2/WGbrQjhx8wnCbe8iEq3dKCImKL5rTwtvMlGDquV9P/1mj0O7qzc
	2e1zb89nsIiu80PO+ploarZ2HHGaAjiLTGiMVxIVMWvG/9e16booiknLaa0C8mL/ag6D3ikL/wZ7N
	APWugdtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4g9-0000000BGU1-3czz;
	Fri, 12 Jun 2026 16:24:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4g6-0000000BGRT-451V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 16:24:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso9827465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781281457; x=1781886257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tydmeyYrLPvT4qet9l6Pm8OKfFhD4dz0649Lu1ejs0k=;
        b=lywnN2KJnVLuF8CecYTt7vE6+QLW7pfLys0bTNlJuDu88CZ+ksvCeFKAHOLa0QRTk8
         M4tVnS2ydzZgT3+zaBO1Zhxv/M591BIS3J0b4c2WlmvZ1KF8u6lMfdvCZKmWa0YYD8zx
         tiEJccCnZBhW+7298KAPArwjGos3LgyniVgJZ8MA5248AjIJxUYgjmD1+ZnHGA2fBwoC
         zwZ9xM/elLGJoV6vsgSmGmct79AOklxrJ0WD95BLijFrwGjlzhnwq8JYpfIJbZkIgFBY
         DN6RRCetqRNtJIGQeLYQOqOHS7VzGQdM72ora24Eaajkb7Jn+D0nRzdDJfZ+3ov1DGlW
         Npag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781281457; x=1781886257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tydmeyYrLPvT4qet9l6Pm8OKfFhD4dz0649Lu1ejs0k=;
        b=nwqnFShos5KTeclTddDgN/miX4tKf38iAL/YoRwh0RNI/ht/qZzSUJJUuIJBFfbg/S
         CPxD6dm8KzI5tfDvPH9xXbgOmziaxRJIavQm4vlrxeXRnf73jL1kCXb9u4M/1QDW4IGa
         x3JZHtzfk+PT0MmN6/f6GpcxDjziZiDSt9unxiZIrwZTg1me8NLl/FyDWMHaDdxKC2Zt
         xuoZhlMWvAxbyIkwSjBHFkRy75hmDroCa8no5X5At/UajE4w7odt7Q4RNBEztiFPPwYo
         zgUs9eDxS6CxRuZgx+ov7VxL78qVa8o1JV76ppmBBBMgsnUNPkxsI8Tx45P8dimCPiz9
         taGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9l0afYqEJ3SktP+gZI7kh/H773AuKQ5HEblFGJlXAnJ8qTA+z567VKh0xKA6P/y+uKFXbaI2yiRTbkvGmfBL4D@lists.infradead.org
X-Gm-Message-State: AOJu0YyuoyQTBLjugGmR9p+SgMsVfixR/RANADsregF1eGFAI8ChqYkl
	urJYeZbvc12EBAGrpQbfuSCeoiySBoJdcHnZvaPt90iyLvEJCKqKqb+6
X-Gm-Gg: Acq92OHAiSyzJyxPSGgr7eznjk9eVCU5aUgPZMIa121osx8c8Wf00LCOSFXkVhIqavE
	uurqK4StwWFbLsn5lDuf4SkjWy3TFzMx50JM57Lr5INCV9RUJAqFCisZ4ebCAQlWiYWv0aQQr+2
	pdxX3C+X+EtGvfsA3j0wN0iR8lCuZVA03dMIf0JVfSaoKgt3uAlBsKVPH+7BgZaixJbdKCxtYGT
	rylo8rSG8VCLkAMzm0Mozf3OCY3FJJG0J4edpYiNxvgx5n9zHXCjkn3m3ALZ5RWXa9TJNW4hlB0
	Rmzf+ZDwFqE692rwenMm0PhpeGoVTBzPGQeDljgvU8euO/YszJkAAQuFRjck5jkpI98dGnkT0Hy
	rPa1N5rH42dF7ZaIOb3gWWqGWlDKE37i7GNHguiQnXQuwF4ONc7WLg5PjKoJumZ7sVY/soFEWU0
	RY3jeBg2LRlB498Zw+Nl0MV1kcY/GFI1hZlEKrI7OXNAYSmZtXJyjBpnvQngHRXA==
X-Received: by 2002:a05:600c:c0d1:10b0:490:b9c3:6c69 with SMTP id 5b1f17b1804b1-490ec50f80cmr36665975e9.30.1781281456986;
        Fri, 12 Jun 2026 09:24:16 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c51dsm57620935e9.1.2026.06.12.09.24.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 12 Jun 2026 09:24:16 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oupton@kernel.org,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net,
	vladimir.murzin@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	isaku.yamahata@intel.com,
	Jack Thomson <jackabt@amazon.com>
Subject: [PATCH v5 3/5] KVM: selftests: Enable pre_fault_memory_test for arm64
Date: Fri, 12 Jun 2026 17:23:51 +0100
Message-ID: <20260612162354.73378-4-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260612162354.73378-1-jackabt.amazon@gmail.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092419_049867_30A69D34 
X-CRM114-Status: GOOD (  19.46  )
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
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/pre_fault_memory_test.c     | 115 ++++++++++++++----
 2 files changed, 92 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 9118a5a51b89..4609d8f23e38 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -194,6 +194,7 @@ TEST_GEN_PROGS_arm64 += guest_memfd_test
 TEST_GEN_PROGS_arm64 += mmu_stress_test
 TEST_GEN_PROGS_arm64 += rseq_test
 TEST_GEN_PROGS_arm64 += steal_time
+TEST_GEN_PROGS_arm64 += pre_fault_memory_test
 
 TEST_GEN_PROGS_s390 = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_s390 += s390/memop
diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index fcb57fd034e6..9f5f0d1a5db1 100644
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
 
+/* Storage of test info to share with guest code */
+struct test_config {
+	u64 page_size;
+	u64 test_size;
+	u64 test_num_pages;
+};
+
+static struct test_config test_config;
+
 static void guest_code(u64 base_gva)
 {
 	volatile u64 val __used;
+	struct test_config *config = &test_config;
 	int i;
 
-	for (i = 0; i < TEST_NPAGES; i++) {
-		u64 *src = (u64 *)(base_gva + i * PAGE_SIZE);
+	for (i = 0; i < config->test_num_pages; i++) {
+		u64 *src = (u64 *)(base_gva + i * config->page_size);
 
 		val = *src;
 	}
@@ -56,7 +66,7 @@ static void *delete_slot_worker(void *__data)
 		cpu_relax();
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, data->gpa,
-				    TEST_SLOT, TEST_NPAGES, data->flags);
+				    TEST_SLOT, test_config.test_num_pages, data->flags);
 
 	return NULL;
 }
@@ -149,8 +159,8 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 base_gpa, u64 offset,
 	/*
 	 * Assert success if prefaulting the entire range should succeed, i.e.
 	 * complete with no bytes remaining.  Otherwise prefaulting should have
-	 * failed due to ENOENT (due to RET_PF_EMULATE for emulated MMIO when
-	 * no memslot exists).
+	 * failed due to ENOENT (no memslot exists for the GPA; on x86 this
+	 * surfaces via RET_PF_EMULATE).
 	 */
 	if (!expected_left)
 		TEST_ASSERT_VM_VCPU_IOCTL(!ret, KVM_PRE_FAULT_MEMORY, ret, vcpu->vm);
@@ -159,43 +169,70 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 base_gpa, u64 offset,
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
-	gpa_t gpa, gva, alignment, guest_page_size;
+	gpa_t gpa, gva, alignment, guest_page_size, host_page_size;
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
+	host_page_size = getpagesize();
+
+	test_config.page_size = guest_page_size;
+	test_config.test_size = align_up(TEST_BASE_SIZE + test_config.page_size,
+					 host_page_size);
+	test_config.test_num_pages = vm_calc_num_guest_pages(vm->mode, test_config.test_size);
+
+	gpa = (vm->max_gfn - test_config.test_num_pages) * test_config.page_size;
 	alignment = SZ_2M;
+	alignment = max(alignment, host_page_size);
 	gpa = align_down(gpa, alignment);
 	gva = gpa & ((1ULL << (vm->va_bits - 1)) - 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa, TEST_SLOT,
-				    TEST_NPAGES, private ? KVM_MEM_GUEST_MEMFD : 0);
-	virt_map(vm, gva, gpa, TEST_NPAGES);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    gpa, TEST_SLOT, test_config.test_num_pages,
+				    p->private ? KVM_MEM_GUEST_MEMFD : 0);
+	virt_map(vm, gva, gpa, test_config.test_num_pages);
 
-	if (private)
-		vm_mem_set_private(vm, gpa, TEST_SIZE);
+	if (p->private)
+		vm_mem_set_private(vm, gpa, test_config.test_size);
 
-	pre_fault_memory(vcpu, gpa, 0, SZ_2M, 0, private);
-	pre_fault_memory(vcpu, gpa, SZ_2M, PAGE_SIZE * 2, PAGE_SIZE, private);
-	pre_fault_memory(vcpu, gpa, TEST_SIZE, PAGE_SIZE, PAGE_SIZE, private);
+	pre_fault_memory(vcpu, gpa, 0, test_config.test_size, 0, p->private);
+	/* Retry the same range after the first prefault attempt. */
+	pre_fault_memory(vcpu, gpa, 0, test_config.test_size, 0, p->private);
+	pre_fault_memory(vcpu, gpa,
+			 test_config.test_size - host_page_size,
+			 host_page_size * 2, host_page_size, p->private);
+	pre_fault_memory(vcpu, gpa, test_config.test_size,
+			 host_page_size, host_page_size, p->private);
 
 	vcpu_args_set(vcpu, 1, gva);
+
+	/* Export the shared variables to the guest. */
+	sync_global_to_guest(vm, test_config);
+
 	vcpu_run(vcpu);
 
 	run = vcpu->run;
-	TEST_ASSERT(run->exit_reason == KVM_EXIT_IO,
-		    "Wanted KVM_EXIT_IO, got exit reason: %u (%s)",
+	TEST_ASSERT(run->exit_reason == UCALL_EXIT_REASON,
+		    "Wanted %s, got exit reason: %u (%s)",
+		    exit_reason_str(UCALL_EXIT_REASON),
 		    run->exit_reason, exit_reason_str(run->exit_reason));
 
 	switch (get_ucall(vcpu, &uc)) {
@@ -214,16 +251,46 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
 
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
+}
+
+static void help(char *name)
+{
+	puts("");
+	printf("usage: %s [-h] [-m mode]\n", name);
+	puts("");
+	guest_modes_help();
+	puts("");
 }
 
 int main(int argc, char *argv[])
 {
+	int opt;
+
+	guest_modes_append_default();
+
+	while ((opt = getopt(argc, argv, "hm:")) != -1) {
+		switch (opt) {
+		case 'm':
+			guest_modes_cmdline(optarg);
+			break;
+		case 'h':
+		default:
+			help(argv[0]);
+			exit(0);
+		}
+	}
+
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
 
 	test_pre_fault_memory(0, false);
-- 
2.43.0


