Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E81CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeYpfbq+bUrw10bMhLpb61aMSNzkCXl+5dpW90xnFMY=; b=Sa0u0PQ5/K47+udEqjAg/5Q9kl
	cfXwcCnLLLEWOGCfJDYAVWu6qD7w/htCLOd7u+rFDDf6tpgk9cyCM6fNH9uoZjBRwUspGOhRNFIBh
	wxA2rnbVQWng0ORUzIKq2y3I78tG1SSosnaP6uCv31GmKzPjqMG7zT4IUyyXYWamzV4wcg8db237X
	Wloj8xSOyWX9Om5sWIxnhL5mHwEh0ZJNze5Uz1xYAq/2yqW5fOfKRIWWk7Euinghj4hMGqjkZrhNx
	o1fSVuEBoZAiYZpITb1ZZEnMPFHXdqmgjdD1sZuZxqyvamteqQG7rzI7BPOzNci4GQMFUH3xwvhvV
	+c9y/3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RoG-00000005Zrq-2lQ1;
	Thu, 16 Oct 2025 17:30:40 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rny-00000005Zd6-23wf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:23 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b522037281bso722198a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635819; x=1761240619; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeYpfbq+bUrw10bMhLpb61aMSNzkCXl+5dpW90xnFMY=;
        b=joteinV+IZAvQyK3NzQ3kDHyMNG2IYsmwloAvK4Dvbs/qHT0JwHPi8uny5yn2v4d3q
         fG4H1wWiPSobThQ1c/9fbKZBrDliJNCWFnnZ17CpOm9WTp4iTjN2TQM8r6vlYFxMyT8u
         +wX6uZnrZWuRVaHP1u3bh6Ii+3++rgQoaE8oPLyo2eKqaZKyKppMYkt8djsybikC3w2c
         O9eKCoCyvAtqLSYSJ4YwpzOwXhmnUpX9IYPSBmDMIeSOXJoUGZTOCMQSWsvVSGsF+xa6
         iyHVtjrNOyg70US2x8sGcCNf1ez8HOQ6hxPQY2gaSJQhJYLXsycKB2kvMWalWk6SlaeP
         twMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635819; x=1761240619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeYpfbq+bUrw10bMhLpb61aMSNzkCXl+5dpW90xnFMY=;
        b=Hi54UwQ12+rRTKLqSQ5ajW/u6jYDttQHPjhTwurv+eAKWLjcvSL/JoopotRn8lMknU
         s2gQNDeZCjRbX/XwNpIdZlu++KLt2+NmwJ2TiALQZSMfvi0BcFmb72OrFkzDLb9x6Va7
         2IHBNTvCeYoIdX+j4IO0c56H9V880bKdiQkqGO0lDpiY6LuE+PzbxfEw5px8NNiMIFz6
         f1nzEiuBpHZ9ekVynp1MhT87/6HJWdK/yDKP02IQhGZqKSi6EPxIa6kxamRMw38OjUO8
         KdV4ti9MjoBRmYJgpsQde+Xe2XpSz3M1soLuKl7iKw2qyocZess+YvuIB0aS0Ka8JtyS
         bbxw==
X-Gm-Message-State: AOJu0YyfrLBljhtP4rB+nm+WiIgUafsOLZCEudVRgpvv0kEBawccODwg
	tEwylQ2kVYv4TS2Gy4KD1DDOss9+SNtjfNh9bKWgjeChcITiKDZVhF6PD57DIOwIy1OY5Fp1zpr
	1K/5mjA==
X-Google-Smtp-Source: AGHT+IE77aGyxMQRmagXmcXjl3OcOlQFM+l0gZVUzgMWQS5/i2T2F0rxu2RnGvNeCUgOEREjGdXqKJ3LbW0=
X-Received: from pjbgj22.prod.google.com ([2002:a17:90b:1096:b0:33b:b387:9850])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fd0:b0:32d:601d:f718
 with SMTP id 98e67ed59e1d1-33bcf8f9c16mr599759a91.31.1760635818979; Thu, 16
 Oct 2025 10:30:18 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:47 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-7-seanjc@google.com>
Subject: [PATCH v13 06/12] KVM: selftests: Define wrappers for common syscalls
 to assert success
From: Sean Christopherson <seanjc@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_103022_562140_53C294B0 
X-CRM114-Status: GOOD (  24.06  )
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

