Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C335CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCSrMFeSurFqrsJ2giFUs5nVIkyf5eYx9hKkmNRZA3A=; b=mwUWfuL03dn28yoie4s+XUZqL7
	i3ekEVuVAxVFqjvtO6OAqEsqFk/ArXeju2YJZyCBdr/dzhQd8tQuBtBVKJXYuDHEQi5wESyLIMIRh
	hJsAo/ygU7AUGW8NSe3ZJ59DpjNgwWLiBJzjDKXjTu/jLhe9F8UT3in5yqEVF6ayZtGChonbP0Ygz
	LwHcLAJwPQRLLkof+IPjHnoSBzMgw+tsVmHsaCKeGBX8KfR33x8TzLzhRx/B4THa7IUouXJI2sEwF
	FOa+ZqTce3CEMVi5he89fwESjJj4tvGcqiNKCDVOepbB14IVbrXlsfopGHzKzUOblqWtL0dTPoBKR
	PuVzxkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KH5-0000000Db6S-075b;
	Mon, 13 Oct 2025 15:15:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KH2-0000000Db4z-3DLD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:15:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-46b303f7469so27930405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760368543; x=1760973343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCSrMFeSurFqrsJ2giFUs5nVIkyf5eYx9hKkmNRZA3A=;
        b=X4KpxotFqcDujTadtZs2FNciQYvKcUrwYQIIakyfSUQgryspl1vMaoTJJCCaKFZ+z7
         KmWJrZwTbeV3FREjGG3ZbxZJ+TgTJbXlcN0aEBobLE8EFu7v32usCHl3Ksh7mKYUYtmZ
         T6R6VkP6dmOyrjhE4i/xZGsacl/LHg9PdAB7D5S1H/RE8+IUjVjjSLhvukqPP0Ec9HXq
         dkK8tvA13F2mP/f+/ORaeCeIeMwZCGEYMxpCu30gUKlsdeBSnihb32QqkSkK8z0f2F9I
         NxgioNTuZNByNmZJvV/xWfN9b9Q6RwCNRW42zVwUELd2KgFBE1GdOzNn12AvthhXoAF0
         FRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760368543; x=1760973343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCSrMFeSurFqrsJ2giFUs5nVIkyf5eYx9hKkmNRZA3A=;
        b=kyHvcq7i7JNePs9FWaCwfho9tVLFUbb0VLXVgbPdkNdSTlGyrYEey1797VK4oDCf+9
         ZKm9cLCj4SKVXw2YVGrH3883j65ESJe/ppJSCE5dDvPArCdty5eQdCtLB8ws+Jn+ma2U
         8TfBPZA10ZzeHlLjFKaBnQtL50E97VbpI5sFkBHxCDzEYfqe7G3WkQLwkDB+ptzccpSS
         8jZ8gHUY79hHlrZGr/QdC/uV1WcXecEKmJNPTOts4t4pLy1oXmsZ9s0zy9Rjr8s3Rfqi
         lnnNh9HMfQfcIuuJ+HmQyfcjP/df2L+D3/eh+Iu3bMm+JLV2iAImDnuY/CHAPdKnmsBm
         9AKg==
X-Forwarded-Encrypted: i=1; AJvYcCXerr2S2Xwp0q3yHW/ZQxhCxnJm4JkTlMYBpVO8b7zM2OteBO14YfsOfP3Gur9CGFQfMGZSA8QN+zzfPHcz/fFg@lists.infradead.org
X-Gm-Message-State: AOJu0YyAgcK+gGvmA7rvc0YM4maCnKYHH6FAzX4BZ90hUwX/vzZs6VsF
	j8zVP1ap4ts75woFP60OG66n/69AE43xYFb3w8Df9AT4gQ+LW9ksVVPs
