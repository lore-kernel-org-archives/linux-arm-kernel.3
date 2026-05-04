Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC06CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ps0DFf8iRHwNv96IoiVMKA2BLuSI9Fl2G1MpiXXkiQc=; b=umy/1nzlycJIyqTNUPe3KgrEIB
	aZTdaPn1yOV9f30LBQbaVN+PSq+50AEPmzaUq/0F5iqxckK23fFXVu4/HpFIWLdvl0IojkQMBMH73
	BQvT/nLY3NTa+yZkrWshIp44Wv5HD6m0MtPSqkhAqn0LbMDg3Y5BQvhp8f7SXEvwtgsqOXP0OU7hF
	VTyPUPOT1+FcKnYuFcJAV6WOwQCNqot8OA98LaEtTYurFhj0WRtTr/ICdyk3SDTabPDu6ot65iclM
	81sGulwfx1PI+0XrR1NBG7hcEmKRc485dPtYZybOvY8JjJT8Htd/4FJ6T3wSQZQ76kCqzg9j/s8un
	aflzXfnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK20A-0000000EVTd-0gcm;
	Mon, 04 May 2026 22:42:58 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK208-0000000EVQj-0ZQi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:42:57 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-836d0184333so1572269b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 15:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934574; x=1778539374; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ps0DFf8iRHwNv96IoiVMKA2BLuSI9Fl2G1MpiXXkiQc=;
        b=fjVsCxFDbDa8502pt6f6T7eZeZRw+ZW39CV6BhAjOnhkKOouS/8T67WntkrIZ38uvG
         1oZPSOv4nB8JzqQI4AFq01LoNKplMHONSH92rWJbjqHm2QqR5cdWXUqNfDUVmjufLLaQ
         YgZAIS5V5+k2UgRIRyg8JBGQqxuNRsUM+yXq4fhNb+tMHeHT5N4tB/JMo6nXeb8XKnCv
         ONZYjYf+U/Afum/S2Ay++p16vNURTPTdxoSyQrAb0/0jzYQQe35LOuloSqyXzAS9tXXo
         oDmL4YaPYvzoEkrr+TWmeFZfOdyH/BlafC8bdSoPIXXbUxFPAIaVpsL/uykTDUC6pOz5
         E6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934574; x=1778539374;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ps0DFf8iRHwNv96IoiVMKA2BLuSI9Fl2G1MpiXXkiQc=;
        b=RXKjjm6k+xniihoNq9tBrwWwGcVJ1cP7YzoWis0Wsov6FWxGFMUiRb8rP2Aq3TI1b2
         rumJhB05cN7kgkbfuMKq0XPRqxfovFX6XIvE0OhlI/5NSr85i+M3fwTNJIHV10z3Xvia
         fMwanxpVAu3Vn0HIfqEo7PeTg4tA60nu8cwUNNAit1R4uKWUk/1yvwKiFG2V8nXOCT5x
         IDLMmjmUfXx9N8R9VFSwlA8tLp3/U778me7xLJ8jFOyvq7SAfP1QXD6RVKbMlpC5bu4A
         G09vbBh9s0k1r9HFXmquXQfimCO8ZElsRA7eyjyAVNtEbMZBdc1vvuCQT+ZPkSZoEFGd
         lj1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/srHMGS3xcWoGsT2/kpfPKPAzBoV+/Vxg91F2pvylRku5K6pxy0IoSculbiz+sPBgPWjCr2g403li0AK8EmS1H@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+D1Ig4HARviBIRVbMbkkI6H/u8CfdcfdNt7xooAE21r+6iC7d
	Ywx/MJdMDkCaf5mnghuBiwiU+wFzW4jt5Ly0du11BUcofU1p3CS5Bjv8ThkRUwdc+Q5JMyjwj0G
	+alq40ORN6JG6+0r6gAm1vQ==