Add kvm_<sycall> wrappers for munmap(), close(), fallocate(), and
ftruncate() to cut down on boilerplate code when a sycall is expected
to succeed, and to make it easier for developers to remember to assert
success.

Implement and use a macro framework similar to the kernel's SYSCALL_DEFINE
infrastructure to further cut down on boilerplate code, and to drastically
reduce the probability of typos as the kernel's syscall definitions can be
copy+paste almost verbatim.

Provide macros to build the raw <sycall>() wrappers as well, e.g. to
replace hand-coded wrappers (NUMA) or pure open-coded calls.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c  |  2 +-
 .../selftests/kvm/include/kvm_syscalls.h      | 81 +++++++++++++++++++
 .../testing/selftests/kvm/include/kvm_util.h  | 29 +------
 .../selftests/kvm/kvm_binary_stats_test.c     |  4 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 31 ++-----
 .../kvm/x86/private_mem_conversions_test.c    |  9 +--
 6 files changed, 96 insertions(+), 60 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/kvm_syscalls.h

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 6338f5bbdb70..8d7758f12280 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -636,7 +636,7 @@ static void kvm_routing_and_irqfd_check(struct kvm_vm *vm,
 	}
 
 	for (f = 0, i = intid; i < (uint64_t)intid + num; i++, f++)
-		close(fd[f]);
+		kvm_close(fd[f]);
 }
 
 /* handles the valid case: intid=0xffffffff num=1 */