X-Gm-Gg: ASbGncvQCF3SPToR2sMACOuQ7Bjb/aMYnb0j1WcRTNMZcDm0mITuPvJok64c6oq5uqB
	Ni4Y/9Arw1KbgC4WIjD/j3PGlLMpQRMUbxfABvQiwHo6wHbFYHKCXPLb4DYLoGzzxkB+4l1M3LB
	vfOxvRwJvFaszCST6w2gEEq/PZPStxhi8nN5Ux9gBgtj94d0itFnKXnG9bzUINEX6NJZUvzl/uv
	KW+pjRwBiRMapUXcaVIV0uz27/dHOrczb4Xm9c10PZb13woEhPatSbstXR4CJodn5qhsJ7kW4/+
	bet4kv4e1241ERbEQyt4cxWwpVzHebYd4VnY02ArKqbdIJpDDM6oB+BS6T2ymHdHbkfjH0aLzFK
	L0/fknYyCDKddvqTsZYT+XRFhGQa79Csa4OBgXONYTwMxGK/wh/D7CmqhvZJwa3X9o8B5po242q
	V0RttzhivN4DmEFyc=
X-Google-Smtp-Source: AGHT+IEt3rxThBLWKGN/jwmns/gxZmIihkaAQISXuC9Iitep8SFGSh4XAnm8RXbIElBPhI6EpEA2fw==
X-Received: by 2002:a05:600c:8487:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-46fa9b13ab7mr150449805e9.36.1760368542783;
        Mon, 13 Oct 2025 08:15:42 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.3.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab36a773sm135545825e9.0.2025.10.13.08.15.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 08:15:42 -0700 (PDT)
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
	roypat@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH v2 3/4] KVM: selftests: Enable pre_fault_memory_test for arm64
Date: Mon, 13 Oct 2025 16:15:00 +0100
Message-ID: <20251013151502.6679-4-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013151502.6679-1-jackabt.amazon@gmail.com>
References: <20251013151502.6679-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_081544_846256_1BAAE6DF 
X-CRM114-Status: GOOD (  16.93  )
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
 .../selftests/kvm/pre_fault_memory_test.c     | 79 ++++++++++++++-----
 2 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 90f03f00cb04..4db1737fad04 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -180,6 +180,7 @@ TEST_GEN_PROGS_arm64 += memslot_perf_test
 TEST_GEN_PROGS_arm64 += mmu_stress_test
 TEST_GEN_PROGS_arm64 += rseq_test
 TEST_GEN_PROGS_arm64 += steal_time
+TEST_GEN_PROGS_arm64 += pre_fault_memory_test
 
 TEST_GEN_PROGS_s390 = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_s390 += s390/memop
diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index 0350a8896a2f..ed9848a8af60 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -10,19 +10,29 @@
 #include <test_util.h>
 #include <kvm_util.h>
 #include <processor.h>
+#include <guest_modes.h>
 
 /* Arbitrarily chosen values */
-#define TEST_SIZE		(SZ_2M + PAGE_SIZE)
-#define TEST_NPAGES		(TEST_SIZE / PAGE_SIZE)
+#define TEST_BASE_SIZE		SZ_2M
 #define TEST_SLOT		10
 
+/* Storage of test info to share with guest code */
+struct test_config {
+	int page_size;
+	uint64_t test_size;
+	uint64_t test_num_pages;
+};
+
+struct test_config test_config;
+
 static void guest_code(uint64_t base_gpa)
 {
 	volatile uint64_t val __used;
+	struct test_config *config = &test_config;
 	int i;
 
-	for (i = 0; i < TEST_NPAGES; i++) {
-		uint64_t *src = (uint64_t *)(base_gpa + i * PAGE_SIZE);
+	for (i = 0; i < config->test_num_pages; i++) {
+		uint64_t *src = (uint64_t *)(base_gpa + i * config->page_size);
 
 		val = *src;
 	}
@@ -63,11 +73,17 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 gpa, u64 size,
 					    "KVM_PRE_FAULT_MEMORY", ret, vcpu->vm);
 }
 
