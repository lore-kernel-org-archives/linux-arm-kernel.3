Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B8CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8gbNSyyPwETvpRi8nU7lhBfk6CAq4ixhNTmiBrenco=; b=ACq3kW62hu7k2TTL3EiIZMgdew
	3swv2h9GXR0liZn3n0Wj9IXC1jKus66cs107RCazQ1ucnTx/2yso0s5BfoLwAo17SypmYyW/TxxyN
	1utlRS7IVSwllNaktV58ntTYEPH3tz7q5NPEp+Fp5yOoyB6L7dgTVuvglxkjeMe8107DIp8rmiWAZ
	qDA8zA7aMEwN3peQNGJT/cT3stbmJF7AUJwr42u459zhQ+/gKOh+T3EvsnSQxLZ5oFIC2lXHVJPoF
	kQ2GiQA0bM6BVMvSXUQ4tI/c1uwQmlrTXP/1miozL4O6RT8G6V2nj66iQZ22B8nVAePVtnXWNXpHo
	JFbumP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzhc-0000000DJVK-1Qx4;
	Thu, 09 Jan 2025 21:04:28 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTh-0000000DGa7-0m9p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:06 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id 6a1803df08f44-6d87d6c09baso18867566d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455804; x=1737060604; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8gbNSyyPwETvpRi8nU7lhBfk6CAq4ixhNTmiBrenco=;
        b=HJ/H4vNcbdw92D0yRckC3IMojVJjP+tsJlg1s22iB3HlRAYp4NnshCFMpcDMJqtjhz
         fsbJ5Ccwf5KfDTXgRu/BB+j/NLzrniOJwlI7jDWPgeCmnNvvlFZKn0wmzKtNjalCisT5
         KkNxGR9EuArVXZU/028rxGJj++b9IY4xt5MZFY4oGekSxyrNqf04+y6u2SpVlzVZCL2t
         Kg8t1QmT5FKfGaFEAbgLuLMzhrYffvZUEFPEZF6zpJ4iD0w15GLwQ+Dc8/iH15V6ywhJ
         Xr/Xoeyajj4OnL8N4KLkNedDlJMOKNuZr8f/OaU3krDilFZ0YvkfItjXZGCK2qfqy+uX
         a6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455804; x=1737060604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8gbNSyyPwETvpRi8nU7lhBfk6CAq4ixhNTmiBrenco=;
        b=tAMXfXUpSt1pt6/X/CtGk8NzmU99PqnrqBc7TmV3N2FlQP80QgxB9ZW3Ydqxc6oO7f
         EI6/YrjnRXBV/+5hsqwc1JKFNiP7RWfuEv5Te+lEqWLkAQEiKjwUdGxvlxKqRJkKAlK8
         G8k4ul9OEWyb5V+7hogPT1G2v9C7cVd4ZbZS8h9TcrhY1oycd4rZd3SbCRRFPiuAP9PE
         u4+QIVhTsqQt/yXJ0yCXgwqcLnOBtDqILSZr4HnqxNUeE203GgM43kgFFbx3OoCMvtfG
         P0J1/C4wCYhRbf8Bupm6oAB9uqUfNB8Td22FahkdgbD4Gn7pjTwUcjoici1Ez3eqiJin
         9uAw==
X-Forwarded-Encrypted: i=1; AJvYcCVM2XjMC5v8R9ireX1pi4LROUX0cgUQpwlt5YuPVi8dFS4eeYGPIIoCdwF+99/tZ1CTW4xyfYl0Znu1TEWAU6KB@lists.infradead.org
X-Gm-Message-State: AOJu0YyLdl5zfwx38svyGSX2qIAQpzxNHH/yvVxi8UpbVXMQ8LGYyHVI
	QCkpyKcWW626HJjAH+WavC90Lh1DuGaA3HOrJAzJF5n+qjNBuk58RawVhaspWfoCgTqPMPPOEzR
	Y23z6Qrq6dp+jvSZV4A==
