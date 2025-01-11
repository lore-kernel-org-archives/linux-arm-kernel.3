Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEFBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 02:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTPjKFoWnkMFK18trrM7yX38QagKVQtox0CY8pTl0Bc=; b=5Ej7zmjgb0+GpMv3t67+874dkF
	G15PE00vQIPgJjXmME4uzpebrR+yW3d29Rs59ci/BND6QL804a7h0b58sUbrZ2QwY09t/8GbBygyn
	SfA/BRlKQftP10OgrsTSt82hxpGIYfyV6KAi/YgnGz91uDXUnexY2lzwThQq8crQyTJCUA+MdNMIb
	MzwXh01mQJ4iaw8/PJjvUQJyDjou7iCnt+msNALQPD//1LNlf7aSoM3aZeCO2zfU+lKan877zr9Se
	B2MZon6lnUtYiYgaWC0v8WWiUfKwtBdQitt67YhFE2T9uDe/1nKiMvLSEl0ZtSPu7HxuTx28dg+ZE
	g13DmemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQud-0000000HYGm-1J91;
	Sat, 11 Jan 2025 02:07:43 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiU-0000000HQOt-1FQN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:07 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2efc3292021so6654147a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 16:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556665; x=1737161465; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jTPjKFoWnkMFK18trrM7yX38QagKVQtox0CY8pTl0Bc=;
        b=EPxm7W0iCU/5ySiLlRBpXN85sALMgLSuSfE5lJSFlnYlFJZ42CAsKdFxwPVP2tsk5o
         ACM3bKFCjHe1S6nSXRlY3AB5ePjvsdVORV20LCAB+Xx2KIutovGVttk0DiYIS3/Q+yPN
         l3L9FmiXz2q6Mds5UZGQ2iGTMqchgc3Ri2KrFqaDoZKW8LBnGE/m4B6qTbx3eyh+Ttw5
         OUEMeMy43cpKZhqmcqyuJdsYyUX+0dpYNqdMKLhkQl+rWb+g9o79sg0JyIg1n7sxPPyw
         frxb0KN3tzZdiVERPEzwaTxZiUF9/KzEHgO+U/oVBG90fkgYQsdeec6JMp/+2IOqV9WA
         dIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556665; x=1737161465;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTPjKFoWnkMFK18trrM7yX38QagKVQtox0CY8pTl0Bc=;
        b=AWkl1Mh/zk04Xq1RwCqkoBwd+L9uaFFLmf5Bhmf9iLLSSwKhJ/aVLKUImaOLcTE+yk
         v4nQxt3UjAaHIuLkzwDAofjDCuQRCaEz9LfALBU3t1bVyjB0my660Ej4bABWVqvHWRBj
         PEb0LxEZPa0U13BZ11kHzITzrl2rviSJcyXkY5p1pEA4tRrcApQkqMtIqdcG+0mGpNFB
         MOcxsMXc3gIc7HqTJHjlhHVEwA2ZQaXFbpO9LFd5tGDgRj4ZYkZbxe5ZoB1C+anOaaYU
         ET2rvOM05rzId5EY5wnM5ukKWjk5VbVr4wLGFRSxpAWVBeqXlIIJbQL2/SYEY3hVuI2i
         GmIA==
X-Gm-Message-State: AOJu0Yxx+3sNEYSKoeoBvH+IiTtrBYQqwrOSWqHToo41nB5XB1ti5fZs
	+3dXADn+H43ZqJW1g4KbNKHybHP3MXSpwHiwXmTwTuhIlaGoobUL4BZ4vfoh19xDDgMU0Y4Ts69
	0aw==
