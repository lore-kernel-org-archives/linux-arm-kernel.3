Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B020C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJsEx4FG6bZLukMaYebCB5jI3mya4Bwx9n+hJfoOxy0=; b=dX15ZhRrQ+ulRzostD9eIActis
	EquQgd5cvel0yEbrFfZnhEK0q1F+C9oSV3CrwJQA8FCUOWrbUufRSKcyaf0nOYu8NIRXzbsOnoS8U
	DE+85/wtYRvZZXWK06VfcSNX28Fkz19f1tnu/21BpeDaSfEqHinBT2kYRVWCYmQh+/aHtHpxLBCzt
	tq5qpfyjdSG54tTfACCjuydON5PpkhEsfm7h80tHHOt9rqDtbHPR09Euq419VIfWTLiY2rFZ606wp
	o9DHXLFrYxIKeS0HvYSgMIUCgYxUOsTXsdaLZMc5aJlVsvnIqWxUAd4DTb/MEl6f8SGib2btgfVMN
	zB4Heuvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uguCX-00000000LE2-3EVn;
	Tue, 29 Jul 2025 23:57:45 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEy-00000000DxA-0PNQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:56:13 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-24011ceafc8so2491115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829771; x=1754434571; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=iJsEx4FG6bZLukMaYebCB5jI3mya4Bwx9n+hJfoOxy0=;
        b=kA0edsV7nBiRjAE7Hr6KDwv1T/lAGwxw8qqlcf7lZR90jxvCWK1PyTzRWfJ67w3KBg
         j0fpnsbjCklZvlEWjypynzeHze06ryEYXfdGj5wdU3HaY5lqInz+8KK8fGllJqcjC6ut
         lmoYJp2kN88GTE1S73Mod2UJR1Sg9I+r6N5N9C90cCVel6njebQSfkhCQEfIKgLfkxL1
         /BpEEbQYLsk/2Jm/4DOUVFsnRsv3bWIER2NxYZLEwLlGOrF23kI+ecFUQXv4nGbWi7Mq
         tir9y6xFbo9Pk1TQjTvXJi1N1+LskrAsADwIxspnJE3FkWNFkosQMDNaD0VRZ+JBWYkE
         n53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829771; x=1754434571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJsEx4FG6bZLukMaYebCB5jI3mya4Bwx9n+hJfoOxy0=;
        b=nSdMutJN/J9w9DXHW4/pT9ST2MqW11BXnWaZDdavObTwZjQgGvoGZQsCJnQmAMc7Os
         MzuvNVKkx/eTffGHuC59+z5035M3IiNhjMnAER3oaiVWsG+SBXJzyz6elvVp9uSYZgjf
         DSBpTtYrKmVzOalCuIRiDWSHxaGBjNw1GwgRUB/80FxoKGMdR1S/NENqk2TGRbH3z+Js
         1esT8fdTbmzLgPTAE2MUl5UAZGOa/mI4Ncn1uqs5Dy0RfklqA74HtGEOjIVjrVOyu69Z
         Rujm+g0dx7HDZUSI3mM4F8YpvktiuFhNnHBJszMvNyJurd8OZ0n+jdVK3LfhF7YA8l91
         dhug==
X-Forwarded-Encrypted: i=1; AJvYcCUuyAfOMzozRie/Cq6R8TAk2tz9v2p+48eYFil4J0kTt3nUL87ec0tN1TTA6J5WCuXVEEmplZBKZ+fo/gsv+gvy@lists.infradead.org
X-Gm-Message-State: AOJu0YxagPSufmiD5G5msSvo/Z3hpeD5jho7A+oHOHt3f4m1iW4FScC7
	GUJUL+v98kdfY6yPiXRXb9qvdkroJwi253t0lj4+KlUa5vjz71oCzTv2ra0J0oUxt7Ii6X+vzW3
	Z/iDXIw==
