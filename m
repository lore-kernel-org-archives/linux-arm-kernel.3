Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2168DCF65D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCBvM23KkkEsjCnThoPDgRZIy6tQG6NfdCCNqUUdC2E=; b=WTtUQX+L8/q6i+k/vp+BbThKpy
	2dUgd6xUsErtun+vlBHzkft7ySWr5DSLnx6vgpWTzSgR8oD2WJCJaf8e2WZPH9fjWLKgN8VhbeiAe
	CpTaVdfLlanDmskTq+PTsr5fz0tNY43e5MHg98DuAKhQnSZAwGHc4w/Br1b7PXeUkfwU2PgDgVj/i
	RTe14aBq58/zxReisteZtWZc5CH8ISr2KJi/TBJo1Q1lohwXgqiwjOEC9eyCeey0f36kpQYc3gYWT
	07wkRHXdGPRkG10AMXOnNId8uXIiAR92sET7nB5VvhCC5zLAleG5PpuOLNbQswcR012S+EvCLS3tw
	uaH4es9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK6y-0000000CLHi-0VSU;
	Mon, 26 Jan 2026 10:46:24 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5R-0000000CJal-03hG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:55 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4358f1c082eso3118576f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424287; x=1770029087; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xCBvM23KkkEsjCnThoPDgRZIy6tQG6NfdCCNqUUdC2E=;
        b=165kjADdZZuoCVqjoaDkW2IS9zZ1hRtVmKNlRela2Z7OJMY1wBh3hrmWyUA5rbp/aY
         hI9wm/ZRn9ClXzIe++cNKz4ySYEForDvQ/69gaa7QjwMXr64woiq9qtqpjYVj0AMdUh4
         rvJAwvn7R+6q68xavDqJwS7mXt35OfJjwYrFXzOwvJTZ9i/eCADHhlsAiiKwVAxX40ex
         tE6f+qLNZOXJY4mkEeFouuXmzaMNGALlffhjBjYGQOYObNbfOsY03FGlRdxr+8ySahZ5
         6K0hJ2evntRev2pQA+VMi5PhaJRCNbi3HR6iLpEN/+e2skAaZhn6ixJSq3WwYYbjQWRM
         rJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424287; x=1770029087;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCBvM23KkkEsjCnThoPDgRZIy6tQG6NfdCCNqUUdC2E=;
        b=gNGkuCcT50x4d6q/x12TrL+q5QUoeH60dEwIwQQNPqwNEkUggHbN3HwcjJSAAVZ7zS
         dmDx+Q7dJvijWwCrA4s/78Czv2CUgupcE4LK1BoLMSohdQNUb0WI9o0CqgNvOhakMhu3
         yXy58lin6xHtONhgjlO4qMb9LsHxNOJcGcCqSm+TmzBS7T5BmyqJTC8dorEECtLn3fIU
         KDnCXLqt2L2nwjZGveJyDbsTr6jTi0s528Lv6XpkaidzeqAFoRqaPdMUxhgh0Ly/1Zuh
         yQW7UQ7Wwa8SSIP1Nez2qE5h8aAH2HpKnZAL9c3yz1HNxqOu1dAWo2bflpJALBoESPd3
         dJmg==
X-Forwarded-Encrypted: i=1; AJvYcCWIRg/aK0ZcdASqnGQsA345PGwlvzTpXQv3oc99hbJE19KTw7J+gSKMCbJRWAc/py3bXt5K9UFjv4hzxQuCa/H6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9VHLLwOnyRiuEYS1dENZKpic3Ml5xmf+R79pwsLL/M9v3NsD3
	pfHPesM0mkrSrol9aDOSx07G+OjzUX9LRMjBesqVgxHTfCL56aLxDa9vz+JLxMba8Y+WhnAP4lb
	nV7NRCGVlAwsVZM+qOMsWhQ==