X-Google-Smtp-Source: AGHT+IEi3mzHkXPZiL5KdytvEtxQWpAfAta5Mi5rbpufEknhZSKdy69JHtvBwhVHRWx68M/7Cxqd+lUk9mWkjayn
X-Received: from qvlh7.prod.google.com ([2002:a0c:f407:0:b0:6dd:3c13:842])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:53c6:b0:6d4:586:6291 with SMTP id 6a1803df08f44-6df9b232c31mr147596196d6.25.1736455803946;
 Thu, 09 Jan 2025 12:50:03 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:26 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-11-jthoughton@google.com>
Subject: [PATCH v2 10/13] KVM: selftests: Add KVM Userfault mode to demand_paging_test
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_125005_228176_88157297 
X-CRM114-Status: GOOD (  30.19  )
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

Add a way for the KVM_RUN loop to handle -EFAULT exits when they are for
KVM_MEMORY_EXIT_FLAG_USERFAULT. In this case, preemptively handle the
UFFDIO_COPY or UFFDIO_CONTINUE if userfaultfd is also in use. This saves
the trip through the userfaultfd poll/read/WAKE loop.

When preemptively handling UFFDIO_COPY/CONTINUE, do so with
MODE_DONTWAKE, as there will not be a thread to wake. If a thread *does*
take the userfaultfd slow path, we will get a regular userfault, and we
will call handle_uffd_page_request() which will do a full wake-up. In
the EEXIST case, a wake-up will not occur. Make sure to call UFFDIO_WAKE
explicitly in this case.

When handling KVM userfaults, make sure to set the bitmap with
memory_order_release. Although it wouldn't affect the functionality of
the test (because memstress doesn't actually require any particular
guest memory contents), it is what userspace normally needs to do.

Add `-k` to set the test to use KVM Userfault.

Add the vm_mem_region_set_flags_userfault() helper for setting
`userfault_bitmap` and KVM_MEM_USERFAULT at the same time.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../selftests/kvm/demand_paging_test.c        | 139 +++++++++++++++++-
 .../testing/selftests/kvm/include/kvm_util.h  |   5 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  40 ++++-
 3 files changed, 176 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
index 315f5c9037b4..183c70731093 100644
--- a/tools/testing/selftests/kvm/demand_paging_test.c
+++ b/tools/testing/selftests/kvm/demand_paging_test.c
@@ -12,7 +12,9 @@
 #include <time.h>
 #include <pthread.h>
 #include <linux/userfaultfd.h>
+#include <linux/bitmap.h>
 #include <sys/syscall.h>
+#include <stdatomic.h>
 
 #include "kvm_util.h"
 #include "test_util.h"
@@ -24,11 +26,21 @@
 #ifdef __NR_userfaultfd
 
 static int nr_vcpus = 1;
+static int num_uffds;
 static uint64_t guest_percpu_mem_size = DEFAULT_PER_VCPU_MEM_SIZE;
 
 static size_t demand_paging_size;
+static size_t host_page_size;
 static char *guest_data_prototype;
 
