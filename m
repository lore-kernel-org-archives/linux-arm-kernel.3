Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23B7CF394B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYPZ2TAv2fl/D9t0qmZ6idVIls0qfp4iF8sGuYso3OI=; b=QTA7d6L3O7E2zIFWrs0/OhXypV
	Xmd4rZmaKxOF+P4vKpZwW9zAtK4WJSDE4xvyMir0E2sRsyK41JjBubLpVSBurCQaqf17efMH0RITH
	jl0koVPgoiRP8tX6rqNi26fwf9V1MM7hgR2HzwEBTEneoxq83QOs6wfja49pv20FShUIzfxT2Te+b
	BQVRszqMTslb34Hq0n7+e8NZQ0j8Ulw6HCf4cjpenI6CZkQgWg6GQKmMGg6ekB2/2HuFkVJlDPGpC
	uF3ZR5n8scwQXt78vOhBE/ZFHYKKCRNmLhJgRS9ZsB3dVhG10CFC9g+1c+KAdbE+YSnICvy8DIk5D
	TvUq5xqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRP-00000003Z5c-2lYT;
	Wed, 19 Nov 2025 15:49:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR6-00000003Yms-0FUQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso5109134f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763567374; x=1764172174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYPZ2TAv2fl/D9t0qmZ6idVIls0qfp4iF8sGuYso3OI=;
        b=WL+YS9uFIDGTfCnuwNtQ6286C2h4pbBS1LNst7zWlU9kEsqS7lNiVPsf4kiczdd1kI
         cB4znzNbFsDuTUsJx/KcrfHk6dC+cDFlpyLj9D8HP+ewlciV5xUNUCScermyufVa+z2j
         kZW3nF+TQQ6G2Pz5xwXvrEgSp8kDz4XyqbIaTeqXl2e/Baqc4qlC2HuQUVE4Z9cTAQHP
         j9nydRn658dVAmcLCqmR0JoyYvFQGYeA0EqWNyMQPxeN+y+Cus6AV2kcz3d+34cM0nze
         uha/o8eYaDKig0NyXHWk3YtSCodtPpzmDHFrHj04zTdGzgyjs1cC87zxtGZDl84lnvnk
         HS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567374; x=1764172174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYPZ2TAv2fl/D9t0qmZ6idVIls0qfp4iF8sGuYso3OI=;
        b=Rrw4kQTArMBpLnTWXUnOyrELan1Tg6JDh5krpN/29XCImbH5RRrEWX6lC3lymUYCJV
         H8+lR/6XeYMf6eUGFJvuphkuES2o8fiPRpkhjpFlC290rdj72106PJ2bYOPevnKnkamY
         pB/y8Ao6yJXDO4wxJUzN3F/xvU0McqBaVPBfQiuz/kFlo/8+sdy+GcIC7AcF3ELb+MQQ
         hdPSjTkiyx8mO2rGYSTbztKf0gZFySNckgpBFpI+Eoi8nCMaC7IuslW2Jkgvvh5On+za
         wEwxIa8MTE5wiAM3mLHoYDNiwBAeuUS8Q8PZbAPFA3n6yFdcBnlqtz8cjIB8ZrvWuD8v
         cdcw==
X-Forwarded-Encrypted: i=1; AJvYcCWev6F1UvkFlRaBSfL3f1dd1+LSfGAyI8O+SrDu+GbtYM9KOlD+6bc6TfNxa52iIOjJLUvddeIxJSDvWP34Qc1L@lists.infradead.org
X-Gm-Message-State: AOJu0Yy15snofCqUCDubB4WYK3v7aympy3VsAFwhRmTFNfb32E4CK6Xs
	llKp2ncPIVgtApngMI9RLw5D95Z2uY/ZY3hct85GQ+BjvzsFpLnDeEfI
X-Gm-Gg: ASbGncvfWkYYziyXEaf920TGgu6OrpsNQHbEACjtgB6pejeQTUBIOaFj7R6tru8ywJg
	P5H3qbgmdyUmpmlaBYpq3+MEwrNEixBlwuJ3KaUJYUrOjTaEc6rY6ByzX2v/miO5GE6WclAUfnU
	8I+lncHhcawnrYlHDviPQdefTTVtSe4jADdrmwEfuj1UXQy1+fmXksWIIjW37X7eXDu0YT5bvZD
	rgY/A9DHKc/NzCEvX5cY3zK1T653YQqLQJE79kDngLGR0Z33SlXBGeJHfPte8DKhIuvYf1JFwgi
	xck5htaMvmtY//07WnyiSaj/o/a5WXa29JUDPUz8OdBrDeABFTC2JFj6W+oUm6waAfxE4LqMxaE
	VAeZeJNJo51UV5VPQoEoTzhkqYmsEWuJqwSFgJjpQYkwI/RJtOyBz0Yl5cgjoiCg7e/x5oaDiU1
	j5ly3Zd0WW8g7PoeYIBh/uBt7PDwVBtjK/bhNv9oF2BUovLLKbIqzmveY=