X-Received: from wrp8.prod.google.com ([2002:a05:6000:41e8:b0:435:a21c:601d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1449:b0:435:9336:21f3 with SMTP id ffacd0b85a97d-435c9a9c00emr6591007f8f.10.1769424286926;
 Mon, 26 Jan 2026 02:44:46 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:12 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-24-vdonnefort@google.com>
Subject: [PATCH v10 23/30] KVM: arm64: Add tracing capability for the
 nVHE/pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_024449_299575_3169435E 
X-CRM114-Status: GOOD (  20.24  )
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

There is currently no way to inspect or log what's happening at EL2
when the nVHE or pKVM hypervisor is used. With the growing set of
features for pKVM, the need for tooling is more pressing. And tracefs,
by its reliability, versatility and support for user-space is fit for
purpose.

Add support to write into a tracefs compatible ring-buffer. There's no
way the hypervisor could log events directly into the host tracefs
ring-buffers. So instead let's use our own, where the hypervisor is the
writer and the host the reader.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index ce516d8187b1..c3a7fc939f42 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -89,6 +89,10 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
+	__KVM_HOST_SMCCC_FUNC___tracing_load,
+	__KVM_HOST_SMCCC_FUNC___tracing_unload,
+	__KVM_HOST_SMCCC_FUNC___tracing_enable,
+	__KVM_HOST_SMCCC_FUNC___tracing_swap_reader,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/include/asm/kvm_hyptrace.h b/arch/arm64/include/asm/kvm_hyptrace.h
new file mode 100644
index 000000000000..9c30a479bc36
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_hyptrace.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARM64_KVM_HYPTRACE_H_
+#define __ARM64_KVM_HYPTRACE_H_
+
+#include <linux/ring_buffer.h>
+
+struct hyp_trace_desc {
+	unsigned long			bpages_backing_start;
+	size_t				bpages_backing_size;
+	struct trace_buffer_desc	trace_buffer_desc;
+
+};
+#endif
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 6498dec00fe9..c7f50492f2cf 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -73,6 +73,11 @@ config NVHE_EL2_DEBUG
 
 if NVHE_EL2_DEBUG
 
+config NVHE_EL2_TRACING
+	bool
+	depends on TRACING
+	default y
+
 config PKVM_DISABLE_STAGE2_ON_PANIC
 	bool "Disable the host stage-2 on panic"
 	default n
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
new file mode 100644
index 000000000000..7da8788ce527
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARM64_KVM_HYP_NVHE_TRACE_H
+#define __ARM64_KVM_HYP_NVHE_TRACE_H
+#include <asm/kvm_hyptrace.h>
+
+#ifdef CONFIG_NVHE_EL2_TRACING
+void *tracing_reserve_entry(unsigned long length);
+void tracing_commit_entry(void);
+
+int __tracing_load(unsigned long desc_va, size_t desc_size);
+void __tracing_unload(void);
+int __tracing_enable(bool enable);
+int __tracing_swap_reader(unsigned int cpu);
+#else
+static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
+static inline void tracing_commit_entry(void) { }
+
+static inline int __tracing_load(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
+static inline void __tracing_unload(void) { }
+static inline int __tracing_enable(bool enable) { return -ENODEV; }
+static inline int __tracing_swap_reader(unsigned int cpu) { return -ENODEV; }
+#endif
+#endif
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 8dc95257c291..f1840628d2d6 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -29,9 +29,12 @@ hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-y += ../../../kernel/smccc-call.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
-hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o
+hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o
 hyp-obj-y += $(lib-objs)
 
+# Path to simple_ring_buffer.c
+CFLAGS_trace.nvhe.o += -I$(objtree)/kernel/trace/
+
 ##
 ## Build rules for compiling nVHE hyp code
 ## Output of this folder is `kvm_nvhe.o`, a partially linked object
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 5559b622ea57..eddbf5df5d13 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -18,6 +18,7 @@
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
 #include <nvhe/pkvm.h>
+#include <nvhe/trace.h>
 #include <nvhe/trap_handler.h>
 
 DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
@@ -587,6 +588,33 @@ static void handle___pkvm_teardown_vm(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_teardown_vm(handle);
 }
 
+static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
+	DECLARE_REG(size_t, desc_size, host_ctxt, 2);
+
+	cpu_reg(host_ctxt, 1) = __tracing_load(desc_hva, desc_size);
+}
+
+static void handle___tracing_unload(struct kvm_cpu_context *host_ctxt)
+{
+	__tracing_unload();
+}
+
+static void handle___tracing_enable(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(bool, enable, host_ctxt, 1);
+
+	cpu_reg(host_ctxt, 1) = __tracing_enable(enable);
+}
+
+static void handle___tracing_swap_reader(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(unsigned int, cpu, host_ctxt, 1);
+
+	cpu_reg(host_ctxt, 1) = __tracing_swap_reader(cpu);
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -628,6 +656,10 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
+	HANDLE_FUNC(__tracing_load),
+	HANDLE_FUNC(__tracing_unload),
+	HANDLE_FUNC(__tracing_enable),
+	HANDLE_FUNC(__tracing_swap_reader),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
new file mode 100644
index 000000000000..df9d66fcb3c9
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <nvhe/clock.h>
+#include <nvhe/mem_protect.h>
+#include <nvhe/mm.h>
+#include <nvhe/trace.h>
+
+#include <asm/percpu.h>
+#include <asm/kvm_mmu.h>
+#include <asm/local.h>
+
+#include "simple_ring_buffer.c"
+
+static DEFINE_PER_CPU(struct simple_rb_per_cpu, __simple_rbs);
+
+static struct hyp_trace_buffer {
+	struct simple_rb_per_cpu __percpu	*simple_rbs;
+	void					*bpages_backing_start;
+	size_t					bpages_backing_size;
+	hyp_spinlock_t				lock;
+} trace_buffer = {
+	.simple_rbs = &__simple_rbs,
+	.lock = __HYP_SPIN_LOCK_UNLOCKED,
+};
+
+static bool hyp_trace_buffer_loaded(struct hyp_trace_buffer *trace_buffer)
+{
+	return trace_buffer->bpages_backing_size > 0;
+}
+
+void *tracing_reserve_entry(unsigned long length)
+{
+	return simple_ring_buffer_reserve(this_cpu_ptr(trace_buffer.simple_rbs), length,
+					  trace_clock());
+}
+
+void tracing_commit_entry(void)
+{
+	simple_ring_buffer_commit(this_cpu_ptr(trace_buffer.simple_rbs));
+}
+
+static int __admit_host_mem(void *start, u64 size)
+{
+	if (!PAGE_ALIGNED(start) || !PAGE_ALIGNED(size) || !size)
+		return -EINVAL;
+
+	if (!is_protected_kvm_enabled())
+		return 0;
+
+	return __pkvm_host_donate_hyp(hyp_virt_to_pfn(start), size >> PAGE_SHIFT);
+}
+
+static void __release_host_mem(void *start, u64 size)
+{
+	if (!is_protected_kvm_enabled())
+		return;
+
+	WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(start), size >> PAGE_SHIFT));
+}
+
+static int hyp_trace_buffer_load_bpage_backing(struct hyp_trace_buffer *trace_buffer,
+					       struct hyp_trace_desc *desc)
+{
+	void *start = (void *)kern_hyp_va(desc->bpages_backing_start);
+	size_t size = desc->bpages_backing_size;
+	int ret;
+
+	ret = __admit_host_mem(start, size);
+	if (ret)
+		return ret;
+
+	memset(start, 0, size);
+
+	trace_buffer->bpages_backing_start = start;
+	trace_buffer->bpages_backing_size = size;
+
+	return 0;
+}
+
+static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace_buffer)
+{
+	void *start = trace_buffer->bpages_backing_start;
+	size_t size = trace_buffer->bpages_backing_size;
+
+	if (!size)
+		return;
+
+	memset(start, 0, size);
+
+	__release_host_mem(start, size);
+
+	trace_buffer->bpages_backing_start = 0;
+	trace_buffer->bpages_backing_size = 0;
+}
+
+static void *__pin_shared_page(unsigned long kern_va)
+{
+	void *va = kern_hyp_va((void *)kern_va);
+
+	if (!is_protected_kvm_enabled())
+		return va;
+
+	return hyp_pin_shared_mem(va, va + PAGE_SIZE) ? NULL : va;
+}
+
+static void __unpin_shared_page(void *va)
+{
+	if (!is_protected_kvm_enabled())
+		return;
+
+	hyp_unpin_shared_mem(va, va + PAGE_SIZE);
+}
+
+static void hyp_trace_buffer_unload(struct hyp_trace_buffer *trace_buffer)
+{
+	int cpu;
+
+	hyp_assert_lock_held(&trace_buffer->lock);
+
+	if (!hyp_trace_buffer_loaded(trace_buffer))
+		return;
+
+	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
+		__simple_ring_buffer_unload(per_cpu_ptr(trace_buffer->simple_rbs, cpu),
+					    __unpin_shared_page);
+
+	hyp_trace_buffer_unload_bpage_backing(trace_buffer);
+}
+
+static int hyp_trace_buffer_load(struct hyp_trace_buffer *trace_buffer,
+				 struct hyp_trace_desc *desc)
+{
+	struct simple_buffer_page *bpages;
+	struct ring_buffer_desc *rb_desc;
+	int ret, cpu;
+
+	hyp_assert_lock_held(&trace_buffer->lock);
+
+	if (hyp_trace_buffer_loaded(trace_buffer))
+		return -EINVAL;
+
+	ret = hyp_trace_buffer_load_bpage_backing(trace_buffer, desc);
+	if (ret)
+		return ret;
+
+	bpages = trace_buffer->bpages_backing_start;
+	for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc) {
+		ret = __simple_ring_buffer_init(per_cpu_ptr(trace_buffer->simple_rbs, cpu),
+						bpages, rb_desc, __pin_shared_page,
+						__unpin_shared_page);
+		if (ret)
+			break;
+
+		bpages += rb_desc->nr_page_va;
+	}
+
+	if (ret)
+		hyp_trace_buffer_unload(trace_buffer);
+
+	return ret;
+}
+
+static bool hyp_trace_desc_validate(struct hyp_trace_desc *desc, size_t desc_size)
+{
+	struct ring_buffer_desc *rb_desc;
+	unsigned int cpu;
+	size_t nr_bpages;
+	void *desc_end;
+
+	/*
+	 * Both desc_size and bpages_backing_size are untrusted host-provided
+	 * values. We rely on __pkvm_host_donate_hyp() to enforce their validity.
+	 */
+	desc_end = (void *)desc + desc_size;
+	nr_bpages = desc->bpages_backing_size / sizeof(struct simple_buffer_page);
+
+	for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc) {
+		/* Can we read nr_page_va? */
+		if ((void *)rb_desc + struct_size(rb_desc, page_va, 0) > desc_end)
+			return false;
+
+		/* Overflow desc? */
+		if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
+			return false;
+
+		/* Overflow bpages backing memory? */
+		if (nr_bpages < rb_desc->nr_page_va)
+			return false;
+
+		if (cpu >= hyp_nr_cpus)
+			return false;
+
+		if (cpu != rb_desc->cpu)
+			return false;
+
+		nr_bpages -= rb_desc->nr_page_va;
+	}
+
+	return true;
+}
+
+int __tracing_load(unsigned long desc_hva, size_t desc_size)
+{
+	struct hyp_trace_desc *desc = (struct hyp_trace_desc *)kern_hyp_va(desc_hva);
+	int ret;
+
+	ret = __admit_host_mem(desc, desc_size);
+	if (ret)
+		return ret;
+
+	if (!hyp_trace_desc_validate(desc, desc_size))
+		goto err_release_desc;
+
+	hyp_spin_lock(&trace_buffer.lock);
+
+	ret = hyp_trace_buffer_load(&trace_buffer, desc);
+
+	hyp_spin_unlock(&trace_buffer.lock);
+
+err_release_desc:
+	__release_host_mem(desc, desc_size);
+	return ret;
+}
+
+void __tracing_unload(void)
+{
+	hyp_spin_lock(&trace_buffer.lock);
+	hyp_trace_buffer_unload(&trace_buffer);
+	hyp_spin_unlock(&trace_buffer.lock);
+}
+
+int __tracing_enable(bool enable)
+{
+	int cpu, ret = enable ? -EINVAL : 0;
+
+	hyp_spin_lock(&trace_buffer.lock);
+
+	if (!hyp_trace_buffer_loaded(&trace_buffer))
+		goto unlock;
+
+	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
+		simple_ring_buffer_enable_tracing(per_cpu_ptr(trace_buffer.simple_rbs, cpu),
+						  enable);
+
+	ret = 0;
+
+unlock:
+	hyp_spin_unlock(&trace_buffer.lock);
+
+	return ret;
+}
+
+int __tracing_swap_reader(unsigned int cpu)
+{
+	int ret = -ENODEV;
+
+	if (cpu >= hyp_nr_cpus)
+		return -EINVAL;
+
+	hyp_spin_lock(&trace_buffer.lock);
+
+	if (hyp_trace_buffer_loaded(&trace_buffer))
+		ret = simple_ring_buffer_swap_reader_page(
+				per_cpu_ptr(trace_buffer.simple_rbs, cpu));
+
+	hyp_spin_unlock(&trace_buffer.lock);
+
+	return ret;
+}
-- 
2.52.0.457.g6b5491de43-goog