-static void __test_pre_fault_memory(unsigned long vm_type, bool private)
+struct test_params {
+	unsigned long vm_type;
+	bool private;
+};
+
+static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 {
+	struct test_params *p = arg;
 	const struct vm_shape shape = {
-		.mode = VM_MODE_DEFAULT,
-		.type = vm_type,
+		.mode = guest_mode,
+		.type = p->vm_type,
 	};
 	struct kvm_vcpu *vcpu;
 	struct kvm_run *run;
@@ -78,10 +94,17 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
 	uint64_t guest_test_virt_mem;
 	uint64_t alignment, guest_page_size;
 
+	pr_info("Testing guest mode: %s\n", vm_guest_mode_string(guest_mode));
+
 	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_code);
 
-	alignment = guest_page_size = vm_guest_mode_params[VM_MODE_DEFAULT].page_size;
-	guest_test_phys_mem = (vm->max_gfn - TEST_NPAGES) * guest_page_size;
+	guest_page_size = vm_guest_mode_params[guest_mode].page_size;
+
+	test_config.page_size = guest_page_size;
+	test_config.test_size = TEST_BASE_SIZE + test_config.page_size;
+	test_config.test_num_pages = vm_calc_num_guest_pages(vm->mode, test_config.test_size);
+
+	guest_test_phys_mem = (vm->max_gfn - test_config.test_num_pages) * test_config.page_size;
 #ifdef __s390x__
 	alignment = max(0x100000UL, guest_page_size);
 #else
@@ -91,22 +114,31 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
 	guest_test_virt_mem = guest_test_phys_mem & ((1ULL << (vm->va_bits - 1)) - 1);
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    guest_test_phys_mem, TEST_SLOT, TEST_NPAGES,
-				    private ? KVM_MEM_GUEST_MEMFD : 0);
-	virt_map(vm, guest_test_virt_mem, guest_test_phys_mem, TEST_NPAGES);
-
-	if (private)
-		vm_mem_set_private(vm, guest_test_phys_mem, TEST_SIZE);
-	pre_fault_memory(vcpu, guest_test_phys_mem, SZ_2M, 0);
-	pre_fault_memory(vcpu, guest_test_phys_mem + SZ_2M, PAGE_SIZE * 2, PAGE_SIZE);
-	pre_fault_memory(vcpu, guest_test_phys_mem + TEST_SIZE, PAGE_SIZE, PAGE_SIZE);
+				    guest_test_phys_mem, TEST_SLOT, test_config.test_num_pages,
+				    p->private ? KVM_MEM_GUEST_MEMFD : 0);
+	virt_map(vm, guest_test_virt_mem, guest_test_phys_mem, test_config.test_num_pages);
+
+	if (p->private)
+		vm_mem_set_private(vm, guest_test_phys_mem, test_config.test_size);
+	pre_fault_memory(vcpu, guest_test_phys_mem, TEST_BASE_SIZE, 0);
+	/* Test pre-faulting over an already faulted range */
+	pre_fault_memory(vcpu, guest_test_phys_mem, TEST_BASE_SIZE, 0);
+	pre_fault_memory(vcpu, guest_test_phys_mem + TEST_BASE_SIZE,
+			 test_config.page_size * 2, test_config.page_size);
+	pre_fault_memory(vcpu, guest_test_phys_mem + test_config.test_size,
+			 test_config.page_size, test_config.page_size);
 
 	vcpu_args_set(vcpu, 1, guest_test_virt_mem);
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
@@ -130,7 +162,12 @@ static void test_pre_fault_memory(unsigned long vm_type, bool private)
 		return;
 	}
 
-	__test_pre_fault_memory(vm_type, private);
+	struct test_params p = {
+		.vm_type = vm_type,
+		.private = private,
+	};
+
+	for_each_guest_mode(__test_pre_fault_memory, &p);
 }
 
 int main(int argc, char *argv[])
-- 
2.43.0