X-Google-Smtp-Source: AGHT+IFuvJKbK3bsSX0xIb/YEbZhFW6DEC02S7h04mcxkIxVOmzeLRPCwAt9nWckZ/hRC4rRu0zMmk/gJ8c=
X-Received: from pjyr14.prod.google.com ([2002:a17:90a:e18e:b0:31c:2fe4:33b7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f652:b0:240:79d5:8df4
 with SMTP id d9443c01a7336-24096b499fcmr13337365ad.53.1753829771053; Tue, 29
 Jul 2025 15:56:11 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:54 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-24-seanjc@google.com>
Subject: [PATCH v17 23/24] KVM: selftests: guest_memfd mmap() test when mmap
 is supported
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155612_139969_CFC3C95A 
X-CRM114-Status: GOOD (  20.63  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fuad Tabba <tabba@google.com>

Expand the guest_memfd selftests to comprehensively test host userspace
mmap functionality for guest_memfd-backed memory when supported by the
VM type.

Introduce new test cases to verify the following:

* Successful mmap operations: Ensure that MAP_SHARED mappings succeed
  when guest_memfd mmap is enabled.

* Data integrity: Validate that data written to the mmap'd region is
  correctly persistent and readable.

* fallocate interaction: Test that fallocate(FALLOC_FL_PUNCH_HOLE)
  correctly zeros out mapped pages.

* Out-of-bounds access: Verify that accessing memory beyond the
  guest_memfd's size correctly triggers a SIGBUS signal.

* Unsupported mmap: Confirm that mmap attempts fail as expected when
  guest_memfd mmap support is not enabled for the specific guest_memfd
  instance or VM type.

* Flag validity: Introduce test_vm_type_gmem_flag_validity() to
  systematically test that only allowed guest_memfd creation flags are
  accepted for different VM types (e.g., GUEST_MEMFD_FLAG_MMAP for
  default VMs, no flags for CoCo VMs).

The existing tests for guest_memfd creation (multiple instances, invalid
sizes), file read/write, file size, and invalid punch hole operations
are integrated into the new test_with_type() framework to allow testing
across different VM types.

Cc: James Houghton <jthoughton@google.com>
Cc: Gavin Shan <gshan@redhat.com>
Cc: Shivank Garg <shivankg@amd.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 161 +++++++++++++++---
 1 file changed, 139 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 341ba616cf55..088053d5f0f5 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -13,6 +13,8 @@
 
 #include <linux/bitmap.h>
 #include <linux/falloc.h>
+#include <setjmp.h>
+#include <signal.h>
 #include <sys/mman.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -34,12 +36,83 @@ static void test_file_read_write(int fd)
 		    "pwrite on a guest_mem fd should fail");
 }
 
-static void test_mmap(int fd, size_t page_size)
+static void test_mmap_supported(int fd, size_t page_size, size_t total_size)
+{
+	const char val = 0xaa;
+	char *mem;
+	size_t i;
+	int ret;
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
+	TEST_ASSERT(mem == MAP_FAILED, "Copy-on-write not allowed by guest_memfd.");
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT(mem != MAP_FAILED, "mmap() for guest_memfd should succeed.");
+
+	memset(mem, val, total_size);
+	for (i = 0; i < total_size; i++)
+		TEST_ASSERT_EQ(READ_ONCE(mem[i]), val);
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0,
+			page_size);
+	TEST_ASSERT(!ret, "fallocate the first page should succeed.");
+
+	for (i = 0; i < page_size; i++)
+		TEST_ASSERT_EQ(READ_ONCE(mem[i]), 0x00);
+	for (; i < total_size; i++)
+		TEST_ASSERT_EQ(READ_ONCE(mem[i]), val);
+
+	memset(mem, val, page_size);
+	for (i = 0; i < total_size; i++)
+		TEST_ASSERT_EQ(READ_ONCE(mem[i]), val);
+
+	ret = munmap(mem, total_size);
+	TEST_ASSERT(!ret, "munmap() should succeed.");
+}
+
+static sigjmp_buf jmpbuf;
+void fault_sigbus_handler(int signum)
+{
+	siglongjmp(jmpbuf, 1);
+}
+
+static void test_fault_overflow(int fd, size_t page_size, size_t total_size)
+{
+	struct sigaction sa_old, sa_new = {
+		.sa_handler = fault_sigbus_handler,
+	};
+	size_t map_size = total_size * 4;
+	const char val = 0xaa;
+	char *mem;
+	size_t i;
+	int ret;
+
+	mem = mmap(NULL, map_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT(mem != MAP_FAILED, "mmap() for guest_memfd should succeed.");
+
+	sigaction(SIGBUS, &sa_new, &sa_old);
+	if (sigsetjmp(jmpbuf, 1) == 0) {
+		memset(mem, 0xaa, map_size);
+		TEST_ASSERT(false, "memset() should have triggered SIGBUS.");
+	}
+	sigaction(SIGBUS, &sa_old, NULL);
+
+	for (i = 0; i < total_size; i++)
+		TEST_ASSERT_EQ(READ_ONCE(mem[i]), val);
+
+	ret = munmap(mem, map_size);
+	TEST_ASSERT(!ret, "munmap() should succeed.");
+}
+
+static void test_mmap_not_supported(int fd, size_t page_size, size_t total_size)
 {
 	char *mem;
 
 	mem = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
 	TEST_ASSERT_EQ(mem, MAP_FAILED);
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT_EQ(mem, MAP_FAILED);
 }
 
 static void test_file_size(int fd, size_t page_size, size_t total_size)
@@ -120,26 +193,19 @@ static void test_invalid_punch_hole(int fd, size_t page_size, size_t total_size)
 	}
 }
 