X-Google-Smtp-Source: AGHT+IFOLE/1SSJYHsGdzvK8LKxhrHPTw3kVbRGTeeJk8BpZZB2Ck9vGEUtjLxLwAqw4e0hK1JN9nSs0EVE=
X-Received: from pjbsg5.prod.google.com ([2002:a17:90b:5205:b0:2ee:3cc1:793d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c84:b0:2ea:a25d:3baa
 with SMTP id 98e67ed59e1d1-2f548f17351mr17744741a91.5.1736556665395; Fri, 10
 Jan 2025 16:51:05 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:48 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-9-seanjc@google.com>
Subject: [PATCH v2 8/9] KVM: selftests: Add infrastructure for getting vCPU
 binary stats
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_165106_337149_5B97DCEA 
X-CRM114-Status: GOOD (  20.45  )
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

Now that the binary stats cache infrastructure is largely scope agnostic,
add support for vCPU-scoped stats.  Like VM stats, open and cache the
stats FD when the vCPU is created so that it's guaranteed to be valid when
vcpu_get_stats() is invoked.

Account for the extra per-vCPU file descriptor in kvm_set_files_rlimit(),
so that tests that create large VMs don't run afoul of resource limits.

To sanity check that the infrastructure actually works, and to get a bit
of bonus coverage, add an assert in x86's xapic_ipi_test to verify that
the number of HLTs executed by the test matches the number of HLT exits
observed by KVM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 20 +++++++-----
 tools/testing/selftests/kvm/lib/kvm_util.c    | 32 ++++++++-----------
 .../selftests/kvm/x86/xapic_ipi_test.c        |  2 ++
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index d4670b5962ab..373912464fb4 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -61,6 +61,7 @@ struct kvm_vcpu {
 #ifdef __x86_64__
 	struct kvm_cpuid2 *cpuid;
 #endif
+	struct kvm_binary_stats stats;
 	struct kvm_dirty_gfn *dirty_gfns;
 	uint32_t fetch_index;
 	uint32_t dirty_gfns_count;
@@ -534,17 +535,20 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
 		    struct kvm_stats_desc *desc, uint64_t *data,
 		    size_t max_elements);
 
-void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
-		   size_t max_elements);
+void kvm_get_stat(struct kvm_binary_stats *stats, const char *name,
+		  uint64_t *data, size_t max_elements);
 
-#define vm_get_stat(vm, stat)				\
-({							\
-	uint64_t data;					\
-							\
-	__vm_get_stat(vm, #stat, &data, 1);		\
-	data;						\
+#define __get_stat(stats, stat)							\
+({										\
+	uint64_t data;								\
+										\
+	kvm_get_stat(stats, #stat, &data, 1);					\
+	data;									\
 })
 
+#define vm_get_stat(vm, stat) __get_stat(&(vm)->stats, stat)
+#define vcpu_get_stat(vcpu, stat) __get_stat(&(vcpu)->stats, stat)
+
 void vm_create_irqchip(struct kvm_vm *vm);
 
 static inline int __vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index f49bb504fa72..b1c3c7260902 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -415,10 +415,11 @@ static uint64_t vm_nr_pages_required(enum vm_guest_mode mode,
 void kvm_set_files_rlimit(uint32_t nr_vcpus)
 {
 	/*
-	 * Number of file descriptors required, nr_vpucs vCPU fds + an arbitrary
-	 * number for everything else.
+	 * Each vCPU will open two file descriptors: the vCPU itself and the
+	 * vCPU's binary stats file descriptor.  Add an arbitrary amount of
+	 * buffer for all other files a test may open.
 	 */
-	int nr_fds_wanted = nr_vcpus + 100;
+	int nr_fds_wanted = nr_vcpus * 2 + 100;
 	struct rlimit rl;
 
 	/*
@@ -746,6 +747,8 @@ static void vm_vcpu_rm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	ret = close(vcpu->fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
 
+	kvm_stats_release(&vcpu->stats);
+
 	list_del(&vcpu->list);
 
 	vcpu_arch_free(vcpu);
@@ -1339,6 +1342,11 @@ struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id)
 	TEST_ASSERT(vcpu->run != MAP_FAILED,
 		    __KVM_SYSCALL_ERROR("mmap()", (int)(unsigned long)MAP_FAILED));
 
+	if (kvm_has_cap(KVM_CAP_BINARY_STATS_FD))
+		vcpu->stats.fd = vcpu_get_stats_fd(vcpu);
+	else
+		vcpu->stats.fd = -1;
+
 	/* Add to linked-list of VCPUs. */
 	list_add(&vcpu->list, &vm->vcpus);
 
@@ -2251,23 +2259,9 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
 		    desc->name, size, ret);
 }
 
-/*
- * Read the data of the named stat
- *
- * Input Args:
- *   vm - the VM for which the stat should be read
- *   stat_name - the name of the stat to read
- *   max_elements - the maximum number of 8-byte values to read into data
- *
- * Output Args:
- *   data - the buffer into which stat data should be read
- *
- * Read the data values of a specified stat from the binary stats interface.
- */
-void __vm_get_stat(struct kvm_vm *vm, const char *name, uint64_t *data,
-		   size_t max_elements)
+void kvm_get_stat(struct kvm_binary_stats *stats, const char *name,
+		  uint64_t *data, size_t max_elements)
 {
-	struct kvm_binary_stats *stats = &vm->stats;
 	struct kvm_stats_desc *desc;
 	size_t size_desc;
 	int i;
diff --git a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
index a76078a08ff8..574a944763b7 100644
--- a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
+++ b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
@@ -465,6 +465,8 @@ int main(int argc, char *argv[])
 	cancel_join_vcpu_thread(threads[0], params[0].vcpu);
 	cancel_join_vcpu_thread(threads[1], params[1].vcpu);
 
+	TEST_ASSERT_EQ(data->hlt_count, vcpu_get_stat(params[0].vcpu, halt_exits));
+
 	fprintf(stderr,
 		"Test successful after running for %d seconds.\n"
 		"Sending vCPU sent %lu IPIs to halting vCPU\n"
-- 
2.47.1.613.gc27f4b7a9f-goog