+static struct {
+	bool enabled;
+	int uffd_mode; /* set if userfaultfd is also in use */
+	struct uffd_desc **uffd_descs;
+} kvm_userfault_data;
+
+static void resolve_kvm_userfault(u64 gpa, u64 size);
+
 static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 {
 	struct kvm_vcpu *vcpu = vcpu_args->vcpu;
@@ -41,8 +53,22 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 	clock_gettime(CLOCK_MONOTONIC, &start);
 
 	/* Let the guest access its memory */
+restart:
 	ret = _vcpu_run(vcpu);
-	TEST_ASSERT(ret == 0, "vcpu_run failed: %d", ret);
+	if (ret < 0 && errno == EFAULT && kvm_userfault_data.enabled) {
+		/* Check for userfault. */
+		TEST_ASSERT(run->exit_reason == KVM_EXIT_MEMORY_FAULT,
+			    "Got invalid exit reason: %x", run->exit_reason);
+		TEST_ASSERT(run->memory_fault.flags ==
+			    KVM_MEMORY_EXIT_FLAG_USERFAULT,
+			    "Got invalid memory fault exit: %llx",
+			    run->memory_fault.flags);
+		resolve_kvm_userfault(run->memory_fault.gpa,
+				      run->memory_fault.size);
+		goto restart;
+	} else
+		TEST_ASSERT(ret == 0, "vcpu_run failed: %d", ret);
+
 	if (get_ucall(vcpu, NULL) != UCALL_SYNC) {
 		TEST_ASSERT(false,
 			    "Invalid guest sync status: exit_reason=%s",
@@ -54,11 +80,10 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 		       ts_diff.tv_sec, ts_diff.tv_nsec);
 }
 
-static int handle_uffd_page_request(int uffd_mode, int uffd,
-		struct uffd_msg *msg)
+static int resolve_uffd_page_request(int uffd_mode, int uffd, uint64_t addr,
+				     bool wake)
 {
 	pid_t tid = syscall(__NR_gettid);
-	uint64_t addr = msg->arg.pagefault.address;
 	struct timespec start;
 	struct timespec ts_diff;
 	int r;
@@ -71,7 +96,7 @@ static int handle_uffd_page_request(int uffd_mode, int uffd,
 		copy.src = (uint64_t)guest_data_prototype;
 		copy.dst = addr;
 		copy.len = demand_paging_size;
-		copy.mode = 0;
+		copy.mode = wake ? 0 : UFFDIO_COPY_MODE_DONTWAKE;
 
 		r = ioctl(uffd, UFFDIO_COPY, &copy);
 		/*
@@ -96,6 +121,7 @@ static int handle_uffd_page_request(int uffd_mode, int uffd,
 
 		cont.range.start = addr;
 		cont.range.len = demand_paging_size;
+		cont.mode = wake ? 0 : UFFDIO_CONTINUE_MODE_DONTWAKE;
 
 		r = ioctl(uffd, UFFDIO_CONTINUE, &cont);
 		/*
@@ -119,6 +145,20 @@ static int handle_uffd_page_request(int uffd_mode, int uffd,
 		TEST_FAIL("Invalid uffd mode %d", uffd_mode);
 	}
 
+	if (r < 0 && wake) {
+		/*
+		 * No wake-up occurs when UFFDIO_COPY/CONTINUE fails, but we
+		 * have a thread waiting. Wake it up.
+		 */
+		struct uffdio_range range = {0};
+
+		range.start = addr;
+		range.len = demand_paging_size;
+
+		TEST_ASSERT(ioctl(uffd, UFFDIO_WAKE, &range) == 0,
+			    "UFFDIO_WAKE failed: 0x%lx", addr);
+	}
+
 	ts_diff = timespec_elapsed(start);
 
 	PER_PAGE_DEBUG("UFFD page-in %d \t%ld ns\n", tid,
@@ -129,6 +169,58 @@ static int handle_uffd_page_request(int uffd_mode, int uffd,
 	return 0;
 }
 
+static int handle_uffd_page_request(int uffd_mode, int uffd,
+				    struct uffd_msg *msg)
+{
+	uint64_t addr = msg->arg.pagefault.address;
+
+	return resolve_uffd_page_request(uffd_mode, uffd, addr, true);
+}
+
+static void resolve_kvm_userfault(u64 gpa, u64 size)
+{
+	struct kvm_vm *vm = memstress_args.vm;
+	struct userspace_mem_region *region;
+	unsigned long *bitmap_chunk;
+	u64 page, gpa_offset;
+
+	region = (struct userspace_mem_region *) userspace_mem_region_find(
+		vm, gpa, (gpa + size - 1));
+
+	if (kvm_userfault_data.uffd_mode) {
+		/*
+		 * Resolve userfaults early, without needing to read them
+		 * off the userfaultfd.
+		 */
+		uint64_t hva = (uint64_t)addr_gpa2hva(vm, gpa);
+		struct uffd_desc **descs = kvm_userfault_data.uffd_descs;
+		int i, fd;
+
+		for (i = 0; i < num_uffds; ++i)
+			if (hva >= (uint64_t)descs[i]->va_start &&
+			    hva < (uint64_t)descs[i]->va_end)
+				break;
+
+		TEST_ASSERT(i < num_uffds,
+			    "Did not find userfaultfd for hva: %lx", hva);
+
+		fd = kvm_userfault_data.uffd_descs[i]->uffd;
+		resolve_uffd_page_request(kvm_userfault_data.uffd_mode, fd,
+					  hva, false);
+	} else {
+		uint64_t hva = (uint64_t)addr_gpa2hva(vm, gpa);
+
+		memcpy((char *)hva, guest_data_prototype, demand_paging_size);
+	}
+
+	gpa_offset = gpa - region->region.guest_phys_addr;
+	page = gpa_offset / host_page_size;
+	bitmap_chunk = (unsigned long *)region->region.userfault_bitmap +
+		       page / BITS_PER_LONG;
+	atomic_fetch_and_explicit((_Atomic unsigned long *)bitmap_chunk,
+			~(1ul << (page % BITS_PER_LONG)), memory_order_release);
+}
+
 struct test_params {
 	int uffd_mode;
 	bool single_uffd;
@@ -136,6 +228,7 @@ struct test_params {
 	int readers_per_uffd;
 	enum vm_mem_backing_src_type src_type;
 	bool partition_vcpu_memory_access;
+	bool kvm_userfault;
 };
 
 static void prefault_mem(void *alias, uint64_t len)
@@ -149,6 +242,25 @@ static void prefault_mem(void *alias, uint64_t len)
 	}
 }
 
+static void enable_userfault(struct kvm_vm *vm, int slots)
+{
+	for (int i = 0; i < slots; ++i) {
+		int slot = MEMSTRESS_MEM_SLOT_INDEX + i;
+		struct userspace_mem_region *region;
+		unsigned long *userfault_bitmap;
+		int flags = KVM_MEM_USERFAULT;
+
+		region = memslot2region(vm, slot);
+		userfault_bitmap = bitmap_zalloc(region->mmap_size /
+						 host_page_size);
+		/* everything is userfault initially */
+		memset(userfault_bitmap, -1, region->mmap_size / host_page_size / CHAR_BIT);
+		printf("Setting bitmap: %p\n", userfault_bitmap);
+		vm_mem_region_set_flags_userfault(vm, slot, flags,
+						  userfault_bitmap);
+	}
+}
+
 static void run_test(enum vm_guest_mode mode, void *arg)
 {
 	struct memstress_vcpu_args *vcpu_args;
@@ -159,12 +271,13 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 	struct timespec ts_diff;
 	double vcpu_paging_rate;
 	struct kvm_vm *vm;
-	int i, num_uffds = 0;
+	int i;
 
 	vm = memstress_create_vm(mode, nr_vcpus, guest_percpu_mem_size, 1,
 				 p->src_type, p->partition_vcpu_memory_access);
 
 	demand_paging_size = get_backing_src_pagesz(p->src_type);
+	host_page_size = getpagesize();
 
 	guest_data_prototype = malloc(demand_paging_size);
 	TEST_ASSERT(guest_data_prototype,
@@ -208,6 +321,14 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 		}
 	}
 
+	if (p->kvm_userfault) {
+		TEST_REQUIRE(kvm_has_cap(KVM_CAP_USERFAULT));
+		kvm_userfault_data.enabled = true;
+		kvm_userfault_data.uffd_mode = p->uffd_mode;
+		kvm_userfault_data.uffd_descs = uffd_descs;
+		enable_userfault(vm, 1);
+	}
+
 	pr_info("Finished creating vCPUs and starting uffd threads\n");
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
@@ -265,6 +386,7 @@ static void help(char *name)
 	printf(" -v: specify the number of vCPUs to run.\n");
 	printf(" -o: Overlap guest memory accesses instead of partitioning\n"
 	       "     them into a separate region of memory for each vCPU.\n");
+	printf(" -k: Use KVM Userfault\n");
 	puts("");
 	exit(0);
 }
@@ -283,7 +405,7 @@ int main(int argc, char *argv[])
 
 	guest_modes_append_default();
 
-	while ((opt = getopt(argc, argv, "ahom:u:d:b:s:v:c:r:")) != -1) {
+	while ((opt = getopt(argc, argv, "ahokm:u:d:b:s:v:c:r:")) != -1) {
 		switch (opt) {
 		case 'm':
 			guest_modes_cmdline(optarg);
@@ -326,6 +448,9 @@ int main(int argc, char *argv[])
 				    "Invalid number of readers per uffd %d: must be >=1",
 				    p.readers_per_uffd);
 			break;
+		case 'k':
+			p.kvm_userfault = true;
+			break;
 		case 'h':
 		default:
 			help(argv[0]);
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 4c4e5a847f67..0d49a9ce832a 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -582,6 +582,8 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		uint64_t guest_paddr, uint32_t slot, uint64_t npages,
 		uint32_t flags, int guest_memfd_fd, uint64_t guest_memfd_offset);
+struct userspace_mem_region *
+userspace_mem_region_find(struct kvm_vm *vm, uint64_t start, uint64_t end);
 
 #ifndef vm_arch_has_protected_memory
 static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
@@ -591,6 +593,9 @@ static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
 #endif
 
 void vm_mem_region_set_flags(struct kvm_vm *vm, uint32_t slot, uint32_t flags);
+void vm_mem_region_set_flags_userfault(struct kvm_vm *vm, uint32_t slot,
+				       uint32_t flags,
+				       unsigned long *userfault_bitmap);
 void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa);
 void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot);
 struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index a87988a162f1..a8f6b949ac59 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -634,7 +634,7 @@ void kvm_parse_vcpu_pinning(const char *pcpus_string, uint32_t vcpu_to_pcpu[],
  * of the regions is returned.  Null is returned only when no overlapping
  * region exists.
  */
-static struct userspace_mem_region *
+struct userspace_mem_region *
 userspace_mem_region_find(struct kvm_vm *vm, uint64_t start, uint64_t end)
 {
 	struct rb_node *node;
@@ -1149,6 +1149,44 @@ void vm_mem_region_set_flags(struct kvm_vm *vm, uint32_t slot, uint32_t flags)
 		ret, errno, slot, flags);
 }
 