-static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
+static void test_create_guest_memfd_invalid_sizes(struct kvm_vm *vm,
+						  uint64_t guest_memfd_flags,
+						  size_t page_size)
 {
-	size_t page_size = getpagesize();
-	uint64_t flag;
 	size_t size;
 	int fd;
 
 	for (size = 1; size < page_size; size++) {
-		fd = __vm_create_guest_memfd(vm, size, 0);
-		TEST_ASSERT(fd == -1 && errno == EINVAL,
+		fd = __vm_create_guest_memfd(vm, size, guest_memfd_flags);
+		TEST_ASSERT(fd < 0 && errno == EINVAL,
 			    "guest_memfd() with non-page-aligned page size '0x%lx' should fail with EINVAL",
 			    size);
 	}
-
-	for (flag = BIT(0); flag; flag <<= 1) {
-		fd = __vm_create_guest_memfd(vm, page_size, flag);
-		TEST_ASSERT(fd == -1 && errno == EINVAL,
-			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
-			    flag);
-	}
 }
 
 static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
@@ -171,30 +237,81 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
 	close(fd1);
 }
 
-int main(int argc, char *argv[])
+static void test_guest_memfd_flags(struct kvm_vm *vm, uint64_t valid_flags)
 {
-	size_t page_size;
-	size_t total_size;
+	size_t page_size = getpagesize();
+	uint64_t flag;
 	int fd;
+
+	for (flag = BIT(0); flag; flag <<= 1) {
+		fd = __vm_create_guest_memfd(vm, page_size, flag);
+		if (flag & valid_flags) {
+			TEST_ASSERT(fd >= 0,
+				    "guest_memfd() with flag '0x%lx' should succeed",
+				    flag);
+			close(fd);
+		} else {
+			TEST_ASSERT(fd < 0 && errno == EINVAL,
+				    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
+				    flag);
+		}
+	}
+}
+
+static void test_guest_memfd(unsigned long vm_type)
+{
+	uint64_t flags = 0;
 	struct kvm_vm *vm;
-
-	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
+	size_t total_size;
+	size_t page_size;
+	int fd;
 
 	page_size = getpagesize();
 	total_size = page_size * 4;
 
-	vm = vm_create_barebones();
+	vm = vm_create_barebones_type(vm_type);
+
+	if (vm_check_cap(vm, KVM_CAP_GUEST_MEMFD_MMAP))
+		flags |= GUEST_MEMFD_FLAG_MMAP;
 
-	test_create_guest_memfd_invalid(vm);
 	test_create_guest_memfd_multiple(vm);
+	test_create_guest_memfd_invalid_sizes(vm, flags, page_size);
 
-	fd = vm_create_guest_memfd(vm, total_size, 0);
+	fd = vm_create_guest_memfd(vm, total_size, flags);
 
 	test_file_read_write(fd);
-	test_mmap(fd, page_size);
+
+	if (flags & GUEST_MEMFD_FLAG_MMAP) {
+		test_mmap_supported(fd, page_size, total_size);
+		test_fault_overflow(fd, page_size, total_size);
+	} else {
+		test_mmap_not_supported(fd, page_size, total_size);
+	}
+
 	test_file_size(fd, page_size, total_size);
 	test_fallocate(fd, page_size, total_size);
 	test_invalid_punch_hole(fd, page_size, total_size);
 
+	test_guest_memfd_flags(vm, flags);
+
 	close(fd);
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char *argv[])
+{
+	unsigned long vm_types, vm_type;
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
+
+	/*
+	 * Not all architectures support KVM_CAP_VM_TYPES. However, those that
+	 * support guest_memfd have that support for the default VM type.
+	 */
+	vm_types = kvm_check_cap(KVM_CAP_VM_TYPES);
+	if (!vm_types)
+		vm_types = VM_TYPE_DEFAULT;
+
+	for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
+		test_guest_memfd(vm_type);
 }
-- 
2.50.1.552.g942d659e1b-goog


