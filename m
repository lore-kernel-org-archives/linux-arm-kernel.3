Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4697C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4PpMNlGsTWFD0SxKNjrPtX+vudl8Lxy+1dKyA5gL04=; b=3oItC4qKS8VD/dn/immPUu2kah
	nQyo3dAo579TRKRkUpd1f96S0xXteOyqz+P/6rrsNbDb5W0k3+qWAz1nxR4QSDIlLRdMsrFMH5//d
	4ZuDo8E6hMuGs+JRu/8RsU5+6K4jjQghBTz4t2zRGwALXpEmh04IwciKWJU44PZtKTQZeWBHmSdAv
	uVKc97QY7HR6DRajuFY+iK2gBrbW4n6iUTZ4kj3vHExrqdrSCk0Afj3IPtBnVLVIO0Sfb8fCoIPcC
	5Mpi/022tCOvBgFH9JYh9QRLDiN6R1+DMF0YbJWc5zSrODaJkZFuS0eSEm3mzA8+x++MqoJwERsUG
	Mo7cqTHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDGM-00000001g6A-1y0q;
	Tue, 04 Aug 2026 11:24:50 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDGJ-00000001g45-401C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:24:49 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785842685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g4PpMNlGsTWFD0SxKNjrPtX+vudl8Lxy+1dKyA5gL04=;
	b=qUoTlb+P1w1CxAB3haV31nhSNXZz1B03NI/XULUMlyPXzgzHgw0tQIM/kwGjR333XpybSY
	c+7LK++upokfs/jqvoZbJJihH1bpHkZPUgQi2kWcBfZdUOe1p2mDzlnaXEt0worXUz0xra
	woJ+X2ZtFCkkDBS/uSJIcyJef4hzF5M=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	alexandru.elisei@arm.com,
	vdonnefort@google.com,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	ardb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	tabba@google.com,
	fuad.tabba@linux.dev
Subject: [PATCH v3 07/11] KVM: arm64: nVHE: Pass host VA arguments as pointers
Date: Tue,  4 Aug 2026 12:23:13 +0100
Message-Id: <20260804112317.1937387-8-fuad.tabba@linux.dev>
In-Reply-To: <20260804112317.1937387-1-fuad.tabba@linux.dev>
References: <20260804112317.1937387-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_042448_125691_17527AD5 
X-CRM114-Status: GOOD (  11.48  )
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

Four hypercalls take host VAs as unsigned long: the donated vm, pgd
and vcpu regions, and the tracing descriptor. Retype the arguments
and their EL2 consumers as void *, so that the typed hypercall
declarations introduced later in the series can attach a sparse
address space to them; an address space attaches only to pointers.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h  |  5 ++---
 arch/arm64/kvm/hyp/include/nvhe/trace.h |  4 ++--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  8 ++++----
 arch/arm64/kvm/hyp/nvhe/pkvm.c          | 11 +++++------
 arch/arm64/kvm/hyp/nvhe/trace.c         |  4 ++--
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index c904647d2f760..2643a1a819668 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -69,10 +69,9 @@ void pkvm_hyp_vm_table_init(void *tbl);
 
 int __pkvm_reserve_vm(void);
 void __pkvm_unreserve_vm(pkvm_handle_t handle);
-int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
-		   unsigned long pgd_hva);
+int __pkvm_init_vm(struct kvm *host_kvm, void *vm_hva, void *pgd_hva);
 int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
-		     unsigned long vcpu_hva);
+		     void *vcpu_hva);
 
 int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn);
 int __pkvm_start_teardown_vm(pkvm_handle_t handle);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index 8813ff250f8e0..4aa36fd76b9e2 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -46,7 +46,7 @@ static inline pid_t __tracing_get_vcpu_pid(struct kvm_cpu_context *host_ctxt)
 void *tracing_reserve_entry(unsigned long length);
 void tracing_commit_entry(void);
 
-int __tracing_load(unsigned long desc_va, size_t desc_size);
+int __tracing_load(void *desc_va, size_t desc_size);
 void __tracing_unload(void);
 int __tracing_enable(bool enable);
 int __tracing_swap_reader(unsigned int cpu);
@@ -59,7 +59,7 @@ static inline void tracing_commit_entry(void) { }
 #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)      \
 	static inline void trace_##__name(__proto) {}
 