diff --git a/tools/testing/selftests/kvm/include/kvm_syscalls.h b/tools/testing/selftests/kvm/include/kvm_syscalls.h
new file mode 100644
index 000000000000..d4e613162bba
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/kvm_syscalls.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_SYSCALLS_H
+#define SELFTEST_KVM_SYSCALLS_H
+
+#include <sys/syscall.h>
+
+#define MAP_ARGS0(m,...)
+#define MAP_ARGS1(m,t,a,...) m(t,a)
+#define MAP_ARGS2(m,t,a,...) m(t,a), MAP_ARGS1(m,__VA_ARGS__)
+#define MAP_ARGS3(m,t,a,...) m(t,a), MAP_ARGS2(m,__VA_ARGS__)
+#define MAP_ARGS4(m,t,a,...) m(t,a), MAP_ARGS3(m,__VA_ARGS__)
+#define MAP_ARGS5(m,t,a,...) m(t,a), MAP_ARGS4(m,__VA_ARGS__)
+#define MAP_ARGS6(m,t,a,...) m(t,a), MAP_ARGS5(m,__VA_ARGS__)
+#define MAP_ARGS(n,...) MAP_ARGS##n(__VA_ARGS__)
+
+#define __DECLARE_ARGS(t, a)	t a
+#define __UNPACK_ARGS(t, a)	a
+
+#define DECLARE_ARGS(nr_args, args...) MAP_ARGS(nr_args, __DECLARE_ARGS, args)
+#define UNPACK_ARGS(nr_args, args...) MAP_ARGS(nr_args, __UNPACK_ARGS, args)
+
+#define __KVM_SYSCALL_ERROR(_name, _ret) \
+	"%s failed, rc: %i errno: %i (%s)", (_name), (_ret), errno, strerror(errno)
+
+/* Define a kvm_<syscall>() API to assert success. */
+#define __KVM_SYSCALL_DEFINE(name, nr_args, args...)			\
+static inline void kvm_##name(DECLARE_ARGS(nr_args, args))		\
+{									\
+	int r;								\
+									\
+	r = name(UNPACK_ARGS(nr_args, args));				\
+	TEST_ASSERT(!r, __KVM_SYSCALL_ERROR(#name, r));			\
+}
+
+/*
+ * Macro to define syscall APIs, either because KVM selftests doesn't link to
+ * the standard library, e.g. libnuma, or because there is no library that yet
+ * provides the syscall.  These
+ */
+#define KVM_SYSCALL_DEFINE(name, nr_args, args...)			\
+static inline long name(DECLARE_ARGS(nr_args, args))			\
+{									\
+	return syscall(__NR_##name, UNPACK_ARGS(nr_args, args));	\
+}									\
+__KVM_SYSCALL_DEFINE(name, nr_args, args)
+
+/*
+ * Special case mmap(), as KVM selftest rarely/never specific an address,
+ * rarely specify an offset, and because the unique return code requires
+ * special handling anyways.
+ */
+static inline void *__kvm_mmap(size_t size, int prot, int flags, int fd,
+			       off_t offset)
+{
+	void *mem;
+
+	mem = mmap(NULL, size, prot, flags, fd, offset);
+	TEST_ASSERT(mem != MAP_FAILED, __KVM_SYSCALL_ERROR("mmap()",
+		    (int)(unsigned long)MAP_FAILED));
+	return mem;
+}
+
+static inline void *kvm_mmap(size_t size, int prot, int flags, int fd)
+{
+	return __kvm_mmap(size, prot, flags, fd, 0);
+}
+
+static inline int kvm_dup(int fd)
+{
+	int new_fd = dup(fd);
+
+	TEST_ASSERT(new_fd >= 0, __KVM_SYSCALL_ERROR("dup()", new_fd));
+	return new_fd;
+}
+
+__KVM_SYSCALL_DEFINE(munmap, 2, void *, mem, size_t, size);
+__KVM_SYSCALL_DEFINE(close, 1, int, fd);
+__KVM_SYSCALL_DEFINE(fallocate, 4, int, fd, int, mode, loff_t, offset, loff_t, len);
+__KVM_SYSCALL_DEFINE(ftruncate, 2, unsigned int, fd, off_t, length);
+
+#endif /* SELFTEST_KVM_SYSCALLS_H */
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index ee60dbf5208a..c610169933ef 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -23,6 +23,7 @@
 
 #include <pthread.h>
 
+#include "kvm_syscalls.h"
 #include "kvm_util_arch.h"
 #include "kvm_util_types.h"
 #include "sparsebit.h"
@@ -283,34 +284,6 @@ static inline bool kvm_has_cap(long cap)
 	return kvm_check_cap(cap);
 }
 
-#define __KVM_SYSCALL_ERROR(_name, _ret) \
-	"%s failed, rc: %i errno: %i (%s)", (_name), (_ret), errno, strerror(errno)
-
-static inline void *__kvm_mmap(size_t size, int prot, int flags, int fd,
-			       off_t offset)
-{
-	void *mem;
-
-	mem = mmap(NULL, size, prot, flags, fd, offset);
-	TEST_ASSERT(mem != MAP_FAILED, __KVM_SYSCALL_ERROR("mmap()",
-		    (int)(unsigned long)MAP_FAILED));
-
-	return mem;
-}
-
-static inline void *kvm_mmap(size_t size, int prot, int flags, int fd)
-{
-	return __kvm_mmap(size, prot, flags, fd, 0);
-}
-
-static inline void kvm_munmap(void *mem, size_t size)
-{
-	int ret;
-
-	ret = munmap(mem, size);
-	TEST_ASSERT(!ret, __KVM_SYSCALL_ERROR("munmap()", ret));
-}
-
 /*
  * Use the "inner", double-underscore macro when reporting errors from within
  * other macros so that the name of ioctl() and not its literal numeric value
diff --git a/tools/testing/selftests/kvm/kvm_binary_stats_test.c b/tools/testing/selftests/kvm/kvm_binary_stats_test.c
index f02355c3c4c2..b7dbde9c0843 100644
--- a/tools/testing/selftests/kvm/kvm_binary_stats_test.c
+++ b/tools/testing/selftests/kvm/kvm_binary_stats_test.c
@@ -239,14 +239,14 @@ int main(int argc, char *argv[])
 		 * single stats file works and doesn't cause explosions.
 		 */
 		vm_stats_fds = vm_get_stats_fd(vms[i]);
-		stats_test(dup(vm_stats_fds));
+		stats_test(kvm_dup(vm_stats_fds));
 
 		/* Verify userspace can instantiate multiple stats files. */
 		stats_test(vm_get_stats_fd(vms[i]));
 
 		for (j = 0; j < max_vcpu; ++j) {
 			vcpu_stats_fds[j] = vcpu_get_stats_fd(vcpus[i * max_vcpu + j]);
-			stats_test(dup(vcpu_stats_fds[j]));
+			stats_test(kvm_dup(vcpu_stats_fds[j]));
 			stats_test(vcpu_get_stats_fd(vcpus[i * max_vcpu + j]));
 		}
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 83a721be7ec5..8b60b767224b 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -704,8 +704,6 @@ userspace_mem_region_find(struct kvm_vm *vm, uint64_t start, uint64_t end)
 
 static void kvm_stats_release(struct kvm_binary_stats *stats)
 {
-	int ret;
-
 	if (stats->fd < 0)
 		return;
 
@@ -714,8 +712,7 @@ static void kvm_stats_release(struct kvm_binary_stats *stats)
 		stats->desc = NULL;
 	}
 
-	ret = close(stats->fd);
-	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+	kvm_close(stats->fd);
 	stats->fd = -1;
 }
 
@@ -738,8 +735,6 @@ __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
  */
 static void vm_vcpu_rm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
-	int ret;
-
 	if (vcpu->dirty_gfns) {
 		kvm_munmap(vcpu->dirty_gfns, vm->dirty_ring_size);
 		vcpu->dirty_gfns = NULL;
@@ -747,9 +742,7 @@ static void vm_vcpu_rm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 
 	kvm_munmap(vcpu->run, vcpu_mmap_sz());
 
-	ret = close(vcpu->fd);
-	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
-
+	kvm_close(vcpu->fd);
 	kvm_stats_release(&vcpu->stats);
 
 	list_del(&vcpu->list);
@@ -761,16 +754,12 @@ static void vm_vcpu_rm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 void kvm_vm_release(struct kvm_vm *vmp)
 {
 	struct kvm_vcpu *vcpu, *tmp;
-	int ret;
 
 	list_for_each_entry_safe(vcpu, tmp, &vmp->vcpus, list)
 		vm_vcpu_rm(vmp, vcpu);
 
-	ret = close(vmp->fd);
-	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
-
-	ret = close(vmp->kvm_fd);
-	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+	kvm_close(vmp->fd);
+	kvm_close(vmp->kvm_fd);
 
 	/* Free cached stats metadata and close FD */
 	kvm_stats_release(&vmp->stats);
@@ -828,7 +817,7 @@ void kvm_vm_free(struct kvm_vm *vmp)
 int kvm_memfd_alloc(size_t size, bool hugepages)
 {
 	int memfd_flags = MFD_CLOEXEC;
-	int fd, r;
+	int fd;
 
 	if (hugepages)
 		memfd_flags |= MFD_HUGETLB;
@@ -836,11 +825,8 @@ int kvm_memfd_alloc(size_t size, bool hugepages)
 	fd = memfd_create("kvm_selftest", memfd_flags);
 	TEST_ASSERT(fd != -1, __KVM_SYSCALL_ERROR("memfd_create()", fd));
 
-	r = ftruncate(fd, size);
-	TEST_ASSERT(!r, __KVM_SYSCALL_ERROR("ftruncate()", r));
-
-	r = fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, size);
-	TEST_ASSERT(!r, __KVM_SYSCALL_ERROR("fallocate()", r));
+	kvm_ftruncate(fd, size);
+	kvm_fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, size);
 
 	return fd;
 }
@@ -1084,8 +1070,7 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 			 * needing to track if the fd is owned by the framework
 			 * or by the caller.
 			 */
-			guest_memfd = dup(guest_memfd);
-			TEST_ASSERT(guest_memfd >= 0, __KVM_SYSCALL_ERROR("dup()", guest_memfd));
+			guest_memfd = kvm_dup(guest_memfd);
 		}
 
 		region->region.guest_memfd = guest_memfd;
diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
index 82a8d88b5338..1969f4ab9b28 100644
--- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
@@ -380,7 +380,7 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type, uint32_t
 	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
 	pthread_t threads[KVM_MAX_VCPUS];
 	struct kvm_vm *vm;
-	int memfd, i, r;
+	int memfd, i;
 
 	const struct vm_shape shape = {
 		.mode = VM_MODE_DEFAULT,
@@ -428,11 +428,8 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type, uint32_t
 	 * should prevent the VM from being fully destroyed until the last
 	 * reference to the guest_memfd is also put.
 	 */
-	r = fallocate(memfd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0, memfd_size);
-	TEST_ASSERT(!r, __KVM_SYSCALL_ERROR("fallocate()", r));
-
-	r = fallocate(memfd, FALLOC_FL_KEEP_SIZE, 0, memfd_size);
-	TEST_ASSERT(!r, __KVM_SYSCALL_ERROR("fallocate()", r));
+	kvm_fallocate(memfd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0, memfd_size);
+	kvm_fallocate(memfd, FALLOC_FL_KEEP_SIZE, 0, memfd_size);
 
 	close(memfd);
 }
-- 
2.51.0.858.gf9c4a03a3a-goog


