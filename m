Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8FFE77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 01:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dH5y8/UE39Fu2msLM/JJYa9i5LZG9N1ZOJAUvzMfFnk=; b=IMlJZCu6V+7QVuo5fianAm//Aj
	oCAQprIplTgclREh83JK/0cmoPkXgQh2SaNBFjY4R2DAffxOlym9TjlKpPorXuVe8VLtaSapTUh9h
	vfI8wN5lafppC3IcR4DSkCW+Xhpr1xU+H8MNqlOIIx2Yqmn5SJXP2AIDcmx1cdjQUFEE4uCtfpNrt
	XrtxfwQvlVhX4YxWOb2J/MgRJaq94Zr6RKQeLpdueZkc09yskxVqKflzzz416AHzfgcOOkW2GDjy3
	VPNrJC1DbNK7+RHA/umgPBLcQOpaxzqwPfPxy4f08ylZQUILLYufJUi9O+1SD3Iu8b0LnwXO69/zj
	URcDPzLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS7v-00000003fT3-1q5B;
	Fri, 20 Dec 2024 01:48:27 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORz8-00000003d30-1H9q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:23 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee46799961so1741944a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 17:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658761; x=1735263561; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dH5y8/UE39Fu2msLM/JJYa9i5LZG9N1ZOJAUvzMfFnk=;
        b=tMBPTXlk9L2I7L4k+z3dAYYBAU52qU2ghqkLMvrE9KwJGyk/uJ3Af9wHyRqVqgR9iv
         sY+7Im+G3/tCT4xBozWIlYoRAhIFrGHlVbHGCgoQ9e3yPwhw0/+XgfvArcNVbw9EGSk6
         H6VDWX8q5Qep2UTJoPgPYWm+y5GepG+kofABsvUD1fhpuGiTAf7eHWTi3W8LH6fLlZjZ
         4Ym3eLgg83Dk6URoDVZzEqrKlYzRwocv1qB+9fOQCX0rxfyPn5VKnX7woZGj7Te63t4o
         OdS94Z3igog2QFsoSmjem29OKsfATStZ69omqAg1Dqv6azDaifoNPXnKDPEq0dOhDSY/
         Z19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658761; x=1735263561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dH5y8/UE39Fu2msLM/JJYa9i5LZG9N1ZOJAUvzMfFnk=;
        b=rdR7/zER/Tjox6dOlfuPfBMwfDpyJsrblyQYzi53z6wivWykSkB3r5O8MXlpEoA0LS
         PUSU/io7WQAVXlaNilxxeCtZs6tqieDCGUgzrtT+K/i64N10fY+8UyZkzeLzefD4SGdB
         fOJ/o0J5UP/uxbLUDUaYuxaQSgK2Yigfkq4T23aaS4D/S2e3+m5fJt6pcnLaCWbOkeWb
         a/V6sv+oTCfg6J3hbZ0115/0h26ANLvOexjTE95+73UseuGs5Ifevb87ZCnnmJTvB4tJ
         2APPk39Uyf8fDBXW/gBi+fwhvIxqyoHfnvLGKmt67xtk5yRABkeF+/E7KQEFMf5cYZc+
         wZEg==
X-Gm-Message-State: AOJu0YygKZ2W6A//5WaEinpxKAxwPPSz3owQL+lO0K70W10g6Ft1RJQn
	D5Fo+W4wFdkyUXR0y2DspMRP0IhISuVJ16AUxN+X4zMgE1HEJKTdCOxEs16PUk9WemRy2Srbjim
	Xjw==
X-Google-Smtp-Source: AGHT+IEWDX/fMBQN37LNDm8pwZAbb4nPz2A12lsLKXmgW0NfsvdhBH23GcxtGNe29UPGQ7kGMBybcOA6PXg=
X-Received: from pjbqn15.prod.google.com ([2002:a17:90b:3d4f:b0:2ef:8612:dd6b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e18b:b0:2ee:9902:18b4
 with SMTP id 98e67ed59e1d1-2f452ee838bmr1687135a91.27.1734658760980; Thu, 19
 Dec 2024 17:39:20 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:05 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-8-seanjc@google.com>
Subject: [PATCH 7/8] KVM: selftests: Add infrastructure for getting vCPU
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
X-CRM114-CacheID: sfid-20241219_173922_345691_EBF5620D 
X-CRM114-Status: GOOD (  16.67  )
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

To sanity check that the infrastructure actually works, and to get a bit
of bonus coverage, add an assert in x86's xapic_ipi_test to verify that
the number of HLTs executed by the test matches the number of HLT exits
observed by KVM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 20 +++++++++------
 tools/testing/selftests/kvm/lib/kvm_util.c    | 25 +++++++------------
 .../selftests/kvm/x86/xapic_ipi_test.c        |  2 ++
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 9a64bab42f89..e0d23873158e 100644
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
index 16ee03e76d66..99fe8bcd2346 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -712,6 +712,8 @@ static void vm_vcpu_rm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	ret = close(vcpu->fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
 
+	kvm_stats_release(&vcpu->stats);
+
 	list_del(&vcpu->list);
 
 	vcpu_arch_free(vcpu);
@@ -1305,6 +1307,11 @@ struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id)
 	TEST_ASSERT(vcpu->run != MAP_FAILED,
 		    __KVM_SYSCALL_ERROR("mmap()", (int)(unsigned long)MAP_FAILED));
 
+	if (kvm_has_cap(KVM_CAP_BINARY_STATS_FD))
+		vcpu->stats.fd = vcpu_get_stats_fd(vcpu);
+	else
+		vcpu->stats.fd = -1;
+
 	/* Add to linked-list of VCPUs. */
 	list_add(&vcpu->list, &vm->vcpus);
 
@@ -2217,23 +2224,9 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
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