-static inline int __tracing_load(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
+static inline int __tracing_load(void *desc_va, size_t desc_size) { return -ENODEV; }
 static inline void __tracing_unload(void) { }
 static inline int __tracing_enable(bool enable) { return -ENODEV; }
 static inline int __tracing_swap_reader(unsigned int cpu) { return -ENODEV; }
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d3df96ed8ba42..23cb4313c60a2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -577,8 +577,8 @@ static void handle___pkvm_unreserve_vm(struct kvm_cpu_context *host_ctxt)
 static void handle___pkvm_init_vm(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm *, host_kvm, host_ctxt, 1);
-	DECLARE_REG(unsigned long, vm_hva, host_ctxt, 2);
-	DECLARE_REG(unsigned long, pgd_hva, host_ctxt, 3);
+	DECLARE_REG(void *, vm_hva, host_ctxt, 2);
+	DECLARE_REG(void *, pgd_hva, host_ctxt, 3);
 
 	host_kvm = kern_hyp_va(host_kvm);
 	cpu_reg(host_ctxt, 1) = __pkvm_init_vm(host_kvm, vm_hva, pgd_hva);
@@ -588,7 +588,7 @@ static void handle___pkvm_init_vcpu(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(struct kvm_vcpu *, host_vcpu, host_ctxt, 2);
-	DECLARE_REG(unsigned long, vcpu_hva, host_ctxt, 3);
+	DECLARE_REG(void *, vcpu_hva, host_ctxt, 3);
 
 	host_vcpu = kern_hyp_va(host_vcpu);
 	cpu_reg(host_ctxt, 1) = __pkvm_init_vcpu(handle, host_vcpu, vcpu_hva);
@@ -634,7 +634,7 @@ static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt
 
 static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
 {
-	DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
+	DECLARE_REG(void *, desc_hva, host_ctxt, 1);
 	DECLARE_REG(size_t, desc_size, host_ctxt, 2);
 
 	cpu_reg(host_ctxt, 1) = __tracing_load(desc_hva, desc_size);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 24d6f164129ac..205c52535c887 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -644,9 +644,9 @@ static size_t pkvm_get_hyp_vm_size(unsigned int nr_vcpus)
 		size_mul(sizeof(struct pkvm_hyp_vcpu *), nr_vcpus));
 }
 
-static void *map_donated_memory_noclear(unsigned long host_va, size_t size)
+static void *map_donated_memory_noclear(void *host_va, size_t size)
 {
-	void *va = (void *)kern_hyp_va(host_va);
+	void *va = kern_hyp_va(host_va);
 
 	if (!PAGE_ALIGNED(va))
 		return NULL;
@@ -658,7 +658,7 @@ static void *map_donated_memory_noclear(unsigned long host_va, size_t size)
 	return va;
 }
 
-static void *map_donated_memory(unsigned long host_va, size_t size)
+static void *map_donated_memory(void *host_va, size_t size)
 {
 	void *va = map_donated_memory_noclear(host_va, size);
 
@@ -805,8 +805,7 @@ void teardown_selftest_vm(void)
  *
  * Return 0 success, negative error code on failure.
  */
-int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
-		   unsigned long pgd_hva)
+int __pkvm_init_vm(struct kvm *host_kvm, void *vm_hva, void *pgd_hva)
 {
 	struct pkvm_hyp_vm *hyp_vm = NULL;
 	size_t vm_size, pgd_size;
@@ -897,7 +896,7 @@ static int register_hyp_vcpu(struct pkvm_hyp_vm *hyp_vm,
 }
 
 int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
-		     unsigned long vcpu_hva)
+		     void *vcpu_hva)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	struct pkvm_hyp_vm *hyp_vm;
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 177fe3d8fbb13..97203ddd3cf45 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -206,9 +206,9 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
 	return true;
 }
 
-int __tracing_load(unsigned long desc_hva, size_t desc_size)
+int __tracing_load(void *desc_hva, size_t desc_size)
 {
-	struct hyp_trace_desc *desc = (struct hyp_trace_desc *)kern_hyp_va(desc_hva);
+	struct hyp_trace_desc *desc = kern_hyp_va(desc_hva);
 	int ret;
 
 	ret = __admit_host_mem(desc, desc_size);
-- 
2.39.5