X-Received: from pfbdo5.prod.google.com ([2002:a05:6a00:4a05:b0:835:4488:892b])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:8044:0:b0:835:6173:dd2 with SMTP id d2e1a72fcca58-835617316f9mr5445427b3a.44.1777934574253;
 Mon, 04 May 2026 15:42:54 -0700 (PDT)
Date: Mon,  4 May 2026 22:42:12 +0000
In-Reply-To: <20260504224213.1049426-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260504224213.1049426-1-jthoughton@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504224213.1049426-6-jthoughton@google.com>
Subject: [PATCH 5/5] DO NOT MERGE: KVM: selftests: Reproducer for arm64 double-free
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_154256_188739_50F4A828 
X-CRM114-Status: GOOD (  21.81  )
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

Add a delay and a counter for the split_page_cache double-free to
reliably demonstrate the race. Please see the cover letter and the arm64
fix patch for more information.

The selftest is partially written by Gemini.

Assisted-by: Gemini:gemini-3-flash-preview
Not-signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/kvm_host.h             |   1 +
 arch/arm64/kvm/mmu.c                          |  16 +++
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/transfer_fd_test.c  | 129 ++++++++++++++++++
 4 files changed, 147 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/transfer_fd_test.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 65eead8362e0..5072fc2e2eb8 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -192,6 +192,7 @@ struct kvm_s2_mmu {
 	 * Protected by kvm->slots_lock.
 	 */
 	struct kvm_mmu_memory_cache split_page_cache;
+	int is_freeing;
 	uint64_t split_page_chunk_size;
 
 	struct kvm_arch *arch;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4bab407d43bb..fa05900a5124 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1004,6 +1004,8 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	mmu->split_page_chunk_size = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
 	mmu->split_page_cache.gfp_zero = __GFP_ZERO;
 
+	mmu->is_freeing = 0;
+
 	mmu->pgd_phys = __pa(pgt->pgd);
 
 	if (kvm_is_nested_s2_mmu(kvm, mmu))
@@ -1021,10 +1023,24 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 
 void kvm_uninit_stage2_mmu(struct kvm *kvm)
 {
+	int is_freeing;
+	ktime_t s;
+
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	kvm_free_stage2_pgd_locked(&kvm->arch.mmu);
+
+	is_freeing = ++kvm->arch.mmu.is_freeing;
+	s = ktime_get();
+
+	/* Sleep for 10ms */
+	while (ktime_to_ns(ktime_get()) - ktime_to_ns(s) < 1E7) {}
+
+	WARN(is_freeing > 1, "detected double-free of split page cache");
+
 	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
+
+	kvm->arch.mmu.is_freeing--;
 }
 
 static void stage2_unmap_memslot(struct kvm *kvm,
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 9118a5a51b89..53a1b9c7bff8 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -66,6 +66,7 @@ TEST_GEN_PROGS_COMMON += kvm_page_table_test
 TEST_GEN_PROGS_COMMON += set_memory_region_test
 TEST_GEN_PROGS_COMMON += memslot_modification_stress_test
 TEST_GEN_PROGS_COMMON += memslot_perf_test
+TEST_GEN_PROGS_COMMON += transfer_fd_test
 
 # Compiled test targets
 TEST_GEN_PROGS_x86 = $(TEST_GEN_PROGS_COMMON)
diff --git a/tools/testing/selftests/kvm/transfer_fd_test.c b/tools/testing/selftests/kvm/transfer_fd_test.c
new file mode 100644
index 000000000000..ff2adff9954b
--- /dev/null
+++ b/tools/testing/selftests/kvm/transfer_fd_test.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test VM file descriptor transfer via Unix Domain Sockets.
+ */
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include <errno.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+
+static void send_fd(int sock, int fd)
+{
+	struct msghdr msg = {0};
+	struct cmsghdr *cmsg;
+	char buf[CMSG_SPACE(sizeof(int))];
+	struct iovec io = {
+		.iov_base = "a",
+		.iov_len = 1,
+	};
+
+	msg.msg_iov = &io;
+	msg.msg_iovlen = 1;
+	msg.msg_control = buf;
+	msg.msg_controllen = sizeof(buf);
+
+	cmsg = CMSG_FIRSTHDR(&msg);
+	cmsg->cmsg_level = SOL_SOCKET;
+	cmsg->cmsg_type = SCM_RIGHTS;
+	cmsg->cmsg_len = CMSG_LEN(sizeof(int));
+
+	*((int *)CMSG_DATA(cmsg)) = fd;
+
+	TEST_ASSERT(sendmsg(sock, &msg, 0) == 1, "sendmsg failed, errno: %d", errno);
+}
+
+static int recv_fd(int sock)
+{
+	struct msghdr msg = {0};
+	struct cmsghdr *cmsg;
+	char buf[CMSG_SPACE(sizeof(int))];
+	char dummy;
+	struct iovec io = {
+		.iov_base = &dummy,
+		.iov_len = 1,
+	};
+	int fd;
+
+	msg.msg_iov = &io;
+	msg.msg_iovlen = 1;
+	msg.msg_control = buf;
+	msg.msg_controllen = sizeof(buf);
+
+	TEST_ASSERT(recvmsg(sock, &msg, 0) == 1, "recvmsg failed, errno: %d", errno);
+
+	cmsg = CMSG_FIRSTHDR(&msg);
+	TEST_ASSERT(cmsg && cmsg->cmsg_level == SOL_SOCKET &&
+		    cmsg->cmsg_type == SCM_RIGHTS, "No FD received");
+
+	fd = *((int *)CMSG_DATA(cmsg));
+	return fd;
+}
+
+int main(int argc, char **argv)
+{
+	pthread_barrierattr_t attr;
+	pthread_barrier_t *barrier;
+	int socks[2];
+	pid_t pid;
+	int ret;
+
+	barrier = mmap(NULL, sizeof(*barrier), PROT_READ | PROT_WRITE,
+		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	TEST_ASSERT(barrier != MAP_FAILED, "mmap failed, errno: %d", errno);
+
+	ret = pthread_barrierattr_init(&attr);
+	TEST_ASSERT(!ret, "pthread_barrierattr_init failed, ret: %d", ret);
+
+	ret = pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
+	TEST_ASSERT(!ret, "pthread_barrierattr_setpshared failed, ret: %d", ret);
+
+	ret = pthread_barrier_init(barrier, &attr, 2);
+	TEST_ASSERT(!ret, "pthread_barrier_init failed, ret: %d", ret);
+
+	ret = socketpair(AF_UNIX, SOCK_STREAM, 0, socks);
+	TEST_ASSERT(ret == 0, "socketpair failed, errno: %d", errno);
+
+	pid = fork();
+	TEST_ASSERT(pid >= 0, "fork failed, errno: %d", errno);
+
+	if (pid > 0) {
+		struct kvm_vm *vm;
+
+		close(socks[1]);
+
+		vm = vm_create_barebones();
+
+		send_fd(socks[0], vm->fd);
+		close(socks[0]);
+
+		/* Drop *ALL* refs to this VM. */
+		close(vm->fd);
+		close(vm->kvm_fd);
+		if (vm->stats.fd >= 0)
+			close(vm->stats.fd);
+
+		pthread_barrier_wait(barrier);
+
+		/* Trigger the exit_mm() side of the race. */
+		_exit(0);
+	} else {
+		int vm_fd;
+
+		close(socks[0]);
+
+		vm_fd = recv_fd(socks[1]);
+		close(socks[1]);
+
+		pthread_barrier_wait(barrier);
+
+		/* Drop the final ref of the VM, triggering the kvm_destroy_vm()
+		 * side of the race. */
+		close(vm_fd);
+	}
+
+	return 0;
+}
-- 
2.54.0.545.g6539524ca2-goog