+/*
+ * VM Memory Region Flags Set with a userfault bitmap
+ *
+ * Input Args:
+ *   vm - Virtual Machine
+ *   flags - Flags for the memslot
+ *   userfault_bitmap - The bitmap to use for KVM_MEM_USERFAULT
+ *
+ * Output Args: None
+ *
+ * Return: None
+ *
+ * Sets the flags of the memory region specified by the value of slot,
+ * to the values given by flags. This helper adds a way to provide a
+ * userfault_bitmap.
+ */
+void vm_mem_region_set_flags_userfault(struct kvm_vm *vm, uint32_t slot,
+				       uint32_t flags,
+				       unsigned long *userfault_bitmap)
+{
+	int ret;
+	struct userspace_mem_region *region;
+
+	region = memslot2region(vm, slot);
+
+	TEST_ASSERT(!userfault_bitmap ^ (flags & KVM_MEM_USERFAULT),
+		    "KVM_MEM_USERFAULT must be specified with a bitmap");
+
+	region->region.flags = flags;
+	region->region.userfault_bitmap = (__u64)userfault_bitmap;
+
+	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
+
+	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL failed,\n"
+		"  rc: %i errno: %i slot: %u flags: 0x%x",
+		ret, errno, slot, flags);
+}
+
 /*
  * VM Memory Region Move
  *
-- 
2.47.1.613.gc27f4b7a9f-goog