X-Google-Smtp-Source: AGHT+IGnRWO/EQarXoiPW6xopu6JnhvTujLJMDnIONEFIwE5R1LQ002Uig+rL8Cjp6spjmieTrZ1vg==
X-Received: by 2002:a05:6000:1788:b0:42b:4139:577b with SMTP id ffacd0b85a97d-42b5938fe6dmr19867296f8f.45.1763567373753;
        Wed, 19 Nov 2025 07:49:33 -0800 (PST)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.3.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c9628ebacsm25969755f8f.30.2025.11.19.07.49.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Nov 2025 07:49:33 -0800 (PST)
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
Subject: [PATCH v3 2/3] KVM: selftests: Enable pre_fault_memory_test for arm64
Date: Wed, 19 Nov 2025 15:49:09 +0000
Message-ID: <20251119154910.97716-3-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251119154910.97716-1-jackabt.amazon@gmail.com>
References: <20251119154910.97716-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074936_364936_F3863031 
X-CRM114-Status: GOOD (  17.21  )
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
 .../selftests/kvm/pre_fault_memory_test.c     | 78 ++++++++++++++-----
 2 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 148d427ff24b..0ddd8db60197 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -183,6 +183,7 @@ TEST_GEN_PROGS_arm64 += memslot_perf_test
 TEST_GEN_PROGS_arm64 += mmu_stress_test
 TEST_GEN_PROGS_arm64 += rseq_test
 TEST_GEN_PROGS_arm64 += steal_time
+TEST_GEN_PROGS_arm64 += pre_fault_memory_test
 
 TEST_GEN_PROGS_s390 = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_s390 += s390/memop
diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index f04768c1d2e4..674931e7bb3a 100644
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
@@ -159,11 +169,17 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 base_gpa, u64 offset,
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
+	struct test_params *p = arg;
 	const struct vm_shape shape = {
-		.mode = VM_MODE_DEFAULT,
-		.type = vm_type,
+		.mode = guest_mode,
+		.type = p->vm_type,
 	};
 	struct kvm_vcpu *vcpu;
 	struct kvm_run *run;
@@ -174,10 +190,17 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
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
@@ -187,23 +210,31 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
 	guest_test_virt_mem = guest_test_phys_mem & ((1ULL << (vm->va_bits - 1)) - 1);
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    guest_test_phys_mem, TEST_SLOT, TEST_NPAGES,
-				    private ? KVM_MEM_GUEST_MEMFD : 0);
-	virt_map(vm, guest_test_virt_mem, guest_test_phys_mem, TEST_NPAGES);
+				    guest_test_phys_mem, TEST_SLOT, test_config.test_num_pages,
+				    p->private ? KVM_MEM_GUEST_MEMFD : 0);
+	virt_map(vm, guest_test_virt_mem, guest_test_phys_mem, test_config.test_num_pages);
+
+	if (p->private)
+		vm_mem_set_private(vm, guest_test_phys_mem, test_config.test_size);
+	pre_fault_memory(vcpu, guest_test_phys_mem, TEST_BASE_SIZE, 0, p->private);
+	/* Test pre-faulting over an already faulted range */
+	pre_fault_memory(vcpu, guest_test_phys_mem, TEST_BASE_SIZE, 0, p->private);
+	pre_fault_memory(vcpu, guest_test_phys_mem + TEST_BASE_SIZE,
+			 test_config.page_size * 2, test_config.page_size, p->private);
+	pre_fault_memory(vcpu, guest_test_phys_mem + test_config.test_size,
+			 test_config.page_size, test_config.page_size, p->private);
 
-	if (private)
-		vm_mem_set_private(vm, guest_test_phys_mem, TEST_SIZE);
+	vcpu_args_set(vcpu, 1, guest_test_virt_mem);
 
-	pre_fault_memory(vcpu, guest_test_phys_mem, 0, SZ_2M, 0, private);
-	pre_fault_memory(vcpu, guest_test_phys_mem, SZ_2M, PAGE_SIZE * 2, PAGE_SIZE, private);
-	pre_fault_memory(vcpu, guest_test_phys_mem, TEST_SIZE, PAGE_SIZE, PAGE_SIZE, private);
+	/* Export the shared variables to the guest. */
+	sync_global_to_guest(vm, test_config);
 
-	vcpu_args_set(vcpu, 1, guest_test_virt_mem);
 	vcpu_run(vcpu);
 
 	run = vcpu->run;
-	TEST_ASSERT(run->exit_reason == KVM_EXIT_IO,
-		    "Wanted KVM_EXIT_IO, got exit reason: %u (%s)",
+	TEST_ASSERT(run->exit_reason == UCALL_EXIT_REASON,
+		    "Wanted %s, got exit reason: %u (%s)",
+		    exit_reason_str(UCALL_EXIT_REASON),
 		    run->exit_reason, exit_reason_str(run->exit_reason));
 
 	switch (get_ucall(vcpu, &uc)) {
@@ -227,7 +258,12 @@ static void test_pre_fault_memory(unsigned long vm_type, bool private)
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


